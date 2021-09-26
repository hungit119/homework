.data
stNhap: .asciiz "Nhap vao 1 ki tu:"
stXuatTruoc:"\nKi tu dung truoc "
stXuatSau:"\nKi tu dung sau "
stLa: .asciiz " la: "
.text
main:

# in ra chuỗi : "Nhap vao 1 ki tu" ra màn hình

la			$a0, stNhap			# 
jal			printf				# jump to printf and save position to $ra



addi		$v0, $0, 12			# $v0 = $0 + 12 // read char
syscall
addi		$s0, $v0, 0			# $s0 = $v0 + 0

#xuất ra màn hình chuỗi :"Ki tu dung truoc"

la			$a0, stXuatTruoc	#  
jal			printf				# jump to printf and save position to $ra

# xuất ra kí tự đọc được từ bàn phím

addi		$a0, $s0, 0		    # $a0 = $s0 + 0
addi		$v0, $0, 11			# $v0 = $0 + 11
syscall

# xuất ra màn hình chuỗi : "la:"

la			$a0, stLa			# 
jal			printf              # jump to printf and save position to $ra

#lấy ra kí tự đứng trước kí tự trong $s0 và in ra màn hình

addi		$a0, $s0, -1			# $a0 = $s0 + -1
addi		$v0, $0, 11			# $v0 = $0 + 11
syscall

# in ra chuỗi :"Ki tu dung sau "

la			$a0, stXuatSau			# 
jal			printf				# jump to printf and save position to $ra

#in ra kí tự đọc được từ bàn phím

addi		$a0, $s0, 0			# $a0 = $s0 + 0
addi		$v0, $0, 11			# $v0 = $0 + 11
syscall

# in ra chuỗi :"la:"

la			$a0, stLa			# 
jal			printf				# jump to printf and save position to $ra

#lấy ra kí tự đứng sau kí tự trong $s0 rồi in ra kí tụ đó

addi		$a0, $s0, 1			# $a0 = $s0 + 1
addi		$v0, $0, 11			# $v0 = $0 + 11
syscall

#thoát 

exit:
addi		$v0, $0, 10			# $v0= $0 + 10
syscall

# in ra màn hình:

printf:
addi		$v0, $0, 4			# $v0 = $0 + 4
syscall
jr			$ra					# jump to $ra
