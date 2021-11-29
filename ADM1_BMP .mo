package ADM1
  record ParametersADM1_operational
    parameter Real T_op(unit = "K") = 311.15 "Operative temperature";
    parameter Real V_liq(unit = "m3") = 0.0008 "Reactor working volume";
    parameter Real V_gas(unit = "m3") = 0.0002 "Reactor headspace";
    parameter Real M_VS_in(unit = "gVS") = 3.5 "Mass of VS of the sludge dosed in the bottle";
    constant Real R(unit = "bar/M/K") = 0.083145 "Gas law constant";
    parameter Real T_ref(unit = "K") = 298.15 "Reference temperature for pKa and enthalpy values";
    parameter Real P_atm(unit = "bar") = 1.013 "Pressure of atmosphere";
    parameter Real k_p(unit = "m3/d/bar") = 5 "Pipe resistance coefficient";
    parameter Real kla(unit = "1/d") = 200 "Volume-specific liquid-gas transfer coefficient";
    annotation(
      Documentation(info = "<html><p> This record contains settings of BMP tests and constants/parameters related to the operation of the reactor. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end ParametersADM1_operational;

  record ParametersADM1_stoichiometric
    // Carbon and Nitrogen contents
    parameter Real N_xc(unit = "kmolN/kgCOD") = 0.0376 / 14 "nitrogen content of particulate degradable COD";
    parameter Real N_i(unit = "kmolN/kgCOD") = 0.06 / 14 "nitrogen content of inert COD: 6% on weight basis in benchmark ASM";
    parameter Real N_aa(unit = "kmolN/kgCOD") = 0.007 "nitrogen content of amino acids";
    parameter Real N_bac(unit = "kmolN/kgCOD") = 0.08 / 14 "nitrogen content of biomass: 8% on weight basis in benchmark ASM";
    parameter Real C_xc(unit = "kmolC/kgCOD") = 0.02786 "carbon content of complex particulate COD";
    parameter Real C_xi(unit = "kmolC/kgCOD") = 0.03 "carbon content of particulate inert COD";
    parameter Real C_si(unit = "kmolC/kgCOD") = 0.03 "carbon content of soluble inert COD";
    parameter Real C_ch(unit = "kmolC/kgCOD") = 0.0313 "carbon content of carbohydrates";
    parameter Real C_pr(unit = "kmolC/kgCOD") = 0.03 "carbon content of proteins";
    parameter Real C_li(unit = "kmolC/kgCOD") = 0.022 "carbon content of lipids";
    parameter Real C_su(unit = "kmolC/kgCOD") = 0.0313 "carbon content of sugars";
    parameter Real C_aa(unit = "kmolC/kgCOD") = 0.03 "carbon content of amino acids";
    parameter Real C_fa(unit = "kmolC/kgCOD") = 0.0217 "carbon content of long chain fatty acids";
    parameter Real C_va(unit = "kmolC/kgCOD") = 0.024 "carbon content of valerate";
    parameter Real C_bu(unit = "kmolC/kgCOD") = 0.025 "carbon content of butyrate";
    parameter Real C_pro(unit = "kmolC/kgCOD") = 0.0268 "carbon content of propionate";
    parameter Real C_ac(unit = "kmolC/kgCOD") = 0.0313 "carbon content of acetate";
    parameter Real C_ch4(unit = "kmolC/kgCOD") = 0.0156 "carbon content of methane";
    parameter Real C_bac(unit = "kmolC/kgCOD") = 0.0313 "nitrogen content of biomass: 8% on weight basis in benchmark ASM";
    // Fractions product_substrate
    parameter Real f_si_xc(unit = "kgCOD/kgCOD") = 0.1 "yield of soluble inerts from disintegration of complex particulates";
    parameter Real f_xi_xc(unit = "kgCOD/kgCOD") = 0.2 "yield of particulate inerts from disintegration of complex particulates";
    parameter Real f_ch_xc(unit = "kgCOD/kgCOD") = 0.2 "yield of carbohydrates from disintegration of complex particulates";
    parameter Real f_pr_xc(unit = "kgCOD/kgCOD") = 0.2 "yield of proteins from disintegration of complex particulates";
    parameter Real f_li_xc(unit = "kgCOD/kgCOD") = 0.3 "yield of lipids from disintegration of complex particulates";
    parameter Real f_fa_li(unit = "kgCOD/kgCOD") = 0.95 "yield of long chain fatty acids (as opposed to glycerol) from lipids";
    parameter Real nu_1_su(unit = "kgCOD/kgCOD") = 0.495 "fraction of sucrose that degrades to acetate only";
    parameter Real nu_2_su(unit = "kgCOD/kgCOD") = 0.345 "fraction of sucrose that degrades to acetate and propionate";
    Real f_h2_su = 0.33 * nu_1_su + 0.17 * (1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of hydrogen from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_bu_su = 0.83 * (1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of butyrate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_pro_su = 0.78 * nu_2_su "unit = kgCOD/kgCOD - yield of propionate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_ac_su = 0.67 * nu_1_su + 0.22 * nu_2_su "unit = kgCOD/kgCOD - yield of actetate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    parameter Real f_h2_aa(unit = "kgCOD/kgCOD") = 0.06 "yield of hydrogen from amino acid degradation";
    parameter Real f_va_aa(unit = "kgCOD/kgCOD") = 0.23 "yield of valerate from amino acid degradation";
    parameter Real f_bu_aa(unit = "kgCOD/kgCOD") = 0.26 "yield of butyrate from amino acid degradation";
    parameter Real f_pro_aa(unit = "kgCOD/kgCOD") = 0.05 "yield of propionate from amino acid degradation";
    parameter Real f_ac_aa(unit = "kgCOD/kgCOD") = 0.4 "yield of acetate from amino acid degradation";
    // Yields of biomass on uptake of substrates
    parameter Real Y_su(unit = "kgCODx/kgCODs") = 0.1 "yield of biomass on uptake of monosaccharides";
    parameter Real Y_aa(unit = "kgCODx/kgCODs") = 0.08 "yield of biomass on uptake of amino acids";
    parameter Real Y_fa(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of long chain fatty acids";
    parameter Real Y_c4(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of valerate or butyrate";
    parameter Real Y_pro(unit = "kgCODx/kgCODs") = 0.04 "yield of biomass on uptake of propionate";
    parameter Real Y_ac(unit = "kgCODx/kgCODs") = 0.05 "yield of biomass on uptake of acetate";
    parameter Real Y_h2(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of elemental hydrogen";
    // Inorganic carbon coefficients
    Real v1 = (-C_xc) + f_si_xc * C_si + f_ch_xc * C_ch + f_pr_xc * C_pr + f_li_xc * C_li + f_xi_xc * C_xi;
    Real v2 = (-C_ch) + C_su;
    Real v3 = (-C_pr) + C_aa;
    Real v4 = (-C_li) + (1 - f_fa_li) * C_su + f_fa_li * C_fa;
    Real v5 = (-C_su) + (1 - Y_su) * (f_bu_su * C_bu + f_pro_su * C_pro + f_ac_su * C_ac) + Y_su * C_bac;
    Real v6 = (-C_aa) + (1 - Y_aa) * (f_va_aa * C_va + f_bu_aa * C_bu + f_pro_aa * C_aa + f_ac_aa * C_aa) + Y_aa * C_bac;
    Real v7 = (-C_fa) + (1 - Y_fa) * 0.7 * C_ac + Y_fa * C_bac;
    Real v8 = (-C_va) + (1 - Y_c4) * 0.54 * C_pro + (1 - Y_c4) * 0.31 * C_ac + Y_c4 * C_bac;
    Real v9 = (-C_bu) + (1 - Y_c4) * 0.8 * C_ac + Y_c4 * C_bac;
    Real v10 = (-C_pro) + (1 - Y_pro) * 0.57 * C_ac + Y_pro * C_bac;
    Real v11 = (-C_ac) + (1 - Y_ac) * C_ch4 + Y_ac * C_bac;
    Real v12 = (1 - Y_h2) * C_ch4 + Y_h2 * C_bac;
    Real v13 = (-C_bac) + C_xc;
    annotation(
      Documentation(info = "<html><p> This record contains stoichiometric coefficients as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002) and in Rosen and Jeppsson (2006). </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end ParametersADM1_stoichiometric;

  record ParametersADM1_kinetic
    parameter Real k_dis(unit = "1/d") = 1.5 "complex particulate disintegration first order constant";
    parameter Real k_hyd_ch(unit = "1/d") = 0.3 "carbohydrate hydrolysis first order constant";
    parameter Real k_hyd_pr(unit = "1/d") = 0.2 "protein hydrolysis first order constant";
    parameter Real k_hyd_li(unit = "1/d") = 0.5 "lipid hydrolysis first order constant";
    parameter Real k_m_su(unit = "kgCODs/kgCODx/d") = 8 "maximum uptake rate for monosaccharide degrading organisms";
    parameter Real k_m_aa(unit = "kgCODs/kgCODx/d") = 8 "maximum uptake rate amino acid degrading organisms";
    parameter Real k_m_fa(unit = "kgCODs/kgCODx/d") = 6 "maximum uptake rate for long chain fatty acid degrading organisms";
    parameter Real k_m_c4(unit = "kgCODs/kgCODx/d") = 20 "maximum uptake rate for c4 degrading organisms";
    parameter Real k_m_pro(unit = "kgCODs/kgCODx/d") = 13 "maximum uptake rate for propionate degrading organisms";
    parameter Real k_m_ac(unit = "kgCODs/kgCODx/d") = 8 "maximum uptake rate for acetate degrading organisms";
    parameter Real k_m_h2(unit = "kgCODs/kgCODx/d") = 35 "maximum uptake rate for hydrogen degrading organisms";
    parameter Real Ks_su(unit = "kgCOD/m3") = 0.3 "half saturation constant for monosaccharidedegradation";
    parameter Real Ks_aa(unit = "kgCOD/m3") = 0.2 "half saturation constant for amino acid degradation";
    parameter Real Ks_fa(unit = "kgCOD/m3") = 0.4 "maximum uptake rate for long chain fatty acid degrading organisms";
    parameter Real Ks_c4(unit = "kgCOD/m3") = 0.2 "maximum uptake rate for c4 degrading organisms";
    parameter Real Ks_pro(unit = "kgCOD/m3") = 0.1 "maximum uptake rate for propionate degrading organisms";
    parameter Real Ks_ac(unit = "kgCOD/m3") = 0.01 "maximum uptake rate for acetate degrading organisms";
    parameter Real Ks_h2(unit = "kgCOD/m3") = 7e-6 "maximum uptake rate for hydrogen degrading organisms";
    parameter Real k_dec_su(unit = "1/d") = 0.02 "decay rate for monosaccharide degrading organisms";
    parameter Real k_dec_aa(unit = "1/d") = 0.02 "decay rate for amino acid degrading organisms";
    parameter Real k_dec_fa(unit = "1/d") = 0.02 "decay rate  for long chain fatty acid degrading organisms";
    parameter Real k_dec_c4(unit = "1/d") = 0.02 "decay rate  for c4 degrading organisms";
    parameter Real k_dec_pro(unit = "1/d") = 0.02 "decay rate for propionate degrading organisms";
    parameter Real k_dec_ac(unit = "1/d") = 0.02 "decay rate  for acetate degrading organisms";
    parameter Real k_dec_h2(unit = "1/d") = 0.02 "decay rate for hydrogen degrading organisms";
    parameter Real Ks_IN(unit = "M") = 1e-4 "inorganic nitrogen concentration at which growth ceases";
    parameter Real Ki_h2_fa(unit = "kgCOD/m3") = 5e-6 "hydrogen inhibitory concentration for LCFA degrading organisms";
    parameter Real Ki_h2_c4(unit = "kgCOD/m3") = 1e-5 "hydrogen inhibitory concentration for C4 degrading organisms";
    parameter Real Ki_h2_pro(unit = "kgCOD/m3") = 3.5e-6 "hydrogen inhibitory concentration for propionate degrading organisms";
    parameter Real Ki_nh3_ac(unit = "M") = 0.0018 "inhibitory free ammonia concentration for acetate degrading organisms";
    parameter Real pH_UL_aa = 5.5 "pH level at where there is no inhibition of amino acid degrading organisms";
    parameter Real pH_LL_aa = 4 "pH level at where there is full inhibition of amino acid degrading organisms";
    parameter Real pH_UL_ac = 7 "pH level at where there is no inhibition of acetate degrading organisms";
    parameter Real pH_LL_ac = 6 "pH level at where there is full inhibition of acetate degrading organisms";
    parameter Real pH_UL_h2 = 6 "pH level at where there is no inhibition of hydrogen degrading organisms";
    parameter Real pH_LL_h2 = 5 "pH level at where there is full inhibition of hydrogen degrading organisms";
    constant Real epsilon = 1e-6;
    annotation(
      Documentation(info = "<html><p> This record contains kinetic parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002) and in Rosen and Jeppsson (2006). </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 21, 2021 </em></p></html>"));
  end ParametersADM1_kinetic;

  record ParametersADM1_physiochemical
    extends ParametersADM1_operational;
    parameter Real pKa_va = 4.86 "- log10Ka valerate at 298K";
    parameter Real pKa_bu = 4.82 "- log10Ka butyrate at 298K";
    parameter Real pKa_pro = 4.88 "- log10Ka propionate at 298K";
    parameter Real pKa_ac = 4.76 "- log10Ka acetate at 298K";
    parameter Real pKa_co2 = 6.35 "- log10Ka CO2 at 298K";
    parameter Real pKa_nh3 = 9.25 "- log10ka NH4+ at 298K ";
    parameter Real pKa_h2o = 14 "- log10ka water at 298K ";
    parameter Real deltaH0_Ka_co2(unit = "J") = 7646 "enthalpy of reaction CO2->HCO3";
    parameter Real deltaH0_Ka_nh4(unit = "J") = 51965 "enthalpy of reaction NH4->NH3";
    parameter Real deltaH0_Ka_h2o(unit = "J") = 55900 "enthalpy of reaction H2O->OH+H+";
    parameter Real deltaH0_KH_ch4(unit = "J") = -14240 "enthalpy of reaction of CH4gas->CH4liq";
    parameter Real deltaH0_KH_co2(unit = "J") = -19410 "enthalpy of reaction of CO2gas->CO2liq";
    parameter Real deltaH0_KH_h2(unit = "J") = -4180 "enthalpy of reaction of H2gas->H2liq";
    // Acidity constants
    Real Ka_va = 10 ^ (-pKa_va) "valerate acidity constant without temperature correction - unit = M";
    Real Ka_bu = 10 ^ (-pKa_bu) "butyrate acidity constant without temperature correction - unit = M";
    Real Ka_pro = 10 ^ (-pKa_pro) "propionate acidity constant without temperature correction - unit = M";
    Real Ka_ac = 10 ^ (-pKa_ac) "acetate acidity constant without temperature correction - unit = M";
    // Kinetic constant for acid-base reactions: set to be at least three orders of magnitude higher than the fastest time constant of the system
    parameter Real k_AB_va(unit = "1/M/d") = 1e10 "Kinetic constant for valerate speciation";
    parameter Real k_AB_bu(unit = "1/M/d") = 1e10 "Kinetic constant for butyrate speciation";
    parameter Real k_AB_pro(unit = "1/M/d") = 1e10 "Kinetic constant for propionate speciation";
    parameter Real k_AB_ac(unit = "1/M/d") = 1e10 "Kinetic constant for acetate speciation";
    parameter Real k_AB_co2(unit = "1/M/d") = 1e10 "Kinetic constant for inorganic carbon speciation";
    parameter Real k_AB_IN(unit = "1/M/d") = 1e10 "Kinetic constant for inorganic ammonium nitrogen speciation";
    //Temperature dependent parameters
    // Acidity constants
    Real Ka_co2 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) "CO2 acidity constant with temperature correction - unit = M";
    Real Ka_nh4 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op)) "NH4+ acidity constant with temperature correction - unit = M";
    Real Ka_h2o = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op)) "water acidity constant with temperature correction - unit = M";
    // Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
    Real KH_ch4 = 0.0014 * exp(deltaH0_KH_ch4 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
    Real KH_co2 = 0.035 * exp(deltaH0_KH_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
    Real KH_h2 = 0.00078 * exp(deltaH0_KH_h2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
    // Others
    Real p_gas_h2o = 0.0313 * exp(5290 * (1 / T_ref - 1 / T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
    annotation(
      Documentation(info = "<html><p> This record contains physiochemical parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002) and in Rosen and Jeppsson (2006). </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end ParametersADM1_physiochemical;

  record StateVariablesADM1
    //Biomass
    Real X_su(fixed = true, start = 0.406331808129861) "monosaccharide degrading organisms";
    Real X_aa(fixed = true, start = 0.533787949096202) "amino acid degrading organisms";
    Real X_fa(fixed = true, start = 0.204035270493136) "long chain fatty acid degrading organisms";
    Real X_c4(fixed = true, start = 0.220433278549326) "butyrate and valerate degrading organisms";
    Real X_pro(fixed = true, start = 0.0894278918257428) "propionate degrading organisms";
    Real X_ac(fixed = true, start = 0.493077681430494) "acetic acid degrading organisms";
    Real X_h2(fixed = true, start = 0.214081685690745) "hydrogen degrading organisms";
    //Particulate substrate
    Real X_c(fixed = true, start = 1.48772916800498) "Complex particulate";
    Real X_i(fixed = true, start = 2.31386777111864) "Particulate inert";
    Real X_ch(fixed = true, start = 1.48772916800498) "Particulate carbohydrates";
    Real X_pr(fixed = true, start = 2.9032548154242) "Particulate proteins";
    Real X_li(fixed = true, start = 0.891686111865594) "Particulate lipids";
    //Soluble substrate
    Real S_i(fixed = true, start = 3.45675208246203) "Soluble intert";
    Real S_su(fixed = true, start = 0.0467276624534845) "Soluble monosaccharides";
    Real S_aa(fixed = true, start = 0.22672378734387) "Soluble aminoacids";
    Real S_fa(fixed = true, start = 0.00665943920866124) "Soluble fatty acids";
    Real S_va(fixed = true, start = 0.0243372172807335) "Soluble total valerate";
    Real S_bu(fixed = true, start = 0.0485433065781709) "Soluble total butyrate";
    Real S_pro(fixed = true, start = 0.0743250524990594) "Soluble total propionate";
    Real S_ac(fixed = true, start = 0.169416803384167) "Soluble total acetate";
    Real S_vam(fixed = true, start = 0.00193323782176895) "Ionic valerate";
    Real S_bum(fixed = true, start = 0.00243934798347819) "Ionic butyrate";
    Real S_prom(fixed = true, start = 0.00267733589076243) "Ionic propionate";
    Real S_acm(fixed = true, start = 0.00315335267518447) "Ionic acetate";
    //Inorganic soluble components
    Real S_h2(fixed = true, start = 3.38574039078054E-08) "dissolved hydrogen";
    Real S_ch4(fixed = true, start = 0.0292997934568621) "dissolved methane";
    Real S_ic(fixed = true, start = 0.0831522675737058) "soluble inorganic carbon";
    Real S_in(fixed = true, start = 0.0569687132794204) "soluble inorganic nitrogen";
    Real S_cat(fixed = true, start = 3.45675208246203) "Cations";
    Real S_an(fixed = false, start = 0.335168891575888) "Anions";
    Real S_hco3(fixed = true, start = 0.0795650577706867) "Soluble bicarbonate";
    Real S_nh3(fixed = true, start = 0.0031705187664761) "Soluble ammonia";
    Real S_nh4(fixed = false, start = 0.126) "Soluble ammonium";
    Real S_co2(fixed = false, start = 0.0099) "Soluble carbon dioxide";
    Real pH(fixed = false, start = 7.3) "pH";
    Real S_h(fixed = true, start = 10 ^ (-7.3)) "hydrogen ion";
    Real Theta(fixed = false, start = 0.02) "Coefficent for charge balance from Rosen & Jeppsson 2006";
    //Gas components
    Real S_gas_h2(fixed = false, start = 1.3486e-5);
    Real S_gas_ch4(fixed = false, start = 1.82381);
    Real S_gas_co2(fixed = false, start = 0.009974);
    Real p_gas_h2(fixed = false, start = 0.023) "Partial pressure of H2";
    Real p_gas_ch4(fixed = true, start = 0.581161050183745) "Partial pressure of CH4";
    Real p_gas_co2(fixed = true, start = 0.366175427094944) "Partial pressure of CO2";
    //Other variables
    Real P_gas(fixed = true, start = 1.01302847057261) "Total pressure";
    Real q_gas(fixed = false, start = 0) "Biogas rate";
    Real Q_gas_N(fixed = false, start = 0) "Biogas rate at STP";
    Real x_ch4(fixed = false, start = 0);
    Real x_co2(fixed = false, start = 0);
    Real x_h2(fixed = false, start = 0);
    Real Q_ch4_N(fixed = false, start = 0) "Methane rate at STP";
    Real Q_co2_N(fixed = false, start = 0) "Carbon dioxide rate at STP";
    Real Q_h2_N(fixed = false, start = 0) "Hydrogen dioxide rate at STP";
    Real CH4cum_model(fixed = true, start = 0) "Cumulated methane at STP [NmLCH4]";
    Real CH4cum_VS_model(fixed = false, start = 0) "Specific cumulated methane at STP [NmLCH4/gVS]";
    //Process rates
    Real r1(fixed = false, start = 0);
    Real r2(fixed = false, start = 0);
    Real r3(fixed = false, start = 0);
    Real r4(fixed = false, start = 0);
    Real r5(fixed = false, start = 0);
    Real r6(fixed = false, start = 0);
    Real r7(fixed = false, start = 0);
    Real r8(fixed = false, start = 0);
    Real r9(fixed = false, start = 0);
    Real r10(fixed = false, start = 0);
    Real r11(fixed = false, start = 0);
    Real r12(fixed = false, start = 0);
    Real r13(fixed = false, start = 0);
    Real r14(fixed = false, start = 0);
    Real r15(fixed = false, start = 0);
    Real r16(fixed = false, start = 0);
    Real r17(fixed = false, start = 0);
    Real r18(fixed = false, start = 0);
    Real r19(fixed = false, start = 0);
    Real ra4(fixed = false, start = 0);
    Real ra5(fixed = false, start = 0);
    Real ra6(fixed = false, start = 0);
    Real ra7(fixed = false, start = 0);
    Real ra10(fixed = false, start = 0);
    Real ra11(fixed = false, start = 0);
    Real rt8(fixed = false, start = 0);
    Real rt9(fixed = false, start = 0);
    Real rt10(fixed = false, start = 0);
    // Process inhibition
    Real I_5(fixed = false, start = 1);
    Real I_6(fixed = false, start = 1);
    Real I_7(fixed = false, start = 1);
    Real I_8(fixed = false, start = 1);
    Real I_9(fixed = false, start = 1);
    Real I_10(fixed = false, start = 1);
    Real I_11(fixed = false, start = 1);
    Real I_12(fixed = false, start = 1);
    Real I_pH_aa(fixed = false, start = 1);
    Real I_pH_ac(fixed = false, start = 1);
    Real I_pH_h2(fixed = false, start = 1);
    Real I_in_lim(fixed = false, start = 1);
    Real I_h2_fa(fixed = false, start = 1);
    Real I_h2_c4(fixed = false, start = 1);
    Real I_h2_pro(fixed = false, start = 1);
    Real I_nh3(fixed = false, start = 1);
    //Input state variables
    Real qin = 0;
    Real S_su_in = 1;
    Real S_aa_in = 1;
    Real S_fa_in = 1;
    Real S_va_in = 1;
    Real S_bu_in = 1;
    Real S_pro_in = 1;
    Real S_ac_in = 1;
    Real S_h2_in = 1;
    Real S_ch4_in = 1;
    Real S_ic_in = 1;
    Real S_in_in = 1;
    Real S_i_in = 1;
    Real S_cat_in = 1;
    Real S_an_in = 1;
    Real X_c_in = 1;
    Real X_ch_in = 1;
    Real X_pr_in = 1;
    Real X_li_in = 1;
    Real X_su_in = 1;
    Real X_aa_in = 1;
    Real X_fa_in = 1;
    Real X_c4_in = 1;
    Real X_pro_in = 1;
    Real X_ac_in = 1;
    Real X_h2_in = 1;
    Real X_i_in = 1;
    //Output Aggregated Variables
    Real VS(fixed = false, start = 0) "VS content of substrate [gVS/kg]";
    Real N_NH4(fixed = false, start = 0) "Ammoniacal nitrogen [mgN/L]";
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions for BMP tests, to be set as weighted sum of contributions from inoculum, substrate, nutrients and water. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end StateVariablesADM1;

  model BMP
    extends ADM1.ParametersADM1_operational;
    extends ADM1.ParametersADM1_stoichiometric;
    extends ADM1.ParametersADM1_kinetic;
    extends ADM1.ParametersADM1_physiochemical;
    extends ADM1.StateVariablesADM1;
    Modelica.Blocks.Sources.CombiTimeTable Experimental_gross_BMP(columns = integer({2}), fileName = "D:/Arianna/Documents/Modelica Models/Exp_gross_BMP.txt", startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Exp_gross_BMP", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-42, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//Inhibition
    pH = -log10(S_h);
    I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3 * ((pH - pH_UL_aa) / (pH_UL_aa - pH_LL_aa)) ^ 2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
    I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3 * ((pH - pH_UL_ac) / (pH_UL_ac - pH_LL_ac)) ^ 2) else 1.0 "pH inhibition of acetate degrading organisms";
    I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3 * ((pH - pH_UL_h2) / (pH_UL_h2 - pH_LL_h2)) ^ 2) else 1.0 "pH inhibition of hydrogen degrading organisms";
    I_in_lim = 1 / (1 + Ks_IN / S_in) "function to limit growth due to lack of inorganic nitrogen";
    I_h2_fa = 1 / (1 + S_h2 / Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
    I_h2_c4 = 1 / (1 + S_h2 / Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
    I_h2_pro = 1 / (1 + S_h2 / Ki_h2_pro) "hydrogen inhibition for propionate degradation";
    I_nh3 = 1 / (1 + S_nh3 / Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
    I_5 = I_pH_aa * I_in_lim;
    I_6 = I_pH_aa * I_in_lim;
    I_7 = I_pH_aa * I_in_lim * I_h2_fa;
    I_8 = I_pH_aa * I_in_lim * I_h2_c4;
    I_9 = I_pH_aa * I_in_lim * I_h2_c4;
    I_10 = I_pH_aa * I_in_lim * I_h2_pro;
    I_11 = I_pH_ac * I_in_lim * I_nh3;
    I_12 = I_pH_h2 * I_in_lim;
//Biochemical process rates
    r1 = k_dis * X_c;
    r2 = k_hyd_ch * X_ch;
    r3 = k_hyd_pr * X_pr;
    r4 = k_hyd_li * X_li;
    r5 = k_m_su * S_su / (S_su + Ks_su) * X_su * I_5;
    r6 = k_m_aa * S_aa / (S_aa + Ks_aa) * X_aa * I_6;
    r7 = k_m_fa * S_fa / (S_fa + Ks_fa) * X_fa * I_7;
    r8 = k_m_c4 * S_va / (S_va + Ks_c4) * X_c4 * S_va / (S_bu + S_va + epsilon) * I_8;
    r9 = k_m_c4 * S_bu / (S_bu + Ks_c4) * X_c4 * S_bu / (S_bu + S_va + epsilon) * I_9;
    r10 = k_m_pro * S_pro / (S_pro + Ks_pro) * X_pro * I_10;
    r11 = k_m_ac * S_ac / (S_ac + Ks_ac) * X_ac * I_11;
    r12 = k_m_h2 * S_h2 / (S_h2 + Ks_h2) * X_h2 * I_12;
    r13 = k_dec_su * X_su;
    r14 = k_dec_aa * X_aa;
    r15 = k_dec_fa * X_fa;
    r16 = k_dec_c4 * X_c4;
    r17 = k_dec_pro * X_pro;
    r18 = k_dec_ac * X_ac;
    r19 = k_dec_h2 * X_h2;
//Acid-base rates
    ra4 = k_AB_va * (S_vam * (Ka_va + S_h) - Ka_va * S_va);
    ra5 = k_AB_bu * (S_bum * (Ka_bu + S_h) - Ka_bu * S_bu);
    ra6 = k_AB_pro * (S_prom * (Ka_pro + S_h) - Ka_pro * S_pro);
    ra7 = k_AB_ac * (S_acm * (Ka_ac + S_h) - Ka_ac * S_ac);
    ra10 = k_AB_co2 * (S_hco3 * (Ka_co2 + S_h) - Ka_co2 * S_ic);
    ra11 = k_AB_IN * (S_nh3 * (Ka_nh4 + S_h) - Ka_nh4 * S_in);
//Gas transfer rates
    rt8 = kla * (S_h2 - 16 * KH_h2 * p_gas_h2);
    rt9 = kla * (S_ch4 - 64 * KH_ch4 * p_gas_ch4);
    rt10 = kla * (S_co2 - KH_co2 * p_gas_co2);
//Particulate matter
    24 * 3600 * der(X_c) = qin / V_liq * (X_c_in - X_c) - r1 + r13 + r14 + r15 + r16 + r17 + r18 + r19;
    24 * 3600 * der(X_ch) = qin / V_liq * (X_ch_in - X_ch) + f_ch_xc * r1 - r2;
    24 * 3600 * der(X_pr) = qin / V_liq * (X_pr_in - X_pr) + f_pr_xc * r1 - r3;
    24 * 3600 * der(X_li) = qin / V_liq * (X_li_in - X_li) + f_li_xc * r1 - r4;
    24 * 3600 * der(X_i) = qin / V_liq * (X_i_in - X_i) + f_xi_xc * r1;
//Soluble matter
    24 * 3600 * der(S_i) = qin / V_liq * (S_i_in - S_i) + f_si_xc * r1;
    24 * 3600 * der(S_su) = qin / V_liq * (S_su_in - S_su) + r2 + (1 - f_fa_li) * r4 - r5;
    24 * 3600 * der(S_aa) = qin / V_liq * (S_aa_in - S_aa) + r3 - r6;
    24 * 3600 * der(S_fa) = qin / V_liq * (S_fa_in - S_fa) + f_fa_li * r4 - r7;
    24 * 3600 * der(S_va) = qin / V_liq * (S_va_in - S_va) + (1 - Y_aa) * f_va_aa * r6 - r8;
    24 * 3600 * der(S_bu) = qin / V_liq * (S_bu_in - S_bu) + (1 - Y_su) * f_bu_su * r5 + (1 - Y_aa) * f_bu_aa * r6 - r9;
    24 * 3600 * der(S_pro) = qin / V_liq * (S_pro_in - S_pro) + (1 - Y_su) * f_pro_su * r5 + (1 - Y_aa) * f_pro_aa * r6 + (1 - Y_c4) * 0.54 * r8 - r10;
    24 * 3600 * der(S_ac) = qin / V_liq * (S_ac_in - S_ac) + (1 - Y_su) * f_ac_su * r5 + (1 - Y_aa) * f_ac_aa * r6 + (1 - Y_fa) * 0.7 * r7 + (1 - Y_c4) * 0.31 * r8 + (1 - Y_c4) * 0.8 * r9 + (1 - Y_pro) * 0.57 * r10 - r11;
    24 * 3600 * der(S_h2) = qin / V_liq * (S_h2_in - S_h2) + (1 - Y_su) * f_h2_su * r5 + (1 - Y_aa) * f_h2_aa * r6 + (1 - Y_fa) * 0.3 * r7 + (1 - Y_c4) * 0.15 * r8 + (1 - Y_c4) * 0.2 * r9 + (1 - Y_pro) * 0.43 * r10 - r12 - rt8;
    24 * 3600 * der(S_ch4) = qin / V_liq * (S_ch4_in - S_ch4) + (1 - Y_ac) * r11 + (1 - Y_h2) * r12 - rt9;
    24 * 3600 * der(S_ic) = qin / V_liq * (S_ic_in - S_ic) - (v1 * r1 + v2 * r2 + v3 * r3 + v4 * r4 + v5 * r5 + v6 * r6 + v7 * r7 + v8 * r8 + v9 * r9 + v10 * r10 + v11 * r11 + v12 * r12 + v13 * (r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10;
    24 * 3600 * der(S_in) = qin / V_liq * (S_in_in - S_in) - Y_su * N_bac * r5 + (N_aa - Y_aa * N_bac) * r6 - Y_fa * N_bac * r7 - Y_c4 * N_bac * r8 - Y_c4 * N_bac * r9 - Y_pro * N_bac * r10 - Y_ac * N_bac * r11 - Y_h2 * N_bac * r12 + (N_bac - N_xc) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) + (N_xc - f_xi_xc * N_i - f_si_xc * N_i - f_pr_xc * N_aa) * r1;
// Biomasses
    24 * 3600 * der(X_su) = qin / V_liq * (X_su_in - X_su) + Y_su * r5 - r13;
    24 * 3600 * der(X_aa) = qin / V_liq * (X_aa_in - X_aa) + Y_aa * r6 - r14;
    24 * 3600 * der(X_fa) = qin / V_liq * (X_fa_in - X_fa) + Y_fa * r7 - r15;
    24 * 3600 * der(X_c4) = qin / V_liq * (X_c4_in - X_c4) + Y_c4 * r8 + Y_c4 * r9 - r16;
    24 * 3600 * der(X_pro) = qin / V_liq * (X_pro_in - X_pro) + Y_pro * r10 - r17;
    24 * 3600 * der(X_ac) = qin / V_liq * (X_ac_in - X_ac) + Y_ac * r11 - r18;
    24 * 3600 * der(X_h2) = qin / V_liq * (X_h2_in - X_h2) + Y_h2 * r12 - r19;
// Cations and anions
    24 * 3600 * der(S_cat) = qin / V_liq * (S_cat_in - S_cat);
    24 * 3600 * der(S_an) = qin / V_liq * (S_an_in - S_an);
    24 * 3600 * der(S_vam) = -ra4;
    24 * 3600 * der(S_bum) = -ra5;
    24 * 3600 * der(S_prom) = -ra6;
    24 * 3600 * der(S_acm) = -ra7;
    24 * 3600 * der(S_hco3) = -ra10;
    24 * 3600 * der(S_nh3) = -ra11;
    S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
    Theta = S_cat + S_nh4 - S_hco3 - S_acm / 64 - S_prom / 112 - S_bum / 160 - S_vam / 208 - S_an;
    S_nh4 = S_in - S_nh3;
    S_co2 = S_ic - S_hco3;
// Gas phase equations
    24 * 3600 * der(S_gas_h2) = (-S_gas_h2 * q_gas / V_gas) + rt8 * V_liq / V_gas;
    24 * 3600 * der(S_gas_ch4) = (-S_gas_ch4 * q_gas / V_gas) + rt9 * V_liq / V_gas;
    24 * 3600 * der(S_gas_co2) = (-S_gas_co2 * q_gas / V_gas) + rt10 * V_liq / V_gas;
    p_gas_h2 = S_gas_h2 * R * T_op / 16;
    p_gas_ch4 = S_gas_ch4 * R * T_op / 64;
    p_gas_co2 = S_gas_co2 * R * T_op;
    P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
    q_gas = k_p * (P_gas - P_atm) * P_gas / P_atm;
    Q_gas_N = q_gas * 273.15 / T_op * P_gas / P_atm;
    x_ch4 = p_gas_ch4 / (P_gas - p_gas_h2o);
    x_co2 = p_gas_co2 / (P_gas - p_gas_h2o);
    x_h2 = p_gas_h2 / (P_gas - p_gas_h2o);
    Q_ch4_N = Q_gas_N * x_ch4;
    Q_co2_N = Q_gas_N * x_co2;
    Q_h2_N = Q_gas_N * x_h2;
//BMP
    24 * 3600 * der(CH4cum_model) = 1000 * ((1 - Y_ac) * r11 + (1 - Y_h2) * r12) * V_liq * 350;
    CH4cum_VS_model = CH4cum_model / M_VS_in;
// Characteristics of digestate
    VS = 1 / 1.42 * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 1 / 1.19 * (S_su + X_ch) + 1 / 1.42 * (S_aa + X_pr) + 1 / 2.9 * (S_fa + X_li) + 1 / 1.2 * (S_i + X_i) "Volatile Solid content in the digester as gVS/L";
    N_NH4 = S_in * 14 * 1000 "Ammoniacal nitrogen (mgN/L) for direct comparison with results from kit test";
    annotation(
      Documentation(info = "<html><p> This model contains mass balance differential equations in the water phase and in the gas phase, as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002) and in Rosen and Jeppsson (2006). </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"),
      Icon,
      Diagram(graphics = {Ellipse(extent = {{-62, 54}, {-62, 54}}, endAngle = 360)}),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      experiment(StartTime = 0, StopTime = 1810799, Tolerance = 1e-06, Interval = 3621.6),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ");
  end BMP;
  annotation(
    uses(Modelica(version = "3.2.3")));
end ADM1;
