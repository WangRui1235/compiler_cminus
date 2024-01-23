	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	beq  $t0, $t1, true_label0
	addi.d $t2, $zero, 0
	b false_label0
true_label0:
	addi.d $t2, $zero, 1
false_label0:
	st.b $t2, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	st.w $t0, $fp, -28
# %op3 = icmp ne i32 %op2, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label1
	addi.d $t2, $zero, 0
	b false_label1
true_label1:
	addi.d $t2, $zero, 1
false_label1:
	st.b $t2, $fp, -29
# br i1 %op3, label %label4, label %label6
	ld.b $t0, $fp, -29
	bnez $t0, .fibonacci_label4
	b .fibonacci_label6
.fibonacci_label4:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_ret
.fibonacci_label5:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_ret
.fibonacci_label6:
# %op7 = icmp eq i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	beq  $t0, $t1, true_label2
	addi.d $t2, $zero, 0
	b false_label2
true_label2:
	addi.d $t2, $zero, 1
false_label2:
	st.b $t2, $fp, -30
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -30
	st.w $t0, $fp, -36
# %op9 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label3
	addi.d $t2, $zero, 0
	b false_label3
true_label3:
	addi.d $t2, $zero, 1
false_label3:
	st.b $t2, $fp, -37
# br i1 %op9, label %label10, label %label12
	ld.b $t0, $fp, -37
	bnez $t0, .fibonacci_label10
	b .fibonacci_label12
.fibonacci_label10:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacci_ret
.fibonacci_label11:
# br label %label5
	b .fibonacci_label5
.fibonacci_label12:
# %op13 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op14 = call i32 @fibonacci(i32 %op13)
	ld.w $a0, $fp, -44
	bl fibonacci
	st.w $a0, $fp, -48
# %op15 = sub i32 %arg0, 2
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op16 = call i32 @fibonacci(i32 %op15)
	ld.w $a0, $fp, -52
	bl fibonacci
	st.w $a0, $fp, -56
# %op17 = add i32 %op14, %op16
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -56
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# ret i32 %op17
	ld.w $a0, $fp, -60
	b fibonacci_ret
fibonacci_ret:
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label0
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -20
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op7, %label5 ]
# %op2 = icmp slt i32 %op1, 10
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -21
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -21
	st.w $t0, $fp, -28
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label5
	addi.d $t2, $zero, 0
	b false_label5
true_label5:
	addi.d $t2, $zero, 1
false_label5:
	st.b $t2, $fp, -29
# br i1 %op4, label %label5, label %label8
	ld.b $t0, $fp, -29
	bnez $t0, .main_label5
	b .main_label8
.main_label5:
# %op6 = call i32 @fibonacci(i32 %op1)
	ld.w $a0, $fp, -20
	bl fibonacci
	st.w $a0, $fp, -36
# call void @output(i32 %op6)
	ld.w $a0, $fp, -36
	bl output
# %op7 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# br label %label0
	ld.w $t0, $fp, -40
	st.w $t0, $fp, -20
	b .main_label0
.main_label8:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_ret
main_ret:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
