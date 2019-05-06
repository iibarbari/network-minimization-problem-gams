Model option1

sets

i facility /2,3,6/
j region /1*7/

parameters

e(i) capacity for facility i /2 500, 3 300,6 130/
f(j) demand at region j  /1 100, 2 200,3 120,4 45, 5 250, 6 81, 7 75/
fc(i)  fixed cost of facility i  /2 1500, 3 1200, 6 800/;

table c(i,j) shipping costs
         1       2        3       4      5       6       7
2        7       0        11      12     12      14      11
3        4       11       0       7      16      3       11
6        7       14       3       5      14      0       8 ;
 variables
x(i,j) shipment quantities
z cost in dollars ;

positive variable x;
free variable z;

equations

    cost        define objective function
    supply(i)   observe supply limit at facility i
    demand(j)   satisfy demand at region j ;

cost..          z =e= sum((i,j), c(i,j)*x(i,j))+fc('2')+fc('3')+fc('6');
supply(i)..     sum(j, x(i,j))  =l=  e(i);
demand(j)..     sum(i, x(i,j))  =g=  f(j);


model  option1 /all/;
solve option1 using lp minimizing z ;

