.data
stNhap: .asciiz "Nhap vao 1 ki tu:"
stHoa: .asciiz "\nKi tu in hoa la:"
.text
main:
#in ra chuỗi :"Nhap vao 1 ki tu"
la			$a0, stNhap			# 
jal			printf				# jump to printf and save position to $ra

# đọc kí tự
addi		$v0, $0, 12			# $a0 = $0 + 12
syscall
addi		$s0, $v0, 0			# $s0 = $v0 + 0
#in ra kí tự in hoa
la			$a0, stHoa			# 
jal			printf				# jump to printf and save position to $ra

# tìm kí tự in hoa
addi		$a0, $s0, 32			# $a0 = $s0 + -32
addi		$v0, $0, 11			# $v0 = $0 + 11
syscall

# thoát
exit:
li			$v0, 10				# $v0 = 10
syscall

# nhãn lệnh in ra màn hình
printf:
addi		$v0, $0, 4			# $v0 = $0 + 4
syscall
jr			$ra					# jump to $ra
