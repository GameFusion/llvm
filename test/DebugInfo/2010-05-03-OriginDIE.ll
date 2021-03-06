
;RUN: llc < %s -o /dev/null
;Radar 7937109

%struct.anon = type { i64, i32, i32, i32, [1 x i32] }
%struct.gpm_t = type { i32, i8*, [16 x i8], i32, i64, i64, i64, i64, i64, i64, i32, i16, i16, [8 x %struct.gpmr_t] }
%struct.gpmr_t = type { [48 x i8], [48 x i8], [16 x i8], i64, i64, i64, i64, i16 }
%struct.gpt_t = type { [8 x i8], i32, i32, i32, i32, i64, i64, i64, i64, [16 x i8], %struct.anon }

@llvm.used = appending global [1 x i8*] [i8* bitcast (void (%struct.gpm_t*, %struct.gpt_t*)* @gpt2gpm to i8*)], section "llvm.metadata" ; <[1 x i8*]*> [#uses=0]

define fastcc void @gpt2gpm(%struct.gpm_t* %gpm, %struct.gpt_t* %gpt) nounwind optsize ssp {
entry:
  %data_addr.i18 = alloca i64, align 8            ; <i64*> [#uses=1]
  %data_addr.i17 = alloca i64, align 8            ; <i64*> [#uses=2]
  %data_addr.i16 = alloca i64, align 8            ; <i64*> [#uses=0]
  %data_addr.i15 = alloca i32, align 4            ; <i32*> [#uses=0]
  %data_addr.i = alloca i64, align 8              ; <i64*> [#uses=0]
  %0 = getelementptr inbounds %struct.gpm_t, %struct.gpm_t* %gpm, i32 0, i32 2, i32 0 ; <i8*> [#uses=1]
  %1 = getelementptr inbounds %struct.gpt_t, %struct.gpt_t* %gpt, i32 0, i32 9, i32 0 ; <i8*> [#uses=1]
  call void @uuid_LtoB(i8* %0, i8* %1) nounwind, !dbg !0
  %a9 = load volatile i64, i64* %data_addr.i18, align 8 ; <i64> [#uses=1]
  %a10 = call i64 @llvm.bswap.i64(i64 %a9) nounwind ; <i64> [#uses=1]
  %a11 = getelementptr inbounds %struct.gpt_t, %struct.gpt_t* %gpt, i32 0, i32 8, !dbg !7 ; <i64*> [#uses=1]
  %a12 = load i64, i64* %a11, align 4, !dbg !7         ; <i64> [#uses=1]
  call void @llvm.dbg.declare(metadata i64* %data_addr.i17, metadata !8, metadata !MDExpression()) nounwind, !dbg !14
  store i64 %a12, i64* %data_addr.i17, align 8
  call void @llvm.dbg.value(metadata !6, i64 0, metadata !15, metadata !MDExpression()) nounwind
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !MDExpression()) nounwind
  call void @llvm.dbg.declare(metadata !6, metadata !23, metadata !MDExpression()) nounwind
  call void @llvm.dbg.value(metadata i64* %data_addr.i17, i64 0, metadata !34, metadata !MDExpression()) nounwind
  %a13 = load volatile i64, i64* %data_addr.i17, align 8 ; <i64> [#uses=1]
  %a14 = call i64 @llvm.bswap.i64(i64 %a13) nounwind ; <i64> [#uses=2]
  %a15 = add i64 %a10, %a14, !dbg !7              ; <i64> [#uses=1]
  %a16 = sub i64 %a15, %a14                       ; <i64> [#uses=1]
  %a17 = getelementptr inbounds %struct.gpm_t, %struct.gpm_t* %gpm, i32 0, i32 5, !dbg !7 ; <i64*> [#uses=1]
  store i64 %a16, i64* %a17, align 4, !dbg !7
  ret void, !dbg !7
}

declare void @llvm.dbg.declare(metadata, metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata, metadata) nounwind readnone

declare i32 @llvm.bswap.i32(i32) nounwind readnone

declare i64 @llvm.bswap.i64(i64) nounwind readnone

declare void @uuid_LtoB(i8*, i8*)

!llvm.dbg.cu = !{!4}
!llvm.module.flags = !{!41}
!0 = !MDLocation(line: 808, scope: !1)
!1 = distinct !MDLexicalBlock(line: 807, column: 0, file: !39, scope: !2)
!2 = !MDSubprogram(name: "gpt2gpm", linkageName: "gpt2gpm", line: 807, isLocal: true, isDefinition: true, virtualIndex: 6, isOptimized: false, file: !39, scope: null, type: !5)
!3 = !MDFile(filename: "G.c", directory: "/tmp")
!4 = !MDCompileUnit(language: DW_LANG_C89, producer: "llvm-gcc", isOptimized: true, emissionKind: 0, file: !39, enums: !18, retainedTypes: !18, subprograms: !40)
!5 = !MDSubroutineType(types: !6)
!6 = !{null}
!7 = !MDLocation(line: 810, scope: !1)
!8 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "data", line: 201, arg: 0, scope: !9, file: !10, type: !11)
!9 = !MDSubprogram(name: "_OSSwapInt64", linkageName: "_OSSwapInt64", line: 202, isLocal: true, isDefinition: true, virtualIndex: 6, isOptimized: false, file: !10, scope: null, type: !5)
!10 = !MDFile(filename: "OSByteOrder.h", directory: "/usr/include/libkern/ppc")
!11 = !MDDerivedType(tag: DW_TAG_typedef, name: "uint64_t", line: 59, file: !36, scope: !3, baseType: !13)
!12 = !MDFile(filename: "stdint.h", directory: "/usr/4.2.1/include")
!13 = !MDBasicType(tag: DW_TAG_base_type, name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!14 = !MDLocation(line: 202, scope: !9, inlinedAt: !7)
!15 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "base", line: 92, arg: 0, scope: !16, file: !10, type: !17)
!16 = !MDSubprogram(name: "OSReadSwapInt64", linkageName: "OSReadSwapInt64", line: 95, isLocal: true, isDefinition: true, virtualIndex: 6, isOptimized: false, file: !38, scope: null, type: !5)
!17 = !MDDerivedType(tag: DW_TAG_pointer_type, size: 32, align: 32, file: !39, scope: !3, baseType: null)
!18 = !{i32 0}
!19 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "byteOffset", line: 94, arg: 0, scope: !16, file: !10, type: !20)
!20 = !MDDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", line: 114, file: !37, scope: !3, baseType: !22)
!21 = !MDFile(filename: "types.h", directory: "/usr/include/ppc")
!22 = !MDBasicType(tag: DW_TAG_base_type, name: "long unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!23 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "u", line: 100, scope: !24, file: !10, type: !25)
!24 = distinct !MDLexicalBlock(line: 95, column: 0, file: !38, scope: !16)
!25 = !MDCompositeType(tag: DW_TAG_union_type, line: 97, size: 64, align: 64, file: !38, scope: !16, elements: !26)
!26 = !{!27, !28}
!27 = !MDDerivedType(tag: DW_TAG_member, name: "u64", line: 98, size: 64, align: 64, file: !38, scope: !25, baseType: !11)
!28 = !MDDerivedType(tag: DW_TAG_member, name: "u32", line: 99, size: 64, align: 32, file: !38, scope: !25, baseType: !29)
!29 = !MDCompositeType(tag: DW_TAG_array_type, size: 64, align: 32, file: !39, scope: !3, baseType: !30, elements: !32)
!30 = !MDDerivedType(tag: DW_TAG_typedef, name: "uint32_t", line: 55, file: !36, scope: !3, baseType: !31)
!31 = !MDBasicType(tag: DW_TAG_base_type, name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!32 = !{!33}
!33 = !MDSubrange(count: 2)
!34 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "addr", line: 96, scope: !24, file: !10, type: !35)
!35 = !MDDerivedType(tag: DW_TAG_pointer_type, size: 32, align: 32, file: !39, scope: !3, baseType: !11)
!36 = !MDFile(filename: "stdint.h", directory: "/usr/4.2.1/include")
!37 = !MDFile(filename: "types.h", directory: "/usr/include/ppc")
!38 = !MDFile(filename: "OSByteOrder.h", directory: "/usr/include/libkern/ppc")
!39 = !MDFile(filename: "G.c", directory: "/tmp")
!40 = !{!2, !9, !16}
!41 = !{i32 1, !"Debug Info Version", i32 3}
