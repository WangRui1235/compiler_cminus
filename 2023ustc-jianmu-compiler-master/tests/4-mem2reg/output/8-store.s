	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = icmp slt i32 %arg1, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# br i1 %op3, label %label4, label %label5
	ld.b $t0, $fp, -33
	bnez $t0, .store_label4
	b .store_label5
.store_label4:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b store_ret
.store_label5:
# %op6 = getelementptr i32, i32* %arg0, i32 %arg1
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 4
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -28
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.d $t1, $fp, -24
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# store i32 %arg2, i32* %op6
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# ret i32 %arg2
	ld.w $a0, $fp, -32
	b store_ret
store_ret:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# br label %label1
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -68
	b .main_label1
.main_label1:
# %op2 = phi i32 [ 0, %label_entry ], [ %op10, %label6 ]
# %op3 = icmp slt i32 %op2, 10
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -69
	st.w $t0, $fp, -76
# %op5 = icmp ne i32 %op4, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label2
	addi.d $t2, $zero, 0
	b false_label2
true_label2:
	addi.d $t2, $zero, 1
false_label2:
	st.b $t2, $fp, -77
# br i1 %op5, label %label6, label %label11
	ld.b $t0, $fp, -77
	bnez $t0, .main_label6
	b .main_label11
.main_label6:
# %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 40
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 40
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.d $t1, $fp, -24
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -88
# %op8 = mul i32 %op2, 2
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op9 = call i32 @store(i32* %op7, i32 %op2, i32 %op8)
	ld.d $a0, $fp, -88
	ld.w $a1, $fp, -68
	ld.w $a2, $fp, -92
	bl store
	st.w $a0, $fp, -96
# %op10 = add i32 %op2, 1
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# br label %label1
	ld.w $t0, $fp, -100
	st.w $t0, $fp, -68
	b .main_label1
.main_label11:
# br label %label12
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -104
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -108
	b .main_label12
.main_label12:
# %op13 = phi i32 [ 0, %label11 ], [ %op25, %label22 ]
# %op14 = phi i32 [ 0, %label11 ], [ %op26, %label22 ]
# %op15 = icmp slt i32 %op14, 10
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -109
	st.w $t0, $fp, -116
# %op17 = icmp ne i32 %op16, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label4
	addi.d $t2, $zero, 0
	b false_label4
true_label4:
	addi.d $t2, $zero, 1
false_label4:
	st.b $t2, $fp, -117
# br i1 %op17, label %label18, label %label20
	ld.b $t0, $fp, -117
	bnez $t0, .main_label18
	b .main_label20
.main_label18:
# %op19 = icmp slt i32 %op14, 0
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -118
# br i1 %op19, label %label21, label %label22
	ld.b $t0, $fp, -118
	bnez $t0, .main_label21
	b .main_label22
.main_label20:
# call void @output(i32 %op13)
	ld.w $a0, $fp, -104
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label21:
# call void @neg_idx_except()
	bl neg_idx_except
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
.main_label22:
# %op23 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op14
	addi.d $t0, $zero, 0
	addi.d $t1, $zero, 40
	mul.d $t0, $t0, $t1
	addi.d $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.d $t1, $zero, 40
	mul.d $t0, $t0, $t1
	ld.w $t1, $fp, -108
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.d $t1, $fp, -24
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -128
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op25 = add i32 %op13, %op24
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op26 = add i32 %op14, 1
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# br label %label12
	ld.w $t0, $fp, -136
	st.w $t0, $fp, -104
	ld.w $t0, $fp, -140
	st.w $t0, $fp, -108
	b .main_label12
main_ret:
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
