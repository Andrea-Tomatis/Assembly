;Andrea Tomatis
;3arob
;07/02/2020
;es010:Caricare in 4 variabili dei valori a piacere e salvare nella variabile sommapari la somma di
;      tutti i numeri pari, nella variabile sommadispari la somma di tutti i numeri dispari.
data segment
    ; add your data here! 
    n1 db 3
    n2 db 4
    n3 db 9
    n4 db 4

    sommapari db 0
    sommadisp db 0
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
    mov ch, n1
    mov al, n1
    mov ah, 0
    mov bl, 2
    mov bh, 0
    div bl
    cmp ah, 0
    je Pari1
    jne Disp1
    
    SEC:
    mov ch, n2
    mov al, n2
    mov bl, 2
    div bl
    cmp ah, 0
    je Pari2
    jne Disp2
    
    TER:  
    mov ch, n3
    mov al, n3
    mov bl, 2
    div bl
    cmp ah, 0
    je Pari3
    jne Disp3
    
    QUARTO:
    mov ch, n4 
    mov al, n4
    mov bl, 2
    div bl
    cmp ah, 0
    je Pari4
    jne Disp4 
    
    
    Pari1:
    add sommapari, ch
    
    jmp SEC
    
    Pari2:
    add sommapari, ch
    
    jmp TER
    
    Pari3:
    add sommapari, ch
    
    jmp QUARTO
    
    Pari4:
    add sommapari, ch
    
    jmp fine
    
    Disp1:
    add sommadisp, ch
    jmp SEC
    
    Disp2:
    add sommadisp, ch
    jmp TER
    
    Disp3:
    add sommadisp, ch
    jmp QUARTO
    
    Disp4:
    add sommadisp, ch
    jmp fine
    
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
