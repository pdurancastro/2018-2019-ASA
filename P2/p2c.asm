	.data
str:
	.asciiz "El resultado es:"
	.text


main:
	li $v0, 5	#Le doy la instruccion de que me lea por teclado
	syscall		#llamo al sistema
	move $t0, $v0	#muevo el valor a un registro
	li $v0, 5 	#idem para el 2 numero
	syscall
	move $t1, $v0
	la $a0, str	#Cargo el string en a0
	li $v0, 4	#Imprimo el string en pantalla y llamo al sistema
	syscall
	add $t2, $t0, $t1	#sumo el registro 1 y 2
	move $a0, $t2		#muevo a a0 el resultado
	li $v0, 1
	syscall
	li $v0, 10	#Salida del programa
	syscall
	
	