      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BLUI005.
       AUTHOR. SID WAITE.
       DATE-COMPILED. TODAY.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
	   SELECT PAYFILE ASSIGN TO "S30" ORGANIZATION IS INDEXED
	   ACCESS MODE IS SEQUENTIAL RECORD KEY IS PAYFILE-KEY.
	   SELECT CHARCUR ASSIGN TO "S35" ORGANIZATION IS INDEXED
	   ACCESS MODE IS DYNAMIC RECORD KEY IS CHARCUR-KEY
	   ALTERNATE RECORD KEY IS CC-PAYCODE WITH DUPLICATES
	   LOCK MODE MANUAL.
	   SELECT PAYCUR ASSIGN TO "S40" ORGANIZATION IS INDEXED
	   ACCESS MODE IS DYNAMIC RECORD KEY IS PAYCUR-KEY
	   LOCK MODE MANUAL.
	   SELECT BLUEWK ASSIGN TO "S45" ORGANIZATION
	   LINE SEQUENTIAL.
	   SELECT GARFILE ASSIGN TO "S50" ORGANIZATION IS INDEXED
	   ACCESS MODE IS DYNAMIC RECORD KEY IS G-GARNO
	   LOCK MODE MANUAL.
	   SELECT INSFILE ASSIGN TO "S55"     ORGANIZATION IS INDEXED
	   ACCESS IS RANDOM RECORD KEY IS INS-KEY
	   ALTERNATE RECORD KEY IS INS-NAME WITH DUPLICATES
	   ALTERNATE RECORD KEY IS INS-CITY WITH DUPLICATES
	   ALTERNATE RECORD KEY IS INS-ASSIGN WITH DUPLICATES
	   ALTERNATE RECORD KEY IS INS-CLAIMTYPE WITH DUPLICATES
	   ALTERNATE RECORD KEY IS INS-NEIC WITH DUPLICATES
	   ALTERNATE RECORD KEY IS INS-NEIC-ASSIGN WITH DUPLICATES
	   LOCK MODE MANUAL.
	   SELECT MPLRFILE ASSIGN TO "S60" ORGANIZATION IS INDEXED
	   ACCESS IS DYNAMIC RECORD KEY IS MPLR-KEY
	   LOCK MODE IS MANUAL.
       DATA DIVISION.
       FILE SECTION.
       FD  MPLRFILE.
       01  MPLRFILE01.
	   02 MPLR-KEY PIC X(8). 
	   02 MPLR-NAME PIC X(22).
	   02 MPLR-STREET PIC X(24).
	   02 MPLR-CITY PIC X(15).
	   02 MPLR-STATE PIC XX.
	   02 MPLR-ZIP PIC X(9).
	   02 MPLR-CLAIMNO PIC X(15).
	   02 MPLR-TRINS PIC XXX.
	   02 MPLR-TR-ASSIGN PIC X.
	   02 MPLR-TR-GROUP PIC X(12).
	   02 MPLR-TRIPOL PIC X(14).
	   02 MPLR-TR-NAME PIC X(24).
	   02 MPLR-TR-RELATE PIC X.
	   02 MPLR-FUTURE PIC X(6).
       FD  GARFILE
      *    BLOCK CONTAINS 3 RECORDS
	   DATA RECORD IS G-MASTER.
       01  G-MASTER.
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
	   02 G-PR-GROUP PIC X(12).
	   02 G-PRIPOL PIC X(14).
	   02 G-PRNAME PIC X(24).
	   02 G-PR-RELATE PIC X.
	   02 G-SE-MPLR PIC X(4).
	   02 G-SEINS PIC XXX.
	   02 G-SE-ASSIGN PIC X.
	   02 G-TRINSIND PIC X.
	   02 G-TRINS PIC XXX.
	   02 G-SE-GROUP PIC X(12).
	   02 G-SECPOL PIC X(14).
	   02 G-SENAME PIC X(24).
	   02 G-SE-RELATE PIC X.
	   02 G-INSPEND PIC S9(5)V99.
	   02 G-LASTBILL PIC X(8).
	   02 G-ASSIGNM PIC X.
	   02 G-PRIVATE PIC X.
	   02 G-BILLCYCLE PIC X.
	   02 G-DELETE PIC X.
	   02 G-FILLER PIC XXX.


       FD  PAYFILE
      *    BLOCK CONTAINS 4 RECORDS
	   DATA RECORD IS PAYFILE01.
       01  PAYFILE01.
	   02 PAYFILE-KEY.
	     03 PD-KEY8 PIC X(8).
	     03 PD-KEY3 PIC XXX.
	   02 PD-NAME PIC X(24).
	   02 PD-AMOUNT PIC S9(4)V99.
	   02 PD-PAYCODE PIC XXX.
	   02 PD-DENIAL PIC XX.
	   02 PD-CLAIM PIC X(6).
	   02 PD-DATE-T PIC X(8).
	   02 PD-DATE-E PIC X(8).
	   02 PD-ORDER PIC X(6).
	   02 PD-BATCH PIC X(6).

       FD  CHARCUR.
       01  CHARCUR01.
           02 CHARCUR-KEY.
             03 CC-KEY8 PIC X(8).
             03 CC-KEY3 PIC XXX.
           02 CC-PATID PIC X(8).
           02 CC-CLAIM PIC X(6).
           02 CC-SERVICE PIC X.
           02 CC-DIAG PIC X(7).
           02 CC-PROC PIC X(7).
           02 CC-MOD2 PIC XX.
           02 CC-MOD3 PIC XX.
           02 CC-MOD4 PIC XX.
           02 CC-AMOUNT PIC S9(4)V99.
           02 CC-DOCR PIC X(3).
           02 CC-DOCP PIC X(2).
           02 CC-PAYCODE PIC XXX.
           02 CC-STUD PIC X.
           02 CC-WORK PIC XX.
           02 CC-DAT1 PIC X(8).
           02 CC-RESULT PIC X.
           02 CC-ACT PIC X.
           02 CC-SORCREF PIC X.
           02 CC-COLLT PIC X.
           02 CC-AUTH PIC X.
           02 CC-PAPER PIC X.
           02 CC-PLACE PIC X.
           02 CC-EPSDT PIC X.
           02 CC-DATE-T PIC X(8).
           02 CC-DATE-A PIC X(8).
           02 CC-DATE-P PIC X(8).
           02 CC-REC-STAT PIC X.
           02 CC-DX2 PIC X(7).
           02 CC-DX3 PIC X(7).
           02 CC-ACC-TYPE PIC X.
           02 CC-DATE-M PIC X(8).
           02 CC-ASSIGN PIC X.
           02 CC-NEIC-ASSIGN PIC X.
           02 CC-DX4 PIC X(7).
           02 CC-DX5 PIC X(7).
           02 CC-DX6 PIC X(7).
           02 CC-FUTURE PIC X(6).

       FD  PAYCUR
      *    BLOCK CONTAINS 3 RECORDS
	   DATA RECORD IS PAYCUR01.
       01  PAYCUR01.
	   02 PAYCUR-KEY.
	     03 PC-KEY8 PIC X(8).
	     03 PC-KEY3 PIC XXX.
	   02 PC-AMOUNT PIC S9(4)V99.
	   02 PC-PAYCODE PIC XXX.
	   02 PC-DENIAL PIC XX.
	   02 PC-CLAIM PIC X(6).
	   02 PC-DATE-T PIC X(8).
	   02 PC-DATE-E PIC X(8).
	   02 PC-BATCH PIC X(6).

       FD  INSFILE
     *     BLOCK CONTAINS 6 RECORDS
	   DATA RECORD IS INSFILE01.
       01  INSFILE01.
	   02 INS-KEY PIC XXX.
	   02 INS-NAME PIC X(22).
	   02 INS-STREET PIC X(24).
	   02 INS-CITY PIC X(15).
	   02 INS-STATE PIC XX.
	   02 INS-ZIP PIC X(9).
	   02 INS-ASSIGN PIC X.
	   02 INS-CLAIMTYPE PIC X.
	   02 INS-NEIC PIC X(5).
	   02 INS-NEICLEVEL PIC X.
	   02 INS-NEIC-ASSIGN PIC X.
	   02 INS-PPO PIC X.
	   02 INS-PRVNUM PIC X(10).
	   02 INS-HMO PIC X(3).
	   02 INS-STATUS PIC X.
	   02 INS-LEVEL PIC X.
	   02 INS-LASTDATE PIC X(8).
	   02 INS-CAID PIC XXX.
	   02 INS-REFWARN PIC X.
	   02 INS-FUTURE PIC X(8).
       FD BLUEWK
	   DATA RECORD IS DATE-X.
       01  DATE-X.
	     03 CC PIC XX.
	     03 YY PIC XX.
	     03 MM PIC XX.
	     03 DD PIC XX.
       WORKING-STORAGE SECTION.
       01     FLAG12 PIC 9.
       01     PAYCUR-TOT PIC S9(4)V99.
       01     FINAL-TOT PIC S9(4)V99.
       01     CLAIM-TOT PIC S9(4)V99.
       01     P-FLAG PIC 9.
       01     S-FLAG PIC 9.
       01     T-FLAG PIC 9.
       01     XYZ PIC 999.
       01     HOLD-KEY PIC X(11).
       01     H-IT PIC X(8).
       01     CNT-PAY PIC 999999 VALUE 0.
       01     CNT-CHAR PIC 999999 VALUE 0.
       01     TOT-PAY PIC S9(8)V99 VALUE 0.
       01     TOT-CHAR PIC S9(8)V99 VALUE 0.
       01     NEF-11 PIC Z,ZZZ,ZZ9.99CR.
      *
       PROCEDURE DIVISION.
       0005-START.
	   OPEN INPUT INSFILE MPLRFILE.
	   OPEN I-O PAYCUR.
	   OPEN I-O CHARCUR.
	   OPEN INPUT GARFILE.
	   OPEN INPUT BLUEWK.
	   OPEN INPUT PAYFILE.
	   READ BLUEWK AT END DISPLAY "NO POSTING RECORDS" 
	   GO TO 9200CMF.
	   IF DATE-X NOT NUMERIC DISPLAY DATE-X " NOT NUMERIC"
	   GO TO 9200CMF.
	   READ PAYFILE AT END GO TO 9100CMF.
	   MOVE PD-KEY8 TO H-IT.
	   MOVE 0 TO XYZ.
	   GO TO P1-0.
       P1. READ PAYFILE AT END GO TO 9100CMF.
       P1-0. ADD 1 TO CNT-PAY.
	   ADD PD-AMOUNT TO TOT-PAY.
	   IF PD-KEY8 NOT = H-IT MOVE 0 TO XYZ MOVE PD-KEY8 TO H-IT.
	   MOVE PD-KEY8 TO PC-KEY8.
       P1-1.
	   ADD 1 TO XYZ.
	   MOVE XYZ TO PC-KEY3.
	   MOVE PAYCUR-KEY TO HOLD-KEY.
	   READ PAYCUR INVALID KEY GO TO P2.
	   IF XYZ = 999 DISPLAY PC-KEY8 " HAS 999 RECORDS IN THE"
	   DISPLAY " CURRENT PAYFILE ALREADY. THIS SHOULD NOT HAPPEN."
	   DISPLAY "CONTACT THE DATA CENTER"
	   GO TO 9100CMF.
	   GO TO P1-1.
       P2. MOVE 0 TO FLAG12.
	   PERFORM A1 THRU A1-EXIT.
	   MOVE PD-AMOUNT TO PC-AMOUNT
	   MOVE PD-PAYCODE TO PC-PAYCODE
	   MOVE PD-DENIAL TO PC-DENIAL
	   MOVE PD-CLAIM TO PC-CLAIM
	   MOVE HOLD-KEY TO PAYCUR-KEY
	   MOVE PD-DATE-T TO PC-DATE-T
	   MOVE DATE-X TO PC-DATE-E
	   MOVE PD-BATCH TO PC-BATCH.
	   WRITE PAYCUR01.
	   GO TO P1.

*******         ACCEPT ANY UNASSIGNED PAYMENT WITH NO CHANGE
*******         TO ORIGINAL CHARGE.

       A1. IF PD-PAYCODE = "001"
	   OR PD-PAYCODE > "009" AND < "021"
	   GO TO A1-EXIT.

*******         FIND CHARGE RECORD THIS PAYMENT WILL BE POSTED AGAINST.

	   STRING PD-KEY8 "000" DELIMITED BY "@" INTO CHARCUR-KEY.
	   START CHARCUR KEY > CHARCUR-KEY INVALID GO TO A1-EXIT.
       A2. READ CHARCUR NEXT WITH LOCK AT END GO TO A1-EXIT.
	   IF CC-KEY8 NOT = PD-KEY8 GO TO A1-EXIT.
	   IF CC-CLAIM NOT = PD-CLAIM GO TO A2.

*******      CHARGE RECORD IS NOT ASSIGNED INSURANCE.
*******      OR WAS ASSIGNED ONCE AND ALREADY CONVERTED.
*******      IN EITHER CASE, ACCEPT PAYMENT WITH NO CHANGE
*******      TO ORIGINAL CHARGE RECORD.

	   IF CC-PAYCODE = "001"
	   OR CC-PAYCODE > "009" AND < "021"
	   GO TO A1-EXIT.
	   IF CC-FUTURE = "Z" GO TO A1-EXIT.

******* FIND  PRI,SEC AND TRI CODES FOR THIS ACCOUNT(GARNO)

	   MOVE PC-KEY8 TO G-GARNO.
	   READ GARFILE INVALID
	   DISPLAY PAYCUR-KEY " RECORD HAS NO GARNO"
	   GO TO A1-EXIT.
******* CHECK FOR A MEDICARE PAYMENT ON AN UNASSIGNED ACCOUNT.
******* IF SO CONVERT TO 001 ON THE CHARGE CODE.

	   IF (PD-PAYCODE = "003") AND ((G-PRINS = "093") OR
	   (G-SEINS = "093"))
	   MOVE 0 TO CLAIM-TOT GO TO A7-0.

*******   ACCEPT ANY ASSIGNED INSURANCE PAYMENT(FOOLISH COMPANY!)
*******   WHICH IS NOT CLAIMED BY THIS ACCOUNT!
       A2-1.
	   IF  PD-PAYCODE NOT = G-PRINS
	   AND PD-PAYCODE NOT = G-SEINS
	   AND PD-PAYCODE NOT = G-TRINS
	   GO TO A1-EXIT.

******* ACCEPT PRIMARY AND SECONDARY ACCOUNT PAYMENTS AGAINST
******* ASSIGNED CHARGES WITHOUT CHANGING CHARGE RECORD
	   IF  CC-PAYCODE NOT = G-PRINS
	   AND CC-PAYCODE NOT = G-SEINS
	   AND CC-PAYCODE NOT = G-TRINS
	   GO TO A1-EXIT.

*******  SEARCH FOR AND RECORD KINDS OF PAYMENTS MADE
*******  AGAINST ORIGINAL CHARGE ALREADY WITH RESPECT
*******  TO PRIMARY,SECONDARY OR TERTIARY INSURANCE CODES.
       AAA.
	   MOVE 0 TO P-FLAG S-FLAG T-FLAG.
	   IF G-SEINS = "001" MOVE 1 TO S-FLAG.
	   IF G-TRINS = "001" MOVE 1 TO T-FLAG.
	   MOVE 0 TO PAYCUR-TOT.
	   MOVE "000" TO PC-KEY3.
	   MOVE G-GARNO TO PC-KEY8.
	   START PAYCUR KEY > PAYCUR-KEY INVALID GO TO A6.
       A5. READ PAYCUR NEXT AT END GO TO A6.
	   IF PC-KEY8 NOT = G-GARNO GO TO A6.
	   IF PC-CLAIM NOT = CC-CLAIM GO TO A5.
	   ADD PC-AMOUNT TO PAYCUR-TOT.
	   IF PC-PAYCODE = G-PRINS
	   MOVE 1 TO P-FLAG GO TO A5.
	   IF PC-PAYCODE = G-SEINS
	   MOVE 1 TO S-FLAG GO TO A5.
	   IF PC-PAYCODE = G-TRINS
	   MOVE 1 TO T-FLAG. 
	   GO TO A5.

*******  ALL THREE INSURANCE PAYMENTS HAVE BEEN MADE.
*******  EVEN THOUGH ORIGINAL CHARGE IS STILL INSURANCE
*******  PENDING DON'T CHANGE IT! GET AS MANY PAYMENTS FROM
*******  INSURANCE COMPANY AS POSSIBLE!
*******   [NOTE] THIS WILL HAPPEN IF A 4TH COMPANY
*******          MAKES A PAYMENT; BUT WILL NOT HAPPEN
*******          WITHIN THE SYSTEM EXCEPT FOR THAT!

       A6. ADD CC-AMOUNT PAYCUR-TOT PD-AMOUNT
	   GIVING CLAIM-TOT.
	   IF CLAIM-TOT = 0 GO TO A7-0.
	   IF PD-PAYCODE = "091" AND CC-PAYCODE = "091"
	   MOVE 0 TO CLAIM-TOT GO TO A7-0.
	   IF PD-PAYCODE = "091" GO TO A1-EXIT.
      *  ( ALL THREE PAID) OR ( PRI,SEC PAID AND TRI = 091)
      *   CONVERT TO 001.
	   IF (P-FLAG = 1 AND S-FLAG = 1 AND T-FLAG = 1) 
	   OR (P-FLAG = 1 AND S-FLAG = 1 AND G-TRINS = "091")
	   MOVE 0 TO CLAIM-TOT  GO TO A7-0.
	   IF CC-PAYCODE = G-TRINS GO TO TRI-1.
	   IF CC-PAYCODE = G-SEINS GO TO SEC-1.
      * PRIMARY CC-PAYCODE
	   IF PD-PAYCODE = G-PRINS AND S-FLAG = 0 GO TO A7-0.
	   IF PD-PAYCODE = G-PRINS AND S-FLAG = 1 
		 AND T-FLAG = 0 GO TO A8-0.
	   IF PD-PAYCODE = G-PRINS AND S-FLAG = 1 
		 AND T-FLAG = 1 MOVE 0 TO CLAIM-TOT GO TO A7-0.
	   GO TO A1-EXIT.
      * SECONDARY CC-PAYCODE
       SEC-1.
	   IF PD-PAYCODE = G-SEINS AND P-FLAG = 0 GO TO A1-EXIT.
	   IF PD-PAYCODE = G-SEINS AND P-FLAG = 1 
		 AND T-FLAG = 1 MOVE 0 TO CLAIM-TOT GO TO A7-0.
	   IF PD-PAYCODE = G-SEINS AND P-FLAG = 1 
		 AND T-FLAG = 0 GO TO A8-0.
	   GO TO A1-EXIT.
      * TERTIARY CC-PAYCODE
       TRI-1.
	   IF PD-PAYCODE = G-TRINS AND P-FLAG = 0 GO TO A1-EXIT.
	   IF PD-PAYCODE = G-TRINS AND S-FLAG = 0 GO TO A1-EXIT. 
	   IF PD-PAYCODE = G-TRINS AND P-FLAG = 1 
		 AND S-FLAG = 1 MOVE 0 TO CLAIM-TOT GO TO A7-0.
	   GO TO A1-EXIT.

       A7-0.
	   MOVE "00000000" TO CC-DATE-A.
	   IF CC-REC-STAT = "3" MOVE "1" TO CC-REC-STAT.
	   IF CC-REC-STAT = "2" MOVE "0" TO CC-REC-STAT.
	   IF CLAIM-TOT > 0 PERFORM B1 THRU B2 ELSE
	   MOVE "001" TO CC-PAYCODE MOVE "U" TO CC-ASSIGN
	   MOVE "U" TO CC-NEIC-ASSIGN MOVE " " TO CC-PAPER.
	   REWRITE CHARCUR01. GO TO A1-EXIT.
       A8-0.
	   MOVE "00000000" TO CC-DATE-A.
	   IF CC-REC-STAT = "3" MOVE "1" TO CC-REC-STAT.
	   IF CC-REC-STAT = "2" MOVE "0" TO CC-REC-STAT.
	   IF CLAIM-TOT > 0 PERFORM C1 THRU C2 ELSE
	   MOVE "001" TO CC-PAYCODE MOVE "U" TO CC-ASSIGN
	   MOVE "U" TO CC-NEIC-ASSIGN MOVE " " TO CC-PAPER.
	   REWRITE CHARCUR01. GO TO A1-EXIT.
       B1.
	   MOVE G-SEINS TO CC-PAYCODE
	   MOVE G-SE-ASSIGN TO CC-ASSIGN
	   MOVE G-SEINS TO INS-KEY
	   READ INSFILE INVALID MOVE "U" TO INS-ASSIGN
	   MOVE "U" TO INS-NEIC-ASSIGN MOVE " " TO INS-CLAIMTYPE.
	   MOVE INS-CLAIMTYPE TO CC-PAPER
	   MOVE INS-NEIC-ASSIGN TO CC-NEIC-ASSIGN.
	   IF CC-ASSIGN = "S" MOVE "U" TO CC-ASSIGN.
	   IF CC-NEIC-ASSIGN = "S" MOVE "A" TO CC-NEIC-ASSIGN.
       B2. EXIT.
       C1.
	   MOVE G-GARNO TO MPLR-KEY
	   READ MPLRFILE INVALID MOVE "001" TO G-TRINS
	   MOVE "U" TO MPLR-TR-ASSIGN.
	   MOVE G-TRINS TO CC-PAYCODE
	   MOVE MPLR-TR-ASSIGN TO CC-ASSIGN
	   MOVE G-TRINS TO INS-KEY
	   READ INSFILE INVALID MOVE "U" TO INS-ASSIGN
	   MOVE "U" TO INS-NEIC-ASSIGN MOVE " " TO INS-CLAIMTYPE.
	   MOVE INS-CLAIMTYPE TO CC-PAPER
	   IF CC-PAPER = "E" MOVE "P" TO CC-PAPER.
	   MOVE INS-NEIC-ASSIGN TO CC-NEIC-ASSIGN.
	   IF CC-ASSIGN = "S" MOVE "U" TO CC-ASSIGN.
	   IF CC-NEIC-ASSIGN = "S" MOVE "A" TO CC-NEIC-ASSIGN.
       C2. EXIT.
       A1-EXIT. EXIT.
       9100CMF.
	   MOVE TOT-CHAR TO NEF-11
	   INSPECT CNT-CHAR REPLACING LEADING "0" BY " "
	   DISPLAY CNT-CHAR " CHARGES POSTED FOR " NEF-11
	   MOVE TOT-PAY TO NEF-11
	   INSPECT CNT-PAY REPLACING LEADING "0" BY " "
	   DISPLAY CNT-PAY " PAYMENTS POSTED   FOR " NEF-11.
       9200CMF.
	   CLOSE PAYCUR CHARCUR.
	   DISPLAY "POSTING PROGRAM HAS ENDED".
	   STOP RUN.
