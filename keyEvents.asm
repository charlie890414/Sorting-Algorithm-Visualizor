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
    Next: PTR BYTE
pushad 
mov eax,DelayTime ; delay for msg processing
call Delay
call ReadKey ; wait for a keypress
jz return
cmp al, 1372h   ;r
jz R
cmp al, 1352h  ;R
jz R
cmp al, 3920h
jz Space
cmp al, 1C0Dh
jz xEnter
cmp al, 4800h ;white
jz Up
cmp al, 5000h
jz Down
cmp al, 4D00h
jz Right
cmp al, 4B00h
jz Left
jmp return
R:
INVOKE RandomGenerator, SequenceArray, leng
mov ecx, leng
mov esi, IsNumberSortedArray

mov eax,1
call WriteDec
call Crlf

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
cmp [esi], eax
jz zero
mov eax, 0
mov [esi], eax
jmp return
zero:
mov eax, 1
mov [esi], eax

mov eax,2
call WriteDec
call Crlf

jmp return
xEnter:
mov Next, 1

mov eax,3
call WriteDec
call Crlf

jmp return
Up:
mov esi, AnimationSpeed
mov eax, [esi]
.IF eax<10
inc eax
mov [esi], eax
.ENDIF

mov eax,4
call WriteDec
call Crlf

jmp return
Down:
mov esi, AnimationSpeed
mov eax, [esi]
.IF eax>1
dec eax
mov [esi], eax
.ENDIF

mov eax,5
call WriteDec
call Crlf

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

mov eax,6
call WriteDec
call Crlf

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

mov eax,7
call WriteDec
call Crlf

jmp return

return:
popad
ret

keyEvents ENDP
end