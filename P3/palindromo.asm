		
	#--Recorrer una cadena introducida por el usuario
	
	.data

CadCorrecto : .asciiz "La palabra es palindromo"
CadError: .asciiz "La palabra no es palindromo"


cad:	.space 1024

	.text
	
	#-- Pedir al usuario la cadena
	li $v0, 8
	la $a0, cad
	li $a1,1024
	syscall
	
	#-- Imprimir la cadena que ha introducido el usuario
	#--(Debug)
	
	#li $v0, 4
	#la $a0, cad
	#syscall
	
	#-- S0 es el puntero. Inicialmente apunta al primer caracter de la cadena 
	la $s0, cad
	#-- S1 es el puntero. Apunta al 1 caracter de la cadena lo guardo porsi 
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
	
	#-- Imprimir el caracter final
	#li $v0, 11
	#move $a0, $t0
	#syscall
	
	#-- Imprimir el caracter inicial
	#lb $t1, 0($s1)
	#li $v0, 11
	#move $a0, $t1
	#syscall
	
	b Comparacion

Comparacion:

	lb $t0,0($s0)
	lb $t1,0($s1)
	addi $s1, $s1, 1
	subi $s0,$s0, 1
	
	# Si el valor del caracter no es igual acabas
	bne $t0,$t1, Error
	# Si el puntero apunta al mismo lado termina el programa 
	beq $s0,$s1, Correcto
	
	#s0>s1 falta la comparacion 
	bgt $s0,$s1, Correcto
	
	#Comparacion de caracteres
	#beq $t0,$t1, Comparacion, Es lo mismo que lo de abajo
	b Comparacion
	
Correcto: 
	
	li $v0, 4
	la $a0, CadCorrecto
	syscall
	
	b Final
	
Error:
	li $v0, 4
	la $a0, CadError
	syscall
	
	b Final

Final:		
	li $v0, 10
	syscall
	
	
