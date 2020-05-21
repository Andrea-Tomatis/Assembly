;ANDREA TOMATIS
;3AROB
;es037: Dopo avere dato in input N, stampare i primi N numeri pari.
 
data segment
    ; add your data here! 
    string00 db "DATO N, STAMPARE I PRIMI N MULTIPLI DI A$"
    string01 db "inserisci un numero n: $"
    string02 db "inserisci un numero a: $"
    string03 db "il multiplo e': $"
    n db ?
    a db ?
    acapo db 10, 13 , "$"
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
    
    ;----------INSERIMENTO N DA TASTIERA------
    lea dx, string01
    mov ah, 9
    int 21h
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov n, al
    
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    
    lea dx, string02
    mov ah, 9
    int 21h
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov a, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
             
             
    ;------CICLO DI STAMPA MULTIPLI DI A-------
    mov cx, 0 
    mov ch, a
   
    ciclo:
    cmp cl, n
    je fine
    
    
    
    ;controllo multiplo
    mov ax, 0
    mov al, ch
    mov bl, a 
    div bl
    
    
    
    cmp ah, 0
    je multiplo
    jmp continua
    
    MULTIPLO:
    inc cl
    
    lea dx, string03
    mov ah, 9
    int 21h
           
    add ch, 30h
    mov dl, ch
    mov ah, 02
    int 21h    
    sub ch, 30h
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    continua: 
    inc ch
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
