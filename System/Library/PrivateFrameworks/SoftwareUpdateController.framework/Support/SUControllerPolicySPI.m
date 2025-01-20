@interface SUControllerPolicySPI
+ (void)installUpdateForClient:(id)a3 withMessage:(id)a4;
+ (void)managerConfigForClient:(id)a3 withMessage:(id)a4;
+ (void)managerStateForClient:(id)a3 withMessage:(id)a4;
+ (void)managerStatusForClient:(id)a3 withMessage:(id)a4;
+ (void)modifyConfigForClient:(id)a3 withMessage:(id)a4;
+ (void)purgeUpdateForClient:(id)a3 withMessage:(id)a4;
+ (void)scanForUpdatesForClient:(id)a3 withMessage:(id)a4;
+ (void)updateAcceptingTermsForClient:(id)a3 withMessage:(id)a4;
+ (void)useSSOTokenToPersonalizeForClient:(id)a3 withMessage:(id)a4;
+ (void)userDidAcceptTermsAndConditionsForClient:(id)a3 withMessage:(id)a4;
@end

@implementation SUControllerPolicySPI

+ (void)managerStatusForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[SPI] >>> %{public}@ {managerStatus}",  buf,  0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002E668;
  v12[3] = &unk_100065750;
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  +[SUControllerCore managerStatusForClient:completion:]( &OBJC_CLASS___SUControllerCore,  "managerStatusForClient:completion:",  v10,  v12);
}

+ (void)managerStateForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[SPI] >>> %{public}@ {managerState}", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002EA34;
  v12[3] = &unk_1000657C8;
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  +[SUControllerCore managerStateForClient:completion:]( &OBJC_CLASS___SUControllerCore,  "managerStateForClient:completion:",  v10,  v12);
}

+ (void)managerConfigForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[SPI] >>> %{public}@ {managerConfig}",  buf,  0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002EDF4;
  v12[3] = &unk_100065420;
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  +[SUControllerCore managerConfigForClient:completion:]( &OBJC_CLASS___SUControllerCore,  "managerConfigForClient:completion:",  v10,  v12);
}

+ (void)modifyConfigForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = off_100079400;
  v8 = off_1000794D8;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SUControllerConfig);
  id v10 = sub_1000311AC((uint64_t)v7, v6, v8, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  int64_t int64 = xpc_dictionary_get_int64(v6, off_1000794E0);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

  if (v11) {
    BOOL v15 = int64 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003E8DC(v5);
    }

    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      v21 = off_100079400;
      v22 = off_100079478;
      id v23 = sub_1000382D8( @"SUControllerError",  36LL,  0LL,  @"No modified configuration provided",  v16,  v17,  v18,  v19,  v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      sub_100030EE8((uint64_t)v21, reply, v22, v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10003E864(v5);
      }

      v27 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v5 connection]);
      xpc_connection_send_message(v27, reply);
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v27 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10003E7EC(v5);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v11 changeSummary:int64]);
      *(_DWORD *)buf = 138543874;
      v38 = v29;
      __int16 v39 = 2048;
      int64_t v40 = int64;
      __int16 v41 = 2114;
      v42 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[SPI] >>> %{public}@ {modifyConfig} mask:0x%llX, changes: %{public}@",  buf,  0x20u);
    }

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10002F3F8;
    v33[3] = &unk_1000657F0;
    id v34 = v6;
    id v35 = v5;
    id v36 = v11;
    +[SUControllerCore modifyConfigForClient:alteringConfig:forChangeMask:completion:]( &OBJC_CLASS___SUControllerCore,  "modifyConfigForClient:alteringConfig:forChangeMask:completion:",  v35,  v36,  int64,  v33);

    xpc_object_t reply = v34;
  }
}

+ (void)scanForUpdatesForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = off_1000793A0;
  v7 = off_100079488;
  id v8 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SUControllerScanOptions);
  id v10 = sub_1000311B4((uint64_t)v6, v8, v7, v9);
  id v11 = (SUControllerScanOptions *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanOptions summary](v11, "summary"));
    int v18 = 138543618;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPI] >-> %{public}@ {scanForUpdates} scanOptions:%{public}@",  (uint8_t *)&v18,  0x16u);
  }

  if (!v11)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___SUControllerScanOptions);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[SPI] scanOptions is not provided.  Creating one with default values",  (uint8_t *)&v18,  2u);
    }
  }

  +[SUControllerCore scanForUpdatesForClient:withScanOptions:]( &OBJC_CLASS___SUControllerCore,  "scanForUpdatesForClient:withScanOptions:",  v5,  v11);
}

+ (void)installUpdateForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = off_1000793B0;
  v7 = off_100079490;
  id v8 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SUControllerDescriptor);
  id v10 = sub_1000311B4((uint64_t)v6, v8, v7, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
    int v16 = 138543618;
    uint64_t v17 = v14;
    __int16 v18 = 2114;
    uint64_t v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPI] >-> %{public}@ {installUpdate} descriptor:%{public}@",  (uint8_t *)&v16,  0x16u);
  }

  +[SUControllerCore installUpdateForClient:forDescriptor:]( &OBJC_CLASS___SUControllerCore,  "installUpdateForClient:forDescriptor:",  v5,  v11);
}

+ (void)userDidAcceptTermsAndConditionsForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = off_100079408;
  v7 = off_100079490;
  id v8 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SUControllerDescriptor);
  id v10 = sub_1000311B4((uint64_t)v6, v8, v7, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
    int v16 = 138543618;
    uint64_t v17 = v14;
    __int16 v18 = 2114;
    uint64_t v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPI] >-> %{public}@ {userDidAcceptTermsAndConditions} descriptor:%{public}@",  (uint8_t *)&v16,  0x16u);
  }

  +[SUControllerCore userDidAcceptTermsAndConditionsForClient:forDescriptor:]( &OBJC_CLASS___SUControllerCore,  "userDidAcceptTermsAndConditionsForClient:forDescriptor:",  v5,  v11);
}

+ (void)useSSOTokenToPersonalizeForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = off_100079450;
  v7 = off_100079490;
  id v8 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SUControllerDescriptor);
  id v10 = sub_1000311B4((uint64_t)v6, v8, v7, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = off_100079450;
  id v13 = off_1000794B8;
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSData);
  id v15 = sub_1000311AC((uint64_t)v12, v8, v13, v14);
  int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
      int v21 = 138543618;
      v22 = v19;
      __int16 v23 = 2114;
      v24 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[SPI] >-> %{public}@ {useSSOTokenToPersonalize} descriptor:%{public}@",  (uint8_t *)&v21,  0x16u);
    }

    +[SUControllerCore useSSOTokenToPersonalizeForClient:forDescriptor:usingSSOToken:]( &OBJC_CLASS___SUControllerCore,  "useSSOTokenToPersonalizeForClient:forDescriptor:usingSSOToken:",  v5,  v11,  v16);
  }

  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003EAD4(v5);
    }
  }
}

+ (void)updateAcceptingTermsForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = off_100079410;
  v7 = off_100079490;
  id v8 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SUControllerDescriptor);
  id v10 = sub_1000311B4((uint64_t)v6, v8, v7, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = off_100079410;
  id v13 = off_1000794B8;
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSData);
  id v15 = sub_1000311B4((uint64_t)v12, v8, v13, v14);
  int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
    int v21 = 138543618;
    v22 = v19;
    __int16 v23 = 2114;
    v24 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[SPI] >-> %{public}@ {updateAcceptingTerms} descriptor:%{public}@",  (uint8_t *)&v21,  0x16u);
  }

  +[SUControllerCore updateAcceptingTermsForClient:forDescriptor:usingSSOToken:]( &OBJC_CLASS___SUControllerCore,  "updateAcceptingTermsForClient:forDescriptor:usingSSOToken:",  v5,  v11,  v16);
}

+ (void)purgeUpdateForClient:(id)a3 withMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = off_100079428;
  id v8 = off_100079490;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SUControllerDescriptor);
  id v10 = sub_1000311B4((uint64_t)v7, v6, v8, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPI] >>> %{public}@ {purgeUpdate} descriptor:%{public}@",  buf,  0x16u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000300F4;
  v18[3] = &unk_100065228;
  id v19 = v6;
  id v20 = v5;
  id v16 = v5;
  id v17 = v6;
  +[SUControllerCore purgeUpdateForClient:forDescriptor:completion:]( &OBJC_CLASS___SUControllerCore,  "purgeUpdateForClient:forDescriptor:completion:",  v16,  v11,  v18);
}

@end