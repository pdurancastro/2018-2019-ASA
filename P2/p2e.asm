	.data
	
num1:	.space	2 #Estoy reservando en memoria 2 bytes
num2: 	.space  2 
	.text
	
	

main:
	la $t0, num1	#cargo el num1
	li $t1, 2
	sb $t1, 0($t0)	#guardado en la MEMORIA  asignada para num1 un 2 
	add $t0, 1	#le digo toma pilla a t0 un 1 
	lw $s1, 0($t0)	#trae en ese 0 el contenido almacenado en la direccion 0 + 0
	la $t1, num2	#cargo el num 2
	lw $s2, 0($t1)
	add $t2, $s1, $s2	#sumo el registro 1 y 2
	move $a0, $t2		#muevo a a0 el resultado
	li $v0, 1	#Muestra el resultado
	
	syscall
	li $v0, 10	#Salida del programa
	syscall
	
	