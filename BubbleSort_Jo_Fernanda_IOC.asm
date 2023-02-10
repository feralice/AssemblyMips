.data

	array: .space 24
	ordenado: .space 24
	
	ola: .asciiz "Olá, entre com 6 números para adicioná-los em um vetor e depois vamos colocalos via bubble sort\n\n"
	entraNum: .asciiz "Entre com um número: "
	arrayOrdenado: .asciiz "\nAqui está o array ordenado: "
	space: .byte ' '
	
	
	
.text
	#main da função
	.main:
		li $s3,24
		jal leituraNumeros
		li $t2, 0                         # Sets $t2 to 0
		jal bSort                         # Jumps to bSort
		
		la $a0, arrayOrdenado                # Loads the message
        	li $v0, 4                         # Prints the message
        	syscall
		
		li $t1, 0                         # Loads 0 into $t1
        	li $t2, 0                         # Loads 0 into $t2
        	
        	jal printNums                     # Jumps to printNums
		
		#finaliza o programa
		li $v0, 10
    		syscall
	
	
	
leituraNumeros:

	#imprime mensagem para o usuário de boas vindas
		li $v0, 4
		la $a0, ola
		syscall
	
	move $t0, $zero #inicializa o iterador como 0, o t0 será o iterador "i" de um while
	
	lacoRepeticao:
		#if
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
		jr $ra
		
 # Bubble Sort     
    bSort:
        beq $s3, $t2, outLoop             # Branches to outLoop if the count = $s3
        addi $t5, $t2, 4                  # Adds 4 to the index and saves to $t5
        lw $t6, array($t2)            # Loads the first index to $t6
        lw $t7, array($t5)            # Loads the next index to  $t7
        bge $t7, $t6, skipTheSwap         # Branches to skipTheSwap if they are in the correct order
        sw $t6, array($t5)            # Swaps the two indexes 
        sw $t7, array($t2)            # ^
        addi $t2, $t2, 4                  # Adds 4 to get the next index
        j bSort                           # Loops back to bSort
    
    # Skips the swap      
    skipTheSwap:
        addi $t2, $t2, 4                  # Does not swap and moves to the next index
        j bSort                           # Jumps back to bSort
    
    # Outer loop
    outLoop:
        li $t2, 0                         # Resets $t2 to 0
        addi $t1, $t1, 1                  # Adds 1 to $t1
        beq $t1, $s3, acabouNumeros                 # Branches to the end of readNums  
        j bSort                           # Jumps back to bSort
    

   # Prints each element of the inputted array    
    printNums:
        beq $s3, $t2, acabouNumeros                # Branches if the index is greater than or equal to count
	addi $t2, $t2, 4                  # Adds 4 to the current index
	lw $t4, array($t2)            # Loads sortArray($t0) to $t2
	move $a0, $t4                     # Moves the current index to the argument
	li $v0, 1                         # Prints current index
	syscall
	la $a0, space                     # Prints the space
        li $v0, 4                         # Loads the space
        syscall
	b printNums                       # Jumps back to the loop
		
		
