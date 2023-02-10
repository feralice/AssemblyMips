#Entra com um número e usa um loop para imprimir os numeros de 0 ate esse número

.data

	espaco: .byte ' '

.text

	#ler o numero
	li $v0, 5
	syscall
	
	move $t0, $v0

	move $t1, $zero #como se fosse o I do while
	
	#rotulo para permanecer no loop
	laco:
		bgt $t1, $t0, tchau
		
		#imprime $t1, que é o I
		li $v0, 1
		move $a0, $t1
		syscall
		
		#imprime espaço em branco
		li $v0,4
		la $a0, espaco
		syscall
		
		#adicionando um ao iterador
		addi $t1, $t1, 1
		j laco
	
	#rotulo para sair do loop
	tchau:
