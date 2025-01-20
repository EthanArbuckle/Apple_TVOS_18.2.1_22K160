@interface KTStates
+ (id)AllKTFlags;
+ (id)KTStateInverseMap;
+ (id)KTStateMap;
+ (id)stateInit;
@end

@implementation KTStates

+ (id)stateInit
{
  v91[0] = @"Ready";
  v91[1] = &off_100299C60;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 2LL));
  v92[0] = v47;
  v90[0] = @"Error";
  v90[1] = &off_100299C78;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 2LL));
  v92[1] = v46;
  v89[0] = @"NoAccount";
  v89[1] = &off_100299C90;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 2LL));
  v92[2] = v45;
  v88[0] = @"Unimplemented";
  v88[1] = &off_100299CA8;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 2LL));
  v92[3] = v44;
  v87[0] = @"WaitForManatee";
  v87[1] = &off_100299CC0;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v87, 2LL));
  v92[4] = v43;
  v86[0] = @"FetchIDSSelf";
  v86[1] = &off_100299CD8;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v86, 2LL));
  v92[5] = v42;
  v85[0] = @"EnsureAccountIdentity";
  v85[1] = &off_100299CF0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 2LL));
  v92[6] = v41;
  v84[0] = @"KTStateCheckCloudKitAccount";
  v84[1] = &off_100299D08;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 2LL));
  v92[7] = v40;
  v83[0] = @"Initializing";
  v83[1] = &off_100299D20;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 2LL));
  v92[8] = v39;
  v82[0] = @"SignalIDS";
  v82[1] = &off_100299D38;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 2LL));
  v92[9] = v38;
  v81[0] = @"FetchConfigBag";
  v81[1] = &off_100299D50;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 2LL));
  v92[10] = v37;
  v80[0] = @"FetchIDMS";
  v80[1] = &off_100299D68;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v80, 2LL));
  v92[11] = v36;
  v79[0] = @"InitialIDMSCheck";
  v79[1] = &off_100299D80;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 2LL));
  v92[12] = v35;
  v78[0] = @"ValidateFetchKTSelf";
  v78[1] = &off_100299D98;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 2LL));
  v92[13] = v34;
  v77[0] = @"ValidateSelf";
  v77[1] = &off_100299DB0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 2LL));
  v92[14] = v33;
  v76[0] = @"SignRegistrationData";
  v76[1] = &off_100299DC8;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 2LL));
  v92[15] = v32;
  v75[0] = @"ForceSyncKVS";
  v75[1] = &off_100299DE0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 2LL));
  v92[16] = v31;
  v74[0] = @"ValidateFetchIDSSelf";
  v74[1] = &off_100299DF8;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v74, 2LL));
  v92[17] = v30;
  v73[0] = @"FetchKTSelf";
  v73[1] = &off_100299E10;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 2LL));
  v92[18] = v29;
  v72[0] = @"PublicKeysFetch";
  v72[1] = &off_100299E28;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 2LL));
  v92[19] = v28;
  v71[0] = @"PublicKeysWait";
  v71[1] = &off_100299E40;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
  v92[20] = v27;
  v70[0] = @"PublicKeysInitialFetch";
  v70[1] = &off_100299E58;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 2LL));
  v92[21] = v26;
  v69[0] = @"CheckIDSRegistration";
  v69[1] = &off_100299E70;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 2LL));
  v92[22] = v25;
  v68[0] = @"RecheckAccount";
  v68[1] = &off_100299E88;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 2LL));
  v92[23] = v24;
  v67[0] = @"ResetLocalState";
  v67[1] = &off_100299EA0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
  v92[24] = v23;
  v66[0] = @"SetOptIO";
  v66[1] = &off_100299EB8;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 2LL));
  v92[25] = v22;
  v65[0] = @"ChangeOptIn";
  v65[1] = &off_100299ED0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 2LL));
  v92[26] = v21;
  v64[0] = @"ValidateSelfOptIn";
  v64[1] = &off_100299EE8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 2LL));
  v92[27] = v20;
  v63[0] = @"RetryEnsureAccountIdentity";
  v63[1] = &off_100299F00;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL));
  v92[28] = v19;
  v62[0] = @"ProcessOutgoing";
  v62[1] = &off_100299F18;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 2LL));
  v92[29] = v18;
  v61[0] = @"ZoneSetup";
  v61[1] = &off_100299F30;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 2LL));
  v92[30] = v17;
  v60[0] = @"ProcessIncoming";
  v60[1] = &off_100299F48;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v60, 2LL));
  v92[31] = v16;
  v59[0] = @"ProcessIncomingInitial";
  v59[1] = &off_100299F60;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 2LL));
  v92[32] = v15;
  v58[0] = @"KTStateFixups";
  v58[1] = &off_100299F78;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
  v92[33] = v14;
  v57[0] = @"ResetLocalCloudState";
  v57[1] = &off_100299F90;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL));
  v92[34] = v13;
  v56[0] = @"WaitForCKKS";
  v56[1] = &off_100299FA8;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL));
  v92[35] = v2;
  v55[0] = @"ForceSyncKTAccountKey";
  v55[1] = &off_100299FC0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));
  v92[36] = v3;
  v54[0] = @"GetStatus";
  v54[1] = &off_100299FD8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
  v92[37] = v4;
  v53[0] = @"GetStatusInitial";
  v53[1] = &off_100299FF0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 2LL));
  v92[38] = v5;
  v52[0] = @"EnvironmentSwitch";
  v52[1] = &off_10029A008;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 2LL));
  v92[39] = v6;
  v51[0] = @"CheckKTAccountKeyChanged";
  v51[1] = &off_10029A020;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
  v92[40] = v7;
  v50[0] = @"InitialSignRegistrationData";
  v50[1] = &off_10029A038;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 2LL));
  v92[41] = v8;
  v49[0] = @"WaitForUnlock";
  v49[1] = &off_10029A050;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
  v92[42] = v9;
  v48[0] = @"PokeIDS";
  v48[1] = &off_10029A068;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
  v92[43] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 44LL));

  return v11;
}

+ (id)KTStateMap
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001DA868;
  v3[3] = &unk_10028ADF0;
  v3[4] = a1;
  v3[5] = a2;
  if (qword_1002EEFE8 != -1) {
    dispatch_once(&qword_1002EEFE8, v3);
  }
  return (id)qword_1002EEFE0;
}

+ (id)KTStateInverseMap
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001DAAF0;
  v3[3] = &unk_10028ADF0;
  v3[4] = a1;
  v3[5] = a2;
  if (qword_1002EEFF8 != -1) {
    dispatch_once(&qword_1002EEFF8, v3);
  }
  return (id)qword_1002EEFF0;
}

+ (id)AllKTFlags
{
  if (qword_1002EF008 != -1) {
    dispatch_once(&qword_1002EF008, &stru_10028AE10);
  }
  return (id)qword_1002EF000;
}

@end