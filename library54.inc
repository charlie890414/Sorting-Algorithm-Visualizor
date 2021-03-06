INCLUDE all_lib\Irvine32.inc
INCLUDE all_lib\GraphWin.inc

printblock proto,
    b_pos: DWORD, leng: DWORD, basic_pos: COORD, dist: WORD, HDL: DWORD

RandomGenerator PROTO,
    array: PTR DWORD,
    leng: DWORD

ClrRect PROTO,
	beginX: WORD, beginY: WORD, endX: WORD, endY: WORD, def: BYTE, consolehandle: DWORD

printCodeLine PROTO,
	array: PTR DWORD,    
    basic_pos: COORD,  
    HDL: DWORD

setCursorVisible PROTO, 
	consoleHandle: DWORD, visible: DWORD

setRectAttribute PROTO, 
	beginX: WORD, beginY: WORD, endX: WORD, endY: WORD, def: WORD, consolehandle: DWORD

NumbersArrayInitialize PROTO,
    array: PTR DWORD,
    leng: DWORD

Index_to_Coord PROTO, 
	basicPos: COORD, def: WORD, index: DWORD


BubbleSort PROTO, 
    AnimationSpeed: PTR DWORD, 
    AlgorithmTotalNumber: DWORD, 
    AlgorithmState: PTR DWORD,
    basicPos: COORD, 
    spacing: WORD, 
    consoleHandle: DWORD
	

InsertionSort PROTO, 
    AnimationSpeed: PTR DWORD, 
    AlgorithmTotalNumber: DWORD, 
    AlgorithmState: PTR DWORD,
    basicPos: COORD, 
    spacing: WORD, 
    consoleHandle: DWORD
	
keyEvents PROTO,
    SequenceArray: PTR DWORD,
    leng: DWORD,
    IsNumberSortedArray: PTR BYTE,
    IsAnimationStopped: PTR BYTE,
    AnimationSpeed: PTR DWORD,
    AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
    Next: PTR BYTE,
    consoleHandle: DWORD

ShowCode PROTO, mode: DWORD, basicPos: COORD, highlight: WORD, consoleHandle: DWORD


ArrowMove PROTO, basicPos: COORD, PreIndex: DWORD, CurIndex: DWORD, 
	highlight: WORD, consoleHandle: DWORD

Help PROTO, AnimationSpeed: PTR DWORD, AlgorithmState: PTR DWORD, IsAnimationStopped: PTR BYTE, consoleHandle: DWORD
    

DelayAndEvent PROTO, DelayTime: DWORD, Accuracy: DWORD, retNum: DWORD, 
    SequenceArray: PTR DWORD,
    leng: DWORD,
    IsNumberSortedArray: PTR BYTE,
    IsAnimationStopped: PTR BYTE,
    AnimationSpeed: PTR DWORD,
    AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
    Next: PTR BYTE,
    consoleHandle: DWORD
    