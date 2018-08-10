global strstr
extern strlen

SECTION .text

strstr:
	push	rbp		; enter
	mov	rbp, rsp	; |
	xor	rbx, rbx
loop1:
	mov	al, [rdi + rbx]	; al = haystack[rcx]
	cmp	al, 0		; if (al == 0)
	je	pre_end		; 	goto end
	cmp	al, [rsi]	; if (al == needle[0])
	je	begin_test	; 	goto loop2
	inc	rbx		; rcx++
	jmp	loop1		; goto loop1
begin_test:
	xor	rcx, rcx	; rcx = 0
loop2:
	xor	r9, r9			; r9 = 0
	cmp	byte [rsi + rcx], 0	; if (needle[rcx] == 0)
	je	end			; 	goto end
	add	r9, rbx			; r9 += i
	add	r9, rcx			; r9 += j
	mov	r8b, [rdi + r9]		; r8 = haystack[r9]
	cmp	r8b, [rsi + rcx]		; if (r8 != needle[rcx])
	jne	loop1			; 	goto loop1
	inc	rcx			; rcx++
	jmp	loop2			; goto loop2
pre_end:
	xor	rdi, rdi
	xor	rbx, rbx
end:
	add	rdi, rbx
	mov	rax, rdi
	leave
	ret

; strstr {
; 	for (int i = 0; haystack[i]; ++i) {
; 		if (haystack[i] == *needle) {
; 			for (int j = 0; ; ++j) {
; 				if (needle[j] != haystack[i + j]) {
; 					break
; 				} else if (needle[j] == 0) {
; 					return haystack + i;
; 				}
; 			}
; 		}
; 	}
; 	return NULL;
; }
