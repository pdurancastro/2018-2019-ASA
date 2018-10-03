	.data
	
num1:	.space	3 #Estoy reservando en memoria 2 bytes
num2: 	.space  3 
	.text
	
	

main:
	la $t0, num1	#cargo la direccion de memoria donde empieza num1
	la $t1, num2	
	li $t3, 2	#Almaceno un 2 en el registro 3 para luego darselo al 1
	li $t4, 3
	#Asignar t3 a t0 Chocolate->casa  Registro-> memoria
	sh $t3, 0($t0)	#guardado en la MEMORIA  asignada para num1 un 2
	sh $t4, 0($t1) 
	add $t5,$t3,$t4 #Suma del valor de t3 y t4 y lo guardo en t5 
	
	move $a0, $t5	#Mueve a a0 el resultado
	li $v0, 1	#Muestra el resultado
	syscall
	
	li $v0, 10	#Salida del programa
	syscall
	
	
