INCLUDE library54.inc
;constant block
NumbersLength=50
AlgorithmTotalNumber=1
;constant block

.data
consoleHandle DWORD ?
xyPos COORD <200, 50>
basicPos COORD <5, 15>

windowSize SMALL_RECT <0,0, 199, 49>

consoleTitle BYTE "Sorting Algorithm Visualizor", 0

key WORD ? ;user input 

Sequence DWORD NumbersLength dup(?)
IsNumberSorted BYTE NumbersLength dup(0) ;A boolean value to indicate the number is sorted or not.
IsAnimationStopped BYTE ? ;A boolean value to indicate the animation is stopped or not.
AnimationSpeed DWORD ? ;A integer indicate speed of the animation, it should be bounded. [1%, 100%]
AlgorithmState DWORD 1


main EQU start@0

.code
main PROC
;SETTING console attributes
INVOKE GETSTDHANDLE, STD_OUTPUT_HANDLE
mov consoleHandle,eax

INVOKE SetConsoleTitle, ADDR consoleTitle

INVOKE setCursorVisible, consoleHandle, 0
INVOKE SetConsoleScreenBufferSize, consoleHandle, xyPos
INVOKE SetConsoleWindowInfo, consoleHandle, 1, OFFSET windowSize
;----------------------------------------------------------------------------

START:
	.Switch AlgorithmState
	.Case 1
		.break
	.Case 2

		.break
	.Default

		.break
	.EndSwitch

JMP START

exit
main ENDP
END main