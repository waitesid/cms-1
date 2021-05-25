      * @package cms
      * @link    http://www.cmsvt.com
      * @author  s waite <cmswest@sover.net>
      * @copyright Copyright (c) 2020 cms <cmswest@sover.net>
      * @license https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
       IDENTIFICATION DIVISION.
       PROGRAM-ID. new1500.
       AUTHOR. SID WAITE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DOCFILE  ASSIGN TO "S100" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS DOC-KEY.
           SELECT MPLRFILE ASSIGN TO "S105"     ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC        RECORD KEY IS MPLR-KEY.
           SELECT INSFILE ASSIGN TO "S110"    ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC        RECORD KEY IS INS-KEY
           ALTERNATE RECORD KEY IS INS-NAME WITH DUPLICATES
           ALTERNATE RECORD KEY IS INS-CITY WITH DUPLICATES
           ALTERNATE RECORD KEY IS INS-ASSIGN WITH DUPLICATES
           ALTERNATE RECORD KEY IS INS-CLAIMTYPE WITH DUPLICATES
           ALTERNATE RECORD KEY IS INS-NEIC WITH DUPLICATES
           ALTERNATE RECORD KEY IS INS-NEIC-ASSIGN WITH DUPLICATES.
           SELECT PATFILE ASSIGN TO "S30" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS P-PATNO
           ALTERNATE RECORD KEY IS P-GARNO WITH DUPLICATES.
           SELECT FILEIN ASSIGN TO "S35" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT FILE-OUT ASSIGN TO "S45" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT CHARCUR ASSIGN TO "S50" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS CHARCUR-KEY
           ALTERNATE RECORD KEY IS  CC-PAYCODE WITH DUPLICATES.
           SELECT GARFILE ASSIGN TO "S55" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS G-GARNO.
           SELECT PROCFILE ASSIGN TO "S60" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS PROC-KEY.
           SELECT REFPHY ASSIGN TO "S65" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS REF-KEY
           ALTERNATE RECORD KEY IS REF-BSNUM  WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-CRNUM WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-UPIN  WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-CDNUM WITH DUPLICATES
           ALTERNATE RECORD KEY IS REF-NAME  WITH DUPLICATES.
           SELECT PARMFILE ASSIGN TO "S70" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT PLACEFILE ASSIGN TO "S80" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT PAYCUR ASSIGN TO "S90" ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC RECORD KEY IS PAYCUR-KEY.
           SELECT DIAGFILE ASSIGN TO "S95" ORGANIZATION IS INDEXED
           ACCESS IS RANDOM RECORD KEY IS DIAG-KEY
           ALTERNATE RECORD KEY IS DIAG-TITLE WITH DUPLICATES.
           SELECT GAPFILE ASSIGN TO "S115" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS GAPKEY
           ALTERNATE RECORD KEY IS GAP-NAME WITH DUPLICATES
           ALTERNATE RECORD KEY IS GAP-CITY WITH DUPLICATES
           ALTERNATE RECORD KEY IS GAP-STATE WITH DUPLICATES.
           SELECT SORFILE ASSIGN TO "S125" ORGANIZATION
           LINE SEQUENTIAL.
           SELECT PROVCAID ASSIGN TO "S130" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC  RECORD KEY IS PROV-KEY
           ALTERNATE RECORD KEY IS PROV-NPI WITH DUPLICATES
           ALTERNATE RECORD KEY IS PROV-TAX WITH DUPLICATES
           ALTERNATE RECORD KEY IS PROV-NAME WITH DUPLICATES
           LOCK MODE MANUAL.
           SELECT AUTHFILE ASSIGN TO "S135" ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC RECORD KEY IS AUTH-KEY
           LOCK MODE MANUAL.

       DATA DIVISION.
       FILE SECTION.
       FD  AUTHFILE
           BLOCK CONTAINS 6 RECORDS
           DATA RECORD IS AUTHFILE01.
       01  AUTHFILE01.
           02 AUTH-KEY.
              03 AUTH-KEY8 PIC X(8).
              03 AUTH-KEY6 PIC X(6).
           02 AUTH-NUM PIC X(15).
           02 AUTH-QNTY PIC XX.
           02 AUTH-DATE-E PIC X(8).
           02 AUTH-NDC PIC X(11).
           02 AUTH-FILLER PIC X(30).
       FD  PROVCAID.
       01  PROVCAID01.
           02 PROV-KEY PIC X(7).
           02 PROV-NAME PIC X(24).
           02 PROV-NPI PIC X(10).
           02 PROV-TAX PIC X(10).
           02 PROV-STREET PIC X(20).
           02 PROV-CITY PIC X(20).
           02 PROV-STATE PIC XX.
           02 PROV-ZIP PIC X(5).
       FD  SORFILE.
       01  SORFILE01 PIC X.
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

       FD PATFILE
      *    BLOCK CONTAINS 5 RECORDS
           DATA RECORD IS P-MASTER.
       01 P-MASTER.
           02 P-PATNO PIC X(8).
           02 P-GARNO PIC X(8).
           02 P-PATNAME PIC X(24).
           02 P-SEX PIC X.
           02 P-RELATE PIC X.
           02 P-MSTAT PIC X.
           02 P-DOB PIC X(8).

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
           02 MPLR-TR-GROUP PIC X(10).
           02 MPLR-TRIPOL PIC X(16).
           02 MPLR-TR-NAME PIC X(24).
           02 MPLR-TR-RELATE PIC X.
           02 MPLR-FUTURE PIC X(6).
       FD GAPFILE.
       01 GAPFILE01.
           02 GAPKEY PIC X(7).
           02 GAP-NAME PIC X(25).
           02 GAP-ADDR PIC X(22).
           02 GAP-CITY PIC X(15).
           02 GAP-STATE PIC XX.
           02 GAP-ZIP PIC X(9).
           02 GAP-TYPE PIC X.
           02 GAP-FUTURE PIC X(40).
       FD  DIAGFILE
           BLOCK CONTAINS 8 RECORDS
           DATA RECORD IS DIAG01.
       01  DIAG01.
           02 DIAG-KEY PIC X(7).
           02 DIAG-TITLE PIC X(61).
           02 DIAG-MEDB PIC X(5).
       FD  PAYCUR
           BLOCK CONTAINS 6 RECORDS
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
       FD  DOCFILE.
       01  DOCFILE01.
           02 DOC-KEY.
             03 DOC-INS PIC XXX.
             03 DOC-NUM PIC XX.
           02 DOC-FEDID PIC X(14).
           02 DOC-PVNUM PIC X(14).
           02 DOC-UPIN PIC X(6).
           02 DOC-NPI PIC X(10).
           02 DOC-IND PIC X.
           02 DOC-GROUP PIC X(14).
           02 DOC-NPIGROUP PIC X(10).
           02 DOC-NAME PIC X(24).
           02 DOC-GROUPNAME PIC X(29).
           02 DOC-SSNUM PIC X(9).
           02 DOC-TAXONOMY PIC X(10).
           02 DOC-NEIC PIC X(5).
           02 DOC-TAXGROUP PIC X(10).
           02 DOC-FUTURE PIC X(15).

       FD  PLACEFILE.
       01  PLACEFILE01.
           02 DF1 PIC X.
           02 DF2 PIC X.
           02 DF3 PIC X(22).
           02 DF4 PIC X(18).
           02 DF5 PIC X(15).
           02 DF6 PIC XX.
           02 DF7 PIC X(9).
           02 DF8 PIC X(10).
       FD  PARMFILE.
       01  PF1 PIC X(67).
       FD  FILEIN.
       01  FILEIN01.
           02 FI-PC PIC 999.
           02 FI-PATID.
             03 FI-PATID7 PIC X(7).
             03 FI-PATID8 PIC X.
           02 FI-KEY PIC X(11).
           02 FI-DATE PIC X(8).
           02 FI-ASSIGN PIC X.
           02 FI-PLACE PIC X.
           02 FI-DOC PIC XX.
           02 FI-PAPER PIC X.
           02 FILLER PIC X(27).
           02 FI-PS PIC X.

       FD  REFPHY
           BLOCK CONTAINS 5 RECORDS
           DATA RECORD IS REFPHY01.
       01  REFPHY01.
           02 REF-KEY PIC XXX.
           02 REF-BSNUM PIC X(5).
           02 REF-CRNUM PIC X(6).
           02 REF-UPIN PIC X(6).
           02 REF-CDNUM PIC X(7).
           02 REF-NAME PIC X(24).
           02 REF-NPI PIC X(10).
       FD  PROCFILE
           DATA RECORD IS PROCFILE01.
       01  PROCFILE01.
           02 PROC-KEY.
             03 PROC-KEY1 PIC X(5).
             03 PROC-KEY2 PIC XX.

           02 PROC-OLD PIC X(7).
           02 PROC-TYPE PIC X.
           02 PROC-BCBS PIC X(4).
           02 PROC-TITLE PIC X(28).
           02 PROC-AMOUNT PIC 9(4)V99.
           02 CARE-AMOUNT PIC 9(4)V99.
       FD FILE-OUT.
       01  OUT01 PIC X(132).
       01  CHNL-4 PIC X.
       FD  CHARCUR
           BLOCK CONTAINS 5 RECORDS
           DATA RECORD IS CHARCUR01.
       01  CHARCUR01.
           02 CHARCUR-KEY.
             03 CC-KEY8.
               04 CC-KEY81 PIC X(7).
               04 CC-KEY82 PIC X.
             03 CC-KEY3 PIC XXX.
           02 CC-PATID.
             03 CC-PATID7 PIC X(7).
             03 CC-PATID8 PIC X.
           02 CC-CLAIM PIC X(6).
           02 CC-SERVICE PIC X.
           02 CC-DIAG.
             03 CC-DIAG-L PIC X.
             03 CC-DIAG1 PIC X(6).
           02 CC-PROC.
             03 CC-PROC1 PIC X(5).
             03 CC-PROC2 PIC XX.
           02 CC-MOD2 PIC XX.
           02 CC-MOD3 PIC XX.
           02 CC-MOD4 PIC XX.
           02 CC-AMOUNT PIC S9(4)V99.
           02 CC-DOCR PIC X(3).
           02 CC-DOCP PIC 99.
           02 CC-PAYCODE PIC 999.
           02 CC-STUD PIC X.
           02 CC-WORK PIC XX.
           02 CC-DAT1 PIC X(8).
           02 CC-RESULT PIC X.
           02 CC-ACT PIC X.
           02 CC-SORCREF PIC X.
           02 CC-COLLT PIC X.
           02 CC-AGE PIC X.
           02 CC-PAPER PIC X.
           02 CC-PLACE PIC X.
           02 CC-IOPAT PIC X.
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
           02 CC-DX5 PIC X(7).
           02 CC-FUTURE PIC X(6).
       FD GARFILE
           BLOCK CONTAINS 3 RECORDS
           DATA RECORD IS G-MASTER.
       01 G-MASTER.
           02 G-GARNO PIC X(8).
           02 G-GARNAME.
             03 GN1 PIC X.
             03 GN2 PIC X(23).
           02 G-BILLADD.
             03 G-BILLADD1 PIC X.
             03 G-BILLADD2 PIC X(21).
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
           02 G-COPAY PIC S9(5)V99.
           02 G-LASTBILL PIC X(8).
           02 G-ASSIGNM PIC X.
           02 G-PRIVATE PIC X.
           02 G-BILLCYCLE PIC X.
           02 G-DELETE PIC X.
           02 G-FILLER PIC XXX.
       WORKING-STORAGE SECTION.
       01  ALF1 PIC X.
       01  CLMTAB01.
           02 CLMTAB PIC X(6) OCCURS 6 TIMES.
       01  LABTAB01.
           02 LABTAB PIC X(4) OCCURS 50 TIMES.
       01  DOCTAB01.
           02 DOCTAB PIC X(11) OCCURS 20 TIMES.
       01  PLACE-TAB01.
           02 PLACE-TAB OCCURS 29 TIMES.
             03 PL-TAB PIC X.
             03 PL-NUM PIC X.
             03 PL-NAME PIC X(22).
             03 PL-STREET PIC X(18).
             03 PL-CITY PIC X(15).
             03 PL-STATE PIC XX.
             03 PL-ZIP PIC X(9).
             03 PL-NPI PIC X(10).
       01  LINE-0.
           02 L0F0 PIC X.
           02 FILLER PIC X.
           02 L0F1 PIC XXX.
           02 FILLER PIC X.
           02 L0F2 PIC X(18).
           02 FILLER PIC X VALUE SPACE.
           02 L0F3 PIC X(18).
           02 FILLER PIC X.
           02 L0F4 PIC X(15).
           02 FILLER PIC X.
           02 L0F5 PIC XX.
           02 FILLER PIC X.
           02 L0F6 PIC X(9).
       01  LINE-00.
            02 L00F1 PIC XX.
            02 FILLER PIC X(5) VALUE SPACE.
            02 L00F2 PIC XX.
            02 FILLER PIC X(5) VALUE SPACE.
            02 L00F3 PIC XX.
            02 FILLER PIC X(7) VALUE SPACE.
            02 L00F4 PIC XX.
            02 FILLER PIC X(5) VALUE SPACE.
            02 L00F5 PIC XX.
            02 FILLER PIC X(6) VALUE SPACE.
            02 L00F6 PIC XX.
            02 FILLER PIC X(4) VALUE SPACE.
            02 L00F7 PIC XX.
            02 FILLER PIC X(5) VALUE SPACE.
            02 L00F8 PIC X(16).
       01 LINE-1.
           02 L1F1 PIC X(24).
           02 FILLER PIC X(5) VALUE SPACE.
           02 L1F2 PIC XX.
           02 FILLER PIC XX VALUE SPACE.
           02 L1F3 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L1F4CC PIC XX.
           02 L1F4 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L1F5 PIC XXX.
           02 FILLER PIC XX VALUE SPACE.
           02 L1F6 PIC XXX.
           02 FILLER PIC X VALUE SPACE.
           02 L1F7 PIC X(24).
       01  LINE-20.
           02 L20F1 PIC X(22).
           02 FILLER PIC X(28) VALUE SPACE.
           02 L20F2 PIC X(22).



       01  LINE-2.
           02 L2F1 PIC X(22).
           02 FILLER PIC X(10) VALUE SPACE.
           02 L2F2 PIC X.
           02 FILLER PIC XXXX VALUE SPACE.
           02 L2F3 PIC X.
           02 FILLER PIC XXX VALUE SPACE.
           02 L2F4 PIC X.
           02 FILLER PIC XXXX VALUE SPACE.
           02 L2F5 PIC X.
           02 FILLER PIC XXX VALUE SPACE.
           02 L2F6 PIC X(22).
       01 LINE-3.
           02 L3F1 PIC X(18).
           02 FILLER PIC X(8) VALUE SPACE.
           02 L3F2 PIC XX.
           02 FILLER PIC X(5) VALUE SPACE.
           02 L3F3 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L3F4 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L3F5 PIC XXX.
           02 FILLER PIC X VALUE SPACE.
           02 L3F6 PIC X(18).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L3F7 PIC XX.
       01 LINE-4.
           02 L4F1 PIC X(10).
           02 FILLER PIC X(4) VALUE SPACE.
           02 L4F4 PIC XXX.
           02 FILLER PIC X VALUE SPACE.
           02 L4F5 PIC XXX.
           02 L4F6 PIC X.
           02 L4F7 PIC X(4).
           02 FILLER PIC X(7).
           02 L4F8 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L4F9 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L4F10 PIC XXX.
           02 FILLER PIC X VALUE SPACE.
           02 L4F100.
             03 L4F11 PIC X(5).
             03 L4F12 PIC X.
             03 L4F13 PIC X(4).
           02 FILLER PIC X(5) VALUE SPACE.
           02 L4F14 PIC XXX.
           02 FILLER PIC X VALUE SPACE.
           02 L4F15 PIC XXX.
           02 L4F16 PIC X.
           02 L4F17 PIC X(4).
       01 LINE-41.
           02 L41F1 PIC X(24).
           02 FILLER PIC X(25).
           02 L41F2 PIC X(12).
       01 LINE-42.
           02 L42F1 PIC X(16).
           02 FILLER PIC X VALUE SPACE.
           02 L42F2 PIC X(10).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L42F3 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L42F4 PIC XXX.
           02 FILLER PIC X(10) VALUE SPACE.
           02 L42F5 PIC XX.
           02 FILLER PIC XX VALUE SPACE.
           02 L42F6 PIC XX.
           02 FILLER PIC XX VALUE SPACE.
           02 L42F7 PIC XX.
           02 FILLER PIC X(4) VALUE SPACE.
           02 L42F8 PIC XXX.
           02 FILLER PIC X(4) VALUE SPACE.
           02 L42F9 PIC XXX.


       01 LINE-43.
           02 FILLER PIC X VALUE SPACE.
           02 L43F1 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L43F2 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L43F3 PIC XX.
           02 FILLER PIC X(7) VALUE SPACE.
           02 L43F4 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L43F5 PIC XXX.
           02 FILLER PIC X(8) VALUE SPACE.
           02 L43F6 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L43F7 PIC XXX.
           02 FILLER PIC X(8) VALUE SPACE.
           02 L43F8 PIC X(18).
       01 LINE-44.
           02 L44F1 PIC X(18).
           02 FILLER PIC X(15) VALUE SPACE.
           02 L44F2 PIC XXX.
           02 FILLER PIC XXX VALUE SPACE.
           02 L44F3 PIC XXX.
           02 FILLER PIC X(8) VALUE SPACE.
           02 L44F4 PIC X(18).
       01 LINE-45.
           02 L45F1 PIC X(18).
           02 FILLER PIC X VALUE SPACE.
           02 L45F1-A PIC X(7).
           02 FILLER PIC X(14) VALUE SPACE.
           02 L45INS PIC XXX.
           02 FILLER PIC X(7) VALUE SPACE.
           02 L45F2 PIC XXX.
           02 FILLER PIC XX VALUE SPACE.
           02 L45F3 PIC XXX.
      *01 LINE-5.
      *    02 L5F01 PIC XX.
      *    02 FILLER PIC X VALUE SPACE.
      *    02 L5F02 PIC X(16).
      *    02 FILLER PIC X VALUE SPACE.
      *    02 L5F03 PIC X(9).
      *    02 FILLER PIC X VALUE SPACE.
      *    02 L5F04 PIC XXX.
      *    02 FILLER PIC X(5) VALUE SPACE.
      *    02 L5F0A PIC XX VALUE SPACE.
      *    02 FILLER PIC XX VALUE SPACE.
      *    02 L5F1 PIC XX.
      *01 LINE-6.
      *    02 L6F01 PIC X(9).
      *    02 FILLER PIC X VALUE SPACE.
      *    02 L6F02 PIC X(7).
      *    02 FILLER PIC X(33) VALUE SPACE.
      *    02 L6F1 PIC X(5).
       01  LINE-60.
           02 L60F1 PIC X(24) VALUE "     SIGNATURE ON FILE".
           02 FILLER PIC X(28) VALUE SPACE.
           02 L60F2 PIC X(22) VALUE "    SIGNATURE ON FILE".
       01  LINE-61.
           02 L61F1 PIC XX.
           02 FILLER PIC X.
           02 L61F2 PIC XX.
           02 FILLER PIC X.
           02 L61F3CC PIC XX.
           02 L61F3 PIC XX.
       01 LINE-7LEG.
           02 FILLER PIC X(29) VALUE SPACE.
           02 FILLER PIC XXX VALUE SPACE.
           02 L7F2LEG PIC X(10).

       01 LINE-7.
           02 L7F0 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L7F1 PIC X(24).
           02 FILLER PIC X(4) VALUE SPACE.
           02 L7F2 PIC X(10).
           02 FILLER PIC X(12) VALUE SPACE.
           02 L7F3 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L7F4 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L7F5CC PIC XX.
           02 L7F5 PIC XX.
       01 LINE-8.
           02 L8F0 PIC X(16).
           02 FILLER PIC X(9).
           02 L8F1 PIC X(24).
           02 FILLER PIC X(2) VALUE SPACE.
           02 L8F2 PIC X.
           02 FILLER PIC XXXX VALUE SPACE.
           02 L8F3 PIC X.
           02 FILLER PIC X(9) VALUE SPACE.
           02 L8F4 PIC X(7).
       01 LINE-81.
           02 FILLER PIC XX VALUE SPACE.
           02 L81F1 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L81F2 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L81F3 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L81F4 PIC X(7).
       01 LINE-82.
           02 FILLER PIC XX VALUE SPACE.
           02 L82F1 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L82F2 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L82F3 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L82F4 PIC X(7).
       01 LINE-83.
           02 FILLER PIC XX VALUE SPACE.
           02 L83F1 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L83F2 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L83F3 PIC X(7).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L83F4 PIC X(7).
           02 FILLER PIC X(4) VALUE SPACE.
           02 L83-PRIOR PIC X(15).

       01 LINE-9.
           02 FILLER PIC XX VALUE SPACE.
           02 L9F1 PIC X(32).
       01 LINE-10LEG.
           02 LINE-1002LEG OCCURS 6 TIMES.
             03 L10F1LEG1 PIC X(24).
             03 L10F12-NDC PIC X(11).
             03 L10F1L1  PIC XX.
             03 L10-DOSAGE PIC X(10).
             03 L10F1L2  PIC XX.
             03 L10-QUAN PIC XXX.
             03 L1-FIL3 PIC X(11).
             03 L10-QUAL  PIC XX.
             03 FILLER PIC XX.
             03 L10F13-LEGNUM PIC X(10).
       01 LINE-10.
           02 LINE-1002 OCCURS 6 TIMES.
      *       03 F100  PIC X.
             03 L10F1  PIC XX.
             03 F101   PIC X.
             03 L10F2  PIC XX.
             03 F102   PIC X.
             03 L10F3  PIC XX.
             03 F103   PIC X.
             03 L10F1S PIC XX.
             03 F104  PIC X.
             03 L10F2S PIC XX.
             03 F105   PIC X.
             03 L10F3S PIC XX.
             03 F106   PIC X.
             03 L10F4  PIC XX.
             03 F107   PIC X.
             03 L10F5  PIC XX.
             03 F108   PIC X.
             03 L10F6  PIC X(5).
             03 F109   PIC XXX.
             03 L10F7  PIC XX.
             03 F1010  PIC X.
             03 L10F8  PIC XX.
             03 F1011  PIC X.
             03 L10F9  PIC XX.
             03 F1012  PIC XXXX.
             03 L10F10 PIC X(4).
             03 F1013  PIC X.
             03 L10F11 PIC Z,ZZ9.99.
             03 F1014  PIC X.
             03 L10F12 PIC XX.
             03 F1015  PIC XX.
             03 L10ESP PIC X.
             03 F1016  PIC X(4).
             03 L10F13 PIC X(12).
       01  LINE101.
           02 FILLER PIC X(19) VALUE SPACES.
           02 L101F1 PIC XX.
           02 FILLER PIC X VALUE "/".
           02 L101F2 PIC XX.
           02 FILLER PIC X VALUE "/".
           02 L101F3CC PIC XX.
           02 L101F3 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L101F4 PIC X(10).
           02 FILLER PIC X VALUE SPACE.
           02 L101F41 PIC X(5).
           02 FILLER PIC XX VALUE SPACE.
           02 L101F5 PIC Z,ZZZ.99.
       01  LINE101S7.
           02 FILLER PIC X(19) VALUE SPACES.
           02 L101F1S7 PIC XX.
           02 FILLER PIC X VALUE "/".
           02 L101F2S7 PIC XX.
           02 FILLER PIC X VALUE "/".
           02 L101F3CCS7 PIC XX.
           02 L101F3S7 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L101S7F4 PIC X(22).

       01 LINE-11.
      *     02 FILLER PIC X VALUE SPACE.
           02 L11F1 PIC X(14).
           02 FILLER PIC XX VALUE SPACE.
           02 L11F2 PIC X.
           02 FILLER PIC X VALUE SPACE.
           02 L11F3 PIC X.
           02 FILLER PIC XXX VALUE SPACE.
           02 L11F4-1 PIC X(8).
           02 L11F4-2 PIC XX.
           02 FILLER PIC X(4) VALUE SPACE.
           02 L11F5 PIC XXX.
           02 FILLER PIC XX VALUE SPACE.
           02 L11F6 PIC XXX.
           02 FILLER PIC X(7) VALUE SPACE.
           02 L11F7 PIC Z,ZZ9.99.
           02 FILLER PIC XX VALUE SPACE.
           02 L11F8 PIC Z,ZZ9.99.
           02 FILLER PIC X VALUE SPACE.
           02 L11F9 PIC X(8).
       01 LINE-111.
           02 FILLER PIC X(36) VALUE SPACE.
           02 L111F1 PIC XXX.
           02 FILLER PIC XX VALUE SPACE.
           02 L111F12 PIC XX.
       01 LINE-12.
           02 FILLER PIC X(65) VALUE SPACE.
           02 L12F1 PIC X(12).
       01 LINE-13.
           02 FILLER PIC X(22) VALUE SPACE.
           02 L13-PLNAME PIC X(22).
           02 FILLER PIC X(6) VALUE SPACE.
           02 L13F1 PIC X(29).
       01 LINE-14.
      *     02 FILLER PIC X VALUE SPACE.
           02 L14F0 PIC X(21).
           02 FILLER PIC X VALUE SPACE.
           02 L14-PLSTREET PIC X(18).
           02 FILLER PIC X(10) VALUE SPACE.
           02 L14F1 PIC X(29).

       01 LINE-15.
           02 FILLER PIC X(11) VALUE SPACE.
           02 L15F1 PIC XX.
           02 FILLER PIC X VALUE "/".
           02 L15F2 PIC XX.
           02 FILLER PIC X VALUE "/".
           02 L15F3CC PIC XX.
           02 L15F3 PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L15-PLCITY PIC X(15).
           02 FILLER PIC X VALUE SPACE.
           02 L15-PLSTATE PIC XX.
           02 FILLER PIC X VALUE SPACE.
           02 L15-PLZIP PIC X(5).
           02 FILLER PIC X(4).
           02 L15F5 PIC X(22).
       01 LINE-16.
           02 FILLER PIC X(22) VALUE SPACE.
           02 L16-PLNPI PIC X(10) VALUE SPACE.
           02 FILLER PIC X VALUE SPACE.
           02 L16-PLEIN PIC X(17) VALUE SPACE.
           02 L16GRPNPI PIC X(10).
           02 FILLER PIC XX VALUE SPACE.
           02 L16F2 PIC X(12).

       01  CONTLINE.
           02 FILLER PIC X(49) VALUE SPACE.
           02 FILLER PIC X(9) VALUE "CONTINUED".
       01 TEST-DATE.
           02 S-CC PIC XX.
           02 S-YY PIC XX.
           02 S-MM PIC XX.
           02 S-DD PIC XX.
       01 TABA2401.
           02 TABA24 PIC X OCCURS 24 TIMES.
       01  LABCNTR PIC 99 VALUE 0.
       01  S7S7CNTR PIC 9.
       01  LAB-TOT PIC S9(4)V99 VALUE 0.
       01  LAB-TOTZ PIC ZZZZ.99.
       01     CC-PL PIC X.
       01     PLINDX PIC 99 VALUE 0.
       01     DATE-X PIC X(8).
       01     MED PIC 99 VALUE 0.
       01     X PIC 999.
       01     Y PIC 999.
       01     C PIC 99.
       01 XY PIC XX.
       01 YY PIC 99.
       01     CLAIM-TOT PIC S9(5)V99 VALUE 0.
       01     PRIM-PAID PIC S9(5)V99 VALUE 0.
       01     SNUM6 PIC S9(5)V99 VALUE 0.
       01     NUM-CLAIM PIC 999999 VALUE 0.
       01     HOLD-PATID PIC X(8).
       01     HOLD-DATE-T PIC X(8).
       01     NUM3 PIC 999.
       01     CNTR PIC 9 VALUE 0.
       01  PNTR PIC 99.
       01  LCNTR PIC 99.
       01     FLAG PIC 9.
       01  DF-DIAG PIC X(5).
       01  WC-C PIC 99.
       01  SUBMITTER-ID PIC XX.
       01  DIAG-TAB01.
           02 DIAG-TAB02 OCCURS 12 TIMES.
             03 DIAG-TAB PIC X(24).
             03 DIAG-CODE PIC X(7).
       01  LETTER-REDEFINED. 
           02 LETTER-REDEF PIC X(12) VALUE "ABCDEFGHIJKL".
       01  LETTERTAB01 REDEFINES LETTER-REDEFINED.
           02 LETTERTAB PIC X OCCURS 12 TIMES.

       01  DGX PIC 99 VALUE 0.
       01  L10F7TAB01.
           02 L10F7TAB PIC Z OCCURS 4 TIMES.
       01  ALF-5 PIC X(5).
       01  ALF3 PIC XXX.
       01  DIAGCNTR PIC 9.
       01  DIAGOUT01.
           02 DIAGOUT1 PIC X VALUE SPACE.
           02 DIAGOUT2 PIC X(24).
       01  ALF-7.
           02 ALF-71 PIC X(5).
           02 ALF-72 PIC XX.
       01 INSRELATE PIC X.
       01 PAT-RELATE PIC X.
       01  ALF-9.
           02 ALF-95 PIC X(5).
           02 ALF-94 PIC X(4).
       01 ALF-10.
           02 ALF-10-1 PIC XXX.
           02 ALF-10-2 PIC XXX.
           02 ALF-10-3 PIC XXXX.
       01  PF-1.
           02 PF-11 PIC 99.
           02 PF-12 PIC X(4).
           02 PF-13 PIC X(7).
           02 PF-15 PIC X(30).
       01  EPSDTFLAG PIC 9.
       01  FAMPLFLAG PIC 9.
       01  REF-X PIC 9.
       01  AGE-DATE1.
           02 AGE1YY PIC 9999.
           02 AGE1MM PIC 99.
           02 AGE1DD PIC 99.
       01  AGE-DATE2.
           02 AGE2YY PIC 9999.
           02 AGE2MM PIC 99.
           02 AGE2DD PIC 99.
       01  AGE-PAT PIC 999.
       01  CHNL-X PIC X VALUE H"1B".

       PROCEDURE DIVISION.

       Q0.
           MOVE SPACE TO LINE-00 LINE-0 LINE-1 LINE-2 LINE-20
           LINE-2 LINE-3 LINE-4 LINE-41 LINE-42 LINE-43 LINE-44
           LINE-45 LINE-61 LINE-7LEG LINE-8 LINE-9 LINE-11 LINE-12
           LINE-13 LINE-14 LINE-16 L13-PLNAME L14-PLSTREET L15-PLCITY
           L15-PLSTATE L15-PLZIP LINE-10LEG.
           PERFORM BLANK-1 VARYING X FROM 1 BY 1 UNTIL X > 6.
           OPEN INPUT PLACEFILE.

       P00.
           READ PLACEFILE AT END GO TO P000.
           ADD 1 TO PLINDX.
           MOVE DF1 TO PL-TAB(PLINDX)
           MOVE DF2 TO PL-NUM(PLINDX)
           MOVE DF3 TO PL-NAME(PLINDX)
           MOVE DF4 TO PL-STREET(PLINDX)
           MOVE DF5 TO PL-CITY(PLINDX)
           MOVE DF6 TO PL-STATE(PLINDX)
           MOVE DF7 TO PL-ZIP(PLINDX)
           MOVE DF8 TO PL-NPI(PLINDX)
           GO TO P00.

       P000.
           OPEN OUTPUT FILE-OUT.
           OPEN INPUT PARMFILE PATFILE PAYCUR DIAGFILE GAPFILE SORFILE
                AUTHFILE INSFILE MPLRFILE GARFILE DOCFILE PROVCAID.
           READ SORFILE AT END GO TO P10.
           READ PARMFILE.
           READ PARMFILE AT END GO TO P10.
           MOVE PF1 TO SUBMITTER-ID
           MOVE SUBMITTER-ID TO L11F4-2
           MOVE SPACES TO OUT01.
           READ PARMFILE.
           READ PARMFILE. MOVE PF1 TO L0F3.
           READ PARMFILE. MOVE PF1 TO WC-C.
           READ PARMFILE. MOVE PF1 TO L16GRPNPI.
           READ PARMFILE. MOVE PF1 TO L16F2.
           READ PARMFILE. MOVE PF1 TO L12F1.
           MOVE SPACE TO L12F1(4:1).
           READ PARMFILE. MOVE PF1 TO L13F1.
           READ PARMFILE. MOVE PF1 TO L14F1.
           READ PARMFILE. MOVE PF1 TO L15F5.
           READ PARMFILE. MOVE PF1 TO L11F1.
           READ PARMFILE.
           IF PF1 = "1" MOVE "X" TO L11F2
           ELSE MOVE "X" TO L11F3.

       PP-1.
           OPEN INPUT FILEIN.
           OPEN INPUT REFPHY.
           OPEN I-O CHARCUR.
           OPEN INPUT PROCFILE.
           ACCEPT DATE-X FROM CENTURY-DATE.
           MOVE DATE-X TO TEST-DATE.
           MOVE S-MM TO L15F1
           MOVE S-DD TO L15F2
           MOVE S-CC TO L15F3CC
           MOVE S-YY TO L15F3.
           MOVE 001 TO CC-PAYCODE.
           
       P1. 
           READ FILEIN 
             AT END
               PERFORM A7 
               PERFORM A5 
               PERFORM A6 
               GO TO P10.

           IF FI-PS NOT = SORFILE01 GO TO P1.
           
           IF NOT (FI-PC = 004 OR 064 OR 003 OR 141)
             MOVE "X" TO L00F5.

           IF FI-PC = 003 MOVE "X" TO L00F1.

           IF FI-PC = 004 OR 064 MOVE "X" TO L00F2.

           IF FI-PC = 141 MOVE "X" TO L00F3.

           MOVE FI-KEY TO CHARCUR-KEY.
           READ CHARCUR 
             INVALID 
               DISPLAY FI-KEY " NOT THERE" 
               GO TO P1.

       P1-1.
           MOVE SPACE TO L00F1 L00F2 L00F3 L00F4 L00F5
           
           IF NOT (FI-PC = 004 OR 064 OR 003 OR 141)
             MOVE "X" TO L00F5.

           IF FI-PC = 003 MOVE "X" TO L00F1.

           IF FI-PC = 004 OR 064  MOVE "X" TO L00F2.

           IF FI-PC = 141 MOVE "X" TO L00F3.

           MOVE CC-KEY8 TO G-GARNO.
           READ GARFILE 
             INVALID 
               DISPLAY "NO GARNO " CC-KEY8 
               GO TO P1.

           MOVE G-GARNO TO MPLR-KEY
           READ MPLRFILE 
             INVALID 
               MOVE SPACE TO MPLRFILE01.

           MOVE 0 TO FLAG SNUM6 CLAIM-TOT PRIM-PAID.

           IF CC-PATID8 = "P" 
             PERFORM A1 THRU A1-EXIT
           ELSE 
             PERFORM A2 THRU A2-EXIT.
           
           IF FLAG = 1 GO TO P1.
           
           MOVE SPACE TO L2F2 L2F3 L2F4 L2F5
           MOVE CC-PAYCODE TO ALF3
           MOVE G-SE-RELATE TO INSRELATE
           
           IF ALF3 = G-PRINS MOVE G-PR-RELATE TO INSRELATE.
           
           IF ALF3 = G-TRINS MOVE MPLR-TR-RELATE TO INSRELATE.
           
           IF PAT-RELATE = INSRELATE
             MOVE " X " TO L2F2.
           
           IF (PAT-RELATE = "2" OR "K") 
             AND (PAT-RELATE NOT = INSRELATE) 
             MOVE " X " TO L2F3.

           IF (PAT-RELATE = "4" OR "M") MOVE " X " TO L2F4.

           IF (PAT-RELATE = "5" OR "N") MOVE " X " TO L2F5.

           MOVE CC-PATID TO HOLD-PATID
           MOVE CC-DATE-T TO HOLD-DATE-T
           MOVE CC-PAYCODE TO INS-KEY
           READ INSFILE INVALID DISPLAY CC-PAYCODE " NO INS CODE"
           GO TO P1.
           MOVE FI-PS TO L0F0
           MOVE CC-PAYCODE TO L0F1
           MOVE INS-NAME TO L0F2
           MOVE INS-STREET TO L0F3
           MOVE INS-CITY TO L0F4
           MOVE INS-STATE TO L0F5
           MOVE INS-ZIP TO L0F6
           MOVE SPACE TO L42F8 L42F9
           IF CC-PAYCODE = "091" PERFORM WORKLINE THRU WORKLINE-EXIT.
           IF CC-PAYCODE = "062" PERFORM GAPLINE0 THRU GAPLINE0-EXIT.
           MOVE SPACE TO L42F8 L42F9
           IF G-PRINS = FI-PC PERFORM PRI-FILL PERFORM SEC-INS
           GO TO HERE-1.
           IF G-SEINS = FI-PC PERFORM SEC-FILL PERFORM PRI-INS
           GO TO HERE-1.
           IF G-TRINS = FI-PC PERFORM TRI-FILL PERFORM SEC-INS
           GO TO HERE-1.
           MOVE SPACE TO L00F8 L41F2 L1F7 L43F8 L44F4 L42F8 L42F9.
       HERE-1.
           MOVE G-BILLADD TO L20F1 l20f2
           MOVE G-STREET TO L2F1 L2F6
           IF G-STREET = SPACE
           MOVE G-BILLADD TO L2F1 L2F6
           MOVE SPACE  TO L20F1 L20F2.
           MOVE G-CITY TO L3F1 L3F6.
           MOVE G-STATE TO L3F2 L3F7
           MOVE G-ZIP TO ALF-9
           MOVE ALF-95 TO L4F11
           MOVE ALF-94 TO L4F13
           IF ALF-94 NUMERIC MOVE "-" TO L4F12
           ELSE MOVE SPACE TO L4F13
           MOVE G-ZIP TO L4F100.
           MOVE L4F100 TO L4F1.
           MOVE "-" TO L4F6 L4F16 
           IF G-PHONE = SPACE MOVE SPACE TO L4F6 L4F16.
           MOVE G-PHONE TO ALF-10
           MOVE ALF-10-1 TO L4F4 L4F14
           MOVE ALF-10-2 TO L4F5 L4F15
           MOVE ALF-10-3 TO L4F7 L4F17.
           IF CC-ACC-TYPE = SPACE MOVE " X " TO L42F4 L43F7 L44F3
           MOVE SPACE TO L42F3 L43F6 L44F2.
           IF CC-ACC-TYPE = "1" MOVE " X " TO L42F3 L43F7 L44F3
           MOVE SPACE TO L42F4 L43F6 L44F2.
           IF CC-ACC-TYPE = "2" MOVE " X " TO L42F4 L43F6 L44F3
           MOVE SPACE TO L42F3 L43F7 L44F2.
           IF CC-ACC-TYPE = "3" MOVE " X " TO L42F4 L43F7 L44F2
           MOVE SPACE TO L42F3 L43F6 L44F3.
           IF CC-DAT1 = ZERO MOVE SPACE TO LINE-61
           ELSE MOVE CC-DAT1 TO TEST-DATE
           MOVE S-MM TO L61F1
           MOVE S-DD TO L61F2
           MOVE S-CC TO L61F3CC
           MOVE S-YY TO L61F3.
           IF CC-DATE-M = ZERO MOVE SPACE TO L7F3 L7F4 L7F5CC L7F5
           ELSE MOVE CC-DATE-M TO TEST-DATE
           MOVE S-MM TO L7F3
           MOVE S-DD TO L7F4
           MOVE S-CC TO L7F5CC
           MOVE S-YY TO L7F5.
           MOVE CC-DOCR TO REF-KEY.
           MOVE 0 TO REF-X
           MOVE "DN" TO L7F0
           READ REFPHY INVALID
             MOVE SPACE TO L7F0
             MOVE SPACE TO REFPHY01
           END-READ.
           MOVE REF-NAME TO L7F1
           MOVE REF-NPI TO L7F2
           MOVE REF-CDNUM TO PROV-KEY
           READ PROVCAID INVALID
           MOVE REF-CDNUM TO L7F2LEG
           NOT INVALID
           MOVE PROV-TAX TO L7F2LEG
           END-READ.

           PERFORM A3.
           MOVE 0 TO CNTR LCNTR LAB-TOT LAB-TOTZ DGX.
           MOVE SPACE TO LINE-8
           GO TO P3.
       P2. 
           READ FILEIN 
             AT END 
               PERFORM A7 
               PERFORM A5 
               PERFORM A6
               GO TO P10.

           IF FI-PS NOT = SORFILE01 
             GO TO P2.
      
      *     IF NOT (FI-PC = 004 OR 064) GO TO P2.

           MOVE "A" TO FI-ASSIGN
           MOVE FI-KEY TO CHARCUR-KEY.
      
           READ CHARCUR INVALID DISPLAY "NO KEY" GO TO P2.
      
           IF (FI-ASSIGN NOT = CC-NEIC-ASSIGN)
             OR (CC-PATID NOT = HOLD-PATID)
             OR (CC-DATE-T NOT = HOLD-DATE-T)
             PERFORM A7 
             PERFORM A5 
             PERFORM A6
             MOVE SPACE TO LINE-00 LINE-0 LINE-1 LINE-2 LINE-20
               LINE-2 LINE-3 LINE-4 LINE-41 LINE-42 LINE-43 LINE-44
               LINE-45 LINE-61 LINE-7LEG LINE-7 LINE-8 LINE-9  
               L13-PLNAME L14-PLSTREET L15-PLCITY L15-PLSTATE L15-PLZIP 
               LINE-81 LINE-82 LINE-83 LINE-10LEG
             GO TO P1-1.
             
           IF CNTR > 5 PERFORM A7 PERFORM A5 PERFORM A6 PERFORM A3
           MOVE 0 TO FLAG SNUM6 CLAIM-TOT DGX.
       P3.
           MOVE SPACE TO L10F7TAB01
           ADD 1 TO CNTR.
           MOVE 0 TO DIAGCNTR
           MOVE CC-DIAG TO ALF-7
           PERFORM DIAG-LISTING THRU DIAG-LISTING-EXIT.
           MOVE CC-DX2 TO ALF-7
           PERFORM DIAG-LISTING THRU DIAG-LISTING-EXIT.
           MOVE CC-DX3 TO ALF-7
           PERFORM DIAG-LISTING THRU DIAG-LISTING-EXIT.
           MOVE CC-DX4 TO ALF-7
           PERFORM DIAG-LISTING THRU DIAG-LISTING-EXIT.
           MOVE L10F7TAB01 TO L10F10(CNTR)
           MOVE CC-DOCR TO REF-KEY.
           MOVE 0 TO REF-X
           MOVE "DN" TO L7F0
           READ REFPHY INVALID
            MOVE SPACE TO L7F0
            MOVE SPACE TO REFPHY01
           END-READ.
           MOVE REF-NAME TO L7F1
           MOVE REF-CDNUM TO L7F2
           MOVE CC-WORK TO L10F12(CNTR).
           MOVE CC-KEY8 TO L11F4-1.
           MOVE CC-PROC TO PROC-KEY
           READ PROCFILE INVALID MOVE SPACE TO PROC-TITLE.
           MOVE CC-PROC1 TO L10F6(CNTR)
           MOVE CC-PROC2 TO L10F7(CNTR)
           MOVE CC-DATE-T TO TEST-DATE
           MOVE S-MM TO L10F1(CNTR) L10F1S(CNTR)
           MOVE S-DD TO L10F2(CNTR) L10F2S(CNTR)
           MOVE S-YY TO L10F3(CNTR) L10F3S(CNTR)
           MOVE CC-MOD2 TO L10F8(CNTR)
           MOVE CC-MOD3 TO L10F9(CNTR)
      *     IF L10F7(CNTR) = "25" OR "57" OR "59" OR "79" 
      *     MOVE SPACE TO L10F7(CNTR).
      *     IF L10F8(CNTR) = "25" OR "57" OR "59" OR "79" 
      *     MOVE SPACE TO L10F8(CNTR).
      *     IF L10F9(CNTR) = "25" OR "57" OR "59" OR "79" 
      *     MOVE SPACE TO L10F9(CNTR).
           IF (L10F7(CNTR) = SPACE)
           AND (L10F8(CNTR) NOT = SPACE)
           MOVE L10F8(CNTR) TO L10F7(CNTR)
           MOVE SPACE TO L10F8(CNTR).
           IF (L10F8(CNTR) = SPACE)
           AND (L10F9(CNTR) NOT = SPACE)
           MOVE L10F9(CNTR) TO L10F8(CNTR)
           MOVE SPACE TO L10F9(CNTR).
           IF (CC-PROC2 = "BI" )
           MOVE "RT" TO L10F7(CNTR)
           MOVE "LT" TO L10F8(CNTR).
           PERFORM DF-SEARCH.
           IF CC-PL = "1" MOVE "11" TO L10F4(CNTR).
           IF CC-PL = "2" MOVE "12" TO L10F4(CNTR).
           IF CC-PL = "3" MOVE "21" TO L10F4(CNTR).
           IF CC-PL = "4" MOVE "31" TO L10F4(CNTR).
           IF CC-PL = "5" MOVE "22" TO L10F4(CNTR).
           IF CC-PL = "6" MOVE "81" TO L10F4(CNTR).
           IF CC-PL = "7" MOVE "61" TO L10F4(CNTR).
           IF CC-PL = "8" MOVE "99" TO L10F4(CNTR).
           IF CC-PL = "E" MOVE "23" TO L10F4(CNTR) GO TO PLPL1.
           IF CC-PL = "Q" MOVE "13" TO L10F4(CNTR) GO TO PLPL1.
           IF CC-PL = "D" MOVE "33" TO L10F4(CNTR) GO TO PLPL1.
           IF CC-PL = "S" MOVE "03" TO L10F4(CNTR) GO TO PLPL1.
           IF (CC-PL = "T") AND (CC-PAYCODE = "004")
               MOVE "99" TO L10F4(CNTR) GO TO PLPL1
           ELSE
               MOVE "02" TO L10F4(CNTR) GO TO PLPL1.
           IF CC-PL = "Z" MOVE "02" TO L10F4(CNTR) GO TO PLPL1.
           IF CC-PROC1 > "99220" AND < "99224" MOVE "21" TO L10F4(CNTR).
           IF CC-PROC1 > "99230" AND < "99234" MOVE "21" TO L10F4(CNTR).
           IF CC-PROC1 = "99238" MOVE "21" TO L10F4(CNTR).
           IF CC-PROC1 > "99250" AND < "99256" MOVE "21" TO L10F4(CNTR).
           IF CC-PROC1 > "99260" AND < "99264" MOVE "21" TO L10F4(CNTR).
           IF CC-PROC1 > "99280" AND < "99289" MOVE "23" TO L10F4(CNTR).
           IF CC-PROC1 > "99300" AND < "99304" MOVE "31" TO L10F4(CNTR).
           IF CC-PROC1 > "99310" AND < "99316" MOVE "31" TO L10F4(CNTR).
           IF CC-PROC1 > "99320" AND < "99325" MOVE "33" TO L10F4(CNTR).
           IF CC-PROC1 > "99330" AND < "99335" MOVE "33" TO L10F4(CNTR).
           IF CC-PL = "7" MOVE "61" TO L10F4(CNTR).
       PLPL1.
           MOVE CC-DATE-T TO AGE-DATE1
           MOVE G-DOB TO AGE-DATE2
           PERFORM AGE-OF-PAT THRU AOP-EXIT
           IF (AGE-PAT < 21)
           AND ((CC-PROC > "99380  " AND < "99386  ")
           OR (CC-PROC > "99390  " AND < "99396  ")
           OR (CC-PROC = "W9020  "))
           MOVE 1 TO EPSDTFLAG
           MOVE "EP" TO L10F8(CNTR)
           MOVE SPACE TO L10F9(CNTR)
      *     PERFORM RA-1 
           ELSE MOVE 0 TO EPSDTFLAG.
           MOVE 0 TO FAMPLFLAG

           IF ((CC-DATE-T < "20151001")
           AND  (CC-DIAG > "V25  " AND < "V2700"))
           OR ((CC-DATE-T > "20150930")
           AND (CC-DIAG > "Z2999  " AND < "Z3200  "))

           OR (CC-PROC > "58599ZZ" AND < "58620  ")
           OR (CC-PROC = "90699ZM" OR "99070ZM" OR "90040ZM")
           OR (CC-PROC = "58982  " OR "58983  " OR "58984  ")
           MOVE 1 TO FAMPLFLAG.
           IF EPSDTFLAG = 1 AND FAMPLFLAG = 1 MOVE "1" TO L10ESP(CNTR).
           IF EPSDTFLAG = 0 AND FAMPLFLAG = 0 MOVE "2" TO L10ESP(CNTR).
           IF EPSDTFLAG = 1 AND FAMPLFLAG = 0 MOVE "3" TO L10ESP(CNTR).
           IF EPSDTFLAG = 0 AND FAMPLFLAG = 1 MOVE "4" TO L10ESP(CNTR).
           IF CC-PL = "6" ADD CC-AMOUNT TO LAB-TOT.
           MOVE CC-AMOUNT TO L10F11(CNTR)
           ADD CC-AMOUNT TO SNUM6
           PERFORM DOC-1 THRU DOC-1-EXIT
           MOVE CC-CLAIM TO CLMTAB(CNTR)
           MOVE SPACE TO
            F101(CNTR) F102(CNTR) F103(CNTR) L10F5(CNTR)
           F105(CNTR) F106(CNTR) F107(CNTR) F108(CNTR) F109(CNTR)
           F1010(CNTR) F1011(CNTR) F1012(CNTR) F1013(CNTR) F1014(CNTR)
           F1015(CNTR) F1016(CNTR).
           IF CC-REC-STAT = "0" MOVE "2" TO CC-REC-STAT.
           IF CC-REC-STAT = "1" MOVE "3" TO CC-REC-STAT.
           IF CC-PAPER = "P" OR "E" OR " "
           MOVE "A" TO CC-PAPER.
           MOVE DATE-X TO CC-DATE-A.
           REWRITE CHARCUR01.
           GO TO P2.
       DOC-1.
           MOVE CC-PAYCODE TO DOC-INS
           MOVE CC-DOCP TO DOC-NUM
           READ DOCFILE
            INVALID
             MOVE "000" TO DOC-INS
             MOVE CC-DOCP TO DOC-NUM
             READ DOCFILE
             END-READ
            NOT INVALID CONTINUE.
           MOVE DOC-GROUPNAME TO L13F1
           MOVE SPACE TO L10-QUAL(CNTR) L10F13-LEGNUM(CNTR)
                         L10F13(CNTR)
           MOVE DOC-TAXONOMY TO L10F13-LEGNUM(CNTR)
           MOVE "ZZ" TO L10-QUAL(CNTR)
           MOVE DOC-NPI TO L10F13(CNTR)
           MOVE DOC-NPIGROUP TO L16GRPNPI
           MOVE DOC-FEDID TO L11F1
           MOVE DOC-NAME TO L14F0.
           MOVE CC-KEY8 TO AUTH-KEY8
           MOVE CC-CLAIM TO AUTH-KEY6
           READ AUTHFILE INVALID MOVE SPACE TO AUTH-NDC.
           MOVE AUTH-NDC TO L10F12-NDC(CNTR).
           IF AUTH-NDC NOT = SPACE PERFORM NDC-1 THRU NDC-EXIT.
       DOC-1-EXIT.
           EXIT.
       NDC-1.
           MOVE SPACE TO PROC-KEY
           MOVE CC-PROC1 TO PROC-KEY
           START PROCFILE KEY NOT < PROC-KEY INVALID GO TO NDC-EXIT.
       NDC-2.
           READ PROCFILE NEXT AT END GO TO NDC-EXIT.
           IF PROC-KEY1 NOT = CC-PROC1 GO TO NDC-EXIT.
           IF PROC-KEY2 (1:1) NOT = "N" GO TO NDC-2.
           IF PROC-TITLE(1:11) NOT = AUTH-NDC GO TO NDC-2.
           MOVE SPACE TO ALF1 L10-DOSAGE(CNTR) L10-QUAN(CNTR)
           UNSTRING PROC-TITLE DELIMITED BY SPACE INTO
           ALF1 L10-DOSAGE(CNTR) L10-QUAN(CNTR).
       NDC-EXIT.
           EXIT.
       A3.
           WRITE OUT01 FROM LINE-0 AFTER PAGE
           WRITE OUT01 FROM LINE-00 AFTER 3
           WRITE OUT01 FROM LINE-1 AFTER 2
           WRITE OUT01 FROM LINE-20
      *    MOVE SPACE TO L2F4
           WRITE OUT01 FROM LINE-2
           WRITE OUT01 FROM LINE-3 AFTER 2
      *    MOVE SPACE TO L4F6
           WRITE OUT01 FROM LINE-4 AFTER 2
           WRITE OUT01 FROM LINE-41 AFTER 2
           WRITE OUT01 FROM LINE-42 AFTER 2
           WRITE OUT01 FROM LINE-43 AFTER 2
           WRITE OUT01 FROM LINE-44 AFTER 2
           WRITE OUT01 FROM LINE-45 AFTER 2
           WRITE OUT01 FROM LINE-60 AFTER 3
           WRITE OUT01 FROM LINE-61 AFTER 3.
           MOVE SPACE TO LINE-7LEG
           WRITE OUT01 FROM LINE-7LEG AFTER 1.
           WRITE OUT01 FROM LINE-7.
       A7.
           PERFORM DIAG-LINE VARYING X FROM 1 BY 1 UNTIL X > DGX.
           PERFORM A9
           MOVE 0 TO LCNTR.
           PERFORM A8 VARYING X FROM 1 BY 1 UNTIL X > CNTR.
           MOVE 0 TO CNTR LAB-TOT LAB-TOTZ.

       A8.
           IF LCNTR > 5 MOVE SPACE TO OUT01 WRITE OUT01
           WRITE OUT01 FROM CONTLINE
           MOVE 0 TO LCNTR PERFORM A6 PERFORM A3 PERFORM A9.
           ADD 1 TO LCNTR.
           MOVE SPACE TO OUT01
           WRITE OUT01 AFTER 1
      *     WRITE OUT01 FROM LINE-1002LEG(X) AFTER 1.
           WRITE OUT01 FROM LINE-1002(X).
      *     IF NOT (FI-PC = 004 OR 064)
      *     PERFORM S4 THRU S4-EXIT.
       S4. MOVE G-GARNO TO PC-KEY8.
           MOVE "000" TO PC-KEY3.
           START PAYCUR KEY NOT < PAYCUR-KEY INVALID GO TO S4-EXIT.
       S7. READ PAYCUR NEXT AT END GO TO S4-EXIT.
           IF PC-KEY8 NOT = G-GARNO GO TO S4-EXIT.
           IF PC-CLAIM NOT = CLMTAB(X) GO TO S7.
           ADD PC-AMOUNT TO CLAIM-TOT.
           IF PC-DENIAL = "14" GO TO S7.
           IF (PC-PAYCODE = G-PRINS)
             AND (PC-DENIAL = SPACE OR "DD" OR "07" OR "08")
             COMPUTE PRIM-PAID = PRIM-PAID + (-1 * PC-AMOUNT)
           END-IF.
           MOVE PC-DATE-T TO TEST-DATE.
           MOVE S-MM TO L101F1
           MOVE S-DD TO L101F2
           MOVE S-CC TO L101F3CC
           MOVE S-YY TO L101F3
           MOVE PC-PAYCODE TO INS-KEY
           READ INSFILE INVALID MOVE "*NO NAME*" TO INS-NAME.
           MOVE INS-NAME TO L101S7F4.
           MOVE S-MM TO L101F1S7
           MOVE S-DD TO L101F2S7
           MOVE S-CC TO L101F3CCS7
           MOVE S-YY TO L101F3S7
           IF LCNTR > 5 MOVE SPACE TO OUT01 WRITE OUT01
            WRITE OUT01 FROM CONTLINE
            MOVE 0 TO LCNTR
            PERFORM A6 PERFORM A3 PERFORM A9.

      *     WRITE OUT01 FROM LINE101S7 AFTER 2
      *     ADD 1 TO LCNTR.
           GO TO S7.
       S4-EXIT. EXIT.
       A5.
           MOVE SPACE TO OUT01
           IF LCNTR > 5 WRITE OUT01
           ELSE WRITE CHNL-4 FROM CHNL-X.
           IF FI-ASSIGN = "A" MOVE " X " TO L11F5 MOVE SPACE
           TO L11F6 ELSE MOVE SPACE TO L11F5 MOVE " X " TO L11F6.
           MOVE SNUM6 TO L11F7.
           COMPUTE L11F8 = PRIM-PAID.
      *     COMPUTE L11F9 = SNUM6 + CLAIM-TOT.
           IF G-PRINS = "003"
           COMPUTE L11F8 = 0.
      *     MOVE L11F7 TO L11F9.
           WRITE OUT01 FROM LINE-11.
       A6.
      *    WRITE OUT01 FROM LINE-111
           MOVE SPACE TO OUT01
           WRITE OUT01 FROM LINE-12
           MOVE SPACES TO OUT01
           WRITE OUT01 FROM LINE-13
           MOVE SPACES TO OUT01
           WRITE OUT01 FROM LINE-14
           MOVE SPACES TO OUT01
           WRITE OUT01 FROM LINE-15
           MOVE SPACES TO OUT01
           WRITE OUT01 FROM LINE-16.
           ADD 1 TO NUM-CLAIM.
       A9.
           IF LAB-TOT = 0 MOVE SPACE TO L8F2 MOVE "X" TO L8F3
           ELSE MOVE "X" TO L8F2 MOVE LAB-TOT TO LAB-TOTZ
           MOVE LAB-TOTZ TO L8F4.
           MOVE SPACE TO OUT01.
           WRITE OUT01 FROM LINE-8 AFTER 2.
           MOVE SPACE TO OUT01

           if hold-date-t > "20150930" 
            move 
            "                                          0"
            to out01
            else
            move
            "                                          9"
            to out01
           end-if
           WRITE OUT01
           WRITE OUT01 FROM LINE-81
           WRITE OUT01 FROM LINE-82
           WRITE OUT01 FROM LINE-83.

           MOVE SPACE TO OUT01
           WRITE OUT01 AFTER 2.

       DIAG-LISTING.
           MOVE 0 TO FLAG
           IF ALF-7 = "0000000" GO TO DIAG-LISTING-EXIT.
           PERFORM DIAG-DUP VARYING Y FROM 1 BY 1 UNTIL Y > DGX.
           IF FLAG = 1 OR DGX = 12 GO TO DIAG-LISTING-EXIT.
           MOVE ALF-7   TO DIAG-KEY
           READ DIAGFILE INVALID GO TO DIAG-LISTING-EXIT.
           ADD 1 TO DGX
           IF HOLD-DATE-T < "20151001"
              MOVE DIAG-MEDB TO DIAG-TAB(DGX)
            ELSE
              MOVE DIAG-KEY TO DIAG-TAB(DGX)
           END-IF
           ADD 1 TO DIAGCNTR
           MOVE LETTERTAB(DGX) TO L10F7TAB(DIAGCNTR)
           MOVE ALF-7 TO DIAG-CODE(DGX).
       DIAG-LISTING-EXIT. EXIT.
       DIAG-DUP.
           IF ALF-7 = DIAG-CODE(Y)
            MOVE 1 TO FLAG
            ADD 1 TO DIAGCNTR
            MOVE LETTERTAB(Y) TO L10F7TAB(DIAGCNTR)
            MOVE DGX TO Y
           END-IF.
       DIAG-LINE.
           IF X = 1 MOVE DIAG-TAB(X) TO L81F1.
           IF X = 2 MOVE DIAG-TAB(X) TO L81F2.
           IF X = 3 MOVE DIAG-TAB(X) TO L81F3.
           IF X = 4 MOVE DIAG-TAB(X) TO L81F4.

           IF X = 5 MOVE DIAG-TAB(X) TO L82F1.
           IF X = 6 MOVE DIAG-TAB(X) TO L82F2.
           IF X = 7 MOVE DIAG-TAB(X) TO L82F3.
           IF X = 8 MOVE DIAG-TAB(X) TO L82F4.

           IF X =  9 MOVE DIAG-TAB(X) TO L83F1.
           IF X = 10 MOVE DIAG-TAB(X) TO L83F2.
           IF X = 11 MOVE DIAG-TAB(X) TO L83F3.
           IF X = 12 MOVE DIAG-TAB(X) TO L83F4.

       T5. IF TABA24(C) NOT = " "
           ADD 1 TO C
           MOVE "@" TO TABA24(C)
           MOVE 1 TO C.
       A1.  MOVE CC-PATID TO P-PATNO.
           READ PATFILE INVALID MOVE 1 TO FLAG DISPLAY "NO PAT"
           GO TO A1-EXIT.
           MOVE P-RELATE TO PAT-RELATE
           MOVE P-DOB TO TEST-DATE
           MOVE S-MM TO L1F2
           MOVE S-DD TO L1F3
           MOVE S-CC TO L1F4CC
           MOVE S-YY TO L1F4
           MOVE P-PATNAME TO L1F1
           INSPECT L1F1 REPLACING ALL ";" BY ","
           IF P-SEX = "M" MOVE "X  " TO L1F5 MOVE SPACE TO
           L1F6 ELSE MOVE "X  " TO L1F6 MOVE SPACE TO L1F5.
       A1-EXIT. EXIT.
       A2. MOVE G-DOB TO TEST-DATE
           MOVE G-RELATE TO PAT-RELATE
           MOVE S-MM TO L1F2
           MOVE S-DD TO L1F3
           MOVE S-CC TO L1F4CC
           MOVE S-YY TO L1F4
           MOVE G-GARNAME TO L1F1
           INSPECT L1F1 REPLACING ALL ";" BY ",".
           IF G-SEX = "M" MOVE "X  " TO L1F5 MOVE SPACE TO
           L1F6 ELSE MOVE "X  " TO L1F6 MOVE SPACE TO L1F5.
       A2-EXIT. EXIT.
       DF-SEARCH. MOVE CC-PLACE TO CC-PL.
           PERFORM DF-SEARCH2 THRU DF-SEARCH2-EXIT VARYING Y
           FROM 1 BY 1 UNTIL Y > PLINDX.
       DF-SEARCH2. IF CC-PLACE NOT = PL-TAB(Y) GO TO DF-SEARCH2-EXIT.
           MOVE PL-NUM(Y) TO CC-PL
           MOVE PL-NAME(Y) TO L13-PLNAME
           MOVE PL-STREET(Y) TO L14-PLSTREET
           MOVE PL-CITY(Y) TO L15-PLCITY
           MOVE PL-STATE(Y) TO L15-PLSTATE
           MOVE PL-ZIP(Y) TO L15-PLZIP
           MOVE PL-NPI(Y) TO L16-PLNPI
           MOVE PLINDX TO Y.

       DF-SEARCH2-EXIT. EXIT.
       BLANK-1. MOVE SPACE TO F101(X) F102(X) F103(X) L10F5(X)
           F105(X) F106(X) F107(X) F108(X) F109(X) F1010(X)
           F1011(X) F1012(X) F1013(X) F1014(X) F1015(X) F1016(X).
       GAPLINE0.
           MOVE G-PR-GROUP TO GAPKEY
           READ GAPFILE INVALID MOVE SPACE TO GAP-NAME
           MOVE "MEDIGAP" TO GAP-NAME.
           MOVE CC-PAYCODE TO L0F1
           MOVE GAP-NAME TO L0F2
           MOVE GAP-ADDR TO L0F3
           MOVE GAP-CITY TO L0F4
           MOVE GAP-STATE TO L0F5
           MOVE GAP-ZIP TO L0F6.

       GAPLINE0-EXIT.
           EXIT.

       WORKLINE.
           MOVE CC-PAYCODE TO L0F1
           MOVE MPLR-NAME TO L0F2
           MOVE MPLR-STREET TO L0F3
           MOVE MPLR-CITY TO L0F4
           MOVE MPLR-STATE TO L0F5
           MOVE MPLR-ZIP TO L0F6.
       WORKLINE-EXIT. EXIT.    
       PRI-FILL.
           MOVE G-PRIPOL TO L00F8
           MOVE G-PR-GROUP TO L41F2
           MOVE G-PRNAME TO L1F7
           MOVE SPACE TO L43F8
           MOVE SPACE TO L44F4
           MOVE G-PRINS TO INS-KEY
           READ INSFILE
           MOVE INS-NAME TO L44F4.
           IF G-PR-RELATE NUMERIC
           MOVE " X " TO L42F8 ELSE MOVE " X " TO L42F9.
       SEC-FILL.
           MOVE G-SECPOL TO L00F8
           MOVE G-SE-GROUP TO L41F2
           MOVE G-SENAME TO L1F7
           MOVE SPACE TO L43F8
           MOVE SPACE TO L44F4
           MOVE G-SEINS TO INS-KEY
           READ INSFILE
           MOVE INS-NAME TO L44F4.
           IF G-SE-RELATE NUMERIC
           MOVE " X " TO L42F8 ELSE MOVE " X " TO L42F9.
       TRI-FILL.
           MOVE MPLR-TRIPOL TO L00F8
           MOVE MPLR-TR-GROUP TO L41F2
           MOVE MPLR-TR-NAME TO L1F7
           MOVE SPACE TO L43F8
           MOVE SPACE TO L44F4
           MOVE G-TRINS TO INS-KEY
           READ INSFILE
           MOVE INS-NAME TO L44F4.
           IF MPLR-TR-RELATE NUMERIC
           MOVE " X " TO L42F8 ELSE MOVE " X " TO L42F9.
       PRI-INS.
           MOVE G-PRIPOL TO L42F1
           MOVE G-PR-GROUP TO L42F2
           MOVE G-PRNAME TO L41F1
           IF G-PR-RELATE NUMERIC
           MOVE " X " TO L43F4 ELSE MOVE " X " TO L43F5.
           MOVE SPACE TO L44F1
           MOVE SPACE TO L45F1
           MOVE G-PRINS TO INS-KEY
           READ INSFILE INVALID MOVE SPACE TO INS-NAME INS-CAID.
           MOVE INS-NAME TO L45F1.
           MOVE INS-CAID TO L45INS
           MOVE " X " TO L45F2
           MOVE SPACE TO L45F3
           IF INS-KEY = "001" OR "012" MOVE " X " TO L45F3
           MOVE SPACE TO L45F1 L45F2 L43F4 L43F5 L45INS.
           IF G-SEINS = "062" PERFORM GAPLINE THRU GAPLINE-EXIT.
       SEC-INS.
           MOVE G-SECPOL TO L42F1
           MOVE G-SE-GROUP TO L42F2
           MOVE G-SENAME TO L41F1
           IF G-SE-RELATE NUMERIC
           MOVE " X " TO L43F4 ELSE MOVE " X " TO L43F5.
           MOVE SPACE TO L44F1
           MOVE SPACE TO L45F1
           MOVE G-SEINS TO INS-KEY
           READ INSFILE INVALID MOVE SPACE TO INS-NAME INS-CAID.
           MOVE INS-NAME TO L45F1.
           MOVE INS-CAID TO L45INS
           MOVE " X " TO L45F2
           MOVE SPACE TO L45F3
           IF INS-KEY = "001" OR "012" MOVE " X " TO L45F3
           MOVE SPACE TO L45F1 L45F2 L43F4 L43F5 L45INS.
           IF G-SEINS = "062" PERFORM GAPLINE THRU GAPLINE-EXIT.
       TRI-INS.
           MOVE MPLR-TRIPOL TO L42F1
           MOVE MPLR-TR-GROUP TO L42F2
           MOVE MPLR-TR-NAME TO L41F1
           IF MPLR-TR-RELATE NUMERIC
           MOVE " X " TO L43F4 ELSE MOVE " X " TO L43F5.
           MOVE SPACE TO L44F1
           MOVE SPACE TO L45F1
           MOVE G-TRINS TO INS-KEY
           READ INSFILE INVALID MOVE SPACE TO INS-NAME INS-CAID.
           MOVE INS-NAME TO L45F1.
           MOVE INS-CAID TO L45INS
           MOVE " X " TO L45F2
           MOVE SPACE TO L45F3
           IF INS-KEY = "001" OR "012" MOVE " X " TO L45F3
           MOVE SPACE TO L45F1 L45F2 L43F4 L43F5 L45INS.
       GAPLINE.
           MOVE "MEDIGAP INS.        EMC #   " TO L44F1
           MOVE G-PR-GROUP TO GAPKEY
           READ GAPFILE INVALID MOVE SPACE TO
           GAP-NAME.
           MOVE GAP-NAME TO L45F1
           MOVE G-PR-GROUP TO ALF-7
           STRING "##" ALF-72 DELIMITED BY "!!" INTO L45F1-A.
       GAPLINE-EXIT. EXIT.
       RA-1. IF CC-RESULT = "2" MOVE "AB" TO L10F8(CNTR)
           ELSE MOVE "NM" TO L10F8(CNTR).
           MOVE "UC" TO L10F9(CNTR)
           IF CC-ACT = "1" MOVE "AP" TO L10F9(CNTR).
           IF CC-ACT = "2" MOVE "CI" TO L10F9(CNTR).
           IF CC-ACT = "3" MOVE "NO" TO L10F9(CNTR).
           IF CC-ACT = "4" MOVE "UC" TO L10F9(CNTR).
           IF CC-ACT = "5" MOVE "RT" TO L10F9(CNTR).
           IF CC-ACT = "6" MOVE "NA" TO L10F9(CNTR).
           IF CC-ACT = "7" MOVE "PR" TO L10F9(CNTR).
       AGE-OF-PAT.
           IF (CC-DATE-T NOT NUMERIC) OR (G-DOB NOT NUMERIC)
           MOVE 0 TO AGE-PAT GO TO AOP-EXIT.
           COMPUTE NUM3 = AGE1YY - AGE2YY
           IF NUM3 < 21 MOVE 0 TO AGE-PAT GO TO AOP-EXIT.
           IF NUM3 > 21 MOVE 99 TO AGE-PAT GO TO AOP-EXIT.
           IF AGE1MM < AGE2MM MOVE 0 TO AGE-PAT GO TO AOP-EXIT.
           IF AGE1MM > AGE2MM MOVE 99 TO AGE-PAT GO TO AOP-EXIT.
           IF AGE1DD < AGE2DD MOVE 0 TO AGE-PAT GO TO AOP-EXIT.
           MOVE 99 TO AGE-PAT.
       AOP-EXIT. EXIT.
       P10. CLOSE FILE-OUT CHARCUR.
           STOP RUN.

