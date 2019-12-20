INCLUDE library54.inc

.data
Next BYTE 0
Sequence DWORD NumbersLength dup(?)
IsNumberSorted BYTE NumbersLength dup(0) ;A boolean value to indicate the number is sorted or not.
IsAnimationStopped BYTE ? ;A boolean value to indicate the animation is stopped or not.
.code

BubbleSort PROC, 
    leng: DWORD, 
    AnimationSpeed: PTR DWORD,
	AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
	basicPos: COORD, 
	spacing: WORD, 
	consoleHandle: DWORD
	

	Local xyPos: COORD
	Local xyPos2: COORD

	;Initialize and print
	lea esi, sequenceArray
	INVOKE NumbersArrayInitialize, esi, leng
	

	mov ecx, leng
	dec ecx
	L2:
		push ecx
		xor ebx, ebx
		.While ebx<ecx
		push ebx
			lea esi, sequenceArray
			shl ebx, 2
			add esi, ebx
			shr ebx, 2
			mov edx, [esi]
			cmp edx, [esi+4]

			INVOKE Index_to_Coord, basicPos, spacing, ebx
			mov xyPos.y, ax
			shr eax, 16
			mov xyPos.x, ax
			mov dx, xyPos.x
			inc dx
			INVOKE setRectAttribute,	xyPos.x, 8, dx, 16, 0Ah, consoleHandle
			
			
			inc ebx
			INVOKE Index_to_Coord, basicPos, spacing, ebx
			dec ebx
			mov xyPos2.y, ax
			shr eax, 16
			mov xyPos2.x, ax
			mov xyPos2.x, ax
			mov dx, xyPos2.x
			inc dx
			INVOKE setRectAttribute,	xyPos2.x, 8, dx, 16, 0Ah, consoleHandle

			jna NO_SWAP
		SWAP:
			mov bx, xyPos.x
			inc bx
			INVOKE ClrRect,				xyPos.x, 8, bx, 16, ' ', consoleHandle
			INVOKE setRectAttribute,	xyPos.x, 8, bx, 16, 0Ah, consoleHandle
			INVOKE printblock, esi, 1, xyPos, 0, consoleHandle
			
			add esi, 4
			mov bx, xyPos2.x
			inc bx
			INVOKE ClrRect,				xyPos2.x, 8, bx, 16, ' ', consoleHandle
			INVOKE setRectAttribute,	xyPos2.x, 8, bx, 16, 0Ah, consoleHandle
			INVOKE printblock, esi, 1, xyPos, 0, consoleHandle
		
		
		
			INVOKE setRectAttribute, xyPos.x, 8, bx, 16, 0Fh, consoleHandle
			INVOKE setRectAttribute, xyPos.x, 8, bx, 16, 0Fh, consoleHandle
		
		NO_SWAP:
			mov eax, 500
			call Delay
		pop ebx
			inc ebx
		.EndW

		pop ecx
	DEC ECX
	JNE L2

return:
ret
BubbleSort ENDP
end
