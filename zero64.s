# Global Symbol _start
.globl	_start

# _start function
_start:
	
	movq $0x3C, %rax # syscall 60
	xorq %rdi,  %rdi # return value 0
	syscall
	
        # No need to return because the exit
        # syscall never returns

