global memcpy 

SECTION .text

memcpy:
	push	rbp		; enter
	mov	rbp, rsp	;
	
	xor	rcx, rcx	; rcx = 0
loop:
	cmp	rcx, rdx			; if (rcx == rdx)
	je	end				;	goto end
	mov	rax, [rsi + rcx]		; rax = *(src + rcx)
	mov	byte [rdi + rcx], al		; *(dest + rcx) = rax
	inc	rcx				; rcx++
	jmp	loop				; goto loop
end:
	mov	rax, rdi	; returned = rdi
	mov	rsp, rbp	; leave
	pop	rbp		;
	ret			; return
