	.data
num1: 	.byte  1
num2: 	.byte  2 
	.text

main:
	la $t0, num1	#cargo el num1
	lb $s1, 0($t0)	#trae a s1 el contenido almacenado en la direccion t0 + 0
	la $t1, num2	#cargo el num 2
	lb $s2, 0($t1)
	add $t2, $s1, $s2	#sumo el registro 1 y 2
	move $a0, $t2		#muevo a a0 el resultado
	li $v0, 1	#Muestra el resultado
	
	syscall
	li $v0, 10	#Salida del programa
	syscall
	
	
