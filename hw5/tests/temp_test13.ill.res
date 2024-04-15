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
@.v_0 = private unnamed_addr constant [19 x i8] c"Fibonachy numbers:\00"
@.v_22 = private unnamed_addr constant [21 x i8] c"Shouldn't be printed\00"
@.v_30 = private unnamed_addr constant [33 x i8] c"Fibonacci numbers (alternative):\00"
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
call void (i8*) @print(i8* getelementptr ([ 19 x i8], [19 x i8]* @.v_0, i32 0, i32 0))
%v_1 = add i32 0, 20
store i32 %v_1, i32* %var_0
%v_2 = add i32 0, 1
store i32 %v_2, i32* %var_1
%v_3 = load i32, i32* %var_1
%v_4 = load i32, i32* %var_0
%v_5 = icmp slt i32 %v_3, %v_4
br i1 %v_5, label %label_2, label %label_3
label_2:
%v_6 = add i32 0, 1
store i32 %v_6, i32* %var_2
%v_7 = add i32 0, 0
store i32 %v_7, i32* %var_3
%v_8 = add i32 0, 1
store i32 %v_8, i32* %var_4
store i32 0, i32* %var_5
br label %label_4
label_4:
%v_9 = load i32, i32* %var_2
%v_10 = load i32, i32* %var_1
%v_11 = icmp eq i32 %v_9, %v_10
br i1 %v_11, label %label_6, label %label_7
br label %label_6
label_6:
%v_12 = load i32, i32* %var_4
call void @printi(i32 %v_12);
br label %label_5
br label %label_7
label_7:
%v_13 = load i32, i32* %var_4
%v_14 = load i32, i32* %var_3
%v_15 = add i32 %v_13, %v_14
store i32 %v_15, i32* %var_5
%v_16 = load i32, i32* %var_4
store i32 %v_16, i32* %var_3
%v_17 = load i32, i32* %var_5
store i32 %v_17, i32* %var_4
%v_18 = load i32, i32* %var_2
%v_19 = add i32 0, 1
%v_20 = add i32 %v_18, %v_19
%v_21 = and i32 %v_20, 255
store i32 %v_21, i32* %var_2
br label %
call void (i8*) @print(i8* getelementptr ([ 21 x i8], [21 x i8]* @.v_22, i32 0, i32 0))
%v_23 = load i32, i32* %var_1
%v_24 = add i32 0, 1
%v_25 = add i32 %v_23, %v_24
%v_26 = and i32 %v_25, 255
store i32 %v_26, i32* %var_1
%v_27 = add i32 0, 1
%v_28 = add i32 0, 2
%v_29 = icmp slt i32 %v_27, %v_28
br i1 %v_29, label %label_8, label %label_9
label_8:
call void (i8*) @print(i8* getelementptr ([ 33 x i8], [33 x i8]* @.v_30, i32 0, i32 0))
%v_31 = add i32 0, 20
store i32 %v_31, i32* %var_0
%v_32 = add i32 0, 1
store i32 %v_32, i32* %var_1
br label %label_11
label_10:
br label %label_12
label_11:
br label %label_12
label_12:
%v_33 = phi i32 [1, %label_10], [0, %label_11]
store i32 %v_33, i32* %var_2
br label %label_14
label_13:
br label %label_15
label_14:
br label %label_15
label_15:
%v_34 = phi i32 [1, %label_13], [0, %label_14]
store i32 %v_34, i32* %var_3
%v_35 = load i32, i32* %var_2
%v_36 = icmp eq i32 %v_35, 1
br i1 %v_36, label %label_16, label %label_17
br label %label_16
label_16:
%v_37 = load i32, i32* %var_3
%v_38 = icmp eq i32 %v_37, 1
br i1 %v_38, label %label_18, label %label_19
br label %label_17
label_17:
br label %label_19
label_18:
br label %label_21
br label %label_20
label_20:
br label %label_23
br label %label_21
label_21:
br label %label_22
br label %label_23
label_23:
%v_39 = add i32 0, 3
%v_40 = load i32, i32* %var_1
%v_41 = icmp slt i32 %v_39, %v_40
br i1 %v_41, label %label_24, label %label_25
br label %label_22
label_22:
br label %label_25
label_19:
br label %label_24
label_24:
%v_42 = load i32, i32* %var_1
%v_43 = load i32, i32* %var_0
%v_44 = icmp eq i32 %v_42, %v_43
br i1 %v_44, label %label_26, label %label_27
br label %label_26
label_26:
%v_45 = load i32, i32* %var_2
%v_46 = icmp eq i32 %v_45, 1
br i1 %v_46, label %label_28, label %label_29
br label %label_27
label_27:
br label %label_28
br label %label_29
label_29:
br label %label_30
label_30:
br label %label_32
label_31:
br label %label_32
label_32:
%v_47 = phi i32 [1, %label_30], [0, %label_31]
store i32 %v_47, i32* %var_2
br label %
br label %label_33
br label %label_28
label_28:
%v_48 = load i32, i32* %var_2
%v_49 = icmp eq i32 %v_48, 1
br i1 %v_49, label %label_34, label %label_35
br label %label_34
label_34:
%v_50 = load i32, i32* %var_1
%v_51 = load i32, i32* %var_0
%v_52 = icmp eq i32 %v_50, %v_51
br i1 %v_52, label %label_36, label %label_37
label_36:
br label %label_38
label_37:
br label %label_38
label_38:
%v_53 = phi i32 [1, %label_36], [0, %label_37]
store i32 %v_53, i32* %var_3
br label %
br label %label_35
label_35:
br label %label_33
label_33:
%v_54 = add i32 0, 1
store i32 %v_54, i32* %var_4
%v_55 = add i32 0, 0
store i32 %v_55, i32* %var_5
%v_56 = add i32 0, 1
store i32 %v_56, i32* %var_6
store i32 0, i32* %var_7
%v_57 = load i32, i32* %var_4
%v_58 = load i32, i32* %var_1
%v_59 = icmp slt i32 %v_57, %v_58
br i1 %v_59, label %label_39, label %label_40
label_39:
%v_60 = load i32, i32* %var_6
%v_61 = load i32, i32* %var_5
%v_62 = add i32 %v_60, %v_61
store i32 %v_62, i32* %var_7
%v_63 = load i32, i32* %var_6
store i32 %v_63, i32* %var_5
%v_64 = load i32, i32* %var_7
store i32 %v_64, i32* %var_6
%v_65 = load i32, i32* %var_2
%v_66 = icmp eq i32 %v_65, 1
br i1 %v_66, label %label_41, label %label_42
br label %label_41
label_41:
br label %label_40
br label %label_43
br label %label_42
label_42:
store i32 0, i32* %var_8
br label %label_43
label_43:
%v_67 = load i32, i32* %var_4
%v_68 = add i32 0, 1
%v_69 = add i32 %v_67, %v_68
store i32 %v_69, i32* %var_4
%v_70 = load i32, i32* %var_6
call void @printi(i32 %v_70);
%v_71 = load i32, i32* %var_1
%v_72 = add i32 0, 1
%v_73 = add i32 %v_71, %v_72
store i32 %v_73, i32* %var_1
ret i32 0
ret i32 0
}
