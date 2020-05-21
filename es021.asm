;ANDREA TOMATIS
;3AROB
;es021: Visualizzare la somma di due numeri dati in input.


data segment
    ; add your data here!
    
    string00 db "SOMMA DI DUE NUMERI $"
    string01  db "Inserisci il primo numero $"
    string02  db "Inserisci il secondo numero $" 
    string03    db "La somma e' $"
    op1 db ?
    op2 db ?
    somma db ?
    acapo db 13, 10, "$"
    
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
    
    lea dx,string00  ; visualizza string00
    mov ah,09
    int 21h
    
    lea dx,acapo     ; va a capo
    mov ah,09
    int 21h
    
    lea dx,string01  ; visualizza string01
    mov ah,09
    int 21h  
    
    mov ah,01     ; inserisce primo numero
    int 21h
    sub al,30h       ; al=al-30h
    mov op1,al
    
    lea dx,acapo     ; va a capo
    mov ah,09
    int 21h
    
    lea dx,string02  ; visualizza string02
    mov ah,09
    int 21h  
    
    mov ah,01     ; inserisce secondo numero
    int 21h
    sub al,30h   ; al=al-30h
    mov op2,al
    
    lea dx,acapo     ; va a capo
    mov ah,09
    int 21h
    
    mov al,op2       ; somma i due numeri
    add al,op1
    mov somma, al    ; aggiunge 30h alla variabile somma per stamparla
    add somma,30h
    
    lea dx,string03  ; visualizza string03
    mov ah,09
    int 21h  
    
    mov dl,somma     ; visualizza somma
    mov ah,02
    int 21h
    
    lea dx,acapo     ; va a capo
    mov ah,09
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
