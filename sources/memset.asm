global memset

SECTION .text

memset:
	push	rbp		; enter
	mov	rbp, rsp	;
	
	xor	rcx, rcx	; rcx = 0
loop:
	cmp	rcx, rdx	; if (rcx == rdx)
	je	end		;	goto end
	mov	[rdi + rcx], rsi; *(ptr + rcx) = rsi
	inc	rcx		; rcx++
	jmp	loop		; goto loop
end:
	mov	rax, rdi	; returned = rdi
	mov	rsp, rbp	; leave
	pop	rbp		;
	ret			; return
