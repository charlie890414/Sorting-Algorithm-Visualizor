INCLUDE library54.inc
;constant block
NumbersLength=50
AlgorithmTotalNumber=1
;constant block

.data
consoleHandle DWORD ?
xyPos COORD <200, 50>
basicPos COORD <5, 15>
spacing WORD 1

windowSize SMALL_RECT <0,0, 199, 49>

consoleTitle BYTE "Sorting Algorithm Visualizor", 0

key WORD ? ;user input 



AnimationSpeed DWORD ? ;A integer indicate speed of the animation, it should be bounded. [1, 10]
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
	
	mov eax, AlgorithmState
	.If eax==1
		INVOKE BubbleSort, ADDR sequence, basicPos, spacing, NumbersLength, consoleHandle
        jmp START
	;.Elseif eax==2
	.Else
    ;error message
	.EndIf

JMP START

exit
main ENDP
END main