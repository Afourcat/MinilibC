BITS 64

GLOBAL strcasecmp

SECTION .text

strcasecmp:
	push	rbp		; enter
	mov	rbp, rsp	; |

	xor 	rcx, rcx	; rcx = 0
loop:
	mov	al, [rdi + rcx]	; al = s1[rcx]
	mov	bl, [rsi + rcx]	; bl = s2[rcx]

	cmp	al, 0		; if (al == 0 ||
	cmp	bl, 0		; bl == 0)
	je	quit		;	goto quit

	cmp	al, bl		; if (al > bl)
	ja	is_greater	; 	goto is_greater
	jb	is_lower	; else if (al < bl)
				; 	goto is_lower
is_greater:
	sub	al, 32		; al -= 32
	jmp	end_loop	; goto end_loop

is_lower:
	sub	bl, 32		; bl -= 32

end_loop:
	cmp	al, bl		; if (al == bl)
	jne	quit		; goto quit
	inc	rcx		; rcx++
	jmp	loop		; goto loop
quit:
	sub 	al, bl		; al -= bl
	movsx	rax, al		; rax = al
	leave			; leave
	ret			; |


