	.file	"addition.cpp"
# GNU C++17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE addition.cpp
# -mtune=generic -march=x86-64 -auxbase-strip tmp/additionOpt.S -O3
# -std=c++17 -fomit-frame-pointer -fverbose-asm
# -fasynchronous-unwind-tables -fstack-protector-strong -Wformat
# -Wformat-security -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-functions -falign-jumps -falign-labels -falign-loops
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexceptions -fexpensive-optimizations -fforward-propagate
# -ffp-int-builtin-inexact -ffunction-cse -fgcse -fgcse-after-reload
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics -finline-functions
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-cp-clone -fipa-icf -fipa-icf-functions -fipa-icf-variables
# -fipa-profile -fipa-pure-const -fipa-ra -fipa-reference
# -fipa-reference-addressable -fipa-sra -fipa-stack-alignment -fipa-vrp
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -floop-interchange
# -floop-unroll-and-jam -flra-remat -flto-odr-type-merging -fmath-errno
# -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
# -fomit-frame-pointer -foptimize-sibling-calls -foptimize-strlen
# -fpartial-inlining -fpeel-loops -fpeephole -fpeephole2 -fplt
# -fpredictive-commoning -fprefetch-loop-arrays -free -freg-struct-return
# -freorder-blocks -freorder-blocks-and-partition -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns2 -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-loops -fsplit-paths -fsplit-wide-types -fssa-backprop
# -fssa-phiopt -fstack-clash-protection -fstack-protector-strong
# -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-distribution
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
# -funit-at-a-time -funswitch-loops -funwind-tables -fverbose-asm
# -fversion-loops-for-strides -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.p2align 4
	.globl	_Z3addii
	.type	_Z3addii, @function
_Z3addii:
.LFB0:
	.cfi_startproc
	endbr64	
# addition.cpp:5:     return a + b;
	leal	(%rdi,%rsi), %eax	#, tmp85
# addition.cpp:6: }
	ret	
	.cfi_endproc
.LFE0:
	.size	_Z3addii, .-_Z3addii
	.p2align 4
	.globl	_Z7addMul8ii
	.type	_Z7addMul8ii, @function
_Z7addMul8ii:
.LFB1:
	.cfi_startproc
	endbr64	
# addition.cpp:10:     return a + 8 * b;
	leal	(%rdi,%rsi,8), %eax	#, tmp86
# addition.cpp:11: }
	ret	
	.cfi_endproc
.LFE1:
	.size	_Z7addMul8ii, .-_Z7addMul8ii
	.p2align 4
	.globl	_Z4funcPii
	.type	_Z4funcPii, @function
_Z4funcPii:
.LFB2:
	.cfi_startproc
	endbr64	
# addition.cpp:16:     return a[b];
	movslq	%esi, %rsi	# tmp92, b
# addition.cpp:16:     return a[b];
	movl	(%rdi,%rsi,4), %eax	# *_3, *_3
# addition.cpp:17: }
	ret	
	.cfi_endproc
.LFE2:
	.size	_Z4funcPii, .-_Z4funcPii
	.p2align 4
	.globl	_Z5func2Pim
	.type	_Z5func2Pim, @function
_Z5func2Pim:
.LFB3:
	.cfi_startproc
	endbr64	
# addition.cpp:24:     return a[b];
	movl	(%rdi,%rsi,4), %eax	# *_2, *_2
# addition.cpp:25: }
	ret	
	.cfi_endproc
.LFE3:
	.size	_Z5func2Pim, .-_Z5func2Pim
	.p2align 4
	.globl	_Z17algebraicSimplifyii
	.type	_Z17algebraicSimplifyii, @function
_Z17algebraicSimplifyii:
.LFB4:
	.cfi_startproc
	endbr64	
# addition.cpp:28: {
	movl	%edi, %eax	# tmp86, a
# addition.cpp:32: }
	ret	
	.cfi_endproc
.LFE4:
	.size	_Z17algebraicSimplifyii, .-_Z17algebraicSimplifyii
	.p2align 4
	.globl	_Z13constAdditionv
	.type	_Z13constAdditionv, @function
_Z13constAdditionv:
.LFB5:
	.cfi_startproc
	endbr64	
# addition.cpp:39: }
	movl	$42, %eax	#,
	ret	
	.cfi_endproc
.LFE5:
	.size	_Z13constAdditionv, .-_Z13constAdditionv
	.p2align 4
	.globl	_Z16forConstAdditionv
	.type	_Z16forConstAdditionv, @function
_Z16forConstAdditionv:
.LFB6:
	.cfi_startproc
	endbr64	
# addition.cpp:50: }
	movl	$5050, %eax	#,
	ret	
	.cfi_endproc
.LFE6:
	.size	_Z16forConstAdditionv, .-_Z16forConstAdditionv
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
