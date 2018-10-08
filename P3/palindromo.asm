		
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
	
	
next:	
	#Leer caracter actual
	lb $t0, 0($s0)	#-- En t0 tenemos el caracter actual 
	
	#-- Imprimir el caracter actual
	li $v0, 11
	move $a0, $t0
	syscall
	
	addi $s0, $s0, 1
	
	li $t1, '\n'
	beq $t0, $t1, Puntero2
	
	b next 

Puntero2: 	
	#Guardo el valor del puntero 2
	
	
	li $v0, 10
	syscall
	
	
