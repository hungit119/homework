.data
stNhap1: .asciiz "\nNhap so nguyen 1:"
stNhap2: .asciiz "\nNhap so nguyen 2:"
tong: .asciiz "\nTong = "
hieu: .asciiz "\nHieu = "
tich: .asciiz "\nTich = "
thuong: .asciiz "\nThuong = "
.text

main:
#in ra chuỗi :"Nhap so nguyen 1:"
la			$a0, stNhap1			# 
jal			printf				# jump to printf and save position to $ra

# read integer
addi		$v0, $0, 5			# $v0 = $0 + 5
syscall
# lưu lại giá trị vừa đọc vào $t0
add		    $t0, $0, $v0			# $s0 = $v0 + 0

# in ra màn hình chuỗi : "Nhap so nguyen 2:" 
la			$a0, stNhap2			# 
jal			printf				# jump to printf and save position to $ra
# read integer
addi		$v0, $0, 5			# $v0 = $0 + 5
syscall
# lưu giá trị vừa đọc vào $t1
add		    $t1, $0, $v0			# $s0 = $v0 + 0

# tổng
add			$t2, $t0, $t1		# $t0 = $s0 + $s1
la			$a0, tong			# 
jal			printf				# jump to printf and save position to $ra
add		    $a0, $0, $t2			# $v0 = $0 + 1
add			$v0, $0, 1		# $v0 = $0 + 1
syscall

# hiệu
sub			$t2, $t0, $t1		# $t2 = $t0 - $t1
la			$a0, hieu			# 
jal			printf				# jump to printf and save position to $ra
add			$a0, $0, $t2		# $a0 = $0 + $t2
add			$v0, $0, 1		# $v0 = $0 + 1
syscall 

# thương
div		$t0, $t1			# $t0 / $t1
mflo	$t2					# $t2 = floor($t0 / $t1) 
mfhi	$t3					# $t3 = $t0 mod $t1 
la			$a0, thuong			# 
jal			printf				# jump to printf and save position to $ra
add			$a0, $0, $t2		# $a0 = $0 + $t2
add			$v0, $0, 1		# $v0 = $0 + 1
syscall 

# tích 
la			$a0, tich			# 
jal			printf				# jump to printf and save position to $ra
mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
mflo	$t2					# copy Lo to $t2
add			$a0, $0, $t2		# $a0 = $0 + $t2
add			$v0, $0, 1		# $v0 = $0 + 1
syscall 


exit:
li			$v0, 10				# $v0 = 10
syscall

printf:
li			$v0, 4				# $v0 = 4
syscall
jr			$ra					# jump to $ra
