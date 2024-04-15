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
%v_0 = add i32 0, 1
store i32 %v_0, i32* %var_0
%v_1 = add i32 0, 2
store i32 %v_0, i32* %var_1
%v_2 = add i32 0, 3
store i32 %v_0, i32* %var_2
%v_3 = add i32 0, 4
store i32 %v_0, i32* %var_3
%v_4 = add i32 0, 5
store i32 %v_0, i32* %var_4
%v_5 = add i32 0, 6
store i32 %v_0, i32* %var_5
%v_6 = add i32 0, 7
store i32 %v_0, i32* %var_6
%v_7 = add i32 0, 8
store i32 %v_0, i32* %var_7
%v_8 = add i32 0, 9
store i32 %v_0, i32* %var_8
%v_9 = add i32 0, 10
store i32 %v_0, i32* %var_9
%v_10 = add i32 0, 11
store i32 %v_0, i32* %var_10
%v_11 = add i32 0, 12
store i32 %v_0, i32* %var_11
%v_12 = add i32 0, 13
store i32 %v_0, i32* %var_12
%v_13 = add i32 0, 14
store i32 %v_0, i32* %var_13
%v_14 = add i32 0, 15
store i32 %v_0, i32* %var_14
%v_15 = add i32 0, 16
store i32 %v_0, i32* %var_15
%v_16 = add i32 0, 17
store i32 %v_0, i32* %var_16
%v_17 = add i32 0, 18
store i32 %v_0, i32* %var_17
%v_18 = add i32 0, 19
store i32 %v_0, i32* %var_18
%v_19 = add i32 0, 20
store i32 %v_0, i32* %var_19
%v_20 = add i32 0, 21
store i32 %v_0, i32* %var_20
%v_21 = add i32 0, 22
store i32 %v_0, i32* %var_21
%v_22 = add i32 0, 23
store i32 %v_0, i32* %var_22
%v_23 = add i32 0, 24
store i32 %v_0, i32* %var_23
%v_24 = add i32 0, 25
store i32 %v_0, i32* %var_24
%v_25 = add i32 0, 26
store i32 %v_0, i32* %var_25
%v_26 = add i32 0, 27
store i32 %v_0, i32* %var_26
%v_27 = add i32 0, 28
store i32 %v_0, i32* %var_27
%v_28 = add i32 0, 29
store i32 %v_0, i32* %var_28
%v_29 = add i32 0, 30
store i32 %v_0, i32* %var_29
%v_30 = add i32 0, 31
store i32 %v_0, i32* %var_30
%v_31 = add i32 0, 32
store i32 %v_0, i32* %var_31
%v_32 = add i32 0, 33
store i32 %v_0, i32* %var_32
%v_33 = add i32 0, 34
store i32 %v_0, i32* %var_33
%v_34 = add i32 0, 35
store i32 %v_0, i32* %var_34
%v_35 = add i32 0, 36
store i32 %v_0, i32* %var_35
%v_36 = add i32 0, 37
store i32 %v_0, i32* %var_36
%v_37 = add i32 0, 38
store i32 %v_0, i32* %var_37
%v_38 = add i32 0, 39
store i32 %v_0, i32* %var_38
%v_39 = add i32 0, 40
store i32 %v_0, i32* %var_39
%v_40 = add i32 0, 41
store i32 %v_0, i32* %var_40
%v_41 = add i32 0, 42
store i32 %v_0, i32* %var_41
%v_42 = add i32 0, 43
store i32 %v_0, i32* %var_42
%v_43 = add i32 0, 44
store i32 %v_0, i32* %var_43
%v_44 = add i32 0, 45
store i32 %v_0, i32* %var_44
%v_45 = add i32 0, 46
store i32 %v_0, i32* %var_45
%v_46 = add i32 0, 47
store i32 %v_0, i32* %var_46
%v_47 = add i32 0, 48
store i32 %v_0, i32* %var_47
%v_48 = add i32 0, 49
store i32 %v_0, i32* %var_48
%v_49 = add i32 0, 50
store i32 %v_0, i32* %var_49
%v_50 = load i32, i32* %var_0
call void @printi(i32 %v_50);
%v_51 = load i32, i32* %var_1
call void @printi(i32 %v_51);
%v_52 = load i32, i32* %var_2
call void @printi(i32 %v_52);
%v_53 = load i32, i32* %var_3
call void @printi(i32 %v_53);
%v_54 = load i32, i32* %var_4
call void @printi(i32 %v_54);
%v_55 = load i32, i32* %var_5
call void @printi(i32 %v_55);
%v_56 = load i32, i32* %var_6
call void @printi(i32 %v_56);
%v_57 = load i32, i32* %var_7
call void @printi(i32 %v_57);
%v_58 = load i32, i32* %var_8
call void @printi(i32 %v_58);
%v_59 = load i32, i32* %var_9
call void @printi(i32 %v_59);
%v_60 = load i32, i32* %var_10
call void @printi(i32 %v_60);
%v_61 = load i32, i32* %var_11
call void @printi(i32 %v_61);
%v_62 = load i32, i32* %var_12
call void @printi(i32 %v_62);
%v_63 = load i32, i32* %var_13
call void @printi(i32 %v_63);
%v_64 = load i32, i32* %var_14
call void @printi(i32 %v_64);
%v_65 = load i32, i32* %var_15
call void @printi(i32 %v_65);
%v_66 = load i32, i32* %var_16
call void @printi(i32 %v_66);
%v_67 = load i32, i32* %var_17
call void @printi(i32 %v_67);
%v_68 = load i32, i32* %var_18
call void @printi(i32 %v_68);
%v_69 = load i32, i32* %var_19
call void @printi(i32 %v_69);
%v_70 = load i32, i32* %var_20
call void @printi(i32 %v_70);
%v_71 = load i32, i32* %var_21
call void @printi(i32 %v_71);
%v_72 = load i32, i32* %var_22
call void @printi(i32 %v_72);
%v_73 = load i32, i32* %var_23
call void @printi(i32 %v_73);
%v_74 = load i32, i32* %var_24
call void @printi(i32 %v_74);
%v_75 = load i32, i32* %var_25
call void @printi(i32 %v_75);
%v_76 = load i32, i32* %var_26
call void @printi(i32 %v_76);
%v_77 = load i32, i32* %var_27
call void @printi(i32 %v_77);
%v_78 = load i32, i32* %var_28
call void @printi(i32 %v_78);
%v_79 = load i32, i32* %var_29
call void @printi(i32 %v_79);
%v_80 = load i32, i32* %var_30
call void @printi(i32 %v_80);
%v_81 = load i32, i32* %var_31
call void @printi(i32 %v_81);
%v_82 = load i32, i32* %var_32
call void @printi(i32 %v_82);
%v_83 = load i32, i32* %var_33
call void @printi(i32 %v_83);
%v_84 = load i32, i32* %var_34
call void @printi(i32 %v_84);
%v_85 = load i32, i32* %var_35
call void @printi(i32 %v_85);
%v_86 = load i32, i32* %var_36
call void @printi(i32 %v_86);
%v_87 = load i32, i32* %var_37
call void @printi(i32 %v_87);
%v_88 = load i32, i32* %var_38
call void @printi(i32 %v_88);
%v_89 = load i32, i32* %var_39
call void @printi(i32 %v_89);
%v_90 = load i32, i32* %var_40
call void @printi(i32 %v_90);
%v_91 = load i32, i32* %var_41
call void @printi(i32 %v_91);
%v_92 = load i32, i32* %var_42
call void @printi(i32 %v_92);
%v_93 = load i32, i32* %var_43
call void @printi(i32 %v_93);
%v_94 = load i32, i32* %var_44
call void @printi(i32 %v_94);
%v_95 = load i32, i32* %var_45
call void @printi(i32 %v_95);
%v_96 = load i32, i32* %var_46
call void @printi(i32 %v_96);
%v_97 = load i32, i32* %var_47
call void @printi(i32 %v_97);
%v_98 = load i32, i32* %var_48
call void @printi(i32 %v_98);
%v_99 = load i32, i32* %var_49
call void @printi(i32 %v_99);
ret i32 0
}
