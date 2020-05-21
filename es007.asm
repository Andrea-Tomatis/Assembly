;ANDREA TOMATIS
;3AROB
;31/01/20
;ES007:Caricare in Num un numero a piacere, mettere nella variabile Ris il valore 1 se Num è pari
;oppure 0 se Num è dispari.
data segment
    ; add your data here!
    num db 40             
    Ris db ?
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
    mov al, num  
    mov ah, 0
    mov bl, 2
    div bl 
    cmp ah, 0
    je Pari
    mov Ris, 0
    jmp fine
    
    Pari:
    mov Ris, 1
    
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
