      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. rri245.
       AUTHOR. SWAITE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ACTFILE ASSIGN TO "S30" ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS A-ACTNO
           ALTERNATE RECORD KEY IS A-GARNO WITH DUPLICATES
           ALTERNATE RECORD KEY IS NAME-KEY WITH DUPLICATES.
       
           SELECT ORDFILE ASSIGN TO "S35"     ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC        RECORD KEY IS ORDNO
           ALTERNATE RECORD KEY IS C-DATE-E WITH DUPLICATES.
       
           SELECT ERROR-FILE ASSIGN TO "S55" ORGANIZATION LINE
           SEQUENTIAL.
       
           SELECT WORK245 ASSIGN TO "S60" ORGANIZATION LINE
           SEQUENTIAL.
       
           SELECT GARFILE ASSIGN TO "S65" ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC  RECORD KEY IS G-GARNO
           ALTERNATE RECORD KEY IS G-ACCT WITH DUPLICATES.
       
           SELECT REFPHY ASSIGN TO "S70" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC  RECORD KEY IS REF-KEY
           ALTERNATE RECORD KEY IS REF-BSNUM  WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-CRNUM WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-UPIN  WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-CDNUM WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-NAME  WITH DUPLICATES.
       
           SELECT PROCFILE ASSIGN TO "S75" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC  RECORD KEY IS PROC-KEY.
       
       DATA DIVISION.
       
       FILE SECTION.
       
       FD PROCFILE
           DATA RECORD PROCFILE01.
       01 PROCFILE01.
           02 PROC-KEY.
             03 PROC-KEY1 PIC X(4).
             03 PROC-KEY2 PIC X(5).
             03 PROC-KEY3 PIC X(2).
           02 PROC-TYPE PIC X.
           02 PROC-TITLE. 
              03 PROC-TI PIC X(6).
              02 FILLER PIC X(22).
           02 PROC-AMOUNT PIC 9(4)V99.
       
       FD  REFPHY
           DATA RECORD IS REFPHY01.
       01  REFPHY01.
           02 REF-KEY PIC XXX.
           02 REF-BSNUM PIC X(5).
           02 REF-CRNUM PIC X(6).
           02 REF-UPIN PIC X(6).
           02 REF-CDNUM PIC X(7).
           02 REF-NAME PIC X(24).
           02 REF-NPI PIC X(10).
       
       FD GARFILE
           DATA RECORD IS GARFILE01.
       01 GARFILE01.
           02 G-GARNO PIC X(8).
           02 G-GARNAME PIC X(24).
           02 G-BILLADD PIC X(22).
           02 G-STREET PIC X(22).
           02 G-CITY PIC X(18).
           02 G-STATE PIC X(2).
           02 G-ZIP PIC X(9).
           02 G-COLLT PIC X.
           02 G-PHONE PIC X(10).
           02 G-SEX PIC X.
           02 G-RELATE PIC X.
           02 G-MSTAT PIC X.
           02 G-DOB PIC X(8).
           02 G-DUNNING PIC X.
           02 G-ACCTSTAT PIC X.
           02 G-PR-MPLR PIC X(4).
           02 G-PRINS PIC XXX.
           02 G-PR-ASSIGN PIC X.
           02 G-PR-OFFICE PIC X(4).
           02 G-PR-GROUP PIC X(10).
           02 G-PRIPOL PIC X(16).
           02 G-PRNAME PIC X(24).
           02 G-PR-RELATE PIC X.
           02 G-SE-MPLR PIC X(4).
           02 G-SEINS PIC XXX.
           02 G-SE-ASSIGN PIC X.
           02 G-TRINSIND PIC X.
           02 G-TRINS PIC XXX.
           02 G-SE-GROUP PIC X(10).
           02 G-SECPOL PIC X(16).
           02 G-SENAME PIC X(24).
           02 G-SE-RELATE PIC X.
           02 G-INSPEND PIC S9(5)V99.
           02 G-LASTBILL PIC X(8).
           02 G-ASSIGNM PIC X.
           02 G-PRIVATE PIC X.
           02 G-BILLCYCLE PIC X.
           02 G-DELETE PIC X.
           02 G-FILLER PIC XXX.
           02 G-ACCT PIC X(8).
           02 G-PRGRPNAME PIC X(15).
           02 G-SEGRPNAME PIC X(15).
       
       FD  WORK245.
       01  WORK24501.
           02 WORK-1 PIC X(8).
           02 FILLER PIC X(20).
           02 SERVDATE PIC X(8).
       
       FD  ORDFILE.
           copy "ordfile.cpy" in "c:\Users\sid\cms\copylib\rri".
       
       FD ACTFILE
           DATA RECORD IS ACTFILE01.
       01 ACTFILE01.
           02 A-ACTNO PIC X(8).
           02 A-GARNAME.
             03 A-GN1 PIC XXX.
             03 A-GN2 PIC X(21).
           02 A-BILLADD PIC X(22).
           02 A-STREET PIC X(22).
           02 A-CITY PIC X(18).
           02 A-STATE PIC X(2).
           02 A-ZIP.
             03 A-ZIP5 PIC X(5).
             03 A-ZIP4 PIC X(4).
           02 A-COLLT PIC X.
           02 A-PHONE.
             03 A-PHONE1 PIC XXX.
             03 A-PHONE2 PIC XXX.
             03 A-PHONE3 PIC X(4).
           02 A-SEX PIC X.
           02 A-RELATE PIC X.
           02 A-MSTAT PIC X.
           02 A-DOB PIC X(8).
           02 A-DUNNING PIC X.
           02 A-ACCTSTAT PIC X.
           02 A-PR-MPLR PIC X(4).
           02 A-PRINS PIC XXX.
           02 A-PR-ASSIGN PIC X.
           02 A-PR-OFFICE PIC X(4).
           02 A-PR-GROUP PIC X(10).
           02 A-PRIPOL0.
             03 A-PRIPOL PIC X(9).
             03 A-PR-SUFX PIC XXX.
             03 A-PR-FILLER PIC X(4).
           02 A-PRNAME PIC X(24).
           02 A-PR-RELATE PIC X.
           02 A-SE-MPLR PIC X(4).
           02 A-SEINS PIC XXX.
           02 A-SE-ASSIGN PIC X.
           02 A-TRINSIND PIC X.
           02 A-TRINS PIC XXX.
           02 A-SE-GROUP PIC X(10).
           02 A-SECPOL0.
             03 A-SECPOL PIC X(9).
             03 A-SE-SUFX PIC XXX.
             03 A-SE-FILLER PIC X(4).
           02 A-SENAME PIC X(24).
           02 A-SE-RELATE PIC X.
           02 A-INSPEND PIC X(7).
           02 A-LASTBILL PIC X(8).
           02 A-ASSIGNM PIC X.
           02 A-PRIVATE PIC X.
           02 A-BILLCYCLE PIC X.
           02 A-DELETE PIC X.
           02 A-FILLER PIC XXX.
           02 A-GARNO PIC X(8).
           02 A-PRGRPNAME PIC X(15).
           02 A-SEGRPNAME PIC X(15).
           02 NAME-KEY PIC XXX.
       
       FD  ERROR-FILE.
       01  ERROR-FILE01.
           02 ER-0 PIC X(8).
           02 FILLER PIC X VALUE SPACE.
           02 ER-1 PIC X(8).
           02 FILLER PIC X VALUE SPACE.
           02 ER-2 PIC X(24).
           02 FILLER PIC X VALUE SPACE.
           02 ER-3 PIC X(22).
           02 FILLER PIC X VALUE SPACE.
           02 ER-4 PIC X(15).

       WORKING-STORAGE SECTION.
       01  FLAG PIC 9.
       01  NAME-TAB PIC X OCCURS 24 TIMES.
       01  ALF-4 PIC XXXX.
       01  DATE-TAB01.
             02 DATE-TAB PIC 9(8) OCCURS 90 TIMES.
             02 CHARGE-TAB PIC X(5) OCCURS 90 TIMES.
             02 MOD-TAB PIC X(2) OCCURS 90 TIMES.
       01  X PIC 99.
       01  Y PIC 99.
       01  Z PIC 99.
       01  T PIC 99.
       01  A PIC 99.
       01  ALF4 PIC X(4).

       01  STATE-TABLE-CONSTANT.
           05  FILLER   PIC X(26) VALUE "AKALARAZCACNCOCTDCDEFLGAHI".
           05  FILLER   PIC X(24) VALUE "IAIDILINKSKYLAMAMDMEMIMN".
           05  FILLER   PIC X(24) VALUE "MOMSMTNCNDNENHNJNMNVNYOH".
           05  FILLER   PIC X(24) VALUE "OKORPAPRRISCSDTNTXUTVAVT".
           05  FILLER   PIC X(8)  VALUE "WAWIWVWY".

       01  STATE-TABLE REDEFINES STATE-TABLE-CONSTANT.
           05  STATE-2  PIC XX OCCURS 53 TIMES ASCENDING KEY STATE-2
               INDEXED BY S-2.

       01  ALFTEST14.
           02 ALFTEST14-3 PIC XXX.
           02 ALFTEST14-9 PIC X(9).
           02 FILLER PIC X(4).

       01  TITLE-FLAG PIC 9.
       01  ANS PIC X.
      
       PROCEDURE DIVISION.
       P0.
           OPEN INPUT ACTFILE REFPHY ORDFILE PROCFILE WORK245 GARFILE.
           OPEN OUTPUT ERROR-FILE.
       P8.
           READ WORK245
             AT END 
               GO TO P20
           END-READ
           

           MOVE WORK-1 TO A-ACTNO
           READ ACTFILE
             INVALID 
               DISPLAY "BAD MRN, THIS CAN'T BE! LOOK IN ERRORFILE AFTER"
               ACCEPT ANS     
               WRITE ERROR-FILE01 FROM WORK24501
               GO TO P8
           END-READ

           MOVE SERVDATE TO ER-0
           MOVE A-ACTNO TO ER-1 
           MOVE A-GARNAME TO ER-2
           MOVE 0 TO FLAG
           
           IF A-ACTNO NOT NUMERIC OR A-ACTNO = "00000000"
               MOVE "BAD MED REC NUMBER" TO ER-3
               MOVE A-ACTNO TO ER-4
               WRITE ERROR-FILE01
               GO TO P8
           END-IF.

       P12-1. 
           MOVE A-ACTNO TO ORD8
           MOVE SPACE TO ORD3
           
           START ORDFILE KEY > ORDNO
             INVALID 
               GO TO P8
           END-START    
           
           MOVE 0 TO X.

       P13.
           READ ORDFILE NEXT
             AT END 
               GO TO P15
           END-READ

           IF ORD8 NOT = A-ACTNO 
               GO TO P15
           END-IF

           MOVE C-REF TO REF-KEY
           
           READ REFPHY
             INVALID
               MOVE C-REF TO ER-3
               MOVE "BAD REF" TO ER-4
               MOVE C-DATE-T TO ER-0
               WRITE ERROR-FILE01
               GO TO P13-1
           END-READ
           
           IF REF-NPI = SPACE
               MOVE C-REF TO ER-3
               MOVE "NO NPI " TO ER-4
               MOVE C-DATE-T TO ER-0
               WRITE ERROR-FILE01
           END-IF

           IF C-DOCP = "00" AND C-CPT NOT = "G1004"
               MOVE C-REF TO ER-3
               MOVE "NOT READ" TO ER-4
               MOVE C-DATE-T TO ER-0
               WRITE ERROR-FILE01
           END-IF.  

       P13-1.
           MOVE C-PROC TO PROC-KEY1 ALF4
           MOVE 0 TO TITLE-FLAG
           MOVE C-CPT TO PROC-KEY2
           MOVE "26" TO PROC-KEY3.
                        
       P13-2.
           READ PROCFILE 
             INVALID
               MOVE "  " TO PROC-KEY3
               READ PROCFILE
                 INVALID
                   GO TO BAD-1
               END-READ                   
           END-READ    

           IF PROC-AMOUNT = 0 AND
              C-CPT = "G1004"
               GO TO P13
           END-IF
                      
           MOVE 1 TO TITLE-FLAG
           
           ADD 1 TO X
           MOVE C-DATE-T TO DATE-TAB(X)
           MOVE C-PROC TO CHARGE-TAB(X)
           MOVE C-MOD2 TO MOD-TAB(X)
           GO TO P13.

       P14. 
           IF TITLE-FLAG = 0
               MOVE SPACE TO ER-3 
               STRING "BAD CHARGE / " C-PROC " " C-IND
                   DELIMITED BY "???" INTO ER-3
               MOVE ORD3 TO ER-4
               WRITE ERROR-FILE01
               GO TO P13
           END-IF. 

       P15.
           IF X = 0 OR 1 
               GO TO P8
           END-IF

           SUBTRACT 1 FROM X GIVING Y.
           
           PERFORM C1 VARYING Z FROM 1 BY 1 UNTIL Z > Y    
           
           GO TO P8.
       C1.
           IF DATE-TAB(Z) NOT = 0
               ADD 1 TO Z GIVING A 
               PERFORM C2 VARYING T FROM A BY 1 UNTIL T > X
           END-IF.        

       C2.
           IF (DATE-TAB(Z)   = DATE-TAB(T)) AND 
              (CHARGE-TAB(Z) = CHARGE-TAB(T)) AND
              (MOD-TAB(Z)    = MOD-TAB(T)) AND
              (DATE-TAB(T) NOT = 0)
               MOVE "SAME CHARGES?" TO ER-3
               STRING CHARGE-TAB(Z) "/" DATE-TAB(Z) DELIMITED BY "ZZ"
               INTO ER-4 
               WRITE ERROR-FILE01
               MOVE 0 TO DATE-TAB(T)
           END-IF.    

       BAD-1.
           MOVE SPACE TO ERROR-FILE01.    

           STRING "UNDEFINED PROCEDURE FOR " ORD8 " " C-PROC 
                  " " C-CPT " We should ask RRMC for the cpt/hcpcs."
           DELIMITED BY SIZE INTO ERROR-FILE01

           WRITE ERROR-FILE01.
           
           GO TO P13.           

       P20.
           CLOSE ERROR-FILE GARFILE REFPHY ACTFILE ORDFILE PROCFILE
                 WORK245.
           STOP RUN.

