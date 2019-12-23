INCLUDE library54.inc
DelayTime=10
.data

.code
keyEvents PROC,
    SequenceArray: PTR DWORD,
    leng: DWORD,
    IsNumberSortedArray: PTR BYTE,
    IsAnimationStopped: PTR BYTE,
    AnimationSpeed: PTR DWORD,
    AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
    Next: PTR BYTE,
    consoleHandle: DWORD
    
    Local xout: DWORD
pushad 
; mov eax,DelayTime ; delay for msg processing
; call Delay
mov eax, 0
mov xout, eax
call ReadKey ; wait for a keypress
jnz have
mov xout, 3
jmp return
have:
cmp ax, 1372h   ;r
jz R
cmp ax, 1352h  ;R
jz R
cmp ax, 3920h
jz Space
cmp ax, 1C0Dh
jz xEnter
cmp ax, 4800h ;white
jz Up
cmp ax, 5000h
jz Down
cmp ax, 4D00h
jz Right
cmp ax, 4B00h
jz Left
jmp return
R:
INVOKE RandomGenerator, SequenceArray, leng
mov ecx, leng
mov esi, IsNumberSortedArray
mov eax, 2
mov xout, eax
jmp return
L1:
mov eax, 0
mov [esi], eax
add esi, TYPE DWORD
Loop L1
jmp return
Space:
mov esi, IsAnimationStopped
mov eax, 0
mov xout, eax
cmp [esi], eax
jz zero
mov eax, 0
mov [esi], eax
INVOKE Help, AnimationSpeed, 1, IsAnimationStopped, consoleHandle
jmp return
zero:
mov eax, 1
mov [esi], eax
INVOKE Help, AnimationSpeed, 1, IsAnimationStopped, consoleHandle
jmp return
xEnter:
mov eax, 6
mov esi, Next
mov [esi], eax
jmp return
Up:
mov esi, AnimationSpeed
mov eax, [esi]
.IF eax<10
inc eax
mov [esi], eax
.ENDIF
INVOKE Help, AnimationSpeed, 1, IsAnimationStopped, consoleHandle
jmp return
Down:
mov esi, AnimationSpeed
mov eax, [esi]
.IF eax>1
dec eax
mov [esi], eax
.ENDIF
INVOKE Help, AnimationSpeed, 1, IsAnimationStopped, consoleHandle
jmp return
Right:
mov esi, AlgorithmState
mov eax, [esi]
.IF eax<AlgorithmTotalNumber
inc eax
mov [esi], eax
.ELSE
mov eax, 1
mov [esi], eax
.ENDIF
mov eax, 1
mov xout, eax
jmp return
Left:
mov esi, AlgorithmState
mov eax, [esi]
.IF eax>1
dec eax
mov [esi], eax
.ELSE
mov eax, AlgorithmTotalNumber
mov [esi], eax
.ENDIF
mov eax, 1
mov xout, eax
jmp return

return:
popad
mov eax, xout
ret
keyEvents ENDP
end