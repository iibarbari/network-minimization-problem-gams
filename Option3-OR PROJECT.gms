Model option3

sets

i facility /1,5,7/
j region /1*7/

parameters

e(i) capacity for facility i) /1 225, 5 600, 7 110/
f(j) demand at region j /1 100, 2 200,3 120,4 45, 5 250, 6 80, 7 75/
fc(i)  fixed cost of facility i  /1 1000, 5 1800, 7 750/;

table c(i,j) shipping costs
         1       2        3       4      5       6       7
1        0       7        4       5      12      7       14
5        12      12       16      15     0       14      6
7        14      11       11      9      6       8       0 ;
 variables
x(i,j) shipment quantities
z cost in dollars ;

positive variable x;
free variable z;

equations

    cost        define objective function
    supply(i)   observe supply limit at facility i
    demand(j)   satisfy demand at region j ;

cost..          z =e= sum((i,j), c(i,j)*x(i,j))+fc('1')+fc('5')+fc('7');
supply(i)..     sum(j, x(i,j))  =l=  e(i);
demand(j)..     sum(i, x(i,j))  =g=  f(j);


model  option1 /all/;
solve option1 using lp minimizing z ;

