# Global Symbol _start
.globl	_start

# _start function
_start:
#if defined(__x86_64__) || defined(__x86_64) || defined(__amd64__) || defined(__amd64)
	movq $0x3C, %rax # syscall 60
	xorq %rdi,  %rdi # return value 0
	syscall
#else
	movl $1, %eax   # syscall 1
	xorl %ebx, %ebx # return value 0
	int  $0x80      # syscall
#endif

