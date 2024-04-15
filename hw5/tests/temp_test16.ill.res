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
%v_0 = add i32 0, 2
store i32 %v_0, i32* %var_0
%v_1 = load i32, i32* %var_0
%v_2 = add i32 0, 100
%v_3 = icmp sle i32 %v_1, %v_2
br i1 %v_3, label %label_2, label %label_3
label_2:
%v_4 = add i32 0, 2
store i32 %v_4, i32* %var_1
br label %label_4
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%v_5 = phi i32 [1, %label_4], [0, %label_5]
store i32 %v_5, i32* %var_2
%v_6 = load i32, i32* %var_1
%v_7 = load i32, i32* %var_1
%v_8 = mul i32 %v_6, %v_7
%v_9 = load i32, i32* %var_0
%v_10 = icmp sle i32 %v_8, %v_9
br i1 %v_10, label %label_7, label %label_8
label_7:
%v_11 = load i32, i32* %var_0
%v_12 = load i32, i32* %var_1
%v_14 = icmp eq i32 %v_12, 0
br i1 %v_14, label %label_9, label %label_10
label_9:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_10
label_10:
%v_13 = sdiv i32 %v_11, %v_12
%v_15 = load i32, i32* %var_1
%v_16 = mul i32 %v_13, %v_15
%v_17 = load i32, i32* %var_0
%v_18 = icmp eq i32 %v_16, %v_17
br i1 %v_18, label %label_11, label %label_12
br label %label_11
label_11:
%v_19 = load i32, i32* %var_0
%v_20 = load i32, i32* %var_1
%v_21 = icmp ne i32 %v_19, %v_20
br i1 %v_21, label %label_13, label %label_14
br label %label_12
label_12:
br label %label_14
br label %label_13
label_13:
br label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%v_22 = phi i32 [1, %label_15], [0, %label_16]
store i32 %v_22, i32* %var_2
br label %label_8
br label %label_14
label_14:
%v_23 = load i32, i32* %var_1
%v_24 = add i32 0, 1
%v_25 = add i32 %v_23, %v_24
store i32 %v_25, i32* %var_1
%v_26 = load i32, i32* %var_2
%v_27 = icmp eq i32 %v_26, 1
br i1 %v_27, label %label_18, label %label_19
br label %label_18
label_18:
%v_28 = load i32, i32* %var_0
%v_29 = add i32 0, 1
%v_30 = icmp ne i32 %v_28, %v_29
br i1 %v_30, label %label_20, label %label_21
br label %label_19
label_19:
br label %label_21
br label %label_20
label_20:
%v_31 = load i32, i32* %var_0
call void @printi(i32 %v_31);
br label %label_21
label_21:
%v_32 = load i32, i32* %var_0
%v_33 = add i32 0, 1
%v_34 = add i32 %v_32, %v_33
store i32 %v_34, i32* %var_0
ret i32 0
ret i32 0
}
