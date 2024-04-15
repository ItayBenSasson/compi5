declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare void @exit(i32)
@.zerror = constant [23 x i8] c"Error division by zero\00";
@.int_specifier_scan = constant [3 x i8] c"%d\00"
@.int_specifier = constant [4 x i8] c"%d\0A\00"
@.str_specifier = constant [4 x i8] c"%s\0A\00"

define i32 @readi(i32) {
    %ret_val = alloca i32
    %spec_ptr = getelementptr [3 x i8], [3 x i8]* @.int_specifier_scan, i32 0, i32 0
    call i32 (i8*, ...) @scanf(i8* %spec_ptr, i32* %ret_val)
    %val = load i32, i32* %ret_val
    ret i32 %val
}

define void @printi(i32) {
    %spec_ptr = getelementptr [4 x i8], [4 x i8]* @.int_specifier, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %spec_ptr, i32 %0)
    ret void
}

define void @print(i8*) {
    %spec_ptr = getelementptr [4 x i8], [4 x i8]* @.str_specifier, i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* %spec_ptr, i8* %0)
    ret void
}
@.v_0 = private unnamed_addr constant [16 x i8] c"TRUE evaluation\00"
@.v_2 = private unnamed_addr constant [17 x i8] c"FALSE evaluation\00"
@.v_4 = private unnamed_addr constant [82 x i8] c"Evaluation with if (exp){printi(1)} with truth tabels {0, 1} and {00, 01, 10, 11}\00"
@.v_5 = private unnamed_addr constant [16 x i8] c"NOT truth table\00"
@.v_8 = private unnamed_addr constant [16 x i8] c"AND truth table\00"
@.v_13 = private unnamed_addr constant [15 x i8] c"OR truth table\00"
define i32 @main() {
%var_0 = alloca i32
%var_1 = alloca i32
%var_2 = alloca i32
%var_3 = alloca i32
%var_4 = alloca i32
%var_5 = alloca i32
%var_6 = alloca i32
%var_7 = alloca i32
%var_8 = alloca i32
%var_9 = alloca i32
%var_10 = alloca i32
%var_11 = alloca i32
%var_12 = alloca i32
%var_13 = alloca i32
%var_14 = alloca i32
%var_15 = alloca i32
%var_16 = alloca i32
%var_17 = alloca i32
%var_18 = alloca i32
%var_19 = alloca i32
%var_20 = alloca i32
%var_21 = alloca i32
%var_22 = alloca i32
%var_23 = alloca i32
%var_24 = alloca i32
%var_25 = alloca i32
%var_26 = alloca i32
%var_27 = alloca i32
%var_28 = alloca i32
%var_29 = alloca i32
%var_30 = alloca i32
%var_31 = alloca i32
%var_32 = alloca i32
%var_33 = alloca i32
%var_34 = alloca i32
%var_35 = alloca i32
%var_36 = alloca i32
%var_37 = alloca i32
%var_38 = alloca i32
%var_39 = alloca i32
%var_40 = alloca i32
%var_41 = alloca i32
%var_42 = alloca i32
%var_43 = alloca i32
%var_44 = alloca i32
%var_45 = alloca i32
%var_46 = alloca i32
%var_47 = alloca i32
%var_48 = alloca i32
%var_49 = alloca i32
call void (i8*) @print(i8* getelementptr ([ 16 x i8], [16 x i8]* @.v_0, i32 0, i32 0))
br label %label_2
br label %label_2
label_2:
%v_1 = add i32 0, 1
call void @printi(i32 %v_1);
br label %label_3
label_3:
call void (i8*) @print(i8* getelementptr ([ 17 x i8], [17 x i8]* @.v_2, i32 0, i32 0))
br label %label_5
br label %label_4
label_4:
%v_3 = add i32 0, 1
call void @printi(i32 %v_3);
br label %label_5
label_5:
call void (i8*) @print(i8* getelementptr ([ 82 x i8], [82 x i8]* @.v_4, i32 0, i32 0))
call void (i8*) @print(i8* getelementptr ([ 16 x i8], [16 x i8]* @.v_5, i32 0, i32 0))
br label %label_7
br label %label_7
label_7:
%v_6 = add i32 0, 1
call void @printi(i32 %v_6);
br label %label_6
label_6:
br label %label_8
br label %label_9
label_9:
%v_7 = add i32 0, 1
call void @printi(i32 %v_7);
br label %label_8
label_8:
call void (i8*) @print(i8* getelementptr ([ 16 x i8], [16 x i8]* @.v_8, i32 0, i32 0))
br label %label_11
br label %label_10
label_10:
br label %label_13
br label %label_11
label_11:
br label %label_13
br label %label_12
label_12:
%v_9 = add i32 0, 1
call void @printi(i32 %v_9);
br label %label_13
label_13:
br label %label_15
br label %label_14
label_14:
br label %label_16
br label %label_15
label_15:
br label %label_17
br label %label_16
label_16:
%v_10 = add i32 0, 1
call void @printi(i32 %v_10);
br label %label_17
label_17:
br label %label_18
br label %label_18
label_18:
br label %label_21
br label %label_19
label_19:
br label %label_21
br label %label_20
label_20:
%v_11 = add i32 0, 1
call void @printi(i32 %v_11);
br label %label_21
label_21:
br label %label_22
br label %label_22
label_22:
br label %label_24
br label %label_23
label_23:
br label %label_25
br label %label_24
label_24:
%v_12 = add i32 0, 1
call void @printi(i32 %v_12);
br label %label_25
label_25:
call void (i8*) @print(i8* getelementptr ([ 15 x i8], [15 x i8]* @.v_13, i32 0, i32 0))
br label %label_27
label_27:
br label %label_29
label_26:
br label %label_28
br label %label_28
label_28:
%v_14 = add i32 0, 1
call void @printi(i32 %v_14);
br label %label_29
label_29:
br label %label_31
label_31:
br label %label_32
label_30:
br label %label_32
br label %label_32
label_32:
%v_15 = add i32 0, 1
call void @printi(i32 %v_15);
br label %label_33
label_33:
br label %label_34
label_35:
br label %label_37
label_34:
br label %label_36
br label %label_36
label_36:
%v_16 = add i32 0, 1
call void @printi(i32 %v_16);
br label %label_37
label_37:
br label %label_38
label_39:
br label %label_40
label_38:
br label %label_40
br label %label_40
label_40:
%v_17 = add i32 0, 1
call void @printi(i32 %v_17);
br label %label_41
label_41:
ret i32 0
}
