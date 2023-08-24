; ModuleID = 'tests/malloc.ll'
source_filename = "tests/malloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.User = type { ptr, i8 }

@.str.1 = private unnamed_addr constant [17 x i8] c"Enter your name:\00", align 1, !dbg !0
@stdin = external local_unnamed_addr global ptr, align 8
@.str.2 = private unnamed_addr constant [16 x i8] c"Hello admin %s\0A\00", align 1, !dbg !7
@.str.3 = private unnamed_addr constant [15 x i8] c"Hello user %s\0A\00", align 1, !dbg !12
@str = private unnamed_addr constant [12 x i8] c"Do Nothing!\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local void @faulty_free(ptr nocapture noundef readnone %0) local_unnamed_addr #0 !dbg !39 {
  call void @llvm.dbg.value(metadata ptr %0, metadata !44, metadata !DIExpression()), !dbg !45
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nounwind
declare !dbg !48 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 !dbg !57 {
  %1 = call ptr @__runtime_malloc(i64 16), !dbg !65
  call void @llvm.dbg.value(metadata ptr %1, metadata !61, metadata !DIExpression()), !dbg !66
  %2 = call ptr @__runtime_malloc(i64 32), !dbg !67
  store ptr %2, ptr %1, align 8, !dbg !68, !tbaa !69
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !74
  call void @llvm.dbg.value(metadata i32 0, metadata !62, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata ptr %2, metadata !63, metadata !DIExpression()), !dbg !66
  %4 = load ptr, ptr @stdin, align 8, !dbg !75, !tbaa !76
  %5 = tail call i32 @getc(ptr noundef %4), !dbg !77
  call void @llvm.dbg.value(metadata i32 %5, metadata !64, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !66
  %6 = and i32 %5, 255, !dbg !78
  %7 = icmp eq i32 %6, 10, !dbg !78
  call void @llvm.dbg.value(metadata i32 0, metadata !62, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !66
  br i1 %7, label %21, label %8, !dbg !79

8:                                                ; preds = %8, %0
  %9 = phi i32 [ %16, %8 ], [ %5, %0 ]
  %10 = phi i32 [ %13, %8 ], [ 0, %0 ]
  %11 = phi ptr [ %14, %8 ], [ %2, %0 ]
  call void @llvm.dbg.value(metadata i32 %10, metadata !62, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata ptr %11, metadata !63, metadata !DIExpression()), !dbg !66
  %12 = trunc i32 %9 to i8, !dbg !77
  call void @llvm.dbg.value(metadata i8 %12, metadata !64, metadata !DIExpression()), !dbg !66
  %13 = add nuw nsw i32 %10, 1, !dbg !80
  call void @llvm.dbg.value(metadata i32 %13, metadata !62, metadata !DIExpression()), !dbg !66
  %14 = getelementptr inbounds i8, ptr %11, i64 1, !dbg !81
  call void @llvm.dbg.value(metadata ptr %14, metadata !63, metadata !DIExpression()), !dbg !66
  store i8 %12, ptr %11, align 1, !dbg !83, !tbaa !84
  %15 = load ptr, ptr @stdin, align 8, !dbg !75, !tbaa !76
  %16 = tail call i32 @getc(ptr noundef %15), !dbg !77
  call void @llvm.dbg.value(metadata i32 %16, metadata !64, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !66
  %17 = and i32 %16, 255, !dbg !78
  %18 = icmp ne i32 %17, 10, !dbg !78
  %19 = icmp ult i32 %10, 30
  %20 = select i1 %18, i1 %19, i1 false, !dbg !79
  call void @llvm.dbg.value(metadata i32 %13, metadata !62, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !66
  br i1 %20, label %8, label %21, !dbg !79, !llvm.loop !85

21:                                               ; preds = %8, %0
  %22 = phi ptr [ %2, %0 ], [ %14, %8 ], !dbg !66
  store i8 0, ptr %22, align 1, !dbg !90, !tbaa !84
  %23 = getelementptr inbounds %struct.User, ptr %1, i64 0, i32 1, !dbg !91
  %24 = load i8, ptr %23, align 8, !dbg !91, !tbaa !93
  %25 = icmp eq i8 %24, 0, !dbg !94
  %26 = select i1 %25, ptr @.str.3, ptr @.str.2
  %27 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) %26, ptr noundef %2), !dbg !95
  tail call void @faulty_free(ptr noundef %2) #7, !dbg !96
  tail call void @faulty_free(ptr noundef %1) #7, !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !99 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare !dbg !106 noundef i32 @getc(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !165 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #6

declare ptr @__runtime_malloc(i64)

attributes #0 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 18, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "tests/malloc.c", directory: "/home/tianchi/Workspace/Github/system_programming_hub/llvm/llvm_pass/Caller", checksumkind: CSK_MD5, checksum: "3a5965419c6e750e088e8f66cf113171")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 17)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 16)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 15)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 16.0.6 (++20230710042027+7cbf1a259152-1~exp1~20230710162048.105)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !18, globals: !26, splitDebugInlining: false, nameTableKind: None)
!18 = !{!19, !24}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "User", file: !2, line: 7, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 4, size: 128, elements: !22)
!22 = !{!23, !25}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "username", scope: !21, file: !2, line: 5, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "isAdmin", scope: !21, file: !2, line: 6, baseType: !4, size: 8, offset: 64)
!26 = !{!27, !0, !7, !12}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 13)
!32 = !{i32 7, !"Dwarf Version", i32 5}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 8, !"PIC Level", i32 2}
!36 = !{i32 7, !"PIE Level", i32 2}
!37 = !{i32 7, !"uwtable", i32 2}
!38 = !{!"Ubuntu clang version 16.0.6 (++20230710042027+7cbf1a259152-1~exp1~20230710162048.105)"}
!39 = distinct !DISubprogram(name: "faulty_free", scope: !2, file: !2, line: 9, type: !40, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !17, retainedNodes: !43)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!43 = !{!44}
!44 = !DILocalVariable(name: "ptr", arg: 1, scope: !39, file: !2, line: 9, type: !42)
!45 = !DILocation(line: 0, scope: !39)
!46 = !DILocation(line: 11, column: 5, scope: !39)
!47 = !DILocation(line: 12, column: 1, scope: !39)
!48 = !DISubprogram(name: "printf", scope: !49, file: !49, line: 356, type: !50, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !56)
!49 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !53, null}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!56 = !{}
!57 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 14, type: !58, scopeLine: 14, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !17, retainedNodes: !60)
!58 = !DISubroutineType(types: !59)
!59 = !{!52}
!60 = !{!61, !62, !63, !64}
!61 = !DILocalVariable(name: "user", scope: !57, file: !2, line: 15, type: !19)
!62 = !DILocalVariable(name: "size", scope: !57, file: !2, line: 20, type: !52)
!63 = !DILocalVariable(name: "buf", scope: !57, file: !2, line: 21, type: !24)
!64 = !DILocalVariable(name: "c", scope: !57, file: !2, line: 22, type: !4)
!65 = !DILocation(line: 15, column: 26, scope: !57)
!66 = !DILocation(line: 0, scope: !57)
!67 = !DILocation(line: 16, column: 30, scope: !57)
!68 = !DILocation(line: 16, column: 20, scope: !57)
!69 = !{!70, !71, i64 0}
!70 = !{!"", !71, i64 0, !72, i64 8}
!71 = !{!"any pointer", !72, i64 0}
!72 = !{!"omnipotent char", !73, i64 0}
!73 = !{!"Simple C/C++ TBAA"}
!74 = !DILocation(line: 18, column: 5, scope: !57)
!75 = !DILocation(line: 23, column: 21, scope: !57)
!76 = !{!71, !71, i64 0}
!77 = !DILocation(line: 23, column: 16, scope: !57)
!78 = !DILocation(line: 23, column: 29, scope: !57)
!79 = !DILocation(line: 23, column: 37, scope: !57)
!80 = !DILocation(line: 23, column: 44, scope: !57)
!81 = !DILocation(line: 24, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !57, file: !2, line: 23, column: 51)
!83 = !DILocation(line: 24, column: 16, scope: !82)
!84 = !{!72, !72, i64 0}
!85 = distinct !{!85, !86, !87, !88, !89}
!86 = !DILocation(line: 23, column: 5, scope: !57)
!87 = !DILocation(line: 25, column: 5, scope: !57)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !{!"llvm.loop.unroll.disable"}
!90 = !DILocation(line: 26, column: 10, scope: !57)
!91 = !DILocation(line: 28, column: 14, scope: !92)
!92 = distinct !DILexicalBlock(scope: !57, file: !2, line: 28, column: 8)
!93 = !{!70, !72, i64 8}
!94 = !DILocation(line: 28, column: 8, scope: !92)
!95 = !DILocation(line: 0, scope: !92)
!96 = !DILocation(line: 34, column: 5, scope: !57)
!97 = !DILocation(line: 35, column: 5, scope: !57)
!98 = !DILocation(line: 36, column: 1, scope: !57)
!99 = !DISubprogram(name: "malloc", scope: !100, file: !100, line: 540, type: !101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !56)
!100 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!101 = !DISubroutineType(types: !102)
!102 = !{!42, !103}
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !104, line: 46, baseType: !105)
!104 = !DIFile(filename: "/usr/lib/llvm-16/lib/clang/16/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!105 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!106 = !DISubprogram(name: "getc", scope: !49, file: !49, line: 514, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !56)
!107 = !DISubroutineType(types: !108)
!108 = !{!52, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !111, line: 7, baseType: !112)
!111 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !113, line: 49, size: 1728, elements: !114)
!113 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!114 = !{!115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !130, !132, !133, !134, !138, !140, !142, !146, !149, !151, !154, !157, !158, !159, !160, !161}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !112, file: !113, line: 51, baseType: !52, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !112, file: !113, line: 54, baseType: !24, size: 64, offset: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !112, file: !113, line: 55, baseType: !24, size: 64, offset: 128)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !112, file: !113, line: 56, baseType: !24, size: 64, offset: 192)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !112, file: !113, line: 57, baseType: !24, size: 64, offset: 256)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !112, file: !113, line: 58, baseType: !24, size: 64, offset: 320)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !112, file: !113, line: 59, baseType: !24, size: 64, offset: 384)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !112, file: !113, line: 60, baseType: !24, size: 64, offset: 448)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !112, file: !113, line: 61, baseType: !24, size: 64, offset: 512)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !112, file: !113, line: 64, baseType: !24, size: 64, offset: 576)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !112, file: !113, line: 65, baseType: !24, size: 64, offset: 640)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !112, file: !113, line: 66, baseType: !24, size: 64, offset: 704)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !112, file: !113, line: 68, baseType: !128, size: 64, offset: 768)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !113, line: 36, flags: DIFlagFwdDecl)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !112, file: !113, line: 70, baseType: !131, size: 64, offset: 832)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !112, file: !113, line: 72, baseType: !52, size: 32, offset: 896)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !112, file: !113, line: 73, baseType: !52, size: 32, offset: 928)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !112, file: !113, line: 74, baseType: !135, size: 64, offset: 960)
!135 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !136, line: 152, baseType: !137)
!136 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!137 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !112, file: !113, line: 77, baseType: !139, size: 16, offset: 1024)
!139 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !112, file: !113, line: 78, baseType: !141, size: 8, offset: 1040)
!141 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !112, file: !113, line: 79, baseType: !143, size: 8, offset: 1048)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 8, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 1)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !112, file: !113, line: 81, baseType: !147, size: 64, offset: 1088)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!148 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !113, line: 43, baseType: null)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !112, file: !113, line: 89, baseType: !150, size: 64, offset: 1152)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !136, line: 153, baseType: !137)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !112, file: !113, line: 91, baseType: !152, size: 64, offset: 1216)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !113, line: 37, flags: DIFlagFwdDecl)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !112, file: !113, line: 92, baseType: !155, size: 64, offset: 1280)
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !156, size: 64)
!156 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !113, line: 38, flags: DIFlagFwdDecl)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !112, file: !113, line: 93, baseType: !131, size: 64, offset: 1344)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !112, file: !113, line: 94, baseType: !42, size: 64, offset: 1408)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !112, file: !113, line: 95, baseType: !103, size: 64, offset: 1472)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !112, file: !113, line: 96, baseType: !52, size: 32, offset: 1536)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !112, file: !113, line: 98, baseType: !162, size: 160, offset: 1568)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 20)
!165 = !DISubprogram(name: "free", scope: !100, file: !100, line: 555, type: !40, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !56)
