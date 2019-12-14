# how to write a procedure:
## 1. write proto in library54.inc 
     e.g. sample PROTO, test1: DWORD
## 2. write asm in windbg folder
     have "INCLUDE **.inc", ".code", "*** PROC", "ret", "*** ENDP", "end" in it
     e.g.
          INCLUDE irviine32.inc
          .code
          sample PROC, test1: DWORD
          push eax
          mov eax, test1
          call writeInt
          pop eax
          ret
          sample ENDP
          end
## 3. edit windbg/make.bat, replace "sampleproc" to your procedure name
## 4. make it
     execute windbg/make.bat
## 5. move 'your_procedure_name'.obj to all_lib/obj
## 6. now, you can invoke the procedure in finalMain.asm
     after checking the procedure is work, you can delete the .asm file and .pdb file
## * see example:
     step1: ./library54.inc
     step2: windbg/sampleproc.asm
     step3: windbg/make.bat
     step5: all_lib/obj/sampleproc.obj
     step6: finalMain.asm line 48