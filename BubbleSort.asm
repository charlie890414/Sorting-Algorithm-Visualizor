INCLUDE library54.inc

.data
Next BYTE 0 ;
IsAnimationStopped BYTE ? ;A boolean value to indicate the animation is stopped or not.

.code

BubbleSort PROC, 
    AnimationSpeed: PTR DWORD,
	AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
	basicPos: COORD, 
	spacing: WORD, 
	consoleHandle: DWORD

	Local beginC: COORD
	Local endC: COORD
	Local beginC2: COORD
	Local endC2: COORD
	Local delaytime: DWORD
	Local Sequence[50]: DWORD
	Local IsNumberSorted[50]: BYTE
pushad
	mov delaytime, 5
	
	;shuffle and print
	call Clrscr
	
	INVOKE NumbersArrayInitialize, ADDR sequence, 50

	INVOKE RandomGenerator, ADDR sequence, 50

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
	mov ecx, 49
	L2:
		push ecx
		xor ebx, ebx
		.While ebx < ecx
		push ebx
			
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

			;delay
			mov eax, delaytime
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
			
			;delay
			mov eax, delaytime
			call Delay

		  NoSwap:

			;change two column to original color
			INVOKE setRectAttribute, beginC.x, beginC.y, endC2.x, endC2.y, 7, consoleHandle
			
			;delay
			mov eax, delaytime
			call Delay

		pop ebx
			inc ebx
		.EndW

		pop ecx
	DEC ECX
	JNE L2

popad
ret
BubbleSort ENDP
end
