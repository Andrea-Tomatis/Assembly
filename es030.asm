;ANDREA TOMATIS
;3AROB
;es030: Dati in input N numeri, visualizzare il minimo.

data segment
    ; add your data here!
    string00 db "DATI N NUMERI, STAMPARE IL MINIMO$"
    string01 db "inserisci il numero di input: $"
    string02 db "inserisci un numero: $"
    string03 db "il minimo e': $"
    acapo db 10, 13, "$" 
    
    num db ?
    n db ?
    min db ?
    
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
    
    
    ;----------INSERIMENTO N---------------
    
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
    
    ;-----------CICLO DI STAMPA-------------
    mov cx, 0
    mov cl, n
    
    ciclo:
    
    cmp cl, 0
    je fine
    dec cl
    
    ;-----INSERIMENTO NUMERI--------------  
    lea dx, string02
    mov ah, 9
    int 21h  
    
    mov ah, 01
    int 21h
    sub al, 30h
    mov num, al 
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    ;-----CONTROLLO DEL MINIMO-------
    cmp cl, 1            ;se e' il primo giro a num assegno min
    jne controlloMinimo 
    
    mov al, num
    mov min, al
    jmp continua
    
    controlloMinimo:    ;confronta il numero con il minimo
    mov al, num
    cmp al, min
    ja continua
    mov min, al
    
    
    continua:
    jmp ciclo
    
    
    
    fine:   
    ;-----------STAMPA IL MINIMO----------------
    lea dx, string03
    mov ah, 9
    int 21h
    
    mov al, min
    add al, 30h
    mov dl, al
    mov ah, 02
    int 21h
            
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
