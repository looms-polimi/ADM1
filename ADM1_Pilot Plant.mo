package ADM1
  record ParametersADM1_operational
    parameter Real V_liq(unit = "m3") = 0.06 "Digester working volume";
    parameter Real V_gas(unit = "m3") = 0.017 "Digester headspace";
    constant Real R(unit = "bar/(kmol/m3)/K") = 0.083145 "Gas law constant";
    parameter Real T_ref(unit = "K") = 298.15 "Reference temperature for pKa and enthalpy values";
    parameter Real T_ref_k(unit = "K") = 308.15 "Reference temperature for kinetic parameters";
    parameter Real P_atm(unit = "bar") = 1.013 "Pressure of atmosphere";
    parameter Real k_p(unit = "m3/d/bar") = 100 "Pipe resistance coefficient";
    parameter Real kla(unit = "1/d") = 200 "Volume-specific liquid-gas transfer coefficient";
    annotation(
      Documentation(info = "<html><p> This record contains operational parameters and constants/parameters of the digester. </p>
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
    parameter Real Y_ac(unit = "kgCODx/kgCODs") = 0.05 "0.05 yield of biomass on uptake of acetate";
    parameter Real Y_h2(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of elemental hydrogen";
    //Conversion coefficients from kmol to kgCOD
    constant Real Ac_conv(unit = "kgCOD/kmol") = 64;
    constant Real Pro_conv(unit = "kgCOD/kmol") = 112;
    constant Real Bu_conv(unit = "kgCOD/kmol") = 160;
    constant Real Va_conv(unit = "kgCOD/kmol") = 208;
    constant Real ch4_conv(unit = "kgCOD/kmol") = 64;
    constant Real h2_conv(unit = "kgCOD/kmol") = 16;
    annotation(
      Documentation(info = "<html><p> This record contains stoichiometric coefficients as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002) and in Rosen and Jeppsson (2006). </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end ParametersADM1_stoichiometric;

  record ParametersADM1_kinetic
    parameter Real k_dis(unit = "1/d") = 1.5 "1.2 complex particulate disintegration first order constant";
    parameter Real k_hyd_ch(unit = "1/d") = 0.3 "0.75 carbohydrate hydrolysis first order constant";
    parameter Real k_hyd_pr(unit = "1/d") = 0.2 "0.2 0.6 protein hydrolysis first order constant";
    parameter Real k_hyd_li(unit = "1/d") = 0.5 "0.3 lipid hydrolysis first order constant";
    parameter Real k_m_su(unit = "kgCODs/kgCODx/d") = 8 " 38 30 maximum uptake rate for monosaccharide degrading organisms";
    parameter Real k_m_aa(unit = "kgCODs/kgCODx/d") = 8 "50 maximum uptake rate amino acid degrading organisms";
    parameter Real k_m_fa(unit = "kgCODs/kgCODx/d") = 6 "6 maximum uptake rate for long chain fatty acid degrading organisms";
    parameter Real k_m_c4(unit = "kgCODs/kgCODx/d") = 20 "20 maximum uptake rate for c4 degrading organisms";
    parameter Real k_m_pro(unit = "kgCODs/kgCODx/d") = 13 "13 maximum uptake rate for propionate degrading organisms";
    parameter Real k_m_ac(unit = "kgCODs/kgCODx/d") = 8 " 8 maximum uptake rate for acetate degrading organisms";
    parameter Real k_m_h2(unit = "kgCODs/kgCODx/d") = 35 "maximum uptake rate for hydrogen degrading organisms";
    parameter Real Ks_su(unit = "kgCOD/m3") = 0.3 "0.5 half saturation constant for monosaccharidedegradation";
    parameter Real Ks_aa(unit = "kgCOD/m3") = 0.2 "0.3 half saturation constant for amino acid degradation";
    parameter Real Ks_fa(unit = "kgCOD/m3") = 0.4 "maximum uptake rate for long chain fatty acid degrading organisms";
    parameter Real Ks_c4(unit = "kgCOD/m3") = 0.3 "maximum uptake rate for c4 degrading organisms";
    parameter Real Ks_pro(unit = "kgCOD/m3") = 0.2 "0.3 maximum uptake rate for propionate degrading organisms";
    parameter Real Ks_ac(unit = "kgCOD/m3") = 0.01 "0.15 maximum uptake rate for acetate degrading organisms";
    parameter Real Ks_h2(unit = "kgCOD/m3") = 2.5e-5 "maximum uptake rate for hydrogen degrading organisms";
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
    parameter Real th_k_hyd = 0.024;
    parameter Real th_k_m_su = 0.069;
    parameter Real th_k_m_aa = 0.069;
    parameter Real th_k_m_fa = 0.055;
    parameter Real th_k_m_pro = 0.055;
    //parameter Real th_k_m_c4 = ?; not found
    parameter Real th_k_m_ac = 0.069;
    parameter Real th_k_m_h2 = 0.069;
    parameter Real th_Ks_su = 0.069;
    parameter Real th_Ks_aa = 0.069;
    parameter Real th_Ks_fa = 0.035;
    parameter Real th_Ks_pro = 0.10;
    //parameter Real th_Ks_c4 = ?; not found
    parameter Real th_Ks_ac = 0.10;
    parameter Real th_Ks_h2 = 0.08;  
    parameter Real th_k_dec_su = 0.069;
    parameter Real th_k_dec_aa = 0.069;
    parameter Real th_k_dec_fa = 0.055;
    parameter Real th_k_dec_pro = 0.055;
    //parameter Real th_k_dec_c4 = ?; not found
    parameter Real th_k_dec_ac = 0.069;
    parameter Real th_k_dec_h2 = 0.069;  
    constant Real epsilon = 1e-6;
    annotation(
      Documentation(info = "<html><p> This record contains kinetic parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002) and in Rosen and Jeppsson (2006). </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 21, 2021 </em></p></html>"));
  end ParametersADM1_kinetic;

  record ParametersADM1_physiochemical
    //General
    parameter Real pKa_va = 4.86 "- log10Ka valerate at 298K";
    parameter Real pKa_bu = 4.82 "- log10Ka butyrate at 298K";
    parameter Real pKa_pro = 4.88 "- log10Ka propionate at 298K";
    parameter Real pKa_ac = 4.76 "- log10Ka acetate at 298K";
    parameter Real pKa_co2 = 6.35 "- log10Ka CO2 at 298K";
    parameter Real pKa_nh3 = 9.25 "- log10ka NH4+ at 298K ";
    parameter Real pKa_h2o = 14 "- log10ka water at 298K ";
    constant Real deltaH0_Ka_co2(unit = "J/kmol") = 7646 "enthalpy of reaction CO2->HCO3";
    constant Real deltaH0_Ka_nh4(unit = "J/kmol") = 51965 "enthalpy of reaction NH4->NH3";
    constant Real deltaH0_Ka_h2o(unit = "J/kmol") = 55900 "enthalpy of reaction H2O->OH+H+";
    constant Real deltaH0_KH_ch4(unit = "J/kmol") = -14240 "enthalpy of reaction of CH4gas->CH4liq";
    constant Real deltaH0_KH_co2(unit = "J/kmol") = -19410 "enthalpy of reaction of CO2gas->CO2liq";
    constant Real deltaH0_KH_h2(unit = "J/kmol") = -4180 "enthalpy of reaction of H2gas->H2liq";
    parameter Real coeffHch4(unit = "kmol/m3/bar") = 0.0014;
    parameter Real coeffHco2(unit = "kmol/m3/bar") = 0.035;
    parameter Real coeffHh2(unit = "kmol/m3/bar") = 0.00078;
    parameter Real coeffph20_T(unit = "K") = 5290;
    parameter Real coeffph20_p(unit = "bar") = 0.0313;
    // Acidity constants (previously defined as "Real")
    Real Ka_va = 10 ^ (-pKa_va) "valerate acidity constant without temperature correction - unit = M";
    Real Ka_bu = 10 ^ (-pKa_bu) "butyrate acidity constant without temperature correction - unit = M";
    Real Ka_pro = 10 ^ (-pKa_pro) "propionate acidity constant without temperature correction - unit = M";
    Real Ka_ac = 10 ^ (-pKa_ac) "acetate acidity constant without temperature correction - unit = M";
    // Kinetic constant for acid-base reactions: set to be at least three orders of magnitude higher than the fastest time constant of the system
    parameter Real k_AB_va(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_bu(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_pro(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_ac(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_co2(unit = "1/d/(kmol/m3)") = 1e10;
    parameter Real k_AB_IN(unit = "1/d/(kmol/m3)") = 1e10;
    // Conversion factors for UM
    parameter Real convKa(unit = "kmol/m3") = 1;
    annotation(
      Documentation(info = "<html><p> This record contains physiochemical parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002) and in Rosen and Jeppsson (2006). </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end ParametersADM1_physiochemical;

  record StateVariablesADM1
    //Biomass
    Real X_su(fixed = true, start = 0.61)"0.45364";
    Real X_aa(fixed = true, start = 0.85)"0.482186";
    Real X_fa(fixed = true, start = 0.45)"0.1002";
    Real X_c4(fixed = true, start = 0.23)"0.205457";
    Real X_pro(fixed = true, start = 0.1)"0.00906";
    Real X_ac(fixed = true, start = 0.04)"0.414792";
    Real X_h2(fixed = true, start = 0.36)"0.1845";
    //Particulate substrate
    Real X_c(fixed = true, start = 0.29881)"0.29881";
    Real X_i(fixed = true, start = 4.105)"14.105";
    Real X_ch(fixed = true, start = 0.0276983)"0.0276983";
    Real X_pr(fixed = true, start = 0.0339372)"0.0339372";
    Real X_li(fixed = true, start = 0.00093818)"0.00093818";
    //Soluble substrate
    Real S_i(fixed = true, start = 0.350557);
    Real S_su(fixed = true, start = 0.0106521);
    Real S_aa(fixed = true, start = 0.00441609);
    Real S_fa(fixed = true, start = 0.0733387);
    Real S_va(fixed = true, start = 0) "8/10**";
    Real S_bu(fixed = true, start = 2.10e-02) "8/10**";
    Real S_pro(fixed = true, start = 0) "8/10**";
    Real S_ac(fixed = true, start = 1.13e-01) "8/10**";
    Real S_vam(fixed = true, start = 0.00e+00) "8/10";
    Real S_bum(fixed = true, start = 1.30e-04) "8/10";
    Real S_prom(fixed = true, start = 0.00e+00) "8/10";
    Real S_acm(fixed = true, start = 0.001757) "8/10";
    //Inorganic soluble components
    Real S_h2(fixed = true, start = 2.007e-07);
    Real S_ch4(fixed = true, start = 0.04459);
    Real S_ic(fixed = true, start = 8.07e-02) "8/10";
    Real S_in(fixed = true, start = 3.22e-02) "8/10";
    Real S_cat(fixed = true, start = 0.0436);
    Real S_an(fixed = false, start = 0.0204);
    Real S_hco3(fixed = false, start = 7.04e-02) "8/10";
    Real S_nh3(fixed = true, start = 5.76e-04) "8/10";
    Real S_nh4(fixed = false, start = 3.16e-02) "8/10";
    Real S_co2(fixed = true, start = 1.03e-02) "8/10";
    Real pH(fixed = false, start = 7.3);
    Real S_h(fixed = true, start = 7.41e-08) "8/10";
    Real S_oh(fixed = false, start = 3.46e-07) "8/10";
    Real Theta(fixed = false, start = 0.02);
    //Gas components
    Real S_gas_h2(fixed = false, start = 1.3486e-5);
    Real S_gas_ch4(fixed = true, start = 1.82381);
    Real S_gas_co2(fixed = true, start = 0.009974);
    Real p_gas_h2(fixed = false, start = 1.54075e-05);
    Real p_gas_ch4(fixed = false, start = 0.582185);
    Real p_gas_co2(fixed = false, start = 0.382985);
    //Other variables
    Real P_gas(fixed = true, start = 1.014);
    Real Q_gas(fixed = false, start = 0);
    Real Q_gas_N(fixed = false, start = 0);
    Real CH4_cum(fixed = true, start = 0);
    //Temperature dependant parameters
    Real k_hyd_ch_T;
    Real k_hyd_pr_T;
    Real k_hyd_li_T;
    Real k_m_su_T;
    Real k_m_aa_T;
    Real k_m_fa_T;
    Real k_m_pro_T;
  //Real k_m_c4_T; not found
    Real k_m_ac_T;
    Real k_m_h2_T;
    Real Ks_su_T;
    Real Ks_aa_T;
    Real Ks_fa_T;
    Real Ks_pro_T;
  //Real Ks_c4_T; not found
    Real Ks_ac_T;
    Real Ks_h2_T;  
    Real k_dec_su_T;
    Real k_dec_aa_T;
    Real k_dec_fa_T;
    Real k_dec_pro_T;
  //Real k_dec_c4_T; not found
    Real k_dec_ac_T;
    Real k_dec_h2_T;
    Real Ka_co2(fixed = false, start = 4.94e-7);
    Real Ka_nh4(fixed = false, start = 1.11e-9);
    Real Ka_h2o(fixed = false, start = 2.08e-14);
    Real KH_ch4(fixed = false, start = 0.00116);
    Real KH_co2(fixed = false, start = 0.0271);
    Real KH_h2(fixed = false, start = 7.38e-4);
    Real p_gas_h2o(fixed = false, start = 0.0557);
    // Inorganic carbon coefficients on processes
    Real v1;
    Real v2;
    Real v3;
    Real v4;
    Real v5;
    Real v6;
    Real v7;
    Real v8;
    Real v9;
    Real v10;
    Real v11;
    Real v12;
    Real v13;
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
    annotation(
      Documentation(info = "<html><p> This record contains ADM1 state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end StateVariablesADM1;

  record OtherVariables_MassBalance
    Real V_in_cum(fixed = true, start = 0);
    Real COD_S(fixed = false, start = 0);
    Real COD_X(fixed = false, start = 0);
    Real COD_balance_in(fixed = false, start = 0);
    Real COD_balance_in_cum(fixed = true, start = 0);
    Real COD_balance_out(fixed = false, start = 0);
    Real COD_balance_out_cum(fixed = true, start = 0);
    Real COD_balance_gas(fixed = false, start = 0);
    Real COD_balance_gas_cum(fixed = true, start = 0);
    Real IC_balance_in(fixed = false, start = 0);
    Real IC_balance_in_cum(fixed = true, start = 0);
    Real IC_balance_out(fixed = false, start = 0);
    Real IC_balance_out_cum(fixed = true, start = 0);
    Real IC_balance_gas(fixed = false, start = 0);
    Real IC_balance_gas_cum(fixed = true, start = 0);
    Real IN_balance_in(fixed = false, start = 0);
    Real IN_balance_in_cum(fixed = true, start = 0);
    Real IN_balance_out(fixed = false, start = 0);
    Real IN_balance_out_cum(fixed = true, start = 0);
    Real HRT(fixed = false, start = 0);
    Real OLR(fixed = false, start = 0);
    annotation(
      Documentation(info = "<html><p> This record contains other state variables used for mass balances. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end OtherVariables_MassBalance;

  record OtherVariables_Discharge
    Real Alk(fixed = false, start = 0);
    Real VFA(fixed = false, start = 0);
    Real FOS_TAC(fixed = false, start = 0);
    Real VS(fixed = false, start = 0);
    Real N_NH4NH3(fixed = false, start = 0);
    Real COD_tot(fixed = false, start = 0);
    annotation(
      Documentation(info = "<html><p> This record contains other state variables used for comparison with experimental measurements on digestate. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end OtherVariables_Discharge;

  record OtherVariables_GasMeter
    Real x_ch4(fixed = false, start = 0);
    Real x_co2(fixed = false, start = 0);
    Real x_h2(fixed = false, start = 0);
    Real Q_ch4_N(fixed = false, start = 0);
    Real Q_co2_N(fixed = false, start = 0);
    Real Q_h2_N(fixed = false, start = 0);
      annotation(
      Documentation(info = "<html><p> This record contains other state variables used for comparison with experimental biogas measurements. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> October 12, 2021 </em></p></html>"));
  end OtherVariables_GasMeter;

  package Interfaces
    connector Feed
      flow Real Q;
      Real S_su;
      Real S_aa;
      Real S_fa;
      Real S_va;
      Real S_bu;
      Real S_pro;
      Real S_ac;
      Real S_h2;
      Real S_ch4;
      Real S_ic;
      Real S_in;
      Real S_i;
      Real S_cat;
      Real S_an;
      Real X_c;
      Real X_ch;
      Real X_pr;
      Real X_li;
      Real X_su;
      Real X_aa;
      Real X_fa;
      Real X_c4;
      Real X_pro;
      Real X_ac;
      Real X_h2;
      Real X_i;
      Real f_si_xc;
      Real f_xi_xc;
      Real f_ch_xc;
      Real f_pr_xc;
      Real f_li_xc;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end Feed;

    connector Digestate
      flow Real Q;
      Real S_su;
      Real S_aa;
      Real S_fa;
      Real S_va;
      Real S_bu;
      Real S_pro;
      Real S_ac;
      Real S_h2;
      Real S_ch4;
      Real S_ic;
      Real S_in;
      Real S_i;
      Real S_cat;
      Real S_an;
      Real X_c;
      Real X_ch;
      Real X_pr;
      Real X_li;
      Real X_su;
      Real X_aa;
      Real X_fa;
      Real X_c4;
      Real X_pro;
      Real X_ac;
      Real X_h2;
      Real X_i;
      Real S_hco3;
      Real S_co2;
      Real S_h;
      Real S_oh;
      Real S_nh3;
      Real S_nh4;
      Real S_acm;
      Real S_prom;
      Real S_bum;
      Real S_vam;
      Real S_gas_h2;
      Real S_gas_ch4;
      Real S_gas_co2;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 172, 108}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {255, 172, 108}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end Digestate;

    connector Gas
      flow Real Q_gas_N;
      Real p_gas_h2o;
      Real p_gas_h2;
      Real p_gas_ch4;
      Real p_gas_co2;
      Real P_gas;
      annotation(
        Diagram(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}));
    end Gas;
  end Interfaces;

  package Icons
    partial block FeedSource1
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "Sludge"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {191, 95, 0}, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}, endAngle = 360), Rectangle(origin = {-2, 0}, lineColor = {191, 95, 0}, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.24365, -0.168094}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {191, 95, 0}, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end FeedSource1;

    partial block FeedSource2
      annotation(
        Icon(graphics = {Text(origin = {0, 36.4211}, extent = {{-80, 51.5789}, {80, 31.5789}}, textString = "Yogurth"), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}, endAngle = 360), Line(origin = {-1.66045, 0.41511}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {255, 247, 157}, fillColor = {255, 247, 157}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Rectangle(origin = {-2, 0}, lineColor = {255, 247, 157}, fillColor = {255, 247, 157}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Polygon(origin = {0, 4}, lineColor = {255, 247, 157}, fillColor = {255, 247, 157}, fillPattern = FillPattern.Solid, points = {{0, -56}, {-14, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {0, -54}, {0, -56}})}));
    end FeedSource2;

    partial block FeedingTank
      annotation(
        Icon(graphics = {Rectangle(lineColor = {98, 106, 124}, fillColor = {186, 204, 220}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-60, 80}, {60, -80}}), Rectangle(origin = {0, -90}, lineColor = {145, 145, 145}, fillColor = {222, 222, 222}, fillPattern = FillPattern.Solid, lineThickness = 0.5, borderPattern = BorderPattern.Engraved, extent = {{-80, 10}, {80, -10}}, radius = 3), Ellipse(origin = {-2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}, endAngle = 360), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Ellipse(origin = {2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}, endAngle = 360), Line(origin = {0.326594, -0.653188}, points = {{0, -34}, {0, 40}, {0, 98}}, thickness = 1), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, thickness = 0.5), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}, endAngle = 360), Ellipse(origin = {0.25, -87.49}, lineColor = {88, 88, 88}, fillColor = {159, 159, 159}, fillPattern = FillPattern.Solid, extent = {{-18.25, 11.49}, {18.25, -11.49}}, endAngle = 360), Line(origin = {-2, -89.55}, points = {{2, -9}, {8, 11}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line(origin = {-11.1441, -80.7082}, points = {{-1, 1}, {3, -3}}), Line(origin = {3.2058, -79.2899}, points = {{-3, 3}, {-3, -3}}), Line(origin = {-12.61, -85.62}, points = {{-5, -3}, {3, -3}}), Line(origin = {11.7335, -74.6764}, points = {{-3, -9}, {1, -5}}), Line(origin = {15.39, -85.62}, points = {{-5, -3}, {3, -3}})}));
    end FeedingTank;

    partial block Digester
      annotation(
        Icon(graphics = {Ellipse(origin = {0, 52}, lineColor = {154, 149, 124}, fillColor = {229, 220, 200}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-64, 36}, {64, -36}}, endAngle = 360), Polygon(origin = {-1, -24}, lineColor = {131, 65, 0}, fillColor = {214, 142, 106}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-63, 78}, {-63, -52}, {1, -70}, {65, -52}, {65, 64}, {65, 78}, {-63, 78}}), Ellipse(lineColor = {85, 0, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}, endAngle = 360), Line(points = {{10, -36}, {2, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(origin = {0.33, -0.65}, points = {{0, -34}, {0, 40}, {0, 54}}, color = {85, 0, 0}, thickness = 1), Ellipse(origin = {2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}, endAngle = 360), Ellipse(origin = {-2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}, endAngle = 360)}));
    end Digester;

    partial block SludgeDischarge
      annotation(
        Icon(graphics = {Rectangle(origin = {2, 34}, lineColor = {127, 61, 0}, fillColor = {163, 118, 80}, fillPattern = FillPattern.Solid, extent = {{-36, -43}, {97.5, -80}}), Polygon(origin = {6, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-62, 18}, {-50, 26}, {-50, 10}, {-62, 18}}), Rectangle(origin = {-3.33, 24.67}, lineColor = {122, 122, 122}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-76.67, 1.33}, {-30.67, -6.67}}), Line(origin = {3.27, 33.8}, points = {{-34, -14}, {-30, -14}, {-24, -16}, {-20, -20}, {-16, -26}, {-12, -34}, {-12, -42}}, color = {163, 118, 80}, thickness = 1.75), Polygon(origin = {4, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-72, 26}, {-72, 10}, {-60, 18}, {-72, 26}}), Line(origin = {3.97819, 21.734}, points = {{-60, 20}, {-60, 4}}, thickness = 1), Line(origin = {2.06, 33.9318}, points = {{-36, -16}, {-36, -80}, {98, -80}, {98, -8}}, thickness = 0.5)}));
    end SludgeDischarge;

    partial block GasMeter
      annotation(
        Icon(graphics = {Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Ellipse(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-12, -12}, {12, 12}}, endAngle = 360), Ellipse(fillColor = {252, 255, 184}, fillPattern = FillPattern.Solid, extent = {{-70, -70}, {70, 70}}, endAngle = 360), Line(points = {{-22.9, 32.8}, {-40.2, 57.3}}), Ellipse(fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-7, -7}, {7, 7}}, endAngle = 360), Line(points = {{-37.6, 13.7}, {-65.8, 23.9}}), Line(visible = false, points = {{55, -85}, {-60, -85}}, color = {0, 128, 255}), Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Line(points = {{22.9, 32.8}, {40.2, 57.3}}), Line(points = {{37.6, 13.7}, {65.8, 23.9}}), Line(points = {{0, 70}, {0, 40}})}));
    end GasMeter;

    partial block ProbeT
      annotation(
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Line(origin = {0.195359, 0}, points = {{50, 0}, {88, 0}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "T"), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5)}));
    end ProbeT;

    partial block Probe_measurements
      annotation(
        Diagram(graphics = {Line(points = {{0, -50}, {0, -90}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Text(extent = {{-36, -10}, {36, -32}}, textString = "Measured"), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5)}),
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, -50}, {0, -90}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "Measured"), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5)}));
    end Probe_measurements;
  end Icons;

  package BlockLibrary
    model Feed_Source_1
      extends ADM1.Icons.FeedSource1;
      ADM1.Interfaces.Feed Sludge_Out annotation(
        Placement(visible = true, transformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable Sludge_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/Input_Conc_Feed1_ADM1_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-30, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable Sludge_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/Input_Q_Feed1_ADM1.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-72, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable Xc_fractionation_1(columns = integer({2, 3, 4, 5, 6}),extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/Input_fractionation_Xc_1.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0,table = [0, 0; 1, 1; 2, 4], tableName = "Input1_fractionation_Xc", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true)  annotation(
        Placement(visible = true, transformation(origin = {-48, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      Sludge_Out.Q = -Sludge_flowrate.y[1];
      Sludge_Out.S_su = Sludge_concentrations.y[1];
      Sludge_Out.S_aa = Sludge_concentrations.y[2];
      Sludge_Out.S_fa = Sludge_concentrations.y[3];
      Sludge_Out.S_va = Sludge_concentrations.y[4];
      Sludge_Out.S_bu = Sludge_concentrations.y[5];
      Sludge_Out.S_pro = Sludge_concentrations.y[6];
      Sludge_Out.S_ac = Sludge_concentrations.y[7];
      Sludge_Out.S_h2 = Sludge_concentrations.y[8];
      Sludge_Out.S_ch4 = Sludge_concentrations.y[9];
      Sludge_Out.S_ic = Sludge_concentrations.y[10];
      Sludge_Out.S_in = Sludge_concentrations.y[11];
      Sludge_Out.S_i = Sludge_concentrations.y[12];
      Sludge_Out.S_cat = Sludge_concentrations.y[13];
      Sludge_Out.S_an = Sludge_concentrations.y[14];
      Sludge_Out.X_c = Sludge_concentrations.y[15];
      Sludge_Out.X_ch = Sludge_concentrations.y[16];
      Sludge_Out.X_pr = Sludge_concentrations.y[17];
      Sludge_Out.X_li = Sludge_concentrations.y[18];
      Sludge_Out.X_su = Sludge_concentrations.y[19];
      Sludge_Out.X_aa = Sludge_concentrations.y[20];
      Sludge_Out.X_fa = Sludge_concentrations.y[21];
      Sludge_Out.X_c4 = Sludge_concentrations.y[22];
      Sludge_Out.X_pro = Sludge_concentrations.y[23];
      Sludge_Out.X_ac = Sludge_concentrations.y[24];
      Sludge_Out.X_h2 = Sludge_concentrations.y[25];
      Sludge_Out.X_i = Sludge_concentrations.y[26];
      Sludge_Out.f_si_xc = Xc_fractionation_1.y[1];
      Sludge_Out.f_xi_xc = Xc_fractionation_1.y[2];
      Sludge_Out.f_ch_xc = Xc_fractionation_1.y[3];
      Sludge_Out.f_pr_xc = Xc_fractionation_1.y[4];
      Sludge_Out.f_li_xc = Xc_fractionation_1.y[5];
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Feed_Source_1;

    model Feed_Source_2
      extends ADM1.Icons.FeedSource2;
      //extends ADM1.StateVariablesADM1;
      Interfaces.Feed Yogurth_Out annotation(
        Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable Yogurth_flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/Input_Q_Feed2_ADM1.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-72, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable Yogurth_concentrations(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/Input_Conc_Feed2_ADM1.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Conc_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-48, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable Xc_fractionation_2(columns = integer({2, 3, 4, 5, 6}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/Input_fractionation_Xc_2.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input2_fractionation_Xc", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-62, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      Yogurth_Out.Q = -Yogurth_flowrate.y[1];
      Yogurth_Out.S_su = Yogurth_concentrations.y[1];
      Yogurth_Out.S_aa = Yogurth_concentrations.y[2];
      Yogurth_Out.S_fa = Yogurth_concentrations.y[3];
      Yogurth_Out.S_va = Yogurth_concentrations.y[4];
      Yogurth_Out.S_bu = Yogurth_concentrations.y[5];
      Yogurth_Out.S_pro = Yogurth_concentrations.y[6];
      Yogurth_Out.S_ac = Yogurth_concentrations.y[7];
      Yogurth_Out.S_h2 = Yogurth_concentrations.y[8];
      Yogurth_Out.S_ch4 = Yogurth_concentrations.y[9];
      Yogurth_Out.S_ic = Yogurth_concentrations.y[10];
      Yogurth_Out.S_in = Yogurth_concentrations.y[11];
      Yogurth_Out.S_i = Yogurth_concentrations.y[12];
      Yogurth_Out.S_cat = Yogurth_concentrations.y[13];
      Yogurth_Out.S_an = Yogurth_concentrations.y[14];
      Yogurth_Out.X_c = Yogurth_concentrations.y[15];
      Yogurth_Out.X_ch = Yogurth_concentrations.y[16];
      Yogurth_Out.X_pr = Yogurth_concentrations.y[17];
      Yogurth_Out.X_li = Yogurth_concentrations.y[18];
      Yogurth_Out.X_su = Yogurth_concentrations.y[19];
      Yogurth_Out.X_aa = Yogurth_concentrations.y[20];
      Yogurth_Out.X_fa = Yogurth_concentrations.y[21];
      Yogurth_Out.X_c4 = Yogurth_concentrations.y[22];
      Yogurth_Out.X_pro = Yogurth_concentrations.y[23];
      Yogurth_Out.X_ac = Yogurth_concentrations.y[24];
      Yogurth_Out.X_h2 = Yogurth_concentrations.y[25];
      Yogurth_Out.X_i = Yogurth_concentrations.y[26];
      Yogurth_Out.f_si_xc = Xc_fractionation_2.y[1];
      Yogurth_Out.f_xi_xc = Xc_fractionation_2.y[2];
      Yogurth_Out.f_ch_xc = Xc_fractionation_2.y[3];
      Yogurth_Out.f_pr_xc = Xc_fractionation_2.y[4];
      Yogurth_Out.f_li_xc = Xc_fractionation_2.y[5];
    end Feed_Source_2;

    model Feeding_Tank
      extends ADM1.Icons.FeedingTank;
      ADM1.Interfaces.Feed Sludge_In annotation(
        Placement(visible = true, transformation(origin = {-80, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-72, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1.Interfaces.Feed Yogurth_In annotation(
        Placement(visible = true, transformation(origin = {-78, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-72, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1.Interfaces.Feed FeedMix_Out annotation(
        Placement(visible = true, transformation(origin = {80, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {72, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      Sludge_In.Q + Yogurth_In.Q + FeedMix_Out.Q = 0;
      (Sludge_In.S_su * Sludge_In.Q + Yogurth_In.S_su * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_su;
      (Sludge_In.S_aa * Sludge_In.Q + Yogurth_In.S_aa * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_aa;
      (Sludge_In.S_fa * Sludge_In.Q + Yogurth_In.S_fa * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_fa;
      (Sludge_In.S_va * Sludge_In.Q + Yogurth_In.S_va * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_va;
      (Sludge_In.S_bu * Sludge_In.Q + Yogurth_In.S_bu * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_bu;
      (Sludge_In.S_pro * Sludge_In.Q + Yogurth_In.S_pro * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_pro;
      (Sludge_In.S_ac * Sludge_In.Q + Yogurth_In.S_ac * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_ac;
      (Sludge_In.S_h2 * Sludge_In.Q + Yogurth_In.S_h2 * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_h2;
      (Sludge_In.S_ch4 * Sludge_In.Q + Yogurth_In.S_ch4 * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_ch4;
      (Sludge_In.S_ic * Sludge_In.Q + Yogurth_In.S_ic * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_ic;
      (Sludge_In.S_in * Sludge_In.Q + Yogurth_In.S_in * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_in;
      (Sludge_In.S_i * Sludge_In.Q + Yogurth_In.S_i * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_i;
      (Sludge_In.S_cat * Sludge_In.Q + Yogurth_In.S_cat * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_cat;
      (Sludge_In.S_an * Sludge_In.Q + Yogurth_In.S_an * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.S_an;
      (Sludge_In.X_c * Sludge_In.Q + Yogurth_In.X_c * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_c;
      (Sludge_In.X_ch * Sludge_In.Q + Yogurth_In.X_ch * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_ch;
      (Sludge_In.X_pr * Sludge_In.Q + Yogurth_In.X_pr * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_pr;
      (Sludge_In.X_li * Sludge_In.Q + Yogurth_In.X_li * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_li;
      (Sludge_In.X_su * Sludge_In.Q + Yogurth_In.X_su * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_su;
      (Sludge_In.X_aa * Sludge_In.Q + Yogurth_In.X_aa * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_aa;
      (Sludge_In.X_fa * Sludge_In.Q + Yogurth_In.X_fa * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_fa;
      (Sludge_In.X_c4 * Sludge_In.Q + Yogurth_In.X_c4 * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_c4;
      (Sludge_In.X_pro * Sludge_In.Q + Yogurth_In.X_pro * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_pro;
      (Sludge_In.X_ac * Sludge_In.Q + Yogurth_In.X_ac * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_ac;
      (Sludge_In.X_h2 * Sludge_In.Q + Yogurth_In.X_h2 * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_h2;
      (Sludge_In.X_i * Sludge_In.Q + Yogurth_In.X_i * Yogurth_In.Q) / (Sludge_In.Q + Yogurth_In.Q) = FeedMix_Out.X_i;
      Sludge_In.f_si_xc = FeedMix_Out.f_si_xc;
      Sludge_In.f_xi_xc = FeedMix_Out.f_xi_xc;
      Sludge_In.f_ch_xc = FeedMix_Out.f_ch_xc;
      Sludge_In.f_pr_xc = FeedMix_Out.f_pr_xc;
      Sludge_In.f_li_xc = FeedMix_Out.f_li_xc;   
    end Feeding_Tank;

    model Digester
      extends ADM1.Icons.Digester;
      extends ADM1.ParametersADM1_operational;
      extends ADM1.ParametersADM1_stoichiometric;
      extends ADM1.ParametersADM1_kinetic;
      extends ADM1.ParametersADM1_physiochemical;
      extends ADM1.StateVariablesADM1;
      extends ADM1.OtherVariables_MassBalance;
      ADM1.Interfaces.Feed FeedMix_In annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1.Interfaces.Digestate Digestate_Out annotation(
        Placement(visible = true, transformation(origin = {72, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1.Interfaces.Gas Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
//TEMPERATURE DEPENDENT PARAMETERS
//Acidity constants with temperature correction
      Ka_co2 = 10 ^ (-pKa_co2) * exp(deltaH0_Ka_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10 ^ (-pKa_nh3) * exp(deltaH0_Ka_nh4 / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10 ^ (-pKa_h2o) * exp(deltaH0_Ka_h2o / (R * 100) * (1 / T_ref - 1 / T_op)) * convKa "water acidity constant with temperature correction - unit = M^2";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4 * exp(deltaH0_KH_ch4 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2 * exp(deltaH0_KH_co2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2 * exp(deltaH0_KH_h2 / (R * 100) * (1 / T_ref - 1 / T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
//Others with temperature correction
      p_gas_h2o = coeffph20_p * exp(coeffph20_T * (1 / T_ref - 1 / T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//Kinetic
      k_hyd_ch_T = k_hyd_ch * exp(th_k_hyd * (T_op - T_ref_k));
      k_hyd_pr_T = k_hyd_pr * exp(th_k_hyd*(T_op - T_ref_k));
      k_hyd_li_T = k_hyd_li * exp(th_k_hyd*(T_op - T_ref_k));
      k_m_su_T =  k_m_su * exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa * exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa * exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro * exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac * exp(th_k_m_ac * (T_op - T_ref_k));
      k_m_h2_T = k_m_h2 * exp(th_k_m_h2*(T_op - T_ref_k));
      Ks_su_T = Ks_su * exp(th_Ks_su*(T_op - T_ref_k));
      Ks_aa_T = Ks_aa * exp(th_Ks_aa*(T_op - T_ref_k));
      Ks_fa_T = Ks_fa * exp(th_Ks_fa*(T_op - T_ref_k));
      Ks_pro_T = Ks_pro * exp(th_Ks_pro*(T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac * exp(th_Ks_ac * (T_op - T_ref_k));
      Ks_h2_T = Ks_h2 * exp(th_Ks_h2*(T_op - T_ref_k));  
      k_dec_su_T = k_dec_su * exp(th_k_dec_su*(T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa * exp(th_k_dec_aa*(T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa * exp(th_k_dec_fa*(T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro * exp(th_k_dec_pro*(T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac * exp(th_k_dec_ac * (T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2 * exp(th_k_dec_h2*(T_op - T_ref_k));
//INHIBITION
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
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-C_xc) + FeedMix_In.f_si_xc * C_si + FeedMix_In.f_ch_xc * C_ch + FeedMix_In.f_pr_xc * C_pr + FeedMix_In.f_li_xc * C_li + FeedMix_In.f_xi_xc * C_xi;
      v2 = (-C_ch) + C_su;
      v3 = (-C_pr) + C_aa;
      v4 = (-C_li) + (1 - f_fa_li) * C_su + f_fa_li * C_fa;
      v5 = (-C_su) + (1 - Y_su) * (f_bu_su * C_bu + f_pro_su * C_pro + f_ac_su * C_ac) + Y_su * C_bac;
      v6 = (-C_aa) + (1 - Y_aa) * (f_va_aa * C_va + f_bu_aa * C_bu + f_pro_aa * C_aa + f_ac_aa * C_aa) + Y_aa * C_bac;
      v7 = (-C_fa) + (1 - Y_fa) * 0.7 * C_ac + Y_fa * C_bac;
      v8 = (-C_va) + (1 - Y_c4) * 0.54 * C_pro + (1 - Y_c4) * 0.31 * C_ac + Y_c4 * C_bac;
      v9 = (-C_bu) + (1 - Y_c4) * 0.8 * C_ac + Y_c4 * C_bac;
      v10 = (-C_pro) + (1 - Y_pro) * 0.57 * C_ac + Y_pro * C_bac;
      v11 = (-C_ac) + (1 - Y_ac) * C_ch4 + Y_ac * C_bac;
      v12 = (1 - Y_h2) * C_ch4 + Y_h2 * C_bac;
      v13 = (-C_bac) + C_xc;
//RATES
//Biochemical process rates
      r1 = k_dis * X_c;
      r2 = k_hyd_ch_T * X_ch;
      r3 = k_hyd_pr_T * X_pr;
      r4 = k_hyd_li_T * X_li;
      r5 = k_m_su_T * S_su / (S_su + Ks_su_T) * X_su * I_5;
      r6 = k_m_aa_T * S_aa / (S_aa + Ks_aa_T) * X_aa * I_6;
      r7 = k_m_fa_T * S_fa / (S_fa + Ks_fa_T) * X_fa * I_7;
      r8 = k_m_c4 * S_va / (S_va + Ks_c4) * X_c4 * S_va / (S_bu + S_va + epsilon) * I_8;
      r9 = k_m_c4 * S_bu / (S_bu + Ks_c4) * X_c4 * S_bu / (S_bu + S_va + epsilon) * I_9;
      r10 = k_m_pro_T * S_pro / (S_pro + Ks_pro_T) * X_pro * I_10;
      r11 = k_m_ac_T * S_ac / (S_ac + Ks_ac_T) * X_ac * I_11;
      r12 = k_m_h2_T * S_h2 / (S_h2 + Ks_h2_T) * X_h2 * I_12;
      r13 = k_dec_su_T * X_su;
      r14 = k_dec_aa_T * X_aa;
      r15 = k_dec_fa_T * X_fa;
      r16 = k_dec_c4 * X_c4;
      r17 = k_dec_pro_T * X_pro;
      r18 = k_dec_ac_T * X_ac;
      r19 = k_dec_h2_T * X_h2;
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
//WATER PHASE EQUATIONS
      FeedMix_In.Q + Digestate_Out.Q = 0;
//Particulate matter
      24 * 3600 * der(X_c) = FeedMix_In.Q / V_liq * (FeedMix_In.X_c - X_c) - r1 + r13 + r14 + r15 + r16 + r17 + r18 + r19;
      24 * 3600 * der(X_ch) = FeedMix_In.Q / V_liq * (FeedMix_In.X_ch - X_ch) + FeedMix_In.f_ch_xc * r1 - r2;
      24 * 3600 * der(X_pr) = FeedMix_In.Q / V_liq * (FeedMix_In.X_pr - X_pr) + FeedMix_In.f_pr_xc * r1 - r3;
      24 * 3600 * der(X_li) = FeedMix_In.Q / V_liq * (FeedMix_In.X_li - X_li) + FeedMix_In.f_li_xc * r1 - r4;
      24 * 3600 * der(X_i) = FeedMix_In.Q / V_liq * (FeedMix_In.X_i - X_i) + FeedMix_In.f_xi_xc * r1;
//Soluble matter
      24 * 3600 * der(S_i) = FeedMix_In.Q / V_liq * (FeedMix_In.S_i - S_i) + FeedMix_In.f_si_xc * r1;
      24 * 3600 * der(S_su) = FeedMix_In.Q / V_liq * (FeedMix_In.S_su - S_su) + r2 + (1 - f_fa_li) * r4 - r5;
      24 * 3600 * der(S_aa) = FeedMix_In.Q / V_liq * (FeedMix_In.S_aa - S_aa) + r3 - r6;
      24 * 3600 * der(S_fa) = FeedMix_In.Q / V_liq * (FeedMix_In.S_fa - S_fa) + f_fa_li * r4 - r7;
      24 * 3600 * der(S_va) = FeedMix_In.Q / V_liq * (FeedMix_In.S_va - S_va) + (1 - Y_aa) * f_va_aa * r6 - r8;
      24 * 3600 * der(S_bu) = FeedMix_In.Q / V_liq * (FeedMix_In.S_bu - S_bu) + (1 - Y_su) * f_bu_su * r5 + (1 - Y_aa) * f_bu_aa * r6 - r9;
      24 * 3600 * der(S_pro) = FeedMix_In.Q / V_liq * (FeedMix_In.S_pro - S_pro) + (1 - Y_su) * f_pro_su * r5 + (1 - Y_aa) * f_pro_aa * r6 + (1 - Y_c4) * 0.54 * r8 - r10;
      24 * 3600 * der(S_ac) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ac - S_ac) + (1 - Y_su) * f_ac_su * r5 + (1 - Y_aa) * f_ac_aa * r6 + (1 - Y_fa) * 0.7 * r7 + (1 - Y_c4) * 0.31 * r8 + (1 - Y_c4) * 0.8 * r9 + (1 - Y_pro) * 0.57 * r10 - r11;
      24 * 3600 * der(S_h2) = FeedMix_In.Q / V_liq * (FeedMix_In.S_h2 - S_h2) + (1 - Y_su) * f_h2_su * r5 + (1 - Y_aa) * f_h2_aa * r6 + (1 - Y_fa) * 0.3 * r7 + (1 - Y_c4) * 0.15 * r8 + (1 - Y_c4) * 0.2 * r9 + (1 - Y_pro) * 0.43 * r10 - r12 - rt8;
      24 * 3600 * der(S_ch4) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ch4 - S_ch4) + (1 - Y_ac) * r11 + (1 - Y_h2) * r12 - rt9;
      24 * 3600 * der(S_ic) = FeedMix_In.Q / V_liq * (FeedMix_In.S_ic - S_ic) - (v1 * r1 + v2 * r2 + v3 * r3 + v4 * r4 + v5 * r5 + v6 * r6 + v7 * r7 + v8 * r8 + v9 * r9 + v10 * r10 + v11 * r11 + v12 * r12 + v13 * (r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10;
      24 * 3600 * der(S_in) = FeedMix_In.Q / V_liq * (FeedMix_In.S_in - S_in) - Y_su * N_bac * r5 + (N_aa - Y_aa * N_bac) * r6 - Y_fa * N_bac * r7 - Y_c4 * N_bac * r8 - Y_c4 * N_bac * r9 - Y_pro * N_bac * r10 - Y_ac * N_bac * r11 - Y_h2 * N_bac * r12 + (N_bac - N_xc) * (r13 + r14 + r15 + r16 + r17 + r18 + r19) + (N_xc - FeedMix_In.f_xi_xc * N_i - FeedMix_In.f_si_xc * N_i - FeedMix_In.f_pr_xc * N_aa) * r1;
//Biomasses
      24 * 3600 * der(X_su) = FeedMix_In.Q / V_liq * (FeedMix_In.X_su - X_su) + Y_su * r5 - r13;
      24 * 3600 * der(X_aa) = FeedMix_In.Q / V_liq * (FeedMix_In.X_aa - X_aa) + Y_aa * r6 - r14;
      24 * 3600 * der(X_fa) = FeedMix_In.Q / V_liq * (FeedMix_In.X_fa - X_fa) + Y_fa * r7 - r15;
      24 * 3600 * der(X_c4) = FeedMix_In.Q / V_liq * (FeedMix_In.X_c4 - X_c4) + Y_c4 * r8 + Y_c4 * r9 - r16;
      24 * 3600 * der(X_pro) = FeedMix_In.Q / V_liq * (FeedMix_In.X_pro - X_pro) + Y_pro * r10 - r17;
      24 * 3600 * der(X_ac) = FeedMix_In.Q / V_liq * (FeedMix_In.X_ac - X_ac) + Y_ac * r11 - r18;
      24 * 3600 * der(X_h2) = FeedMix_In.Q / V_liq * (FeedMix_In.X_h2 - X_h2) + Y_h2 * r12 - r19;
//Cations and anions
      24 * 3600 * der(S_cat) = FeedMix_In.Q / V_liq * (FeedMix_In.S_cat - S_cat);
      24 * 3600 * der(S_an) = FeedMix_In.Q / V_liq * (FeedMix_In.S_an - S_an);
      24 * 3600 * der(S_vam) = -ra4;
      24 * 3600 * der(S_bum) = -ra5;
      24 * 3600 * der(S_prom) = -ra6;
      24 * 3600 * der(S_acm) = -ra7;
      24 * 3600 * der(S_hco3) = -ra10;
      24 * 3600 * der(S_nh3) = -ra11;
      S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      Theta = S_cat + S_nh4 - S_hco3 - S_acm / Ac_conv - S_prom / Pro_conv - S_bum / Bu_conv - S_vam / Va_conv - S_an;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3;
      S_oh = Ka_h2o * convKa / S_h;
//GAS PHASE EQUATIONS
      24 * 3600 * der(S_gas_h2) = (-S_gas_h2 * Q_gas / V_gas) + rt8 * V_liq / V_gas;
      24 * 3600 * der(S_gas_ch4) = (-S_gas_ch4 * Q_gas / V_gas) + rt9 * V_liq / V_gas;
      24 * 3600 * der(S_gas_co2) = (-S_gas_co2 * Q_gas / V_gas) + rt10 * V_liq / V_gas;
      p_gas_h2 = S_gas_h2 * R * T_op / h2_conv;
      p_gas_ch4 = S_gas_ch4 * R * T_op / ch4_conv;
      p_gas_co2 = S_gas_co2 * R * T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o;
      Q_gas = k_p * (P_gas - P_atm) "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas * 273.15 / T_op / P_atm * P_gas "Biogas rate [m3/d] at standard conditions";
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq / FeedMix_In.Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in / V_liq "Organic Loading Rate [kgCOD/m3/d]";
//CONVERSION FOR INTERFACE "DIGESTATE"
      Digestate_Out.S_su = S_su;
      Digestate_Out.S_aa = S_aa;
      Digestate_Out.S_fa = S_fa;
      Digestate_Out.S_va = S_va;
      Digestate_Out.S_bu = S_bu;
      Digestate_Out.S_pro = S_pro;
      Digestate_Out.S_ac = S_ac;
      Digestate_Out.S_h2 = S_h2;
      Digestate_Out.S_ch4 = S_ch4;
      Digestate_Out.S_ic = S_ic;
      Digestate_Out.S_in = S_in;
      Digestate_Out.S_i = S_i;
      Digestate_Out.S_cat = S_cat;
      Digestate_Out.S_an = S_an;
      Digestate_Out.X_c = X_c;
      Digestate_Out.X_ch = X_ch;
      Digestate_Out.X_pr = X_pr;
      Digestate_Out.X_li = X_li;
      Digestate_Out.X_su = X_su;
      Digestate_Out.X_aa = X_aa;
      Digestate_Out.X_fa = X_fa;
      Digestate_Out.X_c4 = X_c4;
      Digestate_Out.X_pro = X_pro;
      Digestate_Out.X_ac = X_ac;
      Digestate_Out.X_h2 = X_h2;
      Digestate_Out.X_i = X_i;
      Digestate_Out.S_hco3 = S_hco3;
      Digestate_Out.S_co2 = S_co2;
      Digestate_Out.S_h = S_h;
      Digestate_Out.S_oh = S_oh;
      Digestate_Out.S_nh3 = S_nh3;
      Digestate_Out.S_nh4 = S_nh4;
      Digestate_Out.S_acm = S_acm;
      Digestate_Out.S_prom = S_prom;
      Digestate_Out.S_bum = S_bum;
      Digestate_Out.S_vam = S_vam;
      Digestate_Out.S_gas_h2 = S_gas_h2;
      Digestate_Out.S_gas_ch4 = S_gas_ch4;
      Digestate_Out.S_gas_co2 = S_gas_co2;
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.P_gas = P_gas;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//MASS BALANCE
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_aa + X_ac + X_c + X_c4 + X_ch + X_fa + X_h2 + X_i + X_li + X_pr + X_pro + X_su "Particulate COD concentration";
      COD_balance_in = FeedMix_In.Q * (FeedMix_In.S_aa + FeedMix_In.S_ac + FeedMix_In.S_bu + FeedMix_In.S_ch4 + FeedMix_In.S_fa + FeedMix_In.S_h2 + FeedMix_In.S_i + FeedMix_In.S_pro + FeedMix_In.S_su + FeedMix_In.S_va + FeedMix_In.X_aa + FeedMix_In.X_ac + FeedMix_In.X_c4 + FeedMix_In.X_fa + FeedMix_In.X_h2 + FeedMix_In.X_pro + FeedMix_In.X_su + FeedMix_In.X_ch + FeedMix_In.X_c + FeedMix_In.X_i + FeedMix_In.X_li + FeedMix_In.X_pr);
      COD_balance_out = Digestate_Out.Q * (COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N * (p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_h2 / (P_gas - p_gas_h2o) / (R / 16 * 273.15 / 1.01325));
      24 * 3600 * der(CH4_cum) = ((1 - Y_ac) * r11 + (1 - Y_h2) * r12) * V_liq;
      24 * 3600 * der(V_in_cum) = FeedMix_In.Q;
      24 * 3600 * der(COD_balance_in_cum) = COD_balance_in;
      24 * 3600 * der(COD_balance_out_cum) = COD_balance_out;
      24 * 3600 * der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = FeedMix_In.Q * (FeedMix_In.S_ic + C_xc * FeedMix_In.X_c + C_si * FeedMix_In.S_i + C_xi * FeedMix_In.X_i + C_ch * FeedMix_In.X_ch + C_pr * FeedMix_In.X_pr + C_li * FeedMix_In.X_li + C_su * FeedMix_In.S_su + C_aa * FeedMix_In.S_aa + C_fa * FeedMix_In.S_fa + C_va * FeedMix_In.S_va + C_bu * FeedMix_In.S_bu + C_pro * FeedMix_In.S_pro + C_ac * FeedMix_In.S_ac + C_ch4 * FeedMix_In.S_ch4 + C_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IC_balance_out = Digestate_Out.Q * (S_ic + C_xc * X_c + C_si * S_i + C_xi * X_i + C_ch * X_ch + C_pr * X_pr + C_li * X_li + C_su * S_su + C_aa * S_aa + C_fa * S_fa + C_va * S_va + C_bu * S_bu + C_pro * S_pro + C_ac * S_ac + C_ch4 * S_ch4 + C_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2));
      IC_balance_gas = Biogas_Out.Q_gas_N * (C_ch4 * p_gas_ch4 / (P_gas - p_gas_h2o) / (R / 64 * 273.15 / 1.01325) + p_gas_co2 / (P_gas - p_gas_h2o) / R / 273.15 * 1.01325);
      24 * 3600 * der(IC_balance_in_cum) = IC_balance_in;
      24 * 3600 * der(IC_balance_out_cum) = IC_balance_out;
      24 * 3600 * der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = FeedMix_In.Q * (FeedMix_In.S_in + N_xc * FeedMix_In.X_c + N_i * (FeedMix_In.S_i + FeedMix_In.X_i) + N_aa * (FeedMix_In.S_aa + FeedMix_In.X_pr) + N_bac * (FeedMix_In.X_su + FeedMix_In.X_aa + FeedMix_In.X_fa + FeedMix_In.X_c4 + FeedMix_In.X_pro + FeedMix_In.X_ac + FeedMix_In.X_h2));
      IN_balance_out = Digestate_Out.Q * (S_in + N_xc * X_c + N_i * (S_i + X_i) + N_aa * (S_aa + X_pr) + N_bac * (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2));
      24 * 3600 * der(IN_balance_in_cum) = IN_balance_in;
      24 * 3600 * der(IN_balance_out_cum) = IN_balance_out;
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Digester;

    model Sludge_Discharge
      extends ADM1.Icons.SludgeDischarge;
      extends ADM1.ParametersADM1_stoichiometric;
      extends ADM1.ParametersADM1_physiochemical;
      extends ADM1.OtherVariables_Discharge;
      ADM1.Interfaces.Digestate Digestate_In annotation(
        Placement(visible = true, transformation(origin = {-92, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput VS_exp annotation(
        Placement(visible = true, transformation(origin = {-14, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {45, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput Alk_exp annotation(
        Placement(visible = true, transformation(origin = {36, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {1, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput VFA_exp annotation(
        Placement(visible = true, transformation(origin = {84, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {89, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput pH_exp annotation(
        Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-43, -31}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput COD_exp annotation(
        Placement(visible = true, transformation(origin = {10, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {23, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput N_NH4kit_exp annotation(
        Placement(visible = true, transformation(origin = {58, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {67, -1}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
    equation
// Carachteristics of digestate
      Alk = (Digestate_In.S_hco3 + Digestate_In.S_oh + Digestate_In.S_acm / Ac_conv + Digestate_In.S_prom / Pro_conv + Digestate_In.S_bum / Bu_conv + Digestate_In.S_vam / Va_conv) * 50 * 1000 "Alkalinity as mgCaCO3/L";
      VFA = (Digestate_In.S_ac / Ac_conv + Digestate_In.S_pro / Pro_conv + Digestate_In.S_bu / Bu_conv + Digestate_In.S_va / Va_conv) * 60 * 1000 "VFA as mgCH3COOH/L";
      FOS_TAC = VFA / Alk "Ratio between acidity and alkalinity";
      VS = 1 / 1.42 * (Digestate_In.X_su + Digestate_In.X_aa + Digestate_In.X_fa + Digestate_In.X_c4 + Digestate_In.X_pro + Digestate_In.X_ac + Digestate_In.X_h2) + 1 / 1.19 * (Digestate_In.S_su + Digestate_In.X_ch) + 1 / 1.48 * (Digestate_In.S_aa + Digestate_In.X_pr) + 1 / 2.9 * (Digestate_In.S_fa + Digestate_In.X_li) + (Digestate_In.S_i + Digestate_In.X_i) / 1.3 "Volatile Solid content in the digester as gVS/L";
      N_NH4NH3 = Digestate_In.S_in * 14 * 1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = Digestate_In.S_aa + Digestate_In.S_ac + Digestate_In.S_bu + Digestate_In.S_ch4 + Digestate_In.S_fa + Digestate_In.S_h2 + Digestate_In.S_i + Digestate_In.S_pro + Digestate_In.S_su + Digestate_In.S_va + Digestate_In.X_aa + Digestate_In.X_ac + Digestate_In.X_c + Digestate_In.X_c4 + Digestate_In.X_ch + Digestate_In.X_fa + Digestate_In.X_h2 + Digestate_In.X_i + Digestate_In.X_li + Digestate_In.X_pr + Digestate_In.X_pro + Digestate_In.X_su "Total COD concentration as gCOD/L";
    annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));end Sludge_Discharge;

    model Gas_Meter
      extends ADM1.Icons.GasMeter;
      extends ADM1.ParametersADM1_operational;
      extends ADM1.OtherVariables_GasMeter;
      ADM1.Interfaces.Gas Biogas_In annotation(
        Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput CH4_perc_exp annotation(
        Placement(visible = true, transformation(origin = {-44, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-27, 79}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput CO2_perc_exp annotation(
        Placement(visible = true, transformation(origin = {30, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {27, 79}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
    equation
      x_ch4 = Biogas_In.p_gas_ch4 / (Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_co2 = Biogas_In.p_gas_co2 / (Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_h2 = Biogas_In.p_gas_h2 / (Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      Q_ch4_N = Biogas_In.Q_gas_N * x_ch4 * 1000 "Methane rate [L/d] at standard conditions";
      Q_co2_N = Biogas_In.Q_gas_N * x_co2 * 1000 "Carbon dioxide rate [L/d] at standard conditions";
      Q_h2_N = Biogas_In.Q_gas_N * x_h2 * 1000 "Hydrogen rate [L/d] at standard conditions";
    end Gas_Meter;

    model Probe_T
      extends ADM1.Icons.ProbeT;
      Modelica.Blocks.Interfaces.RealOutput y_T annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable temperature(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/Input_T_ADM1.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-70, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(temperature.y[1], y_T) annotation(
        Line(points = {{-63, -44}, {2, -44}, {2, 0}, {96, 0}}, color = {0, 0, 127}));
    end Probe_T;

    model Probe_VS
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Interfaces.RealOutput y_VS annotation(
        Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Sources.CombiTimeTable VS_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbeVS_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 1, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-76, 52}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
      connect(VS_measured.y[1], y_VS) annotation(
        Line(points = {{-70, 52}, {70, 52}, {70, -70}}, color = {0, 0, 127}));
    end Probe_VS;

    model Probe_Alk
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable Alk_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbeAlk_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-84, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_Alk annotation(
        Placement(visible = true, transformation(origin = {-28, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(Alk_measured.y[1], y_Alk) annotation(
        Line(points = {{-72, 10}, {-28, 10}, {-28, -42}}, color = {0, 0, 127}));
    end Probe_Alk;

    model Probe_VFA
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable VFA_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbeVFA_meas.txt", startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {0, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_VFA annotation(
        Placement(visible = true, transformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(y_VFA, VFA_measured.y[1]) annotation(
        Line(points = {{88, 0}, {12, 0}, {12, 84}}, color = {0, 0, 127}));
    end Probe_VFA;

    model Probe_pH
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable pH_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbepH_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-80, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_pH annotation(
        Placement(visible = true, transformation(origin = {10, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(pH_measured.y[1], y_pH) annotation(
        Line(points = {{-68, 58}, {0, 58}, {0, -86}, {10, -86}}, color = {0, 0, 127}));
    end Probe_pH;

    model Probe_NH4_kit
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable NH4_kit_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbeNH4kit_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeNH4kit_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-80, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_NH4 annotation(
        Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(NH4_kit_measured.y[1], y_NH4) annotation(
        Line(points = {{-68, 62}, {0, 62}, {0, -100}}, color = {0, 0, 127}));
    end Probe_NH4_kit;

    model Probe_COD
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable COD_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbeCOD_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCOD_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_COD annotation(
        Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(COD_measured.y[1], y_COD) annotation(
        Line(points = {{-78, 60}, {54, 60}, {54, -96}, {0, -96}}, color = {0, 0, 127}));
      annotation(
        Diagram);
    end Probe_COD;

    model Probe_CH4_perc
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Interfaces.RealOutput y_CH4 annotation(
        Placement(visible = true, transformation(origin = {0, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Sources.CombiTimeTable CH4_perc_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbeCH4perc_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCH4perc_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y_CH4, CH4_perc_measured.y[1]) annotation(
        Line(points = {{0, -92}, {-80, -92}, {-80, 6}}, color = {0, 0, 127}));
    end Probe_CH4_perc;

    model Probe_CO2_perc
      extends ADM1.Icons.Probe_measurements;
      Modelica.Blocks.Interfaces.RealOutput y_CO2 annotation(
        Placement(visible = true, transformation(origin = {0, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Sources.CombiTimeTable CO2_perc_measured(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "D:/Arianna/Documents/Modelica Models/ProbeCO2perc_meas.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCO2perc_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-86, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y_CO2, CO2_perc_measured.y[1]) annotation(
        Line(points = {{0, -94}, {-75, -94}, {-75, 24}}, color = {0, 0, 127}));
    annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));end Probe_CO2_perc;
  end BlockLibrary;

  class SynopticModel
    ADM1.BlockLibrary.Feed_Source_1 feed_Source_1 annotation(
      Placement(visible = true, transformation(origin = {-118, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Feed_Source_2 feed_Source_2 annotation(
      Placement(visible = true, transformation(origin = {-116, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Feeding_Tank feeding_Tank annotation(
      Placement(visible = true, transformation(origin = {-70, 22}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    ADM1.BlockLibrary.Digester digester annotation(
      Placement(visible = true, transformation(origin = {11, 23}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
    ADM1.BlockLibrary.Sludge_Discharge Discharge annotation(
      Placement(visible = true, transformation(origin = {82, -1}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
    ADM1.BlockLibrary.Gas_Meter Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {54, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_T Probe_T annotation(
      Placement(visible = true, transformation(origin = {-30, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_VS Probe_VS annotation(
      Placement(visible = true, transformation(origin = {96, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_Alk Probe_Alk annotation(
      Placement(visible = true, transformation(origin = {74, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_VFA Probe_VFA annotation(
      Placement(visible = true, transformation(origin = {116, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_NH4_kit probe_NH4_kit annotation(
      Placement(visible = true, transformation(origin = {106, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_COD probe_COD annotation(
      Placement(visible = true, transformation(origin = {84, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_pH probe_pH annotation(
      Placement(visible = true, transformation(origin = {40, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_CH4_perc probe_CH4_perc annotation(
      Placement(visible = true, transformation(origin = {40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1.BlockLibrary.Probe_CO2_perc probe_CO2_perc annotation(
      Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(feed_Source_1.Sludge_Out, feeding_Tank.Sludge_In) annotation(
      Line(points = {{-109, 49}, {-99.2, 49}, {-99.2, 36}, {-86, 36}}));
    connect(feed_Source_2.Yogurth_Out, feeding_Tank.Yogurth_In) annotation(
      Line(points = {{-107, 19}, {-107, 26}, {-86, 26}}));
    connect(feeding_Tank.FeedMix_Out, digester.FeedMix_In) annotation(
      Line(points = {{-54, 10}, {-38, 10}, {-38, 33}, {-8, 33}}));
    connect(digester.Digestate_Out, Discharge.Digestate_In) annotation(
      Line(points = {{30, 6}, {55, 6}}));
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{22.5, 42}, {22.5, 56}, {46, 56}}));
    connect(digester.T_op, Probe_T.y_T) annotation(
      Line(points = {{-8, 8}, {-21, 8}, {-21, -2}}, color = {0, 0, 127}));
    connect(Probe_VFA.y_VFA, Discharge.VFA_exp) annotation(
      Line(points = {{116, 19}, {116, 18}, {109, 18}, {109, -1}}, color = {0, 0, 127}));
    connect(Probe_Alk.y_Alk, Discharge.Alk_exp) annotation(
      Line(points = {{74, 17}, {82, 17}, {82, -1}}, color = {0, 0, 127}));
    connect(Probe_VS.y_VS, Discharge.VS_exp) annotation(
      Line(points = {{96, 33}, {96, 18}, {95.5, 18}, {95.5, -1}}, color = {0, 0, 127}));
    connect(probe_COD.y_COD, Discharge.COD_exp) annotation(
      Line(points = {{84, 25}, {89, 25}, {89, -1}}, color = {0, 0, 127}));
    connect(probe_NH4_kit.y_NH4, Discharge.N_NH4kit_exp) annotation(
      Line(points = {{106, 25}, {102, 25}, {102, -1}}, color = {0, 0, 127}));
    connect(probe_pH.y_pH, Discharge.pH_exp) annotation(
      Line(points = {{41, -17}, {64.5, -17}, {64.5, -10}, {69, -10}}, color = {0, 0, 127}));
    connect(Gas_Meter.CH4_perc_exp, probe_CH4_perc.y_CH4) annotation(
      Line(points = {{52, 64}, {40, 64}, {40, 72}}, color = {0, 0, 127}));
    connect(Gas_Meter.CO2_perc_exp, probe_CO2_perc.y_CO2) annotation(
      Line(points = {{56, 64}, {70, 64}, {70, 71}}, color = {0, 0, 127}));
  protected
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization ",
      experiment(StartTime = 0, StopTime = 1.8144e+07, Tolerance = 1e-06, Interval = 86400));
  end SynopticModel;
  annotation(
    uses(Modelica(version = "3.2.3")));
end ADM1;
