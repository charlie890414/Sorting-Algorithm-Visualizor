INCLUDE irvine32.inc

.data
abcds1 BYTE "this is sample proc", 0

.code
sampleproc PROC

pushad
lea edx,  abcds1
call writeString
call Crlf
popad

ret

sampleproc ENDP
end