global strpbrk 

SECTION	.text

strpbrk:
	push	rbp
	mov	rbp, rsp
	push	0		; stack = 0
each:
	pop	rcx		; rcx = stack
	mov	al, [rdi + rcx] ; al = s[rcx]
	cmp	al, 0		; if (al == 0)
	je	not_found	; 	goto end
	inc	rcx		; rcx++
	push	rcx		; stack = rcx
	xor	rcx, rcx	; rcx = 0
test:
	cmp	al, [rsi + rcx]		; if (al == accept[rcx])
	je	found			; 	goto pre_end
	cmp	byte [rsi + rcx], 0	; 
	je	each			;			
	inc	rcx			
	jmp	test			
not_found:
	xor	rax, rax
	jmp	end
found:
	pop	rcx
	dec	rcx
	add	rdi, rcx
	mov	rax, rdi
end:
	leave
	ret
