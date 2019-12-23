INCLUDE library54.inc
.data

.code
DelayAndEvent PROC, DelayTime: DWORD, Accuracy: DWORD, retNum: DWORD, 
    SequenceArray: PTR DWORD,
    leng: DWORD,
    IsNumberSortedArray: PTR BYTE,
    IsAnimationStopped: PTR BYTE,
    AnimationSpeed: PTR DWORD,
    AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
    Next: PTR BYTE,
    consoleHandle: DWORD
    Local Cur: DWORD
    
pushad  
    mov bl, 1
    mov esi, IsAnimationStopped
    cmp [esi], bl
    jz BYE

    mov ecx, DelayTime
    add ecx, Accuracy
    mov eax, Accuracy
    
    L1:
    mov eax, Accuracy
    call Delay
    INVOKE keyEvents, SequenceArray, leng, IsNumberSortedArray, IsAnimationStopped,
	 	AnimationSpeed, AlgorithmTotalNumber, AlgorithmState, Next, consoleHandle

    cmp eax, 3 
    jnz BYE
    

    mov ebx, Accuracy
    sub ecx, ebx
    cmp ecx, Accuracy
    jna PeaceBye
    ja L1



BYE:
    mov Cur, eax
popad
    mov eax, Cur
    mov edx, retNum
    ret

PeaceBye:
    popad
    mov edx, -1
    
    ret
DelayAndEvent ENDP
end