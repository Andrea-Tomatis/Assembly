;ANDREA TOMATIS
;3AROB
;es016:Date due variabili A e B, sottrarre la minore dalla maggiore finché il risultato resta positivo
;e contare quante volte è stata effettuata la sottrazione(usare JLE anziché JBE).

data segment
    ; add your data here!  
    a db 3
    b db 9
    conta db 0
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here 
    mov al,a 
    cmp al, b
    jb bMaggiore
    mov cl, a
    mov ch, b
    JMP ciclo
       
    bMaggiore:
    mov cl, b
    mov ch, a
               
    ciclo:
    cmp cl, 0
    jle fine
    sub cl, ch
    inc conta
    jmp ciclo 
    
    fine:
    
    
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
