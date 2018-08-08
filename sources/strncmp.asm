global strncmp

SECTION .text

strncmp:
	push	rbp
	mov	rbp, rsp	; enter

	xor	rcx, rcx	; clear rcx
loop:
	mov 	al, [rsi + rcx]	; rax = *(rsi + rcx)
	mov 	bl, [rdi + rcx]	; r9 = *(rdi + rcx)
	cmp	bl, al		; if (r9 == rax)
	jne	return		; 	goto end
	inc	rcx		; rcx++
	cmp	rcx, rdx	;     rbx == 0)
	je	return		;	goto end
	jmp	loop		; goto loop
return:
	sub	bl, al
	movsx	rax, bl
	mov	rsp, rbp	; leave
	pop	rbp		;
	ret			; return
