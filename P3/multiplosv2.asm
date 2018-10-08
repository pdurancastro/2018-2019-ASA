#--Programa que imprima 2 numeros del 1 al 10 (bucle)
	.data
	NumA:	.asciiz "Numero A: "	
	NumB: 	.asciiz "Numero B: "
	
	
	.text
	
	#--- Lee los datos
	##-- Se introducen 2 numeros por la consola
	
	li $v0, 4	#Le doy la instruccion de que me imprima
	la $a0, NumA
	syscall	
	
	li $v0, 5	#Le doy la instruccion de que me lea por teclado
	syscall		#llamo al sistema
	move $s1, $v0
	
	li $v0, 4	#Le doy la instruccion de que me imprima
	la $a0, NumB
	syscall	
	
	li $v0, 5	#Le doy la instruccion de que me lea por teclado
	syscall		#llamo al sistema
	move $s2, $v0
	
	#--Registro índice: i
	li $s0, 0
	
next:	
	#--Incrementa el indice
	add $s0, $s0, 1
	
	#--Multiplicar valores
	mul $s3, $s1,$s0
	
	beqz $s2, fin
	
	#--Print i : imprimir resultado
	li $v0, 1
	move $a0, $s3
	syscall
	
	#--Imprimir /n
	li $v0, 11
	li $a0, '\n'
	syscall
	
	#-- Quiero comparar con el numero 2 o B tengo que meterlo en un registro
	#-- Si i = B, terminar
	beq $s0,$s2, fin
	
	
	#-- La i es < B
	b next
	
fin: 	li $v0, 10	#Salida del programa
	syscall
	#--- Terminar
