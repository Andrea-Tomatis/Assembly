;ANDREA TOMATIS
;3AROB
;es028:Dato in input un valore, stampare pari se e' pari, dispari se e' dispari. Ripetere per N
;volte.                                                         


data segment
    ; add your data here! 
    string00 db "STAMPARE SE UN VALORE E' PARI O DISPARI N VOLTE$"  
    string01 db "inserisci un numero: $"
    string02 db "inserisci il numero di stampe: $"
    string03 db "il numero e' pari$"
    string04 db "il numero e' dispari$"
    num db ?
    n db ?
    acapo db 10, 13, "$"
    
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
    lea dx, string00    ;stampa il titolo e va a capo
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    
    ;---------INSERIMENTO N------------
    lea dx, string02
    mov ah, 9
    int 21h
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov n, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    ;-----CICLO DI STAMPA + CONTROLLO PARITA'-------------
    
    mov cx, 0
    mov cl, n
    
    ciclo:
    cmp cl, 0
    je fine
    dec cl
    
    ;---------INSERIMENTO NUM------------
    lea dx, string01
    mov ah, 9
    int 21h
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov num, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    
    mov ax, 0
    mov al, num
    mov bl, 2
    div bl
    cmp ah, 0  ;controlla parita'
    je pari
    
    dispari:          ;stampa e' dispari
    lea dx, string04
    mov ah, 9
    int 21h
    jmp fineciclo
    
    pari:             ;stampa e' pari
    lea dx, string03  
    mov ah, 9
    int 21h
    
    fineciclo:
    lea dx, acapo
    mov ah, 9
    int 21h
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
