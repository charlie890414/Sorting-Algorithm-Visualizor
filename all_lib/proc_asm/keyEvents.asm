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
jz Enter
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
mov [esi], 0
add esi, TYPE DWORD
Loop L1
jmp return
Space:
mov esi, IsAnimationStopped
cmp [esi], 0
jz zero
mov [esi],0
jmp return
zero:
mov [esi], 1

mov eax,2
call WriteDec
call Crlf

jmp return
Enter:
mov Next, 1

mov eax,3
call WriteDec
call Crlf

jmp return
Up:
mov esi, AnimationSpeed
.IF [esi]<10
inc [esi]
.ENDIF

mov eax,4
call WriteDec
call Crlf

jmp return
Down:
mov esi, AnimationSpeed
.IF [esi]>1
dec [esi]
.ENDIF

mov eax,5
call WriteDec
call Crlf

jmp return
Right:
mov esi, AlgorithmState
.IF [esi]<AlgorithmTotalNumber
inc [esi]
.ELSE
mov [esi], 1
.ENDIF

mov eax,6
call WriteDec
call Crlf

jmp return
Left:
mov esi, AlgorithmState
.IF [esi]>1
dec [esi]
.ELSE
mov [esi], AlgorithmTotalNumber
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