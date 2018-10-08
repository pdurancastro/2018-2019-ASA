	.data
cad:	.asciiz "Los numeros son iguales"	
	
	.text

	#--- Ejemplo para comparar dos números
	##-- Se introducen 2 numeros por la consola
	
	li $v0, 5	#Le doy la instruccion de que me lea por teclado
	syscall		#llamo al sistema
	move $s1, $v0
	
	li $v0, 5	#Le doy la instruccion de que me lea por teclado
	syscall		#llamo al sistema
	move $s2, $v0
	
	beq $s1, $s2, iguales
	
	#No son iguales
	b fin
	
iguales: #---Los numeros son iguales	
	li $v0, 4	#Le doy la instruccion de que me imprima
	la $a0, cad
	syscall	

	#--- Si son iguales hay que imprimir una cadena

fin:	li $v0, 10	#Salida del programa
	syscall
	#--- Terminar