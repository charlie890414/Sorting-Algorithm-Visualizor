INCLUDE all_lib\Irvine32.inc
INCLUDE all_lib\GraphWin.inc

printblock proto,
	b_pos: DWORD,  
    leng: DWORD,  
    basic_pos: COORD,  
    HDL: DWORD

RandomGenerator PROTO,
    array: PTR DWORD,
    leng: DWORD

printCodeLine PROTO,
	array: PTR DWORD,    
    basic_pos: COORD,  
    HDL: DWORD