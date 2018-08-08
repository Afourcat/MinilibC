global strcmp

SECTION .strcmp

strcmp:
	push	rbp
	mov	rbp, rsp		; enter

	xor	rcx, rcx		; clear rcx
loop:
	mov 	al, [rsi + rcx]	; rax = *(rsi + rcx)
	mov 	bl, [rdi + rcx]	; r9 = *(rdi + rcx)
	cmp	bl, al		; if (r9 == rax)
	jne	return			; 	goto end
	cmp	eax, 0			; if (rax == 0 ||
	cmp	ebx, 0			;     rbx == 0)
	je	return			;	goto end
	inc	rcx			; rcx++
	jmp	loop			; goto loop

return:
	sub	bl, al
	movsx	rax, bl
	mov	rsp, rbp		; leave
	pop	rbp			;
	ret				; return
