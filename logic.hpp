#ifndef logic_hpp
#define logic_hpp

#include <stdio.h>
#include <iostream>
//we;ll use vector stack list and string
#include <vector>
#include <stack>
#include <list>
#include <string>
#include <sstream>
#include "hw3_output.hpp"
#include "Node.hpp"
#include "bp.hpp"

using namespace std;
extern int yylineno;

//class that both function entry and variable entry will inherit from
class entry{
    public:
    string name;
    int offset;
    string type;
    entry(string name, int offset, string type):name(name),offset(offset),type(type){}
    virtual ~entry(){}
};


class function_entry : public entry{
    public:
    //list<string> args;
    string arg_type;
    //function_entry(string name, int offset, string type, list<string> args, list<string> args_types):entry(name,offset,type),args(args),args_types(args_types){}
    function_entry(string name,  string type,  string args_types):entry(name,0,type),arg_type(args_types){}
    bool operator==(const function_entry& other) const{
        return name == other.name;
    }


};


class variable_entry : public entry{
    public:
    variable_entry(string name, int offset, string type):entry(name,offset,type){}
    bool operator==(const variable_entry& other) const{
        return name == other.name;
    }
};

class scope{
    public:
    int offset_bias;
    vector<entry*> entries;
    string scope_type;
    scope* parent;

    string sl;
    string el;

    scope(scope* parent, string scope_type):parent(parent),scope_type(scope_type), offset_bias(0)
    {
        if (parent==NULL && scope_type=="global"){
            function_entry* function_print = new function_entry("print","VOID","STRING");
            function_entry* function_printi = new function_entry("printi","VOID","INT");
            function_entry* function_readi = new function_entry("readi","INT","INT");
            entries.push_back(function_print);
            entries.push_back(function_printi);
            entries.push_back(function_readi);
        }
    }

    scope(scope* parent, string scope_type, int offset_bias):parent(parent),scope_type(scope_type), offset_bias(offset_bias){
        if (parent==NULL && scope_type=="global"){
            function_entry* function_print = new function_entry("print","void","STRING");
            function_entry* function_printi = new function_entry("printi","void","INT");
            function_entry* function_readi = new function_entry("readi","INT","INT");
            entries.push_back(function_print);
            entries.push_back(function_printi);
            entries.push_back(function_readi);
        }
    }

    ~scope(){
        for (auto entry : entries){
            delete entry;
        }
    }
    
    //handle fix of the 
    void add_entry(entry* e){
        //first check if the entry already exists
        entry* exist_entry = find_entry(e->name);
        if (exist_entry != NULL){
            //exit with error
            output::errorDef(yylineno,e->name);
            exit(0);
        }
        function_entry* f = dynamic_cast<function_entry*>(e);
        if (f != NULL){
            //then it's a function and we fix the offset to be 0
            e->offset = 0;
        }
        else{
            //it's a variable
            //find the last variable_entry and add 1 to it's offset
            int last_offset = 0;
            bool found = false;
            for (auto entry : entries){
                variable_entry* v = dynamic_cast<variable_entry*>(entry);
                if (v != NULL){
                    last_offset = max(last_offset,v->offset);
                    found = true;
                }
            }
            if (last_offset == 0){
                //handle the case of the first variable in inner scope
                e->offset = offset_bias;
            }
            e->offset = last_offset + 1;
            if (!found)
            {
                e->offset = offset_bias;
            }
        }
        entries.push_back(e);
    }


    entry* find_entry(string name){
        if (entries.empty())
        {
            //cout << "entries is empty" << endl;
        }
        #include <stdexcept> // Add this line to include the necessary header file
            //cout << "eeee" << endl;
                for (auto e : entries){
                    //check if the name attribute exist in e
                    try{
                    if (e->name == name){
                        //cout << "found entry" << endl;
                        return e;
                    }}
                    //catch segfault
                    catch(std::runtime_error& e){ // Change 'segfault_exception' to 'std::runtime_error'
                        //cout << "segfault in find_entry" << endl;
                        exit(0);
                    }
                }
                if (parent){
                    //cout << "parent" << endl;
                    if (scope_type == "global"){
                        //cout << "global" << endl;
                        return NULL;
                    }
                    return parent->find_entry(name);
                }
        return NULL;
    }
};


//now class that will hold the symbol table
class symbol_table{
    private:
    
    public:

    static symbol_table* instance;

    static symbol_table* get_instance()
    {
        static symbol_table* instance = new symbol_table();
        return instance;
    }

    scope* global;
    scope* current;
    symbol_table():global(new scope(NULL,"global")),current(global){}
    ~symbol_table(){
        delete global;
    }
    void enter_scope(string scope_type){
        int offset_bias = 0;
        if (current->offset_bias != 0){
            offset_bias = current->offset_bias;
        }
        //and check if there is offset of entry in this scope which is larger than the offset_bias
        for (auto entry : current->entries){
            variable_entry* v = dynamic_cast<variable_entry*>(entry);
            if (v != NULL){
                // if (v->offset > offset_bias){
                //     offset_bias = v->offset+1;
                // }
                offset_bias ++;
            }
        }
        //print creating new scope with offset_bias
        scope* new_scope = new scope(current,scope_type,offset_bias);
        current = new_scope;
        if (scope_type == "while"){
            CodeBuffer& buffer = CodeBuffer::instance();
            current->sl = buffer.freshLabel();

            string cmd  = "br label %" + current->sl + "\n" +
                     current->sl + ":";
             buffer.emit(cmd);

        }
    }
    void exit_scope(){
        output::endScope();
        if (current->scope_type == "while"){
        CodeBuffer& buffer = CodeBuffer::instance();
        string cmd = "br label %" + current->sl + "\n" +
                     current->el + ":";
        buffer.emit(cmd);
        }
        for (auto entry: current->entries) {
        auto symbol_type = entry->type;
        //check if fuction entrey with dynamic cast
        auto symbol = dynamic_cast<function_entry*>(entry);
        if (symbol != NULL) {
            symbol_type = output::makeFunctionType((symbol->arg_type), (symbol->type));
            output::printID(symbol->name, symbol->offset, symbol_type);
        }
        else{
        auto symbol = dynamic_cast<variable_entry*>(entry);
        output::printID(symbol->name, symbol->offset, symbol_type);
        }
    }
        scope* old_scope = current;
        current = current->parent;
        delete old_scope;;
    }
    void add_entry(entry* e){
        current->add_entry(e);
    }

    void add_entry(string name, int offset, string type){
        variable_entry* v = new variable_entry(name,offset,type);
        add_entry(v);
    }

    int find_last_offset(){
        int last_offset = 0;
        for (auto entry : current->entries){
            variable_entry* v = dynamic_cast<variable_entry*>(entry);
            if (v != NULL){
                last_offset = max(last_offset,v->offset);
            }
        }
        if (last_offset == 0){
            return current->offset_bias;
        }
        return last_offset;
    }

    void add_entry(Node* node, string type){
        //cast to id node to get the name
        IdNode* id_node = dynamic_cast<IdNode*>(node);
        add_entry(id_node->id,find_last_offset() + 1,type);
    }

    void add_entry(Node* node, Node* ignore_this, string type) {
        add_entry(node, type);
    }


    entry* find_entry(string name){
        return current->find_entry(name);
    }
    entry* find_entry_in_scope(string name){
        for (auto e : current->entries){
            if (e->name == name){
                return e;
            }
        }
        return NULL;
    }
    void check_while(){
        scope* s = current;
        while (s != NULL){
            if (s->scope_type == "while"){
                return;
            }
            s = s->parent;
        }
        output::errorUnexpectedBreak(yylineno);
                exit(0);
    }

    void check_continue(){
        scope* s = current;
        while (s != NULL){
            if (s->scope_type == "while"){
                return;
            }
            s = s->parent;
        }
        output::errorUnexpectedContinue(yylineno);
                exit(0);
    }

    string get_func_type(string name){
        //cout << "get_func_type string" << endl;
        entry* e = find_entry(name);
        if (e == NULL){
            output::errorUndefFunc(yylineno,name);
            exit(0);
        }
        function_entry* f = dynamic_cast<function_entry*>(e);
        if (f == NULL){
            output::errorUndefFunc(yylineno,name);
            exit(0);
        }
        return f->type;
    }

    string get_var_type(string name){
        //cout << "get_var_type string" << endl;
        //cout << "current scope name - " << current->scope_type << endl;
        entry* e = find_entry(name);
        //cout << "surving find entry in get var type string - " << e <<endl;
        if (e == NULL){
            output::errorUndef(yylineno,name);
            exit(0);
        }
        variable_entry* v = dynamic_cast<variable_entry*>(e);
        if (v == NULL){
            output::errorUndef(yylineno,name);
            exit(0);
        }
        //cout << "surving get_var_type - " <<v->type <<endl;
        return v->type;
    }

    string get_func_type(Node* n){
        //check if type is string
        if (n->type == "id"){
            //get the name
            IdNode* id_node = dynamic_cast<IdNode*>(n);
            string name= id_node->id;
            return get_func_type(name);
        }
        //unintended error, node used in wrong context
        //cout << "error in get_func_type" << endl;
        exit(0);
    }

    string get_var_type(Node* n){
        //check if type is id and dynamic cast
        if(n->type == "id"){
            IdNode* id_node = dynamic_cast<IdNode*>(n);
            string name= id_node->id;
            return get_var_type(name);
        }
        // //cout << "get_var_type node" << endl;
        // //check if type is string
        // if (n->type == "STRING"){
        //     //cast to Data_node<string>
        //     StringNode* d = dynamic_cast<StringNode*>(n);
        //     //now get the value
        //     return get_var_type(d->data);
        // }
        // //unintended error, node used in wrong context
        cout << "error in get_var_type" << endl;
        exit(0);
    }

    void check_assignment_in(Node* left, Node* right)
{
    //print node left
    //cout << left->type << endl;
    //we want to get to left string node entry name
    IdNode* left_node = dynamic_cast<IdNode*>(left);
    string left_name = left_node->id;
    //find it
    entry *left_entry = find_entry(left_name);
    //check if not found then error
    if (left_entry == NULL)
    {
        //cout << "entry not found" << endl;
        output::errorUndef(yylineno, left_name);
        exit(0);
    }
    //check if it's a function
    function_entry *f = dynamic_cast<function_entry *>(left_entry);
    if (f != NULL)
    {
        output::errorUndef(yylineno, left_name);
        exit(0);
    }
    //now cast to variable entry
    variable_entry *v = dynamic_cast<variable_entry *>(left_entry);
    //now check if right.type == v.type 
    if (v == NULL)
    {
        output::errorUndef(yylineno, left_name);
        exit(0);
    }
    if(!(v->type == right->type ||(v->type == "INT" && right->type == "BYTE")) ){

        //if right is Exp, check if function
        function_entry *f = dynamic_cast<function_entry *>(right);
        if (f != NULL)
        {
            //check if the function return type is the same as the left type
            if (f->type != v->type)
            {
                cout << "at least entered" << endl;
                cout << "error in check_assignment_in" << endl;
                //print the types
                cout << v->type << " " << f->type << endl;
                cout << left_name << endl;
                output::errorMismatch(yylineno);
                exit(0);
            }
            return;
        }

        ExpNode* exp = dynamic_cast<ExpNode*>(right);
        if (exp != NULL)
        {
            //print all exp data
            //cout << exp->type << " " << exp->true_l << " " << exp->false_l << " " << exp->id << endl;
            //check by type which is iid
            if (exp->id != v->type)
            {
                cout << "error in check_assignment_in" << endl;
                //print the types
                cout << v->type << " " << exp->type << endl;
                cout << left_name << endl;
                output::errorMismatch(yylineno);
                exit(0);
            }
            return;
        }

        cout << "error in check_assignment_in" << endl;
        //print the types
        cout << v->type << " " << right->type << endl;
        cout << left_name << endl;
        output::errorMismatch(yylineno);
        exit(0);
    }
}

void check_assignment(Node* left, Node* right)
{
    symbol_table::get_instance()->check_assignment_in(left, right);
}


void check_call(Node* left, Node* right)
{
    //cout << "check_call" << endl;
    //like check_assignment_in but we need to check if left is a function
    //we want to get to left string node entry name
    string left_name = static_cast<StringNode*>(left)->data;
    //find it
    entry *left_entry = symbol_table::get_instance()->find_entry(left_name);
    //check if not found then error
    if (left_entry == NULL)
    {
        output::errorUndefFunc(yylineno, left_name);
        exit(0);
    }
    //check if it's a function
    function_entry *f = dynamic_cast<function_entry *>(left_entry);
    if (f == NULL)
    {
        output::errorUndefFunc(yylineno, left_name);
        exit(0);
    }
    //check right type with f.args_types first and only member
    if (!(f->arg_type == right->type || (f->arg_type == "INT" && right->type == "BYTE")))
    {
        cout << "error in check_call" << endl;
        //print the types
        cout << f->arg_type << " " << right->type << endl;
        output::errorPrototypeMismatch(yylineno, left_name, f->arg_type);
        exit(0);
    }
}

void check_cond(Node* condition)
{
    //cout << "check_cond" << endl;
    //check if type is bool
    if (condition->type != "BOOL")
    {
        //check if legal exp node
        ExpNode* exp = dynamic_cast<ExpNode*>(condition);
        if (exp!=NULL)
        {
            return;
        }
        cout << "error in check_cond" << endl;
        cout << condition->type << endl;
        output::errorMismatch(yylineno);
        exit(0);
    }
}

void check_int(Node* n)
{
    //cout << "check_int" << endl;
    //check if type is int or byte
    if (n->type != "INT" && n->type != "BYTE")
    {
        cout << "error in check_int" << endl;
        cout << n->type << endl;
        cout << n->iid << endl;
        output::errorMismatch(yylineno);
        exit(0);
    }
    
}

void check_byte(Node* n)
{
   //get the value
   int val = dynamic_cast<IntNode*>(n)->data;
   //check if the value is larger than 255
   if (val > 255){
       output::errorByteTooLarge(yylineno,to_string(val));
       exit(0);
   }
}

string get_op_type(Node* left, Node* right)
{
    //if one of them is does not pass check_int then error
    check_int(left);
    check_int(right);
    //if both types are byte then return byte
    if (left->type == "BYTE" && right->type == "BYTE")
    {
        return "BYTE";
    }
    return "INT";
}
};


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



void handle_call(Node *call, Node *id, Node *arg) {
    //cout << "handle_call entered\n" << endl;
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
    //cout << "handle_call exited\n" << endl;
}

void check_div_by_zero(Node *node) {
    //cout << "check_div_by_zero entered\n" << endl;
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
    //cout << "check_div_by_zero exited\n" << endl;
}


string get_operation(const string& raw_operation) {
    //cout << "get_operation entered\n" << endl;
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
    //cout << "get_operation exited\n" << endl;
    return operation;
}

void handle_start() {
    //cout << "handle_start entered\n" << endl;
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
    //cout << "handle_start exited\n" << endl;

}




void handle_return() {
    //cout << "handle_ret entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    string cmd = "ret i32 0";
    buff.emit(cmd);
    //cout << "handle_ret exited\n" << endl;
}


void handle_end() {
    //cout << "handle_end entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    handle_return();
    string end = "}";
    buff.emit(end);

    buff.printGlobalBuffer();
    buff.printCodeBuffer();
    //cout << "handle_end exited\n" << endl;
}


void handle_number(Node *exp, Node *node) {
    //cout << "handle_num entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    string var = Var::fresh();

    auto value = ((IntNode *) node)->data;
    string cmd = var + " = add i32 0, " + to_string(value);
    buff.emit(cmd);

    exp->iid = var;
    //cout << "handle_num exited\n" << endl;
}

void handle_byte(Node *exp, Node *node) {
    //cout << "handle_byte entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    string temp_var = Var::fresh();
    string var = Var::fresh();
    auto value = ((IntNode *) node)->data;

    string cmd = temp_var + " = add i8 0, " + to_string(value) + "\n"
                 + var + " = zext i8 " + temp_var + " to i32";
    buff.emit(cmd);

    exp->iid = var;
    //cout << "handle_byte exited\n" << endl;
}

void handle_bin_operation(Node *exp, Node *left, Node *right, Node *operation_node) {
    //cout << "handle_binop entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    string var = Var::fresh();

    string operation = get_operation(((OperationNode *) operation_node)->operation);
    //cout << "---------------------------op: " << op << endl;
    if (operation == "sdiv")
        check_div_by_zero(right);


    string cmd = var + " = " + operation + " i32 " + left->iid
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
    //cout << "handle_binop exited\n" << endl;
}

void handle_str_value(Node *exp, Node *str){
    auto expNode = (ExpNode*)exp;
    auto strNode = (StringNode*)str;
    expNode->id = strNode->data;
}




void handle_string(Node *exp, Node *node) {
    //cout << "handle_string entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    string value = ((StringNode *) node)->data;

    auto size = value.size() - 1;

    string temp_var = "@." + Var::fresh().substr(1);

    string cmd = temp_var + " = private unnamed_addr constant [" + to_string(size) + " x i8] c" + value.substr(0, size) + "\\00\"";
    buff.emitGlobal(cmd);

    exp->iid = temp_var;

    //we need to change the type of the node to string
    exp->type = "STRING";

    //cout << "handle_string exited\n" << endl;
}

void load(Node *exp, Node *node) {
    //cout << "load entered\n" << endl;
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
    // else
    // {
    //     // cout << "symbol type: " << symbol->type << endl;
    //     // //todo: was supposed to be bool not sure if true for all cases
    //     // expNode->true_l = buff.freshLabel();
    //     // expNode->false_l = buff.freshLabel();

    //     // string temp_var = Var::fresh();
    //     // cmd = temp_var + " = icmp eq i32 " + var + ", 1" + "\n"
    //     //       + "br i1 " + temp_var + ", label %" + expNode->true_l + ", label %" + expNode->false_l;
    //     // buff.emit(cmd);
    //     // //change type of symbol to BOOL in the symbol table
    //     // //symbol->type = "BOOL"; //todo: this turned out to be incorrect
    // }

    expNode->iid = var;
    expNode->type = symbol->type;
    //cout << "load exited\n" << endl;
}

void store(Node *idNode, Node *exp) {
    //cout << "store entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    string id = ((IdNode *) idNode)->id;

    entry *entry = symbol_table::get_instance()->find_entry(id);
    int offset = entry->offset;

    auto expNode = (ExpNode *) exp;
   // if (expNode->type != "BOOL" && expNode->type != "EXP") {
    bool aux = true;
    if (expNode->type == "Exp")
    {
        //check if true l and false l are initialized
        if (expNode->true_l == "uninit" && expNode->false_l == "uninit")
        {
            aux = true;
        }
        else
        {
            aux = false;
        }
    }
    if (expNode->type != "BOOL" && aux) {

        string cmd = "store i32 " + expNode->iid + ", i32* %var_" + to_string(offset);
        //Todo: fix this ,,,fixed
        //string cmd = "store i32 " + string("%v_0") + ", i32* %var_" + to_string(offset);
        buff.emit(cmd);
        //cout << "store exited\n" << endl;
        return;
    }

    // handle boolean store
    string temp_var = Var::fresh();
    string temp_label = buff.freshLabel();

    string cmd = string(expNode->true_l) + ":\n"
                 + "br label %" + temp_label + "\n"
                 + string(expNode->false_l) + ":\n"
                 + "br label %" + temp_label + "\n"
                 + temp_label + ":\n"
                 + temp_var + " = phi i32 [1, %" + expNode->true_l + "], [0, %" + expNode->false_l + "]\n"
                 + "store i32 " + temp_var + ", i32* %var_" + to_string(offset);
    buff.emit(cmd);
    //cout << "store exited\n" << endl;
}

void default_store(Node *idNode) {
    //cout << "store_default entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    string id = ((IdNode *) idNode)->id;

    entry *entry = symbol_table::get_instance()->find_entry(id);
    int offset = entry->offset;

    string cmd = "store i32 0, i32* %var_" + to_string(offset);
    buff.emit(cmd);
    //cout << "store_default exited\n" << endl;
}


void handle_bool(Node *expNode, bool value) {
    //cout << "handle_bool entered\n" << endl;
    //cout << "vakue: " << value << "\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();
    ExpNode* exp = (ExpNode *) expNode;
    // //cout << "these are exp fields:\n" << endl;
    // //cout << "iid: " << exp->iid << endl;
    // //cout << "type: " << exp->type << endl;
    // //cout << "id: " << exp->id << endl;
    // //cout << "line: " << exp->line << endl;
    // //cout << "true_l: " << exp->true_l << endl;
    // //cout << "false_l: " << exp->false_l << endl;
    // //cout << "these are exp fields:\n" << endl;
    exp->true_l = buff.freshLabel();
    exp->false_l = buff.freshLabel();
    string cmd = "br label %" + (value ? exp->true_l : exp->false_l);
    buff.emit(cmd);
    //cout << "handle_bool exited\n" << endl;
}

void not_expression(Node *expNode, Node *expNode2) {
    //cout << "not_expression entered\n" << endl;
    auto exp = (ExpNode *) expNode;
    auto exp2 = (ExpNode *) expNode2;

    exp->true_l = exp2->false_l;
    exp->false_l = exp2->true_l;
    //cout << "not_expression exited\n" << endl;
}

void and_left_part(Node *left) {
    //cout << "and_left_part entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto leftExp = (ExpNode *) left;

    string cmd = "br label %" + leftExp->true_l + "\n"
                 + leftExp->true_l + ":";
    buff.emit(cmd);
    //cout << "and_left_part exited\n" << endl;
    //change type to BOOL
    left->type = "BOOL";
}

void and_right_part(Node *exp, Node *left, Node *right) {
    //cout << "and_right_part entered\n" << endl;
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
    //cout << "and_right_part exited\n" << endl;
    //change type to BOOL
    exp->type = "BOOL";
}

void or_left_part(Node *left) {
    //cout << "or_left_part entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto leftExp = (ExpNode *) left;

    string cmd = leftExp->false_l + ":";
    buff.emit(cmd);
    //cout << "or_left_part exited\n" << endl;
    //change type to BOOL
    left->type = "BOOL";
}

void or_right_part(Node *exp, Node *left, Node *right) {
    //cout << "or_right_part entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) exp;
    auto leftNode = (ExpNode *) left;
    auto rightNode = (ExpNode *) right;

    expNode->true_l = rightNode->true_l;
    expNode->false_l = rightNode->false_l;

    string cmd = leftNode->true_l + ":" + "\n"
                 + "br label %" + expNode->true_l;
    buff.emit(cmd);
    //cout << "or_right_part exited\n" << endl;
    //change type to BOOL
    exp->type = "BOOL";

}

void handle_rel_operation(Node *exp, Node *left, Node *right, Node *op_node) {
    //cout << "handle_relop entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) exp;
    expNode->true_l = buff.freshLabel();
    expNode->false_l = buff.freshLabel();

    string op = get_operation(((OperationNode *) op_node)->operation);

    string temp_var = Var::fresh();
    //todo: fix error here of use of undefined value %label_3 ?(false l)
    string cmd = temp_var + " = icmp " + op + " i32 " + left->iid + ", " + right->iid + "\n"
                 + "br i1 " + temp_var + ", label %" + expNode->true_l + ", label %" + expNode->false_l;
    buff.emit(cmd);
    //cout << "handle_relop exited\n" << endl;
}

void handle_label(Node *exp, bool value) {
    //cout << "handle_label entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) exp;
    string label = value ? expNode->true_l : expNode->false_l;
    //cout << "handle label midway\n" << endl;
    string cmd = "br label %" + label + "\n"
                 + label + ":";
    buff.emit(cmd);
    //cout << "handle_label exited\n" << endl;
}

Node *create_end_label() {
    //cout << "create_end_label entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto end_label = new ExpNode(0);
    end_label->true_l = buff.freshLabel();

    return end_label;
    //cout << "create_end_label exited\n" << endl;
}





void jmp_end_label(Node *end_label) {
    //cout << "jmp_end_label entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto expNode = (ExpNode *) end_label;
    string cmd = "br label %" + expNode->true_l;
    buff.emit(cmd);
    //cout << "jmp_end_label exited\n" << endl;
}

scope *find_last_while() {
    //cout << "find_last_while entered\n" << endl;
    scope* s = symbol_table::get_instance()->current;
    while (s != NULL){
        if (s->scope_type == "while"){
            //cout << "find_last_while exited\n" << endl;
            return s;
        }
        s = s->parent;
    }
    //cout << "find_last_while exited\n" << endl;
    return nullptr;
}

void handle_while(Node *exp) {
    //cout << "handle while entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto scope = find_last_while();
    auto expNode = (ExpNode *) exp;

    scope->el = expNode->false_l;
    //cout << "el: " << scope->el << endl;
    string cmd = expNode->true_l + ":";
    buff.emit(cmd);
    //cout << "handle while exited\n" << endl;
}

void handle_break() {
    //cout << "handle_break entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto scope = find_last_while();

    string cmd = "br label %" + scope->el;
    buff.emit(cmd);
    //cout << "handle_break exited\n" << endl;
}

void handle_continue() {
    //cout << "handle_continue entered\n" << endl;
    CodeBuffer& buff = CodeBuffer::instance();

    auto scope = find_last_while();

    string cmd = "br label %" + scope->sl;
    buff.emit(cmd);
    //cout << "handle_continue exited\n" << endl;
}



#endif /* logic_hpp */
