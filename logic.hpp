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
    }
    void exit_scope(){
        output::endScope();
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



#endif /* logic_hpp */
