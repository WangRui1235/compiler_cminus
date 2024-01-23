# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = icmp sgt i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt $t2, $t1, $t0
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	st.w $t0, $fp, -32
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label1
	addi.d $t2, $zero, 0
	b false_label1
true_label1:
	addi.d $t2, $zero, 1
false_label1:
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label7
	ld.b $t0, $fp, -33
	bnez $t0, .max_label5
	b .max_label7
.max_label5:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b max_ret
.max_label6:
# ret i32 0
	addi.w $a0, $zero, 0
	b max_ret
.max_label7:
# ret i32 %arg1
	ld.w $a0, $fp, -24
	b max_ret
max_ret:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = icmp sle i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	bge  $t1, $t0, true_label2
	addi.d $t2, $zero, 0
	b false_label2
true_label2:
	addi.d $t2, $zero, 1
false_label2:
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	st.w $t0, $fp, -32
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label3
	addi.d $t2, $zero, 0
	b false_label3
true_label3:
	addi.d $t2, $zero, 1
false_label3:
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -33
	bnez $t0, .knapsack_label5
	b .knapsack_label6
.knapsack_label5:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label6:
# %op7 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	beq  $t0, $t1, true_label4
	addi.d $t2, $zero, 0
	b false_label4
true_label4:
	addi.d $t2, $zero, 1
false_label4:
	st.b $t2, $fp, -34
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -34
	st.w $t0, $fp, -40
# %op9 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label5
	addi.d $t2, $zero, 0
	b false_label5
true_label5:
	addi.d $t2, $zero, 1
false_label5:
	st.b $t2, $fp, -41
# br i1 %op9, label %label10, label %label11
	ld.b $t0, $fp, -41
	bnez $t0, .knapsack_label10
	b .knapsack_label11
.knapsack_label10:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label11:
# %op12 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op13 = add i32 %op12, %arg1
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op14 = icmp slt i32 %op13, 0
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -53
# br i1 %op14, label %label15, label %label16
	ld.b $t0, $fp, -53
	bnez $t0, .knapsack_label15
	b .knapsack_label16
.knapsack_label15:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label16:
# %op17 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op13
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -52
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, dp
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -64
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op19 = icmp sge i32 %op18, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	bge  $t0, $t1, true_label7
	addi.d $t2, $zero, 0
	b false_label7
true_label7:
	addi.d $t2, $zero, 1
false_label7:
	st.b $t2, $fp, -69
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -69
	st.w $t0, $fp, -76
# %op21 = icmp ne i32 %op20, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label8
	addi.d $t2, $zero, 0
	b false_label8
true_label8:
	addi.d $t2, $zero, 1
false_label8:
	st.b $t2, $fp, -77
# br i1 %op21, label %label22, label %label26
	ld.b $t0, $fp, -77
	bnez $t0, .knapsack_label22
	b .knapsack_label26
.knapsack_label22:
# %op23 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# %op24 = add i32 %op23, %arg1
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op25 = icmp slt i32 %op24, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -89
# br i1 %op25, label %label29, label %label30
	ld.b $t0, $fp, -89
	bnez $t0, .knapsack_label29
	b .knapsack_label30
.knapsack_label26:
# %op27 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op28 = icmp slt i32 %op27, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# br i1 %op28, label %label33, label %label34
	ld.b $t0, $fp, -97
	bnez $t0, .knapsack_label33
	b .knapsack_label34
.knapsack_label29:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label30:
# %op31 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op24
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -88
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, dp
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -112
# %op32 = load i32, i32* %op31
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -116
# ret i32 %op32
	ld.w $a0, $fp, -116
	b knapsack_ret
.knapsack_label33:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label34:
# %op35 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op27
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -96
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, w
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# %op36 = load i32, i32* %op35
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op37 = icmp slt i32 %arg1, %op36
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -132
	slt $t2, $t0, $t1
	st.b $t2, $fp, -133
# %op38 = zext i1 %op37 to i32
	ld.b $t0, $fp, -133
	st.w $t0, $fp, -140
# %op39 = icmp ne i32 %op38, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label12
	addi.d $t2, $zero, 0
	b false_label12
true_label12:
	addi.d $t2, $zero, 1
false_label12:
	st.b $t2, $fp, -141
# br i1 %op39, label %label40, label %label48
	ld.b $t0, $fp, -141
	bnez $t0, .knapsack_label40
	b .knapsack_label48
.knapsack_label40:
# %op41 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op42 = call i32 @knapsack(i32 %op41, i32 %arg1)
	ld.w $a0, $fp, -148
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -152
# br label %label43
	ld.w $t0, $fp, -152
	st.w $t0, $fp, -156
	b .knapsack_label43
.knapsack_label43:
# %op44 = phi i32 [ %op42, %label40 ], [ %op67, %label63 ]
# %op45 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op46 = add i32 %op45, %arg1
	ld.w $t0, $fp, -160
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# %op47 = icmp slt i32 %op46, 0
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -165
# br i1 %op47, label %label68, label %label69
	ld.b $t0, $fp, -165
	bnez $t0, .knapsack_label68
	b .knapsack_label69
.knapsack_label48:
# %op49 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op50 = call i32 @knapsack(i32 %op49, i32 %arg1)
	ld.w $a0, $fp, -172
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -176
# %op51 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op52 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# %op53 = icmp slt i32 %op52, 0
	ld.w $t0, $fp, -184
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -185
# br i1 %op53, label %label54, label %label55
	ld.b $t0, $fp, -185
	bnez $t0, .knapsack_label54
	b .knapsack_label55
.knapsack_label54:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label55:
# %op56 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op52
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -184
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, w
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -200
# %op57 = load i32, i32* %op56
	ld.d $t0, $fp, -200
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -204
# %op58 = sub i32 %arg1, %op57
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -204
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op59 = call i32 @knapsack(i32 %op51, i32 %op58)
	ld.w $a0, $fp, -180
	ld.w $a1, $fp, -208
	bl knapsack
	st.w $a0, $fp, -212
# %op60 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -216
# %op61 = icmp slt i32 %op60, 0
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -217
# br i1 %op61, label %label62, label %label63
	ld.b $t0, $fp, -217
	bnez $t0, .knapsack_label62
	b .knapsack_label63
.knapsack_label62:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label63:
# %op64 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op60
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -216
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, v
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -232
# %op65 = load i32, i32* %op64
	ld.d $t0, $fp, -232
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -236
# %op66 = add i32 %op59, %op65
	ld.w $t0, $fp, -212
	ld.w $t1, $fp, -236
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -240
# %op67 = call i32 @max(i32 %op50, i32 %op66)
	ld.w $a0, $fp, -176
	ld.w $a1, $fp, -240
	bl max
	st.w $a0, $fp, -244
# br label %label43
	ld.w $t0, $fp, -244
	st.w $t0, $fp, -156
	b .knapsack_label43
.knapsack_label68:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_ret
.knapsack_label69:
# %op70 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op46
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -164
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, dp
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -256
# store i32 %op44, i32* %op70
	ld.d $t0, $fp, -256
	ld.w $t1, $fp, -156
	st.w $t1, $t0, 0
# ret i32 %op44
	ld.w $a0, $fp, -156
	b knapsack_ret
knapsack_ret:
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -240
.main_label_entry:
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op0 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label2
	ld.b $t0, $fp, -17
	bnez $t0, .main_label1
	b .main_label2
.main_label1:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label2:
# %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, w
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -32
# store i32 2, i32* %op3
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op4 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -33
	bnez $t0, .main_label5
	b .main_label6
.main_label5:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label6:
# %op7 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 1
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, w
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# store i32 2, i32* %op7
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op8 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -49
# br i1 %op8, label %label9, label %label10
	ld.b $t0, $fp, -49
	bnez $t0, .main_label9
	b .main_label10
.main_label9:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label10:
# %op11 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 2
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, w
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -64
# store i32 6, i32* %op11
	ld.d $t0, $fp, -64
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op12 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -65
# br i1 %op12, label %label13, label %label14
	ld.b $t0, $fp, -65
	bnez $t0, .main_label13
	b .main_label14
.main_label13:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label14:
# %op15 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 3
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, w
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -80
# store i32 5, i32* %op15
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op16 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -81
# br i1 %op16, label %label17, label %label18
	ld.b $t0, $fp, -81
	bnez $t0, .main_label17
	b .main_label18
.main_label17:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label18:
# %op19 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, w
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# store i32 4, i32* %op19
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op20 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -97
# br i1 %op20, label %label21, label %label22
	ld.b $t0, $fp, -97
	bnez $t0, .main_label21
	b .main_label22
.main_label21:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label22:
# %op23 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, v
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -112
# store i32 6, i32* %op23
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op24 = icmp slt i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -113
# br i1 %op24, label %label25, label %label26
	ld.b $t0, $fp, -113
	bnez $t0, .main_label25
	b .main_label26
.main_label25:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label26:
# %op27 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 1
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, v
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# store i32 3, i32* %op27
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op28 = icmp slt i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -129
# br i1 %op28, label %label29, label %label30
	ld.b $t0, $fp, -129
	bnez $t0, .main_label29
	b .main_label30
.main_label29:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label30:
# %op31 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 2
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, v
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -144
# store i32 5, i32* %op31
	ld.d $t0, $fp, -144
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op32 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -145
# br i1 %op32, label %label33, label %label34
	ld.b $t0, $fp, -145
	bnez $t0, .main_label33
	b .main_label34
.main_label33:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label34:
# %op35 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 3
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, v
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# store i32 4, i32* %op35
	ld.d $t0, $fp, -160
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op36 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -161
# br i1 %op36, label %label37, label %label38
	ld.b $t0, $fp, -161
	bnez $t0, .main_label37
	b .main_label38
.main_label37:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label38:
# %op39 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 20
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 4
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, v
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -176
# store i32 6, i32* %op39
	ld.d $t0, $fp, -176
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label40
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -180
	b .main_label40
.main_label40:
# %op41 = phi i32 [ 0, %label38 ], [ %op55, %label53 ]
# %op42 = icmp slt i32 %op41, 66
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 66
	slt $t2, $t0, $t1
	st.b $t2, $fp, -181
# %op43 = zext i1 %op42 to i32
	ld.b $t0, $fp, -181
	st.w $t0, $fp, -188
# %op44 = icmp ne i32 %op43, 0
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label27
	addi.d $t2, $zero, 0
	b false_label27
true_label27:
	addi.d $t2, $zero, 1
false_label27:
	st.b $t2, $fp, -189
# br i1 %op44, label %label45, label %label48
	ld.b $t0, $fp, -189
	bnez $t0, .main_label45
	b .main_label48
.main_label45:
# %op46 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# %op47 = icmp slt i32 %op41, 0
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -197
# br i1 %op47, label %label52, label %label53
	ld.b $t0, $fp, -197
	bnez $t0, .main_label52
	b .main_label53
.main_label48:
# %op49 = load i32, i32* @n
	la.local $t0, n
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -204
# %op50 = load i32, i32* @m
	la.local $t0, m
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -208
# %op51 = call i32 @knapsack(i32 %op49, i32 %op50)
	ld.w $a0, $fp, -204
	ld.w $a1, $fp, -208
	bl knapsack
	st.w $a0, $fp, -212
# call void @output(i32 %op51)
	ld.w $a0, $fp, -212
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label52:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label53:
# %op54 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op41
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 264
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -180
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, dp
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -224
# store i32 %op46, i32* %op54
	ld.d $t0, $fp, -224
	ld.w $t1, $fp, -196
	st.w $t1, $t0, 0
# %op55 = add i32 %op41, 1
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -228
# br label %label40
	ld.w $t0, $fp, -228
	st.w $t0, $fp, -180
	b .main_label40
main_ret:
	addi.d $sp, $sp, 240
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
