*---------------------------------------------------------------------------*
* PROGRAMMER:    Kayla Dyer                                                 *
* PROGRAM:       KaylaHomework5.sas                                         *
* DATE:          03/31/2026                                                 *
* PURPOSE:       Complete Homework 5                                        *                                                          
* DATA:          homework6.sas7bdat                                         *                                
*---------------------------------------------------------------------------*;
libname HW5 'O:\STA 512\Data';
proc contents data=HW5.homework6;
run;
proc print data=HW5.homework6(obs=10);
run;
proc reg data=HW5.homework6;
model density = height weight hip thigh forearm wrist;
plot rstudent.*p.;
output out=diag
    rstudent=jackknife_res
    cookd=cooksdistance
    h=leverage;
run;
proc univariate data=diag normal plot;
    var jackknife_res;
run;
data outliers;
set diag;

if (abs(jackknife_res) > 2) or
   (cooksdistance > 1) or
   (leverage > (2*(6+1)/252));

run;
proc print data=diag (obs=7);
    var cooksdistance leverage jackknife_res;
run;
proc reg data=HW5.homework6;
    model density = height weight hip thigh forearm wrist / vif collin;
run;
proc reg data=HW5.homework6;
model density = height weight forearm wrist / vif collin;
run;
quit;
proc reg data=HW5.ch05q15;
model BLOODTOL = PPM_TOLU;
output out=diag2 rstudent=jackknife_res p=pred 
       cookd=cooksdistance h=leverage;
run;
quit;
proc sgplot data=diag2;
scatter x=pred y=jackknife_res;
refline 0 / axis=y;
run;
proc univariate data=diag2 normal plot;
    var jackknife_res;
run;
