param site; 
param market; 
param fixed_cost{i in 1..site}; #lower case f  (f) in Rardin
param demand{j in 1..market}; # notated as d_j in rardin
param shipping_cost{i in 1..site, j in 1..market}; # notated as c sub ij in rardin 
param dsum; # notated as F in Rardin I have to check the sing of it 
param open_from_master{i in 1..site}; # it is the y super l that will be fed into this subproblem
param RHS_sup_cons{i in 1..site}; # it is zero but I wanted to put it anyway

var dual_supply_cap{i in 1..site} <= 0; # notated as v in Rardin
var dual_satisfy_demands{j in 1..market} ; # notated as w in Rardin


maximize value:
sum{i in 1..site} (dual_supply_cap[i] * (RHS_sup_cons[i] + dsum * open_from_master[i]) + fixed_cost[i] * open_from_master[i]) +
                  sum{j in 1..market} (dual_satisfy_demands[j] * demand[j]);
  
subject to shipping_cost_const{i in 1..site, j in 1..market}: dual_supply_cap[i]*1 + dual_satisfy_demands[j]*1 <= shipping_cost[i,j];
# Comment about the above duals constraints. There are as many constraints as primal decision variables
# In this small problem with 3 sites and 5 markets we have 15 shipping_cost_constraints and 15 primal variables 
# that indicate the number of units to ship from a site to a market. Thues this dual has 15 constraints
 

