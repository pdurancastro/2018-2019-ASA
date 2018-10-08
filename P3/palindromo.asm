		
	#--Recorrer una cadena introducida por el usuario
	
	.data

cad:	.space 1024

	.text
	
	#-- Pedir al usuario la cadena
	li $v0, 8
	la $a0, cad
	li $a1,1024
	syscall
	
	#-- Imprimir la cadena que ha introducido el usuario
	#--(Debug)
	
	li $v0, 4
	la $a0, cad
	syscall
	
	#-- S0 es el puntero. Inicialmente apunta al primer caracter de la cadena 
	la $s0, cad
	#-- S1 es el puntero. Apunta al 1 caracter de la cadena 
	la $s1, cad
	
next:	
	#Leer caracter actual
	lb $t0, 0($s0)	#-- En t0 tenemos el caracter actual 
	
	#-- Imprimir el caracter actual
	li $v0, 11
	move $a0, $t0
	syscall
	
	
	li $t1, '\n'
	beq $t0, $t1, Puntero2
	
	addi $s0, $s0, 1
	
	b next 

Puntero2: 	
	#Guardo el valor del puntero 2
	#lb $t0, 0($s1)	#-- En t0 tenemos el caracter actual 
	subi $s0,$s0, 1
	lb $t0, 0($s0)
	
	#-- Imprimir el caracter actual
	li $v0, 11
	move $a0, $t0
	syscall
	
	#-- Imprimir el caracter actual
	lb $t1, 0($s1)
	li $v0, 11
	move $a0, $t1
	syscall
	
	
	
	li $v0, 10
	syscall
	
	
