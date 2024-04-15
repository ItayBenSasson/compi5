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
@.v_0 = private unnamed_addr constant [29 x i8] c"Player 1, enter any number: \00"
@.v_28 = private unnamed_addr constant [75 x i8] c"Player 2, enter a number larger than %d with the same number of divisors: \00"
@.v_57 = private unnamed_addr constant [16 x i8] c"Player 2 loses!\00"
@.v_58 = private unnamed_addr constant [75 x i8] c"Player 1, enter a number larger than %d with the same number of divisors: \00"
@.v_87 = private unnamed_addr constant [16 x i8] c"Player 1 loses!\00"
@.v_91 = private unnamed_addr constant [19 x i8] c"Player 1 divisors:\00"
@.v_93 = private unnamed_addr constant [19 x i8] c"Player 2 divisors:\00"
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
store i32 0, i32* %var_1
call void (i8*) @print(i8* getelementptr ([ 29 x i8], [29 x i8]* @.v_0, i32 0, i32 0))
%v_1 = add i32 0, 0
%v_2 = call i32 @readi(i32 0);
store i32 %v_2, i32* %var_0
%v_3 = load i32, i32* %var_0
call void @printi(i32 %v_3);
%v_4 = add i32 0, 0
store i32 %v_4, i32* %var_2
%v_5 = add i32 0, 0
store i32 %v_5, i32* %var_3
%v_6 = add i32 0, 2
store i32 %v_6, i32* %var_4
br label %label_2
label_2:
br label %label_3
label_3:
%v_7 = add i32 0, 1
store i32 %v_7, i32* %var_5
br label %label_5
label_5:
%v_8 = load i32, i32* %var_5
%v_9 = load i32, i32* %var_0
%v_10 = icmp sle i32 %v_8, %v_9
br i1 %v_10, label %label_6, label %label_7
label_6:
%v_11 = load i32, i32* %var_0
%v_12 = load i32, i32* %var_5
%v_14 = icmp eq i32 %v_12, 0
br i1 %v_14, label %label_8, label %label_9
label_8:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_9
label_9:
%v_13 = sdiv i32 %v_11, %v_12
%v_15 = load i32, i32* %var_5
%v_16 = mul i32 %v_13, %v_15
%v_17 = load i32, i32* %var_0
%v_18 = icmp eq i32 %v_16, %v_17
br i1 %v_18, label %label_10, label %label_11
br label %label_10
label_10:
%v_19 = load i32, i32* %var_2
%v_20 = add i32 0, 1
%v_21 = add i32 %v_19, %v_20
store i32 %v_21, i32* %var_2
br label %label_11
label_11:
%v_22 = load i32, i32* %var_5
%v_23 = add i32 0, 1
%v_24 = add i32 %v_22, %v_23
store i32 %v_24, i32* %var_5
br label %label_5
label_7:
%v_25 = load i32, i32* %var_4
%v_26 = add i32 0, 2
%v_27 = icmp eq i32 %v_25, %v_26
br i1 %v_27, label %label_12, label %label_13
br label %label_12
label_12:
call void (i8*) @print(i8* getelementptr ([ 75 x i8], [75 x i8]* @.v_28, i32 0, i32 0))
%v_29 = add i32 0, 0
%v_30 = call i32 @readi(i32 0);
store i32 %v_30, i32* %var_1
%v_31 = load i32, i32* %var_1
call void @printi(i32 %v_31);
%v_32 = add i32 0, 0
store i32 %v_32, i32* %var_3
%v_33 = add i32 0, 1
store i32 %v_33, i32* %var_6
br label %label_14
label_14:
%v_34 = load i32, i32* %var_6
%v_35 = load i32, i32* %var_1
%v_36 = icmp sle i32 %v_34, %v_35
br i1 %v_36, label %label_15, label %label_16
label_15:
%v_37 = load i32, i32* %var_1
%v_38 = load i32, i32* %var_6
%v_40 = icmp eq i32 %v_38, 0
br i1 %v_40, label %label_17, label %label_18
label_17:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_18
label_18:
%v_39 = sdiv i32 %v_37, %v_38
%v_41 = load i32, i32* %var_6
%v_42 = mul i32 %v_39, %v_41
%v_43 = load i32, i32* %var_1
%v_44 = icmp eq i32 %v_42, %v_43
br i1 %v_44, label %label_19, label %label_20
br label %label_19
label_19:
%v_45 = load i32, i32* %var_3
%v_46 = add i32 0, 1
%v_47 = add i32 %v_45, %v_46
store i32 %v_47, i32* %var_3
br label %label_20
label_20:
%v_48 = load i32, i32* %var_6
%v_49 = add i32 0, 1
%v_50 = add i32 %v_48, %v_49
store i32 %v_50, i32* %var_6
br label %label_14
label_16:
%v_51 = load i32, i32* %var_1
%v_52 = load i32, i32* %var_0
%v_53 = icmp sle i32 %v_51, %v_52
br i1 %v_53, label %label_21, label %label_22
label_22:
%v_54 = load i32, i32* %var_2
%v_55 = load i32, i32* %var_3
%v_56 = icmp ne i32 %v_54, %v_55
br i1 %v_56, label %label_23, label %label_24
label_21:
br label %label_23
br label %label_23
label_23:
call void (i8*) @print(i8* getelementptr ([ 16 x i8], [16 x i8]* @.v_57, i32 0, i32 0))
br label %label_4
br label %label_24
label_24:
br label %label_25
br label %label_13
label_13:
call void (i8*) @print(i8* getelementptr ([ 75 x i8], [75 x i8]* @.v_58, i32 0, i32 0))
%v_59 = add i32 0, 0
%v_60 = call i32 @readi(i32 0);
store i32 %v_60, i32* %var_0
%v_61 = load i32, i32* %var_0
call void @printi(i32 %v_61);
%v_62 = add i32 0, 0
store i32 %v_62, i32* %var_2
%v_63 = add i32 0, 1
store i32 %v_63, i32* %var_6
br label %label_26
label_26:
%v_64 = load i32, i32* %var_6
%v_65 = load i32, i32* %var_0
%v_66 = icmp sle i32 %v_64, %v_65
br i1 %v_66, label %label_27, label %label_28
label_27:
%v_67 = load i32, i32* %var_0
%v_68 = load i32, i32* %var_6
%v_70 = icmp eq i32 %v_68, 0
br i1 %v_70, label %label_29, label %label_30
label_29:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_30
label_30:
%v_69 = sdiv i32 %v_67, %v_68
%v_71 = load i32, i32* %var_6
%v_72 = mul i32 %v_69, %v_71
%v_73 = load i32, i32* %var_0
%v_74 = icmp eq i32 %v_72, %v_73
br i1 %v_74, label %label_31, label %label_32
br label %label_31
label_31:
%v_75 = load i32, i32* %var_2
%v_76 = add i32 0, 1
%v_77 = add i32 %v_75, %v_76
store i32 %v_77, i32* %var_2
br label %label_32
label_32:
%v_78 = load i32, i32* %var_6
%v_79 = add i32 0, 1
%v_80 = add i32 %v_78, %v_79
store i32 %v_80, i32* %var_6
br label %label_26
label_28:
%v_81 = load i32, i32* %var_0
%v_82 = load i32, i32* %var_1
%v_83 = icmp sle i32 %v_81, %v_82
br i1 %v_83, label %label_33, label %label_34
label_34:
%v_84 = load i32, i32* %var_2
%v_85 = load i32, i32* %var_3
%v_86 = icmp ne i32 %v_84, %v_85
br i1 %v_86, label %label_35, label %label_36
label_33:
br label %label_35
br label %label_35
label_35:
call void (i8*) @print(i8* getelementptr ([ 16 x i8], [16 x i8]* @.v_87, i32 0, i32 0))
br label %label_4
br label %label_36
label_36:
br label %label_25
label_25:
%v_88 = add i32 0, 3
%v_89 = load i32, i32* %var_4
%v_90 = sub i32 %v_88, %v_89
store i32 %v_90, i32* %var_4
br label %label_2
label_4:
call void (i8*) @print(i8* getelementptr ([ 19 x i8], [19 x i8]* @.v_91, i32 0, i32 0))
%v_92 = load i32, i32* %var_2
call void @printi(i32 %v_92);
call void (i8*) @print(i8* getelementptr ([ 19 x i8], [19 x i8]* @.v_93, i32 0, i32 0))
%v_94 = load i32, i32* %var_3
call void @printi(i32 %v_94);
ret i32 0
}
