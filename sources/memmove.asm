BITS 64

global memmove

SECTION .bss
	array	resd 1

SECTION .text

memmove:
	push	rbp		; enter
	mov	rbp, rsp	; |
	xor	rcx, rcx	; rcx = 0
; test if overlap
	cmp	rsi, rdi
	je 	end
	jl	less
greater:
	call	memcpy
quit:
	mov	rax, rdi	; return rdi
	mov	rsp, rbp	; leave
	pop	rbp		; | 
	ret			; |

less:
	mov	rbx, rsi	; rbx = src
	add	rbx, rdx	; rbx += size 
	cmp	rbx, rdi	; if (rbx < dest)
	jl	greater		; 	goto greater
	mov	rcx, rbx	; rcx = size
loop2:
	cmp 	rcx, 0		; if (rcx == 0)
	je	quit		; 	goto end
	mov	bl, [rsi + rcx]	; bl = src[rcx]
	mov	[rdi + rcx], bl	; dest[rcx] = bl
	dec	rdx		; rdx--
	jmp	loop2		; goto loop2



memcpy:
        push    rbp             ; enter
        mov     rbp, rsp        ;

        xor     rcx, rcx        ; rcx = 0
loop:
        cmp     rcx, rdx                        ; if (rcx == rdx)
        je      end                             ;       goto end
        mov     rax, [rsi + rcx]                ; rax = *(src + rcx)
        mov     byte [rdi + rcx], al            ; *(dest + rcx) = rax
        inc     rcx                             ; rcx++
        jmp     loop                            ; goto loop
end:
        mov     rax, rdi        ; returned = rdi
        mov     rsp, rbp        ; leave
        pop     rbp             ;
        ret                     ; return
