IDENTIFICATION DIVISION.
PROGRAM-ID. FREQUENCY.
*> Reads the frequency offset file line by line
*> and calculates the sum of the numbers
*> See https://en.wikipedia.org/wiki/COBOL
ENVIRONMENT DIVISION.
    INPUT-OUTPUT SECTION.
        FILE-CONTROL.
        SELECT OFFSETS ASSIGN TO 'input-test.txt'
        ORGANIZATION IS LINE SEQUENTIAL.
              
DATA DIVISION.
    FILE SECTION.
    FD OFFSETS.
    01 OFFSETS-FILE.
        05 OFFSETS-SIGN PIC A(1).
        05 OFFSETS-LINE PIC A(10).
       
    WORKING-STORAGE SECTION.
    01 WS-OFFSET.
        05 WS-OFFSETSIGN PIC A(1).
        05 WS-OFFSETLINE PIC A(10).
    01 FILE-EOF PIC 1.
       
PROCEDURE DIVISION.
    OPEN INPUT OFFSETS.
        PERFORM UNTIL FILE-EOF=1
            READ OFFSETS INTO WS-OFFSET
               AT END MOVE 1 TO FILE-EOF
               NOT AT END 
                   DISPLAY WS-OFFSETSIGN
                   DISPLAY WS-OFFSETLINE
        END-PERFORM.
    CLOSE OFFSETS.   
STOP RUN.
