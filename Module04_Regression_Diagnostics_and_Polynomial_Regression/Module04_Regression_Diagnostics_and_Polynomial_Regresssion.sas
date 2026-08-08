*---------------------------------------------------------------------------*
* PROGRAMMER:    Kayla Dyer                                                 *
* PROGRAM:       KaylaHomework4.sas                                         *
* DATE:          03/23/2026                                                 *
* PURPOSE:       Complete Homework 4                                        *                                                          
* DATA:          bears.sas7bdat                                             *                                
*---------------------------------------------------------------------------*;
libname HW4 'O:\STA 512\Data';
proc contents data=HW4.bear;
run;
proc freq data=HW4.bear;
    tables sex;
run;
data bears2;
    set HW4.bear;
    if sex='1' then sex_num=0;
    else if sex='2' then sex_num=1;
    inter=length*sex_num;
run;
data bears2;
    set bears2(drop=sex);
    rename sex_num=sex;
run;
proc reg data=bears2;
    model weight=length sex inter;
run;
proc print data=bears2;
run;
