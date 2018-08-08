SECTION	.text

global rindex 

rindex:
	push	rbp		; enter
	mov	rbp, rsp	; |

	xor	rcx, rcx	; rcx = 0
	xor	rdx, rdx	; rdx = 0
	push	rdi		; saved = rdi
	call	strlen		; rax = strlen(rdi)
	mov	rdx, rax	; rdx = rax
	pop	rdi		; rdi = saved
	add	rdi, rdx	; rdx += rdi
counter:
	cmp	byte [rdi + rcx], sil	; if (str[i + rcx] == test)
	je	end			; 	goto end
	dec	rcx			; rcx--
	jmp	counter			; goto counter
end:
	add	rdi, rcx		; rdi += rcx
	mov	rax, rdi		; rax = rdi

	mov	rsp, rbp		; leave
	pop	rbp			; |
	ret				; |

; strlen function
strlen:
         push    rbp             	; enter
         mov     rbp, rsp        	; |

         xor     rdx, rdx        	; clear rdx
 loop:
         cmp     byte [rdi + rdx], 0    ; if (*(str + rdx) == 0)
         je      end_loop		;       goto end
         inc     rdx                    ; rdx++
         jmp     loop			; goto counter
 end_loop:
         mov     rax, rdx               ; returned = rdx
         mov     rsp, rbp               ; leave
         pop     rbp                    ; |
         ret 				; |
