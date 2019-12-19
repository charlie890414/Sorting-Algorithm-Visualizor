INCLUDE library54.inc
;constant block
NumbersLength=50
AlgorithmTypeNumber=1
;constant block

.data
consoleHandle DWORD ?
xyPos COORD <?, ?>
;windowSize RECT <0,0,99,24>

consoleTitle BYTE "Sorting Algorithm Visualizor", 0

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
INVOKE SetConsoleTitle, ADDR consoleTitle
;INVOKE SetConsoleScreenBufferSize, consoleHandle, xyPos
;INVOKE SetConsoleWindowInfo, consoleHandle, 0, OFFSET windowSize


;initaialize Numbers from NumbersLength to 1
INVOKE NumbersArrayInitialize, OFFSET Numbers, NumbersLength
;

mov xyPos.x, 15
mov xyPos.y, 5
lea edx, Numbers
INVOKE RandomGenerator, edx, 20
INVOKE printblock, edx, 20, xyPos, 1, consoleHandle

mov xyPos.x, 40
mov xyPos.y, 20
INVOKE setConsoleCursorPosition, consoleHandle, xyPos
;INVOKE printCodeLine, OFFSET array, xyPos, consoleHandle
call WaitMsg
exit
main ENDP
END main
