#ifndef NODE_HPP
#define NODE_HPP

#include <iostream>
#include <vector>
#include <string>

using namespace std;

//we must seperate because function declaration does not allow undeclared type 
// of generic class
class Node {
    public:
    int line;
    string type; //because we need to know how to cast it later
    string iid;
    Node(int line, string type):line(line),type(type),iid("notduck"){}
    Node(int line, string type, string id):line(line),type(type),iid(id){}
    //make this polymorphic
    virtual ~Node() = default;

    //one that takes only line
    Node(int line):line(line),type("Node"){}


};

#define YYSTYPE Node*
// template <typename T> 
// class DataNode : public Node{
// public:
//     T data;
//     // int line;
//     // string type;
//     DataNode(int line, T dataa, string type):Node(line,type),data(dataa){}
//     DataNode(int line, T dataa):Node(line,typeid(T).name()),data(dataa){}
//     //now datanode that gets line, and dataa as string and cast it to T
//     DataNode(int line, string dataa):Node(line,typeid(T).name(){
//         if(typeid(T).name() == "INT"){
//             data = stoi(dataa);
//         }else if(typeid(T).name() == "BOOL"){
//             data = dataa == "true";
//         }else if(typeid(T).name() == "STRING"){
//             data = dataa;
//         }
//     }
// };



// Node* int_node_for_retardeds(int line, int data){
//     return new DataNode<int>(line,data,"INT");
// }

// Node* string_node_for_retardeds(int line, string data){
//     return new DataNode<string>(line,data,"STRING");
// }

// Node* bool_node_for_retardeds(int line, bool data){
//     return new DataNode<bool>(line,data,"BOOL");
// }

// typedef DataNode<int> IntNode;
// typedef DataNode<string> StringNode;
// typedef DataNode<bool> BoolNode;

class IntNode : public Node {
public:
    int data;
    IntNode(int line, const char* data) : Node(line, "INT"), data(atoi(data)) {}
    //now one that takes different type name
    IntNode(int line, const char* data, string type) : Node(line, type), data(atoi(data)) {}
};

class StringNode : public Node {
public:
    string data;
    StringNode(int line, const string& data) : Node(line, "STRING"), data(data) {}
    //now one that takes different type name
    StringNode(int line, const string& data, string type) : Node(line, type), data(data) {}
};

class BoolNode : public Node {
public:
    bool data;
    BoolNode(int line, bool data) : Node(line, "BOOL"), data(data) {}
    //now one that takes different type name
    BoolNode(int line, bool data, string type) : Node(line, type), data(data) {}
};

class IdNode : public Node {
public:
    string  id = "duck";
    //IdNode(int line, const string& id) : Node(line, "id"), id(id) {}
    //now one that takes different type name
    IdNode(int line, const string& idd, string type) : Node(line, type,idd), id(idd) {}
    IdNode(int line, const string& idd) : Node(line, "id",idd), id(idd) {}
};

class OperationNode : public Node {
public:
    string operation;

    OperationNode(int line_num, const char*  op) : Node(line_num), operation(operation) {}
};
class ExpNode : public Node {
public:
    string true_l;
    string false_l;
    string id;

    ExpNode(int line) : Node(line, "Exp"), id("shit"), true_l("uninit"), false_l("uninit") {}
    ExpNode(int line, const char* id) : Node(line, "Exp"), id(id), true_l("uninit"), false_l("uninit") {}
    ExpNode(int line, string id) : Node(line, "Exp"), id(id), true_l("uninit"), false_l("uninit") {}
    ExpNode(int line, string to, string id) : Node(line, to), id(id), true_l("uninit"), false_l("uninit") {}
};


#endif // NODE_HPP