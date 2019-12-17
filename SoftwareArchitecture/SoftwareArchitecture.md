# Architecture
---
## Datas
1. numbers  
About 100s.  
## UIs  
cmd size: 50*200
1. Space: stop or run the animation.
2. RightArrow and LeftArrow: choose sorting algorithm.
3. UpArrow and DownArrow: choose animation speed.
4. R: random generate number series and Initialize code demo.
5. Enter: play animation one step when the animation was stopped.
## Basic Functions
1. numbersCreator  
This function use to randomly create a series of numbers by user input.  
2. drawNumbers  
This function use to draw a series of numbers on user console.
Use this link https://en.wikipedia.org/wiki/Block_Elements being the basis of graphic. 
3. Sorting Algorithm(bunch of algoithms)  
Implementation kinds of sorting algorithm.

## Function Introductions

1. printblock proto,  
    b_pos: DWORD,  
    leng: DWORD,  
    basic_pos: COORD,  
    HDL: DWORD  
* b_pos: 數列起始位置的地址  
* leng: 數列長度  
* basic_pos：視覺化圖形的左下角座標  
* HDL: outputHandle  
* 整體意思：將 從b_pos開始的leng個DWORD 印在HDL上, 最左下角座標為basic_pos  
2. RandomGenerator PROTO,  
    array: PTR DWORD,  
    length: DWORD
Using Fisher–Yates shuffle algorithm to randomly shuffle number series.
* array: start position of array.  
* leng: length of array.  

