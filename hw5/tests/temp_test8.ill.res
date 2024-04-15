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
@.v_0 = private unnamed_addr constant [75 x i8] c"toruth tabel for ((a and b) or (c and d)) for (a,b,c,d) in {false, true}^4\00"
@.v_33 = private unnamed_addr constant [86 x i8] c"toruth tabel for ((a or not b) and not (not c or d)) for (a,b,c,d) in {false, true}^4\00"
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
call void (i8*) @print(i8* getelementptr ([ 75 x i8], [75 x i8]* @.v_0, i32 0, i32 0))
br label %label_3
br label %label_2
label_2:
br label %label_5
br label %label_3
label_3:
br label %label_5
label_5:
br label %label_7
br label %label_6
label_6:
br label %label_9
br label %label_7
label_7:
br label %label_9
label_4:
br label %label_8
br label %label_8
label_8:
%v_1 = add i32 0, 1
call void @printi(i32 %v_1);
br label %label_10
br label %label_9
label_9:
%v_2 = add i32 0, 0
call void @printi(i32 %v_2);
br label %label_10
label_10:
br label %label_12
br label %label_11
label_11:
br label %label_14
br label %label_12
label_12:
br label %label_14
label_14:
br label %label_16
br label %label_15
label_15:
br label %label_17
br label %label_16
label_16:
br label %label_18
label_13:
br label %label_17
br label %label_17
label_17:
%v_3 = add i32 0, 1
call void @printi(i32 %v_3);
br label %label_19
br label %label_18
label_18:
%v_4 = add i32 0, 0
call void @printi(i32 %v_4);
br label %label_19
label_19:
br label %label_21
br label %label_20
label_20:
br label %label_23
br label %label_21
label_21:
br label %label_23
label_23:
br label %label_24
br label %label_24
label_24:
br label %label_27
br label %label_25
label_25:
br label %label_27
label_22:
br label %label_26
br label %label_26
label_26:
%v_5 = add i32 0, 1
call void @printi(i32 %v_5);
br label %label_28
br label %label_27
label_27:
%v_6 = add i32 0, 0
call void @printi(i32 %v_6);
br label %label_28
label_28:
br label %label_30
br label %label_29
label_29:
br label %label_32
br label %label_30
label_30:
br label %label_32
label_32:
br label %label_33
br label %label_33
label_33:
br label %label_35
br label %label_34
label_34:
br label %label_36
label_31:
br label %label_35
br label %label_35
label_35:
%v_7 = add i32 0, 1
call void @printi(i32 %v_7);
br label %label_37
br label %label_36
label_36:
%v_8 = add i32 0, 0
call void @printi(i32 %v_8);
br label %label_37
label_37:
br label %label_39
br label %label_38
label_38:
br label %label_40
br label %label_39
label_39:
br label %label_41
label_41:
br label %label_43
br label %label_42
label_42:
br label %label_45
br label %label_43
label_43:
br label %label_45
label_40:
br label %label_44
br label %label_44
label_44:
%v_9 = add i32 0, 1
call void @printi(i32 %v_9);
br label %label_46
br label %label_45
label_45:
%v_10 = add i32 0, 0
call void @printi(i32 %v_10);
br label %label_46
label_46:
br label %label_48
br label %label_47
label_47:
br label %label_49
br label %label_48
label_48:
br label %label_50
label_50:
br label %label_52
br label %label_51
label_51:
br label %label_53
br label %label_52
label_52:
br label %label_54
label_49:
br label %label_53
br label %label_53
label_53:
%v_11 = add i32 0, 1
call void @printi(i32 %v_11);
br label %label_55
br label %label_54
label_54:
%v_12 = add i32 0, 0
call void @printi(i32 %v_12);
br label %label_55
label_55:
br label %label_57
br label %label_56
label_56:
br label %label_58
br label %label_57
label_57:
br label %label_59
label_59:
br label %label_60
br label %label_60
label_60:
br label %label_63
br label %label_61
label_61:
br label %label_63
label_58:
br label %label_62
br label %label_62
label_62:
%v_13 = add i32 0, 1
call void @printi(i32 %v_13);
br label %label_64
br label %label_63
label_63:
%v_14 = add i32 0, 0
call void @printi(i32 %v_14);
br label %label_64
label_64:
br label %label_66
br label %label_65
label_65:
br label %label_67
br label %label_66
label_66:
br label %label_68
label_68:
br label %label_69
br label %label_69
label_69:
br label %label_71
br label %label_70
label_70:
br label %label_72
label_67:
br label %label_71
br label %label_71
label_71:
%v_15 = add i32 0, 1
call void @printi(i32 %v_15);
br label %label_73
br label %label_72
label_72:
%v_16 = add i32 0, 0
call void @printi(i32 %v_16);
br label %label_73
label_73:
br label %label_74
br label %label_74
label_74:
br label %label_77
br label %label_75
label_75:
br label %label_77
label_77:
br label %label_79
br label %label_78
label_78:
br label %label_81
br label %label_79
label_79:
br label %label_81
label_76:
br label %label_80
br label %label_80
label_80:
%v_17 = add i32 0, 1
call void @printi(i32 %v_17);
br label %label_82
br label %label_81
label_81:
%v_18 = add i32 0, 0
call void @printi(i32 %v_18);
br label %label_82
label_82:
br label %label_83
br label %label_83
label_83:
br label %label_86
br label %label_84
label_84:
br label %label_86
label_86:
br label %label_88
br label %label_87
label_87:
br label %label_89
br label %label_88
label_88:
br label %label_90
label_85:
br label %label_89
br label %label_89
label_89:
%v_19 = add i32 0, 1
call void @printi(i32 %v_19);
br label %label_91
br label %label_90
label_90:
%v_20 = add i32 0, 0
call void @printi(i32 %v_20);
br label %label_91
label_91:
br label %label_92
br label %label_92
label_92:
br label %label_95
br label %label_93
label_93:
br label %label_95
label_95:
br label %label_96
br label %label_96
label_96:
br label %label_99
br label %label_97
label_97:
br label %label_99
label_94:
br label %label_98
br label %label_98
label_98:
%v_21 = add i32 0, 1
call void @printi(i32 %v_21);
br label %label_100
br label %label_99
label_99:
%v_22 = add i32 0, 0
call void @printi(i32 %v_22);
br label %label_100
label_100:
br label %label_101
br label %label_101
label_101:
br label %label_104
br label %label_102
label_102:
br label %label_104
label_104:
br label %label_105
br label %label_105
label_105:
br label %label_107
br label %label_106
label_106:
br label %label_108
label_103:
br label %label_107
br label %label_107
label_107:
%v_23 = add i32 0, 1
call void @printi(i32 %v_23);
br label %label_109
br label %label_108
label_108:
%v_24 = add i32 0, 0
call void @printi(i32 %v_24);
br label %label_109
label_109:
br label %label_110
br label %label_110
label_110:
br label %label_112
br label %label_111
label_111:
br label %label_113
label_113:
br label %label_115
br label %label_114
label_114:
br label %label_117
br label %label_115
label_115:
br label %label_117
label_112:
br label %label_116
br label %label_116
label_116:
%v_25 = add i32 0, 1
call void @printi(i32 %v_25);
br label %label_118
br label %label_117
label_117:
%v_26 = add i32 0, 0
call void @printi(i32 %v_26);
br label %label_118
label_118:
br label %label_119
br label %label_119
label_119:
br label %label_121
br label %label_120
label_120:
br label %label_122
label_122:
br label %label_124
br label %label_123
label_123:
br label %label_125
br label %label_124
label_124:
br label %label_126
label_121:
br label %label_125
br label %label_125
label_125:
%v_27 = add i32 0, 1
call void @printi(i32 %v_27);
br label %label_127
br label %label_126
label_126:
%v_28 = add i32 0, 0
call void @printi(i32 %v_28);
br label %label_127
label_127:
br label %label_128
br label %label_128
label_128:
br label %label_130
br label %label_129
label_129:
br label %label_131
label_131:
br label %label_132
br label %label_132
label_132:
br label %label_135
br label %label_133
label_133:
br label %label_135
label_130:
br label %label_134
br label %label_134
label_134:
%v_29 = add i32 0, 1
call void @printi(i32 %v_29);
br label %label_136
br label %label_135
label_135:
%v_30 = add i32 0, 0
call void @printi(i32 %v_30);
br label %label_136
label_136:
br label %label_137
br label %label_137
label_137:
br label %label_139
br label %label_138
label_138:
br label %label_140
label_140:
br label %label_141
br label %label_141
label_141:
br label %label_143
br label %label_142
label_142:
br label %label_144
label_139:
br label %label_143
br label %label_143
label_143:
%v_31 = add i32 0, 1
call void @printi(i32 %v_31);
br label %label_145
br label %label_144
label_144:
%v_32 = add i32 0, 0
call void @printi(i32 %v_32);
br label %label_145
label_145:
call void (i8*) @print(i8* getelementptr ([ 86 x i8], [86 x i8]* @.v_33, i32 0, i32 0))
br label %label_147
label_147:
br label %label_149
label_146:
br label %label_149
br label %label_149
label_149:
br label %label_151
label_150:
br label %label_153
label_151:
br label %label_152
br label %label_148
label_148:
br label %label_152
br label %label_153
label_153:
%v_34 = add i32 0, 1
call void @printi(i32 %v_34);
br label %label_154
br label %label_152
label_152:
%v_35 = add i32 0, 0
call void @printi(i32 %v_35);
br label %label_154
label_154:
br label %label_156
label_156:
br label %label_158
label_155:
br label %label_158
br label %label_158
label_158:
br label %label_160
label_159:
br label %label_161
label_160:
br label %label_161
br label %label_157
label_157:
br label %label_161
br label %label_162
label_162:
%v_36 = add i32 0, 1
call void @printi(i32 %v_36);
br label %label_163
br label %label_161
label_161:
%v_37 = add i32 0, 0
call void @printi(i32 %v_37);
br label %label_163
label_163:
br label %label_165
label_165:
br label %label_167
label_164:
br label %label_167
br label %label_167
label_167:
br label %label_168
label_168:
br label %label_171
label_169:
br label %label_170
br label %label_166
label_166:
br label %label_170
br label %label_171
label_171:
%v_38 = add i32 0, 1
call void @printi(i32 %v_38);
br label %label_172
br label %label_170
label_170:
%v_39 = add i32 0, 0
call void @printi(i32 %v_39);
br label %label_172
label_172:
br label %label_174
label_174:
br label %label_176
label_173:
br label %label_176
br label %label_176
label_176:
br label %label_177
label_177:
br label %label_179
label_178:
br label %label_179
br label %label_175
label_175:
br label %label_179
br label %label_180
label_180:
%v_40 = add i32 0, 1
call void @printi(i32 %v_40);
br label %label_181
br label %label_179
label_179:
%v_41 = add i32 0, 0
call void @printi(i32 %v_41);
br label %label_181
label_181:
br label %label_183
label_183:
br label %label_184
label_182:
br label %label_185
br label %label_185
label_185:
br label %label_187
label_186:
br label %label_189
label_187:
br label %label_188
br label %label_184
label_184:
br label %label_188
br label %label_189
label_189:
%v_42 = add i32 0, 1
call void @printi(i32 %v_42);
br label %label_190
br label %label_188
label_188:
%v_43 = add i32 0, 0
call void @printi(i32 %v_43);
br label %label_190
label_190:
br label %label_192
label_192:
br label %label_193
label_191:
br label %label_194
br label %label_194
label_194:
br label %label_196
label_195:
br label %label_197
label_196:
br label %label_197
br label %label_193
label_193:
br label %label_197
br label %label_198
label_198:
%v_44 = add i32 0, 1
call void @printi(i32 %v_44);
br label %label_199
br label %label_197
label_197:
%v_45 = add i32 0, 0
call void @printi(i32 %v_45);
br label %label_199
label_199:
br label %label_201
label_201:
br label %label_202
label_200:
br label %label_203
br label %label_203
label_203:
br label %label_204
label_204:
br label %label_207
label_205:
br label %label_206
br label %label_202
label_202:
br label %label_206
br label %label_207
label_207:
%v_46 = add i32 0, 1
call void @printi(i32 %v_46);
br label %label_208
br label %label_206
label_206:
%v_47 = add i32 0, 0
call void @printi(i32 %v_47);
br label %label_208
label_208:
br label %label_210
label_210:
br label %label_211
label_209:
br label %label_212
br label %label_212
label_212:
br label %label_213
label_213:
br label %label_215
label_214:
br label %label_215
br label %label_211
label_211:
br label %label_215
br label %label_216
label_216:
%v_48 = add i32 0, 1
call void @printi(i32 %v_48);
br label %label_217
br label %label_215
label_215:
%v_49 = add i32 0, 0
call void @printi(i32 %v_49);
br label %label_217
label_217:
br label %label_218
label_219:
br label %label_221
label_218:
br label %label_221
br label %label_221
label_221:
br label %label_223
label_222:
br label %label_225
label_223:
br label %label_224
br label %label_220
label_220:
br label %label_224
br label %label_225
label_225:
%v_50 = add i32 0, 1
call void @printi(i32 %v_50);
br label %label_226
br label %label_224
label_224:
%v_51 = add i32 0, 0
call void @printi(i32 %v_51);
br label %label_226
label_226:
br label %label_227
label_228:
br label %label_230
label_227:
br label %label_230
br label %label_230
label_230:
br label %label_232
label_231:
br label %label_233
label_232:
br label %label_233
br label %label_229
label_229:
br label %label_233
br label %label_234
label_234:
%v_52 = add i32 0, 1
call void @printi(i32 %v_52);
br label %label_235
br label %label_233
label_233:
%v_53 = add i32 0, 0
call void @printi(i32 %v_53);
br label %label_235
label_235:
br label %label_236
label_237:
br label %label_239
label_236:
br label %label_239
br label %label_239
label_239:
br label %label_240
label_240:
br label %label_243
label_241:
br label %label_242
br label %label_238
label_238:
br label %label_242
br label %label_243
label_243:
%v_54 = add i32 0, 1
call void @printi(i32 %v_54);
br label %label_244
br label %label_242
label_242:
%v_55 = add i32 0, 0
call void @printi(i32 %v_55);
br label %label_244
label_244:
br label %label_245
label_246:
br label %label_248
label_245:
br label %label_248
br label %label_248
label_248:
br label %label_249
label_249:
br label %label_251
label_250:
br label %label_251
br label %label_247
label_247:
br label %label_251
br label %label_252
label_252:
%v_56 = add i32 0, 1
call void @printi(i32 %v_56);
br label %label_253
br label %label_251
label_251:
%v_57 = add i32 0, 0
call void @printi(i32 %v_57);
br label %label_253
label_253:
br label %label_254
label_255:
br label %label_256
label_254:
br label %label_257
br label %label_257
label_257:
br label %label_259
label_258:
br label %label_261
label_259:
br label %label_260
br label %label_256
label_256:
br label %label_260
br label %label_261
label_261:
%v_58 = add i32 0, 1
call void @printi(i32 %v_58);
br label %label_262
br label %label_260
label_260:
%v_59 = add i32 0, 0
call void @printi(i32 %v_59);
br label %label_262
label_262:
br label %label_263
label_264:
br label %label_265
label_263:
br label %label_266
br label %label_266
label_266:
br label %label_268
label_267:
br label %label_269
label_268:
br label %label_269
br label %label_265
label_265:
br label %label_269
br label %label_270
label_270:
%v_60 = add i32 0, 1
call void @printi(i32 %v_60);
br label %label_271
br label %label_269
label_269:
%v_61 = add i32 0, 0
call void @printi(i32 %v_61);
br label %label_271
label_271:
br label %label_272
label_273:
br label %label_274
label_272:
br label %label_275
br label %label_275
label_275:
br label %label_276
label_276:
br label %label_279
label_277:
br label %label_278
br label %label_274
label_274:
br label %label_278
br label %label_279
label_279:
%v_62 = add i32 0, 1
call void @printi(i32 %v_62);
br label %label_280
br label %label_278
label_278:
%v_63 = add i32 0, 0
call void @printi(i32 %v_63);
br label %label_280
label_280:
br label %label_281
label_282:
br label %label_283
label_281:
br label %label_284
br label %label_284
label_284:
br label %label_285
label_285:
br label %label_287
label_286:
br label %label_287
br label %label_283
label_283:
br label %label_287
br label %label_288
label_288:
%v_64 = add i32 0, 1
call void @printi(i32 %v_64);
br label %label_289
br label %label_287
label_287:
%v_65 = add i32 0, 0
call void @printi(i32 %v_65);
br label %label_289
label_289:
ret i32 0
}
