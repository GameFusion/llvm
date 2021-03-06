; RUN: llc %s -o /dev/null
; PR 2613.

%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }
%struct.test1 = type { i32 (...)** }

@_ZTV5test1 = weak_odr constant [4 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__class_type_info_pseudo* @_ZTI5test1 to i32 (...)*), i32 (...)* bitcast (void (%struct.test1*)* @_ZN5test1D1Ev to i32 (...)*), i32 (...)* bitcast (void (%struct.test1*)* @_ZN5test1D0Ev to i32 (...)*)], align 32 ; <[4 x i32 (...)*]*> [#uses=1]
@_ZTI5test1 = weak_odr constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i64 add (i64 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i64), i64 16) to i8*), i8* getelementptr inbounds ([7 x i8]* @_ZTS5test1, i64 0, i64 0) } }, align 16 ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS5test1 = weak_odr constant [7 x i8] c"5test1\00" ; <[7 x i8]*> [#uses=2]

define i32 @main() nounwind ssp {
entry:
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %tst = alloca %struct.test1                     ; <%struct.test1*> [#uses=1]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata %struct.test1* %tst, metadata !0, metadata !MDExpression()), !dbg !21
  call void @_ZN5test1C1Ev(%struct.test1* %tst) nounwind, !dbg !22
  store i32 0, i32* %0, align 4, !dbg !23
  %1 = load i32, i32* %0, align 4, !dbg !23            ; <i32> [#uses=1]
  store i32 %1, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

return:                                           ; preds = %entry
  %retval1 = load i32, i32* %retval, !dbg !23          ; <i32> [#uses=1]
  ret i32 %retval1, !dbg !23
}

define linkonce_odr void @_ZN5test1C1Ev(%struct.test1* %this) nounwind ssp align 2 {
entry:
  %this_addr = alloca %struct.test1*              ; <%struct.test1**> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata %struct.test1** %this_addr, metadata !24, metadata !MDExpression()), !dbg !28
  store %struct.test1* %this, %struct.test1** %this_addr
  %0 = load %struct.test1*, %struct.test1** %this_addr, align 8, !dbg !28 ; <%struct.test1*> [#uses=1]
  %1 = getelementptr inbounds %struct.test1, %struct.test1* %0, i32 0, i32 0, !dbg !28 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV5test1, i64 0, i64 2), i32 (...)*** %1, align 8, !dbg !28
  br label %return, !dbg !28

return:                                           ; preds = %entry
  ret void, !dbg !29
}

declare void @llvm.dbg.declare(metadata, metadata, metadata) nounwind readnone

define linkonce_odr void @_ZN5test1D1Ev(%struct.test1* %this) nounwind ssp align 2 {
entry:
  %this_addr = alloca %struct.test1*              ; <%struct.test1**> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata %struct.test1** %this_addr, metadata !32, metadata !MDExpression()), !dbg !34
  store %struct.test1* %this, %struct.test1** %this_addr
  %0 = load %struct.test1*, %struct.test1** %this_addr, align 8, !dbg !35 ; <%struct.test1*> [#uses=1]
  %1 = getelementptr inbounds %struct.test1, %struct.test1* %0, i32 0, i32 0, !dbg !35 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV5test1, i64 0, i64 2), i32 (...)*** %1, align 8, !dbg !35
  br label %bb, !dbg !37

bb:                                               ; preds = %entry
  %2 = trunc i32 0 to i8, !dbg !37                ; <i8> [#uses=1]
  %toBool = icmp ne i8 %2, 0, !dbg !37            ; <i1> [#uses=1]
  br i1 %toBool, label %bb1, label %bb2, !dbg !37

bb1:                                              ; preds = %bb
  %3 = load %struct.test1*, %struct.test1** %this_addr, align 8, !dbg !37 ; <%struct.test1*> [#uses=1]
  %4 = bitcast %struct.test1* %3 to i8*, !dbg !37 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %4) nounwind, !dbg !37
  br label %bb2, !dbg !37

bb2:                                              ; preds = %bb1, %bb
  br label %return, !dbg !37

return:                                           ; preds = %bb2
  ret void, !dbg !37
}

define linkonce_odr void @_ZN5test1D0Ev(%struct.test1* %this) nounwind ssp align 2 {
entry:
  %this_addr = alloca %struct.test1*              ; <%struct.test1**> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata %struct.test1** %this_addr, metadata !38, metadata !MDExpression()), !dbg !40
  store %struct.test1* %this, %struct.test1** %this_addr
  %0 = load %struct.test1*, %struct.test1** %this_addr, align 8, !dbg !41 ; <%struct.test1*> [#uses=1]
  %1 = getelementptr inbounds %struct.test1, %struct.test1* %0, i32 0, i32 0, !dbg !41 ; <i32 (...)***> [#uses=1]
  store i32 (...)** getelementptr inbounds ([4 x i32 (...)*]* @_ZTV5test1, i64 0, i64 2), i32 (...)*** %1, align 8, !dbg !41
  br label %bb, !dbg !43

bb:                                               ; preds = %entry
  %2 = trunc i32 1 to i8, !dbg !43                ; <i8> [#uses=1]
  %toBool = icmp ne i8 %2, 0, !dbg !43            ; <i1> [#uses=1]
  br i1 %toBool, label %bb1, label %bb2, !dbg !43

bb1:                                              ; preds = %bb
  %3 = load %struct.test1*, %struct.test1** %this_addr, align 8, !dbg !43 ; <%struct.test1*> [#uses=1]
  %4 = bitcast %struct.test1* %3 to i8*, !dbg !43 ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %4) nounwind, !dbg !43
  br label %bb2, !dbg !43

bb2:                                              ; preds = %bb1, %bb
  br label %return, !dbg !43

return:                                           ; preds = %bb2
  ret void, !dbg !43
}

declare void @_ZdlPv(i8*) nounwind

!0 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "tst", line: 13, scope: !1, file: !4, type: !8)
!1 = distinct !MDLexicalBlock(line: 0, column: 0, file: !44, scope: !2)
!2 = distinct !MDLexicalBlock(line: 0, column: 0, file: !44, scope: !3)
!3 = !MDSubprogram(name: "main", linkageName: "main", line: 11, isLocal: false, isDefinition: true, virtualIndex: 6, isOptimized: false, scope: !4, type: !5)
!4 = !MDCompileUnit(language: DW_LANG_C_plus_plus, producer: "4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", isOptimized: true, emissionKind: 0, file: !44, enums: !45, retainedTypes: !45)
!5 = !MDSubroutineType(types: !6)
!6 = !{!7}
!7 = !MDBasicType(tag: DW_TAG_base_type, name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!8 = !MDCompositeType(tag: DW_TAG_structure_type, name: "test1", line: 1, size: 64, align: 64, file: !44, scope: !4, elements: !9, vtableHolder: !8)
!9 = !{!10, !14, !18}
!10 = !MDDerivedType(tag: DW_TAG_member, name: "_vptr$test1", line: 1, size: 64, align: 64, file: !44, scope: !8, baseType: !11)
!11 = !MDDerivedType(tag: DW_TAG_pointer_type, size: 64, align: 64, file: !4, baseType: !12)
!12 = !MDDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", scope: !4, baseType: !5)
!13 = !MDCompileUnit(language: DW_LANG_C_plus_plus, producer: "4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", isOptimized: false, emissionKind: 0, file: !46, enums: !45, retainedTypes: !45)
!14 = !MDSubprogram(name: "test1", line: 1, isLocal: false, isDefinition: false, virtualIndex: 6, flags: DIFlagPrivate, isOptimized: false, scope: !8, type: !15)
!15 = !MDSubroutineType(types: !16)
!16 = !{null, !17}
!17 = !MDDerivedType(tag: DW_TAG_pointer_type, size: 64, align: 64, flags: DIFlagArtificial, file: !4, baseType: !8)
!18 = !MDSubprogram(name: "~test1", line: 4, isLocal: false, isDefinition: false, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, isOptimized: false, scope: !8, type: !19, containingType: !8)
!19 = !MDSubroutineType(types: !20)
!20 = !{null, !17, !7}
!21 = !MDLocation(line: 11, scope: !1)
!22 = !MDLocation(line: 13, scope: !1)
!23 = !MDLocation(line: 14, scope: !1)
!24 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "this", line: 13, arg: 0, scope: !25, file: !4, type: !26)
!25 = !MDSubprogram(name: "test1", linkageName: "_ZN5test1C1Ev", line: 1, isLocal: false, isDefinition: true, virtualIndex: 6, isOptimized: false, scope: !4, type: !15)
!26 = !MDDerivedType(tag: DW_TAG_const_type, size: 64, align: 64, flags: DIFlagArtificial, file: !4, baseType: !27)
!27 = !MDDerivedType(tag: DW_TAG_pointer_type, size: 64, align: 64, file: !4, baseType: !8)
!28 = !MDLocation(line: 1, scope: !25)
!29 = !MDLocation(line: 1, scope: !30)
!30 = distinct !MDLexicalBlock(line: 0, column: 0, file: !44, scope: !31)
!31 = distinct !MDLexicalBlock(line: 0, column: 0, file: !44, scope: !25)
!32 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "this", line: 4, arg: 0, scope: !33, file: !4, type: !26)
!33 = !MDSubprogram(name: "~test1", linkageName: "_ZN5test1D1Ev", line: 4, isLocal: false, isDefinition: true, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, isOptimized: false, scope: !8, type: !15, containingType: !8)
!34 = !MDLocation(line: 4, scope: !33)
!35 = !MDLocation(line: 5, scope: !36)
!36 = distinct !MDLexicalBlock(line: 0, column: 0, file: !44, scope: !33)
!37 = !MDLocation(line: 6, scope: !36)
!38 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "this", line: 4, arg: 0, scope: !39, file: !4, type: !26)
!39 = !MDSubprogram(name: "~test1", linkageName: "_ZN5test1D0Ev", line: 4, isLocal: false, isDefinition: true, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, isOptimized: false, scope: !8, type: !15, containingType: !8)
!40 = !MDLocation(line: 4, scope: !39)
!41 = !MDLocation(line: 5, scope: !42)
!42 = distinct !MDLexicalBlock(line: 0, column: 0, file: !44, scope: !39)
!43 = !MDLocation(line: 6, scope: !42)
!44 = !MDFile(filename: "inheritance.cpp", directory: "/tmp/")
!45 = !{i32 0}
!46 = !MDFile(filename: "<built-in>", directory: "/tmp/")
