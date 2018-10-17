	.data
cad: 	.space 1024
num:	.word 0

	.text

	#--- Lectura de una cadena de caracteres (1024)
	li $v0, 8
	la $a0, cad
	li $a1,1024
	syscall

	#-- S0 es el puntero. Apunta al caracter
	la $s0, cad
	
	#-- S1 es el num
	la $s1, 0
	
	#-- S2 es el valor ascii/caracter de los valores que extraigo
	la $s2, cad

bucle:
	#--- Mientras que el caracter no sea \n
	#-----Leer caracter de la cadena
	lb $s2,0($s0)
	
	#----Compararlo con \n
	#----Si es \n terminar
	li $t1, '\n'
	beq $s2, $t1, terminar
	
	
	#---- num = num *10; num sera mi registro
	li $t2, 10
	mult $s1,$t2
	mflo $s1
	
	#---- num = num + (nextchar - '0');
	#--- $s1 = $s1 + ($s2 - '0')
	#--- Operacion ($s2 - '0')
	subi $s2, $s2, '0'
	add $s1, $s1, $s2
	
	#---Apuntar al siguiente caracter
	addi $s0,$s0,1
	#---- Repetir bucle
	b bucle
	
terminar:
	#--Terminar
	#--Imprimir el numero en consola

	li $v0, 1
	move $a0, $s1
	syscall
	
	la $a1,num
	sw $s1,0($a1)
	
	#Salir


	
