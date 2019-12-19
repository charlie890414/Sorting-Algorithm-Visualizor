INCLUDE library54.inc
;constant block
NumbersLength=50
AlgorithmTypeNumber=1

;constant block

.data
consoleHandle    DWORD ?
xyPos COORD <5, 15>

Numbers DWORD NumbersLength dup(?)       ;
IsNumberSorted BYTE NumbersLength dup(0) ;A boolean value to indicate the number is sorted or not.
IsAnimationStopped BYTE ? ;A boolean value to indicate the animation is stopped or not.
AnimationSpeed DWORD ? ;A integer indicate speed of the animation, it should be bounded.
AlgorithmState DWORD AlgorithmTypeNumber

main EQU start@0

.code
main PROC
;INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE					; mov eax, handle 
;INVOKE setConsoleCursorPosition, consoleHandle, xyPos	; mov cursor to xyPos
;call ClrScr											; clear console
INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE
mov consoleHandle,eax
;initaialize Numbers from NumbersLength to 1
INVOKE NumbersArrayInitialize, OFFSET Numbers, NumbersLength
;
lea edx, Numbers
INVOKE RandomGenerator, edx, 20
INVOKE printblock, edx, 20, xyPos, consoleHandle
mov xyPos.x, 40
mov xyPos.y, 20
INVOKE setConsoleCursorPosition, consoleHandle, xyPos
INVOKE printCodeLine, OFFSET text, xyPos, consoleHandle
call WaitMsg
exit
main ENDP
END main
