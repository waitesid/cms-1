      * @PACKAGE CMS
      * @LINK    HTTP://WWW.CMSVT.COM
      * @AUTHOR  S WAITE <CMSWEST@SOVER.NET>
      * @COPYRIGHT COPYRIGHT (C) 2020 CMS <CMSWEST@SOVER.NET>
      * @LICENSE HTTPS://GITHUB.COM/OPENEMR/OPENEMR/BLOB/MASTER/LICENSE GNU GENERAL PUBLIC LICENSE 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ste001.
       AUTHOR. SWAITE.
       DATE-COMPILED. TODAY.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT FILEIN ASSIGN TO "S25" ORGANIZATION
           LINE SEQUENTIAL.

           SELECT GARFILE ASSIGN TO "S30" ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC RECORD KEY IS G-GARNO
           ALTERNATE RECORD KEY IS G-ACCT WITH DUPLICATES
           LOCK MODE MANUAL.

           SELECT CHARCUR ASSIGN TO "S35" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC    RECORD KEY IS CHARCUR-KEY
           ALTERNATE RECORD KEY IS CC-PAYCODE WITH DUPLICATES
           LOCK MODE MANUAL.

           SELECT FILEOUT1 ASSIGN TO "S40" ORGANIZATION
           LINE SEQUENTIAL.

           SELECT FILEOUT2 ASSIGN TO "S45" ORGANIZATION
           LINE SEQUENTIAL.

           SELECT FILEOUT3 ASSIGN TO "S50" ORGANIZATION
           LINE SEQUENTIAL.

           SELECT FILEOUT4 ASSIGN TO "S55" ORGANIZATION
           LINE SEQUENTIAL.           

       DATA DIVISION.

       FILE SECTION.

       FD  FILEIN.
       01  FILEIN01.
           02 FI-CDM PIC X(7).
           02 FILLER PIC X.
           02 FI-PROC PIC X(5).
           02 FILLER PIC X.
           02 FI-DATEX PIC X(8).
           02 FILLER PIC X.
	       02 FI-MEDREC PIC X(6).
	
       FD  CHARCUR.
           COPY CHARCUR.CPY IN "C:\Users\sid\cms\copylib\rri".
       
       FD  FILEOUT1.
       01  FILEOUT101 PIC X(80).

       FD  FILEOUT2.
       01  FILEOUT201 PIC X(160).

       FD  FILEOUT3.
       01  FILEOUT301 PIC X(160).

       FD  FILEOUT4.
       01  FILEOUT401 PIC X(160).

       FD  GARFILE.
           COPY garfile.CPY IN "C:\Users\sid\cms\copylib\rri".

       WORKING-STORAGE SECTION.
       01  RIGHT-2 PIC XX JUST RIGHT.
       01  RIGHT-2X PIC XX JUST RIGHT.
       01  RIGHT-8 PIC X(8) JUST RIGHT.
       01  FI-YY PIC X(4).
       01  DATEX PIC X(8).
       01  MEDREC8 PIC X(8).
       01  ALF8 PIC X(8).
       01  FI-MEDREC8 PIC X(8).
       01  SAVE-GARNO PIC X(8).
       
       PROCEDURE DIVISION.
       
       0005-START.
           OPEN INPUT FILEIN GARFILE CHARCUR
           OPEN OUTPUT FILEOUT1 FILEOUT2 FILEOUT3 FILEOUT4.

       P00.
           MOVE SPACE TO FILEIN01
           READ FILEIN
             AT END
               GO TO P2
           END-READ
               
           MOVE SPACE TO ALF8
           MOVE SPACE TO SAVE-GARNO
           MOVE FI-MEDREC TO ALF8
           MOVE SPACE TO RIGHT-8
           UNSTRING ALF8 DELIMITED BY " " INTO RIGHT-8
           INSPECT RIGHT-8 REPLACING LEADING " " BY "0"
           MOVE RIGHT-8 TO FI-MEDREC8
           MOVE FI-MEDREC8 TO G-ACCT
           START GARFILE KEY NOT <  G-ACCT
             INVALID
               GO TO ERR-1
           END-START.

       P0.
           READ GARFILE NEXT
             AT END
               GO TO ERR-1
           END-READ

           IF G-ACCT > FI-MEDREC8
               GO TO ERR-1
           END-IF

           MOVE G-GARNO TO CC-KEY8
           MOVE SPACE TO CC-KEY3
           START CHARCUR KEY NOT < CHARCUR-KEY
             INVALID
               GO TO ERR-1
           END-START.

       P1. 
           READ CHARCUR NEXT
             AT END
               GO TO P0
           END-READ

           IF CC-KEY8 NOT = G-GARNO GO TO P0.
           
           IF CC-DATE-T NOT = FI-DATEX GO TO P1.

           MOVE G-GARNO TO SAVE-GARNO
           
           IF FI-PROC = "C8908" 
             MOVE "77049" TO FI-PROC.

           IF CC-PROC1 NOT = FI-PROC GO TO P1.
           
           IF CC-AMOUNT = 0
                 MOVE "ZEROED" TO CC-FUTURE
           END-IF  
           
           IF CC-DOCP = "00"                
               WRITE FILEOUT301 FROM CHARCUR01
           END-IF

           IF CC-DOCP = "02" 
               WRITE FILEOUT401 FROM CHARCUR01
           END-IF

           IF CC-AMOUNT = 0
             WRITE FILEOUT201 FROM CHARCUR01.
           
           GO TO P00.

       ERR-1.
           INSPECT FILEIN01 REPLACING ALL "," BY " "
           STRING FILEIN01 " " SAVE-GARNO DELIMITED BY SIZE
             INTO FILEOUT101.
           WRITE FILEOUT101.
           GO TO P00.

       P2.
           CLOSE GARFILE CHARCUR FILEOUT1 FILEOUT2
               FILEOUT3 FILEOUT4.
           STOP RUN.

