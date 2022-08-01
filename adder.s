			.data							#data segment
str1:		.asciiz		"Operating A: \n "
str2:		.asciiz		"\nOperating B: \n"
str3:		.asciiz		"The result is: "
			.align		2					# secure aligment
numA:		.space		4					# reserve a space for a word
numB:		.space		4
result:		.space		4

			.text							# Start of code segment
			.globl		main				# etiqueta main global
main: 		la			$a0, str1			# upload content of string 1 in register a0 
			li			$v0, 4				# call the print string service
			syscall							# calling the system
			
			li			$v0, 5				# call to the service read int
			syscall							# System calling
			sw			$v0, numA			# storage the word for the user in the space reserved for num A

			li			$v0,4
			la			$a0, str2
			syscall
			
			li			$v0, 5
			syscall
			sw			$v0, numB

			lw			$t1, numA			# Load the content of numA in register t1
			lw			$t3, numB			# Load the content of numB in register t3
			add			$t0, $t1, $t3		# Adding the contents of the registers t1 and t3, and storage in t0
			sw			$t0, result			# Storage the content of t0 in result
			
			la			$a0, str3
			li			$v0, 4
			syscall
			
			
			li			$v0, 1
			add			$a0, $t0, $0		# Storage in a0, the result of the sum in a0
			syscall
			
			li			$v0, 10				# Exit
			syscall							# calling the system to exit
			