INCLUDE library54.inc

.data
IsAnimationStopped BYTE 1 ;A boolean value to indicate the animation is stopped or not.

.code

InsertionSort PROC, 
    AnimationSpeed: PTR DWORD,
	AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
	basicPos: COORD, 
	spacing: WORD, 
	consoleHandle: DWORD

	Local CodePos: COORD
	Local beginC: COORD
	Local endC: COORD
	Local beginC2: COORD
	Local endC2: COORD
	Local delaytime: DWORD
	Local baseTime: DWORD
	Local CurDelayTime: DWORD
	Local Sequence[50]: DWORD
	Local IsNumberSorted[50]: BYTE
	Local Next: BYTE
	
pushad
	mov delaytime, 50
	mov baseTime, 501
	;delay
	pushad
	mov esi, AnimationSpeed
	mov eax, [esi] 
	mul delaytime
	mov edx, baseTime
	sub edx, eax
	mov CurDelayTime, edx
	popad
		

	mov Next, 0
	call Clrscr
	
	INVOKE NumbersArrayInitialize, ADDR sequence, 50
	INVOKE printblock, ADDR sequence, 50, basicPos, spacing, consoleHandle
	
	mov CodePos.x, 90
	mov CodePos.y, 17
	
	INVOKE ShowCode, 2, CodePos, 11, consoleHandle	
	INVOKE Help, AnimationSpeed, 2, ADDR IsAnimationStopped, consoleHandle
	


	mov ecx, 50
begin:
mov edx, 0
mov eax, 0
xwaitMsg:
INVOKE keyEvents, ADDR Sequence, 50, ADDR IsNumberSorted, ADDR IsAnimationStopped,
	 	AnimationSpeed, AlgorithmTotalNumber, AlgorithmState, ADDR Next, consoleHandle
singleMsg:
	pushad
	mov esi, AnimationSpeed
	mov eax, [esi] 
	mul delaytime
	mov edx, baseTime
	sub edx, eax
	mov CurDelayTime, edx
	popad
cmp eax, 1
jz return
cmp eax, 2
jnz notR
mov ecx, 50
INVOKE ClrRect, 0, 0, 154, 11, ' ', consoleHandle
INVOKE printblock, ADDR sequence, 50, basicPos, spacing, consoleHandle
notR:
mov al, 0
cmp IsAnimationStopped, al
jz branch
mov al, 0
cmp Next, al
jz xwaitMsg
mov Next, 0
branch:

cmp ecx, 49
jnz go 
dec ecx
jmp L2
go:
	cmp edx, 1
		je B1
	cmp edx, 2
		je B2
	cmp edx, 3
		je B3
	cmp edx, 4
		je B4
	cmp edx, 5
		je B5
	cmp edx, 6
		je B6
	cmp edx, 7
		je B7

	L2:
		cmp ecx,0
		jnz keep


		; to red
		INVOKE Index_to_Coord, basicPos, spacing, 0
		mov beginC.y, 0
		mov endC.y, ax
		inc endC.y
		shr eax, 16
		mov beginC.x, ax
		inc ax
		INVOKE setRectAttribute, beginC.x, beginC.y, ax, endC2.y, 12, consoleHandle
		mov ecx, 50
		mov IsAnimationStopped, 1 
		jmp xwaitMsg
		
		keep:
		push ecx

		INVOKE ArrowMove, CodePos, 1, 2, 11, consoleHandle
		
		;delay
		INVOKE DelayAndEvent, CurDelayTime, 20, 1, ADDR Sequence, 50, ADDR IsNumberSorted, OFFSET IsAnimationStopped,
	 		AnimationSpeed, AlgorithmTotalNumber, AlgorithmState, ADDR Next, consoleHandle
		cmp edx, -1
		mov edx, 1
		jne singleMsg
		
		B1:

		mov ebx, 50
		sub ebx, ecx	; ebx is 1 to 49
		mov esi, Sequence
		push ebx
			shl ebx, 2
			add esi, ebx
		pop ebx
		mov edi, esi
		sub edi, TYPE DWORD
		
		L3:
			mov eax, [esi]

			INVOKE ArrowMove, CodePos, 2, 3, 11, consoleHandle
			;delay
			INVOKE DelayAndEvent, CurDelayTime, 20, 2, ADDR Sequence, 50, ADDR IsNumberSorted, OFFSET IsAnimationStopped,
				AnimationSpeed, AlgorithmTotalNumber, AlgorithmState, ADDR Next, consoleHandle
			cmp edx, -1
			mov edx, 2
			jne singleMsg
			
			B2:


			.IF eax < [edi]
				swap()
			.ELSE
				jmp B3


			sub esi, TYPE DWORD
			sub edi, TYPE DWORD
			dec ebx
		jne L3

		B3:

		dec ecx
	jmp L2


return:
popad
ret
InsertionSort ENDP
end

Comment @
	sample

	INVOKE DelayAndEvent, CurDelayTime, 20, 1, ADDR Sequence, 50, ADDR IsNumberSorted, OFFSET IsAnimationStopped,
	 		AnimationSpeed, AlgorithmTotalNumber, AlgorithmState, ADDR Next, consoleHandle
		cmp edx, -1
		mov edx, n
		jne singleMsg
		
	Bn:
@