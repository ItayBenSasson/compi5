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
%v_0 = add i32 0, 3
%v_1 = add i32 0, 3
%v_2 = add i32 %v_0, %v_1
call void @printi(i32 %v_2);
%v_3 = add i32 0, 3
%v_4 = add i32 0, 3
%v_5 = sub i32 %v_3, %v_4
call void @printi(i32 %v_5);
%v_6 = add i32 0, 3
%v_7 = add i32 0, 3
%v_8 = mul i32 %v_6, %v_7
call void @printi(i32 %v_8);
%v_9 = add i32 0, 3
%v_10 = add i32 0, 3
%v_12 = icmp eq i32 %v_10, 0
br i1 %v_12, label %label_2, label %label_3
label_2:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_3
label_3:
%v_11 = sdiv i32 %v_9, %v_10
call void @printi(i32 %v_11);
%v_13 = add i32 0, 3
%v_14 = add i32 0, 3
%v_15 = add i32 0, 2
%v_16 = mul i32 %v_14, %v_15
%v_17 = add i32 %v_13, %v_16
call void @printi(i32 %v_17);
%v_18 = add i32 0, 3
%v_19 = add i32 0, 2
%v_20 = add i32 0, 3
%v_21 = mul i32 %v_19, %v_20
%v_22 = sub i32 %v_18, %v_21
call void @printi(i32 %v_22);
%v_23 = add i32 0, 3
%v_24 = add i32 0, 3
%v_25 = mul i32 %v_23, %v_24
%v_26 = add i32 0, 1
%v_28 = icmp eq i32 %v_26, 0
br i1 %v_28, label %label_4, label %label_5
label_4:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_5
label_5:
%v_27 = sdiv i32 %v_25, %v_26
call void @printi(i32 %v_27);
%v_29 = add i32 0, 3
%v_30 = add i32 0, 3
%v_31 = add i32 0, 2
%v_32 = mul i32 %v_30, %v_31
%v_33 = add i32 %v_29, %v_32
call void @printi(i32 %v_33);
%v_34 = add i32 0, 3
%v_35 = add i32 0, 2
%v_36 = add i32 0, 3
%v_37 = mul i32 %v_35, %v_36
%v_38 = sub i32 %v_34, %v_37
call void @printi(i32 %v_38);
%v_39 = add i32 0, 3
%v_40 = add i32 0, 3
%v_41 = mul i32 %v_39, %v_40
%v_42 = add i32 0, 3
%v_43 = add i32 0, 1
%v_45 = icmp eq i32 %v_43, 0
br i1 %v_45, label %label_6, label %label_7
label_6:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_7
label_7:
%v_44 = sdiv i32 %v_42, %v_43
%v_46 = add i32 %v_41, %v_44
%v_47 = add i32 0, 2
%v_48 = add i32 0, 3
%v_49 = mul i32 %v_47, %v_48
%v_50 = add i32 0, 2
%v_52 = icmp eq i32 %v_50, 0
br i1 %v_52, label %label_8, label %label_9
label_8:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_9
label_9:
%v_51 = sdiv i32 %v_49, %v_50
%v_53 = sub i32 %v_46, %v_51
call void @printi(i32 %v_53);
ret i32 0
}
