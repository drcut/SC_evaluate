; ModuleID = 'kernel.bc'
source_filename = "main.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@intra_warp_index = thread_local local_unnamed_addr global i32 0
@inter_warp_index = thread_local local_unnamed_addr global i32 0
@block_size = external thread_local local_unnamed_addr global i32
@block_size_x = external thread_local local_unnamed_addr global i32
@block_index_x = external thread_local local_unnamed_addr global i32

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z10kernel_eccfPfS_iS_(float %timeinst, float* noalias %d_initvalu, float* noalias %d_finavalu, i32 %valu_offset, float* noalias %d_params) local_unnamed_addr #0 {
entry:
  %timeinst.addr = alloca float, align 4
  %d_initvalu.addr = alloca float*, align 8
  %d_finavalu.addr = alloca float*, align 8
  %valu_offset.addr = alloca i32, align 4
  %d_params.addr = alloca float*, align 8
  %cycleLength = alloca float, align 4
  %offset_1 = alloca i32, align 4
  %offset_2 = alloca i32, align 4
  %offset_3 = alloca i32, align 4
  %offset_4 = alloca i32, align 4
  %offset_5 = alloca i32, align 4
  %offset_6 = alloca i32, align 4
  %offset_7 = alloca i32, align 4
  %offset_8 = alloca i32, align 4
  %offset_9 = alloca i32, align 4
  %offset_10 = alloca i32, align 4
  %offset_11 = alloca i32, align 4
  %offset_12 = alloca i32, align 4
  %offset_13 = alloca i32, align 4
  %offset_14 = alloca i32, align 4
  %offset_15 = alloca i32, align 4
  %offset_16 = alloca i32, align 4
  %offset_17 = alloca i32, align 4
  %offset_18 = alloca i32, align 4
  %offset_19 = alloca i32, align 4
  %offset_20 = alloca i32, align 4
  %offset_21 = alloca i32, align 4
  %offset_22 = alloca i32, align 4
  %offset_23 = alloca i32, align 4
  %offset_24 = alloca i32, align 4
  %offset_25 = alloca i32, align 4
  %offset_26 = alloca i32, align 4
  %offset_27 = alloca i32, align 4
  %offset_28 = alloca i32, align 4
  %offset_29 = alloca i32, align 4
  %offset_30 = alloca i32, align 4
  %offset_31 = alloca i32, align 4
  %offset_32 = alloca i32, align 4
  %offset_33 = alloca i32, align 4
  %offset_34 = alloca i32, align 4
  %offset_35 = alloca i32, align 4
  %offset_36 = alloca i32, align 4
  %offset_37 = alloca i32, align 4
  %offset_38 = alloca i32, align 4
  %offset_39 = alloca i32, align 4
  %offset_40 = alloca i32, align 4
  %offset_41 = alloca i32, align 4
  %offset_42 = alloca i32, align 4
  %offset_43 = alloca i32, align 4
  %offset_44 = alloca i32, align 4
  %offset_45 = alloca i32, align 4
  %offset_46 = alloca i32, align 4
  %d_initvalu_1 = alloca float, align 4
  %d_initvalu_2 = alloca float, align 4
  %d_initvalu_3 = alloca float, align 4
  %d_initvalu_4 = alloca float, align 4
  %d_initvalu_5 = alloca float, align 4
  %d_initvalu_6 = alloca float, align 4
  %d_initvalu_7 = alloca float, align 4
  %d_initvalu_8 = alloca float, align 4
  %d_initvalu_9 = alloca float, align 4
  %d_initvalu_10 = alloca float, align 4
  %d_initvalu_11 = alloca float, align 4
  %d_initvalu_12 = alloca float, align 4
  %d_initvalu_13 = alloca float, align 4
  %d_initvalu_14 = alloca float, align 4
  %d_initvalu_15 = alloca float, align 4
  %d_initvalu_16 = alloca float, align 4
  %d_initvalu_17 = alloca float, align 4
  %d_initvalu_18 = alloca float, align 4
  %d_initvalu_19 = alloca float, align 4
  %d_initvalu_20 = alloca float, align 4
  %d_initvalu_21 = alloca float, align 4
  %d_initvalu_23 = alloca float, align 4
  %d_initvalu_24 = alloca float, align 4
  %d_initvalu_25 = alloca float, align 4
  %d_initvalu_26 = alloca float, align 4
  %d_initvalu_27 = alloca float, align 4
  %d_initvalu_28 = alloca float, align 4
  %d_initvalu_29 = alloca float, align 4
  %d_initvalu_30 = alloca float, align 4
  %d_initvalu_31 = alloca float, align 4
  %d_initvalu_32 = alloca float, align 4
  %d_initvalu_33 = alloca float, align 4
  %d_initvalu_34 = alloca float, align 4
  %d_initvalu_35 = alloca float, align 4
  %d_initvalu_36 = alloca float, align 4
  %d_initvalu_37 = alloca float, align 4
  %d_initvalu_38 = alloca float, align 4
  %d_initvalu_39 = alloca float, align 4
  %d_initvalu_40 = alloca float, align 4
  %pi = alloca float, align 4
  %R = alloca float, align 4
  %Frdy = alloca float, align 4
  %Temp = alloca float, align 4
  %FoRT = alloca float, align 4
  %Cmem = alloca float, align 4
  %Qpow = alloca float, align 4
  %cellLength = alloca float, align 4
  %cellRadius = alloca float, align 4
  %Vcell = alloca float, align 4
  %Vmyo = alloca float, align 4
  %Vsr = alloca float, align 4
  %Vsl = alloca float, align 4
  %Vjunc = alloca float, align 4
  %J_ca_juncsl = alloca float, align 4
  %J_ca_slmyo = alloca float, align 4
  %J_na_juncsl = alloca float, align 4
  %J_na_slmyo = alloca float, align 4
  %Fjunc = alloca float, align 4
  %Fsl = alloca float, align 4
  %Fjunc_CaL = alloca float, align 4
  %Fsl_CaL = alloca float, align 4
  %Cli = alloca float, align 4
  %Clo = alloca float, align 4
  %Ko = alloca float, align 4
  %Nao = alloca float, align 4
  %Cao = alloca float, align 4
  %Mgi = alloca float, align 4
  %ena_junc = alloca float, align 4
  %ena_sl = alloca float, align 4
  %ek = alloca float, align 4
  %eca_junc = alloca float, align 4
  %eca_sl = alloca float, align 4
  %ecl = alloca float, align 4
  %GNa = alloca float, align 4
  %GNaB = alloca float, align 4
  %IbarNaK = alloca float, align 4
  %KmNaip = alloca float, align 4
  %KmKo = alloca float, align 4
  %pNaK = alloca float, align 4
  %GtoSlow = alloca float, align 4
  %GtoFast = alloca float, align 4
  %gkp = alloca float, align 4
  %GClCa = alloca float, align 4
  %GClB = alloca float, align 4
  %KdClCa = alloca float, align 4
  %pNa = alloca float, align 4
  %pCa = alloca float, align 4
  %pK = alloca float, align 4
  %Q10CaL = alloca float, align 4
  %IbarNCX = alloca float, align 4
  %KmCai = alloca float, align 4
  %KmCao = alloca float, align 4
  %KmNai = alloca float, align 4
  %KmNao = alloca float, align 4
  %ksat = alloca float, align 4
  %nu = alloca float, align 4
  %Kdact = alloca float, align 4
  %Q10NCX = alloca float, align 4
  %IbarSLCaP = alloca float, align 4
  %KmPCa = alloca float, align 4
  %GCaB = alloca float, align 4
  %Q10SLCaP = alloca float, align 4
  %Q10SRCaP = alloca float, align 4
  %Vmax_SRCaP = alloca float, align 4
  %Kmf = alloca float, align 4
  %Kmr = alloca float, align 4
  %hillSRCaP = alloca float, align 4
  %ks = alloca float, align 4
  %koCa = alloca float, align 4
  %kom = alloca float, align 4
  %kiCa = alloca float, align 4
  %kim = alloca float, align 4
  %ec50SR = alloca float, align 4
  %Bmax_Naj = alloca float, align 4
  %Bmax_Nasl = alloca float, align 4
  %koff_na = alloca float, align 4
  %kon_na = alloca float, align 4
  %Bmax_TnClow = alloca float, align 4
  %koff_tncl = alloca float, align 4
  %kon_tncl = alloca float, align 4
  %Bmax_TnChigh = alloca float, align 4
  %koff_tnchca = alloca float, align 4
  %kon_tnchca = alloca float, align 4
  %koff_tnchmg = alloca float, align 4
  %kon_tnchmg = alloca float, align 4
  %Bmax_myosin = alloca float, align 4
  %koff_myoca = alloca float, align 4
  %kon_myoca = alloca float, align 4
  %koff_myomg = alloca float, align 4
  %kon_myomg = alloca float, align 4
  %Bmax_SR = alloca float, align 4
  %koff_sr = alloca float, align 4
  %kon_sr = alloca float, align 4
  %Bmax_SLlowsl = alloca float, align 4
  %Bmax_SLlowj = alloca float, align 4
  %koff_sll = alloca float, align 4
  %kon_sll = alloca float, align 4
  %Bmax_SLhighsl = alloca float, align 4
  %Bmax_SLhighj = alloca float, align 4
  %koff_slh = alloca float, align 4
  %kon_slh = alloca float, align 4
  %Bmax_Csqn = alloca float, align 4
  %koff_csqn = alloca float, align 4
  %kon_csqn = alloca float, align 4
  %am = alloca float, align 4
  %bm = alloca float, align 4
  %ah = alloca float, align 4
  %bh = alloca float, align 4
  %aj = alloca float, align 4
  %bj = alloca float, align 4
  %I_Na_junc = alloca float, align 4
  %I_Na_sl = alloca float, align 4
  %I_nabk_junc = alloca float, align 4
  %I_nabk_sl = alloca float, align 4
  %sigma = alloca float, align 4
  %fnak = alloca float, align 4
  %I_nak_junc = alloca float, align 4
  %I_nak_sl = alloca float, align 4
  %I_nak = alloca float, align 4
  %gkr = alloca float, align 4
  %xrss = alloca float, align 4
  %tauxr = alloca float, align 4
  %rkr = alloca float, align 4
  %I_kr = alloca float, align 4
  %pcaks_junc = alloca float, align 4
  %pcaks_sl = alloca float, align 4
  %gks_junc = alloca float, align 4
  %gks_sl = alloca float, align 4
  %eks = alloca float, align 4
  %xsss = alloca float, align 4
  %tauxs = alloca float, align 4
  %I_ks_junc = alloca float, align 4
  %I_ks_sl = alloca float, align 4
  %I_ks = alloca float, align 4
  %kp_kp = alloca float, align 4
  %I_kp_junc = alloca float, align 4
  %I_kp_sl = alloca float, align 4
  %I_kp = alloca float, align 4
  %xtoss = alloca float, align 4
  %ytoss = alloca float, align 4
  %rtoss = alloca float, align 4
  %tauxtos = alloca float, align 4
  %tauytos = alloca float, align 4
  %taurtos = alloca float, align 4
  %I_tos = alloca float, align 4
  %tauxtof = alloca float, align 4
  %tauytof = alloca float, align 4
  %I_tof = alloca float, align 4
  %I_to = alloca float, align 4
  %aki = alloca float, align 4
  %bki = alloca float, align 4
  %kiss = alloca float, align 4
  %I_ki = alloca float, align 4
  %I_ClCa_junc = alloca float, align 4
  %I_ClCa_sl = alloca float, align 4
  %I_ClCa = alloca float, align 4
  %I_Clbk = alloca float, align 4
  %dss = alloca float, align 4
  %taud = alloca float, align 4
  %fss = alloca float, align 4
  %tauf = alloca float, align 4
  %ibarca_j = alloca float, align 4
  %ibarca_sl = alloca float, align 4
  %ibark = alloca float, align 4
  %ibarna_j = alloca float, align 4
  %ibarna_sl = alloca float, align 4
  %I_Ca_junc = alloca float, align 4
  %I_Ca_sl = alloca float, align 4
  %I_Ca = alloca float, align 4
  %I_CaK = alloca float, align 4
  %I_CaNa_junc = alloca float, align 4
  %I_CaNa_sl = alloca float, align 4
  %Ka_junc = alloca float, align 4
  %Ka_sl = alloca float, align 4
  %s1_junc = alloca float, align 4
  %s1_sl = alloca float, align 4
  %s2_junc = alloca float, align 4
  %s3_junc = alloca float, align 4
  %s2_sl = alloca float, align 4
  %s3_sl = alloca float, align 4
  %I_ncx_junc = alloca float, align 4
  %I_ncx_sl = alloca float, align 4
  %I_ncx = alloca float, align 4
  %I_pca_junc = alloca float, align 4
  %I_pca_sl = alloca float, align 4
  %I_pca = alloca float, align 4
  %I_cabk_junc = alloca float, align 4
  %I_cabk_sl = alloca float, align 4
  %I_cabk = alloca float, align 4
  %MaxSR = alloca float, align 4
  %MinSR = alloca float, align 4
  %kCaSR = alloca float, align 4
  %koSRCa = alloca float, align 4
  %kiSRCa = alloca float, align 4
  %RI = alloca float, align 4
  %J_SRCarel = alloca float, align 4
  %J_serca = alloca float, align 4
  %J_SRleak = alloca float, align 4
  %J_CaB_cytosol = alloca float, align 4
  %J_CaB_junction = alloca float, align 4
  %J_CaB_sl = alloca float, align 4
  %oneovervsr = alloca float, align 4
  %I_Na_tot_junc = alloca float, align 4
  %I_Na_tot_sl = alloca float, align 4
  %oneovervsl = alloca float, align 4
  %I_K_tot = alloca float, align 4
  %I_Ca_tot_junc = alloca float, align 4
  %I_Ca_tot_sl = alloca float, align 4
  %state = alloca i32, align 4
  %I_app = alloca float, align 4
  %V_hold = alloca float, align 4
  %V_test = alloca float, align 4
  %V_clamp = alloca float, align 4
  %R_clamp = alloca float, align 4
  %I_Na_tot = alloca float, align 4
  %I_Cl_tot = alloca float, align 4
  %I_Ca_tot = alloca float, align 4
  %I_tot = alloca float, align 4
  store float %timeinst, float* %timeinst.addr, align 4
  store float* %d_initvalu, float** %d_initvalu.addr, align 8
  store float* %d_finavalu, float** %d_finavalu.addr, align 8
  store i32 %valu_offset, i32* %valu_offset.addr, align 4
  store float* %d_params, float** %d_params.addr, align 8
  %0 = load float*, float** %d_params.addr, align 8
  %arrayidx = getelementptr inbounds float, float* %0, i64 15
  %1 = load float, float* %arrayidx, align 4
  store float %1, float* %cycleLength, align 4
  %2 = load i32, i32* %valu_offset.addr, align 4
  store i32 %2, i32* %offset_1, align 4
  %3 = load i32, i32* %valu_offset.addr, align 4
  %add = add nsw i32 %3, 1
  store i32 %add, i32* %offset_2, align 4
  %4 = load i32, i32* %valu_offset.addr, align 4
  %add1 = add nsw i32 %4, 2
  store i32 %add1, i32* %offset_3, align 4
  %5 = load i32, i32* %valu_offset.addr, align 4
  %add2 = add nsw i32 %5, 3
  store i32 %add2, i32* %offset_4, align 4
  %6 = load i32, i32* %valu_offset.addr, align 4
  %add3 = add nsw i32 %6, 4
  store i32 %add3, i32* %offset_5, align 4
  %7 = load i32, i32* %valu_offset.addr, align 4
  %add4 = add nsw i32 %7, 5
  store i32 %add4, i32* %offset_6, align 4
  %8 = load i32, i32* %valu_offset.addr, align 4
  %add5 = add nsw i32 %8, 6
  store i32 %add5, i32* %offset_7, align 4
  %9 = load i32, i32* %valu_offset.addr, align 4
  %add6 = add nsw i32 %9, 7
  store i32 %add6, i32* %offset_8, align 4
  %10 = load i32, i32* %valu_offset.addr, align 4
  %add7 = add nsw i32 %10, 8
  store i32 %add7, i32* %offset_9, align 4
  %11 = load i32, i32* %valu_offset.addr, align 4
  %add8 = add nsw i32 %11, 9
  store i32 %add8, i32* %offset_10, align 4
  %12 = load i32, i32* %valu_offset.addr, align 4
  %add9 = add nsw i32 %12, 10
  store i32 %add9, i32* %offset_11, align 4
  %13 = load i32, i32* %valu_offset.addr, align 4
  %add10 = add nsw i32 %13, 11
  store i32 %add10, i32* %offset_12, align 4
  %14 = load i32, i32* %valu_offset.addr, align 4
  %add11 = add nsw i32 %14, 12
  store i32 %add11, i32* %offset_13, align 4
  %15 = load i32, i32* %valu_offset.addr, align 4
  %add12 = add nsw i32 %15, 13
  store i32 %add12, i32* %offset_14, align 4
  %16 = load i32, i32* %valu_offset.addr, align 4
  %add13 = add nsw i32 %16, 14
  store i32 %add13, i32* %offset_15, align 4
  %17 = load i32, i32* %valu_offset.addr, align 4
  %add14 = add nsw i32 %17, 15
  store i32 %add14, i32* %offset_16, align 4
  %18 = load i32, i32* %valu_offset.addr, align 4
  %add15 = add nsw i32 %18, 16
  store i32 %add15, i32* %offset_17, align 4
  %19 = load i32, i32* %valu_offset.addr, align 4
  %add16 = add nsw i32 %19, 17
  store i32 %add16, i32* %offset_18, align 4
  %20 = load i32, i32* %valu_offset.addr, align 4
  %add17 = add nsw i32 %20, 18
  store i32 %add17, i32* %offset_19, align 4
  %21 = load i32, i32* %valu_offset.addr, align 4
  %add18 = add nsw i32 %21, 19
  store i32 %add18, i32* %offset_20, align 4
  %22 = load i32, i32* %valu_offset.addr, align 4
  %add19 = add nsw i32 %22, 20
  store i32 %add19, i32* %offset_21, align 4
  %23 = load i32, i32* %valu_offset.addr, align 4
  %add20 = add nsw i32 %23, 21
  store i32 %add20, i32* %offset_22, align 4
  %24 = load i32, i32* %valu_offset.addr, align 4
  %add21 = add nsw i32 %24, 22
  store i32 %add21, i32* %offset_23, align 4
  %25 = load i32, i32* %valu_offset.addr, align 4
  %add22 = add nsw i32 %25, 23
  store i32 %add22, i32* %offset_24, align 4
  %26 = load i32, i32* %valu_offset.addr, align 4
  %add23 = add nsw i32 %26, 24
  store i32 %add23, i32* %offset_25, align 4
  %27 = load i32, i32* %valu_offset.addr, align 4
  %add24 = add nsw i32 %27, 25
  store i32 %add24, i32* %offset_26, align 4
  %28 = load i32, i32* %valu_offset.addr, align 4
  %add25 = add nsw i32 %28, 26
  store i32 %add25, i32* %offset_27, align 4
  %29 = load i32, i32* %valu_offset.addr, align 4
  %add26 = add nsw i32 %29, 27
  store i32 %add26, i32* %offset_28, align 4
  %30 = load i32, i32* %valu_offset.addr, align 4
  %add27 = add nsw i32 %30, 28
  store i32 %add27, i32* %offset_29, align 4
  %31 = load i32, i32* %valu_offset.addr, align 4
  %add28 = add nsw i32 %31, 29
  store i32 %add28, i32* %offset_30, align 4
  %32 = load i32, i32* %valu_offset.addr, align 4
  %add29 = add nsw i32 %32, 30
  store i32 %add29, i32* %offset_31, align 4
  %33 = load i32, i32* %valu_offset.addr, align 4
  %add30 = add nsw i32 %33, 31
  store i32 %add30, i32* %offset_32, align 4
  %34 = load i32, i32* %valu_offset.addr, align 4
  %add31 = add nsw i32 %34, 32
  store i32 %add31, i32* %offset_33, align 4
  %35 = load i32, i32* %valu_offset.addr, align 4
  %add32 = add nsw i32 %35, 33
  store i32 %add32, i32* %offset_34, align 4
  %36 = load i32, i32* %valu_offset.addr, align 4
  %add33 = add nsw i32 %36, 34
  store i32 %add33, i32* %offset_35, align 4
  %37 = load i32, i32* %valu_offset.addr, align 4
  %add34 = add nsw i32 %37, 35
  store i32 %add34, i32* %offset_36, align 4
  %38 = load i32, i32* %valu_offset.addr, align 4
  %add35 = add nsw i32 %38, 36
  store i32 %add35, i32* %offset_37, align 4
  %39 = load i32, i32* %valu_offset.addr, align 4
  %add36 = add nsw i32 %39, 37
  store i32 %add36, i32* %offset_38, align 4
  %40 = load i32, i32* %valu_offset.addr, align 4
  %add37 = add nsw i32 %40, 38
  store i32 %add37, i32* %offset_39, align 4
  %41 = load i32, i32* %valu_offset.addr, align 4
  %add38 = add nsw i32 %41, 39
  store i32 %add38, i32* %offset_40, align 4
  %42 = load i32, i32* %valu_offset.addr, align 4
  %add39 = add nsw i32 %42, 40
  store i32 %add39, i32* %offset_41, align 4
  %43 = load i32, i32* %valu_offset.addr, align 4
  %add40 = add nsw i32 %43, 41
  store i32 %add40, i32* %offset_42, align 4
  %44 = load i32, i32* %valu_offset.addr, align 4
  %add41 = add nsw i32 %44, 42
  store i32 %add41, i32* %offset_43, align 4
  %45 = load i32, i32* %valu_offset.addr, align 4
  %add42 = add nsw i32 %45, 43
  store i32 %add42, i32* %offset_44, align 4
  %46 = load i32, i32* %valu_offset.addr, align 4
  %add43 = add nsw i32 %46, 44
  store i32 %add43, i32* %offset_45, align 4
  %47 = load i32, i32* %valu_offset.addr, align 4
  %add44 = add nsw i32 %47, 45
  store i32 %add44, i32* %offset_46, align 4
  %48 = load float*, float** %d_initvalu.addr, align 8
  %49 = load i32, i32* %offset_1, align 4
  %idxprom = sext i32 %49 to i64
  %arrayidx45 = getelementptr inbounds float, float* %48, i64 %idxprom
  %50 = load float, float* %arrayidx45, align 4
  store float %50, float* %d_initvalu_1, align 4
  %51 = load float*, float** %d_initvalu.addr, align 8
  %52 = load i32, i32* %offset_2, align 4
  %idxprom46 = sext i32 %52 to i64
  %arrayidx47 = getelementptr inbounds float, float* %51, i64 %idxprom46
  %53 = load float, float* %arrayidx47, align 4
  store float %53, float* %d_initvalu_2, align 4
  %54 = load float*, float** %d_initvalu.addr, align 8
  %55 = load i32, i32* %offset_3, align 4
  %idxprom48 = sext i32 %55 to i64
  %arrayidx49 = getelementptr inbounds float, float* %54, i64 %idxprom48
  %56 = load float, float* %arrayidx49, align 4
  store float %56, float* %d_initvalu_3, align 4
  %57 = load float*, float** %d_initvalu.addr, align 8
  %58 = load i32, i32* %offset_4, align 4
  %idxprom50 = sext i32 %58 to i64
  %arrayidx51 = getelementptr inbounds float, float* %57, i64 %idxprom50
  %59 = load float, float* %arrayidx51, align 4
  store float %59, float* %d_initvalu_4, align 4
  %60 = load float*, float** %d_initvalu.addr, align 8
  %61 = load i32, i32* %offset_5, align 4
  %idxprom52 = sext i32 %61 to i64
  %arrayidx53 = getelementptr inbounds float, float* %60, i64 %idxprom52
  %62 = load float, float* %arrayidx53, align 4
  store float %62, float* %d_initvalu_5, align 4
  %63 = load float*, float** %d_initvalu.addr, align 8
  %64 = load i32, i32* %offset_6, align 4
  %idxprom54 = sext i32 %64 to i64
  %arrayidx55 = getelementptr inbounds float, float* %63, i64 %idxprom54
  %65 = load float, float* %arrayidx55, align 4
  store float %65, float* %d_initvalu_6, align 4
  %66 = load float*, float** %d_initvalu.addr, align 8
  %67 = load i32, i32* %offset_7, align 4
  %idxprom56 = sext i32 %67 to i64
  %arrayidx57 = getelementptr inbounds float, float* %66, i64 %idxprom56
  %68 = load float, float* %arrayidx57, align 4
  store float %68, float* %d_initvalu_7, align 4
  %69 = load float*, float** %d_initvalu.addr, align 8
  %70 = load i32, i32* %offset_8, align 4
  %idxprom58 = sext i32 %70 to i64
  %arrayidx59 = getelementptr inbounds float, float* %69, i64 %idxprom58
  %71 = load float, float* %arrayidx59, align 4
  store float %71, float* %d_initvalu_8, align 4
  %72 = load float*, float** %d_initvalu.addr, align 8
  %73 = load i32, i32* %offset_9, align 4
  %idxprom60 = sext i32 %73 to i64
  %arrayidx61 = getelementptr inbounds float, float* %72, i64 %idxprom60
  %74 = load float, float* %arrayidx61, align 4
  store float %74, float* %d_initvalu_9, align 4
  %75 = load float*, float** %d_initvalu.addr, align 8
  %76 = load i32, i32* %offset_10, align 4
  %idxprom62 = sext i32 %76 to i64
  %arrayidx63 = getelementptr inbounds float, float* %75, i64 %idxprom62
  %77 = load float, float* %arrayidx63, align 4
  store float %77, float* %d_initvalu_10, align 4
  %78 = load float*, float** %d_initvalu.addr, align 8
  %79 = load i32, i32* %offset_11, align 4
  %idxprom64 = sext i32 %79 to i64
  %arrayidx65 = getelementptr inbounds float, float* %78, i64 %idxprom64
  %80 = load float, float* %arrayidx65, align 4
  store float %80, float* %d_initvalu_11, align 4
  %81 = load float*, float** %d_initvalu.addr, align 8
  %82 = load i32, i32* %offset_12, align 4
  %idxprom66 = sext i32 %82 to i64
  %arrayidx67 = getelementptr inbounds float, float* %81, i64 %idxprom66
  %83 = load float, float* %arrayidx67, align 4
  store float %83, float* %d_initvalu_12, align 4
  %84 = load float*, float** %d_initvalu.addr, align 8
  %85 = load i32, i32* %offset_13, align 4
  %idxprom68 = sext i32 %85 to i64
  %arrayidx69 = getelementptr inbounds float, float* %84, i64 %idxprom68
  %86 = load float, float* %arrayidx69, align 4
  store float %86, float* %d_initvalu_13, align 4
  %87 = load float*, float** %d_initvalu.addr, align 8
  %88 = load i32, i32* %offset_14, align 4
  %idxprom70 = sext i32 %88 to i64
  %arrayidx71 = getelementptr inbounds float, float* %87, i64 %idxprom70
  %89 = load float, float* %arrayidx71, align 4
  store float %89, float* %d_initvalu_14, align 4
  %90 = load float*, float** %d_initvalu.addr, align 8
  %91 = load i32, i32* %offset_15, align 4
  %idxprom72 = sext i32 %91 to i64
  %arrayidx73 = getelementptr inbounds float, float* %90, i64 %idxprom72
  %92 = load float, float* %arrayidx73, align 4
  store float %92, float* %d_initvalu_15, align 4
  %93 = load float*, float** %d_initvalu.addr, align 8
  %94 = load i32, i32* %offset_16, align 4
  %idxprom74 = sext i32 %94 to i64
  %arrayidx75 = getelementptr inbounds float, float* %93, i64 %idxprom74
  %95 = load float, float* %arrayidx75, align 4
  store float %95, float* %d_initvalu_16, align 4
  %96 = load float*, float** %d_initvalu.addr, align 8
  %97 = load i32, i32* %offset_17, align 4
  %idxprom76 = sext i32 %97 to i64
  %arrayidx77 = getelementptr inbounds float, float* %96, i64 %idxprom76
  %98 = load float, float* %arrayidx77, align 4
  store float %98, float* %d_initvalu_17, align 4
  %99 = load float*, float** %d_initvalu.addr, align 8
  %100 = load i32, i32* %offset_18, align 4
  %idxprom78 = sext i32 %100 to i64
  %arrayidx79 = getelementptr inbounds float, float* %99, i64 %idxprom78
  %101 = load float, float* %arrayidx79, align 4
  store float %101, float* %d_initvalu_18, align 4
  %102 = load float*, float** %d_initvalu.addr, align 8
  %103 = load i32, i32* %offset_19, align 4
  %idxprom80 = sext i32 %103 to i64
  %arrayidx81 = getelementptr inbounds float, float* %102, i64 %idxprom80
  %104 = load float, float* %arrayidx81, align 4
  store float %104, float* %d_initvalu_19, align 4
  %105 = load float*, float** %d_initvalu.addr, align 8
  %106 = load i32, i32* %offset_20, align 4
  %idxprom82 = sext i32 %106 to i64
  %arrayidx83 = getelementptr inbounds float, float* %105, i64 %idxprom82
  %107 = load float, float* %arrayidx83, align 4
  store float %107, float* %d_initvalu_20, align 4
  %108 = load float*, float** %d_initvalu.addr, align 8
  %109 = load i32, i32* %offset_21, align 4
  %idxprom84 = sext i32 %109 to i64
  %arrayidx85 = getelementptr inbounds float, float* %108, i64 %idxprom84
  %110 = load float, float* %arrayidx85, align 4
  store float %110, float* %d_initvalu_21, align 4
  %111 = load float*, float** %d_initvalu.addr, align 8
  %112 = load i32, i32* %offset_23, align 4
  %idxprom86 = sext i32 %112 to i64
  %arrayidx87 = getelementptr inbounds float, float* %111, i64 %idxprom86
  %113 = load float, float* %arrayidx87, align 4
  store float %113, float* %d_initvalu_23, align 4
  %114 = load float*, float** %d_initvalu.addr, align 8
  %115 = load i32, i32* %offset_24, align 4
  %idxprom88 = sext i32 %115 to i64
  %arrayidx89 = getelementptr inbounds float, float* %114, i64 %idxprom88
  %116 = load float, float* %arrayidx89, align 4
  store float %116, float* %d_initvalu_24, align 4
  %117 = load float*, float** %d_initvalu.addr, align 8
  %118 = load i32, i32* %offset_25, align 4
  %idxprom90 = sext i32 %118 to i64
  %arrayidx91 = getelementptr inbounds float, float* %117, i64 %idxprom90
  %119 = load float, float* %arrayidx91, align 4
  store float %119, float* %d_initvalu_25, align 4
  %120 = load float*, float** %d_initvalu.addr, align 8
  %121 = load i32, i32* %offset_26, align 4
  %idxprom92 = sext i32 %121 to i64
  %arrayidx93 = getelementptr inbounds float, float* %120, i64 %idxprom92
  %122 = load float, float* %arrayidx93, align 4
  store float %122, float* %d_initvalu_26, align 4
  %123 = load float*, float** %d_initvalu.addr, align 8
  %124 = load i32, i32* %offset_27, align 4
  %idxprom94 = sext i32 %124 to i64
  %arrayidx95 = getelementptr inbounds float, float* %123, i64 %idxprom94
  %125 = load float, float* %arrayidx95, align 4
  store float %125, float* %d_initvalu_27, align 4
  %126 = load float*, float** %d_initvalu.addr, align 8
  %127 = load i32, i32* %offset_28, align 4
  %idxprom96 = sext i32 %127 to i64
  %arrayidx97 = getelementptr inbounds float, float* %126, i64 %idxprom96
  %128 = load float, float* %arrayidx97, align 4
  store float %128, float* %d_initvalu_28, align 4
  %129 = load float*, float** %d_initvalu.addr, align 8
  %130 = load i32, i32* %offset_29, align 4
  %idxprom98 = sext i32 %130 to i64
  %arrayidx99 = getelementptr inbounds float, float* %129, i64 %idxprom98
  %131 = load float, float* %arrayidx99, align 4
  store float %131, float* %d_initvalu_29, align 4
  %132 = load float*, float** %d_initvalu.addr, align 8
  %133 = load i32, i32* %offset_30, align 4
  %idxprom100 = sext i32 %133 to i64
  %arrayidx101 = getelementptr inbounds float, float* %132, i64 %idxprom100
  %134 = load float, float* %arrayidx101, align 4
  store float %134, float* %d_initvalu_30, align 4
  %135 = load float*, float** %d_initvalu.addr, align 8
  %136 = load i32, i32* %offset_31, align 4
  %idxprom102 = sext i32 %136 to i64
  %arrayidx103 = getelementptr inbounds float, float* %135, i64 %idxprom102
  %137 = load float, float* %arrayidx103, align 4
  store float %137, float* %d_initvalu_31, align 4
  %138 = load float*, float** %d_initvalu.addr, align 8
  %139 = load i32, i32* %offset_32, align 4
  %idxprom104 = sext i32 %139 to i64
  %arrayidx105 = getelementptr inbounds float, float* %138, i64 %idxprom104
  %140 = load float, float* %arrayidx105, align 4
  store float %140, float* %d_initvalu_32, align 4
  %141 = load float*, float** %d_initvalu.addr, align 8
  %142 = load i32, i32* %offset_33, align 4
  %idxprom106 = sext i32 %142 to i64
  %arrayidx107 = getelementptr inbounds float, float* %141, i64 %idxprom106
  %143 = load float, float* %arrayidx107, align 4
  store float %143, float* %d_initvalu_33, align 4
  %144 = load float*, float** %d_initvalu.addr, align 8
  %145 = load i32, i32* %offset_34, align 4
  %idxprom108 = sext i32 %145 to i64
  %arrayidx109 = getelementptr inbounds float, float* %144, i64 %idxprom108
  %146 = load float, float* %arrayidx109, align 4
  store float %146, float* %d_initvalu_34, align 4
  %147 = load float*, float** %d_initvalu.addr, align 8
  %148 = load i32, i32* %offset_35, align 4
  %idxprom110 = sext i32 %148 to i64
  %arrayidx111 = getelementptr inbounds float, float* %147, i64 %idxprom110
  %149 = load float, float* %arrayidx111, align 4
  store float %149, float* %d_initvalu_35, align 4
  %150 = load float*, float** %d_initvalu.addr, align 8
  %151 = load i32, i32* %offset_36, align 4
  %idxprom112 = sext i32 %151 to i64
  %arrayidx113 = getelementptr inbounds float, float* %150, i64 %idxprom112
  %152 = load float, float* %arrayidx113, align 4
  store float %152, float* %d_initvalu_36, align 4
  %153 = load float*, float** %d_initvalu.addr, align 8
  %154 = load i32, i32* %offset_37, align 4
  %idxprom114 = sext i32 %154 to i64
  %arrayidx115 = getelementptr inbounds float, float* %153, i64 %idxprom114
  %155 = load float, float* %arrayidx115, align 4
  store float %155, float* %d_initvalu_37, align 4
  %156 = load float*, float** %d_initvalu.addr, align 8
  %157 = load i32, i32* %offset_38, align 4
  %idxprom116 = sext i32 %157 to i64
  %arrayidx117 = getelementptr inbounds float, float* %156, i64 %idxprom116
  %158 = load float, float* %arrayidx117, align 4
  store float %158, float* %d_initvalu_38, align 4
  %159 = load float*, float** %d_initvalu.addr, align 8
  %160 = load i32, i32* %offset_39, align 4
  %idxprom118 = sext i32 %160 to i64
  %arrayidx119 = getelementptr inbounds float, float* %159, i64 %idxprom118
  %161 = load float, float* %arrayidx119, align 4
  store float %161, float* %d_initvalu_39, align 4
  %162 = load float*, float** %d_initvalu.addr, align 8
  %163 = load i32, i32* %offset_40, align 4
  %idxprom120 = sext i32 %163 to i64
  %arrayidx121 = getelementptr inbounds float, float* %162, i64 %idxprom120
  %164 = load float, float* %arrayidx121, align 4
  store float %164, float* %d_initvalu_40, align 4
  store float 0x400921FF20000000, float* %pi, align 4
  store float 8.314000e+03, float* %R, align 4
  store float 9.648500e+04, float* %Frdy, align 4
  store float 3.100000e+02, float* %Temp, align 4
  %165 = load float, float* %Frdy, align 4
  %166 = load float, float* %R, align 4
  %div = fdiv float %165, %166
  %167 = load float, float* %Temp, align 4
  %div122 = fdiv float %div, %167
  store float %div122, float* %FoRT, align 4
  store float 0x3DE2FAF640000000, float* %Cmem, align 4
  %168 = load float, float* %Temp, align 4
  %sub = fsub contract float %168, 3.100000e+02
  %div123 = fdiv float %sub, 1.000000e+01
  store float %div123, float* %Qpow, align 4
  store float 1.000000e+02, float* %cellLength, align 4
  store float 1.025000e+01, float* %cellRadius, align 4
  %169 = load float, float* %pi, align 4
  %170 = load float, float* %cellRadius, align 4
  %call = call fastcc float @_ZL3powfi(float %170, i32 2) #4
  %mul = fmul contract float %169, %call
  %171 = load float, float* %cellLength, align 4
  %mul124 = fmul contract float %mul, %171
  %conv = fpext float %mul124 to double
  %mul125 = fmul contract double %conv, 1.000000e-15
  %conv126 = fptrunc double %mul125 to float
  store float %conv126, float* %Vcell, align 4
  %172 = load float, float* %Vcell, align 4
  %conv127 = fpext float %172 to double
  %mul128 = fmul contract double 6.500000e-01, %conv127
  %conv129 = fptrunc double %mul128 to float
  store float %conv129, float* %Vmyo, align 4
  %173 = load float, float* %Vcell, align 4
  %conv130 = fpext float %173 to double
  %mul131 = fmul contract double 3.500000e-02, %conv130
  %conv132 = fptrunc double %mul131 to float
  store float %conv132, float* %Vsr, align 4
  %174 = load float, float* %Vcell, align 4
  %conv133 = fpext float %174 to double
  %mul134 = fmul contract double 2.000000e-02, %conv133
  %conv135 = fptrunc double %mul134 to float
  store float %conv135, float* %Vsl, align 4
  %175 = load float, float* %Vcell, align 4
  %conv136 = fpext float %175 to double
  %mul137 = fmul contract double 0x3F41A975AFAF8595, %conv136
  %conv138 = fptrunc double %mul137 to float
  store float %conv138, float* %Vjunc, align 4
  store float 0x3D6CFF1BA0000000, float* %J_ca_juncsl, align 4
  store float 0x3D906123C0000000, float* %J_ca_slmyo, align 4
  store float 0x3D149E4CE0000000, float* %J_na_juncsl, align 4
  store float 0x3D7CD3B960000000, float* %J_na_slmyo, align 4
  store float 0x3FBC28F5C0000000, float* %Fjunc, align 4
  %176 = load float, float* %Fjunc, align 4
  %sub139 = fsub contract float 1.000000e+00, %176
  store float %sub139, float* %Fsl, align 4
  store float 0x3FECCCCCC0000000, float* %Fjunc_CaL, align 4
  %177 = load float, float* %Fjunc_CaL, align 4
  %sub140 = fsub contract float 1.000000e+00, %177
  store float %sub140, float* %Fsl_CaL, align 4
  store float 1.500000e+01, float* %Cli, align 4
  store float 1.500000e+02, float* %Clo, align 4
  store float 0x40159999A0000000, float* %Ko, align 4
  store float 1.400000e+02, float* %Nao, align 4
  store float 0x3FFCCCCCC0000000, float* %Cao, align 4
  store float 1.000000e+00, float* %Mgi, align 4
  %178 = load float, float* %FoRT, align 4
  %div141 = fdiv float 1.000000e+00, %178
  %179 = load float, float* %Nao, align 4
  %180 = load float, float* %d_initvalu_32, align 4
  %div142 = fdiv float %179, %180
  %call143 = call fastcc float @_ZL3logf(float %div142) #4
  %mul144 = fmul contract float %div141, %call143
  store float %mul144, float* %ena_junc, align 4
  %181 = load float, float* %FoRT, align 4
  %div145 = fdiv float 1.000000e+00, %181
  %182 = load float, float* %Nao, align 4
  %183 = load float, float* %d_initvalu_33, align 4
  %div146 = fdiv float %182, %183
  %call147 = call fastcc float @_ZL3logf(float %div146) #4
  %mul148 = fmul contract float %div145, %call147
  store float %mul148, float* %ena_sl, align 4
  %184 = load float, float* %FoRT, align 4
  %div149 = fdiv float 1.000000e+00, %184
  %185 = load float, float* %Ko, align 4
  %186 = load float, float* %d_initvalu_35, align 4
  %div150 = fdiv float %185, %186
  %call151 = call fastcc float @_ZL3logf(float %div150) #4
  %mul152 = fmul contract float %div149, %call151
  store float %mul152, float* %ek, align 4
  %187 = load float, float* %FoRT, align 4
  %div153 = fdiv float 1.000000e+00, %187
  %div154 = fdiv float %div153, 2.000000e+00
  %188 = load float, float* %Cao, align 4
  %189 = load float, float* %d_initvalu_36, align 4
  %div155 = fdiv float %188, %189
  %call156 = call fastcc float @_ZL3logf(float %div155) #4
  %mul157 = fmul contract float %div154, %call156
  store float %mul157, float* %eca_junc, align 4
  %190 = load float, float* %FoRT, align 4
  %div158 = fdiv float 1.000000e+00, %190
  %div159 = fdiv float %div158, 2.000000e+00
  %191 = load float, float* %Cao, align 4
  %192 = load float, float* %d_initvalu_37, align 4
  %div160 = fdiv float %191, %192
  %call161 = call fastcc float @_ZL3logf(float %div160) #4
  %mul162 = fmul contract float %div159, %call161
  store float %mul162, float* %eca_sl, align 4
  %193 = load float, float* %FoRT, align 4
  %div163 = fdiv float 1.000000e+00, %193
  %194 = load float, float* %Cli, align 4
  %195 = load float, float* %Clo, align 4
  %div164 = fdiv float %194, %195
  %call165 = call fastcc float @_ZL3logf(float %div164) #4
  %mul166 = fmul contract float %div163, %call165
  store float %mul166, float* %ecl, align 4
  store float 1.600000e+01, float* %GNa, align 4
  store float 0x3F3376D540000000, float* %GNaB, align 4
  store float 0x3FFE83D9A0000000, float* %IbarNaK, align 4
  store float 1.100000e+01, float* %KmNaip, align 4
  store float 1.500000e+00, float* %KmKo, align 4
  store float 0x3F92C51980000000, float* %pNaK, align 4
  store float 0x3FAEB851E0000000, float* %GtoSlow, align 4
  store float 0x3F947AE140000000, float* %GtoFast, align 4
  store float 0x3F50624DE0000000, float* %gkp, align 4
  store float 0x3FBC106240000000, float* %GClCa, align 4
  store float 0x3F826E9780000000, float* %GClB, align 4
  store float 0x3FB99999A0000000, float* %KdClCa, align 4
  store float 0x3E501B2B20000000, float* %pNa, align 4
  store float 0x3F41B1D920000000, float* %pCa, align 4
  store float 0x3E921E9080000000, float* %pK, align 4
  store float 0x3FFCCCCCC0000000, float* %Q10CaL, align 4
  store float 9.000000e+00, float* %IbarNCX, align 4
  store float 0x3F6D68C6A0000000, float* %KmCai, align 4
  store float 0x3FF4CCCCC0000000, float* %KmCao, align 4
  store float 0x4028947AE0000000, float* %KmNai, align 4
  store float 8.750000e+01, float* %KmNao, align 4
  store float 0x3FD147AE20000000, float* %ksat, align 4
  store float 0x3FD6666660000000, float* %nu, align 4
  store float 0x3F30C6F7A0000000, float* %Kdact, align 4
  store float 0x3FF91EB860000000, float* %Q10NCX, align 4
  store float 0x3FB13A92A0000000, float* %IbarSLCaP, align 4
  store float 0x3F40624DE0000000, float* %KmPCa, align 4
  store float 0x3F30781D40000000, float* %GCaB, align 4
  store float 0x4002CCCCC0000000, float* %Q10SLCaP, align 4
  store float 0x4004CCCCC0000000, float* %Q10SRCaP, align 4
  store float 0x3F32BE48A0000000, float* %Vmax_SRCaP, align 4
  store float 0x3F301F3200000000, float* %Kmf, align 4
  store float 0x3FFB333340000000, float* %Kmr, align 4
  store float 0x3FFC978D40000000, float* %hillSRCaP, align 4
  store float 2.500000e+01, float* %ks, align 4
  store float 1.000000e+01, float* %koCa, align 4
  store float 0x3FAEB851E0000000, float* %kom, align 4
  store float 5.000000e-01, float* %kiCa, align 4
  store float 0x3F747AE140000000, float* %kim, align 4
  store float 0x3FDCCCCCC0000000, float* %ec50SR, align 4
  store float 0x401E3E76C0000000, float* %Bmax_Naj, align 4
  store float 0x3FFA666660000000, float* %Bmax_Nasl, align 4
  store float 0x3F50624DE0000000, float* %koff_na, align 4
  store float 0x3F1A36E2E0000000, float* %kon_na, align 4
  store float 0x3FB1EB8520000000, float* %Bmax_TnClow, align 4
  store float 0x3F941205C0000000, float* %koff_tncl, align 4
  store float 0x40405999A0000000, float* %kon_tncl, align 4
  store float 0x3FC1EB8520000000, float* %Bmax_TnChigh, align 4
  store float 0x3F00C6F7A0000000, float* %koff_tnchca, align 4
  store float 0x4002F5C280000000, float* %kon_tnchca, align 4
  store float 0x3F6B478420000000, float* %koff_tnchmg, align 4
  store float 0x3F689374C0000000, float* %kon_tnchmg, align 4
  store float 0x3FC1EB8520000000, float* %Bmax_myosin, align 4
  store float 0x3F3E258500000000, float* %koff_myoca, align 4
  store float 0x402B9999A0000000, float* %kon_myoca, align 4
  store float 0x3F0DE26920000000, float* %koff_myomg, align 4
  store float 0x3F9013A920000000, float* %kon_myomg, align 4
  store float 0x3F9182A9A0000000, float* %Bmax_SR, align 4
  store float 0x3FAEB851E0000000, float* %koff_sr, align 4
  store float 1.000000e+02, float* %kon_sr, align 4
  %196 = load float, float* %Vmyo, align 4
  %conv167 = fpext float %196 to double
  %mul168 = fmul contract double 3.738000e-02, %conv167
  %197 = load float, float* %Vsl, align 4
  %conv169 = fpext float %197 to double
  %div170 = fdiv double %mul168, %conv169
  %conv171 = fptrunc double %div170 to float
  store float %conv171, float* %Bmax_SLlowsl, align 4
  %198 = load float, float* %Vmyo, align 4
  %conv172 = fpext float %198 to double
  %mul173 = fmul contract double 4.620000e-03, %conv172
  %199 = load float, float* %Vjunc, align 4
  %conv174 = fpext float %199 to double
  %div175 = fdiv double %mul173, %conv174
  %mul176 = fmul contract double %div175, 1.000000e-01
  %conv177 = fptrunc double %mul176 to float
  store float %conv177, float* %Bmax_SLlowj, align 4
  store float 0x3FF4CCCCC0000000, float* %koff_sll, align 4
  store float 1.000000e+02, float* %kon_sll, align 4
  %200 = load float, float* %Vmyo, align 4
  %conv178 = fpext float %200 to double
  %mul179 = fmul contract double 1.335000e-02, %conv178
  %201 = load float, float* %Vsl, align 4
  %conv180 = fpext float %201 to double
  %div181 = fdiv double %mul179, %conv180
  %conv182 = fptrunc double %div181 to float
  store float %conv182, float* %Bmax_SLhighsl, align 4
  %202 = load float, float* %Vmyo, align 4
  %conv183 = fpext float %202 to double
  %mul184 = fmul contract double 1.650000e-03, %conv183
  %203 = load float, float* %Vjunc, align 4
  %conv185 = fpext float %203 to double
  %div186 = fdiv double %mul184, %conv185
  %mul187 = fmul contract double %div186, 1.000000e-01
  %conv188 = fptrunc double %mul187 to float
  store float %conv188, float* %Bmax_SLhighj, align 4
  store float 0x3F9EB851E0000000, float* %koff_slh, align 4
  store float 1.000000e+02, float* %kon_slh, align 4
  store float 0x40059999A0000000, float* %Bmax_Csqn, align 4
  store float 6.500000e+01, float* %koff_csqn, align 4
  store float 1.000000e+02, float* %kon_csqn, align 4
  %204 = load float, float* %d_initvalu_39, align 4
  %conv189 = fpext float %204 to double
  %add190 = fadd contract double %conv189, 4.713000e+01
  %mul191 = fmul contract double 3.200000e-01, %add190
  %205 = load float, float* %d_initvalu_39, align 4
  %conv192 = fpext float %205 to double
  %add193 = fadd contract double %conv192, 4.713000e+01
  %mul194 = fmul contract double -1.000000e-01, %add193
  %call195 = call fastcc double @_ZL3expd(double %mul194) #4
  %sub196 = fsub contract double 1.000000e+00, %call195
  %div197 = fdiv double %mul191, %sub196
  %conv198 = fptrunc double %div197 to float
  store float %conv198, float* %am, align 4
  %206 = load float, float* %d_initvalu_39, align 4
  %fneg = fneg float %206
  %div199 = fdiv float %fneg, 1.100000e+01
  %call200 = call fastcc float @_ZL3expf(float %div199) #4
  %conv201 = fpext float %call200 to double
  %mul202 = fmul contract double 8.000000e-02, %conv201
  %conv203 = fptrunc double %mul202 to float
  store float %conv203, float* %bm, align 4
  %207 = load float, float* %d_initvalu_39, align 4
  %cmp = fcmp oge float %207, -4.000000e+01
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store float 0.000000e+00, float* %ah, align 4
  store float 0.000000e+00, float* %aj, align 4
  %208 = load float, float* %d_initvalu_39, align 4
  %conv204 = fpext float %208 to double
  %add205 = fadd contract double %conv204, 1.066000e+01
  %fneg206 = fneg double %add205
  %div207 = fdiv double %fneg206, 1.110000e+01
  %call208 = call fastcc double @_ZL3expd(double %div207) #4
  %add209 = fadd contract double 1.000000e+00, %call208
  %mul210 = fmul contract double 1.300000e-01, %add209
  %div211 = fdiv double 1.000000e+00, %mul210
  %conv212 = fptrunc double %div211 to float
  store float %conv212, float* %bh, align 4
  %209 = load float, float* %d_initvalu_39, align 4
  %conv213 = fpext float %209 to double
  %mul214 = fmul contract double -2.535000e-07, %conv213
  %call215 = call fastcc double @_ZL3expd(double %mul214) #4
  %mul216 = fmul contract double 3.000000e-01, %call215
  %210 = load float, float* %d_initvalu_39, align 4
  %add217 = fadd contract float %210, 3.200000e+01
  %conv218 = fpext float %add217 to double
  %mul219 = fmul contract double -1.000000e-01, %conv218
  %call220 = call fastcc double @_ZL3expd(double %mul219) #4
  %add221 = fadd contract double 1.000000e+00, %call220
  %div222 = fdiv double %mul216, %add221
  %conv223 = fptrunc double %div222 to float
  store float %conv223, float* %bj, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %211 = load float, float* %d_initvalu_39, align 4
  %add224 = fadd contract float 8.000000e+01, %211
  %conv225 = fpext float %add224 to double
  %div226 = fdiv double %conv225, -6.800000e+00
  %call227 = call fastcc double @_ZL3expd(double %div226) #4
  %mul228 = fmul contract double 1.350000e-01, %call227
  %conv229 = fptrunc double %mul228 to float
  store float %conv229, float* %ah, align 4
  %212 = load float, float* %d_initvalu_39, align 4
  %conv230 = fpext float %212 to double
  %mul231 = fmul contract double 7.900000e-02, %conv230
  %call232 = call fastcc double @_ZL3expd(double %mul231) #4
  %mul233 = fmul contract double 3.560000e+00, %call232
  %213 = load float, float* %d_initvalu_39, align 4
  %conv234 = fpext float %213 to double
  %mul235 = fmul contract double 3.500000e-01, %conv234
  %call236 = call fastcc double @_ZL3expd(double %mul235) #4
  %mul237 = fmul contract double 3.100000e+05, %call236
  %add238 = fadd contract double %mul233, %mul237
  %conv239 = fptrunc double %add238 to float
  store float %conv239, float* %bh, align 4
  %214 = load float, float* %d_initvalu_39, align 4
  %conv240 = fpext float %214 to double
  %mul241 = fmul contract double 2.444000e-01, %conv240
  %call242 = call fastcc double @_ZL3expd(double %mul241) #4
  %mul243 = fmul contract double -1.271400e+05, %call242
  %215 = load float, float* %d_initvalu_39, align 4
  %conv244 = fpext float %215 to double
  %mul245 = fmul contract double -4.391000e-02, %conv244
  %call246 = call fastcc double @_ZL3expd(double %mul245) #4
  %mul247 = fmul contract double 3.474000e-05, %call246
  %sub248 = fsub contract double %mul243, %mul247
  %216 = load float, float* %d_initvalu_39, align 4
  %conv249 = fpext float %216 to double
  %add250 = fadd contract double %conv249, 3.778000e+01
  %mul251 = fmul contract double %sub248, %add250
  %217 = load float, float* %d_initvalu_39, align 4
  %conv252 = fpext float %217 to double
  %add253 = fadd contract double %conv252, 7.923000e+01
  %mul254 = fmul contract double 3.110000e-01, %add253
  %call255 = call fastcc double @_ZL3expd(double %mul254) #4
  %add256 = fadd contract double 1.000000e+00, %call255
  %div257 = fdiv double %mul251, %add256
  %conv258 = fptrunc double %div257 to float
  store float %conv258, float* %aj, align 4
  %218 = load float, float* %d_initvalu_39, align 4
  %conv259 = fpext float %218 to double
  %mul260 = fmul contract double -1.052000e-02, %conv259
  %call261 = call fastcc double @_ZL3expd(double %mul260) #4
  %mul262 = fmul contract double 1.212000e-01, %call261
  %219 = load float, float* %d_initvalu_39, align 4
  %conv263 = fpext float %219 to double
  %add264 = fadd contract double %conv263, 4.014000e+01
  %mul265 = fmul contract double -1.378000e-01, %add264
  %call266 = call fastcc double @_ZL3expd(double %mul265) #4
  %add267 = fadd contract double 1.000000e+00, %call266
  %div268 = fdiv double %mul262, %add267
  %conv269 = fptrunc double %div268 to float
  store float %conv269, float* %bj, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %220 = load float, float* %am, align 4
  %221 = load float, float* %d_initvalu_1, align 4
  %sub270 = fsub contract float 1.000000e+00, %221
  %mul271 = fmul contract float %220, %sub270
  %222 = load float, float* %bm, align 4
  %223 = load float, float* %d_initvalu_1, align 4
  %mul272 = fmul contract float %222, %223
  %sub273 = fsub contract float %mul271, %mul272
  %224 = load float*, float** %d_finavalu.addr, align 8
  %225 = load i32, i32* %offset_1, align 4
  %idxprom274 = sext i32 %225 to i64
  %arrayidx275 = getelementptr inbounds float, float* %224, i64 %idxprom274
  store float %sub273, float* %arrayidx275, align 4
  %226 = load float, float* %ah, align 4
  %227 = load float, float* %d_initvalu_2, align 4
  %sub276 = fsub contract float 1.000000e+00, %227
  %mul277 = fmul contract float %226, %sub276
  %228 = load float, float* %bh, align 4
  %229 = load float, float* %d_initvalu_2, align 4
  %mul278 = fmul contract float %228, %229
  %sub279 = fsub contract float %mul277, %mul278
  %230 = load float*, float** %d_finavalu.addr, align 8
  %231 = load i32, i32* %offset_2, align 4
  %idxprom280 = sext i32 %231 to i64
  %arrayidx281 = getelementptr inbounds float, float* %230, i64 %idxprom280
  store float %sub279, float* %arrayidx281, align 4
  %232 = load float, float* %aj, align 4
  %233 = load float, float* %d_initvalu_3, align 4
  %sub282 = fsub contract float 1.000000e+00, %233
  %mul283 = fmul contract float %232, %sub282
  %234 = load float, float* %bj, align 4
  %235 = load float, float* %d_initvalu_3, align 4
  %mul284 = fmul contract float %234, %235
  %sub285 = fsub contract float %mul283, %mul284
  %236 = load float*, float** %d_finavalu.addr, align 8
  %237 = load i32, i32* %offset_3, align 4
  %idxprom286 = sext i32 %237 to i64
  %arrayidx287 = getelementptr inbounds float, float* %236, i64 %idxprom286
  store float %sub285, float* %arrayidx287, align 4
  %238 = load float, float* %Fjunc, align 4
  %239 = load float, float* %GNa, align 4
  %mul288 = fmul contract float %238, %239
  %240 = load float, float* %d_initvalu_1, align 4
  %call289 = call fastcc float @_ZL3powfi(float %240, i32 3) #4
  %mul290 = fmul contract float %mul288, %call289
  %241 = load float, float* %d_initvalu_2, align 4
  %mul291 = fmul contract float %mul290, %241
  %242 = load float, float* %d_initvalu_3, align 4
  %mul292 = fmul contract float %mul291, %242
  %243 = load float, float* %d_initvalu_39, align 4
  %244 = load float, float* %ena_junc, align 4
  %sub293 = fsub contract float %243, %244
  %mul294 = fmul contract float %mul292, %sub293
  store float %mul294, float* %I_Na_junc, align 4
  %245 = load float, float* %Fsl, align 4
  %246 = load float, float* %GNa, align 4
  %mul295 = fmul contract float %245, %246
  %247 = load float, float* %d_initvalu_1, align 4
  %call296 = call fastcc float @_ZL3powfi(float %247, i32 3) #4
  %mul297 = fmul contract float %mul295, %call296
  %248 = load float, float* %d_initvalu_2, align 4
  %mul298 = fmul contract float %mul297, %248
  %249 = load float, float* %d_initvalu_3, align 4
  %mul299 = fmul contract float %mul298, %249
  %250 = load float, float* %d_initvalu_39, align 4
  %251 = load float, float* %ena_sl, align 4
  %sub300 = fsub contract float %250, %251
  %mul301 = fmul contract float %mul299, %sub300
  store float %mul301, float* %I_Na_sl, align 4
  %252 = load float, float* %Fjunc, align 4
  %253 = load float, float* %GNaB, align 4
  %mul302 = fmul contract float %252, %253
  %254 = load float, float* %d_initvalu_39, align 4
  %255 = load float, float* %ena_junc, align 4
  %sub303 = fsub contract float %254, %255
  %mul304 = fmul contract float %mul302, %sub303
  store float %mul304, float* %I_nabk_junc, align 4
  %256 = load float, float* %Fsl, align 4
  %257 = load float, float* %GNaB, align 4
  %mul305 = fmul contract float %256, %257
  %258 = load float, float* %d_initvalu_39, align 4
  %259 = load float, float* %ena_sl, align 4
  %sub306 = fsub contract float %258, %259
  %mul307 = fmul contract float %mul305, %sub306
  store float %mul307, float* %I_nabk_sl, align 4
  %260 = load float, float* %Nao, align 4
  %conv308 = fpext float %260 to double
  %div309 = fdiv double %conv308, 6.730000e+01
  %call310 = call fastcc double @_ZL3expd(double %div309) #4
  %sub311 = fsub contract double %call310, 1.000000e+00
  %div312 = fdiv double %sub311, 7.000000e+00
  %conv313 = fptrunc double %div312 to float
  store float %conv313, float* %sigma, align 4
  %261 = load float, float* %d_initvalu_39, align 4
  %conv314 = fpext float %261 to double
  %mul315 = fmul contract double -1.000000e-01, %conv314
  %262 = load float, float* %FoRT, align 4
  %conv316 = fpext float %262 to double
  %mul317 = fmul contract double %mul315, %conv316
  %call318 = call fastcc double @_ZL3expd(double %mul317) #4
  %mul319 = fmul contract double 1.245000e-01, %call318
  %add320 = fadd contract double 1.000000e+00, %mul319
  %263 = load float, float* %sigma, align 4
  %conv321 = fpext float %263 to double
  %mul322 = fmul contract double 3.650000e-02, %conv321
  %264 = load float, float* %d_initvalu_39, align 4
  %fneg323 = fneg float %264
  %265 = load float, float* %FoRT, align 4
  %mul324 = fmul contract float %fneg323, %265
  %call325 = call fastcc float @_ZL3expf(float %mul324) #4
  %conv326 = fpext float %call325 to double
  %mul327 = fmul contract double %mul322, %conv326
  %add328 = fadd contract double %add320, %mul327
  %div329 = fdiv double 1.000000e+00, %add328
  %conv330 = fptrunc double %div329 to float
  store float %conv330, float* %fnak, align 4
  %266 = load float, float* %Fjunc, align 4
  %267 = load float, float* %IbarNaK, align 4
  %mul331 = fmul contract float %266, %267
  %268 = load float, float* %fnak, align 4
  %mul332 = fmul contract float %mul331, %268
  %269 = load float, float* %Ko, align 4
  %mul333 = fmul contract float %mul332, %269
  %270 = load float, float* %KmNaip, align 4
  %271 = load float, float* %d_initvalu_32, align 4
  %div334 = fdiv float %270, %271
  %call335 = call fastcc float @_ZL3powfi(float %div334, i32 4) #4
  %add336 = fadd contract float 1.000000e+00, %call335
  %div337 = fdiv float %mul333, %add336
  %272 = load float, float* %Ko, align 4
  %273 = load float, float* %KmKo, align 4
  %add338 = fadd contract float %272, %273
  %div339 = fdiv float %div337, %add338
  store float %div339, float* %I_nak_junc, align 4
  %274 = load float, float* %Fsl, align 4
  %275 = load float, float* %IbarNaK, align 4
  %mul340 = fmul contract float %274, %275
  %276 = load float, float* %fnak, align 4
  %mul341 = fmul contract float %mul340, %276
  %277 = load float, float* %Ko, align 4
  %mul342 = fmul contract float %mul341, %277
  %278 = load float, float* %KmNaip, align 4
  %279 = load float, float* %d_initvalu_33, align 4
  %div343 = fdiv float %278, %279
  %call344 = call fastcc float @_ZL3powfi(float %div343, i32 4) #4
  %add345 = fadd contract float 1.000000e+00, %call344
  %div346 = fdiv float %mul342, %add345
  %280 = load float, float* %Ko, align 4
  %281 = load float, float* %KmKo, align 4
  %add347 = fadd contract float %280, %281
  %div348 = fdiv float %div346, %add347
  store float %div348, float* %I_nak_sl, align 4
  %282 = load float, float* %I_nak_junc, align 4
  %283 = load float, float* %I_nak_sl, align 4
  %add349 = fadd contract float %282, %283
  store float %add349, float* %I_nak, align 4
  %284 = load float, float* %Ko, align 4
  %conv350 = fpext float %284 to double
  %div351 = fdiv double %conv350, 5.400000e+00
  %call352 = call fastcc double @_ZL4sqrtd(double %div351) #4
  %mul353 = fmul contract double 3.000000e-02, %call352
  %conv354 = fptrunc double %mul353 to float
  store float %conv354, float* %gkr, align 4
  %285 = load float, float* %d_initvalu_39, align 4
  %add355 = fadd contract float %285, 5.000000e+01
  %fneg356 = fneg float %add355
  %conv357 = fpext float %fneg356 to double
  %div358 = fdiv double %conv357, 7.500000e+00
  %call359 = call fastcc double @_ZL3expd(double %div358) #4
  %add360 = fadd contract double 1.000000e+00, %call359
  %div361 = fdiv double 1.000000e+00, %add360
  %conv362 = fptrunc double %div361 to float
  store float %conv362, float* %xrss, align 4
  %286 = load float, float* %d_initvalu_39, align 4
  %add363 = fadd contract float %286, 7.000000e+00
  %conv364 = fpext float %add363 to double
  %mul365 = fmul contract double 1.380000e-03, %conv364
  %287 = load float, float* %d_initvalu_39, align 4
  %add366 = fadd contract float %287, 7.000000e+00
  %conv367 = fpext float %add366 to double
  %mul368 = fmul contract double -1.230000e-01, %conv367
  %call369 = call fastcc double @_ZL3expd(double %mul368) #4
  %sub370 = fsub contract double 1.000000e+00, %call369
  %div371 = fdiv double %mul365, %sub370
  %288 = load float, float* %d_initvalu_39, align 4
  %add372 = fadd contract float %288, 1.000000e+01
  %conv373 = fpext float %add372 to double
  %mul374 = fmul contract double 6.100000e-04, %conv373
  %289 = load float, float* %d_initvalu_39, align 4
  %add375 = fadd contract float %289, 1.000000e+01
  %conv376 = fpext float %add375 to double
  %mul377 = fmul contract double 1.450000e-01, %conv376
  %call378 = call fastcc double @_ZL3expd(double %mul377) #4
  %sub379 = fsub contract double %call378, 1.000000e+00
  %div380 = fdiv double %mul374, %sub379
  %add381 = fadd contract double %div371, %div380
  %div382 = fdiv double 1.000000e+00, %add381
  %conv383 = fptrunc double %div382 to float
  store float %conv383, float* %tauxr, align 4
  %290 = load float, float* %xrss, align 4
  %291 = load float, float* %d_initvalu_12, align 4
  %sub384 = fsub contract float %290, %291
  %292 = load float, float* %tauxr, align 4
  %div385 = fdiv float %sub384, %292
  %293 = load float*, float** %d_finavalu.addr, align 8
  %294 = load i32, i32* %offset_12, align 4
  %idxprom386 = sext i32 %294 to i64
  %arrayidx387 = getelementptr inbounds float, float* %293, i64 %idxprom386
  store float %div385, float* %arrayidx387, align 4
  %295 = load float, float* %d_initvalu_39, align 4
  %add388 = fadd contract float %295, 3.300000e+01
  %conv389 = fpext float %add388 to double
  %div390 = fdiv double %conv389, 2.240000e+01
  %call391 = call fastcc double @_ZL3expd(double %div390) #4
  %add392 = fadd contract double 1.000000e+00, %call391
  %div393 = fdiv double 1.000000e+00, %add392
  %conv394 = fptrunc double %div393 to float
  store float %conv394, float* %rkr, align 4
  %296 = load float, float* %gkr, align 4
  %297 = load float, float* %d_initvalu_12, align 4
  %mul395 = fmul contract float %296, %297
  %298 = load float, float* %rkr, align 4
  %mul396 = fmul contract float %mul395, %298
  %299 = load float, float* %d_initvalu_39, align 4
  %300 = load float, float* %ek, align 4
  %sub397 = fsub contract float %299, %300
  %mul398 = fmul contract float %mul396, %sub397
  store float %mul398, float* %I_kr, align 4
  %301 = load float, float* %d_initvalu_36, align 4
  %call399 = call fastcc float @_ZL5log10f(float %301) #4
  %fneg400 = fneg float %call399
  %conv401 = fpext float %fneg400 to double
  %add402 = fadd contract double %conv401, 3.000000e+00
  %conv403 = fptrunc double %add402 to float
  store float %conv403, float* %pcaks_junc, align 4
  %302 = load float, float* %d_initvalu_37, align 4
  %call404 = call fastcc float @_ZL5log10f(float %302) #4
  %fneg405 = fneg float %call404
  %conv406 = fpext float %fneg405 to double
  %add407 = fadd contract double %conv406, 3.000000e+00
  %conv408 = fptrunc double %add407 to float
  store float %conv408, float* %pcaks_sl, align 4
  %303 = load float, float* %pcaks_junc, align 4
  %conv409 = fpext float %303 to double
  %add410 = fadd contract double -7.200000e+00, %conv409
  %div411 = fdiv double %add410, 6.000000e-01
  %call412 = call fastcc double @_ZL3expd(double %div411) #4
  %add413 = fadd contract double 1.000000e+00, %call412
  %div414 = fdiv double 1.900000e-01, %add413
  %add415 = fadd contract double 5.700000e-02, %div414
  %mul416 = fmul contract double 7.000000e-02, %add415
  %conv417 = fptrunc double %mul416 to float
  store float %conv417, float* %gks_junc, align 4
  %304 = load float, float* %pcaks_sl, align 4
  %conv418 = fpext float %304 to double
  %add419 = fadd contract double -7.200000e+00, %conv418
  %div420 = fdiv double %add419, 6.000000e-01
  %call421 = call fastcc double @_ZL3expd(double %div420) #4
  %add422 = fadd contract double 1.000000e+00, %call421
  %div423 = fdiv double 1.900000e-01, %add422
  %add424 = fadd contract double 5.700000e-02, %div423
  %mul425 = fmul contract double 7.000000e-02, %add424
  %conv426 = fptrunc double %mul425 to float
  store float %conv426, float* %gks_sl, align 4
  %305 = load float, float* %FoRT, align 4
  %div427 = fdiv float 1.000000e+00, %305
  %306 = load float, float* %Ko, align 4
  %307 = load float, float* %pNaK, align 4
  %308 = load float, float* %Nao, align 4
  %mul428 = fmul contract float %307, %308
  %add429 = fadd contract float %306, %mul428
  %309 = load float, float* %d_initvalu_35, align 4
  %310 = load float, float* %pNaK, align 4
  %311 = load float, float* %d_initvalu_34, align 4
  %mul430 = fmul contract float %310, %311
  %add431 = fadd contract float %309, %mul430
  %div432 = fdiv float %add429, %add431
  %call433 = call fastcc float @_ZL3logf(float %div432) #4
  %mul434 = fmul contract float %div427, %call433
  store float %mul434, float* %eks, align 4
  %312 = load float, float* %d_initvalu_39, align 4
  %conv435 = fpext float %312 to double
  %sub436 = fsub contract double %conv435, 1.500000e+00
  %fneg437 = fneg double %sub436
  %div438 = fdiv double %fneg437, 1.670000e+01
  %call439 = call fastcc double @_ZL3expd(double %div438) #4
  %add440 = fadd contract double 1.000000e+00, %call439
  %div441 = fdiv double 1.000000e+00, %add440
  %conv442 = fptrunc double %div441 to float
  store float %conv442, float* %xsss, align 4
  %313 = load float, float* %d_initvalu_39, align 4
  %add443 = fadd contract float %313, 3.000000e+01
  %conv444 = fpext float %add443 to double
  %mul445 = fmul contract double 7.190000e-05, %conv444
  %314 = load float, float* %d_initvalu_39, align 4
  %add446 = fadd contract float %314, 3.000000e+01
  %conv447 = fpext float %add446 to double
  %mul448 = fmul contract double -1.480000e-01, %conv447
  %call449 = call fastcc double @_ZL3expd(double %mul448) #4
  %sub450 = fsub contract double 1.000000e+00, %call449
  %div451 = fdiv double %mul445, %sub450
  %315 = load float, float* %d_initvalu_39, align 4
  %add452 = fadd contract float %315, 3.000000e+01
  %conv453 = fpext float %add452 to double
  %mul454 = fmul contract double 1.310000e-04, %conv453
  %316 = load float, float* %d_initvalu_39, align 4
  %add455 = fadd contract float %316, 3.000000e+01
  %conv456 = fpext float %add455 to double
  %mul457 = fmul contract double 0x3FB19652BD3C3611, %conv456
  %call458 = call fastcc double @_ZL3expd(double %mul457) #4
  %sub459 = fsub contract double %call458, 1.000000e+00
  %div460 = fdiv double %mul454, %sub459
  %add461 = fadd contract double %div451, %div460
  %div462 = fdiv double 1.000000e+00, %add461
  %conv463 = fptrunc double %div462 to float
  store float %conv463, float* %tauxs, align 4
  %317 = load float, float* %xsss, align 4
  %318 = load float, float* %d_initvalu_13, align 4
  %sub464 = fsub contract float %317, %318
  %319 = load float, float* %tauxs, align 4
  %div465 = fdiv float %sub464, %319
  %320 = load float*, float** %d_finavalu.addr, align 8
  %321 = load i32, i32* %offset_13, align 4
  %idxprom466 = sext i32 %321 to i64
  %arrayidx467 = getelementptr inbounds float, float* %320, i64 %idxprom466
  store float %div465, float* %arrayidx467, align 4
  %322 = load float, float* %Fjunc, align 4
  %323 = load float, float* %gks_junc, align 4
  %mul468 = fmul contract float %322, %323
  %324 = load float, float* %d_initvalu_12, align 4
  %call469 = call fastcc float @_ZL3powfi(float %324, i32 2) #4
  %mul470 = fmul contract float %mul468, %call469
  %325 = load float, float* %d_initvalu_39, align 4
  %326 = load float, float* %eks, align 4
  %sub471 = fsub contract float %325, %326
  %mul472 = fmul contract float %mul470, %sub471
  store float %mul472, float* %I_ks_junc, align 4
  %327 = load float, float* %Fsl, align 4
  %328 = load float, float* %gks_sl, align 4
  %mul473 = fmul contract float %327, %328
  %329 = load float, float* %d_initvalu_13, align 4
  %call474 = call fastcc float @_ZL3powfi(float %329, i32 2) #4
  %mul475 = fmul contract float %mul473, %call474
  %330 = load float, float* %d_initvalu_39, align 4
  %331 = load float, float* %eks, align 4
  %sub476 = fsub contract float %330, %331
  %mul477 = fmul contract float %mul475, %sub476
  store float %mul477, float* %I_ks_sl, align 4
  %332 = load float, float* %I_ks_junc, align 4
  %333 = load float, float* %I_ks_sl, align 4
  %add478 = fadd contract float %332, %333
  store float %add478, float* %I_ks, align 4
  %334 = load float, float* %d_initvalu_39, align 4
  %conv479 = fpext float %334 to double
  %div480 = fdiv double %conv479, 5.980000e+00
  %sub481 = fsub contract double 7.488000e+00, %div480
  %call482 = call fastcc double @_ZL3expd(double %sub481) #4
  %add483 = fadd contract double 1.000000e+00, %call482
  %div484 = fdiv double 1.000000e+00, %add483
  %conv485 = fptrunc double %div484 to float
  store float %conv485, float* %kp_kp, align 4
  %335 = load float, float* %Fjunc, align 4
  %336 = load float, float* %gkp, align 4
  %mul486 = fmul contract float %335, %336
  %337 = load float, float* %kp_kp, align 4
  %mul487 = fmul contract float %mul486, %337
  %338 = load float, float* %d_initvalu_39, align 4
  %339 = load float, float* %ek, align 4
  %sub488 = fsub contract float %338, %339
  %mul489 = fmul contract float %mul487, %sub488
  store float %mul489, float* %I_kp_junc, align 4
  %340 = load float, float* %Fsl, align 4
  %341 = load float, float* %gkp, align 4
  %mul490 = fmul contract float %340, %341
  %342 = load float, float* %kp_kp, align 4
  %mul491 = fmul contract float %mul490, %342
  %343 = load float, float* %d_initvalu_39, align 4
  %344 = load float, float* %ek, align 4
  %sub492 = fsub contract float %343, %344
  %mul493 = fmul contract float %mul491, %sub492
  store float %mul493, float* %I_kp_sl, align 4
  %345 = load float, float* %I_kp_junc, align 4
  %346 = load float, float* %I_kp_sl, align 4
  %add494 = fadd contract float %345, %346
  store float %add494, float* %I_kp, align 4
  %347 = load float, float* %d_initvalu_39, align 4
  %conv495 = fpext float %347 to double
  %add496 = fadd contract double %conv495, 3.000000e+00
  %fneg497 = fneg double %add496
  %div498 = fdiv double %fneg497, 1.500000e+01
  %call499 = call fastcc double @_ZL3expd(double %div498) #4
  %add500 = fadd contract double 1.000000e+00, %call499
  %div501 = fdiv double 1.000000e+00, %add500
  %conv502 = fptrunc double %div501 to float
  store float %conv502, float* %xtoss, align 4
  %348 = load float, float* %d_initvalu_39, align 4
  %conv503 = fpext float %348 to double
  %add504 = fadd contract double %conv503, 3.350000e+01
  %div505 = fdiv double %add504, 1.000000e+01
  %call506 = call fastcc double @_ZL3expd(double %div505) #4
  %add507 = fadd contract double 1.000000e+00, %call506
  %div508 = fdiv double 1.000000e+00, %add507
  %conv509 = fptrunc double %div508 to float
  store float %conv509, float* %ytoss, align 4
  %349 = load float, float* %d_initvalu_39, align 4
  %conv510 = fpext float %349 to double
  %add511 = fadd contract double %conv510, 3.350000e+01
  %div512 = fdiv double %add511, 1.000000e+01
  %call513 = call fastcc double @_ZL3expd(double %div512) #4
  %add514 = fadd contract double 1.000000e+00, %call513
  %div515 = fdiv double 1.000000e+00, %add514
  %conv516 = fptrunc double %div515 to float
  store float %conv516, float* %rtoss, align 4
  %350 = load float, float* %d_initvalu_39, align 4
  %conv517 = fpext float %350 to double
  %add518 = fadd contract double %conv517, 3.000000e+00
  %div519 = fdiv double %add518, 1.500000e+01
  %call520 = call fastcc double @_ZL3expd(double %div519) #4
  %add521 = fadd contract double 1.000000e+00, %call520
  %div522 = fdiv double 9.000000e+00, %add521
  %add523 = fadd contract double %div522, 5.000000e-01
  %conv524 = fptrunc double %add523 to float
  store float %conv524, float* %tauxtos, align 4
  %351 = load float, float* %d_initvalu_39, align 4
  %conv525 = fpext float %351 to double
  %add526 = fadd contract double %conv525, 6.000000e+01
  %div527 = fdiv double %add526, 1.000000e+01
  %call528 = call fastcc double @_ZL3expd(double %div527) #4
  %add529 = fadd contract double 1.000000e+00, %call528
  %div530 = fdiv double 3.000000e+03, %add529
  %add531 = fadd contract double %div530, 3.000000e+01
  %conv532 = fptrunc double %add531 to float
  store float %conv532, float* %tauytos, align 4
  %352 = load float, float* %d_initvalu_39, align 4
  %conv533 = fpext float %352 to double
  %add534 = fadd contract double %conv533, 6.000000e+01
  %div535 = fdiv double %add534, 1.000000e+01
  %call536 = call fastcc double @_ZL3expd(double %div535) #4
  %add537 = fadd contract double 1.000000e+00, %call536
  %div538 = fdiv double 2.800000e+03, %add537
  %add539 = fadd contract double %div538, 2.200000e+02
  %conv540 = fptrunc double %add539 to float
  store float %conv540, float* %taurtos, align 4
  %353 = load float, float* %xtoss, align 4
  %354 = load float, float* %d_initvalu_8, align 4
  %sub541 = fsub contract float %353, %354
  %355 = load float, float* %tauxtos, align 4
  %div542 = fdiv float %sub541, %355
  %356 = load float*, float** %d_finavalu.addr, align 8
  %357 = load i32, i32* %offset_8, align 4
  %idxprom543 = sext i32 %357 to i64
  %arrayidx544 = getelementptr inbounds float, float* %356, i64 %idxprom543
  store float %div542, float* %arrayidx544, align 4
  %358 = load float, float* %ytoss, align 4
  %359 = load float, float* %d_initvalu_9, align 4
  %sub545 = fsub contract float %358, %359
  %360 = load float, float* %tauytos, align 4
  %div546 = fdiv float %sub545, %360
  %361 = load float*, float** %d_finavalu.addr, align 8
  %362 = load i32, i32* %offset_9, align 4
  %idxprom547 = sext i32 %362 to i64
  %arrayidx548 = getelementptr inbounds float, float* %361, i64 %idxprom547
  store float %div546, float* %arrayidx548, align 4
  %363 = load float, float* %rtoss, align 4
  %364 = load float, float* %d_initvalu_40, align 4
  %sub549 = fsub contract float %363, %364
  %365 = load float, float* %taurtos, align 4
  %div550 = fdiv float %sub549, %365
  %366 = load float*, float** %d_finavalu.addr, align 8
  %367 = load i32, i32* %offset_40, align 4
  %idxprom551 = sext i32 %367 to i64
  %arrayidx552 = getelementptr inbounds float, float* %366, i64 %idxprom551
  store float %div550, float* %arrayidx552, align 4
  %368 = load float, float* %GtoSlow, align 4
  %369 = load float, float* %d_initvalu_8, align 4
  %mul553 = fmul contract float %368, %369
  %conv554 = fpext float %mul553 to double
  %370 = load float, float* %d_initvalu_9, align 4
  %conv555 = fpext float %370 to double
  %371 = load float, float* %d_initvalu_40, align 4
  %conv556 = fpext float %371 to double
  %mul557 = fmul contract double 5.000000e-01, %conv556
  %add558 = fadd contract double %conv555, %mul557
  %mul559 = fmul contract double %conv554, %add558
  %372 = load float, float* %d_initvalu_39, align 4
  %373 = load float, float* %ek, align 4
  %sub560 = fsub contract float %372, %373
  %conv561 = fpext float %sub560 to double
  %mul562 = fmul contract double %mul559, %conv561
  %conv563 = fptrunc double %mul562 to float
  store float %conv563, float* %I_tos, align 4
  %374 = load float, float* %d_initvalu_39, align 4
  %fneg564 = fneg float %374
  %375 = load float, float* %d_initvalu_39, align 4
  %mul565 = fmul contract float %fneg564, %375
  %div566 = fdiv float %mul565, 3.000000e+01
  %div567 = fdiv float %div566, 3.000000e+01
  %call568 = call fastcc float @_ZL3expf(float %div567) #4
  %conv569 = fpext float %call568 to double
  %mul570 = fmul contract double 3.500000e+00, %conv569
  %add571 = fadd contract double %mul570, 1.500000e+00
  %conv572 = fptrunc double %add571 to float
  store float %conv572, float* %tauxtof, align 4
  %376 = load float, float* %d_initvalu_39, align 4
  %conv573 = fpext float %376 to double
  %add574 = fadd contract double %conv573, 3.350000e+01
  %div575 = fdiv double %add574, 1.000000e+01
  %call576 = call fastcc double @_ZL3expd(double %div575) #4
  %add577 = fadd contract double 1.000000e+00, %call576
  %div578 = fdiv double 2.000000e+01, %add577
  %add579 = fadd contract double %div578, 2.000000e+01
  %conv580 = fptrunc double %add579 to float
  store float %conv580, float* %tauytof, align 4
  %377 = load float, float* %xtoss, align 4
  %378 = load float, float* %d_initvalu_10, align 4
  %sub581 = fsub contract float %377, %378
  %379 = load float, float* %tauxtof, align 4
  %div582 = fdiv float %sub581, %379
  %380 = load float*, float** %d_finavalu.addr, align 8
  %381 = load i32, i32* %offset_10, align 4
  %idxprom583 = sext i32 %381 to i64
  %arrayidx584 = getelementptr inbounds float, float* %380, i64 %idxprom583
  store float %div582, float* %arrayidx584, align 4
  %382 = load float, float* %ytoss, align 4
  %383 = load float, float* %d_initvalu_11, align 4
  %sub585 = fsub contract float %382, %383
  %384 = load float, float* %tauytof, align 4
  %div586 = fdiv float %sub585, %384
  %385 = load float*, float** %d_finavalu.addr, align 8
  %386 = load i32, i32* %offset_11, align 4
  %idxprom587 = sext i32 %386 to i64
  %arrayidx588 = getelementptr inbounds float, float* %385, i64 %idxprom587
  store float %div586, float* %arrayidx588, align 4
  %387 = load float, float* %GtoFast, align 4
  %388 = load float, float* %d_initvalu_10, align 4
  %mul589 = fmul contract float %387, %388
  %389 = load float, float* %d_initvalu_11, align 4
  %mul590 = fmul contract float %mul589, %389
  %390 = load float, float* %d_initvalu_39, align 4
  %391 = load float, float* %ek, align 4
  %sub591 = fsub contract float %390, %391
  %mul592 = fmul contract float %mul590, %sub591
  store float %mul592, float* %I_tof, align 4
  %392 = load float, float* %I_tos, align 4
  %393 = load float, float* %I_tof, align 4
  %add593 = fadd contract float %392, %393
  store float %add593, float* %I_to, align 4
  %394 = load float, float* %d_initvalu_39, align 4
  %395 = load float, float* %ek, align 4
  %sub594 = fsub contract float %394, %395
  %conv595 = fpext float %sub594 to double
  %sub596 = fsub contract double %conv595, 5.921500e+01
  %mul597 = fmul contract double 2.385000e-01, %sub596
  %call598 = call fastcc double @_ZL3expd(double %mul597) #4
  %add599 = fadd contract double 1.000000e+00, %call598
  %div600 = fdiv double 1.020000e+00, %add599
  %conv601 = fptrunc double %div600 to float
  store float %conv601, float* %aki, align 4
  %396 = load float, float* %d_initvalu_39, align 4
  %conv602 = fpext float %396 to double
  %add603 = fadd contract double %conv602, 5.476000e+00
  %397 = load float, float* %ek, align 4
  %conv604 = fpext float %397 to double
  %sub605 = fsub contract double %add603, %conv604
  %mul606 = fmul contract double 8.032000e-02, %sub605
  %call607 = call fastcc double @_ZL3expd(double %mul606) #4
  %mul608 = fmul contract double 4.912400e-01, %call607
  %398 = load float, float* %d_initvalu_39, align 4
  %399 = load float, float* %ek, align 4
  %sub609 = fsub contract float %398, %399
  %conv610 = fpext float %sub609 to double
  %sub611 = fsub contract double %conv610, 5.943100e+02
  %mul612 = fmul contract double 6.175000e-02, %sub611
  %call613 = call fastcc double @_ZL3expd(double %mul612) #4
  %add614 = fadd contract double %mul608, %call613
  %400 = load float, float* %d_initvalu_39, align 4
  %401 = load float, float* %ek, align 4
  %sub615 = fsub contract float %400, %401
  %conv616 = fpext float %sub615 to double
  %add617 = fadd contract double %conv616, 4.753000e+00
  %mul618 = fmul contract double -5.143000e-01, %add617
  %call619 = call fastcc double @_ZL3expd(double %mul618) #4
  %add620 = fadd contract double 1.000000e+00, %call619
  %div621 = fdiv double %add614, %add620
  %conv622 = fptrunc double %div621 to float
  store float %conv622, float* %bki, align 4
  %402 = load float, float* %aki, align 4
  %403 = load float, float* %aki, align 4
  %404 = load float, float* %bki, align 4
  %add623 = fadd contract float %403, %404
  %div624 = fdiv float %402, %add623
  store float %div624, float* %kiss, align 4
  %405 = load float, float* %Ko, align 4
  %conv625 = fpext float %405 to double
  %div626 = fdiv double %conv625, 5.400000e+00
  %call627 = call fastcc double @_ZL4sqrtd(double %div626) #4
  %mul628 = fmul contract double 9.000000e-01, %call627
  %406 = load float, float* %kiss, align 4
  %conv629 = fpext float %406 to double
  %mul630 = fmul contract double %mul628, %conv629
  %407 = load float, float* %d_initvalu_39, align 4
  %408 = load float, float* %ek, align 4
  %sub631 = fsub contract float %407, %408
  %conv632 = fpext float %sub631 to double
  %mul633 = fmul contract double %mul630, %conv632
  %conv634 = fptrunc double %mul633 to float
  store float %conv634, float* %I_ki, align 4
  %409 = load float, float* %Fjunc, align 4
  %410 = load float, float* %GClCa, align 4
  %mul635 = fmul contract float %409, %410
  %411 = load float, float* %KdClCa, align 4
  %412 = load float, float* %d_initvalu_36, align 4
  %div636 = fdiv float %411, %412
  %add637 = fadd contract float 1.000000e+00, %div636
  %div638 = fdiv float %mul635, %add637
  %413 = load float, float* %d_initvalu_39, align 4
  %414 = load float, float* %ecl, align 4
  %sub639 = fsub contract float %413, %414
  %mul640 = fmul contract float %div638, %sub639
  store float %mul640, float* %I_ClCa_junc, align 4
  %415 = load float, float* %Fsl, align 4
  %416 = load float, float* %GClCa, align 4
  %mul641 = fmul contract float %415, %416
  %417 = load float, float* %KdClCa, align 4
  %418 = load float, float* %d_initvalu_37, align 4
  %div642 = fdiv float %417, %418
  %add643 = fadd contract float 1.000000e+00, %div642
  %div644 = fdiv float %mul641, %add643
  %419 = load float, float* %d_initvalu_39, align 4
  %420 = load float, float* %ecl, align 4
  %sub645 = fsub contract float %419, %420
  %mul646 = fmul contract float %div644, %sub645
  store float %mul646, float* %I_ClCa_sl, align 4
  %421 = load float, float* %I_ClCa_junc, align 4
  %422 = load float, float* %I_ClCa_sl, align 4
  %add647 = fadd contract float %421, %422
  store float %add647, float* %I_ClCa, align 4
  %423 = load float, float* %GClB, align 4
  %424 = load float, float* %d_initvalu_39, align 4
  %425 = load float, float* %ecl, align 4
  %sub648 = fsub contract float %424, %425
  %mul649 = fmul contract float %423, %sub648
  store float %mul649, float* %I_Clbk, align 4
  %426 = load float, float* %d_initvalu_39, align 4
  %conv650 = fpext float %426 to double
  %add651 = fadd contract double %conv650, 1.450000e+01
  %fneg652 = fneg double %add651
  %div653 = fdiv double %fneg652, 6.000000e+00
  %call654 = call fastcc double @_ZL3expd(double %div653) #4
  %add655 = fadd contract double 1.000000e+00, %call654
  %div656 = fdiv double 1.000000e+00, %add655
  %conv657 = fptrunc double %div656 to float
  store float %conv657, float* %dss, align 4
  %427 = load float, float* %dss, align 4
  %conv658 = fpext float %427 to double
  %428 = load float, float* %d_initvalu_39, align 4
  %conv659 = fpext float %428 to double
  %add660 = fadd contract double %conv659, 1.450000e+01
  %fneg661 = fneg double %add660
  %div662 = fdiv double %fneg661, 6.000000e+00
  %call663 = call fastcc double @_ZL3expd(double %div662) #4
  %sub664 = fsub contract double 1.000000e+00, %call663
  %mul665 = fmul contract double %conv658, %sub664
  %429 = load float, float* %d_initvalu_39, align 4
  %conv666 = fpext float %429 to double
  %add667 = fadd contract double %conv666, 1.450000e+01
  %mul668 = fmul contract double 3.500000e-02, %add667
  %div669 = fdiv double %mul665, %mul668
  %conv670 = fptrunc double %div669 to float
  store float %conv670, float* %taud, align 4
  %430 = load float, float* %d_initvalu_39, align 4
  %conv671 = fpext float %430 to double
  %add672 = fadd contract double %conv671, 3.506000e+01
  %div673 = fdiv double %add672, 3.600000e+00
  %call674 = call fastcc double @_ZL3expd(double %div673) #4
  %add675 = fadd contract double 1.000000e+00, %call674
  %div676 = fdiv double 1.000000e+00, %add675
  %431 = load float, float* %d_initvalu_39, align 4
  %sub677 = fsub contract float 5.000000e+01, %431
  %div678 = fdiv float %sub677, 2.000000e+01
  %call679 = call fastcc float @_ZL3expf(float %div678) #4
  %add680 = fadd contract float 1.000000e+00, %call679
  %conv681 = fpext float %add680 to double
  %div682 = fdiv double 6.000000e-01, %conv681
  %add683 = fadd contract double %div676, %div682
  %conv684 = fptrunc double %add683 to float
  store float %conv684, float* %fss, align 4
  %432 = load float, float* %d_initvalu_39, align 4
  %conv685 = fpext float %432 to double
  %add686 = fadd contract double %conv685, 1.450000e+01
  %mul687 = fmul contract double 3.370000e-02, %add686
  %call688 = call fastcc double @_ZL3powdi(double %mul687) #4
  %fneg689 = fneg double %call688
  %call690 = call fastcc double @_ZL3expd(double %fneg689) #4
  %mul691 = fmul contract double 1.970000e-02, %call690
  %add692 = fadd contract double %mul691, 2.000000e-02
  %div693 = fdiv double 1.000000e+00, %add692
  %conv694 = fptrunc double %div693 to float
  store float %conv694, float* %tauf, align 4
  %433 = load float, float* %dss, align 4
  %434 = load float, float* %d_initvalu_4, align 4
  %sub695 = fsub contract float %433, %434
  %435 = load float, float* %taud, align 4
  %div696 = fdiv float %sub695, %435
  %436 = load float*, float** %d_finavalu.addr, align 8
  %437 = load i32, i32* %offset_4, align 4
  %idxprom697 = sext i32 %437 to i64
  %arrayidx698 = getelementptr inbounds float, float* %436, i64 %idxprom697
  store float %div696, float* %arrayidx698, align 4
  %438 = load float, float* %fss, align 4
  %439 = load float, float* %d_initvalu_5, align 4
  %sub699 = fsub contract float %438, %439
  %440 = load float, float* %tauf, align 4
  %div700 = fdiv float %sub699, %440
  %441 = load float*, float** %d_finavalu.addr, align 8
  %442 = load i32, i32* %offset_5, align 4
  %idxprom701 = sext i32 %442 to i64
  %arrayidx702 = getelementptr inbounds float, float* %441, i64 %idxprom701
  store float %div700, float* %arrayidx702, align 4
  %443 = load float, float* %d_initvalu_36, align 4
  %conv703 = fpext float %443 to double
  %mul704 = fmul contract double 1.700000e+00, %conv703
  %444 = load float, float* %d_initvalu_6, align 4
  %sub705 = fsub contract float 1.000000e+00, %444
  %conv706 = fpext float %sub705 to double
  %mul707 = fmul contract double %mul704, %conv706
  %445 = load float, float* %d_initvalu_6, align 4
  %conv708 = fpext float %445 to double
  %mul709 = fmul contract double 1.190000e-02, %conv708
  %sub710 = fsub contract double %mul707, %mul709
  %conv711 = fptrunc double %sub710 to float
  %446 = load float*, float** %d_finavalu.addr, align 8
  %447 = load i32, i32* %offset_6, align 4
  %idxprom712 = sext i32 %447 to i64
  %arrayidx713 = getelementptr inbounds float, float* %446, i64 %idxprom712
  store float %conv711, float* %arrayidx713, align 4
  %448 = load float, float* %d_initvalu_37, align 4
  %conv714 = fpext float %448 to double
  %mul715 = fmul contract double 1.700000e+00, %conv714
  %449 = load float, float* %d_initvalu_7, align 4
  %sub716 = fsub contract float 1.000000e+00, %449
  %conv717 = fpext float %sub716 to double
  %mul718 = fmul contract double %mul715, %conv717
  %450 = load float, float* %d_initvalu_7, align 4
  %conv719 = fpext float %450 to double
  %mul720 = fmul contract double 1.190000e-02, %conv719
  %sub721 = fsub contract double %mul718, %mul720
  %conv722 = fptrunc double %sub721 to float
  %451 = load float*, float** %d_finavalu.addr, align 8
  %452 = load i32, i32* %offset_7, align 4
  %idxprom723 = sext i32 %452 to i64
  %arrayidx724 = getelementptr inbounds float, float* %451, i64 %idxprom723
  store float %conv722, float* %arrayidx724, align 4
  %453 = load float, float* %pCa, align 4
  %mul725 = fmul contract float %453, 4.000000e+00
  %454 = load float, float* %d_initvalu_39, align 4
  %455 = load float, float* %Frdy, align 4
  %mul726 = fmul contract float %454, %455
  %456 = load float, float* %FoRT, align 4
  %mul727 = fmul contract float %mul726, %456
  %mul728 = fmul contract float %mul725, %mul727
  %conv729 = fpext float %mul728 to double
  %457 = load float, float* %d_initvalu_36, align 4
  %conv730 = fpext float %457 to double
  %mul731 = fmul contract double 3.410000e-01, %conv730
  %458 = load float, float* %d_initvalu_39, align 4
  %mul732 = fmul contract float 2.000000e+00, %458
  %459 = load float, float* %FoRT, align 4
  %mul733 = fmul contract float %mul732, %459
  %call734 = call fastcc float @_ZL3expf(float %mul733) #4
  %conv735 = fpext float %call734 to double
  %mul736 = fmul contract double %mul731, %conv735
  %460 = load float, float* %Cao, align 4
  %conv737 = fpext float %460 to double
  %mul738 = fmul contract double 3.410000e-01, %conv737
  %sub739 = fsub contract double %mul736, %mul738
  %mul740 = fmul contract double %conv729, %sub739
  %461 = load float, float* %d_initvalu_39, align 4
  %mul741 = fmul contract float 2.000000e+00, %461
  %462 = load float, float* %FoRT, align 4
  %mul742 = fmul contract float %mul741, %462
  %call743 = call fastcc float @_ZL3expf(float %mul742) #4
  %sub744 = fsub contract float %call743, 1.000000e+00
  %conv745 = fpext float %sub744 to double
  %div746 = fdiv double %mul740, %conv745
  %conv747 = fptrunc double %div746 to float
  store float %conv747, float* %ibarca_j, align 4
  %463 = load float, float* %pCa, align 4
  %mul748 = fmul contract float %463, 4.000000e+00
  %464 = load float, float* %d_initvalu_39, align 4
  %465 = load float, float* %Frdy, align 4
  %mul749 = fmul contract float %464, %465
  %466 = load float, float* %FoRT, align 4
  %mul750 = fmul contract float %mul749, %466
  %mul751 = fmul contract float %mul748, %mul750
  %conv752 = fpext float %mul751 to double
  %467 = load float, float* %d_initvalu_37, align 4
  %conv753 = fpext float %467 to double
  %mul754 = fmul contract double 3.410000e-01, %conv753
  %468 = load float, float* %d_initvalu_39, align 4
  %mul755 = fmul contract float 2.000000e+00, %468
  %469 = load float, float* %FoRT, align 4
  %mul756 = fmul contract float %mul755, %469
  %call757 = call fastcc float @_ZL3expf(float %mul756) #4
  %conv758 = fpext float %call757 to double
  %mul759 = fmul contract double %mul754, %conv758
  %470 = load float, float* %Cao, align 4
  %conv760 = fpext float %470 to double
  %mul761 = fmul contract double 3.410000e-01, %conv760
  %sub762 = fsub contract double %mul759, %mul761
  %mul763 = fmul contract double %conv752, %sub762
  %471 = load float, float* %d_initvalu_39, align 4
  %mul764 = fmul contract float 2.000000e+00, %471
  %472 = load float, float* %FoRT, align 4
  %mul765 = fmul contract float %mul764, %472
  %call766 = call fastcc float @_ZL3expf(float %mul765) #4
  %sub767 = fsub contract float %call766, 1.000000e+00
  %conv768 = fpext float %sub767 to double
  %div769 = fdiv double %mul763, %conv768
  %conv770 = fptrunc double %div769 to float
  store float %conv770, float* %ibarca_sl, align 4
  %473 = load float, float* %pK, align 4
  %474 = load float, float* %d_initvalu_39, align 4
  %475 = load float, float* %Frdy, align 4
  %mul771 = fmul contract float %474, %475
  %476 = load float, float* %FoRT, align 4
  %mul772 = fmul contract float %mul771, %476
  %mul773 = fmul contract float %473, %mul772
  %conv774 = fpext float %mul773 to double
  %477 = load float, float* %d_initvalu_35, align 4
  %conv775 = fpext float %477 to double
  %mul776 = fmul contract double 7.500000e-01, %conv775
  %478 = load float, float* %d_initvalu_39, align 4
  %479 = load float, float* %FoRT, align 4
  %mul777 = fmul contract float %478, %479
  %call778 = call fastcc float @_ZL3expf(float %mul777) #4
  %conv779 = fpext float %call778 to double
  %mul780 = fmul contract double %mul776, %conv779
  %480 = load float, float* %Ko, align 4
  %conv781 = fpext float %480 to double
  %mul782 = fmul contract double 7.500000e-01, %conv781
  %sub783 = fsub contract double %mul780, %mul782
  %mul784 = fmul contract double %conv774, %sub783
  %481 = load float, float* %d_initvalu_39, align 4
  %482 = load float, float* %FoRT, align 4
  %mul785 = fmul contract float %481, %482
  %call786 = call fastcc float @_ZL3expf(float %mul785) #4
  %sub787 = fsub contract float %call786, 1.000000e+00
  %conv788 = fpext float %sub787 to double
  %div789 = fdiv double %mul784, %conv788
  %conv790 = fptrunc double %div789 to float
  store float %conv790, float* %ibark, align 4
  %483 = load float, float* %pNa, align 4
  %484 = load float, float* %d_initvalu_39, align 4
  %485 = load float, float* %Frdy, align 4
  %mul791 = fmul contract float %484, %485
  %486 = load float, float* %FoRT, align 4
  %mul792 = fmul contract float %mul791, %486
  %mul793 = fmul contract float %483, %mul792
  %conv794 = fpext float %mul793 to double
  %487 = load float, float* %d_initvalu_32, align 4
  %conv795 = fpext float %487 to double
  %mul796 = fmul contract double 7.500000e-01, %conv795
  %488 = load float, float* %d_initvalu_39, align 4
  %489 = load float, float* %FoRT, align 4
  %mul797 = fmul contract float %488, %489
  %call798 = call fastcc float @_ZL3expf(float %mul797) #4
  %conv799 = fpext float %call798 to double
  %mul800 = fmul contract double %mul796, %conv799
  %490 = load float, float* %Nao, align 4
  %conv801 = fpext float %490 to double
  %mul802 = fmul contract double 7.500000e-01, %conv801
  %sub803 = fsub contract double %mul800, %mul802
  %mul804 = fmul contract double %conv794, %sub803
  %491 = load float, float* %d_initvalu_39, align 4
  %492 = load float, float* %FoRT, align 4
  %mul805 = fmul contract float %491, %492
  %call806 = call fastcc float @_ZL3expf(float %mul805) #4
  %sub807 = fsub contract float %call806, 1.000000e+00
  %conv808 = fpext float %sub807 to double
  %div809 = fdiv double %mul804, %conv808
  %conv810 = fptrunc double %div809 to float
  store float %conv810, float* %ibarna_j, align 4
  %493 = load float, float* %pNa, align 4
  %494 = load float, float* %d_initvalu_39, align 4
  %495 = load float, float* %Frdy, align 4
  %mul811 = fmul contract float %494, %495
  %496 = load float, float* %FoRT, align 4
  %mul812 = fmul contract float %mul811, %496
  %mul813 = fmul contract float %493, %mul812
  %conv814 = fpext float %mul813 to double
  %497 = load float, float* %d_initvalu_33, align 4
  %conv815 = fpext float %497 to double
  %mul816 = fmul contract double 7.500000e-01, %conv815
  %498 = load float, float* %d_initvalu_39, align 4
  %499 = load float, float* %FoRT, align 4
  %mul817 = fmul contract float %498, %499
  %call818 = call fastcc float @_ZL3expf(float %mul817) #4
  %conv819 = fpext float %call818 to double
  %mul820 = fmul contract double %mul816, %conv819
  %500 = load float, float* %Nao, align 4
  %conv821 = fpext float %500 to double
  %mul822 = fmul contract double 7.500000e-01, %conv821
  %sub823 = fsub contract double %mul820, %mul822
  %mul824 = fmul contract double %conv814, %sub823
  %501 = load float, float* %d_initvalu_39, align 4
  %502 = load float, float* %FoRT, align 4
  %mul825 = fmul contract float %501, %502
  %call826 = call fastcc float @_ZL3expf(float %mul825) #4
  %sub827 = fsub contract float %call826, 1.000000e+00
  %conv828 = fpext float %sub827 to double
  %div829 = fdiv double %mul824, %conv828
  %conv830 = fptrunc double %div829 to float
  store float %conv830, float* %ibarna_sl, align 4
  %503 = load float, float* %Fjunc_CaL, align 4
  %504 = load float, float* %ibarca_j, align 4
  %mul831 = fmul contract float %503, %504
  %505 = load float, float* %d_initvalu_4, align 4
  %mul832 = fmul contract float %mul831, %505
  %506 = load float, float* %d_initvalu_5, align 4
  %mul833 = fmul contract float %mul832, %506
  %507 = load float, float* %d_initvalu_6, align 4
  %sub834 = fsub contract float 1.000000e+00, %507
  %mul835 = fmul contract float %mul833, %sub834
  %508 = load float, float* %Q10CaL, align 4
  %509 = load float, float* %Qpow, align 4
  %call836 = call fastcc float @_ZL3powff(float %508, float %509) #4
  %mul837 = fmul contract float %mul835, %call836
  %conv838 = fpext float %mul837 to double
  %mul839 = fmul contract double %conv838, 4.500000e-01
  %conv840 = fptrunc double %mul839 to float
  store float %conv840, float* %I_Ca_junc, align 4
  %510 = load float, float* %Fsl_CaL, align 4
  %511 = load float, float* %ibarca_sl, align 4
  %mul841 = fmul contract float %510, %511
  %512 = load float, float* %d_initvalu_4, align 4
  %mul842 = fmul contract float %mul841, %512
  %513 = load float, float* %d_initvalu_5, align 4
  %mul843 = fmul contract float %mul842, %513
  %514 = load float, float* %d_initvalu_7, align 4
  %sub844 = fsub contract float 1.000000e+00, %514
  %mul845 = fmul contract float %mul843, %sub844
  %515 = load float, float* %Q10CaL, align 4
  %516 = load float, float* %Qpow, align 4
  %call846 = call fastcc float @_ZL3powff(float %515, float %516) #4
  %mul847 = fmul contract float %mul845, %call846
  %conv848 = fpext float %mul847 to double
  %mul849 = fmul contract double %conv848, 4.500000e-01
  %conv850 = fptrunc double %mul849 to float
  store float %conv850, float* %I_Ca_sl, align 4
  %517 = load float, float* %I_Ca_junc, align 4
  %518 = load float, float* %I_Ca_sl, align 4
  %add851 = fadd contract float %517, %518
  store float %add851, float* %I_Ca, align 4
  %519 = load float, float* %I_Ca, align 4
  %fneg852 = fneg float %519
  %520 = load float, float* %Cmem, align 4
  %mul853 = fmul contract float %fneg852, %520
  %521 = load float, float* %Vmyo, align 4
  %mul854 = fmul contract float %521, 2.000000e+00
  %522 = load float, float* %Frdy, align 4
  %mul855 = fmul contract float %mul854, %522
  %div856 = fdiv float %mul853, %mul855
  %conv857 = fpext float %div856 to double
  %mul858 = fmul contract double %conv857, 1.000000e+03
  %conv859 = fptrunc double %mul858 to float
  %523 = load float*, float** %d_finavalu.addr, align 8
  %524 = load i32, i32* %offset_43, align 4
  %idxprom860 = sext i32 %524 to i64
  %arrayidx861 = getelementptr inbounds float, float* %523, i64 %idxprom860
  store float %conv859, float* %arrayidx861, align 4
  %525 = load float, float* %ibark, align 4
  %526 = load float, float* %d_initvalu_4, align 4
  %mul862 = fmul contract float %525, %526
  %527 = load float, float* %d_initvalu_5, align 4
  %mul863 = fmul contract float %mul862, %527
  %528 = load float, float* %Fjunc_CaL, align 4
  %529 = load float, float* %d_initvalu_6, align 4
  %sub864 = fsub contract float 1.000000e+00, %529
  %mul865 = fmul contract float %528, %sub864
  %530 = load float, float* %Fsl_CaL, align 4
  %531 = load float, float* %d_initvalu_7, align 4
  %sub866 = fsub contract float 1.000000e+00, %531
  %mul867 = fmul contract float %530, %sub866
  %add868 = fadd contract float %mul865, %mul867
  %mul869 = fmul contract float %mul863, %add868
  %532 = load float, float* %Q10CaL, align 4
  %533 = load float, float* %Qpow, align 4
  %call870 = call fastcc float @_ZL3powff(float %532, float %533) #4
  %mul871 = fmul contract float %mul869, %call870
  %conv872 = fpext float %mul871 to double
  %mul873 = fmul contract double %conv872, 4.500000e-01
  %conv874 = fptrunc double %mul873 to float
  store float %conv874, float* %I_CaK, align 4
  %534 = load float, float* %Fjunc_CaL, align 4
  %535 = load float, float* %ibarna_j, align 4
  %mul875 = fmul contract float %534, %535
  %536 = load float, float* %d_initvalu_4, align 4
  %mul876 = fmul contract float %mul875, %536
  %537 = load float, float* %d_initvalu_5, align 4
  %mul877 = fmul contract float %mul876, %537
  %538 = load float, float* %d_initvalu_6, align 4
  %sub878 = fsub contract float 1.000000e+00, %538
  %mul879 = fmul contract float %mul877, %sub878
  %539 = load float, float* %Q10CaL, align 4
  %540 = load float, float* %Qpow, align 4
  %call880 = call fastcc float @_ZL3powff(float %539, float %540) #4
  %mul881 = fmul contract float %mul879, %call880
  %conv882 = fpext float %mul881 to double
  %mul883 = fmul contract double %conv882, 4.500000e-01
  %conv884 = fptrunc double %mul883 to float
  store float %conv884, float* %I_CaNa_junc, align 4
  %541 = load float, float* %Fsl_CaL, align 4
  %542 = load float, float* %ibarna_sl, align 4
  %mul885 = fmul contract float %541, %542
  %543 = load float, float* %d_initvalu_4, align 4
  %mul886 = fmul contract float %mul885, %543
  %544 = load float, float* %d_initvalu_5, align 4
  %mul887 = fmul contract float %mul886, %544
  %545 = load float, float* %d_initvalu_7, align 4
  %sub888 = fsub contract float 1.000000e+00, %545
  %mul889 = fmul contract float %mul887, %sub888
  %546 = load float, float* %Q10CaL, align 4
  %547 = load float, float* %Qpow, align 4
  %call890 = call fastcc float @_ZL3powff(float %546, float %547) #4
  %mul891 = fmul contract float %mul889, %call890
  %conv892 = fpext float %mul891 to double
  %mul893 = fmul contract double %conv892, 4.500000e-01
  %conv894 = fptrunc double %mul893 to float
  store float %conv894, float* %I_CaNa_sl, align 4
  %548 = load float, float* %Kdact, align 4
  %549 = load float, float* %d_initvalu_36, align 4
  %div895 = fdiv float %548, %549
  %call896 = call fastcc float @_ZL3powfi(float %div895, i32 3) #4
  %add897 = fadd contract float 1.000000e+00, %call896
  %div898 = fdiv float 1.000000e+00, %add897
  store float %div898, float* %Ka_junc, align 4
  %550 = load float, float* %Kdact, align 4
  %551 = load float, float* %d_initvalu_37, align 4
  %div899 = fdiv float %550, %551
  %call900 = call fastcc float @_ZL3powfi(float %div899, i32 3) #4
  %add901 = fadd contract float 1.000000e+00, %call900
  %div902 = fdiv float 1.000000e+00, %add901
  store float %div902, float* %Ka_sl, align 4
  %552 = load float, float* %nu, align 4
  %553 = load float, float* %d_initvalu_39, align 4
  %mul903 = fmul contract float %552, %553
  %554 = load float, float* %FoRT, align 4
  %mul904 = fmul contract float %mul903, %554
  %call905 = call fastcc float @_ZL3expf(float %mul904) #4
  %555 = load float, float* %d_initvalu_32, align 4
  %call906 = call fastcc float @_ZL3powfi(float %555, i32 3) #4
  %mul907 = fmul contract float %call905, %call906
  %556 = load float, float* %Cao, align 4
  %mul908 = fmul contract float %mul907, %556
  store float %mul908, float* %s1_junc, align 4
  %557 = load float, float* %nu, align 4
  %558 = load float, float* %d_initvalu_39, align 4
  %mul909 = fmul contract float %557, %558
  %559 = load float, float* %FoRT, align 4
  %mul910 = fmul contract float %mul909, %559
  %call911 = call fastcc float @_ZL3expf(float %mul910) #4
  %560 = load float, float* %d_initvalu_33, align 4
  %call912 = call fastcc float @_ZL3powfi(float %560, i32 3) #4
  %mul913 = fmul contract float %call911, %call912
  %561 = load float, float* %Cao, align 4
  %mul914 = fmul contract float %mul913, %561
  store float %mul914, float* %s1_sl, align 4
  %562 = load float, float* %nu, align 4
  %sub915 = fsub contract float %562, 1.000000e+00
  %563 = load float, float* %d_initvalu_39, align 4
  %mul916 = fmul contract float %sub915, %563
  %564 = load float, float* %FoRT, align 4
  %mul917 = fmul contract float %mul916, %564
  %call918 = call fastcc float @_ZL3expf(float %mul917) #4
  %565 = load float, float* %Nao, align 4
  %call919 = call fastcc float @_ZL3powfi(float %565, i32 3) #4
  %mul920 = fmul contract float %call918, %call919
  %566 = load float, float* %d_initvalu_36, align 4
  %mul921 = fmul contract float %mul920, %566
  store float %mul921, float* %s2_junc, align 4
  %567 = load float, float* %KmCai, align 4
  %568 = load float, float* %Nao, align 4
  %call922 = call fastcc float @_ZL3powfi(float %568, i32 3) #4
  %mul923 = fmul contract float %567, %call922
  %569 = load float, float* %d_initvalu_32, align 4
  %570 = load float, float* %KmNai, align 4
  %div924 = fdiv float %569, %570
  %call925 = call fastcc float @_ZL3powfi(float %div924, i32 3) #4
  %add926 = fadd contract float 1.000000e+00, %call925
  %mul927 = fmul contract float %mul923, %add926
  %571 = load float, float* %KmNao, align 4
  %call928 = call fastcc float @_ZL3powfi(float %571, i32 3) #4
  %572 = load float, float* %d_initvalu_36, align 4
  %mul929 = fmul contract float %call928, %572
  %add930 = fadd contract float %mul927, %mul929
  %573 = load float, float* %KmNai, align 4
  %call931 = call fastcc float @_ZL3powfi(float %573, i32 3) #4
  %574 = load float, float* %Cao, align 4
  %mul932 = fmul contract float %call931, %574
  %575 = load float, float* %d_initvalu_36, align 4
  %576 = load float, float* %KmCai, align 4
  %div933 = fdiv float %575, %576
  %add934 = fadd contract float 1.000000e+00, %div933
  %mul935 = fmul contract float %mul932, %add934
  %add936 = fadd contract float %add930, %mul935
  %577 = load float, float* %KmCao, align 4
  %578 = load float, float* %d_initvalu_32, align 4
  %call937 = call fastcc float @_ZL3powfi(float %578, i32 3) #4
  %mul938 = fmul contract float %577, %call937
  %add939 = fadd contract float %add936, %mul938
  %579 = load float, float* %d_initvalu_32, align 4
  %call940 = call fastcc float @_ZL3powfi(float %579, i32 3) #4
  %580 = load float, float* %Cao, align 4
  %mul941 = fmul contract float %call940, %580
  %add942 = fadd contract float %add939, %mul941
  %581 = load float, float* %Nao, align 4
  %call943 = call fastcc float @_ZL3powfi(float %581, i32 3) #4
  %582 = load float, float* %d_initvalu_36, align 4
  %mul944 = fmul contract float %call943, %582
  %add945 = fadd contract float %add942, %mul944
  %583 = load float, float* %ksat, align 4
  %584 = load float, float* %nu, align 4
  %sub946 = fsub contract float %584, 1.000000e+00
  %585 = load float, float* %d_initvalu_39, align 4
  %mul947 = fmul contract float %sub946, %585
  %586 = load float, float* %FoRT, align 4
  %mul948 = fmul contract float %mul947, %586
  %call949 = call fastcc float @_ZL3expf(float %mul948) #4
  %mul950 = fmul contract float %583, %call949
  %add951 = fadd contract float 1.000000e+00, %mul950
  %mul952 = fmul contract float %add945, %add951
  store float %mul952, float* %s3_junc, align 4
  %587 = load float, float* %nu, align 4
  %sub953 = fsub contract float %587, 1.000000e+00
  %588 = load float, float* %d_initvalu_39, align 4
  %mul954 = fmul contract float %sub953, %588
  %589 = load float, float* %FoRT, align 4
  %mul955 = fmul contract float %mul954, %589
  %call956 = call fastcc float @_ZL3expf(float %mul955) #4
  %590 = load float, float* %Nao, align 4
  %call957 = call fastcc float @_ZL3powfi(float %590, i32 3) #4
  %mul958 = fmul contract float %call956, %call957
  %591 = load float, float* %d_initvalu_37, align 4
  %mul959 = fmul contract float %mul958, %591
  store float %mul959, float* %s2_sl, align 4
  %592 = load float, float* %KmCai, align 4
  %593 = load float, float* %Nao, align 4
  %call960 = call fastcc float @_ZL3powfi(float %593, i32 3) #4
  %mul961 = fmul contract float %592, %call960
  %594 = load float, float* %d_initvalu_33, align 4
  %595 = load float, float* %KmNai, align 4
  %div962 = fdiv float %594, %595
  %call963 = call fastcc float @_ZL3powfi(float %div962, i32 3) #4
  %add964 = fadd contract float 1.000000e+00, %call963
  %mul965 = fmul contract float %mul961, %add964
  %596 = load float, float* %KmNao, align 4
  %call966 = call fastcc float @_ZL3powfi(float %596, i32 3) #4
  %597 = load float, float* %d_initvalu_37, align 4
  %mul967 = fmul contract float %call966, %597
  %add968 = fadd contract float %mul965, %mul967
  %598 = load float, float* %KmNai, align 4
  %call969 = call fastcc float @_ZL3powfi(float %598, i32 3) #4
  %599 = load float, float* %Cao, align 4
  %mul970 = fmul contract float %call969, %599
  %600 = load float, float* %d_initvalu_37, align 4
  %601 = load float, float* %KmCai, align 4
  %div971 = fdiv float %600, %601
  %add972 = fadd contract float 1.000000e+00, %div971
  %mul973 = fmul contract float %mul970, %add972
  %add974 = fadd contract float %add968, %mul973
  %602 = load float, float* %KmCao, align 4
  %603 = load float, float* %d_initvalu_33, align 4
  %call975 = call fastcc float @_ZL3powfi(float %603, i32 3) #4
  %mul976 = fmul contract float %602, %call975
  %add977 = fadd contract float %add974, %mul976
  %604 = load float, float* %d_initvalu_33, align 4
  %call978 = call fastcc float @_ZL3powfi(float %604, i32 3) #4
  %605 = load float, float* %Cao, align 4
  %mul979 = fmul contract float %call978, %605
  %add980 = fadd contract float %add977, %mul979
  %606 = load float, float* %Nao, align 4
  %call981 = call fastcc float @_ZL3powfi(float %606, i32 3) #4
  %607 = load float, float* %d_initvalu_37, align 4
  %mul982 = fmul contract float %call981, %607
  %add983 = fadd contract float %add980, %mul982
  %608 = load float, float* %ksat, align 4
  %609 = load float, float* %nu, align 4
  %sub984 = fsub contract float %609, 1.000000e+00
  %610 = load float, float* %d_initvalu_39, align 4
  %mul985 = fmul contract float %sub984, %610
  %611 = load float, float* %FoRT, align 4
  %mul986 = fmul contract float %mul985, %611
  %call987 = call fastcc float @_ZL3expf(float %mul986) #4
  %mul988 = fmul contract float %608, %call987
  %add989 = fadd contract float 1.000000e+00, %mul988
  %mul990 = fmul contract float %add983, %add989
  store float %mul990, float* %s3_sl, align 4
  %612 = load float, float* %Fjunc, align 4
  %613 = load float, float* %IbarNCX, align 4
  %mul991 = fmul contract float %612, %613
  %614 = load float, float* %Q10NCX, align 4
  %615 = load float, float* %Qpow, align 4
  %call992 = call fastcc float @_ZL3powff(float %614, float %615) #4
  %mul993 = fmul contract float %mul991, %call992
  %616 = load float, float* %Ka_junc, align 4
  %mul994 = fmul contract float %mul993, %616
  %617 = load float, float* %s1_junc, align 4
  %618 = load float, float* %s2_junc, align 4
  %sub995 = fsub contract float %617, %618
  %mul996 = fmul contract float %mul994, %sub995
  %619 = load float, float* %s3_junc, align 4
  %div997 = fdiv float %mul996, %619
  store float %div997, float* %I_ncx_junc, align 4
  %620 = load float, float* %Fsl, align 4
  %621 = load float, float* %IbarNCX, align 4
  %mul998 = fmul contract float %620, %621
  %622 = load float, float* %Q10NCX, align 4
  %623 = load float, float* %Qpow, align 4
  %call999 = call fastcc float @_ZL3powff(float %622, float %623) #4
  %mul1000 = fmul contract float %mul998, %call999
  %624 = load float, float* %Ka_sl, align 4
  %mul1001 = fmul contract float %mul1000, %624
  %625 = load float, float* %s1_sl, align 4
  %626 = load float, float* %s2_sl, align 4
  %sub1002 = fsub contract float %625, %626
  %mul1003 = fmul contract float %mul1001, %sub1002
  %627 = load float, float* %s3_sl, align 4
  %div1004 = fdiv float %mul1003, %627
  store float %div1004, float* %I_ncx_sl, align 4
  %628 = load float, float* %I_ncx_junc, align 4
  %629 = load float, float* %I_ncx_sl, align 4
  %add1005 = fadd contract float %628, %629
  store float %add1005, float* %I_ncx, align 4
  %630 = load float, float* %I_ncx, align 4
  %mul1006 = fmul contract float 2.000000e+00, %630
  %631 = load float, float* %Cmem, align 4
  %mul1007 = fmul contract float %mul1006, %631
  %632 = load float, float* %Vmyo, align 4
  %mul1008 = fmul contract float %632, 2.000000e+00
  %633 = load float, float* %Frdy, align 4
  %mul1009 = fmul contract float %mul1008, %633
  %div1010 = fdiv float %mul1007, %mul1009
  %conv1011 = fpext float %div1010 to double
  %mul1012 = fmul contract double %conv1011, 1.000000e+03
  %conv1013 = fptrunc double %mul1012 to float
  %634 = load float*, float** %d_finavalu.addr, align 8
  %635 = load i32, i32* %offset_45, align 4
  %idxprom1014 = sext i32 %635 to i64
  %arrayidx1015 = getelementptr inbounds float, float* %634, i64 %idxprom1014
  store float %conv1013, float* %arrayidx1015, align 4
  %636 = load float, float* %Fjunc, align 4
  %637 = load float, float* %Q10SLCaP, align 4
  %638 = load float, float* %Qpow, align 4
  %call1016 = call fastcc float @_ZL3powff(float %637, float %638) #4
  %mul1017 = fmul contract float %636, %call1016
  %639 = load float, float* %IbarSLCaP, align 4
  %mul1018 = fmul contract float %mul1017, %639
  %640 = load float, float* %d_initvalu_36, align 4
  %call1019 = call fastcc float @_ZL3powff(float %640, float 0x3FF99999A0000000) #4
  %mul1020 = fmul contract float %mul1018, %call1019
  %641 = load float, float* %KmPCa, align 4
  %call1021 = call fastcc float @_ZL3powff(float %641, float 0x3FF99999A0000000) #4
  %642 = load float, float* %d_initvalu_36, align 4
  %call1022 = call fastcc float @_ZL3powff(float %642, float 0x3FF99999A0000000) #4
  %add1023 = fadd contract float %call1021, %call1022
  %div1024 = fdiv float %mul1020, %add1023
  store float %div1024, float* %I_pca_junc, align 4
  %643 = load float, float* %Fsl, align 4
  %644 = load float, float* %Q10SLCaP, align 4
  %645 = load float, float* %Qpow, align 4
  %call1025 = call fastcc float @_ZL3powff(float %644, float %645) #4
  %mul1026 = fmul contract float %643, %call1025
  %646 = load float, float* %IbarSLCaP, align 4
  %mul1027 = fmul contract float %mul1026, %646
  %647 = load float, float* %d_initvalu_37, align 4
  %call1028 = call fastcc float @_ZL3powff(float %647, float 0x3FF99999A0000000) #4
  %mul1029 = fmul contract float %mul1027, %call1028
  %648 = load float, float* %KmPCa, align 4
  %call1030 = call fastcc float @_ZL3powff(float %648, float 0x3FF99999A0000000) #4
  %649 = load float, float* %d_initvalu_37, align 4
  %call1031 = call fastcc float @_ZL3powff(float %649, float 0x3FF99999A0000000) #4
  %add1032 = fadd contract float %call1030, %call1031
  %div1033 = fdiv float %mul1029, %add1032
  store float %div1033, float* %I_pca_sl, align 4
  %650 = load float, float* %I_pca_junc, align 4
  %651 = load float, float* %I_pca_sl, align 4
  %add1034 = fadd contract float %650, %651
  store float %add1034, float* %I_pca, align 4
  %652 = load float, float* %I_pca, align 4
  %fneg1035 = fneg float %652
  %653 = load float, float* %Cmem, align 4
  %mul1036 = fmul contract float %fneg1035, %653
  %654 = load float, float* %Vmyo, align 4
  %mul1037 = fmul contract float %654, 2.000000e+00
  %655 = load float, float* %Frdy, align 4
  %mul1038 = fmul contract float %mul1037, %655
  %div1039 = fdiv float %mul1036, %mul1038
  %conv1040 = fpext float %div1039 to double
  %mul1041 = fmul contract double %conv1040, 1.000000e+03
  %conv1042 = fptrunc double %mul1041 to float
  %656 = load float*, float** %d_finavalu.addr, align 8
  %657 = load i32, i32* %offset_44, align 4
  %idxprom1043 = sext i32 %657 to i64
  %arrayidx1044 = getelementptr inbounds float, float* %656, i64 %idxprom1043
  store float %conv1042, float* %arrayidx1044, align 4
  %658 = load float, float* %Fjunc, align 4
  %659 = load float, float* %GCaB, align 4
  %mul1045 = fmul contract float %658, %659
  %660 = load float, float* %d_initvalu_39, align 4
  %661 = load float, float* %eca_junc, align 4
  %sub1046 = fsub contract float %660, %661
  %mul1047 = fmul contract float %mul1045, %sub1046
  store float %mul1047, float* %I_cabk_junc, align 4
  %662 = load float, float* %Fsl, align 4
  %663 = load float, float* %GCaB, align 4
  %mul1048 = fmul contract float %662, %663
  %664 = load float, float* %d_initvalu_39, align 4
  %665 = load float, float* %eca_sl, align 4
  %sub1049 = fsub contract float %664, %665
  %mul1050 = fmul contract float %mul1048, %sub1049
  store float %mul1050, float* %I_cabk_sl, align 4
  %666 = load float, float* %I_cabk_junc, align 4
  %667 = load float, float* %I_cabk_sl, align 4
  %add1051 = fadd contract float %666, %667
  store float %add1051, float* %I_cabk, align 4
  %668 = load float, float* %I_cabk, align 4
  %fneg1052 = fneg float %668
  %669 = load float, float* %Cmem, align 4
  %mul1053 = fmul contract float %fneg1052, %669
  %670 = load float, float* %Vmyo, align 4
  %mul1054 = fmul contract float %670, 2.000000e+00
  %671 = load float, float* %Frdy, align 4
  %mul1055 = fmul contract float %mul1054, %671
  %div1056 = fdiv float %mul1053, %mul1055
  %conv1057 = fpext float %div1056 to double
  %mul1058 = fmul contract double %conv1057, 1.000000e+03
  %conv1059 = fptrunc double %mul1058 to float
  %672 = load float*, float** %d_finavalu.addr, align 8
  %673 = load i32, i32* %offset_46, align 4
  %idxprom1060 = sext i32 %673 to i64
  %arrayidx1061 = getelementptr inbounds float, float* %672, i64 %idxprom1060
  store float %conv1059, float* %arrayidx1061, align 4
  store float 1.500000e+01, float* %MaxSR, align 4
  store float 1.000000e+00, float* %MinSR, align 4
  %674 = load float, float* %MaxSR, align 4
  %675 = load float, float* %MaxSR, align 4
  %676 = load float, float* %MinSR, align 4
  %sub1062 = fsub contract float %675, %676
  %677 = load float, float* %ec50SR, align 4
  %678 = load float, float* %d_initvalu_31, align 4
  %div1063 = fdiv float %677, %678
  %call1064 = call fastcc float @_ZL3powff(float %div1063, float 2.500000e+00) #4
  %add1065 = fadd contract float 1.000000e+00, %call1064
  %div1066 = fdiv float %sub1062, %add1065
  %sub1067 = fsub contract float %674, %div1066
  store float %sub1067, float* %kCaSR, align 4
  %679 = load float, float* %koCa, align 4
  %680 = load float, float* %kCaSR, align 4
  %div1068 = fdiv float %679, %680
  store float %div1068, float* %koSRCa, align 4
  %681 = load float, float* %kiCa, align 4
  %682 = load float, float* %kCaSR, align 4
  %mul1069 = fmul contract float %681, %682
  store float %mul1069, float* %kiSRCa, align 4
  %683 = load float, float* %d_initvalu_14, align 4
  %sub1070 = fsub contract float 1.000000e+00, %683
  %684 = load float, float* %d_initvalu_15, align 4
  %sub1071 = fsub contract float %sub1070, %684
  %685 = load float, float* %d_initvalu_16, align 4
  %sub1072 = fsub contract float %sub1071, %685
  store float %sub1072, float* %RI, align 4
  %686 = load float, float* %kim, align 4
  %687 = load float, float* %RI, align 4
  %mul1073 = fmul contract float %686, %687
  %688 = load float, float* %kiSRCa, align 4
  %689 = load float, float* %d_initvalu_36, align 4
  %mul1074 = fmul contract float %688, %689
  %690 = load float, float* %d_initvalu_14, align 4
  %mul1075 = fmul contract float %mul1074, %690
  %sub1076 = fsub contract float %mul1073, %mul1075
  %691 = load float, float* %koSRCa, align 4
  %692 = load float, float* %d_initvalu_36, align 4
  %call1077 = call fastcc float @_ZL3powfi(float %692, i32 2) #4
  %mul1078 = fmul contract float %691, %call1077
  %693 = load float, float* %d_initvalu_14, align 4
  %mul1079 = fmul contract float %mul1078, %693
  %694 = load float, float* %kom, align 4
  %695 = load float, float* %d_initvalu_15, align 4
  %mul1080 = fmul contract float %694, %695
  %sub1081 = fsub contract float %mul1079, %mul1080
  %sub1082 = fsub contract float %sub1076, %sub1081
  %696 = load float*, float** %d_finavalu.addr, align 8
  %697 = load i32, i32* %offset_14, align 4
  %idxprom1083 = sext i32 %697 to i64
  %arrayidx1084 = getelementptr inbounds float, float* %696, i64 %idxprom1083
  store float %sub1082, float* %arrayidx1084, align 4
  %698 = load float, float* %koSRCa, align 4
  %699 = load float, float* %d_initvalu_36, align 4
  %call1085 = call fastcc float @_ZL3powfi(float %699, i32 2) #4
  %mul1086 = fmul contract float %698, %call1085
  %700 = load float, float* %d_initvalu_14, align 4
  %mul1087 = fmul contract float %mul1086, %700
  %701 = load float, float* %kom, align 4
  %702 = load float, float* %d_initvalu_15, align 4
  %mul1088 = fmul contract float %701, %702
  %sub1089 = fsub contract float %mul1087, %mul1088
  %703 = load float, float* %kiSRCa, align 4
  %704 = load float, float* %d_initvalu_36, align 4
  %mul1090 = fmul contract float %703, %704
  %705 = load float, float* %d_initvalu_15, align 4
  %mul1091 = fmul contract float %mul1090, %705
  %706 = load float, float* %kim, align 4
  %707 = load float, float* %d_initvalu_16, align 4
  %mul1092 = fmul contract float %706, %707
  %sub1093 = fsub contract float %mul1091, %mul1092
  %sub1094 = fsub contract float %sub1089, %sub1093
  %708 = load float*, float** %d_finavalu.addr, align 8
  %709 = load i32, i32* %offset_15, align 4
  %idxprom1095 = sext i32 %709 to i64
  %arrayidx1096 = getelementptr inbounds float, float* %708, i64 %idxprom1095
  store float %sub1094, float* %arrayidx1096, align 4
  %710 = load float, float* %kiSRCa, align 4
  %711 = load float, float* %d_initvalu_36, align 4
  %mul1097 = fmul contract float %710, %711
  %712 = load float, float* %d_initvalu_15, align 4
  %mul1098 = fmul contract float %mul1097, %712
  %713 = load float, float* %kim, align 4
  %714 = load float, float* %d_initvalu_16, align 4
  %mul1099 = fmul contract float %713, %714
  %sub1100 = fsub contract float %mul1098, %mul1099
  %715 = load float, float* %kom, align 4
  %716 = load float, float* %d_initvalu_16, align 4
  %mul1101 = fmul contract float %715, %716
  %717 = load float, float* %koSRCa, align 4
  %718 = load float, float* %d_initvalu_36, align 4
  %call1102 = call fastcc float @_ZL3powfi(float %718, i32 2) #4
  %mul1103 = fmul contract float %717, %call1102
  %719 = load float, float* %RI, align 4
  %mul1104 = fmul contract float %mul1103, %719
  %sub1105 = fsub contract float %mul1101, %mul1104
  %sub1106 = fsub contract float %sub1100, %sub1105
  %720 = load float*, float** %d_finavalu.addr, align 8
  %721 = load i32, i32* %offset_16, align 4
  %idxprom1107 = sext i32 %721 to i64
  %arrayidx1108 = getelementptr inbounds float, float* %720, i64 %idxprom1107
  store float %sub1106, float* %arrayidx1108, align 4
  %722 = load float, float* %ks, align 4
  %723 = load float, float* %d_initvalu_15, align 4
  %mul1109 = fmul contract float %722, %723
  %724 = load float, float* %d_initvalu_31, align 4
  %725 = load float, float* %d_initvalu_36, align 4
  %sub1110 = fsub contract float %724, %725
  %mul1111 = fmul contract float %mul1109, %sub1110
  store float %mul1111, float* %J_SRCarel, align 4
  %726 = load float, float* %Q10SRCaP, align 4
  %727 = load float, float* %Qpow, align 4
  %call1112 = call fastcc float @_ZL3powff(float %726, float %727) #4
  %728 = load float, float* %Vmax_SRCaP, align 4
  %mul1113 = fmul contract float %call1112, %728
  %729 = load float, float* %d_initvalu_38, align 4
  %730 = load float, float* %Kmf, align 4
  %div1114 = fdiv float %729, %730
  %731 = load float, float* %hillSRCaP, align 4
  %call1115 = call fastcc float @_ZL3powff(float %div1114, float %731) #4
  %732 = load float, float* %d_initvalu_31, align 4
  %733 = load float, float* %Kmr, align 4
  %div1116 = fdiv float %732, %733
  %734 = load float, float* %hillSRCaP, align 4
  %call1117 = call fastcc float @_ZL3powff(float %div1116, float %734) #4
  %sub1118 = fsub contract float %call1115, %call1117
  %mul1119 = fmul contract float %mul1113, %sub1118
  %735 = load float, float* %d_initvalu_38, align 4
  %736 = load float, float* %Kmf, align 4
  %div1120 = fdiv float %735, %736
  %737 = load float, float* %hillSRCaP, align 4
  %call1121 = call fastcc float @_ZL3powff(float %div1120, float %737) #4
  %add1122 = fadd contract float 1.000000e+00, %call1121
  %738 = load float, float* %d_initvalu_31, align 4
  %739 = load float, float* %Kmr, align 4
  %div1123 = fdiv float %738, %739
  %740 = load float, float* %hillSRCaP, align 4
  %call1124 = call fastcc float @_ZL3powff(float %div1123, float %740) #4
  %add1125 = fadd contract float %add1122, %call1124
  %div1126 = fdiv float %mul1119, %add1125
  store float %div1126, float* %J_serca, align 4
  %741 = load float, float* %d_initvalu_31, align 4
  %742 = load float, float* %d_initvalu_36, align 4
  %sub1127 = fsub contract float %741, %742
  %conv1128 = fpext float %sub1127 to double
  %mul1129 = fmul contract double 5.348000e-06, %conv1128
  %conv1130 = fptrunc double %mul1129 to float
  store float %conv1130, float* %J_SRleak, align 4
  %743 = load float, float* %kon_na, align 4
  %744 = load float, float* %d_initvalu_32, align 4
  %mul1131 = fmul contract float %743, %744
  %745 = load float, float* %Bmax_Naj, align 4
  %746 = load float, float* %d_initvalu_17, align 4
  %sub1132 = fsub contract float %745, %746
  %mul1133 = fmul contract float %mul1131, %sub1132
  %747 = load float, float* %koff_na, align 4
  %748 = load float, float* %d_initvalu_17, align 4
  %mul1134 = fmul contract float %747, %748
  %sub1135 = fsub contract float %mul1133, %mul1134
  %749 = load float*, float** %d_finavalu.addr, align 8
  %750 = load i32, i32* %offset_17, align 4
  %idxprom1136 = sext i32 %750 to i64
  %arrayidx1137 = getelementptr inbounds float, float* %749, i64 %idxprom1136
  store float %sub1135, float* %arrayidx1137, align 4
  %751 = load float, float* %kon_na, align 4
  %752 = load float, float* %d_initvalu_33, align 4
  %mul1138 = fmul contract float %751, %752
  %753 = load float, float* %Bmax_Nasl, align 4
  %754 = load float, float* %d_initvalu_18, align 4
  %sub1139 = fsub contract float %753, %754
  %mul1140 = fmul contract float %mul1138, %sub1139
  %755 = load float, float* %koff_na, align 4
  %756 = load float, float* %d_initvalu_18, align 4
  %mul1141 = fmul contract float %755, %756
  %sub1142 = fsub contract float %mul1140, %mul1141
  %757 = load float*, float** %d_finavalu.addr, align 8
  %758 = load i32, i32* %offset_18, align 4
  %idxprom1143 = sext i32 %758 to i64
  %arrayidx1144 = getelementptr inbounds float, float* %757, i64 %idxprom1143
  store float %sub1142, float* %arrayidx1144, align 4
  %759 = load float, float* %kon_tncl, align 4
  %760 = load float, float* %d_initvalu_38, align 4
  %mul1145 = fmul contract float %759, %760
  %761 = load float, float* %Bmax_TnClow, align 4
  %762 = load float, float* %d_initvalu_19, align 4
  %sub1146 = fsub contract float %761, %762
  %mul1147 = fmul contract float %mul1145, %sub1146
  %763 = load float, float* %koff_tncl, align 4
  %764 = load float, float* %d_initvalu_19, align 4
  %mul1148 = fmul contract float %763, %764
  %sub1149 = fsub contract float %mul1147, %mul1148
  %765 = load float*, float** %d_finavalu.addr, align 8
  %766 = load i32, i32* %offset_19, align 4
  %idxprom1150 = sext i32 %766 to i64
  %arrayidx1151 = getelementptr inbounds float, float* %765, i64 %idxprom1150
  store float %sub1149, float* %arrayidx1151, align 4
  %767 = load float, float* %kon_tnchca, align 4
  %768 = load float, float* %d_initvalu_38, align 4
  %mul1152 = fmul contract float %767, %768
  %769 = load float, float* %Bmax_TnChigh, align 4
  %770 = load float, float* %d_initvalu_20, align 4
  %sub1153 = fsub contract float %769, %770
  %771 = load float, float* %d_initvalu_21, align 4
  %sub1154 = fsub contract float %sub1153, %771
  %mul1155 = fmul contract float %mul1152, %sub1154
  %772 = load float, float* %koff_tnchca, align 4
  %773 = load float, float* %d_initvalu_20, align 4
  %mul1156 = fmul contract float %772, %773
  %sub1157 = fsub contract float %mul1155, %mul1156
  %774 = load float*, float** %d_finavalu.addr, align 8
  %775 = load i32, i32* %offset_20, align 4
  %idxprom1158 = sext i32 %775 to i64
  %arrayidx1159 = getelementptr inbounds float, float* %774, i64 %idxprom1158
  store float %sub1157, float* %arrayidx1159, align 4
  %776 = load float, float* %kon_tnchmg, align 4
  %777 = load float, float* %Mgi, align 4
  %mul1160 = fmul contract float %776, %777
  %778 = load float, float* %Bmax_TnChigh, align 4
  %779 = load float, float* %d_initvalu_20, align 4
  %sub1161 = fsub contract float %778, %779
  %780 = load float, float* %d_initvalu_21, align 4
  %sub1162 = fsub contract float %sub1161, %780
  %mul1163 = fmul contract float %mul1160, %sub1162
  %781 = load float, float* %koff_tnchmg, align 4
  %782 = load float, float* %d_initvalu_21, align 4
  %mul1164 = fmul contract float %781, %782
  %sub1165 = fsub contract float %mul1163, %mul1164
  %783 = load float*, float** %d_finavalu.addr, align 8
  %784 = load i32, i32* %offset_21, align 4
  %idxprom1166 = sext i32 %784 to i64
  %arrayidx1167 = getelementptr inbounds float, float* %783, i64 %idxprom1166
  store float %sub1165, float* %arrayidx1167, align 4
  %785 = load float*, float** %d_finavalu.addr, align 8
  %786 = load i32, i32* %offset_22, align 4
  %idxprom1168 = sext i32 %786 to i64
  %arrayidx1169 = getelementptr inbounds float, float* %785, i64 %idxprom1168
  store float 0.000000e+00, float* %arrayidx1169, align 4
  %787 = load float, float* %kon_myoca, align 4
  %788 = load float, float* %d_initvalu_38, align 4
  %mul1170 = fmul contract float %787, %788
  %789 = load float, float* %Bmax_myosin, align 4
  %790 = load float, float* %d_initvalu_23, align 4
  %sub1171 = fsub contract float %789, %790
  %791 = load float, float* %d_initvalu_24, align 4
  %sub1172 = fsub contract float %sub1171, %791
  %mul1173 = fmul contract float %mul1170, %sub1172
  %792 = load float, float* %koff_myoca, align 4
  %793 = load float, float* %d_initvalu_23, align 4
  %mul1174 = fmul contract float %792, %793
  %sub1175 = fsub contract float %mul1173, %mul1174
  %794 = load float*, float** %d_finavalu.addr, align 8
  %795 = load i32, i32* %offset_23, align 4
  %idxprom1176 = sext i32 %795 to i64
  %arrayidx1177 = getelementptr inbounds float, float* %794, i64 %idxprom1176
  store float %sub1175, float* %arrayidx1177, align 4
  %796 = load float, float* %kon_myomg, align 4
  %797 = load float, float* %Mgi, align 4
  %mul1178 = fmul contract float %796, %797
  %798 = load float, float* %Bmax_myosin, align 4
  %799 = load float, float* %d_initvalu_23, align 4
  %sub1179 = fsub contract float %798, %799
  %800 = load float, float* %d_initvalu_24, align 4
  %sub1180 = fsub contract float %sub1179, %800
  %mul1181 = fmul contract float %mul1178, %sub1180
  %801 = load float, float* %koff_myomg, align 4
  %802 = load float, float* %d_initvalu_24, align 4
  %mul1182 = fmul contract float %801, %802
  %sub1183 = fsub contract float %mul1181, %mul1182
  %803 = load float*, float** %d_finavalu.addr, align 8
  %804 = load i32, i32* %offset_24, align 4
  %idxprom1184 = sext i32 %804 to i64
  %arrayidx1185 = getelementptr inbounds float, float* %803, i64 %idxprom1184
  store float %sub1183, float* %arrayidx1185, align 4
  %805 = load float, float* %kon_sr, align 4
  %806 = load float, float* %d_initvalu_38, align 4
  %mul1186 = fmul contract float %805, %806
  %807 = load float, float* %Bmax_SR, align 4
  %808 = load float, float* %d_initvalu_25, align 4
  %sub1187 = fsub contract float %807, %808
  %mul1188 = fmul contract float %mul1186, %sub1187
  %809 = load float, float* %koff_sr, align 4
  %810 = load float, float* %d_initvalu_25, align 4
  %mul1189 = fmul contract float %809, %810
  %sub1190 = fsub contract float %mul1188, %mul1189
  %811 = load float*, float** %d_finavalu.addr, align 8
  %812 = load i32, i32* %offset_25, align 4
  %idxprom1191 = sext i32 %812 to i64
  %arrayidx1192 = getelementptr inbounds float, float* %811, i64 %idxprom1191
  store float %sub1190, float* %arrayidx1192, align 4
  %813 = load float*, float** %d_finavalu.addr, align 8
  %814 = load i32, i32* %offset_19, align 4
  %idxprom1193 = sext i32 %814 to i64
  %arrayidx1194 = getelementptr inbounds float, float* %813, i64 %idxprom1193
  %815 = load float, float* %arrayidx1194, align 4
  %816 = load float*, float** %d_finavalu.addr, align 8
  %817 = load i32, i32* %offset_20, align 4
  %idxprom1195 = sext i32 %817 to i64
  %arrayidx1196 = getelementptr inbounds float, float* %816, i64 %idxprom1195
  %818 = load float, float* %arrayidx1196, align 4
  %add1197 = fadd contract float %815, %818
  %819 = load float*, float** %d_finavalu.addr, align 8
  %820 = load i32, i32* %offset_21, align 4
  %idxprom1198 = sext i32 %820 to i64
  %arrayidx1199 = getelementptr inbounds float, float* %819, i64 %idxprom1198
  %821 = load float, float* %arrayidx1199, align 4
  %add1200 = fadd contract float %add1197, %821
  %822 = load float*, float** %d_finavalu.addr, align 8
  %823 = load i32, i32* %offset_22, align 4
  %idxprom1201 = sext i32 %823 to i64
  %arrayidx1202 = getelementptr inbounds float, float* %822, i64 %idxprom1201
  %824 = load float, float* %arrayidx1202, align 4
  %add1203 = fadd contract float %add1200, %824
  %825 = load float*, float** %d_finavalu.addr, align 8
  %826 = load i32, i32* %offset_23, align 4
  %idxprom1204 = sext i32 %826 to i64
  %arrayidx1205 = getelementptr inbounds float, float* %825, i64 %idxprom1204
  %827 = load float, float* %arrayidx1205, align 4
  %add1206 = fadd contract float %add1203, %827
  %828 = load float*, float** %d_finavalu.addr, align 8
  %829 = load i32, i32* %offset_24, align 4
  %idxprom1207 = sext i32 %829 to i64
  %arrayidx1208 = getelementptr inbounds float, float* %828, i64 %idxprom1207
  %830 = load float, float* %arrayidx1208, align 4
  %add1209 = fadd contract float %add1206, %830
  %831 = load float*, float** %d_finavalu.addr, align 8
  %832 = load i32, i32* %offset_25, align 4
  %idxprom1210 = sext i32 %832 to i64
  %arrayidx1211 = getelementptr inbounds float, float* %831, i64 %idxprom1210
  %833 = load float, float* %arrayidx1211, align 4
  %add1212 = fadd contract float %add1209, %833
  store float %add1212, float* %J_CaB_cytosol, align 4
  %834 = load float, float* %kon_sll, align 4
  %835 = load float, float* %d_initvalu_36, align 4
  %mul1213 = fmul contract float %834, %835
  %836 = load float, float* %Bmax_SLlowj, align 4
  %837 = load float, float* %d_initvalu_26, align 4
  %sub1214 = fsub contract float %836, %837
  %mul1215 = fmul contract float %mul1213, %sub1214
  %838 = load float, float* %koff_sll, align 4
  %839 = load float, float* %d_initvalu_26, align 4
  %mul1216 = fmul contract float %838, %839
  %sub1217 = fsub contract float %mul1215, %mul1216
  %840 = load float*, float** %d_finavalu.addr, align 8
  %841 = load i32, i32* %offset_26, align 4
  %idxprom1218 = sext i32 %841 to i64
  %arrayidx1219 = getelementptr inbounds float, float* %840, i64 %idxprom1218
  store float %sub1217, float* %arrayidx1219, align 4
  %842 = load float, float* %kon_sll, align 4
  %843 = load float, float* %d_initvalu_37, align 4
  %mul1220 = fmul contract float %842, %843
  %844 = load float, float* %Bmax_SLlowsl, align 4
  %845 = load float, float* %d_initvalu_27, align 4
  %sub1221 = fsub contract float %844, %845
  %mul1222 = fmul contract float %mul1220, %sub1221
  %846 = load float, float* %koff_sll, align 4
  %847 = load float, float* %d_initvalu_27, align 4
  %mul1223 = fmul contract float %846, %847
  %sub1224 = fsub contract float %mul1222, %mul1223
  %848 = load float*, float** %d_finavalu.addr, align 8
  %849 = load i32, i32* %offset_27, align 4
  %idxprom1225 = sext i32 %849 to i64
  %arrayidx1226 = getelementptr inbounds float, float* %848, i64 %idxprom1225
  store float %sub1224, float* %arrayidx1226, align 4
  %850 = load float, float* %kon_slh, align 4
  %851 = load float, float* %d_initvalu_36, align 4
  %mul1227 = fmul contract float %850, %851
  %852 = load float, float* %Bmax_SLhighj, align 4
  %853 = load float, float* %d_initvalu_28, align 4
  %sub1228 = fsub contract float %852, %853
  %mul1229 = fmul contract float %mul1227, %sub1228
  %854 = load float, float* %koff_slh, align 4
  %855 = load float, float* %d_initvalu_28, align 4
  %mul1230 = fmul contract float %854, %855
  %sub1231 = fsub contract float %mul1229, %mul1230
  %856 = load float*, float** %d_finavalu.addr, align 8
  %857 = load i32, i32* %offset_28, align 4
  %idxprom1232 = sext i32 %857 to i64
  %arrayidx1233 = getelementptr inbounds float, float* %856, i64 %idxprom1232
  store float %sub1231, float* %arrayidx1233, align 4
  %858 = load float, float* %kon_slh, align 4
  %859 = load float, float* %d_initvalu_37, align 4
  %mul1234 = fmul contract float %858, %859
  %860 = load float, float* %Bmax_SLhighsl, align 4
  %861 = load float, float* %d_initvalu_29, align 4
  %sub1235 = fsub contract float %860, %861
  %mul1236 = fmul contract float %mul1234, %sub1235
  %862 = load float, float* %koff_slh, align 4
  %863 = load float, float* %d_initvalu_29, align 4
  %mul1237 = fmul contract float %862, %863
  %sub1238 = fsub contract float %mul1236, %mul1237
  %864 = load float*, float** %d_finavalu.addr, align 8
  %865 = load i32, i32* %offset_29, align 4
  %idxprom1239 = sext i32 %865 to i64
  %arrayidx1240 = getelementptr inbounds float, float* %864, i64 %idxprom1239
  store float %sub1238, float* %arrayidx1240, align 4
  %866 = load float*, float** %d_finavalu.addr, align 8
  %867 = load i32, i32* %offset_26, align 4
  %idxprom1241 = sext i32 %867 to i64
  %arrayidx1242 = getelementptr inbounds float, float* %866, i64 %idxprom1241
  %868 = load float, float* %arrayidx1242, align 4
  %869 = load float*, float** %d_finavalu.addr, align 8
  %870 = load i32, i32* %offset_28, align 4
  %idxprom1243 = sext i32 %870 to i64
  %arrayidx1244 = getelementptr inbounds float, float* %869, i64 %idxprom1243
  %871 = load float, float* %arrayidx1244, align 4
  %add1245 = fadd contract float %868, %871
  store float %add1245, float* %J_CaB_junction, align 4
  %872 = load float*, float** %d_finavalu.addr, align 8
  %873 = load i32, i32* %offset_27, align 4
  %idxprom1246 = sext i32 %873 to i64
  %arrayidx1247 = getelementptr inbounds float, float* %872, i64 %idxprom1246
  %874 = load float, float* %arrayidx1247, align 4
  %875 = load float*, float** %d_finavalu.addr, align 8
  %876 = load i32, i32* %offset_29, align 4
  %idxprom1248 = sext i32 %876 to i64
  %arrayidx1249 = getelementptr inbounds float, float* %875, i64 %idxprom1248
  %877 = load float, float* %arrayidx1249, align 4
  %add1250 = fadd contract float %874, %877
  store float %add1250, float* %J_CaB_sl, align 4
  %878 = load float, float* %kon_csqn, align 4
  %879 = load float, float* %d_initvalu_31, align 4
  %mul1251 = fmul contract float %878, %879
  %880 = load float, float* %Bmax_Csqn, align 4
  %881 = load float, float* %d_initvalu_30, align 4
  %sub1252 = fsub contract float %880, %881
  %mul1253 = fmul contract float %mul1251, %sub1252
  %882 = load float, float* %koff_csqn, align 4
  %883 = load float, float* %d_initvalu_30, align 4
  %mul1254 = fmul contract float %882, %883
  %sub1255 = fsub contract float %mul1253, %mul1254
  %884 = load float*, float** %d_finavalu.addr, align 8
  %885 = load i32, i32* %offset_30, align 4
  %idxprom1256 = sext i32 %885 to i64
  %arrayidx1257 = getelementptr inbounds float, float* %884, i64 %idxprom1256
  store float %sub1255, float* %arrayidx1257, align 4
  %886 = load float, float* %Vsr, align 4
  %div1258 = fdiv float 1.000000e+00, %886
  store float %div1258, float* %oneovervsr, align 4
  %887 = load float, float* %J_serca, align 4
  %888 = load float, float* %Vmyo, align 4
  %mul1259 = fmul contract float %887, %888
  %889 = load float, float* %oneovervsr, align 4
  %mul1260 = fmul contract float %mul1259, %889
  %890 = load float, float* %J_SRleak, align 4
  %891 = load float, float* %Vmyo, align 4
  %mul1261 = fmul contract float %890, %891
  %892 = load float, float* %oneovervsr, align 4
  %mul1262 = fmul contract float %mul1261, %892
  %893 = load float, float* %J_SRCarel, align 4
  %add1263 = fadd contract float %mul1262, %893
  %sub1264 = fsub contract float %mul1260, %add1263
  %894 = load float*, float** %d_finavalu.addr, align 8
  %895 = load i32, i32* %offset_30, align 4
  %idxprom1265 = sext i32 %895 to i64
  %arrayidx1266 = getelementptr inbounds float, float* %894, i64 %idxprom1265
  %896 = load float, float* %arrayidx1266, align 4
  %sub1267 = fsub contract float %sub1264, %896
  %897 = load float*, float** %d_finavalu.addr, align 8
  %898 = load i32, i32* %offset_31, align 4
  %idxprom1268 = sext i32 %898 to i64
  %arrayidx1269 = getelementptr inbounds float, float* %897, i64 %idxprom1268
  store float %sub1267, float* %arrayidx1269, align 4
  %899 = load float, float* %I_Na_junc, align 4
  %900 = load float, float* %I_nabk_junc, align 4
  %add1270 = fadd contract float %899, %900
  %901 = load float, float* %I_ncx_junc, align 4
  %mul1271 = fmul contract float 3.000000e+00, %901
  %add1272 = fadd contract float %add1270, %mul1271
  %902 = load float, float* %I_nak_junc, align 4
  %mul1273 = fmul contract float 3.000000e+00, %902
  %add1274 = fadd contract float %add1272, %mul1273
  %903 = load float, float* %I_CaNa_junc, align 4
  %add1275 = fadd contract float %add1274, %903
  store float %add1275, float* %I_Na_tot_junc, align 4
  %904 = load float, float* %I_Na_sl, align 4
  %905 = load float, float* %I_nabk_sl, align 4
  %add1276 = fadd contract float %904, %905
  %906 = load float, float* %I_ncx_sl, align 4
  %mul1277 = fmul contract float 3.000000e+00, %906
  %add1278 = fadd contract float %add1276, %mul1277
  %907 = load float, float* %I_nak_sl, align 4
  %mul1279 = fmul contract float 3.000000e+00, %907
  %add1280 = fadd contract float %add1278, %mul1279
  %908 = load float, float* %I_CaNa_sl, align 4
  %add1281 = fadd contract float %add1280, %908
  store float %add1281, float* %I_Na_tot_sl, align 4
  %909 = load float, float* %I_Na_tot_junc, align 4
  %fneg1282 = fneg float %909
  %910 = load float, float* %Cmem, align 4
  %mul1283 = fmul contract float %fneg1282, %910
  %911 = load float, float* %Vjunc, align 4
  %912 = load float, float* %Frdy, align 4
  %mul1284 = fmul contract float %911, %912
  %div1285 = fdiv float %mul1283, %mul1284
  %913 = load float, float* %J_na_juncsl, align 4
  %914 = load float, float* %Vjunc, align 4
  %div1286 = fdiv float %913, %914
  %915 = load float, float* %d_initvalu_33, align 4
  %916 = load float, float* %d_initvalu_32, align 4
  %sub1287 = fsub contract float %915, %916
  %mul1288 = fmul contract float %div1286, %sub1287
  %add1289 = fadd contract float %div1285, %mul1288
  %917 = load float*, float** %d_finavalu.addr, align 8
  %918 = load i32, i32* %offset_17, align 4
  %idxprom1290 = sext i32 %918 to i64
  %arrayidx1291 = getelementptr inbounds float, float* %917, i64 %idxprom1290
  %919 = load float, float* %arrayidx1291, align 4
  %sub1292 = fsub contract float %add1289, %919
  %920 = load float*, float** %d_finavalu.addr, align 8
  %921 = load i32, i32* %offset_32, align 4
  %idxprom1293 = sext i32 %921 to i64
  %arrayidx1294 = getelementptr inbounds float, float* %920, i64 %idxprom1293
  store float %sub1292, float* %arrayidx1294, align 4
  %922 = load float, float* %Vsl, align 4
  %div1295 = fdiv float 1.000000e+00, %922
  store float %div1295, float* %oneovervsl, align 4
  %923 = load float, float* %I_Na_tot_sl, align 4
  %fneg1296 = fneg float %923
  %924 = load float, float* %Cmem, align 4
  %mul1297 = fmul contract float %fneg1296, %924
  %925 = load float, float* %oneovervsl, align 4
  %mul1298 = fmul contract float %mul1297, %925
  %926 = load float, float* %Frdy, align 4
  %div1299 = fdiv float %mul1298, %926
  %927 = load float, float* %J_na_juncsl, align 4
  %928 = load float, float* %oneovervsl, align 4
  %mul1300 = fmul contract float %927, %928
  %929 = load float, float* %d_initvalu_32, align 4
  %930 = load float, float* %d_initvalu_33, align 4
  %sub1301 = fsub contract float %929, %930
  %mul1302 = fmul contract float %mul1300, %sub1301
  %add1303 = fadd contract float %div1299, %mul1302
  %931 = load float, float* %J_na_slmyo, align 4
  %932 = load float, float* %oneovervsl, align 4
  %mul1304 = fmul contract float %931, %932
  %933 = load float, float* %d_initvalu_34, align 4
  %934 = load float, float* %d_initvalu_33, align 4
  %sub1305 = fsub contract float %933, %934
  %mul1306 = fmul contract float %mul1304, %sub1305
  %add1307 = fadd contract float %add1303, %mul1306
  %935 = load float*, float** %d_finavalu.addr, align 8
  %936 = load i32, i32* %offset_18, align 4
  %idxprom1308 = sext i32 %936 to i64
  %arrayidx1309 = getelementptr inbounds float, float* %935, i64 %idxprom1308
  %937 = load float, float* %arrayidx1309, align 4
  %sub1310 = fsub contract float %add1307, %937
  %938 = load float*, float** %d_finavalu.addr, align 8
  %939 = load i32, i32* %offset_33, align 4
  %idxprom1311 = sext i32 %939 to i64
  %arrayidx1312 = getelementptr inbounds float, float* %938, i64 %idxprom1311
  store float %sub1310, float* %arrayidx1312, align 4
  %940 = load float, float* %J_na_slmyo, align 4
  %941 = load float, float* %Vmyo, align 4
  %div1313 = fdiv float %940, %941
  %942 = load float, float* %d_initvalu_33, align 4
  %943 = load float, float* %d_initvalu_34, align 4
  %sub1314 = fsub contract float %942, %943
  %mul1315 = fmul contract float %div1313, %sub1314
  %944 = load float*, float** %d_finavalu.addr, align 8
  %945 = load i32, i32* %offset_34, align 4
  %idxprom1316 = sext i32 %945 to i64
  %arrayidx1317 = getelementptr inbounds float, float* %944, i64 %idxprom1316
  store float %mul1315, float* %arrayidx1317, align 4
  %946 = load float, float* %I_to, align 4
  %947 = load float, float* %I_kr, align 4
  %add1318 = fadd contract float %946, %947
  %948 = load float, float* %I_ks, align 4
  %add1319 = fadd contract float %add1318, %948
  %949 = load float, float* %I_ki, align 4
  %add1320 = fadd contract float %add1319, %949
  %950 = load float, float* %I_nak, align 4
  %mul1321 = fmul contract float 2.000000e+00, %950
  %sub1322 = fsub contract float %add1320, %mul1321
  %951 = load float, float* %I_CaK, align 4
  %add1323 = fadd contract float %sub1322, %951
  %952 = load float, float* %I_kp, align 4
  %add1324 = fadd contract float %add1323, %952
  store float %add1324, float* %I_K_tot, align 4
  %953 = load float*, float** %d_finavalu.addr, align 8
  %954 = load i32, i32* %offset_35, align 4
  %idxprom1325 = sext i32 %954 to i64
  %arrayidx1326 = getelementptr inbounds float, float* %953, i64 %idxprom1325
  store float 0.000000e+00, float* %arrayidx1326, align 4
  %955 = load float, float* %I_Ca_junc, align 4
  %956 = load float, float* %I_cabk_junc, align 4
  %add1327 = fadd contract float %955, %956
  %957 = load float, float* %I_pca_junc, align 4
  %add1328 = fadd contract float %add1327, %957
  %958 = load float, float* %I_ncx_junc, align 4
  %mul1329 = fmul contract float 2.000000e+00, %958
  %sub1330 = fsub contract float %add1328, %mul1329
  store float %sub1330, float* %I_Ca_tot_junc, align 4
  %959 = load float, float* %I_Ca_sl, align 4
  %960 = load float, float* %I_cabk_sl, align 4
  %add1331 = fadd contract float %959, %960
  %961 = load float, float* %I_pca_sl, align 4
  %add1332 = fadd contract float %add1331, %961
  %962 = load float, float* %I_ncx_sl, align 4
  %mul1333 = fmul contract float 2.000000e+00, %962
  %sub1334 = fsub contract float %add1332, %mul1333
  store float %sub1334, float* %I_Ca_tot_sl, align 4
  %963 = load float, float* %I_Ca_tot_junc, align 4
  %fneg1335 = fneg float %963
  %964 = load float, float* %Cmem, align 4
  %mul1336 = fmul contract float %fneg1335, %964
  %965 = load float, float* %Vjunc, align 4
  %mul1337 = fmul contract float %965, 2.000000e+00
  %966 = load float, float* %Frdy, align 4
  %mul1338 = fmul contract float %mul1337, %966
  %div1339 = fdiv float %mul1336, %mul1338
  %967 = load float, float* %J_ca_juncsl, align 4
  %968 = load float, float* %Vjunc, align 4
  %div1340 = fdiv float %967, %968
  %969 = load float, float* %d_initvalu_37, align 4
  %970 = load float, float* %d_initvalu_36, align 4
  %sub1341 = fsub contract float %969, %970
  %mul1342 = fmul contract float %div1340, %sub1341
  %add1343 = fadd contract float %div1339, %mul1342
  %971 = load float, float* %J_CaB_junction, align 4
  %sub1344 = fsub contract float %add1343, %971
  %972 = load float, float* %J_SRCarel, align 4
  %973 = load float, float* %Vsr, align 4
  %mul1345 = fmul contract float %972, %973
  %974 = load float, float* %Vjunc, align 4
  %div1346 = fdiv float %mul1345, %974
  %add1347 = fadd contract float %sub1344, %div1346
  %975 = load float, float* %J_SRleak, align 4
  %976 = load float, float* %Vmyo, align 4
  %mul1348 = fmul contract float %975, %976
  %977 = load float, float* %Vjunc, align 4
  %div1349 = fdiv float %mul1348, %977
  %add1350 = fadd contract float %add1347, %div1349
  %978 = load float*, float** %d_finavalu.addr, align 8
  %979 = load i32, i32* %offset_36, align 4
  %idxprom1351 = sext i32 %979 to i64
  %arrayidx1352 = getelementptr inbounds float, float* %978, i64 %idxprom1351
  store float %add1350, float* %arrayidx1352, align 4
  %980 = load float, float* %I_Ca_tot_sl, align 4
  %fneg1353 = fneg float %980
  %981 = load float, float* %Cmem, align 4
  %mul1354 = fmul contract float %fneg1353, %981
  %982 = load float, float* %Vsl, align 4
  %mul1355 = fmul contract float %982, 2.000000e+00
  %983 = load float, float* %Frdy, align 4
  %mul1356 = fmul contract float %mul1355, %983
  %div1357 = fdiv float %mul1354, %mul1356
  %984 = load float, float* %J_ca_juncsl, align 4
  %985 = load float, float* %Vsl, align 4
  %div1358 = fdiv float %984, %985
  %986 = load float, float* %d_initvalu_36, align 4
  %987 = load float, float* %d_initvalu_37, align 4
  %sub1359 = fsub contract float %986, %987
  %mul1360 = fmul contract float %div1358, %sub1359
  %add1361 = fadd contract float %div1357, %mul1360
  %988 = load float, float* %J_ca_slmyo, align 4
  %989 = load float, float* %Vsl, align 4
  %div1362 = fdiv float %988, %989
  %990 = load float, float* %d_initvalu_38, align 4
  %991 = load float, float* %d_initvalu_37, align 4
  %sub1363 = fsub contract float %990, %991
  %mul1364 = fmul contract float %div1362, %sub1363
  %add1365 = fadd contract float %add1361, %mul1364
  %992 = load float, float* %J_CaB_sl, align 4
  %sub1366 = fsub contract float %add1365, %992
  %993 = load float*, float** %d_finavalu.addr, align 8
  %994 = load i32, i32* %offset_37, align 4
  %idxprom1367 = sext i32 %994 to i64
  %arrayidx1368 = getelementptr inbounds float, float* %993, i64 %idxprom1367
  store float %sub1366, float* %arrayidx1368, align 4
  %995 = load float, float* %J_serca, align 4
  %fneg1369 = fneg float %995
  %996 = load float, float* %J_CaB_cytosol, align 4
  %sub1370 = fsub contract float %fneg1369, %996
  %997 = load float, float* %J_ca_slmyo, align 4
  %998 = load float, float* %Vmyo, align 4
  %div1371 = fdiv float %997, %998
  %999 = load float, float* %d_initvalu_37, align 4
  %1000 = load float, float* %d_initvalu_38, align 4
  %sub1372 = fsub contract float %999, %1000
  %mul1373 = fmul contract float %div1371, %sub1372
  %add1374 = fadd contract float %sub1370, %mul1373
  %1001 = load float*, float** %d_finavalu.addr, align 8
  %1002 = load i32, i32* %offset_38, align 4
  %idxprom1375 = sext i32 %1002 to i64
  %arrayidx1376 = getelementptr inbounds float, float* %1001, i64 %idxprom1375
  store float %add1374, float* %arrayidx1376, align 4
  store i32 1, i32* %state, align 4
  %1003 = load i32, i32* %state, align 4
  br label %NodeBlock3

NodeBlock3:                                       ; preds = %if.end
  %Pivot4 = icmp slt i32 %1003, 1
  br i1 %Pivot4, label %LeafBlock, label %NodeBlock

NodeBlock:                                        ; preds = %NodeBlock3
  %Pivot = icmp slt i32 %1003, 2
  br i1 %Pivot, label %sw.bb1377, label %LeafBlock1

LeafBlock1:                                       ; preds = %NodeBlock
  %SwitchLeaf2 = icmp eq i32 %1003, 2
  br i1 %SwitchLeaf2, label %sw.bb1383, label %NewDefault

LeafBlock:                                        ; preds = %NodeBlock3
  %SwitchLeaf = icmp eq i32 %1003, 0
  br i1 %SwitchLeaf, label %sw.bb, label %NewDefault

sw.bb:                                            ; preds = %LeafBlock
  store float 0.000000e+00, float* %I_app, align 4
  br label %sw.epilog

sw.bb1377:                                        ; preds = %NodeBlock
  %1004 = load float, float* %timeinst.addr, align 4
  %1005 = load float, float* %cycleLength, align 4
  %call1378 = call fastcc float @_ZL4fmodff(float %1004, float %1005) #4
  %cmp1379 = fcmp ole float %call1378, 5.000000e+00
  br i1 %cmp1379, label %if.then1380, label %if.else1381

if.then1380:                                      ; preds = %sw.bb1377
  store float 9.500000e+00, float* %I_app, align 4
  br label %if.end1382

if.else1381:                                      ; preds = %sw.bb1377
  store float 0.000000e+00, float* %I_app, align 4
  br label %if.end1382

if.end1382:                                       ; preds = %if.else1381, %if.then1380
  br label %sw.epilog

sw.bb1383:                                        ; preds = %LeafBlock1
  store float -5.500000e+01, float* %V_hold, align 4
  store float 0.000000e+00, float* %V_test, align 4
  %1006 = load float, float* %timeinst.addr, align 4
  %conv1384 = fpext float %1006 to double
  %cmp1385 = fcmp ogt double %conv1384, 5.000000e-01
  %conv1386 = zext i1 %cmp1385 to i32
  %1007 = load float, float* %timeinst.addr, align 4
  %conv1387 = fpext float %1007 to double
  %cmp1388 = fcmp olt double %conv1387, 2.005000e+02
  %conv1389 = zext i1 %cmp1388 to i32
  %and = and i32 %conv1386, %conv1389
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1390, label %if.else1391

if.then1390:                                      ; preds = %sw.bb1383
  %1008 = load float, float* %V_test, align 4
  store float %1008, float* %V_clamp, align 4
  br label %if.end1392

if.else1391:                                      ; preds = %sw.bb1383
  %1009 = load float, float* %V_hold, align 4
  store float %1009, float* %V_clamp, align 4
  br label %if.end1392

if.end1392:                                       ; preds = %if.else1391, %if.then1390
  store float 0x3FA47AE140000000, float* %R_clamp, align 4
  %1010 = load float, float* %V_clamp, align 4
  %1011 = load float, float* %d_initvalu_39, align 4
  %sub1393 = fsub contract float %1010, %1011
  %1012 = load float, float* %R_clamp, align 4
  %div1394 = fdiv float %sub1393, %1012
  store float %div1394, float* %I_app, align 4
  br label %sw.epilog

NewDefault:                                       ; preds = %LeafBlock, %LeafBlock1
  br label %sw.epilog

sw.epilog:                                        ; preds = %NewDefault, %if.end1392, %if.end1382, %sw.bb
  %1013 = load float, float* %I_Na_tot_junc, align 4
  %1014 = load float, float* %I_Na_tot_sl, align 4
  %add1395 = fadd contract float %1013, %1014
  store float %add1395, float* %I_Na_tot, align 4
  %1015 = load float, float* %I_ClCa, align 4
  %1016 = load float, float* %I_Clbk, align 4
  %add1396 = fadd contract float %1015, %1016
  store float %add1396, float* %I_Cl_tot, align 4
  %1017 = load float, float* %I_Ca_tot_junc, align 4
  %1018 = load float, float* %I_Ca_tot_sl, align 4
  %add1397 = fadd contract float %1017, %1018
  store float %add1397, float* %I_Ca_tot, align 4
  %1019 = load float, float* %I_Na_tot, align 4
  %1020 = load float, float* %I_Cl_tot, align 4
  %add1398 = fadd contract float %1019, %1020
  %1021 = load float, float* %I_Ca_tot, align 4
  %add1399 = fadd contract float %add1398, %1021
  %1022 = load float, float* %I_K_tot, align 4
  %add1400 = fadd contract float %add1399, %1022
  store float %add1400, float* %I_tot, align 4
  %1023 = load float, float* %I_tot, align 4
  %1024 = load float, float* %I_app, align 4
  %sub1401 = fsub contract float %1023, %1024
  %fneg1402 = fneg float %sub1401
  %1025 = load float*, float** %d_finavalu.addr, align 8
  %1026 = load i32, i32* %offset_39, align 4
  %idxprom1403 = sext i32 %1026 to i64
  %arrayidx1404 = getelementptr inbounds float, float* %1025, i64 %idxprom1403
  store float %fneg1402, float* %arrayidx1404, align 4
  %1027 = load float*, float** %d_finavalu.addr, align 8
  %1028 = load i32, i32* %offset_41, align 4
  %idxprom1405 = sext i32 %1028 to i64
  %arrayidx1406 = getelementptr inbounds float, float* %1027, i64 %idxprom1405
  store float 0.000000e+00, float* %arrayidx1406, align 4
  %1029 = load float*, float** %d_finavalu.addr, align 8
  %1030 = load i32, i32* %offset_42, align 4
  %idxprom1407 = sext i32 %1030 to i64
  %arrayidx1408 = getelementptr inbounds float, float* %1029, i64 %idxprom1407
  store float 0.000000e+00, float* %arrayidx1408, align 4
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL3powfi(float %__base, i32 %__iexp) unnamed_addr #1 {
entry:
  %call = tail call fastcc float @_ZL5powiffi(float %__base, i32 %__iexp) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL3logf(float %__x) unnamed_addr #1 {
entry:
  %call = tail call fastcc float @_ZL4logff(float %__x) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc double @_ZL3expd(double %__a) unnamed_addr #1 {
entry:
  %call = tail call double @__nv_exp(double %__a) #4
  ret double %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL3expf(float %__x) unnamed_addr #1 {
entry:
  %call = tail call fastcc float @_ZL4expff(float %__x) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc double @_ZL4sqrtd(double %__a) unnamed_addr #1 {
entry:
  %call = tail call double @__nv_sqrt(double %__a) #4
  ret double %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL5log10f(float %__x) unnamed_addr #1 {
entry:
  %call = tail call fastcc float @_ZL6log10ff(float %__x) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc double @_ZL3powdi(double %__base) unnamed_addr #1 {
entry:
  %call = tail call fastcc double @_ZL4powidi(double %__base) #4
  ret double %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL3powff(float %__base, float %__exp) unnamed_addr #1 {
entry:
  %call = tail call fastcc float @_ZL4powfff(float %__base, float %__exp) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL4fmodff(float %__x, float %__y) unnamed_addr #1 {
entry:
  %call = tail call fastcc float @_ZL5fmodfff(float %__x, float %__y) #4
  ret float %call
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z10kernel_camfPfS_iS_iS_if(float %timeinst, float* noalias %d_initvalu, float* noalias %d_finavalu, i32 %valu_offset, float* noalias %d_params, i32 %params_offset, float* noalias %d_com, i32 %com_offset, float %Ca) local_unnamed_addr #0 {
entry:
  %timeinst.addr = alloca float, align 4
  %d_initvalu.addr = alloca float*, align 8
  %d_finavalu.addr = alloca float*, align 8
  %valu_offset.addr = alloca i32, align 4
  %d_params.addr = alloca float*, align 8
  %params_offset.addr = alloca i32, align 4
  %d_com.addr = alloca float*, align 8
  %com_offset.addr = alloca i32, align 4
  %Ca.addr = alloca float, align 4
  %Btot = alloca float, align 4
  %CaMKIItot = alloca float, align 4
  %CaNtot = alloca float, align 4
  %PP1tot = alloca float, align 4
  %K = alloca float, align 4
  %Mg = alloca float, align 4
  %offset_1 = alloca i32, align 4
  %offset_2 = alloca i32, align 4
  %offset_3 = alloca i32, align 4
  %offset_4 = alloca i32, align 4
  %offset_5 = alloca i32, align 4
  %offset_6 = alloca i32, align 4
  %offset_7 = alloca i32, align 4
  %offset_8 = alloca i32, align 4
  %offset_9 = alloca i32, align 4
  %offset_10 = alloca i32, align 4
  %offset_11 = alloca i32, align 4
  %offset_12 = alloca i32, align 4
  %offset_13 = alloca i32, align 4
  %offset_14 = alloca i32, align 4
  %offset_15 = alloca i32, align 4
  %CaM = alloca float, align 4
  %Ca2CaM = alloca float, align 4
  %Ca4CaM = alloca float, align 4
  %CaMB = alloca float, align 4
  %Ca2CaMB = alloca float, align 4
  %Ca4CaMB = alloca float, align 4
  %Pb2 = alloca float, align 4
  %Pb = alloca float, align 4
  %Pt = alloca float, align 4
  %Pt2 = alloca float, align 4
  %Pa = alloca float, align 4
  %Ca4CaN = alloca float, align 4
  %CaMCa4CaN = alloca float, align 4
  %Ca2CaMCa4CaN = alloca float, align 4
  %Ca4CaMCa4CaN = alloca float, align 4
  %Kd02 = alloca float, align 4
  %Kd24 = alloca float, align 4
  %k20 = alloca float, align 4
  %k02 = alloca float, align 4
  %k42 = alloca float, align 4
  %k24 = alloca float, align 4
  %k0Boff = alloca float, align 4
  %k0Bon = alloca float, align 4
  %k2Boff = alloca float, align 4
  %k2Bon = alloca float, align 4
  %k4Boff = alloca float, align 4
  %k4Bon = alloca float, align 4
  %k20B = alloca float, align 4
  %k02B = alloca float, align 4
  %k42B = alloca float, align 4
  %k24B = alloca float, align 4
  %kbi = alloca float, align 4
  %kib = alloca float, align 4
  %kpp1 = alloca float, align 4
  %Kmpp1 = alloca float, align 4
  %kib2 = alloca float, align 4
  %kb2i = alloca float, align 4
  %kb24 = alloca float, align 4
  %kb42 = alloca float, align 4
  %kta = alloca float, align 4
  %kat = alloca float, align 4
  %kt42 = alloca float, align 4
  %kt24 = alloca float, align 4
  %kat2 = alloca float, align 4
  %kt2a = alloca float, align 4
  %kcanCaoff = alloca float, align 4
  %kcanCaon = alloca float, align 4
  %kcanCaM4on = alloca float, align 4
  %kcanCaM4off = alloca float, align 4
  %kcanCaM2on = alloca float, align 4
  %kcanCaM2off = alloca float, align 4
  %kcanCaM0on = alloca float, align 4
  %kcanCaM0off = alloca float, align 4
  %k02can = alloca float, align 4
  %k20can = alloca float, align 4
  %k24can = alloca float, align 4
  %k42can = alloca float, align 4
  %rcn02 = alloca float, align 4
  %rcn24 = alloca float, align 4
  %B = alloca float, align 4
  %rcn02B = alloca float, align 4
  %rcn24B = alloca float, align 4
  %rcn0B = alloca float, align 4
  %rcn2B = alloca float, align 4
  %rcn4B = alloca float, align 4
  %Ca2CaN = alloca float, align 4
  %rcnCa4CaN = alloca float, align 4
  %rcn02CaN = alloca float, align 4
  %rcn24CaN = alloca float, align 4
  %rcn0CaN = alloca float, align 4
  %rcn2CaN = alloca float, align 4
  %rcn4CaN = alloca float, align 4
  %Pix = alloca float, align 4
  %rcnCKib2 = alloca float, align 4
  %rcnCKb2b = alloca float, align 4
  %rcnCKib = alloca float, align 4
  %T = alloca float, align 4
  %kbt = alloca float, align 4
  %rcnCKbt = alloca float, align 4
  %rcnCKtt2 = alloca float, align 4
  %rcnCKta = alloca float, align 4
  %rcnCKt2a = alloca float, align 4
  %rcnCKt2b2 = alloca float, align 4
  %rcnCKai = alloca float, align 4
  %dCaM = alloca float, align 4
  %dCa2CaM = alloca float, align 4
  %dCa4CaM = alloca float, align 4
  %dCaMB = alloca float, align 4
  %dCa2CaMB = alloca float, align 4
  %dCa4CaMB = alloca float, align 4
  %dPb2 = alloca float, align 4
  %dPb = alloca float, align 4
  %dPt = alloca float, align 4
  %dPt2 = alloca float, align 4
  %dPa = alloca float, align 4
  %dCa4CaN = alloca float, align 4
  %dCaMCa4CaN = alloca float, align 4
  %dCa2CaMCa4CaN = alloca float, align 4
  %dCa4CaMCa4CaN = alloca float, align 4
  store float %timeinst, float* %timeinst.addr, align 4
  store float* %d_initvalu, float** %d_initvalu.addr, align 8
  store float* %d_finavalu, float** %d_finavalu.addr, align 8
  store i32 %valu_offset, i32* %valu_offset.addr, align 4
  store float* %d_params, float** %d_params.addr, align 8
  store i32 %params_offset, i32* %params_offset.addr, align 4
  store float* %d_com, float** %d_com.addr, align 8
  store i32 %com_offset, i32* %com_offset.addr, align 4
  store float %Ca, float* %Ca.addr, align 4
  %0 = load float*, float** %d_params.addr, align 8
  %1 = load i32, i32* %params_offset.addr, align 4
  %add = add nsw i32 %1, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %0, i64 %idxprom
  %2 = load float, float* %arrayidx, align 4
  store float %2, float* %Btot, align 4
  %3 = load float*, float** %d_params.addr, align 8
  %4 = load i32, i32* %params_offset.addr, align 4
  %add1 = add nsw i32 %4, 2
  %idxprom2 = sext i32 %add1 to i64
  %arrayidx3 = getelementptr inbounds float, float* %3, i64 %idxprom2
  %5 = load float, float* %arrayidx3, align 4
  store float %5, float* %CaMKIItot, align 4
  %6 = load float*, float** %d_params.addr, align 8
  %7 = load i32, i32* %params_offset.addr, align 4
  %add4 = add nsw i32 %7, 3
  %idxprom5 = sext i32 %add4 to i64
  %arrayidx6 = getelementptr inbounds float, float* %6, i64 %idxprom5
  %8 = load float, float* %arrayidx6, align 4
  store float %8, float* %CaNtot, align 4
  %9 = load float*, float** %d_params.addr, align 8
  %10 = load i32, i32* %params_offset.addr, align 4
  %add7 = add nsw i32 %10, 4
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds float, float* %9, i64 %idxprom8
  %11 = load float, float* %arrayidx9, align 4
  store float %11, float* %PP1tot, align 4
  %12 = load float*, float** %d_params.addr, align 8
  %arrayidx10 = getelementptr inbounds float, float* %12, i64 16
  %13 = load float, float* %arrayidx10, align 4
  store float %13, float* %K, align 4
  %14 = load float*, float** %d_params.addr, align 8
  %arrayidx11 = getelementptr inbounds float, float* %14, i64 17
  %15 = load float, float* %arrayidx11, align 4
  store float %15, float* %Mg, align 4
  %16 = load i32, i32* %valu_offset.addr, align 4
  store i32 %16, i32* %offset_1, align 4
  %17 = load i32, i32* %valu_offset.addr, align 4
  %add12 = add nsw i32 %17, 1
  store i32 %add12, i32* %offset_2, align 4
  %18 = load i32, i32* %valu_offset.addr, align 4
  %add13 = add nsw i32 %18, 2
  store i32 %add13, i32* %offset_3, align 4
  %19 = load i32, i32* %valu_offset.addr, align 4
  %add14 = add nsw i32 %19, 3
  store i32 %add14, i32* %offset_4, align 4
  %20 = load i32, i32* %valu_offset.addr, align 4
  %add15 = add nsw i32 %20, 4
  store i32 %add15, i32* %offset_5, align 4
  %21 = load i32, i32* %valu_offset.addr, align 4
  %add16 = add nsw i32 %21, 5
  store i32 %add16, i32* %offset_6, align 4
  %22 = load i32, i32* %valu_offset.addr, align 4
  %add17 = add nsw i32 %22, 6
  store i32 %add17, i32* %offset_7, align 4
  %23 = load i32, i32* %valu_offset.addr, align 4
  %add18 = add nsw i32 %23, 7
  store i32 %add18, i32* %offset_8, align 4
  %24 = load i32, i32* %valu_offset.addr, align 4
  %add19 = add nsw i32 %24, 8
  store i32 %add19, i32* %offset_9, align 4
  %25 = load i32, i32* %valu_offset.addr, align 4
  %add20 = add nsw i32 %25, 9
  store i32 %add20, i32* %offset_10, align 4
  %26 = load i32, i32* %valu_offset.addr, align 4
  %add21 = add nsw i32 %26, 10
  store i32 %add21, i32* %offset_11, align 4
  %27 = load i32, i32* %valu_offset.addr, align 4
  %add22 = add nsw i32 %27, 11
  store i32 %add22, i32* %offset_12, align 4
  %28 = load i32, i32* %valu_offset.addr, align 4
  %add23 = add nsw i32 %28, 12
  store i32 %add23, i32* %offset_13, align 4
  %29 = load i32, i32* %valu_offset.addr, align 4
  %add24 = add nsw i32 %29, 13
  store i32 %add24, i32* %offset_14, align 4
  %30 = load i32, i32* %valu_offset.addr, align 4
  %add25 = add nsw i32 %30, 14
  store i32 %add25, i32* %offset_15, align 4
  %31 = load float*, float** %d_initvalu.addr, align 8
  %32 = load i32, i32* %offset_1, align 4
  %idxprom26 = sext i32 %32 to i64
  %arrayidx27 = getelementptr inbounds float, float* %31, i64 %idxprom26
  %33 = load float, float* %arrayidx27, align 4
  store float %33, float* %CaM, align 4
  %34 = load float*, float** %d_initvalu.addr, align 8
  %35 = load i32, i32* %offset_2, align 4
  %idxprom28 = sext i32 %35 to i64
  %arrayidx29 = getelementptr inbounds float, float* %34, i64 %idxprom28
  %36 = load float, float* %arrayidx29, align 4
  store float %36, float* %Ca2CaM, align 4
  %37 = load float*, float** %d_initvalu.addr, align 8
  %38 = load i32, i32* %offset_3, align 4
  %idxprom30 = sext i32 %38 to i64
  %arrayidx31 = getelementptr inbounds float, float* %37, i64 %idxprom30
  %39 = load float, float* %arrayidx31, align 4
  store float %39, float* %Ca4CaM, align 4
  %40 = load float*, float** %d_initvalu.addr, align 8
  %41 = load i32, i32* %offset_4, align 4
  %idxprom32 = sext i32 %41 to i64
  %arrayidx33 = getelementptr inbounds float, float* %40, i64 %idxprom32
  %42 = load float, float* %arrayidx33, align 4
  store float %42, float* %CaMB, align 4
  %43 = load float*, float** %d_initvalu.addr, align 8
  %44 = load i32, i32* %offset_5, align 4
  %idxprom34 = sext i32 %44 to i64
  %arrayidx35 = getelementptr inbounds float, float* %43, i64 %idxprom34
  %45 = load float, float* %arrayidx35, align 4
  store float %45, float* %Ca2CaMB, align 4
  %46 = load float*, float** %d_initvalu.addr, align 8
  %47 = load i32, i32* %offset_6, align 4
  %idxprom36 = sext i32 %47 to i64
  %arrayidx37 = getelementptr inbounds float, float* %46, i64 %idxprom36
  %48 = load float, float* %arrayidx37, align 4
  store float %48, float* %Ca4CaMB, align 4
  %49 = load float*, float** %d_initvalu.addr, align 8
  %50 = load i32, i32* %offset_7, align 4
  %idxprom38 = sext i32 %50 to i64
  %arrayidx39 = getelementptr inbounds float, float* %49, i64 %idxprom38
  %51 = load float, float* %arrayidx39, align 4
  store float %51, float* %Pb2, align 4
  %52 = load float*, float** %d_initvalu.addr, align 8
  %53 = load i32, i32* %offset_8, align 4
  %idxprom40 = sext i32 %53 to i64
  %arrayidx41 = getelementptr inbounds float, float* %52, i64 %idxprom40
  %54 = load float, float* %arrayidx41, align 4
  store float %54, float* %Pb, align 4
  %55 = load float*, float** %d_initvalu.addr, align 8
  %56 = load i32, i32* %offset_9, align 4
  %idxprom42 = sext i32 %56 to i64
  %arrayidx43 = getelementptr inbounds float, float* %55, i64 %idxprom42
  %57 = load float, float* %arrayidx43, align 4
  store float %57, float* %Pt, align 4
  %58 = load float*, float** %d_initvalu.addr, align 8
  %59 = load i32, i32* %offset_10, align 4
  %idxprom44 = sext i32 %59 to i64
  %arrayidx45 = getelementptr inbounds float, float* %58, i64 %idxprom44
  %60 = load float, float* %arrayidx45, align 4
  store float %60, float* %Pt2, align 4
  %61 = load float*, float** %d_initvalu.addr, align 8
  %62 = load i32, i32* %offset_11, align 4
  %idxprom46 = sext i32 %62 to i64
  %arrayidx47 = getelementptr inbounds float, float* %61, i64 %idxprom46
  %63 = load float, float* %arrayidx47, align 4
  store float %63, float* %Pa, align 4
  %64 = load float*, float** %d_initvalu.addr, align 8
  %65 = load i32, i32* %offset_12, align 4
  %idxprom48 = sext i32 %65 to i64
  %arrayidx49 = getelementptr inbounds float, float* %64, i64 %idxprom48
  %66 = load float, float* %arrayidx49, align 4
  store float %66, float* %Ca4CaN, align 4
  %67 = load float*, float** %d_initvalu.addr, align 8
  %68 = load i32, i32* %offset_13, align 4
  %idxprom50 = sext i32 %68 to i64
  %arrayidx51 = getelementptr inbounds float, float* %67, i64 %idxprom50
  %69 = load float, float* %arrayidx51, align 4
  store float %69, float* %CaMCa4CaN, align 4
  %70 = load float*, float** %d_initvalu.addr, align 8
  %71 = load i32, i32* %offset_14, align 4
  %idxprom52 = sext i32 %71 to i64
  %arrayidx53 = getelementptr inbounds float, float* %70, i64 %idxprom52
  %72 = load float, float* %arrayidx53, align 4
  store float %72, float* %Ca2CaMCa4CaN, align 4
  %73 = load float*, float** %d_initvalu.addr, align 8
  %74 = load i32, i32* %offset_15, align 4
  %idxprom54 = sext i32 %74 to i64
  %arrayidx55 = getelementptr inbounds float, float* %73, i64 %idxprom54
  %75 = load float, float* %arrayidx55, align 4
  store float %75, float* %Ca4CaMCa4CaN, align 4
  %76 = load float, float* %Mg, align 4
  %cmp = fcmp ole float %76, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %77 = load float, float* %K, align 4
  %conv = fpext float %77 to double
  %div = fdiv double %conv, 0x3FEE147AE147AE14
  %add56 = fadd contract double 1.000000e+00, %div
  %78 = load float, float* %Mg, align 4
  %conv57 = fpext float %78 to double
  %div58 = fdiv double %conv57, 1.200000e-02
  %sub = fsub contract double %add56, %div58
  %mul = fmul contract double 2.500000e-03, %sub
  %79 = load float, float* %K, align 4
  %conv59 = fpext float %79 to double
  %div60 = fdiv double %conv59, 8.100000e+00
  %add61 = fadd contract double 1.000000e+00, %div60
  %80 = load float, float* %Mg, align 4
  %conv62 = fpext float %80 to double
  %div63 = fdiv double %conv62, 2.200000e-02
  %add64 = fadd contract double %add61, %div63
  %mul65 = fmul contract double %mul, %add64
  %conv66 = fptrunc double %mul65 to float
  store float %conv66, float* %Kd02, align 4
  %81 = load float, float* %K, align 4
  %conv67 = fpext float %81 to double
  %div68 = fdiv double %conv67, 6.400000e-01
  %add69 = fadd contract double 1.000000e+00, %div68
  %82 = load float, float* %Mg, align 4
  %conv70 = fpext float %82 to double
  %div71 = fdiv double %conv70, 1.400000e-03
  %add72 = fadd contract double %add69, %div71
  %mul73 = fmul contract double 1.280000e-01, %add72
  %83 = load float, float* %K, align 4
  %conv74 = fpext float %83 to double
  %div75 = fdiv double %conv74, 1.300000e+01
  %add76 = fadd contract double 1.000000e+00, %div75
  %84 = load float, float* %Mg, align 4
  %conv77 = fpext float %84 to double
  %div78 = fdiv double %conv77, 1.530000e-01
  %sub79 = fsub contract double %add76, %div78
  %mul80 = fmul contract double %mul73, %sub79
  %conv81 = fptrunc double %mul80 to float
  store float %conv81, float* %Kd24, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %85 = load float, float* %K, align 4
  %conv82 = fpext float %85 to double
  %div83 = fdiv double %conv82, 0x3FEE147AE147AE14
  %add84 = fadd contract double 1.000000e+00, %div83
  %sub85 = fsub contract double %add84, 0x4054D55555555555
  %86 = load float, float* %Mg, align 4
  %sub86 = fsub contract float %86, 1.000000e+00
  %conv87 = fpext float %sub86 to double
  %div88 = fdiv double %conv87, 6.000000e-02
  %add89 = fadd contract double %sub85, %div88
  %mul90 = fmul contract double 2.500000e-03, %add89
  %87 = load float, float* %K, align 4
  %conv91 = fpext float %87 to double
  %div92 = fdiv double %conv91, 8.100000e+00
  %add93 = fadd contract double 1.000000e+00, %div92
  %add94 = fadd contract double %add93, 0x4046BA2E8BA2E8BB
  %88 = load float, float* %Mg, align 4
  %sub95 = fsub contract float %88, 1.000000e+00
  %conv96 = fpext float %sub95 to double
  %div97 = fdiv double %conv96, 6.800000e-02
  %add98 = fadd contract double %add94, %div97
  %mul99 = fmul contract double %mul90, %add98
  %conv100 = fptrunc double %mul99 to float
  store float %conv100, float* %Kd02, align 4
  %89 = load float, float* %K, align 4
  %conv101 = fpext float %89 to double
  %div102 = fdiv double %conv101, 6.400000e-01
  %add103 = fadd contract double 1.000000e+00, %div102
  %add104 = fadd contract double %add103, 0x4086524924924925
  %90 = load float, float* %Mg, align 4
  %sub105 = fsub contract float %90, 1.000000e+00
  %conv106 = fpext float %sub105 to double
  %div107 = fdiv double %conv106, 5.000000e-03
  %add108 = fadd contract double %add104, %div107
  %mul109 = fmul contract double 1.280000e-01, %add108
  %91 = load float, float* %K, align 4
  %conv110 = fpext float %91 to double
  %div111 = fdiv double %conv110, 1.300000e+01
  %add112 = fadd contract double 1.000000e+00, %div111
  %sub113 = fsub contract double %add112, 0x401A24CF7A24CF7A
  %92 = load float, float* %Mg, align 4
  %sub114 = fsub contract float %92, 1.000000e+00
  %conv115 = fpext float %sub114 to double
  %div116 = fdiv double %conv115, 1.500000e-01
  %add117 = fadd contract double %sub113, %div116
  %mul118 = fmul contract double %mul109, %add117
  %conv119 = fptrunc double %mul118 to float
  store float %conv119, float* %Kd24, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store float 1.000000e+01, float* %k20, align 4
  %93 = load float, float* %k20, align 4
  %94 = load float, float* %Kd02, align 4
  %div120 = fdiv float %93, %94
  store float %div120, float* %k02, align 4
  store float 5.000000e+02, float* %k42, align 4
  %95 = load float, float* %k42, align 4
  %96 = load float, float* %Kd24, align 4
  %div121 = fdiv float %95, %96
  store float %div121, float* %k24, align 4
  store float 0x3F56F00680000000, float* %k0Boff, align 4
  %97 = load float, float* %k0Boff, align 4
  %conv122 = fpext float %97 to double
  %div123 = fdiv double %conv122, 2.000000e-01
  %conv124 = fptrunc double %div123 to float
  store float %conv124, float* %k0Bon, align 4
  %98 = load float, float* %k0Boff, align 4
  %div125 = fdiv float %98, 1.000000e+02
  store float %div125, float* %k2Boff, align 4
  %99 = load float, float* %k0Bon, align 4
  store float %99, float* %k2Bon, align 4
  %100 = load float, float* %k2Boff, align 4
  store float %100, float* %k4Boff, align 4
  %101 = load float, float* %k0Bon, align 4
  store float %101, float* %k4Bon, align 4
  %102 = load float, float* %k20, align 4
  %div126 = fdiv float %102, 1.000000e+02
  store float %div126, float* %k20B, align 4
  %103 = load float, float* %k02, align 4
  store float %103, float* %k02B, align 4
  %104 = load float, float* %k42, align 4
  store float %104, float* %k42B, align 4
  %105 = load float, float* %k24, align 4
  store float %105, float* %k24B, align 4
  store float 0x40019999A0000000, float* %kbi, align 4
  %106 = load float, float* %kbi, align 4
  %conv127 = fpext float %106 to double
  %div128 = fdiv double %conv127, 3.350000e-02
  %conv129 = fptrunc double %div128 to float
  store float %conv129, float* %kib, align 4
  store float 0x3FFB851EC0000000, float* %kpp1, align 4
  store float 1.150000e+01, float* %Kmpp1, align 4
  %107 = load float, float* %kib, align 4
  store float %107, float* %kib2, align 4
  %108 = load float, float* %kib2, align 4
  %mul130 = fmul contract float %108, 5.000000e+00
  store float %mul130, float* %kb2i, align 4
  %109 = load float, float* %k24, align 4
  store float %109, float* %kb24, align 4
  %110 = load float, float* %k42, align 4
  %conv131 = fpext float %110 to double
  %mul132 = fmul contract double %conv131, 3.350000e-02
  %div133 = fdiv double %mul132, 5.000000e+00
  %conv134 = fptrunc double %div133 to float
  store float %conv134, float* %kb42, align 4
  %111 = load float, float* %kbi, align 4
  %div135 = fdiv float %111, 1.000000e+03
  store float %div135, float* %kta, align 4
  %112 = load float, float* %kib, align 4
  store float %112, float* %kat, align 4
  %113 = load float, float* %k42, align 4
  %conv136 = fpext float %113 to double
  %mul137 = fmul contract double %conv136, 3.350000e-05
  %div138 = fdiv double %mul137, 5.000000e+00
  %conv139 = fptrunc double %div138 to float
  store float %conv139, float* %kt42, align 4
  %114 = load float, float* %k24, align 4
  store float %114, float* %kt24, align 4
  %115 = load float, float* %kib, align 4
  store float %115, float* %kat2, align 4
  %116 = load float, float* %kib, align 4
  %mul140 = fmul contract float %116, 5.000000e+00
  store float %mul140, float* %kt2a, align 4
  store float 1.000000e+00, float* %kcanCaoff, align 4
  %117 = load float, float* %kcanCaoff, align 4
  %conv141 = fpext float %117 to double
  %div142 = fdiv double %conv141, 5.000000e-01
  %conv143 = fptrunc double %div142 to float
  store float %conv143, float* %kcanCaon, align 4
  store float 4.600000e+01, float* %kcanCaM4on, align 4
  store float 0x3F554C9860000000, float* %kcanCaM4off, align 4
  %118 = load float, float* %kcanCaM4on, align 4
  store float %118, float* %kcanCaM2on, align 4
  %119 = load float, float* %kcanCaM4off, align 4
  %mul144 = fmul contract float 2.508000e+03, %119
  store float %mul144, float* %kcanCaM2off, align 4
  %120 = load float, float* %kcanCaM4on, align 4
  store float %120, float* %kcanCaM0on, align 4
  %121 = load float, float* %kcanCaM2off, align 4
  %mul145 = fmul contract float 1.650000e+02, %121
  store float %mul145, float* %kcanCaM0off, align 4
  %122 = load float, float* %k02, align 4
  store float %122, float* %k02can, align 4
  %123 = load float, float* %k20, align 4
  %div146 = fdiv float %123, 1.650000e+02
  store float %div146, float* %k20can, align 4
  %124 = load float, float* %k24, align 4
  store float %124, float* %k24can, align 4
  %125 = load float, float* %k20, align 4
  %div147 = fdiv float %125, 2.508000e+03
  store float %div147, float* %k42can, align 4
  %126 = load float, float* %k02, align 4
  %127 = load float, float* %Ca.addr, align 4
  %call = call fastcc float @_ZL3powfi(float %127, i32 2) #4
  %mul148 = fmul contract float %126, %call
  %128 = load float, float* %CaM, align 4
  %mul149 = fmul contract float %mul148, %128
  %129 = load float, float* %k20, align 4
  %130 = load float, float* %Ca2CaM, align 4
  %mul150 = fmul contract float %129, %130
  %sub151 = fsub contract float %mul149, %mul150
  store float %sub151, float* %rcn02, align 4
  %131 = load float, float* %k24, align 4
  %132 = load float, float* %Ca.addr, align 4
  %call152 = call fastcc float @_ZL3powfi(float %132, i32 2) #4
  %mul153 = fmul contract float %131, %call152
  %133 = load float, float* %Ca2CaM, align 4
  %mul154 = fmul contract float %mul153, %133
  %134 = load float, float* %k42, align 4
  %135 = load float, float* %Ca4CaM, align 4
  %mul155 = fmul contract float %134, %135
  %sub156 = fsub contract float %mul154, %mul155
  store float %sub156, float* %rcn24, align 4
  %136 = load float, float* %Btot, align 4
  %137 = load float, float* %CaMB, align 4
  %sub157 = fsub contract float %136, %137
  %138 = load float, float* %Ca2CaMB, align 4
  %sub158 = fsub contract float %sub157, %138
  %139 = load float, float* %Ca4CaMB, align 4
  %sub159 = fsub contract float %sub158, %139
  store float %sub159, float* %B, align 4
  %140 = load float, float* %k02B, align 4
  %141 = load float, float* %Ca.addr, align 4
  %call160 = call fastcc float @_ZL3powfi(float %141, i32 2) #4
  %mul161 = fmul contract float %140, %call160
  %142 = load float, float* %CaMB, align 4
  %mul162 = fmul contract float %mul161, %142
  %143 = load float, float* %k20B, align 4
  %144 = load float, float* %Ca2CaMB, align 4
  %mul163 = fmul contract float %143, %144
  %sub164 = fsub contract float %mul162, %mul163
  store float %sub164, float* %rcn02B, align 4
  %145 = load float, float* %k24B, align 4
  %146 = load float, float* %Ca.addr, align 4
  %call165 = call fastcc float @_ZL3powfi(float %146, i32 2) #4
  %mul166 = fmul contract float %145, %call165
  %147 = load float, float* %Ca2CaMB, align 4
  %mul167 = fmul contract float %mul166, %147
  %148 = load float, float* %k42B, align 4
  %149 = load float, float* %Ca4CaMB, align 4
  %mul168 = fmul contract float %148, %149
  %sub169 = fsub contract float %mul167, %mul168
  store float %sub169, float* %rcn24B, align 4
  %150 = load float, float* %k0Bon, align 4
  %151 = load float, float* %CaM, align 4
  %mul170 = fmul contract float %150, %151
  %152 = load float, float* %B, align 4
  %mul171 = fmul contract float %mul170, %152
  %153 = load float, float* %k0Boff, align 4
  %154 = load float, float* %CaMB, align 4
  %mul172 = fmul contract float %153, %154
  %sub173 = fsub contract float %mul171, %mul172
  store float %sub173, float* %rcn0B, align 4
  %155 = load float, float* %k2Bon, align 4
  %156 = load float, float* %Ca2CaM, align 4
  %mul174 = fmul contract float %155, %156
  %157 = load float, float* %B, align 4
  %mul175 = fmul contract float %mul174, %157
  %158 = load float, float* %k2Boff, align 4
  %159 = load float, float* %Ca2CaMB, align 4
  %mul176 = fmul contract float %158, %159
  %sub177 = fsub contract float %mul175, %mul176
  store float %sub177, float* %rcn2B, align 4
  %160 = load float, float* %k4Bon, align 4
  %161 = load float, float* %Ca4CaM, align 4
  %mul178 = fmul contract float %160, %161
  %162 = load float, float* %B, align 4
  %mul179 = fmul contract float %mul178, %162
  %163 = load float, float* %k4Boff, align 4
  %164 = load float, float* %Ca4CaMB, align 4
  %mul180 = fmul contract float %163, %164
  %sub181 = fsub contract float %mul179, %mul180
  store float %sub181, float* %rcn4B, align 4
  %165 = load float, float* %CaNtot, align 4
  %166 = load float, float* %Ca4CaN, align 4
  %sub182 = fsub contract float %165, %166
  %167 = load float, float* %CaMCa4CaN, align 4
  %sub183 = fsub contract float %sub182, %167
  %168 = load float, float* %Ca2CaMCa4CaN, align 4
  %sub184 = fsub contract float %sub183, %168
  %169 = load float, float* %Ca4CaMCa4CaN, align 4
  %sub185 = fsub contract float %sub184, %169
  store float %sub185, float* %Ca2CaN, align 4
  %170 = load float, float* %kcanCaon, align 4
  %171 = load float, float* %Ca.addr, align 4
  %call186 = call fastcc float @_ZL3powfi(float %171, i32 2) #4
  %mul187 = fmul contract float %170, %call186
  %172 = load float, float* %Ca2CaN, align 4
  %mul188 = fmul contract float %mul187, %172
  %173 = load float, float* %kcanCaoff, align 4
  %174 = load float, float* %Ca4CaN, align 4
  %mul189 = fmul contract float %173, %174
  %sub190 = fsub contract float %mul188, %mul189
  store float %sub190, float* %rcnCa4CaN, align 4
  %175 = load float, float* %k02can, align 4
  %176 = load float, float* %Ca.addr, align 4
  %call191 = call fastcc float @_ZL3powfi(float %176, i32 2) #4
  %mul192 = fmul contract float %175, %call191
  %177 = load float, float* %CaMCa4CaN, align 4
  %mul193 = fmul contract float %mul192, %177
  %178 = load float, float* %k20can, align 4
  %179 = load float, float* %Ca2CaMCa4CaN, align 4
  %mul194 = fmul contract float %178, %179
  %sub195 = fsub contract float %mul193, %mul194
  store float %sub195, float* %rcn02CaN, align 4
  %180 = load float, float* %k24can, align 4
  %181 = load float, float* %Ca.addr, align 4
  %call196 = call fastcc float @_ZL3powfi(float %181, i32 2) #4
  %mul197 = fmul contract float %180, %call196
  %182 = load float, float* %Ca2CaMCa4CaN, align 4
  %mul198 = fmul contract float %mul197, %182
  %183 = load float, float* %k42can, align 4
  %184 = load float, float* %Ca4CaMCa4CaN, align 4
  %mul199 = fmul contract float %183, %184
  %sub200 = fsub contract float %mul198, %mul199
  store float %sub200, float* %rcn24CaN, align 4
  %185 = load float, float* %kcanCaM0on, align 4
  %186 = load float, float* %CaM, align 4
  %mul201 = fmul contract float %185, %186
  %187 = load float, float* %Ca4CaN, align 4
  %mul202 = fmul contract float %mul201, %187
  %188 = load float, float* %kcanCaM0off, align 4
  %189 = load float, float* %CaMCa4CaN, align 4
  %mul203 = fmul contract float %188, %189
  %sub204 = fsub contract float %mul202, %mul203
  store float %sub204, float* %rcn0CaN, align 4
  %190 = load float, float* %kcanCaM2on, align 4
  %191 = load float, float* %Ca2CaM, align 4
  %mul205 = fmul contract float %190, %191
  %192 = load float, float* %Ca4CaN, align 4
  %mul206 = fmul contract float %mul205, %192
  %193 = load float, float* %kcanCaM2off, align 4
  %194 = load float, float* %Ca2CaMCa4CaN, align 4
  %mul207 = fmul contract float %193, %194
  %sub208 = fsub contract float %mul206, %mul207
  store float %sub208, float* %rcn2CaN, align 4
  %195 = load float, float* %kcanCaM4on, align 4
  %196 = load float, float* %Ca4CaM, align 4
  %mul209 = fmul contract float %195, %196
  %197 = load float, float* %Ca4CaN, align 4
  %mul210 = fmul contract float %mul209, %197
  %198 = load float, float* %kcanCaM4off, align 4
  %199 = load float, float* %Ca4CaMCa4CaN, align 4
  %mul211 = fmul contract float %198, %199
  %sub212 = fsub contract float %mul210, %mul211
  store float %sub212, float* %rcn4CaN, align 4
  %200 = load float, float* %Pb2, align 4
  %sub213 = fsub contract float 1.000000e+00, %200
  %201 = load float, float* %Pb, align 4
  %sub214 = fsub contract float %sub213, %201
  %202 = load float, float* %Pt, align 4
  %sub215 = fsub contract float %sub214, %202
  %203 = load float, float* %Pt2, align 4
  %sub216 = fsub contract float %sub215, %203
  %204 = load float, float* %Pa, align 4
  %sub217 = fsub contract float %sub216, %204
  store float %sub217, float* %Pix, align 4
  %205 = load float, float* %kib2, align 4
  %206 = load float, float* %Ca2CaM, align 4
  %mul218 = fmul contract float %205, %206
  %207 = load float, float* %Pix, align 4
  %mul219 = fmul contract float %mul218, %207
  %208 = load float, float* %kb2i, align 4
  %209 = load float, float* %Pb2, align 4
  %mul220 = fmul contract float %208, %209
  %sub221 = fsub contract float %mul219, %mul220
  store float %sub221, float* %rcnCKib2, align 4
  %210 = load float, float* %kb24, align 4
  %211 = load float, float* %Ca.addr, align 4
  %call222 = call fastcc float @_ZL3powfi(float %211, i32 2) #4
  %mul223 = fmul contract float %210, %call222
  %212 = load float, float* %Pb2, align 4
  %mul224 = fmul contract float %mul223, %212
  %213 = load float, float* %kb42, align 4
  %214 = load float, float* %Pb, align 4
  %mul225 = fmul contract float %213, %214
  %sub226 = fsub contract float %mul224, %mul225
  store float %sub226, float* %rcnCKb2b, align 4
  %215 = load float, float* %kib, align 4
  %216 = load float, float* %Ca4CaM, align 4
  %mul227 = fmul contract float %215, %216
  %217 = load float, float* %Pix, align 4
  %mul228 = fmul contract float %mul227, %217
  %218 = load float, float* %kbi, align 4
  %219 = load float, float* %Pb, align 4
  %mul229 = fmul contract float %218, %219
  %sub230 = fsub contract float %mul228, %mul229
  store float %sub230, float* %rcnCKib, align 4
  %220 = load float, float* %Pb, align 4
  %221 = load float, float* %Pt, align 4
  %add231 = fadd contract float %220, %221
  %222 = load float, float* %Pt2, align 4
  %add232 = fadd contract float %add231, %222
  %223 = load float, float* %Pa, align 4
  %add233 = fadd contract float %add232, %223
  store float %add233, float* %T, align 4
  %224 = load float, float* %T, align 4
  %conv234 = fpext float %224 to double
  %mul235 = fmul contract double 5.500000e-02, %conv234
  %225 = load float, float* %T, align 4
  %call236 = call fastcc float @_ZL3powfi(float %225, i32 2) #4
  %conv237 = fpext float %call236 to double
  %mul238 = fmul contract double 7.400000e-03, %conv237
  %add239 = fadd contract double %mul235, %mul238
  %226 = load float, float* %T, align 4
  %call240 = call fastcc float @_ZL3powfi(float %226, i32 3) #4
  %conv241 = fpext float %call240 to double
  %mul242 = fmul contract double 1.500000e-02, %conv241
  %add243 = fadd contract double %add239, %mul242
  %conv244 = fptrunc double %add243 to float
  store float %conv244, float* %kbt, align 4
  %227 = load float, float* %kbt, align 4
  %228 = load float, float* %Pb, align 4
  %mul245 = fmul contract float %227, %228
  %229 = load float, float* %kpp1, align 4
  %230 = load float, float* %PP1tot, align 4
  %mul246 = fmul contract float %229, %230
  %231 = load float, float* %Pt, align 4
  %mul247 = fmul contract float %mul246, %231
  %232 = load float, float* %Kmpp1, align 4
  %233 = load float, float* %CaMKIItot, align 4
  %234 = load float, float* %Pt, align 4
  %mul248 = fmul contract float %233, %234
  %add249 = fadd contract float %232, %mul248
  %div250 = fdiv float %mul247, %add249
  %sub251 = fsub contract float %mul245, %div250
  store float %sub251, float* %rcnCKbt, align 4
  %235 = load float, float* %kt42, align 4
  %236 = load float, float* %Pt, align 4
  %mul252 = fmul contract float %235, %236
  %237 = load float, float* %kt24, align 4
  %238 = load float, float* %Ca.addr, align 4
  %call253 = call fastcc float @_ZL3powfi(float %238, i32 2) #4
  %mul254 = fmul contract float %237, %call253
  %239 = load float, float* %Pt2, align 4
  %mul255 = fmul contract float %mul254, %239
  %sub256 = fsub contract float %mul252, %mul255
  store float %sub256, float* %rcnCKtt2, align 4
  %240 = load float, float* %kta, align 4
  %241 = load float, float* %Pt, align 4
  %mul257 = fmul contract float %240, %241
  %242 = load float, float* %kat, align 4
  %243 = load float, float* %Ca4CaM, align 4
  %mul258 = fmul contract float %242, %243
  %244 = load float, float* %Pa, align 4
  %mul259 = fmul contract float %mul258, %244
  %sub260 = fsub contract float %mul257, %mul259
  store float %sub260, float* %rcnCKta, align 4
  %245 = load float, float* %kt2a, align 4
  %246 = load float, float* %Pt2, align 4
  %mul261 = fmul contract float %245, %246
  %247 = load float, float* %kat2, align 4
  %248 = load float, float* %Ca2CaM, align 4
  %mul262 = fmul contract float %247, %248
  %249 = load float, float* %Pa, align 4
  %mul263 = fmul contract float %mul262, %249
  %sub264 = fsub contract float %mul261, %mul263
  store float %sub264, float* %rcnCKt2a, align 4
  %250 = load float, float* %kpp1, align 4
  %251 = load float, float* %PP1tot, align 4
  %mul265 = fmul contract float %250, %251
  %252 = load float, float* %Pt2, align 4
  %mul266 = fmul contract float %mul265, %252
  %253 = load float, float* %Kmpp1, align 4
  %254 = load float, float* %CaMKIItot, align 4
  %255 = load float, float* %Pt2, align 4
  %mul267 = fmul contract float %254, %255
  %add268 = fadd contract float %253, %mul267
  %div269 = fdiv float %mul266, %add268
  store float %div269, float* %rcnCKt2b2, align 4
  %256 = load float, float* %kpp1, align 4
  %257 = load float, float* %PP1tot, align 4
  %mul270 = fmul contract float %256, %257
  %258 = load float, float* %Pa, align 4
  %mul271 = fmul contract float %mul270, %258
  %259 = load float, float* %Kmpp1, align 4
  %260 = load float, float* %CaMKIItot, align 4
  %261 = load float, float* %Pa, align 4
  %mul272 = fmul contract float %260, %261
  %add273 = fadd contract float %259, %mul272
  %div274 = fdiv float %mul271, %add273
  store float %div274, float* %rcnCKai, align 4
  %262 = load float, float* %rcn02, align 4
  %fneg = fneg float %262
  %263 = load float, float* %rcn0B, align 4
  %sub275 = fsub contract float %fneg, %263
  %264 = load float, float* %rcn0CaN, align 4
  %sub276 = fsub contract float %sub275, %264
  %conv277 = fpext float %sub276 to double
  %mul278 = fmul contract double 1.000000e-03, %conv277
  %conv279 = fptrunc double %mul278 to float
  store float %conv279, float* %dCaM, align 4
  %265 = load float, float* %rcn02, align 4
  %266 = load float, float* %rcn24, align 4
  %sub280 = fsub contract float %265, %266
  %267 = load float, float* %rcn2B, align 4
  %sub281 = fsub contract float %sub280, %267
  %268 = load float, float* %rcn2CaN, align 4
  %sub282 = fsub contract float %sub281, %268
  %269 = load float, float* %CaMKIItot, align 4
  %270 = load float, float* %rcnCKib2, align 4
  %fneg283 = fneg float %270
  %271 = load float, float* %rcnCKt2a, align 4
  %add284 = fadd contract float %fneg283, %271
  %mul285 = fmul contract float %269, %add284
  %add286 = fadd contract float %sub282, %mul285
  %conv287 = fpext float %add286 to double
  %mul288 = fmul contract double 1.000000e-03, %conv287
  %conv289 = fptrunc double %mul288 to float
  store float %conv289, float* %dCa2CaM, align 4
  %272 = load float, float* %rcn24, align 4
  %273 = load float, float* %rcn4B, align 4
  %sub290 = fsub contract float %272, %273
  %274 = load float, float* %rcn4CaN, align 4
  %sub291 = fsub contract float %sub290, %274
  %275 = load float, float* %CaMKIItot, align 4
  %276 = load float, float* %rcnCKib, align 4
  %fneg292 = fneg float %276
  %277 = load float, float* %rcnCKta, align 4
  %add293 = fadd contract float %fneg292, %277
  %mul294 = fmul contract float %275, %add293
  %add295 = fadd contract float %sub291, %mul294
  %conv296 = fpext float %add295 to double
  %mul297 = fmul contract double 1.000000e-03, %conv296
  %conv298 = fptrunc double %mul297 to float
  store float %conv298, float* %dCa4CaM, align 4
  %278 = load float, float* %rcn0B, align 4
  %279 = load float, float* %rcn02B, align 4
  %sub299 = fsub contract float %278, %279
  %conv300 = fpext float %sub299 to double
  %mul301 = fmul contract double 1.000000e-03, %conv300
  %conv302 = fptrunc double %mul301 to float
  store float %conv302, float* %dCaMB, align 4
  %280 = load float, float* %rcn02B, align 4
  %281 = load float, float* %rcn2B, align 4
  %add303 = fadd contract float %280, %281
  %282 = load float, float* %rcn24B, align 4
  %sub304 = fsub contract float %add303, %282
  %conv305 = fpext float %sub304 to double
  %mul306 = fmul contract double 1.000000e-03, %conv305
  %conv307 = fptrunc double %mul306 to float
  store float %conv307, float* %dCa2CaMB, align 4
  %283 = load float, float* %rcn24B, align 4
  %284 = load float, float* %rcn4B, align 4
  %add308 = fadd contract float %283, %284
  %conv309 = fpext float %add308 to double
  %mul310 = fmul contract double 1.000000e-03, %conv309
  %conv311 = fptrunc double %mul310 to float
  store float %conv311, float* %dCa4CaMB, align 4
  %285 = load float, float* %rcnCKib2, align 4
  %286 = load float, float* %rcnCKb2b, align 4
  %sub312 = fsub contract float %285, %286
  %287 = load float, float* %rcnCKt2b2, align 4
  %add313 = fadd contract float %sub312, %287
  %conv314 = fpext float %add313 to double
  %mul315 = fmul contract double 1.000000e-03, %conv314
  %conv316 = fptrunc double %mul315 to float
  store float %conv316, float* %dPb2, align 4
  %288 = load float, float* %rcnCKib, align 4
  %289 = load float, float* %rcnCKb2b, align 4
  %add317 = fadd contract float %288, %289
  %290 = load float, float* %rcnCKbt, align 4
  %sub318 = fsub contract float %add317, %290
  %conv319 = fpext float %sub318 to double
  %mul320 = fmul contract double 1.000000e-03, %conv319
  %conv321 = fptrunc double %mul320 to float
  store float %conv321, float* %dPb, align 4
  %291 = load float, float* %rcnCKbt, align 4
  %292 = load float, float* %rcnCKta, align 4
  %sub322 = fsub contract float %291, %292
  %293 = load float, float* %rcnCKtt2, align 4
  %sub323 = fsub contract float %sub322, %293
  %conv324 = fpext float %sub323 to double
  %mul325 = fmul contract double 1.000000e-03, %conv324
  %conv326 = fptrunc double %mul325 to float
  store float %conv326, float* %dPt, align 4
  %294 = load float, float* %rcnCKtt2, align 4
  %295 = load float, float* %rcnCKt2a, align 4
  %sub327 = fsub contract float %294, %295
  %296 = load float, float* %rcnCKt2b2, align 4
  %sub328 = fsub contract float %sub327, %296
  %conv329 = fpext float %sub328 to double
  %mul330 = fmul contract double 1.000000e-03, %conv329
  %conv331 = fptrunc double %mul330 to float
  store float %conv331, float* %dPt2, align 4
  %297 = load float, float* %rcnCKta, align 4
  %298 = load float, float* %rcnCKt2a, align 4
  %add332 = fadd contract float %297, %298
  %299 = load float, float* %rcnCKai, align 4
  %sub333 = fsub contract float %add332, %299
  %conv334 = fpext float %sub333 to double
  %mul335 = fmul contract double 1.000000e-03, %conv334
  %conv336 = fptrunc double %mul335 to float
  store float %conv336, float* %dPa, align 4
  %300 = load float, float* %rcnCa4CaN, align 4
  %301 = load float, float* %rcn0CaN, align 4
  %sub337 = fsub contract float %300, %301
  %302 = load float, float* %rcn2CaN, align 4
  %sub338 = fsub contract float %sub337, %302
  %303 = load float, float* %rcn4CaN, align 4
  %sub339 = fsub contract float %sub338, %303
  %conv340 = fpext float %sub339 to double
  %mul341 = fmul contract double 1.000000e-03, %conv340
  %conv342 = fptrunc double %mul341 to float
  store float %conv342, float* %dCa4CaN, align 4
  %304 = load float, float* %rcn0CaN, align 4
  %305 = load float, float* %rcn02CaN, align 4
  %sub343 = fsub contract float %304, %305
  %conv344 = fpext float %sub343 to double
  %mul345 = fmul contract double 1.000000e-03, %conv344
  %conv346 = fptrunc double %mul345 to float
  store float %conv346, float* %dCaMCa4CaN, align 4
  %306 = load float, float* %rcn2CaN, align 4
  %307 = load float, float* %rcn02CaN, align 4
  %add347 = fadd contract float %306, %307
  %308 = load float, float* %rcn24CaN, align 4
  %sub348 = fsub contract float %add347, %308
  %conv349 = fpext float %sub348 to double
  %mul350 = fmul contract double 1.000000e-03, %conv349
  %conv351 = fptrunc double %mul350 to float
  store float %conv351, float* %dCa2CaMCa4CaN, align 4
  %309 = load float, float* %rcn4CaN, align 4
  %310 = load float, float* %rcn24CaN, align 4
  %add352 = fadd contract float %309, %310
  %conv353 = fpext float %add352 to double
  %mul354 = fmul contract double 1.000000e-03, %conv353
  %conv355 = fptrunc double %mul354 to float
  store float %conv355, float* %dCa4CaMCa4CaN, align 4
  %311 = load float, float* %dCaM, align 4
  %312 = load float*, float** %d_finavalu.addr, align 8
  %313 = load i32, i32* %offset_1, align 4
  %idxprom356 = sext i32 %313 to i64
  %arrayidx357 = getelementptr inbounds float, float* %312, i64 %idxprom356
  store float %311, float* %arrayidx357, align 4
  %314 = load float, float* %dCa2CaM, align 4
  %315 = load float*, float** %d_finavalu.addr, align 8
  %316 = load i32, i32* %offset_2, align 4
  %idxprom358 = sext i32 %316 to i64
  %arrayidx359 = getelementptr inbounds float, float* %315, i64 %idxprom358
  store float %314, float* %arrayidx359, align 4
  %317 = load float, float* %dCa4CaM, align 4
  %318 = load float*, float** %d_finavalu.addr, align 8
  %319 = load i32, i32* %offset_3, align 4
  %idxprom360 = sext i32 %319 to i64
  %arrayidx361 = getelementptr inbounds float, float* %318, i64 %idxprom360
  store float %317, float* %arrayidx361, align 4
  %320 = load float, float* %dCaMB, align 4
  %321 = load float*, float** %d_finavalu.addr, align 8
  %322 = load i32, i32* %offset_4, align 4
  %idxprom362 = sext i32 %322 to i64
  %arrayidx363 = getelementptr inbounds float, float* %321, i64 %idxprom362
  store float %320, float* %arrayidx363, align 4
  %323 = load float, float* %dCa2CaMB, align 4
  %324 = load float*, float** %d_finavalu.addr, align 8
  %325 = load i32, i32* %offset_5, align 4
  %idxprom364 = sext i32 %325 to i64
  %arrayidx365 = getelementptr inbounds float, float* %324, i64 %idxprom364
  store float %323, float* %arrayidx365, align 4
  %326 = load float, float* %dCa4CaMB, align 4
  %327 = load float*, float** %d_finavalu.addr, align 8
  %328 = load i32, i32* %offset_6, align 4
  %idxprom366 = sext i32 %328 to i64
  %arrayidx367 = getelementptr inbounds float, float* %327, i64 %idxprom366
  store float %326, float* %arrayidx367, align 4
  %329 = load float, float* %dPb2, align 4
  %330 = load float*, float** %d_finavalu.addr, align 8
  %331 = load i32, i32* %offset_7, align 4
  %idxprom368 = sext i32 %331 to i64
  %arrayidx369 = getelementptr inbounds float, float* %330, i64 %idxprom368
  store float %329, float* %arrayidx369, align 4
  %332 = load float, float* %dPb, align 4
  %333 = load float*, float** %d_finavalu.addr, align 8
  %334 = load i32, i32* %offset_8, align 4
  %idxprom370 = sext i32 %334 to i64
  %arrayidx371 = getelementptr inbounds float, float* %333, i64 %idxprom370
  store float %332, float* %arrayidx371, align 4
  %335 = load float, float* %dPt, align 4
  %336 = load float*, float** %d_finavalu.addr, align 8
  %337 = load i32, i32* %offset_9, align 4
  %idxprom372 = sext i32 %337 to i64
  %arrayidx373 = getelementptr inbounds float, float* %336, i64 %idxprom372
  store float %335, float* %arrayidx373, align 4
  %338 = load float, float* %dPt2, align 4
  %339 = load float*, float** %d_finavalu.addr, align 8
  %340 = load i32, i32* %offset_10, align 4
  %idxprom374 = sext i32 %340 to i64
  %arrayidx375 = getelementptr inbounds float, float* %339, i64 %idxprom374
  store float %338, float* %arrayidx375, align 4
  %341 = load float, float* %dPa, align 4
  %342 = load float*, float** %d_finavalu.addr, align 8
  %343 = load i32, i32* %offset_11, align 4
  %idxprom376 = sext i32 %343 to i64
  %arrayidx377 = getelementptr inbounds float, float* %342, i64 %idxprom376
  store float %341, float* %arrayidx377, align 4
  %344 = load float, float* %dCa4CaN, align 4
  %345 = load float*, float** %d_finavalu.addr, align 8
  %346 = load i32, i32* %offset_12, align 4
  %idxprom378 = sext i32 %346 to i64
  %arrayidx379 = getelementptr inbounds float, float* %345, i64 %idxprom378
  store float %344, float* %arrayidx379, align 4
  %347 = load float, float* %dCaMCa4CaN, align 4
  %348 = load float*, float** %d_finavalu.addr, align 8
  %349 = load i32, i32* %offset_13, align 4
  %idxprom380 = sext i32 %349 to i64
  %arrayidx381 = getelementptr inbounds float, float* %348, i64 %idxprom380
  store float %347, float* %arrayidx381, align 4
  %350 = load float, float* %dCa2CaMCa4CaN, align 4
  %351 = load float*, float** %d_finavalu.addr, align 8
  %352 = load i32, i32* %offset_14, align 4
  %idxprom382 = sext i32 %352 to i64
  %arrayidx383 = getelementptr inbounds float, float* %351, i64 %idxprom382
  store float %350, float* %arrayidx383, align 4
  %353 = load float, float* %dCa4CaMCa4CaN, align 4
  %354 = load float*, float** %d_finavalu.addr, align 8
  %355 = load i32, i32* %offset_15, align 4
  %idxprom384 = sext i32 %355 to i64
  %arrayidx385 = getelementptr inbounds float, float* %354, i64 %idxprom384
  store float %353, float* %arrayidx385, align 4
  %356 = load float, float* %CaMKIItot, align 4
  %mul386 = fmul contract float 2.000000e+00, %356
  %357 = load float, float* %rcnCKtt2, align 4
  %358 = load float, float* %rcnCKb2b, align 4
  %sub387 = fsub contract float %357, %358
  %mul388 = fmul contract float %mul386, %sub387
  %359 = load float, float* %rcn02, align 4
  %360 = load float, float* %rcn24, align 4
  %add389 = fadd contract float %359, %360
  %361 = load float, float* %rcn02B, align 4
  %add390 = fadd contract float %add389, %361
  %362 = load float, float* %rcn24B, align 4
  %add391 = fadd contract float %add390, %362
  %363 = load float, float* %rcnCa4CaN, align 4
  %add392 = fadd contract float %add391, %363
  %364 = load float, float* %rcn02CaN, align 4
  %add393 = fadd contract float %add392, %364
  %365 = load float, float* %rcn24CaN, align 4
  %add394 = fadd contract float %add393, %365
  %mul395 = fmul contract float 2.000000e+00, %add394
  %sub396 = fsub contract float %mul388, %mul395
  %conv397 = fpext float %sub396 to double
  %mul398 = fmul contract double 1.000000e-03, %conv397
  %conv399 = fptrunc double %mul398 to float
  %366 = load float*, float** %d_finavalu.addr, align 8
  %367 = load i32, i32* %com_offset.addr, align 4
  %idxprom400 = sext i32 %367 to i64
  %arrayidx401 = getelementptr inbounds float, float* %366, i64 %idxprom400
  store float %conv399, float* %arrayidx401, align 4
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z6kerneliPfS_S_S_(i32 %timeinst, float* noalias %d_initvalu, float* noalias %d_finavalu, float* noalias %d_params, float* noalias %d_com) local_unnamed_addr #0 {
entry:
  %local_intra_warp_idx = alloca i32
  %local_inter_warp_idx = alloca i32
  store i32 0, i32* %local_inter_warp_idx
  %0 = load i32, i32* @block_size
  %CaCyt_intra_warp_ = alloca float, i32 %0
  %1 = load i32, i32* @block_size
  %CaSL_intra_warp_ = alloca float, i32 %1
  %2 = load i32, i32* @block_size
  %CaDyad_intra_warp_ = alloca float, i32 %2
  %3 = load i32, i32* @block_size
  %com_offset_intra_warp_ = alloca i32, i32 %3
  %4 = load i32, i32* @block_size
  %params_offset_intra_warp_ = alloca i32, i32 %4
  %5 = load i32, i32* @block_size
  %valu_offset_intra_warp_ = alloca i32, i32 %5
  %6 = load i32, i32* @block_size
  %tx_intra_warp_ = alloca i32, i32 %6
  %7 = load i32, i32* @block_size
  %bx_intra_warp_ = alloca i32, i32 %7
  %8 = load i32, i32* @block_size
  %d_com.addr_intra_warp_ = alloca float*, i32 %8
  %9 = load i32, i32* @block_size
  %d_params.addr_intra_warp_ = alloca float*, i32 %9
  %10 = load i32, i32* @block_size
  %d_finavalu.addr_intra_warp_ = alloca float*, i32 %10
  %11 = load i32, i32* @block_size
  %d_initvalu.addr_intra_warp_ = alloca float*, i32 %11
  %12 = load i32, i32* @block_size
  %timeinst.addr_intra_warp_ = alloca i32, i32 %12
  %timeinst.addr = alloca i32, align 4
  br label %entry_after_block_sync_1

entry_after_block_sync_1:                         ; preds = %entry
  %d_initvalu.addr = alloca float*, align 8
  %d_finavalu.addr = alloca float*, align 8
  %d_params.addr = alloca float*, align 8
  %d_com.addr = alloca float*, align 8
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %valu_offset = alloca i32, align 4
  %params_offset = alloca i32, align 4
  %com_offset = alloca i32, align 4
  %CaDyad = alloca float, align 4
  %CaSL = alloca float, align 4
  %CaCyt = alloca float, align 4
  br label %entry_after_block_sync_1_after_block_sync_4

entry_after_block_sync_1_after_block_sync_4:      ; preds = %entry_after_block_sync_1
  br label %intra_warp_init

intra_warp_init:                                  ; preds = %entry_after_block_sync_1_after_block_sync_4
  store i32 0, i32* %local_intra_warp_idx
  br label %intra_warp_cond

intra_warp_inc:                                   ; preds = %if.end23
  %13 = load i32, i32* %local_intra_warp_idx
  %intra_warp_index_increment = add i32 %13, 1
  store i32 %intra_warp_index_increment, i32* %local_intra_warp_idx
  br label %intra_warp_cond

intra_warp_cond:                                  ; preds = %intra_warp_inc, %intra_warp_init
  %14 = load i32, i32* @block_size
  %15 = load i32, i32* %local_intra_warp_idx
  %16 = icmp ult i32 %15, %14
  br i1 %16, label %entry_after_block_sync_1_after_block_sync_2, label %reset_block, !llvm.loop !11

entry_after_block_sync_1_after_block_sync_2:      ; preds = %intra_warp_cond
  %17 = load i32, i32* %local_inter_warp_idx
  %18 = load i32, i32* %local_intra_warp_idx
  %19 = mul i32 %17, 32
  %thread_idx4 = add i32 %18, %19
  %20 = getelementptr i32, i32* %timeinst.addr_intra_warp_, i32 %thread_idx4
  store i32 %timeinst, i32* %20, align 4, !llvm.mem.parallel_loop_access !14
  %21 = load i32, i32* %local_inter_warp_idx
  %22 = load i32, i32* %local_intra_warp_idx
  %23 = mul i32 %21, 32
  %thread_idx12 = add i32 %22, %23
  %24 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx12
  store float* %d_initvalu, float** %24, align 8, !llvm.mem.parallel_loop_access !14
  %25 = load i32, i32* %local_inter_warp_idx
  %26 = load i32, i32* %local_intra_warp_idx
  %27 = mul i32 %25, 32
  %thread_idx17 = add i32 %26, %27
  %28 = getelementptr float*, float** %d_finavalu.addr_intra_warp_, i32 %thread_idx17
  store float* %d_finavalu, float** %28, align 8, !llvm.mem.parallel_loop_access !14
  %29 = load i32, i32* %local_inter_warp_idx
  %30 = load i32, i32* %local_intra_warp_idx
  %31 = mul i32 %29, 32
  %thread_idx22 = add i32 %30, %31
  %32 = getelementptr float*, float** %d_params.addr_intra_warp_, i32 %thread_idx22
  store float* %d_params, float** %32, align 8, !llvm.mem.parallel_loop_access !14
  %33 = load i32, i32* %local_inter_warp_idx
  %34 = load i32, i32* %local_intra_warp_idx
  %35 = mul i32 %33, 32
  %thread_idx26 = add i32 %34, %35
  %36 = getelementptr float*, float** %d_com.addr_intra_warp_, i32 %thread_idx26
  store float* %d_com, float** %36, align 8, !llvm.mem.parallel_loop_access !14
  %37 = load i32, i32* @block_index_x
  %38 = load i32, i32* %local_inter_warp_idx
  %39 = load i32, i32* %local_intra_warp_idx
  %40 = mul i32 %38, 32
  %thread_idx29 = add i32 %39, %40
  %41 = getelementptr i32, i32* %bx_intra_warp_, i32 %thread_idx29
  store i32 %37, i32* %41, align 4, !llvm.mem.parallel_loop_access !14
  %42 = load i32, i32* %local_inter_warp_idx
  %43 = mul i32 %42, 32
  %44 = load i32, i32* %local_intra_warp_idx
  %thread_idx59 = add i32 %44, %43
  %45 = load i32, i32* @block_size_x
  %thread_id_x = srem i32 %thread_idx59, %45
  %46 = load i32, i32* %local_inter_warp_idx
  %47 = load i32, i32* %local_intra_warp_idx
  %48 = mul i32 %46, 32
  %thread_idx32 = add i32 %47, %48
  %49 = getelementptr i32, i32* %tx_intra_warp_, i32 %thread_idx32
  store i32 %thread_id_x, i32* %49, align 4, !llvm.mem.parallel_loop_access !14
  %50 = load i32, i32* %local_inter_warp_idx
  %51 = load i32, i32* %local_intra_warp_idx
  %52 = mul i32 %50, 32
  %thread_idx28 = add i32 %51, %52
  %53 = getelementptr i32, i32* %bx_intra_warp_, i32 %thread_idx28
  %54 = load i32, i32* %53, align 4, !llvm.mem.parallel_loop_access !14
  %cmp = icmp eq i32 %54, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry_after_block_sync_1_after_block_sync_2
  %55 = load i32, i32* %local_inter_warp_idx
  %56 = load i32, i32* %local_intra_warp_idx
  %57 = mul i32 %55, 32
  %thread_idx31 = add i32 %56, %57
  %58 = getelementptr i32, i32* %tx_intra_warp_, i32 %thread_idx31
  %59 = load i32, i32* %58, align 4, !llvm.mem.parallel_loop_access !14
  %cmp2 = icmp eq i32 %59, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %60 = load i32, i32* %local_inter_warp_idx
  %61 = load i32, i32* %local_intra_warp_idx
  %62 = mul i32 %60, 32
  %thread_idx40 = add i32 %61, %62
  %63 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx40
  store i32 0, i32* %63, align 4, !llvm.mem.parallel_loop_access !14
  %64 = load i32, i32* %local_inter_warp_idx
  %65 = load i32, i32* %local_intra_warp_idx
  %66 = mul i32 %64, 32
  %thread_idx3 = add i32 %65, %66
  %67 = getelementptr i32, i32* %timeinst.addr_intra_warp_, i32 %thread_idx3
  %68 = load i32, i32* %67, align 4, !llvm.mem.parallel_loop_access !14
  %conv = sitofp i32 %68 to float
  %69 = load i32, i32* %local_inter_warp_idx
  %70 = load i32, i32* %local_intra_warp_idx
  %71 = mul i32 %69, 32
  %thread_idx11 = add i32 %70, %71
  %72 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx11
  %73 = load float*, float** %72, align 8, !llvm.mem.parallel_loop_access !14
  %74 = load i32, i32* %local_inter_warp_idx
  %75 = load i32, i32* %local_intra_warp_idx
  %76 = mul i32 %74, 32
  %thread_idx16 = add i32 %75, %76
  %77 = getelementptr float*, float** %d_finavalu.addr_intra_warp_, i32 %thread_idx16
  %78 = load float*, float** %77, align 8, !llvm.mem.parallel_loop_access !14
  %79 = load i32, i32* %local_inter_warp_idx
  %80 = load i32, i32* %local_intra_warp_idx
  %81 = mul i32 %79, 32
  %thread_idx39 = add i32 %80, %81
  %82 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx39
  %83 = load i32, i32* %82, align 4, !llvm.mem.parallel_loop_access !14
  %84 = load i32, i32* %local_inter_warp_idx
  %85 = load i32, i32* %local_intra_warp_idx
  %86 = mul i32 %84, 32
  %thread_idx21 = add i32 %85, %86
  %87 = getelementptr float*, float** %d_params.addr_intra_warp_, i32 %thread_idx21
  %88 = load float*, float** %87, align 8, !llvm.mem.parallel_loop_access !14
  call void @_Z10kernel_eccfPfS_iS_(float %conv, float* %73, float* %78, i32 %83, float* %88) #4, !llvm.mem.parallel_loop_access !14
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end23

if.else:                                          ; preds = %entry_after_block_sync_1_after_block_sync_2
  %89 = load i32, i32* %local_inter_warp_idx
  %90 = load i32, i32* %local_intra_warp_idx
  %91 = mul i32 %89, 32
  %thread_idx27 = add i32 %90, %91
  %92 = getelementptr i32, i32* %bx_intra_warp_, i32 %thread_idx27
  %93 = load i32, i32* %92, align 4, !llvm.mem.parallel_loop_access !14
  %cmp4 = icmp eq i32 %93, 1
  br i1 %cmp4, label %if.then5, label %if.end22

if.then5:                                         ; preds = %if.else
  %94 = load i32, i32* %local_inter_warp_idx
  %95 = load i32, i32* %local_intra_warp_idx
  %96 = mul i32 %94, 32
  %thread_idx30 = add i32 %95, %96
  %97 = getelementptr i32, i32* %tx_intra_warp_, i32 %thread_idx30
  %98 = load i32, i32* %97, align 4, !llvm.mem.parallel_loop_access !14
  %cmp6 = icmp eq i32 %98, 0
  br i1 %cmp6, label %if.then7, label %if.end21

if.then7:                                         ; preds = %if.then5
  %99 = load i32, i32* %local_inter_warp_idx
  %100 = load i32, i32* %local_intra_warp_idx
  %101 = mul i32 %99, 32
  %thread_idx38 = add i32 %100, %101
  %102 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx38
  store i32 46, i32* %102, align 4, !llvm.mem.parallel_loop_access !14
  %103 = load i32, i32* %local_inter_warp_idx
  %104 = load i32, i32* %local_intra_warp_idx
  %105 = mul i32 %103, 32
  %thread_idx46 = add i32 %104, %105
  %106 = getelementptr i32, i32* %params_offset_intra_warp_, i32 %thread_idx46
  store i32 0, i32* %106, align 4, !llvm.mem.parallel_loop_access !14
  %107 = load i32, i32* %local_inter_warp_idx
  %108 = load i32, i32* %local_intra_warp_idx
  %109 = mul i32 %107, 32
  %thread_idx52 = add i32 %108, %109
  %110 = getelementptr i32, i32* %com_offset_intra_warp_, i32 %thread_idx52
  store i32 0, i32* %110, align 4, !llvm.mem.parallel_loop_access !14
  %111 = load i32, i32* %local_inter_warp_idx
  %112 = load i32, i32* %local_intra_warp_idx
  %113 = mul i32 %111, 32
  %thread_idx10 = add i32 %112, %113
  %114 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx10
  %115 = load float*, float** %114, align 8, !llvm.mem.parallel_loop_access !14
  %arrayidx = getelementptr inbounds float, float* %115, i64 35
  %116 = load float, float* %arrayidx, align 4, !llvm.mem.parallel_loop_access !14
  %conv8 = fpext float %116 to double
  %mul = fmul contract double %conv8, 1.000000e+03
  %conv9 = fptrunc double %mul to float
  %117 = load i32, i32* %local_inter_warp_idx
  %118 = load i32, i32* %local_intra_warp_idx
  %119 = mul i32 %117, 32
  %thread_idx54 = add i32 %118, %119
  %120 = getelementptr float, float* %CaDyad_intra_warp_, i32 %thread_idx54
  store float %conv9, float* %120, align 4, !llvm.mem.parallel_loop_access !14
  %121 = load i32, i32* %local_inter_warp_idx
  %122 = load i32, i32* %local_intra_warp_idx
  %123 = mul i32 %121, 32
  %thread_idx2 = add i32 %122, %123
  %124 = getelementptr i32, i32* %timeinst.addr_intra_warp_, i32 %thread_idx2
  %125 = load i32, i32* %124, align 4, !llvm.mem.parallel_loop_access !14
  %conv10 = sitofp i32 %125 to float
  %126 = load i32, i32* %local_inter_warp_idx
  %127 = load i32, i32* %local_intra_warp_idx
  %128 = mul i32 %126, 32
  %thread_idx9 = add i32 %127, %128
  %129 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx9
  %130 = load float*, float** %129, align 8, !llvm.mem.parallel_loop_access !14
  %131 = load i32, i32* %local_inter_warp_idx
  %132 = load i32, i32* %local_intra_warp_idx
  %133 = mul i32 %131, 32
  %thread_idx15 = add i32 %132, %133
  %134 = getelementptr float*, float** %d_finavalu.addr_intra_warp_, i32 %thread_idx15
  %135 = load float*, float** %134, align 8, !llvm.mem.parallel_loop_access !14
  %136 = load i32, i32* %local_inter_warp_idx
  %137 = load i32, i32* %local_intra_warp_idx
  %138 = mul i32 %136, 32
  %thread_idx37 = add i32 %137, %138
  %139 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx37
  %140 = load i32, i32* %139, align 4, !llvm.mem.parallel_loop_access !14
  %141 = load i32, i32* %local_inter_warp_idx
  %142 = load i32, i32* %local_intra_warp_idx
  %143 = mul i32 %141, 32
  %thread_idx20 = add i32 %142, %143
  %144 = getelementptr float*, float** %d_params.addr_intra_warp_, i32 %thread_idx20
  %145 = load float*, float** %144, align 8, !llvm.mem.parallel_loop_access !14
  %146 = load i32, i32* %local_inter_warp_idx
  %147 = load i32, i32* %local_intra_warp_idx
  %148 = mul i32 %146, 32
  %thread_idx45 = add i32 %147, %148
  %149 = getelementptr i32, i32* %params_offset_intra_warp_, i32 %thread_idx45
  %150 = load i32, i32* %149, align 4, !llvm.mem.parallel_loop_access !14
  %151 = load i32, i32* %local_inter_warp_idx
  %152 = load i32, i32* %local_intra_warp_idx
  %153 = mul i32 %151, 32
  %thread_idx25 = add i32 %152, %153
  %154 = getelementptr float*, float** %d_com.addr_intra_warp_, i32 %thread_idx25
  %155 = load float*, float** %154, align 8, !llvm.mem.parallel_loop_access !14
  %156 = load i32, i32* %local_inter_warp_idx
  %157 = load i32, i32* %local_intra_warp_idx
  %158 = mul i32 %156, 32
  %thread_idx51 = add i32 %157, %158
  %159 = getelementptr i32, i32* %com_offset_intra_warp_, i32 %thread_idx51
  %160 = load i32, i32* %159, align 4, !llvm.mem.parallel_loop_access !14
  %161 = load i32, i32* %local_inter_warp_idx
  %162 = load i32, i32* %local_intra_warp_idx
  %163 = mul i32 %161, 32
  %thread_idx53 = add i32 %162, %163
  %164 = getelementptr float, float* %CaDyad_intra_warp_, i32 %thread_idx53
  %165 = load float, float* %164, align 4, !llvm.mem.parallel_loop_access !14
  call void @_Z10kernel_camfPfS_iS_iS_if(float %conv10, float* %130, float* %135, i32 %140, float* %145, i32 %150, float* %155, i32 %160, float %165) #4, !llvm.mem.parallel_loop_access !14
  %166 = load i32, i32* %local_inter_warp_idx
  %167 = load i32, i32* %local_intra_warp_idx
  %168 = mul i32 %166, 32
  %thread_idx36 = add i32 %167, %168
  %169 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx36
  store i32 61, i32* %169, align 4, !llvm.mem.parallel_loop_access !14
  %170 = load i32, i32* %local_inter_warp_idx
  %171 = load i32, i32* %local_intra_warp_idx
  %172 = mul i32 %170, 32
  %thread_idx44 = add i32 %171, %172
  %173 = getelementptr i32, i32* %params_offset_intra_warp_, i32 %thread_idx44
  store i32 5, i32* %173, align 4, !llvm.mem.parallel_loop_access !14
  %174 = load i32, i32* %local_inter_warp_idx
  %175 = load i32, i32* %local_intra_warp_idx
  %176 = mul i32 %174, 32
  %thread_idx50 = add i32 %175, %176
  %177 = getelementptr i32, i32* %com_offset_intra_warp_, i32 %thread_idx50
  store i32 1, i32* %177, align 4, !llvm.mem.parallel_loop_access !14
  %178 = load i32, i32* %local_inter_warp_idx
  %179 = load i32, i32* %local_intra_warp_idx
  %180 = mul i32 %178, 32
  %thread_idx8 = add i32 %179, %180
  %181 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx8
  %182 = load float*, float** %181, align 8, !llvm.mem.parallel_loop_access !14
  %arrayidx11 = getelementptr inbounds float, float* %182, i64 36
  %183 = load float, float* %arrayidx11, align 4, !llvm.mem.parallel_loop_access !14
  %conv12 = fpext float %183 to double
  %mul13 = fmul contract double %conv12, 1.000000e+03
  %conv14 = fptrunc double %mul13 to float
  %184 = load i32, i32* %local_inter_warp_idx
  %185 = load i32, i32* %local_intra_warp_idx
  %186 = mul i32 %184, 32
  %thread_idx56 = add i32 %185, %186
  %187 = getelementptr float, float* %CaSL_intra_warp_, i32 %thread_idx56
  store float %conv14, float* %187, align 4, !llvm.mem.parallel_loop_access !14
  %188 = load i32, i32* %local_inter_warp_idx
  %189 = load i32, i32* %local_intra_warp_idx
  %190 = mul i32 %188, 32
  %thread_idx1 = add i32 %189, %190
  %191 = getelementptr i32, i32* %timeinst.addr_intra_warp_, i32 %thread_idx1
  %192 = load i32, i32* %191, align 4, !llvm.mem.parallel_loop_access !14
  %conv15 = sitofp i32 %192 to float
  %193 = load i32, i32* %local_inter_warp_idx
  %194 = load i32, i32* %local_intra_warp_idx
  %195 = mul i32 %193, 32
  %thread_idx7 = add i32 %194, %195
  %196 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx7
  %197 = load float*, float** %196, align 8, !llvm.mem.parallel_loop_access !14
  %198 = load i32, i32* %local_inter_warp_idx
  %199 = load i32, i32* %local_intra_warp_idx
  %200 = mul i32 %198, 32
  %thread_idx14 = add i32 %199, %200
  %201 = getelementptr float*, float** %d_finavalu.addr_intra_warp_, i32 %thread_idx14
  %202 = load float*, float** %201, align 8, !llvm.mem.parallel_loop_access !14
  %203 = load i32, i32* %local_inter_warp_idx
  %204 = load i32, i32* %local_intra_warp_idx
  %205 = mul i32 %203, 32
  %thread_idx35 = add i32 %204, %205
  %206 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx35
  %207 = load i32, i32* %206, align 4, !llvm.mem.parallel_loop_access !14
  %208 = load i32, i32* %local_inter_warp_idx
  %209 = load i32, i32* %local_intra_warp_idx
  %210 = mul i32 %208, 32
  %thread_idx19 = add i32 %209, %210
  %211 = getelementptr float*, float** %d_params.addr_intra_warp_, i32 %thread_idx19
  %212 = load float*, float** %211, align 8, !llvm.mem.parallel_loop_access !14
  %213 = load i32, i32* %local_inter_warp_idx
  %214 = load i32, i32* %local_intra_warp_idx
  %215 = mul i32 %213, 32
  %thread_idx43 = add i32 %214, %215
  %216 = getelementptr i32, i32* %params_offset_intra_warp_, i32 %thread_idx43
  %217 = load i32, i32* %216, align 4, !llvm.mem.parallel_loop_access !14
  %218 = load i32, i32* %local_inter_warp_idx
  %219 = load i32, i32* %local_intra_warp_idx
  %220 = mul i32 %218, 32
  %thread_idx24 = add i32 %219, %220
  %221 = getelementptr float*, float** %d_com.addr_intra_warp_, i32 %thread_idx24
  %222 = load float*, float** %221, align 8, !llvm.mem.parallel_loop_access !14
  %223 = load i32, i32* %local_inter_warp_idx
  %224 = load i32, i32* %local_intra_warp_idx
  %225 = mul i32 %223, 32
  %thread_idx49 = add i32 %224, %225
  %226 = getelementptr i32, i32* %com_offset_intra_warp_, i32 %thread_idx49
  %227 = load i32, i32* %226, align 4, !llvm.mem.parallel_loop_access !14
  %228 = load i32, i32* %local_inter_warp_idx
  %229 = load i32, i32* %local_intra_warp_idx
  %230 = mul i32 %228, 32
  %thread_idx55 = add i32 %229, %230
  %231 = getelementptr float, float* %CaSL_intra_warp_, i32 %thread_idx55
  %232 = load float, float* %231, align 4, !llvm.mem.parallel_loop_access !14
  call void @_Z10kernel_camfPfS_iS_iS_if(float %conv15, float* %197, float* %202, i32 %207, float* %212, i32 %217, float* %222, i32 %227, float %232) #4, !llvm.mem.parallel_loop_access !14
  %233 = load i32, i32* %local_inter_warp_idx
  %234 = load i32, i32* %local_intra_warp_idx
  %235 = mul i32 %233, 32
  %thread_idx34 = add i32 %234, %235
  %236 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx34
  store i32 76, i32* %236, align 4, !llvm.mem.parallel_loop_access !14
  %237 = load i32, i32* %local_inter_warp_idx
  %238 = load i32, i32* %local_intra_warp_idx
  %239 = mul i32 %237, 32
  %thread_idx42 = add i32 %238, %239
  %240 = getelementptr i32, i32* %params_offset_intra_warp_, i32 %thread_idx42
  store i32 10, i32* %240, align 4, !llvm.mem.parallel_loop_access !14
  %241 = load i32, i32* %local_inter_warp_idx
  %242 = load i32, i32* %local_intra_warp_idx
  %243 = mul i32 %241, 32
  %thread_idx48 = add i32 %242, %243
  %244 = getelementptr i32, i32* %com_offset_intra_warp_, i32 %thread_idx48
  store i32 2, i32* %244, align 4, !llvm.mem.parallel_loop_access !14
  %245 = load i32, i32* %local_inter_warp_idx
  %246 = load i32, i32* %local_intra_warp_idx
  %247 = mul i32 %245, 32
  %thread_idx6 = add i32 %246, %247
  %248 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx6
  %249 = load float*, float** %248, align 8, !llvm.mem.parallel_loop_access !14
  %arrayidx16 = getelementptr inbounds float, float* %249, i64 37
  %250 = load float, float* %arrayidx16, align 4, !llvm.mem.parallel_loop_access !14
  %conv17 = fpext float %250 to double
  %mul18 = fmul contract double %conv17, 1.000000e+03
  %conv19 = fptrunc double %mul18 to float
  %251 = load i32, i32* %local_inter_warp_idx
  %252 = load i32, i32* %local_intra_warp_idx
  %253 = mul i32 %251, 32
  %thread_idx58 = add i32 %252, %253
  %254 = getelementptr float, float* %CaCyt_intra_warp_, i32 %thread_idx58
  store float %conv19, float* %254, align 4, !llvm.mem.parallel_loop_access !14
  %255 = load i32, i32* %local_inter_warp_idx
  %256 = load i32, i32* %local_intra_warp_idx
  %257 = mul i32 %255, 32
  %thread_idx = add i32 %256, %257
  %258 = getelementptr i32, i32* %timeinst.addr_intra_warp_, i32 %thread_idx
  %259 = load i32, i32* %258, align 4, !llvm.mem.parallel_loop_access !14
  %conv20 = sitofp i32 %259 to float
  %260 = load i32, i32* %local_inter_warp_idx
  %261 = load i32, i32* %local_intra_warp_idx
  %262 = mul i32 %260, 32
  %thread_idx5 = add i32 %261, %262
  %263 = getelementptr float*, float** %d_initvalu.addr_intra_warp_, i32 %thread_idx5
  %264 = load float*, float** %263, align 8, !llvm.mem.parallel_loop_access !14
  %265 = load i32, i32* %local_inter_warp_idx
  %266 = load i32, i32* %local_intra_warp_idx
  %267 = mul i32 %265, 32
  %thread_idx13 = add i32 %266, %267
  %268 = getelementptr float*, float** %d_finavalu.addr_intra_warp_, i32 %thread_idx13
  %269 = load float*, float** %268, align 8, !llvm.mem.parallel_loop_access !14
  %270 = load i32, i32* %local_inter_warp_idx
  %271 = load i32, i32* %local_intra_warp_idx
  %272 = mul i32 %270, 32
  %thread_idx33 = add i32 %271, %272
  %273 = getelementptr i32, i32* %valu_offset_intra_warp_, i32 %thread_idx33
  %274 = load i32, i32* %273, align 4, !llvm.mem.parallel_loop_access !14
  %275 = load i32, i32* %local_inter_warp_idx
  %276 = load i32, i32* %local_intra_warp_idx
  %277 = mul i32 %275, 32
  %thread_idx18 = add i32 %276, %277
  %278 = getelementptr float*, float** %d_params.addr_intra_warp_, i32 %thread_idx18
  %279 = load float*, float** %278, align 8, !llvm.mem.parallel_loop_access !14
  %280 = load i32, i32* %local_inter_warp_idx
  %281 = load i32, i32* %local_intra_warp_idx
  %282 = mul i32 %280, 32
  %thread_idx41 = add i32 %281, %282
  %283 = getelementptr i32, i32* %params_offset_intra_warp_, i32 %thread_idx41
  %284 = load i32, i32* %283, align 4, !llvm.mem.parallel_loop_access !14
  %285 = load i32, i32* %local_inter_warp_idx
  %286 = load i32, i32* %local_intra_warp_idx
  %287 = mul i32 %285, 32
  %thread_idx23 = add i32 %286, %287
  %288 = getelementptr float*, float** %d_com.addr_intra_warp_, i32 %thread_idx23
  %289 = load float*, float** %288, align 8, !llvm.mem.parallel_loop_access !14
  %290 = load i32, i32* %local_inter_warp_idx
  %291 = load i32, i32* %local_intra_warp_idx
  %292 = mul i32 %290, 32
  %thread_idx47 = add i32 %291, %292
  %293 = getelementptr i32, i32* %com_offset_intra_warp_, i32 %thread_idx47
  %294 = load i32, i32* %293, align 4, !llvm.mem.parallel_loop_access !14
  %295 = load i32, i32* %local_inter_warp_idx
  %296 = load i32, i32* %local_intra_warp_idx
  %297 = mul i32 %295, 32
  %thread_idx57 = add i32 %296, %297
  %298 = getelementptr float, float* %CaCyt_intra_warp_, i32 %thread_idx57
  %299 = load float, float* %298, align 4, !llvm.mem.parallel_loop_access !14
  call void @_Z10kernel_camfPfS_iS_iS_if(float %conv20, float* %264, float* %269, i32 %274, float* %279, i32 %284, float* %289, i32 %294, float %299) #4, !llvm.mem.parallel_loop_access !14
  br label %if.end21

if.end21:                                         ; preds = %if.then7, %if.then5
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.else
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.end
  br label %intra_warp_inc

reset_block:                                      ; preds = %intra_warp_cond
  store i32 0, i32* %local_intra_warp_idx
  br label %if.end23_after_block_sync_0

if.end23_after_block_sync_0:                      ; preds = %reset_block
  br label %if.end23_after_block_sync_0_after_block_sync_3

if.end23_after_block_sync_0_after_block_sync_3:   ; preds = %if.end23_after_block_sync_0
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z12kernel_fin_2iPfS_iiiiS_S_(i32 %timeinst, float* noalias %d_initvalu, float* noalias %d_finavalu, i32 %offset_ecc, i32 %offset_Dyad, i32 %offset_SL, i32 %offset_Cyt, float* noalias %d_params, float* noalias %d_com) local_unnamed_addr #0 {
entry:
  %timeinst.addr = alloca i32, align 4
  %d_initvalu.addr = alloca float*, align 8
  %d_finavalu.addr = alloca float*, align 8
  %offset_ecc.addr = alloca i32, align 4
  %offset_Dyad.addr = alloca i32, align 4
  %offset_SL.addr = alloca i32, align 4
  %offset_Cyt.addr = alloca i32, align 4
  %d_params.addr = alloca float*, align 8
  %d_com.addr = alloca float*, align 8
  %BtotDyad = alloca float, align 4
  %CaMKIItotDyad = alloca float, align 4
  %Vmyo = alloca float, align 4
  %Vdyad = alloca float, align 4
  %VSL = alloca float, align 4
  %kSLmyo = alloca float, align 4
  %k0Boff = alloca float, align 4
  %k0Bon = alloca float, align 4
  %k2Boff = alloca float, align 4
  %k2Bon = alloca float, align 4
  %k4Bon = alloca float, align 4
  %CaMtotDyad = alloca float, align 4
  %Bdyad = alloca float, align 4
  %J_cam_dyadSL = alloca float, align 4
  %J_ca2cam_dyadSL = alloca float, align 4
  %J_ca4cam_dyadSL = alloca float, align 4
  %J_cam_SLmyo = alloca float, align 4
  %J_ca2cam_SLmyo = alloca float, align 4
  %J_ca4cam_SLmyo = alloca float, align 4
  store i32 %timeinst, i32* %timeinst.addr, align 4
  store float* %d_initvalu, float** %d_initvalu.addr, align 8
  store float* %d_finavalu, float** %d_finavalu.addr, align 8
  store i32 %offset_ecc, i32* %offset_ecc.addr, align 4
  store i32 %offset_Dyad, i32* %offset_Dyad.addr, align 4
  store i32 %offset_SL, i32* %offset_SL.addr, align 4
  store i32 %offset_Cyt, i32* %offset_Cyt.addr, align 4
  store float* %d_params, float** %d_params.addr, align 8
  store float* %d_com, float** %d_com.addr, align 8
  %0 = load float*, float** %d_params.addr, align 8
  %arrayidx = getelementptr inbounds float, float* %0, i64 1
  %1 = load float, float* %arrayidx, align 4
  store float %1, float* %BtotDyad, align 4
  %2 = load float*, float** %d_params.addr, align 8
  %arrayidx1 = getelementptr inbounds float, float* %2, i64 2
  %3 = load float, float* %arrayidx1, align 4
  store float %3, float* %CaMKIItotDyad, align 4
  %4 = load float*, float** %d_finavalu.addr, align 8
  %5 = load i32, i32* %offset_ecc.addr, align 4
  %add = add nsw i32 %5, 35
  %idxprom = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds float, float* %4, i64 %idxprom
  %6 = load float, float* %arrayidx2, align 4
  %conv = fpext float %6 to double
  %7 = load float*, float** %d_com.addr, align 8
  %arrayidx3 = getelementptr inbounds float, float* %7, i64 0
  %8 = load float, float* %arrayidx3, align 4
  %conv4 = fpext float %8 to double
  %mul = fmul contract double 1.000000e-03, %conv4
  %add5 = fadd contract double %conv, %mul
  %conv6 = fptrunc double %add5 to float
  %9 = load float*, float** %d_finavalu.addr, align 8
  %10 = load i32, i32* %offset_ecc.addr, align 4
  %add7 = add nsw i32 %10, 35
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds float, float* %9, i64 %idxprom8
  store float %conv6, float* %arrayidx9, align 4
  %11 = load float*, float** %d_finavalu.addr, align 8
  %12 = load i32, i32* %offset_ecc.addr, align 4
  %add10 = add nsw i32 %12, 36
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds float, float* %11, i64 %idxprom11
  %13 = load float, float* %arrayidx12, align 4
  %conv13 = fpext float %13 to double
  %14 = load float*, float** %d_com.addr, align 8
  %arrayidx14 = getelementptr inbounds float, float* %14, i64 1
  %15 = load float, float* %arrayidx14, align 4
  %conv15 = fpext float %15 to double
  %mul16 = fmul contract double 1.000000e-03, %conv15
  %add17 = fadd contract double %conv13, %mul16
  %conv18 = fptrunc double %add17 to float
  %16 = load float*, float** %d_finavalu.addr, align 8
  %17 = load i32, i32* %offset_ecc.addr, align 4
  %add19 = add nsw i32 %17, 36
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds float, float* %16, i64 %idxprom20
  store float %conv18, float* %arrayidx21, align 4
  %18 = load float*, float** %d_finavalu.addr, align 8
  %19 = load i32, i32* %offset_ecc.addr, align 4
  %add22 = add nsw i32 %19, 37
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds float, float* %18, i64 %idxprom23
  %20 = load float, float* %arrayidx24, align 4
  %conv25 = fpext float %20 to double
  %21 = load float*, float** %d_com.addr, align 8
  %arrayidx26 = getelementptr inbounds float, float* %21, i64 2
  %22 = load float, float* %arrayidx26, align 4
  %conv27 = fpext float %22 to double
  %mul28 = fmul contract double 1.000000e-03, %conv27
  %add29 = fadd contract double %conv25, %mul28
  %conv30 = fptrunc double %add29 to float
  %23 = load float*, float** %d_finavalu.addr, align 8
  %24 = load i32, i32* %offset_ecc.addr, align 4
  %add31 = add nsw i32 %24, 37
  %idxprom32 = sext i32 %add31 to i64
  %arrayidx33 = getelementptr inbounds float, float* %23, i64 %idxprom32
  store float %conv30, float* %arrayidx33, align 4
  store float 0x3DB796C3A0000000, float* %Vmyo, align 4
  store float 0x3D14079E40000000, float* %Vdyad, align 4
  store float 0x3D6739EC20000000, float* %VSL, align 4
  store float 0x3D03561180000000, float* %kSLmyo, align 4
  store float 0x3F56F00680000000, float* %k0Boff, align 4
  %25 = load float, float* %k0Boff, align 4
  %conv34 = fpext float %25 to double
  %div = fdiv double %conv34, 2.000000e-01
  %conv35 = fptrunc double %div to float
  store float %conv35, float* %k0Bon, align 4
  %26 = load float, float* %k0Boff, align 4
  %div36 = fdiv float %26, 1.000000e+02
  store float %div36, float* %k2Boff, align 4
  %27 = load float, float* %k0Bon, align 4
  store float %27, float* %k2Bon, align 4
  %28 = load float, float* %k0Bon, align 4
  store float %28, float* %k4Bon, align 4
  %29 = load float*, float** %d_initvalu.addr, align 8
  %30 = load i32, i32* %offset_Dyad.addr, align 4
  %add37 = add nsw i32 %30, 0
  %idxprom38 = sext i32 %add37 to i64
  %arrayidx39 = getelementptr inbounds float, float* %29, i64 %idxprom38
  %31 = load float, float* %arrayidx39, align 4
  %32 = load float*, float** %d_initvalu.addr, align 8
  %33 = load i32, i32* %offset_Dyad.addr, align 4
  %add40 = add nsw i32 %33, 1
  %idxprom41 = sext i32 %add40 to i64
  %arrayidx42 = getelementptr inbounds float, float* %32, i64 %idxprom41
  %34 = load float, float* %arrayidx42, align 4
  %add43 = fadd contract float %31, %34
  %35 = load float*, float** %d_initvalu.addr, align 8
  %36 = load i32, i32* %offset_Dyad.addr, align 4
  %add44 = add nsw i32 %36, 2
  %idxprom45 = sext i32 %add44 to i64
  %arrayidx46 = getelementptr inbounds float, float* %35, i64 %idxprom45
  %37 = load float, float* %arrayidx46, align 4
  %add47 = fadd contract float %add43, %37
  %38 = load float*, float** %d_initvalu.addr, align 8
  %39 = load i32, i32* %offset_Dyad.addr, align 4
  %add48 = add nsw i32 %39, 3
  %idxprom49 = sext i32 %add48 to i64
  %arrayidx50 = getelementptr inbounds float, float* %38, i64 %idxprom49
  %40 = load float, float* %arrayidx50, align 4
  %add51 = fadd contract float %add47, %40
  %41 = load float*, float** %d_initvalu.addr, align 8
  %42 = load i32, i32* %offset_Dyad.addr, align 4
  %add52 = add nsw i32 %42, 4
  %idxprom53 = sext i32 %add52 to i64
  %arrayidx54 = getelementptr inbounds float, float* %41, i64 %idxprom53
  %43 = load float, float* %arrayidx54, align 4
  %add55 = fadd contract float %add51, %43
  %44 = load float*, float** %d_initvalu.addr, align 8
  %45 = load i32, i32* %offset_Dyad.addr, align 4
  %add56 = add nsw i32 %45, 5
  %idxprom57 = sext i32 %add56 to i64
  %arrayidx58 = getelementptr inbounds float, float* %44, i64 %idxprom57
  %46 = load float, float* %arrayidx58, align 4
  %add59 = fadd contract float %add55, %46
  %47 = load float, float* %CaMKIItotDyad, align 4
  %48 = load float*, float** %d_initvalu.addr, align 8
  %49 = load i32, i32* %offset_Dyad.addr, align 4
  %add60 = add nsw i32 %49, 6
  %idxprom61 = sext i32 %add60 to i64
  %arrayidx62 = getelementptr inbounds float, float* %48, i64 %idxprom61
  %50 = load float, float* %arrayidx62, align 4
  %51 = load float*, float** %d_initvalu.addr, align 8
  %52 = load i32, i32* %offset_Dyad.addr, align 4
  %add63 = add nsw i32 %52, 7
  %idxprom64 = sext i32 %add63 to i64
  %arrayidx65 = getelementptr inbounds float, float* %51, i64 %idxprom64
  %53 = load float, float* %arrayidx65, align 4
  %add66 = fadd contract float %50, %53
  %54 = load float*, float** %d_initvalu.addr, align 8
  %55 = load i32, i32* %offset_Dyad.addr, align 4
  %add67 = add nsw i32 %55, 8
  %idxprom68 = sext i32 %add67 to i64
  %arrayidx69 = getelementptr inbounds float, float* %54, i64 %idxprom68
  %56 = load float, float* %arrayidx69, align 4
  %add70 = fadd contract float %add66, %56
  %57 = load float*, float** %d_initvalu.addr, align 8
  %58 = load i32, i32* %offset_Dyad.addr, align 4
  %add71 = add nsw i32 %58, 9
  %idxprom72 = sext i32 %add71 to i64
  %arrayidx73 = getelementptr inbounds float, float* %57, i64 %idxprom72
  %59 = load float, float* %arrayidx73, align 4
  %add74 = fadd contract float %add70, %59
  %mul75 = fmul contract float %47, %add74
  %add76 = fadd contract float %add59, %mul75
  %60 = load float*, float** %d_initvalu.addr, align 8
  %61 = load i32, i32* %offset_Dyad.addr, align 4
  %add77 = add nsw i32 %61, 12
  %idxprom78 = sext i32 %add77 to i64
  %arrayidx79 = getelementptr inbounds float, float* %60, i64 %idxprom78
  %62 = load float, float* %arrayidx79, align 4
  %add80 = fadd contract float %add76, %62
  %63 = load float*, float** %d_initvalu.addr, align 8
  %64 = load i32, i32* %offset_Dyad.addr, align 4
  %add81 = add nsw i32 %64, 13
  %idxprom82 = sext i32 %add81 to i64
  %arrayidx83 = getelementptr inbounds float, float* %63, i64 %idxprom82
  %65 = load float, float* %arrayidx83, align 4
  %add84 = fadd contract float %add80, %65
  %66 = load float*, float** %d_initvalu.addr, align 8
  %67 = load i32, i32* %offset_Dyad.addr, align 4
  %add85 = add nsw i32 %67, 14
  %idxprom86 = sext i32 %add85 to i64
  %arrayidx87 = getelementptr inbounds float, float* %66, i64 %idxprom86
  %68 = load float, float* %arrayidx87, align 4
  %add88 = fadd contract float %add84, %68
  store float %add88, float* %CaMtotDyad, align 4
  %69 = load float, float* %BtotDyad, align 4
  %70 = load float, float* %CaMtotDyad, align 4
  %sub = fsub contract float %69, %70
  store float %sub, float* %Bdyad, align 4
  %71 = load float, float* %k0Boff, align 4
  %72 = load float*, float** %d_initvalu.addr, align 8
  %73 = load i32, i32* %offset_Dyad.addr, align 4
  %add89 = add nsw i32 %73, 0
  %idxprom90 = sext i32 %add89 to i64
  %arrayidx91 = getelementptr inbounds float, float* %72, i64 %idxprom90
  %74 = load float, float* %arrayidx91, align 4
  %mul92 = fmul contract float %71, %74
  %75 = load float, float* %k0Bon, align 4
  %76 = load float, float* %Bdyad, align 4
  %mul93 = fmul contract float %75, %76
  %77 = load float*, float** %d_initvalu.addr, align 8
  %78 = load i32, i32* %offset_SL.addr, align 4
  %add94 = add nsw i32 %78, 0
  %idxprom95 = sext i32 %add94 to i64
  %arrayidx96 = getelementptr inbounds float, float* %77, i64 %idxprom95
  %79 = load float, float* %arrayidx96, align 4
  %mul97 = fmul contract float %mul93, %79
  %sub98 = fsub contract float %mul92, %mul97
  %conv99 = fpext float %sub98 to double
  %mul100 = fmul contract double 1.000000e-03, %conv99
  %conv101 = fptrunc double %mul100 to float
  store float %conv101, float* %J_cam_dyadSL, align 4
  %80 = load float, float* %k2Boff, align 4
  %81 = load float*, float** %d_initvalu.addr, align 8
  %82 = load i32, i32* %offset_Dyad.addr, align 4
  %add102 = add nsw i32 %82, 1
  %idxprom103 = sext i32 %add102 to i64
  %arrayidx104 = getelementptr inbounds float, float* %81, i64 %idxprom103
  %83 = load float, float* %arrayidx104, align 4
  %mul105 = fmul contract float %80, %83
  %84 = load float, float* %k2Bon, align 4
  %85 = load float, float* %Bdyad, align 4
  %mul106 = fmul contract float %84, %85
  %86 = load float*, float** %d_initvalu.addr, align 8
  %87 = load i32, i32* %offset_SL.addr, align 4
  %add107 = add nsw i32 %87, 1
  %idxprom108 = sext i32 %add107 to i64
  %arrayidx109 = getelementptr inbounds float, float* %86, i64 %idxprom108
  %88 = load float, float* %arrayidx109, align 4
  %mul110 = fmul contract float %mul106, %88
  %sub111 = fsub contract float %mul105, %mul110
  %conv112 = fpext float %sub111 to double
  %mul113 = fmul contract double 1.000000e-03, %conv112
  %conv114 = fptrunc double %mul113 to float
  store float %conv114, float* %J_ca2cam_dyadSL, align 4
  %89 = load float, float* %k2Boff, align 4
  %90 = load float*, float** %d_initvalu.addr, align 8
  %91 = load i32, i32* %offset_Dyad.addr, align 4
  %add115 = add nsw i32 %91, 2
  %idxprom116 = sext i32 %add115 to i64
  %arrayidx117 = getelementptr inbounds float, float* %90, i64 %idxprom116
  %92 = load float, float* %arrayidx117, align 4
  %mul118 = fmul contract float %89, %92
  %93 = load float, float* %k4Bon, align 4
  %94 = load float, float* %Bdyad, align 4
  %mul119 = fmul contract float %93, %94
  %95 = load float*, float** %d_initvalu.addr, align 8
  %96 = load i32, i32* %offset_SL.addr, align 4
  %add120 = add nsw i32 %96, 2
  %idxprom121 = sext i32 %add120 to i64
  %arrayidx122 = getelementptr inbounds float, float* %95, i64 %idxprom121
  %97 = load float, float* %arrayidx122, align 4
  %mul123 = fmul contract float %mul119, %97
  %sub124 = fsub contract float %mul118, %mul123
  %conv125 = fpext float %sub124 to double
  %mul126 = fmul contract double 1.000000e-03, %conv125
  %conv127 = fptrunc double %mul126 to float
  store float %conv127, float* %J_ca4cam_dyadSL, align 4
  %98 = load float, float* %kSLmyo, align 4
  %99 = load float*, float** %d_initvalu.addr, align 8
  %100 = load i32, i32* %offset_SL.addr, align 4
  %add128 = add nsw i32 %100, 0
  %idxprom129 = sext i32 %add128 to i64
  %arrayidx130 = getelementptr inbounds float, float* %99, i64 %idxprom129
  %101 = load float, float* %arrayidx130, align 4
  %102 = load float*, float** %d_initvalu.addr, align 8
  %103 = load i32, i32* %offset_Cyt.addr, align 4
  %add131 = add nsw i32 %103, 0
  %idxprom132 = sext i32 %add131 to i64
  %arrayidx133 = getelementptr inbounds float, float* %102, i64 %idxprom132
  %104 = load float, float* %arrayidx133, align 4
  %sub134 = fsub contract float %101, %104
  %mul135 = fmul contract float %98, %sub134
  store float %mul135, float* %J_cam_SLmyo, align 4
  %105 = load float, float* %kSLmyo, align 4
  %106 = load float*, float** %d_initvalu.addr, align 8
  %107 = load i32, i32* %offset_SL.addr, align 4
  %add136 = add nsw i32 %107, 1
  %idxprom137 = sext i32 %add136 to i64
  %arrayidx138 = getelementptr inbounds float, float* %106, i64 %idxprom137
  %108 = load float, float* %arrayidx138, align 4
  %109 = load float*, float** %d_initvalu.addr, align 8
  %110 = load i32, i32* %offset_Cyt.addr, align 4
  %add139 = add nsw i32 %110, 1
  %idxprom140 = sext i32 %add139 to i64
  %arrayidx141 = getelementptr inbounds float, float* %109, i64 %idxprom140
  %111 = load float, float* %arrayidx141, align 4
  %sub142 = fsub contract float %108, %111
  %mul143 = fmul contract float %105, %sub142
  store float %mul143, float* %J_ca2cam_SLmyo, align 4
  %112 = load float, float* %kSLmyo, align 4
  %113 = load float*, float** %d_initvalu.addr, align 8
  %114 = load i32, i32* %offset_SL.addr, align 4
  %add144 = add nsw i32 %114, 2
  %idxprom145 = sext i32 %add144 to i64
  %arrayidx146 = getelementptr inbounds float, float* %113, i64 %idxprom145
  %115 = load float, float* %arrayidx146, align 4
  %116 = load float*, float** %d_initvalu.addr, align 8
  %117 = load i32, i32* %offset_Cyt.addr, align 4
  %add147 = add nsw i32 %117, 2
  %idxprom148 = sext i32 %add147 to i64
  %arrayidx149 = getelementptr inbounds float, float* %116, i64 %idxprom148
  %118 = load float, float* %arrayidx149, align 4
  %sub150 = fsub contract float %115, %118
  %mul151 = fmul contract float %112, %sub150
  store float %mul151, float* %J_ca4cam_SLmyo, align 4
  %119 = load float*, float** %d_finavalu.addr, align 8
  %120 = load i32, i32* %offset_Dyad.addr, align 4
  %add152 = add nsw i32 %120, 0
  %idxprom153 = sext i32 %add152 to i64
  %arrayidx154 = getelementptr inbounds float, float* %119, i64 %idxprom153
  %121 = load float, float* %arrayidx154, align 4
  %122 = load float, float* %J_cam_dyadSL, align 4
  %sub155 = fsub contract float %121, %122
  %123 = load float*, float** %d_finavalu.addr, align 8
  %124 = load i32, i32* %offset_Dyad.addr, align 4
  %add156 = add nsw i32 %124, 0
  %idxprom157 = sext i32 %add156 to i64
  %arrayidx158 = getelementptr inbounds float, float* %123, i64 %idxprom157
  store float %sub155, float* %arrayidx158, align 4
  %125 = load float*, float** %d_finavalu.addr, align 8
  %126 = load i32, i32* %offset_Dyad.addr, align 4
  %add159 = add nsw i32 %126, 1
  %idxprom160 = sext i32 %add159 to i64
  %arrayidx161 = getelementptr inbounds float, float* %125, i64 %idxprom160
  %127 = load float, float* %arrayidx161, align 4
  %128 = load float, float* %J_ca2cam_dyadSL, align 4
  %sub162 = fsub contract float %127, %128
  %129 = load float*, float** %d_finavalu.addr, align 8
  %130 = load i32, i32* %offset_Dyad.addr, align 4
  %add163 = add nsw i32 %130, 1
  %idxprom164 = sext i32 %add163 to i64
  %arrayidx165 = getelementptr inbounds float, float* %129, i64 %idxprom164
  store float %sub162, float* %arrayidx165, align 4
  %131 = load float*, float** %d_finavalu.addr, align 8
  %132 = load i32, i32* %offset_Dyad.addr, align 4
  %add166 = add nsw i32 %132, 2
  %idxprom167 = sext i32 %add166 to i64
  %arrayidx168 = getelementptr inbounds float, float* %131, i64 %idxprom167
  %133 = load float, float* %arrayidx168, align 4
  %134 = load float, float* %J_ca4cam_dyadSL, align 4
  %sub169 = fsub contract float %133, %134
  %135 = load float*, float** %d_finavalu.addr, align 8
  %136 = load i32, i32* %offset_Dyad.addr, align 4
  %add170 = add nsw i32 %136, 2
  %idxprom171 = sext i32 %add170 to i64
  %arrayidx172 = getelementptr inbounds float, float* %135, i64 %idxprom171
  store float %sub169, float* %arrayidx172, align 4
  %137 = load float*, float** %d_finavalu.addr, align 8
  %138 = load i32, i32* %offset_SL.addr, align 4
  %add173 = add nsw i32 %138, 0
  %idxprom174 = sext i32 %add173 to i64
  %arrayidx175 = getelementptr inbounds float, float* %137, i64 %idxprom174
  %139 = load float, float* %arrayidx175, align 4
  %140 = load float, float* %J_cam_dyadSL, align 4
  %141 = load float, float* %Vdyad, align 4
  %mul176 = fmul contract float %140, %141
  %142 = load float, float* %VSL, align 4
  %div177 = fdiv float %mul176, %142
  %add178 = fadd contract float %139, %div177
  %143 = load float, float* %J_cam_SLmyo, align 4
  %144 = load float, float* %VSL, align 4
  %div179 = fdiv float %143, %144
  %sub180 = fsub contract float %add178, %div179
  %145 = load float*, float** %d_finavalu.addr, align 8
  %146 = load i32, i32* %offset_SL.addr, align 4
  %add181 = add nsw i32 %146, 0
  %idxprom182 = sext i32 %add181 to i64
  %arrayidx183 = getelementptr inbounds float, float* %145, i64 %idxprom182
  store float %sub180, float* %arrayidx183, align 4
  %147 = load float*, float** %d_finavalu.addr, align 8
  %148 = load i32, i32* %offset_SL.addr, align 4
  %add184 = add nsw i32 %148, 1
  %idxprom185 = sext i32 %add184 to i64
  %arrayidx186 = getelementptr inbounds float, float* %147, i64 %idxprom185
  %149 = load float, float* %arrayidx186, align 4
  %150 = load float, float* %J_ca2cam_dyadSL, align 4
  %151 = load float, float* %Vdyad, align 4
  %mul187 = fmul contract float %150, %151
  %152 = load float, float* %VSL, align 4
  %div188 = fdiv float %mul187, %152
  %add189 = fadd contract float %149, %div188
  %153 = load float, float* %J_ca2cam_SLmyo, align 4
  %154 = load float, float* %VSL, align 4
  %div190 = fdiv float %153, %154
  %sub191 = fsub contract float %add189, %div190
  %155 = load float*, float** %d_finavalu.addr, align 8
  %156 = load i32, i32* %offset_SL.addr, align 4
  %add192 = add nsw i32 %156, 1
  %idxprom193 = sext i32 %add192 to i64
  %arrayidx194 = getelementptr inbounds float, float* %155, i64 %idxprom193
  store float %sub191, float* %arrayidx194, align 4
  %157 = load float*, float** %d_finavalu.addr, align 8
  %158 = load i32, i32* %offset_SL.addr, align 4
  %add195 = add nsw i32 %158, 2
  %idxprom196 = sext i32 %add195 to i64
  %arrayidx197 = getelementptr inbounds float, float* %157, i64 %idxprom196
  %159 = load float, float* %arrayidx197, align 4
  %160 = load float, float* %J_ca4cam_dyadSL, align 4
  %161 = load float, float* %Vdyad, align 4
  %mul198 = fmul contract float %160, %161
  %162 = load float, float* %VSL, align 4
  %div199 = fdiv float %mul198, %162
  %add200 = fadd contract float %159, %div199
  %163 = load float, float* %J_ca4cam_SLmyo, align 4
  %164 = load float, float* %VSL, align 4
  %div201 = fdiv float %163, %164
  %sub202 = fsub contract float %add200, %div201
  %165 = load float*, float** %d_finavalu.addr, align 8
  %166 = load i32, i32* %offset_SL.addr, align 4
  %add203 = add nsw i32 %166, 2
  %idxprom204 = sext i32 %add203 to i64
  %arrayidx205 = getelementptr inbounds float, float* %165, i64 %idxprom204
  store float %sub202, float* %arrayidx205, align 4
  %167 = load float*, float** %d_finavalu.addr, align 8
  %168 = load i32, i32* %offset_Cyt.addr, align 4
  %add206 = add nsw i32 %168, 0
  %idxprom207 = sext i32 %add206 to i64
  %arrayidx208 = getelementptr inbounds float, float* %167, i64 %idxprom207
  %169 = load float, float* %arrayidx208, align 4
  %170 = load float, float* %J_cam_SLmyo, align 4
  %171 = load float, float* %Vmyo, align 4
  %div209 = fdiv float %170, %171
  %add210 = fadd contract float %169, %div209
  %172 = load float*, float** %d_finavalu.addr, align 8
  %173 = load i32, i32* %offset_Cyt.addr, align 4
  %add211 = add nsw i32 %173, 0
  %idxprom212 = sext i32 %add211 to i64
  %arrayidx213 = getelementptr inbounds float, float* %172, i64 %idxprom212
  store float %add210, float* %arrayidx213, align 4
  %174 = load float*, float** %d_finavalu.addr, align 8
  %175 = load i32, i32* %offset_Cyt.addr, align 4
  %add214 = add nsw i32 %175, 1
  %idxprom215 = sext i32 %add214 to i64
  %arrayidx216 = getelementptr inbounds float, float* %174, i64 %idxprom215
  %176 = load float, float* %arrayidx216, align 4
  %177 = load float, float* %J_ca2cam_SLmyo, align 4
  %178 = load float, float* %Vmyo, align 4
  %div217 = fdiv float %177, %178
  %add218 = fadd contract float %176, %div217
  %179 = load float*, float** %d_finavalu.addr, align 8
  %180 = load i32, i32* %offset_Cyt.addr, align 4
  %add219 = add nsw i32 %180, 1
  %idxprom220 = sext i32 %add219 to i64
  %arrayidx221 = getelementptr inbounds float, float* %179, i64 %idxprom220
  store float %add218, float* %arrayidx221, align 4
  %181 = load float*, float** %d_finavalu.addr, align 8
  %182 = load i32, i32* %offset_Cyt.addr, align 4
  %add222 = add nsw i32 %182, 2
  %idxprom223 = sext i32 %add222 to i64
  %arrayidx224 = getelementptr inbounds float, float* %181, i64 %idxprom223
  %183 = load float, float* %arrayidx224, align 4
  %184 = load float, float* %J_ca4cam_SLmyo, align 4
  %185 = load float, float* %Vmyo, align 4
  %div225 = fdiv float %184, %185
  %add226 = fadd contract float %183, %div225
  %186 = load float*, float** %d_finavalu.addr, align 8
  %187 = load i32, i32* %offset_Cyt.addr, align 4
  %add227 = add nsw i32 %187, 2
  %idxprom228 = sext i32 %add227 to i64
  %arrayidx229 = getelementptr inbounds float, float* %186, i64 %idxprom228
  store float %add226, float* %arrayidx229, align 4
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z12kernel_ecc_2fPfS_iS_(float %timeinst, float* noalias %d_initvalu, float* noalias %d_finavalu, i32 %valu_offset, float* noalias %d_params) local_unnamed_addr #0 {
entry:
  %timeinst.addr = alloca float, align 4
  %d_initvalu.addr = alloca float*, align 8
  %d_finavalu.addr = alloca float*, align 8
  %valu_offset.addr = alloca i32, align 4
  %d_params.addr = alloca float*, align 8
  %cycleLength = alloca float, align 4
  %offset_1 = alloca i32, align 4
  %offset_2 = alloca i32, align 4
  %offset_3 = alloca i32, align 4
  %offset_4 = alloca i32, align 4
  %offset_5 = alloca i32, align 4
  %offset_6 = alloca i32, align 4
  %offset_7 = alloca i32, align 4
  %offset_8 = alloca i32, align 4
  %offset_9 = alloca i32, align 4
  %offset_10 = alloca i32, align 4
  %offset_11 = alloca i32, align 4
  %offset_12 = alloca i32, align 4
  %offset_13 = alloca i32, align 4
  %offset_14 = alloca i32, align 4
  %offset_15 = alloca i32, align 4
  %offset_16 = alloca i32, align 4
  %offset_17 = alloca i32, align 4
  %offset_18 = alloca i32, align 4
  %offset_19 = alloca i32, align 4
  %offset_20 = alloca i32, align 4
  %offset_21 = alloca i32, align 4
  %offset_22 = alloca i32, align 4
  %offset_23 = alloca i32, align 4
  %offset_24 = alloca i32, align 4
  %offset_25 = alloca i32, align 4
  %offset_26 = alloca i32, align 4
  %offset_27 = alloca i32, align 4
  %offset_28 = alloca i32, align 4
  %offset_29 = alloca i32, align 4
  %offset_30 = alloca i32, align 4
  %offset_31 = alloca i32, align 4
  %offset_32 = alloca i32, align 4
  %offset_33 = alloca i32, align 4
  %offset_34 = alloca i32, align 4
  %offset_35 = alloca i32, align 4
  %offset_36 = alloca i32, align 4
  %offset_37 = alloca i32, align 4
  %offset_38 = alloca i32, align 4
  %offset_39 = alloca i32, align 4
  %offset_40 = alloca i32, align 4
  %offset_41 = alloca i32, align 4
  %offset_42 = alloca i32, align 4
  %offset_43 = alloca i32, align 4
  %offset_44 = alloca i32, align 4
  %offset_45 = alloca i32, align 4
  %offset_46 = alloca i32, align 4
  %d_initvalu_1 = alloca float, align 4
  %d_initvalu_2 = alloca float, align 4
  %d_initvalu_3 = alloca float, align 4
  %d_initvalu_4 = alloca float, align 4
  %d_initvalu_5 = alloca float, align 4
  %d_initvalu_6 = alloca float, align 4
  %d_initvalu_7 = alloca float, align 4
  %d_initvalu_8 = alloca float, align 4
  %d_initvalu_9 = alloca float, align 4
  %d_initvalu_10 = alloca float, align 4
  %d_initvalu_11 = alloca float, align 4
  %d_initvalu_12 = alloca float, align 4
  %d_initvalu_13 = alloca float, align 4
  %d_initvalu_14 = alloca float, align 4
  %d_initvalu_15 = alloca float, align 4
  %d_initvalu_16 = alloca float, align 4
  %d_initvalu_17 = alloca float, align 4
  %d_initvalu_18 = alloca float, align 4
  %d_initvalu_19 = alloca float, align 4
  %d_initvalu_20 = alloca float, align 4
  %d_initvalu_21 = alloca float, align 4
  %d_initvalu_23 = alloca float, align 4
  %d_initvalu_24 = alloca float, align 4
  %d_initvalu_25 = alloca float, align 4
  %d_initvalu_26 = alloca float, align 4
  %d_initvalu_27 = alloca float, align 4
  %d_initvalu_28 = alloca float, align 4
  %d_initvalu_29 = alloca float, align 4
  %d_initvalu_30 = alloca float, align 4
  %d_initvalu_31 = alloca float, align 4
  %d_initvalu_32 = alloca float, align 4
  %d_initvalu_33 = alloca float, align 4
  %d_initvalu_34 = alloca float, align 4
  %d_initvalu_35 = alloca float, align 4
  %d_initvalu_36 = alloca float, align 4
  %d_initvalu_37 = alloca float, align 4
  %d_initvalu_38 = alloca float, align 4
  %d_initvalu_39 = alloca float, align 4
  %d_initvalu_40 = alloca float, align 4
  %pi = alloca float, align 4
  %R = alloca float, align 4
  %Frdy = alloca float, align 4
  %Temp = alloca float, align 4
  %FoRT = alloca float, align 4
  %Cmem = alloca float, align 4
  %Qpow = alloca float, align 4
  %cellLength = alloca float, align 4
  %cellRadius = alloca float, align 4
  %Vcell = alloca float, align 4
  %Vmyo = alloca float, align 4
  %Vsr = alloca float, align 4
  %Vsl = alloca float, align 4
  %Vjunc = alloca float, align 4
  %J_ca_juncsl = alloca float, align 4
  %J_ca_slmyo = alloca float, align 4
  %J_na_juncsl = alloca float, align 4
  %J_na_slmyo = alloca float, align 4
  %Fjunc = alloca float, align 4
  %Fsl = alloca float, align 4
  %Fjunc_CaL = alloca float, align 4
  %Fsl_CaL = alloca float, align 4
  %Cli = alloca float, align 4
  %Clo = alloca float, align 4
  %Ko = alloca float, align 4
  %Nao = alloca float, align 4
  %Cao = alloca float, align 4
  %Mgi = alloca float, align 4
  %ena_junc = alloca float, align 4
  %ena_sl = alloca float, align 4
  %ek = alloca float, align 4
  %eca_junc = alloca float, align 4
  %eca_sl = alloca float, align 4
  %ecl = alloca float, align 4
  %GNa = alloca float, align 4
  %GNaB = alloca float, align 4
  %IbarNaK = alloca float, align 4
  %KmNaip = alloca float, align 4
  %KmKo = alloca float, align 4
  %pNaK = alloca float, align 4
  %GtoSlow = alloca float, align 4
  %GtoFast = alloca float, align 4
  %gkp = alloca float, align 4
  %GClCa = alloca float, align 4
  %GClB = alloca float, align 4
  %KdClCa = alloca float, align 4
  %pNa = alloca float, align 4
  %pCa = alloca float, align 4
  %pK = alloca float, align 4
  %Q10CaL = alloca float, align 4
  %IbarNCX = alloca float, align 4
  %KmCai = alloca float, align 4
  %KmCao = alloca float, align 4
  %KmNai = alloca float, align 4
  %KmNao = alloca float, align 4
  %ksat = alloca float, align 4
  %nu = alloca float, align 4
  %Kdact = alloca float, align 4
  %Q10NCX = alloca float, align 4
  %IbarSLCaP = alloca float, align 4
  %KmPCa = alloca float, align 4
  %GCaB = alloca float, align 4
  %Q10SLCaP = alloca float, align 4
  %Q10SRCaP = alloca float, align 4
  %Vmax_SRCaP = alloca float, align 4
  %Kmf = alloca float, align 4
  %Kmr = alloca float, align 4
  %hillSRCaP = alloca float, align 4
  %ks = alloca float, align 4
  %koCa = alloca float, align 4
  %kom = alloca float, align 4
  %kiCa = alloca float, align 4
  %kim = alloca float, align 4
  %ec50SR = alloca float, align 4
  %Bmax_Naj = alloca float, align 4
  %Bmax_Nasl = alloca float, align 4
  %koff_na = alloca float, align 4
  %kon_na = alloca float, align 4
  %Bmax_TnClow = alloca float, align 4
  %koff_tncl = alloca float, align 4
  %kon_tncl = alloca float, align 4
  %Bmax_TnChigh = alloca float, align 4
  %koff_tnchca = alloca float, align 4
  %kon_tnchca = alloca float, align 4
  %koff_tnchmg = alloca float, align 4
  %kon_tnchmg = alloca float, align 4
  %Bmax_myosin = alloca float, align 4
  %koff_myoca = alloca float, align 4
  %kon_myoca = alloca float, align 4
  %koff_myomg = alloca float, align 4
  %kon_myomg = alloca float, align 4
  %Bmax_SR = alloca float, align 4
  %koff_sr = alloca float, align 4
  %kon_sr = alloca float, align 4
  %Bmax_SLlowsl = alloca float, align 4
  %Bmax_SLlowj = alloca float, align 4
  %koff_sll = alloca float, align 4
  %kon_sll = alloca float, align 4
  %Bmax_SLhighsl = alloca float, align 4
  %Bmax_SLhighj = alloca float, align 4
  %koff_slh = alloca float, align 4
  %kon_slh = alloca float, align 4
  %Bmax_Csqn = alloca float, align 4
  %koff_csqn = alloca float, align 4
  %kon_csqn = alloca float, align 4
  %am = alloca float, align 4
  %bm = alloca float, align 4
  %ah = alloca float, align 4
  %bh = alloca float, align 4
  %aj = alloca float, align 4
  %bj = alloca float, align 4
  %I_Na_junc = alloca float, align 4
  %I_Na_sl = alloca float, align 4
  %I_nabk_junc = alloca float, align 4
  %I_nabk_sl = alloca float, align 4
  %sigma = alloca float, align 4
  %fnak = alloca float, align 4
  %I_nak_junc = alloca float, align 4
  %I_nak_sl = alloca float, align 4
  %I_nak = alloca float, align 4
  %gkr = alloca float, align 4
  %xrss = alloca float, align 4
  %tauxr = alloca float, align 4
  %rkr = alloca float, align 4
  %I_kr = alloca float, align 4
  %pcaks_junc = alloca float, align 4
  %pcaks_sl = alloca float, align 4
  %gks_junc = alloca float, align 4
  %gks_sl = alloca float, align 4
  %eks = alloca float, align 4
  %xsss = alloca float, align 4
  %tauxs = alloca float, align 4
  %I_ks_junc = alloca float, align 4
  %I_ks_sl = alloca float, align 4
  %I_ks = alloca float, align 4
  %kp_kp = alloca float, align 4
  %I_kp_junc = alloca float, align 4
  %I_kp_sl = alloca float, align 4
  %I_kp = alloca float, align 4
  %xtoss = alloca float, align 4
  %ytoss = alloca float, align 4
  %rtoss = alloca float, align 4
  %tauxtos = alloca float, align 4
  %tauytos = alloca float, align 4
  %taurtos = alloca float, align 4
  %I_tos = alloca float, align 4
  %tauxtof = alloca float, align 4
  %tauytof = alloca float, align 4
  %I_tof = alloca float, align 4
  %I_to = alloca float, align 4
  %aki = alloca float, align 4
  %bki = alloca float, align 4
  %kiss = alloca float, align 4
  %I_ki = alloca float, align 4
  %I_ClCa_junc = alloca float, align 4
  %I_ClCa_sl = alloca float, align 4
  %I_ClCa = alloca float, align 4
  %I_Clbk = alloca float, align 4
  %dss = alloca float, align 4
  %taud = alloca float, align 4
  %fss = alloca float, align 4
  %tauf = alloca float, align 4
  %ibarca_j = alloca float, align 4
  %ibarca_sl = alloca float, align 4
  %ibark = alloca float, align 4
  %ibarna_j = alloca float, align 4
  %ibarna_sl = alloca float, align 4
  %I_Ca_junc = alloca float, align 4
  %I_Ca_sl = alloca float, align 4
  %I_Ca = alloca float, align 4
  %I_CaK = alloca float, align 4
  %I_CaNa_junc = alloca float, align 4
  %I_CaNa_sl = alloca float, align 4
  %Ka_junc = alloca float, align 4
  %Ka_sl = alloca float, align 4
  %s1_junc = alloca float, align 4
  %s1_sl = alloca float, align 4
  %s2_junc = alloca float, align 4
  %s3_junc = alloca float, align 4
  %s2_sl = alloca float, align 4
  %s3_sl = alloca float, align 4
  %I_ncx_junc = alloca float, align 4
  %I_ncx_sl = alloca float, align 4
  %I_ncx = alloca float, align 4
  %I_pca_junc = alloca float, align 4
  %I_pca_sl = alloca float, align 4
  %I_pca = alloca float, align 4
  %I_cabk_junc = alloca float, align 4
  %I_cabk_sl = alloca float, align 4
  %I_cabk = alloca float, align 4
  %MaxSR = alloca float, align 4
  %MinSR = alloca float, align 4
  %kCaSR = alloca float, align 4
  %koSRCa = alloca float, align 4
  %kiSRCa = alloca float, align 4
  %RI = alloca float, align 4
  %J_SRCarel = alloca float, align 4
  %J_serca = alloca float, align 4
  %J_SRleak = alloca float, align 4
  %J_CaB_cytosol = alloca float, align 4
  %J_CaB_junction = alloca float, align 4
  %J_CaB_sl = alloca float, align 4
  %oneovervsr = alloca float, align 4
  %I_Na_tot_junc = alloca float, align 4
  %I_Na_tot_sl = alloca float, align 4
  %oneovervsl = alloca float, align 4
  %I_K_tot = alloca float, align 4
  %I_Ca_tot_junc = alloca float, align 4
  %I_Ca_tot_sl = alloca float, align 4
  %state = alloca i32, align 4
  %I_app = alloca float, align 4
  %V_hold = alloca float, align 4
  %V_test = alloca float, align 4
  %V_clamp = alloca float, align 4
  %R_clamp = alloca float, align 4
  %I_Na_tot = alloca float, align 4
  %I_Cl_tot = alloca float, align 4
  %I_Ca_tot = alloca float, align 4
  %I_tot = alloca float, align 4
  store float %timeinst, float* %timeinst.addr, align 4
  store float* %d_initvalu, float** %d_initvalu.addr, align 8
  store float* %d_finavalu, float** %d_finavalu.addr, align 8
  store i32 %valu_offset, i32* %valu_offset.addr, align 4
  store float* %d_params, float** %d_params.addr, align 8
  %0 = load float*, float** %d_params.addr, align 8
  %arrayidx = getelementptr inbounds float, float* %0, i64 15
  %1 = load float, float* %arrayidx, align 4
  store float %1, float* %cycleLength, align 4
  %2 = load i32, i32* %valu_offset.addr, align 4
  store i32 %2, i32* %offset_1, align 4
  %3 = load i32, i32* %valu_offset.addr, align 4
  %add = add nsw i32 %3, 1
  store i32 %add, i32* %offset_2, align 4
  %4 = load i32, i32* %valu_offset.addr, align 4
  %add1 = add nsw i32 %4, 2
  store i32 %add1, i32* %offset_3, align 4
  %5 = load i32, i32* %valu_offset.addr, align 4
  %add2 = add nsw i32 %5, 3
  store i32 %add2, i32* %offset_4, align 4
  %6 = load i32, i32* %valu_offset.addr, align 4
  %add3 = add nsw i32 %6, 4
  store i32 %add3, i32* %offset_5, align 4
  %7 = load i32, i32* %valu_offset.addr, align 4
  %add4 = add nsw i32 %7, 5
  store i32 %add4, i32* %offset_6, align 4
  %8 = load i32, i32* %valu_offset.addr, align 4
  %add5 = add nsw i32 %8, 6
  store i32 %add5, i32* %offset_7, align 4
  %9 = load i32, i32* %valu_offset.addr, align 4
  %add6 = add nsw i32 %9, 7
  store i32 %add6, i32* %offset_8, align 4
  %10 = load i32, i32* %valu_offset.addr, align 4
  %add7 = add nsw i32 %10, 8
  store i32 %add7, i32* %offset_9, align 4
  %11 = load i32, i32* %valu_offset.addr, align 4
  %add8 = add nsw i32 %11, 9
  store i32 %add8, i32* %offset_10, align 4
  %12 = load i32, i32* %valu_offset.addr, align 4
  %add9 = add nsw i32 %12, 10
  store i32 %add9, i32* %offset_11, align 4
  %13 = load i32, i32* %valu_offset.addr, align 4
  %add10 = add nsw i32 %13, 11
  store i32 %add10, i32* %offset_12, align 4
  %14 = load i32, i32* %valu_offset.addr, align 4
  %add11 = add nsw i32 %14, 12
  store i32 %add11, i32* %offset_13, align 4
  %15 = load i32, i32* %valu_offset.addr, align 4
  %add12 = add nsw i32 %15, 13
  store i32 %add12, i32* %offset_14, align 4
  %16 = load i32, i32* %valu_offset.addr, align 4
  %add13 = add nsw i32 %16, 14
  store i32 %add13, i32* %offset_15, align 4
  %17 = load i32, i32* %valu_offset.addr, align 4
  %add14 = add nsw i32 %17, 15
  store i32 %add14, i32* %offset_16, align 4
  %18 = load i32, i32* %valu_offset.addr, align 4
  %add15 = add nsw i32 %18, 16
  store i32 %add15, i32* %offset_17, align 4
  %19 = load i32, i32* %valu_offset.addr, align 4
  %add16 = add nsw i32 %19, 17
  store i32 %add16, i32* %offset_18, align 4
  %20 = load i32, i32* %valu_offset.addr, align 4
  %add17 = add nsw i32 %20, 18
  store i32 %add17, i32* %offset_19, align 4
  %21 = load i32, i32* %valu_offset.addr, align 4
  %add18 = add nsw i32 %21, 19
  store i32 %add18, i32* %offset_20, align 4
  %22 = load i32, i32* %valu_offset.addr, align 4
  %add19 = add nsw i32 %22, 20
  store i32 %add19, i32* %offset_21, align 4
  %23 = load i32, i32* %valu_offset.addr, align 4
  %add20 = add nsw i32 %23, 21
  store i32 %add20, i32* %offset_22, align 4
  %24 = load i32, i32* %valu_offset.addr, align 4
  %add21 = add nsw i32 %24, 22
  store i32 %add21, i32* %offset_23, align 4
  %25 = load i32, i32* %valu_offset.addr, align 4
  %add22 = add nsw i32 %25, 23
  store i32 %add22, i32* %offset_24, align 4
  %26 = load i32, i32* %valu_offset.addr, align 4
  %add23 = add nsw i32 %26, 24
  store i32 %add23, i32* %offset_25, align 4
  %27 = load i32, i32* %valu_offset.addr, align 4
  %add24 = add nsw i32 %27, 25
  store i32 %add24, i32* %offset_26, align 4
  %28 = load i32, i32* %valu_offset.addr, align 4
  %add25 = add nsw i32 %28, 26
  store i32 %add25, i32* %offset_27, align 4
  %29 = load i32, i32* %valu_offset.addr, align 4
  %add26 = add nsw i32 %29, 27
  store i32 %add26, i32* %offset_28, align 4
  %30 = load i32, i32* %valu_offset.addr, align 4
  %add27 = add nsw i32 %30, 28
  store i32 %add27, i32* %offset_29, align 4
  %31 = load i32, i32* %valu_offset.addr, align 4
  %add28 = add nsw i32 %31, 29
  store i32 %add28, i32* %offset_30, align 4
  %32 = load i32, i32* %valu_offset.addr, align 4
  %add29 = add nsw i32 %32, 30
  store i32 %add29, i32* %offset_31, align 4
  %33 = load i32, i32* %valu_offset.addr, align 4
  %add30 = add nsw i32 %33, 31
  store i32 %add30, i32* %offset_32, align 4
  %34 = load i32, i32* %valu_offset.addr, align 4
  %add31 = add nsw i32 %34, 32
  store i32 %add31, i32* %offset_33, align 4
  %35 = load i32, i32* %valu_offset.addr, align 4
  %add32 = add nsw i32 %35, 33
  store i32 %add32, i32* %offset_34, align 4
  %36 = load i32, i32* %valu_offset.addr, align 4
  %add33 = add nsw i32 %36, 34
  store i32 %add33, i32* %offset_35, align 4
  %37 = load i32, i32* %valu_offset.addr, align 4
  %add34 = add nsw i32 %37, 35
  store i32 %add34, i32* %offset_36, align 4
  %38 = load i32, i32* %valu_offset.addr, align 4
  %add35 = add nsw i32 %38, 36
  store i32 %add35, i32* %offset_37, align 4
  %39 = load i32, i32* %valu_offset.addr, align 4
  %add36 = add nsw i32 %39, 37
  store i32 %add36, i32* %offset_38, align 4
  %40 = load i32, i32* %valu_offset.addr, align 4
  %add37 = add nsw i32 %40, 38
  store i32 %add37, i32* %offset_39, align 4
  %41 = load i32, i32* %valu_offset.addr, align 4
  %add38 = add nsw i32 %41, 39
  store i32 %add38, i32* %offset_40, align 4
  %42 = load i32, i32* %valu_offset.addr, align 4
  %add39 = add nsw i32 %42, 40
  store i32 %add39, i32* %offset_41, align 4
  %43 = load i32, i32* %valu_offset.addr, align 4
  %add40 = add nsw i32 %43, 41
  store i32 %add40, i32* %offset_42, align 4
  %44 = load i32, i32* %valu_offset.addr, align 4
  %add41 = add nsw i32 %44, 42
  store i32 %add41, i32* %offset_43, align 4
  %45 = load i32, i32* %valu_offset.addr, align 4
  %add42 = add nsw i32 %45, 43
  store i32 %add42, i32* %offset_44, align 4
  %46 = load i32, i32* %valu_offset.addr, align 4
  %add43 = add nsw i32 %46, 44
  store i32 %add43, i32* %offset_45, align 4
  %47 = load i32, i32* %valu_offset.addr, align 4
  %add44 = add nsw i32 %47, 45
  store i32 %add44, i32* %offset_46, align 4
  %48 = load float*, float** %d_initvalu.addr, align 8
  %49 = load i32, i32* %offset_1, align 4
  %idxprom = sext i32 %49 to i64
  %arrayidx45 = getelementptr inbounds float, float* %48, i64 %idxprom
  %50 = load float, float* %arrayidx45, align 4
  store float %50, float* %d_initvalu_1, align 4
  %51 = load float*, float** %d_initvalu.addr, align 8
  %52 = load i32, i32* %offset_2, align 4
  %idxprom46 = sext i32 %52 to i64
  %arrayidx47 = getelementptr inbounds float, float* %51, i64 %idxprom46
  %53 = load float, float* %arrayidx47, align 4
  store float %53, float* %d_initvalu_2, align 4
  %54 = load float*, float** %d_initvalu.addr, align 8
  %55 = load i32, i32* %offset_3, align 4
  %idxprom48 = sext i32 %55 to i64
  %arrayidx49 = getelementptr inbounds float, float* %54, i64 %idxprom48
  %56 = load float, float* %arrayidx49, align 4
  store float %56, float* %d_initvalu_3, align 4
  %57 = load float*, float** %d_initvalu.addr, align 8
  %58 = load i32, i32* %offset_4, align 4
  %idxprom50 = sext i32 %58 to i64
  %arrayidx51 = getelementptr inbounds float, float* %57, i64 %idxprom50
  %59 = load float, float* %arrayidx51, align 4
  store float %59, float* %d_initvalu_4, align 4
  %60 = load float*, float** %d_initvalu.addr, align 8
  %61 = load i32, i32* %offset_5, align 4
  %idxprom52 = sext i32 %61 to i64
  %arrayidx53 = getelementptr inbounds float, float* %60, i64 %idxprom52
  %62 = load float, float* %arrayidx53, align 4
  store float %62, float* %d_initvalu_5, align 4
  %63 = load float*, float** %d_initvalu.addr, align 8
  %64 = load i32, i32* %offset_6, align 4
  %idxprom54 = sext i32 %64 to i64
  %arrayidx55 = getelementptr inbounds float, float* %63, i64 %idxprom54
  %65 = load float, float* %arrayidx55, align 4
  store float %65, float* %d_initvalu_6, align 4
  %66 = load float*, float** %d_initvalu.addr, align 8
  %67 = load i32, i32* %offset_7, align 4
  %idxprom56 = sext i32 %67 to i64
  %arrayidx57 = getelementptr inbounds float, float* %66, i64 %idxprom56
  %68 = load float, float* %arrayidx57, align 4
  store float %68, float* %d_initvalu_7, align 4
  %69 = load float*, float** %d_initvalu.addr, align 8
  %70 = load i32, i32* %offset_8, align 4
  %idxprom58 = sext i32 %70 to i64
  %arrayidx59 = getelementptr inbounds float, float* %69, i64 %idxprom58
  %71 = load float, float* %arrayidx59, align 4
  store float %71, float* %d_initvalu_8, align 4
  %72 = load float*, float** %d_initvalu.addr, align 8
  %73 = load i32, i32* %offset_9, align 4
  %idxprom60 = sext i32 %73 to i64
  %arrayidx61 = getelementptr inbounds float, float* %72, i64 %idxprom60
  %74 = load float, float* %arrayidx61, align 4
  store float %74, float* %d_initvalu_9, align 4
  %75 = load float*, float** %d_initvalu.addr, align 8
  %76 = load i32, i32* %offset_10, align 4
  %idxprom62 = sext i32 %76 to i64
  %arrayidx63 = getelementptr inbounds float, float* %75, i64 %idxprom62
  %77 = load float, float* %arrayidx63, align 4
  store float %77, float* %d_initvalu_10, align 4
  %78 = load float*, float** %d_initvalu.addr, align 8
  %79 = load i32, i32* %offset_11, align 4
  %idxprom64 = sext i32 %79 to i64
  %arrayidx65 = getelementptr inbounds float, float* %78, i64 %idxprom64
  %80 = load float, float* %arrayidx65, align 4
  store float %80, float* %d_initvalu_11, align 4
  %81 = load float*, float** %d_initvalu.addr, align 8
  %82 = load i32, i32* %offset_12, align 4
  %idxprom66 = sext i32 %82 to i64
  %arrayidx67 = getelementptr inbounds float, float* %81, i64 %idxprom66
  %83 = load float, float* %arrayidx67, align 4
  store float %83, float* %d_initvalu_12, align 4
  %84 = load float*, float** %d_initvalu.addr, align 8
  %85 = load i32, i32* %offset_13, align 4
  %idxprom68 = sext i32 %85 to i64
  %arrayidx69 = getelementptr inbounds float, float* %84, i64 %idxprom68
  %86 = load float, float* %arrayidx69, align 4
  store float %86, float* %d_initvalu_13, align 4
  %87 = load float*, float** %d_initvalu.addr, align 8
  %88 = load i32, i32* %offset_14, align 4
  %idxprom70 = sext i32 %88 to i64
  %arrayidx71 = getelementptr inbounds float, float* %87, i64 %idxprom70
  %89 = load float, float* %arrayidx71, align 4
  store float %89, float* %d_initvalu_14, align 4
  %90 = load float*, float** %d_initvalu.addr, align 8
  %91 = load i32, i32* %offset_15, align 4
  %idxprom72 = sext i32 %91 to i64
  %arrayidx73 = getelementptr inbounds float, float* %90, i64 %idxprom72
  %92 = load float, float* %arrayidx73, align 4
  store float %92, float* %d_initvalu_15, align 4
  %93 = load float*, float** %d_initvalu.addr, align 8
  %94 = load i32, i32* %offset_16, align 4
  %idxprom74 = sext i32 %94 to i64
  %arrayidx75 = getelementptr inbounds float, float* %93, i64 %idxprom74
  %95 = load float, float* %arrayidx75, align 4
  store float %95, float* %d_initvalu_16, align 4
  %96 = load float*, float** %d_initvalu.addr, align 8
  %97 = load i32, i32* %offset_17, align 4
  %idxprom76 = sext i32 %97 to i64
  %arrayidx77 = getelementptr inbounds float, float* %96, i64 %idxprom76
  %98 = load float, float* %arrayidx77, align 4
  store float %98, float* %d_initvalu_17, align 4
  %99 = load float*, float** %d_initvalu.addr, align 8
  %100 = load i32, i32* %offset_18, align 4
  %idxprom78 = sext i32 %100 to i64
  %arrayidx79 = getelementptr inbounds float, float* %99, i64 %idxprom78
  %101 = load float, float* %arrayidx79, align 4
  store float %101, float* %d_initvalu_18, align 4
  %102 = load float*, float** %d_initvalu.addr, align 8
  %103 = load i32, i32* %offset_19, align 4
  %idxprom80 = sext i32 %103 to i64
  %arrayidx81 = getelementptr inbounds float, float* %102, i64 %idxprom80
  %104 = load float, float* %arrayidx81, align 4
  store float %104, float* %d_initvalu_19, align 4
  %105 = load float*, float** %d_initvalu.addr, align 8
  %106 = load i32, i32* %offset_20, align 4
  %idxprom82 = sext i32 %106 to i64
  %arrayidx83 = getelementptr inbounds float, float* %105, i64 %idxprom82
  %107 = load float, float* %arrayidx83, align 4
  store float %107, float* %d_initvalu_20, align 4
  %108 = load float*, float** %d_initvalu.addr, align 8
  %109 = load i32, i32* %offset_21, align 4
  %idxprom84 = sext i32 %109 to i64
  %arrayidx85 = getelementptr inbounds float, float* %108, i64 %idxprom84
  %110 = load float, float* %arrayidx85, align 4
  store float %110, float* %d_initvalu_21, align 4
  %111 = load float*, float** %d_initvalu.addr, align 8
  %112 = load i32, i32* %offset_23, align 4
  %idxprom86 = sext i32 %112 to i64
  %arrayidx87 = getelementptr inbounds float, float* %111, i64 %idxprom86
  %113 = load float, float* %arrayidx87, align 4
  store float %113, float* %d_initvalu_23, align 4
  %114 = load float*, float** %d_initvalu.addr, align 8
  %115 = load i32, i32* %offset_24, align 4
  %idxprom88 = sext i32 %115 to i64
  %arrayidx89 = getelementptr inbounds float, float* %114, i64 %idxprom88
  %116 = load float, float* %arrayidx89, align 4
  store float %116, float* %d_initvalu_24, align 4
  %117 = load float*, float** %d_initvalu.addr, align 8
  %118 = load i32, i32* %offset_25, align 4
  %idxprom90 = sext i32 %118 to i64
  %arrayidx91 = getelementptr inbounds float, float* %117, i64 %idxprom90
  %119 = load float, float* %arrayidx91, align 4
  store float %119, float* %d_initvalu_25, align 4
  %120 = load float*, float** %d_initvalu.addr, align 8
  %121 = load i32, i32* %offset_26, align 4
  %idxprom92 = sext i32 %121 to i64
  %arrayidx93 = getelementptr inbounds float, float* %120, i64 %idxprom92
  %122 = load float, float* %arrayidx93, align 4
  store float %122, float* %d_initvalu_26, align 4
  %123 = load float*, float** %d_initvalu.addr, align 8
  %124 = load i32, i32* %offset_27, align 4
  %idxprom94 = sext i32 %124 to i64
  %arrayidx95 = getelementptr inbounds float, float* %123, i64 %idxprom94
  %125 = load float, float* %arrayidx95, align 4
  store float %125, float* %d_initvalu_27, align 4
  %126 = load float*, float** %d_initvalu.addr, align 8
  %127 = load i32, i32* %offset_28, align 4
  %idxprom96 = sext i32 %127 to i64
  %arrayidx97 = getelementptr inbounds float, float* %126, i64 %idxprom96
  %128 = load float, float* %arrayidx97, align 4
  store float %128, float* %d_initvalu_28, align 4
  %129 = load float*, float** %d_initvalu.addr, align 8
  %130 = load i32, i32* %offset_29, align 4
  %idxprom98 = sext i32 %130 to i64
  %arrayidx99 = getelementptr inbounds float, float* %129, i64 %idxprom98
  %131 = load float, float* %arrayidx99, align 4
  store float %131, float* %d_initvalu_29, align 4
  %132 = load float*, float** %d_initvalu.addr, align 8
  %133 = load i32, i32* %offset_30, align 4
  %idxprom100 = sext i32 %133 to i64
  %arrayidx101 = getelementptr inbounds float, float* %132, i64 %idxprom100
  %134 = load float, float* %arrayidx101, align 4
  store float %134, float* %d_initvalu_30, align 4
  %135 = load float*, float** %d_initvalu.addr, align 8
  %136 = load i32, i32* %offset_31, align 4
  %idxprom102 = sext i32 %136 to i64
  %arrayidx103 = getelementptr inbounds float, float* %135, i64 %idxprom102
  %137 = load float, float* %arrayidx103, align 4
  store float %137, float* %d_initvalu_31, align 4
  %138 = load float*, float** %d_initvalu.addr, align 8
  %139 = load i32, i32* %offset_32, align 4
  %idxprom104 = sext i32 %139 to i64
  %arrayidx105 = getelementptr inbounds float, float* %138, i64 %idxprom104
  %140 = load float, float* %arrayidx105, align 4
  store float %140, float* %d_initvalu_32, align 4
  %141 = load float*, float** %d_initvalu.addr, align 8
  %142 = load i32, i32* %offset_33, align 4
  %idxprom106 = sext i32 %142 to i64
  %arrayidx107 = getelementptr inbounds float, float* %141, i64 %idxprom106
  %143 = load float, float* %arrayidx107, align 4
  store float %143, float* %d_initvalu_33, align 4
  %144 = load float*, float** %d_initvalu.addr, align 8
  %145 = load i32, i32* %offset_34, align 4
  %idxprom108 = sext i32 %145 to i64
  %arrayidx109 = getelementptr inbounds float, float* %144, i64 %idxprom108
  %146 = load float, float* %arrayidx109, align 4
  store float %146, float* %d_initvalu_34, align 4
  %147 = load float*, float** %d_initvalu.addr, align 8
  %148 = load i32, i32* %offset_35, align 4
  %idxprom110 = sext i32 %148 to i64
  %arrayidx111 = getelementptr inbounds float, float* %147, i64 %idxprom110
  %149 = load float, float* %arrayidx111, align 4
  store float %149, float* %d_initvalu_35, align 4
  %150 = load float*, float** %d_initvalu.addr, align 8
  %151 = load i32, i32* %offset_36, align 4
  %idxprom112 = sext i32 %151 to i64
  %arrayidx113 = getelementptr inbounds float, float* %150, i64 %idxprom112
  %152 = load float, float* %arrayidx113, align 4
  store float %152, float* %d_initvalu_36, align 4
  %153 = load float*, float** %d_initvalu.addr, align 8
  %154 = load i32, i32* %offset_37, align 4
  %idxprom114 = sext i32 %154 to i64
  %arrayidx115 = getelementptr inbounds float, float* %153, i64 %idxprom114
  %155 = load float, float* %arrayidx115, align 4
  store float %155, float* %d_initvalu_37, align 4
  %156 = load float*, float** %d_initvalu.addr, align 8
  %157 = load i32, i32* %offset_38, align 4
  %idxprom116 = sext i32 %157 to i64
  %arrayidx117 = getelementptr inbounds float, float* %156, i64 %idxprom116
  %158 = load float, float* %arrayidx117, align 4
  store float %158, float* %d_initvalu_38, align 4
  %159 = load float*, float** %d_initvalu.addr, align 8
  %160 = load i32, i32* %offset_39, align 4
  %idxprom118 = sext i32 %160 to i64
  %arrayidx119 = getelementptr inbounds float, float* %159, i64 %idxprom118
  %161 = load float, float* %arrayidx119, align 4
  store float %161, float* %d_initvalu_39, align 4
  %162 = load float*, float** %d_initvalu.addr, align 8
  %163 = load i32, i32* %offset_40, align 4
  %idxprom120 = sext i32 %163 to i64
  %arrayidx121 = getelementptr inbounds float, float* %162, i64 %idxprom120
  %164 = load float, float* %arrayidx121, align 4
  store float %164, float* %d_initvalu_40, align 4
  store float 0x400921FF20000000, float* %pi, align 4
  store float 8.314000e+03, float* %R, align 4
  store float 9.648500e+04, float* %Frdy, align 4
  store float 3.100000e+02, float* %Temp, align 4
  %165 = load float, float* %Frdy, align 4
  %166 = load float, float* %R, align 4
  %div = fdiv float %165, %166
  %167 = load float, float* %Temp, align 4
  %div122 = fdiv float %div, %167
  store float %div122, float* %FoRT, align 4
  store float 0x3DE2FAF640000000, float* %Cmem, align 4
  %168 = load float, float* %Temp, align 4
  %sub = fsub contract float %168, 3.100000e+02
  %div123 = fdiv float %sub, 1.000000e+01
  store float %div123, float* %Qpow, align 4
  store float 1.000000e+02, float* %cellLength, align 4
  store float 1.025000e+01, float* %cellRadius, align 4
  %169 = load float, float* %pi, align 4
  %170 = load float, float* %cellRadius, align 4
  %call = call fastcc float @_ZL3powfi(float %170, i32 2) #4
  %mul = fmul contract float %169, %call
  %171 = load float, float* %cellLength, align 4
  %mul124 = fmul contract float %mul, %171
  %conv = fpext float %mul124 to double
  %mul125 = fmul contract double %conv, 1.000000e-15
  %conv126 = fptrunc double %mul125 to float
  store float %conv126, float* %Vcell, align 4
  %172 = load float, float* %Vcell, align 4
  %conv127 = fpext float %172 to double
  %mul128 = fmul contract double 6.500000e-01, %conv127
  %conv129 = fptrunc double %mul128 to float
  store float %conv129, float* %Vmyo, align 4
  %173 = load float, float* %Vcell, align 4
  %conv130 = fpext float %173 to double
  %mul131 = fmul contract double 3.500000e-02, %conv130
  %conv132 = fptrunc double %mul131 to float
  store float %conv132, float* %Vsr, align 4
  %174 = load float, float* %Vcell, align 4
  %conv133 = fpext float %174 to double
  %mul134 = fmul contract double 2.000000e-02, %conv133
  %conv135 = fptrunc double %mul134 to float
  store float %conv135, float* %Vsl, align 4
  %175 = load float, float* %Vcell, align 4
  %conv136 = fpext float %175 to double
  %mul137 = fmul contract double 0x3F41A975AFAF8595, %conv136
  %conv138 = fptrunc double %mul137 to float
  store float %conv138, float* %Vjunc, align 4
  store float 0x3D6CFF1BA0000000, float* %J_ca_juncsl, align 4
  store float 0x3D906123C0000000, float* %J_ca_slmyo, align 4
  store float 0x3D149E4CE0000000, float* %J_na_juncsl, align 4
  store float 0x3D7CD3B960000000, float* %J_na_slmyo, align 4
  store float 0x3FBC28F5C0000000, float* %Fjunc, align 4
  %176 = load float, float* %Fjunc, align 4
  %sub139 = fsub contract float 1.000000e+00, %176
  store float %sub139, float* %Fsl, align 4
  store float 0x3FECCCCCC0000000, float* %Fjunc_CaL, align 4
  %177 = load float, float* %Fjunc_CaL, align 4
  %sub140 = fsub contract float 1.000000e+00, %177
  store float %sub140, float* %Fsl_CaL, align 4
  store float 1.500000e+01, float* %Cli, align 4
  store float 1.500000e+02, float* %Clo, align 4
  store float 0x40159999A0000000, float* %Ko, align 4
  store float 1.400000e+02, float* %Nao, align 4
  store float 0x3FFCCCCCC0000000, float* %Cao, align 4
  store float 1.000000e+00, float* %Mgi, align 4
  %178 = load float, float* %FoRT, align 4
  %div141 = fdiv float 1.000000e+00, %178
  %179 = load float, float* %Nao, align 4
  %180 = load float, float* %d_initvalu_32, align 4
  %div142 = fdiv float %179, %180
  %call143 = call fastcc float @_ZL3logf(float %div142) #4
  %mul144 = fmul contract float %div141, %call143
  store float %mul144, float* %ena_junc, align 4
  %181 = load float, float* %FoRT, align 4
  %div145 = fdiv float 1.000000e+00, %181
  %182 = load float, float* %Nao, align 4
  %183 = load float, float* %d_initvalu_33, align 4
  %div146 = fdiv float %182, %183
  %call147 = call fastcc float @_ZL3logf(float %div146) #4
  %mul148 = fmul contract float %div145, %call147
  store float %mul148, float* %ena_sl, align 4
  %184 = load float, float* %FoRT, align 4
  %div149 = fdiv float 1.000000e+00, %184
  %185 = load float, float* %Ko, align 4
  %186 = load float, float* %d_initvalu_35, align 4
  %div150 = fdiv float %185, %186
  %call151 = call fastcc float @_ZL3logf(float %div150) #4
  %mul152 = fmul contract float %div149, %call151
  store float %mul152, float* %ek, align 4
  %187 = load float, float* %FoRT, align 4
  %div153 = fdiv float 1.000000e+00, %187
  %div154 = fdiv float %div153, 2.000000e+00
  %188 = load float, float* %Cao, align 4
  %189 = load float, float* %d_initvalu_36, align 4
  %div155 = fdiv float %188, %189
  %call156 = call fastcc float @_ZL3logf(float %div155) #4
  %mul157 = fmul contract float %div154, %call156
  store float %mul157, float* %eca_junc, align 4
  %190 = load float, float* %FoRT, align 4
  %div158 = fdiv float 1.000000e+00, %190
  %div159 = fdiv float %div158, 2.000000e+00
  %191 = load float, float* %Cao, align 4
  %192 = load float, float* %d_initvalu_37, align 4
  %div160 = fdiv float %191, %192
  %call161 = call fastcc float @_ZL3logf(float %div160) #4
  %mul162 = fmul contract float %div159, %call161
  store float %mul162, float* %eca_sl, align 4
  %193 = load float, float* %FoRT, align 4
  %div163 = fdiv float 1.000000e+00, %193
  %194 = load float, float* %Cli, align 4
  %195 = load float, float* %Clo, align 4
  %div164 = fdiv float %194, %195
  %call165 = call fastcc float @_ZL3logf(float %div164) #4
  %mul166 = fmul contract float %div163, %call165
  store float %mul166, float* %ecl, align 4
  store float 1.600000e+01, float* %GNa, align 4
  store float 0x3F3376D540000000, float* %GNaB, align 4
  store float 0x3FFE83D9A0000000, float* %IbarNaK, align 4
  store float 1.100000e+01, float* %KmNaip, align 4
  store float 1.500000e+00, float* %KmKo, align 4
  store float 0x3F92C51980000000, float* %pNaK, align 4
  store float 0x3FAEB851E0000000, float* %GtoSlow, align 4
  store float 0x3F947AE140000000, float* %GtoFast, align 4
  store float 0x3F50624DE0000000, float* %gkp, align 4
  store float 0x3FBC106240000000, float* %GClCa, align 4
  store float 0x3F826E9780000000, float* %GClB, align 4
  store float 0x3FB99999A0000000, float* %KdClCa, align 4
  store float 0x3E501B2B20000000, float* %pNa, align 4
  store float 0x3F41B1D920000000, float* %pCa, align 4
  store float 0x3E921E9080000000, float* %pK, align 4
  store float 0x3FFCCCCCC0000000, float* %Q10CaL, align 4
  store float 9.000000e+00, float* %IbarNCX, align 4
  store float 0x3F6D68C6A0000000, float* %KmCai, align 4
  store float 0x3FF4CCCCC0000000, float* %KmCao, align 4
  store float 0x4028947AE0000000, float* %KmNai, align 4
  store float 8.750000e+01, float* %KmNao, align 4
  store float 0x3FD147AE20000000, float* %ksat, align 4
  store float 0x3FD6666660000000, float* %nu, align 4
  store float 0x3F30C6F7A0000000, float* %Kdact, align 4
  store float 0x3FF91EB860000000, float* %Q10NCX, align 4
  store float 0x3FB13A92A0000000, float* %IbarSLCaP, align 4
  store float 0x3F40624DE0000000, float* %KmPCa, align 4
  store float 0x3F30781D40000000, float* %GCaB, align 4
  store float 0x4002CCCCC0000000, float* %Q10SLCaP, align 4
  store float 0x4004CCCCC0000000, float* %Q10SRCaP, align 4
  store float 0x3F32BE48A0000000, float* %Vmax_SRCaP, align 4
  store float 0x3F301F3200000000, float* %Kmf, align 4
  store float 0x3FFB333340000000, float* %Kmr, align 4
  store float 0x3FFC978D40000000, float* %hillSRCaP, align 4
  store float 2.500000e+01, float* %ks, align 4
  store float 1.000000e+01, float* %koCa, align 4
  store float 0x3FAEB851E0000000, float* %kom, align 4
  store float 5.000000e-01, float* %kiCa, align 4
  store float 0x3F747AE140000000, float* %kim, align 4
  store float 0x3FDCCCCCC0000000, float* %ec50SR, align 4
  store float 0x401E3E76C0000000, float* %Bmax_Naj, align 4
  store float 0x3FFA666660000000, float* %Bmax_Nasl, align 4
  store float 0x3F50624DE0000000, float* %koff_na, align 4
  store float 0x3F1A36E2E0000000, float* %kon_na, align 4
  store float 0x3FB1EB8520000000, float* %Bmax_TnClow, align 4
  store float 0x3F941205C0000000, float* %koff_tncl, align 4
  store float 0x40405999A0000000, float* %kon_tncl, align 4
  store float 0x3FC1EB8520000000, float* %Bmax_TnChigh, align 4
  store float 0x3F00C6F7A0000000, float* %koff_tnchca, align 4
  store float 0x4002F5C280000000, float* %kon_tnchca, align 4
  store float 0x3F6B478420000000, float* %koff_tnchmg, align 4
  store float 0x3F689374C0000000, float* %kon_tnchmg, align 4
  store float 0x3FC1EB8520000000, float* %Bmax_myosin, align 4
  store float 0x3F3E258500000000, float* %koff_myoca, align 4
  store float 0x402B9999A0000000, float* %kon_myoca, align 4
  store float 0x3F0DE26920000000, float* %koff_myomg, align 4
  store float 0x3F9013A920000000, float* %kon_myomg, align 4
  store float 0x3F9182A9A0000000, float* %Bmax_SR, align 4
  store float 0x3FAEB851E0000000, float* %koff_sr, align 4
  store float 1.000000e+02, float* %kon_sr, align 4
  %196 = load float, float* %Vmyo, align 4
  %conv167 = fpext float %196 to double
  %mul168 = fmul contract double 3.738000e-02, %conv167
  %197 = load float, float* %Vsl, align 4
  %conv169 = fpext float %197 to double
  %div170 = fdiv double %mul168, %conv169
  %conv171 = fptrunc double %div170 to float
  store float %conv171, float* %Bmax_SLlowsl, align 4
  %198 = load float, float* %Vmyo, align 4
  %conv172 = fpext float %198 to double
  %mul173 = fmul contract double 4.620000e-03, %conv172
  %199 = load float, float* %Vjunc, align 4
  %conv174 = fpext float %199 to double
  %div175 = fdiv double %mul173, %conv174
  %mul176 = fmul contract double %div175, 1.000000e-01
  %conv177 = fptrunc double %mul176 to float
  store float %conv177, float* %Bmax_SLlowj, align 4
  store float 0x3FF4CCCCC0000000, float* %koff_sll, align 4
  store float 1.000000e+02, float* %kon_sll, align 4
  %200 = load float, float* %Vmyo, align 4
  %conv178 = fpext float %200 to double
  %mul179 = fmul contract double 1.335000e-02, %conv178
  %201 = load float, float* %Vsl, align 4
  %conv180 = fpext float %201 to double
  %div181 = fdiv double %mul179, %conv180
  %conv182 = fptrunc double %div181 to float
  store float %conv182, float* %Bmax_SLhighsl, align 4
  %202 = load float, float* %Vmyo, align 4
  %conv183 = fpext float %202 to double
  %mul184 = fmul contract double 1.650000e-03, %conv183
  %203 = load float, float* %Vjunc, align 4
  %conv185 = fpext float %203 to double
  %div186 = fdiv double %mul184, %conv185
  %mul187 = fmul contract double %div186, 1.000000e-01
  %conv188 = fptrunc double %mul187 to float
  store float %conv188, float* %Bmax_SLhighj, align 4
  store float 0x3F9EB851E0000000, float* %koff_slh, align 4
  store float 1.000000e+02, float* %kon_slh, align 4
  store float 0x40059999A0000000, float* %Bmax_Csqn, align 4
  store float 6.500000e+01, float* %koff_csqn, align 4
  store float 1.000000e+02, float* %kon_csqn, align 4
  %204 = load float, float* %d_initvalu_39, align 4
  %conv189 = fpext float %204 to double
  %add190 = fadd contract double %conv189, 4.713000e+01
  %mul191 = fmul contract double 3.200000e-01, %add190
  %205 = load float, float* %d_initvalu_39, align 4
  %conv192 = fpext float %205 to double
  %add193 = fadd contract double %conv192, 4.713000e+01
  %mul194 = fmul contract double -1.000000e-01, %add193
  %call195 = call fastcc double @_ZL3expd(double %mul194) #4
  %sub196 = fsub contract double 1.000000e+00, %call195
  %div197 = fdiv double %mul191, %sub196
  %conv198 = fptrunc double %div197 to float
  store float %conv198, float* %am, align 4
  %206 = load float, float* %d_initvalu_39, align 4
  %fneg = fneg float %206
  %div199 = fdiv float %fneg, 1.100000e+01
  %call200 = call fastcc float @_ZL3expf(float %div199) #4
  %conv201 = fpext float %call200 to double
  %mul202 = fmul contract double 8.000000e-02, %conv201
  %conv203 = fptrunc double %mul202 to float
  store float %conv203, float* %bm, align 4
  %207 = load float, float* %d_initvalu_39, align 4
  %cmp = fcmp oge float %207, -4.000000e+01
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store float 0.000000e+00, float* %ah, align 4
  store float 0.000000e+00, float* %aj, align 4
  %208 = load float, float* %d_initvalu_39, align 4
  %conv204 = fpext float %208 to double
  %add205 = fadd contract double %conv204, 1.066000e+01
  %fneg206 = fneg double %add205
  %div207 = fdiv double %fneg206, 1.110000e+01
  %call208 = call fastcc double @_ZL3expd(double %div207) #4
  %add209 = fadd contract double 1.000000e+00, %call208
  %mul210 = fmul contract double 1.300000e-01, %add209
  %div211 = fdiv double 1.000000e+00, %mul210
  %conv212 = fptrunc double %div211 to float
  store float %conv212, float* %bh, align 4
  %209 = load float, float* %d_initvalu_39, align 4
  %conv213 = fpext float %209 to double
  %mul214 = fmul contract double -2.535000e-07, %conv213
  %call215 = call fastcc double @_ZL3expd(double %mul214) #4
  %mul216 = fmul contract double 3.000000e-01, %call215
  %210 = load float, float* %d_initvalu_39, align 4
  %add217 = fadd contract float %210, 3.200000e+01
  %conv218 = fpext float %add217 to double
  %mul219 = fmul contract double -1.000000e-01, %conv218
  %call220 = call fastcc double @_ZL3expd(double %mul219) #4
  %add221 = fadd contract double 1.000000e+00, %call220
  %div222 = fdiv double %mul216, %add221
  %conv223 = fptrunc double %div222 to float
  store float %conv223, float* %bj, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %211 = load float, float* %d_initvalu_39, align 4
  %add224 = fadd contract float 8.000000e+01, %211
  %conv225 = fpext float %add224 to double
  %div226 = fdiv double %conv225, -6.800000e+00
  %call227 = call fastcc double @_ZL3expd(double %div226) #4
  %mul228 = fmul contract double 1.350000e-01, %call227
  %conv229 = fptrunc double %mul228 to float
  store float %conv229, float* %ah, align 4
  %212 = load float, float* %d_initvalu_39, align 4
  %conv230 = fpext float %212 to double
  %mul231 = fmul contract double 7.900000e-02, %conv230
  %call232 = call fastcc double @_ZL3expd(double %mul231) #4
  %mul233 = fmul contract double 3.560000e+00, %call232
  %213 = load float, float* %d_initvalu_39, align 4
  %conv234 = fpext float %213 to double
  %mul235 = fmul contract double 3.500000e-01, %conv234
  %call236 = call fastcc double @_ZL3expd(double %mul235) #4
  %mul237 = fmul contract double 3.100000e+05, %call236
  %add238 = fadd contract double %mul233, %mul237
  %conv239 = fptrunc double %add238 to float
  store float %conv239, float* %bh, align 4
  %214 = load float, float* %d_initvalu_39, align 4
  %conv240 = fpext float %214 to double
  %mul241 = fmul contract double 2.444000e-01, %conv240
  %call242 = call fastcc double @_ZL3expd(double %mul241) #4
  %mul243 = fmul contract double -1.271400e+05, %call242
  %215 = load float, float* %d_initvalu_39, align 4
  %conv244 = fpext float %215 to double
  %mul245 = fmul contract double -4.391000e-02, %conv244
  %call246 = call fastcc double @_ZL3expd(double %mul245) #4
  %mul247 = fmul contract double 3.474000e-05, %call246
  %sub248 = fsub contract double %mul243, %mul247
  %216 = load float, float* %d_initvalu_39, align 4
  %conv249 = fpext float %216 to double
  %add250 = fadd contract double %conv249, 3.778000e+01
  %mul251 = fmul contract double %sub248, %add250
  %217 = load float, float* %d_initvalu_39, align 4
  %conv252 = fpext float %217 to double
  %add253 = fadd contract double %conv252, 7.923000e+01
  %mul254 = fmul contract double 3.110000e-01, %add253
  %call255 = call fastcc double @_ZL3expd(double %mul254) #4
  %add256 = fadd contract double 1.000000e+00, %call255
  %div257 = fdiv double %mul251, %add256
  %conv258 = fptrunc double %div257 to float
  store float %conv258, float* %aj, align 4
  %218 = load float, float* %d_initvalu_39, align 4
  %conv259 = fpext float %218 to double
  %mul260 = fmul contract double -1.052000e-02, %conv259
  %call261 = call fastcc double @_ZL3expd(double %mul260) #4
  %mul262 = fmul contract double 1.212000e-01, %call261
  %219 = load float, float* %d_initvalu_39, align 4
  %conv263 = fpext float %219 to double
  %add264 = fadd contract double %conv263, 4.014000e+01
  %mul265 = fmul contract double -1.378000e-01, %add264
  %call266 = call fastcc double @_ZL3expd(double %mul265) #4
  %add267 = fadd contract double 1.000000e+00, %call266
  %div268 = fdiv double %mul262, %add267
  %conv269 = fptrunc double %div268 to float
  store float %conv269, float* %bj, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %220 = load float, float* %am, align 4
  %221 = load float, float* %d_initvalu_1, align 4
  %sub270 = fsub contract float 1.000000e+00, %221
  %mul271 = fmul contract float %220, %sub270
  %222 = load float, float* %bm, align 4
  %223 = load float, float* %d_initvalu_1, align 4
  %mul272 = fmul contract float %222, %223
  %sub273 = fsub contract float %mul271, %mul272
  %224 = load float*, float** %d_finavalu.addr, align 8
  %225 = load i32, i32* %offset_1, align 4
  %idxprom274 = sext i32 %225 to i64
  %arrayidx275 = getelementptr inbounds float, float* %224, i64 %idxprom274
  store float %sub273, float* %arrayidx275, align 4
  %226 = load float, float* %ah, align 4
  %227 = load float, float* %d_initvalu_2, align 4
  %sub276 = fsub contract float 1.000000e+00, %227
  %mul277 = fmul contract float %226, %sub276
  %228 = load float, float* %bh, align 4
  %229 = load float, float* %d_initvalu_2, align 4
  %mul278 = fmul contract float %228, %229
  %sub279 = fsub contract float %mul277, %mul278
  %230 = load float*, float** %d_finavalu.addr, align 8
  %231 = load i32, i32* %offset_2, align 4
  %idxprom280 = sext i32 %231 to i64
  %arrayidx281 = getelementptr inbounds float, float* %230, i64 %idxprom280
  store float %sub279, float* %arrayidx281, align 4
  %232 = load float, float* %aj, align 4
  %233 = load float, float* %d_initvalu_3, align 4
  %sub282 = fsub contract float 1.000000e+00, %233
  %mul283 = fmul contract float %232, %sub282
  %234 = load float, float* %bj, align 4
  %235 = load float, float* %d_initvalu_3, align 4
  %mul284 = fmul contract float %234, %235
  %sub285 = fsub contract float %mul283, %mul284
  %236 = load float*, float** %d_finavalu.addr, align 8
  %237 = load i32, i32* %offset_3, align 4
  %idxprom286 = sext i32 %237 to i64
  %arrayidx287 = getelementptr inbounds float, float* %236, i64 %idxprom286
  store float %sub285, float* %arrayidx287, align 4
  %238 = load float, float* %Fjunc, align 4
  %239 = load float, float* %GNa, align 4
  %mul288 = fmul contract float %238, %239
  %240 = load float, float* %d_initvalu_1, align 4
  %call289 = call fastcc float @_ZL3powfi(float %240, i32 3) #4
  %mul290 = fmul contract float %mul288, %call289
  %241 = load float, float* %d_initvalu_2, align 4
  %mul291 = fmul contract float %mul290, %241
  %242 = load float, float* %d_initvalu_3, align 4
  %mul292 = fmul contract float %mul291, %242
  %243 = load float, float* %d_initvalu_39, align 4
  %244 = load float, float* %ena_junc, align 4
  %sub293 = fsub contract float %243, %244
  %mul294 = fmul contract float %mul292, %sub293
  store float %mul294, float* %I_Na_junc, align 4
  %245 = load float, float* %Fsl, align 4
  %246 = load float, float* %GNa, align 4
  %mul295 = fmul contract float %245, %246
  %247 = load float, float* %d_initvalu_1, align 4
  %call296 = call fastcc float @_ZL3powfi(float %247, i32 3) #4
  %mul297 = fmul contract float %mul295, %call296
  %248 = load float, float* %d_initvalu_2, align 4
  %mul298 = fmul contract float %mul297, %248
  %249 = load float, float* %d_initvalu_3, align 4
  %mul299 = fmul contract float %mul298, %249
  %250 = load float, float* %d_initvalu_39, align 4
  %251 = load float, float* %ena_sl, align 4
  %sub300 = fsub contract float %250, %251
  %mul301 = fmul contract float %mul299, %sub300
  store float %mul301, float* %I_Na_sl, align 4
  %252 = load float, float* %Fjunc, align 4
  %253 = load float, float* %GNaB, align 4
  %mul302 = fmul contract float %252, %253
  %254 = load float, float* %d_initvalu_39, align 4
  %255 = load float, float* %ena_junc, align 4
  %sub303 = fsub contract float %254, %255
  %mul304 = fmul contract float %mul302, %sub303
  store float %mul304, float* %I_nabk_junc, align 4
  %256 = load float, float* %Fsl, align 4
  %257 = load float, float* %GNaB, align 4
  %mul305 = fmul contract float %256, %257
  %258 = load float, float* %d_initvalu_39, align 4
  %259 = load float, float* %ena_sl, align 4
  %sub306 = fsub contract float %258, %259
  %mul307 = fmul contract float %mul305, %sub306
  store float %mul307, float* %I_nabk_sl, align 4
  %260 = load float, float* %Nao, align 4
  %conv308 = fpext float %260 to double
  %div309 = fdiv double %conv308, 6.730000e+01
  %call310 = call fastcc double @_ZL3expd(double %div309) #4
  %sub311 = fsub contract double %call310, 1.000000e+00
  %div312 = fdiv double %sub311, 7.000000e+00
  %conv313 = fptrunc double %div312 to float
  store float %conv313, float* %sigma, align 4
  %261 = load float, float* %d_initvalu_39, align 4
  %conv314 = fpext float %261 to double
  %mul315 = fmul contract double -1.000000e-01, %conv314
  %262 = load float, float* %FoRT, align 4
  %conv316 = fpext float %262 to double
  %mul317 = fmul contract double %mul315, %conv316
  %call318 = call fastcc double @_ZL3expd(double %mul317) #4
  %mul319 = fmul contract double 1.245000e-01, %call318
  %add320 = fadd contract double 1.000000e+00, %mul319
  %263 = load float, float* %sigma, align 4
  %conv321 = fpext float %263 to double
  %mul322 = fmul contract double 3.650000e-02, %conv321
  %264 = load float, float* %d_initvalu_39, align 4
  %fneg323 = fneg float %264
  %265 = load float, float* %FoRT, align 4
  %mul324 = fmul contract float %fneg323, %265
  %call325 = call fastcc float @_ZL3expf(float %mul324) #4
  %conv326 = fpext float %call325 to double
  %mul327 = fmul contract double %mul322, %conv326
  %add328 = fadd contract double %add320, %mul327
  %div329 = fdiv double 1.000000e+00, %add328
  %conv330 = fptrunc double %div329 to float
  store float %conv330, float* %fnak, align 4
  %266 = load float, float* %Fjunc, align 4
  %267 = load float, float* %IbarNaK, align 4
  %mul331 = fmul contract float %266, %267
  %268 = load float, float* %fnak, align 4
  %mul332 = fmul contract float %mul331, %268
  %269 = load float, float* %Ko, align 4
  %mul333 = fmul contract float %mul332, %269
  %270 = load float, float* %KmNaip, align 4
  %271 = load float, float* %d_initvalu_32, align 4
  %div334 = fdiv float %270, %271
  %call335 = call fastcc float @_ZL3powfi(float %div334, i32 4) #4
  %add336 = fadd contract float 1.000000e+00, %call335
  %div337 = fdiv float %mul333, %add336
  %272 = load float, float* %Ko, align 4
  %273 = load float, float* %KmKo, align 4
  %add338 = fadd contract float %272, %273
  %div339 = fdiv float %div337, %add338
  store float %div339, float* %I_nak_junc, align 4
  %274 = load float, float* %Fsl, align 4
  %275 = load float, float* %IbarNaK, align 4
  %mul340 = fmul contract float %274, %275
  %276 = load float, float* %fnak, align 4
  %mul341 = fmul contract float %mul340, %276
  %277 = load float, float* %Ko, align 4
  %mul342 = fmul contract float %mul341, %277
  %278 = load float, float* %KmNaip, align 4
  %279 = load float, float* %d_initvalu_33, align 4
  %div343 = fdiv float %278, %279
  %call344 = call fastcc float @_ZL3powfi(float %div343, i32 4) #4
  %add345 = fadd contract float 1.000000e+00, %call344
  %div346 = fdiv float %mul342, %add345
  %280 = load float, float* %Ko, align 4
  %281 = load float, float* %KmKo, align 4
  %add347 = fadd contract float %280, %281
  %div348 = fdiv float %div346, %add347
  store float %div348, float* %I_nak_sl, align 4
  %282 = load float, float* %I_nak_junc, align 4
  %283 = load float, float* %I_nak_sl, align 4
  %add349 = fadd contract float %282, %283
  store float %add349, float* %I_nak, align 4
  %284 = load float, float* %Ko, align 4
  %conv350 = fpext float %284 to double
  %div351 = fdiv double %conv350, 5.400000e+00
  %call352 = call fastcc double @_ZL4sqrtd(double %div351) #4
  %mul353 = fmul contract double 3.000000e-02, %call352
  %conv354 = fptrunc double %mul353 to float
  store float %conv354, float* %gkr, align 4
  %285 = load float, float* %d_initvalu_39, align 4
  %add355 = fadd contract float %285, 5.000000e+01
  %fneg356 = fneg float %add355
  %conv357 = fpext float %fneg356 to double
  %div358 = fdiv double %conv357, 7.500000e+00
  %call359 = call fastcc double @_ZL3expd(double %div358) #4
  %add360 = fadd contract double 1.000000e+00, %call359
  %div361 = fdiv double 1.000000e+00, %add360
  %conv362 = fptrunc double %div361 to float
  store float %conv362, float* %xrss, align 4
  %286 = load float, float* %d_initvalu_39, align 4
  %add363 = fadd contract float %286, 7.000000e+00
  %conv364 = fpext float %add363 to double
  %mul365 = fmul contract double 1.380000e-03, %conv364
  %287 = load float, float* %d_initvalu_39, align 4
  %add366 = fadd contract float %287, 7.000000e+00
  %conv367 = fpext float %add366 to double
  %mul368 = fmul contract double -1.230000e-01, %conv367
  %call369 = call fastcc double @_ZL3expd(double %mul368) #4
  %sub370 = fsub contract double 1.000000e+00, %call369
  %div371 = fdiv double %mul365, %sub370
  %288 = load float, float* %d_initvalu_39, align 4
  %add372 = fadd contract float %288, 1.000000e+01
  %conv373 = fpext float %add372 to double
  %mul374 = fmul contract double 6.100000e-04, %conv373
  %289 = load float, float* %d_initvalu_39, align 4
  %add375 = fadd contract float %289, 1.000000e+01
  %conv376 = fpext float %add375 to double
  %mul377 = fmul contract double 1.450000e-01, %conv376
  %call378 = call fastcc double @_ZL3expd(double %mul377) #4
  %sub379 = fsub contract double %call378, 1.000000e+00
  %div380 = fdiv double %mul374, %sub379
  %add381 = fadd contract double %div371, %div380
  %div382 = fdiv double 1.000000e+00, %add381
  %conv383 = fptrunc double %div382 to float
  store float %conv383, float* %tauxr, align 4
  %290 = load float, float* %xrss, align 4
  %291 = load float, float* %d_initvalu_12, align 4
  %sub384 = fsub contract float %290, %291
  %292 = load float, float* %tauxr, align 4
  %div385 = fdiv float %sub384, %292
  %293 = load float*, float** %d_finavalu.addr, align 8
  %294 = load i32, i32* %offset_12, align 4
  %idxprom386 = sext i32 %294 to i64
  %arrayidx387 = getelementptr inbounds float, float* %293, i64 %idxprom386
  store float %div385, float* %arrayidx387, align 4
  %295 = load float, float* %d_initvalu_39, align 4
  %add388 = fadd contract float %295, 3.300000e+01
  %conv389 = fpext float %add388 to double
  %div390 = fdiv double %conv389, 2.240000e+01
  %call391 = call fastcc double @_ZL3expd(double %div390) #4
  %add392 = fadd contract double 1.000000e+00, %call391
  %div393 = fdiv double 1.000000e+00, %add392
  %conv394 = fptrunc double %div393 to float
  store float %conv394, float* %rkr, align 4
  %296 = load float, float* %gkr, align 4
  %297 = load float, float* %d_initvalu_12, align 4
  %mul395 = fmul contract float %296, %297
  %298 = load float, float* %rkr, align 4
  %mul396 = fmul contract float %mul395, %298
  %299 = load float, float* %d_initvalu_39, align 4
  %300 = load float, float* %ek, align 4
  %sub397 = fsub contract float %299, %300
  %mul398 = fmul contract float %mul396, %sub397
  store float %mul398, float* %I_kr, align 4
  %301 = load float, float* %d_initvalu_36, align 4
  %call399 = call fastcc float @_ZL5log10f(float %301) #4
  %fneg400 = fneg float %call399
  %conv401 = fpext float %fneg400 to double
  %add402 = fadd contract double %conv401, 3.000000e+00
  %conv403 = fptrunc double %add402 to float
  store float %conv403, float* %pcaks_junc, align 4
  %302 = load float, float* %d_initvalu_37, align 4
  %call404 = call fastcc float @_ZL5log10f(float %302) #4
  %fneg405 = fneg float %call404
  %conv406 = fpext float %fneg405 to double
  %add407 = fadd contract double %conv406, 3.000000e+00
  %conv408 = fptrunc double %add407 to float
  store float %conv408, float* %pcaks_sl, align 4
  %303 = load float, float* %pcaks_junc, align 4
  %conv409 = fpext float %303 to double
  %add410 = fadd contract double -7.200000e+00, %conv409
  %div411 = fdiv double %add410, 6.000000e-01
  %call412 = call fastcc double @_ZL3expd(double %div411) #4
  %add413 = fadd contract double 1.000000e+00, %call412
  %div414 = fdiv double 1.900000e-01, %add413
  %add415 = fadd contract double 5.700000e-02, %div414
  %mul416 = fmul contract double 7.000000e-02, %add415
  %conv417 = fptrunc double %mul416 to float
  store float %conv417, float* %gks_junc, align 4
  %304 = load float, float* %pcaks_sl, align 4
  %conv418 = fpext float %304 to double
  %add419 = fadd contract double -7.200000e+00, %conv418
  %div420 = fdiv double %add419, 6.000000e-01
  %call421 = call fastcc double @_ZL3expd(double %div420) #4
  %add422 = fadd contract double 1.000000e+00, %call421
  %div423 = fdiv double 1.900000e-01, %add422
  %add424 = fadd contract double 5.700000e-02, %div423
  %mul425 = fmul contract double 7.000000e-02, %add424
  %conv426 = fptrunc double %mul425 to float
  store float %conv426, float* %gks_sl, align 4
  %305 = load float, float* %FoRT, align 4
  %div427 = fdiv float 1.000000e+00, %305
  %306 = load float, float* %Ko, align 4
  %307 = load float, float* %pNaK, align 4
  %308 = load float, float* %Nao, align 4
  %mul428 = fmul contract float %307, %308
  %add429 = fadd contract float %306, %mul428
  %309 = load float, float* %d_initvalu_35, align 4
  %310 = load float, float* %pNaK, align 4
  %311 = load float, float* %d_initvalu_34, align 4
  %mul430 = fmul contract float %310, %311
  %add431 = fadd contract float %309, %mul430
  %div432 = fdiv float %add429, %add431
  %call433 = call fastcc float @_ZL3logf(float %div432) #4
  %mul434 = fmul contract float %div427, %call433
  store float %mul434, float* %eks, align 4
  %312 = load float, float* %d_initvalu_39, align 4
  %conv435 = fpext float %312 to double
  %sub436 = fsub contract double %conv435, 1.500000e+00
  %fneg437 = fneg double %sub436
  %div438 = fdiv double %fneg437, 1.670000e+01
  %call439 = call fastcc double @_ZL3expd(double %div438) #4
  %add440 = fadd contract double 1.000000e+00, %call439
  %div441 = fdiv double 1.000000e+00, %add440
  %conv442 = fptrunc double %div441 to float
  store float %conv442, float* %xsss, align 4
  %313 = load float, float* %d_initvalu_39, align 4
  %add443 = fadd contract float %313, 3.000000e+01
  %conv444 = fpext float %add443 to double
  %mul445 = fmul contract double 7.190000e-05, %conv444
  %314 = load float, float* %d_initvalu_39, align 4
  %add446 = fadd contract float %314, 3.000000e+01
  %conv447 = fpext float %add446 to double
  %mul448 = fmul contract double -1.480000e-01, %conv447
  %call449 = call fastcc double @_ZL3expd(double %mul448) #4
  %sub450 = fsub contract double 1.000000e+00, %call449
  %div451 = fdiv double %mul445, %sub450
  %315 = load float, float* %d_initvalu_39, align 4
  %add452 = fadd contract float %315, 3.000000e+01
  %conv453 = fpext float %add452 to double
  %mul454 = fmul contract double 1.310000e-04, %conv453
  %316 = load float, float* %d_initvalu_39, align 4
  %add455 = fadd contract float %316, 3.000000e+01
  %conv456 = fpext float %add455 to double
  %mul457 = fmul contract double 0x3FB19652BD3C3611, %conv456
  %call458 = call fastcc double @_ZL3expd(double %mul457) #4
  %sub459 = fsub contract double %call458, 1.000000e+00
  %div460 = fdiv double %mul454, %sub459
  %add461 = fadd contract double %div451, %div460
  %div462 = fdiv double 1.000000e+00, %add461
  %conv463 = fptrunc double %div462 to float
  store float %conv463, float* %tauxs, align 4
  %317 = load float, float* %xsss, align 4
  %318 = load float, float* %d_initvalu_13, align 4
  %sub464 = fsub contract float %317, %318
  %319 = load float, float* %tauxs, align 4
  %div465 = fdiv float %sub464, %319
  %320 = load float*, float** %d_finavalu.addr, align 8
  %321 = load i32, i32* %offset_13, align 4
  %idxprom466 = sext i32 %321 to i64
  %arrayidx467 = getelementptr inbounds float, float* %320, i64 %idxprom466
  store float %div465, float* %arrayidx467, align 4
  %322 = load float, float* %Fjunc, align 4
  %323 = load float, float* %gks_junc, align 4
  %mul468 = fmul contract float %322, %323
  %324 = load float, float* %d_initvalu_12, align 4
  %call469 = call fastcc float @_ZL3powfi(float %324, i32 2) #4
  %mul470 = fmul contract float %mul468, %call469
  %325 = load float, float* %d_initvalu_39, align 4
  %326 = load float, float* %eks, align 4
  %sub471 = fsub contract float %325, %326
  %mul472 = fmul contract float %mul470, %sub471
  store float %mul472, float* %I_ks_junc, align 4
  %327 = load float, float* %Fsl, align 4
  %328 = load float, float* %gks_sl, align 4
  %mul473 = fmul contract float %327, %328
  %329 = load float, float* %d_initvalu_13, align 4
  %call474 = call fastcc float @_ZL3powfi(float %329, i32 2) #4
  %mul475 = fmul contract float %mul473, %call474
  %330 = load float, float* %d_initvalu_39, align 4
  %331 = load float, float* %eks, align 4
  %sub476 = fsub contract float %330, %331
  %mul477 = fmul contract float %mul475, %sub476
  store float %mul477, float* %I_ks_sl, align 4
  %332 = load float, float* %I_ks_junc, align 4
  %333 = load float, float* %I_ks_sl, align 4
  %add478 = fadd contract float %332, %333
  store float %add478, float* %I_ks, align 4
  %334 = load float, float* %d_initvalu_39, align 4
  %conv479 = fpext float %334 to double
  %div480 = fdiv double %conv479, 5.980000e+00
  %sub481 = fsub contract double 7.488000e+00, %div480
  %call482 = call fastcc double @_ZL3expd(double %sub481) #4
  %add483 = fadd contract double 1.000000e+00, %call482
  %div484 = fdiv double 1.000000e+00, %add483
  %conv485 = fptrunc double %div484 to float
  store float %conv485, float* %kp_kp, align 4
  %335 = load float, float* %Fjunc, align 4
  %336 = load float, float* %gkp, align 4
  %mul486 = fmul contract float %335, %336
  %337 = load float, float* %kp_kp, align 4
  %mul487 = fmul contract float %mul486, %337
  %338 = load float, float* %d_initvalu_39, align 4
  %339 = load float, float* %ek, align 4
  %sub488 = fsub contract float %338, %339
  %mul489 = fmul contract float %mul487, %sub488
  store float %mul489, float* %I_kp_junc, align 4
  %340 = load float, float* %Fsl, align 4
  %341 = load float, float* %gkp, align 4
  %mul490 = fmul contract float %340, %341
  %342 = load float, float* %kp_kp, align 4
  %mul491 = fmul contract float %mul490, %342
  %343 = load float, float* %d_initvalu_39, align 4
  %344 = load float, float* %ek, align 4
  %sub492 = fsub contract float %343, %344
  %mul493 = fmul contract float %mul491, %sub492
  store float %mul493, float* %I_kp_sl, align 4
  %345 = load float, float* %I_kp_junc, align 4
  %346 = load float, float* %I_kp_sl, align 4
  %add494 = fadd contract float %345, %346
  store float %add494, float* %I_kp, align 4
  %347 = load float, float* %d_initvalu_39, align 4
  %conv495 = fpext float %347 to double
  %add496 = fadd contract double %conv495, 3.000000e+00
  %fneg497 = fneg double %add496
  %div498 = fdiv double %fneg497, 1.500000e+01
  %call499 = call fastcc double @_ZL3expd(double %div498) #4
  %add500 = fadd contract double 1.000000e+00, %call499
  %div501 = fdiv double 1.000000e+00, %add500
  %conv502 = fptrunc double %div501 to float
  store float %conv502, float* %xtoss, align 4
  %348 = load float, float* %d_initvalu_39, align 4
  %conv503 = fpext float %348 to double
  %add504 = fadd contract double %conv503, 3.350000e+01
  %div505 = fdiv double %add504, 1.000000e+01
  %call506 = call fastcc double @_ZL3expd(double %div505) #4
  %add507 = fadd contract double 1.000000e+00, %call506
  %div508 = fdiv double 1.000000e+00, %add507
  %conv509 = fptrunc double %div508 to float
  store float %conv509, float* %ytoss, align 4
  %349 = load float, float* %d_initvalu_39, align 4
  %conv510 = fpext float %349 to double
  %add511 = fadd contract double %conv510, 3.350000e+01
  %div512 = fdiv double %add511, 1.000000e+01
  %call513 = call fastcc double @_ZL3expd(double %div512) #4
  %add514 = fadd contract double 1.000000e+00, %call513
  %div515 = fdiv double 1.000000e+00, %add514
  %conv516 = fptrunc double %div515 to float
  store float %conv516, float* %rtoss, align 4
  %350 = load float, float* %d_initvalu_39, align 4
  %conv517 = fpext float %350 to double
  %add518 = fadd contract double %conv517, 3.000000e+00
  %div519 = fdiv double %add518, 1.500000e+01
  %call520 = call fastcc double @_ZL3expd(double %div519) #4
  %add521 = fadd contract double 1.000000e+00, %call520
  %div522 = fdiv double 9.000000e+00, %add521
  %add523 = fadd contract double %div522, 5.000000e-01
  %conv524 = fptrunc double %add523 to float
  store float %conv524, float* %tauxtos, align 4
  %351 = load float, float* %d_initvalu_39, align 4
  %conv525 = fpext float %351 to double
  %add526 = fadd contract double %conv525, 6.000000e+01
  %div527 = fdiv double %add526, 1.000000e+01
  %call528 = call fastcc double @_ZL3expd(double %div527) #4
  %add529 = fadd contract double 1.000000e+00, %call528
  %div530 = fdiv double 3.000000e+03, %add529
  %add531 = fadd contract double %div530, 3.000000e+01
  %conv532 = fptrunc double %add531 to float
  store float %conv532, float* %tauytos, align 4
  %352 = load float, float* %d_initvalu_39, align 4
  %conv533 = fpext float %352 to double
  %add534 = fadd contract double %conv533, 6.000000e+01
  %div535 = fdiv double %add534, 1.000000e+01
  %call536 = call fastcc double @_ZL3expd(double %div535) #4
  %add537 = fadd contract double 1.000000e+00, %call536
  %div538 = fdiv double 2.800000e+03, %add537
  %add539 = fadd contract double %div538, 2.200000e+02
  %conv540 = fptrunc double %add539 to float
  store float %conv540, float* %taurtos, align 4
  %353 = load float, float* %xtoss, align 4
  %354 = load float, float* %d_initvalu_8, align 4
  %sub541 = fsub contract float %353, %354
  %355 = load float, float* %tauxtos, align 4
  %div542 = fdiv float %sub541, %355
  %356 = load float*, float** %d_finavalu.addr, align 8
  %357 = load i32, i32* %offset_8, align 4
  %idxprom543 = sext i32 %357 to i64
  %arrayidx544 = getelementptr inbounds float, float* %356, i64 %idxprom543
  store float %div542, float* %arrayidx544, align 4
  %358 = load float, float* %ytoss, align 4
  %359 = load float, float* %d_initvalu_9, align 4
  %sub545 = fsub contract float %358, %359
  %360 = load float, float* %tauytos, align 4
  %div546 = fdiv float %sub545, %360
  %361 = load float*, float** %d_finavalu.addr, align 8
  %362 = load i32, i32* %offset_9, align 4
  %idxprom547 = sext i32 %362 to i64
  %arrayidx548 = getelementptr inbounds float, float* %361, i64 %idxprom547
  store float %div546, float* %arrayidx548, align 4
  %363 = load float, float* %rtoss, align 4
  %364 = load float, float* %d_initvalu_40, align 4
  %sub549 = fsub contract float %363, %364
  %365 = load float, float* %taurtos, align 4
  %div550 = fdiv float %sub549, %365
  %366 = load float*, float** %d_finavalu.addr, align 8
  %367 = load i32, i32* %offset_40, align 4
  %idxprom551 = sext i32 %367 to i64
  %arrayidx552 = getelementptr inbounds float, float* %366, i64 %idxprom551
  store float %div550, float* %arrayidx552, align 4
  %368 = load float, float* %GtoSlow, align 4
  %369 = load float, float* %d_initvalu_8, align 4
  %mul553 = fmul contract float %368, %369
  %conv554 = fpext float %mul553 to double
  %370 = load float, float* %d_initvalu_9, align 4
  %conv555 = fpext float %370 to double
  %371 = load float, float* %d_initvalu_40, align 4
  %conv556 = fpext float %371 to double
  %mul557 = fmul contract double 5.000000e-01, %conv556
  %add558 = fadd contract double %conv555, %mul557
  %mul559 = fmul contract double %conv554, %add558
  %372 = load float, float* %d_initvalu_39, align 4
  %373 = load float, float* %ek, align 4
  %sub560 = fsub contract float %372, %373
  %conv561 = fpext float %sub560 to double
  %mul562 = fmul contract double %mul559, %conv561
  %conv563 = fptrunc double %mul562 to float
  store float %conv563, float* %I_tos, align 4
  %374 = load float, float* %d_initvalu_39, align 4
  %fneg564 = fneg float %374
  %375 = load float, float* %d_initvalu_39, align 4
  %mul565 = fmul contract float %fneg564, %375
  %div566 = fdiv float %mul565, 3.000000e+01
  %div567 = fdiv float %div566, 3.000000e+01
  %call568 = call fastcc float @_ZL3expf(float %div567) #4
  %conv569 = fpext float %call568 to double
  %mul570 = fmul contract double 3.500000e+00, %conv569
  %add571 = fadd contract double %mul570, 1.500000e+00
  %conv572 = fptrunc double %add571 to float
  store float %conv572, float* %tauxtof, align 4
  %376 = load float, float* %d_initvalu_39, align 4
  %conv573 = fpext float %376 to double
  %add574 = fadd contract double %conv573, 3.350000e+01
  %div575 = fdiv double %add574, 1.000000e+01
  %call576 = call fastcc double @_ZL3expd(double %div575) #4
  %add577 = fadd contract double 1.000000e+00, %call576
  %div578 = fdiv double 2.000000e+01, %add577
  %add579 = fadd contract double %div578, 2.000000e+01
  %conv580 = fptrunc double %add579 to float
  store float %conv580, float* %tauytof, align 4
  %377 = load float, float* %xtoss, align 4
  %378 = load float, float* %d_initvalu_10, align 4
  %sub581 = fsub contract float %377, %378
  %379 = load float, float* %tauxtof, align 4
  %div582 = fdiv float %sub581, %379
  %380 = load float*, float** %d_finavalu.addr, align 8
  %381 = load i32, i32* %offset_10, align 4
  %idxprom583 = sext i32 %381 to i64
  %arrayidx584 = getelementptr inbounds float, float* %380, i64 %idxprom583
  store float %div582, float* %arrayidx584, align 4
  %382 = load float, float* %ytoss, align 4
  %383 = load float, float* %d_initvalu_11, align 4
  %sub585 = fsub contract float %382, %383
  %384 = load float, float* %tauytof, align 4
  %div586 = fdiv float %sub585, %384
  %385 = load float*, float** %d_finavalu.addr, align 8
  %386 = load i32, i32* %offset_11, align 4
  %idxprom587 = sext i32 %386 to i64
  %arrayidx588 = getelementptr inbounds float, float* %385, i64 %idxprom587
  store float %div586, float* %arrayidx588, align 4
  %387 = load float, float* %GtoFast, align 4
  %388 = load float, float* %d_initvalu_10, align 4
  %mul589 = fmul contract float %387, %388
  %389 = load float, float* %d_initvalu_11, align 4
  %mul590 = fmul contract float %mul589, %389
  %390 = load float, float* %d_initvalu_39, align 4
  %391 = load float, float* %ek, align 4
  %sub591 = fsub contract float %390, %391
  %mul592 = fmul contract float %mul590, %sub591
  store float %mul592, float* %I_tof, align 4
  %392 = load float, float* %I_tos, align 4
  %393 = load float, float* %I_tof, align 4
  %add593 = fadd contract float %392, %393
  store float %add593, float* %I_to, align 4
  %394 = load float, float* %d_initvalu_39, align 4
  %395 = load float, float* %ek, align 4
  %sub594 = fsub contract float %394, %395
  %conv595 = fpext float %sub594 to double
  %sub596 = fsub contract double %conv595, 5.921500e+01
  %mul597 = fmul contract double 2.385000e-01, %sub596
  %call598 = call fastcc double @_ZL3expd(double %mul597) #4
  %add599 = fadd contract double 1.000000e+00, %call598
  %div600 = fdiv double 1.020000e+00, %add599
  %conv601 = fptrunc double %div600 to float
  store float %conv601, float* %aki, align 4
  %396 = load float, float* %d_initvalu_39, align 4
  %conv602 = fpext float %396 to double
  %add603 = fadd contract double %conv602, 5.476000e+00
  %397 = load float, float* %ek, align 4
  %conv604 = fpext float %397 to double
  %sub605 = fsub contract double %add603, %conv604
  %mul606 = fmul contract double 8.032000e-02, %sub605
  %call607 = call fastcc double @_ZL3expd(double %mul606) #4
  %mul608 = fmul contract double 4.912400e-01, %call607
  %398 = load float, float* %d_initvalu_39, align 4
  %399 = load float, float* %ek, align 4
  %sub609 = fsub contract float %398, %399
  %conv610 = fpext float %sub609 to double
  %sub611 = fsub contract double %conv610, 5.943100e+02
  %mul612 = fmul contract double 6.175000e-02, %sub611
  %call613 = call fastcc double @_ZL3expd(double %mul612) #4
  %add614 = fadd contract double %mul608, %call613
  %400 = load float, float* %d_initvalu_39, align 4
  %401 = load float, float* %ek, align 4
  %sub615 = fsub contract float %400, %401
  %conv616 = fpext float %sub615 to double
  %add617 = fadd contract double %conv616, 4.753000e+00
  %mul618 = fmul contract double -5.143000e-01, %add617
  %call619 = call fastcc double @_ZL3expd(double %mul618) #4
  %add620 = fadd contract double 1.000000e+00, %call619
  %div621 = fdiv double %add614, %add620
  %conv622 = fptrunc double %div621 to float
  store float %conv622, float* %bki, align 4
  %402 = load float, float* %aki, align 4
  %403 = load float, float* %aki, align 4
  %404 = load float, float* %bki, align 4
  %add623 = fadd contract float %403, %404
  %div624 = fdiv float %402, %add623
  store float %div624, float* %kiss, align 4
  %405 = load float, float* %Ko, align 4
  %conv625 = fpext float %405 to double
  %div626 = fdiv double %conv625, 5.400000e+00
  %call627 = call fastcc double @_ZL4sqrtd(double %div626) #4
  %mul628 = fmul contract double 9.000000e-01, %call627
  %406 = load float, float* %kiss, align 4
  %conv629 = fpext float %406 to double
  %mul630 = fmul contract double %mul628, %conv629
  %407 = load float, float* %d_initvalu_39, align 4
  %408 = load float, float* %ek, align 4
  %sub631 = fsub contract float %407, %408
  %conv632 = fpext float %sub631 to double
  %mul633 = fmul contract double %mul630, %conv632
  %conv634 = fptrunc double %mul633 to float
  store float %conv634, float* %I_ki, align 4
  %409 = load float, float* %Fjunc, align 4
  %410 = load float, float* %GClCa, align 4
  %mul635 = fmul contract float %409, %410
  %411 = load float, float* %KdClCa, align 4
  %412 = load float, float* %d_initvalu_36, align 4
  %div636 = fdiv float %411, %412
  %add637 = fadd contract float 1.000000e+00, %div636
  %div638 = fdiv float %mul635, %add637
  %413 = load float, float* %d_initvalu_39, align 4
  %414 = load float, float* %ecl, align 4
  %sub639 = fsub contract float %413, %414
  %mul640 = fmul contract float %div638, %sub639
  store float %mul640, float* %I_ClCa_junc, align 4
  %415 = load float, float* %Fsl, align 4
  %416 = load float, float* %GClCa, align 4
  %mul641 = fmul contract float %415, %416
  %417 = load float, float* %KdClCa, align 4
  %418 = load float, float* %d_initvalu_37, align 4
  %div642 = fdiv float %417, %418
  %add643 = fadd contract float 1.000000e+00, %div642
  %div644 = fdiv float %mul641, %add643
  %419 = load float, float* %d_initvalu_39, align 4
  %420 = load float, float* %ecl, align 4
  %sub645 = fsub contract float %419, %420
  %mul646 = fmul contract float %div644, %sub645
  store float %mul646, float* %I_ClCa_sl, align 4
  %421 = load float, float* %I_ClCa_junc, align 4
  %422 = load float, float* %I_ClCa_sl, align 4
  %add647 = fadd contract float %421, %422
  store float %add647, float* %I_ClCa, align 4
  %423 = load float, float* %GClB, align 4
  %424 = load float, float* %d_initvalu_39, align 4
  %425 = load float, float* %ecl, align 4
  %sub648 = fsub contract float %424, %425
  %mul649 = fmul contract float %423, %sub648
  store float %mul649, float* %I_Clbk, align 4
  %426 = load float, float* %d_initvalu_39, align 4
  %conv650 = fpext float %426 to double
  %add651 = fadd contract double %conv650, 1.450000e+01
  %fneg652 = fneg double %add651
  %div653 = fdiv double %fneg652, 6.000000e+00
  %call654 = call fastcc double @_ZL3expd(double %div653) #4
  %add655 = fadd contract double 1.000000e+00, %call654
  %div656 = fdiv double 1.000000e+00, %add655
  %conv657 = fptrunc double %div656 to float
  store float %conv657, float* %dss, align 4
  %427 = load float, float* %dss, align 4
  %conv658 = fpext float %427 to double
  %428 = load float, float* %d_initvalu_39, align 4
  %conv659 = fpext float %428 to double
  %add660 = fadd contract double %conv659, 1.450000e+01
  %fneg661 = fneg double %add660
  %div662 = fdiv double %fneg661, 6.000000e+00
  %call663 = call fastcc double @_ZL3expd(double %div662) #4
  %sub664 = fsub contract double 1.000000e+00, %call663
  %mul665 = fmul contract double %conv658, %sub664
  %429 = load float, float* %d_initvalu_39, align 4
  %conv666 = fpext float %429 to double
  %add667 = fadd contract double %conv666, 1.450000e+01
  %mul668 = fmul contract double 3.500000e-02, %add667
  %div669 = fdiv double %mul665, %mul668
  %conv670 = fptrunc double %div669 to float
  store float %conv670, float* %taud, align 4
  %430 = load float, float* %d_initvalu_39, align 4
  %conv671 = fpext float %430 to double
  %add672 = fadd contract double %conv671, 3.506000e+01
  %div673 = fdiv double %add672, 3.600000e+00
  %call674 = call fastcc double @_ZL3expd(double %div673) #4
  %add675 = fadd contract double 1.000000e+00, %call674
  %div676 = fdiv double 1.000000e+00, %add675
  %431 = load float, float* %d_initvalu_39, align 4
  %sub677 = fsub contract float 5.000000e+01, %431
  %div678 = fdiv float %sub677, 2.000000e+01
  %call679 = call fastcc float @_ZL3expf(float %div678) #4
  %add680 = fadd contract float 1.000000e+00, %call679
  %conv681 = fpext float %add680 to double
  %div682 = fdiv double 6.000000e-01, %conv681
  %add683 = fadd contract double %div676, %div682
  %conv684 = fptrunc double %add683 to float
  store float %conv684, float* %fss, align 4
  %432 = load float, float* %d_initvalu_39, align 4
  %conv685 = fpext float %432 to double
  %add686 = fadd contract double %conv685, 1.450000e+01
  %mul687 = fmul contract double 3.370000e-02, %add686
  %call688 = call fastcc double @_ZL3powdi(double %mul687) #4
  %fneg689 = fneg double %call688
  %call690 = call fastcc double @_ZL3expd(double %fneg689) #4
  %mul691 = fmul contract double 1.970000e-02, %call690
  %add692 = fadd contract double %mul691, 2.000000e-02
  %div693 = fdiv double 1.000000e+00, %add692
  %conv694 = fptrunc double %div693 to float
  store float %conv694, float* %tauf, align 4
  %433 = load float, float* %dss, align 4
  %434 = load float, float* %d_initvalu_4, align 4
  %sub695 = fsub contract float %433, %434
  %435 = load float, float* %taud, align 4
  %div696 = fdiv float %sub695, %435
  %436 = load float*, float** %d_finavalu.addr, align 8
  %437 = load i32, i32* %offset_4, align 4
  %idxprom697 = sext i32 %437 to i64
  %arrayidx698 = getelementptr inbounds float, float* %436, i64 %idxprom697
  store float %div696, float* %arrayidx698, align 4
  %438 = load float, float* %fss, align 4
  %439 = load float, float* %d_initvalu_5, align 4
  %sub699 = fsub contract float %438, %439
  %440 = load float, float* %tauf, align 4
  %div700 = fdiv float %sub699, %440
  %441 = load float*, float** %d_finavalu.addr, align 8
  %442 = load i32, i32* %offset_5, align 4
  %idxprom701 = sext i32 %442 to i64
  %arrayidx702 = getelementptr inbounds float, float* %441, i64 %idxprom701
  store float %div700, float* %arrayidx702, align 4
  %443 = load float, float* %d_initvalu_36, align 4
  %conv703 = fpext float %443 to double
  %mul704 = fmul contract double 1.700000e+00, %conv703
  %444 = load float, float* %d_initvalu_6, align 4
  %sub705 = fsub contract float 1.000000e+00, %444
  %conv706 = fpext float %sub705 to double
  %mul707 = fmul contract double %mul704, %conv706
  %445 = load float, float* %d_initvalu_6, align 4
  %conv708 = fpext float %445 to double
  %mul709 = fmul contract double 1.190000e-02, %conv708
  %sub710 = fsub contract double %mul707, %mul709
  %conv711 = fptrunc double %sub710 to float
  %446 = load float*, float** %d_finavalu.addr, align 8
  %447 = load i32, i32* %offset_6, align 4
  %idxprom712 = sext i32 %447 to i64
  %arrayidx713 = getelementptr inbounds float, float* %446, i64 %idxprom712
  store float %conv711, float* %arrayidx713, align 4
  %448 = load float, float* %d_initvalu_37, align 4
  %conv714 = fpext float %448 to double
  %mul715 = fmul contract double 1.700000e+00, %conv714
  %449 = load float, float* %d_initvalu_7, align 4
  %sub716 = fsub contract float 1.000000e+00, %449
  %conv717 = fpext float %sub716 to double
  %mul718 = fmul contract double %mul715, %conv717
  %450 = load float, float* %d_initvalu_7, align 4
  %conv719 = fpext float %450 to double
  %mul720 = fmul contract double 1.190000e-02, %conv719
  %sub721 = fsub contract double %mul718, %mul720
  %conv722 = fptrunc double %sub721 to float
  %451 = load float*, float** %d_finavalu.addr, align 8
  %452 = load i32, i32* %offset_7, align 4
  %idxprom723 = sext i32 %452 to i64
  %arrayidx724 = getelementptr inbounds float, float* %451, i64 %idxprom723
  store float %conv722, float* %arrayidx724, align 4
  %453 = load float, float* %pCa, align 4
  %mul725 = fmul contract float %453, 4.000000e+00
  %454 = load float, float* %d_initvalu_39, align 4
  %455 = load float, float* %Frdy, align 4
  %mul726 = fmul contract float %454, %455
  %456 = load float, float* %FoRT, align 4
  %mul727 = fmul contract float %mul726, %456
  %mul728 = fmul contract float %mul725, %mul727
  %conv729 = fpext float %mul728 to double
  %457 = load float, float* %d_initvalu_36, align 4
  %conv730 = fpext float %457 to double
  %mul731 = fmul contract double 3.410000e-01, %conv730
  %458 = load float, float* %d_initvalu_39, align 4
  %mul732 = fmul contract float 2.000000e+00, %458
  %459 = load float, float* %FoRT, align 4
  %mul733 = fmul contract float %mul732, %459
  %call734 = call fastcc float @_ZL3expf(float %mul733) #4
  %conv735 = fpext float %call734 to double
  %mul736 = fmul contract double %mul731, %conv735
  %460 = load float, float* %Cao, align 4
  %conv737 = fpext float %460 to double
  %mul738 = fmul contract double 3.410000e-01, %conv737
  %sub739 = fsub contract double %mul736, %mul738
  %mul740 = fmul contract double %conv729, %sub739
  %461 = load float, float* %d_initvalu_39, align 4
  %mul741 = fmul contract float 2.000000e+00, %461
  %462 = load float, float* %FoRT, align 4
  %mul742 = fmul contract float %mul741, %462
  %call743 = call fastcc float @_ZL3expf(float %mul742) #4
  %sub744 = fsub contract float %call743, 1.000000e+00
  %conv745 = fpext float %sub744 to double
  %div746 = fdiv double %mul740, %conv745
  %conv747 = fptrunc double %div746 to float
  store float %conv747, float* %ibarca_j, align 4
  %463 = load float, float* %pCa, align 4
  %mul748 = fmul contract float %463, 4.000000e+00
  %464 = load float, float* %d_initvalu_39, align 4
  %465 = load float, float* %Frdy, align 4
  %mul749 = fmul contract float %464, %465
  %466 = load float, float* %FoRT, align 4
  %mul750 = fmul contract float %mul749, %466
  %mul751 = fmul contract float %mul748, %mul750
  %conv752 = fpext float %mul751 to double
  %467 = load float, float* %d_initvalu_37, align 4
  %conv753 = fpext float %467 to double
  %mul754 = fmul contract double 3.410000e-01, %conv753
  %468 = load float, float* %d_initvalu_39, align 4
  %mul755 = fmul contract float 2.000000e+00, %468
  %469 = load float, float* %FoRT, align 4
  %mul756 = fmul contract float %mul755, %469
  %call757 = call fastcc float @_ZL3expf(float %mul756) #4
  %conv758 = fpext float %call757 to double
  %mul759 = fmul contract double %mul754, %conv758
  %470 = load float, float* %Cao, align 4
  %conv760 = fpext float %470 to double
  %mul761 = fmul contract double 3.410000e-01, %conv760
  %sub762 = fsub contract double %mul759, %mul761
  %mul763 = fmul contract double %conv752, %sub762
  %471 = load float, float* %d_initvalu_39, align 4
  %mul764 = fmul contract float 2.000000e+00, %471
  %472 = load float, float* %FoRT, align 4
  %mul765 = fmul contract float %mul764, %472
  %call766 = call fastcc float @_ZL3expf(float %mul765) #4
  %sub767 = fsub contract float %call766, 1.000000e+00
  %conv768 = fpext float %sub767 to double
  %div769 = fdiv double %mul763, %conv768
  %conv770 = fptrunc double %div769 to float
  store float %conv770, float* %ibarca_sl, align 4
  %473 = load float, float* %pK, align 4
  %474 = load float, float* %d_initvalu_39, align 4
  %475 = load float, float* %Frdy, align 4
  %mul771 = fmul contract float %474, %475
  %476 = load float, float* %FoRT, align 4
  %mul772 = fmul contract float %mul771, %476
  %mul773 = fmul contract float %473, %mul772
  %conv774 = fpext float %mul773 to double
  %477 = load float, float* %d_initvalu_35, align 4
  %conv775 = fpext float %477 to double
  %mul776 = fmul contract double 7.500000e-01, %conv775
  %478 = load float, float* %d_initvalu_39, align 4
  %479 = load float, float* %FoRT, align 4
  %mul777 = fmul contract float %478, %479
  %call778 = call fastcc float @_ZL3expf(float %mul777) #4
  %conv779 = fpext float %call778 to double
  %mul780 = fmul contract double %mul776, %conv779
  %480 = load float, float* %Ko, align 4
  %conv781 = fpext float %480 to double
  %mul782 = fmul contract double 7.500000e-01, %conv781
  %sub783 = fsub contract double %mul780, %mul782
  %mul784 = fmul contract double %conv774, %sub783
  %481 = load float, float* %d_initvalu_39, align 4
  %482 = load float, float* %FoRT, align 4
  %mul785 = fmul contract float %481, %482
  %call786 = call fastcc float @_ZL3expf(float %mul785) #4
  %sub787 = fsub contract float %call786, 1.000000e+00
  %conv788 = fpext float %sub787 to double
  %div789 = fdiv double %mul784, %conv788
  %conv790 = fptrunc double %div789 to float
  store float %conv790, float* %ibark, align 4
  %483 = load float, float* %pNa, align 4
  %484 = load float, float* %d_initvalu_39, align 4
  %485 = load float, float* %Frdy, align 4
  %mul791 = fmul contract float %484, %485
  %486 = load float, float* %FoRT, align 4
  %mul792 = fmul contract float %mul791, %486
  %mul793 = fmul contract float %483, %mul792
  %conv794 = fpext float %mul793 to double
  %487 = load float, float* %d_initvalu_32, align 4
  %conv795 = fpext float %487 to double
  %mul796 = fmul contract double 7.500000e-01, %conv795
  %488 = load float, float* %d_initvalu_39, align 4
  %489 = load float, float* %FoRT, align 4
  %mul797 = fmul contract float %488, %489
  %call798 = call fastcc float @_ZL3expf(float %mul797) #4
  %conv799 = fpext float %call798 to double
  %mul800 = fmul contract double %mul796, %conv799
  %490 = load float, float* %Nao, align 4
  %conv801 = fpext float %490 to double
  %mul802 = fmul contract double 7.500000e-01, %conv801
  %sub803 = fsub contract double %mul800, %mul802
  %mul804 = fmul contract double %conv794, %sub803
  %491 = load float, float* %d_initvalu_39, align 4
  %492 = load float, float* %FoRT, align 4
  %mul805 = fmul contract float %491, %492
  %call806 = call fastcc float @_ZL3expf(float %mul805) #4
  %sub807 = fsub contract float %call806, 1.000000e+00
  %conv808 = fpext float %sub807 to double
  %div809 = fdiv double %mul804, %conv808
  %conv810 = fptrunc double %div809 to float
  store float %conv810, float* %ibarna_j, align 4
  %493 = load float, float* %pNa, align 4
  %494 = load float, float* %d_initvalu_39, align 4
  %495 = load float, float* %Frdy, align 4
  %mul811 = fmul contract float %494, %495
  %496 = load float, float* %FoRT, align 4
  %mul812 = fmul contract float %mul811, %496
  %mul813 = fmul contract float %493, %mul812
  %conv814 = fpext float %mul813 to double
  %497 = load float, float* %d_initvalu_33, align 4
  %conv815 = fpext float %497 to double
  %mul816 = fmul contract double 7.500000e-01, %conv815
  %498 = load float, float* %d_initvalu_39, align 4
  %499 = load float, float* %FoRT, align 4
  %mul817 = fmul contract float %498, %499
  %call818 = call fastcc float @_ZL3expf(float %mul817) #4
  %conv819 = fpext float %call818 to double
  %mul820 = fmul contract double %mul816, %conv819
  %500 = load float, float* %Nao, align 4
  %conv821 = fpext float %500 to double
  %mul822 = fmul contract double 7.500000e-01, %conv821
  %sub823 = fsub contract double %mul820, %mul822
  %mul824 = fmul contract double %conv814, %sub823
  %501 = load float, float* %d_initvalu_39, align 4
  %502 = load float, float* %FoRT, align 4
  %mul825 = fmul contract float %501, %502
  %call826 = call fastcc float @_ZL3expf(float %mul825) #4
  %sub827 = fsub contract float %call826, 1.000000e+00
  %conv828 = fpext float %sub827 to double
  %div829 = fdiv double %mul824, %conv828
  %conv830 = fptrunc double %div829 to float
  store float %conv830, float* %ibarna_sl, align 4
  %503 = load float, float* %Fjunc_CaL, align 4
  %504 = load float, float* %ibarca_j, align 4
  %mul831 = fmul contract float %503, %504
  %505 = load float, float* %d_initvalu_4, align 4
  %mul832 = fmul contract float %mul831, %505
  %506 = load float, float* %d_initvalu_5, align 4
  %mul833 = fmul contract float %mul832, %506
  %507 = load float, float* %d_initvalu_6, align 4
  %sub834 = fsub contract float 1.000000e+00, %507
  %mul835 = fmul contract float %mul833, %sub834
  %508 = load float, float* %Q10CaL, align 4
  %509 = load float, float* %Qpow, align 4
  %call836 = call fastcc float @_ZL3powff(float %508, float %509) #4
  %mul837 = fmul contract float %mul835, %call836
  %conv838 = fpext float %mul837 to double
  %mul839 = fmul contract double %conv838, 4.500000e-01
  %conv840 = fptrunc double %mul839 to float
  store float %conv840, float* %I_Ca_junc, align 4
  %510 = load float, float* %Fsl_CaL, align 4
  %511 = load float, float* %ibarca_sl, align 4
  %mul841 = fmul contract float %510, %511
  %512 = load float, float* %d_initvalu_4, align 4
  %mul842 = fmul contract float %mul841, %512
  %513 = load float, float* %d_initvalu_5, align 4
  %mul843 = fmul contract float %mul842, %513
  %514 = load float, float* %d_initvalu_7, align 4
  %sub844 = fsub contract float 1.000000e+00, %514
  %mul845 = fmul contract float %mul843, %sub844
  %515 = load float, float* %Q10CaL, align 4
  %516 = load float, float* %Qpow, align 4
  %call846 = call fastcc float @_ZL3powff(float %515, float %516) #4
  %mul847 = fmul contract float %mul845, %call846
  %conv848 = fpext float %mul847 to double
  %mul849 = fmul contract double %conv848, 4.500000e-01
  %conv850 = fptrunc double %mul849 to float
  store float %conv850, float* %I_Ca_sl, align 4
  %517 = load float, float* %I_Ca_junc, align 4
  %518 = load float, float* %I_Ca_sl, align 4
  %add851 = fadd contract float %517, %518
  store float %add851, float* %I_Ca, align 4
  %519 = load float, float* %I_Ca, align 4
  %fneg852 = fneg float %519
  %520 = load float, float* %Cmem, align 4
  %mul853 = fmul contract float %fneg852, %520
  %521 = load float, float* %Vmyo, align 4
  %mul854 = fmul contract float %521, 2.000000e+00
  %522 = load float, float* %Frdy, align 4
  %mul855 = fmul contract float %mul854, %522
  %div856 = fdiv float %mul853, %mul855
  %conv857 = fpext float %div856 to double
  %mul858 = fmul contract double %conv857, 1.000000e+03
  %conv859 = fptrunc double %mul858 to float
  %523 = load float*, float** %d_finavalu.addr, align 8
  %524 = load i32, i32* %offset_43, align 4
  %idxprom860 = sext i32 %524 to i64
  %arrayidx861 = getelementptr inbounds float, float* %523, i64 %idxprom860
  store float %conv859, float* %arrayidx861, align 4
  %525 = load float, float* %ibark, align 4
  %526 = load float, float* %d_initvalu_4, align 4
  %mul862 = fmul contract float %525, %526
  %527 = load float, float* %d_initvalu_5, align 4
  %mul863 = fmul contract float %mul862, %527
  %528 = load float, float* %Fjunc_CaL, align 4
  %529 = load float, float* %d_initvalu_6, align 4
  %sub864 = fsub contract float 1.000000e+00, %529
  %mul865 = fmul contract float %528, %sub864
  %530 = load float, float* %Fsl_CaL, align 4
  %531 = load float, float* %d_initvalu_7, align 4
  %sub866 = fsub contract float 1.000000e+00, %531
  %mul867 = fmul contract float %530, %sub866
  %add868 = fadd contract float %mul865, %mul867
  %mul869 = fmul contract float %mul863, %add868
  %532 = load float, float* %Q10CaL, align 4
  %533 = load float, float* %Qpow, align 4
  %call870 = call fastcc float @_ZL3powff(float %532, float %533) #4
  %mul871 = fmul contract float %mul869, %call870
  %conv872 = fpext float %mul871 to double
  %mul873 = fmul contract double %conv872, 4.500000e-01
  %conv874 = fptrunc double %mul873 to float
  store float %conv874, float* %I_CaK, align 4
  %534 = load float, float* %Fjunc_CaL, align 4
  %535 = load float, float* %ibarna_j, align 4
  %mul875 = fmul contract float %534, %535
  %536 = load float, float* %d_initvalu_4, align 4
  %mul876 = fmul contract float %mul875, %536
  %537 = load float, float* %d_initvalu_5, align 4
  %mul877 = fmul contract float %mul876, %537
  %538 = load float, float* %d_initvalu_6, align 4
  %sub878 = fsub contract float 1.000000e+00, %538
  %mul879 = fmul contract float %mul877, %sub878
  %539 = load float, float* %Q10CaL, align 4
  %540 = load float, float* %Qpow, align 4
  %call880 = call fastcc float @_ZL3powff(float %539, float %540) #4
  %mul881 = fmul contract float %mul879, %call880
  %conv882 = fpext float %mul881 to double
  %mul883 = fmul contract double %conv882, 4.500000e-01
  %conv884 = fptrunc double %mul883 to float
  store float %conv884, float* %I_CaNa_junc, align 4
  %541 = load float, float* %Fsl_CaL, align 4
  %542 = load float, float* %ibarna_sl, align 4
  %mul885 = fmul contract float %541, %542
  %543 = load float, float* %d_initvalu_4, align 4
  %mul886 = fmul contract float %mul885, %543
  %544 = load float, float* %d_initvalu_5, align 4
  %mul887 = fmul contract float %mul886, %544
  %545 = load float, float* %d_initvalu_7, align 4
  %sub888 = fsub contract float 1.000000e+00, %545
  %mul889 = fmul contract float %mul887, %sub888
  %546 = load float, float* %Q10CaL, align 4
  %547 = load float, float* %Qpow, align 4
  %call890 = call fastcc float @_ZL3powff(float %546, float %547) #4
  %mul891 = fmul contract float %mul889, %call890
  %conv892 = fpext float %mul891 to double
  %mul893 = fmul contract double %conv892, 4.500000e-01
  %conv894 = fptrunc double %mul893 to float
  store float %conv894, float* %I_CaNa_sl, align 4
  %548 = load float, float* %Kdact, align 4
  %549 = load float, float* %d_initvalu_36, align 4
  %div895 = fdiv float %548, %549
  %call896 = call fastcc float @_ZL3powfi(float %div895, i32 3) #4
  %add897 = fadd contract float 1.000000e+00, %call896
  %div898 = fdiv float 1.000000e+00, %add897
  store float %div898, float* %Ka_junc, align 4
  %550 = load float, float* %Kdact, align 4
  %551 = load float, float* %d_initvalu_37, align 4
  %div899 = fdiv float %550, %551
  %call900 = call fastcc float @_ZL3powfi(float %div899, i32 3) #4
  %add901 = fadd contract float 1.000000e+00, %call900
  %div902 = fdiv float 1.000000e+00, %add901
  store float %div902, float* %Ka_sl, align 4
  %552 = load float, float* %nu, align 4
  %553 = load float, float* %d_initvalu_39, align 4
  %mul903 = fmul contract float %552, %553
  %554 = load float, float* %FoRT, align 4
  %mul904 = fmul contract float %mul903, %554
  %call905 = call fastcc float @_ZL3expf(float %mul904) #4
  %555 = load float, float* %d_initvalu_32, align 4
  %call906 = call fastcc float @_ZL3powfi(float %555, i32 3) #4
  %mul907 = fmul contract float %call905, %call906
  %556 = load float, float* %Cao, align 4
  %mul908 = fmul contract float %mul907, %556
  store float %mul908, float* %s1_junc, align 4
  %557 = load float, float* %nu, align 4
  %558 = load float, float* %d_initvalu_39, align 4
  %mul909 = fmul contract float %557, %558
  %559 = load float, float* %FoRT, align 4
  %mul910 = fmul contract float %mul909, %559
  %call911 = call fastcc float @_ZL3expf(float %mul910) #4
  %560 = load float, float* %d_initvalu_33, align 4
  %call912 = call fastcc float @_ZL3powfi(float %560, i32 3) #4
  %mul913 = fmul contract float %call911, %call912
  %561 = load float, float* %Cao, align 4
  %mul914 = fmul contract float %mul913, %561
  store float %mul914, float* %s1_sl, align 4
  %562 = load float, float* %nu, align 4
  %sub915 = fsub contract float %562, 1.000000e+00
  %563 = load float, float* %d_initvalu_39, align 4
  %mul916 = fmul contract float %sub915, %563
  %564 = load float, float* %FoRT, align 4
  %mul917 = fmul contract float %mul916, %564
  %call918 = call fastcc float @_ZL3expf(float %mul917) #4
  %565 = load float, float* %Nao, align 4
  %call919 = call fastcc float @_ZL3powfi(float %565, i32 3) #4
  %mul920 = fmul contract float %call918, %call919
  %566 = load float, float* %d_initvalu_36, align 4
  %mul921 = fmul contract float %mul920, %566
  store float %mul921, float* %s2_junc, align 4
  %567 = load float, float* %KmCai, align 4
  %568 = load float, float* %Nao, align 4
  %call922 = call fastcc float @_ZL3powfi(float %568, i32 3) #4
  %mul923 = fmul contract float %567, %call922
  %569 = load float, float* %d_initvalu_32, align 4
  %570 = load float, float* %KmNai, align 4
  %div924 = fdiv float %569, %570
  %call925 = call fastcc float @_ZL3powfi(float %div924, i32 3) #4
  %add926 = fadd contract float 1.000000e+00, %call925
  %mul927 = fmul contract float %mul923, %add926
  %571 = load float, float* %KmNao, align 4
  %call928 = call fastcc float @_ZL3powfi(float %571, i32 3) #4
  %572 = load float, float* %d_initvalu_36, align 4
  %mul929 = fmul contract float %call928, %572
  %add930 = fadd contract float %mul927, %mul929
  %573 = load float, float* %KmNai, align 4
  %call931 = call fastcc float @_ZL3powfi(float %573, i32 3) #4
  %574 = load float, float* %Cao, align 4
  %mul932 = fmul contract float %call931, %574
  %575 = load float, float* %d_initvalu_36, align 4
  %576 = load float, float* %KmCai, align 4
  %div933 = fdiv float %575, %576
  %add934 = fadd contract float 1.000000e+00, %div933
  %mul935 = fmul contract float %mul932, %add934
  %add936 = fadd contract float %add930, %mul935
  %577 = load float, float* %KmCao, align 4
  %578 = load float, float* %d_initvalu_32, align 4
  %call937 = call fastcc float @_ZL3powfi(float %578, i32 3) #4
  %mul938 = fmul contract float %577, %call937
  %add939 = fadd contract float %add936, %mul938
  %579 = load float, float* %d_initvalu_32, align 4
  %call940 = call fastcc float @_ZL3powfi(float %579, i32 3) #4
  %580 = load float, float* %Cao, align 4
  %mul941 = fmul contract float %call940, %580
  %add942 = fadd contract float %add939, %mul941
  %581 = load float, float* %Nao, align 4
  %call943 = call fastcc float @_ZL3powfi(float %581, i32 3) #4
  %582 = load float, float* %d_initvalu_36, align 4
  %mul944 = fmul contract float %call943, %582
  %add945 = fadd contract float %add942, %mul944
  %583 = load float, float* %ksat, align 4
  %584 = load float, float* %nu, align 4
  %sub946 = fsub contract float %584, 1.000000e+00
  %585 = load float, float* %d_initvalu_39, align 4
  %mul947 = fmul contract float %sub946, %585
  %586 = load float, float* %FoRT, align 4
  %mul948 = fmul contract float %mul947, %586
  %call949 = call fastcc float @_ZL3expf(float %mul948) #4
  %mul950 = fmul contract float %583, %call949
  %add951 = fadd contract float 1.000000e+00, %mul950
  %mul952 = fmul contract float %add945, %add951
  store float %mul952, float* %s3_junc, align 4
  %587 = load float, float* %nu, align 4
  %sub953 = fsub contract float %587, 1.000000e+00
  %588 = load float, float* %d_initvalu_39, align 4
  %mul954 = fmul contract float %sub953, %588
  %589 = load float, float* %FoRT, align 4
  %mul955 = fmul contract float %mul954, %589
  %call956 = call fastcc float @_ZL3expf(float %mul955) #4
  %590 = load float, float* %Nao, align 4
  %call957 = call fastcc float @_ZL3powfi(float %590, i32 3) #4
  %mul958 = fmul contract float %call956, %call957
  %591 = load float, float* %d_initvalu_37, align 4
  %mul959 = fmul contract float %mul958, %591
  store float %mul959, float* %s2_sl, align 4
  %592 = load float, float* %KmCai, align 4
  %593 = load float, float* %Nao, align 4
  %call960 = call fastcc float @_ZL3powfi(float %593, i32 3) #4
  %mul961 = fmul contract float %592, %call960
  %594 = load float, float* %d_initvalu_33, align 4
  %595 = load float, float* %KmNai, align 4
  %div962 = fdiv float %594, %595
  %call963 = call fastcc float @_ZL3powfi(float %div962, i32 3) #4
  %add964 = fadd contract float 1.000000e+00, %call963
  %mul965 = fmul contract float %mul961, %add964
  %596 = load float, float* %KmNao, align 4
  %call966 = call fastcc float @_ZL3powfi(float %596, i32 3) #4
  %597 = load float, float* %d_initvalu_37, align 4
  %mul967 = fmul contract float %call966, %597
  %add968 = fadd contract float %mul965, %mul967
  %598 = load float, float* %KmNai, align 4
  %call969 = call fastcc float @_ZL3powfi(float %598, i32 3) #4
  %599 = load float, float* %Cao, align 4
  %mul970 = fmul contract float %call969, %599
  %600 = load float, float* %d_initvalu_37, align 4
  %601 = load float, float* %KmCai, align 4
  %div971 = fdiv float %600, %601
  %add972 = fadd contract float 1.000000e+00, %div971
  %mul973 = fmul contract float %mul970, %add972
  %add974 = fadd contract float %add968, %mul973
  %602 = load float, float* %KmCao, align 4
  %603 = load float, float* %d_initvalu_33, align 4
  %call975 = call fastcc float @_ZL3powfi(float %603, i32 3) #4
  %mul976 = fmul contract float %602, %call975
  %add977 = fadd contract float %add974, %mul976
  %604 = load float, float* %d_initvalu_33, align 4
  %call978 = call fastcc float @_ZL3powfi(float %604, i32 3) #4
  %605 = load float, float* %Cao, align 4
  %mul979 = fmul contract float %call978, %605
  %add980 = fadd contract float %add977, %mul979
  %606 = load float, float* %Nao, align 4
  %call981 = call fastcc float @_ZL3powfi(float %606, i32 3) #4
  %607 = load float, float* %d_initvalu_37, align 4
  %mul982 = fmul contract float %call981, %607
  %add983 = fadd contract float %add980, %mul982
  %608 = load float, float* %ksat, align 4
  %609 = load float, float* %nu, align 4
  %sub984 = fsub contract float %609, 1.000000e+00
  %610 = load float, float* %d_initvalu_39, align 4
  %mul985 = fmul contract float %sub984, %610
  %611 = load float, float* %FoRT, align 4
  %mul986 = fmul contract float %mul985, %611
  %call987 = call fastcc float @_ZL3expf(float %mul986) #4
  %mul988 = fmul contract float %608, %call987
  %add989 = fadd contract float 1.000000e+00, %mul988
  %mul990 = fmul contract float %add983, %add989
  store float %mul990, float* %s3_sl, align 4
  %612 = load float, float* %Fjunc, align 4
  %613 = load float, float* %IbarNCX, align 4
  %mul991 = fmul contract float %612, %613
  %614 = load float, float* %Q10NCX, align 4
  %615 = load float, float* %Qpow, align 4
  %call992 = call fastcc float @_ZL3powff(float %614, float %615) #4
  %mul993 = fmul contract float %mul991, %call992
  %616 = load float, float* %Ka_junc, align 4
  %mul994 = fmul contract float %mul993, %616
  %617 = load float, float* %s1_junc, align 4
  %618 = load float, float* %s2_junc, align 4
  %sub995 = fsub contract float %617, %618
  %mul996 = fmul contract float %mul994, %sub995
  %619 = load float, float* %s3_junc, align 4
  %div997 = fdiv float %mul996, %619
  store float %div997, float* %I_ncx_junc, align 4
  %620 = load float, float* %Fsl, align 4
  %621 = load float, float* %IbarNCX, align 4
  %mul998 = fmul contract float %620, %621
  %622 = load float, float* %Q10NCX, align 4
  %623 = load float, float* %Qpow, align 4
  %call999 = call fastcc float @_ZL3powff(float %622, float %623) #4
  %mul1000 = fmul contract float %mul998, %call999
  %624 = load float, float* %Ka_sl, align 4
  %mul1001 = fmul contract float %mul1000, %624
  %625 = load float, float* %s1_sl, align 4
  %626 = load float, float* %s2_sl, align 4
  %sub1002 = fsub contract float %625, %626
  %mul1003 = fmul contract float %mul1001, %sub1002
  %627 = load float, float* %s3_sl, align 4
  %div1004 = fdiv float %mul1003, %627
  store float %div1004, float* %I_ncx_sl, align 4
  %628 = load float, float* %I_ncx_junc, align 4
  %629 = load float, float* %I_ncx_sl, align 4
  %add1005 = fadd contract float %628, %629
  store float %add1005, float* %I_ncx, align 4
  %630 = load float, float* %I_ncx, align 4
  %mul1006 = fmul contract float 2.000000e+00, %630
  %631 = load float, float* %Cmem, align 4
  %mul1007 = fmul contract float %mul1006, %631
  %632 = load float, float* %Vmyo, align 4
  %mul1008 = fmul contract float %632, 2.000000e+00
  %633 = load float, float* %Frdy, align 4
  %mul1009 = fmul contract float %mul1008, %633
  %div1010 = fdiv float %mul1007, %mul1009
  %conv1011 = fpext float %div1010 to double
  %mul1012 = fmul contract double %conv1011, 1.000000e+03
  %conv1013 = fptrunc double %mul1012 to float
  %634 = load float*, float** %d_finavalu.addr, align 8
  %635 = load i32, i32* %offset_45, align 4
  %idxprom1014 = sext i32 %635 to i64
  %arrayidx1015 = getelementptr inbounds float, float* %634, i64 %idxprom1014
  store float %conv1013, float* %arrayidx1015, align 4
  %636 = load float, float* %Fjunc, align 4
  %637 = load float, float* %Q10SLCaP, align 4
  %638 = load float, float* %Qpow, align 4
  %call1016 = call fastcc float @_ZL3powff(float %637, float %638) #4
  %mul1017 = fmul contract float %636, %call1016
  %639 = load float, float* %IbarSLCaP, align 4
  %mul1018 = fmul contract float %mul1017, %639
  %640 = load float, float* %d_initvalu_36, align 4
  %call1019 = call fastcc float @_ZL3powff(float %640, float 0x3FF99999A0000000) #4
  %mul1020 = fmul contract float %mul1018, %call1019
  %641 = load float, float* %KmPCa, align 4
  %call1021 = call fastcc float @_ZL3powff(float %641, float 0x3FF99999A0000000) #4
  %642 = load float, float* %d_initvalu_36, align 4
  %call1022 = call fastcc float @_ZL3powff(float %642, float 0x3FF99999A0000000) #4
  %add1023 = fadd contract float %call1021, %call1022
  %div1024 = fdiv float %mul1020, %add1023
  store float %div1024, float* %I_pca_junc, align 4
  %643 = load float, float* %Fsl, align 4
  %644 = load float, float* %Q10SLCaP, align 4
  %645 = load float, float* %Qpow, align 4
  %call1025 = call fastcc float @_ZL3powff(float %644, float %645) #4
  %mul1026 = fmul contract float %643, %call1025
  %646 = load float, float* %IbarSLCaP, align 4
  %mul1027 = fmul contract float %mul1026, %646
  %647 = load float, float* %d_initvalu_37, align 4
  %call1028 = call fastcc float @_ZL3powff(float %647, float 0x3FF99999A0000000) #4
  %mul1029 = fmul contract float %mul1027, %call1028
  %648 = load float, float* %KmPCa, align 4
  %call1030 = call fastcc float @_ZL3powff(float %648, float 0x3FF99999A0000000) #4
  %649 = load float, float* %d_initvalu_37, align 4
  %call1031 = call fastcc float @_ZL3powff(float %649, float 0x3FF99999A0000000) #4
  %add1032 = fadd contract float %call1030, %call1031
  %div1033 = fdiv float %mul1029, %add1032
  store float %div1033, float* %I_pca_sl, align 4
  %650 = load float, float* %I_pca_junc, align 4
  %651 = load float, float* %I_pca_sl, align 4
  %add1034 = fadd contract float %650, %651
  store float %add1034, float* %I_pca, align 4
  %652 = load float, float* %I_pca, align 4
  %fneg1035 = fneg float %652
  %653 = load float, float* %Cmem, align 4
  %mul1036 = fmul contract float %fneg1035, %653
  %654 = load float, float* %Vmyo, align 4
  %mul1037 = fmul contract float %654, 2.000000e+00
  %655 = load float, float* %Frdy, align 4
  %mul1038 = fmul contract float %mul1037, %655
  %div1039 = fdiv float %mul1036, %mul1038
  %conv1040 = fpext float %div1039 to double
  %mul1041 = fmul contract double %conv1040, 1.000000e+03
  %conv1042 = fptrunc double %mul1041 to float
  %656 = load float*, float** %d_finavalu.addr, align 8
  %657 = load i32, i32* %offset_44, align 4
  %idxprom1043 = sext i32 %657 to i64
  %arrayidx1044 = getelementptr inbounds float, float* %656, i64 %idxprom1043
  store float %conv1042, float* %arrayidx1044, align 4
  %658 = load float, float* %Fjunc, align 4
  %659 = load float, float* %GCaB, align 4
  %mul1045 = fmul contract float %658, %659
  %660 = load float, float* %d_initvalu_39, align 4
  %661 = load float, float* %eca_junc, align 4
  %sub1046 = fsub contract float %660, %661
  %mul1047 = fmul contract float %mul1045, %sub1046
  store float %mul1047, float* %I_cabk_junc, align 4
  %662 = load float, float* %Fsl, align 4
  %663 = load float, float* %GCaB, align 4
  %mul1048 = fmul contract float %662, %663
  %664 = load float, float* %d_initvalu_39, align 4
  %665 = load float, float* %eca_sl, align 4
  %sub1049 = fsub contract float %664, %665
  %mul1050 = fmul contract float %mul1048, %sub1049
  store float %mul1050, float* %I_cabk_sl, align 4
  %666 = load float, float* %I_cabk_junc, align 4
  %667 = load float, float* %I_cabk_sl, align 4
  %add1051 = fadd contract float %666, %667
  store float %add1051, float* %I_cabk, align 4
  %668 = load float, float* %I_cabk, align 4
  %fneg1052 = fneg float %668
  %669 = load float, float* %Cmem, align 4
  %mul1053 = fmul contract float %fneg1052, %669
  %670 = load float, float* %Vmyo, align 4
  %mul1054 = fmul contract float %670, 2.000000e+00
  %671 = load float, float* %Frdy, align 4
  %mul1055 = fmul contract float %mul1054, %671
  %div1056 = fdiv float %mul1053, %mul1055
  %conv1057 = fpext float %div1056 to double
  %mul1058 = fmul contract double %conv1057, 1.000000e+03
  %conv1059 = fptrunc double %mul1058 to float
  %672 = load float*, float** %d_finavalu.addr, align 8
  %673 = load i32, i32* %offset_46, align 4
  %idxprom1060 = sext i32 %673 to i64
  %arrayidx1061 = getelementptr inbounds float, float* %672, i64 %idxprom1060
  store float %conv1059, float* %arrayidx1061, align 4
  store float 1.500000e+01, float* %MaxSR, align 4
  store float 1.000000e+00, float* %MinSR, align 4
  %674 = load float, float* %MaxSR, align 4
  %675 = load float, float* %MaxSR, align 4
  %676 = load float, float* %MinSR, align 4
  %sub1062 = fsub contract float %675, %676
  %677 = load float, float* %ec50SR, align 4
  %678 = load float, float* %d_initvalu_31, align 4
  %div1063 = fdiv float %677, %678
  %call1064 = call fastcc float @_ZL3powff(float %div1063, float 2.500000e+00) #4
  %add1065 = fadd contract float 1.000000e+00, %call1064
  %div1066 = fdiv float %sub1062, %add1065
  %sub1067 = fsub contract float %674, %div1066
  store float %sub1067, float* %kCaSR, align 4
  %679 = load float, float* %koCa, align 4
  %680 = load float, float* %kCaSR, align 4
  %div1068 = fdiv float %679, %680
  store float %div1068, float* %koSRCa, align 4
  %681 = load float, float* %kiCa, align 4
  %682 = load float, float* %kCaSR, align 4
  %mul1069 = fmul contract float %681, %682
  store float %mul1069, float* %kiSRCa, align 4
  %683 = load float, float* %d_initvalu_14, align 4
  %sub1070 = fsub contract float 1.000000e+00, %683
  %684 = load float, float* %d_initvalu_15, align 4
  %sub1071 = fsub contract float %sub1070, %684
  %685 = load float, float* %d_initvalu_16, align 4
  %sub1072 = fsub contract float %sub1071, %685
  store float %sub1072, float* %RI, align 4
  %686 = load float, float* %kim, align 4
  %687 = load float, float* %RI, align 4
  %mul1073 = fmul contract float %686, %687
  %688 = load float, float* %kiSRCa, align 4
  %689 = load float, float* %d_initvalu_36, align 4
  %mul1074 = fmul contract float %688, %689
  %690 = load float, float* %d_initvalu_14, align 4
  %mul1075 = fmul contract float %mul1074, %690
  %sub1076 = fsub contract float %mul1073, %mul1075
  %691 = load float, float* %koSRCa, align 4
  %692 = load float, float* %d_initvalu_36, align 4
  %call1077 = call fastcc float @_ZL3powfi(float %692, i32 2) #4
  %mul1078 = fmul contract float %691, %call1077
  %693 = load float, float* %d_initvalu_14, align 4
  %mul1079 = fmul contract float %mul1078, %693
  %694 = load float, float* %kom, align 4
  %695 = load float, float* %d_initvalu_15, align 4
  %mul1080 = fmul contract float %694, %695
  %sub1081 = fsub contract float %mul1079, %mul1080
  %sub1082 = fsub contract float %sub1076, %sub1081
  %696 = load float*, float** %d_finavalu.addr, align 8
  %697 = load i32, i32* %offset_14, align 4
  %idxprom1083 = sext i32 %697 to i64
  %arrayidx1084 = getelementptr inbounds float, float* %696, i64 %idxprom1083
  store float %sub1082, float* %arrayidx1084, align 4
  %698 = load float, float* %koSRCa, align 4
  %699 = load float, float* %d_initvalu_36, align 4
  %call1085 = call fastcc float @_ZL3powfi(float %699, i32 2) #4
  %mul1086 = fmul contract float %698, %call1085
  %700 = load float, float* %d_initvalu_14, align 4
  %mul1087 = fmul contract float %mul1086, %700
  %701 = load float, float* %kom, align 4
  %702 = load float, float* %d_initvalu_15, align 4
  %mul1088 = fmul contract float %701, %702
  %sub1089 = fsub contract float %mul1087, %mul1088
  %703 = load float, float* %kiSRCa, align 4
  %704 = load float, float* %d_initvalu_36, align 4
  %mul1090 = fmul contract float %703, %704
  %705 = load float, float* %d_initvalu_15, align 4
  %mul1091 = fmul contract float %mul1090, %705
  %706 = load float, float* %kim, align 4
  %707 = load float, float* %d_initvalu_16, align 4
  %mul1092 = fmul contract float %706, %707
  %sub1093 = fsub contract float %mul1091, %mul1092
  %sub1094 = fsub contract float %sub1089, %sub1093
  %708 = load float*, float** %d_finavalu.addr, align 8
  %709 = load i32, i32* %offset_15, align 4
  %idxprom1095 = sext i32 %709 to i64
  %arrayidx1096 = getelementptr inbounds float, float* %708, i64 %idxprom1095
  store float %sub1094, float* %arrayidx1096, align 4
  %710 = load float, float* %kiSRCa, align 4
  %711 = load float, float* %d_initvalu_36, align 4
  %mul1097 = fmul contract float %710, %711
  %712 = load float, float* %d_initvalu_15, align 4
  %mul1098 = fmul contract float %mul1097, %712
  %713 = load float, float* %kim, align 4
  %714 = load float, float* %d_initvalu_16, align 4
  %mul1099 = fmul contract float %713, %714
  %sub1100 = fsub contract float %mul1098, %mul1099
  %715 = load float, float* %kom, align 4
  %716 = load float, float* %d_initvalu_16, align 4
  %mul1101 = fmul contract float %715, %716
  %717 = load float, float* %koSRCa, align 4
  %718 = load float, float* %d_initvalu_36, align 4
  %call1102 = call fastcc float @_ZL3powfi(float %718, i32 2) #4
  %mul1103 = fmul contract float %717, %call1102
  %719 = load float, float* %RI, align 4
  %mul1104 = fmul contract float %mul1103, %719
  %sub1105 = fsub contract float %mul1101, %mul1104
  %sub1106 = fsub contract float %sub1100, %sub1105
  %720 = load float*, float** %d_finavalu.addr, align 8
  %721 = load i32, i32* %offset_16, align 4
  %idxprom1107 = sext i32 %721 to i64
  %arrayidx1108 = getelementptr inbounds float, float* %720, i64 %idxprom1107
  store float %sub1106, float* %arrayidx1108, align 4
  %722 = load float, float* %ks, align 4
  %723 = load float, float* %d_initvalu_15, align 4
  %mul1109 = fmul contract float %722, %723
  %724 = load float, float* %d_initvalu_31, align 4
  %725 = load float, float* %d_initvalu_36, align 4
  %sub1110 = fsub contract float %724, %725
  %mul1111 = fmul contract float %mul1109, %sub1110
  store float %mul1111, float* %J_SRCarel, align 4
  %726 = load float, float* %Q10SRCaP, align 4
  %727 = load float, float* %Qpow, align 4
  %call1112 = call fastcc float @_ZL3powff(float %726, float %727) #4
  %728 = load float, float* %Vmax_SRCaP, align 4
  %mul1113 = fmul contract float %call1112, %728
  %729 = load float, float* %d_initvalu_38, align 4
  %730 = load float, float* %Kmf, align 4
  %div1114 = fdiv float %729, %730
  %731 = load float, float* %hillSRCaP, align 4
  %call1115 = call fastcc float @_ZL3powff(float %div1114, float %731) #4
  %732 = load float, float* %d_initvalu_31, align 4
  %733 = load float, float* %Kmr, align 4
  %div1116 = fdiv float %732, %733
  %734 = load float, float* %hillSRCaP, align 4
  %call1117 = call fastcc float @_ZL3powff(float %div1116, float %734) #4
  %sub1118 = fsub contract float %call1115, %call1117
  %mul1119 = fmul contract float %mul1113, %sub1118
  %735 = load float, float* %d_initvalu_38, align 4
  %736 = load float, float* %Kmf, align 4
  %div1120 = fdiv float %735, %736
  %737 = load float, float* %hillSRCaP, align 4
  %call1121 = call fastcc float @_ZL3powff(float %div1120, float %737) #4
  %add1122 = fadd contract float 1.000000e+00, %call1121
  %738 = load float, float* %d_initvalu_31, align 4
  %739 = load float, float* %Kmr, align 4
  %div1123 = fdiv float %738, %739
  %740 = load float, float* %hillSRCaP, align 4
  %call1124 = call fastcc float @_ZL3powff(float %div1123, float %740) #4
  %add1125 = fadd contract float %add1122, %call1124
  %div1126 = fdiv float %mul1119, %add1125
  store float %div1126, float* %J_serca, align 4
  %741 = load float, float* %d_initvalu_31, align 4
  %742 = load float, float* %d_initvalu_36, align 4
  %sub1127 = fsub contract float %741, %742
  %conv1128 = fpext float %sub1127 to double
  %mul1129 = fmul contract double 5.348000e-06, %conv1128
  %conv1130 = fptrunc double %mul1129 to float
  store float %conv1130, float* %J_SRleak, align 4
  %743 = load float, float* %kon_na, align 4
  %744 = load float, float* %d_initvalu_32, align 4
  %mul1131 = fmul contract float %743, %744
  %745 = load float, float* %Bmax_Naj, align 4
  %746 = load float, float* %d_initvalu_17, align 4
  %sub1132 = fsub contract float %745, %746
  %mul1133 = fmul contract float %mul1131, %sub1132
  %747 = load float, float* %koff_na, align 4
  %748 = load float, float* %d_initvalu_17, align 4
  %mul1134 = fmul contract float %747, %748
  %sub1135 = fsub contract float %mul1133, %mul1134
  %749 = load float*, float** %d_finavalu.addr, align 8
  %750 = load i32, i32* %offset_17, align 4
  %idxprom1136 = sext i32 %750 to i64
  %arrayidx1137 = getelementptr inbounds float, float* %749, i64 %idxprom1136
  store float %sub1135, float* %arrayidx1137, align 4
  %751 = load float, float* %kon_na, align 4
  %752 = load float, float* %d_initvalu_33, align 4
  %mul1138 = fmul contract float %751, %752
  %753 = load float, float* %Bmax_Nasl, align 4
  %754 = load float, float* %d_initvalu_18, align 4
  %sub1139 = fsub contract float %753, %754
  %mul1140 = fmul contract float %mul1138, %sub1139
  %755 = load float, float* %koff_na, align 4
  %756 = load float, float* %d_initvalu_18, align 4
  %mul1141 = fmul contract float %755, %756
  %sub1142 = fsub contract float %mul1140, %mul1141
  %757 = load float*, float** %d_finavalu.addr, align 8
  %758 = load i32, i32* %offset_18, align 4
  %idxprom1143 = sext i32 %758 to i64
  %arrayidx1144 = getelementptr inbounds float, float* %757, i64 %idxprom1143
  store float %sub1142, float* %arrayidx1144, align 4
  %759 = load float, float* %kon_tncl, align 4
  %760 = load float, float* %d_initvalu_38, align 4
  %mul1145 = fmul contract float %759, %760
  %761 = load float, float* %Bmax_TnClow, align 4
  %762 = load float, float* %d_initvalu_19, align 4
  %sub1146 = fsub contract float %761, %762
  %mul1147 = fmul contract float %mul1145, %sub1146
  %763 = load float, float* %koff_tncl, align 4
  %764 = load float, float* %d_initvalu_19, align 4
  %mul1148 = fmul contract float %763, %764
  %sub1149 = fsub contract float %mul1147, %mul1148
  %765 = load float*, float** %d_finavalu.addr, align 8
  %766 = load i32, i32* %offset_19, align 4
  %idxprom1150 = sext i32 %766 to i64
  %arrayidx1151 = getelementptr inbounds float, float* %765, i64 %idxprom1150
  store float %sub1149, float* %arrayidx1151, align 4
  %767 = load float, float* %kon_tnchca, align 4
  %768 = load float, float* %d_initvalu_38, align 4
  %mul1152 = fmul contract float %767, %768
  %769 = load float, float* %Bmax_TnChigh, align 4
  %770 = load float, float* %d_initvalu_20, align 4
  %sub1153 = fsub contract float %769, %770
  %771 = load float, float* %d_initvalu_21, align 4
  %sub1154 = fsub contract float %sub1153, %771
  %mul1155 = fmul contract float %mul1152, %sub1154
  %772 = load float, float* %koff_tnchca, align 4
  %773 = load float, float* %d_initvalu_20, align 4
  %mul1156 = fmul contract float %772, %773
  %sub1157 = fsub contract float %mul1155, %mul1156
  %774 = load float*, float** %d_finavalu.addr, align 8
  %775 = load i32, i32* %offset_20, align 4
  %idxprom1158 = sext i32 %775 to i64
  %arrayidx1159 = getelementptr inbounds float, float* %774, i64 %idxprom1158
  store float %sub1157, float* %arrayidx1159, align 4
  %776 = load float, float* %kon_tnchmg, align 4
  %777 = load float, float* %Mgi, align 4
  %mul1160 = fmul contract float %776, %777
  %778 = load float, float* %Bmax_TnChigh, align 4
  %779 = load float, float* %d_initvalu_20, align 4
  %sub1161 = fsub contract float %778, %779
  %780 = load float, float* %d_initvalu_21, align 4
  %sub1162 = fsub contract float %sub1161, %780
  %mul1163 = fmul contract float %mul1160, %sub1162
  %781 = load float, float* %koff_tnchmg, align 4
  %782 = load float, float* %d_initvalu_21, align 4
  %mul1164 = fmul contract float %781, %782
  %sub1165 = fsub contract float %mul1163, %mul1164
  %783 = load float*, float** %d_finavalu.addr, align 8
  %784 = load i32, i32* %offset_21, align 4
  %idxprom1166 = sext i32 %784 to i64
  %arrayidx1167 = getelementptr inbounds float, float* %783, i64 %idxprom1166
  store float %sub1165, float* %arrayidx1167, align 4
  %785 = load float*, float** %d_finavalu.addr, align 8
  %786 = load i32, i32* %offset_22, align 4
  %idxprom1168 = sext i32 %786 to i64
  %arrayidx1169 = getelementptr inbounds float, float* %785, i64 %idxprom1168
  store float 0.000000e+00, float* %arrayidx1169, align 4
  %787 = load float, float* %kon_myoca, align 4
  %788 = load float, float* %d_initvalu_38, align 4
  %mul1170 = fmul contract float %787, %788
  %789 = load float, float* %Bmax_myosin, align 4
  %790 = load float, float* %d_initvalu_23, align 4
  %sub1171 = fsub contract float %789, %790
  %791 = load float, float* %d_initvalu_24, align 4
  %sub1172 = fsub contract float %sub1171, %791
  %mul1173 = fmul contract float %mul1170, %sub1172
  %792 = load float, float* %koff_myoca, align 4
  %793 = load float, float* %d_initvalu_23, align 4
  %mul1174 = fmul contract float %792, %793
  %sub1175 = fsub contract float %mul1173, %mul1174
  %794 = load float*, float** %d_finavalu.addr, align 8
  %795 = load i32, i32* %offset_23, align 4
  %idxprom1176 = sext i32 %795 to i64
  %arrayidx1177 = getelementptr inbounds float, float* %794, i64 %idxprom1176
  store float %sub1175, float* %arrayidx1177, align 4
  %796 = load float, float* %kon_myomg, align 4
  %797 = load float, float* %Mgi, align 4
  %mul1178 = fmul contract float %796, %797
  %798 = load float, float* %Bmax_myosin, align 4
  %799 = load float, float* %d_initvalu_23, align 4
  %sub1179 = fsub contract float %798, %799
  %800 = load float, float* %d_initvalu_24, align 4
  %sub1180 = fsub contract float %sub1179, %800
  %mul1181 = fmul contract float %mul1178, %sub1180
  %801 = load float, float* %koff_myomg, align 4
  %802 = load float, float* %d_initvalu_24, align 4
  %mul1182 = fmul contract float %801, %802
  %sub1183 = fsub contract float %mul1181, %mul1182
  %803 = load float*, float** %d_finavalu.addr, align 8
  %804 = load i32, i32* %offset_24, align 4
  %idxprom1184 = sext i32 %804 to i64
  %arrayidx1185 = getelementptr inbounds float, float* %803, i64 %idxprom1184
  store float %sub1183, float* %arrayidx1185, align 4
  %805 = load float, float* %kon_sr, align 4
  %806 = load float, float* %d_initvalu_38, align 4
  %mul1186 = fmul contract float %805, %806
  %807 = load float, float* %Bmax_SR, align 4
  %808 = load float, float* %d_initvalu_25, align 4
  %sub1187 = fsub contract float %807, %808
  %mul1188 = fmul contract float %mul1186, %sub1187
  %809 = load float, float* %koff_sr, align 4
  %810 = load float, float* %d_initvalu_25, align 4
  %mul1189 = fmul contract float %809, %810
  %sub1190 = fsub contract float %mul1188, %mul1189
  %811 = load float*, float** %d_finavalu.addr, align 8
  %812 = load i32, i32* %offset_25, align 4
  %idxprom1191 = sext i32 %812 to i64
  %arrayidx1192 = getelementptr inbounds float, float* %811, i64 %idxprom1191
  store float %sub1190, float* %arrayidx1192, align 4
  %813 = load float*, float** %d_finavalu.addr, align 8
  %814 = load i32, i32* %offset_19, align 4
  %idxprom1193 = sext i32 %814 to i64
  %arrayidx1194 = getelementptr inbounds float, float* %813, i64 %idxprom1193
  %815 = load float, float* %arrayidx1194, align 4
  %816 = load float*, float** %d_finavalu.addr, align 8
  %817 = load i32, i32* %offset_20, align 4
  %idxprom1195 = sext i32 %817 to i64
  %arrayidx1196 = getelementptr inbounds float, float* %816, i64 %idxprom1195
  %818 = load float, float* %arrayidx1196, align 4
  %add1197 = fadd contract float %815, %818
  %819 = load float*, float** %d_finavalu.addr, align 8
  %820 = load i32, i32* %offset_21, align 4
  %idxprom1198 = sext i32 %820 to i64
  %arrayidx1199 = getelementptr inbounds float, float* %819, i64 %idxprom1198
  %821 = load float, float* %arrayidx1199, align 4
  %add1200 = fadd contract float %add1197, %821
  %822 = load float*, float** %d_finavalu.addr, align 8
  %823 = load i32, i32* %offset_22, align 4
  %idxprom1201 = sext i32 %823 to i64
  %arrayidx1202 = getelementptr inbounds float, float* %822, i64 %idxprom1201
  %824 = load float, float* %arrayidx1202, align 4
  %add1203 = fadd contract float %add1200, %824
  %825 = load float*, float** %d_finavalu.addr, align 8
  %826 = load i32, i32* %offset_23, align 4
  %idxprom1204 = sext i32 %826 to i64
  %arrayidx1205 = getelementptr inbounds float, float* %825, i64 %idxprom1204
  %827 = load float, float* %arrayidx1205, align 4
  %add1206 = fadd contract float %add1203, %827
  %828 = load float*, float** %d_finavalu.addr, align 8
  %829 = load i32, i32* %offset_24, align 4
  %idxprom1207 = sext i32 %829 to i64
  %arrayidx1208 = getelementptr inbounds float, float* %828, i64 %idxprom1207
  %830 = load float, float* %arrayidx1208, align 4
  %add1209 = fadd contract float %add1206, %830
  %831 = load float*, float** %d_finavalu.addr, align 8
  %832 = load i32, i32* %offset_25, align 4
  %idxprom1210 = sext i32 %832 to i64
  %arrayidx1211 = getelementptr inbounds float, float* %831, i64 %idxprom1210
  %833 = load float, float* %arrayidx1211, align 4
  %add1212 = fadd contract float %add1209, %833
  store float %add1212, float* %J_CaB_cytosol, align 4
  %834 = load float, float* %kon_sll, align 4
  %835 = load float, float* %d_initvalu_36, align 4
  %mul1213 = fmul contract float %834, %835
  %836 = load float, float* %Bmax_SLlowj, align 4
  %837 = load float, float* %d_initvalu_26, align 4
  %sub1214 = fsub contract float %836, %837
  %mul1215 = fmul contract float %mul1213, %sub1214
  %838 = load float, float* %koff_sll, align 4
  %839 = load float, float* %d_initvalu_26, align 4
  %mul1216 = fmul contract float %838, %839
  %sub1217 = fsub contract float %mul1215, %mul1216
  %840 = load float*, float** %d_finavalu.addr, align 8
  %841 = load i32, i32* %offset_26, align 4
  %idxprom1218 = sext i32 %841 to i64
  %arrayidx1219 = getelementptr inbounds float, float* %840, i64 %idxprom1218
  store float %sub1217, float* %arrayidx1219, align 4
  %842 = load float, float* %kon_sll, align 4
  %843 = load float, float* %d_initvalu_37, align 4
  %mul1220 = fmul contract float %842, %843
  %844 = load float, float* %Bmax_SLlowsl, align 4
  %845 = load float, float* %d_initvalu_27, align 4
  %sub1221 = fsub contract float %844, %845
  %mul1222 = fmul contract float %mul1220, %sub1221
  %846 = load float, float* %koff_sll, align 4
  %847 = load float, float* %d_initvalu_27, align 4
  %mul1223 = fmul contract float %846, %847
  %sub1224 = fsub contract float %mul1222, %mul1223
  %848 = load float*, float** %d_finavalu.addr, align 8
  %849 = load i32, i32* %offset_27, align 4
  %idxprom1225 = sext i32 %849 to i64
  %arrayidx1226 = getelementptr inbounds float, float* %848, i64 %idxprom1225
  store float %sub1224, float* %arrayidx1226, align 4
  %850 = load float, float* %kon_slh, align 4
  %851 = load float, float* %d_initvalu_36, align 4
  %mul1227 = fmul contract float %850, %851
  %852 = load float, float* %Bmax_SLhighj, align 4
  %853 = load float, float* %d_initvalu_28, align 4
  %sub1228 = fsub contract float %852, %853
  %mul1229 = fmul contract float %mul1227, %sub1228
  %854 = load float, float* %koff_slh, align 4
  %855 = load float, float* %d_initvalu_28, align 4
  %mul1230 = fmul contract float %854, %855
  %sub1231 = fsub contract float %mul1229, %mul1230
  %856 = load float*, float** %d_finavalu.addr, align 8
  %857 = load i32, i32* %offset_28, align 4
  %idxprom1232 = sext i32 %857 to i64
  %arrayidx1233 = getelementptr inbounds float, float* %856, i64 %idxprom1232
  store float %sub1231, float* %arrayidx1233, align 4
  %858 = load float, float* %kon_slh, align 4
  %859 = load float, float* %d_initvalu_37, align 4
  %mul1234 = fmul contract float %858, %859
  %860 = load float, float* %Bmax_SLhighsl, align 4
  %861 = load float, float* %d_initvalu_29, align 4
  %sub1235 = fsub contract float %860, %861
  %mul1236 = fmul contract float %mul1234, %sub1235
  %862 = load float, float* %koff_slh, align 4
  %863 = load float, float* %d_initvalu_29, align 4
  %mul1237 = fmul contract float %862, %863
  %sub1238 = fsub contract float %mul1236, %mul1237
  %864 = load float*, float** %d_finavalu.addr, align 8
  %865 = load i32, i32* %offset_29, align 4
  %idxprom1239 = sext i32 %865 to i64
  %arrayidx1240 = getelementptr inbounds float, float* %864, i64 %idxprom1239
  store float %sub1238, float* %arrayidx1240, align 4
  %866 = load float*, float** %d_finavalu.addr, align 8
  %867 = load i32, i32* %offset_26, align 4
  %idxprom1241 = sext i32 %867 to i64
  %arrayidx1242 = getelementptr inbounds float, float* %866, i64 %idxprom1241
  %868 = load float, float* %arrayidx1242, align 4
  %869 = load float*, float** %d_finavalu.addr, align 8
  %870 = load i32, i32* %offset_28, align 4
  %idxprom1243 = sext i32 %870 to i64
  %arrayidx1244 = getelementptr inbounds float, float* %869, i64 %idxprom1243
  %871 = load float, float* %arrayidx1244, align 4
  %add1245 = fadd contract float %868, %871
  store float %add1245, float* %J_CaB_junction, align 4
  %872 = load float*, float** %d_finavalu.addr, align 8
  %873 = load i32, i32* %offset_27, align 4
  %idxprom1246 = sext i32 %873 to i64
  %arrayidx1247 = getelementptr inbounds float, float* %872, i64 %idxprom1246
  %874 = load float, float* %arrayidx1247, align 4
  %875 = load float*, float** %d_finavalu.addr, align 8
  %876 = load i32, i32* %offset_29, align 4
  %idxprom1248 = sext i32 %876 to i64
  %arrayidx1249 = getelementptr inbounds float, float* %875, i64 %idxprom1248
  %877 = load float, float* %arrayidx1249, align 4
  %add1250 = fadd contract float %874, %877
  store float %add1250, float* %J_CaB_sl, align 4
  %878 = load float, float* %kon_csqn, align 4
  %879 = load float, float* %d_initvalu_31, align 4
  %mul1251 = fmul contract float %878, %879
  %880 = load float, float* %Bmax_Csqn, align 4
  %881 = load float, float* %d_initvalu_30, align 4
  %sub1252 = fsub contract float %880, %881
  %mul1253 = fmul contract float %mul1251, %sub1252
  %882 = load float, float* %koff_csqn, align 4
  %883 = load float, float* %d_initvalu_30, align 4
  %mul1254 = fmul contract float %882, %883
  %sub1255 = fsub contract float %mul1253, %mul1254
  %884 = load float*, float** %d_finavalu.addr, align 8
  %885 = load i32, i32* %offset_30, align 4
  %idxprom1256 = sext i32 %885 to i64
  %arrayidx1257 = getelementptr inbounds float, float* %884, i64 %idxprom1256
  store float %sub1255, float* %arrayidx1257, align 4
  %886 = load float, float* %Vsr, align 4
  %div1258 = fdiv float 1.000000e+00, %886
  store float %div1258, float* %oneovervsr, align 4
  %887 = load float, float* %J_serca, align 4
  %888 = load float, float* %Vmyo, align 4
  %mul1259 = fmul contract float %887, %888
  %889 = load float, float* %oneovervsr, align 4
  %mul1260 = fmul contract float %mul1259, %889
  %890 = load float, float* %J_SRleak, align 4
  %891 = load float, float* %Vmyo, align 4
  %mul1261 = fmul contract float %890, %891
  %892 = load float, float* %oneovervsr, align 4
  %mul1262 = fmul contract float %mul1261, %892
  %893 = load float, float* %J_SRCarel, align 4
  %add1263 = fadd contract float %mul1262, %893
  %sub1264 = fsub contract float %mul1260, %add1263
  %894 = load float*, float** %d_finavalu.addr, align 8
  %895 = load i32, i32* %offset_30, align 4
  %idxprom1265 = sext i32 %895 to i64
  %arrayidx1266 = getelementptr inbounds float, float* %894, i64 %idxprom1265
  %896 = load float, float* %arrayidx1266, align 4
  %sub1267 = fsub contract float %sub1264, %896
  %897 = load float*, float** %d_finavalu.addr, align 8
  %898 = load i32, i32* %offset_31, align 4
  %idxprom1268 = sext i32 %898 to i64
  %arrayidx1269 = getelementptr inbounds float, float* %897, i64 %idxprom1268
  store float %sub1267, float* %arrayidx1269, align 4
  %899 = load float, float* %I_Na_junc, align 4
  %900 = load float, float* %I_nabk_junc, align 4
  %add1270 = fadd contract float %899, %900
  %901 = load float, float* %I_ncx_junc, align 4
  %mul1271 = fmul contract float 3.000000e+00, %901
  %add1272 = fadd contract float %add1270, %mul1271
  %902 = load float, float* %I_nak_junc, align 4
  %mul1273 = fmul contract float 3.000000e+00, %902
  %add1274 = fadd contract float %add1272, %mul1273
  %903 = load float, float* %I_CaNa_junc, align 4
  %add1275 = fadd contract float %add1274, %903
  store float %add1275, float* %I_Na_tot_junc, align 4
  %904 = load float, float* %I_Na_sl, align 4
  %905 = load float, float* %I_nabk_sl, align 4
  %add1276 = fadd contract float %904, %905
  %906 = load float, float* %I_ncx_sl, align 4
  %mul1277 = fmul contract float 3.000000e+00, %906
  %add1278 = fadd contract float %add1276, %mul1277
  %907 = load float, float* %I_nak_sl, align 4
  %mul1279 = fmul contract float 3.000000e+00, %907
  %add1280 = fadd contract float %add1278, %mul1279
  %908 = load float, float* %I_CaNa_sl, align 4
  %add1281 = fadd contract float %add1280, %908
  store float %add1281, float* %I_Na_tot_sl, align 4
  %909 = load float, float* %I_Na_tot_junc, align 4
  %fneg1282 = fneg float %909
  %910 = load float, float* %Cmem, align 4
  %mul1283 = fmul contract float %fneg1282, %910
  %911 = load float, float* %Vjunc, align 4
  %912 = load float, float* %Frdy, align 4
  %mul1284 = fmul contract float %911, %912
  %div1285 = fdiv float %mul1283, %mul1284
  %913 = load float, float* %J_na_juncsl, align 4
  %914 = load float, float* %Vjunc, align 4
  %div1286 = fdiv float %913, %914
  %915 = load float, float* %d_initvalu_33, align 4
  %916 = load float, float* %d_initvalu_32, align 4
  %sub1287 = fsub contract float %915, %916
  %mul1288 = fmul contract float %div1286, %sub1287
  %add1289 = fadd contract float %div1285, %mul1288
  %917 = load float*, float** %d_finavalu.addr, align 8
  %918 = load i32, i32* %offset_17, align 4
  %idxprom1290 = sext i32 %918 to i64
  %arrayidx1291 = getelementptr inbounds float, float* %917, i64 %idxprom1290
  %919 = load float, float* %arrayidx1291, align 4
  %sub1292 = fsub contract float %add1289, %919
  %920 = load float*, float** %d_finavalu.addr, align 8
  %921 = load i32, i32* %offset_32, align 4
  %idxprom1293 = sext i32 %921 to i64
  %arrayidx1294 = getelementptr inbounds float, float* %920, i64 %idxprom1293
  store float %sub1292, float* %arrayidx1294, align 4
  %922 = load float, float* %Vsl, align 4
  %div1295 = fdiv float 1.000000e+00, %922
  store float %div1295, float* %oneovervsl, align 4
  %923 = load float, float* %I_Na_tot_sl, align 4
  %fneg1296 = fneg float %923
  %924 = load float, float* %Cmem, align 4
  %mul1297 = fmul contract float %fneg1296, %924
  %925 = load float, float* %oneovervsl, align 4
  %mul1298 = fmul contract float %mul1297, %925
  %926 = load float, float* %Frdy, align 4
  %div1299 = fdiv float %mul1298, %926
  %927 = load float, float* %J_na_juncsl, align 4
  %928 = load float, float* %oneovervsl, align 4
  %mul1300 = fmul contract float %927, %928
  %929 = load float, float* %d_initvalu_32, align 4
  %930 = load float, float* %d_initvalu_33, align 4
  %sub1301 = fsub contract float %929, %930
  %mul1302 = fmul contract float %mul1300, %sub1301
  %add1303 = fadd contract float %div1299, %mul1302
  %931 = load float, float* %J_na_slmyo, align 4
  %932 = load float, float* %oneovervsl, align 4
  %mul1304 = fmul contract float %931, %932
  %933 = load float, float* %d_initvalu_34, align 4
  %934 = load float, float* %d_initvalu_33, align 4
  %sub1305 = fsub contract float %933, %934
  %mul1306 = fmul contract float %mul1304, %sub1305
  %add1307 = fadd contract float %add1303, %mul1306
  %935 = load float*, float** %d_finavalu.addr, align 8
  %936 = load i32, i32* %offset_18, align 4
  %idxprom1308 = sext i32 %936 to i64
  %arrayidx1309 = getelementptr inbounds float, float* %935, i64 %idxprom1308
  %937 = load float, float* %arrayidx1309, align 4
  %sub1310 = fsub contract float %add1307, %937
  %938 = load float*, float** %d_finavalu.addr, align 8
  %939 = load i32, i32* %offset_33, align 4
  %idxprom1311 = sext i32 %939 to i64
  %arrayidx1312 = getelementptr inbounds float, float* %938, i64 %idxprom1311
  store float %sub1310, float* %arrayidx1312, align 4
  %940 = load float, float* %J_na_slmyo, align 4
  %941 = load float, float* %Vmyo, align 4
  %div1313 = fdiv float %940, %941
  %942 = load float, float* %d_initvalu_33, align 4
  %943 = load float, float* %d_initvalu_34, align 4
  %sub1314 = fsub contract float %942, %943
  %mul1315 = fmul contract float %div1313, %sub1314
  %944 = load float*, float** %d_finavalu.addr, align 8
  %945 = load i32, i32* %offset_34, align 4
  %idxprom1316 = sext i32 %945 to i64
  %arrayidx1317 = getelementptr inbounds float, float* %944, i64 %idxprom1316
  store float %mul1315, float* %arrayidx1317, align 4
  %946 = load float, float* %I_to, align 4
  %947 = load float, float* %I_kr, align 4
  %add1318 = fadd contract float %946, %947
  %948 = load float, float* %I_ks, align 4
  %add1319 = fadd contract float %add1318, %948
  %949 = load float, float* %I_ki, align 4
  %add1320 = fadd contract float %add1319, %949
  %950 = load float, float* %I_nak, align 4
  %mul1321 = fmul contract float 2.000000e+00, %950
  %sub1322 = fsub contract float %add1320, %mul1321
  %951 = load float, float* %I_CaK, align 4
  %add1323 = fadd contract float %sub1322, %951
  %952 = load float, float* %I_kp, align 4
  %add1324 = fadd contract float %add1323, %952
  store float %add1324, float* %I_K_tot, align 4
  %953 = load float*, float** %d_finavalu.addr, align 8
  %954 = load i32, i32* %offset_35, align 4
  %idxprom1325 = sext i32 %954 to i64
  %arrayidx1326 = getelementptr inbounds float, float* %953, i64 %idxprom1325
  store float 0.000000e+00, float* %arrayidx1326, align 4
  %955 = load float, float* %I_Ca_junc, align 4
  %956 = load float, float* %I_cabk_junc, align 4
  %add1327 = fadd contract float %955, %956
  %957 = load float, float* %I_pca_junc, align 4
  %add1328 = fadd contract float %add1327, %957
  %958 = load float, float* %I_ncx_junc, align 4
  %mul1329 = fmul contract float 2.000000e+00, %958
  %sub1330 = fsub contract float %add1328, %mul1329
  store float %sub1330, float* %I_Ca_tot_junc, align 4
  %959 = load float, float* %I_Ca_sl, align 4
  %960 = load float, float* %I_cabk_sl, align 4
  %add1331 = fadd contract float %959, %960
  %961 = load float, float* %I_pca_sl, align 4
  %add1332 = fadd contract float %add1331, %961
  %962 = load float, float* %I_ncx_sl, align 4
  %mul1333 = fmul contract float 2.000000e+00, %962
  %sub1334 = fsub contract float %add1332, %mul1333
  store float %sub1334, float* %I_Ca_tot_sl, align 4
  %963 = load float, float* %I_Ca_tot_junc, align 4
  %fneg1335 = fneg float %963
  %964 = load float, float* %Cmem, align 4
  %mul1336 = fmul contract float %fneg1335, %964
  %965 = load float, float* %Vjunc, align 4
  %mul1337 = fmul contract float %965, 2.000000e+00
  %966 = load float, float* %Frdy, align 4
  %mul1338 = fmul contract float %mul1337, %966
  %div1339 = fdiv float %mul1336, %mul1338
  %967 = load float, float* %J_ca_juncsl, align 4
  %968 = load float, float* %Vjunc, align 4
  %div1340 = fdiv float %967, %968
  %969 = load float, float* %d_initvalu_37, align 4
  %970 = load float, float* %d_initvalu_36, align 4
  %sub1341 = fsub contract float %969, %970
  %mul1342 = fmul contract float %div1340, %sub1341
  %add1343 = fadd contract float %div1339, %mul1342
  %971 = load float, float* %J_CaB_junction, align 4
  %sub1344 = fsub contract float %add1343, %971
  %972 = load float, float* %J_SRCarel, align 4
  %973 = load float, float* %Vsr, align 4
  %mul1345 = fmul contract float %972, %973
  %974 = load float, float* %Vjunc, align 4
  %div1346 = fdiv float %mul1345, %974
  %add1347 = fadd contract float %sub1344, %div1346
  %975 = load float, float* %J_SRleak, align 4
  %976 = load float, float* %Vmyo, align 4
  %mul1348 = fmul contract float %975, %976
  %977 = load float, float* %Vjunc, align 4
  %div1349 = fdiv float %mul1348, %977
  %add1350 = fadd contract float %add1347, %div1349
  %978 = load float*, float** %d_finavalu.addr, align 8
  %979 = load i32, i32* %offset_36, align 4
  %idxprom1351 = sext i32 %979 to i64
  %arrayidx1352 = getelementptr inbounds float, float* %978, i64 %idxprom1351
  store float %add1350, float* %arrayidx1352, align 4
  %980 = load float, float* %I_Ca_tot_sl, align 4
  %fneg1353 = fneg float %980
  %981 = load float, float* %Cmem, align 4
  %mul1354 = fmul contract float %fneg1353, %981
  %982 = load float, float* %Vsl, align 4
  %mul1355 = fmul contract float %982, 2.000000e+00
  %983 = load float, float* %Frdy, align 4
  %mul1356 = fmul contract float %mul1355, %983
  %div1357 = fdiv float %mul1354, %mul1356
  %984 = load float, float* %J_ca_juncsl, align 4
  %985 = load float, float* %Vsl, align 4
  %div1358 = fdiv float %984, %985
  %986 = load float, float* %d_initvalu_36, align 4
  %987 = load float, float* %d_initvalu_37, align 4
  %sub1359 = fsub contract float %986, %987
  %mul1360 = fmul contract float %div1358, %sub1359
  %add1361 = fadd contract float %div1357, %mul1360
  %988 = load float, float* %J_ca_slmyo, align 4
  %989 = load float, float* %Vsl, align 4
  %div1362 = fdiv float %988, %989
  %990 = load float, float* %d_initvalu_38, align 4
  %991 = load float, float* %d_initvalu_37, align 4
  %sub1363 = fsub contract float %990, %991
  %mul1364 = fmul contract float %div1362, %sub1363
  %add1365 = fadd contract float %add1361, %mul1364
  %992 = load float, float* %J_CaB_sl, align 4
  %sub1366 = fsub contract float %add1365, %992
  %993 = load float*, float** %d_finavalu.addr, align 8
  %994 = load i32, i32* %offset_37, align 4
  %idxprom1367 = sext i32 %994 to i64
  %arrayidx1368 = getelementptr inbounds float, float* %993, i64 %idxprom1367
  store float %sub1366, float* %arrayidx1368, align 4
  %995 = load float, float* %J_serca, align 4
  %fneg1369 = fneg float %995
  %996 = load float, float* %J_CaB_cytosol, align 4
  %sub1370 = fsub contract float %fneg1369, %996
  %997 = load float, float* %J_ca_slmyo, align 4
  %998 = load float, float* %Vmyo, align 4
  %div1371 = fdiv float %997, %998
  %999 = load float, float* %d_initvalu_37, align 4
  %1000 = load float, float* %d_initvalu_38, align 4
  %sub1372 = fsub contract float %999, %1000
  %mul1373 = fmul contract float %div1371, %sub1372
  %add1374 = fadd contract float %sub1370, %mul1373
  %1001 = load float*, float** %d_finavalu.addr, align 8
  %1002 = load i32, i32* %offset_38, align 4
  %idxprom1375 = sext i32 %1002 to i64
  %arrayidx1376 = getelementptr inbounds float, float* %1001, i64 %idxprom1375
  store float %add1374, float* %arrayidx1376, align 4
  store i32 1, i32* %state, align 4
  %1003 = load i32, i32* %state, align 4
  br label %NodeBlock3

NodeBlock3:                                       ; preds = %if.end
  %Pivot4 = icmp slt i32 %1003, 1
  br i1 %Pivot4, label %LeafBlock, label %NodeBlock

NodeBlock:                                        ; preds = %NodeBlock3
  %Pivot = icmp slt i32 %1003, 2
  br i1 %Pivot, label %sw.bb1377, label %LeafBlock1

LeafBlock1:                                       ; preds = %NodeBlock
  %SwitchLeaf2 = icmp eq i32 %1003, 2
  br i1 %SwitchLeaf2, label %sw.bb1383, label %NewDefault

LeafBlock:                                        ; preds = %NodeBlock3
  %SwitchLeaf = icmp eq i32 %1003, 0
  br i1 %SwitchLeaf, label %sw.bb, label %NewDefault

sw.bb:                                            ; preds = %LeafBlock
  store float 0.000000e+00, float* %I_app, align 4
  br label %sw.epilog

sw.bb1377:                                        ; preds = %NodeBlock
  %1004 = load float, float* %timeinst.addr, align 4
  %1005 = load float, float* %cycleLength, align 4
  %call1378 = call fastcc float @_ZL4fmodff(float %1004, float %1005) #4
  %cmp1379 = fcmp ole float %call1378, 5.000000e+00
  br i1 %cmp1379, label %if.then1380, label %if.else1381

if.then1380:                                      ; preds = %sw.bb1377
  store float 9.500000e+00, float* %I_app, align 4
  br label %if.end1382

if.else1381:                                      ; preds = %sw.bb1377
  store float 0.000000e+00, float* %I_app, align 4
  br label %if.end1382

if.end1382:                                       ; preds = %if.else1381, %if.then1380
  br label %sw.epilog

sw.bb1383:                                        ; preds = %LeafBlock1
  store float -5.500000e+01, float* %V_hold, align 4
  store float 0.000000e+00, float* %V_test, align 4
  %1006 = load float, float* %timeinst.addr, align 4
  %conv1384 = fpext float %1006 to double
  %cmp1385 = fcmp ogt double %conv1384, 5.000000e-01
  %conv1386 = zext i1 %cmp1385 to i32
  %1007 = load float, float* %timeinst.addr, align 4
  %conv1387 = fpext float %1007 to double
  %cmp1388 = fcmp olt double %conv1387, 2.005000e+02
  %conv1389 = zext i1 %cmp1388 to i32
  %and = and i32 %conv1386, %conv1389
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1390, label %if.else1391

if.then1390:                                      ; preds = %sw.bb1383
  %1008 = load float, float* %V_test, align 4
  store float %1008, float* %V_clamp, align 4
  br label %if.end1392

if.else1391:                                      ; preds = %sw.bb1383
  %1009 = load float, float* %V_hold, align 4
  store float %1009, float* %V_clamp, align 4
  br label %if.end1392

if.end1392:                                       ; preds = %if.else1391, %if.then1390
  store float 0x3FA47AE140000000, float* %R_clamp, align 4
  %1010 = load float, float* %V_clamp, align 4
  %1011 = load float, float* %d_initvalu_39, align 4
  %sub1393 = fsub contract float %1010, %1011
  %1012 = load float, float* %R_clamp, align 4
  %div1394 = fdiv float %sub1393, %1012
  store float %div1394, float* %I_app, align 4
  br label %sw.epilog

NewDefault:                                       ; preds = %LeafBlock, %LeafBlock1
  br label %sw.epilog

sw.epilog:                                        ; preds = %NewDefault, %if.end1392, %if.end1382, %sw.bb
  %1013 = load float, float* %I_Na_tot_junc, align 4
  %1014 = load float, float* %I_Na_tot_sl, align 4
  %add1395 = fadd contract float %1013, %1014
  store float %add1395, float* %I_Na_tot, align 4
  %1015 = load float, float* %I_ClCa, align 4
  %1016 = load float, float* %I_Clbk, align 4
  %add1396 = fadd contract float %1015, %1016
  store float %add1396, float* %I_Cl_tot, align 4
  %1017 = load float, float* %I_Ca_tot_junc, align 4
  %1018 = load float, float* %I_Ca_tot_sl, align 4
  %add1397 = fadd contract float %1017, %1018
  store float %add1397, float* %I_Ca_tot, align 4
  %1019 = load float, float* %I_Na_tot, align 4
  %1020 = load float, float* %I_Cl_tot, align 4
  %add1398 = fadd contract float %1019, %1020
  %1021 = load float, float* %I_Ca_tot, align 4
  %add1399 = fadd contract float %add1398, %1021
  %1022 = load float, float* %I_K_tot, align 4
  %add1400 = fadd contract float %add1399, %1022
  store float %add1400, float* %I_tot, align 4
  %1023 = load float, float* %I_tot, align 4
  %1024 = load float, float* %I_app, align 4
  %sub1401 = fsub contract float %1023, %1024
  %fneg1402 = fneg float %sub1401
  %1025 = load float*, float** %d_finavalu.addr, align 8
  %1026 = load i32, i32* %offset_39, align 4
  %idxprom1403 = sext i32 %1026 to i64
  %arrayidx1404 = getelementptr inbounds float, float* %1025, i64 %idxprom1403
  store float %fneg1402, float* %arrayidx1404, align 4
  %1027 = load float*, float** %d_finavalu.addr, align 8
  %1028 = load i32, i32* %offset_41, align 4
  %idxprom1405 = sext i32 %1028 to i64
  %arrayidx1406 = getelementptr inbounds float, float* %1027, i64 %idxprom1405
  store float 0.000000e+00, float* %arrayidx1406, align 4
  %1029 = load float*, float** %d_finavalu.addr, align 8
  %1030 = load i32, i32* %offset_42, align 4
  %idxprom1407 = sext i32 %1030 to i64
  %arrayidx1408 = getelementptr inbounds float, float* %1029, i64 %idxprom1407
  store float 0.000000e+00, float* %arrayidx1408, align 4
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z12kernel_cam_2fPfS_iS_iS_if(float %timeinst, float* noalias %d_initvalu, float* noalias %d_finavalu, i32 %valu_offset, float* noalias %d_params, i32 %params_offset, float* noalias %d_com, i32 %com_offset, float %Ca) local_unnamed_addr #0 {
entry:
  %timeinst.addr = alloca float, align 4
  %d_initvalu.addr = alloca float*, align 8
  %d_finavalu.addr = alloca float*, align 8
  %valu_offset.addr = alloca i32, align 4
  %d_params.addr = alloca float*, align 8
  %params_offset.addr = alloca i32, align 4
  %d_com.addr = alloca float*, align 8
  %com_offset.addr = alloca i32, align 4
  %Ca.addr = alloca float, align 4
  %Btot = alloca float, align 4
  %CaMKIItot = alloca float, align 4
  %CaNtot = alloca float, align 4
  %PP1tot = alloca float, align 4
  %K = alloca float, align 4
  %Mg = alloca float, align 4
  %offset_1 = alloca i32, align 4
  %offset_2 = alloca i32, align 4
  %offset_3 = alloca i32, align 4
  %offset_4 = alloca i32, align 4
  %offset_5 = alloca i32, align 4
  %offset_6 = alloca i32, align 4
  %offset_7 = alloca i32, align 4
  %offset_8 = alloca i32, align 4
  %offset_9 = alloca i32, align 4
  %offset_10 = alloca i32, align 4
  %offset_11 = alloca i32, align 4
  %offset_12 = alloca i32, align 4
  %offset_13 = alloca i32, align 4
  %offset_14 = alloca i32, align 4
  %offset_15 = alloca i32, align 4
  %CaM = alloca float, align 4
  %Ca2CaM = alloca float, align 4
  %Ca4CaM = alloca float, align 4
  %CaMB = alloca float, align 4
  %Ca2CaMB = alloca float, align 4
  %Ca4CaMB = alloca float, align 4
  %Pb2 = alloca float, align 4
  %Pb = alloca float, align 4
  %Pt = alloca float, align 4
  %Pt2 = alloca float, align 4
  %Pa = alloca float, align 4
  %Ca4CaN = alloca float, align 4
  %CaMCa4CaN = alloca float, align 4
  %Ca2CaMCa4CaN = alloca float, align 4
  %Ca4CaMCa4CaN = alloca float, align 4
  %Kd02 = alloca float, align 4
  %Kd24 = alloca float, align 4
  %k20 = alloca float, align 4
  %k02 = alloca float, align 4
  %k42 = alloca float, align 4
  %k24 = alloca float, align 4
  %k0Boff = alloca float, align 4
  %k0Bon = alloca float, align 4
  %k2Boff = alloca float, align 4
  %k2Bon = alloca float, align 4
  %k4Boff = alloca float, align 4
  %k4Bon = alloca float, align 4
  %k20B = alloca float, align 4
  %k02B = alloca float, align 4
  %k42B = alloca float, align 4
  %k24B = alloca float, align 4
  %kbi = alloca float, align 4
  %kib = alloca float, align 4
  %kpp1 = alloca float, align 4
  %Kmpp1 = alloca float, align 4
  %kib2 = alloca float, align 4
  %kb2i = alloca float, align 4
  %kb24 = alloca float, align 4
  %kb42 = alloca float, align 4
  %kta = alloca float, align 4
  %kat = alloca float, align 4
  %kt42 = alloca float, align 4
  %kt24 = alloca float, align 4
  %kat2 = alloca float, align 4
  %kt2a = alloca float, align 4
  %kcanCaoff = alloca float, align 4
  %kcanCaon = alloca float, align 4
  %kcanCaM4on = alloca float, align 4
  %kcanCaM4off = alloca float, align 4
  %kcanCaM2on = alloca float, align 4
  %kcanCaM2off = alloca float, align 4
  %kcanCaM0on = alloca float, align 4
  %kcanCaM0off = alloca float, align 4
  %k02can = alloca float, align 4
  %k20can = alloca float, align 4
  %k24can = alloca float, align 4
  %k42can = alloca float, align 4
  %rcn02 = alloca float, align 4
  %rcn24 = alloca float, align 4
  %B = alloca float, align 4
  %rcn02B = alloca float, align 4
  %rcn24B = alloca float, align 4
  %rcn0B = alloca float, align 4
  %rcn2B = alloca float, align 4
  %rcn4B = alloca float, align 4
  %Ca2CaN = alloca float, align 4
  %rcnCa4CaN = alloca float, align 4
  %rcn02CaN = alloca float, align 4
  %rcn24CaN = alloca float, align 4
  %rcn0CaN = alloca float, align 4
  %rcn2CaN = alloca float, align 4
  %rcn4CaN = alloca float, align 4
  %Pix = alloca float, align 4
  %rcnCKib2 = alloca float, align 4
  %rcnCKb2b = alloca float, align 4
  %rcnCKib = alloca float, align 4
  %T = alloca float, align 4
  %kbt = alloca float, align 4
  %rcnCKbt = alloca float, align 4
  %rcnCKtt2 = alloca float, align 4
  %rcnCKta = alloca float, align 4
  %rcnCKt2a = alloca float, align 4
  %rcnCKt2b2 = alloca float, align 4
  %rcnCKai = alloca float, align 4
  %dCaM = alloca float, align 4
  %dCa2CaM = alloca float, align 4
  %dCa4CaM = alloca float, align 4
  %dCaMB = alloca float, align 4
  %dCa2CaMB = alloca float, align 4
  %dCa4CaMB = alloca float, align 4
  %dPb2 = alloca float, align 4
  %dPb = alloca float, align 4
  %dPt = alloca float, align 4
  %dPt2 = alloca float, align 4
  %dPa = alloca float, align 4
  %dCa4CaN = alloca float, align 4
  %dCaMCa4CaN = alloca float, align 4
  %dCa2CaMCa4CaN = alloca float, align 4
  %dCa4CaMCa4CaN = alloca float, align 4
  store float %timeinst, float* %timeinst.addr, align 4
  store float* %d_initvalu, float** %d_initvalu.addr, align 8
  store float* %d_finavalu, float** %d_finavalu.addr, align 8
  store i32 %valu_offset, i32* %valu_offset.addr, align 4
  store float* %d_params, float** %d_params.addr, align 8
  store i32 %params_offset, i32* %params_offset.addr, align 4
  store float* %d_com, float** %d_com.addr, align 8
  store i32 %com_offset, i32* %com_offset.addr, align 4
  store float %Ca, float* %Ca.addr, align 4
  %0 = load float*, float** %d_params.addr, align 8
  %1 = load i32, i32* %params_offset.addr, align 4
  %add = add nsw i32 %1, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %0, i64 %idxprom
  %2 = load float, float* %arrayidx, align 4
  store float %2, float* %Btot, align 4
  %3 = load float*, float** %d_params.addr, align 8
  %4 = load i32, i32* %params_offset.addr, align 4
  %add1 = add nsw i32 %4, 2
  %idxprom2 = sext i32 %add1 to i64
  %arrayidx3 = getelementptr inbounds float, float* %3, i64 %idxprom2
  %5 = load float, float* %arrayidx3, align 4
  store float %5, float* %CaMKIItot, align 4
  %6 = load float*, float** %d_params.addr, align 8
  %7 = load i32, i32* %params_offset.addr, align 4
  %add4 = add nsw i32 %7, 3
  %idxprom5 = sext i32 %add4 to i64
  %arrayidx6 = getelementptr inbounds float, float* %6, i64 %idxprom5
  %8 = load float, float* %arrayidx6, align 4
  store float %8, float* %CaNtot, align 4
  %9 = load float*, float** %d_params.addr, align 8
  %10 = load i32, i32* %params_offset.addr, align 4
  %add7 = add nsw i32 %10, 4
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds float, float* %9, i64 %idxprom8
  %11 = load float, float* %arrayidx9, align 4
  store float %11, float* %PP1tot, align 4
  %12 = load float*, float** %d_params.addr, align 8
  %arrayidx10 = getelementptr inbounds float, float* %12, i64 16
  %13 = load float, float* %arrayidx10, align 4
  store float %13, float* %K, align 4
  %14 = load float*, float** %d_params.addr, align 8
  %arrayidx11 = getelementptr inbounds float, float* %14, i64 17
  %15 = load float, float* %arrayidx11, align 4
  store float %15, float* %Mg, align 4
  %16 = load i32, i32* %valu_offset.addr, align 4
  store i32 %16, i32* %offset_1, align 4
  %17 = load i32, i32* %valu_offset.addr, align 4
  %add12 = add nsw i32 %17, 1
  store i32 %add12, i32* %offset_2, align 4
  %18 = load i32, i32* %valu_offset.addr, align 4
  %add13 = add nsw i32 %18, 2
  store i32 %add13, i32* %offset_3, align 4
  %19 = load i32, i32* %valu_offset.addr, align 4
  %add14 = add nsw i32 %19, 3
  store i32 %add14, i32* %offset_4, align 4
  %20 = load i32, i32* %valu_offset.addr, align 4
  %add15 = add nsw i32 %20, 4
  store i32 %add15, i32* %offset_5, align 4
  %21 = load i32, i32* %valu_offset.addr, align 4
  %add16 = add nsw i32 %21, 5
  store i32 %add16, i32* %offset_6, align 4
  %22 = load i32, i32* %valu_offset.addr, align 4
  %add17 = add nsw i32 %22, 6
  store i32 %add17, i32* %offset_7, align 4
  %23 = load i32, i32* %valu_offset.addr, align 4
  %add18 = add nsw i32 %23, 7
  store i32 %add18, i32* %offset_8, align 4
  %24 = load i32, i32* %valu_offset.addr, align 4
  %add19 = add nsw i32 %24, 8
  store i32 %add19, i32* %offset_9, align 4
  %25 = load i32, i32* %valu_offset.addr, align 4
  %add20 = add nsw i32 %25, 9
  store i32 %add20, i32* %offset_10, align 4
  %26 = load i32, i32* %valu_offset.addr, align 4
  %add21 = add nsw i32 %26, 10
  store i32 %add21, i32* %offset_11, align 4
  %27 = load i32, i32* %valu_offset.addr, align 4
  %add22 = add nsw i32 %27, 11
  store i32 %add22, i32* %offset_12, align 4
  %28 = load i32, i32* %valu_offset.addr, align 4
  %add23 = add nsw i32 %28, 12
  store i32 %add23, i32* %offset_13, align 4
  %29 = load i32, i32* %valu_offset.addr, align 4
  %add24 = add nsw i32 %29, 13
  store i32 %add24, i32* %offset_14, align 4
  %30 = load i32, i32* %valu_offset.addr, align 4
  %add25 = add nsw i32 %30, 14
  store i32 %add25, i32* %offset_15, align 4
  %31 = load float*, float** %d_initvalu.addr, align 8
  %32 = load i32, i32* %offset_1, align 4
  %idxprom26 = sext i32 %32 to i64
  %arrayidx27 = getelementptr inbounds float, float* %31, i64 %idxprom26
  %33 = load float, float* %arrayidx27, align 4
  store float %33, float* %CaM, align 4
  %34 = load float*, float** %d_initvalu.addr, align 8
  %35 = load i32, i32* %offset_2, align 4
  %idxprom28 = sext i32 %35 to i64
  %arrayidx29 = getelementptr inbounds float, float* %34, i64 %idxprom28
  %36 = load float, float* %arrayidx29, align 4
  store float %36, float* %Ca2CaM, align 4
  %37 = load float*, float** %d_initvalu.addr, align 8
  %38 = load i32, i32* %offset_3, align 4
  %idxprom30 = sext i32 %38 to i64
  %arrayidx31 = getelementptr inbounds float, float* %37, i64 %idxprom30
  %39 = load float, float* %arrayidx31, align 4
  store float %39, float* %Ca4CaM, align 4
  %40 = load float*, float** %d_initvalu.addr, align 8
  %41 = load i32, i32* %offset_4, align 4
  %idxprom32 = sext i32 %41 to i64
  %arrayidx33 = getelementptr inbounds float, float* %40, i64 %idxprom32
  %42 = load float, float* %arrayidx33, align 4
  store float %42, float* %CaMB, align 4
  %43 = load float*, float** %d_initvalu.addr, align 8
  %44 = load i32, i32* %offset_5, align 4
  %idxprom34 = sext i32 %44 to i64
  %arrayidx35 = getelementptr inbounds float, float* %43, i64 %idxprom34
  %45 = load float, float* %arrayidx35, align 4
  store float %45, float* %Ca2CaMB, align 4
  %46 = load float*, float** %d_initvalu.addr, align 8
  %47 = load i32, i32* %offset_6, align 4
  %idxprom36 = sext i32 %47 to i64
  %arrayidx37 = getelementptr inbounds float, float* %46, i64 %idxprom36
  %48 = load float, float* %arrayidx37, align 4
  store float %48, float* %Ca4CaMB, align 4
  %49 = load float*, float** %d_initvalu.addr, align 8
  %50 = load i32, i32* %offset_7, align 4
  %idxprom38 = sext i32 %50 to i64
  %arrayidx39 = getelementptr inbounds float, float* %49, i64 %idxprom38
  %51 = load float, float* %arrayidx39, align 4
  store float %51, float* %Pb2, align 4
  %52 = load float*, float** %d_initvalu.addr, align 8
  %53 = load i32, i32* %offset_8, align 4
  %idxprom40 = sext i32 %53 to i64
  %arrayidx41 = getelementptr inbounds float, float* %52, i64 %idxprom40
  %54 = load float, float* %arrayidx41, align 4
  store float %54, float* %Pb, align 4
  %55 = load float*, float** %d_initvalu.addr, align 8
  %56 = load i32, i32* %offset_9, align 4
  %idxprom42 = sext i32 %56 to i64
  %arrayidx43 = getelementptr inbounds float, float* %55, i64 %idxprom42
  %57 = load float, float* %arrayidx43, align 4
  store float %57, float* %Pt, align 4
  %58 = load float*, float** %d_initvalu.addr, align 8
  %59 = load i32, i32* %offset_10, align 4
  %idxprom44 = sext i32 %59 to i64
  %arrayidx45 = getelementptr inbounds float, float* %58, i64 %idxprom44
  %60 = load float, float* %arrayidx45, align 4
  store float %60, float* %Pt2, align 4
  %61 = load float*, float** %d_initvalu.addr, align 8
  %62 = load i32, i32* %offset_11, align 4
  %idxprom46 = sext i32 %62 to i64
  %arrayidx47 = getelementptr inbounds float, float* %61, i64 %idxprom46
  %63 = load float, float* %arrayidx47, align 4
  store float %63, float* %Pa, align 4
  %64 = load float*, float** %d_initvalu.addr, align 8
  %65 = load i32, i32* %offset_12, align 4
  %idxprom48 = sext i32 %65 to i64
  %arrayidx49 = getelementptr inbounds float, float* %64, i64 %idxprom48
  %66 = load float, float* %arrayidx49, align 4
  store float %66, float* %Ca4CaN, align 4
  %67 = load float*, float** %d_initvalu.addr, align 8
  %68 = load i32, i32* %offset_13, align 4
  %idxprom50 = sext i32 %68 to i64
  %arrayidx51 = getelementptr inbounds float, float* %67, i64 %idxprom50
  %69 = load float, float* %arrayidx51, align 4
  store float %69, float* %CaMCa4CaN, align 4
  %70 = load float*, float** %d_initvalu.addr, align 8
  %71 = load i32, i32* %offset_14, align 4
  %idxprom52 = sext i32 %71 to i64
  %arrayidx53 = getelementptr inbounds float, float* %70, i64 %idxprom52
  %72 = load float, float* %arrayidx53, align 4
  store float %72, float* %Ca2CaMCa4CaN, align 4
  %73 = load float*, float** %d_initvalu.addr, align 8
  %74 = load i32, i32* %offset_15, align 4
  %idxprom54 = sext i32 %74 to i64
  %arrayidx55 = getelementptr inbounds float, float* %73, i64 %idxprom54
  %75 = load float, float* %arrayidx55, align 4
  store float %75, float* %Ca4CaMCa4CaN, align 4
  %76 = load float, float* %Mg, align 4
  %cmp = fcmp ole float %76, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %77 = load float, float* %K, align 4
  %conv = fpext float %77 to double
  %div = fdiv double %conv, 0x3FEE147AE147AE14
  %add56 = fadd contract double 1.000000e+00, %div
  %78 = load float, float* %Mg, align 4
  %conv57 = fpext float %78 to double
  %div58 = fdiv double %conv57, 1.200000e-02
  %sub = fsub contract double %add56, %div58
  %mul = fmul contract double 2.500000e-03, %sub
  %79 = load float, float* %K, align 4
  %conv59 = fpext float %79 to double
  %div60 = fdiv double %conv59, 8.100000e+00
  %add61 = fadd contract double 1.000000e+00, %div60
  %80 = load float, float* %Mg, align 4
  %conv62 = fpext float %80 to double
  %div63 = fdiv double %conv62, 2.200000e-02
  %add64 = fadd contract double %add61, %div63
  %mul65 = fmul contract double %mul, %add64
  %conv66 = fptrunc double %mul65 to float
  store float %conv66, float* %Kd02, align 4
  %81 = load float, float* %K, align 4
  %conv67 = fpext float %81 to double
  %div68 = fdiv double %conv67, 6.400000e-01
  %add69 = fadd contract double 1.000000e+00, %div68
  %82 = load float, float* %Mg, align 4
  %conv70 = fpext float %82 to double
  %div71 = fdiv double %conv70, 1.400000e-03
  %add72 = fadd contract double %add69, %div71
  %mul73 = fmul contract double 1.280000e-01, %add72
  %83 = load float, float* %K, align 4
  %conv74 = fpext float %83 to double
  %div75 = fdiv double %conv74, 1.300000e+01
  %add76 = fadd contract double 1.000000e+00, %div75
  %84 = load float, float* %Mg, align 4
  %conv77 = fpext float %84 to double
  %div78 = fdiv double %conv77, 1.530000e-01
  %sub79 = fsub contract double %add76, %div78
  %mul80 = fmul contract double %mul73, %sub79
  %conv81 = fptrunc double %mul80 to float
  store float %conv81, float* %Kd24, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %85 = load float, float* %K, align 4
  %conv82 = fpext float %85 to double
  %div83 = fdiv double %conv82, 0x3FEE147AE147AE14
  %add84 = fadd contract double 1.000000e+00, %div83
  %sub85 = fsub contract double %add84, 0x4054D55555555555
  %86 = load float, float* %Mg, align 4
  %sub86 = fsub contract float %86, 1.000000e+00
  %conv87 = fpext float %sub86 to double
  %div88 = fdiv double %conv87, 6.000000e-02
  %add89 = fadd contract double %sub85, %div88
  %mul90 = fmul contract double 2.500000e-03, %add89
  %87 = load float, float* %K, align 4
  %conv91 = fpext float %87 to double
  %div92 = fdiv double %conv91, 8.100000e+00
  %add93 = fadd contract double 1.000000e+00, %div92
  %add94 = fadd contract double %add93, 0x4046BA2E8BA2E8BB
  %88 = load float, float* %Mg, align 4
  %sub95 = fsub contract float %88, 1.000000e+00
  %conv96 = fpext float %sub95 to double
  %div97 = fdiv double %conv96, 6.800000e-02
  %add98 = fadd contract double %add94, %div97
  %mul99 = fmul contract double %mul90, %add98
  %conv100 = fptrunc double %mul99 to float
  store float %conv100, float* %Kd02, align 4
  %89 = load float, float* %K, align 4
  %conv101 = fpext float %89 to double
  %div102 = fdiv double %conv101, 6.400000e-01
  %add103 = fadd contract double 1.000000e+00, %div102
  %add104 = fadd contract double %add103, 0x4086524924924925
  %90 = load float, float* %Mg, align 4
  %sub105 = fsub contract float %90, 1.000000e+00
  %conv106 = fpext float %sub105 to double
  %div107 = fdiv double %conv106, 5.000000e-03
  %add108 = fadd contract double %add104, %div107
  %mul109 = fmul contract double 1.280000e-01, %add108
  %91 = load float, float* %K, align 4
  %conv110 = fpext float %91 to double
  %div111 = fdiv double %conv110, 1.300000e+01
  %add112 = fadd contract double 1.000000e+00, %div111
  %sub113 = fsub contract double %add112, 0x401A24CF7A24CF7A
  %92 = load float, float* %Mg, align 4
  %sub114 = fsub contract float %92, 1.000000e+00
  %conv115 = fpext float %sub114 to double
  %div116 = fdiv double %conv115, 1.500000e-01
  %add117 = fadd contract double %sub113, %div116
  %mul118 = fmul contract double %mul109, %add117
  %conv119 = fptrunc double %mul118 to float
  store float %conv119, float* %Kd24, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store float 1.000000e+01, float* %k20, align 4
  %93 = load float, float* %k20, align 4
  %94 = load float, float* %Kd02, align 4
  %div120 = fdiv float %93, %94
  store float %div120, float* %k02, align 4
  store float 5.000000e+02, float* %k42, align 4
  %95 = load float, float* %k42, align 4
  %96 = load float, float* %Kd24, align 4
  %div121 = fdiv float %95, %96
  store float %div121, float* %k24, align 4
  store float 0x3F56F00680000000, float* %k0Boff, align 4
  %97 = load float, float* %k0Boff, align 4
  %conv122 = fpext float %97 to double
  %div123 = fdiv double %conv122, 2.000000e-01
  %conv124 = fptrunc double %div123 to float
  store float %conv124, float* %k0Bon, align 4
  %98 = load float, float* %k0Boff, align 4
  %div125 = fdiv float %98, 1.000000e+02
  store float %div125, float* %k2Boff, align 4
  %99 = load float, float* %k0Bon, align 4
  store float %99, float* %k2Bon, align 4
  %100 = load float, float* %k2Boff, align 4
  store float %100, float* %k4Boff, align 4
  %101 = load float, float* %k0Bon, align 4
  store float %101, float* %k4Bon, align 4
  %102 = load float, float* %k20, align 4
  %div126 = fdiv float %102, 1.000000e+02
  store float %div126, float* %k20B, align 4
  %103 = load float, float* %k02, align 4
  store float %103, float* %k02B, align 4
  %104 = load float, float* %k42, align 4
  store float %104, float* %k42B, align 4
  %105 = load float, float* %k24, align 4
  store float %105, float* %k24B, align 4
  store float 0x40019999A0000000, float* %kbi, align 4
  %106 = load float, float* %kbi, align 4
  %conv127 = fpext float %106 to double
  %div128 = fdiv double %conv127, 3.350000e-02
  %conv129 = fptrunc double %div128 to float
  store float %conv129, float* %kib, align 4
  store float 0x3FFB851EC0000000, float* %kpp1, align 4
  store float 1.150000e+01, float* %Kmpp1, align 4
  %107 = load float, float* %kib, align 4
  store float %107, float* %kib2, align 4
  %108 = load float, float* %kib2, align 4
  %mul130 = fmul contract float %108, 5.000000e+00
  store float %mul130, float* %kb2i, align 4
  %109 = load float, float* %k24, align 4
  store float %109, float* %kb24, align 4
  %110 = load float, float* %k42, align 4
  %conv131 = fpext float %110 to double
  %mul132 = fmul contract double %conv131, 3.350000e-02
  %div133 = fdiv double %mul132, 5.000000e+00
  %conv134 = fptrunc double %div133 to float
  store float %conv134, float* %kb42, align 4
  %111 = load float, float* %kbi, align 4
  %div135 = fdiv float %111, 1.000000e+03
  store float %div135, float* %kta, align 4
  %112 = load float, float* %kib, align 4
  store float %112, float* %kat, align 4
  %113 = load float, float* %k42, align 4
  %conv136 = fpext float %113 to double
  %mul137 = fmul contract double %conv136, 3.350000e-05
  %div138 = fdiv double %mul137, 5.000000e+00
  %conv139 = fptrunc double %div138 to float
  store float %conv139, float* %kt42, align 4
  %114 = load float, float* %k24, align 4
  store float %114, float* %kt24, align 4
  %115 = load float, float* %kib, align 4
  store float %115, float* %kat2, align 4
  %116 = load float, float* %kib, align 4
  %mul140 = fmul contract float %116, 5.000000e+00
  store float %mul140, float* %kt2a, align 4
  store float 1.000000e+00, float* %kcanCaoff, align 4
  %117 = load float, float* %kcanCaoff, align 4
  %conv141 = fpext float %117 to double
  %div142 = fdiv double %conv141, 5.000000e-01
  %conv143 = fptrunc double %div142 to float
  store float %conv143, float* %kcanCaon, align 4
  store float 4.600000e+01, float* %kcanCaM4on, align 4
  store float 0x3F554C9860000000, float* %kcanCaM4off, align 4
  %118 = load float, float* %kcanCaM4on, align 4
  store float %118, float* %kcanCaM2on, align 4
  %119 = load float, float* %kcanCaM4off, align 4
  %mul144 = fmul contract float 2.508000e+03, %119
  store float %mul144, float* %kcanCaM2off, align 4
  %120 = load float, float* %kcanCaM4on, align 4
  store float %120, float* %kcanCaM0on, align 4
  %121 = load float, float* %kcanCaM2off, align 4
  %mul145 = fmul contract float 1.650000e+02, %121
  store float %mul145, float* %kcanCaM0off, align 4
  %122 = load float, float* %k02, align 4
  store float %122, float* %k02can, align 4
  %123 = load float, float* %k20, align 4
  %div146 = fdiv float %123, 1.650000e+02
  store float %div146, float* %k20can, align 4
  %124 = load float, float* %k24, align 4
  store float %124, float* %k24can, align 4
  %125 = load float, float* %k20, align 4
  %div147 = fdiv float %125, 2.508000e+03
  store float %div147, float* %k42can, align 4
  %126 = load float, float* %k02, align 4
  %127 = load float, float* %Ca.addr, align 4
  %call = call fastcc float @_ZL3powfi(float %127, i32 2) #4
  %mul148 = fmul contract float %126, %call
  %128 = load float, float* %CaM, align 4
  %mul149 = fmul contract float %mul148, %128
  %129 = load float, float* %k20, align 4
  %130 = load float, float* %Ca2CaM, align 4
  %mul150 = fmul contract float %129, %130
  %sub151 = fsub contract float %mul149, %mul150
  store float %sub151, float* %rcn02, align 4
  %131 = load float, float* %k24, align 4
  %132 = load float, float* %Ca.addr, align 4
  %call152 = call fastcc float @_ZL3powfi(float %132, i32 2) #4
  %mul153 = fmul contract float %131, %call152
  %133 = load float, float* %Ca2CaM, align 4
  %mul154 = fmul contract float %mul153, %133
  %134 = load float, float* %k42, align 4
  %135 = load float, float* %Ca4CaM, align 4
  %mul155 = fmul contract float %134, %135
  %sub156 = fsub contract float %mul154, %mul155
  store float %sub156, float* %rcn24, align 4
  %136 = load float, float* %Btot, align 4
  %137 = load float, float* %CaMB, align 4
  %sub157 = fsub contract float %136, %137
  %138 = load float, float* %Ca2CaMB, align 4
  %sub158 = fsub contract float %sub157, %138
  %139 = load float, float* %Ca4CaMB, align 4
  %sub159 = fsub contract float %sub158, %139
  store float %sub159, float* %B, align 4
  %140 = load float, float* %k02B, align 4
  %141 = load float, float* %Ca.addr, align 4
  %call160 = call fastcc float @_ZL3powfi(float %141, i32 2) #4
  %mul161 = fmul contract float %140, %call160
  %142 = load float, float* %CaMB, align 4
  %mul162 = fmul contract float %mul161, %142
  %143 = load float, float* %k20B, align 4
  %144 = load float, float* %Ca2CaMB, align 4
  %mul163 = fmul contract float %143, %144
  %sub164 = fsub contract float %mul162, %mul163
  store float %sub164, float* %rcn02B, align 4
  %145 = load float, float* %k24B, align 4
  %146 = load float, float* %Ca.addr, align 4
  %call165 = call fastcc float @_ZL3powfi(float %146, i32 2) #4
  %mul166 = fmul contract float %145, %call165
  %147 = load float, float* %Ca2CaMB, align 4
  %mul167 = fmul contract float %mul166, %147
  %148 = load float, float* %k42B, align 4
  %149 = load float, float* %Ca4CaMB, align 4
  %mul168 = fmul contract float %148, %149
  %sub169 = fsub contract float %mul167, %mul168
  store float %sub169, float* %rcn24B, align 4
  %150 = load float, float* %k0Bon, align 4
  %151 = load float, float* %CaM, align 4
  %mul170 = fmul contract float %150, %151
  %152 = load float, float* %B, align 4
  %mul171 = fmul contract float %mul170, %152
  %153 = load float, float* %k0Boff, align 4
  %154 = load float, float* %CaMB, align 4
  %mul172 = fmul contract float %153, %154
  %sub173 = fsub contract float %mul171, %mul172
  store float %sub173, float* %rcn0B, align 4
  %155 = load float, float* %k2Bon, align 4
  %156 = load float, float* %Ca2CaM, align 4
  %mul174 = fmul contract float %155, %156
  %157 = load float, float* %B, align 4
  %mul175 = fmul contract float %mul174, %157
  %158 = load float, float* %k2Boff, align 4
  %159 = load float, float* %Ca2CaMB, align 4
  %mul176 = fmul contract float %158, %159
  %sub177 = fsub contract float %mul175, %mul176
  store float %sub177, float* %rcn2B, align 4
  %160 = load float, float* %k4Bon, align 4
  %161 = load float, float* %Ca4CaM, align 4
  %mul178 = fmul contract float %160, %161
  %162 = load float, float* %B, align 4
  %mul179 = fmul contract float %mul178, %162
  %163 = load float, float* %k4Boff, align 4
  %164 = load float, float* %Ca4CaMB, align 4
  %mul180 = fmul contract float %163, %164
  %sub181 = fsub contract float %mul179, %mul180
  store float %sub181, float* %rcn4B, align 4
  %165 = load float, float* %CaNtot, align 4
  %166 = load float, float* %Ca4CaN, align 4
  %sub182 = fsub contract float %165, %166
  %167 = load float, float* %CaMCa4CaN, align 4
  %sub183 = fsub contract float %sub182, %167
  %168 = load float, float* %Ca2CaMCa4CaN, align 4
  %sub184 = fsub contract float %sub183, %168
  %169 = load float, float* %Ca4CaMCa4CaN, align 4
  %sub185 = fsub contract float %sub184, %169
  store float %sub185, float* %Ca2CaN, align 4
  %170 = load float, float* %kcanCaon, align 4
  %171 = load float, float* %Ca.addr, align 4
  %call186 = call fastcc float @_ZL3powfi(float %171, i32 2) #4
  %mul187 = fmul contract float %170, %call186
  %172 = load float, float* %Ca2CaN, align 4
  %mul188 = fmul contract float %mul187, %172
  %173 = load float, float* %kcanCaoff, align 4
  %174 = load float, float* %Ca4CaN, align 4
  %mul189 = fmul contract float %173, %174
  %sub190 = fsub contract float %mul188, %mul189
  store float %sub190, float* %rcnCa4CaN, align 4
  %175 = load float, float* %k02can, align 4
  %176 = load float, float* %Ca.addr, align 4
  %call191 = call fastcc float @_ZL3powfi(float %176, i32 2) #4
  %mul192 = fmul contract float %175, %call191
  %177 = load float, float* %CaMCa4CaN, align 4
  %mul193 = fmul contract float %mul192, %177
  %178 = load float, float* %k20can, align 4
  %179 = load float, float* %Ca2CaMCa4CaN, align 4
  %mul194 = fmul contract float %178, %179
  %sub195 = fsub contract float %mul193, %mul194
  store float %sub195, float* %rcn02CaN, align 4
  %180 = load float, float* %k24can, align 4
  %181 = load float, float* %Ca.addr, align 4
  %call196 = call fastcc float @_ZL3powfi(float %181, i32 2) #4
  %mul197 = fmul contract float %180, %call196
  %182 = load float, float* %Ca2CaMCa4CaN, align 4
  %mul198 = fmul contract float %mul197, %182
  %183 = load float, float* %k42can, align 4
  %184 = load float, float* %Ca4CaMCa4CaN, align 4
  %mul199 = fmul contract float %183, %184
  %sub200 = fsub contract float %mul198, %mul199
  store float %sub200, float* %rcn24CaN, align 4
  %185 = load float, float* %kcanCaM0on, align 4
  %186 = load float, float* %CaM, align 4
  %mul201 = fmul contract float %185, %186
  %187 = load float, float* %Ca4CaN, align 4
  %mul202 = fmul contract float %mul201, %187
  %188 = load float, float* %kcanCaM0off, align 4
  %189 = load float, float* %CaMCa4CaN, align 4
  %mul203 = fmul contract float %188, %189
  %sub204 = fsub contract float %mul202, %mul203
  store float %sub204, float* %rcn0CaN, align 4
  %190 = load float, float* %kcanCaM2on, align 4
  %191 = load float, float* %Ca2CaM, align 4
  %mul205 = fmul contract float %190, %191
  %192 = load float, float* %Ca4CaN, align 4
  %mul206 = fmul contract float %mul205, %192
  %193 = load float, float* %kcanCaM2off, align 4
  %194 = load float, float* %Ca2CaMCa4CaN, align 4
  %mul207 = fmul contract float %193, %194
  %sub208 = fsub contract float %mul206, %mul207
  store float %sub208, float* %rcn2CaN, align 4
  %195 = load float, float* %kcanCaM4on, align 4
  %196 = load float, float* %Ca4CaM, align 4
  %mul209 = fmul contract float %195, %196
  %197 = load float, float* %Ca4CaN, align 4
  %mul210 = fmul contract float %mul209, %197
  %198 = load float, float* %kcanCaM4off, align 4
  %199 = load float, float* %Ca4CaMCa4CaN, align 4
  %mul211 = fmul contract float %198, %199
  %sub212 = fsub contract float %mul210, %mul211
  store float %sub212, float* %rcn4CaN, align 4
  %200 = load float, float* %Pb2, align 4
  %sub213 = fsub contract float 1.000000e+00, %200
  %201 = load float, float* %Pb, align 4
  %sub214 = fsub contract float %sub213, %201
  %202 = load float, float* %Pt, align 4
  %sub215 = fsub contract float %sub214, %202
  %203 = load float, float* %Pt2, align 4
  %sub216 = fsub contract float %sub215, %203
  %204 = load float, float* %Pa, align 4
  %sub217 = fsub contract float %sub216, %204
  store float %sub217, float* %Pix, align 4
  %205 = load float, float* %kib2, align 4
  %206 = load float, float* %Ca2CaM, align 4
  %mul218 = fmul contract float %205, %206
  %207 = load float, float* %Pix, align 4
  %mul219 = fmul contract float %mul218, %207
  %208 = load float, float* %kb2i, align 4
  %209 = load float, float* %Pb2, align 4
  %mul220 = fmul contract float %208, %209
  %sub221 = fsub contract float %mul219, %mul220
  store float %sub221, float* %rcnCKib2, align 4
  %210 = load float, float* %kb24, align 4
  %211 = load float, float* %Ca.addr, align 4
  %call222 = call fastcc float @_ZL3powfi(float %211, i32 2) #4
  %mul223 = fmul contract float %210, %call222
  %212 = load float, float* %Pb2, align 4
  %mul224 = fmul contract float %mul223, %212
  %213 = load float, float* %kb42, align 4
  %214 = load float, float* %Pb, align 4
  %mul225 = fmul contract float %213, %214
  %sub226 = fsub contract float %mul224, %mul225
  store float %sub226, float* %rcnCKb2b, align 4
  %215 = load float, float* %kib, align 4
  %216 = load float, float* %Ca4CaM, align 4
  %mul227 = fmul contract float %215, %216
  %217 = load float, float* %Pix, align 4
  %mul228 = fmul contract float %mul227, %217
  %218 = load float, float* %kbi, align 4
  %219 = load float, float* %Pb, align 4
  %mul229 = fmul contract float %218, %219
  %sub230 = fsub contract float %mul228, %mul229
  store float %sub230, float* %rcnCKib, align 4
  %220 = load float, float* %Pb, align 4
  %221 = load float, float* %Pt, align 4
  %add231 = fadd contract float %220, %221
  %222 = load float, float* %Pt2, align 4
  %add232 = fadd contract float %add231, %222
  %223 = load float, float* %Pa, align 4
  %add233 = fadd contract float %add232, %223
  store float %add233, float* %T, align 4
  %224 = load float, float* %T, align 4
  %conv234 = fpext float %224 to double
  %mul235 = fmul contract double 5.500000e-02, %conv234
  %225 = load float, float* %T, align 4
  %call236 = call fastcc float @_ZL3powfi(float %225, i32 2) #4
  %conv237 = fpext float %call236 to double
  %mul238 = fmul contract double 7.400000e-03, %conv237
  %add239 = fadd contract double %mul235, %mul238
  %226 = load float, float* %T, align 4
  %call240 = call fastcc float @_ZL3powfi(float %226, i32 3) #4
  %conv241 = fpext float %call240 to double
  %mul242 = fmul contract double 1.500000e-02, %conv241
  %add243 = fadd contract double %add239, %mul242
  %conv244 = fptrunc double %add243 to float
  store float %conv244, float* %kbt, align 4
  %227 = load float, float* %kbt, align 4
  %228 = load float, float* %Pb, align 4
  %mul245 = fmul contract float %227, %228
  %229 = load float, float* %kpp1, align 4
  %230 = load float, float* %PP1tot, align 4
  %mul246 = fmul contract float %229, %230
  %231 = load float, float* %Pt, align 4
  %mul247 = fmul contract float %mul246, %231
  %232 = load float, float* %Kmpp1, align 4
  %233 = load float, float* %CaMKIItot, align 4
  %234 = load float, float* %Pt, align 4
  %mul248 = fmul contract float %233, %234
  %add249 = fadd contract float %232, %mul248
  %div250 = fdiv float %mul247, %add249
  %sub251 = fsub contract float %mul245, %div250
  store float %sub251, float* %rcnCKbt, align 4
  %235 = load float, float* %kt42, align 4
  %236 = load float, float* %Pt, align 4
  %mul252 = fmul contract float %235, %236
  %237 = load float, float* %kt24, align 4
  %238 = load float, float* %Ca.addr, align 4
  %call253 = call fastcc float @_ZL3powfi(float %238, i32 2) #4
  %mul254 = fmul contract float %237, %call253
  %239 = load float, float* %Pt2, align 4
  %mul255 = fmul contract float %mul254, %239
  %sub256 = fsub contract float %mul252, %mul255
  store float %sub256, float* %rcnCKtt2, align 4
  %240 = load float, float* %kta, align 4
  %241 = load float, float* %Pt, align 4
  %mul257 = fmul contract float %240, %241
  %242 = load float, float* %kat, align 4
  %243 = load float, float* %Ca4CaM, align 4
  %mul258 = fmul contract float %242, %243
  %244 = load float, float* %Pa, align 4
  %mul259 = fmul contract float %mul258, %244
  %sub260 = fsub contract float %mul257, %mul259
  store float %sub260, float* %rcnCKta, align 4
  %245 = load float, float* %kt2a, align 4
  %246 = load float, float* %Pt2, align 4
  %mul261 = fmul contract float %245, %246
  %247 = load float, float* %kat2, align 4
  %248 = load float, float* %Ca2CaM, align 4
  %mul262 = fmul contract float %247, %248
  %249 = load float, float* %Pa, align 4
  %mul263 = fmul contract float %mul262, %249
  %sub264 = fsub contract float %mul261, %mul263
  store float %sub264, float* %rcnCKt2a, align 4
  %250 = load float, float* %kpp1, align 4
  %251 = load float, float* %PP1tot, align 4
  %mul265 = fmul contract float %250, %251
  %252 = load float, float* %Pt2, align 4
  %mul266 = fmul contract float %mul265, %252
  %253 = load float, float* %Kmpp1, align 4
  %254 = load float, float* %CaMKIItot, align 4
  %255 = load float, float* %Pt2, align 4
  %mul267 = fmul contract float %254, %255
  %add268 = fadd contract float %253, %mul267
  %div269 = fdiv float %mul266, %add268
  store float %div269, float* %rcnCKt2b2, align 4
  %256 = load float, float* %kpp1, align 4
  %257 = load float, float* %PP1tot, align 4
  %mul270 = fmul contract float %256, %257
  %258 = load float, float* %Pa, align 4
  %mul271 = fmul contract float %mul270, %258
  %259 = load float, float* %Kmpp1, align 4
  %260 = load float, float* %CaMKIItot, align 4
  %261 = load float, float* %Pa, align 4
  %mul272 = fmul contract float %260, %261
  %add273 = fadd contract float %259, %mul272
  %div274 = fdiv float %mul271, %add273
  store float %div274, float* %rcnCKai, align 4
  %262 = load float, float* %rcn02, align 4
  %fneg = fneg float %262
  %263 = load float, float* %rcn0B, align 4
  %sub275 = fsub contract float %fneg, %263
  %264 = load float, float* %rcn0CaN, align 4
  %sub276 = fsub contract float %sub275, %264
  %conv277 = fpext float %sub276 to double
  %mul278 = fmul contract double 1.000000e-03, %conv277
  %conv279 = fptrunc double %mul278 to float
  store float %conv279, float* %dCaM, align 4
  %265 = load float, float* %rcn02, align 4
  %266 = load float, float* %rcn24, align 4
  %sub280 = fsub contract float %265, %266
  %267 = load float, float* %rcn2B, align 4
  %sub281 = fsub contract float %sub280, %267
  %268 = load float, float* %rcn2CaN, align 4
  %sub282 = fsub contract float %sub281, %268
  %269 = load float, float* %CaMKIItot, align 4
  %270 = load float, float* %rcnCKib2, align 4
  %fneg283 = fneg float %270
  %271 = load float, float* %rcnCKt2a, align 4
  %add284 = fadd contract float %fneg283, %271
  %mul285 = fmul contract float %269, %add284
  %add286 = fadd contract float %sub282, %mul285
  %conv287 = fpext float %add286 to double
  %mul288 = fmul contract double 1.000000e-03, %conv287
  %conv289 = fptrunc double %mul288 to float
  store float %conv289, float* %dCa2CaM, align 4
  %272 = load float, float* %rcn24, align 4
  %273 = load float, float* %rcn4B, align 4
  %sub290 = fsub contract float %272, %273
  %274 = load float, float* %rcn4CaN, align 4
  %sub291 = fsub contract float %sub290, %274
  %275 = load float, float* %CaMKIItot, align 4
  %276 = load float, float* %rcnCKib, align 4
  %fneg292 = fneg float %276
  %277 = load float, float* %rcnCKta, align 4
  %add293 = fadd contract float %fneg292, %277
  %mul294 = fmul contract float %275, %add293
  %add295 = fadd contract float %sub291, %mul294
  %conv296 = fpext float %add295 to double
  %mul297 = fmul contract double 1.000000e-03, %conv296
  %conv298 = fptrunc double %mul297 to float
  store float %conv298, float* %dCa4CaM, align 4
  %278 = load float, float* %rcn0B, align 4
  %279 = load float, float* %rcn02B, align 4
  %sub299 = fsub contract float %278, %279
  %conv300 = fpext float %sub299 to double
  %mul301 = fmul contract double 1.000000e-03, %conv300
  %conv302 = fptrunc double %mul301 to float
  store float %conv302, float* %dCaMB, align 4
  %280 = load float, float* %rcn02B, align 4
  %281 = load float, float* %rcn2B, align 4
  %add303 = fadd contract float %280, %281
  %282 = load float, float* %rcn24B, align 4
  %sub304 = fsub contract float %add303, %282
  %conv305 = fpext float %sub304 to double
  %mul306 = fmul contract double 1.000000e-03, %conv305
  %conv307 = fptrunc double %mul306 to float
  store float %conv307, float* %dCa2CaMB, align 4
  %283 = load float, float* %rcn24B, align 4
  %284 = load float, float* %rcn4B, align 4
  %add308 = fadd contract float %283, %284
  %conv309 = fpext float %add308 to double
  %mul310 = fmul contract double 1.000000e-03, %conv309
  %conv311 = fptrunc double %mul310 to float
  store float %conv311, float* %dCa4CaMB, align 4
  %285 = load float, float* %rcnCKib2, align 4
  %286 = load float, float* %rcnCKb2b, align 4
  %sub312 = fsub contract float %285, %286
  %287 = load float, float* %rcnCKt2b2, align 4
  %add313 = fadd contract float %sub312, %287
  %conv314 = fpext float %add313 to double
  %mul315 = fmul contract double 1.000000e-03, %conv314
  %conv316 = fptrunc double %mul315 to float
  store float %conv316, float* %dPb2, align 4
  %288 = load float, float* %rcnCKib, align 4
  %289 = load float, float* %rcnCKb2b, align 4
  %add317 = fadd contract float %288, %289
  %290 = load float, float* %rcnCKbt, align 4
  %sub318 = fsub contract float %add317, %290
  %conv319 = fpext float %sub318 to double
  %mul320 = fmul contract double 1.000000e-03, %conv319
  %conv321 = fptrunc double %mul320 to float
  store float %conv321, float* %dPb, align 4
  %291 = load float, float* %rcnCKbt, align 4
  %292 = load float, float* %rcnCKta, align 4
  %sub322 = fsub contract float %291, %292
  %293 = load float, float* %rcnCKtt2, align 4
  %sub323 = fsub contract float %sub322, %293
  %conv324 = fpext float %sub323 to double
  %mul325 = fmul contract double 1.000000e-03, %conv324
  %conv326 = fptrunc double %mul325 to float
  store float %conv326, float* %dPt, align 4
  %294 = load float, float* %rcnCKtt2, align 4
  %295 = load float, float* %rcnCKt2a, align 4
  %sub327 = fsub contract float %294, %295
  %296 = load float, float* %rcnCKt2b2, align 4
  %sub328 = fsub contract float %sub327, %296
  %conv329 = fpext float %sub328 to double
  %mul330 = fmul contract double 1.000000e-03, %conv329
  %conv331 = fptrunc double %mul330 to float
  store float %conv331, float* %dPt2, align 4
  %297 = load float, float* %rcnCKta, align 4
  %298 = load float, float* %rcnCKt2a, align 4
  %add332 = fadd contract float %297, %298
  %299 = load float, float* %rcnCKai, align 4
  %sub333 = fsub contract float %add332, %299
  %conv334 = fpext float %sub333 to double
  %mul335 = fmul contract double 1.000000e-03, %conv334
  %conv336 = fptrunc double %mul335 to float
  store float %conv336, float* %dPa, align 4
  %300 = load float, float* %rcnCa4CaN, align 4
  %301 = load float, float* %rcn0CaN, align 4
  %sub337 = fsub contract float %300, %301
  %302 = load float, float* %rcn2CaN, align 4
  %sub338 = fsub contract float %sub337, %302
  %303 = load float, float* %rcn4CaN, align 4
  %sub339 = fsub contract float %sub338, %303
  %conv340 = fpext float %sub339 to double
  %mul341 = fmul contract double 1.000000e-03, %conv340
  %conv342 = fptrunc double %mul341 to float
  store float %conv342, float* %dCa4CaN, align 4
  %304 = load float, float* %rcn0CaN, align 4
  %305 = load float, float* %rcn02CaN, align 4
  %sub343 = fsub contract float %304, %305
  %conv344 = fpext float %sub343 to double
  %mul345 = fmul contract double 1.000000e-03, %conv344
  %conv346 = fptrunc double %mul345 to float
  store float %conv346, float* %dCaMCa4CaN, align 4
  %306 = load float, float* %rcn2CaN, align 4
  %307 = load float, float* %rcn02CaN, align 4
  %add347 = fadd contract float %306, %307
  %308 = load float, float* %rcn24CaN, align 4
  %sub348 = fsub contract float %add347, %308
  %conv349 = fpext float %sub348 to double
  %mul350 = fmul contract double 1.000000e-03, %conv349
  %conv351 = fptrunc double %mul350 to float
  store float %conv351, float* %dCa2CaMCa4CaN, align 4
  %309 = load float, float* %rcn4CaN, align 4
  %310 = load float, float* %rcn24CaN, align 4
  %add352 = fadd contract float %309, %310
  %conv353 = fpext float %add352 to double
  %mul354 = fmul contract double 1.000000e-03, %conv353
  %conv355 = fptrunc double %mul354 to float
  store float %conv355, float* %dCa4CaMCa4CaN, align 4
  %311 = load float, float* %dCaM, align 4
  %312 = load float*, float** %d_finavalu.addr, align 8
  %313 = load i32, i32* %offset_1, align 4
  %idxprom356 = sext i32 %313 to i64
  %arrayidx357 = getelementptr inbounds float, float* %312, i64 %idxprom356
  store float %311, float* %arrayidx357, align 4
  %314 = load float, float* %dCa2CaM, align 4
  %315 = load float*, float** %d_finavalu.addr, align 8
  %316 = load i32, i32* %offset_2, align 4
  %idxprom358 = sext i32 %316 to i64
  %arrayidx359 = getelementptr inbounds float, float* %315, i64 %idxprom358
  store float %314, float* %arrayidx359, align 4
  %317 = load float, float* %dCa4CaM, align 4
  %318 = load float*, float** %d_finavalu.addr, align 8
  %319 = load i32, i32* %offset_3, align 4
  %idxprom360 = sext i32 %319 to i64
  %arrayidx361 = getelementptr inbounds float, float* %318, i64 %idxprom360
  store float %317, float* %arrayidx361, align 4
  %320 = load float, float* %dCaMB, align 4
  %321 = load float*, float** %d_finavalu.addr, align 8
  %322 = load i32, i32* %offset_4, align 4
  %idxprom362 = sext i32 %322 to i64
  %arrayidx363 = getelementptr inbounds float, float* %321, i64 %idxprom362
  store float %320, float* %arrayidx363, align 4
  %323 = load float, float* %dCa2CaMB, align 4
  %324 = load float*, float** %d_finavalu.addr, align 8
  %325 = load i32, i32* %offset_5, align 4
  %idxprom364 = sext i32 %325 to i64
  %arrayidx365 = getelementptr inbounds float, float* %324, i64 %idxprom364
  store float %323, float* %arrayidx365, align 4
  %326 = load float, float* %dCa4CaMB, align 4
  %327 = load float*, float** %d_finavalu.addr, align 8
  %328 = load i32, i32* %offset_6, align 4
  %idxprom366 = sext i32 %328 to i64
  %arrayidx367 = getelementptr inbounds float, float* %327, i64 %idxprom366
  store float %326, float* %arrayidx367, align 4
  %329 = load float, float* %dPb2, align 4
  %330 = load float*, float** %d_finavalu.addr, align 8
  %331 = load i32, i32* %offset_7, align 4
  %idxprom368 = sext i32 %331 to i64
  %arrayidx369 = getelementptr inbounds float, float* %330, i64 %idxprom368
  store float %329, float* %arrayidx369, align 4
  %332 = load float, float* %dPb, align 4
  %333 = load float*, float** %d_finavalu.addr, align 8
  %334 = load i32, i32* %offset_8, align 4
  %idxprom370 = sext i32 %334 to i64
  %arrayidx371 = getelementptr inbounds float, float* %333, i64 %idxprom370
  store float %332, float* %arrayidx371, align 4
  %335 = load float, float* %dPt, align 4
  %336 = load float*, float** %d_finavalu.addr, align 8
  %337 = load i32, i32* %offset_9, align 4
  %idxprom372 = sext i32 %337 to i64
  %arrayidx373 = getelementptr inbounds float, float* %336, i64 %idxprom372
  store float %335, float* %arrayidx373, align 4
  %338 = load float, float* %dPt2, align 4
  %339 = load float*, float** %d_finavalu.addr, align 8
  %340 = load i32, i32* %offset_10, align 4
  %idxprom374 = sext i32 %340 to i64
  %arrayidx375 = getelementptr inbounds float, float* %339, i64 %idxprom374
  store float %338, float* %arrayidx375, align 4
  %341 = load float, float* %dPa, align 4
  %342 = load float*, float** %d_finavalu.addr, align 8
  %343 = load i32, i32* %offset_11, align 4
  %idxprom376 = sext i32 %343 to i64
  %arrayidx377 = getelementptr inbounds float, float* %342, i64 %idxprom376
  store float %341, float* %arrayidx377, align 4
  %344 = load float, float* %dCa4CaN, align 4
  %345 = load float*, float** %d_finavalu.addr, align 8
  %346 = load i32, i32* %offset_12, align 4
  %idxprom378 = sext i32 %346 to i64
  %arrayidx379 = getelementptr inbounds float, float* %345, i64 %idxprom378
  store float %344, float* %arrayidx379, align 4
  %347 = load float, float* %dCaMCa4CaN, align 4
  %348 = load float*, float** %d_finavalu.addr, align 8
  %349 = load i32, i32* %offset_13, align 4
  %idxprom380 = sext i32 %349 to i64
  %arrayidx381 = getelementptr inbounds float, float* %348, i64 %idxprom380
  store float %347, float* %arrayidx381, align 4
  %350 = load float, float* %dCa2CaMCa4CaN, align 4
  %351 = load float*, float** %d_finavalu.addr, align 8
  %352 = load i32, i32* %offset_14, align 4
  %idxprom382 = sext i32 %352 to i64
  %arrayidx383 = getelementptr inbounds float, float* %351, i64 %idxprom382
  store float %350, float* %arrayidx383, align 4
  %353 = load float, float* %dCa4CaMCa4CaN, align 4
  %354 = load float*, float** %d_finavalu.addr, align 8
  %355 = load i32, i32* %offset_15, align 4
  %idxprom384 = sext i32 %355 to i64
  %arrayidx385 = getelementptr inbounds float, float* %354, i64 %idxprom384
  store float %353, float* %arrayidx385, align 4
  %356 = load float, float* %CaMKIItot, align 4
  %mul386 = fmul contract float 2.000000e+00, %356
  %357 = load float, float* %rcnCKtt2, align 4
  %358 = load float, float* %rcnCKb2b, align 4
  %sub387 = fsub contract float %357, %358
  %mul388 = fmul contract float %mul386, %sub387
  %359 = load float, float* %rcn02, align 4
  %360 = load float, float* %rcn24, align 4
  %add389 = fadd contract float %359, %360
  %361 = load float, float* %rcn02B, align 4
  %add390 = fadd contract float %add389, %361
  %362 = load float, float* %rcn24B, align 4
  %add391 = fadd contract float %add390, %362
  %363 = load float, float* %rcnCa4CaN, align 4
  %add392 = fadd contract float %add391, %363
  %364 = load float, float* %rcn02CaN, align 4
  %add393 = fadd contract float %add392, %364
  %365 = load float, float* %rcn24CaN, align 4
  %add394 = fadd contract float %add393, %365
  %mul395 = fmul contract float 2.000000e+00, %add394
  %sub396 = fsub contract float %mul388, %mul395
  %conv397 = fpext float %sub396 to double
  %mul398 = fmul contract double 1.000000e-03, %conv397
  %conv399 = fptrunc double %mul398 to float
  %366 = load float*, float** %d_finavalu.addr, align 8
  %367 = load i32, i32* %com_offset.addr, align 4
  %idxprom400 = sext i32 %367 to i64
  %arrayidx401 = getelementptr inbounds float, float* %366, i64 %idxprom400
  store float %conv399, float* %arrayidx401, align 4
  ret void
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z8kernel_2iPfS_S_S_(i32 %timeinst, float* noalias %initvalu, float* noalias %params, float* noalias %finavalu, float* noalias %com) local_unnamed_addr #0 {
entry:
  %timeinst.addr = alloca i32, align 4
  %initvalu.addr = alloca float*, align 8
  %params.addr = alloca float*, align 8
  %finavalu.addr = alloca float*, align 8
  %com.addr = alloca float*, align 8
  %valu_offset_ecc = alloca i32, align 4
  %valu_offset_Dyad = alloca i32, align 4
  %valu_offset_SL = alloca i32, align 4
  %valu_offset_Cyt = alloca i32, align 4
  %params_offset_Dyad = alloca i32, align 4
  %params_offset_SL = alloca i32, align 4
  %params_offset_Cyt = alloca i32, align 4
  %com_offset_Dyad = alloca i32, align 4
  %com_offset_SL = alloca i32, align 4
  %com_offset_Cyt = alloca i32, align 4
  %CaDyad = alloca float, align 4
  %CaSL = alloca float, align 4
  %CaCyt = alloca float, align 4
  %i = alloca i32, align 4
  store i32 %timeinst, i32* %timeinst.addr, align 4
  store float* %initvalu, float** %initvalu.addr, align 8
  store float* %params, float** %params.addr, align 8
  store float* %finavalu, float** %finavalu.addr, align 8
  store float* %com, float** %com.addr, align 8
  store i32 0, i32* %valu_offset_ecc, align 4
  store i32 46, i32* %valu_offset_Dyad, align 4
  store i32 61, i32* %valu_offset_SL, align 4
  store i32 76, i32* %valu_offset_Cyt, align 4
  store i32 0, i32* %params_offset_Dyad, align 4
  store i32 5, i32* %params_offset_SL, align 4
  store i32 10, i32* %params_offset_Cyt, align 4
  store i32 0, i32* %com_offset_Dyad, align 4
  store i32 1, i32* %com_offset_SL, align 4
  store i32 2, i32* %com_offset_Cyt, align 4
  %0 = load i32, i32* %timeinst.addr, align 4
  %conv = sitofp i32 %0 to float
  %1 = load float*, float** %initvalu.addr, align 8
  %2 = load float*, float** %finavalu.addr, align 8
  %3 = load i32, i32* %valu_offset_ecc, align 4
  %4 = load float*, float** %params.addr, align 8
  call void @_Z12kernel_ecc_2fPfS_iS_(float %conv, float* %1, float* %2, i32 %3, float* %4) #4
  %5 = load float*, float** %initvalu.addr, align 8
  %arrayidx = getelementptr inbounds float, float* %5, i64 35
  %6 = load float, float* %arrayidx, align 4
  %conv1 = fpext float %6 to double
  %mul = fmul contract double %conv1, 1.000000e+03
  %conv2 = fptrunc double %mul to float
  store float %conv2, float* %CaDyad, align 4
  %7 = load i32, i32* %timeinst.addr, align 4
  %conv3 = sitofp i32 %7 to float
  %8 = load float*, float** %initvalu.addr, align 8
  %9 = load float*, float** %finavalu.addr, align 8
  %10 = load i32, i32* %valu_offset_Dyad, align 4
  %11 = load float*, float** %params.addr, align 8
  %12 = load i32, i32* %params_offset_Dyad, align 4
  %13 = load float*, float** %com.addr, align 8
  %14 = load i32, i32* %com_offset_Dyad, align 4
  %15 = load float, float* %CaDyad, align 4
  call void @_Z12kernel_cam_2fPfS_iS_iS_if(float %conv3, float* %8, float* %9, i32 %10, float* %11, i32 %12, float* %13, i32 %14, float %15) #4
  %16 = load float*, float** %initvalu.addr, align 8
  %arrayidx4 = getelementptr inbounds float, float* %16, i64 36
  %17 = load float, float* %arrayidx4, align 4
  %conv5 = fpext float %17 to double
  %mul6 = fmul contract double %conv5, 1.000000e+03
  %conv7 = fptrunc double %mul6 to float
  store float %conv7, float* %CaSL, align 4
  %18 = load i32, i32* %timeinst.addr, align 4
  %conv8 = sitofp i32 %18 to float
  %19 = load float*, float** %initvalu.addr, align 8
  %20 = load float*, float** %finavalu.addr, align 8
  %21 = load i32, i32* %valu_offset_SL, align 4
  %22 = load float*, float** %params.addr, align 8
  %23 = load i32, i32* %params_offset_SL, align 4
  %24 = load float*, float** %com.addr, align 8
  %25 = load i32, i32* %com_offset_SL, align 4
  %26 = load float, float* %CaSL, align 4
  call void @_Z12kernel_cam_2fPfS_iS_iS_if(float %conv8, float* %19, float* %20, i32 %21, float* %22, i32 %23, float* %24, i32 %25, float %26) #4
  %27 = load float*, float** %initvalu.addr, align 8
  %arrayidx9 = getelementptr inbounds float, float* %27, i64 37
  %28 = load float, float* %arrayidx9, align 4
  %conv10 = fpext float %28 to double
  %mul11 = fmul contract double %conv10, 1.000000e+03
  %conv12 = fptrunc double %mul11 to float
  store float %conv12, float* %CaCyt, align 4
  %29 = load i32, i32* %timeinst.addr, align 4
  %conv13 = sitofp i32 %29 to float
  %30 = load float*, float** %initvalu.addr, align 8
  %31 = load float*, float** %finavalu.addr, align 8
  %32 = load i32, i32* %valu_offset_Cyt, align 4
  %33 = load float*, float** %params.addr, align 8
  %34 = load i32, i32* %params_offset_Cyt, align 4
  %35 = load float*, float** %com.addr, align 8
  %36 = load i32, i32* %com_offset_Cyt, align 4
  %37 = load float, float* %CaCyt, align 4
  call void @_Z12kernel_cam_2fPfS_iS_iS_if(float %conv13, float* %30, float* %31, i32 %32, float* %33, i32 %34, float* %35, i32 %36, float %37) #4
  %38 = load i32, i32* %timeinst.addr, align 4
  %39 = load float*, float** %initvalu.addr, align 8
  %40 = load float*, float** %finavalu.addr, align 8
  %41 = load i32, i32* %valu_offset_ecc, align 4
  %42 = load i32, i32* %valu_offset_Dyad, align 4
  %43 = load i32, i32* %valu_offset_SL, align 4
  %44 = load i32, i32* %valu_offset_Cyt, align 4
  %45 = load float*, float** %params.addr, align 8
  %46 = load float*, float** %com.addr, align 8
  call void @_Z12kernel_fin_2iPfS_iiiiS_S_(i32 %38, float* %39, float* %40, i32 %41, i32 %42, i32 %43, i32 %44, float* %45, float* %46) #4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %47 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %47, 91
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %48 = load float*, float** %finavalu.addr, align 8
  %49 = load i32, i32* %i, align 4
  %idxprom = sext i32 %49 to i64
  %arrayidx14 = getelementptr inbounds float, float* %48, i64 %idxprom
  %50 = load float, float* %arrayidx14, align 4
  %call = call fastcc zeroext i1 @_ZL5isnanf(float %50) #4
  %conv15 = zext i1 %call to i32
  %cmp16 = icmp eq i32 %conv15, 1
  br i1 %cmp16, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %51 = load float*, float** %finavalu.addr, align 8
  %52 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %52 to i64
  %arrayidx18 = getelementptr inbounds float, float* %51, i64 %idxprom17
  store float 0x3F1A36E2E0000000, float* %arrayidx18, align 4
  br label %if.end27

if.else:                                          ; preds = %for.body
  %53 = load float*, float** %finavalu.addr, align 8
  %54 = load i32, i32* %i, align 4
  %idxprom19 = sext i32 %54 to i64
  %arrayidx20 = getelementptr inbounds float, float* %53, i64 %idxprom19
  %55 = load float, float* %arrayidx20, align 4
  %call21 = call fastcc zeroext i1 @_ZL5isinff(float %55) #4
  %conv22 = zext i1 %call21 to i32
  %cmp23 = icmp eq i32 %conv22, 1
  br i1 %cmp23, label %if.then24, label %if.end

if.then24:                                        ; preds = %if.else
  %56 = load float*, float** %finavalu.addr, align 8
  %57 = load i32, i32* %i, align 4
  %idxprom25 = sext i32 %57 to i64
  %arrayidx26 = getelementptr inbounds float, float* %56, i64 %idxprom25
  store float 0x3F1A36E2E0000000, float* %arrayidx26, align 4
  br label %if.end

if.end:                                           ; preds = %if.then24, %if.else
  br label %if.end27

if.end27:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end27
  %58 = load i32, i32* %i, align 4
  %inc = add nsw i32 %58, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc zeroext i1 @_ZL5isnanf(float %__x) unnamed_addr #1 {
entry:
  %call = tail call fastcc i32 @_ZL8__isnanff(float %__x) #4
  %tobool = icmp ne i32 %call, 0
  ret i1 %tobool
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc zeroext i1 @_ZL5isinff(float %__x) unnamed_addr #1 {
entry:
  %call = tail call fastcc i32 @_ZL8__isinfff(float %__x) #4
  %tobool = icmp ne i32 %call, 0
  ret i1 %tobool
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z23embedded_fehlberg_7_8_2ffPfS_S_S_S_S_S_(float %h, float %timeinst, float* noalias %initvalu, float* noalias %finavalu, float* noalias %parameter, float* noalias %error, float* noalias %initvalu_temp, float* noalias %finavalu_temp, float* noalias %com) local_unnamed_addr #0 {
entry:
  %h.addr = alloca float, align 4
  %timeinst.addr = alloca float, align 4
  %initvalu.addr = alloca float*, align 8
  %finavalu.addr = alloca float*, align 8
  %parameter.addr = alloca float*, align 8
  %error.addr = alloca float*, align 8
  %initvalu_temp.addr = alloca float*, align 8
  %finavalu_temp.addr = alloca float*, align 8
  %com.addr = alloca float*, align 8
  %c_1_11 = alloca float, align 4
  %c6 = alloca float, align 4
  %c_7_8 = alloca float, align 4
  %c_9_10 = alloca float, align 4
  %a2 = alloca float, align 4
  %a3 = alloca float, align 4
  %a4 = alloca float, align 4
  %a5 = alloca float, align 4
  %a6 = alloca float, align 4
  %a7 = alloca float, align 4
  %a8 = alloca float, align 4
  %a9 = alloca float, align 4
  %a10 = alloca float, align 4
  %b31 = alloca float, align 4
  %b32 = alloca float, align 4
  %b41 = alloca float, align 4
  %b43 = alloca float, align 4
  %b51 = alloca float, align 4
  %b53 = alloca float, align 4
  %b54 = alloca float, align 4
  %b61 = alloca float, align 4
  %b64 = alloca float, align 4
  %b65 = alloca float, align 4
  %b71 = alloca float, align 4
  %b74 = alloca float, align 4
  %b75 = alloca float, align 4
  %b76 = alloca float, align 4
  %b81 = alloca float, align 4
  %b85 = alloca float, align 4
  %b86 = alloca float, align 4
  %b87 = alloca float, align 4
  %b91 = alloca float, align 4
  %b94 = alloca float, align 4
  %b95 = alloca float, align 4
  %b96 = alloca float, align 4
  %b97 = alloca float, align 4
  %b98 = alloca float, align 4
  %b10_1 = alloca float, align 4
  %b10_4 = alloca float, align 4
  %b10_5 = alloca float, align 4
  %b10_6 = alloca float, align 4
  %b10_7 = alloca float, align 4
  %b10_8 = alloca float, align 4
  %b10_9 = alloca float, align 4
  %b11_1 = alloca float, align 4
  %b11_4 = alloca float, align 4
  %b11_5 = alloca float, align 4
  %b11_6 = alloca float, align 4
  %b11_7 = alloca float, align 4
  %b11_8 = alloca float, align 4
  %b11_9 = alloca float, align 4
  %b11_10 = alloca float, align 4
  %b12_1 = alloca float, align 4
  %b12_6 = alloca float, align 4
  %b12_7 = alloca float, align 4
  %b12_8 = alloca float, align 4
  %b12_9 = alloca float, align 4
  %b12_10 = alloca float, align 4
  %b13_1 = alloca float, align 4
  %b13_4 = alloca float, align 4
  %b13_5 = alloca float, align 4
  %b13_6 = alloca float, align 4
  %b13_7 = alloca float, align 4
  %b13_8 = alloca float, align 4
  %b13_9 = alloca float, align 4
  %b13_10 = alloca float, align 4
  %err_factor = alloca float, align 4
  %h2_7 = alloca float, align 4
  %timeinst_temp = alloca float, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float %h, float* %h.addr, align 4
  store float %timeinst, float* %timeinst.addr, align 4
  store float* %initvalu, float** %initvalu.addr, align 8
  store float* %finavalu, float** %finavalu.addr, align 8
  store float* %parameter, float** %parameter.addr, align 8
  store float* %error, float** %error.addr, align 8
  store float* %initvalu_temp, float** %initvalu_temp.addr, align 8
  store float* %finavalu_temp, float** %finavalu_temp.addr, align 8
  store float* %com, float** %com.addr, align 8
  store float 0x3FA8FD8FE0000000, float* %c_1_11, align 4
  store float 0x3FD4B94BA0000000, float* %c6, align 4
  store float 0x3FD0750760000000, float* %c_7_8, align 4
  store float 0x3FA0750760000000, float* %c_9_10, align 4
  store float 0x3FB2F684C0000000, float* %a2, align 4
  store float 0x3FBC71C720000000, float* %a3, align 4
  store float 0x3FC5555560000000, float* %a4, align 4
  store float 0x3FDAAAAAA0000000, float* %a5, align 4
  store float 5.000000e-01, float* %a6, align 4
  store float 0x3FEAAAAAA0000000, float* %a7, align 4
  store float 0x3FC5555560000000, float* %a8, align 4
  store float 0x3FE5555560000000, float* %a9, align 4
  store float 0x3FD5555560000000, float* %a10, align 4
  store float 0x3F9C71C720000000, float* %b31, align 4
  store float 0x3FB5555560000000, float* %b32, align 4
  store float 0x3FA5555560000000, float* %b41, align 4
  store float 1.250000e-01, float* %b43, align 4
  store float 0x3FDAAAAAA0000000, float* %b51, align 4
  store float -1.562500e+00, float* %b53, align 4
  store float 1.562500e+00, float* %b54, align 4
  store float 0x3FA99999A0000000, float* %b61, align 4
  store float 2.500000e-01, float* %b64, align 4
  store float 0x3FC99999A0000000, float* %b65, align 4
  store float 0xBFCDA12F60000000, float* %b71, align 4
  store float 0x3FF284BDA0000000, float* %b74, align 4
  store float 0xC003425EE0000000, float* %b75, align 4
  store float 0x400284BDA0000000, float* %b76, align 4
  store float 0x3FBA740DA0000000, float* %b81, align 4
  store float 0x3FD159E260000000, float* %b85, align 4
  store float 0xBFCC71C720000000, float* %b86, align 4
  store float 0x3F8D950C80000000, float* %b87, align 4
  store float 2.000000e+00, float* %b91, align 4
  store float 0xC021AAAAA0000000, float* %b94, align 4
  store float 0x402F49F4A0000000, float* %b95, align 4
  store float 0xC027C71C80000000, float* %b96, align 4
  store float 0x3FE7D27D20000000, float* %b97, align 4
  store float 3.000000e+00, float* %b98, align 4
  store float 0xBFEAF684C0000000, float* %b10_1, align 4
  store float 0x3FCB425EE0000000, float* %b10_4, align 4
  store float 0xC01CEB2400000000, float* %b10_5, align 4
  store float 0x4017097B40000000, float* %b10_6, align 4
  store float 0xBFD4444440000000, float* %b10_7, align 4
  store float 0x4006AAAAA0000000, float* %b10_8, align 4
  store float 0xBFB5555560000000, float* %b10_9, align 4
  store float 0x3FE29959A0000000, float* %b11_1, align 4
  store float 0xC000A25760000000, float* %b11_4, align 4
  store float 0x40118B9D20000000, float* %b11_5, align 4
  store float 0xC00D5DA8A0000000, float* %b11_6, align 4
  store float 0x3FE0A5D680000000, float* %b11_7, align 4
  store float 0x3FE18F9C20000000, float* %b11_8, align 4
  store float 0x3FD18F9C20000000, float* %b11_9, align 4
  store float 0x3FDC18F9C0000000, float* %b11_10, align 4
  store float 0x3F8DF881E0000000, float* %b12_1, align 4
  store float 0xBFC2BB5120000000, float* %b12_6, align 4
  store float 0xBF8DF881E0000000, float* %b12_7, align 4
  store float 0xBFB2BB5120000000, float* %b12_8, align 4
  store float 0x3FB2BB5120000000, float* %b12_9, align 4
  store float 0x3FC2BB5120000000, float* %b12_10, align 4
  store float 0xBFDBBD10C0000000, float* %b13_1, align 4
  store float 0xC000A25760000000, float* %b13_4, align 4
  store float 0x40118B9D20000000, float* %b13_5, align 4
  store float 0xC00C31F380000000, float* %b13_6, align 4
  store float 0x3FE11DB8A0000000, float* %b13_7, align 4
  store float 0x3FE3E70640000000, float* %b13_8, align 4
  store float 0x3FC9C18FA0000000, float* %b13_9, align 4
  store float 0x3FD2BB5120000000, float* %b13_10, align 4
  store float 0xBFA8FD8FE0000000, float* %err_factor, align 4
  %0 = load float, float* %h.addr, align 4
  %mul = fmul contract float 0x3FB2F684C0000000, %0
  store float %mul, float* %h2_7, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc480, %entry
  %1 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %1, 13
  br i1 %cmp, label %for.body, label %for.end482

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %j, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %3 = load float, float* %timeinst.addr, align 4
  store float %3, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %4, 91
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %5 = load float*, float** %initvalu.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds float, float* %5, i64 %idxprom
  %7 = load float, float* %arrayidx, align 4
  %8 = load float*, float** %initvalu_temp.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds float, float* %8, i64 %idxprom5
  store float %7, float* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %if.end476

if.else:                                          ; preds = %for.body
  %11 = load i32, i32* %j, align 4
  %cmp7 = icmp eq i32 %11, 1
  br i1 %cmp7, label %if.then8, label %if.else24

if.then8:                                         ; preds = %if.else
  %12 = load float, float* %timeinst.addr, align 4
  %13 = load float, float* %h2_7, align 4
  %add = fadd contract float %12, %13
  store float %add, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc21, %if.then8
  %14 = load i32, i32* %i, align 4
  %cmp10 = icmp slt i32 %14, 91
  br i1 %cmp10, label %for.body11, label %for.end23

for.body11:                                       ; preds = %for.cond9
  %15 = load float*, float** %initvalu.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %16 to i64
  %arrayidx13 = getelementptr inbounds float, float* %15, i64 %idxprom12
  %17 = load float, float* %arrayidx13, align 4
  %18 = load float, float* %h2_7, align 4
  %19 = load float*, float** %finavalu_temp.addr, align 8
  %20 = load i32, i32* %i, align 4
  %add14 = add nsw i32 0, %20
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds float, float* %19, i64 %idxprom15
  %21 = load float, float* %arrayidx16, align 4
  %mul17 = fmul contract float %18, %21
  %add18 = fadd contract float %17, %mul17
  %22 = load float*, float** %initvalu_temp.addr, align 8
  %23 = load i32, i32* %i, align 4
  %idxprom19 = sext i32 %23 to i64
  %arrayidx20 = getelementptr inbounds float, float* %22, i64 %idxprom19
  store float %add18, float* %arrayidx20, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %for.body11
  %24 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %24, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond9

for.end23:                                        ; preds = %for.cond9
  br label %if.end475

if.else24:                                        ; preds = %if.else
  %25 = load i32, i32* %j, align 4
  %cmp25 = icmp eq i32 %25, 2
  br i1 %cmp25, label %if.then26, label %if.else50

if.then26:                                        ; preds = %if.else24
  %26 = load float, float* %timeinst.addr, align 4
  %27 = load float, float* %h.addr, align 4
  %mul27 = fmul contract float 0x3FBC71C720000000, %27
  %add28 = fadd contract float %26, %mul27
  store float %add28, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc47, %if.then26
  %28 = load i32, i32* %i, align 4
  %cmp30 = icmp slt i32 %28, 91
  br i1 %cmp30, label %for.body31, label %for.end49

for.body31:                                       ; preds = %for.cond29
  %29 = load float*, float** %initvalu.addr, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom32 = sext i32 %30 to i64
  %arrayidx33 = getelementptr inbounds float, float* %29, i64 %idxprom32
  %31 = load float, float* %arrayidx33, align 4
  %32 = load float, float* %h.addr, align 4
  %33 = load float*, float** %finavalu_temp.addr, align 8
  %34 = load i32, i32* %i, align 4
  %add34 = add nsw i32 0, %34
  %idxprom35 = sext i32 %add34 to i64
  %arrayidx36 = getelementptr inbounds float, float* %33, i64 %idxprom35
  %35 = load float, float* %arrayidx36, align 4
  %mul37 = fmul contract float 0x3F9C71C720000000, %35
  %36 = load float*, float** %finavalu_temp.addr, align 8
  %37 = load i32, i32* %i, align 4
  %add38 = add nsw i32 91, %37
  %idxprom39 = sext i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds float, float* %36, i64 %idxprom39
  %38 = load float, float* %arrayidx40, align 4
  %mul41 = fmul contract float 0x3FB5555560000000, %38
  %add42 = fadd contract float %mul37, %mul41
  %mul43 = fmul contract float %32, %add42
  %add44 = fadd contract float %31, %mul43
  %39 = load float*, float** %initvalu_temp.addr, align 8
  %40 = load i32, i32* %i, align 4
  %idxprom45 = sext i32 %40 to i64
  %arrayidx46 = getelementptr inbounds float, float* %39, i64 %idxprom45
  store float %add44, float* %arrayidx46, align 4
  br label %for.inc47

for.inc47:                                        ; preds = %for.body31
  %41 = load i32, i32* %i, align 4
  %inc48 = add nsw i32 %41, 1
  store i32 %inc48, i32* %i, align 4
  br label %for.cond29

for.end49:                                        ; preds = %for.cond29
  br label %if.end474

if.else50:                                        ; preds = %if.else24
  %42 = load i32, i32* %j, align 4
  %cmp51 = icmp eq i32 %42, 3
  br i1 %cmp51, label %if.then52, label %if.else76

if.then52:                                        ; preds = %if.else50
  %43 = load float, float* %timeinst.addr, align 4
  %44 = load float, float* %h.addr, align 4
  %mul53 = fmul contract float 0x3FC5555560000000, %44
  %add54 = fadd contract float %43, %mul53
  store float %add54, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond55

for.cond55:                                       ; preds = %for.inc73, %if.then52
  %45 = load i32, i32* %i, align 4
  %cmp56 = icmp slt i32 %45, 91
  br i1 %cmp56, label %for.body57, label %for.end75

for.body57:                                       ; preds = %for.cond55
  %46 = load float*, float** %initvalu.addr, align 8
  %47 = load i32, i32* %i, align 4
  %idxprom58 = sext i32 %47 to i64
  %arrayidx59 = getelementptr inbounds float, float* %46, i64 %idxprom58
  %48 = load float, float* %arrayidx59, align 4
  %49 = load float, float* %h.addr, align 4
  %50 = load float*, float** %finavalu_temp.addr, align 8
  %51 = load i32, i32* %i, align 4
  %add60 = add nsw i32 0, %51
  %idxprom61 = sext i32 %add60 to i64
  %arrayidx62 = getelementptr inbounds float, float* %50, i64 %idxprom61
  %52 = load float, float* %arrayidx62, align 4
  %mul63 = fmul contract float 0x3FA5555560000000, %52
  %53 = load float*, float** %finavalu_temp.addr, align 8
  %54 = load i32, i32* %i, align 4
  %add64 = add nsw i32 182, %54
  %idxprom65 = sext i32 %add64 to i64
  %arrayidx66 = getelementptr inbounds float, float* %53, i64 %idxprom65
  %55 = load float, float* %arrayidx66, align 4
  %mul67 = fmul contract float 1.250000e-01, %55
  %add68 = fadd contract float %mul63, %mul67
  %mul69 = fmul contract float %49, %add68
  %add70 = fadd contract float %48, %mul69
  %56 = load float*, float** %initvalu_temp.addr, align 8
  %57 = load i32, i32* %i, align 4
  %idxprom71 = sext i32 %57 to i64
  %arrayidx72 = getelementptr inbounds float, float* %56, i64 %idxprom71
  store float %add70, float* %arrayidx72, align 4
  br label %for.inc73

for.inc73:                                        ; preds = %for.body57
  %58 = load i32, i32* %i, align 4
  %inc74 = add nsw i32 %58, 1
  store i32 %inc74, i32* %i, align 4
  br label %for.cond55

for.end75:                                        ; preds = %for.cond55
  br label %if.end473

if.else76:                                        ; preds = %if.else50
  %59 = load i32, i32* %j, align 4
  %cmp77 = icmp eq i32 %59, 4
  br i1 %cmp77, label %if.then78, label %if.else107

if.then78:                                        ; preds = %if.else76
  %60 = load float, float* %timeinst.addr, align 4
  %61 = load float, float* %h.addr, align 4
  %mul79 = fmul contract float 0x3FDAAAAAA0000000, %61
  %add80 = fadd contract float %60, %mul79
  store float %add80, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond81

for.cond81:                                       ; preds = %for.inc104, %if.then78
  %62 = load i32, i32* %i, align 4
  %cmp82 = icmp slt i32 %62, 91
  br i1 %cmp82, label %for.body83, label %for.end106

for.body83:                                       ; preds = %for.cond81
  %63 = load float*, float** %initvalu.addr, align 8
  %64 = load i32, i32* %i, align 4
  %idxprom84 = sext i32 %64 to i64
  %arrayidx85 = getelementptr inbounds float, float* %63, i64 %idxprom84
  %65 = load float, float* %arrayidx85, align 4
  %66 = load float, float* %h.addr, align 4
  %67 = load float*, float** %finavalu_temp.addr, align 8
  %68 = load i32, i32* %i, align 4
  %add86 = add nsw i32 0, %68
  %idxprom87 = sext i32 %add86 to i64
  %arrayidx88 = getelementptr inbounds float, float* %67, i64 %idxprom87
  %69 = load float, float* %arrayidx88, align 4
  %mul89 = fmul contract float 0x3FDAAAAAA0000000, %69
  %70 = load float*, float** %finavalu_temp.addr, align 8
  %71 = load i32, i32* %i, align 4
  %add90 = add nsw i32 182, %71
  %idxprom91 = sext i32 %add90 to i64
  %arrayidx92 = getelementptr inbounds float, float* %70, i64 %idxprom91
  %72 = load float, float* %arrayidx92, align 4
  %mul93 = fmul contract float -1.562500e+00, %72
  %add94 = fadd contract float %mul89, %mul93
  %73 = load float*, float** %finavalu_temp.addr, align 8
  %74 = load i32, i32* %i, align 4
  %add95 = add nsw i32 273, %74
  %idxprom96 = sext i32 %add95 to i64
  %arrayidx97 = getelementptr inbounds float, float* %73, i64 %idxprom96
  %75 = load float, float* %arrayidx97, align 4
  %mul98 = fmul contract float 1.562500e+00, %75
  %add99 = fadd contract float %add94, %mul98
  %mul100 = fmul contract float %66, %add99
  %add101 = fadd contract float %65, %mul100
  %76 = load float*, float** %initvalu_temp.addr, align 8
  %77 = load i32, i32* %i, align 4
  %idxprom102 = sext i32 %77 to i64
  %arrayidx103 = getelementptr inbounds float, float* %76, i64 %idxprom102
  store float %add101, float* %arrayidx103, align 4
  br label %for.inc104

for.inc104:                                       ; preds = %for.body83
  %78 = load i32, i32* %i, align 4
  %inc105 = add nsw i32 %78, 1
  store i32 %inc105, i32* %i, align 4
  br label %for.cond81

for.end106:                                       ; preds = %for.cond81
  br label %if.end472

if.else107:                                       ; preds = %if.else76
  %79 = load i32, i32* %j, align 4
  %cmp108 = icmp eq i32 %79, 5
  br i1 %cmp108, label %if.then109, label %if.else138

if.then109:                                       ; preds = %if.else107
  %80 = load float, float* %timeinst.addr, align 4
  %81 = load float, float* %h.addr, align 4
  %mul110 = fmul contract float 5.000000e-01, %81
  %add111 = fadd contract float %80, %mul110
  store float %add111, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond112

for.cond112:                                      ; preds = %for.inc135, %if.then109
  %82 = load i32, i32* %i, align 4
  %cmp113 = icmp slt i32 %82, 91
  br i1 %cmp113, label %for.body114, label %for.end137

for.body114:                                      ; preds = %for.cond112
  %83 = load float*, float** %initvalu.addr, align 8
  %84 = load i32, i32* %i, align 4
  %idxprom115 = sext i32 %84 to i64
  %arrayidx116 = getelementptr inbounds float, float* %83, i64 %idxprom115
  %85 = load float, float* %arrayidx116, align 4
  %86 = load float, float* %h.addr, align 4
  %87 = load float*, float** %finavalu_temp.addr, align 8
  %88 = load i32, i32* %i, align 4
  %add117 = add nsw i32 0, %88
  %idxprom118 = sext i32 %add117 to i64
  %arrayidx119 = getelementptr inbounds float, float* %87, i64 %idxprom118
  %89 = load float, float* %arrayidx119, align 4
  %mul120 = fmul contract float 0x3FA99999A0000000, %89
  %90 = load float*, float** %finavalu_temp.addr, align 8
  %91 = load i32, i32* %i, align 4
  %add121 = add nsw i32 273, %91
  %idxprom122 = sext i32 %add121 to i64
  %arrayidx123 = getelementptr inbounds float, float* %90, i64 %idxprom122
  %92 = load float, float* %arrayidx123, align 4
  %mul124 = fmul contract float 2.500000e-01, %92
  %add125 = fadd contract float %mul120, %mul124
  %93 = load float*, float** %finavalu_temp.addr, align 8
  %94 = load i32, i32* %i, align 4
  %add126 = add nsw i32 364, %94
  %idxprom127 = sext i32 %add126 to i64
  %arrayidx128 = getelementptr inbounds float, float* %93, i64 %idxprom127
  %95 = load float, float* %arrayidx128, align 4
  %mul129 = fmul contract float 0x3FC99999A0000000, %95
  %add130 = fadd contract float %add125, %mul129
  %mul131 = fmul contract float %86, %add130
  %add132 = fadd contract float %85, %mul131
  %96 = load float*, float** %initvalu_temp.addr, align 8
  %97 = load i32, i32* %i, align 4
  %idxprom133 = sext i32 %97 to i64
  %arrayidx134 = getelementptr inbounds float, float* %96, i64 %idxprom133
  store float %add132, float* %arrayidx134, align 4
  br label %for.inc135

for.inc135:                                       ; preds = %for.body114
  %98 = load i32, i32* %i, align 4
  %inc136 = add nsw i32 %98, 1
  store i32 %inc136, i32* %i, align 4
  br label %for.cond112

for.end137:                                       ; preds = %for.cond112
  br label %if.end471

if.else138:                                       ; preds = %if.else107
  %99 = load i32, i32* %j, align 4
  %cmp139 = icmp eq i32 %99, 6
  br i1 %cmp139, label %if.then140, label %if.else174

if.then140:                                       ; preds = %if.else138
  %100 = load float, float* %timeinst.addr, align 4
  %101 = load float, float* %h.addr, align 4
  %mul141 = fmul contract float 0x3FEAAAAAA0000000, %101
  %add142 = fadd contract float %100, %mul141
  store float %add142, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond143

for.cond143:                                      ; preds = %for.inc171, %if.then140
  %102 = load i32, i32* %i, align 4
  %cmp144 = icmp slt i32 %102, 91
  br i1 %cmp144, label %for.body145, label %for.end173

for.body145:                                      ; preds = %for.cond143
  %103 = load float*, float** %initvalu.addr, align 8
  %104 = load i32, i32* %i, align 4
  %idxprom146 = sext i32 %104 to i64
  %arrayidx147 = getelementptr inbounds float, float* %103, i64 %idxprom146
  %105 = load float, float* %arrayidx147, align 4
  %106 = load float, float* %h.addr, align 4
  %107 = load float*, float** %finavalu_temp.addr, align 8
  %108 = load i32, i32* %i, align 4
  %add148 = add nsw i32 0, %108
  %idxprom149 = sext i32 %add148 to i64
  %arrayidx150 = getelementptr inbounds float, float* %107, i64 %idxprom149
  %109 = load float, float* %arrayidx150, align 4
  %mul151 = fmul contract float 0xBFCDA12F60000000, %109
  %110 = load float*, float** %finavalu_temp.addr, align 8
  %111 = load i32, i32* %i, align 4
  %add152 = add nsw i32 273, %111
  %idxprom153 = sext i32 %add152 to i64
  %arrayidx154 = getelementptr inbounds float, float* %110, i64 %idxprom153
  %112 = load float, float* %arrayidx154, align 4
  %mul155 = fmul contract float 0x3FF284BDA0000000, %112
  %add156 = fadd contract float %mul151, %mul155
  %113 = load float*, float** %finavalu_temp.addr, align 8
  %114 = load i32, i32* %i, align 4
  %add157 = add nsw i32 364, %114
  %idxprom158 = sext i32 %add157 to i64
  %arrayidx159 = getelementptr inbounds float, float* %113, i64 %idxprom158
  %115 = load float, float* %arrayidx159, align 4
  %mul160 = fmul contract float 0xC003425EE0000000, %115
  %add161 = fadd contract float %add156, %mul160
  %116 = load float*, float** %finavalu_temp.addr, align 8
  %117 = load i32, i32* %i, align 4
  %add162 = add nsw i32 455, %117
  %idxprom163 = sext i32 %add162 to i64
  %arrayidx164 = getelementptr inbounds float, float* %116, i64 %idxprom163
  %118 = load float, float* %arrayidx164, align 4
  %mul165 = fmul contract float 0x400284BDA0000000, %118
  %add166 = fadd contract float %add161, %mul165
  %mul167 = fmul contract float %106, %add166
  %add168 = fadd contract float %105, %mul167
  %119 = load float*, float** %initvalu_temp.addr, align 8
  %120 = load i32, i32* %i, align 4
  %idxprom169 = sext i32 %120 to i64
  %arrayidx170 = getelementptr inbounds float, float* %119, i64 %idxprom169
  store float %add168, float* %arrayidx170, align 4
  br label %for.inc171

for.inc171:                                       ; preds = %for.body145
  %121 = load i32, i32* %i, align 4
  %inc172 = add nsw i32 %121, 1
  store i32 %inc172, i32* %i, align 4
  br label %for.cond143

for.end173:                                       ; preds = %for.cond143
  br label %if.end470

if.else174:                                       ; preds = %if.else138
  %122 = load i32, i32* %j, align 4
  %cmp175 = icmp eq i32 %122, 7
  br i1 %cmp175, label %if.then176, label %if.else210

if.then176:                                       ; preds = %if.else174
  %123 = load float, float* %timeinst.addr, align 4
  %124 = load float, float* %h.addr, align 4
  %mul177 = fmul contract float 0x3FC5555560000000, %124
  %add178 = fadd contract float %123, %mul177
  store float %add178, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond179

for.cond179:                                      ; preds = %for.inc207, %if.then176
  %125 = load i32, i32* %i, align 4
  %cmp180 = icmp slt i32 %125, 91
  br i1 %cmp180, label %for.body181, label %for.end209

for.body181:                                      ; preds = %for.cond179
  %126 = load float*, float** %initvalu.addr, align 8
  %127 = load i32, i32* %i, align 4
  %idxprom182 = sext i32 %127 to i64
  %arrayidx183 = getelementptr inbounds float, float* %126, i64 %idxprom182
  %128 = load float, float* %arrayidx183, align 4
  %129 = load float, float* %h.addr, align 4
  %130 = load float*, float** %finavalu_temp.addr, align 8
  %131 = load i32, i32* %i, align 4
  %add184 = add nsw i32 0, %131
  %idxprom185 = sext i32 %add184 to i64
  %arrayidx186 = getelementptr inbounds float, float* %130, i64 %idxprom185
  %132 = load float, float* %arrayidx186, align 4
  %mul187 = fmul contract float 0x3FBA740DA0000000, %132
  %133 = load float*, float** %finavalu_temp.addr, align 8
  %134 = load i32, i32* %i, align 4
  %add188 = add nsw i32 364, %134
  %idxprom189 = sext i32 %add188 to i64
  %arrayidx190 = getelementptr inbounds float, float* %133, i64 %idxprom189
  %135 = load float, float* %arrayidx190, align 4
  %mul191 = fmul contract float 0x3FD159E260000000, %135
  %add192 = fadd contract float %mul187, %mul191
  %136 = load float*, float** %finavalu_temp.addr, align 8
  %137 = load i32, i32* %i, align 4
  %add193 = add nsw i32 455, %137
  %idxprom194 = sext i32 %add193 to i64
  %arrayidx195 = getelementptr inbounds float, float* %136, i64 %idxprom194
  %138 = load float, float* %arrayidx195, align 4
  %mul196 = fmul contract float 0xBFCC71C720000000, %138
  %add197 = fadd contract float %add192, %mul196
  %139 = load float*, float** %finavalu_temp.addr, align 8
  %140 = load i32, i32* %i, align 4
  %add198 = add nsw i32 546, %140
  %idxprom199 = sext i32 %add198 to i64
  %arrayidx200 = getelementptr inbounds float, float* %139, i64 %idxprom199
  %141 = load float, float* %arrayidx200, align 4
  %mul201 = fmul contract float 0x3F8D950C80000000, %141
  %add202 = fadd contract float %add197, %mul201
  %mul203 = fmul contract float %129, %add202
  %add204 = fadd contract float %128, %mul203
  %142 = load float*, float** %initvalu_temp.addr, align 8
  %143 = load i32, i32* %i, align 4
  %idxprom205 = sext i32 %143 to i64
  %arrayidx206 = getelementptr inbounds float, float* %142, i64 %idxprom205
  store float %add204, float* %arrayidx206, align 4
  br label %for.inc207

for.inc207:                                       ; preds = %for.body181
  %144 = load i32, i32* %i, align 4
  %inc208 = add nsw i32 %144, 1
  store i32 %inc208, i32* %i, align 4
  br label %for.cond179

for.end209:                                       ; preds = %for.cond179
  br label %if.end469

if.else210:                                       ; preds = %if.else174
  %145 = load i32, i32* %j, align 4
  %cmp211 = icmp eq i32 %145, 8
  br i1 %cmp211, label %if.then212, label %if.else256

if.then212:                                       ; preds = %if.else210
  %146 = load float, float* %timeinst.addr, align 4
  %147 = load float, float* %h.addr, align 4
  %mul213 = fmul contract float 0x3FE5555560000000, %147
  %add214 = fadd contract float %146, %mul213
  store float %add214, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond215

for.cond215:                                      ; preds = %for.inc253, %if.then212
  %148 = load i32, i32* %i, align 4
  %cmp216 = icmp slt i32 %148, 91
  br i1 %cmp216, label %for.body217, label %for.end255

for.body217:                                      ; preds = %for.cond215
  %149 = load float*, float** %initvalu.addr, align 8
  %150 = load i32, i32* %i, align 4
  %idxprom218 = sext i32 %150 to i64
  %arrayidx219 = getelementptr inbounds float, float* %149, i64 %idxprom218
  %151 = load float, float* %arrayidx219, align 4
  %152 = load float, float* %h.addr, align 4
  %153 = load float*, float** %finavalu_temp.addr, align 8
  %154 = load i32, i32* %i, align 4
  %add220 = add nsw i32 0, %154
  %idxprom221 = sext i32 %add220 to i64
  %arrayidx222 = getelementptr inbounds float, float* %153, i64 %idxprom221
  %155 = load float, float* %arrayidx222, align 4
  %mul223 = fmul contract float 2.000000e+00, %155
  %156 = load float*, float** %finavalu_temp.addr, align 8
  %157 = load i32, i32* %i, align 4
  %add224 = add nsw i32 273, %157
  %idxprom225 = sext i32 %add224 to i64
  %arrayidx226 = getelementptr inbounds float, float* %156, i64 %idxprom225
  %158 = load float, float* %arrayidx226, align 4
  %mul227 = fmul contract float 0xC021AAAAA0000000, %158
  %add228 = fadd contract float %mul223, %mul227
  %159 = load float*, float** %finavalu_temp.addr, align 8
  %160 = load i32, i32* %i, align 4
  %add229 = add nsw i32 364, %160
  %idxprom230 = sext i32 %add229 to i64
  %arrayidx231 = getelementptr inbounds float, float* %159, i64 %idxprom230
  %161 = load float, float* %arrayidx231, align 4
  %mul232 = fmul contract float 0x402F49F4A0000000, %161
  %add233 = fadd contract float %add228, %mul232
  %162 = load float*, float** %finavalu_temp.addr, align 8
  %163 = load i32, i32* %i, align 4
  %add234 = add nsw i32 455, %163
  %idxprom235 = sext i32 %add234 to i64
  %arrayidx236 = getelementptr inbounds float, float* %162, i64 %idxprom235
  %164 = load float, float* %arrayidx236, align 4
  %mul237 = fmul contract float 0xC027C71C80000000, %164
  %add238 = fadd contract float %add233, %mul237
  %165 = load float*, float** %finavalu_temp.addr, align 8
  %166 = load i32, i32* %i, align 4
  %add239 = add nsw i32 546, %166
  %idxprom240 = sext i32 %add239 to i64
  %arrayidx241 = getelementptr inbounds float, float* %165, i64 %idxprom240
  %167 = load float, float* %arrayidx241, align 4
  %mul242 = fmul contract float 0x3FE7D27D20000000, %167
  %add243 = fadd contract float %add238, %mul242
  %168 = load float*, float** %finavalu_temp.addr, align 8
  %169 = load i32, i32* %i, align 4
  %add244 = add nsw i32 637, %169
  %idxprom245 = sext i32 %add244 to i64
  %arrayidx246 = getelementptr inbounds float, float* %168, i64 %idxprom245
  %170 = load float, float* %arrayidx246, align 4
  %mul247 = fmul contract float 3.000000e+00, %170
  %add248 = fadd contract float %add243, %mul247
  %mul249 = fmul contract float %152, %add248
  %add250 = fadd contract float %151, %mul249
  %171 = load float*, float** %initvalu_temp.addr, align 8
  %172 = load i32, i32* %i, align 4
  %idxprom251 = sext i32 %172 to i64
  %arrayidx252 = getelementptr inbounds float, float* %171, i64 %idxprom251
  store float %add250, float* %arrayidx252, align 4
  br label %for.inc253

for.inc253:                                       ; preds = %for.body217
  %173 = load i32, i32* %i, align 4
  %inc254 = add nsw i32 %173, 1
  store i32 %inc254, i32* %i, align 4
  br label %for.cond215

for.end255:                                       ; preds = %for.cond215
  br label %if.end468

if.else256:                                       ; preds = %if.else210
  %174 = load i32, i32* %j, align 4
  %cmp257 = icmp eq i32 %174, 9
  br i1 %cmp257, label %if.then258, label %if.else307

if.then258:                                       ; preds = %if.else256
  %175 = load float, float* %timeinst.addr, align 4
  %176 = load float, float* %h.addr, align 4
  %mul259 = fmul contract float 0x3FD5555560000000, %176
  %add260 = fadd contract float %175, %mul259
  store float %add260, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond261

for.cond261:                                      ; preds = %for.inc304, %if.then258
  %177 = load i32, i32* %i, align 4
  %cmp262 = icmp slt i32 %177, 91
  br i1 %cmp262, label %for.body263, label %for.end306

for.body263:                                      ; preds = %for.cond261
  %178 = load float*, float** %initvalu.addr, align 8
  %179 = load i32, i32* %i, align 4
  %idxprom264 = sext i32 %179 to i64
  %arrayidx265 = getelementptr inbounds float, float* %178, i64 %idxprom264
  %180 = load float, float* %arrayidx265, align 4
  %181 = load float, float* %h.addr, align 4
  %182 = load float*, float** %finavalu_temp.addr, align 8
  %183 = load i32, i32* %i, align 4
  %add266 = add nsw i32 0, %183
  %idxprom267 = sext i32 %add266 to i64
  %arrayidx268 = getelementptr inbounds float, float* %182, i64 %idxprom267
  %184 = load float, float* %arrayidx268, align 4
  %mul269 = fmul contract float 0xBFEAF684C0000000, %184
  %185 = load float*, float** %finavalu_temp.addr, align 8
  %186 = load i32, i32* %i, align 4
  %add270 = add nsw i32 273, %186
  %idxprom271 = sext i32 %add270 to i64
  %arrayidx272 = getelementptr inbounds float, float* %185, i64 %idxprom271
  %187 = load float, float* %arrayidx272, align 4
  %mul273 = fmul contract float 0x3FCB425EE0000000, %187
  %add274 = fadd contract float %mul269, %mul273
  %188 = load float*, float** %finavalu_temp.addr, align 8
  %189 = load i32, i32* %i, align 4
  %add275 = add nsw i32 364, %189
  %idxprom276 = sext i32 %add275 to i64
  %arrayidx277 = getelementptr inbounds float, float* %188, i64 %idxprom276
  %190 = load float, float* %arrayidx277, align 4
  %mul278 = fmul contract float 0xC01CEB2400000000, %190
  %add279 = fadd contract float %add274, %mul278
  %191 = load float*, float** %finavalu_temp.addr, align 8
  %192 = load i32, i32* %i, align 4
  %add280 = add nsw i32 455, %192
  %idxprom281 = sext i32 %add280 to i64
  %arrayidx282 = getelementptr inbounds float, float* %191, i64 %idxprom281
  %193 = load float, float* %arrayidx282, align 4
  %mul283 = fmul contract float 0x4017097B40000000, %193
  %add284 = fadd contract float %add279, %mul283
  %194 = load float*, float** %finavalu_temp.addr, align 8
  %195 = load i32, i32* %i, align 4
  %add285 = add nsw i32 546, %195
  %idxprom286 = sext i32 %add285 to i64
  %arrayidx287 = getelementptr inbounds float, float* %194, i64 %idxprom286
  %196 = load float, float* %arrayidx287, align 4
  %mul288 = fmul contract float 0xBFD4444440000000, %196
  %add289 = fadd contract float %add284, %mul288
  %197 = load float*, float** %finavalu_temp.addr, align 8
  %198 = load i32, i32* %i, align 4
  %add290 = add nsw i32 637, %198
  %idxprom291 = sext i32 %add290 to i64
  %arrayidx292 = getelementptr inbounds float, float* %197, i64 %idxprom291
  %199 = load float, float* %arrayidx292, align 4
  %mul293 = fmul contract float 0x4006AAAAA0000000, %199
  %add294 = fadd contract float %add289, %mul293
  %200 = load float*, float** %finavalu_temp.addr, align 8
  %201 = load i32, i32* %i, align 4
  %add295 = add nsw i32 728, %201
  %idxprom296 = sext i32 %add295 to i64
  %arrayidx297 = getelementptr inbounds float, float* %200, i64 %idxprom296
  %202 = load float, float* %arrayidx297, align 4
  %mul298 = fmul contract float 0xBFB5555560000000, %202
  %add299 = fadd contract float %add294, %mul298
  %mul300 = fmul contract float %181, %add299
  %add301 = fadd contract float %180, %mul300
  %203 = load float*, float** %initvalu_temp.addr, align 8
  %204 = load i32, i32* %i, align 4
  %idxprom302 = sext i32 %204 to i64
  %arrayidx303 = getelementptr inbounds float, float* %203, i64 %idxprom302
  store float %add301, float* %arrayidx303, align 4
  br label %for.inc304

for.inc304:                                       ; preds = %for.body263
  %205 = load i32, i32* %i, align 4
  %inc305 = add nsw i32 %205, 1
  store i32 %inc305, i32* %i, align 4
  br label %for.cond261

for.end306:                                       ; preds = %for.cond261
  br label %if.end467

if.else307:                                       ; preds = %if.else256
  %206 = load i32, i32* %j, align 4
  %cmp308 = icmp eq i32 %206, 10
  br i1 %cmp308, label %if.then309, label %if.else362

if.then309:                                       ; preds = %if.else307
  %207 = load float, float* %timeinst.addr, align 4
  %208 = load float, float* %h.addr, align 4
  %add310 = fadd contract float %207, %208
  store float %add310, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond311

for.cond311:                                      ; preds = %for.inc359, %if.then309
  %209 = load i32, i32* %i, align 4
  %cmp312 = icmp slt i32 %209, 91
  br i1 %cmp312, label %for.body313, label %for.end361

for.body313:                                      ; preds = %for.cond311
  %210 = load float*, float** %initvalu.addr, align 8
  %211 = load i32, i32* %i, align 4
  %idxprom314 = sext i32 %211 to i64
  %arrayidx315 = getelementptr inbounds float, float* %210, i64 %idxprom314
  %212 = load float, float* %arrayidx315, align 4
  %213 = load float, float* %h.addr, align 4
  %214 = load float*, float** %finavalu_temp.addr, align 8
  %215 = load i32, i32* %i, align 4
  %add316 = add nsw i32 0, %215
  %idxprom317 = sext i32 %add316 to i64
  %arrayidx318 = getelementptr inbounds float, float* %214, i64 %idxprom317
  %216 = load float, float* %arrayidx318, align 4
  %mul319 = fmul contract float 0x3FE29959A0000000, %216
  %217 = load float*, float** %finavalu_temp.addr, align 8
  %218 = load i32, i32* %i, align 4
  %add320 = add nsw i32 273, %218
  %idxprom321 = sext i32 %add320 to i64
  %arrayidx322 = getelementptr inbounds float, float* %217, i64 %idxprom321
  %219 = load float, float* %arrayidx322, align 4
  %mul323 = fmul contract float 0xC000A25760000000, %219
  %add324 = fadd contract float %mul319, %mul323
  %220 = load float*, float** %finavalu_temp.addr, align 8
  %221 = load i32, i32* %i, align 4
  %add325 = add nsw i32 364, %221
  %idxprom326 = sext i32 %add325 to i64
  %arrayidx327 = getelementptr inbounds float, float* %220, i64 %idxprom326
  %222 = load float, float* %arrayidx327, align 4
  %mul328 = fmul contract float 0x40118B9D20000000, %222
  %add329 = fadd contract float %add324, %mul328
  %223 = load float*, float** %finavalu_temp.addr, align 8
  %224 = load i32, i32* %i, align 4
  %add330 = add nsw i32 455, %224
  %idxprom331 = sext i32 %add330 to i64
  %arrayidx332 = getelementptr inbounds float, float* %223, i64 %idxprom331
  %225 = load float, float* %arrayidx332, align 4
  %mul333 = fmul contract float 0xC00D5DA8A0000000, %225
  %add334 = fadd contract float %add329, %mul333
  %226 = load float*, float** %finavalu_temp.addr, align 8
  %227 = load i32, i32* %i, align 4
  %add335 = add nsw i32 546, %227
  %idxprom336 = sext i32 %add335 to i64
  %arrayidx337 = getelementptr inbounds float, float* %226, i64 %idxprom336
  %228 = load float, float* %arrayidx337, align 4
  %mul338 = fmul contract float 0x3FE0A5D680000000, %228
  %add339 = fadd contract float %add334, %mul338
  %229 = load float*, float** %finavalu_temp.addr, align 8
  %230 = load i32, i32* %i, align 4
  %add340 = add nsw i32 637, %230
  %idxprom341 = sext i32 %add340 to i64
  %arrayidx342 = getelementptr inbounds float, float* %229, i64 %idxprom341
  %231 = load float, float* %arrayidx342, align 4
  %mul343 = fmul contract float 0x3FE18F9C20000000, %231
  %add344 = fadd contract float %add339, %mul343
  %232 = load float*, float** %finavalu_temp.addr, align 8
  %233 = load i32, i32* %i, align 4
  %add345 = add nsw i32 728, %233
  %idxprom346 = sext i32 %add345 to i64
  %arrayidx347 = getelementptr inbounds float, float* %232, i64 %idxprom346
  %234 = load float, float* %arrayidx347, align 4
  %mul348 = fmul contract float 0x3FD18F9C20000000, %234
  %add349 = fadd contract float %add344, %mul348
  %235 = load float*, float** %finavalu_temp.addr, align 8
  %236 = load i32, i32* %i, align 4
  %add350 = add nsw i32 819, %236
  %idxprom351 = sext i32 %add350 to i64
  %arrayidx352 = getelementptr inbounds float, float* %235, i64 %idxprom351
  %237 = load float, float* %arrayidx352, align 4
  %mul353 = fmul contract float 0x3FDC18F9C0000000, %237
  %add354 = fadd contract float %add349, %mul353
  %mul355 = fmul contract float %213, %add354
  %add356 = fadd contract float %212, %mul355
  %238 = load float*, float** %initvalu_temp.addr, align 8
  %239 = load i32, i32* %i, align 4
  %idxprom357 = sext i32 %239 to i64
  %arrayidx358 = getelementptr inbounds float, float* %238, i64 %idxprom357
  store float %add356, float* %arrayidx358, align 4
  br label %for.inc359

for.inc359:                                       ; preds = %for.body313
  %240 = load i32, i32* %i, align 4
  %inc360 = add nsw i32 %240, 1
  store i32 %inc360, i32* %i, align 4
  br label %for.cond311

for.end361:                                       ; preds = %for.cond311
  br label %if.end466

if.else362:                                       ; preds = %if.else307
  %241 = load i32, i32* %j, align 4
  %cmp363 = icmp eq i32 %241, 11
  br i1 %cmp363, label %if.then364, label %if.else406

if.then364:                                       ; preds = %if.else362
  %242 = load float, float* %timeinst.addr, align 4
  store float %242, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond365

for.cond365:                                      ; preds = %for.inc403, %if.then364
  %243 = load i32, i32* %i, align 4
  %cmp366 = icmp slt i32 %243, 91
  br i1 %cmp366, label %for.body367, label %for.end405

for.body367:                                      ; preds = %for.cond365
  %244 = load float*, float** %initvalu.addr, align 8
  %245 = load i32, i32* %i, align 4
  %idxprom368 = sext i32 %245 to i64
  %arrayidx369 = getelementptr inbounds float, float* %244, i64 %idxprom368
  %246 = load float, float* %arrayidx369, align 4
  %247 = load float, float* %h.addr, align 4
  %248 = load float*, float** %finavalu_temp.addr, align 8
  %249 = load i32, i32* %i, align 4
  %add370 = add nsw i32 0, %249
  %idxprom371 = sext i32 %add370 to i64
  %arrayidx372 = getelementptr inbounds float, float* %248, i64 %idxprom371
  %250 = load float, float* %arrayidx372, align 4
  %mul373 = fmul contract float 0x3F8DF881E0000000, %250
  %251 = load float*, float** %finavalu_temp.addr, align 8
  %252 = load i32, i32* %i, align 4
  %add374 = add nsw i32 455, %252
  %idxprom375 = sext i32 %add374 to i64
  %arrayidx376 = getelementptr inbounds float, float* %251, i64 %idxprom375
  %253 = load float, float* %arrayidx376, align 4
  %mul377 = fmul contract float 0xBFC2BB5120000000, %253
  %add378 = fadd contract float %mul373, %mul377
  %254 = load float*, float** %finavalu_temp.addr, align 8
  %255 = load i32, i32* %i, align 4
  %add379 = add nsw i32 546, %255
  %idxprom380 = sext i32 %add379 to i64
  %arrayidx381 = getelementptr inbounds float, float* %254, i64 %idxprom380
  %256 = load float, float* %arrayidx381, align 4
  %mul382 = fmul contract float 0xBF8DF881E0000000, %256
  %add383 = fadd contract float %add378, %mul382
  %257 = load float*, float** %finavalu_temp.addr, align 8
  %258 = load i32, i32* %i, align 4
  %add384 = add nsw i32 637, %258
  %idxprom385 = sext i32 %add384 to i64
  %arrayidx386 = getelementptr inbounds float, float* %257, i64 %idxprom385
  %259 = load float, float* %arrayidx386, align 4
  %mul387 = fmul contract float 0xBFB2BB5120000000, %259
  %add388 = fadd contract float %add383, %mul387
  %260 = load float*, float** %finavalu_temp.addr, align 8
  %261 = load i32, i32* %i, align 4
  %add389 = add nsw i32 728, %261
  %idxprom390 = sext i32 %add389 to i64
  %arrayidx391 = getelementptr inbounds float, float* %260, i64 %idxprom390
  %262 = load float, float* %arrayidx391, align 4
  %mul392 = fmul contract float 0x3FB2BB5120000000, %262
  %add393 = fadd contract float %add388, %mul392
  %263 = load float*, float** %finavalu_temp.addr, align 8
  %264 = load i32, i32* %i, align 4
  %add394 = add nsw i32 819, %264
  %idxprom395 = sext i32 %add394 to i64
  %arrayidx396 = getelementptr inbounds float, float* %263, i64 %idxprom395
  %265 = load float, float* %arrayidx396, align 4
  %mul397 = fmul contract float 0x3FC2BB5120000000, %265
  %add398 = fadd contract float %add393, %mul397
  %mul399 = fmul contract float %247, %add398
  %add400 = fadd contract float %246, %mul399
  %266 = load float*, float** %initvalu_temp.addr, align 8
  %267 = load i32, i32* %i, align 4
  %idxprom401 = sext i32 %267 to i64
  %arrayidx402 = getelementptr inbounds float, float* %266, i64 %idxprom401
  store float %add400, float* %arrayidx402, align 4
  br label %for.inc403

for.inc403:                                       ; preds = %for.body367
  %268 = load i32, i32* %i, align 4
  %inc404 = add nsw i32 %268, 1
  store i32 %inc404, i32* %i, align 4
  br label %for.cond365

for.end405:                                       ; preds = %for.cond365
  br label %if.end465

if.else406:                                       ; preds = %if.else362
  %269 = load i32, i32* %j, align 4
  %cmp407 = icmp eq i32 %269, 12
  br i1 %cmp407, label %if.then408, label %if.end

if.then408:                                       ; preds = %if.else406
  %270 = load float, float* %timeinst.addr, align 4
  %271 = load float, float* %h.addr, align 4
  %add409 = fadd contract float %270, %271
  store float %add409, float* %timeinst_temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond410

for.cond410:                                      ; preds = %for.inc462, %if.then408
  %272 = load i32, i32* %i, align 4
  %cmp411 = icmp slt i32 %272, 91
  br i1 %cmp411, label %for.body412, label %for.end464

for.body412:                                      ; preds = %for.cond410
  %273 = load float*, float** %initvalu.addr, align 8
  %274 = load i32, i32* %i, align 4
  %idxprom413 = sext i32 %274 to i64
  %arrayidx414 = getelementptr inbounds float, float* %273, i64 %idxprom413
  %275 = load float, float* %arrayidx414, align 4
  %276 = load float, float* %h.addr, align 4
  %277 = load float*, float** %finavalu_temp.addr, align 8
  %278 = load i32, i32* %i, align 4
  %add415 = add nsw i32 0, %278
  %idxprom416 = sext i32 %add415 to i64
  %arrayidx417 = getelementptr inbounds float, float* %277, i64 %idxprom416
  %279 = load float, float* %arrayidx417, align 4
  %mul418 = fmul contract float 0xBFDBBD10C0000000, %279
  %280 = load float*, float** %finavalu_temp.addr, align 8
  %281 = load i32, i32* %i, align 4
  %add419 = add nsw i32 273, %281
  %idxprom420 = sext i32 %add419 to i64
  %arrayidx421 = getelementptr inbounds float, float* %280, i64 %idxprom420
  %282 = load float, float* %arrayidx421, align 4
  %mul422 = fmul contract float 0xC000A25760000000, %282
  %add423 = fadd contract float %mul418, %mul422
  %283 = load float*, float** %finavalu_temp.addr, align 8
  %284 = load i32, i32* %i, align 4
  %add424 = add nsw i32 364, %284
  %idxprom425 = sext i32 %add424 to i64
  %arrayidx426 = getelementptr inbounds float, float* %283, i64 %idxprom425
  %285 = load float, float* %arrayidx426, align 4
  %mul427 = fmul contract float 0x40118B9D20000000, %285
  %add428 = fadd contract float %add423, %mul427
  %286 = load float*, float** %finavalu_temp.addr, align 8
  %287 = load i32, i32* %i, align 4
  %add429 = add nsw i32 455, %287
  %idxprom430 = sext i32 %add429 to i64
  %arrayidx431 = getelementptr inbounds float, float* %286, i64 %idxprom430
  %288 = load float, float* %arrayidx431, align 4
  %mul432 = fmul contract float 0xC00C31F380000000, %288
  %add433 = fadd contract float %add428, %mul432
  %289 = load float*, float** %finavalu_temp.addr, align 8
  %290 = load i32, i32* %i, align 4
  %add434 = add nsw i32 546, %290
  %idxprom435 = sext i32 %add434 to i64
  %arrayidx436 = getelementptr inbounds float, float* %289, i64 %idxprom435
  %291 = load float, float* %arrayidx436, align 4
  %mul437 = fmul contract float 0x3FE11DB8A0000000, %291
  %add438 = fadd contract float %add433, %mul437
  %292 = load float*, float** %finavalu_temp.addr, align 8
  %293 = load i32, i32* %i, align 4
  %add439 = add nsw i32 637, %293
  %idxprom440 = sext i32 %add439 to i64
  %arrayidx441 = getelementptr inbounds float, float* %292, i64 %idxprom440
  %294 = load float, float* %arrayidx441, align 4
  %mul442 = fmul contract float 0x3FE3E70640000000, %294
  %add443 = fadd contract float %add438, %mul442
  %295 = load float*, float** %finavalu_temp.addr, align 8
  %296 = load i32, i32* %i, align 4
  %add444 = add nsw i32 728, %296
  %idxprom445 = sext i32 %add444 to i64
  %arrayidx446 = getelementptr inbounds float, float* %295, i64 %idxprom445
  %297 = load float, float* %arrayidx446, align 4
  %mul447 = fmul contract float 0x3FC9C18FA0000000, %297
  %add448 = fadd contract float %add443, %mul447
  %298 = load float*, float** %finavalu_temp.addr, align 8
  %299 = load i32, i32* %i, align 4
  %add449 = add nsw i32 819, %299
  %idxprom450 = sext i32 %add449 to i64
  %arrayidx451 = getelementptr inbounds float, float* %298, i64 %idxprom450
  %300 = load float, float* %arrayidx451, align 4
  %mul452 = fmul contract float 0x3FD2BB5120000000, %300
  %add453 = fadd contract float %add448, %mul452
  %301 = load float*, float** %finavalu_temp.addr, align 8
  %302 = load i32, i32* %i, align 4
  %add454 = add nsw i32 1001, %302
  %idxprom455 = sext i32 %add454 to i64
  %arrayidx456 = getelementptr inbounds float, float* %301, i64 %idxprom455
  %303 = load float, float* %arrayidx456, align 4
  %add457 = fadd contract float %add453, %303
  %mul458 = fmul contract float %276, %add457
  %add459 = fadd contract float %275, %mul458
  %304 = load float*, float** %initvalu_temp.addr, align 8
  %305 = load i32, i32* %i, align 4
  %idxprom460 = sext i32 %305 to i64
  %arrayidx461 = getelementptr inbounds float, float* %304, i64 %idxprom460
  store float %add459, float* %arrayidx461, align 4
  br label %for.inc462

for.inc462:                                       ; preds = %for.body412
  %306 = load i32, i32* %i, align 4
  %inc463 = add nsw i32 %306, 1
  store i32 %inc463, i32* %i, align 4
  br label %for.cond410

for.end464:                                       ; preds = %for.cond410
  br label %if.end

if.end:                                           ; preds = %for.end464, %if.else406
  br label %if.end465

if.end465:                                        ; preds = %if.end, %for.end405
  br label %if.end466

if.end466:                                        ; preds = %if.end465, %for.end361
  br label %if.end467

if.end467:                                        ; preds = %if.end466, %for.end306
  br label %if.end468

if.end468:                                        ; preds = %if.end467, %for.end255
  br label %if.end469

if.end469:                                        ; preds = %if.end468, %for.end209
  br label %if.end470

if.end470:                                        ; preds = %if.end469, %for.end173
  br label %if.end471

if.end471:                                        ; preds = %if.end470, %for.end137
  br label %if.end472

if.end472:                                        ; preds = %if.end471, %for.end106
  br label %if.end473

if.end473:                                        ; preds = %if.end472, %for.end75
  br label %if.end474

if.end474:                                        ; preds = %if.end473, %for.end49
  br label %if.end475

if.end475:                                        ; preds = %if.end474, %for.end23
  br label %if.end476

if.end476:                                        ; preds = %if.end475, %for.end
  %307 = load float, float* %timeinst_temp, align 4
  %conv = fptosi float %307 to i32
  %308 = load float*, float** %initvalu_temp.addr, align 8
  %309 = load float*, float** %parameter.addr, align 8
  %310 = load float*, float** %finavalu_temp.addr, align 8
  %311 = load i32, i32* %j, align 4
  %mul477 = mul nsw i32 %311, 91
  %idxprom478 = sext i32 %mul477 to i64
  %arrayidx479 = getelementptr inbounds float, float* %310, i64 %idxprom478
  %312 = load float*, float** %com.addr, align 8
  call void @_Z8kernel_2iPfS_S_S_(i32 %conv, float* %308, float* %309, float* %arrayidx479, float* %312) #4
  br label %for.inc480

for.inc480:                                       ; preds = %if.end476
  %313 = load i32, i32* %j, align 4
  %inc481 = add nsw i32 %313, 1
  store i32 %inc481, i32* %j, align 4
  br label %for.cond

for.end482:                                       ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond483

for.cond483:                                      ; preds = %for.inc523, %for.end482
  %314 = load i32, i32* %i, align 4
  %cmp484 = icmp slt i32 %314, 91
  br i1 %cmp484, label %for.body485, label %for.end525

for.body485:                                      ; preds = %for.cond483
  %315 = load float*, float** %initvalu.addr, align 8
  %316 = load i32, i32* %i, align 4
  %idxprom486 = sext i32 %316 to i64
  %arrayidx487 = getelementptr inbounds float, float* %315, i64 %idxprom486
  %317 = load float, float* %arrayidx487, align 4
  %318 = load float, float* %h.addr, align 4
  %319 = load float*, float** %finavalu_temp.addr, align 8
  %320 = load i32, i32* %i, align 4
  %add488 = add nsw i32 0, %320
  %idxprom489 = sext i32 %add488 to i64
  %arrayidx490 = getelementptr inbounds float, float* %319, i64 %idxprom489
  %321 = load float, float* %arrayidx490, align 4
  %322 = load float*, float** %finavalu_temp.addr, align 8
  %323 = load i32, i32* %i, align 4
  %add491 = add nsw i32 910, %323
  %idxprom492 = sext i32 %add491 to i64
  %arrayidx493 = getelementptr inbounds float, float* %322, i64 %idxprom492
  %324 = load float, float* %arrayidx493, align 4
  %add494 = fadd contract float %321, %324
  %mul495 = fmul contract float 0x3FA8FD8FE0000000, %add494
  %325 = load float*, float** %finavalu_temp.addr, align 8
  %326 = load i32, i32* %i, align 4
  %add496 = add nsw i32 455, %326
  %idxprom497 = sext i32 %add496 to i64
  %arrayidx498 = getelementptr inbounds float, float* %325, i64 %idxprom497
  %327 = load float, float* %arrayidx498, align 4
  %mul499 = fmul contract float 0x3FD4B94BA0000000, %327
  %add500 = fadd contract float %mul495, %mul499
  %328 = load float*, float** %finavalu_temp.addr, align 8
  %329 = load i32, i32* %i, align 4
  %add501 = add nsw i32 546, %329
  %idxprom502 = sext i32 %add501 to i64
  %arrayidx503 = getelementptr inbounds float, float* %328, i64 %idxprom502
  %330 = load float, float* %arrayidx503, align 4
  %331 = load float*, float** %finavalu_temp.addr, align 8
  %332 = load i32, i32* %i, align 4
  %add504 = add nsw i32 637, %332
  %idxprom505 = sext i32 %add504 to i64
  %arrayidx506 = getelementptr inbounds float, float* %331, i64 %idxprom505
  %333 = load float, float* %arrayidx506, align 4
  %add507 = fadd contract float %330, %333
  %mul508 = fmul contract float 0x3FD0750760000000, %add507
  %add509 = fadd contract float %add500, %mul508
  %334 = load float*, float** %finavalu_temp.addr, align 8
  %335 = load i32, i32* %i, align 4
  %add510 = add nsw i32 728, %335
  %idxprom511 = sext i32 %add510 to i64
  %arrayidx512 = getelementptr inbounds float, float* %334, i64 %idxprom511
  %336 = load float, float* %arrayidx512, align 4
  %337 = load float*, float** %finavalu_temp.addr, align 8
  %338 = load i32, i32* %i, align 4
  %add513 = add nsw i32 819, %338
  %idxprom514 = sext i32 %add513 to i64
  %arrayidx515 = getelementptr inbounds float, float* %337, i64 %idxprom514
  %339 = load float, float* %arrayidx515, align 4
  %add516 = fadd contract float %336, %339
  %mul517 = fmul contract float 0x3FA0750760000000, %add516
  %add518 = fadd contract float %add509, %mul517
  %mul519 = fmul contract float %318, %add518
  %add520 = fadd contract float %317, %mul519
  %340 = load float*, float** %finavalu.addr, align 8
  %341 = load i32, i32* %i, align 4
  %idxprom521 = sext i32 %341 to i64
  %arrayidx522 = getelementptr inbounds float, float* %340, i64 %idxprom521
  store float %add520, float* %arrayidx522, align 4
  br label %for.inc523

for.inc523:                                       ; preds = %for.body485
  %342 = load i32, i32* %i, align 4
  %inc524 = add nsw i32 %342, 1
  store i32 %inc524, i32* %i, align 4
  br label %for.cond483

for.end525:                                       ; preds = %for.cond483
  store i32 0, i32* %i, align 4
  br label %for.cond526

for.cond526:                                      ; preds = %for.inc546, %for.end525
  %343 = load i32, i32* %i, align 4
  %cmp527 = icmp slt i32 %343, 91
  br i1 %cmp527, label %for.body528, label %for.end548

for.body528:                                      ; preds = %for.cond526
  %344 = load float*, float** %finavalu_temp.addr, align 8
  %345 = load i32, i32* %i, align 4
  %add529 = add nsw i32 0, %345
  %idxprom530 = sext i32 %add529 to i64
  %arrayidx531 = getelementptr inbounds float, float* %344, i64 %idxprom530
  %346 = load float, float* %arrayidx531, align 4
  %347 = load float*, float** %finavalu_temp.addr, align 8
  %348 = load i32, i32* %i, align 4
  %add532 = add nsw i32 910, %348
  %idxprom533 = sext i32 %add532 to i64
  %arrayidx534 = getelementptr inbounds float, float* %347, i64 %idxprom533
  %349 = load float, float* %arrayidx534, align 4
  %add535 = fadd contract float %346, %349
  %350 = load float*, float** %finavalu_temp.addr, align 8
  %351 = load i32, i32* %i, align 4
  %add536 = add nsw i32 1001, %351
  %idxprom537 = sext i32 %add536 to i64
  %arrayidx538 = getelementptr inbounds float, float* %350, i64 %idxprom537
  %352 = load float, float* %arrayidx538, align 4
  %sub = fsub contract float %add535, %352
  %353 = load float*, float** %finavalu_temp.addr, align 8
  %354 = load i32, i32* %i, align 4
  %add539 = add nsw i32 1092, %354
  %idxprom540 = sext i32 %add539 to i64
  %arrayidx541 = getelementptr inbounds float, float* %353, i64 %idxprom540
  %355 = load float, float* %arrayidx541, align 4
  %sub542 = fsub contract float %sub, %355
  %mul543 = fmul contract float 0xBFA8FD8FE0000000, %sub542
  %call = call fastcc float @_ZL4fabsf(float %mul543) #4
  %356 = load float*, float** %error.addr, align 8
  %357 = load i32, i32* %i, align 4
  %idxprom544 = sext i32 %357 to i64
  %arrayidx545 = getelementptr inbounds float, float* %356, i64 %idxprom544
  store float %call, float* %arrayidx545, align 4
  br label %for.inc546

for.inc546:                                       ; preds = %for.body528
  %358 = load i32, i32* %i, align 4
  %inc547 = add nsw i32 %358, 1
  store i32 %inc547, i32* %i, align 4
  br label %for.cond526

for.end548:                                       ; preds = %for.cond526
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL4fabsf(float %__x) unnamed_addr #1 {
entry:
  %call = tail call fastcc float @_ZL5fabsff(float %__x) #4
  ret float %call
}

; Function Attrs: convergent noinline nounwind optnone
define dso_local void @_Z8solver_2iiPfS_S_S_S_S_S_S_S_(i32 %workload, i32 %xmax, float* noalias %x, float* noalias %y, float* noalias %params, float* noalias %com, float* noalias %err, float* noalias %scale, float* noalias %yy, float* noalias %initvalu_temp, float* noalias %finavalu_temp) local_unnamed_addr #0 {
entry:
  %local_intra_warp_idx = alloca i32
  %local_inter_warp_idx = alloca i32
  store i32 0, i32* %local_inter_warp_idx
  %0 = load i32, i32* @block_size
  %k_intra_warp_ = alloca i32, i32 %0
  %1 = load i32, i32* @block_size
  %j_intra_warp_ = alloca i32, i32 %1
  %2 = load i32, i32* @block_size
  %i_intra_warp_ = alloca i32, i32 %2
  %3 = load i32, i32* @block_size
  %scale_fina_intra_warp_ = alloca float, i32 %3
  %4 = load i32, i32* @block_size
  %scale_min_intra_warp_ = alloca float, i32 %4
  %5 = load i32, i32* @block_size
  %outside_intra_warp_ = alloca i32, i32 %5
  %6 = load i32, i32* @block_size
  %error_intra_warp_ = alloca i32, i32 %6
  %7 = load i32, i32* @block_size
  %xmin_intra_warp_ = alloca i32, i32 %7
  %8 = load i32, i32* @block_size
  %tolerance_intra_warp_ = alloca float, i32 %8
  %9 = load i32, i32* @block_size
  %h_intra_warp_ = alloca float, i32 %9
  %10 = load i32, i32* @block_size
  %h_init_intra_warp_ = alloca float, i32 %10
  %11 = load i32, i32* @block_size
  %err_exponent_intra_warp_ = alloca float, i32 %11
  %12 = load i32, i32* @block_size
  %com_pointer_intra_warp_ = alloca i32, i32 %12
  %13 = load i32, i32* @block_size
  %finavalu_temp_pointer_intra_warp_ = alloca i32, i32 %13
  %14 = load i32, i32* @block_size
  %initvalu_temp_pointer_intra_warp_ = alloca i32, i32 %14
  %15 = load i32, i32* @block_size
  %params_pointer_intra_warp_ = alloca i32, i32 %15
  %16 = load i32, i32* @block_size
  %yy_pointer_intra_warp_ = alloca i32, i32 %16
  %17 = load i32, i32* @block_size
  %scale_pointer_intra_warp_ = alloca i32, i32 %17
  %18 = load i32, i32* @block_size
  %err_pointer_intra_warp_ = alloca i32, i32 %18
  %19 = load i32, i32* @block_size
  %x_pointer_current_intra_warp_ = alloca i64, i32 %19
  %20 = load i32, i32* @block_size
  %y_pointer_current_intra_warp_ = alloca i64, i32 %20
  %21 = load i32, i32* @block_size
  %y_pointer_initial_intra_warp_ = alloca i64, i32 %21
  %22 = load i32, i32* @block_size
  %tid_intra_warp_ = alloca i32, i32 %22
  %23 = load i32, i32* @block_size
  %tx_intra_warp_ = alloca i32, i32 %23
  %24 = load i32, i32* @block_size
  %bx_intra_warp_ = alloca i32, i32 %24
  %25 = load i32, i32* @block_size
  %finavalu_temp.addr_intra_warp_ = alloca float*, i32 %25
  %26 = load i32, i32* @block_size
  %initvalu_temp.addr_intra_warp_ = alloca float*, i32 %26
  %27 = load i32, i32* @block_size
  %yy.addr_intra_warp_ = alloca float*, i32 %27
  %28 = load i32, i32* @block_size
  %scale.addr_intra_warp_ = alloca float*, i32 %28
  %29 = load i32, i32* @block_size
  %err.addr_intra_warp_ = alloca float*, i32 %29
  %30 = load i32, i32* @block_size
  %com.addr_intra_warp_ = alloca float*, i32 %30
  %31 = load i32, i32* @block_size
  %params.addr_intra_warp_ = alloca float*, i32 %31
  %32 = load i32, i32* @block_size
  %y.addr_intra_warp_ = alloca float*, i32 %32
  %33 = load i32, i32* @block_size
  %x.addr_intra_warp_ = alloca float*, i32 %33
  %34 = load i32, i32* @block_size
  %xmax.addr_intra_warp_ = alloca i32, i32 %34
  %35 = load i32, i32* @block_size
  %workload.addr_intra_warp_ = alloca i32, i32 %35
  %36 = load i32, i32* @block_size
  %cond.ex_phi_intra_warp_ = alloca double, i32 %36
  %37 = load i32, i32* @block_size
  %cond130.ex_phi_intra_warp_ = alloca double, i32 %37
  %38 = load i32, i32* @block_size
  %cond133.ex_phi_intra_warp_ = alloca double, i32 %38
  %cond133.ex_phi = alloca double
  br label %entry_after_block_sync_4

entry_after_block_sync_4:                         ; preds = %entry
  %cond130.ex_phi = alloca double
  %cond.ex_phi = alloca double
  %workload.addr = alloca i32, align 4
  %xmax.addr = alloca i32, align 4
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  %params.addr = alloca float*, align 8
  %com.addr = alloca float*, align 8
  %err.addr = alloca float*, align 8
  %scale.addr = alloca float*, align 8
  %yy.addr = alloca float*, align 8
  %initvalu_temp.addr = alloca float*, align 8
  %finavalu_temp.addr = alloca float*, align 8
  %bx = alloca i32, align 4
  %tx = alloca i32, align 4
  %tid = alloca i32, align 4
  %y_pointer_initial = alloca i64, align 8
  %y_pointer_current = alloca i64, align 8
  %x_pointer_current = alloca i64, align 8
  %err_pointer = alloca i32, align 4
  %scale_pointer = alloca i32, align 4
  %yy_pointer = alloca i32, align 4
  %params_pointer = alloca i32, align 4
  %initvalu_temp_pointer = alloca i32, align 4
  %finavalu_temp_pointer = alloca i32, align 4
  %com_pointer = alloca i32, align 4
  %err_exponent = alloca float, align 4
  %h_init = alloca float, align 4
  %h = alloca float, align 4
  %tolerance = alloca float, align 4
  %xmin = alloca i32, align 4
  %error = alloca i32, align 4
  %outside = alloca i32, align 4
  %scale_min = alloca float, align 4
  %scale_fina = alloca float, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  br label %entry_after_block_sync_2

entry_after_block_sync_2:                         ; preds = %entry_after_block_sync_4
  br label %intra_warp_init

intra_warp_init:                                  ; preds = %entry_after_block_sync_2
  store i32 0, i32* %local_intra_warp_idx
  br label %intra_warp_cond

intra_warp_inc:                                   ; preds = %return
  %39 = load i32, i32* %local_intra_warp_idx
  %intra_warp_index_increment = add i32 %39, 1
  store i32 %intra_warp_index_increment, i32* %local_intra_warp_idx
  br label %intra_warp_cond

intra_warp_cond:                                  ; preds = %intra_warp_inc, %intra_warp_init
  %40 = load i32, i32* @block_size
  %41 = load i32, i32* %local_intra_warp_idx
  %42 = icmp ult i32 %41, %40
  br i1 %42, label %entry_after_block_sync_0, label %reset_block, !llvm.loop !15

entry_after_block_sync_0:                         ; preds = %intra_warp_cond
  %43 = load i32, i32* %local_inter_warp_idx
  %44 = load i32, i32* %local_intra_warp_idx
  %45 = mul i32 %43, 32
  %thread_idx10 = add i32 %44, %45
  %46 = getelementptr i32, i32* %workload.addr_intra_warp_, i32 %thread_idx10
  store i32 %workload, i32* %46, align 4, !llvm.mem.parallel_loop_access !18
  %47 = load i32, i32* %local_inter_warp_idx
  %48 = load i32, i32* %local_intra_warp_idx
  %49 = mul i32 %47, 32
  %thread_idx23 = add i32 %48, %49
  %50 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx23
  store i32 %xmax, i32* %50, align 4, !llvm.mem.parallel_loop_access !18
  %51 = load i32, i32* %local_inter_warp_idx
  %52 = load i32, i32* %local_intra_warp_idx
  %53 = mul i32 %51, 32
  %thread_idx31 = add i32 %52, %53
  %54 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx31
  store float* %x, float** %54, align 8, !llvm.mem.parallel_loop_access !18
  %55 = load i32, i32* %local_inter_warp_idx
  %56 = load i32, i32* %local_intra_warp_idx
  %57 = mul i32 %55, 32
  %thread_idx36 = add i32 %56, %57
  %58 = getelementptr float*, float** %y.addr_intra_warp_, i32 %thread_idx36
  store float* %y, float** %58, align 8, !llvm.mem.parallel_loop_access !18
  %59 = load i32, i32* %local_inter_warp_idx
  %60 = load i32, i32* %local_intra_warp_idx
  %61 = mul i32 %59, 32
  %thread_idx38 = add i32 %60, %61
  %62 = getelementptr float*, float** %params.addr_intra_warp_, i32 %thread_idx38
  store float* %params, float** %62, align 8, !llvm.mem.parallel_loop_access !18
  %63 = load i32, i32* %local_inter_warp_idx
  %64 = load i32, i32* %local_intra_warp_idx
  %65 = mul i32 %63, 32
  %thread_idx40 = add i32 %64, %65
  %66 = getelementptr float*, float** %com.addr_intra_warp_, i32 %thread_idx40
  store float* %com, float** %66, align 8, !llvm.mem.parallel_loop_access !18
  %67 = load i32, i32* %local_inter_warp_idx
  %68 = load i32, i32* %local_intra_warp_idx
  %69 = mul i32 %67, 32
  %thread_idx45 = add i32 %68, %69
  %70 = getelementptr float*, float** %err.addr_intra_warp_, i32 %thread_idx45
  store float* %err, float** %70, align 8, !llvm.mem.parallel_loop_access !18
  %71 = load i32, i32* %local_inter_warp_idx
  %72 = load i32, i32* %local_intra_warp_idx
  %73 = mul i32 %71, 32
  %thread_idx49 = add i32 %72, %73
  %74 = getelementptr float*, float** %scale.addr_intra_warp_, i32 %thread_idx49
  store float* %scale, float** %74, align 8, !llvm.mem.parallel_loop_access !18
  %75 = load i32, i32* %local_inter_warp_idx
  %76 = load i32, i32* %local_intra_warp_idx
  %77 = mul i32 %75, 32
  %thread_idx54 = add i32 %76, %77
  %78 = getelementptr float*, float** %yy.addr_intra_warp_, i32 %thread_idx54
  store float* %yy, float** %78, align 8, !llvm.mem.parallel_loop_access !18
  %79 = load i32, i32* %local_inter_warp_idx
  %80 = load i32, i32* %local_intra_warp_idx
  %81 = mul i32 %79, 32
  %thread_idx56 = add i32 %80, %81
  %82 = getelementptr float*, float** %initvalu_temp.addr_intra_warp_, i32 %thread_idx56
  store float* %initvalu_temp, float** %82, align 8, !llvm.mem.parallel_loop_access !18
  %83 = load i32, i32* %local_inter_warp_idx
  %84 = load i32, i32* %local_intra_warp_idx
  %85 = mul i32 %83, 32
  %thread_idx58 = add i32 %84, %85
  %86 = getelementptr float*, float** %finavalu_temp.addr_intra_warp_, i32 %thread_idx58
  store float* %finavalu_temp, float** %86, align 8, !llvm.mem.parallel_loop_access !18
  %87 = load i32, i32* @block_index_x
  %88 = load i32, i32* %local_inter_warp_idx
  %89 = load i32, i32* %local_intra_warp_idx
  %90 = mul i32 %88, 32
  %thread_idx60 = add i32 %89, %90
  %91 = getelementptr i32, i32* %bx_intra_warp_, i32 %thread_idx60
  store i32 %87, i32* %91, align 4, !llvm.mem.parallel_loop_access !18
  %92 = load i32, i32* %local_inter_warp_idx
  %93 = mul i32 %92, 32
  %94 = load i32, i32* %local_intra_warp_idx
  %thread_idx197 = add i32 %94, %93
  %95 = load i32, i32* @block_size_x
  %thread_id_x = srem i32 %thread_idx197, %95
  %96 = load i32, i32* %local_inter_warp_idx
  %97 = load i32, i32* %local_intra_warp_idx
  %98 = mul i32 %96, 32
  %thread_idx62 = add i32 %97, %98
  %99 = getelementptr i32, i32* %tx_intra_warp_, i32 %thread_idx62
  store i32 %thread_id_x, i32* %99, align 4, !llvm.mem.parallel_loop_access !18
  %100 = load i32, i32* %local_inter_warp_idx
  %101 = load i32, i32* %local_intra_warp_idx
  %102 = mul i32 %100, 32
  %thread_idx59 = add i32 %101, %102
  %103 = getelementptr i32, i32* %bx_intra_warp_, i32 %thread_idx59
  %104 = load i32, i32* %103, align 4, !llvm.mem.parallel_loop_access !18
  %mul = mul nsw i32 %104, 32
  %105 = load i32, i32* %local_inter_warp_idx
  %106 = load i32, i32* %local_intra_warp_idx
  %107 = mul i32 %105, 32
  %thread_idx61 = add i32 %106, %107
  %108 = getelementptr i32, i32* %tx_intra_warp_, i32 %thread_idx61
  %109 = load i32, i32* %108, align 4, !llvm.mem.parallel_loop_access !18
  %add = add nsw i32 %mul, %109
  %110 = load i32, i32* %local_inter_warp_idx
  %111 = load i32, i32* %local_intra_warp_idx
  %112 = mul i32 %110, 32
  %thread_idx74 = add i32 %111, %112
  %113 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx74
  store i32 %add, i32* %113, align 4, !llvm.mem.parallel_loop_access !18
  %114 = load i32, i32* %local_inter_warp_idx
  %115 = load i32, i32* %local_intra_warp_idx
  %116 = mul i32 %114, 32
  %thread_idx73 = add i32 %115, %116
  %117 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx73
  %118 = load i32, i32* %117, align 4, !llvm.mem.parallel_loop_access !18
  %mul2 = mul nsw i32 %118, 91
  %119 = load i32, i32* %local_inter_warp_idx
  %120 = load i32, i32* %local_intra_warp_idx
  %121 = mul i32 %119, 32
  %thread_idx93 = add i32 %120, %121
  %122 = getelementptr i32, i32* %err_pointer_intra_warp_, i32 %thread_idx93
  store i32 %mul2, i32* %122, align 4, !llvm.mem.parallel_loop_access !18
  %123 = load i32, i32* %local_inter_warp_idx
  %124 = load i32, i32* %local_intra_warp_idx
  %125 = mul i32 %123, 32
  %thread_idx72 = add i32 %124, %125
  %126 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx72
  %127 = load i32, i32* %126, align 4, !llvm.mem.parallel_loop_access !18
  %mul3 = mul nsw i32 %127, 91
  %128 = load i32, i32* %local_inter_warp_idx
  %129 = load i32, i32* %local_intra_warp_idx
  %130 = mul i32 %128, 32
  %thread_idx97 = add i32 %129, %130
  %131 = getelementptr i32, i32* %scale_pointer_intra_warp_, i32 %thread_idx97
  store i32 %mul3, i32* %131, align 4, !llvm.mem.parallel_loop_access !18
  %132 = load i32, i32* %local_inter_warp_idx
  %133 = load i32, i32* %local_intra_warp_idx
  %134 = mul i32 %132, 32
  %thread_idx71 = add i32 %133, %134
  %135 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx71
  %136 = load i32, i32* %135, align 4, !llvm.mem.parallel_loop_access !18
  %mul4 = mul nsw i32 %136, 91
  %137 = load i32, i32* %local_inter_warp_idx
  %138 = load i32, i32* %local_intra_warp_idx
  %139 = mul i32 %137, 32
  %thread_idx102 = add i32 %138, %139
  %140 = getelementptr i32, i32* %yy_pointer_intra_warp_, i32 %thread_idx102
  store i32 %mul4, i32* %140, align 4, !llvm.mem.parallel_loop_access !18
  %141 = load i32, i32* %local_inter_warp_idx
  %142 = load i32, i32* %local_intra_warp_idx
  %143 = mul i32 %141, 32
  %thread_idx70 = add i32 %142, %143
  %144 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx70
  %145 = load i32, i32* %144, align 4, !llvm.mem.parallel_loop_access !18
  %mul5 = mul nsw i32 %145, 18
  %146 = load i32, i32* %local_inter_warp_idx
  %147 = load i32, i32* %local_intra_warp_idx
  %148 = mul i32 %146, 32
  %thread_idx104 = add i32 %147, %148
  %149 = getelementptr i32, i32* %params_pointer_intra_warp_, i32 %thread_idx104
  store i32 %mul5, i32* %149, align 4, !llvm.mem.parallel_loop_access !18
  %150 = load i32, i32* %local_inter_warp_idx
  %151 = load i32, i32* %local_intra_warp_idx
  %152 = mul i32 %150, 32
  %thread_idx69 = add i32 %151, %152
  %153 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx69
  %154 = load i32, i32* %153, align 4, !llvm.mem.parallel_loop_access !18
  %mul6 = mul nsw i32 %154, 91
  %155 = load i32, i32* %local_inter_warp_idx
  %156 = load i32, i32* %local_intra_warp_idx
  %157 = mul i32 %155, 32
  %thread_idx106 = add i32 %156, %157
  %158 = getelementptr i32, i32* %initvalu_temp_pointer_intra_warp_, i32 %thread_idx106
  store i32 %mul6, i32* %158, align 4, !llvm.mem.parallel_loop_access !18
  %159 = load i32, i32* %local_inter_warp_idx
  %160 = load i32, i32* %local_intra_warp_idx
  %161 = mul i32 %159, 32
  %thread_idx68 = add i32 %160, %161
  %162 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx68
  %163 = load i32, i32* %162, align 4, !llvm.mem.parallel_loop_access !18
  %mul7 = mul nsw i32 %163, 13
  %mul8 = mul nsw i32 %mul7, 91
  %164 = load i32, i32* %local_inter_warp_idx
  %165 = load i32, i32* %local_intra_warp_idx
  %166 = mul i32 %164, 32
  %thread_idx108 = add i32 %165, %166
  %167 = getelementptr i32, i32* %finavalu_temp_pointer_intra_warp_, i32 %thread_idx108
  store i32 %mul8, i32* %167, align 4, !llvm.mem.parallel_loop_access !18
  %168 = load i32, i32* %local_inter_warp_idx
  %169 = load i32, i32* %local_intra_warp_idx
  %170 = mul i32 %168, 32
  %thread_idx67 = add i32 %169, %170
  %171 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx67
  %172 = load i32, i32* %171, align 4, !llvm.mem.parallel_loop_access !18
  %mul9 = mul nsw i32 %172, 3
  %173 = load i32, i32* %local_inter_warp_idx
  %174 = load i32, i32* %local_intra_warp_idx
  %175 = mul i32 %173, 32
  %thread_idx110 = add i32 %174, %175
  %176 = getelementptr i32, i32* %com_pointer_intra_warp_, i32 %thread_idx110
  store i32 %mul9, i32* %176, align 4, !llvm.mem.parallel_loop_access !18
  %177 = load i32, i32* %local_inter_warp_idx
  %178 = load i32, i32* %local_intra_warp_idx
  %179 = mul i32 %177, 32
  %thread_idx112 = add i32 %178, %179
  %180 = getelementptr float, float* %err_exponent_intra_warp_, i32 %thread_idx112
  store float 0x3FC24924A0000000, float* %180, align 4, !llvm.mem.parallel_loop_access !18
  %181 = load i32, i32* %local_inter_warp_idx
  %182 = load i32, i32* %local_intra_warp_idx
  %183 = mul i32 %181, 32
  %thread_idx115 = add i32 %182, %183
  %184 = getelementptr float, float* %h_init_intra_warp_, i32 %thread_idx115
  store float 1.000000e+00, float* %184, align 4, !llvm.mem.parallel_loop_access !18
  %185 = load i32, i32* %local_inter_warp_idx
  %186 = load i32, i32* %local_intra_warp_idx
  %187 = mul i32 %185, 32
  %thread_idx114 = add i32 %186, %187
  %188 = getelementptr float, float* %h_init_intra_warp_, i32 %thread_idx114
  %189 = load float, float* %188, align 4, !llvm.mem.parallel_loop_access !18
  %190 = load i32, i32* %local_inter_warp_idx
  %191 = load i32, i32* %local_intra_warp_idx
  %192 = mul i32 %190, 32
  %thread_idx132 = add i32 %191, %192
  %193 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx132
  store float %189, float* %193, align 4, !llvm.mem.parallel_loop_access !18
  %194 = load i32, i32* %local_inter_warp_idx
  %195 = load i32, i32* %local_intra_warp_idx
  %196 = mul i32 %194, 32
  %thread_idx142 = add i32 %195, %196
  %197 = getelementptr i32, i32* %xmin_intra_warp_, i32 %thread_idx142
  store i32 0, i32* %197, align 4, !llvm.mem.parallel_loop_access !18
  %198 = load i32, i32* %local_inter_warp_idx
  %199 = load i32, i32* %local_intra_warp_idx
  %200 = mul i32 %198, 32
  %thread_idx22 = add i32 %199, %200
  %201 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx22
  %202 = load i32, i32* %201, align 4, !llvm.mem.parallel_loop_access !18
  %203 = load i32, i32* %local_inter_warp_idx
  %204 = load i32, i32* %local_intra_warp_idx
  %205 = mul i32 %203, 32
  %thread_idx141 = add i32 %204, %205
  %206 = getelementptr i32, i32* %xmin_intra_warp_, i32 %thread_idx141
  %207 = load i32, i32* %206, align 4, !llvm.mem.parallel_loop_access !18
  %sub = sub nsw i32 %202, %207
  %conv = sitofp i32 %sub to float
  %div = fdiv float 1.000000e+01, %conv
  %208 = load i32, i32* %local_inter_warp_idx
  %209 = load i32, i32* %local_intra_warp_idx
  %210 = mul i32 %208, 32
  %thread_idx136 = add i32 %209, %210
  %211 = getelementptr float, float* %tolerance_intra_warp_, i32 %thread_idx136
  store float %div, float* %211, align 4, !llvm.mem.parallel_loop_access !18
  %212 = load i32, i32* %local_inter_warp_idx
  %213 = load i32, i32* %local_intra_warp_idx
  %214 = mul i32 %212, 32
  %thread_idx21 = add i32 %213, %214
  %215 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx21
  %216 = load i32, i32* %215, align 4, !llvm.mem.parallel_loop_access !18
  %217 = load i32, i32* %local_inter_warp_idx
  %218 = load i32, i32* %local_intra_warp_idx
  %219 = mul i32 %217, 32
  %thread_idx140 = add i32 %218, %219
  %220 = getelementptr i32, i32* %xmin_intra_warp_, i32 %thread_idx140
  %221 = load i32, i32* %220, align 4, !llvm.mem.parallel_loop_access !18
  %cmp = icmp slt i32 %216, %221
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry_after_block_sync_0
  %222 = load i32, i32* %local_inter_warp_idx
  %223 = load i32, i32* %local_intra_warp_idx
  %224 = mul i32 %222, 32
  %thread_idx131 = add i32 %223, %224
  %225 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx131
  %226 = load float, float* %225, align 4, !llvm.mem.parallel_loop_access !18
  %conv10 = fpext float %226 to double
  %cmp11 = fcmp ole double %conv10, 0.000000e+00
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry_after_block_sync_0
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %227 = load i32, i32* %local_inter_warp_idx
  %228 = load i32, i32* %local_intra_warp_idx
  %229 = mul i32 %227, 32
  %thread_idx20 = add i32 %228, %229
  %230 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx20
  %231 = load i32, i32* %230, align 4, !llvm.mem.parallel_loop_access !18
  %232 = load i32, i32* %local_inter_warp_idx
  %233 = load i32, i32* %local_intra_warp_idx
  %234 = mul i32 %232, 32
  %thread_idx139 = add i32 %233, %234
  %235 = getelementptr i32, i32* %xmin_intra_warp_, i32 %thread_idx139
  %236 = load i32, i32* %235, align 4, !llvm.mem.parallel_loop_access !18
  %cmp12 = icmp eq i32 %231, %236
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end
  br label %return

if.end14:                                         ; preds = %if.end
  %237 = load i32, i32* %local_inter_warp_idx
  %238 = load i32, i32* %local_intra_warp_idx
  %239 = mul i32 %237, 32
  %thread_idx130 = add i32 %238, %239
  %240 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx130
  %241 = load float, float* %240, align 4, !llvm.mem.parallel_loop_access !18
  %242 = load i32, i32* %local_inter_warp_idx
  %243 = load i32, i32* %local_intra_warp_idx
  %244 = mul i32 %242, 32
  %thread_idx19 = add i32 %243, %244
  %245 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx19
  %246 = load i32, i32* %245, align 4, !llvm.mem.parallel_loop_access !18
  %247 = load i32, i32* %local_inter_warp_idx
  %248 = load i32, i32* %local_intra_warp_idx
  %249 = mul i32 %247, 32
  %thread_idx138 = add i32 %248, %249
  %250 = getelementptr i32, i32* %xmin_intra_warp_, i32 %thread_idx138
  %251 = load i32, i32* %250, align 4, !llvm.mem.parallel_loop_access !18
  %sub15 = sub nsw i32 %246, %251
  %conv16 = sitofp i32 %sub15 to float
  %cmp17 = fcmp ogt float %241, %conv16
  br i1 %cmp17, label %if.then18, label %if.end22

if.then18:                                        ; preds = %if.end14
  %252 = load i32, i32* %local_inter_warp_idx
  %253 = load i32, i32* %local_intra_warp_idx
  %254 = mul i32 %252, 32
  %thread_idx18 = add i32 %253, %254
  %255 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx18
  %256 = load i32, i32* %255, align 4, !llvm.mem.parallel_loop_access !18
  %conv19 = sitofp i32 %256 to float
  %257 = load i32, i32* %local_inter_warp_idx
  %258 = load i32, i32* %local_intra_warp_idx
  %259 = mul i32 %257, 32
  %thread_idx137 = add i32 %258, %259
  %260 = getelementptr i32, i32* %xmin_intra_warp_, i32 %thread_idx137
  %261 = load i32, i32* %260, align 4, !llvm.mem.parallel_loop_access !18
  %conv20 = sitofp i32 %261 to float
  %sub21 = fsub contract float %conv19, %conv20
  %262 = load i32, i32* %local_inter_warp_idx
  %263 = load i32, i32* %local_intra_warp_idx
  %264 = mul i32 %262, 32
  %thread_idx129 = add i32 %263, %264
  %265 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx129
  store float %sub21, float* %265, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end22

if.end22:                                         ; preds = %if.then18, %if.end14
  %266 = load i32, i32* %local_inter_warp_idx
  %267 = load i32, i32* %local_intra_warp_idx
  %268 = mul i32 %266, 32
  %thread_idx66 = add i32 %267, %268
  %269 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx66
  %270 = load i32, i32* %269, align 4, !llvm.mem.parallel_loop_access !18
  %271 = load i32, i32* %local_inter_warp_idx
  %272 = load i32, i32* %local_intra_warp_idx
  %273 = mul i32 %271, 32
  %thread_idx9 = add i32 %272, %273
  %274 = getelementptr i32, i32* %workload.addr_intra_warp_, i32 %thread_idx9
  %275 = load i32, i32* %274, align 4, !llvm.mem.parallel_loop_access !18
  %cmp23 = icmp slt i32 %270, %275
  br i1 %cmp23, label %if.then24, label %if.end195

if.then24:                                        ; preds = %if.end22
  %276 = load i32, i32* %local_inter_warp_idx
  %277 = load i32, i32* %local_intra_warp_idx
  %278 = mul i32 %276, 32
  %thread_idx196 = add i32 %277, %278
  %279 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx196
  store i32 1, i32* %279, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond

for.cond:                                         ; preds = %for.inc192, %if.then24
  %280 = load i32, i32* %local_inter_warp_idx
  %281 = load i32, i32* %local_intra_warp_idx
  %282 = mul i32 %280, 32
  %thread_idx195 = add i32 %281, %282
  %283 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx195
  %284 = load i32, i32* %283, align 4, !llvm.mem.parallel_loop_access !18
  %285 = load i32, i32* %local_inter_warp_idx
  %286 = load i32, i32* %local_intra_warp_idx
  %287 = mul i32 %285, 32
  %thread_idx17 = add i32 %286, %287
  %288 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx17
  %289 = load i32, i32* %288, align 4, !llvm.mem.parallel_loop_access !18
  %add25 = add nsw i32 %289, 1
  %cmp26 = icmp slt i32 %284, %add25
  br i1 %cmp26, label %for.body, label %for.end194

for.body:                                         ; preds = %for.cond
  %290 = load i32, i32* %local_inter_warp_idx
  %291 = load i32, i32* %local_intra_warp_idx
  %292 = mul i32 %290, 32
  %thread_idx65 = add i32 %291, %292
  %293 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx65
  %294 = load i32, i32* %293, align 4, !llvm.mem.parallel_loop_access !18
  %295 = load i32, i32* %local_inter_warp_idx
  %296 = load i32, i32* %local_intra_warp_idx
  %297 = mul i32 %295, 32
  %thread_idx16 = add i32 %296, %297
  %298 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx16
  %299 = load i32, i32* %298, align 4, !llvm.mem.parallel_loop_access !18
  %add27 = add nsw i32 %299, 1
  %mul28 = mul nsw i32 %add27, 91
  %mul29 = mul nsw i32 %294, %mul28
  %300 = load i32, i32* %local_inter_warp_idx
  %301 = load i32, i32* %local_intra_warp_idx
  %302 = mul i32 %300, 32
  %thread_idx194 = add i32 %301, %302
  %303 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx194
  %304 = load i32, i32* %303, align 4, !llvm.mem.parallel_loop_access !18
  %sub30 = sub nsw i32 %304, 1
  %mul31 = mul nsw i32 %sub30, 91
  %add32 = add nsw i32 %mul29, %mul31
  %conv33 = sext i32 %add32 to i64
  %305 = load i32, i32* %local_inter_warp_idx
  %306 = load i32, i32* %local_intra_warp_idx
  %307 = mul i32 %305, 32
  %thread_idx78 = add i32 %306, %307
  %308 = getelementptr i64, i64* %y_pointer_initial_intra_warp_, i32 %thread_idx78
  store i64 %conv33, i64* %308, align 8, !llvm.mem.parallel_loop_access !18
  %309 = load i32, i32* %local_inter_warp_idx
  %310 = load i32, i32* %local_intra_warp_idx
  %311 = mul i32 %309, 32
  %thread_idx64 = add i32 %310, %311
  %312 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx64
  %313 = load i32, i32* %312, align 4, !llvm.mem.parallel_loop_access !18
  %314 = load i32, i32* %local_inter_warp_idx
  %315 = load i32, i32* %local_intra_warp_idx
  %316 = mul i32 %314, 32
  %thread_idx15 = add i32 %315, %316
  %317 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx15
  %318 = load i32, i32* %317, align 4, !llvm.mem.parallel_loop_access !18
  %add34 = add nsw i32 %318, 1
  %mul35 = mul nsw i32 %add34, 91
  %mul36 = mul nsw i32 %313, %mul35
  %319 = load i32, i32* %local_inter_warp_idx
  %320 = load i32, i32* %local_intra_warp_idx
  %321 = mul i32 %319, 32
  %thread_idx193 = add i32 %320, %321
  %322 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx193
  %323 = load i32, i32* %322, align 4, !llvm.mem.parallel_loop_access !18
  %mul37 = mul nsw i32 %323, 91
  %add38 = add nsw i32 %mul36, %mul37
  %conv39 = sext i32 %add38 to i64
  %324 = load i32, i32* %local_inter_warp_idx
  %325 = load i32, i32* %local_intra_warp_idx
  %326 = mul i32 %324, 32
  %thread_idx80 = add i32 %325, %326
  %327 = getelementptr i64, i64* %y_pointer_current_intra_warp_, i32 %thread_idx80
  store i64 %conv39, i64* %327, align 8, !llvm.mem.parallel_loop_access !18
  %328 = load i32, i32* %local_inter_warp_idx
  %329 = load i32, i32* %local_intra_warp_idx
  %330 = mul i32 %328, 32
  %thread_idx63 = add i32 %329, %330
  %331 = getelementptr i32, i32* %tid_intra_warp_, i32 %thread_idx63
  %332 = load i32, i32* %331, align 4, !llvm.mem.parallel_loop_access !18
  %333 = load i32, i32* %local_inter_warp_idx
  %334 = load i32, i32* %local_intra_warp_idx
  %335 = mul i32 %333, 32
  %thread_idx14 = add i32 %334, %335
  %336 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx14
  %337 = load i32, i32* %336, align 4, !llvm.mem.parallel_loop_access !18
  %add40 = add nsw i32 %337, 1
  %mul41 = mul nsw i32 %332, %add40
  %338 = load i32, i32* %local_inter_warp_idx
  %339 = load i32, i32* %local_intra_warp_idx
  %340 = mul i32 %338, 32
  %thread_idx192 = add i32 %339, %340
  %341 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx192
  %342 = load i32, i32* %341, align 4, !llvm.mem.parallel_loop_access !18
  %add42 = add nsw i32 %mul41, %342
  %conv43 = sext i32 %add42 to i64
  %343 = load i32, i32* %local_inter_warp_idx
  %344 = load i32, i32* %local_intra_warp_idx
  %345 = mul i32 %343, 32
  %thread_idx88 = add i32 %344, %345
  %346 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx88
  store i64 %conv43, i64* %346, align 8, !llvm.mem.parallel_loop_access !18
  %347 = load i32, i32* %local_inter_warp_idx
  %348 = load i32, i32* %local_intra_warp_idx
  %349 = mul i32 %347, 32
  %thread_idx191 = add i32 %348, %349
  %350 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx191
  %351 = load i32, i32* %350, align 4, !llvm.mem.parallel_loop_access !18
  %conv44 = sitofp i32 %351 to float
  %352 = load i32, i32* %local_inter_warp_idx
  %353 = load i32, i32* %local_intra_warp_idx
  %354 = mul i32 %352, 32
  %thread_idx30 = add i32 %353, %354
  %355 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx30
  %356 = load float*, float** %355, align 8, !llvm.mem.parallel_loop_access !18
  %357 = load i32, i32* %local_inter_warp_idx
  %358 = load i32, i32* %local_intra_warp_idx
  %359 = mul i32 %357, 32
  %thread_idx87 = add i32 %358, %359
  %360 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx87
  %361 = load i64, i64* %360, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx = getelementptr inbounds float, float* %356, i64 %361
  store float %conv44, float* %arrayidx, align 4, !llvm.mem.parallel_loop_access !18
  %362 = load i32, i32* %local_inter_warp_idx
  %363 = load i32, i32* %local_intra_warp_idx
  %364 = mul i32 %362, 32
  %thread_idx113 = add i32 %363, %364
  %365 = getelementptr float, float* %h_init_intra_warp_, i32 %thread_idx113
  %366 = load float, float* %365, align 4, !llvm.mem.parallel_loop_access !18
  %367 = load i32, i32* %local_inter_warp_idx
  %368 = load i32, i32* %local_intra_warp_idx
  %369 = mul i32 %367, 32
  %thread_idx128 = add i32 %368, %369
  %370 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx128
  store float %366, float* %370, align 4, !llvm.mem.parallel_loop_access !18
  %371 = load i32, i32* %local_inter_warp_idx
  %372 = load i32, i32* %local_intra_warp_idx
  %373 = mul i32 %371, 32
  %thread_idx159 = add i32 %372, %373
  %374 = getelementptr float, float* %scale_fina_intra_warp_, i32 %thread_idx159
  store float 1.000000e+00, float* %374, align 4, !llvm.mem.parallel_loop_access !18
  %375 = load i32, i32* %local_inter_warp_idx
  %376 = load i32, i32* %local_intra_warp_idx
  %377 = mul i32 %375, 32
  %thread_idx188 = add i32 %376, %377
  %378 = getelementptr i32, i32* %j_intra_warp_, i32 %thread_idx188
  store i32 0, i32* %378, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc183, %for.body
  %379 = load i32, i32* %local_inter_warp_idx
  %380 = load i32, i32* %local_intra_warp_idx
  %381 = mul i32 %379, 32
  %thread_idx187 = add i32 %380, %381
  %382 = getelementptr i32, i32* %j_intra_warp_, i32 %thread_idx187
  %383 = load i32, i32* %382, align 4, !llvm.mem.parallel_loop_access !18
  %cmp46 = icmp slt i32 %383, 12
  br i1 %cmp46, label %for.body47, label %for.end185.loopexit

for.body47:                                       ; preds = %for.cond45
  %384 = load i32, i32* %local_inter_warp_idx
  %385 = load i32, i32* %local_intra_warp_idx
  %386 = mul i32 %384, 32
  %thread_idx145 = add i32 %385, %386
  %387 = getelementptr i32, i32* %error_intra_warp_, i32 %thread_idx145
  store i32 0, i32* %387, align 4, !llvm.mem.parallel_loop_access !18
  %388 = load i32, i32* %local_inter_warp_idx
  %389 = load i32, i32* %local_intra_warp_idx
  %390 = mul i32 %388, 32
  %thread_idx148 = add i32 %389, %390
  %391 = getelementptr i32, i32* %outside_intra_warp_, i32 %thread_idx148
  store i32 0, i32* %391, align 4, !llvm.mem.parallel_loop_access !18
  %392 = load i32, i32* %local_inter_warp_idx
  %393 = load i32, i32* %local_intra_warp_idx
  %394 = mul i32 %392, 32
  %thread_idx155 = add i32 %393, %394
  %395 = getelementptr float, float* %scale_min_intra_warp_, i32 %thread_idx155
  store float 4.000000e+00, float* %395, align 4, !llvm.mem.parallel_loop_access !18
  %396 = load i32, i32* %local_inter_warp_idx
  %397 = load i32, i32* %local_intra_warp_idx
  %398 = mul i32 %396, 32
  %thread_idx127 = add i32 %397, %398
  %399 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx127
  %400 = load float, float* %399, align 4, !llvm.mem.parallel_loop_access !18
  %401 = load i32, i32* %local_inter_warp_idx
  %402 = load i32, i32* %local_intra_warp_idx
  %403 = mul i32 %401, 32
  %thread_idx29 = add i32 %402, %403
  %404 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx29
  %405 = load float*, float** %404, align 8, !llvm.mem.parallel_loop_access !18
  %406 = load i32, i32* %local_inter_warp_idx
  %407 = load i32, i32* %local_intra_warp_idx
  %408 = mul i32 %406, 32
  %thread_idx86 = add i32 %407, %408
  %409 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx86
  %410 = load i64, i64* %409, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx48 = getelementptr inbounds float, float* %405, i64 %410
  %411 = load float, float* %arrayidx48, align 4, !llvm.mem.parallel_loop_access !18
  %412 = load i32, i32* %local_inter_warp_idx
  %413 = load i32, i32* %local_intra_warp_idx
  %414 = mul i32 %412, 32
  %thread_idx35 = add i32 %413, %414
  %415 = getelementptr float*, float** %y.addr_intra_warp_, i32 %thread_idx35
  %416 = load float*, float** %415, align 8, !llvm.mem.parallel_loop_access !18
  %417 = load i32, i32* %local_inter_warp_idx
  %418 = load i32, i32* %local_intra_warp_idx
  %419 = mul i32 %417, 32
  %thread_idx77 = add i32 %418, %419
  %420 = getelementptr i64, i64* %y_pointer_initial_intra_warp_, i32 %thread_idx77
  %421 = load i64, i64* %420, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx49 = getelementptr inbounds float, float* %416, i64 %421
  %422 = load i32, i32* %local_inter_warp_idx
  %423 = load i32, i32* %local_intra_warp_idx
  %424 = mul i32 %422, 32
  %thread_idx34 = add i32 %423, %424
  %425 = getelementptr float*, float** %y.addr_intra_warp_, i32 %thread_idx34
  %426 = load float*, float** %425, align 8, !llvm.mem.parallel_loop_access !18
  %427 = load i32, i32* %local_inter_warp_idx
  %428 = load i32, i32* %local_intra_warp_idx
  %429 = mul i32 %427, 32
  %thread_idx79 = add i32 %428, %429
  %430 = getelementptr i64, i64* %y_pointer_current_intra_warp_, i32 %thread_idx79
  %431 = load i64, i64* %430, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx50 = getelementptr inbounds float, float* %426, i64 %431
  %432 = load i32, i32* %local_inter_warp_idx
  %433 = load i32, i32* %local_intra_warp_idx
  %434 = mul i32 %432, 32
  %thread_idx37 = add i32 %433, %434
  %435 = getelementptr float*, float** %params.addr_intra_warp_, i32 %thread_idx37
  %436 = load float*, float** %435, align 8, !llvm.mem.parallel_loop_access !18
  %437 = load i32, i32* %local_inter_warp_idx
  %438 = load i32, i32* %local_intra_warp_idx
  %439 = mul i32 %437, 32
  %thread_idx103 = add i32 %438, %439
  %440 = getelementptr i32, i32* %params_pointer_intra_warp_, i32 %thread_idx103
  %441 = load i32, i32* %440, align 4, !llvm.mem.parallel_loop_access !18
  %idxprom = sext i32 %441 to i64
  %arrayidx51 = getelementptr inbounds float, float* %436, i64 %idxprom
  %442 = load i32, i32* %local_inter_warp_idx
  %443 = load i32, i32* %local_intra_warp_idx
  %444 = mul i32 %442, 32
  %thread_idx44 = add i32 %443, %444
  %445 = getelementptr float*, float** %err.addr_intra_warp_, i32 %thread_idx44
  %446 = load float*, float** %445, align 8, !llvm.mem.parallel_loop_access !18
  %447 = load i32, i32* %local_inter_warp_idx
  %448 = load i32, i32* %local_intra_warp_idx
  %449 = mul i32 %447, 32
  %thread_idx92 = add i32 %448, %449
  %450 = getelementptr i32, i32* %err_pointer_intra_warp_, i32 %thread_idx92
  %451 = load i32, i32* %450, align 4, !llvm.mem.parallel_loop_access !18
  %idxprom52 = sext i32 %451 to i64
  %arrayidx53 = getelementptr inbounds float, float* %446, i64 %idxprom52
  %452 = load i32, i32* %local_inter_warp_idx
  %453 = load i32, i32* %local_intra_warp_idx
  %454 = mul i32 %452, 32
  %thread_idx55 = add i32 %453, %454
  %455 = getelementptr float*, float** %initvalu_temp.addr_intra_warp_, i32 %thread_idx55
  %456 = load float*, float** %455, align 8, !llvm.mem.parallel_loop_access !18
  %457 = load i32, i32* %local_inter_warp_idx
  %458 = load i32, i32* %local_intra_warp_idx
  %459 = mul i32 %457, 32
  %thread_idx105 = add i32 %458, %459
  %460 = getelementptr i32, i32* %initvalu_temp_pointer_intra_warp_, i32 %thread_idx105
  %461 = load i32, i32* %460, align 4, !llvm.mem.parallel_loop_access !18
  %idxprom54 = sext i32 %461 to i64
  %arrayidx55 = getelementptr inbounds float, float* %456, i64 %idxprom54
  %462 = load i32, i32* %local_inter_warp_idx
  %463 = load i32, i32* %local_intra_warp_idx
  %464 = mul i32 %462, 32
  %thread_idx57 = add i32 %463, %464
  %465 = getelementptr float*, float** %finavalu_temp.addr_intra_warp_, i32 %thread_idx57
  %466 = load float*, float** %465, align 8, !llvm.mem.parallel_loop_access !18
  %467 = load i32, i32* %local_inter_warp_idx
  %468 = load i32, i32* %local_intra_warp_idx
  %469 = mul i32 %467, 32
  %thread_idx107 = add i32 %468, %469
  %470 = getelementptr i32, i32* %finavalu_temp_pointer_intra_warp_, i32 %thread_idx107
  %471 = load i32, i32* %470, align 4, !llvm.mem.parallel_loop_access !18
  %idxprom56 = sext i32 %471 to i64
  %arrayidx57 = getelementptr inbounds float, float* %466, i64 %idxprom56
  %472 = load i32, i32* %local_inter_warp_idx
  %473 = load i32, i32* %local_intra_warp_idx
  %474 = mul i32 %472, 32
  %thread_idx39 = add i32 %473, %474
  %475 = getelementptr float*, float** %com.addr_intra_warp_, i32 %thread_idx39
  %476 = load float*, float** %475, align 8, !llvm.mem.parallel_loop_access !18
  %477 = load i32, i32* %local_inter_warp_idx
  %478 = load i32, i32* %local_intra_warp_idx
  %479 = mul i32 %477, 32
  %thread_idx109 = add i32 %478, %479
  %480 = getelementptr i32, i32* %com_pointer_intra_warp_, i32 %thread_idx109
  %481 = load i32, i32* %480, align 4, !llvm.mem.parallel_loop_access !18
  %idxprom58 = sext i32 %481 to i64
  %arrayidx59 = getelementptr inbounds float, float* %476, i64 %idxprom58
  call void @_Z23embedded_fehlberg_7_8_2ffPfS_S_S_S_S_S_(float %400, float %411, float* %arrayidx49, float* %arrayidx50, float* %arrayidx51, float* %arrayidx53, float* %arrayidx55, float* %arrayidx57, float* %arrayidx59) #4, !llvm.mem.parallel_loop_access !18
  %482 = load i32, i32* %local_inter_warp_idx
  %483 = load i32, i32* %local_intra_warp_idx
  %484 = mul i32 %482, 32
  %thread_idx183 = add i32 %483, %484
  %485 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx183
  store i32 0, i32* %485, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond60

for.cond60:                                       ; preds = %for.inc, %for.body47
  %486 = load i32, i32* %local_inter_warp_idx
  %487 = load i32, i32* %local_intra_warp_idx
  %488 = mul i32 %486, 32
  %thread_idx182 = add i32 %487, %488
  %489 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx182
  %490 = load i32, i32* %489, align 4, !llvm.mem.parallel_loop_access !18
  %cmp61 = icmp slt i32 %490, 91
  br i1 %cmp61, label %for.body62, label %for.end

for.body62:                                       ; preds = %for.cond60
  %491 = load i32, i32* %local_inter_warp_idx
  %492 = load i32, i32* %local_intra_warp_idx
  %493 = mul i32 %491, 32
  %thread_idx43 = add i32 %492, %493
  %494 = getelementptr float*, float** %err.addr_intra_warp_, i32 %thread_idx43
  %495 = load float*, float** %494, align 8, !llvm.mem.parallel_loop_access !18
  %496 = load i32, i32* %local_inter_warp_idx
  %497 = load i32, i32* %local_intra_warp_idx
  %498 = mul i32 %496, 32
  %thread_idx91 = add i32 %497, %498
  %499 = getelementptr i32, i32* %err_pointer_intra_warp_, i32 %thread_idx91
  %500 = load i32, i32* %499, align 4, !llvm.mem.parallel_loop_access !18
  %501 = load i32, i32* %local_inter_warp_idx
  %502 = load i32, i32* %local_intra_warp_idx
  %503 = mul i32 %501, 32
  %thread_idx181 = add i32 %502, %503
  %504 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx181
  %505 = load i32, i32* %504, align 4, !llvm.mem.parallel_loop_access !18
  %add63 = add nsw i32 %500, %505
  %idxprom64 = sext i32 %add63 to i64
  %arrayidx65 = getelementptr inbounds float, float* %495, i64 %idxprom64
  %506 = load float, float* %arrayidx65, align 4, !llvm.mem.parallel_loop_access !18
  %cmp66 = fcmp ogt float %506, 0.000000e+00
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %for.body62
  %507 = load i32, i32* %local_inter_warp_idx
  %508 = load i32, i32* %local_intra_warp_idx
  %509 = mul i32 %507, 32
  %thread_idx144 = add i32 %508, %509
  %510 = getelementptr i32, i32* %error_intra_warp_, i32 %thread_idx144
  store i32 1, i32* %510, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end68

if.end68:                                         ; preds = %if.then67, %for.body62
  br label %for.inc

for.inc:                                          ; preds = %if.end68
  %511 = load i32, i32* %local_inter_warp_idx
  %512 = load i32, i32* %local_intra_warp_idx
  %513 = mul i32 %511, 32
  %thread_idx180 = add i32 %512, %513
  %514 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx180
  %515 = load i32, i32* %514, align 4, !llvm.mem.parallel_loop_access !18
  %inc = add nsw i32 %515, 1
  %516 = load i32, i32* %local_inter_warp_idx
  %517 = load i32, i32* %local_intra_warp_idx
  %518 = mul i32 %516, 32
  %thread_idx179 = add i32 %517, %518
  %519 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx179
  store i32 %inc, i32* %519, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond60

for.end:                                          ; preds = %for.cond60
  %520 = load i32, i32* %local_inter_warp_idx
  %521 = load i32, i32* %local_intra_warp_idx
  %522 = mul i32 %520, 32
  %thread_idx143 = add i32 %521, %522
  %523 = getelementptr i32, i32* %error_intra_warp_, i32 %thread_idx143
  %524 = load i32, i32* %523, align 4, !llvm.mem.parallel_loop_access !18
  %cmp69 = icmp ne i32 %524, 1
  br i1 %cmp69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %for.end
  %525 = load i32, i32* %local_inter_warp_idx
  %526 = load i32, i32* %local_intra_warp_idx
  %527 = mul i32 %525, 32
  %thread_idx158 = add i32 %526, %527
  %528 = getelementptr float, float* %scale_fina_intra_warp_, i32 %thread_idx158
  store float 4.000000e+00, float* %528, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.end185

if.end71:                                         ; preds = %for.end
  %529 = load i32, i32* %local_inter_warp_idx
  %530 = load i32, i32* %local_intra_warp_idx
  %531 = mul i32 %529, 32
  %thread_idx178 = add i32 %530, %531
  %532 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx178
  store i32 0, i32* %532, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond72

for.cond72:                                       ; preds = %for.inc116, %if.end71
  %533 = load i32, i32* %local_inter_warp_idx
  %534 = load i32, i32* %local_intra_warp_idx
  %535 = mul i32 %533, 32
  %thread_idx177 = add i32 %534, %535
  %536 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx177
  %537 = load i32, i32* %536, align 4, !llvm.mem.parallel_loop_access !18
  %cmp73 = icmp slt i32 %537, 91
  br i1 %cmp73, label %for.body74, label %for.end118

for.body74:                                       ; preds = %for.cond72
  %538 = load i32, i32* %local_inter_warp_idx
  %539 = load i32, i32* %local_intra_warp_idx
  %540 = mul i32 %538, 32
  %thread_idx33 = add i32 %539, %540
  %541 = getelementptr float*, float** %y.addr_intra_warp_, i32 %thread_idx33
  %542 = load float*, float** %541, align 8, !llvm.mem.parallel_loop_access !18
  %543 = load i32, i32* %local_inter_warp_idx
  %544 = load i32, i32* %local_intra_warp_idx
  %545 = mul i32 %543, 32
  %thread_idx76 = add i32 %544, %545
  %546 = getelementptr i64, i64* %y_pointer_initial_intra_warp_, i32 %thread_idx76
  %547 = load i64, i64* %546, align 8, !llvm.mem.parallel_loop_access !18
  %548 = load i32, i32* %local_inter_warp_idx
  %549 = load i32, i32* %local_intra_warp_idx
  %550 = mul i32 %548, 32
  %thread_idx176 = add i32 %549, %550
  %551 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx176
  %552 = load i32, i32* %551, align 4, !llvm.mem.parallel_loop_access !18
  %conv75 = sext i32 %552 to i64
  %add76 = add nsw i64 %547, %conv75
  %arrayidx77 = getelementptr inbounds float, float* %542, i64 %add76
  %553 = load float, float* %arrayidx77, align 4, !llvm.mem.parallel_loop_access !18
  %conv78 = fpext float %553 to double
  %cmp79 = fcmp oeq double %conv78, 0.000000e+00
  br i1 %cmp79, label %if.then80, label %if.else

if.then80:                                        ; preds = %for.body74
  %554 = load i32, i32* %local_inter_warp_idx
  %555 = load i32, i32* %local_intra_warp_idx
  %556 = mul i32 %554, 32
  %thread_idx135 = add i32 %555, %556
  %557 = getelementptr float, float* %tolerance_intra_warp_, i32 %thread_idx135
  %558 = load float, float* %557, align 4, !llvm.mem.parallel_loop_access !18
  %559 = load i32, i32* %local_inter_warp_idx
  %560 = load i32, i32* %local_intra_warp_idx
  %561 = mul i32 %559, 32
  %thread_idx53 = add i32 %560, %561
  %562 = getelementptr float*, float** %yy.addr_intra_warp_, i32 %thread_idx53
  %563 = load float*, float** %562, align 8, !llvm.mem.parallel_loop_access !18
  %564 = load i32, i32* %local_inter_warp_idx
  %565 = load i32, i32* %local_intra_warp_idx
  %566 = mul i32 %564, 32
  %thread_idx101 = add i32 %565, %566
  %567 = getelementptr i32, i32* %yy_pointer_intra_warp_, i32 %thread_idx101
  %568 = load i32, i32* %567, align 4, !llvm.mem.parallel_loop_access !18
  %569 = load i32, i32* %local_inter_warp_idx
  %570 = load i32, i32* %local_intra_warp_idx
  %571 = mul i32 %569, 32
  %thread_idx175 = add i32 %570, %571
  %572 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx175
  %573 = load i32, i32* %572, align 4, !llvm.mem.parallel_loop_access !18
  %add81 = add nsw i32 %568, %573
  %idxprom82 = sext i32 %add81 to i64
  %arrayidx83 = getelementptr inbounds float, float* %563, i64 %idxprom82
  store float %558, float* %arrayidx83, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end91

if.else:                                          ; preds = %for.body74
  %574 = load i32, i32* %local_inter_warp_idx
  %575 = load i32, i32* %local_intra_warp_idx
  %576 = mul i32 %574, 32
  %thread_idx32 = add i32 %575, %576
  %577 = getelementptr float*, float** %y.addr_intra_warp_, i32 %thread_idx32
  %578 = load float*, float** %577, align 8, !llvm.mem.parallel_loop_access !18
  %579 = load i32, i32* %local_inter_warp_idx
  %580 = load i32, i32* %local_intra_warp_idx
  %581 = mul i32 %579, 32
  %thread_idx75 = add i32 %580, %581
  %582 = getelementptr i64, i64* %y_pointer_initial_intra_warp_, i32 %thread_idx75
  %583 = load i64, i64* %582, align 8, !llvm.mem.parallel_loop_access !18
  %584 = load i32, i32* %local_inter_warp_idx
  %585 = load i32, i32* %local_intra_warp_idx
  %586 = mul i32 %584, 32
  %thread_idx174 = add i32 %585, %586
  %587 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx174
  %588 = load i32, i32* %587, align 4, !llvm.mem.parallel_loop_access !18
  %conv84 = sext i32 %588 to i64
  %add85 = add nsw i64 %583, %conv84
  %arrayidx86 = getelementptr inbounds float, float* %578, i64 %add85
  %589 = load float, float* %arrayidx86, align 4, !llvm.mem.parallel_loop_access !18
  %call87 = call fastcc float @_ZL4fabsf(float %589) #4, !llvm.mem.parallel_loop_access !18
  %590 = load i32, i32* %local_inter_warp_idx
  %591 = load i32, i32* %local_intra_warp_idx
  %592 = mul i32 %590, 32
  %thread_idx52 = add i32 %591, %592
  %593 = getelementptr float*, float** %yy.addr_intra_warp_, i32 %thread_idx52
  %594 = load float*, float** %593, align 8, !llvm.mem.parallel_loop_access !18
  %595 = load i32, i32* %local_inter_warp_idx
  %596 = load i32, i32* %local_intra_warp_idx
  %597 = mul i32 %595, 32
  %thread_idx100 = add i32 %596, %597
  %598 = getelementptr i32, i32* %yy_pointer_intra_warp_, i32 %thread_idx100
  %599 = load i32, i32* %598, align 4, !llvm.mem.parallel_loop_access !18
  %600 = load i32, i32* %local_inter_warp_idx
  %601 = load i32, i32* %local_intra_warp_idx
  %602 = mul i32 %600, 32
  %thread_idx173 = add i32 %601, %602
  %603 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx173
  %604 = load i32, i32* %603, align 4, !llvm.mem.parallel_loop_access !18
  %add88 = add nsw i32 %599, %604
  %idxprom89 = sext i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds float, float* %594, i64 %idxprom89
  store float %call87, float* %arrayidx90, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end91

if.end91:                                         ; preds = %if.else, %if.then80
  %605 = load i32, i32* %local_inter_warp_idx
  %606 = load i32, i32* %local_intra_warp_idx
  %607 = mul i32 %605, 32
  %thread_idx134 = add i32 %606, %607
  %608 = getelementptr float, float* %tolerance_intra_warp_, i32 %thread_idx134
  %609 = load float, float* %608, align 4, !llvm.mem.parallel_loop_access !18
  %610 = load i32, i32* %local_inter_warp_idx
  %611 = load i32, i32* %local_intra_warp_idx
  %612 = mul i32 %610, 32
  %thread_idx51 = add i32 %611, %612
  %613 = getelementptr float*, float** %yy.addr_intra_warp_, i32 %thread_idx51
  %614 = load float*, float** %613, align 8, !llvm.mem.parallel_loop_access !18
  %615 = load i32, i32* %local_inter_warp_idx
  %616 = load i32, i32* %local_intra_warp_idx
  %617 = mul i32 %615, 32
  %thread_idx99 = add i32 %616, %617
  %618 = getelementptr i32, i32* %yy_pointer_intra_warp_, i32 %thread_idx99
  %619 = load i32, i32* %618, align 4, !llvm.mem.parallel_loop_access !18
  %620 = load i32, i32* %local_inter_warp_idx
  %621 = load i32, i32* %local_intra_warp_idx
  %622 = mul i32 %620, 32
  %thread_idx172 = add i32 %621, %622
  %623 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx172
  %624 = load i32, i32* %623, align 4, !llvm.mem.parallel_loop_access !18
  %add92 = add nsw i32 %619, %624
  %idxprom93 = sext i32 %add92 to i64
  %arrayidx94 = getelementptr inbounds float, float* %614, i64 %idxprom93
  %625 = load float, float* %arrayidx94, align 4, !llvm.mem.parallel_loop_access !18
  %mul95 = fmul contract float %609, %625
  %626 = load i32, i32* %local_inter_warp_idx
  %627 = load i32, i32* %local_intra_warp_idx
  %628 = mul i32 %626, 32
  %thread_idx42 = add i32 %627, %628
  %629 = getelementptr float*, float** %err.addr_intra_warp_, i32 %thread_idx42
  %630 = load float*, float** %629, align 8, !llvm.mem.parallel_loop_access !18
  %631 = load i32, i32* %local_inter_warp_idx
  %632 = load i32, i32* %local_intra_warp_idx
  %633 = mul i32 %631, 32
  %thread_idx90 = add i32 %632, %633
  %634 = getelementptr i32, i32* %err_pointer_intra_warp_, i32 %thread_idx90
  %635 = load i32, i32* %634, align 4, !llvm.mem.parallel_loop_access !18
  %636 = load i32, i32* %local_inter_warp_idx
  %637 = load i32, i32* %local_intra_warp_idx
  %638 = mul i32 %636, 32
  %thread_idx171 = add i32 %637, %638
  %639 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx171
  %640 = load i32, i32* %639, align 4, !llvm.mem.parallel_loop_access !18
  %add96 = add nsw i32 %635, %640
  %idxprom97 = sext i32 %add96 to i64
  %arrayidx98 = getelementptr inbounds float, float* %630, i64 %idxprom97
  %641 = load float, float* %arrayidx98, align 4, !llvm.mem.parallel_loop_access !18
  %div99 = fdiv float %mul95, %641
  %642 = load i32, i32* %local_inter_warp_idx
  %643 = load i32, i32* %local_intra_warp_idx
  %644 = mul i32 %642, 32
  %thread_idx111 = add i32 %643, %644
  %645 = getelementptr float, float* %err_exponent_intra_warp_, i32 %thread_idx111
  %646 = load float, float* %645, align 4, !llvm.mem.parallel_loop_access !18
  %call100 = call fastcc float @_ZL3powff(float %div99, float %646) #4, !llvm.mem.parallel_loop_access !18
  %conv101 = fpext float %call100 to double
  %mul102 = fmul contract double 8.000000e-01, %conv101
  %conv103 = fptrunc double %mul102 to float
  %647 = load i32, i32* %local_inter_warp_idx
  %648 = load i32, i32* %local_intra_warp_idx
  %649 = mul i32 %647, 32
  %thread_idx48 = add i32 %648, %649
  %650 = getelementptr float*, float** %scale.addr_intra_warp_, i32 %thread_idx48
  %651 = load float*, float** %650, align 8, !llvm.mem.parallel_loop_access !18
  %652 = load i32, i32* %local_inter_warp_idx
  %653 = load i32, i32* %local_intra_warp_idx
  %654 = mul i32 %652, 32
  %thread_idx96 = add i32 %653, %654
  %655 = getelementptr i32, i32* %scale_pointer_intra_warp_, i32 %thread_idx96
  %656 = load i32, i32* %655, align 4, !llvm.mem.parallel_loop_access !18
  %657 = load i32, i32* %local_inter_warp_idx
  %658 = load i32, i32* %local_intra_warp_idx
  %659 = mul i32 %657, 32
  %thread_idx170 = add i32 %658, %659
  %660 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx170
  %661 = load i32, i32* %660, align 4, !llvm.mem.parallel_loop_access !18
  %add104 = add nsw i32 %656, %661
  %idxprom105 = sext i32 %add104 to i64
  %arrayidx106 = getelementptr inbounds float, float* %651, i64 %idxprom105
  store float %conv103, float* %arrayidx106, align 4, !llvm.mem.parallel_loop_access !18
  %662 = load i32, i32* %local_inter_warp_idx
  %663 = load i32, i32* %local_intra_warp_idx
  %664 = mul i32 %662, 32
  %thread_idx47 = add i32 %663, %664
  %665 = getelementptr float*, float** %scale.addr_intra_warp_, i32 %thread_idx47
  %666 = load float*, float** %665, align 8, !llvm.mem.parallel_loop_access !18
  %667 = load i32, i32* %local_inter_warp_idx
  %668 = load i32, i32* %local_intra_warp_idx
  %669 = mul i32 %667, 32
  %thread_idx95 = add i32 %668, %669
  %670 = getelementptr i32, i32* %scale_pointer_intra_warp_, i32 %thread_idx95
  %671 = load i32, i32* %670, align 4, !llvm.mem.parallel_loop_access !18
  %672 = load i32, i32* %local_inter_warp_idx
  %673 = load i32, i32* %local_intra_warp_idx
  %674 = mul i32 %672, 32
  %thread_idx169 = add i32 %673, %674
  %675 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx169
  %676 = load i32, i32* %675, align 4, !llvm.mem.parallel_loop_access !18
  %add107 = add nsw i32 %671, %676
  %idxprom108 = sext i32 %add107 to i64
  %arrayidx109 = getelementptr inbounds float, float* %666, i64 %idxprom108
  %677 = load float, float* %arrayidx109, align 4, !llvm.mem.parallel_loop_access !18
  %678 = load i32, i32* %local_inter_warp_idx
  %679 = load i32, i32* %local_intra_warp_idx
  %680 = mul i32 %678, 32
  %thread_idx154 = add i32 %679, %680
  %681 = getelementptr float, float* %scale_min_intra_warp_, i32 %thread_idx154
  %682 = load float, float* %681, align 4, !llvm.mem.parallel_loop_access !18
  %cmp110 = fcmp olt float %677, %682
  br i1 %cmp110, label %if.then111, label %if.end115

if.then111:                                       ; preds = %if.end91
  %683 = load i32, i32* %local_inter_warp_idx
  %684 = load i32, i32* %local_intra_warp_idx
  %685 = mul i32 %683, 32
  %thread_idx46 = add i32 %684, %685
  %686 = getelementptr float*, float** %scale.addr_intra_warp_, i32 %thread_idx46
  %687 = load float*, float** %686, align 8, !llvm.mem.parallel_loop_access !18
  %688 = load i32, i32* %local_inter_warp_idx
  %689 = load i32, i32* %local_intra_warp_idx
  %690 = mul i32 %688, 32
  %thread_idx94 = add i32 %689, %690
  %691 = getelementptr i32, i32* %scale_pointer_intra_warp_, i32 %thread_idx94
  %692 = load i32, i32* %691, align 4, !llvm.mem.parallel_loop_access !18
  %693 = load i32, i32* %local_inter_warp_idx
  %694 = load i32, i32* %local_intra_warp_idx
  %695 = mul i32 %693, 32
  %thread_idx168 = add i32 %694, %695
  %696 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx168
  %697 = load i32, i32* %696, align 4, !llvm.mem.parallel_loop_access !18
  %add112 = add nsw i32 %692, %697
  %idxprom113 = sext i32 %add112 to i64
  %arrayidx114 = getelementptr inbounds float, float* %687, i64 %idxprom113
  %698 = load float, float* %arrayidx114, align 4, !llvm.mem.parallel_loop_access !18
  %699 = load i32, i32* %local_inter_warp_idx
  %700 = load i32, i32* %local_intra_warp_idx
  %701 = mul i32 %699, 32
  %thread_idx153 = add i32 %700, %701
  %702 = getelementptr float, float* %scale_min_intra_warp_, i32 %thread_idx153
  store float %698, float* %702, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end115

if.end115:                                        ; preds = %if.then111, %if.end91
  br label %for.inc116

for.inc116:                                       ; preds = %if.end115
  %703 = load i32, i32* %local_inter_warp_idx
  %704 = load i32, i32* %local_intra_warp_idx
  %705 = mul i32 %703, 32
  %thread_idx167 = add i32 %704, %705
  %706 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx167
  %707 = load i32, i32* %706, align 4, !llvm.mem.parallel_loop_access !18
  %inc117 = add nsw i32 %707, 1
  %708 = load i32, i32* %local_inter_warp_idx
  %709 = load i32, i32* %local_intra_warp_idx
  %710 = mul i32 %708, 32
  %thread_idx166 = add i32 %709, %710
  %711 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx166
  store i32 %inc117, i32* %711, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond72

for.end118:                                       ; preds = %for.cond72
  %712 = load i32, i32* %local_inter_warp_idx
  %713 = load i32, i32* %local_intra_warp_idx
  %714 = mul i32 %712, 32
  %thread_idx152 = add i32 %713, %714
  %715 = getelementptr float, float* %scale_min_intra_warp_, i32 %thread_idx152
  %716 = load float, float* %715, align 4, !llvm.mem.parallel_loop_access !18
  %conv119 = fpext float %716 to double
  %cmp120 = fcmp olt double %conv119, 1.250000e-01
  br i1 %cmp120, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end118
  %717 = load i32, i32* %local_inter_warp_idx
  %718 = load i32, i32* %local_intra_warp_idx
  %719 = mul i32 %717, 32
  %thread_idx8 = add i32 %718, %719
  %720 = getelementptr double, double* %cond.ex_phi_intra_warp_, i32 %thread_idx8
  store double 1.250000e-01, double* %720, !llvm.mem.parallel_loop_access !18
  br label %cond.end

cond.false:                                       ; preds = %for.end118
  %721 = load i32, i32* %local_inter_warp_idx
  %722 = load i32, i32* %local_intra_warp_idx
  %723 = mul i32 %721, 32
  %thread_idx151 = add i32 %722, %723
  %724 = getelementptr float, float* %scale_min_intra_warp_, i32 %thread_idx151
  %725 = load float, float* %724, align 4, !llvm.mem.parallel_loop_access !18
  %conv121 = fpext float %725 to double
  %726 = load i32, i32* %local_inter_warp_idx
  %727 = load i32, i32* %local_intra_warp_idx
  %728 = mul i32 %726, 32
  %thread_idx7 = add i32 %727, %728
  %729 = getelementptr double, double* %cond.ex_phi_intra_warp_, i32 %thread_idx7
  store double %conv121, double* %729, !llvm.mem.parallel_loop_access !18
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %730 = load i32, i32* %local_inter_warp_idx
  %731 = load i32, i32* %local_intra_warp_idx
  %732 = mul i32 %730, 32
  %thread_idx6 = add i32 %731, %732
  %733 = getelementptr double, double* %cond.ex_phi_intra_warp_, i32 %thread_idx6
  %734 = load double, double* %733, !llvm.mem.parallel_loop_access !18
  %cmp122 = fcmp olt double %734, 4.000000e+00
  br i1 %cmp122, label %cond.true123, label %cond.false131

cond.true123:                                     ; preds = %cond.end
  %735 = load i32, i32* %local_inter_warp_idx
  %736 = load i32, i32* %local_intra_warp_idx
  %737 = mul i32 %735, 32
  %thread_idx150 = add i32 %736, %737
  %738 = getelementptr float, float* %scale_min_intra_warp_, i32 %thread_idx150
  %739 = load float, float* %738, align 4, !llvm.mem.parallel_loop_access !18
  %conv124 = fpext float %739 to double
  %cmp125 = fcmp olt double %conv124, 1.250000e-01
  br i1 %cmp125, label %cond.true126, label %cond.false127

cond.true126:                                     ; preds = %cond.true123
  %740 = load i32, i32* %local_inter_warp_idx
  %741 = load i32, i32* %local_intra_warp_idx
  %742 = mul i32 %740, 32
  %thread_idx5 = add i32 %741, %742
  %743 = getelementptr double, double* %cond130.ex_phi_intra_warp_, i32 %thread_idx5
  store double 1.250000e-01, double* %743, !llvm.mem.parallel_loop_access !18
  br label %cond.end129

cond.false127:                                    ; preds = %cond.true123
  %744 = load i32, i32* %local_inter_warp_idx
  %745 = load i32, i32* %local_intra_warp_idx
  %746 = mul i32 %744, 32
  %thread_idx149 = add i32 %745, %746
  %747 = getelementptr float, float* %scale_min_intra_warp_, i32 %thread_idx149
  %748 = load float, float* %747, align 4, !llvm.mem.parallel_loop_access !18
  %conv128 = fpext float %748 to double
  %749 = load i32, i32* %local_inter_warp_idx
  %750 = load i32, i32* %local_intra_warp_idx
  %751 = mul i32 %749, 32
  %thread_idx4 = add i32 %750, %751
  %752 = getelementptr double, double* %cond130.ex_phi_intra_warp_, i32 %thread_idx4
  store double %conv128, double* %752, !llvm.mem.parallel_loop_access !18
  br label %cond.end129

cond.end129:                                      ; preds = %cond.false127, %cond.true126
  %753 = load i32, i32* %local_inter_warp_idx
  %754 = load i32, i32* %local_intra_warp_idx
  %755 = mul i32 %753, 32
  %thread_idx3 = add i32 %754, %755
  %756 = getelementptr double, double* %cond130.ex_phi_intra_warp_, i32 %thread_idx3
  %757 = load double, double* %756, !llvm.mem.parallel_loop_access !18
  %758 = load i32, i32* %local_inter_warp_idx
  %759 = load i32, i32* %local_intra_warp_idx
  %760 = mul i32 %758, 32
  %thread_idx2 = add i32 %759, %760
  %761 = getelementptr double, double* %cond133.ex_phi_intra_warp_, i32 %thread_idx2
  store double %757, double* %761, !llvm.mem.parallel_loop_access !18
  br label %cond.end132

cond.false131:                                    ; preds = %cond.end
  %762 = load i32, i32* %local_inter_warp_idx
  %763 = load i32, i32* %local_intra_warp_idx
  %764 = mul i32 %762, 32
  %thread_idx1 = add i32 %763, %764
  %765 = getelementptr double, double* %cond133.ex_phi_intra_warp_, i32 %thread_idx1
  store double 4.000000e+00, double* %765, !llvm.mem.parallel_loop_access !18
  br label %cond.end132

cond.end132:                                      ; preds = %cond.false131, %cond.end129
  %766 = load i32, i32* %local_inter_warp_idx
  %767 = load i32, i32* %local_intra_warp_idx
  %768 = mul i32 %766, 32
  %thread_idx = add i32 %767, %768
  %769 = getelementptr double, double* %cond133.ex_phi_intra_warp_, i32 %thread_idx
  %770 = load double, double* %769, !llvm.mem.parallel_loop_access !18
  %conv134 = fptrunc double %770 to float
  %771 = load i32, i32* %local_inter_warp_idx
  %772 = load i32, i32* %local_intra_warp_idx
  %773 = mul i32 %771, 32
  %thread_idx157 = add i32 %772, %773
  %774 = getelementptr float, float* %scale_fina_intra_warp_, i32 %thread_idx157
  store float %conv134, float* %774, align 4, !llvm.mem.parallel_loop_access !18
  %775 = load i32, i32* %local_inter_warp_idx
  %776 = load i32, i32* %local_intra_warp_idx
  %777 = mul i32 %775, 32
  %thread_idx165 = add i32 %776, %777
  %778 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx165
  store i32 0, i32* %778, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond135

for.cond135:                                      ; preds = %for.inc148, %cond.end132
  %779 = load i32, i32* %local_inter_warp_idx
  %780 = load i32, i32* %local_intra_warp_idx
  %781 = mul i32 %779, 32
  %thread_idx164 = add i32 %780, %781
  %782 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx164
  %783 = load i32, i32* %782, align 4, !llvm.mem.parallel_loop_access !18
  %cmp136 = icmp slt i32 %783, 91
  br i1 %cmp136, label %for.body137, label %for.end150

for.body137:                                      ; preds = %for.cond135
  %784 = load i32, i32* %local_inter_warp_idx
  %785 = load i32, i32* %local_intra_warp_idx
  %786 = mul i32 %784, 32
  %thread_idx41 = add i32 %785, %786
  %787 = getelementptr float*, float** %err.addr_intra_warp_, i32 %thread_idx41
  %788 = load float*, float** %787, align 8, !llvm.mem.parallel_loop_access !18
  %789 = load i32, i32* %local_inter_warp_idx
  %790 = load i32, i32* %local_intra_warp_idx
  %791 = mul i32 %789, 32
  %thread_idx89 = add i32 %790, %791
  %792 = getelementptr i32, i32* %err_pointer_intra_warp_, i32 %thread_idx89
  %793 = load i32, i32* %792, align 4, !llvm.mem.parallel_loop_access !18
  %794 = load i32, i32* %local_inter_warp_idx
  %795 = load i32, i32* %local_intra_warp_idx
  %796 = mul i32 %794, 32
  %thread_idx163 = add i32 %795, %796
  %797 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx163
  %798 = load i32, i32* %797, align 4, !llvm.mem.parallel_loop_access !18
  %add138 = add nsw i32 %793, %798
  %idxprom139 = sext i32 %add138 to i64
  %arrayidx140 = getelementptr inbounds float, float* %788, i64 %idxprom139
  %799 = load float, float* %arrayidx140, align 4, !llvm.mem.parallel_loop_access !18
  %800 = load i32, i32* %local_inter_warp_idx
  %801 = load i32, i32* %local_intra_warp_idx
  %802 = mul i32 %800, 32
  %thread_idx133 = add i32 %801, %802
  %803 = getelementptr float, float* %tolerance_intra_warp_, i32 %thread_idx133
  %804 = load float, float* %803, align 4, !llvm.mem.parallel_loop_access !18
  %805 = load i32, i32* %local_inter_warp_idx
  %806 = load i32, i32* %local_intra_warp_idx
  %807 = mul i32 %805, 32
  %thread_idx50 = add i32 %806, %807
  %808 = getelementptr float*, float** %yy.addr_intra_warp_, i32 %thread_idx50
  %809 = load float*, float** %808, align 8, !llvm.mem.parallel_loop_access !18
  %810 = load i32, i32* %local_inter_warp_idx
  %811 = load i32, i32* %local_intra_warp_idx
  %812 = mul i32 %810, 32
  %thread_idx98 = add i32 %811, %812
  %813 = getelementptr i32, i32* %yy_pointer_intra_warp_, i32 %thread_idx98
  %814 = load i32, i32* %813, align 4, !llvm.mem.parallel_loop_access !18
  %815 = load i32, i32* %local_inter_warp_idx
  %816 = load i32, i32* %local_intra_warp_idx
  %817 = mul i32 %815, 32
  %thread_idx162 = add i32 %816, %817
  %818 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx162
  %819 = load i32, i32* %818, align 4, !llvm.mem.parallel_loop_access !18
  %add141 = add nsw i32 %814, %819
  %idxprom142 = sext i32 %add141 to i64
  %arrayidx143 = getelementptr inbounds float, float* %809, i64 %idxprom142
  %820 = load float, float* %arrayidx143, align 4, !llvm.mem.parallel_loop_access !18
  %mul144 = fmul contract float %804, %820
  %cmp145 = fcmp ogt float %799, %mul144
  br i1 %cmp145, label %if.then146, label %if.end147

if.then146:                                       ; preds = %for.body137
  %821 = load i32, i32* %local_inter_warp_idx
  %822 = load i32, i32* %local_intra_warp_idx
  %823 = mul i32 %821, 32
  %thread_idx147 = add i32 %822, %823
  %824 = getelementptr i32, i32* %outside_intra_warp_, i32 %thread_idx147
  store i32 1, i32* %824, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %for.body137
  br label %for.inc148

for.inc148:                                       ; preds = %if.end147
  %825 = load i32, i32* %local_inter_warp_idx
  %826 = load i32, i32* %local_intra_warp_idx
  %827 = mul i32 %825, 32
  %thread_idx161 = add i32 %826, %827
  %828 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx161
  %829 = load i32, i32* %828, align 4, !llvm.mem.parallel_loop_access !18
  %inc149 = add nsw i32 %829, 1
  %830 = load i32, i32* %local_inter_warp_idx
  %831 = load i32, i32* %local_intra_warp_idx
  %832 = mul i32 %830, 32
  %thread_idx160 = add i32 %831, %832
  %833 = getelementptr i32, i32* %i_intra_warp_, i32 %thread_idx160
  store i32 %inc149, i32* %833, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond135

for.end150:                                       ; preds = %for.cond135
  %834 = load i32, i32* %local_inter_warp_idx
  %835 = load i32, i32* %local_intra_warp_idx
  %836 = mul i32 %834, 32
  %thread_idx146 = add i32 %835, %836
  %837 = getelementptr i32, i32* %outside_intra_warp_, i32 %thread_idx146
  %838 = load i32, i32* %837, align 4, !llvm.mem.parallel_loop_access !18
  %cmp151 = icmp eq i32 %838, 0
  br i1 %cmp151, label %if.then152, label %if.end153

if.then152:                                       ; preds = %for.end150
  br label %for.end185

if.end153:                                        ; preds = %for.end150
  %839 = load i32, i32* %local_inter_warp_idx
  %840 = load i32, i32* %local_intra_warp_idx
  %841 = mul i32 %839, 32
  %thread_idx126 = add i32 %840, %841
  %842 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx126
  %843 = load float, float* %842, align 4, !llvm.mem.parallel_loop_access !18
  %844 = load i32, i32* %local_inter_warp_idx
  %845 = load i32, i32* %local_intra_warp_idx
  %846 = mul i32 %844, 32
  %thread_idx156 = add i32 %845, %846
  %847 = getelementptr float, float* %scale_fina_intra_warp_, i32 %thread_idx156
  %848 = load float, float* %847, align 4, !llvm.mem.parallel_loop_access !18
  %mul154 = fmul contract float %843, %848
  %849 = load i32, i32* %local_inter_warp_idx
  %850 = load i32, i32* %local_intra_warp_idx
  %851 = mul i32 %849, 32
  %thread_idx125 = add i32 %850, %851
  %852 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx125
  store float %mul154, float* %852, align 4, !llvm.mem.parallel_loop_access !18
  %853 = load i32, i32* %local_inter_warp_idx
  %854 = load i32, i32* %local_intra_warp_idx
  %855 = mul i32 %853, 32
  %thread_idx124 = add i32 %854, %855
  %856 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx124
  %857 = load float, float* %856, align 4, !llvm.mem.parallel_loop_access !18
  %conv155 = fpext float %857 to double
  %cmp156 = fcmp oge double %conv155, 9.000000e-01
  br i1 %cmp156, label %if.then157, label %if.end158

if.then157:                                       ; preds = %if.end153
  %858 = load i32, i32* %local_inter_warp_idx
  %859 = load i32, i32* %local_intra_warp_idx
  %860 = mul i32 %858, 32
  %thread_idx123 = add i32 %859, %860
  %861 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx123
  store float 0x3FECCCCCC0000000, float* %861, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end158

if.end158:                                        ; preds = %if.then157, %if.end153
  %862 = load i32, i32* %local_inter_warp_idx
  %863 = load i32, i32* %local_intra_warp_idx
  %864 = mul i32 %862, 32
  %thread_idx28 = add i32 %863, %864
  %865 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx28
  %866 = load float*, float** %865, align 8, !llvm.mem.parallel_loop_access !18
  %867 = load i32, i32* %local_inter_warp_idx
  %868 = load i32, i32* %local_intra_warp_idx
  %869 = mul i32 %867, 32
  %thread_idx85 = add i32 %868, %869
  %870 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx85
  %871 = load i64, i64* %870, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx159 = getelementptr inbounds float, float* %866, i64 %871
  %872 = load float, float* %arrayidx159, align 4, !llvm.mem.parallel_loop_access !18
  %873 = load i32, i32* %local_inter_warp_idx
  %874 = load i32, i32* %local_intra_warp_idx
  %875 = mul i32 %873, 32
  %thread_idx122 = add i32 %874, %875
  %876 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx122
  %877 = load float, float* %876, align 4, !llvm.mem.parallel_loop_access !18
  %add160 = fadd contract float %872, %877
  %878 = load i32, i32* %local_inter_warp_idx
  %879 = load i32, i32* %local_intra_warp_idx
  %880 = mul i32 %878, 32
  %thread_idx13 = add i32 %879, %880
  %881 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx13
  %882 = load i32, i32* %881, align 4, !llvm.mem.parallel_loop_access !18
  %conv161 = sitofp i32 %882 to float
  %cmp162 = fcmp ogt float %add160, %conv161
  br i1 %cmp162, label %if.then163, label %if.else167

if.then163:                                       ; preds = %if.end158
  %883 = load i32, i32* %local_inter_warp_idx
  %884 = load i32, i32* %local_intra_warp_idx
  %885 = mul i32 %883, 32
  %thread_idx12 = add i32 %884, %885
  %886 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx12
  %887 = load i32, i32* %886, align 4, !llvm.mem.parallel_loop_access !18
  %conv164 = sitofp i32 %887 to float
  %888 = load i32, i32* %local_inter_warp_idx
  %889 = load i32, i32* %local_intra_warp_idx
  %890 = mul i32 %888, 32
  %thread_idx27 = add i32 %889, %890
  %891 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx27
  %892 = load float*, float** %891, align 8, !llvm.mem.parallel_loop_access !18
  %893 = load i32, i32* %local_inter_warp_idx
  %894 = load i32, i32* %local_intra_warp_idx
  %895 = mul i32 %893, 32
  %thread_idx84 = add i32 %894, %895
  %896 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx84
  %897 = load i64, i64* %896, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx165 = getelementptr inbounds float, float* %892, i64 %897
  %898 = load float, float* %arrayidx165, align 4, !llvm.mem.parallel_loop_access !18
  %sub166 = fsub contract float %conv164, %898
  %899 = load i32, i32* %local_inter_warp_idx
  %900 = load i32, i32* %local_intra_warp_idx
  %901 = mul i32 %899, 32
  %thread_idx121 = add i32 %900, %901
  %902 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx121
  store float %sub166, float* %902, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end182

if.else167:                                       ; preds = %if.end158
  %903 = load i32, i32* %local_inter_warp_idx
  %904 = load i32, i32* %local_intra_warp_idx
  %905 = mul i32 %903, 32
  %thread_idx26 = add i32 %904, %905
  %906 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx26
  %907 = load float*, float** %906, align 8, !llvm.mem.parallel_loop_access !18
  %908 = load i32, i32* %local_inter_warp_idx
  %909 = load i32, i32* %local_intra_warp_idx
  %910 = mul i32 %908, 32
  %thread_idx83 = add i32 %909, %910
  %911 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx83
  %912 = load i64, i64* %911, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx168 = getelementptr inbounds float, float* %907, i64 %912
  %913 = load float, float* %arrayidx168, align 4, !llvm.mem.parallel_loop_access !18
  %914 = load i32, i32* %local_inter_warp_idx
  %915 = load i32, i32* %local_intra_warp_idx
  %916 = mul i32 %914, 32
  %thread_idx120 = add i32 %915, %916
  %917 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx120
  %918 = load float, float* %917, align 4, !llvm.mem.parallel_loop_access !18
  %add169 = fadd contract float %913, %918
  %conv170 = fpext float %add169 to double
  %919 = load i32, i32* %local_inter_warp_idx
  %920 = load i32, i32* %local_intra_warp_idx
  %921 = mul i32 %919, 32
  %thread_idx119 = add i32 %920, %921
  %922 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx119
  %923 = load float, float* %922, align 4, !llvm.mem.parallel_loop_access !18
  %conv171 = fpext float %923 to double
  %mul172 = fmul contract double 5.000000e-01, %conv171
  %add173 = fadd contract double %conv170, %mul172
  %924 = load i32, i32* %local_inter_warp_idx
  %925 = load i32, i32* %local_intra_warp_idx
  %926 = mul i32 %924, 32
  %thread_idx11 = add i32 %925, %926
  %927 = getelementptr i32, i32* %xmax.addr_intra_warp_, i32 %thread_idx11
  %928 = load i32, i32* %927, align 4, !llvm.mem.parallel_loop_access !18
  %conv174 = sitofp i32 %928 to float
  %conv175 = fpext float %conv174 to double
  %cmp176 = fcmp ogt double %add173, %conv175
  br i1 %cmp176, label %if.then177, label %if.end181

if.then177:                                       ; preds = %if.else167
  %929 = load i32, i32* %local_inter_warp_idx
  %930 = load i32, i32* %local_intra_warp_idx
  %931 = mul i32 %929, 32
  %thread_idx118 = add i32 %930, %931
  %932 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx118
  %933 = load float, float* %932, align 4, !llvm.mem.parallel_loop_access !18
  %conv178 = fpext float %933 to double
  %mul179 = fmul contract double 5.000000e-01, %conv178
  %conv180 = fptrunc double %mul179 to float
  %934 = load i32, i32* %local_inter_warp_idx
  %935 = load i32, i32* %local_intra_warp_idx
  %936 = mul i32 %934, 32
  %thread_idx117 = add i32 %935, %936
  %937 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx117
  store float %conv180, float* %937, align 4, !llvm.mem.parallel_loop_access !18
  br label %if.end181

if.end181:                                        ; preds = %if.then177, %if.else167
  br label %if.end182

if.end182:                                        ; preds = %if.end181, %if.then163
  br label %for.inc183

for.inc183:                                       ; preds = %if.end182
  %938 = load i32, i32* %local_inter_warp_idx
  %939 = load i32, i32* %local_intra_warp_idx
  %940 = mul i32 %938, 32
  %thread_idx186 = add i32 %939, %940
  %941 = getelementptr i32, i32* %j_intra_warp_, i32 %thread_idx186
  %942 = load i32, i32* %941, align 4, !llvm.mem.parallel_loop_access !18
  %inc184 = add nsw i32 %942, 1
  %943 = load i32, i32* %local_inter_warp_idx
  %944 = load i32, i32* %local_intra_warp_idx
  %945 = mul i32 %943, 32
  %thread_idx185 = add i32 %944, %945
  %946 = getelementptr i32, i32* %j_intra_warp_, i32 %thread_idx185
  store i32 %inc184, i32* %946, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond45

for.end185.loopexit:                              ; preds = %for.cond45
  br label %for.end185

for.end185:                                       ; preds = %for.end185.loopexit, %if.then152, %if.then70
  %947 = load i32, i32* %local_inter_warp_idx
  %948 = load i32, i32* %local_intra_warp_idx
  %949 = mul i32 %947, 32
  %thread_idx25 = add i32 %948, %949
  %950 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx25
  %951 = load float*, float** %950, align 8, !llvm.mem.parallel_loop_access !18
  %952 = load i32, i32* %local_inter_warp_idx
  %953 = load i32, i32* %local_intra_warp_idx
  %954 = mul i32 %952, 32
  %thread_idx82 = add i32 %953, %954
  %955 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx82
  %956 = load i64, i64* %955, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx186 = getelementptr inbounds float, float* %951, i64 %956
  %957 = load float, float* %arrayidx186, align 4, !llvm.mem.parallel_loop_access !18
  %958 = load i32, i32* %local_inter_warp_idx
  %959 = load i32, i32* %local_intra_warp_idx
  %960 = mul i32 %958, 32
  %thread_idx116 = add i32 %959, %960
  %961 = getelementptr float, float* %h_intra_warp_, i32 %thread_idx116
  %962 = load float, float* %961, align 4, !llvm.mem.parallel_loop_access !18
  %add187 = fadd contract float %957, %962
  %963 = load i32, i32* %local_inter_warp_idx
  %964 = load i32, i32* %local_intra_warp_idx
  %965 = mul i32 %963, 32
  %thread_idx24 = add i32 %964, %965
  %966 = getelementptr float*, float** %x.addr_intra_warp_, i32 %thread_idx24
  %967 = load float*, float** %966, align 8, !llvm.mem.parallel_loop_access !18
  %968 = load i32, i32* %local_inter_warp_idx
  %969 = load i32, i32* %local_intra_warp_idx
  %970 = mul i32 %968, 32
  %thread_idx81 = add i32 %969, %970
  %971 = getelementptr i64, i64* %x_pointer_current_intra_warp_, i32 %thread_idx81
  %972 = load i64, i64* %971, align 8, !llvm.mem.parallel_loop_access !18
  %arrayidx188 = getelementptr inbounds float, float* %967, i64 %972
  store float %add187, float* %arrayidx188, align 4, !llvm.mem.parallel_loop_access !18
  %973 = load i32, i32* %local_inter_warp_idx
  %974 = load i32, i32* %local_intra_warp_idx
  %975 = mul i32 %973, 32
  %thread_idx184 = add i32 %974, %975
  %976 = getelementptr i32, i32* %j_intra_warp_, i32 %thread_idx184
  %977 = load i32, i32* %976, align 4, !llvm.mem.parallel_loop_access !18
  %cmp189 = icmp sge i32 %977, 12
  br i1 %cmp189, label %if.then190, label %if.end191

if.then190:                                       ; preds = %for.end185
  br label %return

if.end191:                                        ; preds = %for.end185
  br label %for.inc192

for.inc192:                                       ; preds = %if.end191
  %978 = load i32, i32* %local_inter_warp_idx
  %979 = load i32, i32* %local_intra_warp_idx
  %980 = mul i32 %978, 32
  %thread_idx190 = add i32 %979, %980
  %981 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx190
  %982 = load i32, i32* %981, align 4, !llvm.mem.parallel_loop_access !18
  %inc193 = add nsw i32 %982, 1
  %983 = load i32, i32* %local_inter_warp_idx
  %984 = load i32, i32* %local_intra_warp_idx
  %985 = mul i32 %983, 32
  %thread_idx189 = add i32 %984, %985
  %986 = getelementptr i32, i32* %k_intra_warp_, i32 %thread_idx189
  store i32 %inc193, i32* %986, align 4, !llvm.mem.parallel_loop_access !18
  br label %for.cond

for.end194:                                       ; preds = %for.cond
  br label %if.end195

if.end195:                                        ; preds = %for.end194, %if.end22
  br label %return

return:                                           ; preds = %if.end195, %if.then190, %if.then13, %if.then
  br label %intra_warp_inc

reset_block:                                      ; preds = %intra_warp_cond
  store i32 0, i32* %local_intra_warp_idx
  br label %return_after_block_sync_3

return_after_block_sync_3:                        ; preds = %reset_block
  br label %return_after_block_sync_1

return_after_block_sync_1:                        ; preds = %return_after_block_sync_3
  ret void
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL5powiffi(float %__a, i32 %__b) unnamed_addr #1 {
entry:
  %call = tail call float @__nv_powif(float %__a, i32 %__b) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL4logff(float %__a) unnamed_addr #1 {
entry:
  %call = tail call float @__nv_logf(float %__a) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL4expff(float %__a) unnamed_addr #1 {
entry:
  %call = tail call float @__nv_expf(float %__a) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL6log10ff(float %__a) unnamed_addr #1 {
entry:
  %call = tail call float @__nv_log10f(float %__a) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc double @_ZL4powidi(double %__a) unnamed_addr #1 {
entry:
  %call = tail call double @__nv_powi(double %__a, i32 2) #4
  ret double %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL4powfff(float %__a, float %__b) unnamed_addr #1 {
entry:
  %call = tail call float @__nv_powf(float %__a, float %__b) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL5fmodfff(float %__a, float %__b) unnamed_addr #1 {
entry:
  %call = tail call float @__nv_fmodf(float %__a, float %__b) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc i32 @_ZL8__isnanff(float %__a) unnamed_addr #1 {
entry:
  %call = tail call i32 @__nv_isnanf(float %__a) #4
  ret i32 %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc i32 @_ZL8__isinfff(float %__a) unnamed_addr #1 {
entry:
  %call = tail call i32 @__nv_isinff(float %__a) #4
  ret i32 %call
}

; Function Attrs: alwaysinline convergent nounwind
define internal fastcc float @_ZL5fabsff(float %__a) unnamed_addr #1 {
entry:
  %call = tail call float @__nv_fabsf(float %__a) #4
  ret float %call
}

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local float @__nv_fabsf(float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local double @__nv_sqrt(double) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local i32 @__nv_isinff(float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local i32 @__nv_isnanf(float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local float @__nv_expf(float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local float @__nv_logf(float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local float @__nv_log10f(float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local float @__nv_fmodf(float, float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local float @__nv_powif(float, i32) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local double @__nv_powi(double, i32) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local float @__nv_powf(float, float) local_unnamed_addr #2

; Function Attrs: alwaysinline convergent inlinehint nounwind
declare dso_local double @__nv_exp(double) local_unnamed_addr #2

; Function Attrs: nounwind
define void @_Z6kerneliPfS_S_S__wrapper(i8* noalias nocapture readonly %0) local_unnamed_addr #3 {
  %2 = bitcast i8* %0 to i32**
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr i8, i8* %0, i64 8
  %6 = bitcast i8* %5 to float***
  %7 = load float**, float*** %6, align 8
  %8 = load float*, float** %7, align 8
  %9 = getelementptr i8, i8* %0, i64 16
  %10 = bitcast i8* %9 to float***
  %11 = load float**, float*** %10, align 8
  %12 = load float*, float** %11, align 8
  %13 = getelementptr i8, i8* %0, i64 24
  %14 = bitcast i8* %13 to float***
  %15 = load float**, float*** %14, align 8
  %16 = load float*, float** %15, align 8
  %17 = getelementptr i8, i8* %0, i64 32
  %18 = bitcast i8* %17 to float***
  %19 = load float**, float*** %18, align 8
  %20 = load float*, float** %19, align 8
  tail call void @_Z6kerneliPfS_S_S_(i32 %4, float* %8, float* %12, float* %16, float* %20)
  ret void
}

; Function Attrs: nounwind
define void @_Z8solver_2iiPfS_S_S_S_S_S_S_S__wrapper(i8* noalias nocapture readonly %0) local_unnamed_addr #3 {
  %2 = bitcast i8* %0 to i32**
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr i8, i8* %0, i64 8
  %6 = bitcast i8* %5 to i32**
  %7 = load i32*, i32** %6, align 8
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr i8, i8* %0, i64 16
  %10 = bitcast i8* %9 to float***
  %11 = load float**, float*** %10, align 8
  %12 = load float*, float** %11, align 8
  %13 = getelementptr i8, i8* %0, i64 24
  %14 = bitcast i8* %13 to float***
  %15 = load float**, float*** %14, align 8
  %16 = load float*, float** %15, align 8
  %17 = getelementptr i8, i8* %0, i64 32
  %18 = bitcast i8* %17 to float***
  %19 = load float**, float*** %18, align 8
  %20 = load float*, float** %19, align 8
  %21 = getelementptr i8, i8* %0, i64 40
  %22 = bitcast i8* %21 to float***
  %23 = load float**, float*** %22, align 8
  %24 = load float*, float** %23, align 8
  %25 = getelementptr i8, i8* %0, i64 48
  %26 = bitcast i8* %25 to float***
  %27 = load float**, float*** %26, align 8
  %28 = load float*, float** %27, align 8
  %29 = getelementptr i8, i8* %0, i64 56
  %30 = bitcast i8* %29 to float***
  %31 = load float**, float*** %30, align 8
  %32 = load float*, float** %31, align 8
  %33 = getelementptr i8, i8* %0, i64 64
  %34 = bitcast i8* %33 to float***
  %35 = load float**, float*** %34, align 8
  %36 = load float*, float** %35, align 8
  %37 = getelementptr i8, i8* %0, i64 72
  %38 = bitcast i8* %37 to float***
  %39 = load float**, float*** %38, align 8
  %40 = load float*, float** %39, align 8
  %41 = getelementptr i8, i8* %0, i64 80
  %42 = bitcast i8* %41 to float***
  %43 = load float**, float*** %42, align 8
  %44 = load float*, float** %43, align 8
  tail call void @_Z8solver_2iiPfS_S_S_S_S_S_S_S_(i32 %4, i32 %8, float* %12, float* %16, float* %20, float* %24, float* %28, float* %32, float* %36, float* %40, float* %44)
  ret void
}

attributes #0 = { convergent noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { alwaysinline convergent inlinehint nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { convergent nounwind }

!llvm.module.flags = !{!0, !1, !2}
!nvvm.annotations = !{!3, !4, !5, !6, !5, !7, !7, !7, !7, !8, !8, !7}
!llvm.ident = !{!9}
!nvvmir.version = !{!10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{void (i32, float*, float*, float*, float*)* @_Z6kerneliPfS_S_S_, !"kernel", i32 1}
!4 = !{void (i32, i32, float*, float*, float*, float*, float*, float*, float*, float*, float*)* @_Z8solver_2iiPfS_S_S_S_S_S_S_S_, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!10 = !{i32 1, i32 4}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.parallel_accesses", !13}
!13 = distinct !{}
!14 = !{!13}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.parallel_accesses", !17}
!17 = distinct !{}
!18 = !{!17}
