'Packer Code

DECLARE SUB C (strng$, linex) ' SUB Declaration to center text

KEY 1, "Q"                        'define Keys
KEY 2, "q"

ON KEY(1) GOSUB over              'define on keys
ON KEY(2) GOSUB over

CLS

C "Phonecall Collection Wizard v1.0 -- by Jim Mirra", 1 'make it pretty
C "Collecting records in C:\PHONE\PHONE.DAT", 2
C "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD", 3
C "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD", 21
C "IMPORTANT! Press Q to quit for backup. Not pressing Q will result in Data Loss", 22
C "You have to wait up to 30 seconds after pressing q for port to re-initialize!", 23

VIEW PRINT 4 TO 20    'make scroll screen from line 4 to line 20

start:                  'line label start
  ON ERROR GOTO hand     'if any errors of any kind happen goto hand
  OPEN "COM1:1200,0,7,1" FOR INPUT AS #1     'open com1 to receive data
  OPEN "C:\PHONE\PHONE.DAT" FOR APPEND AS #2   'open file to send data to
  DO   'start loop
    IF (TIME$ = "24:00:00") AND MID$(DATE$, 4, 2) = "01" THEN GOSUB NewRecord
    IF ((TIME$ >= "24:00:00") AND (TIME$ <= "24:00:15")) THEN 'if midnight
      CLOSE                                                   'close com port and file
                                                           'saving file info
      OPEN "COM1:1200,0,7,1" FOR INPUT AS #1      'reopen com1 to recieve data
      OPEN "C:\PHONE\PHONE.DAT" FOR APPEND AS #2   'reopen data file
    END IF
    INPUT #1, asg$    '***wait for com port info, if there then get it
    PRINT asg$        'print captured com1 data to screen
    PRINT #2, asg$    'write captured com1 data to data file
  LOOP UNTIL ((INKEY$ = "q") OR (INKEY$ = "Q")) 'repeat the loop until q is pressed
  
CLOSE 'close com port and file; hence saving file
GOTO over ' goto line label over

hand:   'line label hand              'ignore any errors to prevent crash
  CLOSE 'close com port and file
  GOTO start ' goto line label start
  
NewRecord:
  FOR i = 1 TO VAL(LEFT$(DATE$, 2))
    READ filename$
  NEXT i
  DATA JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC
  filename$ = filename$ + RIGHT$(DATE$, 2) + "PAK.DAT"
  CLOSE #2
  SHELL "ren C:\PHONE\PHONE.DAT C:\PHONE\" + RTRIM$(LTRIM$(filename$))
  OPEN "C:\PHONE\PHONE.DAT" FOR OUTPUT AS #2
  ag$ = ""
  PRINT #2, ag$
  CLOSE 2
  OPEN "C:\PHONE\PHONE.DAT" FOR APPEND AS #2  'open file to send data to
  RETURN
over:     'line label over
  CLS
  END      'end proggie
