      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. cci005.
       AUTHOR. s WAITE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CHARCUR ASSIGN TO  "S25" ORGANIZATION IS INDEXED
               ACCESS IS DYNAMIC RECORD KEY IS CHARCUR-KEY
               ALTERNATE RECORD KEY IS CC-PAYCODE WITH DUPLICATES
               LOCK MODE MANUAL.

           SELECT CHARFILE ASSIGN TO "S30" ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC RECORD KEY IS CHARFILE-KEY
               LOCK MODE MANUAL.

           SELECT CCIFILE ASSIGN TO  "S35" ORGANIZATION IS INDEXED
               ACCESS IS DYNAMIC RECORD KEY IS CCI-KEY
               LOCK MODE MANUAL.

           SELECT FILEOUT ASSIGN TO  "S40" ORGANIZATION
               LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD  CHARCUR.
           COPY charcur.CPY IN "C:\Users\sid\cms\copylib\rri".                

       FD  CCIFILE.
           COPY ccifile.CPY IN "C:\Users\sid\cms\copylib".                

       FD  FILEOUT.
       01  FILEOUT01 PIC X(120).

       FD  CHARFILE.
           COPY charfile.CPY IN "C:\Users\sid\cms\copylib\rri".           
     
       WORKING-STORAGE SECTION.

       01  DATE-TAB01.
           02 DATE-TAB PIC 9(8) OCCURS 90 TIMES.
           02 KEY-TAB PIC X(11) OCCURS 90 TIMES.
           02 PROC-TAB PIC X(5) OCCURS 90 TIMES.
           02 DOC-TAB PIC   XX  OCCURS 90 TIMES.
           02 MOD2-TAB PIC  XX  OCCURS 90 TIMES.
           02 MOD3-TAB PIC  XX  OCCURS 90 TIMES.
           02 MOD4-TAB PIC  XX  OCCURS 90 TIMES.
           
       01  X PIC 99.
       01  Y PIC 99.
       01  Z PIC 99.
       01  T PIC 99.
       01  A PIC 99.
       01  B PIC 99.
       01  C PIC 99.
       01  FLAG PIC 9.
       01  FLAGX PIC 9 VALUE 0.
       01  IND-X PIC X.
       01  HOLD-IT PIC X(8).
       01  ALF1 PIC X.
       01  ALF2 PIC XX.
       01  ALF5 PIC X(5).
       01  ALF8 PIC X(8).
       01  ALF11 PIC X(11).
       01  R PIC 99.
       01  S PIC 99.
       01  CHARCUR-FLAG PIC 9.
      *
       PROCEDURE DIVISION.
       P0.
           OPEN I-O CHARFILE 
           OPEN INPUT CCIFILE CHARCUR.
           OPEN OUTPUT FILEOUT
           MOVE SPACE TO CHARFILE-KEY.

       P0-1.
           START CHARFILE KEY NOT < CHARFILE-KEY
             INVALID
               GO TO P4
           END-START.    

       P1.
           READ CHARFILE NEXT
             AT END
               GO TO P4
           END-READ.

       P1-1.
           MOVE CD-KEY8 TO HOLD-IT
           MOVE 1 TO X
           MOVE CHARFILE-KEY TO KEY-TAB(X)
           MOVE CD-PROC1     TO PROC-TAB(X)
           MOVE CD-DOCP      TO DOC-TAB(X)
           MOVE CD-MOD2      TO MOD2-TAB(X)
           MOVE CD-MOD3      TO MOD3-TAB(X)
           MOVE CD-MOD4      TO MOD4-TAB(X)
           MOVE CD-DATE-T    TO DATE-TAB(X).

       P2.
           READ CHARFILE NEXT 
             AT END
               PERFORM CHARCUR-CHECK THRU CHARCUR-CHECK-EXIT
               GO TO P4
           END-READ

           IF CD-AMOUNT = 0
               GO TO P2
           END-IF

           IF CD-KEY8 NOT = HOLD-IT
               PERFORM CHARCUR-CHECK THRU CHARCUR-CHECK-EXIT
               GO TO P14
           END-IF

           ADD 1 TO X
           MOVE CHARFILE-KEY TO KEY-TAB(X)
           MOVE CD-PROC1  TO PROC-TAB(X)
           MOVE CD-DOCP   TO DOC-TAB(X)
           MOVE CD-MOD2   TO MOD2-TAB(X)
           MOVE CD-MOD3   TO MOD3-TAB(X)
           MOVE CD-MOD4   TO MOD4-TAB(X)
           MOVE CD-DATE-T TO DATE-TAB(X)
           GO TO P2.

       CHARCUR-CHECK.
           MOVE HOLD-IT TO CC-KEY8
           MOVE SPACE   TO CC-KEY3
           MOVE X TO S
           MOVE 0 TO CHARCUR-FLAG
           START CHARCUR KEY NOT < CHARCUR-KEY INVALID
               GO TO CHARCUR-CHECK-EXIT
           END-START.

       CHARCUR-CHECK-1.    
           READ CHARCUR NEXT
             AT END
               GO TO CHARCUR-CHECK-EXIT
           END-READ

           IF CC-KEY8 NOT = HOLD-IT
               GO TO CHARCUR-CHECK-EXIT
           END-IF

           PERFORM P26 THRU P26-EXIT VARYING R FROM 1 BY 1 UNTIL R > S

           IF CHARCUR-FLAG = 1
             ADD 1 TO X
             MOVE SPACE TO KEY-TAB(X)
             MOVE CC-PROC1  TO PROC-TAB(X)
             MOVE CC-DOCP   TO DOC-TAB(X)
             MOVE CC-MOD2   TO MOD2-TAB(X)
             MOVE CC-MOD3   TO MOD3-TAB(X)  
             MOVE CC-MOD4   TO MOD4-TAB(X)
             MOVE CC-DATE-T TO DATE-TAB(X)
           END-IF

           GO TO CHARCUR-CHECK-1.

       CHARCUR-CHECK-EXIT.
           EXIT.        

       P14.
           MOVE CD-KEY8 TO HOLD-IT
           IF X < 2
               MOVE SPACE TO CD-KEY3
               GO TO P0-1
           END-IF

           COMPUTE Y = X - 1
      *    figure out 76/77 mods     
           PERFORM P15 THRU P17 VARYING Z FROM 1 BY 1 UNTIL Z > Y.
      *    determine 59 mod     
           PERFORM P18 THRU P20 VARYING Z FROM 1 BY 1 UNTIL Z > Y.
           MOVE HOLD-IT TO CD-KEY8
           MOVE SPACE   TO CD-KEY3
           GO TO P0-1.

       P15.
           IF KEY-TAB(Z) = SPACE                  
               GO TO P17
           END-IF    

           COMPUTE B = Z + 1
           PERFORM P16 THRU P16-EXIT VARYING A FROM B BY 1 UNTIL A > X
           GO TO P17.

       P16.           
           IF (DATE-TAB(A) = DATE-TAB(Z))
               AND (PROC-TAB(A) = PROC-TAB(Z)) 
               AND (MOD2-TAB(A) = MOD2-TAB(Z))                  

               IF KEY-TAB(A) = SPACE
                   MOVE SPACE TO FILEOUT01
                   STRING "MOD 76/77 NEEDED DUE TO POSTED CHARGE, DOS " 
                   DATE-TAB(A) ", CPT " PROC-TAB(A) 
                   ", MOD2 " MOD2-TAB(A) " FOR " KEY-TAB(Z)(1:8)
                   DELIMITED BY SIZE INTO FILEOUT01
                   WRITE FILEOUT01
                   MOVE KEY-TAB(Z) TO CHARFILE-KEY
               ELSE
                   MOVE KEY-TAB(A) TO CHARFILE-KEY
               END-IF    

               READ CHARFILE WITH LOCK
                 INVALID
                   DISPLAY CHARFILE-KEY " LOCKED"
                   GO TO P16-EXIT
               END-READ   

               IF CD-MOD2 = SPACE
                   MOVE "76" TO CD-MOD2
                   
                   IF DOC-TAB(A) NOT = DOC-TAB(Z)
                       MOVE "77" TO CD-MOD2
                   END-IF 
                   
                   GO TO P16-1   
               END-IF 

               IF (CD-MOD2 NOT = "76" AND
                   CD-MOD3 = SPACE)
                   MOVE "76" TO CD-MOD3
                   
                   IF DOC-TAB(A) NOT = DOC-TAB(Z)
                       MOVE "77" TO CD-MOD3
                   END-IF
                   
                   GO TO P16-1
               ELSE
                 MOVE SPACE TO FILEOUT01
                 STRING KEY-TAB(A) " " KEY-TAB(Z) " "
                   "did NOT change mods for " CD-NAME " DOS " CD-DATE-T 
                   " MOD2 " CD-MOD2 " MOD3 " CD-MOD3 " MOD4 " CD-MOD4
                   DELIMITED BY SIZE INTO FILEOUT01
                 WRITE FILEOUT01            
               END-IF                   
           END-IF

           GO TO P16-EXIT.        

       P16-1.
           MOVE SPACE TO FILEOUT01
           STRING KEY-TAB(A) " " KEY-TAB(Z) " "
               "ADDING MODS FOR " CD-NAME " DOS " CD-DATE-T " MOD2 "
               CD-MOD2 " MOD3 " CD-MOD3 " " CD-MOD4
               DELIMITED BY SIZE INTO FILEOUT01
           WRITE FILEOUT01.
           REWRITE CHARFILE01.

       P16-EXIT.
           EXIT.

       P17.
           EXIT.

       P18.
           IF KEY-TAB(Z) = SPACE                  
      *   THE FOLLOWING GO TO WAS GO TO P17 NOT GO TO P20
               GO TO P20
           END-IF 

           COMPUTE B = Z + 1
           PERFORM P19 THRU P19-EXIT VARYING A FROM B BY 1 UNTIL A > X
           GO TO P20.

       P19.
           IF (DATE-TAB(A) NOT = DATE-TAB(Z)) 
               OR (PROC-TAB(A) = PROC-TAB(Z))
               GO TO P19-EXIT
           END-IF

           MOVE 0 TO FLAG
           PERFORM CCI-1 THRU CCI-3
           
           IF FLAG = 0
               GO TO P19-EXIT
           END-IF

           IF IND-X = "0"
               MOVE SPACE TO FILEOUT01
               STRING KEY-TAB(A) " " KEY-TAB(Z) " "
                   "CAN NOT BILL THESE 2 TOGETHER PER NCCI (0)."
                   DELIMITED BY SIZE INTO FILEOUT01
               WRITE FILEOUT01        
               GO TO P19-EXIT
           END-IF.

           IF IND-X = "9"
               MOVE SPACE TO FILEOUT01
               STRING KEY-TAB(A) " " KEY-TAB(Z) " "
                 "CCI DOES NOT APPLY PER NCCI (9), WAS PREV DELETED."
                   DELIMITED BY SIZE INTO FILEOUT01
               WRITE FILEOUT01        
               GO TO P19-EXIT
           END-IF.

       P19-1.
           IF FLAG = 2
               MOVE KEY-TAB(Z) TO CHARFILE-KEY
           ELSE
               IF KEY-TAB(A) = SPACE
                   MOVE SPACE TO FILEOUT01
                   STRING "MOD 59 MISSED, DOS " DATE-TAB(A)
                   ", CPT " PROC-TAB(A) ", MOD2 " MOD2-TAB(A)
                   " FOR " KEY-TAB(Z)(1:8)
                   DELIMITED BY SIZE INTO FILEOUT01
                   WRITE FILEOUT01
                   GO TO P19-EXIT
               ELSE
                   MOVE KEY-TAB(A) TO CHARFILE-KEY
               END-IF    
           END-IF  
           
           READ CHARFILE WITH LOCK
             INVALID 
               GO TO P19-EXIT
           END-READ

           MOVE SPACE TO FILEOUT01
           STRING KEY-TAB(A) " " KEY-TAB(Z) " "
               "ADDING MOD 59 FOR " proc-tab(a) " " proc-tab(z)
               " DOS " CD-DATE-T
               DELIMITED BY SIZE INTO FILEOUT01
           WRITE FILEOUT01  

           IF CD-MOD2 = SPACE
               MOVE "59" TO CD-MOD2
           END-IF
           
           IF CD-MOD2 NOT = SPACE AND 
             CD-MOD2 NOT = "59" AND
             CD-MOD3 = SPACE
             MOVE "59" TO CD-MOD3
           END-IF.

           REWRITE CHARFILE01.

       P19-EXIT.
           EXIT.

       P20.
           EXIT.

       CCI-1.
           MOVE PROC-TAB(Z) TO CCI-KEY1
           MOVE PROC-TAB(A) TO CCI-KEY2
           READ CCIFILE
             INVALID
               GO TO CCI-2
           END-READ

           MOVE CCI-IND TO IND-X
           MOVE 1 TO FLAG
           GO TO CCI-3.

       CCI-2.
           MOVE PROC-TAB(A) TO CCI-KEY1
           MOVE PROC-TAB(Z) TO CCI-KEY2
           READ CCIFILE
             INVALID
               GO TO CCI-3
           END-READ
           MOVE CCI-IND TO IND-X
           MOVE 2 TO FLAG.

       CCI-3.
           EXIT.

       P26.
           IF CC-DATE-T = DATE-TAB(R)
               MOVE 1 TO CHARCUR-FLAG
               MOVE S TO R
           END-IF.

       P26-EXIT.
           EXIT.

       P4.
           IF X > 1
               COMPUTE Y = X - 1
               PERFORM P15 THRU P17 VARYING Z FROM 1 BY 1 UNTIL Z > Y
               PERFORM P18 THRU P20 VARYING Z FROM 1 BY 1 UNTIL Z > Y
           END-IF
           
           CLOSE CHARFILE CCIFILE FILEOUT CHARCUR. 
           STOP RUN.
