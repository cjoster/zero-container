# Global Symbol _start
.globl	_start

# _start function
_start:
	movl $1, %eax   # Syscall 1
	xorl %ebx, %ebx # return value 0
	int  $0x80      # Syscall

        # No need to return because the exit
        # syscall never returns

