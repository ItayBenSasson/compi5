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
store i32 0, i32* %var_0
%v_0 = load i32, i32* %var_0
call void @printi(i32 %v_0);
%v_1 = add i32 0, 1
store i32 %v_1, i32* %var_1
%v_2 = load i32, i32* %var_1
call void @printi(i32 %v_2);
store i32 0, i32* %var_2
%v_3 = load i32, i32* %var_0
call void @printi(i32 %v_3);
%v_4 = load i32, i32* %var_1
call void @printi(i32 %v_4);
%v_5 = load i32, i32* %var_2
call void @printi(i32 %v_5);
%v_6 = add i32 0, 3
store i32 %v_6, i32* %var_2
%v_7 = load i32, i32* %var_2
call void @printi(i32 %v_7);
store i32 0, i32* %var_2
%v_8 = load i32, i32* %var_2
call void @printi(i32 %v_8);
%v_9 = add i32 0, 2
store i32 %v_9, i32* %var_3
%v_10 = load i32, i32* %var_3
call void @printi(i32 %v_10);
%v_11 = add i32 0, 4
store i32 %v_11, i32* %var_3
%v_12 = load i32, i32* %var_3
store i32 %v_12, i32* %var_2
%v_13 = load i32, i32* %var_2
call void @printi(i32 %v_13);
ret i32 0
}
