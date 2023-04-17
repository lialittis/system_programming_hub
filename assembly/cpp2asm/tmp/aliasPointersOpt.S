	.file	"aliasPointers.cpp"
# GNU C++17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE
# aliasPointers.cpp -mtune=generic -march=x86-64
# -auxbase-strip tmp/aliasPointersOpt.S -O3 -std=c++17 -fomit-frame-pointer
# -fverbose-asm -fasynchronous-unwind-tables -fstack-protector-strong
# -Wformat -Wformat-security -fstack-clash-protection -fcf-protection
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
	.globl	_Z4funcPiS_S_
	.type	_Z4funcPiS_S_, @function
_Z4funcPiS_S_:
.LFB0:
	.cfi_startproc
	endbr64	
# aliasPointers.cpp:3:     *c = *a;
	movl	(%rdi), %eax	# *a_4(D), _1
# aliasPointers.cpp:3:     *c = *a;
	movl	%eax, (%rdx)	# _1, *c_5(D)
# aliasPointers.cpp:4:     *c = *b;
	movl	(%rsi), %eax	# *b_7(D), _2
# aliasPointers.cpp:4:     *c = *b;
	movl	%eax, (%rdx)	# _2, *c_5(D)
# aliasPointers.cpp:5: }
	ret	
	.cfi_endproc
.LFE0:
	.size	_Z4funcPiS_S_, .-_Z4funcPiS_S_
	.p2align 4
	.globl	_Z5func2PiS_S_
	.type	_Z5func2PiS_S_, @function
_Z5func2PiS_S_:
.LFB1:
	.cfi_startproc
	endbr64	
# aliasPointers.cpp:11:     *c = *b;
	movl	(%rsi), %eax	# *b_5(D), *b_5(D)
	movl	%eax, (%rdx)	# *b_5(D), *c_4(D)
# aliasPointers.cpp:12: }
	ret	
	.cfi_endproc
.LFE1:
	.size	_Z5func2PiS_S_, .-_Z5func2PiS_S_
	.p2align 4
	.globl	_Z5func3PKiS0_Pi
	.type	_Z5func3PKiS0_Pi, @function
_Z5func3PKiS0_Pi:
.LFB2:
	.cfi_startproc
	endbr64	
# aliasPointers.cpp:17:     *c = *b;
	movl	(%rsi), %eax	# *b_5(D), *b_5(D)
	movl	%eax, (%rdx)	# *b_5(D), *c_4(D)
# aliasPointers.cpp:18: }
	ret	
	.cfi_endproc
.LFE2:
	.size	_Z5func3PKiS0_Pi, .-_Z5func3PKiS0_Pi
	.p2align 4
	.globl	_Z5func4PVi
	.type	_Z5func4PVi, @function
_Z5func4PVi:
.LFB3:
	.cfi_startproc
	endbr64	
# aliasPointers.cpp:23:     *a = 42;
	movl	$42, (%rdi)	#, *a_2(D)
# aliasPointers.cpp:24:     return *a;
	movl	(%rdi), %eax	# *a_2(D), <retval>
# aliasPointers.cpp:25: }
	ret	
	.cfi_endproc
.LFE3:
	.size	_Z5func4PVi, .-_Z5func4PVi
	.p2align 4
	.globl	_Z5test1v
	.type	_Z5test1v, @function
_Z5test1v:
.LFB4:
	.cfi_startproc
	endbr64	
# aliasPointers.cpp:33: }
	movl	$200, %eax	#,
	ret	
	.cfi_endproc
.LFE4:
	.size	_Z5test1v, .-_Z5test1v
	.p2align 4
	.globl	_Z5test2v
	.type	_Z5test2v, @function
_Z5test2v:
.LFB5:
	.cfi_startproc
	endbr64	
# aliasPointers.cpp:41: }
	movl	$121, %eax	#,
	ret	
	.cfi_endproc
.LFE5:
	.size	_Z5test2v, .-_Z5test2v
	.p2align 4
	.globl	_Z5test3v
	.type	_Z5test3v, @function
_Z5test3v:
.LFB9:
	.cfi_startproc
	endbr64	
	movl	$121, %eax	#,
	ret	
	.cfi_endproc
.LFE9:
	.size	_Z5test3v, .-_Z5test3v
	.p2align 4
	.globl	_Z5test4v
	.type	_Z5test4v, @function
_Z5test4v:
.LFB7:
	.cfi_startproc
	endbr64	
# aliasPointers.cpp:52: {
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 32
# aliasPointers.cpp:52: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp86
	movq	%rax, 8(%rsp)	# tmp86, D.2178
	xorl	%eax, %eax	# tmp86
# aliasPointers.cpp:23:     *a = 42;
	movl	$42, 4(%rsp)	#, MEM[(volatile int *)&a]
# aliasPointers.cpp:24:     return *a;
	movl	4(%rsp), %eax	# MEM[(volatile int *)&a], <retval>
# aliasPointers.cpp:55: }
	movq	8(%rsp), %rdx	# D.2178, tmp87
	xorq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp87
	jne	.L12	#,
	addq	$24, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L12:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE7:
	.size	_Z5test4v, .-_Z5test4v
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
