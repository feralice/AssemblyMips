.text
	li $t0, 32
	li $t1, 5
	
	div $t0, $t1 #divide o t0 por t1
	 
	#parte inteira da divisao está no registrador lo e vamos colocar ele em $s0
	mflo $s0
	
	#resto está no registradir hi, vamos colocar ele em %s1
	mfhi $s1