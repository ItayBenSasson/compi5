#ifndef HANDLER_H
#define HANDLER_H

//#include "Node.hpp"
#include "bp.hpp"
#include "logic.hpp"

void handle_start();

void handle_end();

void handle_return();

void handle_number(Node *exp, Node *node);

void handle_byte(Node *exp, Node *node);

void handle_string(Node *exp, Node *node);

void handle_str_value(Node *exp, Node *str);

void handle_bool(Node *expNode, bool value);

void handle_bin_operation(Node *exp, Node *left, Node *right, Node *op_node);

void check_div_by_zero(Node *node);

void load(Node *exp, Node *node);

void store(Node *idNode, Node *exp);

void default_store(Node *idNode);

void not_expression(Node *expNode, Node *expNode2);

void and_left_part(Node *left);

void and_right_part(Node *exp, Node *left, Node *right);

void or_left_part(Node *left);

void or_right_part(Node *exp, Node *left, Node *right);

void handle_rel_operation(Node *exp, Node *left, Node *right, Node *op_node);

void handle_label(Node *exp, bool value);

Node *create_end_label();

void jmp_end_label(Node *end_label);

void handle_while(Node *exp);

void handle_break();

void handle_continue();

void handle_call(Node *call, Node *id, Node *arg);

#endif // HANDLER_H
