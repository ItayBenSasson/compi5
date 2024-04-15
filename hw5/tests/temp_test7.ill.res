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
@.v_0 = private unnamed_addr constant [19 x i8] c"5 == 5b evaluation\00"
@.v_7 = private unnamed_addr constant [19 x i8] c"5 != 5b evaluation\00"
@.v_14 = private unnamed_addr constant [124 x i8] c"Evaluation with if (exp){printi(1)}else{printi(0)} with truth tabels {0, 1} and {00, 01, 10, 11} but values are relationals\00"
@.v_15 = private unnamed_addr constant [16 x i8] c"NOT truth table\00"
@.v_26 = private unnamed_addr constant [16 x i8] c"AND truth table\00"
@.v_59 = private unnamed_addr constant [15 x i8] c"OR truth table\00"
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
%v_1 = add i32 0, 5
%v_2 = add i8 0, 5
%v_3 = zext i8 %v_2 to i32
%v_4 = icmp eq i32 %v_1, %v_3
br i1 %v_4, label %label_2, label %label_3
br label %label_2
label_2:
%v_5 = add i32 0, 1
call void @printi(i32 %v_5);
br label %label_4
br label %label_3
label_3:
%v_6 = add i32 0, 0
call void @printi(i32 %v_6);
br label %label_4
label_4:
call void (i8*) @print(i8* getelementptr ([ 19 x i8], [19 x i8]* @.v_7, i32 0, i32 0))
%v_8 = add i32 0, 5
%v_9 = add i8 0, 5
%v_10 = zext i8 %v_9 to i32
%v_11 = icmp ne i32 %v_8, %v_10
br i1 %v_11, label %label_5, label %label_6
br label %label_5
label_5:
%v_12 = add i32 0, 1
call void @printi(i32 %v_12);
br label %label_7
br label %label_6
label_6:
%v_13 = add i32 0, 0
call void @printi(i32 %v_13);
br label %label_7
label_7:
call void (i8*) @print(i8* getelementptr ([ 124 x i8], [124 x i8]* @.v_14, i32 0, i32 0))
call void (i8*) @print(i8* getelementptr ([ 16 x i8], [16 x i8]* @.v_15, i32 0, i32 0))
%v_16 = add i32 0, 5
%v_17 = add i32 0, 4
%v_18 = icmp eq i32 %v_16, %v_17
br i1 %v_18, label %label_8, label %label_9
br label %label_9
label_9:
%v_19 = add i32 0, 1
call void @printi(i32 %v_19);
br label %label_10
br label %label_8
label_8:
%v_20 = add i32 0, 0
call void @printi(i32 %v_20);
br label %label_10
label_10:
%v_21 = add i32 0, 5
%v_22 = add i32 0, 4
%v_23 = icmp ne i32 %v_21, %v_22
br i1 %v_23, label %label_11, label %label_12
br label %label_12
label_12:
%v_24 = add i32 0, 1
call void @printi(i32 %v_24);
br label %label_13
br label %label_11
label_11:
%v_25 = add i32 0, 0
call void @printi(i32 %v_25);
br label %label_13
label_13:
call void (i8*) @print(i8* getelementptr ([ 16 x i8], [16 x i8]* @.v_26, i32 0, i32 0))
%v_27 = add i32 0, 0
%v_28 = add i32 0, 1
%v_29 = icmp sgt i32 %v_27, %v_28
br i1 %v_29, label %label_14, label %label_15
br label %label_14
label_14:
%v_30 = add i32 0, 1
%v_31 = add i32 0, 0
%v_32 = icmp slt i32 %v_30, %v_31
br i1 %v_32, label %label_16, label %label_17
br label %label_15
label_15:
br label %label_17
br label %label_16
label_16:
%v_33 = add i32 0, 1
call void @printi(i32 %v_33);
br label %label_18
br label %label_17
label_17:
%v_34 = add i32 0, 0
call void @printi(i32 %v_34);
br label %label_18
label_18:
%v_35 = add i32 0, 0
%v_36 = add i32 0, 1
%v_37 = icmp sge i32 %v_35, %v_36
br i1 %v_37, label %label_19, label %label_20
br label %label_19
label_19:
%v_38 = add i32 0, 0
%v_39 = add i32 0, 0
%v_40 = icmp sge i32 %v_38, %v_39
br i1 %v_40, label %label_21, label %label_22
br label %label_20
label_20:
br label %label_22
br label %label_21
label_21:
%v_41 = add i32 0, 1
call void @printi(i32 %v_41);
br label %label_23
br label %label_22
label_22:
%v_42 = add i32 0, 0
call void @printi(i32 %v_42);
br label %label_23
label_23:
%v_43 = add i32 0, 0
%v_44 = add i32 0, 0
%v_45 = icmp sle i32 %v_43, %v_44
br i1 %v_45, label %label_24, label %label_25
br label %label_24
label_24:
%v_46 = add i32 0, 1
%v_47 = add i32 0, 0
%v_48 = icmp sle i32 %v_46, %v_47
br i1 %v_48, label %label_26, label %label_27
br label %label_25
label_25:
br label %label_27
br label %label_26
label_26:
%v_49 = add i32 0, 1
call void @printi(i32 %v_49);
br label %label_28
br label %label_27
label_27:
%v_50 = add i32 0, 0
call void @printi(i32 %v_50);
br label %label_28
label_28:
%v_51 = add i32 0, 0
%v_52 = add i32 0, 1
%v_53 = icmp slt i32 %v_51, %v_52
br i1 %v_53, label %label_29, label %label_30
br label %label_29
label_29:
%v_54 = add i32 0, 1
%v_55 = add i32 0, 0
%v_56 = icmp sgt i32 %v_54, %v_55
br i1 %v_56, label %label_31, label %label_32
br label %label_30
label_30:
br label %label_32
br label %label_31
label_31:
%v_57 = add i32 0, 1
call void @printi(i32 %v_57);
br label %label_33
br label %label_32
label_32:
%v_58 = add i32 0, 0
call void @printi(i32 %v_58);
br label %label_33
label_33:
call void (i8*) @print(i8* getelementptr ([ 15 x i8], [15 x i8]* @.v_59, i32 0, i32 0))
%v_60 = add i8 0, 0
%v_61 = zext i8 %v_60 to i32
%v_62 = add i32 0, 0
%v_63 = icmp sgt i32 %v_61, %v_62
br i1 %v_63, label %label_34, label %label_35
label_35:
%v_64 = add i8 0, 0
%v_65 = zext i8 %v_64 to i32
%v_66 = add i32 0, 0
%v_67 = icmp slt i32 %v_65, %v_66
br i1 %v_67, label %label_36, label %label_37
label_34:
br label %label_36
br label %label_36
label_36:
%v_68 = add i32 0, 1
call void @printi(i32 %v_68);
br label %label_38
br label %label_37
label_37:
%v_69 = add i32 0, 0
call void @printi(i32 %v_69);
br label %label_38
label_38:
%v_70 = add i8 0, 0
%v_71 = zext i8 %v_70 to i32
%v_72 = add i32 0, 0
%v_73 = icmp sgt i32 %v_71, %v_72
br i1 %v_73, label %label_39, label %label_40
label_40:
%v_74 = add i32 0, 0
%v_75 = add i8 0, 0
%v_76 = zext i8 %v_75 to i32
%v_77 = icmp sge i32 %v_74, %v_76
br i1 %v_77, label %label_41, label %label_42
label_39:
br label %label_41
br label %label_41
label_41:
%v_78 = add i32 0, 1
call void @printi(i32 %v_78);
br label %label_43
br label %label_42
label_42:
%v_79 = add i32 0, 0
call void @printi(i32 %v_79);
br label %label_43
label_43:
%v_80 = add i32 0, 0
%v_81 = add i8 0, 0
%v_82 = zext i8 %v_81 to i32
%v_83 = icmp sle i32 %v_80, %v_82
br i1 %v_83, label %label_44, label %label_45
label_45:
%v_84 = add i8 0, 0
%v_85 = zext i8 %v_84 to i32
%v_86 = add i32 0, 0
%v_87 = icmp slt i32 %v_85, %v_86
br i1 %v_87, label %label_46, label %label_47
label_44:
br label %label_46
br label %label_46
label_46:
%v_88 = add i32 0, 1
call void @printi(i32 %v_88);
br label %label_48
br label %label_47
label_47:
%v_89 = add i32 0, 0
call void @printi(i32 %v_89);
br label %label_48
label_48:
%v_90 = add i32 0, 0
%v_91 = add i8 0, 1
%v_92 = zext i8 %v_91 to i32
%v_93 = icmp slt i32 %v_90, %v_92
br i1 %v_93, label %label_49, label %label_50
label_50:
%v_94 = add i32 0, 1
%v_95 = add i8 0, 0
%v_96 = zext i8 %v_95 to i32
%v_97 = icmp sgt i32 %v_94, %v_96
br i1 %v_97, label %label_51, label %label_52
label_49:
br label %label_51
br label %label_51
label_51:
%v_98 = add i32 0, 1
call void @printi(i32 %v_98);
br label %label_53
br label %label_52
label_52:
%v_99 = add i32 0, 0
call void @printi(i32 %v_99);
br label %label_53
label_53:
ret i32 0
}
