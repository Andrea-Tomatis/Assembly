;ANDREA TOMATIS
;3AROB
;es025: Visualizzare la somma di tre numeri dati in input, controllando che siano compresi tra 0 e 5
;       (altrimenti reinserirli).

data segment
    ; add your data here! 
    string00 db "stampa 3 numeri in input compresi tra 0 e 5$"
    string01 db "inserisci il primo numero $"
    string02 db "inserisci il secondo numero $"
    string03 db "inserisci il terzo numero $" 
    string04 db "i numeri inseriti sono: $"
    acapo db 10, 13, "$"
    num1 db ?
    num2 db ?
    num3 db ?
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
    
    
    ;-----CONTROLLO INPUT NUMERO 1--------------
    controllo1:
    
    lea dx, string01    ;stampa la richiesta del primo numero in input
    mov ah, 9
    int 21h
    
    mov ah, 01          ;inserimento primo numero
    int 21h
    sub al, 30h
    mov num1, al
    
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    cmp num1, 0
    jb controllo1
    
    cmp num1, 5
    jbe controllo2
    
    jmp controllo1
    
    
    ;-----CONTROLLO INPUT NUMERO 2--------------
    controllo2:
    
    lea dx, string02    ;stampa la richiesta del secondo numero in input
    mov ah, 9
    int 21h
    
    mov ah, 01          ;inserimento secondo numero
    int 21h
    sub al, 30h
    mov num2, al
    
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    cmp num2, 0
    jb controllo2
    
    cmp num2, 5
    jbe controllo3
    
    jmp controllo2
    
    
    
    ;-----CONTROLLO INPUT NUMERO 3--------------
    controllo3:
    
    lea dx, string03    ;stampa la richiesta del terzo numero in input
    mov ah, 9
    int 21h
    
    mov ah, 01          ;inserimento terzo numero
    int 21h
    sub al, 30h
    mov num3, al
    
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    cmp num3, 0
    jb controllo3
    
    cmp num3, 5
    jnbe controllo3
    
    
    
    
    
    ;--------STAMPA---------
 
    lea dx, string04    ;stampa la stringa STRING04
    mov ah, 9
    int 21h 
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    mov al, num1
    add al, 30h
    mov num1, al
    mov dl, num1       ;stampa il primo numero
    mov ah, 02
    int 21h
           
    lea dx, acapo
    mov ah, 9
    int 21h
          
    mov al, num2
    add al, 30h
    mov num2, al       
    mov dl, num2
    mov ah, 02          ;stampa il secondo numero
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
    
    mov al, num3
    add al, 30h
    mov num3, al
    mov dl, num3      ;stampa il terzo numero
    mov ah, 02
    int 21h
    
    lea dx, acapo
    mov ah, 9
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
