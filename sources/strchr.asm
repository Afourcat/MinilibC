global strchr

SECTION	.text

strchr:
	push	rbp
	mov	rbp, rsp

	xor	rcx, rcx
counter:
	cmp	byte [rdi + rcx], sil
	je	end
	inc	rcx
	jmp	counter
end:
	add	rcx, rdi
	mov	rax, rcx

	mov	rsp, rbp
	pop	rbp

	ret
