;ANDREA TOMATIS
;3AROB
;24/01/20

;es004  definire tre variabili (n1,n2,n3).
;       le prime due sono inizializzate in fase
;       di dichiarazione, la 3^ nel codice.
;       Dichiarare anche le variabili ris1,ris2 e resto.
;       Tutte le variabili contengono numeri tra 0 e 50.
;       Calcolare in ris1 la somma di n1 e n2.
;       in ris2 il quoziente della divisione tra n2 e n3.
;       Calcolare il resto in resto.

data segment
    ; add your data here! 
    num1 db 4
    num2 db 5
    num3 db ?
    ris1 db ?
    ris2 db ?
    resto db ?
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
    ;somma
    mov num3, 6
    mov al, num1
    add al, num2
    mov ris1, al
    
    ;divisione
    mov al,num2
    mov ah, 0
    div num3
    mov ris2, al
    mov resto, ah
    
    
            
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
