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
@.v_7 = private unnamed_addr constant [5 x i8] c"skip\00"
@.v_27 = private unnamed_addr constant [5 x i8] c"skip\00"
@.v_36 = private unnamed_addr constant [17 x i8] c"should not print\00"
@.v_41 = private unnamed_addr constant [17 x i8] c"should not print\00"
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
%v_0 = add i32 0, 8
store i32 %v_0, i32* %var_0
%v_1 = load i32, i32* %var_0
%v_2 = add i32 0, 0
%v_3 = icmp sgt i32 %v_1, %v_2
br i1 %v_3, label %label_2, label %label_3
label_2:
%v_4 = load i32, i32* %var_0
%v_5 = add i32 0, 3
%v_6 = icmp eq i32 %v_4, %v_5
br i1 %v_6, label %label_4, label %label_5
br label %label_4
label_4:
call void (i8*) @print(i8* getelementptr ([ 5 x i8], [5 x i8]* @.v_7, i32 0, i32 0))
%v_8 = load i32, i32* %var_0
%v_9 = add i32 0, 1
%v_10 = sub i32 %v_8, %v_9
store i32 %v_0, i32* %var_0
br label %
br label %label_5
label_5:
%v_11 = load i32, i32* %var_0
call void @printi(i32 %v_11);
%v_12 = load i32, i32* %var_0
%v_13 = add i32 0, 1
%v_14 = sub i32 %v_12, %v_13
store i32 %v_0, i32* %var_0
%v_15 = add i32 0, 10
store i32 %v_0, i32* %var_1
%v_16 = load i32, i32* %var_1
store i32 %v_0, i32* %var_2
%v_17 = load i32, i32* %var_2
%v_18 = add i32 0, 0
%v_19 = icmp sgt i32 %v_17, %v_18
br i1 %v_19, label %label_6, label %label_7
label_6:
%v_20 = load i32, i32* %var_2
store i32 %v_0, i32* %var_1
%v_21 = load i32, i32* %var_2
%v_22 = add i32 0, 1
%v_23 = sub i32 %v_21, %v_22
store i32 %v_0, i32* %var_2
%v_24 = load i32, i32* %var_1
%v_25 = add i32 0, 5
%v_26 = icmp slt i32 %v_24, %v_25
br i1 %v_26, label %label_8, label %label_9
br label %label_8
label_8:
call void (i8*) @print(i8* getelementptr ([ 5 x i8], [5 x i8]* @.v_27, i32 0, i32 0))
br label %
br label %label_9
label_9:
%v_28 = load i32, i32* %var_1
call void @printi(i32 %v_28);
%v_29 = add i32 0, 10
store i32 %v_0, i32* %var_3
%v_30 = load i32, i32* %var_3
%v_31 = add i32 0, 4
%v_32 = icmp sgt i32 %v_30, %v_31
br i1 %v_32, label %label_10, label %label_11
label_10:
%v_33 = load i32, i32* %var_3
%v_34 = add i32 0, 2
%v_35 = sub i32 %v_33, %v_34
store i32 %v_0, i32* %var_3
br label %
call void (i8*) @print(i8* getelementptr ([ 17 x i8], [17 x i8]* @.v_36, i32 0, i32 0))
%v_37 = add i32 0, 5000
store i32 %v_0, i32* %var_4
%v_38 = load i32, i32* %var_4
%v_39 = load i32, i32* %var_4
%v_40 = icmp slt i32 %v_38, %v_39
br i1 %v_40, label %label_12, label %label_13
label_12:
call void (i8*) @print(i8* getelementptr ([ 17 x i8], [17 x i8]* @.v_41, i32 0, i32 0))
%v_42 = load i32, i32* %var_0
%v_43 = load i32, i32* %var_1
%v_44 = add i32 %v_42, %v_43
%v_45 = load i32, i32* %var_3
%v_46 = load i32, i32* %var_4
%v_48 = icmp eq i32 %v_46, 0
br i1 %v_48, label %label_14, label %label_15
label_14:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_15
label_15:
%v_47 = sdiv i32 %v_45, %v_46
%v_49 = add i32 %v_44, %v_47
store i32 %v_0, i32* %var_4
ret i32 0
}
