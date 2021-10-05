param site;
param market;
param fixed_cost{i in 1..site};
param demand{j in 1..market};
param shipping_cost{i in 1..site, j in 1..market};
param dsum;

var open{i in 1..site} binary;
var units{i in 1..site, j in 1..market} >=0;


minimize cost:
sum{i in 1..site}fixed_cost[i]*open[i]
  + sum{i in 1..site, j in 1..market} units[i,j]*shipping_cost[i,j];
 
subject to supply_cap{i in 1..site}:
(sum{j in 1..market} units[i,j]) - dsum*open[i] <= 0;

subject to satisfy_demands{j in 1..market}:
sum{i in 1..site} units[i,j] = demand[j];

