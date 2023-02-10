#Programa que lê uma idade e a imprime, no formato abaixo:
#Forneça sua idade:
#Sua idade é:

.data
	#coloca os valores de strings na memória ram
	
	ola: .asciiz "Olá. Digite a sua idade: "
	saida: .asciiz "A sua idade é: "

.text

	li $v0, 4 #código para imprimir string
	la $a0, ola #coloca a string no registrador a0 para poder ser impresso
	syscall #imprime
	
	#ler o valor do teclado
	li $v0, 5 #código para ler inteiros
	syscall #quando o usuário der enter o valor fica em v0
	
	#impimindo o numero que ele colocou
	
	#preciso usar o v0 para imprimir a string saida, mas no v0 está o número que o usuário digitou,
	#então copiamos o valor q ele digitou para o registrador t0 para podermos usarmos o v0
	move $t0,$v0 
	
	li $v0, 4 #código para imprimir string
	la $a0, saida #coloca a string no registrador a0 para poder ser impresso
	syscall #imprime   "A sua idade é:"
	
	#imprime o inteiros q foi digitado
	li $v0, 1
	move $a0, $t0
	syscall
	