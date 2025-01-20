BOOL NRDGetUpdateBrainConnection( void *a1, void *a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  NRDUpdateDaemonClientImpl *v8;
  uint64_t v9;
  void *v10;
  dispatch_semaphore_s *v11;
  uint64_t v12;
  BOOL v13;
  void v15[4];
  dispatch_semaphore_s *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  NSErrorUserInfoKey v36;
  CFStringRef v37;
  void v38[4];
  void v39[4];
  v30 = 0LL;
  v31 = &v30;
  v32 = 0x3032000000LL;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0LL;
  v24 = 0LL;
  v25 = &v24;
  v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0LL;
  v20 = 0LL;
  v21 = &v20;
  v22 = 0x2020000000LL;
  v23 = 0;
  v8 = objc_alloc_init(&OBJC_CLASS___NRDUpdateDaemonClientImpl);
  if (v8)
  {
    v38[0] = @"ActionText";
    v38[1] = @"ElapsedTime";
    v39[0] = @"Connecting to RecoveryOSUpdateBrain...";
    v39[1] = &off_100063B30;
    v38[2] = @"PercentComplete";
    v38[3] = @"PercentBytesComplete";
    v39[2] = &off_100063B30;
    v39[3] = &off_100063B30;
    v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  4LL));
    v10 = (void *)v9;
    if (a3) {
      a3(v9, a4);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __NRDGetUpdateBrainConnection_block_invoke;
    v15[3] = &unk_100058ED0;
    v17 = &v30;
    v18 = &v20;
    v19 = &v24;
    v11 = dispatch_semaphore_create(0LL);
    v16 = v11;
    -[NRDUpdateDaemonClientImpl acquireNRDUpdateBrain:reply:](v8, "acquireNRDUpdateBrain:reply:", 0LL, v15);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    v36 = NSDebugDescriptionErrorKey;
    v37 = @"could not alloc/init NRDUpdated object";
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  14LL,  v10));
    v11 = (dispatch_semaphore_s *)v25[5];
    v25[5] = v12;
  }

  if (a1) {
    *a1 = (id) v31[5];
  }
  if (a2) {
    *a2 = (id) v25[5];
  }
  v13 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v13;
}

void sub_10000253C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __NRDGetUpdateBrainConnection_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (a3)
  {
    id v6 = [a3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id NRDAcquireActivityLock(void *a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  id v5 = a1;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = __Block_byref_object_copy__189;
  v20 = __Block_byref_object_dispose__190;
  id v21 = 0LL;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v6 = v5;
    v22[0] = @"ActionText";
    v22[1] = @"ElapsedTime";
    v23[0] = @"Waiting for RecoveryOSUpdateBrain...";
    v23[1] = &off_100063B30;
    v22[2] = @"PercentComplete";
    v22[3] = @"PercentBytesComplete";
    v23[2] = &off_100063B30;
    v23[3] = &off_100063B30;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));
    v8 = (void *)v7;
    if (a2) {
      a2(v7, a3);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __NRDAcquireActivityLock_block_invoke;
    v13[3] = &unk_100058EF8;
    v15 = &v16;
    id v9 = dispatch_semaphore_create(0LL);
    v14 = v9;
    [v6 finishNeRDUpdate:v13];
    dispatch_time_t v10 = dispatch_time(0LL, 300000000000LL);
    dispatch_semaphore_wait(v9, v10);
  }

  id v11 = objc_retainBlock((id)v17[5]);
  _Block_object_dispose(&v16, 8);

  return v11;
}

void sub_100002808( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

id __Block_byref_object_copy__189(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__190(uint64_t a1)
{
}

uint64_t __NRDAcquireActivityLock_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void NRDReleaseActivityLock(void *a1)
{
  if (a1)
  {
    v1 = objc_retainBlock(a1);
    v1[2]();
  }
}

BOOL NRDQueryRecoveryOS( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void (*a8)(uint64_t, uint64_t), uint64_t a9)
{
  id v16 = a1;
  id v28 = a2;
  id v17 = a3;
  id v18 = a4;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  id v56 = 0LL;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v50 = 0LL;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  if ([v16 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v19 = v16;
    v59[0] = @"ActionText";
    v59[1] = @"ElapsedTime";
    v60[0] = @"Checking for RecoveryOS update...";
    v60[1] = &off_100063B30;
    v59[2] = @"PercentComplete";
    v59[3] = @"PercentBytesComplete";
    v60[2] = &off_100063B30;
    v60[3] = &off_100063B30;
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  4LL));
    id v21 = (void *)v20;
    if (a8) {
      a8(v20, a9);
    }
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
    id v23 = [&off_100063C28 mutableCopy];
    [v23 addEntriesFromDictionary:v18];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = __NRDQueryRecoveryOS_block_invoke;
    v29[3] = &unk_100058F20;
    v31 = &v45;
    v32 = &v51;
    v33 = &v35;
    v34 = &v39;
    v24 = v22;
    v30 = v24;
    [v19 queryNeRDUpdate:v28 build:v17 options:v23 callback:v29];
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    v57[0] = NSDebugDescriptionErrorKey;
    v57[1] = @"InvalidArgument";
    v58[0] = @"bad brain connection object";
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"brainConn=%@", v16));
    v58[1] = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  2LL));
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  9LL,  v21));
    v24 = (dispatch_semaphore_s *)v40[5];
    v40[5] = v25;
  }

  if (a5) {
    *a5 = (id) v52[5];
  }
  if (a6) {
    *a6 = (id) v46[5];
  }
  if (a7) {
    *a7 = (id) v40[5];
  }
  BOOL v26 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v26;
}

void sub_100002C80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void __NRDQueryRecoveryOS_block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v43 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (a3)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"targetNeRDOSIsRequired"];
      id v18 = [v43 copy];
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }

    else if (!v9 {
           || (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ProductVersion"])) == 0)
    }
    {
      if (!v43) {
        goto LABEL_16;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&__kCFBooleanFalse forKeyedSubscript:@"targetNeRDOSIsRequired"];
      id v21 = [v43 copy];
      uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

LABEL_12:
      v24 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"OSVersion"]);

      if (v24)
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"OSVersion"]);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v25 forKeyedSubscript:@"targetNeRDOSVersion"];
      }

      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"Build"]);

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"Build"]);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v27 forKeyedSubscript:@"targetNeRDOSBuild"];
      }

LABEL_16:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      if (!v9) {
        goto LABEL_29;
      }
      goto LABEL_17;
    }

    if (!v43) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }

  id v12 = [v10 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!v9) {
    goto LABEL_29;
  }
LABEL_17:
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ProductBuild"]);

  if (v28)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ProductBuild"]);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v32 forKeyedSubscript:@"currentNeRDOSVersion"];
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ReleaseType"]);

  if (v33)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v36 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v34;
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ReleaseType"]);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v37 forKeyedSubscript:@"currentNeRDOSType"];
  }

  char v38 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"BrainVersion"]);

  if (v38)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      uint64_t v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"BrainVersion"]);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v42 forKeyedSubscript:@"nerdBrainVersion"];
  }

        logfunction("", 1, @"No RecoveryOS update is required for this update.\n", v41, v42, v43, v44, v45, v87);
        v77 = 0LL;
        v52 = 0LL;
        v64 = 0LL;
        goto LABEL_20;
      }
    }

    else
    {
      if (v32)
      {
        logfunction("", 1, @"No recoveryOS is installed\n", v36, v37, v38, v39, v40, v86);
        [*(id *)(a1 + 40) saveRecoveryOSInfo:0];
        if (v33) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }

      logfunction("", 1, @"Installed state of recovery OS is unknown.\n", v36, v37, v38, v39, v40, v86);
    }

    logfunction( "",  1,  @"Non-fatal error querying for RecoveryOS update: %@\n",  v41,  v42,  v43,  v44,  v45,  (char)v35);
    v52 = 0LL;
    v64 = 0LL;
    goto LABEL_19;
  }

  logfunction( "",  1,  @"Non-fatal error connecting to RecoveryOSUpdateBrain: %@\n",  v16,  v17,  v18,  v19,  v20,  (char)v11);
  v33 = 0LL;
  v34 = 0LL;
  v52 = 0LL;
LABEL_13:
  v64 = 0LL;
  uint64_t v35 = v11;
LABEL_19:
  [*(id *)(a1 + 40) saveLastError:v35];
  v77 = 6LL;
LABEL_20:
  [*(id *)(a1 + 40) saveState:v77];
  v78 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) nrdLock]);

  if (v78)
  {
    logfunction("", 1, @"Releasing nrd lock\n", v79, v80, v81, v82, v83, v90);
    v84 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) nrdLock]);
    NRDReleaseActivityLock(v84);

    [*(id *)(a1 + 40) setNrdLock:0];
  }

  if (v23) {
    CFRelease(v23);
  }
}

  id v5 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(v21, 0LL);
  return v5;
}

LABEL_29:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

        CFRelease(error_internal_cf);
        goto LABEL_30;
      }

      id v17 = Mutable;
      CFDictionarySetValue(Mutable, @"CACHE_DELETE_URGENCY", v12);
      CFDictionarySetValue(v17, @"CACHE_DELETE_VOLUME", a1);
      id v18 = CacheDeleteCopyPurgeableSpaceWithInfo(v17);
      if (!v18)
      {
        v34 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"CacheDeleteCopyPurgeableSpaceWithInfo failed",  v21,  v22,  v23,  v36);
        if (a3)
        {
          *a3 = v34;
LABEL_28:
          error_internal_cf = v17;
          goto LABEL_29;
        }

  v32 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v48 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[MAIN] Cleaning up RecoveryOS state files",  v48,  2u);
  }

  *(void *)v48 = 0LL;
  v33 = perform_cleanup_recoveryos_saved_state_command((const __CFString **)v48);
  v34 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v35 = v34;
  if ((v33 & 1) != 0)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[MAIN] Successfully cleaned up RecoveryOS state files",  v47,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      main_cold_2();
    }
    if (*(void *)v48)
    {
      CFRelease(*(CFTypeRef *)v48);
      *(void *)v48 = 0LL;
    }
  }

  if (msu_should_save_env_info_for_recovery())
  {
    if ((saveCurrentEnvInfoForNeRD(0LL) & 1) == 0)
    {
      v36 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        main_cold_1(v36, v37, v38, v39, v40, v41, v42, v43);
      }
    }
  }

  xpc_activity_register("com.apple.softwareupdated.logs-cleanup", XPC_ACTIVITY_CHECK_IN, &__block_literal_global_6);
LABEL_43:
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0LL, 1uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_4);
  uint64_t v45 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v48 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "[MAIN] softwareupdated ready to handle client messages",  v48,  2u);
  }

  xpc_connection_resume(mach_service);
  objc_autoreleasePoolPop(v3);
  CFRunLoopRun();
  return 0;
}

BOOL NRDDownloadRecoveryOS(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v13 = a1;
  id v23 = a2;
  id v24 = a3;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  uint64_t v39 = __Block_byref_object_copy_;
  uint64_t v40 = __Block_byref_object_dispose_;
  id v41 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v14 = v13;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    v44[0] = @"Foreground";
    v44[1] = @"Timeout";
    v45[0] = &__kCFBooleanTrue;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 3600LL));
    v45[1] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
    id v18 = [v17 mutableCopy];

    [v18 addEntriesFromDictionary:v24];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = __NRDDownloadRecoveryOS_block_invoke;
    v31[3] = &__block_descriptor_48_e8_v16__0d8l;
    v31[4] = a6;
    v31[5] = a7;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = __NRDDownloadRecoveryOS_block_invoke_2;
    v25[3] = &unk_100058F68;
    uint64_t v29 = a6;
    uint64_t v30 = a7;
    v27 = &v36;
    id v28 = &v32;
    uint64_t v19 = v15;
    BOOL v26 = v19;
    [v14 downloadNeRDUpdate:v23 options:v18 progress:v31 completion:v25];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    v42[0] = NSDebugDescriptionErrorKey;
    v42[1] = @"InvalidArgument";
    v43[0] = @"bad brain connection object";
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"brainConn=%@", v13));
    v43[1] = v14;
    uint64_t v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  9LL,  v19));
    id v18 = (id)v37[5];
    v37[5] = v20;
  }

  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = (id) v37[5];
  }
  BOOL v21 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

void sub_1000033AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void __NRDDownloadRecoveryOS_block_invoke(uint64_t a1, double a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2 * 100.0 * 0.075 + 0.0));
  v7[0] = @"ActionText";
  v7[1] = @"ElapsedTime";
  v8[0] = @"Downloading RecoveryOS update...";
  v8[1] = &off_100063B30;
  v7[2] = @"PercentComplete";
  v7[3] = @"PercentBytesComplete";
  v8[2] = v3;
  v8[3] = v3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  id v5 = (void *)v4;
  id v6 = *(void (**)(uint64_t, void))(a1 + 32);
  if (v6) {
    v6(v4, *(void *)(a1 + 40));
  }
}

uint64_t __NRDDownloadRecoveryOS_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!a2)
  {
    v11[0] = @"ActionText";
    v11[1] = @"ElapsedTime";
    v12[0] = @"Downloading RecoveryOS completed.";
    v12[1] = &off_100063B30;
    v11[2] = @"PercentComplete";
    v11[3] = @"PercentBytesComplete";
    v12[2] = &off_100063CC8;
    v12[3] = &off_100063CC8;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
    v8 = (void *)v7;
    id v9 = *(void (**)(uint64_t, void))(a1 + 56);
    if (v9) {
      v9(v7, *(void *)(a1 + 64));
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL NRDInstallRecoveryOS(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  uint64_t v39 = __Block_byref_object_copy_;
  uint64_t v40 = __Block_byref_object_dispose_;
  id v41 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v16 = v13;
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = __NRDInstallRecoveryOS_block_invoke;
    v31[3] = &__block_descriptor_48_e8_v16__0d8l;
    v31[4] = a6;
    v31[5] = a7;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = __NRDInstallRecoveryOS_block_invoke_2;
    v24[3] = &unk_100058FD0;
    uint64_t v29 = a6;
    uint64_t v30 = a7;
    v27 = &v36;
    id v28 = &v32;
    id v18 = v16;
    id v25 = v18;
    uint64_t v19 = v17;
    BOOL v26 = v19;
    [v18 installNeRDUpdate:v14 options:v15 progress:v31 completion:v24];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v20 = v25;
  }

  else
  {
    v42[0] = NSDebugDescriptionErrorKey;
    v42[1] = @"InvalidArgument";
    v43[0] = @"bad brain connection object";
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"brainConn=%@", v13));
    v43[1] = v18;
    uint64_t v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  9LL,  v19));
    uint64_t v20 = (void *)v37[5];
    v37[5] = v21;
  }

  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = (id) v37[5];
  }
  BOOL v22 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

void sub_1000038C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void __NRDInstallRecoveryOS_block_invoke(uint64_t a1, double a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (a2 * 0.025 + 0.075) * 100.0 + 0.0));
  v7[0] = @"ActionText";
  v7[1] = @"ElapsedTime";
  v8[0] = @"Installing RecoveryOS update...";
  v8[1] = &off_100063B30;
  v7[2] = @"PercentComplete";
  v7[3] = @"PercentBytesComplete";
  v8[2] = v3;
  v8[3] = v3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  uint64_t v5 = (void *)v4;
  id v6 = *(void (**)(uint64_t, void))(a1 + 32);
  if (v6) {
    v6(v4, *(void *)(a1 + 40));
  }
}

uint64_t __NRDInstallRecoveryOS_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (a2)
  {
    [*(id *)(a1 + 32) purgeNeRDUpdate:&__block_literal_global];
  }

  else
  {
    v11[0] = @"ActionText";
    v11[1] = @"ElapsedTime";
    v12[0] = @"Installing RecoveryOS completed.";
    v12[1] = &off_100063B30;
    v11[2] = @"PercentComplete";
    v11[3] = @"PercentBytesComplete";
    v12[2] = &off_100063CD8;
    v12[3] = &off_100063CD8;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
    v8 = (void *)v7;
    id v9 = *(void (**)(uint64_t, void))(a1 + 64);
    if (v9) {
      v9(v7, *(void *)(a1 + 72));
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL NRDCancelRecoveryOSUpdate(void *a1, void *a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  id v7 = a1;
  uint64_t v25 = 0LL;
  BOOL v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  id v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0LL;
  uint64_t v21 = 0LL;
  BOOL v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v8 = v7;
    v33[0] = @"ActionText";
    v33[1] = @"ElapsedTime";
    v34[0] = @"Canceling RecoveryOS update...";
    v34[1] = &off_100063B30;
    v33[2] = @"PercentComplete";
    v33[3] = @"PercentBytesComplete";
    v34[2] = &off_100063B30;
    v34[3] = &off_100063B30;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  4LL));
    id v10 = (void *)v9;
    if (a3) {
      a3(v9, a4);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __NRDCancelRecoveryOSUpdate_block_invoke;
    v15[3] = &unk_100058F68;
    uint64_t v19 = a3;
    uint64_t v20 = a4;
    dispatch_semaphore_t v17 = &v25;
    id v18 = &v21;
    id v11 = dispatch_semaphore_create(0LL);
    id v16 = v11;
    [v8 cancelNeRDUpdate:0 callback:v15];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    v32[0] = @"bad brain connection object";
    v31[0] = NSDebugDescriptionErrorKey;
    v31[1] = @"InvalidArgument";
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"brainConn=%@", v7));
    v32[1] = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  9LL,  v10));
    id v11 = (dispatch_semaphore_s *)v26[5];
    v26[5] = v12;
  }

  if (a2) {
    *a2 = (id) v26[5];
  }
  BOOL v13 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void sub_100003E00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __NRDCancelRecoveryOSUpdate_block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!a2)
  {
    v11[0] = @"ActionText";
    v11[1] = @"ElapsedTime";
    v12[0] = @"Canceling RecoveryOS update completed.";
    v12[1] = &off_100063B30;
    v11[2] = @"PercentComplete";
    v11[3] = @"PercentBytesComplete";
    v12[2] = &off_100063B30;
    v12[3] = &off_100063B30;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
    id v8 = (void *)v7;
    uint64_t v9 = *(void (**)(uint64_t, void))(a1 + 56);
    if (v9) {
      v9(v7, *(void *)(a1 + 64));
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_22:
}

uint64_t progressCallback(uint64_t a1, void *a2)
{
  return 0LL;
}

void sub_100004EA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

LABEL_9:
  if (a4)
  {
    v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_2;
    v36[3] = &unk_1000590B0;
    v36[4] = self;
    dispatch_sync(v33, v36);
  }

  return v25;
}

  if (cf) {
    CFRelease(cf);
  }
  return v12;
}

void sub_100006710( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

CFTypeRef copy_nvram_variable_with_system_nvram_check(const __CFString *a1)
{
  mach_port_t mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    uint64_t v7 = @"Could not get master port\n";
  }

  else
  {
    io_registry_entry_t v9 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v9)
    {
      io_object_t v10 = v9;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v9, a1, kCFAllocatorDefault, 0);
      IOObjectRelease(v10);
      return CFProperty;
    }

    uint64_t v7 = @"Could not get options entry from the device tree\n";
  }

  logfunction("", 1, v7, v2, v3, v4, v5, v6, v12);
  return 0LL;
}

CFTypeRef copy_nvram_variable(const __CFString *a1)
{
  return copy_nvram_variable_with_system_nvram_check(a1);
}

BOOL set_nvram_object( const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return set_nvram_object_with_system_nvram_check(a1, a2, 0LL, a4, a5, a6, a7, a8);
}

BOOL set_nvram_object_with_system_nvram_check( const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef v18;
  char v20;
  if (!a1)
  {
    id v18 = @"Can't insert nil key into registry\n";
LABEL_10:
    logfunction("", 1, v18, a4, a5, a6, a7, a8, v20);
    return 0LL;
  }

  BOOL v8 = a2;
  if (!a2)
  {
    logfunction("", 1, @"Can't insert nil object into registry\n", a4, a5, a6, a7, a8, v20);
    return v8;
  }

  io_registry_entry_t v10 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
  if (!v10)
  {
    id v18 = @"Failed to locate IODeviceTree options in IO registry\n";
    goto LABEL_10;
  }

  io_object_t v11 = v10;
  char v12 = IORegistryEntrySetCFProperty(v10, a1, (CFTypeRef)v8);
  BOOL v8 = v12 == 0;
  if (v12) {
    logfunction("", 1, @"Failed to set key %@ in IO registry: %d\n", v13, v14, v15, v16, v17, (char)a1);
  }
  IOObjectRelease(v11);
  return v8;
}

uint64_t delete_nvram_variable(const __CFString *a1)
{
  return msu_delete_nvram_variable_if_exists(a1, &v2);
}

uint64_t msu_delete_nvram_variable_if_exists(const __CFString *a1, _BYTE *a2)
{
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  *(_OWORD *)buffer = 0u;
  __int128 v15 = 0u;
  BOOL v4 = msu_nvram_exists(a1);
  CFStringGetCString(a1, buffer, 511LL, 0x8000100u);
  if (!v4)
  {
    char v12 = @"%s: NVRAM %s not found..Nothing to do\n\n";
    goto LABEL_5;
  }

  BOOL v10 = set_nvram_object_with_system_nvram_check(@"IONVRAM-DELETE-PROPERTY", (BOOL)a1, 0LL, v5, v6, v7, v8, v9);
  uint64_t v11 = 0LL;
  if (v10)
  {
    char v12 = @"%s: Deleted value %s\n\n";
LABEL_5:
    uint64_t v11 = 1LL;
    logfunction("", 1, v12, v5, v6, v7, v8, v9, (char)"msu_delete_nvram_variable_if_exists");
  }

  *a2 = v4;
  return v11;
}

BOOL msu_nvram_exists(const __CFString *a1)
{
  CFTypeRef v1 = copy_nvram_variable_with_system_nvram_check(a1);
  CFTypeRef v2 = v1;
  if (v1) {
    CFRelease(v1);
  }
  return v2 != 0LL;
}

BOOL msu_sync_nvram( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    uint64_t v8 = @"IONVRAM-FORCESYNCNOW-PROPERTY";
  }
  else {
    uint64_t v8 = @"IONVRAM-SYNCNOW-PROPERTY";
  }
  return set_nvram_object_with_system_nvram_check(v8, (BOOL)v8, 0LL, a4, a5, a6, a7, a8);
}

uint64_t gpu_dynamic_stats()
{
  return 0LL;
}

uint64_t msuSharedLogger()
{
  if (msuSharedLogger_pred != -1) {
    dispatch_once(&msuSharedLogger_pred, &__block_literal_global_2);
  }
  return msuSharedLogger___instance;
}

void __msuSharedLogger_block_invoke(id a1)
{
  msuSharedLogger___instance = (uint64_t)os_log_create("com.apple.MobileSoftwareUpdate", "daemon");
}

NSMutableDictionary *MSUCopyPreviousUpdateAllToleratedFailures()
{
  v0 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = @"MSUCopyPreviousUpdateAllToleratedFailures";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v5, 0xCu);
  }

  CFTypeRef v1 = copyPreviousToleratedFailures(1);
  CFTypeRef v2 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSDictionary safeSummaryForDictionary:](&OBJC_CLASS___NSDictionary, "safeSummaryForDictionary:", v1);
    int v5 = 138412546;
    uint64_t v6 = @"MSUCopyPreviousUpdateAllToleratedFailures";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | DONE | toleratedFailures:%@",  (uint8_t *)&v5,  0x16u);
  }

  return v1;
}

NSMutableDictionary *copyPreviousToleratedFailures(int a1)
{
  if (!a1)
  {
    uint64_t v6 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist");
    __int128 v16 = 0LL;
    uint64_t v17 = (uint64_t)&v16;
    uint64_t v18 = 0x3052000000LL;
    __int128 v19 = __Block_byref_object_copy__2;
    __int128 v20 = __Block_byref_object_dispose__2;
    __int128 v21 = 0LL;
    __int128 v22 = 0LL;
    __int128 v23 = (id *)&v22;
    uint64_t v24 = 0x3052000000LL;
    __int128 v25 = __Block_byref_object_copy__2;
    __int128 v26 = __Block_byref_object_dispose__2;
    uint64_t v27 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke;
    v15[3] = &unk_100059288;
    void v15[4] = &v16;
    v15[5] = &v22;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v15);
    __int16 v7 = *(void **)(v17 + 40);
    if (v7)
    {
      BOOL v8 = 0;
    }

    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke_2;
      v14[3] = &unk_100059288;
      v14[4] = &v16;
      v14[5] = &v22;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v14);
      __int16 v7 = *(void **)(v17 + 40);
      BOOL v8 = v7 != 0LL;
      if (!v7) {
        goto LABEL_13;
      }
    }

    id v9 = objc_msgSend( objc_msgSend(v7, "objectForKeyedSubscript:", @"StepName"),  "compare:",  @"update_baseband");
    BOOL v10 = &kMSUUpdateToleratedStepValueUpdateBaseband;
    if (v9) {
      BOOL v10 = &kMSUUpdateToleratedStepValueUnrecognizedStep;
    }
    uint64_t v11 = *v10;
    if (*v10)
    {
      id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"StepIdentifier");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:@"StepName"],  @"StepName");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:v23[5]],  @"EventUnique");
      if (v8)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"RebootRetry");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:@"RetryFailureNumber"],  @"FailureNumber");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:@"RetryResult"],  @"Result");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:@"RetryError"],  @"Error");
        char v12 = @"RetrySkipped";
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"RebootRetry");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:@"InitialFailureNumber"],  @"FailureNumber");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:@"InitialResult"],  @"Result");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:@"InitialError"],  @"Error");
        char v12 = @"InitialSkipped";
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [*(id *)(v17 + 40) objectForKeyedSubscript:v12],  @"Skipped");
      goto LABEL_16;
    }

LABEL_13:
    id v3 = 0LL;
LABEL_16:
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v16, 8);
    return v3;
  }

  CFTypeRef v1 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist");
  if (!v1) {
    return 0LL;
  }
  CFTypeRef v2 = v1;
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  uint64_t v18 = (uint64_t)__retrieve_previous_update_all_tolerated_failures_block_invoke;
  __int128 v19 = (void (*)(uint64_t, uint64_t))&unk_1000592B0;
  __int128 v20 = (void (*)(uint64_t))@"retrieve_previous_update_all_tolerated_failures";
  __int128 v21 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v2, "enumerateKeysAndObjectsUsingBlock:", &v16);
  int v5 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"Index",  1LL);
  __int128 v22 = v5;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  -[NSMutableArray sortedArrayUsingDescriptors:]( v4,  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL)),  @"toleratedStepsArray");

  return v3;
}

    -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v11),  @"CompatibilityVersion");
    id v14 = -[NSDictionary objectForKey:]( -[MSUUpdateBrainLocator updateAssetAttributes](self, "updateAssetAttributes"),  "objectForKey:",  @"Build");
    if (v14)
    {
      __int128 v15 = v14;
      __int128 v16 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v15, @"TargetBuildVersion");
      }
    }

    [a3 setAdditionalServerParams:v5];

    return;
  }

  uint64_t v13 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MSUUpdateBrainLocator appendCatalogDownloadOptionsToExistingOptions:].cold.1(v13);
  }
}

    v9[2](v9);
  }
}

void sub_10000728C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id __retrieve_previous_update_first_tolerated_failure_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 isEqualToString:@"uuid"];
  if ((result & 1) == 0)
  {
    id result = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"), "BOOLValue");
    if ((_DWORD)result)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      id v9 = *(void **)(v7 + 40);
      BOOL v8 = (void *)(v7 + 40);
      id result = v9;
      if (v9)
      {
        id v10 = [result objectForKeyedSubscript:@"InitialFailureNumber"];
        id v11 = [a3 objectForKeyedSubscript:@"InitialFailureNumber"];
        LODWORD(v10) = [v10 intValue];
        id result = [v11 intValue];
        BOOL v8 = (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      }

      void *v8 = a3;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
    }
  }

  return result;
}

id __retrieve_previous_update_first_tolerated_failure_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id result = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"), "BOOLValue");
  if ((_DWORD)result)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v9 = *(void **)(v7 + 40);
    BOOL v8 = (void *)(v7 + 40);
    id result = v9;
    if (v9)
    {
      id v10 = [result objectForKeyedSubscript:@"RetryFailureNumber"];
      id v11 = [a3 objectForKeyedSubscript:@"RetryFailureNumber"];
      LODWORD(v10) = [v10 intValue];
      id result = [v11 intValue];
      BOOL v8 = (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    }

    void *v8 = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
  }

  return result;
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (([a2 isEqualToString:@"uuid"] & 1) == 0)
  {
    if (objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"),  "BOOLValue"))
    {
      int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (v5)
      {
        uint64_t v6 = v5;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"StepName"],  @"CheckPoint");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"InitialFailureNumber"],  @"Index");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"InitialError"],  @"Description");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  @"initial",  @"Attempt");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"InitialResult"],  @"rcode");
        [*(id *)(a1 + 40) addObject:v6];
      }

      else
      {
        uint64_t v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2(a1, v7, v8, v9, v10, v11, v12, v13);
        }
      }
    }

    if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"), "BOOLValue"))
    {
      uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (v14)
      {
        __int128 v15 = v14;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"StepName"],  @"CheckPoint");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"RetryFailureNumber"],  @"Index");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"RetryError"],  @"Description");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"reboot-retry",  @"Attempt");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:@"RetryResult"],  @"rcode");
        [*(id *)(a1 + 40) addObject:v15];
      }

      else
      {
        __int128 v16 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1(a1, v16, v17, v18, v19, v20, v21, v22);
        }
      }
    }
  }

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000078E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

LABEL_17:
  -[MSUUpdateBrainLocator _clientRequestComplete:withError:wasSuccessful:]( self,  "_clientRequestComplete:withError:wasSuccessful:",  @"copyUpdateBrainPath",  v27,  v7 != 0LL);
  if (a3 && v27) {
    *a3 = v27;
  }
  return v7;
}

    uint64_t v20 = 1LL;
    goto LABEL_18;
  }

  if (v12)
  {
    *(_DWORD *)buf = 138543618;
    __int128 v32 = @"cancelInstall";
    __int128 v33 = 2114;
    __int128 v34 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | cancelDownloadSync...",  buf,  0x16u);
  }

  uint64_t v13 = [v8 cancelDownloadSync];
  if (!v13)
  {
    __int128 v25 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v26 = MAStringForMACancelDownloadResult(0LL);
      *(_DWORD *)buf = 138543874;
      __int128 v32 = @"cancelInstall";
      __int128 v33 = 2114;
      __int128 v34 = v9;
      __int128 v35 = 2114;
      __int128 v36 = v26;
      uint64_t v21 = "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...cancelDownloadSync | SUCCESS | MACancelDownloadResult:%{public}@";
      uint64_t v22 = v25;
      __int128 v23 = 32;
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  uint64_t v14 = v13;
  MAStringForMACancelDownloadResult(v13);
  uint64_t v18 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  810LL,  0LL,  0LL,  @"Could not cancel update brain download on %@, MACancelDownloadResult:%@",  v15,  v16,  v17,  (char)v8);
  __int128 v30 = (id)CFMakeCollectable(v18);
  uint64_t v19 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __int128 v28 = MAStringForMACancelDownloadResult(v14);
    *(_DWORD *)buf = 138544130;
    __int128 v32 = @"cancelInstall";
    __int128 v33 = 2114;
    __int128 v34 = v9;
    __int128 v35 = 2114;
    __int128 v36 = v28;
    __int128 v37 = 2114;
    __int128 v38 = v30;
    _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...cancelDownloadSync | FAILURE | MACancelDownloadResult:%{public}@, error:%{public}@",  buf,  0x2Au);
  }

  uint64_t v20 = 0LL;
LABEL_18:

  -[MSUUpdateBrainLocator _clientRequestComplete:withError:wasSuccessful:]( self,  "_clientRequestComplete:withError:wasSuccessful:",  @"cancelInstall",  v30,  v20);
  if (a3 && v30) {
    *a3 = v30;
  }
  return v20;
}

  uint64_t v19 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  (const void **)values,  v20,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v19) {
    logfunction("", 1, @"could not create cfdictionary\n", v23, v24, v25, v26, v27, v29);
  }
  if (v14) {
    CFRelease(v14);
  }
  CFRelease(v12);
  if (v5) {
LABEL_22:
  }
    CFRelease(v5);
  return v19;
}

LABEL_10:
  uint64_t v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v9);
  uint64_t v12 = objc_alloc(&OBJC_CLASS___MAAssetQuery);
  uint64_t v13 = [v12 initWithType:MSUBrainAssetType[0]];
  [v13 addKeyValuePair:ASAttributeCompatibilityVersion with:v11];
  objc_msgSend( v13,  "addKeyValueArray:with:",  MSUBrainAttributeSupportedDevicesKey,  +[NSMutableArray arrayWithObjects:]( NSMutableArray,  "arrayWithObjects:",  v3,  -[MSUUpdateBrainLocator deviceType](self, "deviceType"),  0));
  return v13;
}

  BOOL v4 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v15, 0LL);
  return v4;
}

void sub_10000A2C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

LABEL_21:
      uint64_t v17 = (char *)v17 + 1;
    }

    while (v15 != v17);
    __int128 v36 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
    __int128 v15 = v36;
  }

  while (v36);
LABEL_28:

  if (a4 && v42) {
    *a4 = v42;
  }
  return v41;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void OUTLINED_FUNCTION_2_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_4_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_7(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t trigger_cache_delete(uint64_t a1, void *a2, int a3, void *a4)
{
  char v6 = a1;
  uint64_t valuePtr = a1;
  int v38 = a3;
  uint64_t v34 = 0LL;
  __int128 v35 = &v34;
  uint64_t v36 = 0x2000000000LL;
  uint64_t v37 = 0LL;
  if (&_os_variant_uses_ephemeral_storage
    && os_variant_uses_ephemeral_storage("com.apple.MobileSoftwareUpdate"))
  {
    uint64_t v12 = 1LL;
    logfunction("", 1, @"Skipping CacheDelete for %lld bytes (urgencyLevel=%d), %s\n", v7, v8, v9, v10, v11, v6);
    goto LABEL_22;
  }

  dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
  if (v18)
  {
    logfunction("", 1, @"Triggering CacheDelete for %lld bytes (urgencyLevel=%d)\n", v13, v14, v15, v16, v17, v6);
    CFNumberRef v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
    CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v38);
    *(_OWORD *)keys = *(_OWORD *)off_100059528;
    __int128 v42 = @"CACHE_DELETE_URGENCY_LIMIT";
    values[0] = a2;
    values[1] = v19;
    values[2] = v20;
    CFDictionaryRef v21 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  (const void **)values,  3LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFDictionaryRef v27 = v21;
    if (v21)
    {
      CFRetain(v21);
      dispatch_retain(v18);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 0x40000000LL;
      v33[2] = __trigger_cache_delete_block_invoke;
      v33[3] = &unk_100059548;
      void v33[4] = &v34;
      v33[5] = v18;
      __int128 v28 = (const void *)CacheDeletePurgeSpaceWithInfo(v27, v33);
      dispatch_time_t v29 = dispatch_time(0LL, 300000000000LL);
      dispatch_semaphore_wait(v18, v29);
      uint64_t v12 = 1LL;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }

    logfunction("", 1, @"Failed to create info dictionary\n", v22, v23, v24, v25, v26, v32);
    __int128 v28 = 0LL;
  }

  else
  {
    logfunction("", 1, @"Failed to create semaphore for CacheDelete\n", v13, v14, v15, v16, v17, v31);
    CFNumberRef v19 = 0LL;
    CFDictionaryRef v27 = 0LL;
    __int128 v28 = 0LL;
    CFNumberRef v20 = 0LL;
  }

  uint64_t v12 = 0LL;
  if (a4) {
LABEL_11:
  }
    *a4 = v35[3];
LABEL_12:
  if (v18) {
    dispatch_release(v18);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v20) {
    CFRelease(v20);
  }
LABEL_22:
  _Block_object_dispose(&v34, 8);
  return v12;
}

void __trigger_cache_delete_block_invoke( uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 && (CFTypeID TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(a2)))
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"CACHE_DELETE_AMOUNT");
    if (Value)
    {
      uint64_t valuePtr = 0LL;
      CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
      char v12 = valuePtr;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = valuePtr;
      logfunction("", 1, @"Purged %lld bytes (%lld MB)\n", v13, v14, v15, v16, v17, v12);
    }
  }

  else
  {
    logfunction("", 1, @"results dictionary is NULL\n", a4, a5, a6, a7, a8, v18);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

BOOL is_user_volume()
{
  v1[2] = 0LL;
  v1[0] = 5LL;
  v1[1] = 2147491840LL;
  return getattrlist("/private/var/mobile", v1, v2, 0x40CuLL, 0) != -1
      && !strncmp((const char *)v3 + v3[0], "User", 4uLL);
}

uint64_t purgeable_space( const void *a1, int a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int valuePtr = a2;
  uint64_t v38 = -1LL;
  if (&_os_variant_uses_ephemeral_storage
    && (os_variant_uses_ephemeral_storage("com.apple.MobileSoftwareUpdate") & 1) != 0)
  {
    return 0LL;
  }

  if (a1)
  {
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v11)
    {
      CFNumberRef v12 = v11;
      Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (!Mutable)
      {
        CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  14LL,  0LL,  0LL,  @"failed to allocate info dictionary for cache delete.",  v14,  v15,  v16,  v36);
        if (a3)
        {
          *a3 = error_internal_cf;
LABEL_30:
          CFRelease(v12);
          return v38;
        }

LABEL_27:
        CFRelease(v34);
        goto LABEL_28;
      }

      uint64_t v24 = (const __CFDictionary *)v18;
      logfunction("", 1, @"CacheDeleteCopyPurgeableSpaceWithInfo() => %@\n", v19, v20, v21, v22, v23, v18);
      Value = (const __CFNumber *)CFDictionaryGetValue(v24, @"CACHE_DELETE_TOTAL_AVAILABLE");
      if (Value || (Value = (const __CFNumber *)CFDictionaryGetValue(v24, @"CACHE_DELETE_AMOUNT")) != 0LL)
      {
        if (CFNumberGetValue(Value, kCFNumberSInt64Type, &v38))
        {
LABEL_26:
          CFErrorRef v34 = v24;
          goto LABEL_27;
        }

        dispatch_time_t v29 = @"failed to convert purgeableNum to int64";
      }

      else
      {
        dispatch_time_t v29 = @"CACHE_DELETE_TOTAL_AVAILABLE_KEY and CACHE_DELETE_AMOUNT_KEY are both NULL";
      }

      CFErrorRef v35 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7LL, 0LL, 0LL, v29, v26, v27, v28, v37);
      if (a3) {
        *a3 = v35;
      }
      else {
        CFRelease(v35);
      }
      goto LABEL_26;
    }

    __int128 v30 = @"failed to allocate urgency number.";
    CFIndex v31 = 14LL;
  }

  else
  {
    __int128 v30 = @"Unable to determine purgeable space for null path";
    CFIndex v31 = 9LL;
  }

  CFErrorRef v32 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", v31, 0LL, 0LL, v30, a6, a7, a8, v36);
  if (a3) {
    *a3 = v32;
  }
  else {
    CFRelease(v32);
  }
  return -1LL;
}

uint64_t purgeable_data_space(int a1, CFErrorRef *a2)
{
  if (!is_user_volume()) {
    return purgeable_space(@"/private/var", a1, a2, v4, v5, v6, v7, v8);
  }
  uint64_t v14 = purgeable_space(@"/private/var/mobile", a1, a2, v4, v5, v6, v7, v8);
  if (!a2) {
    v14 += purgeable_space(@"/private/var", a1, 0LL, v9, v10, v11, v12, v13);
  }
  return v14;
}

uint64_t openRestoreLogFile(int a1)
{
  return openRestoreLogFileWithPath("/private/var/mobile/MobileSoftwareUpdate/restore.log", a1);
}

uint64_t openRestoreLogFileWithPath(const char *a1, int a2)
{
  uint64_t v2 = _restoreLogFD;
  if (_restoreLogFD < 0)
  {
    if (!a2 && _restoreLogFD == -2) {
      return 0xFFFFFFFFLL;
    }
    _restoreLogFD = -2;
    if (mkparentdir((uint64_t)a1, 0x1EDu))
    {
      __error();
      uint64_t v4 = __error();
      strerror(*v4);
      uint64_t v5 = @"Could not create path %s: %s\n";
    }

    else
    {
      uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420LL);
      if ((v2 & 0x80000000) == 0) {
        goto LABEL_10;
      }
      if (*__error() == 13 || *__error() == 1)
      {
        if (unlink(a1) == -1 && *__error() != 2)
        {
          uint64_t v8 = __error();
          strerror(*v8);
          uint64_t v5 = @"Failed to unlink '%s': %s\n";
          goto LABEL_6;
        }

        uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420LL);
        if ((v2 & 0x80000000) == 0)
        {
LABEL_10:
          atomic_store(0LL, &_restoreLogGrowth);
          _restoreLogFD = v2;
          rotateRestoreLogFD(v2);
          return v2;
        }
      }

      __error();
      uint64_t v7 = __error();
      strerror(*v7);
      uint64_t v5 = @"Could not open '%s': %s\n";
    }

LABEL_6:
    logfunction("", 0LL, v5);
    return 0xFFFFFFFFLL;
  }

  return v2;
}

  if (cf)
  {
    CFRelease(cf);
    cf = 0LL;
  }

  if (v15) {
    CFRelease(v15);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

  logfunction( "",  1,  @"%s: found previous update state MSUPreviousUpdateState=%u\n",  v1,  v2,  v3,  v4,  v5,  (char)"retrieve_previous_update_state");
  return v6;
}

int *rotateRestoreLogFD(int a1)
{
  if (fstat(a1, &v9)) {
    return __error();
  }
  flock(a1, 2);
  off_t st_size = v9.st_size;
  if (v9.st_size > 3145728)
  {
    uint64_t v4 = malloc(0x100000uLL);
    ssize_t v5 = pread(a1, v4, 0x100000uLL, st_size - 0x100000);
    if (v5 >= 1 && (ssize_t v6 = v5, (v7 = (char *)memchr(v4, 10, v5)) != 0LL))
    {
      size_t v8 = (_BYTE *)v4 - (v7 + 1) + v6;
      pwrite(a1, v7 + 1, v8, 0LL);
    }

    else
    {
      size_t v8 = 0LL;
    }

    ftruncate(a1, v8);
    free(v4);
  }

  return (int *)flock(a1, 8);
}

uint64_t closeRestoreLogFile()
{
  uint64_t result = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0) {
    uint64_t result = close(_restoreLogFD);
  }
  atomic_store(0LL, &_restoreLogGrowth);
  _restoreLogFD = -2;
  return result;
}

uint64_t checkForRestoreLogFD( int a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (fstat(a1, &v70) != -1)
  {
    logfunction("", 0, @"found restore log (size = %llu)\n", v10, v11, v12, v13, v14, v70.st_size);
    size_t st_size = v70.st_size;
    if (v70.st_size < 3145728)
    {
      __int128 v43 = (char *)malloc(v70.st_size + 1);
      if (v43)
      {
        uint64_t v27 = v43;
        ssize_t v44 = read(a1, v43, st_size);
        if ((v44 & 0x8000000000000000LL) == 0)
        {
          ssize_t v45 = v44;
LABEL_21:
          uint64_t result = 0LL;
          v27[v45] = 0;
          *a2 = v27;
          return result;
        }

        v48 = __error();
        char v68 = strerror(*v48);
        logfunction("", 0, @"unable to read from restore log file: %s\n", v49, v50, v51, v52, v53, v68);
        goto LABEL_28;
      }
    }

    else
    {
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      *(_OWORD *)__str = 0u;
      __int128 v72 = 0u;
      logfunction("", 0, @"restore log is suspiciously large - truncating\n", v15, v16, v17, v18, v19, v66);
      uint64_t v21 = (char *)malloc(0x300000uLL);
      if (v21)
      {
        uint64_t v27 = v21;
        ssize_t v28 = read(a1, v21, 0x180000uLL);
        if ((v28 & 0x8000000000000000LL) == 0)
        {
          uint64_t v29 = v28;
          if (lseek(a1, v28 - 3145727, 2) < 0)
          {
            uint64_t v47 = @"unable to seek in restore log file: %s\n";
            goto LABEL_27;
          }

          __int128 v30 = &v27[v29];
          ssize_t v31 = read(a1, &v27[v29], 3145727 - v29);
          if (v31 != -1)
          {
            int64_t v32 = v31;
            __int128 v33 = &v27[v29];
            do
            {
              if (v29 >= 1)
              {
                v27[v29 - 1] = 0;
                CFErrorRef v34 = strrchr(v27, 10);
                if (v34) {
                  CFErrorRef v35 = v34 + 1;
                }
                else {
                  CFErrorRef v35 = v27;
                }
                *CFErrorRef v35 = 0;
                uint64_t v29 = v35 - v27;
              }

              if (v32 < 1) {
                break;
              }
              char v36 = (char *)memchr(v30, 10, v32);
              if (!v36)
              {
                int64_t v32 = 0LL;
                break;
              }

              __int128 v30 = v36 + 1;
              int64_t v32 = &v33[v32] - (v36 + 1);
              __int128 v33 = v36 + 1;
            }

            while (v36 + 1 - &v27[v29] < 160);
            snprintf( __str,  0xA0uLL,  "--------------------\n------ Truncated %lld bytes ------\n--------------------\n",  v70.st_size - (v29 + v32));
            v60 = &v27[v29];
            __int128 v61 = v78;
            *((_OWORD *)v60 + 6) = v77;
            *((_OWORD *)v60 + 7) = v61;
            __int128 v62 = v80;
            *((_OWORD *)v60 + _Block_object_dispose(va, 8) = v79;
            *((_OWORD *)v60 + 9) = v62;
            __int128 v63 = v74;
            *((_OWORD *)v60 + 2) = v73;
            *((_OWORD *)v60 + 3) = v63;
            __int128 v64 = v76;
            *((_OWORD *)v60 + 4) = v75;
            *((_OWORD *)v60 + 5) = v64;
            __int128 v65 = v72;
            *(_OWORD *)v60 = *(_OWORD *)__str;
            *((_OWORD *)v60 + 1) = v65;
            ssize_t v45 = strlen(__str) + v29;
            if (v32)
            {
              if (v30 > &v27[v45])
              {
                memmove(&v27[v45], v30, v32);
                v45 += v32;
              }
            }

            goto LABEL_21;
          }
        }

        uint64_t v47 = @"unable to read from restore log file: %s\n";
LABEL_27:
        v54 = __error();
        char v69 = strerror(*v54);
        logfunction("", 0, v47, v55, v56, v57, v58, v59, v69);
LABEL_28:
        free(v27);
        return 0xFFFFFFFFLL;
      }
    }

    logfunction("", 0, @"unable to allocate memory to read restore log\n", v22, v23, v24, v25, v26, v66);
    return 0xFFFFFFFFLL;
  }

  char v37 = __error();
  char v67 = strerror(*v37);
  logfunction("", 1, @"fstat on restore log failed: %s\n", v38, v39, v40, v41, v42, v67);
  return 0xFFFFFFFFLL;
}

size_t writeToRestoreLogFile(void *__buf, size_t __nbyte)
{
  size_t v2 = __nbyte;
  int v3 = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0)
  {
    ssize_t v4 = write(_restoreLogFD, __buf, __nbyte);
    size_t v2 = v4;
    if (v4 >= 1)
    {
      do
      {
        unint64_t v5 = __ldxr(&_restoreLogGrowth);
        int64_t v6 = v5 + v4;
      }

      while (__stxr(v6, &_restoreLogGrowth));
      if (v6 > 0x10000)
      {
        do
          unint64_t v7 = __ldxr(&_restoreLogGrowth);
        while (__stxr(v7 - v6, &_restoreLogGrowth));
        rotateRestoreLogFD(v3);
      }
    }
  }

  return v2;
}

uint64_t submitRestoreLogFile(__CFError *a1, uint64_t a2, const char *a3, const char *a4)
{
  return submitRestoreLogFileToLogDir(a1, a2, a3, a4, 0LL);
}

uint64_t submitRestoreLogFileToLogDir( __CFError *a1, uint64_t a2, const char *a3, const char *a4, const __CFString *a5)
{
  v124 = 0LL;
  bzero(v138, 0x400uLL);
  if (a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = "/private/var/mobile/MobileSoftwareUpdate/restore.log";
  }
  int v11 = open(v10, 2);
  int v18 = v11;
  if (v11 == -1)
  {
    uint64_t v27 = __error();
    strerror(*v27);
    logfunction("", 1, @"unable to open restore log (%s): %s (%d)\n", v28, v29, v30, v31, v32, (char)v10);
    uint64_t v25 = 0LL;
    goto LABEL_12;
  }

  int v19 = checkForRestoreLogFD(v11, &v124, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = v124;
  if (v19) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v124 == 0LL;
  }
  if (v26)
  {
    logfunction("", 1, @"unable to read from restore log file\n", v20, v21, v22, v23, v24, v115);
LABEL_12:
    __int128 v33 = 0LL;
    goto LABEL_43;
  }

  rotateRestoreLogFD(v18);
  CFErrorRef v34 = (const __CFString *)MGCopyAnswer(@"SerialNumber", 0LL);
  __int128 v33 = v34;
  if (!v34)
  {
    v48 = @"failed to query device serial number\n";
LABEL_42:
    logfunction("", 1, v48, v35, v36, v37, v38, v39, v115);
LABEL_43:
    free(v25);
    uint64_t v50 = 0LL;
    CFStringRef v51 = 0LL;
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!v33) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }

  if (CFStringGetLength(v34) < 1)
  {
    uint64_t v49 = @"device has no serial number for scrubbing\n";
LABEL_23:
    logfunction("", 1, v49, v40, v41, v42, v43, v44, v115);
    goto LABEL_24;
  }

  *(_OWORD *)buffer = 0u;
  __int128 v140 = 0u;
  if (CFStringGetCString(v33, buffer, 32LL, 0x8000100u) != 1)
  {
    uint64_t v49 = @"unable to get c string for device serial number\n";
    goto LABEL_23;
  }

  ssize_t v45 = strcasestr(v25, buffer);
  if (v45)
  {
    v46 = v45;
    do
    {
      size_t v47 = strlen(buffer);
      memset(v46, 88, v47);
      v46 = strcasestr(v46, buffer);
    }

    while (v46);
  }

LABEL_24:
  if (_AMRRegexSubstitution(v25, "'[^\n]*' has been added", "'<<File name>>' has been added ")
    || _AMRRegexSubstitution( v25,  "verify_callback: '[^\n]*' did not verify and is not on the exception list.",  "verify_callback: '<<File name>>' did not verify and is not on the exception list.")
    || _AMRRegexSubstitution( v25,  "'[^\n]*' is on the exception list",  "'<<File name>>' is on the exception list")
    || _AMRRegexSubstitution(v25, "[:-][0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [a-zA-Z0-9]{18}[[:>:]]", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-][a-zA-Z0-9]{8}[:-][a-zA-Z0-9]{16}", "XXXX")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{40}", "<<<<<<<<<<<<<<<<<<UDID>>>>>>>>>>>>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{20}", "<<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{19}", "<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9]{15}", "<<<<<IMEI>>>>>>")
    || _AMRRegexSubstitution(v25, "ecid=0x[0-9a-fA-F]*,", "ecid=0xXXXXXXXXXXX")
    || _AMRRegexSubstitution(v25, "ApECID[^\n]*value = [+-][0-9<>IMEI]*", "ApECID} = X {X")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{14}", "<<<<<MEID>>>>>")
    || _AMRRegexSubstitution(v25, "ChipSerialNo[^\n]*bytes = 0x[0-9a-fA-F]*}", "ChipSerialNo ")
    || _AMRRegexSubstitution(v25, "snum=0x[0-9a-fA-F]*,", "snum=0xXXXXXXXX")
    || _AMRRegexSubstitution(v25, "BbSNUM[^\n]*", "BbSNUM} = 0xXXXXXXXX }"))
  {
    goto LABEL_41;
  }

  err = a1;
  size_t v54 = strlen(v25);
  if (v54)
  {
    size_t v55 = v54;
    uint64_t v56 = v25;
    do
    {
      __darwin_ct_rune_t v57 = *v56;
      if (v57 < 0)
      {
        if (!__maskrune(*v56, 0x40000uLL))
        {
          __uint32_t v58 = __maskrune(v57, 0x4000uLL);
LABEL_60:
          if (!v58) {
            *uint64_t v56 = 46;
          }
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v57] & 0x40000) == 0)
      {
        __uint32_t v58 = _DefaultRuneLocale.__runetype[v57] & 0x4000;
        goto LABEL_60;
      }

      ++v56;
      --v55;
    }

    while (v55);
  }

  CFStringRef cf = CFStringCreateWithCString(kCFAllocatorDefault, v25, 0x8000100u);
  if (!cf)
  {
LABEL_41:
    v48 = @"failed to scrub log\n";
    goto LABEL_42;
  }

  theDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    logfunction("", 1, @"failed to create crashReporterDictionary\n", v59, v60, v61, v62, v63, v115);
    char v67 = 0LL;
    char v68 = 0LL;
    char v69 = 0LL;
    v118 = 0LL;
LABEL_85:
    CFStringRef erra = 0LL;
    goto LABEL_103;
  }

  if (err)
  {
    __int128 v64 = CFErrorCopyUserInfo(err);
    if (v64)
    {
      __int128 v65 = v64;
      Value = (const __CFString *)CFDictionaryGetValue(v64, @"target_update");
      char Code = CFErrorGetCode(err);
      CFRelease(v65);
    }

    else
    {
      char Code = CFErrorGetCode(err);
      Value = 0LL;
    }
  }

  else
  {
    Value = 0LL;
    char Code = -1;
  }

  stat v70 = @"Unknown";
  if (!Value) {
    Value = @"Unknown";
  }
  uint64_t v71 = MGCopyAnswer(@"BuildVersion", 0LL);
  if (v71) {
    stat v70 = (const __CFString *)v71;
  }
  CFDictionarySetValue(theDict, @"itunes_version", v70);
  CFDictionarySetValue(theDict, @"restore_payload_version", Value);
  CFDictionarySetValue(theDict, @"restore_type", @"OTAUpdate");
  CFDictionarySetValue(theDict, @"name", @"iPhoneRestore");
  v118 = v70;
  CFDictionarySetValue(theDict, @"os_version", v70);
  CFDictionarySetValue(theDict, @"bug_type", @"183");
  CFStringRef erra = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%ld");
  if (!erra)
  {
    logfunction("", 1, @"failed to create CFString from %ld\n", v72, v73, v74, v75, v76, Code);
    char v67 = 0LL;
    char v68 = 0LL;
    char v69 = 0LL;
    goto LABEL_85;
  }

  CFDictionarySetValue(theDict, @"restore_error", erra);
  if (!a4)
  {
    Default = CFAllocatorGetDefault();
    char v68 = CFURLCreateWithFileSystemPath( Default,  @"/private/var/mobile/Library/Logs/CrashReporter",  kCFURLPOSIXPathStyle,  0);
    goto LABEL_87;
  }

  CFStringRef v77 = CFStringCreateWithCString(0LL, a4, 0x8000100u);
  if (!v77)
  {
    v112 = @"failed to create dataPartitionMountPointStr\n";
LABEL_99:
    logfunction("", 1, v112, v78, v79, v80, v81, v82, Code);
    char v67 = 0LL;
    char v68 = 0LL;
LABEL_102:
    char v69 = 0LL;
    goto LABEL_103;
  }

  v83 = v77;
  v84 = CFAllocatorGetDefault();
  v85 = CFURLCreateWithFileSystemPath(v84, v83, kCFURLPOSIXPathStyle, 0);
  CFRelease(v83);
  if (!v85)
  {
    v112 = @"failed to create mountPointURL\n";
    goto LABEL_99;
  }

  if (a5) {
    v86 = a5;
  }
  else {
    v86 = @"/mobile/Library/Logs/CrashReporter";
  }
  char v68 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v85, v86, 1u);
  CFRelease(v85);
  if (!v68)
  {
    v92 = @"mountPointURL CFURLCreateCopyAppendingPathComponent failed\n";
LABEL_101:
    logfunction("", 1, v92, v87, v88, v89, v90, v91, Code);
    char v67 = 0LL;
    goto LABEL_102;
  }

LABEL_87:
  uint64_t v137 = 0LL;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  *(_OWORD *)v125 = 0u;
  __int128 v126 = 0u;
  time_t v123 = 0LL;
  if (a2 <= 0) {
    a2 = time(0LL);
  }
  time_t v123 = a2;
  v94 = localtime(&v123);
  if (!v94)
  {
    v92 = @"localtime failed\n";
    goto LABEL_101;
  }

  if (!strftime(v125, 0xC8uLL, "%F-%H-%M-%S", v94))
  {
    v92 = @"strftime failed\n";
    goto LABEL_101;
  }

  v95 = CFAllocatorGetDefault();
  v116 = v125;
  char v69 = CFStringCreateWithFormat(v95, 0LL, @"OTAUpdate-%s.ips");
  if (!v69)
  {
    logfunction("", 1, @"failed to create crashReporterFileName\n", v96, v97, v98, v99, v100, (char)v125);
    char v67 = 0LL;
    goto LABEL_103;
  }

  v101 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v68, v69, 0);
  char v67 = v101;
  if (!v101)
  {
    v113 = @"failed to create log file name\n";
LABEL_116:
    logfunction("", 1, v113, v102, v103, v104, v105, v106, (char)v116);
LABEL_103:
    free(v25);
    CFRelease(cf);
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!theDict) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }

  if (!CFURLGetFileSystemRepresentation(v101, 1u, v138, 1024LL))
  {
    LOBYTE(v116) = (_BYTE)v67;
    v113 = @"Could not get file path from %@\n";
    goto LABEL_116;
  }

  logfunction("", 1, @"Trying to write crashreporter log file %s\n", v102, v103, v104, v105, v106, (char)v138);
  if (store_ips_with_mode(theDict, cf, (const char *)v138))
  {
    logfunction("", 1, @"failed to create %s\n", v107, v108, v109, v110, v111, (char)v138);
    goto LABEL_103;
  }

  int v114 = ftruncate(v18, 0LL);
  if (a4 || v114) {
    unlink(v10);
  }
  free(v25);
  CFRelease(cf);
  uint64_t v52 = 0LL;
LABEL_104:
  CFRelease(theDict);
LABEL_105:
  if (v67) {
    CFRelease(v67);
  }
  if (v68) {
    CFRelease(v68);
  }
  if (v69) {
    CFRelease(v69);
  }
  uint64_t v50 = v118;
  CFStringRef v51 = erra;
  if (v33) {
LABEL_44:
  }
    CFRelease(v33);
LABEL_45:
  if (v50) {
    CFRelease(v50);
  }
  if (v51) {
    CFRelease(v51);
  }
  if (v18 != -1 && close(v18) == -1) {
    submitRestoreLogFileToLogDir_cold_1();
  }
  return v52;
}

uint64_t store_ips_with_mode(const __CFDictionary *a1, const __CFString *a2, const char *a3)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
  int v7 = open(a3, 1537);
  if (v7 != -1)
  {
    int v13 = v7;
    CFStringAppend(Mutable, @"{");
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)append_item_to_string, Mutable);
    CFStringTrim(Mutable, @",");
    CFStringAppend(Mutable, @"}\n");
    ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, Mutable, 0x8000100u, 0x3Fu);
    uint64_t v20 = ExternalRepresentation;
    if (!ExternalRepresentation) {
      goto LABEL_11;
    }
    size_t Length = CFDataGetLength(ExternalRepresentation);
    BytePtr = CFDataGetBytePtr(v20);
    if (write(v13, BytePtr, Length) != Length)
    {
      CFErrorRef v34 = @"write hdr\n";
      goto LABEL_15;
    }

    CFRelease(v20);
    uint64_t v23 = CFStringCreateExternalRepresentation(0LL, a2, 0x8000100u, 0x3Fu);
    uint64_t v20 = v23;
    if (v23)
    {
      size_t v24 = CFDataGetLength(v23);
      uint64_t v25 = CFDataGetBytePtr(v20);
      if (write(v13, v25, v24) == v24)
      {
        BOOL v26 = getpwnam("mobile");
        if (v26)
        {
          if (!chown(a3, v26->pw_uid, v26->pw_gid))
          {
            uint64_t v33 = 0LL;
LABEL_17:
            close(v13);
            if (!Mutable) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }

          uint64_t v27 = __error();
          strerror(*v27);
          logfunction("", 1, @"unable to chown file '%s': %s\n\n", v28, v29, v30, v31, v32, (char)a3);
LABEL_16:
          uint64_t v33 = 0xFFFFFFFFLL;
          goto LABEL_17;
        }

        CFErrorRef v34 = @"unable to look up mobile user uid/gid. Defaulting to 501/501\n\n";
      }

      else
      {
        CFErrorRef v34 = @"write payload\n";
      }
    }

    else
    {
LABEL_11:
      CFErrorRef v34 = @"CFStringCreateExternalRepresentation\n";
    }

LABEL_15:
    logfunction("", 1, v34, v15, v16, v17, v18, v19, 164);
    goto LABEL_16;
  }

  logfunction("", 1, @"open\n", v8, v9, v10, v11, v12, 164);
  uint64_t v20 = 0LL;
  uint64_t v33 = 0xFFFFFFFFLL;
  if (Mutable) {
LABEL_18:
  }
    CFRelease(Mutable);
LABEL_19:
  if (v20) {
    CFRelease(v20);
  }
  return v33;
}

        uint64_t v38 = 1LL;
        logfunction("", 1, @"Required space (%lld) is available (%lld)\n", v12, v13, v14, v15, v16, a1);
        *a2 = 0LL;
        return v38;
      }

      return 0LL;
    }

    uint64_t v37 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Cache delete failed",  v18,  v19,  v20,  v41);
  }

  else
  {
    logfunction("", 1, @"No point in calculating needed size since out param is NULL\n", a4, a5, a6, a7, a8, v40);
    uint64_t v37 = _create_error_internal_cf( kCFErrorDomainPOSIX,  22LL,  0LL,  0LL,  @"missing prequiredsize parameter",  v34,  v35,  v36,  v42);
    if (!a3)
    {
      CFRelease(v37);
      return 0LL;
    }
  }

  uint64_t v38 = 0LL;
  *a3 = v37;
  return v38;
}

uint64_t _AMRRegexSubstitution(const char *a1, const char *a2, const char *a3)
{
  char v4 = (char)a2;
  memset(&v23, 0, sizeof(v23));
  if (regcomp(&v23, a2, 1))
  {
    logfunction("", 1, @"unable to compile regex '%s': %d\n", v6, v7, v8, v9, v10, v4);
    return 0xFFFFFFFFLL;
  }

  else
  {
    __pmatch.rm_so = 0LL;
    for (__pmatch.rm_eo = 0LL; ; a1 += __pmatch.rm_eo)
    {
      int v12 = regexec(&v23, a1, 1uLL, &__pmatch, 0);
      if (v12) {
        break;
      }
      size_t v18 = __pmatch.rm_eo - __pmatch.rm_so;
      int64_t v19 = strlen(a3);
      int v20 = LODWORD(__pmatch.rm_eo) - LODWORD(__pmatch.rm_so) - v19;
      if (v19 < __pmatch.rm_eo - __pmatch.rm_so) {
        size_t v18 = v19;
      }
      memcpy((void *)&a1[__pmatch.rm_so], a3, v18);
      if (v20 >= 1)
      {
        memset((void *)&a1[__pmatch.rm_so + v18], 62, v20);
        a1 += v20;
      }
    }

    if (v12 == 1)
    {
      uint64_t v11 = 0LL;
    }

    else
    {
      logfunction("", 1, @"regex matching failed for '%s': %d\n", v13, v14, v15, v16, v17, v4);
      uint64_t v11 = 0xFFFFFFFFLL;
    }

    regfree(&v23);
  }

  return v11;
}

void append_item_to_string(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
}

uint64_t get_system_partition_padding(const __CFDictionary *a1)
{
  uint64_t valuePtr = 0LL;
  if (!a1) {
    goto LABEL_41;
  }
  size_t v2 = IOBSDNameMatching(kIOMasterPortDefault, 0, "disk0");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  if (!MatchingService)
  {
    logfunction("", 1, @"Could not find service for device with BSD name %s\n", v4, v5, v6, v7, v8, (char)"disk0");
LABEL_41:
    uint64_t v53 = 0LL;
    return v53 << 20;
  }

  io_object_t v9 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"Size", kCFAllocatorDefault, 0);
  uint64_t v16 = CFProperty;
  if (!CFProperty || (CFTypeID v17 = CFGetTypeID(CFProperty), v17 != CFNumberGetTypeID()))
  {
    logfunction("", 1, @"Invalid value '%@' for property key '%@'\n", v11, v12, v13, v14, v15, (char)v16);
    uint64_t v53 = 0LL;
    goto LABEL_38;
  }

  if (!CFNumberGetValue((CFNumberRef)v16, kCFNumberLongLongType, &valuePtr))
  {
    logfunction("", 1, @"Failed to convert '%@' to primitive value\n", v18, v19, v20, v21, v22, (char)v16);
LABEL_45:
    IOObjectRelease(v9);
    uint64_t v53 = 0LL;
LABEL_46:
    CFRelease(v16);
    return v53 << 20;
  }

  if (valuePtr >= 0) {
    unint64_t v23 = valuePtr;
  }
  else {
    unint64_t v23 = valuePtr + 0x3FFFFFFF;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"SystemPartitionPadding");
  if (!Value)
  {
    logfunction( "",  1,  @"No padding dictionary specified, returning default padding value %llu\n\n",  v25,  v26,  v27,  v28,  v29,  0);
    goto LABEL_45;
  }

  uint64_t v30 = Value;
  size_t Count = CFDictionaryGetCount(Value);
  if (!Count)
  {
    logfunction( "",  1,  @"No padding entries, returning default padding value %llu\n\n",  v32,  v33,  v34,  v35,  v36,  0);
    goto LABEL_45;
  }

  int64_t v37 = Count;
  uint64_t v38 = (const void **)calloc(Count, 8uLL);
  uint64_t v39 = (const void **)calloc(v37, 8uLL);
  ssize_t v45 = v39;
  if (!v38 || !v39)
  {
    logfunction( "",  1,  @"Failed to allocate key/value buffers to fetch system padding value\n\n",  v40,  v41,  v42,  v43,  v44,  v63);
    uint64_t v53 = 0LL;
    if (v38) {
      goto LABEL_51;
    }
    goto LABEL_52;
  }

  CFDictionaryGetKeysAndValues(v30, v38, v39);
  __int16 v70 = 0;
  *(void *)buffer = 0LL;
  if (v37 < 1)
  {
    uint64_t v53 = 0LL;
    goto LABEL_51;
  }

  uint64_t v51 = 0LL;
  int v52 = 0;
  uint64_t v53 = 0LL;
  unint64_t v64 = v23 >> 30;
  int v65 = 0;
  do
  {
    size_t v54 = (const __CFString *)v38[v51];
    size_t v55 = (const __CFNumber *)v45[v51];
    uint64_t v67 = 0LL;
    int v66 = 0;
    if (!v54)
    {
      uint64_t v61 = @"Failed to get marketing size key from padding dict\n\n";
LABEL_33:
      logfunction("", 1, v61, v46, v47, v48, v49, v50, v63);
      goto LABEL_34;
    }

    if (!v55)
    {
      uint64_t v61 = @"Failed to get padding size for key in padding dict\n\n";
      goto LABEL_33;
    }

    __int16 v70 = 0;
    *(void *)buffer = 0LL;
    if (!CFStringGetCString(v54, buffer, 10LL, 0x8000100u))
    {
      uint64_t v61 = @"Failed to get C string from CFStringRef padding key\n\n";
      goto LABEL_33;
    }

    if (!sscanf(buffer, "%d", &v66))
    {
      uint64_t v61 = @"Failed to parse out padding value from capacity string\n\n";
      goto LABEL_33;
    }

    if (!CFNumberGetValue(v55, kCFNumberSInt64Type, &v67))
    {
      uint64_t v61 = @"Failed to convert CFNumberRef value into int\n\n";
      goto LABEL_33;
    }

    int v56 = v64 - v66;
    BOOL v57 = v51 != 0;
    BOOL v58 = v56 > v52;
    BOOL v59 = !v57 || !v58;
    if (v57 && v58)
    {
      int v60 = v65;
    }

    else
    {
      uint64_t v53 = v67;
      int v60 = v66;
    }

    int v65 = v60;
    if (v59) {
      int v52 = v56;
    }
LABEL_34:
    ++v51;
  }

  while (v37 != v51);
  if (v52 >= 11) {
    logfunction( "",  1,  @"Closest marketing capacity entry for padding was %dGB however this device is %dGB, this might not be optimal\n\n",  v46,  v47,  v48,  v49,  v50,  v65);
  }
LABEL_51:
  free(v38);
LABEL_52:
  if (v45) {
    free(v45);
  }
LABEL_38:
  IOObjectRelease(v9);
  if (v16) {
    goto LABEL_46;
  }
  return v53 << 20;
}

CFPropertyListRef load_plist_with_mutability_option(CFURLRef fileURL, CFOptionFlags a2)
{
  if (!fileURL) {
    return 0LL;
  }
  int v3 = CFReadStreamCreateWithFile(kCFAllocatorDefault, fileURL);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  if (CFReadStreamOpen(v3)) {
    CFPropertyListRef v5 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v4, 0LL, a2, 0LL, 0LL);
  }
  else {
    CFPropertyListRef v5 = 0LL;
  }
  CFReadStreamClose(v4);
  CFRelease(v4);
  return v5;
}

CFPropertyListRef load_dict(char *cStr)
{
  if (!cStr) {
    return 0LL;
  }
  CFTypeRef v1 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v1) {
    return 0LL;
  }
  size_t v2 = v1;
  int v3 = CFURLCreateWithFileSystemPath(0LL, v1, kCFURLPOSIXPathStyle, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    CFPropertyListRef plist_with_mutability_option = load_plist_with_mutability_option(v3, 0LL);
    CFRelease(v4);
  }

  else
  {
    CFPropertyListRef plist_with_mutability_option = 0LL;
  }

  CFRelease(v2);
  return plist_with_mutability_option;
}

uint64_t mkparentdir(uint64_t a1, mode_t a2)
{
  if (a1)
  {
    __strlcpy_chk(&v8, a1, 1024LL, 1024LL);
    if (v8 == 47) {
      uint64_t v4 = v9;
    }
    else {
      uint64_t v4 = &v8;
    }
    do
    {
      if (!*v4) {
        break;
      }
      CFPropertyListRef v5 = strchr(v4, 47);
      uint64_t v4 = v5;
      if (v5 > &v8)
      {
        memset(&v7, 0, sizeof(v7));
        *CFPropertyListRef v5 = 0;
        if (lstat(&v8, &v7) == -1 && mkdir(&v8, a2) == -1 && *__error() != 17) {
          return 0xFFFFFFFFLL;
        }
        *v4++ = 47;
      }
    }

    while (v4);
    return 0LL;
  }

  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

CFErrorRef _create_error_internal_with_userinfo_cf( const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, a5, a6, &a9);
}

CFErrorRef _vcreate_error_internal_with_userinfo_cf( const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, va_list a7)
{
  int v14 = *__error();
  if (a5) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, a5);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v16 = MutableCopy;
  if (MutableCopy)
  {
    CFStringRef v17 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a6, a7);
    if (v17)
    {
      CFStringRef v23 = v17;
      logfunction("", 1, @"%@ error %ld - %@\n", v18, v19, v20, v21, v22, (char)a1);
      CFDictionaryAddValue(v16, kCFErrorLocalizedDescriptionKey, v23);
      CFRelease(v23);
    }

    if (a3) {
      CFDictionaryAddValue(v16, kCFErrorUnderlyingErrorKey, a3);
    }
    if (a4) {
      CFDictionaryAddValue(v16, @"target_update", a4);
    }
    CFErrorRef v24 = CFErrorCreate(kCFAllocatorDefault, a1, a2, v16);
    CFRelease(v16);
  }

  else
  {
    CFErrorRef v24 = 0LL;
  }

  *__error() = v14;
  return v24;
}

CFErrorRef _create_error_internal_cf( const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, 0LL, a5, &a9);
}

__CFString *get_short_error_domain(__CFString *result)
{
  if (result)
  {
    Domain = CFErrorGetDomain((CFErrorRef)result);
    if (CFStringCompare(Domain, @"MobileSoftwareUpdateErrorDomain", 0LL))
    {
      if (CFStringCompare(Domain, @"RamrodErrorDomain", 0LL))
      {
        if (CFStringCompare(Domain, @"NRDUpdateErrorDomain", 0LL)) {
          return (__CFString *)Domain;
        }
        else {
          return @"NRD";
        }
      }

      else
      {
        return @"RRD";
      }
    }

    else
    {
      return @"MSU";
    }
  }

  return result;
}

__CFString *copy_underlying_error_description(__CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeRef v1 = a1;
  CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
  if (Mutable)
  {
    unsigned int v3 = 0;
    do
    {
      short_error_domain = get_short_error_domain(v1);
      CFStringAppend(Mutable, short_error_domain);
      CFIndex Code = CFErrorGetCode((CFErrorRef)v1);
      CFStringAppendFormat(Mutable, 0LL, @" %ld", Code);
      uint64_t v6 = CFErrorCopyUserInfo((CFErrorRef)v1);
      if (v6)
      {
        stat v7 = v6;
        Value = CFDictionaryGetValue(v6, kCFErrorLocalizedDescriptionKey);
        if (Value
          || (Value = CFDictionaryGetValue(v7, kCFErrorDescriptionKey)) != 0LL
          || (Value = CFDictionaryGetValue(v7, kCFErrorLocalizedFailureReasonKey)) != 0LL
          || (Value = CFDictionaryGetValue(v7, @"NSDebugDescription")) != 0LL)
        {
          CFStringAppendFormat(Mutable, 0LL, @" (%@)", Value);
        }

        CFTypeRef v1 = (__CFString *)CFDictionaryGetValue(v7, kCFErrorUnderlyingErrorKey);
        CFRelease(v7);
      }

      CFStringAppend(Mutable, @";");
      if (!v1) {
        break;
      }
    }

    while (v3++ < 9);
  }

  return Mutable;
}

CFDictionaryRef cferror_to_dictionary(__CFError *a1)
{
  return cferror_to_dictionary_embedded(a1, 0);
}

CFDictionaryRef cferror_to_dictionary_embedded(__CFError *a1, int a2)
{
  CFIndex valuePtr = CFErrorGetCode(a1);
  CFErrorDomain Domain = CFErrorGetDomain(a1);
  CFPropertyListRef v5 = CFErrorCopyUserInfo(a1);
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  if (!v6)
  {
    logfunction("", 1, @"could not create cfnumber\n", v7, v8, v9, v10, v11, v29);
    CFDictionaryRef v19 = 0LL;
    if (!v5) {
      return v19;
    }
    goto LABEL_22;
  }

  CFNumberRef v12 = v6;
  *(_OWORD *)keys = *(_OWORD *)off_100059568;
  __int128 v35 = *(_OWORD *)&off_100059578;
  values[0] = v6;
  values[1] = (void *)Domain;
  uint64_t v32 = v5;
  uint64_t v33 = 0LL;
  if (!v5)
  {
    int v14 = 0LL;
    CFIndex v20 = 2LL;
    if (!a2) {
      goto LABEL_17;
    }
    uint64_t v21 = &v32;
    uint64_t v22 = 3LL;
    goto LABEL_16;
  }

  Value = (__CFDictionary *)CFDictionaryGetValue(v5, kCFErrorUnderlyingErrorKey);
  int v14 = Value;
  if (Value)
  {
    CFTypeID v15 = CFGetTypeID(Value);
    if (v15 == CFErrorGetTypeID() && (uint64_t v16 = cferror_to_dictionary_embedded(v14, 0LL)) != 0)
    {
      CFStringRef v17 = (const void *)v16;
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v5);
      int v14 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, kCFErrorUnderlyingErrorKey, v17);
        uint64_t v32 = v14;
      }

      CFRelease(v17);
    }

    else
    {
      int v14 = 0LL;
    }
  }

  CFIndex v20 = 3LL;
  if ((a2 & 1) != 0)
  {
    uint64_t v21 = (CFBooleanRef *)&v33;
    uint64_t v22 = 4LL;
LABEL_16:
    keys[v20] = @"_MSU_Embedded_Error";
    *uint64_t v21 = kCFBooleanTrue;
    CFIndex v20 = v22;
  }

CFStringRef copy_dictionary_to_cferror(const void *a1)
{
  CFIndex valuePtr = 0LL;
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    uint64_t v21 = @"marshalled cferror is not a dictionary.\n";
LABEL_17:
    logfunction("", 1, v21, v3, v4, v5, v6, v7, v23);
    return 0LL;
  }

  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Code");
  if (!Value)
  {
    uint64_t v21 = @"marshalled cferror is incomplete. missing code.\n";
    goto LABEL_17;
  }

  if (!CFNumberGetValue(Value, kCFNumberCFIndexType, &valuePtr))
  {
    uint64_t v21 = @"code not convert cfnumber code to cfindex\n";
    goto LABEL_17;
  }

  int v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Domain");
  if (!v14)
  {
    logfunction("", 1, @"marshalled cferror is incomplete. missing domain.\n", v9, v10, v11, v12, v13, v23);
    return v14;
  }

  CFTypeID v15 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a1, @"UserInfo");
  if (!v15)
  {
    uint64_t v21 = @"marshalled cferror is incomplete. missing UserInfo.\n";
    goto LABEL_17;
  }

  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v15);
  if (!MutableCopy)
  {
    uint64_t v21 = @"code not create mutable copy of userInfo\n";
    goto LABEL_17;
  }

  CFStringRef v17 = MutableCopy;
  uint64_t v18 = CFDictionaryGetValue(MutableCopy, kCFErrorUnderlyingErrorKey);
  CFDictionaryRef v19 = (const void *)copy_dictionary_to_cferror(v18);
  if (v19)
  {
    CFIndex v20 = v19;
    CFDictionarySetValue(v17, kCFErrorUnderlyingErrorKey, v19);
    CFRelease(v20);
  }

  int v14 = (const __CFString *)CFErrorCreate(kCFAllocatorDefault, v14, valuePtr, v17);
  CFRelease(v17);
  return v14;
}

uint64_t calculate_snapshot_overhead(uint64_t a1)
{
  return (uint64_t)((double)a1 * 1.05 + 293601280.0);
}

uint64_t performCryptegraftSemiSplat(const void *a1, const __CFString **a2)
{
  uint64_t v4 = copy_shared_cryptegraft_service_connection();
  if (v4)
  {
    uint64_t v8 = (_xpc_connection_s *)v4;
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v9, "Command", "CryptegraftSemiSplat");
    CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  3LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (a1)
    {
      CFTypeID v16 = CFGetTypeID(a1);
      if (v16 == CFStringGetTypeID()) {
        CFDictionarySetValue(Mutable, @"TargetVolume", a1);
      }
    }

    msu_serialize_cf_object_into_xpc_dict(v9, "CommandParameters", Mutable, v10, v11, v12, v13, v14);
    if (Mutable) {
      CFRelease(Mutable);
    }
    xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(v8, v9);
    uint64_t v22 = msu_demux_reply(v17, 0LL, 0LL, a2, v18, v19, v20, v21);
    xpc_release(v9);
    if (v17) {
      xpc_release(v17);
    }
    xpc_release(v8);
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No cryptegraft connection",  v5,  v6,  v7,  v25);
    if (a2)
    {
      uint64_t v22 = 0LL;
      *a2 = (const __CFString *)error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      return 0LL;
    }
  }

  return v22;
}

uint64_t copy_shared_cryptegraft_service_connection()
{
  if (get_cryptegraft_service_queue_queue_once != -1) {
    dispatch_once(&get_cryptegraft_service_queue_queue_once, &__block_literal_global_20);
  }
  dispatch_sync((dispatch_queue_t)get_cryptegraft_service_queue_queue, &__block_literal_global_5);
  return copy_shared_cryptegraft_service_connection_service_connection;
}

uint64_t performCryptegraftDownlevel(const void *a1, const void *a2, const __CFString **a3)
{
  uint64_t v6 = copy_shared_cryptegraft_service_connection();
  if (v6)
  {
    uint64_t v10 = (_xpc_connection_s *)v6;
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v11, "Command", "CryptegraftDownlevel");
    CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (a1)
    {
      CFTypeID v18 = CFGetTypeID(a1);
      if (v18 == CFStringGetTypeID()) {
        CFDictionarySetValue(Mutable, @"TargetVolume", a1);
      }
    }

    if (a2)
    {
      CFTypeID v19 = CFGetTypeID(a2);
      if (v19 == CFURLGetTypeID()) {
        CFDictionarySetValue(Mutable, @"SourcePath", a2);
      }
    }

    msu_serialize_cf_object_into_xpc_dict(v11, "CommandParameters", Mutable, v12, v13, v14, v15, v16);
    if (Mutable) {
      CFRelease(Mutable);
    }
    xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(v10, v11);
    uint64_t v25 = msu_demux_reply(v20, 0LL, 0LL, a3, v21, v22, v23, v24);
    xpc_release(v11);
    if (v20) {
      xpc_release(v20);
    }
    xpc_release(v10);
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No cryptegraft connection",  v7,  v8,  v9,  v28);
    if (a3)
    {
      uint64_t v25 = 0LL;
      *a3 = (const __CFString *)error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      return 0LL;
    }
  }

  return v25;
}

void __copy_shared_cryptegraft_service_connection_block_invoke(id a1)
{
  CFTypeRef v1 = (void *)copy_shared_cryptegraft_service_connection_service_connection;
  if (copy_shared_cryptegraft_service_connection_service_connection) {
    goto LABEL_2;
  }
  if (dlopen("/System/Library/PrivateFrameworks/MobileSoftwareUpdate.framework/MobileSoftwareUpdate", 1))
  {
    if (get_cryptegraft_service_queue_queue_once != -1) {
      dispatch_once(&get_cryptegraft_service_queue_queue_once, &__block_literal_global_20);
    }
    CFTypeID v2 = xpc_connection_create( "com.apple.MobileSoftwareUpdate.CryptegraftService",  (dispatch_queue_t)get_cryptegraft_service_queue_queue);
    copy_shared_cryptegraft_service_connection_service_connection = (uint64_t)v2;
    if (v2)
    {
      xpc_connection_set_event_handler(v2, &__block_literal_global_18);
      xpc_connection_resume((xpc_connection_t)copy_shared_cryptegraft_service_connection_service_connection);
      CFTypeRef v1 = (void *)copy_shared_cryptegraft_service_connection_service_connection;
LABEL_2:
      xpc_retain(v1);
      return;
    }

    logfunction( "",  1,  @"Could not create connection to service %s\n",  v3,  v4,  v5,  v6,  v7,  (char)"com.apple.MobileSoftwareUpdate.CryptegraftService");
  }

  else
  {
    char v13 = dlerror();
    logfunction("", 1, @"failed to dlopen(3) MobileSoftwareUpdate framework: %s\n", v8, v9, v10, v11, v12, v13);
  }

void __copy_shared_cryptegraft_service_connection_block_invoke_2(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error
    && copy_shared_cryptegraft_service_connection_service_connection != 0)
  {
    xpc_release((xpc_object_t)copy_shared_cryptegraft_service_connection_service_connection);
    copy_shared_cryptegraft_service_connection_service_connection = 0LL;
  }

void __get_cryptegraft_service_queue_block_invoke(id a1)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v5 = 0u;
  __int128 v6 = 0u;
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v2 = 0u;
  snprintf(__str, 0x100uLL, "%s.queue", "com.apple.MobileSoftwareUpdate.CryptegraftService");
  get_cryptegraft_service_queue_queue = (uint64_t)dispatch_queue_create(__str, 0LL);
}

uint64_t get_msubrain()
{
  return msubrain;
}

int main(int argc, const char **argv, const char **envp)
{
  __int128 v3 = objc_autoreleasePoolPush();
  openlog("softwareupdated", 1, 24);
  __int128 v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MAIN] softwareupdated starting up", buf, 2u);
  }

  if ((openRestoreLogFile(1) & 0x80000000) != 0)
  {
    __int128 v5 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      main_cold_6(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  uint64_t v13 = atexit((void (*)(void))closeRestoreLogFile);
  if ((_DWORD)v13)
  {
    uint64_t v21 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    uint64_t v13 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v13) {
      main_cold_5(v21);
    }
  }

  *(void *)buf = 0LL;
  int v22 = msu_running_in_limited_environment(v13, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v23 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[MAIN] softwareupdated running in limited environment..Skipping cleanup and saveCurrentEnv calls",  v48,  2u);
    }

    goto LABEL_43;
  }

  if (v24)
  {
    *(_WORD *)uint64_t v48 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[MAIN] softwareupdated running in regular environment..Performing cleanup and saveCurrentEnv calls",  v48,  2u);
  }

  handle_update_metrics();
  unsigned int previous_update_state = retrieve_previous_update_state();
  if (is_first_boot_after_update() && previous_update_state == 2)
  {
    char v26 = perform_cleanup_and_disable_staged_assets_command(0, 0LL, (const __CFString **)buf);
    uint64_t v27 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    char v28 = v27;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v48 = 0;
        char v29 = "[MAIN] Called clean up prepare path and staged assets";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, v48, 2u);
        goto LABEL_29;
      }

      goto LABEL_29;
    }

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      main_cold_3();
    }
LABEL_27:
    if (*(void *)buf)
    {
      CFRelease(*(CFTypeRef *)buf);
      *(void *)buf = 0LL;
    }

    goto LABEL_29;
  }

  char v30 = perform_cleanup_command(0, 1, 0LL, (const __CFString **)buf);
  uint64_t v31 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  char v28 = v31;
  if ((v30 & 1) == 0)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      main_cold_4();
    }
    goto LABEL_27;
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v48 = 0;
    char v29 = "[MAIN] Called clean up prepare path";
    goto LABEL_22;
  }

void handle_update_metrics()
{
  v0 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v52 = @"handle_update_metrics";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | BEGIN", buf, 0xCu);
  }

  id v1 = +[UMEventRecorder recorder](&OBJC_CLASS___UMEventRecorder, "recorder");
  CFTypeRef cf = 0LL;
  __int128 v2 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v52 = @"handle_update_metrics";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | softwareupdated running in standard mode",  buf,  0xCu);
  }

  uint64_t previous_update_unresolved_tolerated_failures_count = get_previous_update_unresolved_tolerated_failures_count();
  updated = MSUCopyPreviousUpdateAllToleratedFailures();
  __int128 v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (updated || (updated = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary)) != 0LL)
  {
    uint64_t v6 = -[NSString stringByReplacingOccurrencesOfString:withString:]( -[NSString stringByReplacingOccurrencesOfString:withString:]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", updated),  "stringByReplacingOccurrencesOfString:withString:",  @"\n",  @" "),  "stringByReplacingOccurrencesOfString:withString:",  @"=",  @":");
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"toleratedSteps");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  previous_update_unresolved_tolerated_failures_count),  @"toleratedFailureCount");
    }
  }

  else
  {
    int v22 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v7 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v7) {
      handle_update_metrics_cold_3(v22, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  if ((msu_running_in_limited_environment(v7, v8, v9, v10, v11, v12, v13, v14) & 1) == 0)
  {
    uint64_t v15 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS]: | Attempting to read asset audience",  buf,  2u);
    }

    uint64_t v16 = MAGetPallasAudience(@"com.apple.MobileAsset.SoftwareUpdate");
    uint64_t v17 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543362;
        int v52 = (const __CFString *)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS]: | Asset audience %{public}@ found",  buf,  0xCu);
      }

      if (v5)
      {
        -[NSMutableDictionary setValue:forKey:](v5, "setValue:forKey:", v16, @"MobileAssetAssetAudience");
        uint64_t v19 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v20 = "[UPDATE_METRICS]: | Set asset audience in dict";
LABEL_25:
          uint64_t v21 = v19;
          goto LABEL_26;
        }
      }

      else
      {
        uint64_t v19 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v20 = "[UPDATE_METRICS]: | Dict does not exist. Unable to set asset audience";
          goto LABEL_25;
        }
      }
    }

    else if (v18)
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "[UPDATE_METRICS]: | Unable to determine asset audience";
      uint64_t v21 = v17;
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
  }

  uint64_t v23 = gpu_dynamic_stats();
  if (v23 && v5) {
    -[NSMutableDictionary setValue:forKey:](v5, "setValue:forKey:", v23, @"GPUDynamicStats");
  }
  int v24 = MSUShouldPromptTTR();
  uint64_t v25 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412290;
      int v52 = @"handle_update_metrics";
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | record updateFinished (should prompt for TTR)",  buf,  0xCu);
    }

    softwareupdated_add_additional_analytics_data_for_phase(v5);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = __handle_update_metrics_block_invoke;
    v49[3] = &unk_1000599B8;
    v49[4] = @"handle_update_metrics";
    [v1 recordPostUpdateEvent:@"updateFinished" additionalInfo:v5 withCallback:v49];
    if (!v5) {
      goto LABEL_39;
    }
LABEL_38:

    goto LABEL_39;
  }

  if (v26)
  {
    *(_DWORD *)buf = 138412290;
    int v52 = @"handle_update_metrics";
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | record updateFinished",  buf,  0xCu);
  }

  softwareupdated_add_additional_analytics_data_for_phase(v5);
  [v1 recordPostUpdateEvent:@"updateFinished" additionalInfo:v5];
  if (v5) {
    goto LABEL_38;
  }
LABEL_39:
  uint64_t v27 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v52 = @"handle_update_metrics";
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | Clean up NVRAM",  buf,  0xCu);
  }

  if ((perform_cleanup_NVRAM_command((const __CFString **)&cf) & 1) == 0)
  {
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      handle_update_metrics_cold_2();
    }

    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }
  }

  char v28 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v52 = @"handle_update_metrics";
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | Submit any accumulated events",  buf,  0xCu);
  }

  id v29 = [v1 submitEventsInBackground:1];
  if ((msu_running_in_limited_environment((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36) & 1) == 0)
  {
    uint64_t v37 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v52 = @"handle_update_metrics";
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | Flushing RecoveryOS controller events",  buf,  0xCu);
    }

    uint64_t v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s/%s",  "/private/var/MobileSoftwareUpdate/",  "Controller/NeRD");
    if (v38)
    {
      uint64_t v39 = v38;
      objc_msgSend( +[SUCoreEventReporter initSharedReporterStoringToPath:]( SUCoreEventReporter,  "initSharedReporterStoringToPath:",  v38),  "flushEvent");
    }

    else
    {
      uint64_t v40 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        handle_update_metrics_cold_1(v40, v41, v42, v43, v44, v45, v46, v47);
      }
    }
  }

  uint64_t v48 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v52 = @"handle_update_metrics";
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | DONE", buf, 0xCu);
  }

void __main_block_invoke(id a1, OS_xpc_object *a2)
{
  __int128 v3 = objc_autoreleasePoolPush();
  CFTypeRef cf = 0LL;
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  __int128 v5 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "clean_update_logs";
    __int16 v34 = 2048;
    xpc_activity_state_t v35 = state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s state=%ld", buf, 0x16u);
  }

  xpc_object_t v6 = xpc_activity_copy_criteria(a2);
  xpc_object_t v7 = v6;
  if (state == 2)
  {
    if (xpc_activity_should_defer(a2))
    {
      BOOL v11 = xpc_activity_set_state(a2, 3LL);
      uint64_t v12 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v13 = "failure";
      if (v11) {
        uint64_t v13 = "success";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "clean_update_logs";
      __int16 v34 = 2080;
      xpc_activity_state_t v35 = (xpc_activity_state_t)v13;
      uint64_t v14 = "%s should defer activity, %s";
      uint64_t v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_17;
    }
  }

  else
  {
    if (state) {
      goto LABEL_18;
    }
    if (v6)
    {
      int64_t int64 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY);
      uint64_t v9 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (int64 != XPC_ACTIVITY_INTERVAL_7_DAYS)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v33 = "clean_update_logs";
          __int16 v34 = 2048;
          xpc_activity_state_t v35 = int64;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s activity already set, delay=%lld",  buf,  0x16u);
        }

        goto LABEL_38;
      }

      if (v10)
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "clean_update_logs";
        __int16 v34 = 2048;
        xpc_activity_state_t v35 = int64;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s activity is set with default retention %lld",  buf,  0x16u);
      }
    }
  }

  if (os_variant_is_recovery(0LL))
  {
    uint64_t v17 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v33 = "clean_update_logs";
    uint64_t v14 = "%s os variant is recovery";
    uint64_t v15 = v17;
    uint32_t v16 = 12;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_18:
    if (!v7) {
      goto LABEL_39;
    }
LABEL_38:
    xpc_release(v7);
    goto LABEL_39;
  }

  uint64_t v30 = -1LL;
  if ((perform_logs_cleanup_command(XPC_ACTIVITY_INTERVAL_7_DAYS, &v30, (const __CFString **)&cf) & 1) != 0)
  {
    int64_t v18 = XPC_ACTIVITY_INTERVAL_1_DAY;
    if (v30 >= 0) {
      int64_t v19 = XPC_ACTIVITY_INTERVAL_7_DAYS - v30;
    }
    else {
      int64_t v19 = XPC_ACTIVITY_INTERVAL_7_DAYS;
    }
    if (XPC_ACTIVITY_INTERVAL_7_DAYS - v30 >= XPC_ACTIVITY_INTERVAL_1_DAY) {
      int64_t v20 = v19;
    }
    else {
      int64_t v20 = XPC_ACTIVITY_INTERVAL_1_DAY;
    }
    uint64_t v21 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v33 = "clean_update_logs";
      __int16 v34 = 2048;
      xpc_activity_state_t v35 = v30;
      __int16 v36 = 2048;
      int64_t v37 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s oldest=%lld, new delay=%lld", buf, 0x20u);
    }

    if (v7) {
      goto LABEL_37;
    }
  }

  else
  {
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      __main_block_invoke_cold_2();
    }

    int64_t v18 = XPC_ACTIVITY_INTERVAL_1_DAY;
    int64_t v20 = XPC_ACTIVITY_INTERVAL_1_DAY;
    if (v7) {
      goto LABEL_37;
    }
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v7)
  {
LABEL_37:
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, v20);
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, v18);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_activity_set_criteria(a2, v7);
    goto LABEL_38;
  }

  int v22 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __main_block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
  }
LABEL_39:
  if (cf) {
    CFRelease(cf);
  }
  objc_autoreleasePoolPop(v3);
}

void __main_block_invoke_2(id a1, OS_xpc_object *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(a2, 0LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __main_block_invoke_3;
    handler[3] = &unk_100059990;
    handler[4] = a2;
    xpc_connection_set_event_handler(a2, handler);
    if ((msu_client_is_entitled(a2, (uint64_t)"com.apple.private.softwareupdated-helpers") & 1) == 0)
    {
      if (get_peer_connections_queue_peer_connections_queue_once != -1) {
        dispatch_once(&get_peer_connections_queue_peer_connections_queue_once, &__block_literal_global_343);
      }
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = __main_block_invoke_7;
      v5[3] = &unk_100059968;
      v5[4] = a2;
      dispatch_sync((dispatch_queue_t)get_peer_connections_queue_peer_connections_queue, v5);
    }

    xpc_connection_resume(a2);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    __int128 v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __main_block_invoke_2_cold_1(a2, v4);
    }
    exit(0);
  }

void __main_block_invoke_3( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    handle_message(*(_xpc_connection_s **)(a1 + 32), object, (uint64_t)&jump_table, 27, v12, v13, v14, v15, a9);
    return;
  }

  if (type != (xpc_type_t)&_xpc_type_error)
  {
    uint32_t v16 = xpc_copy_description(object);
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      __main_block_invoke_3_cold_2();
    }

    free(v16);
    return;
  }

  if (get_peer_connections_queue_peer_connections_queue_once != -1) {
    dispatch_once(&get_peer_connections_queue_peer_connections_queue_once, &__block_literal_global_343);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __main_block_invoke_4;
  block[3] = &unk_100059968;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)get_peer_connections_queue_peer_connections_queue, block);
  if (object == &_xpc_error_connection_interrupted)
  {
    int64_t v19 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    string = xpc_dictionary_get_string(&_xpc_error_connection_interrupted, _xpc_error_key_description);
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = string;
    uint64_t v21 = "[PEER_CONNECTION] Remote service has exited (%s) | Connection remains live as means to trigger remote service "
          "re-launch on-demand";
LABEL_19:
    uint64_t v23 = v19;
    goto LABEL_20;
  }

  if (object == &_xpc_error_connection_invalid)
  {
    int64_t v19 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v22 = xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = v22;
    uint64_t v21 = "[PEER_CONNECTION] Connection has become invalid (%s) | Connection is no longer part of the XPC namespace";
    goto LABEL_19;
  }

  uint64_t v17 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  int64_t v18 = v17;
  if (object == &_xpc_error_termination_imminent)
  {
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v24 = xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = v24;
    uint64_t v21 = "[PEER_CONNECTION] Connection will terminate soon (%s) | All outstanding transactions must be wound down, no new transactions";
    uint64_t v23 = v18;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    return;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __main_block_invoke_3_cold_1(object, v18);
  }
}

uint64_t get_peer_connections_queue()
{
  if (get_peer_connections_queue_peer_connections_queue_once != -1) {
    dispatch_once(&get_peer_connections_queue_peer_connections_queue_once, &__block_literal_global_343);
  }
  return get_peer_connections_queue_peer_connections_queue;
}

id __main_block_invoke_4(uint64_t a1)
{
  if (get_peer_connections_array_peer_connections_array_once != -1) {
    dispatch_once(&get_peer_connections_array_peer_connections_array_once, &__block_literal_global_345);
  }
  return [(id)get_peer_connections_array_peer_connections_array removeObject:*(void *)(a1 + 32)];
}

id __main_block_invoke_7(uint64_t a1)
{
  if (get_peer_connections_array_peer_connections_array_once != -1) {
    dispatch_once(&get_peer_connections_array_peer_connections_array_once, &__block_literal_global_345);
  }
  return [(id)get_peer_connections_array_peer_connections_array addObject:*(void *)(a1 + 32)];
}

NSSet *initDecodeClasses()
{
  v0 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___MADownloadOptions);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MAMsuDownloadOptions);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MADownloadConfig);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
  id v1 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v3, 9LL);
  uint64_t result = -[NSSet initWithArray:](v0, "initWithArray:", v1, v3, v4, v5, v6, v7, v8, v9, v10);
  _decodeClasses = (uint64_t)result;
  return result;
}

void softwareupdated_add_additional_analytics_data_for_phase(void *a1)
{
  __int128 v2 = -[MSUAnalytics initWithPhase:](objc_alloc(&OBJC_CLASS___MSUAnalytics), "initWithPhase:", 5LL);
  id v3 = -[MSUAnalytics copyAnalyticsData](v2, "copyAnalyticsData");
  char v4 = MGGetBoolAnswer(@"InternalBuild");
  if (v3)
  {
    char v5 = v4;
    id v6 = [v3 mutableCopy];
    if (v6)
    {
      uint64_t v7 = v6;
      if ((v5 & 1) == 0)
      {
        [v6 removeObjectForKey:@"personId"];
        [v7 removeObjectForKey:@"serialNumber"];
      }

      uint64_t v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS]: Adding additional data to eventStats: %@",  (uint8_t *)&v10,  0xCu);
      }

      [a1 addEntriesFromDictionary:v7];
    }

    else
    {
      uint64_t v9 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS]: Failed to make a copy of the analyticsData dict",  (uint8_t *)&v10,  2u);
      }
    }
  }
}

void __handle_update_metrics_block_invoke(uint64_t a1, void *a2)
{
  char v4 = objc_autoreleasePoolPush();
  char v5 = &APFSContainerGetSpaceInfo_ptr;
  id v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v7 = &off_100041000;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    BOOL v59 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | updateFinished callback | BEGIN",  buf,  0xCu);
  }

  id v9 = [a2 objectForKeyedSubscript:@"otaOutcome"];
  id v10 = [a2 objectForKeyedSubscript:@"failureReason"];
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 0LL;
  }
  if ([a2 objectForKeyedSubscript:@"migratorMetrics"]
    && (objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"migratorMetrics"),  "containsString:",  @"result=0") & 1) == 0)
  {
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/private/var/MobileSoftwareUpdate/lastOTA/apfs_migrator_verification.log"))
    {
      uint64_t v14 = @"during APFS Migrator";
      int v13 = 1;
    }

    else
    {
      id v57 = v10;
      uint64_t v23 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Found migrator failure, but no verification log",  buf,  2u);
      }

      int v13 = 0;
      uint64_t v14 = 0LL;
      id v10 = v57;
    }
  }

  else
  {
    int v13 = 0;
    uint64_t v14 = 0LL;
  }

  if (!v12) {
    goto LABEL_13;
  }
  unsigned int v15 = [v12 isEqualToString:@"success"] ^ 1;
  if (v10) {
    unsigned int v15 = 1;
  }
  if ((v13 | v15) == 1)
  {
LABEL_13:
    size_t v55 = v4;
    id v56 = v10;
    uint64_t v16 = a1;
    id v17 = [a2 objectForKeyedSubscript:@"deviceModel"];
    id v18 = [a2 objectForKeyedSubscript:@"targetOSVersion"];
    id v19 = [a2 objectForKeyedSubscript:@"originalOSVersion"];
    id v20 = [a2 objectForKeyedSubscript:@"toleratedFailureCount"];
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0) {
      id v20 = 0LL;
    }
    if ([v12 containsString:@"fail_forward"])
    {
      uint64_t v14 = @"while cleaning up, but booted the new OS anyway";
    }

    else if ([v12 containsString:@"back"])
    {
      uint64_t v14 = @"to install";
    }

    else if (v20 && ![v20 isEqualToNumber:&off_100063B60])
    {
      uint64_t v14 = @"to update all device firmware";
    }

    else
    {
      unsigned int v22 = [v12 isEqualToString:@"success_on_reboot_retry"];
      if (v22) {
        uint64_t v14 = @"initially and had to restart";
      }
      if (((v13 | v22) & 1) == 0)
      {
        else {
          uint64_t v14 = @"in an unexpected way";
        }
      }
    }

    a1 = v16;
    uint64_t v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Your OTA update failed %@",  v14);
    +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@: OTA Update outcome %@ with reason %@",  v17,  v18,  v9,  v56);
    +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"My OTA update attempt from %@ to %@ failed %@...\n\nEvent details:\n%@",  v19,  v18,  v14,  a2);
    CFPreferencesAppSynchronize(@"com.apple.MobileSoftwareUpdate");
    int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"TestInhibitPromptForTTR",  @"com.apple.MobileSoftwareUpdate",  0LL);
    char v5 = &APFSContainerGetSpaceInfo_ptr;
    uint64_t v26 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (AppBooleanValue)
    {
      if (v27)
      {
        *(_DWORD *)buf = 138543618;
        BOOL v59 = @"is_tap_to_radar_inhibited";
        __int16 v60 = 2114;
        uint64_t v61 = @"TestInhibitPromptForTTR";
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %{public}@ | %{public}@=true | not prompting for TTR",  buf,  0x16u);
      }

LABEL_36:
      uint64_t v28 = (os_log_s *)objc_msgSend(objc_msgSend(v5[176], "sharedLogger"), "oslog");
      char v4 = v55;
      uint64_t v7 = &off_100041000;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        BOOL v59 = v29;
        __int16 v60 = 2112;
        uint64_t v61 = (const __CFString *)v24;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | updateFinished callback | WARNING(INTERNAL-ONLY) | not prompting for TTR: %@",  buf,  0x16u);
      }

      goto LABEL_60;
    }

    if (v27)
    {
      *(_DWORD *)buf = 138543618;
      BOOL v59 = @"is_tap_to_radar_inhibited";
      __int16 v60 = 2114;
      uint64_t v61 = @"TestInhibitPromptForTTR";
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %{public}@ | checked %{public}@ | no preference based inhibit of prompting for TTR",  buf,  0x16u);
    }

    io_registry_entry_t v30 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (!v30)
    {
      uint64_t v39 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v59 = @"is_tap_to_radar_inhibited";
        uint64_t v40 = "[UPDATE_METRICS] %{public}@ | WARNING | unable to obtain reference to IO device tree options";
        uint64_t v41 = v39;
        uint32_t v42 = 12;
LABEL_56:
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
      }

LABEL_57:
      uint64_t v51 = (os_log_s *)objc_msgSend(objc_msgSend(v5[176], "sharedLogger"), "oslog");
      char v4 = v55;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        BOOL v59 = v52;
        __int16 v60 = 2112;
        uint64_t v61 = (const __CFString *)v24;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | updateFinished callback | prompting for TTR: %@",  buf,  0x16u);
      }

      MSUPromptForTTR();
      uint64_t v7 = &off_100041000;
      goto LABEL_60;
    }

    io_object_t v31 = v30;
    CFTypeRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v30, @"msu-test-inhibit-ttr", kCFAllocatorDefault, 0);
    IOObjectRelease(v31);
    if (CFProperty)
    {
      uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(CFProperty, v33) & 1) != 0)
      {
        __int16 v34 = (const char *)[CFProperty bytes];
        xpc_activity_state_t v35 = objc_alloc(&OBJC_CLASS___NSString);
        size_t v36 = strnlen(v34, (size_t)[CFProperty length]);
        int64_t v37 = v35;
        char v5 = &APFSContainerGetSpaceInfo_ptr;
        uint64_t v38 = -[NSString initWithBytes:length:encoding:](v37, "initWithBytes:length:encoding:", v34, v36, 4LL);
      }

      else
      {
        uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(CFProperty, v43) & 1) == 0)
        {

          goto LABEL_54;
        }

        uint64_t v38 = (NSString *)[CFProperty copy];
      }

      uint64_t v44 = v38;

      if (v44)
      {
        unsigned int v45 = -[NSString isEqualToString:](v44, "isEqualToString:", @"true");
        uint64_t v46 = v5;
        unsigned int v47 = v45;
        uint64_t v48 = (os_log_s *)objc_msgSend(objc_msgSend(v46[176], "sharedLogger"), "oslog");
        BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
        if (v47)
        {
          if (v49)
          {
            *(_DWORD *)buf = 138543618;
            BOOL v59 = @"is_tap_to_radar_inhibited";
            __int16 v60 = 2114;
            uint64_t v61 = @"msu-test-inhibit-ttr";
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %{public}@ | %{public}@=true | not prompting for TTR",  buf,  0x16u);
          }

          char v5 = &APFSContainerGetSpaceInfo_ptr;
          goto LABEL_36;
        }

        if (v49)
        {
          *(_DWORD *)buf = 138543874;
          BOOL v59 = @"is_tap_to_radar_inhibited";
          __int16 v60 = 2114;
          uint64_t v61 = @"msu-test-inhibit-ttr";
          __int16 v62 = 2114;
          char v63 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %{public}@ | %{public}@=%{public}@ | no NVRAM based inhibit of prompting for TTR",  buf,  0x20u);
        }

        char v5 = &APFSContainerGetSpaceInfo_ptr;
        goto LABEL_57;
      }
    }

LABEL_54:
    uint64_t v50 = (os_log_s *)objc_msgSend(objc_msgSend(v5[176], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      BOOL v59 = @"is_tap_to_radar_inhibited";
      __int16 v60 = 2114;
      uint64_t v61 = @"msu-test-inhibit-ttr";
      uint64_t v40 = "[UPDATE_METRICS] %{public}@ | checked %{public}@ | no valid value for NVRAM based inhibit of prompting for TTR";
      uint64_t v41 = v50;
      uint32_t v42 = 22;
      goto LABEL_56;
    }

    goto LABEL_57;
  }

LABEL_60:
  uint64_t v53 = (os_log_s *)objc_msgSend(objc_msgSend(v5[176], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    size_t v54 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = *((void *)v7 + 328);
    BOOL v59 = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "[UPDATE_METRICS] %@ | updateFinished callback | DONE",  buf,  0xCu);
  }

  objc_autoreleasePoolPop(v4);
}

void handle_create_update_brain_connection(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFTypeRef cf = 0LL;
  id v6 = msu_deserialize_cf_object_from_xpc_dict(a2, "UpdateAttributes");
  CFTypeRef v7 = (id)CFMakeCollectable(v6);
  if (get_softwareupdated_queue_queue_once != -1) {
    dispatch_once(&get_softwareupdated_queue_queue_once, &__block_literal_global_165);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __copy_shared_update_brain_connection_block_invoke;
  block[3] = &unk_100059A28;
  block[4] = a1;
  void block[5] = a2;
  block[6] = a3;
  block[7] = v6;
  block[8] = &cf;
  dispatch_sync((dispatch_queue_t)get_softwareupdated_queue_queue, block);
  uint64_t v11 = (_xpc_connection_s *)copy_shared_update_brain_connection_brain_connection;
  CFErrorRef error_internal_cf = (__CFString *)cf;
  if (copy_shared_update_brain_connection_brain_connection)
  {
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __handle_create_update_brain_connection_block_invoke;
    v15[3] = &unk_1000599E0;
    void v15[4] = a3;
    v15[5] = v7;
    if (handle_create_update_brain_connection_onceToken != -1) {
      dispatch_once(&handle_create_update_brain_connection_onceToken, v15);
    }
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    xpc_endpoint_t v14 = xpc_endpoint_create(v11);
    xpc_dictionary_set_value(reply, "UpdateBrainServiceEndPoint", v14);
    xpc_connection_send_message(a1, reply);
    xpc_release(reply);
    xpc_release(v11);
    xpc_release(v14);
  }

  else
  {
    if (!cf)
    {
      CFErrorRef error_internal_cf = (__CFString *)_create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No service connection",  v8,  v9,  v10,  v15[0]);
      CFTypeRef cf = error_internal_cf;
    }

    record_brain_load_event(a3, (uint64_t)v7, error_internal_cf);
    msu_send_error(a1, a2, (__CFError *)cf, 0);
    if (cf) {
      CFRelease(cf);
    }
  }

void handle_purge_suspended_update(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  CFTypeRef cf = 0LL;
  if (theDict) {
    Value = CFDictionaryGetValue(theDict, @"TargetUUID");
  }
  else {
    Value = 0LL;
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v7 = +[UMEventRecorder recorder](&OBJC_CLASS___UMEventRecorder, "recorder");
  [v7 recordEvent:@"purge" information:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __handle_purge_suspended_update_block_invoke;
  v8[3] = &unk_100059968;
  void v8[4] = v7;
  dispatch_async(global_queue, v8);
  if ((perform_cleanup_staged_assets_command(1, Value, (const __CFString **)&cf) & 1) != 0)
  {
    msu_send_status(a1, a2, 0LL);
  }

  else
  {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
    CFRelease(cf);
  }

void handle_calculate_prepare_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t v18 = 0LL;
  uint64_t valuePtr = 0LL;
  CFErrorRef error_internal_cf = 0LL;
  Value = (void *)CFDictionaryGetValue(theDict, @"AssetProperties");
  if (Value)
  {
    uint64_t v10 = CFDictionaryGetValue(theDict, @"TargetUUID");
    if ((MSUAssetCalculatePrepareSizes_server((uint64_t)v10, Value, &valuePtr, &v18, &error_internal_cf) & 1) != 0)
    {
      Value = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
      if (Value)
      {
        id v14 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        [v14 setObject:Value forKeyedSubscript:@"Size"];
        objc_msgSend( v14,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v18),  @"SnapshotSize");
        msu_send_status(a1, a2, v14);
      }

      else
      {
        CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Could not create CFNumber from %llu",  v11,  v12,  v13,  valuePtr);
        msu_send_error(a1, a2, error_internal_cf, 1);
      }
    }

    else
    {
      msu_send_error(a1, a2, error_internal_cf, 1);
      Value = 0LL;
    }

    unsigned int v15 = error_internal_cf;
  }

  else
  {
    unsigned int v15 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No asset properties in request",  v6,  v7,  v8,  v16);
    CFErrorRef error_internal_cf = v15;
    msu_send_error(a1, a2, v15, 1);
    if (v15)
    {
LABEL_10:
      CFRelease(v15);
      CFErrorRef error_internal_cf = 0LL;
    }
  }

  if (Value) {
    CFRelease(Value);
  }
}

void handle_calculate_apply_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t v17 = 0LL;
  uint64_t valuePtr = 0LL;
  CFErrorRef error_internal_cf = 0LL;
  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"AssetProperties");
  if (Value)
  {
    if ((MSUAssetCalculateApplySizes_server(Value, &valuePtr, &v17, &error_internal_cf) & 1) != 0)
    {
      CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
      if (v12)
      {
        id v13 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        [v13 setObject:v12 forKeyedSubscript:@"Size"];
        objc_msgSend( v13,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17),  @"SnapshotSize");
        msu_send_status(a1, a2, v13);
      }

      else
      {
        CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Could not create CFNumber from %llu",  v9,  v10,  v11,  valuePtr);
        msu_send_error(a1, a2, error_internal_cf, 1);
      }
    }

    else
    {
      msu_send_error(a1, a2, error_internal_cf, 1);
      CFNumberRef v12 = 0LL;
    }

    id v14 = error_internal_cf;
  }

  else
  {
    id v14 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No asset properties in request",  v6,  v7,  v8,  v15);
    CFErrorRef error_internal_cf = v14;
    msu_send_error(a1, a2, v14, 1);
    CFNumberRef v12 = 0LL;
    if (v14)
    {
LABEL_10:
      CFRelease(v14);
      CFErrorRef error_internal_cf = 0LL;
    }
  }

  if (v12) {
    CFRelease(v12);
  }
}

id handle_ma_load_brain(void *a1, void *a2, CFDictionaryRef theDict)
{
  Value = CFDictionaryGetValue(theDict, @"AssetProperties");
  ObjectFromMessage = getObjectFromMessage(a2);
  id v13 = ObjectFromMessage;
  if (ObjectFromMessage)
  {
    if ((objc_opt_respondsToSelector(ObjectFromMessage, "objectForKey:") & 1) != 0)
    {
      id v13 = (NSData *)-[NSData objectForKey:](v13, "objectForKey:", @"DownloadOptions");
      logfunction("", 1, @"Caller has pased in downloadOptions: %@\n", v14, v15, v16, v17, v18, (char)v13);
    }

    else
    {
      id v13 = 0LL;
    }
  }

  logfunction("", 1, @"The attributes are: %@\n", v8, v9, v10, v11, v12, (char)Value);
  id v19 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  Value);
  xpc_retain(a1);
  xpc_retain(a2);
  uint64_t v20 = os_transaction_create("com.apple.MobileSoftwareUpdate.handle_ma_load_brain.1");
  if (v13)
  {
    uint64_t v21 = v13;
  }

  else
  {
    id v13 = (NSData *)objc_opt_new(&OBJC_CLASS___MADownloadOptions);
    -[NSData setDiscretionary:](v13, "setDiscretionary:", 0LL);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __handle_ma_load_brain_block_invoke;
  v23[3] = &unk_100059A90;
  void v23[4] = v19;
  v23[5] = theDict;
  v23[6] = Value;
  v23[7] = a1;
  v23[8] = a2;
  v23[9] = v20;
  v23[10] = v13;
  return -[MSUUpdateBrainLocator installMAUpdateBrain:handler:](v19, "installMAUpdateBrain:handler:", v13, v23);
}

void handle_cancel_load_brain(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  Value = CFDictionaryGetValue(theDict, @"AssetProperties");
  if (Value)
  {
    uint64_t v16 = 0LL;
    if (-[MSUUpdateBrainLocator cancelInstall:]( +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  Value),  "cancelInstall:",  &v16))
    {
      msu_send_status(a1, a2, 0LL);
    }

    else
    {
      logfunction("", 1, @"Failed to cancel update brain: %@\n", v9, v10, v11, v12, v13, (char)v16);
      msu_send_error(a1, a2, v16, 1);
    }
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No asset attributes in request",  v6,  v7,  v8,  v15);
    msu_send_error(a1, a2, error_internal_cf, 1);
    CFRelease(error_internal_cf);
  }

void handle_adjust_load_brain_options(void *a1, void *a2, CFDictionaryRef theDict)
{
  if (CFDictionaryGetValue(theDict, @"AssetProperties"))
  {
    xpc_retain(a1);
    xpc_retain(a2);
    id v10 = (id)os_transaction_create("com.apple.MobileSoftwareUpdate.handle_adjust_load_brain_options");
    msu_send_status((_xpc_connection_s *)a1, a2, 0LL);
    xpc_release(a1);
    xpc_release(a2);
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No asset attributes in request",  v5,  v6,  v7,  v9);
    msu_send_error((_xpc_connection_s *)a1, a2, error_internal_cf, 1);
    CFRelease(error_internal_cf);
  }

void handle_ma_adjust_load_brain_options( void *a1, void *a2, const __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  Value = CFDictionaryGetValue(a3, @"AssetProperties");
  ObjectFromMessage = getObjectFromMessage(a2);
  if (ObjectFromMessage)
  {
    uint64_t v18 = ObjectFromMessage;
    logfunction("", 1, @"The secure encoded object is: %@\n", v13, v14, v15, v16, v17, (char)ObjectFromMessage);
    if ((objc_opt_respondsToSelector(v18, "objectForKey:") & 1) != 0)
    {
      id v19 = -[NSData objectForKey:](v18, "objectForKey:", @"DownloadConfig");
      if (Value)
      {
        id v20 = v19;
        if (v19)
        {
          uint64_t v21 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  Value);
          xpc_retain(a1);
          xpc_retain(a2);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = __handle_ma_adjust_load_brain_options_block_invoke;
          v26[3] = &unk_100059AB8;
          v26[4] = a1;
          v26[5] = a2;
          v26[6] = os_transaction_create("com.apple.MobileSoftwareUpdate.handle_ma_adjust_load_brain_options");
          -[MSUUpdateBrainLocator adjustMADownloadOptions:callback:](v21, "adjustMADownloadOptions:callback:", v20, v26);
          return;
        }
      }
    }

    unsigned int v22 = @"No asset attributes or config in request";
  }

  else
  {
    unsigned int v22 = @"No secure encoded object in request";
  }

  CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  v22,  v15,  v16,  v17,  v25);
  msu_send_error((_xpc_connection_s *)a1, a2, error_internal_cf, 1);
  CFRelease(error_internal_cf);
}

void handle_purge_update_brains(_xpc_connection_s *a1, void *a2)
{
  char v9 = 0LL;
  -[MSUUpdateBrainLocator purgeInstalledUpdateBrains:]( +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  0LL),  "purgeInstalledUpdateBrains:",  &v9);
  if (v9)
  {
    logfunction("", 1, @"Failed to purge update brains: %@\n", v4, v5, v6, v7, v8, (char)v9);
    msu_send_error(a1, a2, v9, 0);
  }

  else
  {
    msu_send_status(a1, a2, 0LL);
  }

uint64_t handle_mark_self_dirty(int a1, xpc_object_t xdict)
{
  if (handle_mark_self_dirty_arrayOnce != -1) {
    dispatch_once(&handle_mark_self_dirty_arrayOnce, &__block_literal_global_270);
  }
  BOOL v3 = xpc_dictionary_get_BOOL(xdict, "IsDirty");
  uint64_t v4 = (void *)handle_mark_self_dirty_outstandingJobs;
  objc_sync_enter((id)handle_mark_self_dirty_outstandingJobs);
  if (v3)
  {
    [(id)handle_mark_self_dirty_outstandingJobs addObject:os_transaction_create("com.apple.MobileSoftwareUpdate.handle_mark_self_dirty")];
  }

  else if ([(id)handle_mark_self_dirty_outstandingJobs count])
  {

    [(id)handle_mark_self_dirty_outstandingJobs removeLastObject];
  }

  return objc_sync_exit(v4);
}

void sub_100011390(_Unwind_Exception *a1)
{
}

id handle_required_disk_space(void *a1, void *a2, CFDictionaryRef theDict)
{
  if (theDict) {
    theDict = (CFDictionaryRef)CFDictionaryGetValue(theDict, @"AssetProperties");
  }
  uint64_t v5 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  theDict);
  xpc_retain(a1);
  xpc_retain(a2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __handle_required_disk_space_block_invoke;
  v7[3] = &unk_100059B00;
  void v7[4] = a1;
  v7[5] = a2;
  v7[6] = os_transaction_create("com.apple.MobileSoftwareUpdate.handle_required_disk_space.1");
  return -[MSUUpdateBrainLocator requiredDiskSpace:](v5, "requiredDiskSpace:", v7);
}

void handle_reboot_to_nerd_call(_xpc_connection_s *a1, void *a2)
{
  uint64_t v12 = 0LL;
  int v4 = saveCurrentEnvInfoForNeRD(0LL);
  id v10 = @"Failed to save";
  if (v4) {
    id v10 = @"Successfully saved";
  }
  logfunction("", 1, @"%@ booted os state for NeRD\n", v5, v6, v7, v8, v9, (char)v10);
  else {
    uint64_t v11 = kCFNull;
  }
  msu_send_status(a1, a2, v11);
}

void handle_check_preparation_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t valuePtr = 0LL;
  uint64_t v23 = 0LL;
  CFTypeRef cf = 0LL;
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"ClientOptions");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
    MSUCheckPreparationSize_server(valuePtr, &v23, &cf);
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      CFNumberRef v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v23);
      if (v16)
      {
        CFDictionarySetValue(Mutable, @"RequiredSize", v16);
        if (cf)
        {
          CFTypeID TypeID = CFErrorGetTypeID();
          if (TypeID == CFGetTypeID(cf))
          {
            CFDictionaryRef v18 = cferror_to_dictionary((__CFError *)cf);
            CFDictionarySetValue(Mutable, @"ErrorInfo", v18);
            CFRelease(v18);
          }
        }

        msu_send_status(a1, a2, Mutable);
      }

      else
      {
        CFTypeRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Could not create CFNumber from %llu",  v13,  v14,  v15,  v23);
        msu_send_error(a1, a2, (__CFError *)cf, 1);
      }
    }

    else
    {
      CFTypeRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  14LL,  0LL,  0LL,  @"Could not allocate CFMutableDictionary",  v9,  v10,  v11,  v20);
      msu_send_error(a1, a2, (__CFError *)cf, 1);
      CFNumberRef v16 = 0LL;
    }

    CFErrorRef error_internal_cf = (void *)cf;
    if (cf) {
      goto LABEL_13;
    }
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No prep size in request",  v6,  v7,  v8,  v20);
    CFTypeRef cf = error_internal_cf;
    msu_send_error(a1, a2, (__CFError *)error_internal_cf, 1);
    CFNumberRef v16 = 0LL;
    CFMutableStringRef Mutable = 0LL;
    if (error_internal_cf)
    {
LABEL_13:
      CFRelease(error_internal_cf);
      CFTypeRef cf = 0LL;
    }
  }

  if (v16) {
    CFRelease(v16);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void handle_check_installation_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  CFTypeRef cf = 0LL;
  uint64_t valuePtr = 0LL;
  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"AssetProperties");
  if (!Value)
  {
    uint64_t v12 = @"No asset properties in request";
    CFIndex v13 = 9LL;
    CFTypeRef v11 = 0LL;
    goto LABEL_5;
  }

  MSUCheckInstallationSize_server(Value, &valuePtr, (CFErrorRef *)&cf, v6, v7, v8, v9, v10);
  CFTypeRef v11 = cf;
  if (cf)
  {
    uint64_t v12 = @"MSUCheckInstallationSize_server failed";
    CFIndex v13 = 7LL;
LABEL_5:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  v13,  v11,  0LL,  v12,  v8,  v9,  v10,  v23);
    msu_send_error(a1, a2, error_internal_cf, 1);
    CFNumberRef v15 = 0LL;
    CFMutableStringRef Mutable = 0LL;
    goto LABEL_6;
  }

  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
    if (v15)
    {
      CFDictionarySetValue(Mutable, @"RequiredSize", v15);
      msu_send_status(a1, a2, Mutable);
      CFErrorRef error_internal_cf = 0LL;
    }

    else
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Could not create CFNumber from %llu",  v20,  v21,  v22,  valuePtr);
      msu_send_error(a1, a2, error_internal_cf, 1);
    }
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  14LL,  0LL,  0LL,  @"Could not allocate CFMutableDictionary",  v17,  v18,  v19,  v23);
    msu_send_error(a1, a2, error_internal_cf, 1);
    CFNumberRef v15 = 0LL;
  }

void handle_brain_is_loadable( _xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0LL;
  logfunction("", 1, @"Entering handle_brain_is_loadable\n", a4, a5, a6, a7, a8, v35);
  if (brain_is_loaded == 1)
  {
    logfunction("", 1, @"brain has been loaded\n", v10, v11, v12, v13, v14, v36);
    CFNumberRef v15 = 0LL;
LABEL_3:
    msu_send_status(a1, a2, 0LL);
    free(v15);
    return;
  }

  CFNumberRef v15 = (__CFString *)msu_deserialize_cf_object_from_xpc_dict(a2, "UpdateAttributes");
  if (v15)
  {
    uint64_t v21 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  v15);
    CFRelease(v15);
    uint64_t v22 = -[MSUUpdateBrainLocator copyUpdateBrainPath:](v21, "copyUpdateBrainPath:", &cf);
    if (v22)
    {
      CFNumberRef v15 = (__CFString *)v22;
      if (objc_msgSend( objc_msgSend( objc_msgSend((id)cf, "userInfo"),  "objectForKeyedSubscript:",  @"ShouldPurgeBrain"),  "isEqual:",  &__kCFBooleanTrue))
      {
        uint64_t v38 = @"LoadTrustCachePurgedBrain";
        uint64_t v39 = &__kCFBooleanTrue;
        uint64_t v28 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL);
      }

      else
      {
        uint64_t v28 = 0LL;
      }

      error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf( @"MobileSoftwareUpdateErrorDomain",  39LL,  0LL,  0LL,  (const __CFDictionary *)v28,  @"Failed to load update brain trust cache",  v26,  v27,  v36);
    }

    else
    {
      if (cf)
      {
        error_internal_with_userinfo_CFTypeRef cf = (__CFError *)CFRetain(cf);
        logfunction( "",  1,  @"Error locating installed update brain: %@\n",  v30,  v31,  v32,  v33,  v34,  (char)error_internal_with_userinfo_cf);
      }

      else
      {
        error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  28LL,  0LL,  0LL,  @"No update brain is installed",  v23,  v24,  v25,  v36);
      }

      CFNumberRef v15 = 0LL;
    }
  }

  else
  {
    logfunction("", 1, @"failed to get update attributs\n", v16, v17, v18, v19, v20, v36);
    error_internal_with_userinfo_CFTypeRef cf = 0LL;
  }

  msu_send_error(a1, a2, error_internal_with_userinfo_cf, 1);
  free(v15);
}

void handle_retreive_last_update_result(_xpc_connection_s *a1, void *a2)
{
  int v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = @"handle_retreive_last_update_result";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v9, 0xCu);
  }

  updated = MSURetrievePreviousUpdateResults_server();
  uint64_t v6 = updated;
  if (updated) {
    uint64_t v7 = cferror_to_dictionary(updated);
  }
  else {
    uint64_t v7 = kCFNull;
  }
  msu_send_status(a1, a2, v7);
  if (v7) {
    CFRelease(v7);
  }
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = @"handle_retreive_last_update_result";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v9, 0xCu);
  }

void handle_retreive_previous_update_state(_xpc_connection_s *a1, void *a2)
{
  int v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = @"handle_retreive_previous_update_state";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }

  unsigned int valuePtr = retrieve_previous_update_state();
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v5) {
    CFNullRef v6 = v5;
  }
  else {
    CFNullRef v6 = kCFNull;
  }
  msu_send_status(a1, a2, v6);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = @"handle_retreive_previous_update_state";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", buf, 0xCu);
  }

void handle_is_first_boot_after_update(_xpc_connection_s *a1, void *a2)
{
  int v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = @"handle_is_first_boot_after_update";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }

  BOOL boot_after_update = is_first_boot_after_update();
  CFNullRef v6 = (void **)&kCFBooleanTrue;
  if (!boot_after_update) {
    CFNullRef v6 = (void **)&kCFBooleanFalse;
  }
  msu_send_status(a1, a2, *v6);
  uint64_t v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = @"handle_is_first_boot_after_update";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v8, 0xCu);
  }

void handle_retrieve_previous_update_date(_xpc_connection_s *a1, void *a2)
{
  int v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = @"handle_retrieve_previous_update_date";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }

  previous_update_date = (const __CFNull *)retrieve_previous_update_date();
  if (previous_update_date) {
    CFNullRef v6 = previous_update_date;
  }
  else {
    CFNullRef v6 = kCFNull;
  }
  msu_send_status(a1, a2, v6);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = @"handle_retrieve_previous_update_date";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v8, 0xCu);
  }

void handle_get_stashed_connectivity_data_command(_xpc_connection_s *a1, void *a2)
{
  int v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }

  CFNumberRef v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s/%s/%s",  "/private/var/MobileSoftwareUpdate/",  "Controller/NeRD",  "ConnectivityData.plist");
  CFTypeRef cf = 0LL;
  CFNullRef v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_1(v7, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_17;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = @"handle_get_stashed_connectivity_data_command";
    __int16 v50 = 2112;
    uint64_t v51 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[HANDLER] %@ | Attempting to load connectivity data from %@",  buf,  0x16u);
  }

  int v8 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v5);
  if (!v8)
  {
    uint64_t v30 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
    }
LABEL_17:
    int v9 = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_18;
  }

  int v9 = v8;
  uint64_t v10 = (const __CFData *)-[NSDictionary objectForKey:](v8, "objectForKey:", @"BootedOSEncryptedWiFiData");
  if (!v10)
  {
LABEL_18:
    uint64_t v12 = 0LL;
    goto LABEL_19;
  }

  if ((NRDCryptoDecrypt(v10, (CFDataRef *)&cf) & 1) == 0)
  {
    uint64_t v39 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_5(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    int v9 = 0LL;
    goto LABEL_18;
  }

  *(void *)buf = 0LL;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
  uint64_t v12 = -[NSKeyedUnarchiver initForReadingFromData:error:](v11, "initForReadingFromData:error:", cf, buf);
  if (v12)
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSSet);
    v48[0] = objc_opt_class(&OBJC_CLASS___NSString);
    v48[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v48[2] = objc_opt_class(&OBJC_CLASS___NSData);
    v48[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v14 = -[NSSet initWithArray:]( v13,  "initWithArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 4LL));
    int v9 = (NSDictionary *) -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v12,  "decodeObjectOfClasses:forKey:",  v14,  NSKeyedArchiveRootObjectKey);

    if (v9) {
      goto LABEL_19;
    }
    CFNumberRef v15 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  else
  {
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      handle_get_stashed_connectivity_data_command_cold_3();
    }
  }

  int v9 = 0LL;
LABEL_19:
  msu_send_status(a1, a2, v9);

  if (cf) {
    CFRelease(cf);
  }
  uint64_t v38 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", buf, 0xCu);
  }

void handle_retrieve_previous_restore_date(_xpc_connection_s *a1, void *a2)
{
  int v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = @"handle_retrieve_previous_restore_date";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }

  previous_restore_date = (const __CFNull *)retrieve_previous_restore_date();
  if (previous_restore_date) {
    CFNullRef v6 = previous_restore_date;
  }
  else {
    CFNullRef v6 = kCFNull;
  }
  msu_send_status(a1, a2, v6);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = @"handle_retrieve_previous_restore_date";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v8, 0xCu);
  }

void handle_perform_report_and_cleanup_command(_xpc_connection_s *a1, void *a2)
{
  CFTypeRef cf = 0LL;
  int v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = @"handle_perform_report_and_cleanup_command";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }

  handle_update_metrics();
  if ((perform_cleanup_staged_assets_command(0, 0LL, (const __CFString **)&cf) & 1) != 0)
  {
    CFBooleanRef v5 = kCFBooleanTrue;
    CFNullRef v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = @"handle_perform_report_and_cleanup_command";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[HANDLER] %@ | SUCCESS | Completed cleanup command on behalf of client",  buf,  0xCu);
    }
  }

  else
  {
    CFBooleanRef v5 = kCFBooleanFalse;
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      handle_perform_report_and_cleanup_command_cold_2();
    }
  }

  msu_send_status(a1, a2, v5);
  uint64_t v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    handle_perform_report_and_cleanup_command_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void handle_get_update_information_command(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFNullRef v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v12, 0xCu);
  }

  id v7 = +[MSUSupport sharedSupport](&OBJC_CLASS___MSUSupport, "sharedSupport");
  id v8 = [a3 objectForKey:@"TargetUUID"];
  id v9 = objc_msgSend(v7, "MSUSupportGetUpdateInfo:for:", v8, objc_msgSend(a3, "objectForKey:", @"AssetProperties"));
  if (!v9)
  {
    uint64_t v10 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = @"handle_get_stashed_connectivity_data_command";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[HANDLER] %@ | getUpdateInfo didn't get any update information, assuming no update process on going for targetUUID %@",  (uint8_t *)&v12,  0x16u);
    }
  }

  msu_send_status(a1, a2, v9);
  uint64_t v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v12, 0xCu);
  }

void handle_perform_cryptegraft_semisplat(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFTypeRef cf = 0LL;
  CFNullRef v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = @"handle_perform_cryptegraft_semisplat";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }

  id v7 = [a3 objectForKey:@"TargetVolume"];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
      id v7 = v8;
    }
    else {
      id v7 = 0LL;
    }
  }

  char v10 = performCryptegraftSemiSplat(v7, (const __CFString **)&cf);
  uint64_t v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  int v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = @"handle_perform_cryptegraft_semisplat";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[HANDLER] %@ | SUCCESS | Completed cryptegraft semi-splat command on behalf of client",  buf,  0xCu);
    }

    msu_send_status(a1, a2, kCFBooleanTrue);
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      handle_perform_cryptegraft_semisplat_cold_2();
    }
    msu_send_error(a1, a2, (__CFError *)cf, 0);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }
  }

  uint64_t v13 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    handle_perform_cryptegraft_semisplat_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

void handle_perform_cryptegraft_downlevel(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFTypeRef cf = 0LL;
  CFNullRef v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = @"handle_perform_cryptegraft_downlevel";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }

  id v7 = [a3 objectForKey:@"TargetVolume"];
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0) {
      id v7 = 0LL;
    }
  }

  id v9 = [a3 objectForKey:@"SourcePath"];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSURL);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      int v12 = v10;
    }
    else {
      int v12 = 0LL;
    }
  }

  else
  {
    int v12 = 0LL;
  }

  char v13 = performCryptegraftDownlevel(v7, v12, (const __CFString **)&cf);
  uint64_t v14 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v15 = v14;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = @"handle_perform_cryptegraft_downlevel";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[HANDLER] %@ | SUCCESS | Completed cryptegraft downlevel command on behalf of client",  buf,  0xCu);
    }

    msu_send_status(a1, a2, kCFBooleanTrue);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      handle_perform_cryptegraft_downlevel_cold_2();
    }
    msu_send_error(a1, a2, (__CFError *)cf, 0);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }
  }

  uint64_t v16 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    handle_perform_cryptegraft_downlevel_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
  }
}

void handle_perform_rv_nerd_update( _xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v10 = +[MSUNRDUpdateBrainController sharedInstance](&OBJC_CLASS___MSUNRDUpdateBrainController, "sharedInstance");
  char v11 = -[MSUNRDUpdateBrainController status](v10, "status");
  logfunction("", 1, @"[RV] NeRD update status: %@\n", v12, v13, v14, v15, v16, v11);
  -[MSUNRDUpdateBrainController startForMSUUpdate:withMSUBrainVersion:withOptions:]( v10,  "startForMSUUpdate:withMSUBrainVersion:withOptions:",  &__NSDictionary0__struct,  0LL,  &off_100063C78);
  logfunction("", 1, @"[RV] NeRD update started\n", v17, v18, v19, v20, v21, v23);
  msu_send_status(a1, a2, kCFNull);
  if (kCFNull) {
    CFRelease(kCFNull);
  }
}

void record_brain_load_event(void *a1, uint64_t a2, __CFString *a3)
{
  id v6 = +[UMEventRecorder recorder](&OBJC_CLASS___UMEventRecorder, "recorder");
  if (v6)
  {
    id v7 = v6;
    id v8 = [a1 objectForKeyedSubscript:@"ClientOptions"];
    [v7 startRecordingInstall:a2];
    if (v8) {
      id v9 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  [v8 objectForKeyedSubscript:@"EventStats"]);
    }
    else {
      id v9 = (NSMutableDictionary *)+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    }
    id v10 = v9;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  targetBrainVersion,  @"targetBrainVersion");
    if (a3)
    {
      char v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %ld",  get_short_error_domain(a3),  -[__CFString code](a3, "code"));
      uint64_t v12 = copy_underlying_error_description(a3);
      uint64_t v13 = (id)CFMakeCollectable(v12);
      if (v11) {
        uint64_t v14 = (const __CFString *)v11;
      }
      else {
        uint64_t v14 = @"unknown error";
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, @"result");
      if (v13) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = @"unknown reason";
      }
      uint64_t v16 = @"failureReason";
    }

    else
    {
      uint64_t v15 = @"success";
      uint64_t v16 = @"result";
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, v16);
    [v7 recordEvent:@"brainLoad" information:v10];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __record_brain_load_event_block_invoke;
    block[3] = &unk_1000599E0;
    block[4] = v7;
    void block[5] = v8;
    dispatch_async(global_queue, block);
  }

void __handle_create_update_brain_connection_block_invoke(uint64_t a1)
{
}

void __copy_shared_update_brain_connection_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  __int128 v2 = (void *)copy_shared_update_brain_connection_brain_connection;
  if (!copy_shared_update_brain_connection_brain_connection)
  {
    int v4 = -[MSUUpdateBrainLocator copyUpdateBrainPath:]( +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  *(void *)(a1 + 56)),  "copyUpdateBrainPath:",  &cf);
    if (v4)
    {
      BOOL v3 = v4;
      if ((load_trust_cache((uint64_t)v4, (NSError **)&cf) & 1) != 0)
      {
        bzero(__str, 0x400uLL);
        snprintf(__str, 0x400uLL, "%s/%s.xpc", v3, "com.apple.MobileSoftwareUpdate.UpdateBrainService");
        char v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = __str;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_CONNECTION] Loading update brain bundle at %s",  buf,  0xCu);
        }

        xpc_add_bundle(__str, 2LL);
        copy_shared_update_brain_connection_brain_connection = (uint64_t)xpc_connection_create( "com.apple.MobileSoftwareUpdate.UpdateBrainService",  0LL);
        xpc_connection_set_event_handler( (xpc_connection_t)copy_shared_update_brain_connection_brain_connection,  &__block_literal_global_159);
        xpc_connection_resume((xpc_connection_t)copy_shared_update_brain_connection_brain_connection);
        xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_string(v12, "Command", "PingService");
        Name = protocol_getName( -[MSUBrainDelegateImpl_softwareupdated delegateProtocol]( +[MSUBrainDelegateImpl_softwareupdated sharedInstance]( &OBJC_CLASS___MSUBrainDelegateImpl_softwareupdated,  "sharedInstance"),  "delegateProtocol"));
        uint64_t v14 = protocol_getName( -[MSUBrainDelegateImpl_softwareupdated brainProtocol]( +[MSUBrainDelegateImpl_softwareupdated sharedInstance]( &OBJC_CLASS___MSUBrainDelegateImpl_softwareupdated,  "sharedInstance"),  "brainProtocol"));
        xpc_dictionary_set_string(v12, "MSUBrainDelegateNSXPCInterfaceName", Name);
        xpc_dictionary_set_string(v12, "MSUBrainNSXPCInterfaceName", v14);
        xpc_object_t v15 = xpc_connection_send_message_with_reply_sync( (xpc_connection_t)copy_shared_update_brain_connection_brain_connection,  v12);
        uint64_t v16 = v15;
        p_cache = &OBJC_CLASS___MSULogAnnotatedSum.cache;
        uint64_t v18 = (void *)msubrain;
        if (v15)
        {
          xpc_object_t value = xpc_dictionary_get_value(v15, "MSUBrainEndpoint");
          if (value)
          {
            xpc_object_t v20 = value;
            uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSXPCListenerEndpoint);
            if (v21)
            {
              char v22 = v21;
              uint64_t v33 = v18;
              string = (NSString *)xpc_dictionary_get_string(v16, "MSUBrainVersion");
              uint64_t v24 = (NSString *)xpc_dictionary_get_string(v16, "MSUBrainUUID");
              if (string) {
                string = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string);
              }
              if (v24) {
                uint64_t v24 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v24);
              }
              -[NSXPCListenerEndpoint _setEndpoint:](v22, "_setEndpoint:", v20);
              id v25 = -[MSUBrainClientImpl init:version:endpoint:delgate:]( objc_alloc(&OBJC_CLASS___MSUBrainClientImpl),  "init:version:endpoint:delgate:",  v24,  string,  v22,  +[MSUBrainDelegateImpl_softwareupdated sharedInstance]( &OBJC_CLASS___MSUBrainDelegateImpl_softwareupdated,  "sharedInstance"));
              p_cache = (void **)(&OBJC_CLASS___MSULogAnnotatedSum + 16);
              uint64_t v18 = v33;
              goto LABEL_34;
            }

            NSErrorUserInfoKey v41 = NSDebugDescriptionErrorKey;
            *(void *)buf = @"Could not create NSXPCListenerEndpoint";
            uint64_t v28 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v41,  1LL);
            uint64_t v29 = 1363LL;
          }

          else
          {
            NSErrorUserInfoKey v39 = NSDebugDescriptionErrorKey;
            uint64_t v40 = @"UpdateBrainService did not return MSUBrainInterface endpoint";
            uint64_t v28 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL);
            uint64_t v29 = 1301LL;
          }
        }

        else
        {
          NSErrorUserInfoKey v37 = NSDebugDescriptionErrorKey;
          uint64_t v38 = @"reply message is nil";
          uint64_t v28 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL);
          uint64_t v29 = 1350LL;
        }

        if (+[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  v29,  v28))
        {
          msubrain = 0LL;

          uint64_t v30 = (os_log_s *)msuSharedLogger();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            __copy_shared_update_brain_connection_block_invoke_cold_2();
          }
LABEL_36:
          xpc_release(v12);
          xpc_release(v16);
          brain_is_loaded = 1;
          __int128 v2 = (void *)copy_shared_update_brain_connection_brain_connection;
          if (!copy_shared_update_brain_connection_brain_connection) {
            goto LABEL_25;
          }
          goto LABEL_3;
        }

        id v25 = 0LL;
LABEL_34:
        p_cache[437] = v25;

        uint64_t v31 = (os_log_s *)msuSharedLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Successfully copied MSUBrain endpoint from ping reply",  buf,  2u);
        }

        goto LABEL_36;
      }

      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  39LL,  cf,  0LL,  @"Failed to load update brain trust cache",  v8,  v9,  v10,  v32);
      uint64_t v27 = *(void **)(a1 + 64);
      if (!v27)
      {
        CFRelease(error_internal_cf);
        goto LABEL_25;
      }
    }

    else if (cf)
    {
      if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
      {
        __copy_shared_update_brain_connection_block_invoke_cold_1();
      }

      CFErrorRef error_internal_cf = CFRetain(cf);
      BOOL v3 = 0LL;
      uint64_t v27 = *(void **)(a1 + 64);
    }

    else
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  28LL,  0LL,  0LL,  @"No update brain is installed",  v5,  v6,  v7,  v32);
      uint64_t v27 = *(void **)(a1 + 64);
      if (!v27)
      {
        CFRelease(error_internal_cf);
        BOOL v3 = 0LL;
        goto LABEL_25;
      }

      BOOL v3 = 0LL;
    }

    void *v27 = error_internal_cf;
    goto LABEL_25;
  }

  BOOL v3 = 0LL;
LABEL_3:
  xpc_retain(v2);
LABEL_25:
  free(v3);
}

uint64_t load_trust_cache(uint64_t a1, NSError **a2)
{
  uint64_t trust_cache_at_path = load_trust_cache_at_path( -[NSString fileSystemRepresentation]( -[NSString stringByAppendingPathComponent:]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1),  "stringByAppendingPathComponent:",  @".TrustCache"),  "fileSystemRepresentation"),  a2);
  if (a2)
  {
    if (*a2)
    {
      if (-[NSDictionary objectForKeyedSubscript:]( -[NSError userInfo](*a2, "userInfo"),  "objectForKeyedSubscript:",  @"ShouldPurgeBrain"))
      {
        if (objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( -[NSError userInfo](*a2, "userInfo"),  "objectForKeyedSubscript:",  @"ShouldPurgeBrain"),  "isEqual:",  &__kCFBooleanTrue))
        {
          logfunction( "",  1,  @"Load TrustCache failed with: %@, attempting to purge update brains\n",  v4,  v5,  v6,  v7,  v8,  (char)*a2);
          uint64_t v15 = 0LL;
          -[MSUUpdateBrainLocator purgeInstalledUpdateBrains:]( +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:]( &OBJC_CLASS___MSUUpdateBrainLocator,  "brainLocatorWithUpdateAttributes:",  0LL),  "purgeInstalledUpdateBrains:",  &v15);
          if (v15) {
            logfunction("", 1, @"Failed to purge update brains: %@\n", v9, v10, v11, v12, v13, v15);
          }
        }
      }
    }
  }

  return trust_cache_at_path;
}

void __copy_shared_update_brain_connection_block_invoke_158(id a1, OS_xpc_object *a2)
{
  BOOL v3 = xpc_copy_description(a2);
  uint64_t v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_CONNECTION] Update brain connection handler | %s",  (uint8_t *)&v6,  0xCu);
  }

  free(v3);
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error && copy_shared_update_brain_connection_brain_connection != 0)
  {
    xpc_release((xpc_object_t)copy_shared_update_brain_connection_brain_connection);
    copy_shared_update_brain_connection_brain_connection = 0LL;
  }

void __get_softwareupdated_queue_block_invoke(id a1)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v5 = 0u;
  __int128 v6 = 0u;
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v2 = 0u;
  snprintf(__str, 0x100uLL, "%s.queue", "com.apple.mobile.softwareupdated");
  get_softwareupdated_queue_queue = (uint64_t)dispatch_queue_create(__str, 0LL);
}

id __record_brain_load_event_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) submitEventsWithUpdateOptions:*(void *)(a1 + 40)];
}

id __handle_purge_suspended_update_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopRecordingInstall];
}

NSData *getObjectFromMessage(void *a1)
{
  size_t length = (unint64_t)xpc_dictionary_get_double( a1,  (const char *)objc_msgSend( objc_msgSend( @"SecureEncodedObjects",  "stringByAppendingString:",  @"Length"),  "UTF8String"));
  logfunction("", 1, @"The secure object length value is: %ld\n", v2, v3, v4, v5, v6, length);
  if (!length) {
    return 0LL;
  }
  data = xpc_dictionary_get_data(a1, (const char *)[@"SecureEncodedObjects" UTF8String], &length);
  if (!data)
  {
    char v22 = [@"SecureEncodedObjects" UTF8String];
    logfunction("", 1, @"nil bytes from xpc message for key %s\n", v23, v24, v25, v26, v27, v22);
    return 0LL;
  }

  __int128 v13 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data, length);
  if (!v13)
  {
    uint64_t v21 = @"nil data from xpc message\n";
    goto LABEL_11;
  }

  uint64_t v30 = 0LL;
  __int128 v14 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v13,  &v30);
  __int128 v13 = (NSData *)-[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v14,  "decodeObjectOfClasses:forKey:",  _decodeClasses,  NSKeyedArchiveRootObjectKey);
  if (-[NSKeyedUnarchiver error](v14, "error"))
  {
    char v15 = -[NSKeyedUnarchiver error](v14, "error");
    logfunction( "",  1,  @"Error while decoding archived object from xpc message: %@\n",  v16,  v17,  v18,  v19,  v20,  v15);
  }

  -[NSKeyedUnarchiver finishDecoding](v14, "finishDecoding");

  if (!v13)
  {
    uint64_t v21 = @"decoded object from xpc message\n";
LABEL_11:
    logfunction("", 1, v21, v8, v9, v10, v11, v12, v29);
  }

  return v13;
}

void __handle_ma_load_brain_block_invoke( uint64_t a1, void *a2, __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a4 & 1) == 0)
  {
    id v11 = [*(id *)(a1 + 32) brainVersion];
    logfunction("", 1, @"Setting targetBrainVersion to %@\n", v12, v13, v14, v15, v16, (char)v11);

    targetBrainVersion = (uint64_t)[v11 copy];
  }

  if (a3)
  {
    logfunction("", 1, @"Failed to install update brain: %@\n", a4, a5, a6, a7, a8, (char)a3);
    record_brain_load_event(*(void **)(a1 + 40), *(void *)(a1 + 48), a3);
    msu_send_error(*(_xpc_connection_s **)(a1 + 56), 0LL, (__CFError *)a3, 1);
  }

  else if (a2 && [a2 objectForKey:@"CommitSelfDestruct"])
  {
    if (get_softwareupdated_queue_queue_once != -1) {
      dispatch_once(&get_softwareupdated_queue_queue_once, &__block_literal_global_165);
    }
    dispatch_sync((dispatch_queue_t)get_softwareupdated_queue_queue, &__block_literal_global_231);
    msu_send_progress(*(_xpc_connection_s **)(a1 + 56), a2);
  }

  logfunction("", 1, @"Sending load complete without error\n", a4, a5, a6, a7, a8, v17);
  msu_send_status(*(_xpc_connection_s **)(a1 + 56), 0LL, 0LL);
  xpc_release(*(xpc_object_t *)(a1 + 56));
  xpc_release(*(xpc_object_t *)(a1 + 64));
}

void __handle_ma_load_brain_block_invoke_2(id a1)
{
  if (brain_is_loaded == 1)
  {
    id v1 = dispatch_group_create();
    peer_connections_queue = (dispatch_queue_s *)get_peer_connections_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __perform_self_destruct_block_invoke;
    block[3] = &unk_100059968;
    block[4] = v1;
    dispatch_sync(peer_connections_queue, block);
    dispatch_group_wait(v1, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v1);
    exit(0);
  }

id __perform_self_destruct_block_invoke(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  if (get_peer_connections_array_peer_connections_array_once != -1) {
    dispatch_once(&get_peer_connections_array_peer_connections_array_once, &__block_literal_global_345);
  }
  id result = objc_msgSend( (id)get_peer_connections_array_peer_connections_array,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16,  get_peer_connections_array_peer_connections_array);
  if (result)
  {
    id v3 = result;
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(_xpc_connection_s **)(*((void *)&v10 + 1) + 8LL * (void)v5);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_string(v7, "Command", "ResendMessage");
        xpc_connection_send_message(v6, v7);
        xpc_release(v7);
        barrier[0] = _NSConcreteStackBlock;
        barrier[1] = 3221225472LL;
        barrier[2] = __perform_self_destruct_block_invoke_2;
        barrier[3] = &unk_100059968;
        barrier[4] = *(void *)(a1 + 32);
        xpc_connection_send_barrier(v6, barrier);
        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id result = [obj countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v3 = result;
    }

    while (result);
  }

  return result;
}

void __perform_self_destruct_block_invoke_2(uint64_t a1)
{
}

void __handle_ma_adjust_load_brain_options_block_invoke( uint64_t a1, __CFError *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    logfunction("", 1, @"Failed to adjust brain madownload config: %@\n", a4, a5, a6, a7, a8, (char)a2);
    msu_send_error(*(_xpc_connection_s **)(a1 + 32), *(xpc_object_t *)(a1 + 40), a2, 1);
  }

  else
  {
    msu_send_status(*(_xpc_connection_s **)(a1 + 32), *(void **)(a1 + 40), 0LL);
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void __handle_mark_self_dirty_block_invoke(id a1)
{
  handle_mark_self_dirty_outstandingJobs = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

void __handle_required_disk_space_block_invoke( uint64_t a1, void *a2, __CFError *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    msu_send_status(*(_xpc_connection_s **)(a1 + 32), *(void **)(a1 + 40), a2);
  }

  else
  {
    logfunction("", 1, @"Failed to compute required disk space: %@\n", a4, a5, a6, a7, a8, (char)a3);
    msu_send_error(*(_xpc_connection_s **)(a1 + 32), *(xpc_object_t *)(a1 + 40), a3, 1);
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void __get_peer_connections_queue_block_invoke(id a1)
{
  get_peer_connections_queue_peer_connections_queue = (uint64_t)dispatch_queue_create( "com.apple.mobile.softwareupdated.peer_connections",  0LL);
}

void __get_peer_connections_array_block_invoke(id a1)
{
  get_peer_connections_array_peer_connections_array = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_5_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void OUTLINED_FUNCTION_7_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

int *logfunctionv(const char *a1, int a2, const __CFString *a3, va_list a4)
{
  int v8 = *__error();
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = "";
  }
  if (logfunctionv_onceToken != -1) {
    dispatch_once(&logfunctionv_onceToken, &__block_literal_global_7);
  }
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a3, a4);
  pthread_t v11 = pthread_self();
  __int128 v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%08llx %s: %@", v11, v9, v10);
  CFRelease(v10);
  if (v12)
  {
    __int128 v13 = __dst;
    if (CFStringGetCString(v12, __dst, 1024LL, 0x8000100u))
    {
      uint64_t v14 = 0LL;
    }

    else
    {
      CFIndex Length = CFStringGetLength(v12);
      CFIndex v17 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      uint64_t v14 = (char *)malloc(v17);
      CFStringGetCString(v12, v14, v17, 0x8000100u);
      __int128 v13 = v14;
    }

    size_t v15 = strlen(v13);
    CFRelease(v12);
  }

  else
  {
    uint64_t v14 = 0LL;
    __int128 v13 = 0LL;
    size_t v15 = 0LL;
  }

  uint64_t v18 = (os_log_s *)logfunctionv_logObject;
  if (logfunctionv_logObject
    || (uint64_t v18 = os_log_create("com.apple.MobileSoftwareUpdate", "Info"), (logfunctionv_logObject = (uint64_t)v18) != 0))
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }

  if (console_fd != -1) {
    write(console_fd, v13, v15);
  }
  if (a2)
  {
    openRestoreLogFile(0);
    writeToRestoreLogFile(v13, v15);
  }

  fprintf(__stderrp, "%s: %s", v9, v13);
  free(v14);
  id result = __error();
  *id result = v8;
  return result;
}

void __logfunctionv_block_invoke(id a1)
{
  if (getenv("__OSINSTALL_ENVIRONMENT")) {
    console_fd = open("/dev/console", 131082);
  }
}

int *logfunction( const char *a1, int a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return logfunctionv(a1, a2, a3, &a9);
}

uint64_t CryptoPerformEncryptDecrypt(const __CFData *a1, CFDataRef *a2, int a3)
{
  kern_return_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  io_connect_t v27;
  size_t v28;
  const UInt8 *BytePtr;
  unsigned int *v30;
  unsigned int *v31;
  const UInt8 *v32;
  unsigned int *v33;
  UInt8 *v34;
  UInt8 *v35;
  UInt8 *v36;
  UInt8 *v37;
  kern_return_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CFStringRef v44;
  uint64_t v45;
  CFAllocatorRef v46;
  const UInt8 *v47;
  unint64_t v48;
  CFDataRef v49;
  char v51;
  size_t outputStructCnt;
  io_connect_t connect[2];
  UInt8 *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  __int128 v60;
  __int128 v61;
  int v62;
  uint64_t v63;
  CFIndex Length = CFDataGetLength(a1);
  connect[0] = 0;
  CFMutableDictionaryRef v7 = IOServiceMatching("IOAESAccelerator");
  if (!v7)
  {
    logfunction( "",  1,  @"Could not allocate matching dict for kIOAESAcceleratorClass\n",  v8,  v9,  v10,  v11,  v12,  v51);
    return 0LL;
  }

  __int128 v13 = v7;
  CFRetain(v7);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v13);
  if (!MatchingService)
  {
    logfunction("", 1, @"Could not find kIOAESAcceleratorClass\n", v15, v16, v17, v18, v19, v51);
    CFRelease(v13);
    return 0LL;
  }

  io_object_t v20 = MatchingService;
  uint64_t v21 = IOServiceOpen(MatchingService, mach_task_self_, 0, connect);
  if (v21) {
    logfunction("", 1, @"Return %d trying to open kIOAESAcceleratorClass\n", v22, v23, v24, v25, v26, v21);
  }
  CFRelease(v13);
  IOObjectRelease(v20);
  uint64_t v27 = connect[0];
  if (!connect[0]) {
    return 0LL;
  }
  uint64_t v28 = (int)Length;
  if (a3)
  {
    if (Length << 32)
    {
      BytePtr = CFDataGetBytePtr(a1);
      uint64_t v30 = (unsigned int *)CryptoBufferAllocate(((int)Length + 19LL) & 0xFFFFFFFFFFFFFFF0LL);
      if (v30)
      {
        uint64_t v31 = v30;
        os_log_s *v30 = Length;
        memcpy(v30 + 1, BytePtr, (int)Length);
        uint64_t v28 = ((int)Length + 19LL) & 0xFFFFFFFFFFFFFFF0LL;
        goto LABEL_13;
      }
    }

    goto LABEL_24;
  }

  if (Length < 5uLL
    || (char v32 = CFDataGetBytePtr(a1), (v33 = (unsigned int *)CryptoBufferAllocate(v28)) == 0LL))
  {
LABEL_24:
    IOServiceClose(v27);
    return 0LL;
  }

  uint64_t v31 = v33;
  memcpy(v33, v32, v28);
LABEL_13:
  uint64_t v34 = (UInt8 *)CryptoBufferAllocate(v28);
  uint64_t v35 = v34;
  if (!v34)
  {
LABEL_23:
    uint64_t v45 = 0LL;
    goto LABEL_32;
  }

  char v63 = 0LL;
  outputStructCnt = 88LL;
  if (a3) {
    uint64_t v36 = (UInt8 *)v31;
  }
  else {
    uint64_t v36 = v34;
  }
  if (a3) {
    NSErrorUserInfoKey v37 = v34;
  }
  else {
    NSErrorUserInfoKey v37 = (UInt8 *)v31;
  }
  *(void *)connect = v36;
  size_t v54 = v37;
  size_t v55 = v28;
  id v57 = 0LL;
  id v56 = 0LL;
  BOOL v58 = a3 ^ 1;
  BOOL v59 = 128;
  __int16 v60 = 0u;
  uint64_t v61 = 0u;
  __int16 v62 = 2108;
  uint64_t v38 = IOConnectCallStructMethod(v27, 1u, connect, 0x58uLL, connect, &outputStructCnt);
  if (v38)
  {
    uint64_t v51 = v38;
    uint64_t v44 = @"perform aes => %d\n";
LABEL_22:
    logfunction("", 1, v44, v39, v40, v41, v42, v43, v51);
    goto LABEL_23;
  }

  if (a3)
  {
    uint64_t v46 = kCFAllocatorDefault;
    unsigned int v47 = v35;
    uint64_t v48 = v28;
  }

  else
  {
    uint64_t v48 = *(unsigned int *)v35;
    if (v28 - 4 < v48) {
      goto LABEL_23;
    }
    uint64_t v46 = kCFAllocatorDefault;
    unsigned int v47 = v35 + 4;
  }

  BOOL v49 = CFDataCreate(v46, v47, v48);
  *a2 = v49;
  if (!v49)
  {
    uint64_t v44 = @"Unable to allocate return crypto CFData\n";
    goto LABEL_22;
  }

  uint64_t v45 = 1LL;
LABEL_32:
  IOServiceClose(v27);
  free(v31);
  if (v35) {
    free(v35);
  }
  return v45;
}

uint64_t NRDCryptoDecrypt(const __CFData *a1, CFDataRef *a2)
{
  return CryptoPerformEncryptDecrypt(a1, a2, 0);
}

void *CryptoBufferAllocate(size_t __size)
{
  __memptr = 0LL;
  if (posix_memalign(&__memptr, 0x10uLL, __size)) {
    logfunction("", 1, @"Failed to allocate aligned crypto buffer\n\n", v2, v3, v4, v5, v6, v8);
  }
  else {
    bzero(__memptr, __size);
  }
  return __memptr;
}

void log_xpc_event(char a1, xpc_object_t object)
{
  char v8 = xpc_copy_description(object);
  logfunction("", 1, @"%s: %s\n", v3, v4, v5, v6, v7, a1);
  free(v8);
}

void msu_process_dictionary_values_for_xpc_serialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_for_xpc_serialization(a2);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }

    CFRelease(v6);
  }

CFDictionaryRef msu_process_cf_object_for_xpc_serialization(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0LL;
        CFMutableDictionaryRef MutableCopy = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v8 = msu_process_cf_object_for_xpc_serialization(ValueAtIndex);
          if (v8)
          {
            uint64_t v9 = (const void *)v8;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v9);
            CFRelease(v9);
          }

          ++v6;
        }

        while (v5 != v6);
        return MutableCopy;
      }
    }

    else if (v2 == CFErrorGetTypeID())
    {
      return cferror_to_dictionary_embedded((__CFError *)a1, 1);
    }

    return 0LL;
  }

  context = 0LL;
  CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)msu_process_dictionary_values_for_xpc_serialization,  &context);
  if (!context) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return MutableCopy;
}

void msu_merge_dictionary_values(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void msu_serialize_cf_object_into_xpc_dict( void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    CFDictionaryRef v11 = msu_process_cf_object_for_xpc_serialization(a3);
    if (v11)
    {
      CFDictionaryRef v12 = v11;
      __int128 v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(v11);
      CFRelease(v12);
      if (v13)
      {
LABEL_4:
        xpc_dictionary_set_value(a1, a2, v13);
        xpc_release(v13);
        return;
      }
    }

    else
    {
      __int128 v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
      if (v13) {
        goto LABEL_4;
      }
    }

    logfunction("", 1, @"could not create object for key %s:%@\n", v14, v15, v16, v17, v18, (char)a2);
  }

  else
  {
    logfunction( "",  1,  @"%s: API misuse - object is NULL\n",  a4,  a5,  a6,  a7,  a8,  (char)"msu_serialize_cf_object_into_xpc_dict");
  }

void msu_process_dictionary_values_from_xpc_deserialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_from_xpc_deserialization(a2);
  if (v5)
  {
    CFIndex v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }

    CFRelease(v6);
  }

CFStringRef msu_process_cf_object_from_xpc_deserialization(const void *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0LL;
        CFMutableDictionaryRef MutableCopy = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v9 = msu_process_cf_object_from_xpc_deserialization(ValueAtIndex);
          if (v9)
          {
            uint64_t v10 = (const void *)v9;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v10);
            CFRelease(v10);
          }

          ++v6;
        }

        while (v5 != v6);
        return (const __CFString *)MutableCopy;
      }
    }

    return 0LL;
  }

  if (CFDictionaryContainsKey((CFDictionaryRef)a1, @"_MSU_Embedded_Error")) {
    return copy_dictionary_to_cferror(a1);
  }
  context = 0LL;
  CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)msu_process_dictionary_values_from_xpc_deserialization,  &context);
  if (!context) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return (const __CFString *)MutableCopy;
}

CFStringRef msu_deserialize_cf_object_from_xpc_dict(void *a1, const char *a2)
{
  if (!xpc_dictionary_get_value(a1, a2)) {
    return 0LL;
  }
  CFTypeID v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v3 = msu_process_cf_object_from_xpc_deserialization(v2);
  if (v3)
  {
    uint64_t v4 = v3;
    CFRelease(v2);
    return v4;
  }

  return (const __CFString *)v2;
}

void handle_message( _xpc_connection_s *a1, xpc_object_t xdict, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  string = xpc_dictionary_get_string(xdict, "Command");
  if (!string)
  {
    logfunction("", 1, @"No command in request\n", v14, v15, v16, v17, v18, a9);
    return;
  }

  uint64_t v19 = string;
  uint64_t v23 = msu_deserialize_cf_object_from_xpc_dict(xdict, "CommandParameters");
  if (a4)
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = (uint64_t *)(a3 + 16);
    while (1)
    {
      size_t v26 = strlen((const char *)*(v25 - 2));
      ++v24;
      v25 += 3;
      if (a4 == v24) {
        goto LABEL_12;
      }
    }

    if ((msu_client_is_entitled(a1, *v25) & 1) == 0)
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Client does not have entitlement %s",  v27,  v28,  v29,  *v25);
LABEL_14:
      char v32 = error_internal_cf;
      msu_send_error(a1, 0LL, error_internal_cf, 0);
      if (v32) {
        CFRelease(v32);
      }
      goto LABEL_16;
    }

    uint64_t v30 = (void *)os_transaction_create("com.apple.MobileSoftwareUpdate.handle_message");
    ((void (*)(_xpc_connection_s *, xpc_object_t, const __CFString *))*(v25 - 1))(a1, xdict, v23);
    os_release(v30);
  }

  else
  {
    LODWORD(v24) = 0;
  }

  if ((_DWORD)v24 == a4)
  {
LABEL_12:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Unknown command '%s'",  v20,  v21,  v22,  (char)v19);
    goto LABEL_14;
  }

uint64_t msu_client_is_entitled(_xpc_connection_s *a1, uint64_t a2)
{
  if (!a2) {
    return 1LL;
  }
  char v2 = a2;
  uint64_t v4 = (void *)xpc_connection_copy_entitlement_value();
  if (v4)
  {
    CFIndex v5 = v4;
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_BOOL)
    {
      if (xpc_BOOL_get_value(v5))
      {
        uint64_t v12 = 1LL;
LABEL_17:
        xpc_release(v5);
        return v12;
      }

      CFDictionaryRef v11 = @"Value for entitlement '%s' is false\n";
    }

    else
    {
      CFDictionaryRef v11 = @"Entitlement '%s' is not a BOOLean\n";
    }

    logfunction("", 1, v11, v6, v7, v8, v9, v10, v2);
    uint64_t v12 = 0LL;
    goto LABEL_17;
  }

  pid_t pid = xpc_connection_get_pid(a1);
  bzero(buffer, 0x400uLL);
  __int128 v24 = 0u;
  memset(v25, 0, sizeof(v25));
  memset(&audittoken, 0, sizeof(audittoken));
  xpc_connection_get_audit_token(a1, &audittoken);
  if (proc_pidpath_audittoken(&audittoken, buffer, 0x400u) < 1)
  {
    int v21 = proc_pidinfo(pid, 13, 0LL, &v24, 64);
    uint64_t v20 = (const char *)v25;
    if (!v21) {
      uint64_t v20 = "<unknown>";
    }
  }

  else
  {
    uint64_t v14 = strrchr(buffer, 47);
    if (v14) {
      LOBYTE(v20) = (_BYTE)v14 + 1;
    }
    else {
      uint64_t v20 = buffer;
    }
  }

  logfunction("", 1, @"Client %s[%d] does not have the '%s' entitlement\n", v15, v16, v17, v18, v19, (char)v20);
  return 0LL;
}

void msu_send_error(_xpc_connection_s *a1, xpc_object_t original, __CFError *a3, int a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Error");
    if (a3)
    {
      CFDictionaryRef v9 = cferror_to_dictionary(a3);
      if (v9)
      {
        CFDictionaryRef v15 = v9;
        msu_serialize_cf_object_into_xpc_dict(v8, "ErrorInfo", v9, v10, v11, v12, v13, v14);
        CFRelease(v15);
      }
    }

    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
    if (a4) {
      submitRestoreLogFile(a3, 0LL, 0LL, 0LL);
    }
  }

void msu_send_status(_xpc_connection_s *a1, void *a2, void *a3)
{
}

void msu_send_status_with_reply(_xpc_connection_s *a1, xpc_object_t original, void *a3, uint64_t a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Complete");
    if (a3) {
      msu_serialize_cf_object_into_xpc_dict(v8, "Results", a3, v9, v10, v11, v12, v13);
    }
    if (a4) {
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v8);
    }
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
  }

void msu_send_progress(_xpc_connection_s *a1, void *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "IPCStatus", "Callback");
  if (a2) {
    msu_serialize_cf_object_into_xpc_dict(v4, "CallbackStatus", a2, v5, v6, v7, v8, v9);
  }
  xpc_connection_send_message(a1, v4);
  xpc_release(v4);
}

uint64_t msu_demux_reply( void *a1, const __CFString **a2, __CFDictionary **a3, const __CFString **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    uint64_t v18 = @"No reply from daemon";
LABEL_9:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  v18,  a6,  a7,  a8,  v28);
LABEL_10:
    CFErrorRef v19 = error_internal_cf;
    if (a4)
    {
      uint64_t result = 0LL;
      *a4 = (const __CFString *)v19;
      return result;
    }

    goto LABEL_12;
  }

  string = xpc_dictionary_get_string(a1, "IPCStatus");
  if (!string)
  {
    uint64_t v18 = @"No status key in reply from daemon";
    goto LABEL_9;
  }

  uint64_t v13 = string;
  if (!strncmp(string, "Complete", 8uLL))
  {
    if (a2) {
      *a2 = msu_deserialize_cf_object_from_xpc_dict(a1, "Results");
    }
    return 1LL;
  }

  if (!strncmp(v13, "Callback", 8uLL))
  {
    if (a3)
    {
      int v21 = msu_deserialize_cf_object_from_xpc_dict(a1, "CallbackStatus");
      Value = CFDictionaryGetValue((CFDictionaryRef)v21, @"StallError");
      if (Value)
      {
        uint64_t v23 = Value;
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)v21);
        if (v21) {
          CFRelease(v21);
        }
        uint64_t v25 = copy_dictionary_to_cferror(v23);
        if (v25)
        {
          size_t v26 = v25;
          CFDictionarySetValue(MutableCopy, @"StallError", v25);
          CFRelease(v26);
        }
      }

      else
      {
        CFMutableDictionaryRef MutableCopy = (__CFDictionary *)v21;
      }

      *a3 = MutableCopy;
    }

    return 1LL;
  }

  if (strncmp(v13, "Error", 5uLL))
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Unexpected IPC status %s in reply hander",  v14,  v15,  v16,  (char)v13);
    goto LABEL_10;
  }

  if (!a4) {
    return 0LL;
  }
  uint64_t result = (uint64_t)msu_deserialize_cf_object_from_xpc_dict(a1, "ErrorInfo");
  if (result)
  {
    uint64_t v27 = (__CFError *)result;
    *a4 = copy_dictionary_to_cferror((const void *)result);
    CFErrorRef error_internal_cf = v27;
LABEL_12:
    CFRelease(error_internal_cf);
    return 0LL;
  }

  return result;
}

CFPropertyListRef _MSUPreferencesCopyValueForDomain(const __CFString *a1, const __CFString *a2)
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(a1, a2);
  if (v4) {
    return v4;
  }
  if (_getManagedPreferencesDict_managedPreferencesOnce != -1) {
    dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_8);
  }
  if (_getManagedPreferencesDict__managedPreferencesCache)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, a1);
    if (Value)
    {
      CFPropertyListRef v4 = Value;
      CFRetain(Value);
      return v4;
    }
  }

  return CFPreferencesCopyValue(a1, a2, @"mobile", kCFPreferencesAnyHost);
}

CFPropertyListRef _MSUPreferencesCopyValue(const __CFString *a1)
{
  return _MSUPreferencesCopyValueForDomain(a1, @"com.apple.MobileSoftwareUpdate");
}

void ___getManagedPreferencesDict_block_invoke(id a1)
{
  CFStringRef v1 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%@/%@.plist",  @"/Library/Managed Preferences/mobile",  @"com.apple.MobileSoftwareUpdate");
  if (v1)
  {
    CFStringRef v2 = v1;
    _getManagedPreferencesDict__managedPreferencesCache = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  v1);
    CFRelease(v2);
  }

uint64_t _perform_cleanup_command(int a1, int a2, int a3, char a4, const void *a5, const __CFString **a6)
{
  uint64_t v12 = copy_shared_cleanup_service_connection();
  if (v12)
  {
    uint64_t v16 = (_xpc_connection_s *)v12;
    xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v17, "Command", "CleanupPreparePath");
    CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFErrorRef v19 = Mutable;
    if (a1) {
      CFBooleanRef v20 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v20 = kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"ShouldPurge", v20);
    if (a2) {
      CFBooleanRef v21 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v21 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v19, @"ShouldPurgeStagedAssets", v21);
    if (a3) {
      CFBooleanRef v22 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v22 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v19, @"ShouldDisableAssetStaging", v22);
    if ((a4 & 1) == 0) {
      CFDictionarySetValue(v19, @"ShouldResetAPFSReserve", kCFBooleanFalse);
    }
    if (a5) {
      CFDictionarySetValue(v19, @"TargetUUID", a5);
    }
    msu_serialize_cf_object_into_xpc_dict(v17, "CommandParameters", v19, v23, v24, v25, v26, v27);
    if (v19) {
      CFRelease(v19);
    }
    xpc_object_t v28 = xpc_connection_send_message_with_reply_sync(v16, v17);
    uint64_t v33 = msu_demux_reply(v28, 0LL, 0LL, a6, v29, v30, v31, v32);
    xpc_release(v17);
    if (v28) {
      xpc_release(v28);
    }
    xpc_release(v16);
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No cleanup service connection",  v13,  v14,  v15,  v36);
    if (a6)
    {
      uint64_t v33 = 0LL;
      *a6 = (const __CFString *)error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      return 0LL;
    }
  }

  return v33;
}

uint64_t copy_shared_cleanup_service_connection()
{
  if (get_cleanup_service_queue_queue_once != -1) {
    dispatch_once(&get_cleanup_service_queue_queue_once, &__block_literal_global_37);
  }
  dispatch_sync((dispatch_queue_t)get_cleanup_service_queue_queue, &__block_literal_global_9);
  return copy_shared_cleanup_service_connection_service_connection;
}

uint64_t perform_cleanup_staged_assets_command(int a1, const void *a2, const __CFString **a3)
{
  return _perform_cleanup_command(a1, 1, 0, 1, a2, a3);
}

uint64_t perform_cleanup_and_disable_staged_assets_command(int a1, const void *a2, const __CFString **a3)
{
  return _perform_cleanup_command(a1, 1, 1, 1, a2, a3);
}

uint64_t perform_cleanup_command(int a1, char a2, const void *a3, const __CFString **a4)
{
  return _perform_cleanup_command(a1, 0, 0, a2, a3, a4);
}

uint64_t perform_cleanup_recoveryos_saved_state_command(const __CFString **a1)
{
  uint64_t v2 = copy_shared_cleanup_service_connection();
  if (v2)
  {
    uint64_t v6 = (_xpc_connection_s *)v2;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v7, "Command", "CleanupRecoveryOSSavedState");
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
    uint64_t v13 = msu_demux_reply(v8, 0LL, 0LL, a1, v9, v10, v11, v12);
    xpc_release(v7);
    if (v8) {
      xpc_release(v8);
    }
    xpc_release(v6);
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No cleanup service connection to cleanup recoveryOS state",  v3,  v4,  v5,  v16);
    if (a1)
    {
      uint64_t v13 = 0LL;
      *a1 = (const __CFString *)error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      return 0LL;
    }
  }

  return v13;
}

uint64_t perform_cleanup_NVRAM_command(const __CFString **a1)
{
  uint64_t v2 = copy_shared_cleanup_service_connection();
  if (v2)
  {
    uint64_t v6 = (_xpc_connection_s *)v2;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v7, "Command", "CleanupNVRAM");
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
    uint64_t v13 = msu_demux_reply(v8, 0LL, 0LL, a1, v9, v10, v11, v12);
    xpc_release(v7);
    if (v8) {
      xpc_release(v8);
    }
    xpc_release(v6);
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No cleanup service connection",  v3,  v4,  v5,  v16);
    if (a1)
    {
      uint64_t v13 = 0LL;
      *a1 = (const __CFString *)error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      return 0LL;
    }
  }

  return v13;
}

uint64_t perform_reboot_to_nerd_command(const __CFString **a1)
{
  uint64_t v2 = copy_shared_cleanup_service_connection();
  if (v2)
  {
    uint64_t v6 = (_xpc_connection_s *)v2;
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v7, "Command", "RebootToNerd");
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
    uint64_t v13 = msu_demux_reply(v8, 0LL, 0LL, a1, v9, v10, v11, v12);
    xpc_release(v7);
    if (v8) {
      xpc_release(v8);
    }
    xpc_release(v6);
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No cleanup service connection",  v3,  v4,  v5,  v16);
    if (a1)
    {
      uint64_t v13 = 0LL;
      *a1 = (const __CFString *)error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      return 0LL;
    }
  }

  return v13;
}

uint64_t perform_logs_cleanup_command(uint64_t a1, void *a2, const __CFString **a3)
{
  CFTypeRef cf = 0LL;
  uint64_t valuePtr = a1;
  uint64_t v5 = copy_shared_cleanup_service_connection();
  if (!v5)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"No cleanup service connection",  v6,  v7,  v8,  v31);
    if (a3)
    {
      uint64_t v23 = 0LL;
      *a3 = (const __CFString *)error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      return 0LL;
    }

    return v23;
  }

  uint64_t v9 = (_xpc_connection_s *)v5;
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v10, "Command", "CleanupLogs");
  CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(Mutable, @"LogsRetention", v12);
  msu_serialize_cf_object_into_xpc_dict(v10, "CommandParameters", Mutable, v13, v14, v15, v16, v17);
  if (Mutable) {
    CFRelease(Mutable);
  }
  xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(v9, v10);
  uint64_t v23 = msu_demux_reply(v18, (const __CFString **)&cf, 0LL, a3, v19, v20, v21, v22);
  if (cf)
  {
    CFTypeID v24 = CFGetTypeID(cf);
    if (v24 == CFNumberGetTypeID())
    {
      if (a2)
      {
        uint64_t v32 = 0LL;
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, &v32);
        *a2 = v32;
        if (!v12) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }

    else
    {
      CFErrorRef v29 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"oldest is not a number",  v25,  v26,  v27,  v31);
      if (!a3)
      {
        CFRelease(v29);
        uint64_t v23 = 0LL;
        if (!v12) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }

      uint64_t v23 = 0LL;
      *a3 = (const __CFString *)v29;
    }
  }

  if (v12) {
LABEL_14:
  }
    CFRelease(v12);
LABEL_15:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  xpc_release(v10);
  if (v18) {
    xpc_release(v18);
  }
  xpc_release(v9);
  return v23;
}

void __copy_shared_cleanup_service_connection_block_invoke(id a1)
{
  CFStringRef v1 = (void *)copy_shared_cleanup_service_connection_service_connection;
  if (copy_shared_cleanup_service_connection_service_connection) {
    goto LABEL_2;
  }
  if (dlopen("/System/Library/PrivateFrameworks/MobileSoftwareUpdate.framework/MobileSoftwareUpdate", 1))
  {
    if (get_cleanup_service_queue_queue_once != -1) {
      dispatch_once(&get_cleanup_service_queue_queue_once, &__block_literal_global_37);
    }
    uint64_t v2 = xpc_connection_create( "com.apple.MobileSoftwareUpdate.CleanupPreparePathService",  (dispatch_queue_t)get_cleanup_service_queue_queue);
    copy_shared_cleanup_service_connection_service_connection = (uint64_t)v2;
    if (v2)
    {
      xpc_connection_set_event_handler(v2, &__block_literal_global_34);
      xpc_connection_resume((xpc_connection_t)copy_shared_cleanup_service_connection_service_connection);
      CFStringRef v1 = (void *)copy_shared_cleanup_service_connection_service_connection;
LABEL_2:
      xpc_retain(v1);
      return;
    }

    logfunction( "",  1,  @"Could not create connection to service %s\n",  v3,  v4,  v5,  v6,  v7,  (char)"com.apple.MobileSoftwareUpdate.CleanupPreparePathService");
  }

  else
  {
    char v13 = dlerror();
    logfunction("", 1, @"failed to dlopen(3) MobileSoftwareUpdate framework: %s\n", v8, v9, v10, v11, v12, v13);
  }

void __copy_shared_cleanup_service_connection_block_invoke_2(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error
    && copy_shared_cleanup_service_connection_service_connection != 0)
  {
    xpc_release((xpc_object_t)copy_shared_cleanup_service_connection_service_connection);
    copy_shared_cleanup_service_connection_service_connection = 0LL;
  }

void __get_cleanup_service_queue_block_invoke(id a1)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v5 = 0u;
  __int128 v6 = 0u;
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v2 = 0u;
  snprintf(__str, 0x100uLL, "%s.queue", "com.apple.MobileSoftwareUpdate.CleanupPreparePathService");
  get_cleanup_service_queue_queue = (uint64_t)dispatch_queue_create(__str, 0LL);
}

uint64_t get_nonsnapshot_preparation_size(void *a1, void *a2, CFErrorRef *a3)
{
  id v6 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  __int128 v7 = (NSNumber *)[a1 objectForKey:@"InstallationSize"];
  if (v7)
  {
    __int128 v13 = v7;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setFormatterBehavior:]( v15,  "setFormatterBehavior:",  +[NSNumberFormatter defaultFormatterBehavior](&OBJC_CLASS___NSNumberFormatter, "defaultFormatterBehavior"));
      __int128 v13 = -[NSNumberFormatter numberFromString:](v15, "numberFromString:", v13);
      __int128 v16 = @"update_attributes[InstallationSize] (string)";
      goto LABEL_7;
    }

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v13, v21) & 1) != 0)
    {
      __int128 v16 = @"update_attributes[InstallationSize] (number)";
LABEL_7:
      id v27 = -[NSNumber longLongValue](v13, "longLongValue");
      [v6 add:v27 annotation:v16];
      uint64_t v28 = 1LL;
      logfunction("", 1, @"nonsnapshot preparation size : %lld (%lld MB)\n", v29, v30, v31, v32, v33, (char)v27);
      logfunction("", 1, @"\n%s():%@\n", v34, v35, v36, v37, v38, (char)"get_nonsnapshot_preparation_size");
      if (!a2) {
        return v28;
      }
      goto LABEL_12;
    }

    logfunction("", 1, @"InstallationSize has invalid type in update attributes\n", v22, v23, v24, v25, v26, v41);
    uint64_t v20 = @"Invalid update attributes: invalid type InstallationSize";
  }

  else
  {
    logfunction("", 1, @"InstallationSize not present in update attributes\n", v8, v9, v10, v11, v12, v41);
    uint64_t v20 = @"Invalid update attributes: missing InstallationSize";
  }

  CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  v20,  v17,  v18,  v19,  v42);
  if (!a3)
  {
    CFRelease(error_internal_cf);
    id v27 = 0LL;
    uint64_t v28 = 0LL;
    if (!a2) {
      return v28;
    }
    goto LABEL_12;
  }

  id v27 = 0LL;
  uint64_t v28 = 0LL;
  *a3 = error_internal_cf;
  if (a2) {
LABEL_12:
  }
    *a2 = v27;
  return v28;
}

uint64_t get_snapshot_preparation_size(void *a1, char **a2, CFErrorRef *a3)
{
  id v6 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  __int128 v7 = (NSNumber *)[a1 objectForKey:@"InstallationSize-Snapshot"];
  if (v7)
  {
    __int128 v13 = v7;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setFormatterBehavior:]( v15,  "setFormatterBehavior:",  +[NSNumberFormatter defaultFormatterBehavior](&OBJC_CLASS___NSNumberFormatter, "defaultFormatterBehavior"));
      __int128 v13 = -[NSNumberFormatter numberFromString:](v15, "numberFromString:", v13);
      __int128 v16 = @"update_attributes[InstallationSize-Snapshot] (string)";
LABEL_10:
      uint64_t v48 = -[NSNumber longLongValue](v13, "longLongValue");
      [v6 add:v48 annotation:v16];
      uint64_t updated = cryptex_size_requirement_for_update_type(0, a1);
      uint64_t v35 = &v48[updated];
      [v6 add:updated annotation:@"cryptex_size_requirement_for_update_type(msu_update_type_snapshot)"];
      uint64_t v36 = 1LL;
      logfunction( "",  1,  @"snapshot preparation size (mastered) : %lld (%lld MB)\n",  v50,  v51,  v52,  v53,  v54,  (char)v35);
      logfunction("", 1, @"\n%s():%@\n", v55, v56, v57, v58, v59, (char)"get_snapshot_preparation_size");
      goto LABEL_11;
    }

    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v13, v42) & 1) != 0)
    {
      __int128 v16 = @"update_attributes[InstallationSize-Snapshot] (number)";
      goto LABEL_10;
    }

    logfunction( "",  1,  @"InstallationSize-Snapshot has invalid type in update attributes\n",  v43,  v44,  v45,  v46,  v47,  v65);
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Invalid update attributes: invalid type InstallationSize-Snapshot",  v61,  v62,  v63,  v69);
    if (a3)
    {
      uint64_t v35 = 0LL;
      uint64_t v36 = 0LL;
      *a3 = error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      uint64_t v35 = 0LL;
      uint64_t v36 = 0LL;
    }
  }

  else
  {
    logfunction( "",  1,  @"InstallationSize-Snapshot not present in update attributes\n",  v8,  v9,  v10,  v11,  v12,  v65);
    uint64_t v17 = (NSNumber *)[a1 objectForKey:@"ActualMinimumSystemPartition"];
    if (!v17)
    {
      logfunction( "",  1,  @"ActualMinimumSystemPartition not present in update attributes\n",  v18,  v19,  v20,  v21,  v22,  v66);
      uint64_t v17 = (NSNumber *)[a1 objectForKey:@"MinimumSystemPartition"];
      if (!v17)
      {
        logfunction( "",  1,  @"MinimumSystemPartition not present in update attributes. Using the default.\n",  v23,  v24,  v25,  v26,  v27,  v67);
        logfunction( "",  1,  @"*** Warning *** This is not a normal path *** Users shouldn't get here *** Engineers can\n",  v28,  v29,  v30,  v31,  v32,  v68);
        uint64_t v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2500LL);
      }
    }

    uint64_t v33 = calculate_snapshot_overhead(-[NSNumber longLongValue](v17, "longLongValue") << 20);
    uint64_t v34 = cryptex_size_requirement_for_update_type(0, a1);
    uint64_t v35 = (char *)(v34 + v33);
    uint64_t v36 = 1LL;
    logfunction( "",  1,  @"snapshot preparation size (worst case) : %lld (%lld MB)\n",  v37,  v38,  v39,  v40,  v41,  v34 + v33);
  }

LABEL_11:
  if (a2) {
    *a2 = v35;
  }
  return v36;
}

uint64_t cryptex_size_requirement_for_update_type(int a1, void *a2)
{
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v44 = 0LL;
  uint64_t v36 = __cryptex_size_requirement_for_update_type_block_invoke;
  uint64_t v37 = &unk_100059C98;
  v35[1] = 3221225472LL;
  v35[0] = _NSConcreteStackBlock;
  id v38 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  uint64_t v39 = &v41;
  int v40 = a1;
  if (a2)
  {
    id v9 = [a2 objectForKeyedSubscript:@"CryptexSizeInfo"];
    if (!v9 || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
    {
      id v11 = [a2 objectForKeyedSubscript:@"ComboAsset"];
      if (!v11) {
        goto LABEL_31;
      }
      uint64_t v12 = MGCopyAnswer(@"BuildVersion", 0LL);
      __int128 v48 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v45 = 0u;
      id v13 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (!v13) {
        goto LABEL_31;
      }
      uint64_t v14 = *(void *)v46;
LABEL_7:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
        id v17 = [v16 objectForKeyedSubscript:@"PrerequisiteBuild"];
        if (v17)
        {
        }

        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v13) {
            goto LABEL_7;
          }
          goto LABEL_31;
        }
      }

      id v9 = [v16 objectForKeyedSubscript:@"CryptexSizeInfo"];
      if (!v9) {
        goto LABEL_31;
      }
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v9, v18) & 1) == 0) {
        goto LABEL_31;
      }
    }

    uint64_t v19 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"cryptex-system-arm64e",  @"cryptex-app",  0LL);
    if (v19)
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v9, v20) & 1) != 0)
      {
        __int128 v48 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v45 = 0u;
        id v21 = [v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v46;
          uint64_t v23 = -1LL;
          do
          {
            for (i = 0LL; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v46 != v22) {
                objc_enumerationMutation(v9);
              }
              uint64_t v25 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
              uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
              {
                id v27 = [v25 objectForKey:@"CryptexTag"];
                if (v27)
                {
                  if (-[NSArray containsObject:](v19, "containsObject:", v27)) {
                    v36((uint64_t)v35, (uint64_t)i + v23 + 1, (uint64_t)v27, v25);
                  }
                }
              }
            }

            id v21 = [v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
            v23 += (uint64_t)i;
          }

          while (v21);
        }
      }
    }
  }

LABEL_31:
  logfunction("", 1, @"cryptex size requirement: %lld (%lld MB)\n", v4, v5, v6, v7, v8, v42[3]);
  logfunction("", 1, @"\n%s(%s):%@\n", v28, v29, v30, v31, v32, (char)"cryptex_size_requirement_for_update_type");
  uint64_t v33 = v42[3];
  _Block_object_dispose(&v41, 8);
  return v33;
}

void sub_100016540( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t get_nonsnapshot_apply_and_reserve_sizes( const __CFDictionary *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4, CFErrorRef *a5)
{
  uint64_t v170 = 0LL;
  bzero(&v172, 0x878uLL);
  uint64_t v169 = 0LL;
  int valuePtr = 2500;
  id v9 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  [v9 add:314572800 annotation:@"UPDATE_PARTITION_SIZE * 2"];
  [v9 add:104857600 annotation:@"UPDATE_APFS_RESERVE"];
  uint64_t system_partition_padding = get_system_partition_padding(a1);
  [v9 add:system_partition_padding annotation:@"systemPartitionPadding = get_system_partition_padding()"];
  uint64_t updated = cryptex_size_requirement_for_update_type(1, a1);
  uint64_t v164 = system_partition_padding + 419430400 + updated;
  [v9 add:updated annotation:@"cryptex_size_requirement_for_update_type(msu_update_type_legacy)"];
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"ActualMinimumSystemPartition");
  if (Value || (Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"MinimumSystemPartition")) != 0LL)
  {
    CFNumberRef v13 = Value;
    CFRetain(Value);
  }

  else
  {
    logfunction( "",  1,  @"Couldn't find ActualMinimumSystemPartition or MinimumSystemPartition in the asset properties\n",  v14,  v15,  v16,  v17,  v18,  (char)v153);
    CFNumberRef v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  }

  unint64_t v167 = 0LL;
  LOBYTE(v171.st_dev) = 0;
  APFSShouldSealSystemVolume(&v171);
  if (LOBYTE(v171.st_dev))
  {
    uint64_t v19 = (const __CFNumber *)CFDictionaryGetValue(a1, @"SystemVolumeSealingOverhead");
    if (v19)
    {
      CFNumberGetValue(v19, kCFNumberSInt64Type, &v167);
      logfunction("", 1, @"Sealing requires %d MiB overhead\n", v20, v21, v22, v23, v24, v167);
      unint64_t v25 = v167;
      uint64_t v26 = v13;
      id v27 = a4;
      uint64_t v28 = a2;
      uint64_t v29 = a3;
      v167 <<= 20;
      unint64_t v30 = v167;
      v164 += v25 << 20;
      v153 = @"SystemVolumeSealingOverhead";
      uint64_t v31 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"update_attributes[%@]");
      uint64_t v32 = v30;
      a3 = v29;
      a2 = v28;
      a4 = v27;
      CFNumberRef v13 = v26;
      [v9 add:v32 annotation:v31];
    }
  }

  if (!RCGetSystemPartitionExtrasSizeForDevice(0, a1, &v169, 0LL))
  {
    logfunction("", 1, @"Failed to get the system partition extras size\n", v33, v34, v35, v36, v37, (char)v153);
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"failed to query partition sizes",  v72,  v73,  v74,  v156);
    if (a5)
    {
      unint64_t v68 = 0LL;
      unint64_t v69 = 0LL;
      unint64_t v70 = 0LL;
      uint64_t v71 = 0LL;
      *a5 = error_internal_cf;
      if (!v13) {
        goto LABEL_50;
      }
    }

    else
    {
      CFRelease(error_internal_cf);
      unint64_t v68 = 0LL;
      unint64_t v69 = 0LL;
      unint64_t v70 = 0LL;
      uint64_t v71 = 0LL;
      if (!v13) {
        goto LABEL_50;
      }
    }

LABEL_49:
    CFRelease(v13);
    goto LABEL_50;
  }

  v161 = a4;
  v162 = a2;
  v160 = a3;
  uint64_t v38 = v169;
  [v9 add:v169 annotation:@"RCGetSystemPartitionExtrasSizeForDevice()"];
  CFNumberGetValue(v13, kCFNumberSInt64Type, &v170);
  uint64_t v39 = v170;
  v170 <<= 20;
  objc_msgSend(v9, "add:annotation:");
  logfunction("", 1, @"Minimum system partition is %llu (%llu MB)\n", v40, v41, v42, v43, v44, v170);
  logfunction( "",  1,  @"System partition padding is %llu (%llu MB)\n",  v45,  v46,  v47,  v48,  v49,  system_partition_padding);
  logfunction("", 1, @"System partition firmware is %llu (%llu MB)\n", v50, v51, v52, v53, v54, v169);
  bzero(&v172, 0x878uLL);
  uint64_t v55 = statfs("/", &v172);
  if ((_DWORD)v55)
  {
    logfunction("", 1, @"Failed to statfs / to find free filesystem space\n", v58, v59, v60, v61, v62, v154);
    uint64_t v63 = __error();
    CFErrorRef v67 = _create_error_internal_cf( kCFErrorDomainPOSIX,  *v63,  0LL,  0LL,  @"statfs(/) failed",  v64,  v65,  v66,  v155);
    if (a5)
    {
      unint64_t v68 = 0LL;
      unint64_t v69 = 0LL;
      unint64_t v70 = 0LL;
      uint64_t v71 = 0LL;
      *a5 = v67;
    }

    else
    {
      CFRelease(v67);
      unint64_t v68 = 0LL;
      unint64_t v69 = 0LL;
      unint64_t v70 = 0LL;
      uint64_t v71 = 0LL;
    }

    goto LABEL_48;
  }

  uint64_t v76 = v38 + v164 + (v39 << 20);
  if (!is_storage_apfs(v55, v56, v57, v58, v59, v60, v61, v62))
  {
    uint64_t v95 = v172.f_blocks * v172.f_bsize;
    logfunction( "",  1,  @"HFS system partition has size of %llu (%llu MB)\n",  v77,  v78,  v79,  v80,  v81,  LOBYTE(v172.f_blocks) * LOBYTE(v172.f_bsize));
    uint64_t v96 = @"-currentSystemPartitionSize (statfs) HFS+";
    a2 = v162;
    goto LABEL_40;
  }

  if (os_variant_is_recovery("com.apple.MobileSoftwareUpdate"))
  {
    *(void *)&v171.st_dev = 0LL;
    get_main_container_space_info(&v171, 0LL, 0LL, 0LL, 0LL, v82, v83, v84);
    logfunction( "",  1,  @"get_main_container_space_info: system volume is using %llu (%llu MB)\n",  v85,  v86,  v87,  v88,  v89,  v171.st_dev);
    uint64_t v95 = *(void *)&v171.st_dev;
    v165 = @"-currentSystemPartitionSize (get_main_container_space_info)";
    a2 = v162;
  }

  else
  {
    memset(v166, 0, 12);
    *(void *)&v171.st_uid = 0LL;
    *(void *)&v171.st_dev = 5LL;
    v171.st_ino = 2155872256LL;
    if (getattrlist("/", &v171, v166, 0xCuLL, 0))
    {
      uint64_t v97 = __error();
      logfunction( "",  1,  @"getattrlist(ATTR_VOL_SPACEUSED) to get filesystem used space failed: %d\n",  v98,  v99,  v100,  v101,  v102,  *v97);
      uint64_t v95 = (v172.f_blocks - v172.f_bfree) * v172.f_bsize;
      uint64_t v103 = @"-currentSystemPartitionSize (statfs)";
    }

    else
    {
      uint64_t v103 = @"-currentSystemPartitionSize (getattrlist)";
      uint64_t v95 = *(uint64_t *)((char *)v166 + 4);
    }

    a2 = v162;
    v165 = v103;
  }

  logfunction("", 1, @"APFS system volume is using %llu (%llu MB)\n", v90, v91, v92, v93, v94, v95);
  logfunction("", 1, @"Checking for overprovisioning volume\n", v104, v105, v106, v107, v108, v157);
  id v109 = objc_msgSend( objc_msgSend(+[LPMedia mediaForPath:](LPMedia, "mediaForPath:", @"/"), "container"),  "devNodePath");
  v166[0] = 0LL;
  BOOL v115 = v109 != 0LL;
  if (!v109)
  {
    v117 = @"Failed to get container path. Unable to check for overprovisioning volume\n";
LABEL_32:
    logfunction("", 1, v117, v110, v111, v112, v113, v114, v158);
    goto LABEL_33;
  }

  v116 = v109;
  logfunction( "",  1,  @"Attempting to check container %@ for overprovisioning volume\n",  v110,  v111,  v112,  v113,  v114,  (char)v109);
  if (!APFSVolumeRoleFind([v116 UTF8String], 704, v166)
    && [v166[0] count])
  {
    v117 = @"Found overprovisioning volume\n";
    goto LABEL_32;
  }

  BOOL v115 = 0;
LABEL_33:
  memset(&v171, 0, sizeof(v171));
  logfunction("", 1, @"Checking for overprovisioning file\n", v110, v111, v112, v113, v114, v158);
  if (!lstat("/private/var/.overprovisioning_file", &v171) || *__error() != 2)
  {
    logfunction( "",  1,  @"nand already over-provisioned(overprovisioning file present)\n",  v118,  v119,  v120,  v121,  v122,  v159);
    goto LABEL_38;
  }

  if (v115)
  {
LABEL_38:
    logfunction("", 1, @"nand is %@\n", v118, v119, v120, v121, v122, (char)@"overprovisioned");
    v76 -= system_partition_padding;
    [v9 add:-system_partition_padding annotation:@"-systemPartitionPadding (nand already over-provisioned)"];
    goto LABEL_39;
  }

  logfunction("", 1, @"nand is %@\n", v118, v119, v120, v121, v122, (char)@"not overprovisioned");
LABEL_39:
  uint64_t v96 = v165;
LABEL_40:
  unint64_t v70 = v76 - v95;
  [v9 add:-(uint64_t)v95 annotation:v96];
  if (((v76 - v95) & 0x8000000000000000LL) != 0)
  {
    logfunction( "",  1,  @"\n%s():\nrequiredFreeSpace:%@\n",  v123,  v124,  v125,  v126,  v127,  (char)"get_nonsnapshot_apply_and_reserve_sizes");
    id v134 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
    unint64_t v135 = 419430400LL;
    [v134 add:419430400, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"2*UPDATE_PARTITION_SIZE + UPDATE_APFS_RESERVE") annotation];
    LOBYTE(v171.st_dev) = 0;
    APFSShouldSealSystemVolume(&v171);
    if (LOBYTE(v171.st_dev))
    {
      uint64_t v141 = (v167 + v70) & ~((uint64_t)(v167 + v70) >> 63);
      unint64_t v135 = v141 + 419430400;
      [v134 add:v141, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"MAX(requiredFreeSpace + systemPartitionSealingOverhead, 0) == MAX(%lld + %lld, 0) == MAX(%lld, 0)", -(uint64_t)((unint64_t)-(uint64_t)v70 >> 20), v167 >> 20, (v167 >> 20) - ((unint64_t)-(uint64_t)v70 >> 20)) annotation];
    }

    uint64_t v71 = 1LL;
    logfunction( "",  1,  @"%llu MB minimum free space required for personalization and Update volume\n",  v136,  v137,  v138,  v139,  v140,  v135 >> 20);
    logfunction( "",  1,  @"\n%s():%@\n",  v142,  v143,  v144,  v145,  v146,  (char)"get_nonsnapshot_apply_and_reserve_sizes");
    unint64_t v68 = 0LL;
    unint64_t v69 = 0LL;
    unint64_t v70 = v135;
    a4 = v161;
LABEL_48:
    a3 = v160;
    a2 = v162;
    if (!v13) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }

  if (get_apfs_preallocate_min_is_allowed(a1))
  {
    unint64_t v68 = v70 - 419430400;
    a4 = v161;
    if (v70 < 0x19000001
      || (logfunction( "",  1,  @"%llu MB reserve file will be needed (non-snapshot)\n",  v128,  v129,  v130,  v131,  v132,  v68 >> 20),  apfs_preallocate_min = get_apfs_preallocate_min(v70 - 419430400),  unint64_t v69 = apfs_preallocate_min - v68,  apfs_preallocate_min <= v68))
    {
      unint64_t v69 = 0LL;
    }

    else
    {
      logfunction( "",  1,  @"preallocating a %lld MB reserve file will require an additional %lld MB of free space\n",  v128,  v129,  v130,  v131,  v132,  v68 >> 20);
      v70 += v69;
      [v9 add:v69, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"get_apfs_preallocate_min(%lld MB)", v68 >> 20, v69 >> 20) annotation];
    }
  }

  else
  {
    unint64_t v68 = 0LL;
    unint64_t v69 = 0LL;
    a4 = v161;
  }

  uint64_t v71 = 1LL;
  logfunction("", 1, @"free space required is %lld (%lld MB)\n", v128, v129, v130, v131, v132, v70);
  logfunction( "",  1,  @"\n%s():%@\n",  v148,  v149,  v150,  v151,  v152,  (char)"get_nonsnapshot_apply_and_reserve_sizes");
  a3 = v160;
  if (v13) {
    goto LABEL_49;
  }
LABEL_50:
  if (a2) {
    *a2 = v70;
  }
  if (a3) {
    *a3 = v68 & ~((uint64_t)v68 >> 63);
  }
  if (a4) {
    *a4 = v69;
  }
  return v71;
}

uint64_t get_apfs_preallocate_min_is_allowed(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"SUDisableAPFSGetPreallocateMin"];
  if (!v1)
  {
    uint64_t v10 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is not expressly disallowed by asset attributes\n";
LABEL_8:
    uint64_t v9 = 1LL;
    logfunction("", 1, v10, v2, v3, v4, v5, v6, (char)v12);
    return v9;
  }

  uint64_t v7 = v1;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    uint64_t v12 = @"SUDisableAPFSGetPreallocateMin";
    uint64_t v10 = @"%@ property has an unexpected type\n";
    goto LABEL_8;
  }

  if (![v7 BOOLValue])
  {
    uint64_t v10 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is expressly allowed by asset attributes\n";
    goto LABEL_8;
  }

  logfunction( "",  1,  @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is disabled by asset attributes\n",  v2,  v3,  v4,  v5,  v6,  (char)v12);
  return 0LL;
}

unint64_t get_apfs_preallocate_min(unint64_t a1)
{
  uint64_t v2 = "/private/var/MobileSoftwareUpdate/.reserved";
  int v3 = open("/private/var/MobileSoftwareUpdate/.reserved", 1538, 438LL);
  if (v3 == -1)
  {
    if (*__error() != 1 && *__error() != 13
      || (v2 = "/tmp/.reserved", int v4 = open("/tmp/.reserved", 1538, 438LL), v4 == -1))
    {
      uint64_t v5 = __error();
      strerror(*v5);
      logfunction("", 1, @"open(%s) failed: (%s)\n", v6, v7, v8, v9, v10, (char)v2);
      return a1;
    }
  }

  else
  {
    int v4 = v3;
  }

  v19[0] = 0LL;
  v19[1] = a1;
  unint64_t v20 = 0LL;
  if (ffsctl(v4, 0xC0184A68uLL, v19, 0) == -1)
  {
    id v11 = __error();
    char v12 = strerror(*v11);
    logfunction("", 1, @"ffsctl() failed: (%s)\n", v13, v14, v15, v16, v17, v12);
  }

  else if (v20 > a1)
  {
    a1 = v20;
  }

  close(v4);
  unlink(v2);
  return a1;
}

uint64_t get_snapshot_apply_and_reserve_sizes( const __CFDictionary *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  id v8 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  uint64_t v9 = 419430400LL;
  [v8 add:419430400 annotation:@"2*UPDATE_PARTITION_SIZE + UPDATE_APFS_RESERVE"];
  uint64_t valuePtr = 0LL;
  char v32 = 0;
  APFSShouldSealSystemVolume(&v32);
  if (v32)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"SystemVolumeSealingOverhead");
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      logfunction("", 1, @"Sealing requires %d MiB overhead\n", v11, v12, v13, v14, v15, valuePtr);
      uint64_t v16 = valuePtr;
      valuePtr <<= 20;
      uint64_t v9 = (v16 << 20) + 419430400;
      [v8 add:valuePtr, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"update_attributes[%@]", @"SystemVolumeSealingOverhead") annotation];
    }

    else
    {
      uint64_t v9 = 419430400LL;
    }
  }

  if (get_apfs_preallocate_min_is_allowed(a1))
  {
    unint64_t v22 = v9 - 419430400;
    if (v9 - 419430400 >= 1)
    {
      logfunction("", 1, @"%llu MB reserve file will be needed (snapshot)\n", v17, v18, v19, v20, v21, v22 >> 20);
      unint64_t apfs_preallocate_min = get_apfs_preallocate_min(v9 - 419430400);
      unint64_t v24 = apfs_preallocate_min - v22;
      if (apfs_preallocate_min > v22)
      {
        logfunction( "",  1,  @"preallocating a %lld MB reserve file will require an additional %lld MB of free space\n",  v17,  v18,  v19,  v20,  v21,  v22 >> 20);
        v9 += v24;
        [v8 add:v24, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"get_apfs_preallocate_min(%lld MB)", v22 >> 20, v24 >> 20) annotation];
        goto LABEL_11;
      }
    }
  }

  else
  {
    unint64_t v22 = 0LL;
  }

  unint64_t v24 = 0LL;
LABEL_11:
  logfunction("", 1, @"snapshot application size : %lld (%lld MB)\n", v17, v18, v19, v20, v21, v9);
  logfunction("", 1, @"\n%s():%@\n", v25, v26, v27, v28, v29, (char)"get_snapshot_apply_and_reserve_sizes");
  if (a2) {
    *a2 = v9;
  }
  if (a3) {
    *a3 = v22 & ~((uint64_t)v22 >> 63);
  }
  if (a4) {
    *a4 = v24;
  }
  return 1LL;
}

NSDictionary *snapshot_is_prepared(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  int v3 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/Update.plist");
  int v4 = v3;
  if (v3)
  {
    id v5 = -[NSDictionary objectForKey:](v3, "objectForKey:", @"update-asset-attributes");
    if (!v5) {
      goto LABEL_7;
    }
    id v6 = [v5 objectForKey:@"Build"];
    id v7 = [a1 objectForKey:@"Build"];
    if (!v7) {
      id v7 = [a1 objectForKey:@"TargetUpdate"];
    }
    if ([v7 isEqualToString:v6]) {
      int v4 = (NSDictionary *)objc_msgSend( -[NSDictionary objectForKey:](v4, "objectForKey:", @"prepare-snapshot"),  "BOOLValue");
    }
    else {
LABEL_7:
    }
      int v4 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v4;
}

uint64_t saveCurrentEnvInfoForNeRD(uint64_t a1)
{
  uint64_t v202 = 0LL;
  char v201 = 0;
  id v200 = 0LL;
  id v1 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  int v2 = MGGetBoolAnswer(@"InternalBuild");
  uint64_t v8 = MGCopyAnswer(@"BuildVersion", 0LL);
  if (!v8) {
    logfunction("", 1, @"Failed to get currentOSVersion\n", v3, v4, v5, v6, v7, v183);
  }
  v196 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  if (!v196) {
    logfunction("", 1, @"Failed to get currentProductVersion\n", v9, v10, v11, v12, v13, v183);
  }
  uint64_t v19 = (NSString *)MGCopyAnswer(@"ReleaseType", 0LL);
  if (!v19)
  {
    logfunction( "",  1,  @"currentOSType indicated as nil. Overriding it to be %@\n",  v14,  v15,  v16,  v17,  v18,  (char)@"BootedOSReleaseTypeUnknown");
    uint64_t v19 = -[NSString initWithString:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithString:",  @"BootedOSReleaseTypeUnknown");
  }

  v193 = -[NSLocale languageCode](+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"), "languageCode");
  if (v193)
  {
    if (!v2) {
      goto LABEL_16;
    }
  }

  else
  {
    logfunction("", 1, @"Failed to get device locale\n", v20, v21, v22, v23, v24, v183);
    if (!v2)
    {
LABEL_16:
      BOOL v191 = 0;
      goto LABEL_17;
    }
  }

  uint64_t v25 = (const __CFBoolean *)CFPreferencesCopyValue( @"SUDisableRedRingUI",  @"com.apple.nerd",  @"root",  kCFPreferencesAnyHost);
  if (!v25) {
    goto LABEL_16;
  }
  uint64_t v26 = v25;
  CFTypeID v27 = CFGetTypeID(v25);
  if (v27 != CFBooleanGetTypeID()) {
    goto LABEL_16;
  }
  int Value = CFBooleanGetValue(v26);
  BOOL v191 = Value != 0;
  uint64_t v34 = "FALSE(No effect)";
  if (Value) {
    uint64_t v34 = "TRUE";
  }
  logfunction("", 1, @"RedRingUIForceDisable is %s\n", v29, v30, v31, v32, v33, (char)v34);
LABEL_17:
  uint64_t v35 = (__CFString *)CFPreferencesCopyAppValue(@"EnableLiveAssetServerV2", @"com.apple.MobileAsset");
  v197 = v19;
  v198 = (void *)v8;
  if (!v35) {
    goto LABEL_34;
  }
  uint64_t v41 = v35;
  CFTypeID v42 = CFGetTypeID(v35);
  uint64_t v43 = v41;
  if (v42 != CFStringGetTypeID())
  {
    CFTypeID v45 = CFGetTypeID(v41);
    if (v45 == CFNumberGetTypeID())
    {
      uint64_t v43 = (__CFString *)-[__CFString stringValue](v41, "stringValue");
      CFRelease(v41);
      if (!v43) {
        goto LABEL_34;
      }
      goto LABEL_20;
    }

    CFTypeID v46 = CFGetTypeID(v41);
    if (v46 != CFBooleanGetTypeID())
    {
      CFRelease(v41);
      goto LABEL_34;
    }

    if (CFBooleanGetValue((CFBooleanRef)v41)) {
      uint64_t v43 = @"YES";
    }
    else {
      uint64_t v43 = @"NO";
    }
  }

  CFRelease(v41);
LABEL_20:
  if ((-[__CFString isEqual:](v43, "isEqual:", @"off") & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", @"false") & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", @"NO") & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", &__kCFBooleanFalse) & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", @"0") & 1) != 0)
  {
    char v190 = 0;
    uint64_t v44 = @"Pallas is disabled via default\n";
    goto LABEL_35;
  }

LABEL_34:
  char v190 = 1;
  uint64_t v44 = @"Pallas is enabled\n";
LABEL_35:
  logfunction("", 1, v44, v36, v37, v38, v39, v40, v183);
  uint64_t v52 = MAGetPallasAudience(@"com.apple.MobileAsset.SoftwareUpdate");
  if (!v52) {
    logfunction("", 1, @"Failed to get pallas audience\n", v47, v48, v49, v50, v51, v184);
  }
  CFPropertyListRef v53 = CFPreferencesCopyAppValue(@"MobileAssetTokenFile", @"com.apple.MobileAsset");
  uint64_t v54 = (void *)v53;
  if (v53)
  {
    CFTypeID v55 = CFGetTypeID(v53);
    if (v55 == CFStringGetTypeID())
    {
      if (!objc_msgSend(objc_msgSend(v54, "pathComponents"), "containsObject:", @".."))
      {
        uint64_t v61 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/var/MobileSoftwareUpdate/%@",  v54);
        goto LABEL_42;
      }

      logfunction("", 1, @"Invalid value set for TokenFile default\n", v56, v57, v58, v59, v60, v184);
    }
  }

  uint64_t v61 = 0LL;
LABEL_42:
  CFPropertyListRef v62 = CFPreferencesCopyAppValue(@"MobileAssetTokenOverride", @"com.apple.MobileAsset");
  uint64_t v63 = (void *)v62;
  CFTypeRef cf = v54;
  if (v62)
  {
    CFTypeID v64 = CFGetTypeID(v62);
    if (v64 == CFStringGetTypeID())
    {
      if (!v61) {
        uint64_t v61 = -[NSString initWithString:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithString:",  @"/var/MobileSoftwareUpdate/MobileAsset/token.tok");
      }
      logfunction("", 1, @"Using %@ for token path\n", v65, v66, v67, v68, v69, (char)v61);
      uint64_t v199 = 0LL;
      else {
        logfunction("", 1, @"Failed to write token to file %@ : %@\n", v70, v71, v72, v73, v74, (char)v61);
      }
    }
  }

  uint64_t v75 = ASServerURLForAssetType(@"com.apple.MobileAsset.SoftwareUpdate", &v202);
  LOBYTE(v81) = v202;
  if (v202 || (uint64_t v82 = (void *)v75) == 0LL)
  {
    if (!v202) {
      uint64_t v81 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get update asset URL: %@\n", v76, v77, v78, v79, v80, (char)v81);
    uint64_t v82 = 0LL;
    uint64_t v202 = 0LL;
  }

  uint64_t v83 = ASServerURLForAssetType(@"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain", &v202);
  LOBYTE(v89) = v202;
  if (v202 || (uint64_t v90 = (void *)v83) == 0LL)
  {
    if (!v202) {
      uint64_t v89 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Brain asset URL: %@\n", v84, v85, v86, v87, v88, (char)v89);
    uint64_t v90 = 0LL;
    uint64_t v202 = 0LL;
  }

  uint64_t v91 = ASServerURLForAssetType(@"com.apple.MobileAsset.SoftwareUpdateDocumentation", &v202);
  LOBYTE(v97) = v202;
  if (v202 || (uint64_t v98 = (void *)v91) == 0LL)
  {
    if (!v202) {
      uint64_t v97 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Documentation asset URL: %@\n", v92, v93, v94, v95, v96, (char)v97);
    uint64_t v98 = 0LL;
    uint64_t v202 = 0LL;
  }

  v189 = v1;
  uint64_t v99 = ASServerURLForAssetType(@"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation", &v202);
  LOBYTE(v105) = v202;
  if (v202 || (uint64_t v106 = (void *)v99) == 0LL)
  {
    if (!v202) {
      uint64_t v105 = @"Unknown error";
    }
    logfunction( "",  1,  @"Failed to get Watch Documentation asset URL: %@\n",  v100,  v101,  v102,  v103,  v104,  (char)v105);
    uint64_t v106 = 0LL;
    uint64_t v202 = 0LL;
  }

  [v82 absoluteString];
  [v90 absoluteString];
  [v98 absoluteString];
  [v106 absoluteString];
  logfunction( "",  1,  @"SU configuration:\n Asset Audience : %@\n SU Asset URL: %@\n Brain URL: %@\n Documentation URL: %@\n WatchDocumentation URL: %@\n",  v107,  v108,  v109,  v110,  v111,  v52);
  uint64_t v112 = (const __CFBoolean *)CFPreferencesCopyAppValue( @"RetainOriginalBootedOSState",  @"com.apple.MobileSoftwareUpdate");
  uint64_t v113 = v112;
  if (v112
    && (CFTypeID v114 = CFGetTypeID(v112), v114 == CFBooleanGetTypeID())
    && CFBooleanGetValue(v113)
    && (logfunction( "",  1,  @"default set for retaining original bootedOSState plist, will not remove unchanged properties\n",  v115,  v116,  v117,  v118,  v119,  (char)v185),  v185 = "/private/var/MobileSoftwareUpdate/",  (uint64_t v120 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s/%s/%s"))) != 0LL))
  {
    v192 = v120;
    uint64_t v126 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v120);
  }

  else
  {
    uint64_t v126 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v192 = 0LL;
  }

  if (v191) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", @"YES", @"RedRingDisabled");
  }
  if (v198) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v198, @"BootedOSVersion");
  }
  if (v197) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v197, @"BootedOSType");
  }
  if (v193) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v193, @"BootedOSLanguage");
  }
  if (v82) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v82 absoluteString],  @"BootedOSSUAssetURL");
  }
  if (v98) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v98 absoluteString],  @"BootedOSDocumentationURL");
  }
  if (v106) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v106 absoluteString],  @"BootedOSWatchDocumentationURL");
  }
  if (v90) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v90 absoluteString],  @"BootedOSBrainURL");
  }
  if (v52) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v52, @"BootedOSAssetAudience");
  }
  if (v196) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v196, @"BootedOSProductVersion");
  }
  if ((v190 & 1) == 0)
  {
    logfunction( "",  1,  @"Updating BootedOSState to indicate pallas is disabled\n",  v121,  v122,  v123,  v124,  v125,  (char)v185);
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", @"YES", @"BootedOSHasPallasDisabled");
  }

  if (v61)
  {
    logfunction("", 1, @"Updating BootedOSState with token path\n", v121, v122, v123, v124, v125, (char)v185);
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v61, @"BootedOSDawTokenPath");
  }

  if (a1) {
    -[NSMutableDictionary addEntriesFromDictionary:](v126, "addEntriesFromDictionary:");
  }
  logfunction("", 1, @"Dictionary is %@\n", v121, v122, v123, v124, v125, (char)v126);
  v186 = "/private/var/MobileSoftwareUpdate/";
  uint64_t v132 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s/%s");
  if (!v132)
  {
    v162 = @"Failed to allocate path string to save Booted OS state\n";
LABEL_113:
    logfunction("", 1, v162, v127, v128, v129, v130, v131, (char)v186);
    uint64_t v143 = 0LL;
    goto LABEL_123;
  }

  if (!-[NSFileManager fileExistsAtPath:isDirectory:](v189, "fileExistsAtPath:isDirectory:", v132, &v201))
  {
    logfunction( "",  1,  @"Creating directory(%@) to save current OS state\n",  v133,  v134,  v135,  v136,  v137,  (char)v132);
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v189,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v132,  1LL,  0LL,  &v200))
    {
      LOBYTE(v186) = (_BYTE)v200;
      v162 = @"Failed to create directory : %@\n";
      goto LABEL_113;
    }
  }

  LOBYTE(v187) = (_BYTE)v132;
  uint64_t v143 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@/%s");
  if (!v143)
  {
    v163 = @"Failed to allocate string to save the path for the state file\n";
LABEL_122:
    logfunction("", 1, v163, v138, v139, v140, v141, v142, (char)v187);
    goto LABEL_123;
  }

  logfunction("", 1, @"Saving env data to %@\n", v138, v139, v140, v141, v142, (char)v143);
  if ((-[NSMutableDictionary writeToFile:atomically:](v126, "writeToFile:atomically:", v143, 1LL) & 1) == 0)
  {
    v163 = @"Failed to write env data to file\n";
    goto LABEL_122;
  }

  logfunction("", 1, @"Updating file permissions\n", v138, v139, v140, v141, v142, (char)v187);
  uint64_t v144 = -[NSString UTF8String](v143, "UTF8String");
  if (!v144)
  {
    logfunction( "",  1,  @"%s: Failed to get c string representation of the bootedOSStateFile path to fixup permissions..Deleting the file\n",  v145,  v146,  v147,  v148,  v149,  (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }

  uint64_t v150 = v144;
  if (chmod(v144, 0x1F8u))
  {
    __error();
    uint64_t v151 = __error();
    strerror(*v151);
    logfunction( "",  1,  @"%s: Failed to chmod bootedOsStateFile at %@ errno=%d: (%s)..Deleting the file\n",  v152,  v153,  v154,  v155,  v156,  (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }

  uint64_t v164 = getpwnam("mobile");
  if (!v164)
  {
    logfunction( "",  1,  @"%s: Failed to get uid/gid for mobile user to chown the bootedOSState file..Deleting the file at %@\n",  v165,  v166,  v167,  v168,  v169,  (char)"fixup_permissions_for_bootedos_state_file");
LABEL_120:
    logfunction( "",  1,  @"Failed to set permissions on BootedOSState file..Deleting it\n",  v157,  v158,  v159,  v160,  v161,  v188);
    uint64_t v199 = 0LL;
    -[NSFileManager removeItemAtPath:error:](v189, "removeItemAtPath:error:", v143, &v199);
    if (v199)
    {
      v187 = "saveCurrentEnvInfoForNeRD";
      v163 = @"%s: Failed to delete BootedOsState file at %@. Error: %@\n";
      goto LABEL_122;
    }

LABEL_123:
    uint64_t v181 = 0LL;
    goto LABEL_124;
  }

  if (chown(v150, v164->pw_uid, v164->pw_gid))
  {
    __error();
    v175 = __error();
    strerror(*v175);
    logfunction( "",  1,  @"%s: Failed to chown bootedOSStateFile at %@ errno=%d: (%s)..Deleting the file\n",  v176,  v177,  v178,  v179,  v180,  (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }

  uint64_t v181 = 1LL;
  logfunction( "",  1,  @"%s: Successfully fixed up permissions for %@\n",  v170,  v171,  v172,  v173,  v174,  (char)"fixup_permissions_for_bootedos_state_file");
LABEL_124:

  if (v63) {
    CFRelease(v63);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v181;
}

uint64_t msu_running_in_limited_environment( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (&_os_variant_uses_ephemeral_storage)
  {
    uint64_t v8 = os_variant_uses_ephemeral_storage("com.apple.MobileSoftwareUpdate");
    if ((_DWORD)v8) {
      uint64_t v9 = @"MSU running in limited env\n";
    }
    else {
      uint64_t v9 = @"MSU running in normal env\n";
    }
  }

  else
  {
    uint64_t v8 = 1LL;
    uint64_t v9 = @"MSU running in normal env(default)\n";
  }

  logfunction("", 1, v9, a4, a5, a6, a7, a8, v11);
  return v8;
}

uint64_t msu_should_save_env_info_for_recovery()
{
  return 1LL;
}

id __cryptex_size_requirement_for_update_type_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"update_attributes[%@][%lu(%@)]",  @"CryptexSizeInfo",  a2,  a3);
  id v7 = [a4 objectForKeyedSubscript:@"CryptexSize"];
  id v8 = [v7 unsignedLongLongValue];
  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += ((void)v8 << 20) / 5uLL + ((void)v8 << 20);
    [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSize"];
  }

  id v9 = [a4 objectForKeyedSubscript:@"ReversePatchSize"];
  id v10 = [v9 unsignedLongLongValue];
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += (void)v10 << 20;
    [*(id *)(a1 + 32) add:(void)v10 << 20, @"%@[%@]", v6, @"ReversePatchSize" annotationFormat];
  }

  id v11 = [a4 objectForKeyedSubscript:@"CryptexSizeDelta"];
  id result = [v11 unsignedLongLongValue];
  if (v11)
  {
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += (void)result << 20;
      return [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSizeDelta"];
    }
  }

  return result;
}

void sub_10001870C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NSErrorUserInfoKey a10, const __CFString *a11, const __CFString *a12, id a13)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    a10 = NSDebugDescriptionErrorKey;
    a11 = @"ExceptionDescription";
    a12 = @"Exception invoking MSUBrain";
    a13 = [v14 description];
    (*(void (**)(uint64_t, NSError *))(v13 + 16))( v13,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  1365LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &a12,  &a10,  2LL)));
    objc_end_catch();
    JUMPOUT(0x1000186E0LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_100018834(_Unwind_Exception *a1)
{
}

void sub_100018A84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_100018C4C(_Unwind_Exception *a1)
{
}

void sub_100019B54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

CFErrorRef MSURetrievePreviousUpdateResults_server()
{
  dict = (const __CFDictionary *)load_dict("/private/var/MobileSoftwareUpdate/last_update_result.plist");
  if (dict)
  {
    id v1 = dict;
    int Value = (const __CFString *)CFDictionaryGetValue(dict, @"ota-result");
    unsigned __int8 v3 = CFDictionaryGetValue(v1, @"ota-failure-reason");
    if (!Value) {
      goto LABEL_30;
    }
    char v4 = v3;
    if (CFStringCompare(Value, @"crash", 1uLL) == kCFCompareEqualTo)
    {
      error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf( @"MobileSoftwareUpdateErrorDomain",  1105LL,  0LL,  0LL,  v1,  @"OTA failed. Preserved reason: %@",  v5,  v6,  v4);
      goto LABEL_36;
    }

    if (CFStringCompare(Value, @"panic", 1uLL) == kCFCompareEqualTo)
    {
      error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf( @"MobileSoftwareUpdateErrorDomain",  1104LL,  0LL,  0LL,  v1,  @"OTA failed. Preserved reason: %@",  v7,  v8,  v4);
      goto LABEL_36;
    }

    if (CFStringCompare(Value, @"success", 1uLL) == kCFCompareEqualTo)
    {
LABEL_30:
      CFErrorRef v33 = 0LL;
      goto LABEL_37;
    }

    char v36 = v4;
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, Value, @";");
    if (CFArrayGetCount(ArrayBySeparatingStrings) < 1)
    {
      CFErrorRef v13 = 0LL;
      if (!ArrayBySeparatingStrings) {
        goto LABEL_27;
      }
    }

    else
    {
      CFIndex v12 = 0LL;
      CFErrorRef v13 = 0LL;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v12);
        char v15 = (char)ValueAtIndex;
        uint64_t v16 = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, ValueAtIndex, @" ");
        if (v16)
        {
          uint64_t v17 = v16;
          if (CFArrayGetCount(v16) < 2)
          {
            if (CFArrayGetCount(v17) == 1 && !v13) {
              CFErrorRef v13 = _create_error_internal_with_userinfo_cf( @"MobileSoftwareUpdateErrorDomain",  1106LL,  0LL,  0LL,  0LL,  @"%@",  v27,  v28,  v15);
            }
          }

          else
          {
            uint64_t v18 = (const __CFString *)CFArrayGetValueAtIndex(v17, 0LL);
            uint64_t v19 = (const __CFString *)CFArrayGetValueAtIndex(v17, 1LL);
            Intint Value = CFStringGetIntValue(v19);
            CFComparisonResult v23 = CFStringCompare(v18, @"MSU", 1uLL);
            uint64_t v24 = @"MobileSoftwareUpdateErrorDomain";
            if (v23)
            {
              if (CFStringCompare(v18, @"RRD", 1uLL)) {
                uint64_t v24 = v18;
              }
              else {
                uint64_t v24 = @"RamrodErrorDomain";
              }
            }

            if (IntValue) {
              int v25 = IntValue;
            }
            else {
              int v25 = 1106;
            }
            CFErrorRef v26 = _create_error_internal_with_userinfo_cf(v24, v25, v13, 0LL, 0LL, @"%@", v21, v22, v15);
            if (v13) {
              CFRelease(v13);
            }
            CFErrorRef v13 = v26;
          }

          CFRelease(v17);
        }

        ++v12;
      }

      while (CFArrayGetCount(ArrayBySeparatingStrings) > v12);
      if (!ArrayBySeparatingStrings) {
        goto LABEL_27;
      }
    }

    CFRelease(ArrayBySeparatingStrings);
LABEL_27:
    if (v13)
    {
      CFErrorDomain Domain = CFErrorGetDomain(v13);
      CFIndex Code = CFErrorGetCode(v13);
      CFErrorRef v33 = _create_error_internal_with_userinfo_cf( Domain,  Code,  v13,  0LL,  v1,  @"OTA failed. Preserved reason: %@",  v31,  v32,  v36);
      CFRelease(v13);
LABEL_37:
      CFRelease(v1);
      return v33;
    }

    error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf( @"MobileSoftwareUpdateErrorDomain",  1106LL,  0LL,  0LL,  v1,  @"OTA failed. Preserved reason: %@",  v10,  v11,  v36);
LABEL_36:
    CFErrorRef v33 = error_internal_with_userinfo_cf;
    goto LABEL_37;
  }

  return 0LL;
}

uint64_t MSUAssetCalculatePrepareSizes_server(uint64_t a1, void *a2, void *a3, void *a4, CFErrorRef *a5)
{
  uint64_t v57 = 0LL;
  id v58 = 0LL;
  uint64_t msubrain = get_msubrain();
  if (msubrain)
  {
    uint64_t v16 = (void *)msubrain;
    uint64_t v55 = 0LL;
    id v56 = 0LL;
    id v17 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v17 setObject:a1 forKeyedSubscript:@"TargetUUID"];
    if ([v17 count]) {
      id v18 = v17;
    }
    else {
      id v18 = 0LL;
    }
    if (![v16 calculateUpdateStorageRequirements:40 attributes:a2 options:v18 info:&v56 error:&v55])
    {
      logfunction( "",  1,  @"Using OS prepare calculation because MSUBrain call failed: %@\n",  v19,  v20,  v21,  v22,  v23,  v55);
      goto LABEL_14;
    }

    id v24 = [v56 objectForKeyedSubscript:@"PrepareSize"];
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
    {
      logfunction("", 1, @"Using MSUBrain prepare calculation\n", v26, v27, v28, v29, v30, v52);
      id v58 = [v24 unsignedLongLongValue];
      id v31 = [v56 objectForKeyedSubscript:@"SnapshotPrepareSize"];
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
      {
        uint64_t v57 = (char *)[v31 unsignedLongLongValue];
        uint64_t v33 = 1LL;
        goto LABEL_23;
      }

      char v52 = objc_opt_class(v31);
      uint64_t v34 = @"Using OS prepare calculation because MSUBrain returned an invalid object type (snapshot) : %@\n";
    }

    else
    {
      char v52 = objc_opt_class(v24);
      uint64_t v34 = @"Using OS prepare calculation because MSUBrain returned invalid object type : %@\n";
    }
  }

  else
  {
    uint64_t v34 = @"Using OS prepare calculation because MSUBrain is not loaded\n";
  }

  logfunction("", 1, v34, v11, v12, v13, v14, v15, v52);
LABEL_14:
  if (a2)
  {
    logfunction("", 1, @"Returning non-snapshot preparation size\n", v35, v36, v37, v38, v39, v53);
    if ((get_nonsnapshot_preparation_size(a2, &v58, a5) & 1) != 0)
    {
      uint64_t v33 = 1LL;
      logfunction("", 1, @"Also returning snapshot prepare size\n", v40, v41, v42, v43, v44, v54);
      if ((get_snapshot_preparation_size(a2, &v57, a5) & 1) != 0) {
        goto LABEL_23;
      }
      logfunction( "",  1,  @"Error determining the snapshot prepare size: %@.\n",  v45,  v46,  v47,  v48,  v49,  (char)*a5);
    }

    else
    {
      logfunction( "",  1,  @"Error determining the non-snapshot preparation size: %@.\n",  v40,  v41,  v42,  v43,  v44,  (char)*a5);
    }
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Update attributes dictionary is NULL",  v37,  v38,  v39,  v53);
    if (a5)
    {
      uint64_t v33 = 0LL;
      *a5 = error_internal_cf;
      goto LABEL_23;
    }

    CFRelease(error_internal_cf);
  }

  uint64_t v33 = 0LL;
LABEL_23:
  if (a3) {
    *a3 = v58;
  }
  if (a4) {
    *a4 = v57;
  }
  return v33;
}

uint64_t _MSUAssetCalculateApplyAndReserveSizes( const __CFDictionary *a1, void *a2, void *a3, unint64_t *a4, unint64_t *a5, CFErrorRef *a6)
{
  id v70 = 0LL;
  id v71 = 0LL;
  uint64_t msubrain = (void *)get_msubrain();
  if (msubrain)
  {
    uint64_t v68 = 0LL;
    id v69 = 0LL;
    if (![msubrain calculateUpdateStorageRequirements:80 attributes:a1 options:0 info:&v69 error:&v68])
    {
      logfunction( "",  1,  @"Using OS apply calculation because MSUBrain call failed: %@\n",  v18,  v19,  v20,  v21,  v22,  v68);
      goto LABEL_11;
    }

    id v23 = [v69 objectForKeyedSubscript:@"ApplySize"];
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    {
      logfunction("", 1, @"Using MSUBrain apply calculation\n", v25, v26, v27, v28, v29, v64);
      id v71 = [v23 unsignedLongLongValue];
      id v30 = [v69 objectForKeyedSubscript:@"SnapshotApplySize"];
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
      {
        uint64_t v37 = 1LL;
        logfunction("", 1, @"Using MSUBrain apply calculation (snapshot)\n", v32, v33, v34, v35, v36, v65);
        id v70 = [v30 unsignedLongLongValue];
        goto LABEL_24;
      }

      char v64 = objc_opt_class(v30);
      uint64_t v38 = @"Using OS apply calculation because MSUBrain returned an invalid object type (snapshot) : %@\n";
    }

    else
    {
      char v64 = objc_opt_class(v23);
      uint64_t v38 = @"Using OS apply calculation because MSUBrain returned an invalid object type : %@\n";
    }
  }

  else
  {
    uint64_t v38 = @"Using OS apply calculation because MSUBrain is not loaded\n";
  }

  logfunction("", 1, v38, v13, v14, v15, v16, v17, v64);
LABEL_11:
  if (a1)
  {
    if (snapshot_is_prepared(a1))
    {
      logfunction("", 1, @"Returning snapshot apply size\n", v42, v43, v44, v45, v46, v66);
      if ((get_snapshot_apply_and_reserve_sizes(a1, (uint64_t *)&v71, a4, a5) & 1) != 0)
      {
        id v70 = v71;
        uint64_t v37 = 1LL;
        goto LABEL_24;
      }

      logfunction( "",  1,  @"Error determining what the snapshot apply size: %@.\n",  v47,  v48,  v49,  v50,  v51,  (char)*a6);
    }

    else
    {
      logfunction("", 1, @"Returning non-snapshot apply size\n", v42, v43, v44, v45, v46, v66);
      if ((get_nonsnapshot_apply_and_reserve_sizes(a1, (unint64_t *)&v71, a4, a5, a6) & 1) != 0)
      {
        uint64_t v37 = 1LL;
        logfunction("", 1, @"Also returning snapshot apply size\n", v53, v54, v55, v56, v57, v67);
        logfunction( "",  1,  @"Error determining the snapshot apply size: %@.\n",  v58,  v59,  v60,  v61,  v62,  (char)*a6);
      }

      else
      {
        logfunction( "",  1,  @"Error determining the non-snapshot apply size: %@.\n",  v53,  v54,  v55,  v56,  v57,  (char)*a6);
      }
    }
  }

  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Update attributes dictionary is NULL",  v39,  v40,  v41,  v66);
    if (a6)
    {
      uint64_t v37 = 0LL;
      *a6 = error_internal_cf;
      goto LABEL_24;
    }

    CFRelease(error_internal_cf);
  }

  uint64_t v37 = 0LL;
LABEL_24:
  if (a2) {
    *a2 = v71;
  }
  if (a3) {
    *a3 = v70;
  }
  return v37;
}

uint64_t MSUAssetCalculateApplySizes_server(const __CFDictionary *a1, void *a2, void *a3, CFErrorRef *a4)
{
  return _MSUAssetCalculateApplyAndReserveSizes(a1, a2, a3, 0LL, 0LL, a4);
}

uint64_t check_available_size( unint64_t a1, void *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    uint64_t available_space = get_available_space(a3);
    if (*a3) {
      return 0LL;
    }
    uint64_t v17 = a1 - available_space;
    if (a1 <= available_space) {
      goto LABEL_15;
    }
    logfunction("", 1, @"sizeNeeded = (%lld - %lld) = %lld\n", v12, v13, v14, v15, v16, a1);
    if ((trigger_cache_delete(v17, @"/private/var", 4, 0LL) & 1) != 0)
    {
      uint64_t v21 = get_available_space(a3);
      if (!*a3)
      {
        if (a1 > v21)
        {
          *a2 = a1 - v21;
          logfunction("", 1, @"prequiredsize = (%lld - %lld) = %lld\n", v12, v13, v14, v15, v16, a1);
          CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  20LL,  0LL,  0LL,  @"There is not enough space to proceed with the update. %lld is required",  v22,  v23,  v24,  *a2);
          *a3 = error_internal_cf;
          CFTypeID v26 = CFGetTypeID(error_internal_cf);
          CFTypeID TypeID = CFErrorGetTypeID();
          uint64_t v33 = "not";
          if (v26 == TypeID) {
            uint64_t v33 = "";
          }
          logfunction("", 1, @"*perrorinfo (%s error)= %@\n", v28, v29, v30, v31, v32, (char)v33);
          return 0LL;
        }

uint64_t MSUCheckInstallationSize_server( const __CFDictionary *a1, void *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0LL;
  unint64_t v19 = 0LL;
  if (a1)
  {
    if ((_MSUAssetCalculateApplyAndReserveSizes(a1, &v19, 0LL, 0LL, 0LL, (CFErrorRef *)&cf) & 1) != 0)
    {
      uint64_t v12 = check_available_size(v19, a2, a3, v10, v11, a6, a7, a8);
      goto LABEL_9;
    }

    CFTypeRef v15 = cf;
    uint64_t v13 = @"Failed to calculate apply size";
    CFIndex v14 = 7LL;
  }

  else
  {
    uint64_t v13 = @"No asset properties provided";
    CFIndex v14 = 9LL;
    CFTypeRef v15 = 0LL;
  }

  CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  v14,  v15,  0LL,  v13,  a6,  a7,  a8,  (char)cf);
  if (a3)
  {
    uint64_t v12 = 0LL;
    *a3 = error_internal_cf;
  }

  else
  {
    CFRelease(error_internal_cf);
    uint64_t v12 = 0LL;
  }

uint64_t get_available_space(CFErrorRef *a1)
{
  if (!statfs("/private/var", &v8)) {
    return v8.f_bavail * v8.f_bsize;
  }
  int v2 = __error();
  CFErrorRef error_internal_cf = _create_error_internal_cf( kCFErrorDomainPOSIX,  *v2,  0LL,  0LL,  @"Failed to get filesystem stats",  v3,  v4,  v5,  v8.f_bsize);
  if (a1) {
    *a1 = error_internal_cf;
  }
  else {
    CFRelease(error_internal_cf);
  }
  return -1LL;
}

void sub_10001ABD0(_Unwind_Exception *a1)
{
}

void sub_10001AC5C(_Unwind_Exception *a1)
{
}

void sub_10001B044(_Unwind_Exception *a1)
{
}

uint64_t MSUShouldPromptTTR()
{
  return 0LL;
}

uint64_t MSUPromptForTTR()
{
  return os_variant_has_internal_diagnostics("com.apple.MobileSoftwareUpdate");
}

id retrieve_previous_update_state()
{
  v0 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/last_update_result.plist");
  if (!v0) {
    goto LABEL_5;
  }
  id v6 = -[NSDictionary objectForKey:](v0, "objectForKey:", @"PreviousUpdateState");
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v6 = [v6 longValue];
      goto LABEL_6;
    }

LABEL_5:
    id v6 = 0LL;
  }

BOOL is_first_boot_after_update()
{
  BOOL v0 = -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/var/run/FirstBootAfterUpdate");
  logfunction("", 1, @"%s: is first boot: %@\n", v1, v2, v3, v4, v5, (char)"is_first_boot_after_update");
  return v0;
}

const void *retrieve_previous_update_date()
{
  BOOL v0 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/last_update_result.plist");
  if (!v0) {
    return 0LL;
  }
  id v1 = -[NSDictionary objectForKey:](v0, "objectForKey:", @"PreviousUpdateDate");
  uint64_t v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFDateGetTypeID())
    {
      CFRetain(v2);
      return v2;
    }

    return 0LL;
  }

  return v2;
}

uint64_t get_previous_update_unresolved_tolerated_failures_count()
{
  BOOL v0 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist");
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  int v7 = 0;
  if (v0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = __get_previous_update_unresolved_tolerated_failures_count_block_invoke;
    v3[3] = &unk_100059E48;
    v3[4] = &v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v0, "enumerateKeysAndObjectsUsingBlock:", v3);
    uint64_t v1 = *((unsigned int *)v5 + 6);
  }

  else
  {
    uint64_t v1 = 0LL;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001B2F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id __get_previous_update_unresolved_tolerated_failures_count_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 isEqualToString:@"uuid"];
  if ((result & 1) == 0)
  {
    if (objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"),  "BOOLValue")) {
      BOOL v6 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"InitialResult"), "intValue") != 0;
    }
    else {
      BOOL v6 = 0;
    }
    id result = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"), "BOOLValue");
    if ((_DWORD)result)
    {
      id result = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"RetryResult"), "intValue");
      if (!(_DWORD)result) {
        return result;
      }
    }

    else if (!v6)
    {
      return result;
    }

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  return result;
}

const void *retrieve_previous_restore_date()
{
  BOOL v0 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/last_update_result.plist");
  if (!v0) {
    return 0LL;
  }
  id v1 = -[NSDictionary objectForKey:](v0, "objectForKey:", @"PreviousRestoreDate");
  uint64_t v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFDateGetTypeID())
    {
      CFRetain(v2);
      return v2;
    }

    return 0LL;
  }

  return v2;
}

uint64_t load_trust_cache_at_path(const char *a1, NSError **a2)
{
  char v3 = (char)a1;
  memset(&v66, 0, sizeof(v66));
  io_connect_t connect = 0;
  int v4 = open(a1, 0);
  if (v4 < 0)
  {
    uint64_t v16 = *__error();
    NSErrorUserInfoKey v78 = NSDebugDescriptionErrorKey;
    uint64_t v17 = __error();
    uint64_t v79 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"open() failed: %s",  strerror(*v17));
    statfs v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v16,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
    uint64_t v18 = __error();
    strerror(*v18);
    logfunction("", 1, @"Could not open trust cache at path %s: %s.\n", v19, v20, v21, v22, v23, v3);
    uint64_t v24 = (const __CFBoolean *)MGCopyAnswer(@"SigningFuse", 0LL);
    if (v24 == kCFBooleanFalse
      && (bzero(__big, 0x400uLL), size_t v64 = 1024LL, !sysctlbyname("kern.bootargs", __big, &v64, 0LL, 0LL))
      && strstr(__big, "msu_eng_brain=1"))
    {
      uint64_t v15 = 1LL;
      logfunction( "",  1,  @"System policy for update brain is in effect.\n",  v53,  v54,  v55,  v56,  v57,  outputStructa);
      statfs v8 = 0LL;
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    CFRelease(v24);
    goto LABEL_9;
  }

  int v5 = v4;
  if (fstat(v4, &v66))
  {
    uint64_t v6 = *__error();
    NSErrorUserInfoKey v75 = NSDebugDescriptionErrorKey;
    int v7 = __error();
    uint64_t v76 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fstat() failed: %s",  strerror(*v7));
    statfs v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v6,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
    id v9 = __error();
    char outputStructb = strerror(*v9);
    logfunction("", 1, @"Could not fstat trust cache: %s\n", v10, v11, v12, v13, v14, outputStructb);
LABEL_4:
    close(v5);
    uint64_t v15 = 0LL;
    goto LABEL_9;
  }

  CFTypeID v26 = mmap(0LL, v66.st_size, 1, 1026, v5, 0LL);
  if (v26 == (void *)-1LL)
  {
    uint64_t v39 = *__error();
    NSErrorUserInfoKey v73 = NSDebugDescriptionErrorKey;
    char v40 = __error();
    uint64_t v74 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"mmap() failed: %s",  strerror(*v40));
    statfs v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v39,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
    char v41 = __error();
    strerror(*v41);
    logfunction("", 1, @"Could not map file %s: %s\n", v42, v43, v44, v45, v46, v3);
    goto LABEL_4;
  }

  uint64_t v27 = v26;
  uint64_t v28 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v28);
  io_object_t v30 = MatchingService;
  if (!MatchingService)
  {
    NSErrorUserInfoKey v71 = NSDebugDescriptionErrorKey;
    uint64_t v72 = @"Could not find AppleMobileFileIntegrity service";
    statfs v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  3LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
    char v52 = @"Could not find AppleMobileFileIntegrity service\n";
LABEL_22:
    logfunction("", 1, v52, v47, v48, v49, v50, v51, outputStruct);
    goto LABEL_23;
  }

  uint64_t v31 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
  if (!(_DWORD)v31)
  {
    uint64_t v58 = IOConnectCallMethod(connect, 2u, 0LL, 0, v27, v66.st_size, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v58)
    {
      statfs v8 = 0LL;
      uint64_t v15 = 1LL;
      goto LABEL_24;
    }

    char v59 = v58;
    uint64_t v60 = (int)v58;
    NSErrorUserInfoKey v67 = NSDebugDescriptionErrorKey;
    uint64_t v68 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOConnectCallMethod() failed: 0x%x",  v58);
    statfs v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IOKitErrorDomain",  v60,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
    char outputStruct = v59;
    char v52 = @"Unable to load trust cache: 0x%x\n";
    goto LABEL_22;
  }

  char v32 = v31;
  uint64_t v33 = (int)v31;
  NSErrorUserInfoKey v69 = NSDebugDescriptionErrorKey;
  id v70 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOServiceOpen() failed: 0x%x",  v31);
  statfs v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IOKitErrorDomain",  v33,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
  logfunction("", 1, @"Unable to open user client: 0x%x\n", v34, v35, v36, v37, v38, v32);
LABEL_23:
  uint64_t v15 = 0LL;
LABEL_24:
  close(v5);
  munmap(v27, v66.st_size);
  if (connect) {
    IOServiceClose(connect);
  }
  if (v30) {
    IOObjectRelease(v30);
  }
LABEL_9:
  if (a2) {
    *a2 = v8;
  }
  return v15;
}

void sub_10001BC50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

id nrdSharedLogger()
{
  if (nrdSharedLogger_pred != -1) {
    dispatch_once(&nrdSharedLogger_pred, &__block_literal_global_11);
  }
  return (id)nrdSharedLogger___instance;
}

void __nrdSharedLogger_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileSoftwareUpdate", "NRD");
  uint64_t v2 = (void *)nrdSharedLogger___instance;
  nrdSharedLogger___instance = (uint64_t)v1;
}

void sub_10001CC7C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NSErrorUserInfoKey a10, const __CFString *a11, const __CFString *a12, uint64_t a13)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    a10 = NSDebugDescriptionErrorKey;
    a11 = @"ExceptionDescription";
    a12 = @"Exception invoking NRDUpdateBrain";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
    a13 = (uint64_t)v15;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &a12,  &a10,  2LL));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  113LL,  v16));

    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v17);
    objc_end_catch();
    JUMPOUT(0x10001CC40LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10001CDEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001D110( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_10001D35C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001D7D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10001E134( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t __os_log_helper_1_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

LABEL_52:
  uint64_t v17 = 0LL;
  objc_storeStrong(&v112, 0LL);
  objc_storeStrong(&v115, v17);
  objc_storeStrong(&v116, v17);
  objc_storeStrong(&v118, v17);
  objc_storeStrong(location, v17);
  return v125;
}

uint64_t __os_log_helper_1_2_3_8_32_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_100021280(uint64_t a1)
{
  *(void *)(v1 - 336) = a1;
  _Unwind_Resume(*(_Unwind_Exception **)(v1 - 336));
}

_BYTE *__os_log_helper_1_0_0(_BYTE *result)
{
  *id result = 0;
  result[1] = 0;
  return result;
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  char v3 = (id *)(a1 + 40);
  *char v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

uint64_t __os_log_helper_1_3_1_8_65(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 65;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

LABEL_8:
    uint64_t v12 = 0;
    uint64_t v10 = 1;
    goto LABEL_9;
  }

  uint64_t v12 = 1;
  uint64_t v10 = 1;
LABEL_9:
  objc_storeStrong(location, 0LL);
  return v12;
}

uint64_t iterateSafely(io_iterator_t a1, int a2, id obj, void *a4)
{
  id v10 = a4;
  id v9 = "_Bool iterateSafely(io_iterator_t, int, void (^__strong)(io_object_t), void (^__strong)(void))";
  io_iterator_t v22 = a1;
  int v21 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v19 = 0LL;
  objc_storeStrong(&v19, v10);
  for (int i = 0; i < v21; ++i)
  {
    for (io_object_t j = 0; ; IOObjectRelease(j))
    {
      io_object_t j = IOIteratorNext(v22);
      if (!j) {
        break;
      }
      (*((void (**)(id, void))location + 2))(location, j);
    }

    if (IOIteratorIsValid(v22))
    {
      char v23 = 1;
      int v16 = 1;
      goto LABEL_10;
    }

    IOIteratorReset(v22);
    (*((void (**)(void))v19 + 2))();
  }

  uint64_t v15 = _os_log_pack_size(18LL);
  uint64_t v8 = v15;
  id v14 = &v5;
  unint64_t v7 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v13 = v8;
  uint64_t v12 = (uint64_t)&v5 - v7;
  uint64_t v11 = _os_log_pack_fill( (char *)&v5 - v7,  v15,  0LL,  &_mh_execute_header,  "%s : IOIterator was still invalid after attempting %d times",  v5,  v6);
  __os_log_helper_1_2_2_8_32_4_0(v11, (uint64_t)v9, v21);
  _LPLogPack(1, v12);
  char v23 = 0;
  int v16 = 1;
LABEL_10:
  int v5 = 0LL;
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&location, v5);
  return v23 & 1;
}

uint64_t _is_running_in_ramdisk()
{
  predicate = (dispatch_once_t *)&_is_running_in_ramdisk_onceToken;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &__block_literal_global_153);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return _is_running_in_ramdisk_is_ramdisk & 1;
}

uint64_t _lp2_delete_directory_contents(const char *a1)
{
  uint64_t v33 = a1;
  uint64_t v15 = &v32;
  unsigned int v32 = 0;
  removefile_state_t v31 = removefile_state_alloc();
  removefile_state_set(v31, 1u, _lp2_delete_directory_contents_confirm);
  removefile_state_set(v31, 2u, &v32);
  removefile_state_set(v31, 3u, _lp2_delete_directory_contents_error);
  removefile_state_set(v31, 4u, &v32);
  uint64_t v30 = _os_log_pack_size(12LL);
  uint64_t v14 = v30;
  uint64_t v29 = v5;
  unint64_t v13 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v28 = v14;
  uint64_t v27 = &v5[-v13];
  uint64_t v26 = _os_log_pack_fill(&v5[-v13], v30, 0LL, &_mh_execute_header, "Deleting contents of %{private}s...");
  __os_log_helper_1_3_1_8_33(v26, (uint64_t)v33);
  _LPLogPack(1, (uint64_t)v27);
  if (removefile(v33, v31, 3u))
  {
    if (!v32) {
      unsigned int v32 = *__error();
    }
  }

  else
  {
    unsigned int v32 = _lp2_reset_directory_metadata(v33);
    if (v32)
    {
      uint64_t v25 = 0LL;
      uint64_t v25 = _os_log_pack_size(22LL);
      uint64_t v10 = v25;
      uint64_t v24 = v5;
      unint64_t v9 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      __chkstk_darwin();
      uint64_t v23 = v10;
      io_iterator_t v22 = &v5[-v9];
      uint64_t v21 = _os_log_pack_fill(&v5[-v9], v25, 0LL, &_mh_execute_header, "Could not reset metadata on %{private}s: %s");
      uint64_t v12 = v21;
      uint64_t v11 = v33;
      uint64_t v1 = strerror(v32);
      __os_log_helper_1_3_2_8_33_8_32(v12, (uint64_t)v11, (uint64_t)v1);
      _LPLogPack(1, (uint64_t)v22);
    }
  }

  uint64_t v20 = 0LL;
  uint64_t v20 = _os_log_pack_size(28LL);
  uint64_t v7 = v20;
  id v19 = v5;
  unint64_t v6 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v18 = v7;
  uint64_t v17 = &v5[-v6];
  uint64_t v2 = _os_log_pack_fill(&v5[-v6], v20, 0LL, &_mh_execute_header, "Deleting contents of %{private}s %s (result: %d).");
  uint64_t v16 = v2;
  int v8 = 1;
  if (v32) {
    char v3 = "failed";
  }
  else {
    char v3 = "succeeded";
  }
  __os_log_helper_1_3_3_8_33_8_32_4_0(v2, (uint64_t)v33, (uint64_t)v3, v32);
  _LPLogPack(v8, (uint64_t)v17);
  removefile_state_free(v31);
  return v32;
}

uint64_t __os_log_helper_1_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_33_8_33(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 33;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t _execForLibpartition(char *const *a1)
{
  uint64_t v60 = (const char **)a1;
  unsigned int v59 = -1;
  pid_t v58 = 0;
  *(void *)uint64_t v62 = -1LL;
  if (pipe(v62))
  {
    uint64_t v32 = _os_log_pack_size(22LL);
    uint64_t v10 = v32;
    removefile_state_t v31 = &v7;
    unint64_t v9 = (v32 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    __chkstk_darwin();
    uint64_t v30 = v10;
    uint64_t v29 = (uint64_t)&v7 - v9;
    uint64_t v28 = _os_log_pack_fill( (char *)&v7 - v9,  v32,  0LL,  &_mh_execute_header,  "pipe failed while preparing to execute %s: %s",  v7,  v8);
    uint64_t v12 = v28;
    uint64_t v11 = *v60;
    int v4 = __error();
    int v5 = strerror(*v4);
    __os_log_helper_1_2_2_8_32_8_32(v12, (uint64_t)v11, (uint64_t)v5);
    _LPLogPack(1, v29);
  }

  else
  {
    uint64_t v26 = &v57;
    uint64_t v27 = 0LL;
    posix_spawn_file_actions_t v57 = 0LL;
    uint64_t v25 = &v56;
    posix_spawnattr_t v56 = 0LL;
    posix_spawn_file_actions_init(&v57);
    posix_spawn_file_actions_adddup2(&v57, v62[1], 1);
    posix_spawn_file_actions_addclose(&v57, v62[0]);
    posix_spawnattr_init(&v56);
    posix_spawnattr_setflags(&v56, 0x4000);
    unsigned int v59 = posix_spawn(&v58, *v60, &v57, 0LL, (char *const *)v60, 0LL);
    if (v59)
    {
      uint64_t v37 = _os_log_pack_size(22LL);
      uint64_t v14 = v37;
      uint64_t v36 = &v7;
      unint64_t v13 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      __chkstk_darwin();
      uint64_t v35 = v14;
      uint64_t v34 = (uint64_t)&v7 - v13;
      uint64_t v33 = _os_log_pack_fill((char *)&v7 - v13, v37, 0LL, &_mh_execute_header, "posix_spawn %s failed: %s", v7, v8);
      uint64_t v16 = v33;
      uint64_t v15 = *v60;
      char v3 = strerror(v59);
      __os_log_helper_1_2_2_8_32_8_32(v16, (uint64_t)v15, (uint64_t)v3);
      _LPLogPack(1, v34);
      close(v62[0]);
    }

    else
    {
      bzero(v61, 0x400uLL);
      ssize_t v55 = 0LL;
      int v54 = v62[0];
      close(v62[1]);
      v62[1] = -1;
      while (1)
      {
        ssize_t v55 = read(v54, v61, 0x400uLL);
        if (v55 <= 0) {
          break;
        }
        execlogfunction(@"%.*s", v55, v61);
      }

      int v53 = 0;
      if (waitpid(v58, &v53, 0) == -1)
      {
        unsigned int v59 = *__error();
        uint64_t v42 = _os_log_pack_size(22LL);
        uint64_t v18 = v42;
        char v41 = &v7;
        unint64_t v17 = (v42 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        __chkstk_darwin();
        uint64_t v40 = v18;
        uint64_t v39 = (uint64_t)&v7 - v17;
        uint64_t v38 = _os_log_pack_fill((char *)&v7 - v17, v42, 0LL, &_mh_execute_header, "waitpid failed for %s: %s", v7, v8);
        uint64_t v20 = v38;
        id v19 = *v60;
        uint64_t v1 = __error();
        uint64_t v2 = strerror(*v1);
        __os_log_helper_1_2_2_8_32_8_32(v20, (uint64_t)v19, (uint64_t)v2);
        _LPLogPack(1, v39);
      }

      else if ((v53 & 0x7F) != 0)
      {
        if ((v53 & 0x7F) == 0x7F || (v53 & 0x7F) == 0)
        {
          uint64_t v47 = _os_log_pack_size(18LL);
          uint64_t v22 = v47;
          uint64_t v46 = &v7;
          unint64_t v21 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          __chkstk_darwin();
          uint64_t v45 = v22;
          uint64_t v44 = (uint64_t)&v7 - v21;
          uint64_t v43 = _os_log_pack_fill( (char *)&v7 - v21,  v47,  0LL,  &_mh_execute_header,  "%s was stopped by signal %d",  v7,  (_DWORD)v8);
          __os_log_helper_1_2_2_8_32_4_0(v43, (uint64_t)*v60, v53 >> 8);
          _LPLogPack(1, v44);
          unsigned int v59 = -1;
        }

        else
        {
          uint64_t v52 = _os_log_pack_size(18LL);
          uint64_t v24 = v52;
          uint64_t v51 = &v7;
          unint64_t v23 = (v52 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          __chkstk_darwin();
          uint64_t v50 = v24;
          uint64_t v49 = (uint64_t)&v7 - v23;
          uint64_t v48 = _os_log_pack_fill( (char *)&v7 - v23,  v52,  0LL,  &_mh_execute_header,  "%s was terminated by signal %d",  v7,  (_DWORD)v8);
          __os_log_helper_1_2_2_8_32_4_0(v48, (uint64_t)*v60, v53 & 0x7F);
          _LPLogPack(1, v49);
          unsigned int v59 = -1;
        }
      }

      else
      {
        unsigned int v59 = BYTE1(v53);
      }
    }

    posix_spawnattr_destroy(&v56);
    posix_spawn_file_actions_destroy(&v57);
    if (v62[1] != -1) {
      close(v62[1]);
    }
  }

  return v59;
}

uint64_t __os_log_helper_1_2_3_8_64_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose(va, 8) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_64_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_64_8_65_8_65(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 65;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_64_8_65(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_64_8_32_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_32_8_65(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_32_8_65_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_32_8_33(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 33;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_2_2_4_0_8_32(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + _Block_object_dispose(va, 8) = 32;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

void ___is_running_in_ramdisk_block_invoke(id a1)
{
  v1[2] = (size_t)a1;
  v1[1] = (size_t)a1;
  bzero(__big, 0x400uLL);
  v1[0] = 1024LL;
  if (!sysctlbyname("kern.bootargs", __big, v1, 0LL, 0LL))
  {
    if (strstr(__big, "-restore")) {
      _is_running_in_ramdisk_is_ramdisk = 1;
    }
  }

uint64_t _lp2_delete_directory_contents_confirm()
{
  return 0LL;
}

uint64_t _lp2_delete_directory_contents_error(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  unint64_t v17 = a3;
  uint64_t v16 = a3;
  int v15 = 0;
  int v15 = *__error();
  *uint64_t v16 = v15;
  uint64_t v14 = _os_log_pack_size(22LL);
  uint64_t v7 = v14;
  unint64_t v13 = &v5;
  unint64_t v6 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v12 = v7;
  uint64_t v11 = (uint64_t)&v5 - v6;
  uint64_t v10 = _os_log_pack_fill( (char *)&v5 - v6,  v14,  0LL,  &_mh_execute_header,  "Could not removefile(3) path %{private}s: %s");
  uint64_t v9 = v10;
  uint64_t v8 = v18;
  char v3 = strerror(v15);
  __os_log_helper_1_3_2_8_33_8_32(v9, v8, (uint64_t)v3);
  _LPLogPack(1, v11);
  return 2LL;
}

uint64_t __os_log_helper_1_3_1_8_33(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t _lp2_reset_directory_metadata(const char *a1)
{
  unsigned int v4 = 0;
  int from_fd = -1;
  strcpy(path, ".XXXXXXXX");
  int dfd = open(a1, 1048832);
  if (dfd == -1)
  {
    unsigned int v4 = *__error();
  }

  else
  {
    int from_fd = mkstempsat_np(dfd, path, 8);
    if (from_fd == -1 || unlinkat(dfd, path, 0) || fcopyfile(from_fd, dfd, 0LL, 5u)) {
      unsigned int v4 = *__error();
    }
  }

  if (from_fd != -1) {
    close(from_fd);
  }
  if (dfd != -1) {
    close(dfd);
  }
  return v4;
}

uint64_t __os_log_helper_1_3_2_8_33_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_33_8_32_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void execlogfunction(id obj, ...)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  va_copy((va_list)&v11[1], va);
  uint64_t v1 = objc_alloc(&OBJC_CLASS___NSString);
  v11[0] = -[NSString initWithFormat:arguments:](v1, "initWithFormat:arguments:", location, va);
  uint64_t v10 = _os_log_pack_size(12LL);
  uint64_t v5 = v10;
  uint64_t v9 = &v2;
  unint64_t v4 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v8 = v5;
  uint64_t v7 = (uint64_t)&v2 - v4;
  uint64_t v6 = _os_log_pack_fill((char *)&v2 - v4, v10, 0LL, &_mh_execute_header, "%@");
  __os_log_helper_1_2_1_8_64(v6, (uint64_t)v11[0]);
  _LPLogPack(3, v7);
  id v3 = 0LL;
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&location, v3);
}

uint64_t __os_log_helper_1_2_2_8_32_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id _LPLogObject()
{
  predicate = (dispatch_once_t *)&_LPLogObject_onceToken;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &__block_literal_global_14);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)_LPLogObject_obj;
}

void _LPLogPack(int a1, uint64_t a2)
{
  if (sLogLevel >= a1)
  {
    id v3 = _LPLogObject();
    unint64_t v4 = (char *)os_log_pack_compose(a2);

    if ((sLogToStandardOut & 1) != 0) {
      fprintf(__stdoutp, "%s\n", v4);
    }
    if ((sLogToOSLog & 1) != 0)
    {
      id v2 = _LPLogObject();
      os_log_pack_send(a2);
    }

    if ((sLogToConsole & 1) != 0) {
      dprintf(sConsoleFD, "%s\n", v4);
    }
    free(v4);
  }

uint64_t __os_log_helper_1_2_4_8_32_8_64_4_0_8_32(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 2_Block_object_dispose(va, 8) = 32;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_4_8_32_8_32_8_33_8_65( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 33;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 65;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_4_0_8_32(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose(va, 8) = 32;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 32);
  id v3 = (id *)(a1 + 32);
  *id v3 = 0LL;
  objc_storeStrong(v3, v2);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

uint64_t _longFromNVRAMVar(NSString *a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(a1, v2) & 1) != 0)
  {
    a1 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a1, 4LL);
  }

  else
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(a1, v3) & 1) == 0) {
      return 0LL;
    }
  }

  if (a1) {
    return -[NSString longLongValue](a1, "longLongValue");
  }
  return 0LL;
}

void __copy_helper_block_e8_32o(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32o(uint64_t a1)
{
}

void _log( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a2, &a9);
  logfunction("", 1, @"%@\n", v10, v11, v12, v13, v14, (char)v9);
}

LABEL_45:
  _log( (uint64_t)v45,  (uint64_t)@"[%s] (%@) - %@\n",  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)"-[UMEventRecorder _recordEvent:getPowerLog:information:callback:]");
  -[UMEventRecorder _saveEvent:](self, "_saveEvent:", v17);
  if (a6) {
    (*((void (**)(id, void *))a6 + 2))(a6, v17);
  }
}

void __copy_helper_block_e8_32o40o(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32o40o(uint64_t a1)
{
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
}

void __copy_helper_block_e8_32o40o48o56o64o72o80b(uint64_t a1, const void **a2)
{
}

void __destroy_helper_block_e8_32o40o48o56o64o72o80b(const void **a1)
{
}

void __copy_helper_block_e8_32o40o48o56o64b(uint64_t a1, const void **a2)
{
}

void __destroy_helper_block_e8_32o40o48o56o64b(const void **a1)
{
}

void __copy_helper_block_e8_32o40o48o(uint64_t a1, const void **a2)
{
}

void __destroy_helper_block_e8_32o40o48o(const void **a1)
{
}

uint64_t _partition_log( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_loggingPtr) {
    return _loggingPtr(result, &a9);
  }
  return result;
}

uint64_t partition_probe_media( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v11 = 0;
  unsigned __int8 should_retry = 1;
  for (int i = 0; i < 3; ++i)
  {
    unsigned __int8 should_retry = _partition_probe_media_should_retry(&v11, a2, a3, a4, a5, a6, a7, a8);
    if (should_retry == 1 || !should_retry && !v11) {
      break;
    }
  }

  return should_retry;
}

uint64_t is_device_formatted_for_apfs()
{
  return using_APFS & 1;
}

BOOL is_storage_apfs( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _partition_wait_for_device( const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v87 = 0;
  io_object_t v86 = 0;
  io_registry_entry_t whole_child = 0;
  CFTypeRef CFProperty = 0LL;
  _partition_log( (uint64_t)"entering %s: '%s'\n",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"_partition_wait_for_device");
  if (a1)
  {
    if (a2)
    {
      embedded_storage_service_query_dict = _partition_create_embedded_storage_service_query_dict(a1);
      if (embedded_storage_service_query_dict)
      {
        io_object_t v86 = _partition_wait_for_io_service_matching_dict(embedded_storage_service_query_dict, 0x1Eu);
        if (v86)
        {
          io_registry_entry_t whole_child = _partition_find_whole_child(v86);
          if (whole_child)
          {
            CFTypeRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( whole_child,  @"BSD Name",  kCFAllocatorDefault,  0);
            if (CFProperty)
            {
              CFTypeID v81 = CFGetTypeID(CFProperty);
              if (v81 == CFStringGetTypeID())
              {
                __strlcpy_chk(a2, "/dev/", a3, -1LL);
                buffer = (char *)&a2[strlen(a2)];
                size_t v50 = strlen(a2);
                if (CFStringGetCString(CFProperty, buffer, a3 - v50, 0x8000100u))
                {
                  _partition_log( (uint64_t)"Using device path %s for %s\n",  v51,  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)a2);
                  int v82 = 10;
                  while (1)
                  {
                    BOOL v79 = 0;
                    if (!v87)
                    {
                      int v65 = v82--;
                      BOOL v79 = v65 > 0;
                    }

                    if (!v79) {
                      break;
                    }
                    if (access(a2, 0))
                    {
                      if (*__error() != 2)
                      {
                        stat v66 = __error();
                        strerror(*v66);
                        _partition_log( (uint64_t)"stat error while waiting for device '%s': %s\n",  v67,  v68,  v69,  v70,  v71,  v72,  v73,  (uint64_t)a2);
                        break;
                      }

                      sleep(3u);
                    }

                    else
                    {
                      unsigned __int8 v87 = 1;
                    }
                  }

                  if (!v87) {
                    _partition_log((uint64_t)"timeout waiting for %s", v58, v59, v60, v61, v62, v63, v64, (uint64_t)a1);
                  }
                }

                else
                {
                  _partition_log( (uint64_t)"failed to create C string from BSD name",  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v75);
                }
              }

              else
              {
                _partition_log( (uint64_t)"returnbed BSD device name for service %s is wrong type",  v43,  v44,  v45,  v46,  v47,  v48,  v49,  (uint64_t)a1);
              }
            }

            else
            {
              _partition_log( (uint64_t)"no BSD device name for service %s",  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)a1);
            }
          }

          else
          {
            fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "service != IO_OBJECT_NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2885,  0LL);
          }
        }

        else
        {
          fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "root_service != IO_OBJECT_NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2882,  0LL);
          _partition_log((uint64_t)"failed to lookup IO service for %s", v29, v30, v31, v32, v33, v34, v35, (uint64_t)a1);
        }
      }

      else
      {
        fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "match_dict != NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2878,  0LL);
        _partition_log((uint64_t)"failed to allocate device lookup dict", v22, v23, v24, v25, v26, v27, v28, v78);
      }
    }

    else
    {
      fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "path != NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2874,  0LL);
      _partition_log((uint64_t)"path argument is NULL", v15, v16, v17, v18, v19, v20, v21, v77);
    }
  }

  else
  {
    fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "service_type != NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2873,  0LL);
    _partition_log((uint64_t)"type argument is NULL", v8, v9, v10, v11, v12, v13, v14, v76);
  }

  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (whole_child) {
    IOObjectRelease(whole_child);
  }
  if (v86) {
    IOObjectRelease(v86);
  }
  return v87;
}

uint64_t _partition_probe_media_should_retry( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v102 = a1;
  unsigned __int8 v101 = 0;
  char v100 = 0;
  unsigned int CFProperties = 0;
  io_iterator_t iterator = 0;
  io_service_t service = 0;
  io_object_t object = 0;
  CFDictionaryRef matching = 0LL;
  CFTypeRef cf = 0LL;
  storage_device_node_path = 0;
  apfs_container_device_node_path = 0;
  system_device_node_path = 0;
  data_device_node_path = 0;
  user_device_node_path = 0;
  baseband_data_partition_device_node_path = 0;
  update_device_node_path = 0;
  scratch_device_node_path = 0;
  xart_device_node_path = 0;
  apfs_recovery_os_container_device_node_path = 0;
  recovery_os_volume_device_node_path = 0;
  preboot_partition_device_node_path = 0;
  iboot_system_container_device_node_path = 0;
  using_LwVM = 0;
  using_APFS = 0;
  if (_partition_wait_for_device( "EmbeddedDeviceTypeRoot",  &storage_device_node_path,  32LL,  a4,  a5,  a6,  a7,  a8))
  {
    uint64_t v93 = 0LL;
    _partition_log( (uint64_t)"entering %s.",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"_partition_probe_media_should_retry");
    CFDictionaryRef matching = IOBSDNameMatching(kIOMasterPortDefault, 0, byte_10006904D);
    io_service_t service = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
    if (!service)
    {
      _partition_log( (uint64_t)"unable to find service for %s",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)byte_10006904D);
      unsigned __int8 v101 = 1;
      goto LABEL_89;
    }

    IOServiceWaitQuiet(service, 0LL);
    unsigned int CFProperties = IORegistryEntryCreateIterator(service, "IOService", 1u, &iterator);
    if (CFProperties)
    {
      _partition_log( (uint64_t)"unable to create child iterator: 0c%.8x",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  CFProperties);
      goto LABEL_89;
    }

    while (1)
    {
      while (1)
      {
        io_object_t object = IOIteratorNext(iterator);
        if (!object)
        {
          unsigned __int8 v101 = 1;
          goto LABEL_89;
        }

        if (IOObjectConformsTo(object, "IOMedia")) {
          break;
        }
LABEL_85:
        if (object) {
          IOObjectRelease(object);
        }
      }

      memset(__b, 0, sizeof(__b));
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      IORegistryEntryGetName(object, __b);
      unsigned int CFProperties = IORegistryEntryCreateCFProperties(object, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
      if (CFProperties)
      {
LABEL_12:
        _partition_log( (uint64_t)"unable to get properies for media registry entry: 0x%.8x",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  CFProperties);
        goto LABEL_89;
      }

      if (!v100)
      {
        CFTypeRef cf1 = CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
        if (cf1)
        {
          if (CFEqual(cf1, @"disk0s1s1")) {
            char v100 = 1;
          }
        }
      }

      CFTypeRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"Content Hint");
      if (Value && CFEqual(Value, @"LightweightVolumeManager_Media"))
      {
        using_LwVM = 1;
      }

      else
      {
        if (!Value
          || !CFEqual(Value, @"7C3457EF-0000-11AA-AA11-00306543ECAC")
          && !CFEqual(Value, @"52637672-7900-11AA-AA11-00306543ECAC")
          && !CFEqual(Value, @"69646961-6700-11AA-AA11-00306543ECAC")
          && !CFEqual(Value, @"EF57347C-0000-11AA-AA11-00306543ECAC"))
        {
          if (!strcmp(__b, off_100068C28) || strstr(__b, "OS"))
          {
            unsigned __int8 v87 = &system_device_node_path;
            if (!v100)
            {
              _partition_log( (uint64_t)"found system volume not at disk0s1s1: %s\n",  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)__b);
              char v100 = 1;
            }
          }

          else if (!strcmp(__b, off_100068C68))
          {
            unsigned __int8 v87 = &data_device_node_path;
          }

          else if (!strcmp(__b, off_100068C88))
          {
            unsigned __int8 v87 = &user_device_node_path;
          }

          else if (!strcmp(__b, off_100068CA8))
          {
            unsigned __int8 v87 = &baseband_data_partition_device_node_path;
          }

          else if (!strcmp(__b, off_100068CC8))
          {
            unsigned __int8 v87 = &update_device_node_path;
          }

          else if (!v100 || system_device_node_path)
          {
            if (!strcmp(__b, off_100068CE8))
            {
              unsigned __int8 v87 = &scratch_device_node_path;
            }

            else if (!strcmp(__b, off_100068C48))
            {
              unsigned __int8 v87 = &xart_device_node_path;
            }

            else if (!strcmp(__b, off_100068D28))
            {
              unsigned __int8 v87 = &recovery_os_volume_device_node_path;
            }

            else if (!strcmp(__b, off_100068D08))
            {
              unsigned __int8 v87 = &preboot_partition_device_node_path;
            }

            else
            {
              _partition_log( (uint64_t)"unexpected partition '%s' - skipping",  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)__b);
              unsigned __int8 v87 = 0LL;
            }
          }

          else
          {
            _partition_log( (uint64_t)"looking for a system volume, and found unknown volume '%s'. using it as the system volume.\n",  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)__b);
            unsigned __int8 v87 = &system_device_node_path;
          }

          if (v87 && *v87)
          {
            _partition_log( (uint64_t)"encountered second '%s' partition; original was '%s'",
              v64,
              v65,
              v66,
              v67,
              v68,
              v69,
              v70,
              (uint64_t)__b);
            goto LABEL_89;
          }

          while (1)
          {
            BOOLean = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Leaf");
            if (BOOLean)
            {
              if (CFBooleanGetValue(BOOLean) == 1) {
                break;
              }
            }

            IOObjectRelease(object);
            CFRelease(cf);
            CFTypeRef cf = 0LL;
            while (1)
            {
              io_object_t object = IOIteratorNext(iterator);
              if (!object || IOObjectConformsTo(object, "IOMedia")) {
                break;
              }
              IOObjectRelease(object);
            }

            if (!object)
            {
              _partition_log( (uint64_t)"ran out of registry entries without finding a leaf media object",  v71,  v72,  v73,  v74,  v75,  v76,  v77,  v86);
              goto LABEL_89;
            }

            unsigned int CFProperties = IORegistryEntryCreateCFProperties( object,  (CFMutableDictionaryRef *)&cf,  kCFAllocatorDefault,  0);
            if (CFProperties) {
              goto LABEL_12;
            }
          }

          if (v87)
          {
            cf1b = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
            if (!cf1b)
            {
              _partition_log((uint64_t)"leaf media object with no bsd name", v78, v79, v80, v81, v82, v83, v84, v86);
              goto LABEL_89;
            }

            *(_OWORD *)uint64_t v103 = 0u;
            __int128 v104 = 0u;
            CFStringGetCString(cf1b, v103, 32LL, 0x8000100u);
            __snprintf_chk(v87, 0x20uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%s%s", "/dev/", v103);
          }

          goto LABEL_85;
        }

        cf1a = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
        if (!cf1a)
        {
          _partition_log((uint64_t)"APFS Container object with no bsd name", v36, v37, v38, v39, v40, v41, v42, v86);
          goto LABEL_89;
        }

        memset(buffer, 0, sizeof(buffer));
        CFStringGetCString(cf1a, (char *)buffer, 32LL, 0x8000100u);
        if (CFEqual(Value, @"7C3457EF-0000-11AA-AA11-00306543ECAC") == 1)
        {
          if (strstr(__b, "RecoveryOSContainer"))
          {
            uint64_t v93 = &apfs_recovery_os_container_device_node_path;
            __snprintf_chk( &apfs_recovery_os_container_device_node_path,  0x20uLL,  0,  0xFFFFFFFFFFFFFFFFLL,  "%s%s",  "/dev/",  (const char *)buffer);
          }

          else if (!strcmp(__b, "iBootSystemContainer"))
          {
            uint64_t v93 = &iboot_system_container_device_node_path;
            __snprintf_chk( &iboot_system_container_device_node_path,  0x20uLL,  0,  0xFFFFFFFFFFFFFFFFLL,  "%s%s",  "/dev/",  (const char *)buffer);
          }

          else
          {
            uint64_t v93 = &apfs_container_device_node_path;
            __snprintf_chk( &apfs_container_device_node_path,  0x20uLL,  0,  0xFFFFFFFFFFFFFFFFLL,  "%s%s",  "/dev/",  (const char *)buffer);
          }

          _partition_log((uint64_t)"APFS Container '%s' %s\n", v43, v44, v45, v46, v47, v48, v49, (uint64_t)__b);
        }

        else if (CFEqual(Value, @"EF57347C-0000-11AA-AA11-00306543ECAC") == 1)
        {
          if (v93 && *v93)
          {
            _partition_log( (uint64_t)"Found synthesized APFS container. Using %s instead of %s\n",  v50,  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)buffer);
            __snprintf_chk(v93, 0x20uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%s%s", "/dev/", (const char *)buffer);
            uint64_t v93 = 0LL;
          }

          else
          {
            _partition_log( (uint64_t)"found synthesized container without original device node\n",  v50,  v51,  v52,  v53,  v54,  v55,  v56,  v86);
          }
        }

        if (v93 && !*v93)
        {
          __snprintf_chk(v93, 0x20uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%s%s", "/dev/", (const char *)buffer);
          _partition_log((uint64_t)"APFS Container '%s' %s\n", v57, v58, v59, v60, v61, v62, v63, (uint64_t)__b);
        }

        using_APFS = 1;
        IOObjectRelease(object);
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }
    }
  }

  _partition_log( (uint64_t)"Unable to find storage device node for service named: %s",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"EmbeddedDeviceTypeRoot");
LABEL_89:
  if (iterator)
  {
    if (!IOIteratorIsValid(iterator))
    {
      unsigned __int8 v101 = 0;
      if (v102) {
        *uint64_t v102 = 1;
      }
    }
  }

  if (object) {
    IOObjectRelease(object);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (service) {
    IOObjectRelease(service);
  }
  return v101;
}

uint64_t get_main_container_space_info( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v63 = a1;
  uint64_t v62 = (void *)a2;
  uint64_t v61 = (void *)a3;
  uint64_t v60 = (void *)a4;
  uint64_t v59 = (void *)a5;
  unsigned int SpaceInfo = 0;
  uint64_t v57 = 0LL;
  uint64_t v56 = 0LL;
  uint64_t v55 = 0LL;
  uint64_t v54 = 0LL;
  uint64_t v53 = 0LL;
  _partition_log((uint64_t)"entering %s\n", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"get_main_container_space_info");
  if (apfs_container_device_node_path)
  {
    uint64_t v52 = 0LL;
    uint64_t v51 = 0LL;
    unsigned int SpaceInfo = APFSContainerGetSpaceInfo(&apfs_container_device_node_path, &v52, &v51);
    if (SpaceInfo)
    {
      _partition_log( (uint64_t)"APFSContainerGetSpaceInfo failed with result:%d",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  SpaceInfo);
    }

    else
    {
      uint64_t v57 = v51;
      uint64_t v53 = v52;
    }
  }

  else
  {
    _partition_log( (uint64_t)"No container device found, can't retrieve space info",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v44);
  }

  if (system_device_node_path)
  {
    uint64_t v50 = 0LL;
    uint64_t v49 = 0LL;
    unsigned int SpaceInfo = APFSVolumeGetSpaceInfo(&system_device_node_path, &v49, &v50);
    if (SpaceInfo) {
      _partition_log( (uint64_t)"APFSVolumeGetSpaceInfo for system volume failed with result:%d",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  SpaceInfo);
    }
    else {
      uint64_t v56 = v50;
    }
  }

  else
  {
    _partition_log((uint64_t)"No system device found, can't retrieve space info", v15, v16, v17, v18, v19, v20, v21, v44);
  }

  if (data_device_node_path)
  {
    uint64_t v48 = 0LL;
    uint64_t v47 = 0LL;
    unsigned int SpaceInfo = APFSVolumeGetSpaceInfo(&data_device_node_path, &v47, &v48);
    if (SpaceInfo) {
      _partition_log( (uint64_t)"APFSVolumeGetSpaceInfo for data volume failed with result:%d",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  SpaceInfo);
    }
    else {
      uint64_t v55 = v48;
    }
  }

  else
  {
    _partition_log((uint64_t)"No data device found, can't retrieve space info", v22, v23, v24, v25, v26, v27, v28, v44);
  }

  if (preboot_partition_device_node_path)
  {
    uint64_t v46 = 0LL;
    uint64_t v45 = 0LL;
    uint64_t result = APFSVolumeGetSpaceInfo(&preboot_partition_device_node_path, &v45, &v46);
    unsigned int SpaceInfo = result;
    if ((_DWORD)result) {
      uint64_t result = _partition_log( (uint64_t)"APFSVolumeGetSpaceInfo for preboot volume failed with result:%d",  v37,  v38,  v39,  v40,  v41,  v42,  v43,  SpaceInfo);
    }
    else {
      uint64_t v54 = v46;
    }
  }

  else
  {
    uint64_t result = _partition_log( (uint64_t)"No preboot device found, can't retrieve space info",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v44);
  }

  if (v63) {
    *uint64_t v63 = v56;
  }
  if (v62) {
    *uint64_t v62 = v55;
  }
  if (v61) {
    *uint64_t v61 = v54;
  }
  if (v60) {
    void *v60 = v57;
  }
  if (v59) {
    *uint64_t v59 = v53;
  }
  return result;
}

__CFDictionary *_partition_create_embedded_storage_service_query_dict(const char *a1)
{
  theDict = 0LL;
  CFMutableStringRef Mutable = 0LL;
  CFStringRef key = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
  if (key)
  {
    theDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (theDict)
    {
      CFDictionaryAddValue(theDict, key, kCFBooleanTrue);
      CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (Mutable) {
        CFDictionaryAddValue(Mutable, @"IOPropertyMatch", theDict);
      }
    }
  }

  if (key) {
    CFRelease(key);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  return Mutable;
}

uint64_t _partition_wait_for_io_service_matching_dict(const void *a1, unsigned int a2)
{
  LODWORD(v13) = 0;
  do
  {
    else {
      unsigned int v11 = 3;
    }
    CFRetain(a1);
    HIDWORD(v13) = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)a1);
    if (!HIDWORD(v13))
    {
      theString = CFCopyDescription(a1);
      CStringPtr = CFStringGetCStringPtr(theString, 0);
      _partition_log( (uint64_t)"waiting for matching IOKit service: %s\n",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)CStringPtr);
      sleep(v11);
      LODWORD(v13) = v13 + v11;
      CFRelease(theString);
    }
  }

  while (v13 < a2);
  CFRelease(a1);
  return HIDWORD(v13);
}

uint64_t _partition_find_whole_child(io_object_t a1)
{
  HIDWORD(v44) = a1;
  LODWORD(v44) = 0;
  IOObjectRetain(a1);
  while (1)
  {
    io_object_t v43 = 0;
    io_iterator_t iterator = 0;
    unsigned int v41 = 0;
    if (IORegistryEntryGetChildIterator(HIDWORD(v44), "IOService", &iterator))
    {
      _partition_log((uint64_t)"Could not create child iterator", v1, v2, v3, v4, v5, v6, v7, v37);
      goto LABEL_21;
    }

    while (1)
    {
      io_object_t object = IOIteratorNext(iterator);
      if (!object) {
        break;
      }
      ++v41;
      if (v43) {
        IOObjectRelease(object);
      }
      else {
        io_object_t v43 = object;
      }
    }

    IOObjectRelease(iterator);
    if (v41 != 1) {
      break;
    }
    IOObjectRelease(HIDWORD(v44));
    HIDWORD(v44) = v43;
    io_object_t v43 = 0;
    if (IOObjectConformsTo(HIDWORD(v44), "IOMedia"))
    {
      CFTypeRef cf = IORegistryEntryCreateCFProperty(HIDWORD(v44), @"Whole", kCFAllocatorDefault, 0);
      if (cf)
      {
        CFTypeID v38 = CFGetTypeID(cf);
        if (v38 == CFBooleanGetTypeID())
        {
          if (CFBooleanGetValue((CFBooleanRef)cf)) {
            uint64_t v44 = HIDWORD(v44);
          }
          else {
            _partition_log((uint64_t)"Expected Whole=true", v29, v30, v31, v32, v33, v34, v35, v37);
          }
        }

        else
        {
          _partition_log((uint64_t)"Expected Whole to be BOOLean", v22, v23, v24, v25, v26, v27, v28, v37);
        }

        CFRelease(cf);
      }

      else
      {
        _partition_log((uint64_t)"Did not find Whole property on IOMedia class", v15, v16, v17, v18, v19, v20, v21, v37);
      }

      goto LABEL_21;
    }
  }

  if (v43)
  {
    IOObjectRelease(v43);
    io_object_t v43 = 0;
  }

  _partition_log((uint64_t)"Found %d child nodes (expected 1)", v8, v9, v10, v11, v12, v13, v14, v41);
LABEL_21:
  if (HIDWORD(v44)) {
    IOObjectRelease(HIDWORD(v44));
  }
  return v44;
}

BOOL RCGetSystemPartitionExtrasSizeForDevice(int a1, CFDictionaryRef theDict, void *a3, CFStringRef *a4)
{
  if (a3)
  {
    if (theDict
      && (CFTypeRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"SystemFirmwareExtrasSize")) != 0LL)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, a3);
      unint64_t v7 = *a3;
      if (a4)
      {
        *a4 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d MB as defined by the value of the SystemFirmwareExtrasSize in the options dictionary.",  v7 >> 20);
        unint64_t v7 = *a3;
      }
    }

    else
    {
      if (a4) {
        *a4 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d MB for APFS padding + %d MB for Restore Log + %d MB for Baseband FW + %d MB for Calibration Data + %d MB for SEP FW + 5 MB of wiggle room.",  25LL,  1LL,  80LL,  5LL,  5LL);
      }
      unint64_t v7 = 121LL;
    }

    *a3 = v7 << 20;
  }

  return a3 != 0LL;
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void submitRestoreLogFileToLogDir_cold_1()
{
  BOOL v0 = __error();
  uint64_t v1 = _os_assert_log(*v0);
  _os_crash(v1);
  __break(1u);
}

void main_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void main_cold_2()
{
}

void main_cold_3()
{
}

void main_cold_4()
{
}

void main_cold_5(os_log_s *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, a1, v3, "[MAIN] Could not register atexit: %s", v4);
  OUTLINED_FUNCTION_5();
}

void main_cold_6( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_update_metrics_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_update_metrics_cold_2()
{
}

void handle_update_metrics_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __main_block_invoke_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __main_block_invoke_cold_2()
{
}

void __main_block_invoke_2_cold_1(void *a1, os_log_s *a2)
{
}

void __main_block_invoke_3_cold_1(void *a1, os_log_s *a2)
{
}

void __main_block_invoke_3_cold_2()
{
}

void handle_get_stashed_connectivity_data_command_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_get_stashed_connectivity_data_command_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_get_stashed_connectivity_data_command_cold_3()
{
}

void handle_get_stashed_connectivity_data_command_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_get_stashed_connectivity_data_command_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_report_and_cleanup_command_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_report_and_cleanup_command_cold_2()
{
}

void handle_perform_cryptegraft_semisplat_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_cryptegraft_semisplat_cold_2()
{
}

void handle_perform_cryptegraft_downlevel_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_cryptegraft_downlevel_cold_2()
{
}

void __copy_shared_update_brain_connection_block_invoke_cold_1()
{
}

void __copy_shared_update_brain_connection_block_invoke_cold_2()
{
}

id objc_msgSend__copyUnsubmittedEventsFromDirectory_skipEventsIfPreviouslySubmittedAndWithinBackoffTime_previouslySubmittedEventSkipped_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime:previouslySubmittedEventSkipped:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}