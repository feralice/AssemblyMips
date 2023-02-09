.text

	li $t0, 2  #coloca o valor 2 no registrador t0
	li $t1, 10 #coloca o valor 10 no registrador t1
	mul $t2, $t0, $t1 # coloca no registrador t2 a multiplicação de t0 e t1
	
	li $v0,1 #chama para imprimir um inteiro
	move $a0, $t2 #coloca o valor de t2 no a0 que é o registrador para impressão
	syscall #imprime