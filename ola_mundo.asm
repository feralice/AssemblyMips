.data #área para dados na memória principal
	msg: .asciiz "Olá, mundo!" #mensagem a ser exibida para o usuário
	
.text
	#área para instruções do programa
	
	#instrução para impressão de string
	li $v0, 4
	la $a0, msg #indicar o endereço em que está a mensagem
	syscall #imprima