INCLUDE library54.inc

.data
Next BYTE 0 ;
IsAnimationStopped BYTE 1 ;A boolean value to indicate the animation is stopped or not.

.code

BubbleSort PROC, 
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
	Local Sequence[50]: DWORD
	Local IsNumberSorted[50]: BYTE
	Local baseTime: DWORD
pushad
	mov delaytime, 50
	mov baseTime, 550
	;shuffle and print
	call Clrscr
	
	INVOKE NumbersArrayInitialize, ADDR sequence, 50
	INVOKE printblock, ADDR sequence, 50, basicPos, spacing, consoleHandle
	
	; .While 1
	; INVOKE keyEvents,
	; 	ADDR Sequence,
	; 	50,
	; 	ADDR IsNumberSorted,
	; 	OFFSET IsAnimationStopped,
	; 	AnimationSpeed,
	; 	AlgorithmTotalNumber,
	; 	AlgorithmState,
	; 	ADDR Next
	; .EndW
	mov CodePos.x, 90
	mov CodePos.y, 17
	
	INVOKE ShowCode, 1, CodePos, 11, consoleHandle	
	INVOKE Help, AnimationSpeed, 1, ADDR IsAnimationStopped, consoleHandle
	
	;delay
	mov eax, delaytime
	call Delay


	mov ecx, 49

xwaitMsg:	
INVOKE keyEvents, ADDR Sequence, 50, ADDR IsNumberSorted, OFFSET IsAnimationStopped,
	 	AnimationSpeed, AlgorithmTotalNumber, AlgorithmState, ADDR Next
cmp eax, 1
jz return
cmp eax, 2
jnz notR
mov ecx, 49
INVOKE ClrRect, 0, 0, 154, 11, ' ', consoleHandle
INVOKE printblock, ADDR sequence, 50, basicPos, spacing, consoleHandle
notR:
mov dl, 0
cmp IsAnimationStopped, dl
jz branch
mov dl, 1
cmp Next, dl
jz branch
jmp xwaitMsg


branch:
.IF ebx<ecx
jmp inner
.ELSE
jmp outer
.ENDIF
	; ;delay
	; mov esi, AnimationSpeed
	; mov eax, [esi] 
	; mul delaytime
	; call Delay
	L2:
		cmp ecx,0
		jz waitMsg

		push ecx
		xor ebx, ebx
		INVOKE ArrowMove, CodePos, 1, 2, 11, consoleHandle
		;delay
		mov esi, AnimationSpeed
		mov eax, [esi] 
		mul delaytime
		mov edx, baseTime
		sub edx, eax
		mov eax, edx
		call Delay

		.While ebx < ecx
		inner:
		push ebx
			INVOKE ArrowMove, CodePos, 2, 3, 11, consoleHandle
			;delay
			mov esi, AnimationSpeed
			mov eax, [esi] 
			mul delaytime
			mov edx, baseTime
			sub edx, eax
			mov eax, edx
			call Delay

			; change two column to green
			INVOKE Index_to_Coord, basicPos, spacing, ebx
			mov beginC.y, 0
			mov endC.y, ax
			shr eax, 16
			mov beginC.x, ax
			inc ax
			mov endC.x, ax
			INVOKE setRectAttribute, beginC.x, beginC.y, endC.x, endC.y, 10, consoleHandle
			inc ebx
			INVOKE Index_to_Coord, basicPos, spacing, ebx
			mov beginC2.y, 0
			mov endC2.y, ax
			shr eax, 16
			mov beginC2.x, ax
			inc ax
			mov endC2.x, ax
			INVOKE setRectAttribute, beginC2.x, beginC2.y, endC2.x, endC2.y, 10, consoleHandle
			pop ebx
			push ebx

			INVOKE ArrowMove, CodePos, 3, 4, 11, consoleHandle

			;delay
			mov esi, AnimationSpeed
			mov eax, [esi] 
			mul delaytime
			mov edx, baseTime
			sub edx, eax
			mov eax, edx
			call Delay

			;delay
			mov esi, AnimationSpeed
			mov eax, [esi] 
			mul delaytime
			mov edx, baseTime
			sub edx, eax
			mov eax, edx
			call Delay
			;compare two numbers
			lea esi, sequence
			shl ebx, 2
			add esi, ebx
			pop ebx
			push ebx
			mov edx, [esi+4]
			cmp [esi], edx
			jna NoSwap

			;swap to numbers 
			mov eax, [esi]
			mov [esi], edx
			mov [esi+4], eax

			;print two columns again
			inc endC2.y
			INVOKE ClrRect, beginC.x, beginC.y, endC2.x, endC2.y, ' ', consoleHandle
			dec endC2.y
			dec endC.x
			INVOKE printblock, esi, 2, endC, spacing, consoleHandle
			inc endC.x
			INVOKE setRectAttribute, beginC.x, beginC.y, endC2.x, endC2.y, 10, consoleHandle
			
			INVOKE ArrowMove, CodePos, 4, 5, 11, consoleHandle
			;delay
			mov esi, AnimationSpeed
			mov eax, [esi] 
			mul delaytime
			mov edx, baseTime
			sub edx, eax
			mov eax, edx
			call Delay


			INVOKE ArrowMove, CodePos, 5, 3, 11, consoleHandle
			
			;change two column to original color
			INVOKE setRectAttribute, beginC.x, beginC.y, endC2.x, endC2.y, 7, consoleHandle
			;delay
			mov esi, AnimationSpeed
			mov eax, [esi] 
			mul delaytime
			mov edx, baseTime
			sub edx, eax
			mov eax, edx
			call Delay
			

			JMP EndSwap
		  NoSwap:
			INVOKE setRectAttribute, beginC.x, beginC.y, endC2.x, endC2.y, 7, consoleHandle

			INVOKE ArrowMove, CodePos, 4, 3, 11, consoleHandle

			;delay
			mov esi, AnimationSpeed
			mov eax, [esi] 
			mul delaytime
			mov edx, baseTime
			sub edx, eax
			mov eax, edx
			call Delay
			EndSwap:
		pop ebx
			inc ebx
			jmp xwaitMsg
		.EndW
			outer:
			INVOKE ArrowMove, CodePos, 3, 2, 11, consoleHandle
			;delay
			mov esi, AnimationSpeed
			mov eax, [esi] 
			mul delaytime
			mov edx, baseTime
			sub edx, eax
			mov eax, edx
			call Delay
		pop ecx
	DEC ECX
	jmp L2
return:
popad
ret
BubbleSort ENDP
end
