*---------------------------------------------------------------------------*
* PROGRAMMER:    Kayla Dyer                                                 *
* PROGRAM:       KaylaExam2.sas                                             *
* DATE:          04/07/2026                                                 *
* PURPOSE:       Complete Exam 2                                            *                                                          
* DATA:          SpeedDatingOriginal.csv                                    *                                
*---------------------------------------------------------------------------*;
libname Exam2 'O:\STA 512\Data';
proc import datafile="O:\STA 512\Data\Speed Dating Original.csv"
    out=Exam2.speeddating
    dbms=csv
    replace;
    guessingrows=max;
run;
proc contents data=Exam2.speeddating; run;
proc print data=Exam2.speeddating(obs=20); run;
proc means data=Exam2.speeddating n nmiss;
run;
proc reg data=Exam2.speeddating;
model LikeM = AttractiveF SincereF IntelligentF FunF AmbitiousF SharedInterestsF;
run;
proc reg data=Exam2.speeddating;
model LikeF = AttractiveM SincereM IntelligentM FunM AmbitiousM SharedInterestsM;
run;
data Exam2.speeddating_new;
set Exam2.speeddating;

if RaceM = RaceF then SameRace = "Yes";
else SameRace = "No";

run;
proc freq data=Exam2.speeddating_new;
tables SameRace;
run;
proc means data=Exam2.speeddating_new mean;
class SameRace;
var LikeM LikeF;
run;
proc ttest data=Exam2.speeddating_new;
class SameRace;
var LikeM LikeF;
run;
data Exam2.speeddating_age;
set Exam2.speeddating;

if abs(AgeM - AgeF) <= 2 then CloseAge = "Yes";
else CloseAge = "No";

run;
proc freq data=Exam2.speeddating_age;
tables CloseAge;
run;
proc means data=Exam2.speeddating_age mean;
class CloseAge;
var LikeM LikeF;
run;
proc ttest data=Exam2.speeddating_age;
class CloseAge;
var LikeM LikeF;
run;
