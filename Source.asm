; https://www.agner.org/optimize/optimizing_assembly.pdf p.16
; https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start
; Registre de uz general disponibile pe x86_64:
; RAX, RBX, RCX, RDX, RBP, RSP, RSI, RDI, R8-R15.
;
; https://github.com/hjl-tools/x86-psABI/wiki/x86-64-psABI-1.0.pdf
; Register Usage - Preserved across function calls (p.23):
; RBX, RSP, RBP, R12-R15, mxcsr (partial), x87 control word.
; 
; https://www.agner.org/optimize/optimizing_assembly.pdf p.28
; Registers that must be saved and restored (Unix):
; RBX, RBP, R12-R15.
;
; https://www.agner.org/optimize/optimizing_assembly.pdf p.30
; "The first six integer parameters are transferred in
; RDI, RSI, RDX, RCX, R8, R9, respectively."
 
global scramble
scramble:
    ; RDI: input (char *)
    ; RSI: output (char *)
    ; RDX: input_size (int)
    ; RCX: output_size (int)

    mov RCX, RDX        ; output size becomes input size
    
  function:
    mov AL, [RDI]       ; move the char to the AL reg
    cmp AL, 95          ; compare to the "_"
    jne decapitalize  ; if it is not underscore, continue
    je capitalize_next  ; if it is, we gotta delete it
    
  capitalize_next:
    inc RDI             ; we move up in the input string, to avoid the _
    mov AL, [RDI]       ; we copy this character into AL
    cmp AL, 96          ; if the letter is not a lowercase(ASCII)
    jle copy_normally  ; we cannot capitalize, write as is
    cmp AL, 123         ; same here
    jge copy_normally
    sub AL, 32          ; we capitalize this character
    mov [RSI], AL       ; we write the character into the output string
    inc RDI             ; increment the position of the input
    inc RSI             ; and that of the output
    jmp function          ; return to bucla
  
 
  decapitalize:
    cmp AL, 64          ; if the letter stored in AL is not a capital
    jle copy_normally  ; carry onwards
    cmp AL, 90          ; same here
    jge copy_normally
    add AL, 32          ; if it is, transform it into a lowercase
    mov [RSI], AL       ; write it in the output char*
    inc RDI             ; increment the input character counter
    inc RSI             ; inc the output character counter
    jmp function
    
    
  skip:
    jmp function           ; return to the main function
    
  
  copy_normally:
    mov [RSI], AL       ; AL already contains the character, so we just copy
    inc RDI             ; increment input
    inc RSI             ; increment output
    loop function          ; return to bucla

    ret
    
