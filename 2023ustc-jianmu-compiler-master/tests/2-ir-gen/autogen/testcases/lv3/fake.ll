; ModuleID = 'cminus'
source_filename = "/home/hq/Test/2023ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv3/fake.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define float @get(float* %arg0, i32 %arg1, i32 %arg2, i32 %arg3) {
label_entry:
  %op4 = alloca float*
  store float* %arg0, float** %op4
  %op5 = alloca i32
  store i32 %arg1, i32* %op5
  %op6 = alloca i32
  store i32 %arg2, i32* %op6
  %op7 = alloca i32
  store i32 %arg3, i32* %op7
  %op8 = load i32, i32* %op5
  %op9 = load i32, i32* %op7
  %op10 = mul i32 %op8, %op9
  %op11 = load i32, i32* %op6
  %op12 = add i32 %op10, %op11
  %op13 = icmp slt i32 %op12, 0
  br i1 %op13, label %label_negative_index_0, label %label_continue1
label_negative_index_0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_continue1
label_continue1:                                                ; preds = %label_entry, %label_negative_index_0
  %op14 = load float*, float** %op4
  %op15 = getelementptr float, float* %op14, i32 %op12
  %op16 = load float, float* %op15
  ret float %op16
}
define float @abs(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = sitofp i32 0 to float
  %op4 = fcmp ugt float %op2, %op3
  br i1 %op4, label %label_if_0, label %label_else_1
label_if_0:                                                ; preds = %label_entry
  %op5 = load float, float* %op1
  ret float %op5
label_else_1:                                                ; preds = %label_entry
  %op6 = load float, float* %op1
  %op7 = sitofp i32 0 to float
  %op8 = fsub float %op7, %op6
  ret float %op8
label_continue2:
  ret float 0x0
}
define float @isZero(float %arg0) {
label_entry:
  %op1 = alloca float
  store float %arg0, float* %op1
  %op2 = load float, float* %op1
  %op3 = call float @abs(float %op2)
  %op4 = fcmp ult float %op3, 0x3eb0c6f7a0000000
  %op5 = sitofp i1 %op4 to float
  ret float %op5
}
define i32 @gauss(float* %arg0, float* %arg1, i32 %arg2) {
label_entry:
  %op3 = alloca float*
  store float* %arg0, float** %op3
  %op4 = alloca float*
  store float* %arg1, float** %op4
  %op5 = alloca i32
  store i32 %arg2, i32* %op5
  %op6 = alloca i32
  %op7 = alloca i32
  %op8 = alloca i32
  %op9 = alloca i32
  %op10 = alloca i32
  %op11 = alloca i32
  %op12 = alloca float
  %op13 = load i32, i32* %op5
  %op14 = add i32 %op13, 1
  store i32 %op14, i32* %op9
  store i32 0, i32* %op6
  br label %label_while_0
label_while_0:                                                ; preds = %label_entry, %label_continue3
  %op15 = load i32, i32* %op6
  %op16 = load i32, i32* %op5
  %op17 = icmp slt i32 %op15, %op16
  br i1 %op17, label %label_true_1, label %label_false_2
label_true_1:                                                ; preds = %label_while_0
  %op18 = load i32, i32* %op6
  %op19 = icmp slt i32 %op18, 0
  br i1 %op19, label %label_negative_index_2, label %label_continue3
label_false_2:                                                ; preds = %label_while_0
  store i32 0, i32* %op11
  store i32 0, i32* %op8
  br label %label_while_3
label_negative_index_2:                                                ; preds = %label_true_1
  call void @neg_idx_except()
  br label %label_continue3
label_continue3:                                                ; preds = %label_true_1, %label_negative_index_2
  %op20 = load float*, float** %op3
  %op21 = getelementptr float, float* %op20, i32 %op18
  %op22 = sitofp i32 0 to float
  store float %op22, float* %op21
  %op23 = load i32, i32* %op6
  %op24 = add i32 %op23, 1
  store i32 %op24, i32* %op6
  br label %label_while_0
label_while_3:                                                ; preds = %label_false_2, %label_continue11
  %op25 = load i32, i32* %op8
  %op26 = load i32, i32* %op5
  %op27 = icmp slt i32 %op25, %op26
  br i1 %op27, label %label_true_4, label %label_false_5
label_true_4:                                                ; preds = %label_while_3
  %op28 = load i32, i32* %op8
  store i32 %op28, i32* %op10
  %op29 = load i32, i32* %op8
  %op30 = add i32 %op29, 1
  store i32 %op30, i32* %op6
  br label %label_while_6
label_false_5:                                                ; preds = %label_while_3
  %op31 = load i32, i32* %op5
  %op32 = sub i32 %op31, 1
  store i32 %op32, i32* %op6
  br label %label_while_18
label_while_6:                                                ; preds = %label_true_4, %label_continue5
  %op33 = load i32, i32* %op6
  %op34 = load i32, i32* %op5
  %op35 = icmp slt i32 %op33, %op34
  br i1 %op35, label %label_true_7, label %label_false_8
label_true_7:                                                ; preds = %label_while_6
  %op36 = load float*, float** %op4
  %op37 = load float*, float** %op4
  %op38 = load i32, i32* %op6
  %op39 = load i32, i32* %op11
  %op40 = load i32, i32* %op9
  %op41 = call float @get(float* %op37, i32 %op38, i32 %op39, i32 %op40)
  %op42 = load float*, float** %op4
  %op43 = load float*, float** %op4
  %op44 = load i32, i32* %op6
  %op45 = load i32, i32* %op11
  %op46 = load i32, i32* %op9
  %op47 = call float @get(float* %op43, i32 %op44, i32 %op45, i32 %op46)
  %op48 = load float*, float** %op4
  %op49 = load float*, float** %op4
  %op50 = load i32, i32* %op6
  %op51 = load i32, i32* %op11
  %op52 = load i32, i32* %op9
  %op53 = call float @get(float* %op49, i32 %op50, i32 %op51, i32 %op52)
  %op54 = call float @abs(float %op53)
  %op55 = load float*, float** %op4
  %op56 = load float*, float** %op4
  %op57 = load i32, i32* %op10
  %op58 = load i32, i32* %op11
  %op59 = load i32, i32* %op9
  %op60 = call float @get(float* %op56, i32 %op57, i32 %op58, i32 %op59)
  %op61 = load float*, float** %op4
  %op62 = load float*, float** %op4
  %op63 = load i32, i32* %op10
  %op64 = load i32, i32* %op11
  %op65 = load i32, i32* %op9
  %op66 = call float @get(float* %op62, i32 %op63, i32 %op64, i32 %op65)
  %op67 = load float*, float** %op4
  %op68 = load float*, float** %op4
  %op69 = load i32, i32* %op10
  %op70 = load i32, i32* %op11
  %op71 = load i32, i32* %op9
  %op72 = call float @get(float* %op68, i32 %op69, i32 %op70, i32 %op71)
  %op73 = call float @abs(float %op72)
  %op74 = fcmp ugt float %op54, %op73
  br i1 %op74, label %label_if_3, label %label_else_4
label_false_8:                                                ; preds = %label_while_6
  %op75 = load i32, i32* %op10
  %op76 = load i32, i32* %op8
  %op77 = icmp ne i32 %op75, %op76
  br i1 %op77, label %label_if_6, label %label_else_7
label_if_3:                                                ; preds = %label_true_7
  %op78 = load i32, i32* %op6
  store i32 %op78, i32* %op10
  br label %label_continue5
label_else_4:                                                ; preds = %label_true_7
  br label %label_continue5
label_continue5:                                                ; preds = %label_if_3, %label_else_4
  %op79 = load i32, i32* %op6
  %op80 = add i32 %op79, 1
  store i32 %op80, i32* %op6
  br label %label_while_6
label_if_6:                                                ; preds = %label_false_8
  %op81 = load i32, i32* %op8
  store i32 %op81, i32* %op7
  br label %label_while_9
label_else_7:                                                ; preds = %label_false_8
  br label %label_continue8
label_continue8:                                                ; preds = %label_false_11, %label_else_7
  %op82 = load float*, float** %op4
  %op83 = load float*, float** %op4
  %op84 = load i32, i32* %op8
  %op85 = load i32, i32* %op11
  %op86 = load i32, i32* %op9
  %op87 = call float @get(float* %op83, i32 %op84, i32 %op85, i32 %op86)
  %op88 = load float*, float** %op4
  %op89 = load float*, float** %op4
  %op90 = load i32, i32* %op8
  %op91 = load i32, i32* %op11
  %op92 = load i32, i32* %op9
  %op93 = call float @get(float* %op89, i32 %op90, i32 %op91, i32 %op92)
  %op94 = load float*, float** %op4
  %op95 = load float*, float** %op4
  %op96 = load i32, i32* %op8
  %op97 = load i32, i32* %op11
  %op98 = load i32, i32* %op9
  %op99 = call float @get(float* %op95, i32 %op96, i32 %op97, i32 %op98)
  %op100 = call float @isZero(float %op99)
  %op101 = fcmp une float %op100, 0x0
  br i1 %op101, label %label_if_9, label %label_else_10
label_while_9:                                                ; preds = %label_if_6, %label_continue7
  %op102 = load i32, i32* %op7
  %op103 = load i32, i32* %op9
  %op104 = icmp slt i32 %op102, %op103
  br i1 %op104, label %label_true_10, label %label_false_11
label_true_10:                                                ; preds = %label_while_9
  %op105 = load float*, float** %op4
  %op106 = load float*, float** %op4
  %op107 = load i32, i32* %op8
  %op108 = load i32, i32* %op7
  %op109 = load i32, i32* %op9
  %op110 = call float @get(float* %op106, i32 %op107, i32 %op108, i32 %op109)
  store float %op110, float* %op12
  %op111 = load i32, i32* %op8
  %op112 = load i32, i32* %op9
  %op113 = mul i32 %op111, %op112
  %op114 = load i32, i32* %op7
  %op115 = add i32 %op113, %op114
  %op116 = icmp slt i32 %op115, 0
  br i1 %op116, label %label_negative_index_4, label %label_continue5
label_false_11:                                                ; preds = %label_while_9
  br label %label_continue8
label_negative_index_4:                                                ; preds = %label_true_10
  call void @neg_idx_except()
  br label %label_continue5
label_continue5:                                                ; preds = %label_true_10, %label_negative_index_4
  %op117 = load float*, float** %op4
  %op118 = getelementptr float, float* %op117, i32 %op115
  %op119 = load float*, float** %op4
  %op120 = load float*, float** %op4
  %op121 = load i32, i32* %op10
  %op122 = load i32, i32* %op7
  %op123 = load i32, i32* %op9
  %op124 = call float @get(float* %op120, i32 %op121, i32 %op122, i32 %op123)
  store float %op124, float* %op118
  %op125 = load i32, i32* %op10
  %op126 = load i32, i32* %op9
  %op127 = mul i32 %op125, %op126
  %op128 = load i32, i32* %op7
  %op129 = add i32 %op127, %op128
  %op130 = icmp slt i32 %op129, 0
  br i1 %op130, label %label_negative_index_6, label %label_continue7
label_negative_index_6:                                                ; preds = %label_continue5
  call void @neg_idx_except()
  br label %label_continue7
label_continue7:                                                ; preds = %label_continue5, %label_negative_index_6
  %op131 = load float*, float** %op4
  %op132 = getelementptr float, float* %op131, i32 %op129
  %op133 = load float, float* %op12
  store float %op133, float* %op132
  %op134 = load i32, i32* %op7
  %op135 = add i32 %op134, 1
  store i32 %op135, i32* %op7
  br label %label_while_9
label_if_9:                                                ; preds = %label_continue8
  %op136 = load i32, i32* %op8
  %op137 = sub i32 %op136, 1
  store i32 %op137, i32* %op8
  br label %label_continue11
label_else_10:                                                ; preds = %label_continue8
  %op138 = load i32, i32* %op8
  %op139 = add i32 %op138, 1
  store i32 %op139, i32* %op6
  br label %label_while_12
label_continue11:                                                ; preds = %label_if_9, %label_false_14
  %op140 = load i32, i32* %op8
  %op141 = add i32 %op140, 1
  store i32 %op141, i32* %op8
  %op142 = load i32, i32* %op11
  %op143 = add i32 %op142, 1
  store i32 %op143, i32* %op11
  br label %label_while_3
label_while_12:                                                ; preds = %label_else_10, %label_continue14
  %op144 = load i32, i32* %op6
  %op145 = load i32, i32* %op5
  %op146 = icmp slt i32 %op144, %op145
  br i1 %op146, label %label_true_13, label %label_false_14
label_true_13:                                                ; preds = %label_while_12
  %op147 = load float*, float** %op4
  %op148 = load float*, float** %op4
  %op149 = load i32, i32* %op6
  %op150 = load i32, i32* %op11
  %op151 = load i32, i32* %op9
  %op152 = call float @get(float* %op148, i32 %op149, i32 %op150, i32 %op151)
  %op153 = load float*, float** %op4
  %op154 = load float*, float** %op4
  %op155 = load i32, i32* %op6
  %op156 = load i32, i32* %op11
  %op157 = load i32, i32* %op9
  %op158 = call float @get(float* %op154, i32 %op155, i32 %op156, i32 %op157)
  %op159 = load float*, float** %op4
  %op160 = load float*, float** %op4
  %op161 = load i32, i32* %op6
  %op162 = load i32, i32* %op11
  %op163 = load i32, i32* %op9
  %op164 = call float @get(float* %op160, i32 %op161, i32 %op162, i32 %op163)
  %op165 = call float @isZero(float %op164)
  %op166 = sitofp i32 1 to float
  %op167 = fsub float %op166, %op165
  %op168 = fcmp une float %op167, 0x0
  br i1 %op168, label %label_if_12, label %label_else_13
label_false_14:                                                ; preds = %label_while_12
  br label %label_continue11
label_if_12:                                                ; preds = %label_true_13
  %op169 = load float*, float** %op4
  %op170 = load float*, float** %op4
  %op171 = load i32, i32* %op8
  %op172 = load i32, i32* %op11
  %op173 = load i32, i32* %op9
  %op174 = call float @get(float* %op170, i32 %op171, i32 %op172, i32 %op173)
  %op175 = load float*, float** %op4
  %op176 = load float*, float** %op4
  %op177 = load i32, i32* %op6
  %op178 = load i32, i32* %op11
  %op179 = load i32, i32* %op9
  %op180 = call float @get(float* %op176, i32 %op177, i32 %op178, i32 %op179)
  %op181 = fdiv float %op180, %op174
  store float %op181, float* %op12
  %op182 = load i32, i32* %op11
  store i32 %op182, i32* %op7
  br label %label_while_15
label_else_13:                                                ; preds = %label_true_13
  br label %label_continue14
label_continue14:                                                ; preds = %label_false_17, %label_else_13
  %op183 = load i32, i32* %op6
  %op184 = add i32 %op183, 1
  store i32 %op184, i32* %op6
  br label %label_while_12
label_while_15:                                                ; preds = %label_if_12, %label_continue11
  %op185 = load i32, i32* %op7
  %op186 = load i32, i32* %op9
  %op187 = icmp slt i32 %op185, %op186
  br i1 %op187, label %label_true_16, label %label_false_17
label_true_16:                                                ; preds = %label_while_15
  %op188 = load i32, i32* %op6
  %op189 = load i32, i32* %op9
  %op190 = mul i32 %op188, %op189
  %op191 = load i32, i32* %op7
  %op192 = add i32 %op190, %op191
  %op193 = icmp slt i32 %op192, 0
  br i1 %op193, label %label_negative_index_8, label %label_continue9
label_false_17:                                                ; preds = %label_while_15
  br label %label_continue14
label_negative_index_8:                                                ; preds = %label_true_16
  call void @neg_idx_except()
  br label %label_continue9
label_continue9:                                                ; preds = %label_true_16, %label_negative_index_8
  %op194 = load float*, float** %op4
  %op195 = getelementptr float, float* %op194, i32 %op192
  %op196 = load i32, i32* %op6
  %op197 = load i32, i32* %op9
  %op198 = mul i32 %op196, %op197
  %op199 = load i32, i32* %op7
  %op200 = add i32 %op198, %op199
  %op201 = icmp slt i32 %op200, 0
  br i1 %op201, label %label_negative_index_10, label %label_continue11
label_negative_index_10:                                                ; preds = %label_continue9
  call void @neg_idx_except()
  br label %label_continue11
label_continue11:                                                ; preds = %label_continue9, %label_negative_index_10
  %op202 = load float*, float** %op4
  %op203 = getelementptr float, float* %op202, i32 %op200
  %op204 = load float*, float** %op4
  %op205 = load float*, float** %op4
  %op206 = load i32, i32* %op8
  %op207 = load i32, i32* %op7
  %op208 = load i32, i32* %op9
  %op209 = call float @get(float* %op205, i32 %op206, i32 %op207, i32 %op208)
  %op210 = load float, float* %op12
  %op211 = fmul float %op209, %op210
  %op212 = load float, float* %op203
  %op213 = fsub float %op212, %op211
  store float %op213, float* %op195
  %op214 = load i32, i32* %op7
  %op215 = add i32 %op214, 1
  store i32 %op215, i32* %op7
  br label %label_while_15
label_while_18:                                                ; preds = %label_false_5, %label_continue15
  %op216 = load i32, i32* %op6
  %op217 = icmp sge i32 %op216, 0
  br i1 %op217, label %label_true_19, label %label_false_20
label_true_19:                                                ; preds = %label_while_18
  %op218 = load float*, float** %op4
  %op219 = load float*, float** %op4
  %op220 = load i32, i32* %op6
  %op221 = load i32, i32* %op5
  %op222 = load i32, i32* %op9
  %op223 = call float @get(float* %op219, i32 %op220, i32 %op221, i32 %op222)
  store float %op223, float* %op12
  %op224 = load i32, i32* %op6
  %op225 = add i32 %op224, 1
  store i32 %op225, i32* %op7
  br label %label_while_21
label_false_20:                                                ; preds = %label_while_18
  ret i32 0
label_while_21:                                                ; preds = %label_true_19, %label_continue17
  %op226 = load i32, i32* %op7
  %op227 = load i32, i32* %op5
  %op228 = icmp slt i32 %op226, %op227
  br i1 %op228, label %label_true_22, label %label_false_23
label_true_22:                                                ; preds = %label_while_21
  %op229 = load float*, float** %op4
  %op230 = load float*, float** %op4
  %op231 = load i32, i32* %op6
  %op232 = load i32, i32* %op7
  %op233 = load i32, i32* %op9
  %op234 = call float @get(float* %op230, i32 %op231, i32 %op232, i32 %op233)
  %op235 = load float*, float** %op4
  %op236 = load float*, float** %op4
  %op237 = load i32, i32* %op6
  %op238 = load i32, i32* %op7
  %op239 = load i32, i32* %op9
  %op240 = call float @get(float* %op236, i32 %op237, i32 %op238, i32 %op239)
  %op241 = load float*, float** %op4
  %op242 = load float*, float** %op4
  %op243 = load i32, i32* %op6
  %op244 = load i32, i32* %op7
  %op245 = load i32, i32* %op9
  %op246 = call float @get(float* %op242, i32 %op243, i32 %op244, i32 %op245)
  %op247 = call float @isZero(float %op246)
  %op248 = sitofp i32 1 to float
  %op249 = fsub float %op248, %op247
  %op250 = fcmp une float %op249, 0x0
  br i1 %op250, label %label_if_15, label %label_else_16
label_false_23:                                                ; preds = %label_while_21
  %op251 = load i32, i32* %op6
  %op252 = icmp slt i32 %op251, 0
  br i1 %op252, label %label_negative_index_14, label %label_continue15
label_if_15:                                                ; preds = %label_true_22
  %op253 = load i32, i32* %op7
  %op254 = icmp slt i32 %op253, 0
  br i1 %op254, label %label_negative_index_12, label %label_continue13
label_else_16:                                                ; preds = %label_true_22
  br label %label_continue17
label_continue17:                                                ; preds = %label_continue13, %label_else_16
  %op255 = load i32, i32* %op7
  %op256 = add i32 %op255, 1
  store i32 %op256, i32* %op7
  br label %label_while_21
label_negative_index_12:                                                ; preds = %label_if_15
  call void @neg_idx_except()
  br label %label_continue13
label_continue13:                                                ; preds = %label_if_15, %label_negative_index_12
  %op257 = load float*, float** %op3
  %op258 = getelementptr float, float* %op257, i32 %op253
  %op259 = load float*, float** %op4
  %op260 = load float*, float** %op4
  %op261 = load i32, i32* %op6
  %op262 = load i32, i32* %op7
  %op263 = load i32, i32* %op9
  %op264 = call float @get(float* %op260, i32 %op261, i32 %op262, i32 %op263)
  %op265 = load float, float* %op258
  %op266 = fmul float %op264, %op265
  %op267 = load float, float* %op12
  %op268 = fsub float %op267, %op266
  store float %op268, float* %op12
  br label %label_continue17
label_negative_index_14:                                                ; preds = %label_false_23
  call void @neg_idx_except()
  br label %label_continue15
label_continue15:                                                ; preds = %label_false_23, %label_negative_index_14
  %op269 = load float*, float** %op3
  %op270 = getelementptr float, float* %op269, i32 %op251
  %op271 = load float*, float** %op4
  %op272 = load float*, float** %op4
  %op273 = load i32, i32* %op6
  %op274 = load i32, i32* %op6
  %op275 = load i32, i32* %op9
  %op276 = call float @get(float* %op272, i32 %op273, i32 %op274, i32 %op275)
  %op277 = load float, float* %op12
  %op278 = fdiv float %op277, %op276
  store float %op278, float* %op270
  %op279 = load i32, i32* %op6
  %op280 = sub i32 %op279, 1
  store i32 %op280, i32* %op6
  br label %label_while_18
}
define void @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca [3 x float]
  %op2 = alloca [12 x float]
  %op3 = icmp slt i32 0, 0
  br i1 %op3, label %label_negative_index_16, label %label_continue17
label_negative_index_16:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_continue17
label_continue17:                                                ; preds = %label_entry, %label_negative_index_16
  %op4 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 0
  %op5 = sitofp i32 1 to float
  store float %op5, float* %op4
  %op6 = icmp slt i32 1, 0
  br i1 %op6, label %label_negative_index_18, label %label_continue19
label_negative_index_18:                                                ; preds = %label_continue17
  call void @neg_idx_except()
  br label %label_continue19
label_continue19:                                                ; preds = %label_continue17, %label_negative_index_18
  %op7 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 1
  %op8 = sitofp i32 2 to float
  store float %op8, float* %op7
  %op9 = icmp slt i32 2, 0
  br i1 %op9, label %label_negative_index_20, label %label_continue21
label_negative_index_20:                                                ; preds = %label_continue19
  call void @neg_idx_except()
  br label %label_continue21
label_continue21:                                                ; preds = %label_continue19, %label_negative_index_20
  %op10 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 2
  %op11 = sitofp i32 1 to float
  store float %op11, float* %op10
  %op12 = icmp slt i32 3, 0
  br i1 %op12, label %label_negative_index_22, label %label_continue23
label_negative_index_22:                                                ; preds = %label_continue21
  call void @neg_idx_except()
  br label %label_continue23
label_continue23:                                                ; preds = %label_continue21, %label_negative_index_22
  %op13 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 3
  %op14 = sitofp i32 1 to float
  store float %op14, float* %op13
  %op15 = mul i32 1, 4
  %op16 = add i32 %op15, 0
  %op17 = icmp slt i32 %op16, 0
  br i1 %op17, label %label_negative_index_24, label %label_continue25
label_negative_index_24:                                                ; preds = %label_continue23
  call void @neg_idx_except()
  br label %label_continue25
label_continue25:                                                ; preds = %label_continue23, %label_negative_index_24
  %op18 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op16
  %op19 = sitofp i32 2 to float
  store float %op19, float* %op18
  %op20 = mul i32 1, 4
  %op21 = add i32 %op20, 1
  %op22 = icmp slt i32 %op21, 0
  br i1 %op22, label %label_negative_index_26, label %label_continue27
label_negative_index_26:                                                ; preds = %label_continue25
  call void @neg_idx_except()
  br label %label_continue27
label_continue27:                                                ; preds = %label_continue25, %label_negative_index_26
  %op23 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op21
  %op24 = sitofp i32 3 to float
  store float %op24, float* %op23
  %op25 = mul i32 1, 4
  %op26 = add i32 %op25, 2
  %op27 = icmp slt i32 %op26, 0
  br i1 %op27, label %label_negative_index_28, label %label_continue29
label_negative_index_28:                                                ; preds = %label_continue27
  call void @neg_idx_except()
  br label %label_continue29
label_continue29:                                                ; preds = %label_continue27, %label_negative_index_28
  %op28 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op26
  %op29 = sitofp i32 4 to float
  store float %op29, float* %op28
  %op30 = mul i32 1, 4
  %op31 = add i32 %op30, 3
  %op32 = icmp slt i32 %op31, 0
  br i1 %op32, label %label_negative_index_30, label %label_continue31
label_negative_index_30:                                                ; preds = %label_continue29
  call void @neg_idx_except()
  br label %label_continue31
label_continue31:                                                ; preds = %label_continue29, %label_negative_index_30
  %op33 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op31
  %op34 = sitofp i32 3 to float
  store float %op34, float* %op33
  %op35 = mul i32 2, 4
  %op36 = add i32 %op35, 0
  %op37 = icmp slt i32 %op36, 0
  br i1 %op37, label %label_negative_index_32, label %label_continue33
label_negative_index_32:                                                ; preds = %label_continue31
  call void @neg_idx_except()
  br label %label_continue33
label_continue33:                                                ; preds = %label_continue31, %label_negative_index_32
  %op38 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op36
  %op39 = sitofp i32 1 to float
  store float %op39, float* %op38
  %op40 = mul i32 2, 4
  %op41 = add i32 %op40, 1
  %op42 = icmp slt i32 %op41, 0
  br i1 %op42, label %label_negative_index_34, label %label_continue35
label_negative_index_34:                                                ; preds = %label_continue33
  call void @neg_idx_except()
  br label %label_continue35
label_continue35:                                                ; preds = %label_continue33, %label_negative_index_34
  %op43 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op41
  %op44 = sitofp i32 1 to float
  store float %op44, float* %op43
  %op45 = mul i32 2, 4
  %op46 = add i32 %op45, 2
  %op47 = icmp slt i32 %op46, 0
  br i1 %op47, label %label_negative_index_36, label %label_continue37
label_negative_index_36:                                                ; preds = %label_continue35
  call void @neg_idx_except()
  br label %label_continue37
label_continue37:                                                ; preds = %label_continue35, %label_negative_index_36
  %op48 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op46
  %op49 = sub i32 0, 2
  %op50 = sitofp i32 %op49 to float
  store float %op50, float* %op48
  %op51 = mul i32 2, 4
  %op52 = add i32 %op51, 3
  %op53 = icmp slt i32 %op52, 0
  br i1 %op53, label %label_negative_index_38, label %label_continue39
label_negative_index_38:                                                ; preds = %label_continue37
  call void @neg_idx_except()
  br label %label_continue39
label_continue39:                                                ; preds = %label_continue37, %label_negative_index_38
  %op54 = getelementptr [12 x float], [12 x float]* %op2, i32 0, i32 %op52
  %op55 = sitofp i32 0 to float
  store float %op55, float* %op54
  store i32 0, i32* %op0
  ret void
}
