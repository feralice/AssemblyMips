.data
	caracter: .byte 'F' #caracter a ser impresso


.text

	li $v0,4 #instrução de impressão de char ou string
	la $a0, caracter
	syscall
	