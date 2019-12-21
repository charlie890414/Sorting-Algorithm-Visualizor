# Architecture

---

## Datas

1. numbers  
About 100s.  
2. animation speed
3. AlgorithmState
4. 
   * eax:  

## UIs  

cmd size: 50*200

1. Space: stop or run the animation.
2. RightArrow and LeftArrow: choose sorting algorithm.
3. UpArrow and DownArrow: choose animation speed.
4. R: random generate sequence and Initialize code demo.
5. Enter: play animation one step when the animation was stopped.

## Basic Functions

1. numbersCreator  
This function use to randomly create a series of numbers by user input.  
2. drawNumbers  
This function use to draw a series of numbers on user console.
Use this link [https://en.wikipedia.org/wiki/Block_Elements](https://en.wikipedia.org/wiki/Block_Elements) being the basis of graphic.
3. Sorting Algorithm(bunch of algoithms)  
Implementation kinds of sorting algorithm.

## Function Introductions

1. printblock proto,  
    b_pos: DWORD,  
    leng: DWORD,  
    basic_pos: COORD,  
    def: WORD
    HDL: DWORD  

   * b_pos: 數列起始位置的地址  
   * leng: 數列長度  
   * basic_pos：視覺化圖形的左下角座標  
   * def: 兩兩間隔大小
   * HDL: outputHandle  
   * 整體意思：將 從b_pos開始的leng個DWORD 印在HDL上, 最左下角座標為basic_pos, 兩兩間隔為def

2. RandomGenerator PROTO,  
    array: PTR DWORD,  
    length: DWORD
Using Fisher–Yates shuffle algorithm to randomly shuffle number series.

   * array: start position of array.  
   * leng: length of array.  

3. ClrRect proto,
    beginX: WORD, beginY: WORD, endX: WORD, endY: WORD,
    def: BYTE, consolehandle: DWORD

   * beginX, beginY: 起點座標
   * endX, endY: 終點座標
   * def: 要初始化成哪一個字元(通常情況填入' ')
   * consolehandle: ouputHandle
   * 整體意思：將console上的起點座標與終點座標圍成的矩形範圍(包含起終點)設定為def的字元
4. printCodeLine PROC,
	array: PTR DWORD,    
    basic_pos: COORD,  
    HDL: DWORD
Using SetConsoleCursorPosition & WriteString to implement this function.  
It's can print string on the position you choose.
   * array: start position of array.  
   * basic_pos: start position of printing string. 
   * HDL: outputHandle
5. NumbersArrayInitialize PROC,  
    array: PTR DWORD,  
    leng: DWORD  
This function set numbers from 1 to leng.  
   * array: start position of array.  
   * leng: length of array. 
5. setCursorVisible PROTO, 
	consoleHandle: DWORD,  
    visible: DWORD  
   * consoleHandle: outputHandle
   * visible: make the cursor visible. 1 for true, and 0 for false
6. keyEvents PROC,
    SequenceArray: PTR DWORD,
    leng: DWORD,
    IsNumberSortedArray: PTR BYTE,
    IsAnimationStopped: PTR BYTE,
    AnimationSpeed: PTR DWORD,
    AlgorithmTotalNumber: DWORD,
	AlgorithmState: PTR DWORD,
    Next: PTR BYTE
It's can read user input and do something.  
Return eax, when eax is 1, means that the program should back to Main. Otherwise do nothing.  

7. setRectAttribute PROC, 
    beginX: WORD, beginY: WORD, endX: WORD, endY: WORD, def: WORD, consolehandle: DWORD
    * 將beginX, beginY, endX, endY圍成的區間 設定成def顏色

8. Index_to_Coord PROC, 
	basicPos: COORD, def: WORD, index: DWORD
   * 圖形左下角為basicPos, 兩column間隔為def, 得出第index個位置的左下角座標
   * 回傳於eax, 前 16 bits 為x座標，後 16 bits 為y座標
   
9. BubbleSort PROC, 
    AnimationSpeed: PTR DWORD, AlgorithmTotalNumber: DWORD, AlgorithmState: PTR DWORD,
    basicPos: COORD, spacing: WORD, consoleHandle: DWORD
    * bubbleSort主程式
    * AnimationSpeed為速度百分比，影響Local變數delaytime
    * AlgorithmTotalNumber為演算法數量
    * AlgorithmState為當前演算法index
    * basicPos為圖形左下角位置
    * spacing為圖形兩column之間的間隔
10. ShowCode PROTO, mode: DWORD, basicPos: COORD, highlight: WORD, consoleHandle: DWORD
    * 以basicPos為左上角，顯示與mode相對應的虛擬碼
    * 指針指向第一行，並且將第一行設定為highlight的顏色(目前highlight==11)
 
