;ANDREA TOMATIS
;3AROB
;es026: Dare in input il numero di asterischi da stampare e stamparli. Ripetere per N volte.

data segment
    ; add your data here!
    string00 db "STAMPARE N VOLTE NUM ASTERISCHI$"
    string01 db "inserisci il numero di asterischi da stampare $"
    string02 db "inserisci il numero di volte da stampare gli asterischi $"
    acapo db 10, 13, "$"
    num  db ?
    n db ?
    car db "*"
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
    
    lea dx, string00   ;stampa il titolo e va a capo
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
             
    
    lea dx, string01    ;richiesta numero di asterischi
    mov ah, 9
    int 21h
    
    mov ah, 01      ;inserimento numero asterischi
    int 21h
    sub al, 30h
    mov num, al
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    lea dx, string02    ;richiesta numero di volte da stampare gli asterischi
    mov ah, 9
    int 21h
    
    mov ah, 01      ;inserimento numero volte
    int 21h
    sub al, 30h
    mov n, al 
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    
    ;----CICLI DI STAMPA-----
    mov cx, 0
 
    
    ciclo: ;ciclo che stampa N vole NUM asterischi 
    
    cmp cl, n
    je fine
        
    inc cl   
    
    cicloStampa:  ;ciclo che stampa NUM asterischi  
    
    cmp ch, num
    je ciclo
    
    inc ch
    
    mov dl, car ;stampa l'asterisco
    mov ah, 02
    int 21h 
    
    
    jmp cicloStampa
    
    
    
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
