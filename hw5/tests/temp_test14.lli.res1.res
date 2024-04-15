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
@.v_0 = private unnamed_addr constant [17 x i8] c"TIC TAC TOE GAME\00"
@.v_14 = private unnamed_addr constant [98 x i8] c"Ignore the leading 1, 0 represents an empty cell, 8 represents player 1 and 4 represents player 2\00"
@.v_115 = private unnamed_addr constant [48 x i8] c"Enter your play, board is numbered like a phone\00"
@.v_121 = private unnamed_addr constant [28 x i8] c"ERROR, SHOULD NEVER HAPPEN!\00"
@.v_158 = private unnamed_addr constant [28 x i8] c"ERROR, SHOULD NEVER HAPPEN!\00"
@.v_164 = private unnamed_addr constant [28 x i8] c"ERROR, SHOULD NEVER HAPPEN!\00"
@.v_210 = private unnamed_addr constant [78 x i8] c"Someone won!! congrats to the winner and suck it to the loser. the winner is:\00"
@.v_214 = private unnamed_addr constant [2 x i8] c" \00"
@.v_254 = private unnamed_addr constant [21 x i8] c"Again the winner is:\00"
@.v_294 = private unnamed_addr constant [13 x i8] c"Its a tie :<\00"
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
call void (i8*) @print(i8* getelementptr ([ 17 x i8], [17 x i8]* @.v_0, i32 0, i32 0))
br label %label_2
label_2:
br label %label_4
label_3:
br label %label_4
label_4:
%v_1 = phi i32 [1, %label_2], [0, %label_3]
store i32 %v_1, i32* %var_0
%v_2 = add i32 0, 0
store i32 %v_2, i32* %var_1
%v_3 = add i32 0, 0
store i32 %v_3, i32* %var_2
%v_4 = add i32 0, 0
store i32 %v_4, i32* %var_3
%v_5 = add i32 0, 0
store i32 %v_5, i32* %var_4
%v_6 = add i32 0, 0
store i32 %v_6, i32* %var_5
%v_7 = add i32 0, 0
store i32 %v_7, i32* %var_6
%v_8 = add i32 0, 0
store i32 %v_8, i32* %var_7
%v_9 = add i32 0, 0
store i32 %v_9, i32* %var_8
%v_10 = add i32 0, 0
store i32 %v_10, i32* %var_9
%v_11 = add i32 0, 8
store i32 %v_11, i32* %var_10
br label %label_5
label_5:
%v_12 = load i32, i32* %var_0
%v_13 = icmp eq i32 %v_12, 1
br i1 %v_13, label %label_6, label %label_7
label_6:
call void (i8*) @print(i8* getelementptr ([ 98 x i8], [98 x i8]* @.v_14, i32 0, i32 0))
%v_15 = add i32 0, 1000
%v_16 = add i32 0, 100
%v_17 = load i32, i32* %var_1
%v_18 = mul i32 %v_16, %v_17
%v_19 = add i32 %v_15, %v_18
%v_20 = add i32 0, 10
%v_21 = load i32, i32* %var_2
%v_22 = mul i32 %v_20, %v_21
%v_23 = add i32 %v_19, %v_22
%v_24 = add i32 0, 1
%v_25 = load i32, i32* %var_3
%v_26 = mul i32 %v_24, %v_25
%v_27 = add i32 %v_23, %v_26
call void @printi(i32 %v_27);
%v_28 = add i32 0, 1000
%v_29 = add i32 0, 100
%v_30 = load i32, i32* %var_4
%v_31 = mul i32 %v_29, %v_30
%v_32 = add i32 %v_28, %v_31
%v_33 = add i32 0, 10
%v_34 = load i32, i32* %var_5
%v_35 = mul i32 %v_33, %v_34
%v_36 = add i32 %v_32, %v_35
%v_37 = add i32 0, 1
%v_38 = load i32, i32* %var_6
%v_39 = mul i32 %v_37, %v_38
%v_40 = add i32 %v_36, %v_39
call void @printi(i32 %v_40);
%v_41 = add i32 0, 1000
%v_42 = add i32 0, 100
%v_43 = load i32, i32* %var_7
%v_44 = mul i32 %v_42, %v_43
%v_45 = add i32 %v_41, %v_44
%v_46 = add i32 0, 10
%v_47 = load i32, i32* %var_8
%v_48 = mul i32 %v_46, %v_47
%v_49 = add i32 %v_45, %v_48
%v_50 = add i32 0, 1
%v_51 = load i32, i32* %var_9
%v_52 = mul i32 %v_50, %v_51
%v_53 = add i32 %v_49, %v_52
call void @printi(i32 %v_53);
%v_54 = add i32 0, 0
store i32 %v_54, i32* %var_11
br label %label_8
label_8:
%v_55 = load i32, i32* %var_11
%v_56 = add i32 0, 0
%v_57 = icmp sle i32 %v_55, %v_56
br i1 %v_57, label %label_9, label %label_10
label_10:
%v_58 = load i32, i32* %var_11
%v_59 = add i32 0, 9
%v_60 = icmp sgt i32 %v_58, %v_59
br i1 %v_60, label %label_11, label %label_12
label_9:
br label %label_11
label_12:
%v_61 = load i32, i32* %var_11
%v_62 = add i32 0, 1
%v_63 = icmp eq i32 %v_61, %v_62
br i1 %v_63, label %label_13, label %label_14
br label %label_13
label_13:
%v_64 = load i32, i32* %var_1
%v_65 = add i32 0, 0
%v_66 = icmp ne i32 %v_64, %v_65
br i1 %v_66, label %label_15, label %label_16
br label %label_14
label_14:
br label %label_16
label_11:
br label %label_15
label_16:
%v_67 = load i32, i32* %var_11
%v_68 = add i32 0, 2
%v_69 = icmp eq i32 %v_67, %v_68
br i1 %v_69, label %label_17, label %label_18
br label %label_17
label_17:
%v_70 = load i32, i32* %var_2
%v_71 = add i32 0, 0
%v_72 = icmp ne i32 %v_70, %v_71
br i1 %v_72, label %label_19, label %label_20
br label %label_18
label_18:
br label %label_20
label_15:
br label %label_19
label_20:
%v_73 = load i32, i32* %var_11
%v_74 = add i32 0, 3
%v_75 = icmp eq i32 %v_73, %v_74
br i1 %v_75, label %label_21, label %label_22
br label %label_21
label_21:
%v_76 = load i32, i32* %var_3
%v_77 = add i32 0, 0
%v_78 = icmp ne i32 %v_76, %v_77
br i1 %v_78, label %label_23, label %label_24
br label %label_22
label_22:
br label %label_24
label_19:
br label %label_23
label_24:
%v_79 = load i32, i32* %var_11
%v_80 = add i32 0, 4
%v_81 = icmp eq i32 %v_79, %v_80
br i1 %v_81, label %label_25, label %label_26
br label %label_25
label_25:
%v_82 = load i32, i32* %var_4
%v_83 = add i32 0, 0
%v_84 = icmp ne i32 %v_82, %v_83
br i1 %v_84, label %label_27, label %label_28
br label %label_26
label_26:
br label %label_28
label_23:
br label %label_27
label_28:
%v_85 = load i32, i32* %var_11
%v_86 = add i32 0, 5
%v_87 = icmp eq i32 %v_85, %v_86
br i1 %v_87, label %label_29, label %label_30
br label %label_29
label_29:
%v_88 = load i32, i32* %var_5
%v_89 = add i32 0, 0
%v_90 = icmp ne i32 %v_88, %v_89
br i1 %v_90, label %label_31, label %label_32
br label %label_30
label_30:
br label %label_32
label_27:
br label %label_31
label_32:
%v_91 = load i32, i32* %var_11
%v_92 = add i32 0, 6
%v_93 = icmp eq i32 %v_91, %v_92
br i1 %v_93, label %label_33, label %label_34
br label %label_33
label_33:
%v_94 = load i32, i32* %var_6
%v_95 = add i32 0, 0
%v_96 = icmp ne i32 %v_94, %v_95
br i1 %v_96, label %label_35, label %label_36
br label %label_34
label_34:
br label %label_36
label_31:
br label %label_35
label_36:
%v_97 = load i32, i32* %var_11
%v_98 = add i32 0, 7
%v_99 = icmp eq i32 %v_97, %v_98
br i1 %v_99, label %label_37, label %label_38
br label %label_37
label_37:
%v_100 = load i32, i32* %var_7
%v_101 = add i32 0, 0
%v_102 = icmp ne i32 %v_100, %v_101
br i1 %v_102, label %label_39, label %label_40
br label %label_38
label_38:
br label %label_40
label_35:
br label %label_39
label_40:
%v_103 = load i32, i32* %var_11
%v_104 = add i32 0, 8
%v_105 = icmp eq i32 %v_103, %v_104
br i1 %v_105, label %label_41, label %label_42
br label %label_41
label_41:
%v_106 = load i32, i32* %var_8
%v_107 = add i32 0, 0
%v_108 = icmp ne i32 %v_106, %v_107
br i1 %v_108, label %label_43, label %label_44
br label %label_42
label_42:
br label %label_44
label_39:
br label %label_43
label_44:
%v_109 = load i32, i32* %var_11
%v_110 = add i32 0, 9
%v_111 = icmp eq i32 %v_109, %v_110
br i1 %v_111, label %label_45, label %label_46
br label %label_45
label_45:
%v_112 = load i32, i32* %var_9
%v_113 = add i32 0, 0
%v_114 = icmp ne i32 %v_112, %v_113
br i1 %v_114, label %label_47, label %label_48
br label %label_46
label_46:
br label %label_48
label_43:
br label %label_47
label_47:
call void (i8*) @print(i8* getelementptr ([ 48 x i8], [48 x i8]* @.v_115, i32 0, i32 0))
%v_116 = add i32 0, 123
call void @printi(i32 %v_116);
%v_117 = add i32 0, 456
call void @printi(i32 %v_117);
%v_118 = add i32 0, 789
call void @printi(i32 %v_118);
%v_119 = add i32 0, 0
%v_120 = call i32 @readi(i32 0);
store i32 %v_120, i32* %var_11
br label %label_8
label_48:
br label %label_50
br label %label_49
label_49:
call void (i8*) @print(i8* getelementptr ([ 28 x i8], [28 x i8]* @.v_121, i32 0, i32 0))
br label %label_51
br label %label_50
label_50:
%v_122 = load i32, i32* %var_11
%v_123 = add i32 0, 1
%v_124 = icmp eq i32 %v_122, %v_123
br i1 %v_124, label %label_52, label %label_53
br label %label_52
label_52:
%v_125 = load i32, i32* %var_10
store i32 %v_125, i32* %var_1
br label %label_54
br label %label_53
label_53:
%v_126 = load i32, i32* %var_11
%v_127 = add i32 0, 2
%v_128 = icmp eq i32 %v_126, %v_127
br i1 %v_128, label %label_55, label %label_56
br label %label_55
label_55:
%v_129 = load i32, i32* %var_10
store i32 %v_129, i32* %var_2
br label %label_57
br label %label_56
label_56:
%v_130 = load i32, i32* %var_11
%v_131 = add i32 0, 3
%v_132 = icmp eq i32 %v_130, %v_131
br i1 %v_132, label %label_58, label %label_59
br label %label_58
label_58:
%v_133 = load i32, i32* %var_10
store i32 %v_133, i32* %var_3
br label %label_60
br label %label_59
label_59:
%v_134 = load i32, i32* %var_11
%v_135 = add i32 0, 4
%v_136 = icmp eq i32 %v_134, %v_135
br i1 %v_136, label %label_61, label %label_62
br label %label_61
label_61:
%v_137 = load i32, i32* %var_10
store i32 %v_137, i32* %var_4
br label %label_63
br label %label_62
label_62:
%v_138 = load i32, i32* %var_11
%v_139 = add i32 0, 5
%v_140 = icmp eq i32 %v_138, %v_139
br i1 %v_140, label %label_64, label %label_65
br label %label_64
label_64:
%v_141 = load i32, i32* %var_10
store i32 %v_141, i32* %var_5
br label %label_66
br label %label_65
label_65:
%v_142 = load i32, i32* %var_11
%v_143 = add i32 0, 6
%v_144 = icmp eq i32 %v_142, %v_143
br i1 %v_144, label %label_67, label %label_68
br label %label_67
label_67:
%v_145 = load i32, i32* %var_10
store i32 %v_145, i32* %var_6
br label %label_69
br label %label_68
label_68:
%v_146 = load i32, i32* %var_11
%v_147 = add i32 0, 7
%v_148 = icmp eq i32 %v_146, %v_147
br i1 %v_148, label %label_70, label %label_71
br label %label_70
label_70:
%v_149 = load i32, i32* %var_10
store i32 %v_149, i32* %var_7
br label %label_72
br label %label_71
label_71:
%v_150 = load i32, i32* %var_11
%v_151 = add i32 0, 8
%v_152 = icmp eq i32 %v_150, %v_151
br i1 %v_152, label %label_73, label %label_74
br label %label_73
label_73:
%v_153 = load i32, i32* %var_10
store i32 %v_153, i32* %var_8
br label %label_75
br label %label_74
label_74:
%v_154 = load i32, i32* %var_11
%v_155 = add i32 0, 9
%v_156 = icmp eq i32 %v_154, %v_155
br i1 %v_156, label %label_76, label %label_77
br label %label_76
label_76:
%v_157 = load i32, i32* %var_10
store i32 %v_157, i32* %var_9
br label %label_78
br label %label_77
label_77:
call void (i8*) @print(i8* getelementptr ([ 28 x i8], [28 x i8]* @.v_158, i32 0, i32 0))
br label %label_78
label_78:
br label %label_75
label_75:
br label %label_72
label_72:
br label %label_69
label_69:
br label %label_66
label_66:
br label %label_63
label_63:
br label %label_60
label_60:
br label %label_57
label_57:
br label %label_54
label_54:
br label %label_51
label_51:
%v_159 = add i32 0, 32
%v_160 = load i32, i32* %var_10
%v_162 = icmp eq i32 %v_160, 0
br i1 %v_162, label %label_79, label %label_80
label_79:
call void (i8*) @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zerror, i32 0, i32 0))
call void @exit(i32 0)
br label %label_80
label_80:
%v_161 = sdiv i32 %v_159, %v_160
store i32 %v_161, i32* %var_10
%v_163 = add i32 0, 0
store i32 %v_163, i32* %var_12
br label %label_82
br label %label_81
label_81:
call void (i8*) @print(i8* getelementptr ([ 28 x i8], [28 x i8]* @.v_164, i32 0, i32 0))
br label %label_83
br label %label_82
label_82:
%v_165 = load i32, i32* %var_1
%v_166 = load i32, i32* %var_2
%v_167 = icmp eq i32 %v_165, %v_166
br i1 %v_167, label %label_84, label %label_85
br label %label_84
label_84:
%v_168 = load i32, i32* %var_1
%v_169 = load i32, i32* %var_3
%v_170 = icmp eq i32 %v_168, %v_169
br i1 %v_170, label %label_86, label %label_87
br label %label_85
label_85:
br label %label_87
br label %label_86
label_86:
%v_171 = load i32, i32* %var_1
store i32 %v_171, i32* %var_12
br label %label_88
br label %label_87
label_87:
%v_172 = load i32, i32* %var_1
%v_173 = load i32, i32* %var_4
%v_174 = icmp eq i32 %v_172, %v_173
br i1 %v_174, label %label_89, label %label_90
br label %label_89
label_89:
%v_175 = load i32, i32* %var_1
%v_176 = load i32, i32* %var_7
%v_177 = icmp eq i32 %v_175, %v_176
br i1 %v_177, label %label_91, label %label_92
br label %label_90
label_90:
br label %label_92
br label %label_91
label_91:
%v_178 = load i32, i32* %var_1
store i32 %v_178, i32* %var_12
br label %label_93
br label %label_92
label_92:
%v_179 = load i32, i32* %var_1
%v_180 = load i32, i32* %var_5
%v_181 = icmp eq i32 %v_179, %v_180
br i1 %v_181, label %label_94, label %label_95
br label %label_94
label_94:
%v_182 = load i32, i32* %var_1
%v_183 = load i32, i32* %var_9
%v_184 = icmp eq i32 %v_182, %v_183
br i1 %v_184, label %label_96, label %label_97
br label %label_95
label_95:
br label %label_97
br label %label_96
label_96:
%v_185 = load i32, i32* %var_1
store i32 %v_185, i32* %var_12
br label %label_98
br label %label_97
label_97:
%v_186 = load i32, i32* %var_3
%v_187 = load i32, i32* %var_5
%v_188 = icmp eq i32 %v_186, %v_187
br i1 %v_188, label %label_99, label %label_100
br label %label_99
label_99:
%v_189 = load i32, i32* %var_3
%v_190 = load i32, i32* %var_7
%v_191 = icmp eq i32 %v_189, %v_190
br i1 %v_191, label %label_101, label %label_102
br label %label_100
label_100:
br label %label_102
br label %label_101
label_101:
%v_192 = load i32, i32* %var_3
store i32 %v_192, i32* %var_12
br label %label_103
br label %label_102
label_102:
%v_193 = load i32, i32* %var_3
%v_194 = load i32, i32* %var_6
%v_195 = icmp eq i32 %v_193, %v_194
br i1 %v_195, label %label_104, label %label_105
br label %label_104
label_104:
%v_196 = load i32, i32* %var_3
%v_197 = load i32, i32* %var_9
%v_198 = icmp eq i32 %v_196, %v_197
br i1 %v_198, label %label_106, label %label_107
br label %label_105
label_105:
br label %label_107
br label %label_106
label_106:
%v_199 = load i32, i32* %var_3
store i32 %v_199, i32* %var_12
br label %label_108
br label %label_107
label_107:
%v_200 = load i32, i32* %var_7
%v_201 = load i32, i32* %var_8
%v_202 = icmp eq i32 %v_200, %v_201
br i1 %v_202, label %label_109, label %label_110
br label %label_109
label_109:
%v_203 = load i32, i32* %var_7
%v_204 = load i32, i32* %var_9
%v_205 = icmp eq i32 %v_203, %v_204
br i1 %v_205, label %label_111, label %label_112
br label %label_110
label_110:
br label %label_112
br label %label_111
label_111:
%v_206 = load i32, i32* %var_7
store i32 %v_206, i32* %var_12
br label %label_112
label_112:
br label %label_108
label_108:
br label %label_103
label_103:
br label %label_98
label_98:
br label %label_93
label_93:
br label %label_88
label_88:
br label %label_83
label_83:
%v_207 = load i32, i32* %var_12
%v_208 = add i32 0, 0
%v_209 = icmp sgt i32 %v_207, %v_208
br i1 %v_209, label %label_113, label %label_114
br label %label_113
label_113:
call void (i8*) @print(i8* getelementptr ([ 78 x i8], [78 x i8]* @.v_210, i32 0, i32 0))
%v_211 = load i32, i32* %var_12
%v_212 = add i32 0, 1111
%v_213 = mul i32 %v_211, %v_212
call void @printi(i32 %v_213);
call void (i8*) @print(i8* getelementptr ([ 2 x i8], [2 x i8]* @.v_214, i32 0, i32 0))
%v_215 = add i32 0, 1000
%v_216 = add i32 0, 100
%v_217 = load i32, i32* %var_1
%v_218 = mul i32 %v_216, %v_217
%v_219 = add i32 %v_215, %v_218
%v_220 = add i32 0, 10
%v_221 = load i32, i32* %var_2
%v_222 = mul i32 %v_220, %v_221
%v_223 = add i32 %v_219, %v_222
%v_224 = add i32 0, 1
%v_225 = load i32, i32* %var_3
%v_226 = mul i32 %v_224, %v_225
%v_227 = add i32 %v_223, %v_226
call void @printi(i32 %v_227);
%v_228 = add i32 0, 1000
%v_229 = add i32 0, 100
%v_230 = load i32, i32* %var_4
%v_231 = mul i32 %v_229, %v_230
%v_232 = add i32 %v_228, %v_231
%v_233 = add i32 0, 10
%v_234 = load i32, i32* %var_5
%v_235 = mul i32 %v_233, %v_234
%v_236 = add i32 %v_232, %v_235
%v_237 = add i32 0, 1
%v_238 = load i32, i32* %var_6
%v_239 = mul i32 %v_237, %v_238
%v_240 = add i32 %v_236, %v_239
call void @printi(i32 %v_240);
%v_241 = add i32 0, 1000
%v_242 = add i32 0, 100
%v_243 = load i32, i32* %var_7
%v_244 = mul i32 %v_242, %v_243
%v_245 = add i32 %v_241, %v_244
%v_246 = add i32 0, 10
%v_247 = load i32, i32* %var_8
%v_248 = mul i32 %v_246, %v_247
%v_249 = add i32 %v_245, %v_248
%v_250 = add i32 0, 1
%v_251 = load i32, i32* %var_9
%v_252 = mul i32 %v_250, %v_251
%v_253 = add i32 %v_249, %v_252
call void @printi(i32 %v_253);
call void (i8*) @print(i8* getelementptr ([ 21 x i8], [21 x i8]* @.v_254, i32 0, i32 0))
%v_255 = load i32, i32* %var_12
%v_256 = add i32 0, 1111
%v_257 = mul i32 %v_255, %v_256
call void @printi(i32 %v_257);
br label %label_116
label_115:
br label %label_117
label_116:
br label %label_117
label_117:
%v_258 = phi i32 [1, %label_115], [0, %label_116]
store i32 %v_258, i32* %var_0
br label %label_118
br label %label_114
label_114:
%v_259 = load i32, i32* %var_1
%v_260 = load i32, i32* %var_2
%v_261 = add i32 %v_259, %v_260
%v_262 = load i32, i32* %var_3
%v_263 = add i32 %v_261, %v_262
%v_264 = load i32, i32* %var_4
%v_265 = add i32 %v_263, %v_264
%v_266 = load i32, i32* %var_5
%v_267 = add i32 %v_265, %v_266
%v_268 = load i32, i32* %var_6
%v_269 = add i32 %v_267, %v_268
%v_270 = load i32, i32* %var_7
%v_271 = add i32 %v_269, %v_270
%v_272 = load i32, i32* %var_8
%v_273 = add i32 %v_271, %v_272
%v_274 = load i32, i32* %var_9
%v_275 = add i32 %v_273, %v_274
%v_276 = add i32 0, 8
%v_277 = add i32 0, 4
%v_278 = add i32 %v_276, %v_277
%v_279 = add i32 0, 8
%v_280 = add i32 %v_278, %v_279
%v_281 = add i32 0, 4
%v_282 = add i32 %v_280, %v_281
%v_283 = add i32 0, 8
%v_284 = add i32 %v_282, %v_283
%v_285 = add i32 0, 4
%v_286 = add i32 %v_284, %v_285
%v_287 = add i32 0, 8
%v_288 = add i32 %v_286, %v_287
%v_289 = add i32 0, 4
%v_290 = add i32 %v_288, %v_289
%v_291 = add i32 0, 8
%v_292 = add i32 %v_290, %v_291
%v_293 = icmp eq i32 %v_275, %v_292
br i1 %v_293, label %label_119, label %label_120
br label %label_119
label_119:
call void (i8*) @print(i8* getelementptr ([ 13 x i8], [13 x i8]* @.v_294, i32 0, i32 0))
%v_295 = add i32 0, 1000
%v_296 = add i32 0, 100
%v_297 = load i32, i32* %var_1
%v_298 = mul i32 %v_296, %v_297
%v_299 = add i32 %v_295, %v_298
%v_300 = add i32 0, 10
%v_301 = load i32, i32* %var_2
%v_302 = mul i32 %v_300, %v_301
%v_303 = add i32 %v_299, %v_302
%v_304 = add i32 0, 1
%v_305 = load i32, i32* %var_3
%v_306 = mul i32 %v_304, %v_305
%v_307 = add i32 %v_303, %v_306
call void @printi(i32 %v_307);
%v_308 = add i32 0, 1000
%v_309 = add i32 0, 100
%v_310 = load i32, i32* %var_4
%v_311 = mul i32 %v_309, %v_310
%v_312 = add i32 %v_308, %v_311
%v_313 = add i32 0, 10
%v_314 = load i32, i32* %var_5
%v_315 = mul i32 %v_313, %v_314
%v_316 = add i32 %v_312, %v_315
%v_317 = add i32 0, 1
%v_318 = load i32, i32* %var_6
%v_319 = mul i32 %v_317, %v_318
%v_320 = add i32 %v_316, %v_319
call void @printi(i32 %v_320);
%v_321 = add i32 0, 1000
%v_322 = add i32 0, 100
%v_323 = load i32, i32* %var_7
%v_324 = mul i32 %v_322, %v_323
%v_325 = add i32 %v_321, %v_324
%v_326 = add i32 0, 10
%v_327 = load i32, i32* %var_8
%v_328 = mul i32 %v_326, %v_327
%v_329 = add i32 %v_325, %v_328
%v_330 = add i32 0, 1
%v_331 = load i32, i32* %var_9
%v_332 = mul i32 %v_330, %v_331
%v_333 = add i32 %v_329, %v_332
call void @printi(i32 %v_333);
br label %label_122
label_121:
br label %label_123
label_122:
br label %label_123
label_123:
%v_334 = phi i32 [1, %label_121], [0, %label_122]
store i32 %v_334, i32* %var_0
br label %label_120
label_120:
br label %label_118
label_118:
br label %label_5
label_7:
ret i32 0
}
