# Global Symbol _start
.globl	_start

# _start function
_start:
	movl $1, %eax   # syscall 1
	xorl %ebx, %ebx # return value 0
	int  $0x80      # syscall

        # No need to return because the exit
        # syscall never returns

