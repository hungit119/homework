.data
stNhap1: .asciiz "\nNhap so thu 1:"
stNhap2: .asciiz "\nNhap so thu 2:"
stXuat: .asciiz "\nSo lon hon la :"
.text
main:

la			$a0, stNhap1			# 
jal			printf				# jump to printf and save position to $ra

addi		$v0, $0, 5			# $v0 = $0 + 5
syscall

add			$t0, $0, $v0		# $t0 = $0 + $v0

la			$a0, stNhap2			# 
jal			printf				# jump to printf and save position to $ra

addi		$v0, $0, 5			# $v0 = $0 + 5
syscall

add			$t1, $0, $v0		# $t0 = $0 + $v0

slt         $t2,$t0,$t1
beq			$t2, $zero, result2	# if $t2 == $zero then result2
beq			$t2, 1, result	# if $t2 == 1 then result

result:
la			$a0, stXuat			# 
jal			printf				# jump to printf and save position to $ra
add			$a0, $0, $t1		# $a0 = $0 + $t1
add			$v0, $0, 1		# $v0 = $0 + 1
syscall
jal			exit				# jump to exit and save position to $ra


result2:
la			$a0, stXuat			# 
jal			printf				# jump to printf and save position to $ra
add			$a0, $0, $t0		# $a0 = $0 + $t0
add			$v0, $0, 1		# $v0 = $0 + 1
syscall
jal			exit				# jump to exit and save position to $ra

exit:
li			$v0, 10				# $v0 = 10
syscall

printf:
li			$v0, 4				# $v0 = 4
syscall
jr			$ra					# jump to $ra

