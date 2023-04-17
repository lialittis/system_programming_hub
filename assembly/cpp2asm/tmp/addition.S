	.file	"addition.cpp"
# GNU C++17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE addition.cpp
# -mtune=generic -march=x86-64 -auxbase-strip tmp/addition.S -std=c++17
# -fomit-frame-pointer -fverbose-asm -fasynchronous-unwind-tables
# -fstack-protector-strong -Wformat -Wformat-security
# -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexceptions -ffp-int-builtin-inexact
# -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique -fident
# -finline-atomics -fipa-stack-alignment -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-debug-strings
# -fomit-frame-pointer -fpeephole -fplt -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fshrink-wrap-separate
# -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop
# -fstack-clash-protection -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math -ftree-cselim
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.globl	_Z3addii
	.type	_Z3addii, @function
_Z3addii:
.LFB0:
	.cfi_startproc
	endbr64	
	movl	%edi, -4(%rsp)	# a, a
	movl	%esi, -8(%rsp)	# b, b
# addition.cpp:5:     return a + b;
	movl	-4(%rsp), %edx	# a, tmp84
	movl	-8(%rsp), %eax	# b, tmp85
	addl	%edx, %eax	# tmp84, _3
# addition.cpp:6: }
	ret	
	.cfi_endproc
.LFE0:
	.size	_Z3addii, .-_Z3addii
	.globl	_Z7addMul8ii
	.type	_Z7addMul8ii, @function
_Z7addMul8ii:
.LFB1:
	.cfi_startproc
	endbr64	
	movl	%edi, -4(%rsp)	# a, a
	movl	%esi, -8(%rsp)	# b, b
# addition.cpp:10:     return a + 8 * b;
	movl	-8(%rsp), %eax	# b, tmp85
	leal	0(,%rax,8), %edx	#, _1
# addition.cpp:10:     return a + 8 * b;
	movl	-4(%rsp), %eax	# a, tmp86
	addl	%edx, %eax	# _1, _4
# addition.cpp:11: }
	ret	
	.cfi_endproc
.LFE1:
	.size	_Z7addMul8ii, .-_Z7addMul8ii
	.globl	_Z4funcPii
	.type	_Z4funcPii, @function
_Z4funcPii:
.LFB2:
	.cfi_startproc
	endbr64	
	movq	%rdi, -8(%rsp)	# a, a
	movl	%esi, -12(%rsp)	# b, b
# addition.cpp:16:     return a[b];
	movl	-12(%rsp), %eax	# b, tmp87
	cltq
# addition.cpp:16:     return a[b];
	leaq	0(,%rax,4), %rdx	#, _2
	movq	-8(%rsp), %rax	# a, tmp88
	addq	%rdx, %rax	# _2, _3
	movl	(%rax), %eax	# *_3, _7
# addition.cpp:17: }
	ret	
	.cfi_endproc
.LFE2:
	.size	_Z4funcPii, .-_Z4funcPii
	.globl	_Z5func2Pim
	.type	_Z5func2Pim, @function
_Z5func2Pim:
.LFB3:
	.cfi_startproc
	endbr64	
	movq	%rdi, -8(%rsp)	# a, a
	movq	%rsi, -16(%rsp)	# b, b
# addition.cpp:24:     return a[b];
	movq	-16(%rsp), %rax	# b, tmp86
	leaq	0(,%rax,4), %rdx	#, _1
	movq	-8(%rsp), %rax	# a, tmp87
	addq	%rdx, %rax	# _1, _2
	movl	(%rax), %eax	# *_2, _6
# addition.cpp:25: }
	ret	
	.cfi_endproc
.LFE3:
	.size	_Z5func2Pim, .-_Z5func2Pim
	.globl	_Z17algebraicSimplifyii
	.type	_Z17algebraicSimplifyii, @function
_Z17algebraicSimplifyii:
.LFB4:
	.cfi_startproc
	endbr64	
	movl	%edi, -20(%rsp)	# a, a
	movl	%esi, -24(%rsp)	# b, b
# addition.cpp:29:     int c = a + b;
	movl	-20(%rsp), %edx	# a, tmp89
	movl	-24(%rsp), %eax	# b, tmp90
	addl	%edx, %eax	# tmp89, tmp88
	movl	%eax, -8(%rsp)	# tmp88, c
# addition.cpp:30:     int d = a - b;
	movl	-20(%rsp), %eax	# a, tmp94
	subl	-24(%rsp), %eax	# b, tmp93
	movl	%eax, -4(%rsp)	# tmp93, d
# addition.cpp:31:     return (c + d) / 2;
	movl	-8(%rsp), %edx	# c, tmp95
	movl	-4(%rsp), %eax	# d, tmp96
	addl	%edx, %eax	# tmp95, _1
# addition.cpp:31:     return (c + d) / 2;
	movl	%eax, %edx	# _1, tmp97
	shrl	$31, %edx	#, tmp97
	addl	%edx, %eax	# tmp97, tmp98
	sarl	%eax	# tmp99
# addition.cpp:32: }
	ret	
	.cfi_endproc
.LFE4:
	.size	_Z17algebraicSimplifyii, .-_Z17algebraicSimplifyii
	.globl	_Z13constAdditionv
	.type	_Z13constAdditionv, @function
_Z13constAdditionv:
.LFB5:
	.cfi_startproc
	endbr64	
# addition.cpp:36:     int a = 10;
	movl	$10, -8(%rsp)	#, a
# addition.cpp:37:     int b = 32;
	movl	$32, -4(%rsp)	#, b
# addition.cpp:38:     return a + b;
	movl	-8(%rsp), %edx	# a, tmp84
	movl	-4(%rsp), %eax	# b, tmp85
	addl	%edx, %eax	# tmp84, _3
# addition.cpp:39: }
	ret	
	.cfi_endproc
.LFE5:
	.size	_Z13constAdditionv, .-_Z13constAdditionv
	.globl	_Z16forConstAdditionv
	.type	_Z16forConstAdditionv, @function
_Z16forConstAdditionv:
.LFB6:
	.cfi_startproc
	endbr64	
# addition.cpp:43:     int ret = 0;
	movl	$0, -8(%rsp)	#, ret
# addition.cpp:44:     for(int i = 0; i<=100; ++i)
	movl	$0, -4(%rsp)	#, i
.L15:
# addition.cpp:44:     for(int i = 0; i<=100; ++i)
	cmpl	$100, -4(%rsp)	#, i
	jg	.L14	#,
# addition.cpp:46:         ret += i;
	movl	-4(%rsp), %eax	# i, tmp84
	addl	%eax, -8(%rsp)	# tmp84, ret
# addition.cpp:44:     for(int i = 0; i<=100; ++i)
	addl	$1, -4(%rsp)	#, i
	jmp	.L15	#
.L14:
# addition.cpp:49:     return ret;
	movl	-8(%rsp), %eax	# ret, _7
# addition.cpp:50: }
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
