	.data 
array:  .word 10,11,12,13
	.byte 0x1a,0x0b,10 
	.ascii   "Simulador MARS"
	.asciiz  ", MIPS32"
index:  .word 1
	.text         
main:   
	li $t7, 4 #Me sirve como un puntero en los valores de word
	lw      $t0, array($zero) #puedo cambiar zero por $t7 y entonces sale la palabra 11
	lw      $t5, index($zero) 
	addi 	$t4, $zero, 4 
	mult    $t4, $t5           
	mflo    $t6              
	lw      $t1, array($t6)    
	addi    $t5, $t5, 1                    
	mult    $t4, $t5    
	mflo    $t6
	lw      $t2, array($t6)   
	addi    $t5, $t5, 1   
	mult    $t4, $t5
	mflo    $t6
	lw      $t3, array($t6)
	li 	$v0, 10            
	syscall
