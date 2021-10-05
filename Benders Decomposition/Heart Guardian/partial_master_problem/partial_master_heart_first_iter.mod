param site;
param market;
param P; # it is the number of extreme points (v,w)  generated up to this iteration l
param D; # it is the number of extreme directions (delta v, delta w) generated up to this iteration l
param fixed_cost{i in 1..site};
param demand{j in 1..market};
param shipping_cost{i in 1..site, j in 1..market};
param dsum; #check the sign of it
param RHS_sup_cons{i in 1..site}; # it is zero but I wanted to put it anyway

# in the next two lines the extreme points
param dual_supply_cap{i in 1..site, p in 1..P};
param dual_satisfy_demands{j in 1..market, p in 1..P};

#in the next two lines the extreme directions
param delta_dual_supply_cap{i in 1..site, d in 1..D};
param delta_dual_sat_demands{j in 1..market, d in 1..D};

var open_from_master{i in 1..site} binary;
var z;

minimize zvalue: z;

#The first constraint, which actually occupies two lines is in comments at the first iteration because only an extreme direction was generated
#subject to extremepoints{p in 1..P}: z >= sum{i in 1..site} (dual_supply_cap[i,p] * (RHS_sup_cons[i] + dsum * open_from_master[i]) + fixed_cost[i] * open_from_master[i]) +
 #                 sum{j in 1..market} (dual_satisfy_demands[j,p] * demand[j]);
 
subject to extremedir{d in 1..D} :
 0 >= sum{i in 1..site} ( delta_dual_supply_cap[i,d]*(RHS_sup_cons[i] + dsum * open_from_master[i]) ) + sum{j in 1..market} (delta_dual_sat_demands[j,d] * demand[j]) ;

