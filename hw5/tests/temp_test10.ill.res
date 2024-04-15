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
@.v_7 = private unnamed_addr constant [4 x i8] c"bye\00"
@.v_27 = private unnamed_addr constant [4 x i8] c"bye\00"
@.v_36 = private unnamed_addr constant [17 x i8] c"should not print\00"
@.v_44 = private unnamed_addr constant [17 x i8] c"should not print\00"
@.v_64 = private unnamed_addr constant [4 x i8] c"bye\00"
@.v_85 = private unnamed_addr constant [4 x i8] c"bye\00"
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
call void (i8*) @print(i8* getelementptr ([ 4 x i8], [4 x i8]* @.v_7, i32 0, i32 0))
%v_8 = load i32, i32* %var_0
%v_9 = add i32 0, 1
%v_10 = sub i32 %v_8, %v_9
store i32 %v_10, i32* %var_0
br label %label_3
br label %label_5
label_5:
%v_11 = load i32, i32* %var_0
call void @printi(i32 %v_11);
%v_12 = load i32, i32* %var_0
%v_13 = add i32 0, 1
%v_14 = sub i32 %v_12, %v_13
store i32 %v_14, i32* %var_0
%v_15 = add i32 0, 10
store i32 %v_15, i32* %var_1
%v_16 = load i32, i32* %var_1
store i32 %v_16, i32* %var_2
%v_17 = load i32, i32* %var_2
%v_18 = add i32 0, 0
%v_19 = icmp sgt i32 %v_17, %v_18
br i1 %v_19, label %label_6, label %label_7
label_6:
%v_20 = load i32, i32* %var_2
store i32 %v_20, i32* %var_1
%v_21 = load i32, i32* %var_2
%v_22 = add i32 0, 1
%v_23 = sub i32 %v_21, %v_22
store i32 %v_23, i32* %var_2
%v_24 = load i32, i32* %var_1
%v_25 = add i32 0, 5
%v_26 = icmp slt i32 %v_24, %v_25
br i1 %v_26, label %label_8, label %label_9
br label %label_8
label_8:
call void (i8*) @print(i8* getelementptr ([ 4 x i8], [4 x i8]* @.v_27, i32 0, i32 0))
br label %label_7
br label %label_9
label_9:
%v_28 = load i32, i32* %var_1
call void @printi(i32 %v_28);
%v_29 = add i32 0, 10
store i32 %v_29, i32* %var_3
%v_30 = load i32, i32* %var_3
%v_31 = add i32 0, 4
%v_32 = icmp sgt i32 %v_30, %v_31
br i1 %v_32, label %label_10, label %label_11
label_10:
%v_33 = load i32, i32* %var_3
%v_34 = add i32 0, 2
%v_35 = sub i32 %v_33, %v_34
store i32 %v_35, i32* %var_3
br label %label_11
call void (i8*) @print(i8* getelementptr ([ 17 x i8], [17 x i8]* @.v_36, i32 0, i32 0))
%v_37 = add i32 0, 5000
store i32 %v_37, i32* %var_4
%v_38 = load i32, i32* %var_4
%v_39 = load i32, i32* %var_4
%v_40 = icmp eq i32 %v_38, %v_39
br i1 %v_40, label %label_12, label %label_13
label_12:
%v_41 = load i32, i32* %var_4
%v_42 = load i32, i32* %var_4
%v_43 = icmp ne i32 %v_41, %v_42
br i1 %v_43, label %label_14, label %label_15
br label %label_15
label_15:
br label %label_13
br label %label_14
label_14:
call void (i8*) @print(i8* getelementptr ([ 17 x i8], [17 x i8]* @.v_44, i32 0, i32 0))
%v_45 = load i32, i32* %var_0
%v_46 = load i32, i32* %var_1
%v_47 = add i32 %v_45, %v_46
%v_48 = load i32, i32* %var_3
%v_49 = load i32, i32* %var_4
%v_51 = icmp eq i32 %v_49, 0
br i1 %v_51, label %label_16, label %label_17
label_16:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_17
label_17:
%v_50 = sdiv i32 %v_48, %v_49
%v_52 = add i32 %v_47, %v_50
store i32 %v_52, i32* %var_4
%v_53 = add i32 0, 10
store i32 %v_53, i32* %var_0
%v_54 = add i32 0, 0
store i32 %v_54, i32* %var_1
%v_55 = load i32, i32* %var_0
%v_56 = add i32 0, 4
%v_57 = icmp sgt i32 %v_55, %v_56
br i1 %v_57, label %label_18, label %label_19
label_19:
%v_58 = load i32, i32* %var_1
%v_59 = add i32 0, 3
%v_60 = icmp slt i32 %v_58, %v_59
br i1 %v_60, label %label_20, label %label_21
label_18:
br label %label_20
label_20:
%v_61 = load i32, i32* %var_0
%v_62 = load i32, i32* %var_1
%v_63 = icmp eq i32 %v_61, %v_62
br i1 %v_63, label %label_22, label %label_23
br label %label_22
label_22:
call void (i8*) @print(i8* getelementptr ([ 4 x i8], [4 x i8]* @.v_64, i32 0, i32 0))
br label %label_21
br label %label_23
label_23:
%v_65 = load i32, i32* %var_0
%v_66 = load i32, i32* %var_1
%v_67 = add i32 %v_65, %v_66
call void @printi(i32 %v_67);
%v_68 = load i32, i32* %var_0
%v_69 = add i32 0, 1
%v_70 = sub i32 %v_68, %v_69
store i32 %v_70, i32* %var_0
%v_71 = load i32, i32* %var_1
%v_72 = add i32 0, 1
%v_73 = add i32 %v_71, %v_72
store i32 %v_73, i32* %var_1
%v_74 = add i32 0, 9
store i32 %v_74, i32* %var_0
%v_75 = add i32 0, 1
store i32 %v_75, i32* %var_1
%v_76 = load i32, i32* %var_0
%v_77 = add i32 0, 4
%v_78 = icmp sgt i32 %v_76, %v_77
br i1 %v_78, label %label_24, label %label_25
br label %label_24
label_24:
%v_79 = load i32, i32* %var_1
%v_80 = add i32 0, 3
%v_81 = icmp slt i32 %v_79, %v_80
br i1 %v_81, label %label_26, label %label_27
br label %label_25
label_25:
br label %label_27
label_26:
%v_82 = load i32, i32* %var_0
%v_83 = load i32, i32* %var_1
%v_84 = icmp eq i32 %v_82, %v_83
br i1 %v_84, label %label_28, label %label_29
br label %label_28
label_28:
call void (i8*) @print(i8* getelementptr ([ 4 x i8], [4 x i8]* @.v_85, i32 0, i32 0))
br label %label_27
br label %label_29
label_29:
%v_86 = load i32, i32* %var_0
%v_87 = load i32, i32* %var_1
%v_88 = sub i32 %v_86, %v_87
call void @printi(i32 %v_88);
%v_89 = load i32, i32* %var_0
%v_90 = add i32 0, 1
%v_91 = sub i32 %v_89, %v_90
store i32 %v_91, i32* %var_0
%v_92 = load i32, i32* %var_1
%v_93 = add i32 0, 1
%v_94 = add i32 %v_92, %v_93
store i32 %v_94, i32* %var_1
ret i32 0
}
