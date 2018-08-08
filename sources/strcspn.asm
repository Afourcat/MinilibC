global strcspn

SECTION	.text

strcspn:
	push	rbp
	mov	rbp, rsp
	push	0
each:
	pop	rcx
	mov	al, [rdi + rcx]
	cmp	al, 0
	je	end
	inc	rcx
	push	rcx
	xor	rcx, rcx
test:
	cmp	al, [rsi + rcx]		; if (s[x] != accept[rcx] ||
	je	pre_end			;
	cmp	byte [rsi + rcx], 0	; accept[rcx] == 0)
	je	each			; 	goto each
	inc	rcx			; rcx++
	jmp	test			; goto test
pre_end:
	pop	rcx
	dec	rcx
end:
	mov	rax, rcx
	leave
	ret
