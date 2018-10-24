	.data 
msg: 	.asciiz "The factorial of 10 is: "
	
	.text 
main:	la $a0, msg	#Copia la direccion de memoria msg en el registro $a0
	li $v0, 4 	#Copia el inmediato el numero 4 en el registro v0
	syscall		#llama a syscall
	
	li $a0,3	#Cargas el inmediato 3 en el registro $a0
	jal fact 	#Llamas a la funcion factorial
	
	move $a0, $v0	#El registro ra esta en el move y en el PC se almacena el subu que es la siguiente instruccion 
	li $v0, 1
	syscall
	
	li $v0,10
	syscall
	
#fact
##Registers used:
##	$a0
fact:	
	subu $sp, $sp, 32 	#Reservas el espacio de memoria de 32 bytes. Para ello restas a fc 32
				#32 bytes nos caben 8 palabras
	sw $ra, 20($sp)		#Guardas ra 20 bytes mas allas de la posicion sp
	sw $fp, 16($sp)		#Guardas el frame pointer 16 bytes mas allas de la posicion sp
	addiu $fp, $sp, 28	#Inicializas el frame pointer sp+28 se escribe hacia arriba (28+4)
	sw $a0, 0($fp)		#Almacenas lo que vale a0 en la cima de la pila
	
	lw $v0, 0($fp)		#Guardo en v0 lo que hay en 0 fp
	bgtz $v0, fact_recur	#Si v0 es mayor estrictamente que 0 se va a la etiquerta fact_recur
				#Comprobar la condicion de parada, saltas al fact_rec
	li $v0, 1		
	b return_fact
fact_recur:
	lw $v1, 0($fp)		#Carga en v1 lo que hay en a0
	subu $v0, $v1, 1	#Restas 1 y mueves a 0
	move $a0, $v0
	jal fact
	
	lw $v1, 0($fp)		#Zona especial fatorial de 1 , recupero lo que valia el a0 "n"
	mul $v0, $v0,$v1	#Hace el factorial con el anterior
	
return_fact:
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	addiu $sp,$sp,32	#Vuelves a poner el sp donde corresponde
	jr $ra			#Saltas a la zona especial del factorial de 1
				#Se ejecuta otra vez return_fact hasta que se libere toda la pila
				#Retornamos al ra inicial y sale