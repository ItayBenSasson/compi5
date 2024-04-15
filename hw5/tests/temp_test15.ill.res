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
@.v_36 = private unnamed_addr constant [11 x i8] c"Somethings\00"
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
%v_0 = add i8 0, 1
%v_1 = zext i8 %v_0 to i32
store i32 %v_1, i32* %var_0
br label %label_3
label_2:
br label %label_4
label_3:
br label %label_4
label_4:
%v_2 = phi i32 [1, %label_2], [0, %label_3]
store i32 %v_2, i32* %var_1
br label %label_5
label_5:
br label %label_7
label_6:
br label %label_7
label_7:
%v_3 = phi i32 [1, %label_5], [0, %label_6]
store i32 %v_3, i32* %var_2
store i32 0, i32* %var_3
br label %label_8
label_8:
%v_4 = load i32, i32* %var_0
%v_5 = add i32 0, 10
%v_6 = icmp slt i32 %v_4, %v_5
br i1 %v_6, label %label_9, label %label_10
label_9:
%v_7 = load i32, i32* %var_0
%v_8 = add i32 0, 1
%v_9 = add i32 %v_7, %v_8
store i32 %v_9, i32* %var_0
%v_10 = add i32 0, 100
store i32 %v_10, i32* %var_4
br label %label_11
label_11:
%v_11 = load i32, i32* %var_4
%v_12 = load i32, i32* %var_0
%v_13 = icmp sgt i32 %v_11, %v_12
br i1 %v_13, label %label_12, label %label_13
label_12:
%v_14 = load i32, i32* %var_4
%v_15 = load i32, i32* %var_0
%v_17 = icmp eq i32 %v_15, 0
br i1 %v_17, label %label_14, label %label_15
label_14:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_15
label_15:
%v_16 = sdiv i32 %v_14, %v_15
%v_18 = load i32, i32* %var_0
%v_19 = mul i32 %v_16, %v_18
%v_20 = load i32, i32* %var_4
%v_21 = icmp eq i32 %v_19, %v_20
br i1 %v_21, label %label_16, label %label_17
label_16:
br label %label_18
label_17:
br label %label_18
label_18:
%v_22 = phi i32 [1, %label_16], [0, %label_17]
store i32 %v_22, i32* %var_3
%v_23 = add i32 0, 1
store i32 %v_23, i32* %var_5
br label %label_19
label_19:
%v_24 = load i32, i32* %var_5
%v_25 = load i32, i32* %var_0
%v_26 = icmp slt i32 %v_24, %v_25
br i1 %v_26, label %label_20, label %label_21
label_20:
br label %label_23
label_23:
br label %label_24
br label %label_24
label_24:
%v_27 = load i32, i32* %var_1
%v_28 = icmp eq i32 %v_27, 1
br i1 %v_28, label %label_26, label %label_27
label_27:
%v_29 = load i32, i32* %var_2
%v_30 = icmp eq i32 %v_29, 1
br i1 %v_30, label %label_28, label %label_29
br label %label_28
label_28:
%v_31 = load i32, i32* %var_3
%v_32 = icmp eq i32 %v_31, 1
br i1 %v_32, label %label_30, label %label_31
br label %label_29
label_29:
br label %label_30
label_26:
br label %label_31
br label %label_25
label_25:
br label %label_31
label_22:
br label %label_30
br label %label_30
label_30:
%v_33 = load i32, i32* %var_4
%v_34 = add i32 0, 1
%v_35 = sub i32 %v_33, %v_34
store i32 %v_35, i32* %var_4
br label %label_32
br label %label_31
label_31:
call void (i8*) @print(i8* getelementptr ([ 11 x i8], [11 x i8]* @.v_36, i32 0, i32 0))
br label %label_32
label_32:
%v_37 = load i32, i32* %var_5
%v_38 = add i32 0, 1
%v_39 = add i32 %v_37, %v_38
store i32 %v_39, i32* %var_5
br label %label_19
label_21:
%v_40 = load i32, i32* %var_2
%v_41 = icmp eq i32 %v_40, 1
br i1 %v_41, label %label_33, label %label_34
label_34:
br label %label_35
label_33:
br label %label_35
label_35:
%v_42 = phi i32 [1, %label_34], [0, %label_33]
store i32 %v_42, i32* %var_1
%v_43 = load i32, i32* %var_1
%v_44 = icmp eq i32 %v_43, 1
br i1 %v_44, label %label_36, label %label_37
br label %label_36
label_36:
%v_45 = load i32, i32* %var_3
%v_46 = icmp eq i32 %v_45, 1
br i1 %v_46, label %label_38, label %label_39
br label %label_37
label_37:
br label %label_38
label_39:
br label %label_40
label_38:
br label %label_40
label_40:
%v_47 = phi i32 [1, %label_39], [0, %label_38]
store i32 %v_47, i32* %var_2
%v_48 = load i32, i32* %var_1
%v_49 = icmp eq i32 %v_48, 1
br i1 %v_49, label %label_41, label %label_42
br label %label_41
label_41:
%v_50 = load i32, i32* %var_4
%v_51 = add i32 0, 2
%v_53 = icmp eq i32 %v_51, 0
br i1 %v_53, label %label_43, label %label_44
label_43:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_44
label_44:
%v_52 = sdiv i32 %v_50, %v_51
%v_54 = add i32 0, 1
%v_55 = add i32 %v_52, %v_54
store i32 %v_55, i32* %var_4
br label %label_45
br label %label_42
label_42:
%v_56 = load i32, i32* %var_2
%v_57 = icmp eq i32 %v_56, 1
br i1 %v_57, label %label_46, label %label_47
br label %label_47
label_47:
%v_58 = load i32, i32* %var_0
%v_59 = load i32, i32* %var_4
%v_61 = icmp eq i32 %v_59, 0
br i1 %v_61, label %label_48, label %label_49
label_48:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_49
label_49:
%v_60 = sdiv i32 %v_58, %v_59
%v_62 = load i32, i32* %var_4
%v_63 = mul i32 %v_60, %v_62
%v_64 = load i32, i32* %var_0
%v_65 = add i32 %v_63, %v_64
%v_66 = add i32 0, 3
%v_67 = add i32 0, 2
%v_68 = mul i32 %v_66, %v_67
%v_69 = add i32 %v_65, %v_68
call void @printi(i32 %v_69);
br label %label_46
label_46:
br label %label_45
label_45:
%v_70 = load i32, i32* %var_4
%v_71 = load i32, i32* %var_4
%v_72 = mul i32 %v_70, %v_71
%v_73 = load i32, i32* %var_0
%v_75 = icmp eq i32 %v_73, 0
br i1 %v_75, label %label_50, label %label_51
label_50:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_51
label_51:
%v_74 = sdiv i32 %v_72, %v_73
%v_76 = load i32, i32* %var_0
%v_78 = icmp eq i32 %v_76, 0
br i1 %v_78, label %label_52, label %label_53
label_52:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_53
label_53:
%v_77 = sdiv i32 %v_74, %v_76
%v_79 = load i32, i32* %var_0
%v_80 = load i32, i32* %var_4
%v_82 = icmp eq i32 %v_80, 0
br i1 %v_82, label %label_54, label %label_55
label_54:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_55
label_55:
%v_81 = sdiv i32 %v_79, %v_80
%v_83 = add i32 0, 2
%v_84 = mul i32 %v_81, %v_83
%v_85 = add i32 0, 3
%v_87 = icmp eq i32 %v_85, 0
br i1 %v_87, label %label_56, label %label_57
label_56:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_57
label_57:
%v_86 = sdiv i32 %v_84, %v_85
%v_88 = add i32 %v_77, %v_86
%v_89 = add i32 0, 4
%v_90 = load i32, i32* %var_0
%v_91 = mul i32 %v_89, %v_90
%v_92 = load i32, i32* %var_4
%v_93 = add i32 0, 5
%v_94 = add i32 %v_92, %v_93
%v_96 = icmp eq i32 %v_94, 0
br i1 %v_96, label %label_58, label %label_59
label_58:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_59
label_59:
%v_95 = sdiv i32 %v_91, %v_94
%v_97 = add i32 %v_88, %v_95
call void @printi(i32 %v_97);
br label %label_11
label_13:
br label %label_8
label_10:
ret i32 0
}
