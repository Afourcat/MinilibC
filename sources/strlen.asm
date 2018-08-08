global strlen

SECTION .text

strlen:
	push	rbp		; enter
	mov	rbp, rsp	; 
	
	xor	rdx, rdx	; clear rdx
counter:
	cmp 	byte [rdi + rdx], 0	; if (*(str + rdx) == 0)
	je	end			; 	goto end
	inc	rdx			; rdx++
	jmp	counter			; goto counter
end:
	mov	rax, rdx		; returned = rdx
	mov	rsp, rbp		; leave
	pop	rbp			; 
	ret				; return 
