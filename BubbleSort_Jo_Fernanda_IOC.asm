.data

	#Aloca memória para o vetor de 6 elementos (4 bytes x 6 = 24)
	array: .space 24
	
	#variáveis para realizarmos a impressão
	
	ola: .asciiz "Olá, entre com 6 números para adicioná-los em um vetor e depois vamos colocalos via bubble sort\n\n"
	entraNum: .asciiz "Entre com um número: "
	arrayOrdenado: .asciiz "\nAqui está o array ordenado: "
	space: .byte ' ' #Para colocar o espaço entre os números na impressão final
	
	
	
.text
	#main da função
	.main:
		li $s3,24			#coloca o tamanho do vetor no registrador s3
		jal leituraNumeros		#chama a função para o usuário entrar com os números colocando eles em um vetor
		li $t2, 0 			#inicializa o registrador t2 com 0, para usarmos ele na função bubbleSort
		jal bubbleSort 			#chama a função para ordenar o vetor usando bubble sort
		
		#impressão de mensagem para mostrar o array
		la $a0, arrayOrdenado 
        	li $v0, 4 
        	syscall
		
		li $t1, 0 			#coloca 0 no t1
        	li $t2, 0 			#coloca 0 no t2
        	
        	jal printNums 			#chama a função para imprimir o array ordenado
	
	
	leituraNumeros:

		#imprime mensagem para o usuário de boas vindas
		li $v0, 4
		la $a0, ola
		syscall
	
		move $t0, $zero #inicializa o iterador como 0, o t0 será o iterador "i" de um while
	
		lacoRepeticao:
			#if t0<s3 (iterador<tamanho do vetor)
			beq $s3, $t0, acabouNumeros
		
			#adiciona mais um ao iterador, como um num inteiro pega 4 bytes adicionamos +4
			addi $t0, $t0, 4
		
			#imprime mensagem para o usuário inserir numero
			la $a0, entraNum
			li $v0, 4
			syscall
		
			#ler o número e colocar no array para ordená-lo ele depois
			li $v0, 5 #comando para ler inteiro
			syscall
		
			#move para outro registrador e coloca no array
			move $t1, $v0
			sw $t1, array($t0)
		
			j lacoRepeticao
		
	acabouNumeros:
		#retorna
		jr $ra
		
    
    	bubbleSort:
       		beq $s3, $t2, loopExterno 			#if (iterador < tamVetor)
        	addi $t5, $t2, 4 			#adiciona +4 em t2 e salva em t5
       		lw $t6, array($t2) 			#carrega o primeiro indice em t6
        	lw $t7, array($t5) 			#carrega o próximo indice em t7
        	bge $t7, $t6, pulaTroca 		#pula para a função pulaTroca se já estiver na ordem certa
        	
        	#troca os dois índices para ordenar
        	sw $t6, array($t5)            
        	sw $t7, array($t2)            
        	
        	addi $t2, $t2, 4 			#iterador+4
        	
        	j bubbleSort                          #loop volta para bubbleSort até todo o vetor ser percorrido
    
    #Função para pular a troca dos indices     
    pulaTroca:
        addi $t2, $t2, 4                  		#vai para o próximo índice
        
        j bubbleSort                           	#volta para a função bubbleSort
    
    #loop externo do bubbleSort
    loopExterno:
        li $t2, 0                         		#t2 é 0
        addi $t1, $t1, 1                  		#t1 + 1
        beq $t1, $s3, acabouNumeros 			#verifica se vetor já foi todo percorrido
        
        j bubbleSort 					#volta para o bubbleSort
    

   #Função para imprimir todos os elementos do vetor já ordenado
    printNums:
        beq $s3, $t2, acabouNumeros 			#if(iterador<=tamanhovetor)
	addi $t2, $t2, 4 				#iterador+4
	lw $t4, array($t2) 				#carrega o elemento para t4
	move $a0, $t4 					#move o indice para a0
	li $v0, 1					#imprime o elemento
	syscall
	la $a0, space                     		#printa o espaço
        li $v0, 4                         
        syscall
        
	b printNums                       		#retorna loop
		
		
