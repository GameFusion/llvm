; RUN: llc < %s -mtriple=x86_64-apple-macosx -enable-misched \
; RUN:          -verify-machineinstrs | FileCheck %s
;
; Test RegisterPressure handling of DBG_VALUE.
;
; CHECK: %entry
; CHECK: DEBUG_VALUE: callback
; CHECK: ret

%struct.btCompoundLeafCallback = type { i32, i32 }

declare void @llvm.dbg.declare(metadata, metadata, metadata) nounwind readnone

define void @test() unnamed_addr uwtable ssp align 2 {
entry:
  %callback = alloca %struct.btCompoundLeafCallback, align 8
  br i1 undef, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.btCompoundLeafCallback* %callback, metadata !3, metadata !MDExpression())
  %m = getelementptr inbounds %struct.btCompoundLeafCallback, %struct.btCompoundLeafCallback* %callback, i64 0, i32 1
  store i32 0, i32* undef, align 8
  %cmp12447 = icmp sgt i32 undef, 0
  br i1 %cmp12447, label %for.body.lr.ph, label %invoke.cont44

for.body.lr.ph:                                   ; preds = %if.end
  unreachable

invoke.cont44:                                    ; preds = %if.end
  ret void
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8}

!0 = !MDCompileUnit(language: DW_LANG_C_plus_plus, producer: "clang version 3.3 (trunk 168984) (llvm/trunk 168983)", isOptimized: true, emissionKind: 0, file: !6, subprograms: !1)
!1 = !{!2}
!2 = !MDSubprogram(name: "test", isLocal: false, isDefinition: true, virtualIndex: 6, flags: DIFlagPrototyped, isOptimized: true, scopeLine: 1, file: !6, scope: !5, type: !7, function: void ()* @test)
!3 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "callback", line: 214, scope: null, type: !4)
!4 = !MDCompositeType(tag: DW_TAG_structure_type, name: "btCompoundLeafCallback", line: 90, size: 512, align: 64, file: !6)
!5 = !MDFile(filename: "MultiSource/Benchmarks/Bullet/btCompoundCollisionAlgorithm.cpp", directory: "MultiSource/Benchmarks/Bullet")
!6 = !MDFile(filename: "MultiSource/Benchmarks/Bullet/btCompoundCollisionAlgorithm.cpp", directory: "MultiSource/Benchmarks/Bullet")
!7 = !MDSubroutineType(types: !9)
!8 = !{i32 1, !"Debug Info Version", i32 3}
!9 = !{null}
