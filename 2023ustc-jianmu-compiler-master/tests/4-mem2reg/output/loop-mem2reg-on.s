	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label0
	addi.w $t0, $zero, 1
	st.w $t0, $fp, -20
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 1, %label_entry ], [ %op6, %label5 ]
# %op2 = icmp slt i32 %op1, 999999999
	ld.w $t0, $fp, -20
	lu12i.w $t1, 244140
	ori $t1, $t1, 2559
	slt $t2, $t0, $t1
	st.b $t2, $fp, -21
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -21
	st.w $t0, $fp, -28
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label1
	addi.d $t2, $zero, 0
	b false_label1
true_label1:
	addi.d $t2, $zero, 1
false_label1:
	st.b $t2, $fp, -29
# br i1 %op4, label %label5, label %label7
	ld.b $t0, $fp, -29
	bnez $t0, .main_label5
	b .main_label7
.main_label5:
# %op6 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# br label %label0
	ld.w $t0, $fp, -36
	st.w $t0, $fp, -20
	b .main_label0
.main_label7:
# ret i32 %op1
	ld.w $a0, $fp, -20
	b main_ret
main_ret:
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
