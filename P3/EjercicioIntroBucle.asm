	#--Programa que imprima 2 numeros del 1 al 10 (bucle)
	
	
	.text
	
	#--Registro índice: i
	li $s0, 0
	
next:	
	#--Incrementa el indice
	add $s0, $s0, 1
	
	#--Print i : imprimir indice
	li $v0, 1
	move $a0, $s0
	syscall
	
	#--Imprimir /n
	li $v0, 11
	li $a0, '\n'
	syscall
	
	#-- Quiero comparar con el numero 10 tengo que meterlo en un registro
	#-- Si i=10, terminar
	li, $t0,10
	beq $s0, $t0, fin
	
	#-- La i es < 10
	b next
	
fin: 	li $v0, 10	#Salida del programa
	syscall
	#--- Terminar