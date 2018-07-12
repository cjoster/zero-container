# Global Symbol _start
.globl	_start

# _start function
_start:
	
	mov $0x3C, %rax # syscall 60
	mov $0,    %rdi # return value 0
	syscall
	
        # No need to return because the exit
        # syscall never returns

