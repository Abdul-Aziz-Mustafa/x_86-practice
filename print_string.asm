 section .data
	text1 db "Hello", 10, 0
	text2 db "This is some other text", 10, 0

section .text
	global _start

_start:
	mov rax, text1
	call _print
	mov rax, text2
	call _print

	mov rax, 60
	mov rdi, 0
	syscall

_print:
	push rax

	mov rbx,0
	;initialized i=0

_printLoop:

	inc rax
	;moving in character of string i.e h to e to l
	inc rbx
	;increasing i
	mov cl,[rax]
	;cl is a 8 bit regiter i.e can store only 1 register lol abobve command will move the value of rax in cl eg if we have "xyz" then cl has x so we w ereach 0 after new linw
	cmp cl, 0
	jne _printLoop
	mov rax, 1
	mov rdi, 1
	pop rsi
	;storig the rax in rsi
	mov rdx, rbx
	syscall
	ret
