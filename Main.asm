INCLUDE library54.inc
;constant block
NumbersLength=50
AlgorithmTotalNumber=2
;constant block

.data
consoleHandle DWORD ?
xyPos COORD <155, 30>
basicPos COORD <3, 10>
spacing WORD 1

windowSize SMALL_RECT <0,0, 154, 29>

consoleTitle BYTE "Sorting Algorithm Visualizor", 0

key WORD ? ;user input 



AnimationSpeed DWORD 3 ;A integer indicate speed of the animation, it should be bounded. [1, 10]
AlgorithmState DWORD 2


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
	
	mov eax, AlgorithmState
	.If eax==1
		INVOKE BubbleSort, ADDR AnimationSpeed, AlgorithmTotalNumber, ADDR AlgorithmState, basicPos, spacing, consoleHandle
	.Elseif eax==2
		INVOKE InsertionSort, ADDR AnimationSpeed, AlgorithmTotalNumber, ADDR AlgorithmState, basicPos, spacing, consoleHandle
	
	.Else
    ;error message
	.EndIf

JMP START

exit
main ENDP
END main