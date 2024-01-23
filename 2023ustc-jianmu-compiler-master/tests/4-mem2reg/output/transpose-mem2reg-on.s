# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl matrix
	.type matrix, @object
	.size matrix, 80000000
matrix:
	.space 80000000
	.globl ad
	.type ad, @object
	.size ad, 400000
ad:
	.space 400000
	.globl len
	.type len, @object
	.size len, 4
len:
	.space 4
	.text
	.globl readarray
	.type readarray, @function
readarray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.readarray_label_entry:
# br label %label0
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -20
	b .readarray_label0
.readarray_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op13, %label11 ]
# %op2 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -24
# %op3 = icmp slt i32 %op1, %op2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt $t2, $t0, $t1
	st.b $t2, $fp, -25
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -25
	st.w $t0, $fp, -32
# %op5 = icmp ne i32 %op4, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label1
	addi.d $t2, $zero, 0
	b false_label1
true_label1:
	addi.d $t2, $zero, 1
false_label1:
	st.b $t2, $fp, -33
# br i1 %op5, label %label6, label %label9
	ld.b $t0, $fp, -33
	bnez $t0, .readarray_label6
	b .readarray_label9
.readarray_label6:
# %op7 = call i32 @input()
	bl input
	st.w $a0, $fp, -40
# %op8 = icmp slt i32 %op1, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -41
# br i1 %op8, label %label10, label %label11
	ld.b $t0, $fp, -41
	bnez $t0, .readarray_label10
	b .readarray_label11
.readarray_label9:
# ret void
	addi.d $a0, $zero, 0
	b readarray_ret
.readarray_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# ret void
	addi.d $a0, $zero, 0
	b readarray_ret
.readarray_label11:
# %op12 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op1
	addi.d $t0, $zero, 0
	lu12i.w $t1, 97
	ori $t1, $t1, 2688
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t1, 97
	ori $t1, $t1, 2688
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -20
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, ad
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -56
# store i32 %op7, i32* %op12
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -40
	st.w $t1, $t0, 0
# %op13 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# br label %label0
	ld.w $t0, $fp, -60
	st.w $t0, $fp, -20
	b .readarray_label0
readarray_ret:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
	st.w $a0, $fp, -20
	st.d $a1, $fp, -32
	st.w $a2, $fp, -36
.transpose_label_entry:
# %op3 = sdiv i32 %arg0, %arg2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -36
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# br label %label4
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -44
	b .transpose_label4
.transpose_label4:
# %op5 = phi i32 [ 0, %label_entry ], [ %op22, %label21 ]
# %op6 = icmp slt i32 %op5, %op3
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -40
	slt $t2, $t0, $t1
	st.b $t2, $fp, -45
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -45
	st.w $t0, $fp, -52
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label4
	addi.d $t2, $zero, 0
	b false_label4
true_label4:
	addi.d $t2, $zero, 1
false_label4:
	st.b $t2, $fp, -53
# br i1 %op8, label %label9, label %label10
	ld.b $t0, $fp, -53
	bnez $t0, .transpose_label9
	b .transpose_label10
.transpose_label9:
# br label %label12
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -64
	b .transpose_label12
.transpose_label10:
# %op11 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# ret i32 %op11
	ld.w $a0, $fp, -60
	b transpose_ret
.transpose_label12:
# %op13 = phi i32 [ 0, %label9 ], [ %op26, %label25 ]
# %op14 = icmp slt i32 %op13, %arg2
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -36
	slt $t2, $t0, $t1
	st.b $t2, $fp, -65
# %op15 = zext i1 %op14 to i32
	ld.b $t0, $fp, -65
	st.w $t0, $fp, -72
# %op16 = icmp ne i32 %op15, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label6
	addi.d $t2, $zero, 0
	b false_label6
true_label6:
	addi.d $t2, $zero, 1
false_label6:
	st.b $t2, $fp, -73
# br i1 %op16, label %label17, label %label21
	ld.b $t0, $fp, -73
	bnez $t0, .transpose_label17
	b .transpose_label21
.transpose_label17:
# %op18 = icmp slt i32 %op5, %op13
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -64
	slt $t2, $t0, $t1
	st.b $t2, $fp, -74
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -74
	st.w $t0, $fp, -80
# %op20 = icmp ne i32 %op19, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label8
	addi.d $t2, $zero, 0
	b false_label8
true_label8:
	addi.d $t2, $zero, 1
false_label8:
	st.b $t2, $fp, -81
# br i1 %op20, label %label23, label %label27
	ld.b $t0, $fp, -81
	bnez $t0, .transpose_label23
	b .transpose_label27
.transpose_label21:
# %op22 = add i32 %op5, 1
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# br label %label4
	ld.w $t0, $fp, -88
	st.w $t0, $fp, -44
	b .transpose_label4
.transpose_label23:
# %op24 = add i32 %op13, 1
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# br label %label25
	ld.w $t0, $fp, -92
	st.w $t0, $fp, -96
	b .transpose_label25
.transpose_label25:
# %op26 = phi i32 [ %op24, %label23 ], [ %op54, %label52 ]
# br label %label12
	ld.w $t0, $fp, -96
	st.w $t0, $fp, -64
	b .transpose_label12
.transpose_label27:
# %op28 = mul i32 %op5, %arg2
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op29 = add i32 %op28, %op13
	ld.w $t0, $fp, -100
	ld.w $t1, $fp, -64
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op30 = icmp slt i32 %op29, 0
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -105
# br i1 %op30, label %label31, label %label32
	ld.b $t0, $fp, -105
	bnez $t0, .transpose_label31
	b .transpose_label32
.transpose_label31:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b transpose_ret
.transpose_label32:
# %op33 = getelementptr i32, i32* %arg1, i32 %op29
	addi.d $t0, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -104
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.d $t1, $fp, -32
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -120
# %op34 = load i32, i32* %op33
	ld.d $t0, $fp, -120
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# %op35 = mul i32 %op5, %arg2
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op36 = add i32 %op35, %op13
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -64
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op37 = icmp slt i32 %op36, 0
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -133
# br i1 %op37, label %label38, label %label39
	ld.b $t0, $fp, -133
	bnez $t0, .transpose_label38
	b .transpose_label39
.transpose_label38:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b transpose_ret
.transpose_label39:
# %op40 = getelementptr i32, i32* %arg1, i32 %op36
	addi.d $t0, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -132
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.d $t1, $fp, -32
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -144
# %op41 = load i32, i32* %op40
	ld.d $t0, $fp, -144
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op42 = mul i32 %op13, %op3
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op43 = add i32 %op42, %op5
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -44
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op44 = icmp slt i32 %op43, 0
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -157
# br i1 %op44, label %label45, label %label46
	ld.b $t0, $fp, -157
	bnez $t0, .transpose_label45
	b .transpose_label46
.transpose_label45:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b transpose_ret
.transpose_label46:
# %op47 = getelementptr i32, i32* %arg1, i32 %op43
	addi.d $t0, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -156
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.d $t1, $fp, -32
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# store i32 %op41, i32* %op47
	ld.d $t0, $fp, -168
	ld.w $t1, $fp, -148
	st.w $t1, $t0, 0
# %op48 = mul i32 %op5, %arg2
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op49 = add i32 %op48, %op13
	ld.w $t0, $fp, -172
	ld.w $t1, $fp, -64
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op50 = icmp slt i32 %op49, 0
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -177
# br i1 %op50, label %label51, label %label52
	ld.b $t0, $fp, -177
	bnez $t0, .transpose_label51
	b .transpose_label52
.transpose_label51:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b transpose_ret
.transpose_label52:
# %op53 = getelementptr i32, i32* %arg1, i32 %op49
	addi.d $t0, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -176
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.d $t1, $fp, -32
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -192
# store i32 %op34, i32* %op53
	ld.d $t0, $fp, -192
	ld.w $t1, $fp, -124
	st.w $t1, $t0, 0
# %op54 = add i32 %op13, 1
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# br label %label25
	ld.w $t0, $fp, -196
	st.w $t0, $fp, -96
	b .transpose_label25
transpose_ret:
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# %op1 = call i32 @input()
	bl input
	st.w $a0, $fp, -24
# store i32 %op1, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# br label %label2
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -28
	b .main_label2
.main_label2:
# %op3 = phi i32 [ 0, %label_entry ], [ %op13, %label11 ]
# %op4 = icmp slt i32 %op3, %op0
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -20
	slt $t2, $t0, $t1
	st.b $t2, $fp, -29
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -29
	st.w $t0, $fp, -36
# %op6 = icmp ne i32 %op5, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label14
	addi.d $t2, $zero, 0
	b false_label14
true_label14:
	addi.d $t2, $zero, 1
false_label14:
	st.b $t2, $fp, -37
# br i1 %op6, label %label7, label %label9
	ld.b $t0, $fp, -37
	bnez $t0, .main_label7
	b .main_label9
.main_label7:
# %op8 = icmp slt i32 %op3, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -38
# br i1 %op8, label %label10, label %label11
	ld.b $t0, $fp, -38
	bnez $t0, .main_label10
	b .main_label11
.main_label9:
# br label %label14
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -56
	b .main_label14
.main_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label11:
# %op12 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op3
	addi.d $t0, $zero, 0
	lu12i.w $t1, 19531
	ori $t1, $t1, 1024
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t1, 19531
	ori $t1, $t1, 1024
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -28
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, matrix
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# store i32 %op3, i32* %op12
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op13 = add i32 %op3, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# br label %label2
	ld.w $t0, $fp, -52
	st.w $t0, $fp, -28
	b .main_label2
.main_label14:
# %op15 = phi i32 [ 0, %label9 ], [ %op29, %label25 ]
# %op16 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -60
# %op17 = icmp slt i32 %op15, %op16
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -60
	slt $t2, $t0, $t1
	st.b $t2, $fp, -61
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -61
	st.w $t0, $fp, -68
# %op19 = icmp ne i32 %op18, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label17
	addi.d $t2, $zero, 0
	b false_label17
true_label17:
	addi.d $t2, $zero, 1
false_label17:
	st.b $t2, $fp, -69
# br i1 %op19, label %label20, label %label23
	ld.b $t0, $fp, -69
	bnez $t0, .main_label20
	b .main_label23
.main_label20:
# %op21 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	addi.d $t0, $zero, 0
	lu12i.w $t1, 19531
	ori $t1, $t1, 1024
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t1, 19531
	ori $t1, $t1, 1024
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, matrix
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -80
# %op22 = icmp slt i32 %op15, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -81
# br i1 %op22, label %label24, label %label25
	ld.b $t0, $fp, -81
	bnez $t0, .main_label24
	b .main_label25
.main_label23:
# br label %label30
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -112
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -116
	b .main_label30
.main_label24:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label25:
# %op26 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op15
	addi.d $t0, $zero, 0
	lu12i.w $t1, 97
	ori $t1, $t1, 2688
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t1, 97
	ori $t1, $t1, 2688
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -56
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, ad
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -96
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# %op28 = call i32 @transpose(i32 %op0, i32* %op21, i32 %op27)
	ld.w $a0, $fp, -20
	ld.d $a1, $fp, -80
	ld.w $a2, $fp, -100
	bl transpose
	st.w $a0, $fp, -104
# %op29 = add i32 %op15, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# br label %label14
	ld.w $t0, $fp, -108
	st.w $t0, $fp, -56
	b .main_label14
.main_label30:
# %op31 = phi i32 [ 0, %label23 ], [ %op49, %label45 ]
# %op32 = phi i32 [ 0, %label23 ], [ %op50, %label45 ]
# %op33 = load i32, i32* @len
	la.local $t0, len
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -120
# %op34 = icmp slt i32 %op32, %op33
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -120
	slt $t2, $t0, $t1
	st.b $t2, $fp, -121
# %op35 = zext i1 %op34 to i32
	ld.b $t0, $fp, -121
	st.w $t0, $fp, -128
# %op36 = icmp ne i32 %op35, 0
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label20
	addi.d $t2, $zero, 0
	b false_label20
true_label20:
	addi.d $t2, $zero, 1
false_label20:
	st.b $t2, $fp, -129
# br i1 %op36, label %label37, label %label40
	ld.b $t0, $fp, -129
	bnez $t0, .main_label37
	b .main_label40
.main_label37:
# %op38 = mul i32 %op32, %op32
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -116
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op39 = icmp slt i32 %op32, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -137
# br i1 %op39, label %label44, label %label45
	ld.b $t0, $fp, -137
	bnez $t0, .main_label44
	b .main_label45
.main_label40:
# %op41 = icmp slt i32 %op31, 0
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -138
# %op42 = zext i1 %op41 to i32
	ld.b $t0, $fp, -138
	st.w $t0, $fp, -144
# %op43 = icmp ne i32 %op42, 0
	ld.w $t0, $fp, -144
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label23
	addi.d $t2, $zero, 0
	b false_label23
true_label23:
	addi.d $t2, $zero, 1
false_label23:
	st.b $t2, $fp, -145
# br i1 %op43, label %label51, label %label53
	ld.w $t0, $fp, -112
	st.w $t0, $fp, -184
	ld.b $t0, $fp, -145
	bnez $t0, .main_label51
	b .main_label53
.main_label44:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label45:
# %op46 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op32
	addi.d $t0, $zero, 0
	lu12i.w $t1, 19531
	ori $t1, $t1, 1024
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	lu12i.w $t1, 19531
	ori $t1, $t1, 1024
	lu32i.d $t1, 0
	lu52i.d $t1, $t1, 0
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -116
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	la.local $t1, matrix
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -160
# %op47 = load i32, i32* %op46
	ld.d $t0, $fp, -160
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# %op48 = mul i32 %op38, %op47
	ld.w $t0, $fp, -136
	ld.w $t1, $fp, -164
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -168
# %op49 = add i32 %op31, %op48
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -168
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -172
# %op50 = add i32 %op32, 1
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# br label %label30
	ld.w $t0, $fp, -172
	st.w $t0, $fp, -112
	ld.w $t0, $fp, -176
	st.w $t0, $fp, -116
	b .main_label30
.main_label51:
# %op52 = sub i32 0, %op31
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -112
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# br label %label53
	ld.w $t0, $fp, -180
	st.w $t0, $fp, -184
	b .main_label53
.main_label53:
# %op54 = phi i32 [ %op31, %label40 ], [ %op52, %label51 ]
# call void @output(i32 %op54)
	ld.w $a0, $fp, -184
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
main_ret:
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
