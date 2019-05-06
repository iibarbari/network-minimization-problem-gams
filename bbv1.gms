Model project;

Sets
f facility /1*7/
r region /1*7/;

Parameter
c(f) capacity for facility /1 225, 2 500, 3 300,4 900, 5 600, 6 130, 7 110/
d(r) demand for region /1 100, 2 200,3 120,4 45, 5 250, 6 80, 7 75/
fixedCost(f) fixed cost for facility /1 1000, 2 1500,3 1200,4 2500, 5 1800, 6 800, 7 750/;


Table K(f,r) unit shipping costs between all regions
        1       2        3       4      5       6       7
1       0       7        4       5      12      7       14
2       7       0        11      12     12      14      11
3       4       11       0       7      16      3       11
4       5       12       7       0      15      5       9
5       12      12       16      15     0       14      6
6       7       14       3       5      14      0       8
7       14      11       11      9      6       8       0 ;

Scalar
n number of facilities open /3/
M a big number /10000000000/;

Variables
x(f,r) number of shipment from facility to region
z total annual cost
y(f) if facility is open one otherwise zero

Positive Variable x; z
Binary Variable y;

Equations

totalCost       define objective function shipment costs plue fixed costs
capacity(f)     capacity of facility
demand(r)       demand of region
open            number of open facilities
constraint(f)   if a facility is open one if not open its quantities is zero;

totalCost..     z =e= (sum((f,r), K(f,r)*x(f,r)) + sum(f, fixedCost(f)*y(f)) ); 
capacity(f)..   sum(r, x(f,r)) =l= c(f) ;
demand(r)..     sum(f, x(f,r)) =g= d(r) ;
open..          sum(f,y(f)) =e= n ;
constraint(f).. sum(r, x(f,r)) =L= y(f)*M ;

Model project /all/ ;
Solve project using mip minimizing z; 
Display x.l,y.l;