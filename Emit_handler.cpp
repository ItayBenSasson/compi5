#include "Emit_handler.h"
#include "bp.hpp"
#include <iostream>

class Var {
    string base;
    int count;

    Var() : base("%v_"), count(0) {}

public:

    static Var& getInstance() {
        static Var instance;

        return instance;
    }

    static string fresh() {
        Var& v = Var::getInstance();
        return v.base + to_string(v.count++);
    }
};

string get_operation(const string& raw_operation) {
    string operation;
    if (raw_operation == "+") {
        operation = "add";
    }
    else if (raw_operation == "-") {
        operation = "sub";
    }
    else if (raw_operation == "*") {
        operation = "mul";
    }
    else if (raw_operation == "/") {
        operation = "sdiv";
    }
    else if (raw_operation == "%") {
        operation = "srem";
    }
    else if (raw_operation == "<") {
        operation = "slt";
    }
    else if (raw_operation == ">") {
        operation = "sgt";
    }
    else if (raw_operation == "<=") {
        operation = "sle";
    }
    else if (raw_operation == ">=") {
        operation = "sge";
    }
    else if (raw_operation == "==") {
        operation = "eq";
    }
    else if (raw_operation == "!=") {
        operation = "ne";
    }
    return operation;
}

void handle_start() {
    CodeBuffer& buff = CodeBuffer::instance();

    string start = "declare i32 @scanf(i8*, ...)\n"
                   "declare i32 @printf(i8*, ...)\n"
                   "declare void @exit(i32)\n"
                   "@.zerror = constant [23 x i8] c\"Error division by zero\\00\";\n"
                   "@.int_specifier_scan = constant [3 x i8] c\"%d\\00\"\n"
                   "@.int_specifier = constant [4 x i8] c\"%d\\0A\\00\"\n"
                   "@.str_specifier = constant [4 x i8] c\"%s\\0A\\00\"\n"
                   "\n"
                   "define i32 @readi(i32) {\n"
                   "    %ret_val = alloca i32\n"
                   "    %spec_ptr = getelementptr [3 x i8], [3 x i8]* @.int_specifier_scan, i32 0, i32 0\n"
                   "    call i32 (i8*, ...) @scanf(i8* %spec_ptr, i32* %ret_val)\n"
                   "    %val = load i32, i32* %ret_val\n"
                   "    ret i32 %val\n"
                   "}\n"
                   "\n"
                   "define void @printi(i32) {\n"
                   "    %spec_ptr = getelementptr [4 x i8], [4 x i8]* @.int_specifier, i32 0, i32 0\n"
                   "    call i32 (i8*, ...) @printf(i8* %spec_ptr, i32 %0)\n"
                   "    ret void\n"
                   "}\n"
                   "\n"
                   "define void @print(i8*) {\n"
                   "    %spec_ptr = getelementptr [4 x i8], [4 x i8]* @.str_specifier, i32 0, i32 0\n"
                   "    call i32 (i8*, ...) @printf(i8* %spec_ptr, i8* %0)\n"
                   "    ret void\n"
                   "}";

    buff.emitGlobal(start);
    // main
    string cmd = "define i32 @main() {";

    // locate memory for the main function
    for (int i = 0; i < 50; i++) {
        cmd += "\n%var_" + to_string(i) + " = alloca i32";
    }
    buff.emit(cmd);
}

void handle_end() {
    CodeBuffer& buff = CodeBuffer::instance();

    handle_ret();
    string end = "}";
    buff.emit(end);

    buff.printGlobalBuffer();
    buff.printCodeBuffer();
}

void handle_ret() {
    CodeBuffer& buff = CodeBuffer::instance();

    string cmd = "ret i32 0";
    buff.emit(cmd);
}


void handle_num(Node *exp, Node *node) {
    CodeBuffer& buff = CodeBuffer::instance();

    string var = Var::fresh();

    auto value = ((IntNode *) node)->data;
    string cmd = var + " = add i32 0, " + to_string(value);
    buff.emit(cmd);

    exp->iid = var;
}

void handle_byte(Node *exp, Node *node) {
    CodeBuffer& buff = CodeBuffer::instance();

    string temp_var = Var::fresh();
    string var = Var::fresh();
    auto value = ((IntNode *) node)->data;

    string cmd = temp_var + " = add i8 0, " + to_string(value) + "\n"
                 + var + " = zext i8 " + temp_var + " to i32";
    buff.emit(cmd);

    exp->iid = var;
}

void handle_binop(Node *exp, Node *left, Node *right, Node *operation_node) {
    CodeBuffer& buff = CodeBuffer::instance();

    string var = Var::fresh();

    string op = get_operation(((OperationNode *) operation_node)->operation);
    if (op == "sdiv")
        check_div_by_zero(right);


    string cmd = var + " = " + op + " i32 " + left->iid
                 + ", " + right->iid;

    if (left->type == "BYTE" && right->type == "BYTE") {
        string temp_var = Var::fresh();
        cmd += '\n' + temp_var + " = and i32 " + var + ", 255";
        exp->iid = temp_var;
    }
    else {
        exp->iid = var;
    }

    buff.emit(cmd);
}

void handle_string(Node *exp, Node *node) {
    CodeBuffer& buff = CodeBuffer::instance();

    string value = ((StringNode *) node)->data;

    auto size = value.size() - 1;

    string temp_var = "@." + Var::fresh().substr(1);

    string cmd = temp_var + " = private unnamed_addr constant [" + to_string(size) + " x i8] c" + value.substr(0, size) + "\\00\"";
    buff.emitGlobal(cmd);

    exp->iid = temp_var;
}

void load(Node *exp, Node *node) {
    CodeBuffer& buff = CodeBuffer::instance();

    string var = Var::fresh();
    auto symbol = symbol_table::get_instance()->find_entry(((IdNode *) node)->id);
    auto offset = symbol->offset;

    string cmd = var + " = load i32, i32* %var_" + to_string(offset);
    buff.emit(cmd);

    auto expNode = (ExpNode *) exp;
    if (symbol->type == "BOOL") {
        expNode->true_l = buff.freshLabel();
        expNode->false_l = buff.freshLabel();

        string temp_var = Var::fresh();
        cmd = temp_var + " = icmp eq i32 " + var + ", 1" + "\n"
              + "br i1 " + temp_var + ", label %" + expNode->true_l + ", label %" + expNode->false_l;
        buff.emit(cmd);
    }

    expNode->iid = var;
    expNode->type = symbol->type;
}

void store(Node *idNode, Node *exp) {
    CodeBuffer& buff = CodeBuffer::instance();

    string id = ((IdNode *) idNode)->id;

    entry *entry = symbol_table::get_instance()->find_entry(id);
    int offset = entry->offset;

    auto expNode = (ExpNode *) exp;

    if (expNode->type != "BOOL") {
        string cmd = "store i32 " + expNode->iid + ", i32* %var_" + to_string(offset);
        buff.emit(cmd);
        return;
    }

    // handle boolean store
    string temp_var = Var::fresh();
    string temp_label = buff.freshLabel();

    string cmd = expNode->true_l + ":\n"
                 + "br label %" + temp_label + "\n"
                 + expNode->false_l + ":\n"
                 + "br label %" + temp_label + "\n"
                 + temp_label + ":\n"
                 + temp_var + " = phi i32 [1, %" + expNode->true_l + "], [0, %" + expNode->false_l + "]\n"
                 + "store i32 " + temp_var + ", i32* %var_" + to_string(offset);
    buff.emit(cmd);
}

void store_default(Node *idNode) {
    CodeBuffer& buff = CodeBuffer::instance();

    string id = ((IdNode *) idNode)->id;

    entry *entry = symbol_table::get_instance()->find_entry(id);
    int offset = entry->offset;

    string cmd = "store i32 0, i32* %var_" + to_string(offset);
    buff.emit(cmd);
}

void check_div_by_zero(Node *node) {
    CodeBuffer& buff = CodeBuffer::instance();

    string temp_var = Var::fresh();
    string true_label = buff.freshLabel();
    string false_label = buff.freshLabel();

    string cmd = temp_var + " = icmp eq i32 " + node->iid + ", 0" + "\n"
                 + "br i1 " + temp_var + ", label %" + true_label + ", label %" + false_label + "\n"
                 + true_label + ":" + "\n"
                 + "call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))" + "\n"
                 + "call void @exit(i32 0)" + "\n"
                 "br label %" + false_label + "\n"
                 + false_label + ":";

    buff.emit(cmd);
}

void handle_bool(Node *expNode, bool value) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto exp = (ExpNode *) expNode;
    exp->true_l = buff.freshLabel();
    exp->false_l = buff.freshLabel();

    string cmd = "br label %" + (value ? exp->true_l : exp->false_l);
    buff.emit(cmd);
}

void not_expression(Node *expNode, Node *expNode2) {
    auto exp = (ExpNode *) expNode;
    auto exp2 = (ExpNode *) expNode2;

    exp->true_l = exp2->false_l;
    exp->false_l = exp2->true_l;
}

void and_left_part(Node *left) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto leftExp = (ExpNode *) left;

    string cmd = "br label %" + leftExp->true_l + "\n"
                 + leftExp->true_l + ":";
    buff.emit(cmd);
}

void and_right_part(Node *exp, Node *left, Node *right) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) exp;
    auto leftNode = (ExpNode *) left;
    auto rightNode = (ExpNode *) right;

    expNode->true_l = rightNode->true_l;
    expNode->false_l = rightNode->false_l;

    string cmd = "br label %" + leftNode->false_l + "\n"
                 + leftNode->false_l + ":" + "\n"
                 + "br label %" + expNode->false_l;
    buff.emit(cmd);
}

void or_left_part(Node *left) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto leftExp = (ExpNode *) left;

    string cmd = leftExp->false_l + ":";
    buff.emit(cmd);
}

void or_right_part(Node *exp, Node *left, Node *right) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) exp;
    auto leftNode = (ExpNode *) left;
    auto rightNode = (ExpNode *) right;

    expNode->true_l = rightNode->true_l;
    expNode->false_l = rightNode->false_l;

    string cmd = leftNode->true_l + ":" + "\n"
                 + "br label %" + expNode->true_l;
    buff.emit(cmd);
}

void handle_relop(Node *exp, Node *left, Node *right, Node *op_node) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) exp;
    expNode->true_l = buff.freshLabel();
    expNode->false_l = buff.freshLabel();

    string op = get_operation(((OperationNode *) op_node)->operation);

    string temp_var = Var::fresh();
    string cmd = temp_var + " = icmp " + op + " i32 " + left->iid + ", " + right->iid + "\n"
                 + "br i1 " + temp_var + ", label %" + expNode->true_l + ", label %" + expNode->false_l;
    buff.emit(cmd);
}

void handle_label(Node *exp, bool value) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) exp;
    string label = value ? expNode->true_l : expNode->false_l;

    string cmd = "br label %" + label + "\n"
                 + label + ":";
    buff.emit(cmd);
}

// TODO: dont think we have a sorted type for this, not sure what was expected to be created
Node *create_end_label() {
    CodeBuffer& buff = CodeBuffer::instance();

    auto end_label = new ExpNode(UNDEFINED_TYPE, 0);
    end_label->true_label = buff.freshLabel();

    return end_label;
}

void jmp_end_label(Node *end_label) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) end_label;
    string cmd = "br label %" + expNode->true_l;
    buff.emit(cmd);
}

// TODO: make this work, dont think we have a scope list,
//  i think we went by parents, also no block types that i found

scope *find_last_while() {
    auto scopes = symbol_table::get_instance()->scopes;
    for (int i = scopes.size() - 1; i >= 0; i--) {
        if (scopes[i]->block_type == WHILE_BLOCK) {
            return scopes[i];
        }
    }
    return nullptr;
}

//TODO: also dependant on the last part, creating end labels
void handle_while(Node *exp) {
    CodeBuffer& buff = CodeBuffer::instance();

    auto scope = find_last_while();
    auto expNode = (ExpNode *) exp;

    scope->end_label = expNode->false_l;

    string cmd = expNode->true_l + ":";
    buff.emit(cmd);
}

//TODO: also dependant on the last part, creating end labels
void handle_break() {
    CodeBuffer& buff = CodeBuffer::instance();

    auto scope = find_last_while();

    string cmd = "br label %" + scope->end_label;
    buff.emit(cmd);
}

//TODO: also dependant on the last part, creating start labels
void handle_continue() {
    CodeBuffer& buff = CodeBuffer::instance();

    auto scope = find_last_while();

    string cmd = "br label %" + scope->start_label;
    buff.emit(cmd);
}


void handle_call(Node *call, Node *id, Node *arg) {
    CodeBuffer& buff = CodeBuffer::instance();

    string function_name = ((IdNode *) id)->id;
    int size = ((ExpNode *) arg)->id.size() - 1;
    string cmd;
    if (function_name == "print")
        cmd = "call void (i8*) @print(i8* getelementptr ([ " + to_string(size) + " x i8], [" + to_string(size) +
              " x i8]* " + arg->iid + ", i32 0, i32 0))";
    else if (function_name == "printi")
        cmd = "call void @printi(i32 " + arg->iid + ");";
    else if (function_name == "readi") {
        call->iid = Var::fresh();;
        cmd = call->iid + " = call i32 @readi(i32 " + "0" + ");";
    }

    buff.emit(cmd);
}
