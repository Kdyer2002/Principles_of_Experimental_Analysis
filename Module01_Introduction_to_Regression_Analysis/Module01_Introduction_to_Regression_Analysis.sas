*---------------------------------------------------------------------------*
* PROGRAMMER:    Kayla Dyer                                                 *
* PROGRAM:       KaylaHomework1.sas                                          *
* DATE:          02/05/2026                                                 *
* PURPOSE:       Complete Homework 1                                        *                                                          
* DATA:                                                                     *                                
*---------------------------------------------------------------------------*;
libname HW1 'O:\STA 512\Data';
data sleep;
input ATST AGE;
datalines;
586.00 4.40
461.75 14.00
491.10 10.10
565.00 6.70
462.00 11.50
532.10 9.60
477.60 12.40
515.20 8.90
493.00 11.10
528.30 7.75
575.90 5.50
532.50 8.60
530.50 7.20
;
run;
proc gplot data=sleep;
plot ATST*AGE;
run;
proc reg data=sleep;
   model ATST = AGE;
run;
proc sgplot data=sleep;
   scatter x=AGE y=ATST;
   reg x=AGE y=ATST;
run;
proc means data=HW1.schools mean median min max;
var SALARY;
run;
proc sgplot data=HW1.schools;
vbox SALARY;
run;
proc sgplot data=hw1.schools;
scatter x=salary y=sat_total;
run;
proc corr data=hw1.schools;
var salary sat_total;
run;
proc reg data=hw1.schools;
model sat_total = salary;
output out=regout r=residual;
run;
quit;
proc print data=regout(obs=15);
var salary sat_total residual;
run;
proc print data=hw1.schools;
where salary = 45106;
var school salary sat_total;
run;




