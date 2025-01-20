@interface OTStates
+ (id)AllOctagonFlags;
+ (id)OctagonAllStates;
+ (id)OctagonHealthSourceStates;
+ (id)OctagonInAccountStates;
+ (id)OctagonNotInCliqueStates;
+ (id)OctagonReadyStates;
+ (id)OctagonStateInverseMap;
+ (id)OctagonStateMap;
+ (id)stateInit;
@end

@implementation OTStates

+ (id)stateInit
{
  v171[0] = @"Ready";
  v171[1] = &off_1002AD710;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v171, 2LL));
  v172[0] = v87;
  v170[0] = @"Error";
  v170[1] = &off_1002AD728;
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v170, 2LL));
  v172[1] = v86;
  v169[0] = @"Initializing";
  v169[1] = &off_1002AD740;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v169, 2LL));
  v172[2] = v85;
  v168[0] = @"not_started";
  v168[1] = &off_1002AD758;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v168, 2LL));
  v172[3] = v84;
  v167[0] = @"Untrusted";
  v167[1] = &off_1002AD770;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v167, 2LL));
  v172[4] = v83;
  v166[0] = @"ReEnactDeviceList";
  v166[1] = &off_1002AD788;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v166, 2LL));
  v172[5] = v82;
  v165[0] = @"ReEnactPrepare";
  v165[1] = &off_1002AD7A0;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v165, 2LL));
  v172[6] = v81;
  v164[0] = @"ReEnactReadyToEstablish";
  v164[1] = &off_1002AD7B8;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v164, 2LL));
  v172[7] = v80;
  v163[0] = @"NoAccountDoReset";
  v163[1] = &off_1002AD7D0;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v163, 2LL));
  v172[8] = v79;
  v162[0] = @"BottleJoinVouchWithBottle";
  v162[1] = &off_1002AD7E8;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v162, 2LL));
  v172[9] = v78;
  v161[0] = @"BottleJoinCreateIdentity";
  v161[1] = &off_1002AD800;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v161, 2LL));
  v172[10] = v77;
  v160[0] = @"CloudKitNewlyAvailable";
  v160[1] = &off_1002AD818;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v160, 2LL));
  v172[11] = v76;
  v159[0] = @"CheckTrustState";
  v159[1] = &off_1002AD830;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v159, 2LL));
  v172[12] = v75;
  v158[0] = @"BecomeUntrusted";
  v158[1] = &off_1002AD848;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v158, 2LL));
  v172[13] = v74;
  v157[0] = @"WaitForUnlock";
  v157[1] = &off_1002AD860;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v157, 2LL));
  v172[14] = v73;
  v156[0] = @"WaitingForCloudKitAccount";
  v156[1] = &off_1002AD878;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v156, 2LL));
  v172[15] = v72;
  v155[0] = @"BecomeReady";
  v155[1] = &off_1002AD890;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v155, 2LL));
  v172[16] = v71;
  v154[0] = @"VouchWithRecoveryKey";
  v154[1] = &off_1002AD8A8;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v154, 2LL));
  v172[17] = v70;
  v153[0] = @"CreateIdentityForRecoveryKey";
  v153[1] = &off_1002AD8C0;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v153, 2LL));
  v172[18] = v69;
  v152[0] = @"UpdateSOSPreapprovals";
  v152[1] = &off_1002AD8D8;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v152, 2LL));
  v172[19] = v68;
  v151[0] = @"WaitForCDPCapableSecurityLevel";
  v151[1] = &off_1002AD8F0;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v151, 2LL));
  v172[20] = v67;
  v150[0] = @"AssistCKKSTLKUpload";
  v150[1] = &off_1002AD908;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v150, 2LL));
  v172[21] = v66;
  v149[0] = @"EscrowTriggerUpdate";
  v149[1] = &off_1002AD920;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v149, 2LL));
  v172[22] = v65;
  v148[0] = @"EnsureConsistency";
  v148[1] = &off_1002AD938;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v148, 2LL));
  v172[23] = v64;
  v147[0] = @"ResetBecomeUntrusted";
  v147[1] = &off_1002AD950;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v147, 2LL));
  v172[24] = v63;
  v146[0] = @"UntrustedUpdated";
  v146[1] = &off_1002AD968;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v146, 2LL));
  v172[25] = v62;
  v145[0] = @"ReadyUpdated";
  v145[1] = &off_1002AD980;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v145, 2LL));
  v172[26] = v61;
  v144[0] = @"TPHTrustCheck";
  v144[1] = &off_1002AD998;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v144, 2LL));
  v172[27] = v60;
  v143[0] = @"CuttlefishTrustCheck";
  v143[1] = &off_1002AD9B0;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v143, 2LL));
  v172[28] = v59;
  v142[0] = @"PostRepairCFU";
  v142[1] = &off_1002AD9C8;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v142, 2LL));
  v172[29] = v58;
  v141[0] = @"SecurityTrustCheck";
  v141[1] = &off_1002AD9E0;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v141, 2LL));
  v172[30] = v57;
  v140[0] = @"EnsureUpdatePreapprovals";
  v140[1] = &off_1002AD9F8;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v140, 2LL));
  v172[31] = v56;
  v139[0] = @"ResetAnyMissingTLKCKKSViews";
  v139[1] = &off_1002ADA10;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v139, 2LL));
  v172[32] = v55;
  v138[0] = @"EstablishCKKSReset";
  v138[1] = &off_1002ADA28;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v138, 2LL));
  v172[33] = v54;
  v137[0] = @"EstablishAfterCKKSReset";
  v137[1] = &off_1002ADA40;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v137, 2LL));
  v172[34] = v53;
  v136[0] = @"SOSUpgradeCKKSReset";
  v136[1] = &off_1002ADA58;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v136, 2LL));
  v172[35] = v52;
  v135[0] = @"SOSUpgradeAfterCKKSReset";
  v135[1] = &off_1002ADA70;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v135, 2LL));
  v172[36] = v51;
  v134[0] = @"InitiatorJoinCKKSReset";
  v134[1] = &off_1002ADA88;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v134, 2LL));
  v172[37] = v50;
  v133[0] = @"InitiatorJoinAfterCKKSReset";
  v133[1] = &off_1002ADAA0;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v133, 2LL));
  v172[38] = v49;
  v132[0] = @"HealthCheckReset";
  v132[1] = &off_1002ADAB8;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v132, 2LL));
  v172[39] = v48;
  v131[0] = @"AssistCKKSTLKUploadCKKSReset";
  v131[1] = &off_1002ADAD0;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v131, 2LL));
  v172[40] = v47;
  v130[0] = @"AssistCKKSTLKUploadAfterCKKSReset";
  v130[1] = &off_1002ADAE8;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v130, 2LL));
  v172[41] = v46;
  v129[0] = @"WaitForCDP";
  v129[1] = &off_1002ADB00;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v129, 2LL));
  v172[42] = v45;
  v128[0] = @"DetermineCDPState";
  v128[1] = &off_1002ADB18;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v128, 2LL));
  v172[43] = v44;
  v127[0] = @"WaitForCDPUpdated";
  v127[1] = &off_1002ADB30;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v127, 2LL));
  v172[44] = v43;
  v126[0] = @"EstablishEnableCDPBit";
  v126[1] = &off_1002ADB48;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v126, 2LL));
  v172[45] = v42;
  v125[0] = @"InitiatorSetCDPBit";
  v125[1] = &off_1002ADB60;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v125, 2LL));
  v172[46] = v41;
  v124[0] = @"CDPHealthCheck";
  v124[1] = &off_1002ADB78;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v124, 2LL));
  v172[47] = v40;
  v123[0] = @"HealthCheckLeaveClique";
  v123[1] = &off_1002ADB90;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v123, 2LL));
  v172[48] = v39;
  v122[0] = @"RefetchCKKSPolicy";
  v122[1] = &off_1002ADBA8;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 2LL));
  v172[49] = v38;
  v121[0] = @"EnableUserControllableViews";
  v121[1] = &off_1002ADBC0;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v121, 2LL));
  v172[50] = v37;
  v120[0] = @"DisableUserControllableViews";
  v120[1] = &off_1002ADBD8;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v120, 2LL));
  v172[51] = v36;
  v119[0] = @"SetUserControllableViewsToPeerConsensus";
  v119[1] = &off_1002ADBF0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v119, 2LL));
  v172[52] = v35;
  v118[0] = @"WaitForClassCUnlock";
  v118[1] = &off_1002ADC08;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v118, 2LL));
  v172[53] = v34;
  v117[0] = @"BottlePreloadOctagonKeysInSOS";
  v117[1] = &off_1002ADC20;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v117, 2LL));
  v172[54] = v33;
  v116[0] = @"AttemptSOSUpgradeDetermineCDPState";
  v116[1] = &off_1002ADC38;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v116, 2LL));
  v172[55] = v32;
  v115[0] = @"SetAccountSettings";
  v115[1] = &off_1002ADC50;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v115, 2LL));
  v172[56] = v31;
  v114[0] = @"CreateIdentityForCustodianRecoveryKey";
  v114[1] = &off_1002ADC68;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v114, 2LL));
  v172[57] = v30;
  v113[0] = @"VouchWithCustodianRecoveryKey";
  v113[1] = &off_1002ADC80;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v113, 2LL));
  v172[58] = v29;
  v112[0] = @"CheckForAccountFixups";
  v112[1] = &off_1002ADC98;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v112, 2LL));
  v172[59] = v28;
  v111[0] = @"PerformAccountFixups";
  v111[1] = &off_1002ADCB0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v111, 2LL));
  v172[60] = v27;
  v110[0] = @"JoinSOSAfterCKKSFetch";
  v110[1] = &off_1002ADCC8;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v110, 2LL));
  v172[61] = v26;
  v109[0] = @"AttemptSOSUpgrade";
  v109[1] = &off_1002ADCE0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v109, 2LL));
  v172[62] = v25;
  v108[0] = @"InitiatorUpdateDeviceList";
  v108[1] = &off_1002ADCF8;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v108, 2LL));
  v172[63] = v24;
  v107[0] = @"InitiatorAwaitingVoucher";
  v107[1] = &off_1002ADD10;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v107, 2LL));
  v172[64] = v23;
  v106[0] = @"InitiatorJoin";
  v106[1] = &off_1002ADD28;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v106, 2LL));
  v172[65] = v22;
  v105[0] = @"NoAccount";
  v105[1] = &off_1002ADD40;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v105, 2LL));
  v172[66] = v21;
  v104[0] = @"ResetAndEstablish";
  v104[1] = &off_1002ADD58;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 2LL));
  v172[67] = v20;
  v103[0] = @"Unimplemented";
  v103[1] = &off_1002ADD70;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v103, 2LL));
  v172[68] = v19;
  v102[0] = @"DetermineiCloudAccountState";
  v102[1] = &off_1002ADD88;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v102, 2LL));
  v172[69] = v18;
  v101[0] = @"DetermineiCloudAccountState";
  v101[1] = &off_1002ADD88;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v101, 2LL));
  v172[70] = v17;
  v100[0] = @"PrepareAndRecoverTLKSharesForInheritancePeer";
  v100[1] = &off_1002ADDA0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v100, 2LL));
  v172[71] = v16;
  v99[0] = @"BecomeInherited";
  v99[1] = &off_1002ADDB8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v99, 2LL));
  v172[72] = v15;
  v98[0] = @"Inherited";
  v98[1] = &off_1002ADDD0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v98, 2LL));
  v172[73] = v14;
  v97[0] = @"PeerMissingFromServer";
  v97[1] = &off_1002ADDE8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v97, 2LL));
  v172[74] = v13;
  v96[0] = @"ResetAndEstablishClearLocalContextState";
  v96[1] = &off_1002ADE00;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v96, 2LL));
  v172[75] = v2;
  v95[0] = @"LocalReset";
  v95[1] = &off_1002ADE18;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v95, 2LL));
  v172[76] = v3;
  v94[0] = @"LocalResetClearLocalContextState";
  v94[1] = &off_1002ADE30;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v94, 2LL));
  v172[77] = v4;
  v93[0] = @"OctagonStateStashAccountSettingsForRecoveryKey";
  v93[1] = &off_1002ADE48;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 2LL));
  v172[78] = v5;
  v92[0] = @"CuttlefishReset";
  v92[1] = &off_1002ADE60;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 2LL));
  v172[79] = v6;
  v91[0] = @"CKKSResetAfterOctagonReset";
  v91[1] = &off_1002ADE78;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 2LL));
  v172[80] = v7;
  v90[0] = @"OctagonStateStashAccountSettingsForReroll";
  v90[1] = &off_1002ADE90;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 2LL));
  v172[81] = v8;
  v89[0] = @"OctagonStateCreateIdentityForReroll";
  v89[1] = &off_1002ADEA8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 2LL));
  v172[82] = v9;
  v88[0] = @"OctagonStateVouchWithReroll";
  v88[1] = &off_1002ADEC0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 2LL));
  v172[83] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v172, 84LL));

  return v11;
}

+ (id)OctagonStateMap
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10012C67C;
  v3[3] = &unk_1002930C8;
  v3[4] = a1;
  v3[5] = a2;
  if (qword_1002DEC18 != -1) {
    dispatch_once(&qword_1002DEC18, v3);
  }
  return (id)qword_1002DEC10;
}

+ (id)OctagonStateInverseMap
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10012C468;
  v3[3] = &unk_1002930C8;
  v3[4] = a1;
  v3[5] = a2;
  if (qword_1002DEC28 != -1) {
    dispatch_once(&qword_1002DEC28, v3);
  }
  return (id)qword_1002DEC20;
}

+ (id)OctagonInAccountStates
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012C35C;
  block[3] = &unk_1002935A8;
  block[4] = a1;
  if (qword_1002DEC38 != -1) {
    dispatch_once(&qword_1002DEC38, block);
  }
  return (id)qword_1002DEC30;
}

+ (id)OctagonHealthSourceStates
{
  if (qword_1002DEC48 != -1) {
    dispatch_once(&qword_1002DEC48, &stru_100290158);
  }
  return (id)qword_1002DEC40;
}

+ (id)OctagonNotInCliqueStates
{
  if (qword_1002DEC58 != -1) {
    dispatch_once(&qword_1002DEC58, &stru_100290178);
  }
  return (id)qword_1002DEC50;
}

+ (id)OctagonReadyStates
{
  if (qword_1002DEC68 != -1) {
    dispatch_once(&qword_1002DEC68, &stru_100290198);
  }
  return (id)qword_1002DEC60;
}

+ (id)OctagonAllStates
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012C144;
  block[3] = &unk_1002935A8;
  block[4] = a1;
  if (qword_1002DEC78 != -1) {
    dispatch_once(&qword_1002DEC78, block);
  }
  return (id)qword_1002DEC70;
}

+ (id)AllOctagonFlags
{
  if (qword_1002DEC88 != -1) {
    dispatch_once(&qword_1002DEC88, &stru_1002901B8);
  }
  return (id)qword_1002DEC80;
}

@end