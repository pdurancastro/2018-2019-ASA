	.data
cad:	.space 1024
num:	.word 0

	.text
	
	#-- Pedir al usuario la cadena
	li $v0, 8
	la $a0, cad
	li $a1,1024
	syscall
	
	#-- Imprimir la cadena que ha introducido el usuario
	#-- Debug
	#li $v0, 4
	#la $a0, cad
	#syscall
	
	#-- S0 es el puntero de cadena
	la $s0, cad
	#-- S1 es el puntero. Apunta al 1 caracter de la cadena lo guardo porsi 
	#la $s1, cad
	#-- S2 es el num
	la $s2, 0

next:	
	#Leer caracter actual
	lb $t0, 0($s0)	#-- En t0 tenemos el caracter actual 
	
	#-- Imprimir el caracter actual
	li $v0, 11
	move $a0, $t0
	syscall
	
	li $t1, '\n'
	beq $t0, $t1, Final
	
	#-- Almacenar en num
	move $s2,$t0 
	
	#-- num = num x 10
	mulo $s2,$s2,10
	
	#-- num = num + (nextchar - 0)
		#-- nextchar registro s3
		addi $s3, $s0, 1
		subi $s3, $s3, 0
		add $s2, $s2, $s3
	
	addi $s0, $s0, 1
	
	b next 

Final:		
	
	#Con estoy estoy asegurando que mi puntero esta en \n y termina el programa
	
	#subi $s0,$s0, 1
	#lb $t0, 0($s0)
	#-- Imprimir el caracter final
	#li $v0, 11
	#move $a0, $t0
	#syscall
	
	
	li $v0, 10
	syscall 
