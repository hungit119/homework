.data 
chuoi: .space 40
label: .asciiz "Nhap mot chuoi:"
label2: .asciiz "Chuoi da nhap:"
.text
main:

la			$a0, label			# $a0 = label
li			$v0, 4				# syscall print str
syscall							# execute

la			$a0, chuoi			# 
la			$a1, 30			    #  
li			$v0, 8				# $v0 = 8
syscall

la			$a0, label2			# $a0 = label2
li			$v0, 4				# syscall print str
syscall							# execute

la			$a0, chuoi			# $a0 = chuoi
li			$v0, 4				# syscall print str
syscall							# execute

li			$v0, 10				# $v0 = 10
syscall