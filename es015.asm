;ANDREA TOMATIS
;3AROB
;es015:Assegnare due valori a scelta a 2 variabili A e B, sommare la prima alla seconda finché la
;loro somma non supera 50. Memorizzare nella variabile Somma la somma finale e nella
;variabile Conta il numero di volte in cui la variabile B è stata sommata alla variabile A
;(usare il ciclo con controllo in coda).

data segment
    ; add your data here!
    a db 2
    b db 20
    somma db 1
    conta db 0
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
    mov ax, 0
    mov al, a
    ciclo:
    inc conta
    add al, b
    cmp al,50d
    ja fine 
    jmp ciclo
    
    
    fine:
    mov somma, al
            
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
