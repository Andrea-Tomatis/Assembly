;ANDREA TOMATIS
;3AROB
;es039: Calcolare il prodotto di due numeri A e B dati in input, usando solo istruzioni di somma.

data segment
    ; add your data here!  
    string00 db "DATI A E B, CALCOLARE IL LORO PRODOTTO USANDO SOLO LE SOMME$"
    string01 db "inserisci un numero: $"
    string02 db "inserisci un'altro numero: $"
    string03 db "il prodotto e': $"
    acapo db 10, 13, "$"
    a db ?
    b db ?
    prod db ?
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
    
    
    ;--------INPUT DA TASTIERA----------------
    
    ;inserimento primo numero
    lea dx, string01
    mov ah, 9
    int 21h        
    
    mov ah, 1
    int 21h
    sub al, 30h
    mov a, al 
    
    lea dx, acapo
    mov ah, 9
    int 21h                                          
    
    
    ;inserimento secondo numero
    lea dx, string02
    mov ah, 9
    int 21h        
    
    mov ah, 1
    int 21h
    sub al, 30h
    mov b, al
              
              
    lea dx, acapo
    mov ah, 9
    int 21h                                          
     
               
    ;---------CICLO DI CALCOLO---------
    
    mov cx, 0
    mov cl, b  
    mov al, 0
    
    ciclo:
    cmp cl, 0
    je fine
    
    
    ;somma a ad al (il cui valore e' inizialmente 0)
    add al, a
                
    dec cl
    
    jmp ciclo  
    
    
    fine:
    ;stampa del prodotto  
    
    add al, 30h
    mov prod, al
    
    lea dx, string03
    mov ah, 9
    int 21h
    
    
    mov dl, prod
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
