;ANDREA TOMATIS
;3AROB
;es042:Caricare il vettore somma di 2 vettori paralleli di N elementi precaricati (caricati in fase di
;       dichiarazione); stampare poi i 3 vettori

data segment
    vett1 db 1,2,3,4,5
    vett2 db 4,3,3,1,2
    vett3 db 5 dup(?)
    dim db 5
    string00 db "SOMMARE DUE VETTORI IN UN TERZO VETTORE$"
    string01 db "i vettori contengono: $"
    acapo db 10, 13, "$"    
    spazio db 32, "$"
    
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
    
    ;----------------------------
    ;CICLO DI CARICAMENTO DEL TERZO VETTORE
    ;---------------------------------------
    
    mov cx, 0
    mov cl, dim  
    mov si, 0
    mov di, 0
    ciclo:
    mov al, vett1[si]
    add al, vett2[si]
    mov vett3[di], al
              
    inc di
    mov si, di
    
    loop ciclo 
    
    
    ;stampa dei tre vettori  
                           
    mov cx, 0
    mov cl, dim
    mov si, 0
    
    lea dx, string01
    mov ah, 9
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h 
    
    stampa:    
    
    mov dl, vett1[si]  
    add dl, 30h
    mov ah, 2
    int 21h
    
    lea dx, spazio
    mov ah, 9
    int 21h 
    
    mov dl, vett2[si]
    add dl, 30h
    mov ah, 2
    int 21h       
    
    lea dx, spazio
    mov ah, 9
    int 21h 
    
    mov dl, vett3[si]
    add dl, 30h
    mov ah, 2
    int 21h
    
    lea dx, acapo
    mov ah, 9
    int 21h
                 
    inc si
    
    loop stampa
            
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
