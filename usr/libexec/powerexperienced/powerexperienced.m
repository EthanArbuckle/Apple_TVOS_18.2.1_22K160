void sub_1000031BC(id a1)
{
  ChargeDurationPredictor *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___ChargeDurationPredictor);
  v2 = (void *)qword_10001B688;
  qword_10001B688 = (uint64_t)v1;
}
}

void sub_1000035C8(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) log]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Querying model for scheme %@", buf, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) predictor]);
  v6 = (void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 40);
  id v16 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 chargePredictionOutputOfScheme:v5 withError:&v16]);
  id v8 = v16;

  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D350(v6, (uint64_t)v8, v10);
    }
  }

  else
  {
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 mainQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000377C;
    v13[3] = &unk_1000143A8;
    uint64_t v12 = *(void *)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    uint64_t v15 = v12;
    id v14 = v7;
    dispatch_async(v11, v13);
  }
}

id sub_10000377C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) predictorOutput]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  [v3 setObject:v2 forKeyedSubscript:v4];

  return [*(id *)(a1 + 32) didChangeValueForKey:@"predictorOutput"];
}

void sub_100003DB0(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___AnalyticsLogger);
  uint64_t v2 = (void *)qword_10001B698;
  qword_10001B698 = (uint64_t)v1;
}

void sub_100003FB0(id *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100004088;
  v2[3] = &unk_100014418;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  id v7 = a1[8];
  id v8 = a1[9];
  AnalyticsSendEventLazy(@"com.apple.powerexperienced.powermodes.event", v2);
}

id sub_100004088(uint64_t a1)
{
  v7[0] = @"Duration";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", (uint64_t)v2));
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = v3;
  v8[1] = v4;
  v7[1] = @"PowerMode";
  v7[2] = @"ExitReason";
  __int128 v9 = *(_OWORD *)(a1 + 56);
  v7[3] = @"StartingBatteryLevel";
  v7[4] = @"EndingBatteryLevel";
  uint64_t v10 = *(void *)(a1 + 72);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  5LL));

  return v5;
}

void sub_1000042E4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___InUseChargingMode);
  double v2 = (void *)qword_10001B6B0;
  qword_10001B6B0 = (uint64_t)v1;
}

LABEL_35:
  return v27;
}

  return v27;
}

void sub_1000048D4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___LongChargingMode);
  double v2 = (void *)qword_10001B6C0;
  qword_10001B6C0 = (uint64_t)v1;
}

LABEL_31:
  return v27;
}

  return v22;
}

void sub_100004F6C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___RestrictedPerfMode);
  double v2 = (void *)qword_10001B6D8;
  qword_10001B6D8 = (uint64_t)v1;
}

LABEL_30:
    LOBYTE(v22) = 0;
    goto LABEL_31;
  }

  if (!-[PowerModeObjImpl enabled](self, "enabled"))
  {
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v29 = "Restriced Perf Mode is disabled";
      goto LABEL_29;
    }

    goto LABEL_30;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Display"]);
  v40 = [v8 state];
  [v8 state];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CarPlay"]);

  v37 = [v9 state];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"NFCSession"]);

  v41 = [v10 state];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AudioPlayback"]);

  uint64_t v12 = [v11 state];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SleepInProgress"]);

  id v14 = [v13 state];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"WakeInProgress"]);

  id v16 = [v15 state];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OnenessSession"]);

  v18 = [v17 state];
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SiriAudio"]);

  v20 = -[os_log_s state](v19, "state");
  v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kPluggedInContext"]);
  v36 = [v21 BOOLValue];

  v22 = 0;
  v39 = v16;
  if (v16 != (id)1 && v14 != (id)1)
  {
    v28 = v40 == (id)101 || v37 == (id)1 || v41 == (id)1 || v12 == (id)1 || v18 == (id)1 || v20 == (id)1;
    if (-[RestrictedPerfMode allowOnCharger](self, "allowOnCharger")) {
      v22 = !v28;
    }
    else {
      v22 = (v36 | v28) ^ 1;
    }
  }

  log = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (objc_class *)objc_opt_class(self);
    v32 = NSStringFromClass(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138415106;
    v43 = (unint64_t)v33;
    v44 = 1024;
    v45 = v22;
    v46 = 1024;
    v47 = v40 == (id)101;
    v48 = 1024;
    v49 = v37 == (id)1;
    v50 = 1024;
    v51 = v41 == (id)1;
    v52 = 1024;
    v53 = v12 == (id)1;
    v54 = 1024;
    v55 = v14 == (id)1;
    v56 = 1024;
    v57 = v39 == (id)1;
    v58 = 1024;
    v59 = v18 == (id)1;
    v60 = 1024;
    v61 = v20 == (id)1;
    v62 = 1024;
    v63 = v36;
    v64 = 1024;
    v65 = -[RestrictedPerfMode allowOnCharger](self, "allowOnCharger");
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "evaluatePowerMode: %@: %d display %d, carPlaySession %d, nFCSession %d, audioSession %d, sleepInProgress %d, wakeI nProgress %d, onenessSession %d, siriAudio %d, pluggedIn %d (allowOnCharger: %d)",  buf,  0x4Eu);
  }

  -[RestrictedPerfMode setClientResponsible:]( self,  "setClientResponsible:",  ((4LL * (v40 == (id)101)) | (8LL * (v37 == (id)1)) | (16LL * (v41 == (id)1)) | (32LL * (v12 == (id)1)) | (v14 == (id)1) | (2LL * (v39 == (id)1)) | ((unint64_t)(v18 == (id)1) << 7))
  + ((unint64_t)(v20 == (id)1) << 10));
  if ((v22 & 1) == 0 && -[PowerModeObjImpl state](self, "state"))
  {
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = -[RestrictedPerfMode clientResponsible](self, "clientResponsible");
      *(_DWORD *)buf = 134217984;
      v43 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Client responsible %llu", buf, 0xCu);
    }

    -[PowerModeObjImpl setExitReason:](self, "setExitReason:", 3LL);
  }

void sub_100005AFC(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___AcceleratedChargingMode);
  double v2 = (void *)qword_10001B6E8;
  qword_10001B6E8 = (uint64_t)v1;
}

CFStringRef sub_100005F48(uint64_t a1)
{
  else {
    return off_1000144E0[a1 - 1];
  }
}

void sub_100006BF8(uint64_t a1)
{
  double v2 = (void *)os_transaction_create("com.apple.powerexperienced.resourcehint");
  [*(id *)(a1 + 32) setTransaction:v2];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v3 = -[NSNumber initWithInteger:]( [NSNumber alloc],  "initWithInteger:",  (int)[v16 processIdentifier]);
  uint64_t v4 = (os_log_s *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restoring resources from %@", buf, 0xCu);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v9);
        v11 = objc_alloc(&OBJC_CLASS___ResourceHintWithProperties);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v10]);
        v13 = -[ResourceHintWithProperties initWithResourceHint:andPid:](v11, "initWithResourceHint:andPid:", v12, v3);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resourceHints]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties description](v13, "description"));
          [v14 setObject:v13 forKeyedSubscript:v15];
        }

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  [*(id *)(a1 + 32) evaluatePowerModes];
  [*(id *)(a1 + 32) setTransaction:0];
}

void sub_100006F7C(uint64_t a1)
{
  double v2 = -[NSNumber initWithInteger:]( [NSNumber alloc],  "initWithInteger:",  (int)[*(id *)(a1 + 32) processIdentifier]);
  id v3 = -[ResourceHintWithProperties initWithResourceHint:andPid:]( objc_alloc(&OBJC_CLASS___ResourceHintWithProperties),  "initWithResourceHint:andPid:",  *(void *)(a1 + 40),  v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) resourceHints]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
  [v4 setObject:v3 forKeyedSubscript:v5];

  id v6 = (void *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = v6;
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
    uint64_t v10 = *(void *)(a1 + 56);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v3, "pid"));
    int v14 = 138413058;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    __int128 v19 = v11;
    __int16 v20 = 2048;
    id v21 = -[ResourceHintWithProperties state](v3, "state");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ResourceManager: creating resource %@ with UUID %@ for pid %@ with state: %lu",  (uint8_t *)&v14,  0x2Au);
  }

  [*(id *)(a1 + 48) evaluatePowerModes];
  [*(id *)(a1 + 48) saveState:v3];
  uint64_t v12 = *(void **)(a1 + 48);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v3, "pid"));
  objc_msgSend(v12, "monitorProcessExit:", objc_msgSend(v13, "intValue"));

  [*(id *)(a1 + 48) setTransaction:0];
}

void sub_10000724C(uint64_t a1)
{
  double v2 = (void *)os_transaction_create("com.apple.powerexperienced.resourcehint");
  [*(id *)(a1 + 32) setTransaction:v2];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resourceHints]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  id v6 = (ResourceHintWithProperties *)v5;
  if (!v5)
  {
    id v7 = -[NSNumber initWithInteger:]( [NSNumber alloc],  "initWithInteger:",  (int)[*(id *)(a1 + 48) processIdentifier]);
    id v6 = -[ResourceHintWithProperties initWithResourceHint:andPid:]( objc_alloc(&OBJC_CLASS___ResourceHintWithProperties),  "initWithResourceHint:andPid:",  *(void *)(a1 + 40),  v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resourceHints]);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties description](v6, "description"));
    [v8 setObject:v6 forKeyedSubscript:v9];

    uint64_t v10 = (void *)qword_10001B6F0;
    if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 40);
      uint64_t v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties uuid](v6, "uuid"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v6, "pid"));
      int v27 = 138413058;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v14;
      __int16 v31 = 2112;
      id v32 = v15;
      __int16 v33 = 2048;
      id v34 = -[ResourceHintWithProperties state](v6, "state");
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "ResourceManager: updateResourceHint creating resource %@ with UUID %@ for pid %@ with state: %lu",  (uint8_t *)&v27,  0x2Au);
    }

    __int16 v16 = *(void **)(a1 + 32);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties pid](v6, "pid"));
    objc_msgSend(v16, "monitorProcessExit:", objc_msgSend(v17, "intValue"));
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  id v18 = [*(id *)(a1 + 40) state];
  id v19 = -[ResourceHintWithProperties state](v6, "state");
  if (!v5 || v18 != v19)
  {
    __int16 v20 = (void *)qword_10001B6F0;
    if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = *(void **)(a1 + 40);
      v22 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 uuid]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
      id v25 = -[ResourceHintWithProperties state](v6, "state");
      id v26 = [*(id *)(a1 + 40) state];
      int v27 = 138413058;
      v28 = v23;
      __int16 v29 = 2112;
      v30 = v24;
      __int16 v31 = 2048;
      id v32 = v25;
      __int16 v33 = 2048;
      id v34 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "updating resource state for %@:%@ from %lu to %lu",  (uint8_t *)&v27,  0x2Au);
    }

    -[ResourceHintWithProperties setState:](v6, "setState:", [*(id *)(a1 + 40) state]);
    [*(id *)(a1 + 32) evaluatePowerModes];
    [*(id *)(a1 + 32) saveState:v6];
  }

  [*(id *)(a1 + 32) setTransaction:0];
}

void sub_100007748(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", *(int *)(a1 + 40));
  [v1 handleProcessExit:v2];
}

id sub_100008008(uint64_t a1)
{
  return [*(id *)(a1 + 32) evaluatePowerModes];
}

void sub_100008298(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___ResourceManager);
  double v2 = (void *)qword_10001B6F8;
  qword_10001B6F8 = (uint64_t)v1;
}

void sub_100008544( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100008B00(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBatteryLevelChange];
}

id sub_100008B08(uint64_t a1, uint64_t a2)
{
  id v3 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IOPSDrawingUnlimitedPower(a1, a2));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentContext]);
  [v5 setObject:v4 forKeyedSubscript:@"kPluggedInContext"];

  return [*(id *)(a1 + 32) handleBatteryLevelChange];
}

void sub_100008C9C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___DeviceContext);
  double v2 = (void *)qword_10001B718;
  qword_10001B718 = (uint64_t)v1;
}

void sub_100008E3C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100008E94(id a1)
{
  os_log_t v1 = os_log_create("com.apple.powerexperienced", "powermodesserice");
  double v2 = (void *)qword_10001B738;
  qword_10001B738 = (uint64_t)v1;

  id v3 = objc_alloc_init(&OBJC_CLASS___PowerModesService);
  uint64_t v4 = (void *)qword_10001B728;
  qword_10001B728 = (uint64_t)v3;
}

void sub_1000091D0(uint64_t a1)
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clients]);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v22;
    *(void *)&__int128 v4 = 138412802LL;
    __int128 v19 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interestedModes", v19));
        unsigned int v10 = [v9 containsObject:*(void *)(a1 + 40)];

        if (v10)
        {
          v11 = (void *)qword_10001B738;
          if (os_log_type_enabled((os_log_t)qword_10001B738, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = v11;
            v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identifer]);
            uint64_t v14 = *(void *)(a1 + 40);
            int v15 = *(unsigned __int8 *)(a1 + 48);
            *(_DWORD *)buf = v19;
            id v26 = v13;
            __int16 v27 = 2112;
            uint64_t v28 = v14;
            __int16 v29 = 1024;
            int v30 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating client %@ for mode %@:%d",  buf,  0x1Cu);
          }

          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);

          if (v16)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472LL;
            v20[2] = sub_100009408;
            v20[3] = &unk_100014660;
            v20[4] = v8;
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 remoteObjectProxyWithErrorHandler:v20]);
            [v18 updateState:*(unsigned __int8 *)(a1 + 48) forMode:*(void *)(a1 + 40)];
          }
        }
      }

      id v5 = [v2 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }

    while (v5);
  }
}

void sub_100009408(uint64_t a1)
{
  double v2 = (os_log_s *)qword_10001B738;
  if (os_log_type_enabled((os_log_t)qword_10001B738, OS_LOG_TYPE_ERROR)) {
    sub_10000D660(a1, v2);
  }
}

void sub_100009538(uint64_t a1)
{
  double v2 = (os_log_s *)qword_10001B738;
  if (os_log_type_enabled((os_log_t)qword_10001B738, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Registering client %@ for modes %@",  (uint8_t *)&v7,  0x16u);
  }

  id v5 = -[PowerModesClient initWithConnection:identifier:interestedModes:]( objc_alloc(&OBJC_CLASS___PowerModesClient),  "initWithConnection:identifier:interestedModes:",  *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) clients]);
  [v6 addObject:v5];
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = sub_100009834();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)qword_10001B7B8;
  qword_10001B7B8 = v2;

  id v4 = sub_100009834();
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_sync(v5, &stru_1000146A8);

  id v6 = sub_100009834();
  int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v7, &stru_1000146E8);

  dispatch_main();
}

id sub_100009834()
{
  if (qword_10001B740 != -1) {
    dispatch_once(&qword_10001B740, &stru_100014708);
  }
  return (id)qword_10001B7B8;
}

void sub_100009874(id a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ResourceManager sharedInstance](&OBJC_CLASS___ResourceManager, "sharedInstance"));
  [v5 start];
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[SignalMonitor sharedInstance](&OBJC_CLASS___SignalMonitor, "sharedInstance"));
  [v1 start];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
  [v2 start];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PowerModesService sharedInstance](&OBJC_CLASS___PowerModesService, "sharedInstance"));
  [v3 start];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PowerModesManager sharedInstance](&OBJC_CLASS___PowerModesManager, "sharedInstance"));
  [v4 start];
}

void sub_100009928(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SignalMonitor sharedInstance](&OBJC_CLASS___SignalMonitor, "sharedInstance"));
  [v4 handleXPCEvent:v2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
  [v3 handleXPCEvent:v2];
}

void sub_100009998(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.powerexperieced.mainQueue", v4);
  uint64_t v3 = (void *)qword_10001B7B8;
  qword_10001B7B8 = (uint64_t)v2;
}

void sub_100009A28(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___SMCSensorExchangeHelper);
  dispatch_queue_t v2 = (void *)qword_10001B750;
  qword_10001B750 = (uint64_t)v1;
}

uint64_t sub_100009BE8()
{
  v0 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    uint64_t v3 = 3758097136LL;
    goto LABEL_15;
  }

  io_object_t v2 = MatchingService;
  uint64_t v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_10001B760);
  IOObjectRelease(v2);
  if ((_DWORD)v3) {
    goto LABEL_15;
  }
  if (!dword_10001B760)
  {
    uint64_t v3 = 0LL;
    goto LABEL_15;
  }

  uint64_t v3 = IOConnectCallScalarMethod(dword_10001B760, 0, 0LL, 0, 0LL, 0LL);
  if ((_DWORD)v3)
  {
LABEL_15:
    dword_10001B760 = 0;
    goto LABEL_16;
  }

  if (dword_10001B760)
  {
    strcpy(v15, "zEPE");
    __int128 v36 = xmmword_10001B7C0;
    __int128 v34 = 0u;
    memset(v35, 0, sizeof(v35));
    memset(outputStruct, 0, sizeof(outputStruct));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v41 = unk_10001B810;
    __int128 v42 = xmmword_10001B820;
    __int128 v37 = *(_OWORD *)algn_10001B7D0;
    __int128 v38 = xmmword_10001B7E0;
    size_t outputStructCnt = 168LL;
    uint64_t v32 = 0LL;
    BYTE2(v35[5]) = 6;
    int inputStruct = 2051362885;
    v35[2] = 120;
    uint64_t v43 = qword_10001B830;
    __int128 v39 = unk_10001B7F0;
    __int128 v40 = xmmword_10001B800;
    uint64_t v4 = IOConnectCallStructMethod(dword_10001B760, 2u, &inputStruct, 0xA8uLL, outputStruct, &outputStructCnt);
    if ((_DWORD)v4 || (uint64_t v3 = 0LL, BYTE8(v24)))
    {
      id v5 = (os_log_s *)qword_10001B758;
      if (os_log_type_enabled((os_log_t)qword_10001B758, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v18 = v15;
        __int16 v19 = 1024;
        int v20 = v4;
        __int16 v21 = 1024;
        int v22 = BYTE8(v24);
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Write failed for key '%s' (0x%X, 0x%X)",  buf,  0x18u);
      }

      if (BYTE8(v24) == 132)
      {
        id v6 = (os_log_s *)qword_10001B758;
        if (os_log_type_enabled((os_log_t)qword_10001B758, OS_LOG_TYPE_ERROR)) {
          sub_10000D7A0(v6);
        }
      }

      uint64_t v3 = v4;
    }

    goto LABEL_18;
  }

  uint64_t v3 = 0LL;
LABEL_16:
  int v7 = (os_log_s *)qword_10001B758;
  if (os_log_type_enabled((os_log_t)qword_10001B758, OS_LOG_TYPE_ERROR)) {
    sub_10000D73C(v3, v7, v8, v9, v10, v11, v12, v13);
  }
LABEL_18:
  if (dword_10001B760 && !IOConnectCallScalarMethod(dword_10001B760, 1u, 0LL, 0, 0LL, 0LL)) {
    IOServiceClose(dword_10001B760);
  }
  return v3;
}

void sub_10000A010( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000A060(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___SignalMonitor);
  io_object_t v2 = (void *)qword_10001B768;
  qword_10001B768 = (uint64_t)v1;
}

id sub_10000A244(uint64_t a1)
{
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), _xpc_event_key_name);
  if (!strcmp(string, "com.apple.request.hipuncap")) {
    return [*(id *)(a1 + 40) handleNFCSession];
  }
  id result = (id)strcmp(string, "com.apple.coreaudio.IORunning");
  if (!(_DWORD)result) {
    return [*(id *)(a1 + 40) handleAudioSession];
  }
  return result;
}

id sub_10000A6F0(uint64_t a1)
{
  io_object_t v2 = (os_log_s *)qword_10001B778;
  if (os_log_type_enabled((os_log_t)qword_10001B778, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "NFC session ended. Dropping the resource hint",  v5,  2u);
  }

  [*(id *)(a1 + 32) setNfcActive:0];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nfcResourceHint]);
  [v3 updateState:0];

  return [*(id *)(a1 + 32) setNfcTransaction:0];
}

void sub_10000A894(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___CLPCPolicyInterfaceHelper);
  io_object_t v2 = (void *)qword_10001B790;
  qword_10001B790 = (uint64_t)v1;
}

LABEL_14:
  if (v4) {
    __int16 v16 = v6;
  }
  else {
    __int16 v16 = 0LL;
  }
  -[CLPCPolicyInterfaceHelper setCurrentActiveMode:](self, "setCurrentActiveMode:", v16);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper log](self, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    *(_DWORD *)buf = 138412546;
    __int16 v21 = v6;
    int v22 = 2112;
    __int128 v23 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updated CLPC with power target for mode %@ status %@",  buf,  0x16u);
LABEL_19:
  }

LABEL_20:
}

void sub_10000ACF8(uint64_t a1)
{
  io_object_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RestrictedPerfMode powerModeInstance](&OBJC_CLASS___RestrictedPerfMode, "powerModeInstance"));
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:@"RestrictedPerfMode"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[InUseChargingMode powerModeInstance](&OBJC_CLASS___InUseChargingMode, "powerModeInstance"));
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKeyedSubscript:@"InUseChargingMode"];

  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[AcceleratedChargingMode powerModeInstance]( &OBJC_CLASS___AcceleratedChargingMode,  "powerModeInstance"));
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKeyedSubscript:@"AcceleratedChargingMode"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[LongChargingMode powerModeInstance](&OBJC_CLASS___LongChargingMode, "powerModeInstance"));
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:@"LongChargingMode"];

  uint64_t v9 = (os_log_s *)qword_10001B7A0;
  if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Initialized power modes %@",  (uint8_t *)&v11,  0xCu);
  }

void sub_10000AEC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.powerexperienced", "powermodesmanager");
  io_object_t v2 = (void *)qword_10001B7A0;
  qword_10001B7A0 = (uint64_t)v1;

  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___PowerModesManager);
  uint64_t v4 = (void *)qword_10001B7A8;
  qword_10001B7A8 = (uint64_t)v3;
}

id sub_10000B0A8(uint64_t a1, uint64_t a2)
{
  int v3 = MKBDeviceUnlockedSinceBoot(a1, a2);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3) {
    return [v4 restoreState];
  }
  else {
    return [v4 clearState];
  }
}

id sub_10000B39C(uint64_t a1)
{
  io_object_t v2 = (os_log_s *)qword_10001B7A0;
  if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Evaluating power modes for device context change %@",  (uint8_t *)&v5,  0xCu);
  }

  return [*(id *)(a1 + 40) evaluatePowerModes];
}

LABEL_18:
            goto LABEL_22;
          }

          -[PowerModesManager exitMode:](self, "exitMode:", v17);
        }

        else
        {
          __int128 v30 = (void *)qword_10001B7A0;
          if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_INFO))
          {
            __int128 v31 = v30;
            uint64_t v32 = (objc_class *)objc_opt_class(v17);
            __int16 v33 = NSStringFromClass(v32);
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
            *(_DWORD *)buf = 138412290;
            v50 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%@ is not supported on this platform. Skipping evaluation",  buf,  0xCu);
          }
        }

LABEL_22:
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      v35 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v12 = v35;
      if (!v35)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
  }

  uint64_t v8 = (void *)qword_10001B7A0;
  if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager overridePresent](self, "overridePresent"));
    *(_DWORD *)buf = 138412290;
    v50 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Override present. Skipping evaluation. Please exit %@ mode using powerexperienceutil",  buf,  0xCu);

    goto LABEL_26;
  }

LABEL_27:
}

void sub_10000B8D0(uint64_t a1)
{
  io_object_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) overridePresent]);

  if (!v2)
  {
    uint64_t v3 = (void *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v5 = v3;
      uint64_t v6 = (objc_class *)objc_opt_class(v4);
      int v7 = NSStringFromClass(v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = *(void *)(a1 + 56);
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Evaluating %@ after entry delay %f seconds",  (uint8_t *)&v17,  0x16u);
    }

    uint64_t v10 = *(void **)(a1 + 48);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) resourceManager]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resourceHints]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceContext]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentContext]);
    LODWORD(v10) = [v10 evaluatePowerModeWithResourceHints:v12 andContext:v14];

    int v15 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    if ((_DWORD)v10) {
      [v15 enterMode:v16];
    }
    else {
      [v15 exitMode:v16];
    }
  }

id sub_10000BEB4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) getState];
  if ((_DWORD)result)
  {
    uint64_t v3 = (void *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = v3;
      uint64_t v6 = (objc_class *)objc_opt_class(v4);
      int v7 = NSStringFromClass(v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2048;
      uint64_t v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Exiting mode %@ after max engagement duration %f",  (uint8_t *)&v10,  0x16u);
    }

    [*(id *)(a1 + 32) updateExitReason:4];
    return [*(id *)(a1 + 40) exitMode:*(void *)(a1 + 32)];
  }

  return result;
}

void sub_10000C6E4(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)]);
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 disablePowerMode];
    [*(id *)(a1 + 32) exitMode:v4];
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  else
  {
    uint64_t v6 = (os_log_s *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_ERROR)) {
      sub_10000D9E4(v2, v6, v7, v8, v9, v10, v11, v12);
    }
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  v5();
}

void sub_10000C83C(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)]);
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 enablePowerMode];
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  else
  {
    uint64_t v6 = (os_log_s *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_ERROR)) {
      sub_10000D9E4(v2, v6, v7, v8, v9, v10, v11, v12);
    }
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  v5();
}

void sub_10000C998(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)]);
  if (v3)
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);
    int v5 = (os_log_s *)qword_10001B7A0;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *v2;
        int v19 = 138412290;
        uint64_t v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "OVERRIDE: Entering %@",  (uint8_t *)&v19,  0xCu);
      }

      [*(id *)(a1 + 32) enterMode:v3];
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
    }

    else
    {
      if (v6)
      {
        uint64_t v18 = *v2;
        int v19 = 138412290;
        uint64_t v20 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "OVERRIDE: Exiting %@",  (uint8_t *)&v19,  0xCu);
      }

      [*(id *)(a1 + 32) exitMode:v3];
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = 0LL;
    }

    [v8 setOverridePresent:v9];
    int v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  else
  {
    uint64_t v10 = (os_log_s *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_ERROR)) {
      sub_10000D9E4((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);
    }
    int v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  v17();
}

void sub_10000CBE8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2) {
    [v2 allowOnCharger:*(unsigned __int8 *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  [*(id *)(a1 + 32) evaluatePowerModes];
}

void sub_10000CD20(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2) {
    [v2 updateEntryDelay:*(double *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10000CE50(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2) {
    [v2 updateMaxEngagementDuration:*(double *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10000D058( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000D310(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to initialize predictor", v1, 2u);
}

void sub_10000D350(void *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", *a1));
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to fetch prediction for scheme %@: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_10000D40C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error creating CLPC User Client %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000D480(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No powerlog identifier found", v1, 2u);
}

void sub_10000D4C0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D528( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D590(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to init mach service", v1, 2u);
}

void sub_10000D5D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D600( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D630( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D660(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to update client %@",  (uint8_t *)&v3,  0xCu);
}

void sub_10000D6D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D73C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D7A0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Key not found", v1, 2u);
  sub_100008E4C();
}

void sub_10000D7DC()
{
}

void sub_10000D808()
{
}

void sub_10000D834()
{
}

void sub_10000D860()
{
}

void sub_10000D88C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CLPC client not initialized", v1, 2u);
}

void sub_10000D8CC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to update CLPC with power target for mode %@. Error: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_10000D950(void *a1, void *a2)
{
  int v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 processIdentifier];
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "PowerModesManager: rejected new connection from pid %d. Not entitled",  (uint8_t *)v4,  8u);

  sub_10000D068();
}

void sub_10000D9E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}