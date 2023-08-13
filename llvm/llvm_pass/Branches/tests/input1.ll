declare i32 @printf(ptr, ...)

define void @function1(i32 %arg) {
; CHECK-LABEL: define void @function1
; CHECK-SAME: (i32 [[ARG:%.*]]) {
; CHECK-NEXT:  [[BLOCK:.*]]:
; CHECK-NEXT:    ret void
;
entry:
  %x = alloca i32
  store i32 10, ptr %x
  %load = load i32, ptr %x
  %cmp = icmp sgt i32 %load, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:
  br label %cond.end

cond.false:
  br label %cond.end

cond.end:
  %cond = phi i32 [ %load, %cond.true ], [ %arg, %cond.false ]
  ret void
}

