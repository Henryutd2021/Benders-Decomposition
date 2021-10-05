param site;
param market;
param fixed_cost{i in 1..site};
param demand{j in 1..market};
param shipping_cost{i in 1..site, j in 1..market};
param dsum;

param open_from_master{i in 1..site};

#Note that here the ONLY decision variables are the x's since open 
var units{i in 1..site, j in 1..market} >=0;


minimize cost:
sum{i in 1..site}fixed_cost[i]*open_from_master[i]
  + sum{i in 1..site, j in 1..market} units[i,j]*shipping_cost[i,j];
 
subject to supply_cap{i in 1..site}:
(sum{j in 1..market} units[i,j]) <= dsum*open_from_master[i] ;

subject to satisfy_demands{j in 1..market}:
sum{i in 1..site} units[i,j] = demand[j];

