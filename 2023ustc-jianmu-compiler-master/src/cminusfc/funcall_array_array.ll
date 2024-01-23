; ModuleID = 'cminus'
source_filename = "/home/hq/Test/2023ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv2/funcall_array_array.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @g(i32* %arg0) {
label_entry:
  %op1 = alloca i32*
  store i32* %arg0, i32** %op1
  %op2 = icmp slt i32 3, 0
  br i1 %op2, label %label_negative_index_0, label %label_continue1
label_negative_index_0:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_continue1
label_continue1:                                                ; preds = %label_entry, %label_negative_index_0
  %op3 = load i32*, i32** %op1
  %op4 = getelementptr i32, i32* %op3, i32 3
  %op5 = icmp slt i32 3, 0
  br i1 %op5, label %label_negative_index_2, label %label_continue3
label_negative_index_2:                                                ; preds = %label_continue1
  call void @neg_idx_except()
  br label %label_continue3
label_continue3:                                                ; preds = %label_continue1, %label_negative_index_2
  %op6 = load i32*, i32** %op1
  %op7 = getelementptr i32, i32* %op6, i32 3
  %op8 = load i32, i32* %op7
  call void @output(i32 %op8)
  ret void
}
define void @f(i32* %arg0) {
label_entry:
  %op1 = alloca i32*
  store i32* %arg0, i32** %op1
  %op2 = icmp slt i32 3, 0
  br i1 %op2, label %label_negative_index_4, label %label_continue5
label_negative_index_4:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_continue5
label_continue5:                                                ; preds = %label_entry, %label_negative_index_4
  %op3 = load i32*, i32** %op1
  %op4 = getelementptr i32, i32* %op3, i32 3
  %op5 = icmp slt i32 3, 0
  br i1 %op5, label %label_negative_index_6, label %label_continue7
label_negative_index_6:                                                ; preds = %label_continue5
  call void @neg_idx_except()
  br label %label_continue7
label_continue7:                                                ; preds = %label_continue5, %label_negative_index_6
  %op6 = load i32*, i32** %op1
  %op7 = getelementptr i32, i32* %op6, i32 3
  %op8 = load i32, i32* %op7
  call void @output(i32 %op8)
  %op9 = load i32*, i32** %op1
  %op10 = load i32*, i32** %op1
  call void @g(i32* %op10)
  ret void
}
define void @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = icmp slt i32 3, 0
  br i1 %op1, label %label_negative_index_8, label %label_continue9
label_negative_index_8:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_continue9
label_continue9:                                                ; preds = %label_entry, %label_negative_index_8
  %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
  store i32 1024, i32* %op2
  %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  call void @f(i32* %op4)
  ret void
}
