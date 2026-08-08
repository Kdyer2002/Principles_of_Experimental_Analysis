*---------------------------------------------------------------------------*
* PROGRAMMER:    Kayla Dyer                                                 *
* PROGRAM:       KaylaHomework3.sas                                          *
* DATE:          02/17/2026                                                 *
* PURPOSE:       Complete Homework 3                                        *                                                          
* DATA:                                                                     *                                
*---------------------------------------------------------------------------*;
libname HW3 'O:\STA 512\Data';
proc contents data=HW3.schools;
run;
proc reg data=HW3.schools;
   model SAT_TOTAL = GMCASMth TwoYrPub TwoYrPri / ss1;
run;
quit;
