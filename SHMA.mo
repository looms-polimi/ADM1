model SHMA
// Physical parameters
parameter Real V_tot(unit = "L") = 3.76 "Total volume of the vial test";
parameter Real V_liq(unit = "L") = 0.4 "Liquid volume of the test";
parameter Real V_gas(unit = "L") = V_tot - V_liq "Headspace volume of the test";
// Physical parameters end

// Physical and chemical parameters
constant Real R(unit = "L*bar/(K*mole)") = 0.08314462618 "Ideal gas constant";
parameter Real T_0(unit = "K") = 273.15 "Standard temperature";
parameter Real T_ref(unit = "K") = 273.15 + 25 "Reference temperature";
parameter Real T_op(unit = "K") = 273.15 + 37 "Operating temperature of the test";
parameter Real P_atm(unit = "bar") = 1.01325 "Atmospheric/standard pressure";
parameter Real VM(unit = "L/mole") = R * T_0 / P_atm "Molar volume at standard conditions";
parameter Real K_AB_co2(unit = "mole/(L*d)") = 1e8 "Inorganic carbon dissociation rate";
parameter Real K_AB_IN(unit = "mole/(L*d)") = 1e8 "Inorganic nitrogen dissociation rate";
parameter Real K_W(unit = "") = 10 ^ (-14) * exp(55900 / (R * 100) * (1 / T_ref - 1 / T_op)) "Water ionic product";
parameter Real K_a_co2(unit = "mole/L") = 10 ^ (-6.35) * exp(7646 / (R * 100) * (1 / T_ref - 1 / T_op)) "Inorganic carbon dissociation constant";
parameter Real K_a_IN(unit = "mole/L") = 10 ^ (-9.25) * exp(51965 / (R * 100) * (1 / T_ref - 1 / T_op)) "Inorganic nitrogen dissociation constant";
// Gas-liquid mass transfer parameters
parameter Real D_O2(unit = "cm/s") = 3.3 "Oxygen diffusivity constant @ T = 37 °C";
parameter Real D_H2(unit = "cm/s") = 6.31 "Hydrogen diffusivity constant @ T = 37 °C";
parameter Real D_CH4(unit = "cm/s") = 2 "Methane diffusivity constant @ T = 37 °C";
parameter Real D_CO2(unit = "cm/s") = 4 "Carbon dioxide diffusivity constant @ T = 37 °C";
parameter Real KH_co2(unit = "mole/L/bar") = 0.035 * exp(-19410 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's constant of carbon dioxide";
parameter Real KH_ch4(unit = "mole/L/bar") = 0.0014 * exp(-14240 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's constant of methane";
parameter Real KH_h2(unit = "mole/L/bar") = 7.8e-4 * exp(-4180 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's constan of hydrogen";
parameter Real p_gas_h2o(unit = "bar") = 0.0313 * exp(5290 * (1 / T_ref - 1 / T_op)) "Water vapour headspace pressure";
// Physical and chemical parameters end

// Stoichiometric parameters
parameter Real nC(unit = "mole/mole") = 5 "Number of carbon moles for one mole of biomass";
parameter Real nN(unit = "mole/mole") = 1 "Number of nitrogen moles for one mole of biomass";
parameter Real COD_bio(unit = "gCOD/mole") = 160 "COD content of one mole of biomass";
parameter Real C_bac(unit = "mole/gCOD") = nC / COD_bio "Carbon content of biomass";
parameter Real N_bac(unit = "mole/gCOD") = nN / COD_bio "Nitrogen content of biomass";
parameter Real Y_h2(unit = "gCOD/gCOD") = 0.04 "Hydrogenotrophic methanogens growth yield";
parameter Real C_ch4(unit = "mole/gCOD") = 1 / 64 "Carbon content in methane";
parameter Real i_COD_VSS(unit = "gCOD/gVSS") = 1.42 "COD/VSS ratio";
// Stoichiometric parameters end


// Biochemical parameters
parameter Real SHMA(unit = "mL/(gSSV*d)") = 5710 "Specific hydrogenotrophic methanogens activity";
parameter Real mu_max_h2(unit = "1/d") = SHMA * Y_h2 * 63 / (i_COD_VSS * VM * 1e3);
parameter Real km_h2(unit = "gCOD/(gCOD*d)") = mu_max_h2 / Y_h2 "Monod maximum specific uptake rate of hydrogenotrophic methanogens";
parameter Real k_dec(unit = "1/d") = 0.02 "First order decay rate of hydrogenotrophic methanogens";
parameter Real KS_h2(unit = "gCOD/L") = 5e-5 "Half-saturation constant of hydrogenotrophic methanogens on dissolved hydrogen";
// Biochemical parameters end

// Initial conditions
parameter Real p_gas_0(unit = "bar") = 1.6 "Headspace gas absolute pressure at time t = 0";
parameter Real x_co2_0(unit = "") = 0.2035 "Carbon dioxide volumetric content at time t = 0";
parameter Real x_h2_0(unit = "") = 1 - x_co2_0 "Hydrogen volumetric content time t = 0";
parameter Real p_gas_h2_0(unit = "bar") = (p_gas_0 - p_gas_h2o) * x_h2_0 "Hydrogen partial pressure at time t = 0";
parameter Real p_gas_co2_0(unit = "bar") = (p_gas_0 - p_gas_h2o) * x_co2_0 "Carbon dioxide partial pressure at time t = 0"; 
parameter Real p_gas_ch4_0(unit = "bar") = 0 "Methane partial pressure at time t = 0";
parameter Real S_gas_h2_0(unit = "mole/L") = p_gas_h2_0 / (R * T_op) "Hydrogen concentration in the headspace at time t = 0";
parameter Real S_gas_co2_0(unit = "mole/L") = p_gas_co2_0 / (R * T_op) "Carbon dioxide concentration in the headspace at time t = 0";
parameter Real S_gas_ch4_0(unit = "mole/L") = p_gas_ch4_0 / (R * T_op) "Methane concentration in the headspace at time t = 0";
parameter Real S_h2_0(unit = "gCOD/L") = p_gas_h2_0 * KH_h2 * 16 "Dissolved hydrogen concentration at time t = 0";
parameter Real S_ch4_0(unit = "gCOD/L") = p_gas_ch4_0 * KH_ch4 * 64 "Dissolved methane concentration at time t = 0";
parameter Real S_co2_0(unit = "mole/L") = p_gas_co2_0 * KH_co2;
parameter Real X_SSV_0(unit = "gSSV/L") = 1.12 "VSS concentration at time t = 0";
parameter Real X_h2_0(unit = "gCOD/L") = X_SSV_0 * i_COD_VSS "Hydrogenotrophic methanogens concentration at time t = 0";
parameter Real ppm_h2_0(unit = "mg/L") = S_h2_0 * 1e3 * 2 / 16 "Dissolved hydrogen concentration at time t = 0";
parameter Real ppm_ch4_0(unit = "mg/L") = S_ch4_0 * 1e3 * 16 / 64 "Dissolved methane concentration at time t = 0";
parameter Real ppm_co2_0(unit = "mg/L") = S_co2_0 * 1e3 * 44 "Dissolved carbon dioxide concentration at time t = 0";
parameter Real pH_0(unit = "") = 7.12 "pH at time t = 0";
parameter Real S_h_0(unit "mole/L") = 10^(-pH_0) "Hydrogen ion concentration at time t = 0";
parameter Real S_hco3_0(unit = "mole/L") = S_co2_0  * K_a_co2 / (K_a_co2 + S_h_0) "Bicarbonate ion concentration at time t = 0";
parameter Real S_IC_0(unit = "mole/L") = S_hco3_0 + S_co2_0 "Inorganic carbon concentration at time t = 0";
parameter Real NH4_0(unit = "mg/L") = 180 "Ammonium concentration at time t = 0";
parameter Real S_IN_0(unit = "mole/L") = NH4_0 / (14 * 1e3) "Ammonium ion concentration at time t = 0";
parameter Real S_nh4_0(unit = "mole/L") = S_IN_0 * S_h_0 / (S_h_0 + K_a_IN) "Ammonium ion concentration at time t = 0";
parameter Real S_nh3_0(unit = "mole/L") = S_IN_0 - S_nh4_0 "Free ammonia concentration at time t = 0";
parameter Real S_cat_0(unit = "mole/L") = 0.02 "Cation concentration at time t = 0";
parameter Real S_an_0(unit = "mole/L") = 0.02 "Anion concentration at time t = 0";
parameter Real theta_0(unit = "mole/L") = S_cat_0 + S_nh4_0 - S_hco3_0 - S_an_0 "theta at time t = 0";
// Initial conditions end


// State variables
Real X_h2(unit = "gCOD/L", fixed = true, start = X_h2_0) "Hydrogenotrophic methanogens concentration";
Real S_h2(unit = "gCOD/L", fixed = false, start = S_h2_0) "Dissolved hydrogen concentration at time t = 0";
Real S_ch4(unit = "gCOD/L", fixed = true, start = S_ch4_0) "Dissolved methane concentration at time t = 0";
Real S_co2(unit = "mole/L", fixed = true, start = S_co2_0) "Dissolved carbon dioxide concentration";
Real S_hco3(unit = "mole/L", fixed = true, start = S_hco3_0) "Bicarbonate ion concentration";
Real S_IC(unit = "mole/L", fixed = false, start = S_IC_0) "Inorganic carbon concentration";
Real S_nh4(unit = "mole/L", fixed = true, start = S_nh4_0) "Ammonium ion concentration";
Real S_nh3(unit = "mole/L", fixed = false, start = S_nh3_0) "Free ammonia concentration";
Real S_IN(unit = "mole/L", fixed = false, start = S_IN_0) "Inorganic nitrogen concentration";
Real S_cat(unit = "mole/L", fixed = true, start = S_cat_0) "Cations concentration";
Real S_an(unit = "mole/L", fixed = false, start = S_an_0) "Anions concentration";
Real S_h(unit = "mole/L", fixed = false, start = S_h_0) "Hydrogen ion concentration";
Real pH(unit = "", fixed = true, start = pH_0) "pH";
Real theta(unit = "mole/L", fixed = false, start = theta_0) "delta cat";
Real S_gas_h2(unit = "mole/L", fixed = false, start = S_gas_h2_0) "Hydrogen concentration in the headspace";
Real S_gas_ch4(unit = "mole/L", fixed = false, start = S_gas_ch4_0) "Methane concentration in the headspace";
Real S_gas_co2(unit = "mole/L", fixed = false, start = S_gas_co2_0) "Carbon dioxide concentration in the headspace";
Real p_gas(unit = "bar", fixed = true, start = p_gas_0) "Absolute pressure in the headspace";
Real p_gas_h2(unit = "bar", fixed = true, start = p_gas_h2_0) "Hydrogen partial pressure";
Real p_gas_ch4(unit = "bar", fixed = false, start = p_gas_ch4_0) "Methane partial pressure";
Real p_gas_co2(unit = "bar", fixed = true, start = p_gas_co2_0) "Carbon dioxide partial pressure";
Real x_h2(unit = "", min = 0, max = 1) "Hydrogen volumetric content in the headspace";
Real x_ch4(unit = "", min = 0, max = 1) "Methane volumetric content in the headspace";
Real x_co2(unit = "", min = 0, max = 1) "Carbon dioxide volumetric content in the headspace";
Real x_h2o(unit = "", min = 0, max = 1) "Water vapour volumetric content in the headspace";
// State variables end

// 
Real I_h2(unit = "") "Dissolved hydrogen Monod ratio";
Real r1(unit  = "gCOD/L/d") "Dissolved hydrogen consumption rate by hydrogenotrophic methanogens";
Real r2(unit = "gCOD/L/d") "Hydrogenotrophic methanogens first order decay rate";
Real rc1(unit = "mole/L/d") "Carbon consumption rate used for biomass growth";
Real rc2(unit = "mole/L/d") "Carbon consumption rate used for methane production";
Real rc3(unit = "mole/L/d") "Carbon release rate derived from biomass decay";
Real rn1(unit = "mole/L/d") "Nitrogen consumption rate used for biomass growth";
Real rn2(unit = "mole/L/d") "Nitrogen release rate derived from biomass decay";

// Acid-base dissociation rates
Real rAB_co2(unit = "mole/L/d") "Inorganic carbon dissociation rate";
Real rAB_IN(unit = "mole/L/d") "Inorganic nitrogen dissociation rate";
// Acid-base dissociation rates end 

// Gas-liquid mass transfer variables
parameter Real kLa_O2(unit = "d-1") = 1500 "Oxygen gas-liquid mass transfer coefficient";
Real kLa_H2(unit = "d-1") "Hydrogen gas-liquid mass transfer coefficient";
Real kLa_CH4(unit = "d-1") "Methane gas-liquid mass transfer coefficient";
Real kLa_CO2(unit = "d-1") "Carbon dioxide gas-liquid mass transfer coefficient";
Real rt1(unit = "gCOD/L/d") "Gas-liquid mass transfer rate of hydrogen";
Real rt2(unit = "gCOD/L/d") "Gas-liquid mass transfer rate of methane";
Real rt3(unit = "mole/L/d") "Gas-liquid mass transfer rate of carbon dioxide";
// Gas-liquid mass transfer variables end

// Extended variables
Real ppm_h2(unit = "mg/L", fixed = false, start = ppm_h2_0) "Dissolved hydrogen concentration";
Real ppm_ch4(unit = "mg/L", fixed = false, start = ppm_ch4_0) "Dissolved methane concentration";
Real ppm_co2(unit = "mg/L", fixed = false, start = ppm_co2_0) "Dissolved carbon dioxide concentration";
Real HMA(unit = "mL/(gSSV*d)", fixed = false, start = SHMA) "Hydrogenotrophic methanogenic activity";
Real X_SSV(unit = "gSSV/L", fixed = false, start = X_SSV_0) "SSV concentration";
equation

I_h2 = S_h2 / (S_h2 + KS_h2);
r1 = km_h2 * I_h2 * X_h2;
r2 = k_dec * X_h2;
rc1 = Y_h2 * C_bac * r1;
rc2 = (1 - Y_h2) * C_ch4 * r1;
rc3 = C_bac * r2;
rn1 = Y_h2 * N_bac * r1;
rn2 = N_bac * r2;
rAB_co2 = K_AB_co2 * (S_hco3 * (K_a_co2 + S_h) - S_IC * K_a_co2);
rAB_IN = K_AB_IN * (S_nh3 * (K_a_IN + S_h) - S_IN * K_a_IN);
kLa_H2 = kLa_O2 * sqrt(D_H2 / D_O2);
kLa_CH4 = kLa_O2 * sqrt(D_CH4 / D_O2);
kLa_CO2 = kLa_O2 * sqrt(D_CO2 / D_O2);
rt1 = kLa_H2 * (S_h2 - 16 * KH_h2 * p_gas_h2);
rt2 = kLa_CH4 * (S_ch4 - 64 * KH_ch4 * p_gas_ch4);
rt3 = kLa_CO2 * (S_co2 - KH_co2 * p_gas_co2);
24 * 3600 * der(X_h2) = Y_h2 * r1 - r2;
24 * 3600 * der(S_h2) = (-r1) - rt1;
24 * 3600 * der(S_ch4) = (1 - Y_h2) * r1 - rt2;
24 * 3600 * der(S_IC) = (-rc1) - rc2 + rc3 - rt3;
24 * 3600 * der(S_IN) = (-rn1) + rn2;
24 * 3600 * der(S_an) = 0;
24 * 3600 * der(S_cat) = 0;
24 * 3600 * der(S_hco3) = -rAB_co2;
24 * 3600 * der(S_nh3) = -rAB_IN;
24 * 3600 * der(S_gas_h2) = V_liq / V_gas * (rt1 / 16);
24 * 3600 * der(S_gas_ch4) = V_liq / V_gas * (rt2 / 64);
24 * 3600 * der(S_gas_co2) = V_liq / V_gas * rt3;
p_gas_h2 = S_gas_h2 * R * T_op;
p_gas_ch4 = S_gas_ch4 * R * T_op;
p_gas_co2 = S_gas_co2 * R * T_op;
p_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;

x_h2 = p_gas_h2 / p_gas;
x_ch4 = p_gas_ch4 / p_gas;
x_co2 = p_gas_co2 / p_gas;
x_h2o = p_gas_h2o / p_gas;

theta = S_cat + S_nh4 - S_an - S_hco3;
S_h = - 0.5 * theta + 0.5 * sqrt(theta^2 + 4 * K_W);
S_nh4 = S_IN - S_nh3;
S_co2 = S_IC - S_hco3;
pH = -log10(S_h);


// Extended variables
ppm_h2 = S_h2 * 2 * 1e3 / 16;
ppm_ch4 = S_ch4 * 16 * 1e3 / 64;
ppm_co2 = S_co2 * 44 * 1e3;
HMA = (1 - Y_h2) * r1 * 1e3 * VM / (64 * X_SSV);
X_SSV = X_h2 / i_COD_VSS;
// Extende variables end
end SHMA;
