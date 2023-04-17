	.file	"directlyReturn.cpp"
# GNU C++17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D_GNU_SOURCE
# directlyReturn.cpp -mtune=generic -march=x86-64
# -auxbase-strip tmp/directlyReturn.S -std=c++17 -fomit-frame-pointer
# -fverbose-asm -fasynchronous-unwind-tables -fstack-protector-strong
# -Wformat -Wformat-security -fstack-clash-protection -fcf-protection
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
	.globl	_Z4funcv
	.type	_Z4funcv, @function
_Z4funcv:
.LFB0:
	.cfi_startproc
	endbr64	
# directlyReturn.cpp:3:     return 42;
	movl	$42, %eax	#, _1
# directlyReturn.cpp:4: }
	ret	
	.cfi_endproc
.LFE0:
	.size	_Z4funcv, .-_Z4funcv
	.globl	_Z5func2iiiiii
	.type	_Z5func2iiiiii, @function
_Z5func2iiiiii:
.LFB1:
	.cfi_startproc
	endbr64	
	movl	%edi, -4(%rsp)	# a, a
	movl	%esi, -8(%rsp)	# b, b
	movl	%edx, -12(%rsp)	# c, c
	movl	%ecx, -16(%rsp)	# d, d
	movl	%r8d, -20(%rsp)	# e, e
	movl	%r9d, -24(%rsp)	# f, f
# directlyReturn.cpp:8:     return a;
	movl	-4(%rsp), %eax	# a, _2
# directlyReturn.cpp:9: }
	ret	
	.cfi_endproc
.LFE1:
	.size	_Z5func2iiiiii, .-_Z5func2iiiiii
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
