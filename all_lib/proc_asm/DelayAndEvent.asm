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
    Next: PTR BYTE
    Local Cur: DWORD
    
pushad
    mov ecx, DelayTime
    mov eax, Accuracy
    L1:
    call Delay
    INVOKE keyEvents, SequenceArray, leng, IsNumberSortedArray, IsAnimationStopped,
	 	AnimationSpeed, AlgorithmTotalNumber, AlgorithmState, Next

    cmp eax, 1  ; arrow
    jz BYE
    cmp eax, 2  ;R
    jz BYE
    notR:
    mov esi, IsAnimationStopped
    mov bl, 1
    cmp [esi], bl
    jz MID
    
    
    mov ebx, Accuracy
    SUB ECX, ebx
    .IF ECX>1
        JMP L1
    .ELSE
        JMP PeaceBye
    .ENDIF

BYE:
    mov Cur, eax
popad
    mov eax, Cur
    mov edx, retNum
    ret

MID:
    mov esi, Next
    mov bl, 1
    cmp [esi], bl
    jz BYE
   
PeaceBye:
    popad
    mov edx, -1
    
    ret
DelayAndEvent ENDP
end