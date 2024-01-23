	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp ne i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label0
	addi.d $t2, $zero, 0
	b false_label0
true_label0:
	addi.d $t2, $zero, 1
false_label0:
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label3
	addi.w $t0, $zero, 2
	st.w $t0, $fp, -24
	ld.b $t0, $fp, -17
	bnez $t0, .main_label1
	b .main_label3
.main_label1:
# %op2 = icmp ne i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bne  $t0, $t1, true_label1
	addi.d $t2, $zero, 0
	b false_label1
true_label1:
	addi.d $t2, $zero, 1
false_label1:
	st.b $t2, $fp, -18
# br i1 %op2, label %label5, label %label8
	ld.b $t0, $fp, -18
	bnez $t0, .main_label5
	b .main_label8
.main_label3:
# %op4 = phi i32 [ 2, %label_entry ], [ %op7, %label6 ]
# ret i32 %op4
	ld.w $a0, $fp, -24
	b main_ret
.main_label5:
# br label %label6
	addi.w $t0, $zero, 4
	st.w $t0, $fp, -28
	b .main_label6
.main_label6:
# %op7 = phi i32 [ 4, %label5 ], [ 3, %label8 ]
# br label %label3
	ld.w $t0, $fp, -28
	st.w $t0, $fp, -24
	b .main_label3
.main_label8:
# br label %label6
	addi.w $t0, $zero, 3
	st.w $t0, $fp, -28
	b .main_label6
main_ret:
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
