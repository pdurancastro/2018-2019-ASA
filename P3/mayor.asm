	.data
cad1:	.asciiz "El numero 1 es mayor que el 2: "	
cad2: 	.asciiz "El numero 2 es mayor que el 1: "	
	
	.text

	#--- Ejemplo para comparar dos números
	##-- Se introducen 2 numeros por la consola
	
	li $v0, 5	#Le doy la instruccion de que me lea por teclado
	syscall		#llamo al sistema
	move $s1, $v0
	
	li $v0, 5	#Le doy la instruccion de que me lea por teclado
	syscall		#llamo al sistema
	move $s2, $v0
	
	bgt  $s1, $s2, biggerthan1
	
	#El numero 2 es mayor que el primero
	b biggerthan2
	
biggerthan1: #---Los numeros son iguales	
	li $v0, 4	#Le doy la instruccion de que me imprima
	la $a0, cad1
	syscall	
	
	move $a0,$s1
	li $v0, 1
	syscall
	
	li $v0, 10	#Salida del programa
	syscall
	#--- Terminar

biggerthan2:
	li $v0, 4	#Le doy la instruccion de que me imprima
	la $a0, cad2
	syscall	
	
	move $a0,$s2
	li $v0, 1
	syscall
	
	li $v0, 10	#Salida del programa
	syscall
	#--- Terminar
