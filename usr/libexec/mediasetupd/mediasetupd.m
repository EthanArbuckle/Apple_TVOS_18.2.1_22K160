BOOL sub_10000451C(id a1, MSPublicDBInfo *a2)
{
  void *v2;
  void *v3;
  void *v4;
  v2 = (void *)kExcludedBundleIDs;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo bundleIDS](a2, "bundleIDS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  LOBYTE(v2) = [v2 containsObject:v4] ^ 1;

  return (char)v2;
}

id sub_100004580(id a1, MSPublicDBInfo *a2)
{
  v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___MSServiceAppInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo serviceName](v2, "serviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo bundleIDS](v2, "bundleIDS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  id v7 = [v3 initWithServiceName:v4 serviceBundleID:v6 useInHome:1 subscriptionStatus:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo bundleIDS](v2, "bundleIDS"));
  [v7 setAlternateBundleIDS:v8];

  return v7;
}

id sub_100004A84(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
  if ([v6 isEqualToString:v7])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
    if ([v8 isEqualToString:MSServiceAccountRecordType])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 homeID]);
      id v10 = [v9 isEqual:*(void *)(a1 + 40)];
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

id sub_100004B74(id a1, MSDDefaultsInfo *a2)
{
  return -[MSDDefaultsInfo homeUserID](a2, "homeUserID");
}

uint64_t sub_100004D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
      uint64_t v7 = [v6 authFatalError] ^ 1;
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

id sub_100004E9C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 service]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v5));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAppSelectionAssistant appServiceInfoForUser:usingPublicInfo:]( &OBJC_CLASS___MSDAppSelectionAssistant,  "appServiceInfoForUser:usingPublicInfo:",  *(void *)(a1 + 32),  v6));
  return v7;
}

void sub_1000053BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.mediasetupd") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100040B04();
  }

  id v1 = NSTemporaryDirectory();
  id v2 = sub_10003E9DC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "mediasetupd launching", v7, 2u);
  }

  id v4 = +[MSDManager sharedInstance](&OBJC_CLASS___MSDManager, "sharedInstance");
  objc_autoreleasePoolPop(v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v5 run];

  return 0LL;
}

void sub_1000055E0(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDCloudManager sharedManager](&OBJC_CLASS___MSDCloudManager, "sharedManager"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  id v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithCloudDataManager:v5 homeManager:v2];
  id v4 = (void *)qword_100070760;
  qword_100070760 = (uint64_t)v3;
}

void sub_100005808( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

CFStringRef MSDDataRefreshReasonToString(unint64_t a1)
{
  if (a1 > 9) {
    return @"Unknown";
  }
  else {
    return off_100060AD8[a1];
  }
}

void sub_100005850(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    LOBYTE(v6[3]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v6 + 2);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
    }
  }
}

LABEL_34:
  v50 = v5;
LABEL_38:

  return v50;
}

void sub_100006120(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100007758((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  id v15 = sub_10003E9DC();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceAppInfo]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceBundleID]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 userAccountInfo]);
    int v20 = 138412547;
    v21 = v18;
    __int16 v22 = 2113;
    v23 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Retrieved now playing application bundleID %@ for user %{private}@",  (uint8_t *)&v20,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1000064A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordEvent:@"End"];
}

id sub_1000064DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordEvent:@"End"];
}

void sub_100006728( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100006744(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006754(uint64_t a1)
{
}

void sub_10000675C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100007858((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v5;
  id v17 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100006940(_Unwind_Exception *a1)
{
}

void sub_10000695C(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _trackResolvingResult:a4 toTrackingSession:*(void *)(a1 + 32)];

  id v13 = objc_loadWeakRetained((id *)(a1 + 48));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100006A60;
  v15[3] = &unk_100060BA8;
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v14 = v9;
  [v13 _handleResolvedService:v11 homeUserID:v10 completion:v15];
}

void sub_100006A60(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v5) {
    id v5 = a3;
  }
  id v7 = v5;
  id v10 = a3;
  id v8 = a2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 translateCKErrorToMSError]);
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v9);
}

void sub_100006C90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

void sub_100006CC4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  if ([*(id *)(a1 + 32) checkForDefaultService])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    if ([v11 isEqualToString:MSErrorDomain])
    {
      id v12 = [v10 code];

      if (v12 == (id)5)
      {
        id v13 = sub_10003E9DC();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 72LL);
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "We cant play from the AlternativeProvider bundleID (%@), falling back to default service",  buf,  0xCu);
        }

        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) updateServiceBundleIDForResolution:0];
        id v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100006F64;
        v23[3] = &unk_100060BF8;
        objc_copyWeak(&v25, (id *)(a1 + 56));
        id v24 = *(id *)(a1 + 40);
        [v16 performUserAndServiceResolution:v23];

        objc_destroyWeak(&v25);
        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  id v17 = sub_10003E9DC();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Fetched valid resolution results", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000070C8;
  v20[3] = &unk_100060BA8;
  id v21 = v10;
  id v22 = *(id *)(a1 + 40);
  [WeakRetained _handleResolvedService:v8 homeUserID:v9 completion:v20];

LABEL_11:
}

void sub_100006F48(_Unwind_Exception *a1)
{
}

void sub_100006F64(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100007040;
  v13[3] = &unk_100060BA8;
  id v14 = v8;
  id v15 = *(id *)(a1 + 32);
  id v12 = v8;
  [WeakRetained _handleResolvedService:v10 homeUserID:v9 completion:v13];
}

void sub_100007040(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v5) {
    id v5 = a3;
  }
  id v7 = v5;
  id v10 = a3;
  id v8 = a2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 translateCKErrorToMSError]);
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v9);
}

void sub_1000070C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v5) {
    id v5 = a3;
  }
  id v7 = v5;
  id v10 = a3;
  id v8 = a2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 translateCKErrorToMSError]);
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v9);
}

LABEL_19:
    goto LABEL_20;
  }

  id v25 = sub_10003E9DC();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Nil homeUserID OR MultiUser is not enabled for Siri, sending nil sharedUserID",  buf,  2u);
  }

  if (v10)
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[MSDServiceResolutionHelper createMSResolutionInfoObject:homeUserID:sharedUserID:]( &OBJC_CLASS___MSDServiceResolutionHelper,  "createMSResolutionInfoObject:homeUserID:sharedUserID:",  v8,  v9,  0LL));
    uint64_t v27 = sub_10003E9DC();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v16;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Resolved ServiceInfo %@", buf, 0xCu);
    }

    v10[2](v10, v16, 0LL);
    goto LABEL_19;
  }
}

LABEL_20:
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
}

void sub_100007508( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100007554(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100007858((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v5;
  id v17 = v5;

  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v6;
  id v20 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000076DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100007700()
{
}

void sub_10000772C()
{
}

void sub_100007758( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000077BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000782C()
{
}

void sub_100007858( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000078BC()
{
}

LABEL_25:
  return v13;
}
}

  _Block_object_dispose(&v57, 8);
}
}

id sub_1000081F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceID]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) serviceID]);
  if ([v6 isEqualToString:v7])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
    id v9 = [v8 isEqualToString:MSServiceAccountRecordType];
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

id sub_1000082C4(id a1, MSDDefaultsInfo *a2)
{
  return -[MSDDefaultsInfo homeUserID](a2, "homeUserID");
}

id sub_1000084EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceID]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) serviceID]);
  if ([v6 isEqualToString:v7])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
    id v9 = [v8 isEqualToString:MSServiceAccountRecordType];
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

id sub_1000085B8(id a1, MSDDefaultsInfo *a2)
{
  return -[MSDDefaultsInfo homeUserID](a2, "homeUserID");
}

LABEL_27:
}

LABEL_16:
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100009970;
    v60[3] = &unk_100060CD8;
    v61 = (os_log_s *)v8;
    v59 = v12;
    v62 = v12;
    v63 = self;
    v58 = v9;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ms_objectsPassingTest:", v60));
    v30 = [v29 mutableCopy];

    v31 = sub_10003E9DC();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [v30 count];
      *(_DWORD *)buf = 134217984;
      v67 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Now looking for service amongst %lu potential services",  buf,  0xCu);
    }

    if ([v30 count])
    {
      while (1)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v30, v57));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 anyObject]);

        v36 = sub_10003E9DC();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue([v35 service]);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v38 serviceID]);
          v40 = (void *)objc_claimAutoreleasedReturnValue([v35 homeUserID]);
          *(_DWORD *)buf = 138412546;
          v67 = v39;
          v68 = 2112;
          v69 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Checking validity for %@ and user %@",  buf,  0x16u);
        }

        usersInHome = self->_usersInHome;
        v42 = (void *)objc_claimAutoreleasedReturnValue([v35 homeUserID]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 UUIDString]);
        LODWORD(usersInHome) = -[NSArray containsObject:](usersInHome, "containsObject:", v43);

        if ((_DWORD)usersInHome)
        {
          if (-[MSDServiceResolutionFlow _checkValidityOfService:](self, "_checkValidityOfService:", v35)) {
            break;
          }
        }

        [v30 removeObject:v35];

        if (![v30 count]) {
          goto LABEL_24;
        }
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue([v35 service]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v47 serviceID]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 UUIDString]);
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v49));

      v50 = (void *)objc_claimAutoreleasedReturnValue([v46 bundleIDS]);
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 firstObject]);

      v52 = sub_10003E9DC();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v35 homeUserID]);
        *(_DWORD *)buf = 138412547;
        v67 = v54;
        v68 = 2113;
        v69 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "User (%@) has valid service (%{private}@)",  buf,  0x16u);
      }

      id v9 = v58;
      uint64_t v27 = v57;
      if (v57)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue([v35 homeUserID]);
        v56 = (void *)objc_claimAutoreleasedReturnValue([v55 UUIDString]);
        (*((void (**)(id, void *, void *, uint64_t, void))v57 + 2))(v57, v51, v56, 4LL, 0LL);
      }
    }

    else
    {
LABEL_24:
      id v9 = v58;
      uint64_t v27 = v57;
      if (!v57)
      {
LABEL_32:

        uint64_t v15 = v61;
        uint64_t v12 = v59;
        goto LABEL_33;
      }

      serviceBundleID = self->_serviceBundleID;
      v45 = MSErrorDomain;
      v64 = MSUserInfoErrorStringKey;
      v65 = @"Failed to find any service configured for any of the members";
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v45,  5LL,  v35));
      (*((void (**)(id, NSString *, void, void, void *))v57 + 2))(v57, serviceBundleID, 0LL, 0LL, v46);
    }

    goto LABEL_32;
  }

  if (v16)
  {
    *(_DWORD *)buf = 138477827;
    v67 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Checking HomeOwner's %{private}@ default service",  buf,  0xCu);
  }

  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MSDServiceResolutionFlow _getServiceAccountInfoForDefaultService:servicesConfigured:]( self,  "_getServiceAccountInfoForDefaultService:servicesConfigured:",  v12,  v9));
  if (!v15) {
    goto LABEL_15;
  }
  id v17 = sub_10003E9DC();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Checking validity of service for HomeOwner",  buf,  2u);
  }

  if (!-[MSDServiceResolutionFlow _checkValidityOfService:](self, "_checkValidityOfService:", v15))
  {
LABEL_15:
    v57 = v10;
    goto LABEL_16;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s service](v15, "service"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceID]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIDS]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);

  id v25 = sub_10003E9DC();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v67 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Owner has valid service (%{private}@)",  buf,  0xCu);
  }

  uint64_t v27 = v10;
  if (v10)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    (*((void (**)(id, void *, void *, uint64_t, void))v10 + 2))(v10, v24, v28, 3LL, 0LL);
  }

LABEL_33:
}
}

id sub_100009970(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  unsigned __int8 v5 = [v4 isEqualToString:MSDefaultServiceRecordType];

  if ((v5 & 1) != 0) {
    goto LABEL_2;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  unsigned int v10 = [v9 isEqualToString:kAppleMusicServiceIdentifier];

  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
  if ([v11 isEqual:a1[4]])
  {
    id v6 = 0LL;
LABEL_8:

    goto LABEL_9;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
  unsigned __int8 v13 = [v12 isEqual:a1[5]];

  if ((v13 & 1) == 0)
  {
LABEL_7:
    uint64_t v14 = *(void **)(a1[6] + 32LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    id v6 = [v14 containsObject:v15];

    goto LABEL_8;
  }

LABEL_2:
  id v6 = 0LL;
LABEL_9:

  return v6;
}

id sub_100009BA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    id v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

id sub_100009C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceID]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) service]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceID]);
      id v10 = [v7 isEqual:v9];
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

void sub_10000A108( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A13C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A170( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A1D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A23C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A2A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A464(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Hit error when trying to fetch subscription %@",  (uint8_t *)&v17,  0xCu);
    }

    if (([v6 CKErrorHasErrorCode:3] & 1) != 0
      || ([v6 CKErrorHasErrorCode:4] & 1) != 0
      || [v6 isErrorFatal])
    {
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9) {
        (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0LL, v6);
      }
    }

    else
    {
      [*(id *)(a1 + 40) _addSubscriptionWithIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 32)]);
    id v11 = sub_10003E9DC();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        uint64_t v14 = *(void **)(a1 + 32);
        int v17 = 138412290;
        id v18 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "There exists a subscription for %@",  (uint8_t *)&v17,  0xCu);
      }

      uint64_t v15 = *(void *)(a1 + 48);
      if (v15) {
        (*(void (**)(uint64_t, uint64_t, void))(v15 + 16))(v15, 1LL, 0LL);
      }
    }

    else
    {
      if (v13)
      {
        uint64_t v16 = *(void **)(a1 + 32);
        int v17 = 138412290;
        id v18 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Adding subscription for %@",  (uint8_t *)&v17,  0xCu);
      }

      [*(id *)(a1 + 40) _addSubscriptionWithIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
  }
}

LABEL_8:
}
}
}
}
}
}
}
}
}

void sub_10000A864(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 count];
  id v9 = sub_10003E9DC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138477827;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Subscription saved %{private}@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_10000A9D8((uint64_t)v7, v11);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v6 != 0LL, v7);
  }
}

void sub_10000A998(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to add subscription, nil CKSubscription object",  v1,  2u);
}

void sub_10000A9D8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to save Subscription, %{private}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000AAE0(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  int v2 = (void *)qword_100070778;
  qword_100070778 = (uint64_t)v1;
}

void sub_10000B438(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  int v2 = (void *)qword_100070788;
  qword_100070788 = (uint64_t)v1;
}

void sub_10000B4F0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to create NSData object, %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000B564()
{
}

void sub_10000B590()
{
}

void sub_10000B5BC()
{
}

void sub_10000B5E8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error unarchiving object for key %@, %@",  (uint8_t *)&v3,  0x16u);
}

void sub_10000BAF4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000BB24( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000BB54( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000BBF8(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100070790;
  qword_100070790 = (uint64_t)v1;
}

void sub_10000C674( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C6E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C748( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CFB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000CFCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000CFDC(uint64_t a1)
{
}

void sub_10000CFE4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!v6 || v7)
  {
    id v9 = sub_10003E9DC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D770();
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0LL;
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000D238(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [a3 statusCode];
  if (!v7 || v8)
  {
    id v14 = sub_10003E9DC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000D7D0();
    }

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16)
    {
      int v13 = *(void (**)(void))(v16 + 16);
      goto LABEL_13;
    }
  }

  else
  {
    if (v9 == (id)200)
    {
      id v10 = sub_10003E9DC();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched data from URL",  v17,  2u);
      }
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      int v13 = *(void (**)(void))(v12 + 16);
LABEL_13:
      v13();
    }
  }
}

void sub_10000D560(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000D56C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D59C()
{
}

void sub_10000D5FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D62C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D65C(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 path]);
  sub_10000D554();
  __int16 v8 = 2113;
  uint64_t v9 = a2;
  sub_10000D560( (void *)&_mh_execute_header,  a3,  v6,  "Error creating directory for icon file path: %{private}@, %{private}@",  v7);
}

void sub_10000D700( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D770()
{
}

void sub_10000D7D0()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10000D560((void *)&_mh_execute_header, v1, (uint64_t)v1, "Received error from server %@, status code %ld", v2);
  sub_1000053CC();
}

void sub_10000D844()
{
}

void sub_10000D8A4()
{
}

id sub_10000DE84(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  if ([v5 isEqualToString:kAppleMusicServiceIdentifier])
  {

    uint8_t v6 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordType](v2, "recordType"));
    unsigned int v8 = [v7 isEqualToString:MSServiceAccountRecordType];

    if (!v8)
    {
      uint8_t v6 = 0LL;
      goto LABEL_7;
    }

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  }

LABEL_7:
  return v6;
}

id sub_10000DF64(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  if ([v5 isEqualToString:kAppleMusicServiceIdentifier])
  {

    uint8_t v6 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordType](v2, "recordType"));
    unsigned int v8 = [v7 isEqualToString:MSServiceAccountRecordType];

    if (!v8)
    {
      uint8_t v6 = 0LL;
      goto LABEL_7;
    }

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  }

LABEL_7:
  return v6;
}

uint64_t sub_10000E044(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceID]);
    if ([v6 isEqual:v8])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
      unsigned int v10 = [v9 updateListeningHistoryEnabled];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
      uint64_t v12 = v10 ^ [v11 updateListeningHistoryEnabled];
    }

    else
    {
      uint64_t v12 = 0LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

void sub_10000E154(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  id v11 = [v2 copy];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeID]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](&OBJC_CLASS___MSServiceUpdatedHandler, "shared"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v9 mediaServiceChanged:v11 homeUserID:v10];
}

void sub_10000E304(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E3F8;
  v10[3] = &unk_100060D00;
  id v5 = v3;
  id v11 = v5;
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", v10));
  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0LL, 500000000LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000E490;
    v8[3] = &unk_100060E40;
    id v9 = v6;
    dispatch_after(v7, &_dispatch_main_q, v8);
  }
}

id sub_10000E3F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);
    id v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

void sub_10000E490(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  id v11 = [v2 copy];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeID]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](&OBJC_CLASS___MSServiceUpdatedHandler, "shared"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v9 mediaServiceChanged:v11 homeUserID:v10];
}

void sub_10000E640(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E734;
  v10[3] = &unk_100060D00;
  id v5 = v3;
  id v11 = v5;
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", v10));
  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0LL, 500000000LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000E7CC;
    v8[3] = &unk_100060E40;
    id v9 = v6;
    dispatch_after(v7, &_dispatch_main_q, v8);
  }
}

id sub_10000E734(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);
    id v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

void sub_10000E7CC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  id v11 = [v2 copy];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeID]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](&OBJC_CLASS___MSServiceUpdatedHandler, "shared"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v9 mediaServiceRemoved:v11 homeUserID:v10];
}

id sub_10000EAF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    id v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

id sub_10000EB70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceID]);
      id v8 = [v7 isEqual:*(void *)(a1 + 40)];
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void sub_10000EC30(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  id v11 = [v2 copy];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v11 populateMediaService:v6 homeID:v7 homeUserID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](&OBJC_CLASS___MSServiceUpdatedHandler, "shared"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
  [v9 defaultMediaServiceUpdated:v11 homeUserID:v10];
}

id sub_10000EF70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stopwatch]);
  [v4 stop];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stopwatch]);
  [v5 toggleLock:1];

  [*(id *)(a1 + 32) setDidSucceed:a2];
  return +[MSAnalytics sendServiceEvent:](&OBJC_CLASS___MSAnalytics, "sendServiceEvent:", *(void *)(a1 + 32));
}

void sub_10000EFE4(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v31 = a3;
  if (v31)
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000151FC();
    }
  }

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_10000F538;
  v59[3] = &unk_100060EB8;
  id v60 = *(id *)(a1 + 32);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "na_firstObjectPassingTest:", v59));
  if (v33)
  {
    v35 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v35, "setCreateNewZoneIfMissing:", 0LL);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v35, "setUserInitiatedRequest:", 0LL);
    id v7 = dispatch_group_create();
    v57[0] = 0LL;
    v57[1] = v57;
    v57[2] = 0x3032000000LL;
    v57[3] = sub_10000F5A8;
    v57[4] = sub_10000F5B8;
    id v58 = 0LL;
    v55[0] = 0LL;
    v55[1] = v55;
    v55[2] = 0x2020000000LL;
    char v56 = 1;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = *(id *)(a1 + 40);
    id v8 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v52 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          dispatch_group_enter(v7);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 homeID]);
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 homeUserID]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

          uint64_t v16 = *(void **)(a1 + 48);
          int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_10000F5C0;
          v42[3] = &unk_100060F08;
          v49 = v57;
          v50 = v55;
          v43 = v7;
          id v44 = *(id *)(a1 + 32);
          id v18 = v13;
          id v45 = v18;
          id v19 = v15;
          uint64_t v20 = *(void *)(a1 + 48);
          id v46 = v19;
          uint64_t v47 = v20;
          v48 = v35;
          [v16 fetchRecordZoneFor:v18 user:v19 withOptions:v48 withAttribution:v17 completion:v42];
        }

        id v8 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      }

      while (v8);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000FA2C;
    block[3] = &unk_100060F58;
    id v23 = *(id *)(a1 + 64);
    v40 = v55;
    uint64_t v24 = *(void *)(a1 + 48);
    id v25 = *(void **)(a1 + 56);
    id v38 = v23;
    block[4] = v24;
    id v37 = v25;
    id v39 = *(id *)(a1 + 72);
    v41 = v57;
    dispatch_group_notify(v7, v22, block);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(v57, 8);

    goto LABEL_18;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
  v35 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to retrieve publicInfo for service %@",  v26));

  id v27 = sub_10003E9DC();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_10001519C();
  }

  uint64_t v29 = *(void *)(a1 + 72);
  if (v29)
  {
    uint64_t v62 = MSUserInfoErrorStringKey;
    v63 = v35;
    id v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  7LL,  v7));
    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0LL, v30);

LABEL_18:
  }
}

void sub_10000F4FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, char a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

id sub_10000F538(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = [v3 isEqualToString:v5];

  return v6;
}

uint64_t sub_10000F5A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F5B8(uint64_t a1)
{
}

void sub_10000F5C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL), a3);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serviceID]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    uint64_t v10 = MSServiceAccountRecordType;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKRecord createRecordWithName:recordType:recordZone:]( &OBJC_CLASS___CKRecord,  "createRecordWithName:recordType:recordZone:",  v9,  v10,  v11));

    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v34[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v34[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v15 = *(void *)(a1 + 56);
    v35[0] = v13;
    v35[1] = v15;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));
    [v12 populateCKRecordInfo:v14 userInfo:v16 recordType:v10];

    if (v12)
    {
      int v17 = *(void **)(a1 + 64);
      v33 = v12;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
      uint64_t v20 = *(void *)(a1 + 72);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10000F880;
      v26[3] = &unk_100060EE0;
      id v27 = *(id *)(a1 + 56);
      id v21 = *(id *)(a1 + 48);
      int8x16_t v32 = vextq_s8(*(int8x16_t *)(a1 + 80), *(int8x16_t *)(a1 + 80), 8uLL);
      uint64_t v22 = *(void *)(a1 + 64);
      id v28 = v21;
      uint64_t v29 = v22;
      id v30 = v5;
      id v31 = *(id *)(a1 + 32);
      [v17 modifyCKRecordWithRecordsToSave:v18 recordIDSToDelete:0 missingManateeIdentity:0 withAttribution:v19 withOptions:v20 completion:v26];
    }

    else
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  0LL));
      uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8LL);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void sub_10000F880(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a2 firstObject]);
  id v8 = sub_10003E9DC();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v6 || !v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100015288();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8LL);
    id v14 = v6;
    uint64_t v10 = *(os_log_s **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    int v19 = 136315651;
    uint64_t v20 = "-[CKDatabase(MediaService) addMediaService:usingSetupBundles:transaction:completion:]_block_invoke_2";
    __int16 v21 = 2113;
    uint64_t v22 = v11;
    __int16 v23 = 2113;
    uint64_t v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Successfully saved record for user: %{private}@ home: %{private}@",  (uint8_t *)&v19,  0x20u);
  }

  if ([v6 CKErrorHasErrorCode:112])
  {
    id v15 = sub_10003E9DC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10001525C();
    }

    int v17 = *(void **)(a1 + 48);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) zoneID]);
    [v17 handleCKErrorMissingManateeIdentity:v18 homeUserID:*(void *)(a1 + 32)];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t sub_10000FA2C(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    id v3 = (void *)objc_opt_new(&OBJC_CLASS___MSDFetchCKDataOptions, v2);
    [v3 setUserInitiatedRequest:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000FB10;
    v6[3] = &unk_100060F30;
    uint64_t v4 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v4 refreshDatabase:0 completion:v6];
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))( result,  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
  }
  return result;
}

void sub_10000FB10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100015300();
    }
  }

  [*(id *)(a1 + 32) releaseTransaction];
}

LABEL_9:
}
}
}
}

void sub_10000FD94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0LL, v7);
    }
  }

  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000FEA8;
    v13[3] = &unk_100060FA8;
    id v16 = *(id *)(a1 + 56);
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    [v8 fetchAllRecordsForRecordZoneID:v9 userInfo:v10 withOptions:v11 completion:v13];
  }
}

void sub_10000FEA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v46 = 0LL;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100010338;
    v60[3] = &unk_100060D00;
    id v61 = *(id *)(a1 + 32);
    id v47 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_filter:", v60));
    v48 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v9);
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v10 = v8;
    id v55 = [v10 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (!v55) {
      goto LABEL_18;
    }
    uint64_t v11 = *(void *)v57;
    uint64_t v12 = MSDefaultServiceRecordType;
    uint64_t v53 = kCKDatabaseAccessUserInfoHomeIDKey;
    uint64_t v54 = MSPlaceholderRecordType;
    uint64_t v49 = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v50 = *(void *)v57;
    uint64_t v51 = MSDefaultServiceRecordType;
    uint64_t v52 = a1;
    while (1)
    {
      for (i = 0LL; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordType", v46));
        if (([v15 isEqualToString:v12] & 1) == 0)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 recordType]);
          unsigned __int8 v17 = [v16 isEqualToString:v54];

          if ((v17 & 1) != 0) {
            continue;
          }
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 homeID]);
          id v18 = (id)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
          int v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v53]);
          if ([v18 isEqualToString:v19])
          {
            id v20 = v10;
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 homeUserID]);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v49]);
            unsigned int v24 = [v22 isEqualToString:v23];

            a1 = v52;
            uint64_t v12 = v51;

            id v10 = v20;
            uint64_t v11 = v50;

            if (!v24) {
              continue;
            }
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 serviceID]);
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v27));

            uint64_t v12 = v51;
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
            id v18 = [v28 copy];

            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v14 homeID]);
            id v30 = (void *)objc_claimAutoreleasedReturnValue([v14 homeUserID]);
            [v18 populateMediaService:v15 homeID:v29 homeUserID:v30];

            a1 = v52;
            objc_msgSend(v48, "na_safeAddObject:", v18);
          }

          else
          {
          }
        }
      }

      id v55 = [v10 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (!v55)
      {
LABEL_18:

        if ([v48 count])
        {
          uint64_t v31 = *(void *)(a1 + 48);
          id v7 = v46;
          id v5 = v47;
          if (v31) {
            (*(void (**)(uint64_t, void *, void))(v31 + 16))(v31, v48, 0LL);
          }
        }

        else
        {
          id v33 = sub_10003E9DC();
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_10001538C(v34, v35, v36, v37, v38, v39, v40, v41);
          }

          uint64_t v42 = *(void *)(a1 + 48);
          id v7 = v46;
          id v5 = v47;
          if (v42)
          {
            uint64_t v43 = MSErrorDomain;
            uint64_t v62 = MSUserInfoErrorStringKey;
            v63 = @"Fetched records but couldn't create valid service objects";
            id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
            id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v43,  2LL,  v44));
            (*(void (**)(uint64_t, void, void *))(v42 + 16))(v42, 0LL, v45);
          }
        }

        goto LABEL_28;
      }
    }
  }

  uint64_t v32 = *(void *)(a1 + 48);
  if (v32) {
    (*(void (**)(uint64_t, void, void *))(v32 + 16))(v32, 0LL, v7);
  }
LABEL_28:
}

id sub_100010338(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 recordZoneName]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  id v6 = [v3 isEqualToString:v5];

  return v6;
}

void sub_100010608( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100010634(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v16 = *(void *)(a1 + 48);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v7);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v9 = objc_alloc(&OBJC_CLASS___CKRecordID);
    uint64_t v10 = MSDefaultServiceRecordName;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v12 = -[CKRecordID initWithRecordName:zoneID:](v9, "initWithRecordName:zoneID:", v10, v11);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100010784;
    v17[3] = &unk_100060FF8;
    uint64_t v15 = *(void *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    [WeakRetained _updateDefaultService:v12 serviceID:v14 userInfo:v15 completion:v17];
  }
}

uint64_t sub_100010784(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000108C4(_Unwind_Exception *a1)
{
}

void sub_1000108E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6 || ([v6 CKErrorHasErrorCode:11] & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v9 = (CKRecord *)[v5 copy];
    if (!v9)
    {
      uint64_t v10 = objc_alloc(&OBJC_CLASS___CKRecord);
      uint64_t v9 = -[CKRecord initWithRecordType:recordID:]( v10,  "initWithRecordType:recordID:",  MSDefaultServiceRecordType,  *(void *)(a1 + 32));
      uint64_t v11 = MSHomeParticipantHomeUserIdentifier;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
      -[CKRecord setRecordFieldForKey:value:](v9, "setRecordFieldForKey:value:", v11, v12);
    }

    -[CKRecord setRecordFieldForKey:value:]( v9,  "setRecordFieldForKey:value:",  MediaServiceIdentifier,  *(void *)(a1 + 48));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100010B0C;
    v17[3] = &unk_100061048;
    id v20 = *(id *)(a1 + 56);
    void v17[4] = WeakRetained;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    [WeakRetained saveRecord:v9 completionHandler:v17];

    uint64_t v13 = v20;
    goto LABEL_7;
  }

  id v14 = sub_10003E9DC();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100015428(a1, (uint64_t)v7, v15);
  }

  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([v7 CKErrorHasErrorCode:112])
  {
    uint64_t v9 = (CKRecord *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    [WeakRetained handleCKErrorMissingManateeIdentity:v9 homeUserID:v13];
LABEL_7:
  }
}

void sub_100010B0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000154A4();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
    int v15 = 138412290;
    uint64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully updated default service %@",  (uint8_t *)&v15,  0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, BOOL, id))(v11 + 16))(v11, v5 != 0LL, v6);
  }
  if ([v6 CKErrorHasErrorCode:112])
  {
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    [v12 handleCKErrorMissingManateeIdentity:v13 homeUserID:v14];
  }
}

void sub_100010F24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100010F50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0LL, v7);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100011070;
    v13[3] = &unk_100061098;
    id v14 = *(id *)(a1 + 48);
    id v15 = v5;
    id v16 = *(id *)(a1 + 56);
    [WeakRetained fetchAllRecordsForRecordZoneID:v9 userInfo:v10 withOptions:v11 completion:v13];
  }
}

void sub_100011070(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000113B0;
  v32[3] = &unk_100060D28;
  id v33 = *(id *)(a1 + 32);
  id v34 = *(id *)(a1 + 40);
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v32));
  id v8 = sub_10003E9DC();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceID]);
    *(_DWORD *)buf = 138477827;
    uint64_t v38 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Found default service record in cached info, serviceID: %{private}@",  buf,  0xCu);
  }

  id v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  uint64_t v29 = sub_1000114A0;
  id v30 = &unk_100060D00;
  id v12 = v7;
  id v31 = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", &v27));

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
    id v15 = [v14 copy];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceID]);
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v17));

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 homeID]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 homeUserID]);
    [v15 populateMediaService:v18 homeID:v19 homeUserID:v20];

    uint64_t v21 = *(void *)(a1 + 48);
    if (v21) {
      (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v15, v5);
    }
    goto LABEL_10;
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find default service for user %@",  *(void *)(a1 + 32),  v27,  v28,  v29,  v30));
  id v22 = sub_10003E9DC();
  __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10001519C();
  }

  uint64_t v24 = *(void *)(a1 + 48);
  if (v24)
  {
    uint64_t v25 = MSErrorDomain;
    uint64_t v35 = MSUserInfoErrorStringKey;
    id v36 = v15;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v25,  2LL,  v18));
    (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0LL, v26);

LABEL_10:
  }
}

id sub_1000113B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    if ([v6 isEqualToString:*(void *)(a1 + 32)])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 recordZoneName]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneID]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
      id v10 = [v7 isEqualToString:v9];
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

id sub_1000114A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceID]);
    if ([v6 isEqual:v8])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
      if ([v9 isEqual:v10])
      {
        id v15 = v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 recordZoneName]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordZoneName]);
        id v13 = [v11 isEqualToString:v12];

        uint64_t v9 = v15;
      }

      else
      {
        id v13 = 0LL;
      }
    }

    else
    {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

id sub_100011914(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stopwatch]);
  [v4 stop];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stopwatch]);
  [v5 toggleLock:1];

  [*(id *)(a1 + 32) setDidSucceed:a2];
  return +[MSAnalytics sendServiceEvent:](&OBJC_CLASS___MSAnalytics, "sendServiceEvent:", *(void *)(a1 + 32));
}

void sub_100011988(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    uint64_t v14 = *(void *)(a1 + 72);
    if (v14) {
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0LL, v7);
    }
  }

  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100011AD8;
    v15[3] = &unk_100061160;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 40);
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    id v18 = v12;
    uint64_t v19 = v13;
    [v8 fetchAllRecordsForRecordZoneID:v9 userInfo:v10 withOptions:v11 completion:v15];
  }
}

void sub_100011AD8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10001204C;
    v53[3] = &unk_1000610E8;
    id v54 = a1[4];
    id v55 = a1[5];
    id v56 = a1[6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", v53));
    if (v8)
    {
      uint64_t v9 = objc_alloc(&OBJC_CLASS___CKRecordID);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1[6] zoneID]);
      id v12 = -[CKRecordID initWithRecordName:zoneID:](v9, "initWithRecordName:zoneID:", v10, v11);

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_1000121D0;
      v51[3] = &unk_100060D00;
      id v52 = a1[5];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", v51));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_10001228C;
      v47[3] = &unk_100061110;
      id v49 = a1[8];
      uint64_t v14 = v12;
      v48 = v14;
      id v50 = a1[9];
      id v15 = objc_retainBlock(v47);
      uint64_t v40 = v13;
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceID]);
      uint64_t v39 = v8;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceID]);
      LODWORD(v11) = [v17 isEqual:v19];

      if ((_DWORD)v11)
      {
        id v20 = sub_10003E9DC();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "User is removing Default service. Updating Default service to apple music",  buf,  2u);
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  kAppleMusicServiceIdentifier));
        __int16 v23 = objc_alloc(&OBJC_CLASS___CKRecordID);
        uint64_t v24 = MSDefaultServiceRecordName;
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([a1[6] zoneID]);
        v26 = -[CKRecordID initWithRecordName:zoneID:](v23, "initWithRecordName:zoneID:", v24, v25);

        id v27 = sub_10003E9DC();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v22 serviceID]);
          *(_DWORD *)buf = 136315394;
          __int128 v58 = "-[CKDatabase(MediaService) removeMediaService:withUserInfo:completion:]_block_invoke";
          __int16 v59 = 2112;
          id v60 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s Updating Default service to %@",  buf,  0x16u);
        }

        id v30 = a1[7];
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v22 serviceID]);
        id v32 = a1[5];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100012368;
        v41[3] = &unk_100061138;
        v41[4] = a1[7];
        uint64_t v42 = v14;
        id v44 = v15;
        id v43 = a1[4];
        id v45 = a1[8];
        id v46 = a1[9];
        [v30 _updateDefaultService:v26 serviceID:v31 userInfo:v32 completion:v41];
      }

      else
      {
        [a1[7] _deleteRecord:v14 completion:v15];
      }

      uint64_t v38 = v52;
      id v8 = v39;
    }

    else
    {
      id v34 = sub_10003E9DC();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1000154FC();
      }

      (*((void (**)(void))a1[8] + 2))();
      id v36 = (void (**)(id, void, void *))a1[9];
      if (!v36) {
        goto LABEL_19;
      }
      uint64_t v37 = MSErrorDomain;
      uint64_t v61 = MSUserInfoErrorStringKey;
      uint64_t v62 = @"Failed to remove service, no record found";
      uint64_t v14 = (CKRecordID *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v37,  2LL,  v14));
      v36[2](v36, 0LL, v38);
    }

LABEL_19:
    goto LABEL_20;
  }

  (*((void (**)(void))a1[8] + 2))();
  id v33 = (void (**)(id, void, void *))a1[9];
  if (v33) {
    v33[2](v33, 0LL, v7);
  }
LABEL_20:
}

id sub_10001204C(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1[4] serviceID]);
    if ([v6 isEqual:v7])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
      if ([v9 isEqualToString:v10])
      {
        id v16 = v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 recordZoneName]);
        id v17 = v8;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([a1[6] zoneID]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
        id v14 = [v11 isEqualToString:v13];

        id v8 = v17;
        uint64_t v9 = v16;
      }

      else
      {
        id v14 = 0LL;
      }
    }

    else
    {
      id v14 = 0LL;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

id sub_1000121D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    id v8 = [v6 isEqualToString:v7];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void sub_10001228C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = a2;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully removed service", v17, 2u);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100015528(a1, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

void sub_100012368(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _deleteRecord:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }

  else
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) serviceID]);
      int v10 = 138477827;
      uint64_t v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to update default service, not removing service (%{private}@)",  (uint8_t *)&v10,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    uint64_t v9 = *(void *)(a1 + 72);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0LL, v5);
    }
  }
}

uint64_t sub_1000125B8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012818(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v7);
    }
  }

  else
  {
    id v8 = objc_alloc(&OBJC_CLASS___CKRecordID);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v12 = -[CKRecordID initWithRecordName:zoneID:](v8, "initWithRecordName:zoneID:", v10, v11);

    uint64_t v13 = *(void **)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100012984;
    v17[3] = &unk_1000611D8;
    id v21 = *(id *)(a1 + 64);
    uint64_t v14 = *(void **)(a1 + 48);
    void v17[4] = *(void *)(a1 + 40);
    id v18 = v12;
    id v19 = v14;
    id v20 = *(id *)(a1 + 56);
    uint64_t v15 = v12;
    [v13 fetchRecordWithID:v15 completionHandler:v17];
  }
}

void sub_100012984(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = *(void **)(a1 + 56);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100012B50;
    v24[3] = &unk_1000611B0;
    id v9 = v5;
    id v25 = v9;
    id v26 = *(id *)(a1 + 64);
    [v8 enumerateKeysAndObjectsUsingBlock:v24];
    int v10 = *(void **)(a1 + 32);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100012D0C;
    v20[3] = &unk_100061048;
    id v11 = *(id *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(a1 + 40);
    id v23 = v11;
    void v20[4] = v12;
    id v21 = v13;
    id v22 = *(id *)(a1 + 48);
    [v10 saveRecord:v9 completionHandler:v20];

    uint64_t v14 = v25;
LABEL_10:

    goto LABEL_11;
  }

  id v15 = sub_10003E9DC();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000155BC();
  }

  uint64_t v17 = *(void *)(a1 + 64);
  if (v17) {
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0LL, v7);
  }
  if ([v7 CKErrorHasErrorCode:112])
  {
    id v18 = *(void **)(a1 + 32);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneID]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    [v18 handleCKErrorMissingManateeIdentity:v14 homeUserID:v19];

    goto LABEL_10;
  }

LABEL_11:
}
}

  return v6;
}
}
}
}
}
}
}

LABEL_12:
    goto LABEL_13;
  }

  if (v4)
  {
    id v15 = MSErrorDomain;
    id v25 = MSUserInfoErrorStringKey;
    id v26 = @"Failed to perform refresh. No homes available.";
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  3LL,  v9));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v14);
    goto LABEL_11;
  }

void sub_100012B50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 integerValue];
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unsupported propertyType %lu", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = MSErrorDomain;
      uint64_t v14 = MSUserInfoErrorStringKey;
      id v15 = @"Unsupported property type passed";
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  v12));
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0LL, v13);
    }
  }

  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = [v5 BOOLValue];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating Listening history enabled : %d",  buf,  8u);
    }

    [*(id *)(a1 + 32) setRecordFieldForKey:MediaServiceUpdateListeningHistory value:v5];
  }
}

void sub_100012D0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_10003E9DC();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001561C();
    }
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, void *))(v10 + 16))(v10, v5 != 0LL, v7);
  }
  if ([v7 CKErrorHasErrorCode:112])
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneID]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
    [v11 handleCKErrorMissingManateeIdentity:v12 homeUserID:v13];
  }
}

LABEL_7:
}

void sub_100012FBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ([v6 CKErrorHasErrorCode:112] && CKErrorIsCode(v7, 2))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:CKPartialErrorsByItemIDKey]);

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
      id v11 = sub_10003E9DC();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Zones with Manatee Identity Lost %@",  buf,  0xCu);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100013198;
      v17[3] = &unk_100061228;
      uint64_t v13 = *(void **)(a1 + 40);
      void v17[4] = *(void *)(a1 + 32);
      id v18 = v13;
      [v10 enumerateObjectsUsingBlock:v17];
    }

    uint64_t v14 = *(void *)(a1 + 56);
    if (v14) {
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0LL, v7);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ms_objectsPassingTest:", &stru_100061268));

    [*(id *)(a1 + 32) _serviceConfigInfoFor:v16 homeUserIDS:*(void *)(a1 + 40) serviceID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

id sub_100013198(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCKErrorMissingManateeIdentity:a2 homeUserIDS:*(void *)(a1 + 40)];
}

BOOL sub_1000131A8(id a1, CKRecordZone *a2, unint64_t a3, BOOL *a4)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](a2, "zoneID", a3, a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  char v6 = [v5 isEqualToString:CKRecordZoneDefaultName] ^ 1;

  return v6;
}

void sub_10001361C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

void sub_100013654(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL), a3);
LABEL_8:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_12;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recordFieldForKey:MSHomeParticipantHomeUserIdentifier]);
  BOOL v9 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
  unsigned __int8 v10 = [*(id *)(a1 + 32) containsObject:v9];
  id v11 = sub_10003E9DC();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 48);
      int v19 = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched record for homeUser: %@ matching serviceID: %@",  (uint8_t *)&v19,  0x16u);
    }

    id v15 = objc_alloc(&OBJC_CLASS___NSUUID);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 recordFieldForKey:MSHomeParticipantHomeIdentifier]);
    id v17 = -[NSUUID initWithUUIDString:](v15, "initWithUUIDString:", v16);

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 createMediaServiceObjectFromRecord]);
    [v18 populateMediaService:*(void *)(a1 + 56) homeID:v17 homeUserID:v9];
    objc_msgSend(*(id *)(a1 + 64), "na_safeSetObject:forKey:", v18, v9);

    goto LABEL_8;
  }

  if (v13)
  {
    int v19 = 138412290;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "User did not request info for %@",  (uint8_t *)&v19,  0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_12:
}

uint64_t sub_100013874(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16LL))( a1[5],  a1[4],  *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
}

LABEL_14:
}

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProfilesManager delegate](self, "delegate"));
    id v23 = [v6 copy];
    [v22 profilesManager:self didUpdateProfiles:v23];
LABEL_18:
  }
}

void sub_100013B18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = v6;
  if (!v5 || v6)
  {
    id v16 = sub_10003E9DC();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000156EC();
    }

    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0LL, v8);
    }
  }

  else
  {
    BOOL v9 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
    unsigned __int8 v10 = *(void **)(a1 + 32);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100013D0C;
    v21[3] = &unk_100061308;
    id v11 = v9;
    id v22 = v11;
    id v23 = v5;
    [v10 enumerateObjectsUsingBlock:v21];
    id v12 = sub_10003E9DC();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to remove services %@", buf, 0xCu);
    }

    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100013DA8;
    v19[3] = &unk_100060D78;
    id v20 = *(id *)(a1 + 56);
    [v14 modifyCKRecordWithRecordsToSave:0 recordIDSToDelete:v11 missingManateeIdentity:0 withAttribution:0 withOptions:v15 completion:v19];
  }
}

void sub_100013D0C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneID]);
  uint64_t v7 = -[CKRecordID initWithRecordName:zoneID:](v5, "initWithRecordName:zoneID:", v8, v6);
  objc_msgSend(v3, "na_safeAddObject:", v7);
}

void sub_100013DA8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removed services %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v6 != 0LL, v7);
  }
}

void sub_10001415C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0LL, v7);
    }
  }

  else
  {
    id v8 = objc_alloc(&OBJC_CLASS___CKRecordID);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    id v12 = -[CKRecordID initWithRecordName:zoneID:](v8, "initWithRecordName:zoneID:", v10, v11);

    BOOL v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000142B8;
    v19[3] = &unk_100061048;
    id v23 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = *(void **)(a1 + 48);
    id v20 = v15;
    uint64_t v21 = v16;
    id v22 = v17;
    [v13 fetchRecordWithID:v12 withOptions:v14 completion:v19];
  }
}

void sub_1000142B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    id v16 = sub_10003E9DC();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10001577C();
    }

    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0LL, v6);
    }
  }

  else
  {
    id v7 = [a2 copy];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authConfiguration]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authCredential]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v10,  1LL,  0LL));

    if (v11) {
      [v7 setRecordFieldForKey:MediaServiceAuthCredential value:v11];
    }
    if (v9) {
      [v7 setRecordFieldForKey:MediaServiceAuthConfiguration value:v9];
    }
    uint64_t v12 = MediaServiceAuthFatalError;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) authFatalError]));
    [v7 setRecordFieldForKey:v12 value:v13];

    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000144B0;
    v19[3] = &unk_100061370;
    void v19[4] = v14;
    id v20 = *(id *)(a1 + 56);
    [v14 saveRecord:v7 withOptions:v15 completion:v19];
  }
}

void sub_1000144B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000157F4();
    }
  }

  else
  {
    [*(id *)(a1 + 32) refreshDatabase:0 completion:&stru_100061348];
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v5 != 0LL, v6);
  }
}

void sub_100014554(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10003E9DC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      int v9 = 138412290;
      uint64_t v10 = v2;
      id v6 = "Error updating caches after saving authInfo %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Successfully updated caches after saving authInfo";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

void sub_1000148D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1000148F4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001586C();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000149E4;
    v8[3] = &unk_100061398;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    +[MSAuthTokenProvider validateConfigurationResourceForMediaService:networkActivity:completion:]( &OBJC_CLASS___MSAuthTokenProvider,  "validateConfigurationResourceForMediaService:networkActivity:completion:",  v7,  0LL,  v8);
  }
}

void sub_1000149E4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000158CC();
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100014A64(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x3032000000LL;
    v29[3] = sub_10000F5A8;
    v29[4] = sub_10000F5B8;
    id v30 = 0LL;
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x3032000000LL;
    v27[3] = sub_10000F5A8;
    v27[4] = sub_10000F5B8;
    id v28 = 0LL;
    uint64_t v2 = dispatch_group_create();
    dispatch_group_enter(v2);
    id v3 = *(void **)(a1 + 32);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) UUIDString]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) UUIDString]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100014CCC;
    v21[3] = &unk_100061410;
    id v25 = v29;
    id v6 = v2;
    id v22 = v6;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v23 = v7;
    uint64_t v24 = v8;
    id v26 = v27;
    [v3 fetchRecordZoneFor:v4 user:v5 withOptions:0 completion:v21];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100014EEC;
    v13[3] = &unk_100061480;
    int v19 = v27;
    id v20 = v29;
    id v18 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    id v16 = v11;
    uint64_t v17 = v12;
    dispatch_group_notify(v6, v10, v13);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
  }
}

void sub_100014CA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_100014CCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v14 = sub_10003E9DC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10001592C();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  else
  {
    uint64_t v8 = objc_alloc(&OBJC_CLASS___CKRecordID);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serviceID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v12 = -[CKRecordID initWithRecordName:zoneID:](v8, "initWithRecordName:zoneID:", v10, v11);

    BOOL v13 = *(void **)(a1 + 48);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100014E38;
    v16[3] = &unk_1000613E8;
    __int128 v18 = *(_OWORD *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    [v13 fetchRecordWithID:v12 withOptions:0 completion:v16];
  }
}

void sub_100014E38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001598C();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100014EEC(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL)) {
    BOOL v2 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) == 0LL;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
  id v3 = sub_10003E9DC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched old user info, switching account info",  buf,  2u);
  }

  v14[0] = kCKDatabaseAccessUserInfoHomeIDKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
  v15[0] = v5;
  v14[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) UUIDString]);
  v15[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) populateCKRecordInfo:*(void *)(a1 + 48) userInfo:v7 recordType:MSServiceAccountRecordType];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000150B0;
  v11[3] = &unk_100061458;
  id v9 = *(void **)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  v11[4] = *(void *)(a1 + 56);
  id v12 = v10;
  [v9 saveRecord:v8 withOptions:0 completion:v11];
}

id sub_1000150B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (!a3) {
    return [*(id *)(a1 + 32) refreshDatabase:0 completion:&stru_100061430];
  }
  return result;
}

void sub_100015100(id a1, NSError *a2)
{
  BOOL v2 = a2;
  id v3 = sub_10003E9DC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000159EC();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Successfully updated local caches post user account switch",  v6,  2u);
  }
}

  ;
}

void sub_10001519C()
{
}

void sub_1000151FC()
{
}

void sub_10001525C()
{
}

void sub_100015288()
{
  int v2 = 136315395;
  uint64_t v3 = "-[CKDatabase(MediaService) addMediaService:usingSetupBundles:transaction:completion:]_block_invoke";
  sub_100015190();
  sub_10000D560((void *)&_mh_execute_header, v0, v1, "%s Failed to save record %{private}@", (uint8_t *)&v2);
  sub_1000053CC();
}

void sub_100015300()
{
}

void sub_100015360()
{
}

void sub_10001538C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000153FC()
{
}

void sub_100015428(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10000D560((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to fetch record with ID %@, %@", (uint8_t *)&v4);
  sub_1000053CC();
}

void sub_1000154A4()
{
}

void sub_1000154D0()
{
}

void sub_1000154FC()
{
}

void sub_100015528( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015590()
{
}

void sub_1000155BC()
{
}

void sub_10001561C()
{
}

void sub_10001567C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000156EC()
{
  int v3 = 136315651;
  uint64_t v4 = "-[CKDatabase(MediaService) removeMediaServices:withUserInfo:completion:]_block_invoke";
  sub_100015190();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s Fetched recordZone %{private}@, error %{private}@",  (uint8_t *)&v3,  0x20u);
}

void sub_10001577C()
{
  int v2 = 136315394;
  int v3 = "-[CKDatabase(MediaService) updateAuthRenewalForMediaService:userInfo:completion:]_block_invoke_2";
  sub_100015190();
  sub_10000D560((void *)&_mh_execute_header, v0, v1, "%s Error fetching record, %@", (uint8_t *)&v2);
  sub_1000053CC();
}

void sub_1000157F4()
{
  int v2 = 136315394;
  int v3 = "-[CKDatabase(MediaService) updateAuthRenewalForMediaService:userInfo:completion:]_block_invoke";
  sub_100015190();
  sub_10000D560((void *)&_mh_execute_header, v0, v1, "%s Error saving record, %@", (uint8_t *)&v2);
  sub_1000053CC();
}

void sub_10001586C()
{
}

void sub_1000158CC()
{
}

void sub_10001592C()
{
}

void sub_10001598C()
{
}

void sub_1000159EC()
{
}

void sub_100015AC0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1000707A8;
  qword_1000707A8 = (uint64_t)v1;
}

void sub_100015C7C(_Unwind_Exception *a1)
{
}

void sub_100015CE8(_Unwind_Exception *a1)
{
}

void sub_100015EEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100015F04(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isHomeKitReady];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return [*(id *)(a1 + 32) _noteHomesStillLoading];
  }
  return result;
}

void sub_100015FF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100016010(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isHomeKitReady];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return [*(id *)(a1 + 32) _noteHomesStillLoading];
  }
  return result;
}

void sub_100016104( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10001611C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isHomeKitReady];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return [*(id *)(a1 + 32) _noteHomesStillLoading];
  }
  return result;
}

void sub_100016254( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10001626C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001627C(uint64_t a1)
{
}

void sub_100016284(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentHome]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queuedAwaitingCurrentHome]);
    id v5 = objc_retainBlock(*(id *)(a1 + 40));
    [v6 addObject:v5];
  }

void sub_1000163D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001A9F0();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138477827;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully registered to accept shared for CloudKitContainer %{private}@",  (uint8_t *)&v8,  0xCu);
  }
}

void sub_1000165C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000165DC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  if ([v7 userIdentifierBelongsInHome:*(void *)(a1 + 32)])
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
}

id sub_1000168C0(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 uniqueIdentifier]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_100016BDC(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully finished refresh after home was added",  v8,  2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10001AC98();
  }
}

void sub_1000172F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100017314(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 26)) {
    BOOL v3 = *(_BYTE *)(v2 + 25) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Detected first start up. Finishing initialization steps and refreshing CloudKit.",  (uint8_t *)&v15,  2u);
    }

    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) homes]);
      int v15 = 138477827;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Homes Loaded: %{private}@",  (uint8_t *)&v15,  0xCu);
    }

    id v9 = MSDSignpostFacility();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = v10;
    os_signpost_id_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) homes]);
      id v14 = [v13 count];
      int v15 = 134349056;
      id v16 = v14;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v12,  "LookupHomes",  "LookupFinishedWithCount=%{signpost.description:attribute,public}lu",  (uint8_t *)&v15,  0xCu);
    }
  }

uint64_t sub_1000174D8(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 26LL) = 0;
  return result;
}

void sub_1000174E4(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a3;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001ACF8();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully refreshed data after HomeKit initialization",  v7,  2u);
  }
}

void sub_10001767C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully finished refresh after MultiUserEnablement status changed",  v8,  2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10001AD58();
  }
}

void sub_100017E3C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = v6;
  if (!a3 || v6)
  {
    id v11 = sub_10003E9DC();
    os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001AE98();
    }

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0LL, 0LL, v7);
    }
  }

  else
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
    id v9 = [[HMUserCloudShareClientInfo alloc] initWithAccountAuthToken:v8];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, id, void))(v10 + 16))(v10, 1LL, v9, 0LL);
    }
  }
}

id sub_100018768(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

void sub_1000187F8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully finished refresh after home was removed",  v8,  2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10001B048();
  }
}

void sub_100018E44(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 currentHome]);
  [v1 homeManager:v2 didHomeKitSyncComplete:v3];
}

void sub_100018F78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100018F90(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queuedAwaitingCurrentHome]);
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queuedAwaitingCurrentHome]);
  [v6 removeAllObjects];
}

void sub_100018FF8(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)v6);
        int v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentHome", (void)v9));
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

id sub_1000191C8(id a1, HMUser *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMUser uniqueIdentifier](a2, "uniqueIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

void sub_100019470(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled")) {
    [v5 setDelegate:*(void *)(a1 + 32)];
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 userSettingsForHome:*(void *)(a1 + 40)]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);
  [v4 setDelegate:*(void *)(a1 + 32)];
}

__CFString *sub_100019A58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  unsigned int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  unsigned int v6 = [v3 isEndpoint];
  if (v6 | v5) {
    uint64_t v7 = @"CurrentAccessoryIdentifierKey";
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (v6 | v5 && (v5 & 1) == 0)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  }

  return v7;
}

void sub_100019CE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userListeningHistoryUpdateControlForHome:*(void *)(a1 + 32)]);
  unsigned int v5 = v4;
  if (v4)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accessories]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100019E08;
    v20[3] = &unk_100061768;
    id v21 = *(id *)(a1 + 40);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_map:", v20));

    int v8 = *(void **)(a1 + 48);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    objc_msgSend(v8, "na_safeSetObject:forKey:", v7, v10);
  }

  else
  {
    id v11 = sub_10003E9DC();
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001B444(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

__CFString *sub_100019E08(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  unsigned int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  unsigned int v6 = [v3 isEndpoint];
  if (v6 | v5) {
    uint64_t v7 = @"CurrentAccessoryIdentifierKey";
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (v6 | v5 && (v5 & 1) == 0)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  }

  return v7;
}

void sub_10001A07C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001A098(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:allowiTunesAccountSettingsKeyPath])
  {
    id v7 = objc_msgSend(v6, "ms_allowiTunesAccountInHome:", *(void *)(a1 + 40));
LABEL_5:
    id v8 = v7;
    goto LABEL_9;
  }

  if ([*(id *)(a1 + 32) isEqualToString:allowExplicitContentSettingsKeyPath])
  {
    id v7 = objc_msgSend(v6, "ms_allowExplicitContentInHome:", *(void *)(a1 + 40));
    goto LABEL_5;
  }

  id v9 = sub_10003E9DC();
  __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10001B514(a1 + 32, v10, v11, v12, v13, v14, v15, v16);
  }

  id v8 = 0LL;
  *a4 = 1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
LABEL_9:
  uint64_t v17 = *(void **)(a1 + 48);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
  objc_msgSend(v17, "na_safeSetObject:forKey:", v18, v20);
}

void sub_10001A454(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredMediaUser]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  objc_msgSend(v6, "na_safeSetObject:forKey:", v9, v8);
}

id sub_10001A5B8(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

void sub_10001A7AC(_Unwind_Exception *a1)
{
}

void sub_10001A8C0(_Unwind_Exception *a1)
{
}

id sub_10001A8D4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _settingsForActivatedEndpoint:a2 home:*(void *)(a1 + 40)];
}

void sub_10001A9CC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10001A9F0()
{
}

void sub_10001AA50( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AAC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AB30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001ABA0()
{
  v3[0] = 136315650;
  sub_10001A9DC();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s Nil HMUser for userID %@ in home %@",  (uint8_t *)v3,  0x20u);
}

void sub_10001AC28( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AC98()
{
}

void sub_10001ACF8()
{
}

void sub_10001AD58()
{
}

void sub_10001ADB8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AE28( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AE98()
{
}

void sub_10001AEF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AF68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AFD8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B048()
{
}

void sub_10001B0A8(void *a1, os_log_s *a2)
{
  int v3 = 136315651;
  uint64_t v4 = "-[MSDHomeManager _handleHomeKitFinishedInitialization]";
  __int16 v5 = 2113;
  uint8_t v6 = a1;
  __int16 v7 = 1024;
  unsigned int v8 = [a1 isHomePod];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s CurrentAccessory : %{private}@ isHomePod : %d ",  (uint8_t *)&v3,  0x1Cu);
}

void sub_10001B154( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B1C4()
{
}

void sub_10001B224( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B294( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B304( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B374( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B3E4()
{
}

void sub_10001B444( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B4B4()
{
}

void sub_10001B514( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B57C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B5EC()
{
  v2[0] = 136315394;
  sub_10001A9DC();
  sub_10000D560((void *)&_mh_execute_header, v0, v1, "%s Fetched Nil HMAccessory for EndpointID %@", (uint8_t *)v2);
  sub_1000053CC();
}

void sub_10001B65C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 currentAccessory]);
  v5[0] = 136315394;
  sub_10001A9DC();
  sub_10000D560((void *)&_mh_execute_header, a2, v4, "%s Error fetching Home for accessory %@", (uint8_t *)v5);
}

void sub_10001B9E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001BAC0;
    v10[3] = &unk_100061830;
    uint8_t v6 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v6 acceptShareWithShareMetadata:a2 completion:v10];
  }

  else
  {
    id v7 = sub_10003E9DC();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001CA44();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, void, id))(v9 + 16))(v9, 0LL, 0LL, v5);
    }
  }
}

void sub_10001BAC0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    id v8 = sub_10003E9DC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      uint64_t v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CKShareAcceptance token %{private}@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, void *, void))(v10 + 16))(v10, 1LL, v7, 0LL);
    }
  }

  else
  {
    id v11 = sub_10003E9DC();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001CAA4();
    }

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void, void, id))(v13 + 16))(v13, 0LL, 0LL, v5);
    }
  }
}

LABEL_15:
}

void sub_10001BF68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    unsigned int v16 = [v6 CKErrorHasErrorCode:11];
    id v17 = sub_10003E9DC();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Share has underlying error of CKErrorUnknownItem",  (uint8_t *)&v25,  2u);
      }

      [*(id *)(a1 + 40) _saveRecordAndShare:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }

    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10001CBA0(a1, (uint64_t)v7, v19);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

  else
  {
    id v8 = sub_10003E9DC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
      int v25 = 138477827;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched record %{private}@",  (uint8_t *)&v25,  0xCu);
    }

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___CKShare);
    if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0) {
      uint64_t v12 = v5;
    }
    else {
      uint64_t v12 = 0LL;
    }
    id v13 = v12;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 participants]);
    id v15 = [v14 count];

    if ((unint64_t)v15 >= 2)
    {
      if (v15 == (id)2)
      {
        [*(id *)(a1 + 40) _handleMultiplePeopleOnShare:v13 completion:*(void *)(a1 + 48)];
      }

      else
      {
        id v20 = sub_10003E9DC();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10001CC4C();
        }

        uint64_t v23 = *(void *)(a1 + 48);
        if (v23)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  29LL,  0LL));
          (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0LL, v24);
        }
      }
    }

    else
    {
      [*(id *)(a1 + 40) shareRecordWithOwner:v13 completion:*(void *)(a1 + 48)];
    }
  }
}

void sub_10001C3B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138477827;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully established share with owner %{private}@",  (uint8_t *)&v10,  0xCu);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10001CD48();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_22:
}

BOOL sub_10001C764(id a1, CKShareParticipant *a2)
{
  return (id)-[CKShareParticipant role](a2, "role") != (id)1;
}

void sub_10001C854(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001CE00();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
      int v16 = 138477827;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully saved Share %{private}@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___CKShare);
    if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0) {
      uint64_t v12 = v5;
    }
    else {
      uint64_t v12 = 0LL;
    }
    id v13 = v12;
    id v14 = sub_10003E9DC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138477827;
      id v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Now using share... %{private}@",  (uint8_t *)&v16,  0xCu);
    }

    [*(id *)(a1 + 32) shareRecordWithOwner:v13 completion:*(void *)(a1 + 40)];
  }
}

void sub_10001CA18()
{
}

void sub_10001CA44()
{
}

void sub_10001CAA4()
{
}

void sub_10001CB04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CB74()
{
}

void sub_10001CBA0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
  sub_10000D554();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Error fetching CKShare %{private}@, error %@",  v6,  0x16u);
}

void sub_10001CC4C()
{
}

void sub_10001CCAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CD1C()
{
}

void sub_10001CD48()
{
}

void sub_10001CDA8()
{
}

void sub_10001CDD4()
{
}

void sub_10001CE00()
{
}

void sub_10001CFC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001D424((uint64_t)v6, v8, v9);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0LL, 0LL);
    }
  }

  else
  {
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x3032000000LL;
    v29[3] = sub_10001D254;
    v29[4] = sub_10001D264;
    id v30 = 0LL;
    uint64_t v11 = dispatch_group_create();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userAccountHomeUserID]);
    if (v12
      && (unsigned int v13 = +[MSAssistantPreferences isMultiUserEnabledForSiri]( &OBJC_CLASS___MSAssistantPreferences,  "isMultiUserEnabledForSiri"),  v12,  v13))
    {
      dispatch_group_enter(v11);
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSAssistantPreferences sharedPreferences]( &OBJC_CLASS___MSAssistantPreferences,  "sharedPreferences"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 userAccountHomeUserID]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10001D26C;
      v25[3] = &unk_100061910;
      id v26 = (os_log_s *)v5;
      id v28 = v29;
      id v27 = v11;
      [v14 getSharedUserIDForHomeUser:v15 completion:v25];

      int v16 = v26;
    }

    else
    {
      id v17 = sub_10003E9DC();
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "HomeUserID is nil or MU is disabled for current Siri language",  buf,  2u);
      }
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001D2F4;
    block[3] = &unk_100061938;
    id v21 = v5;
    uint64_t v23 = v29;
    id v22 = *(id *)(a1 + 32);
    dispatch_group_notify(v11, v19, block);

    _Block_object_dispose(v29, 8);
  }
}

void sub_10001D238( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_10001D254(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001D264(uint64_t a1)
{
}

void sub_10001D26C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001D490(a1, v7);
    }
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10001D2F4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applicationBundleID]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userAccountHomeUserID]);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[MSDServiceResolutionHelper createMSResolutionInfoObject:homeUserID:sharedUserID:]( &OBJC_CLASS___MSDServiceResolutionHelper,  "createMSResolutionInfoObject:homeUserID:sharedUserID:",  v2,  v3,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)));

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10001D3A0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10001D3AC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  id v4 = "-[MSDResolveNowPlayingInfo performNowPlayingInfoResolution:]";
  sub_10001D3A0((void *)&_mh_execute_header, a1, a3, "%s Nil completionHandler", (uint8_t *)&v3);
}

void sub_10001D424(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10001D3A0((void *)&_mh_execute_header, a2, a3, "Error fetching now playing data %@", (uint8_t *)&v3);
}

void sub_10001D490(uint64_t a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userAccountHomeUserID]);
  int v5 = 138412290;
  id v6 = v3;
  sub_10001D3A0((void *)&_mh_execute_header, a2, v4, "Error retrieving sharedUserID for homeUserID %@", (uint8_t *)&v5);
}

id MSDSignpostFacility()
{
  if (qword_1000707B8 != -1) {
    dispatch_once(&qword_1000707B8, &stru_1000619A0);
  }
  return (id)qword_1000707B0;
}

void sub_10001DAA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mediasetupd.signposts", "signposts");
  uint64_t v2 = (void *)qword_1000707B0;
  qword_1000707B0 = (uint64_t)v1;
}

os_signpost_id_t MSDGenerateSignpostID()
{
  id v0 = MSDSignpostFacility();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  os_signpost_id_t v2 = os_signpost_id_generate(v1);

  return v2;
}

void sub_10001E2DC(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  os_signpost_id_t v2 = (void *)qword_1000707C0;
  qword_1000707C0 = (uint64_t)v1;
}

void sub_10001E550( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10001E574(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performStartup];
}

void sub_10001E698(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100024EB8();
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001E974(_Unwind_Exception *a1)
{
}

void sub_10001E990(uint64_t a1, xpc_object_t xdict)
{
  string = (char *)xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string) {
    string = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
  }
  id v4 = sub_10003E9DC();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138477827;
    id v22 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received Darwin Notification %{private}@",  (uint8_t *)&v21,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![string isEqualToString:kHomeMultiUserStatusChangedNotification])
  {
    if ([string isEqualToString:kHomeUserCloudShareChangedNotification])
    {
      id v8 = sub_10003E9DC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        id v10 = "Previously registered to accept shares, should receive HomeKit callback on this one";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v21, 2u);
      }
    }

    else if ([string isEqualToString:@"com.apple.homehubd.endpointActivated"])
    {
      id v11 = sub_10003E9DC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        id v10 = "Received Launchd Event: Siri Endpoint Activated notification";
        goto LABEL_20;
      }
    }

    else
    {
      id v20 = sub_10003E9DC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        id v10 = "Received Launchd Event: Siri Endpoint Deactivated notification";
        goto LABEL_20;
      }
    }

LABEL_21:
    goto LABEL_22;
  }

  if (!WeakRetained)
  {
    id v12 = sub_10003E9DC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100024F18(v9, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_21;
  }

  id v7 = (void *)WeakRetained[6];
  if (v7) {
    [v7 trigger];
  }
LABEL_22:
}

void sub_10001ED80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10001EDA8(id a1)
{
  id v1 = sub_10003E9DC();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection to CUCoalescer invalidated", v3, 2u);
  }
}

void sub_10001EE0C(uint64_t a1)
{
  id v2 = sub_10003E9DC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting action handler on CUCoalescer", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleRefreshTask];
}

void sub_10001EE88(uint64_t a1)
{
}

void sub_10001EF70(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
  [v1 refreshDataForReason:5 completion:&stru_100061A50];
}

void sub_10001EFB0(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_10003E9DC();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100024F88();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully refreshed data after HomeMUStatusChanged",  v7,  2u);
  }
}

void sub_10001F1EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully saved public DB info", v9, 2u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100025048();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10001F2F0(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 16LL) = 1;
  return result;
}

void sub_10001F400( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10001F424(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001F614;
  v22[3] = &unk_100061AA0;
  v22[4] = &v23;
  [v3 setExpirationHandler:v22];
  if (!*((_BYTE *)v24 + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      if (*((_BYTE *)WeakRetained + 16))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10001F628;
        v18[3] = &unk_100061A78;
        id v19 = v3;
        [v15 syncDataWithCloudKit:v18];

        goto LABEL_13;
      }

      id v16 = sub_10003E9DC();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "HomeKit not ready, deferring publicDB refresh",  buf,  2u);
      }
    }

    [v3 setTaskCompleted];
    goto LABEL_13;
  }

  id v21 = 0LL;
  unsigned __int8 v4 = [v3 setTaskExpiredWithRetryAfter:&v21 error:300.0];
  id v5 = v21;
  if ((v4 & 1) == 0)
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000250A8((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    [v3 setTaskCompleted];
  }

LABEL_13:
  _Block_object_dispose(&v23, 8);
}
}
}

void sub_10001F5EC(_Unwind_Exception *a1)
{
}

uint64_t sub_10001F614(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

void sub_10001F628(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Scheduled background sync finished, error: %@",  (uint8_t *)&v7,  0xCu);
  }

  [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_10001F964(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002518C();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138477827;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Services configured on account %{private}@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v11);
  }
}

void sub_10001FD58( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location)
{
}

void sub_10001FD88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[10] appServiceInfoForUsers:v3]);
    if (![v6 count])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  5LL,  0LL));
      id v8 = sub_10003E9DC();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002525C();
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    id v10 = sub_10003E9DC();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138477827;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Services configured in home %{private}@",  (uint8_t *)&v12,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

NSUUID *__cdecl sub_10001FEF8(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v2);

  return v3;
}

void sub_10001FF3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
      *(_DWORD *)buf = 138477827;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attained home: %{private}@. Looking up services for users within it",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 allUsersIdentifiers]);
    uint64_t v9 = v8;
    if (v8 && [v8 count])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      id v10 = sub_10003E9DC();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000252E8(v3, v11);
      }

      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = MSErrorDomain;
      uint64_t v19 = MSUserInfoErrorStringKey;
      id v20 = @"Failed to fetch all users in home";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  4LL,  v14));
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0LL, v15);
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000252BC();
    }

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = MSErrorDomain;
    uint64_t v23 = MSUserInfoErrorStringKey;
    uint64_t v24 = @"Failed to fetch valid home";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  3LL,  v9));
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v18);
  }
}

void sub_1000203A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100025378();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138477827;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Services configured on account in cache %{private}@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v11);
  }
}

void sub_100020898( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

id sub_1000208BC(id a1, MSSetupBundle *a2)
{
  return -[MSSetupBundle homeID](a2, "homeID");
}

void sub_1000208C4(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000254E4();
    }

    (*((void (**)(void))a1[7] + 2))();
    [a1[4] releaseTransaction];
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    if (WeakRetained)
    {
      id v7 = a1[5];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100020AE4;
      v21[3] = &unk_100061C10;
      id v25 = a1[7];
      id v22 = a1[4];
      id v23 = a1[5];
      id v24 = a1[6];
      +[MSAuthTokenProvider validateConfigurationResourceForMediaService:networkActivity:completion:]( &OBJC_CLASS___MSAuthTokenProvider,  "validateConfigurationResourceForMediaService:networkActivity:completion:",  v7,  0LL,  v21);

      id v8 = v25;
    }

    else
    {
      id v9 = sub_10003E9DC();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100025474(v10, v11, v12, v13, v14, v15, v16, v17);
      }

      uint64_t v18 = (void (**)(id, void, void *))a1[7];
      uint64_t v19 = MSErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      id v27 = @"Nil self";
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  1LL,  v8));
      v18[2](v18, 0LL, v20);
    }
  }
}

void sub_100020AE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100025544();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    [*(id *)(a1 + 32) releaseTransaction];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100020C14;
    v10[3] = &unk_100061BE8;
    id v11 = v7;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    [v6 addMediaService:v11 usingSetupBundles:v8 transaction:v9 completion:v10];
  }
}

void sub_100020C14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000255A4(a1, (uint64_t)v5, v8);
    }

    [*(id *)(a1 + 40) releaseTransaction];
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
      int v12 = 138477827;
      id v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully added service %{private}@",  (uint8_t *)&v12,  0xCu);
    }
  }

  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 translateCKErrorToMSError]);
  (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, a2, v11);
}

void sub_10002113C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000256AC();
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
      int v14 = 138477827;
      uint64_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully removed service %{private}@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s UUIDString](v8, "UUIDString"));
    [v10 _clearCachedIconImage:v11];
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, a2, v13);
  }
}

void sub_10002153C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002577C();
    }
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);
  }
}

void sub_10002184C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002584C();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);
    int v13 = 136315395;
    int v14 = "-[MSDManager getDefaultMediaService:homeUserID:completion:]_block_invoke";
    __int16 v15 = 2113;
    uint64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Fetched Default Service (%{private}@)",  (uint8_t *)&v13,  0x16u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
  }
}

LABEL_18:
}
}

void sub_100021D20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002591C();
    }
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);
  }
}

void sub_100021FC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000259EC();
    }
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
  }
}

LABEL_17:
LABEL_18:
    goto LABEL_19;
  }

  uint64_t v18 = sub_10003E9DC();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1000252BC();
  }

  if (v3)
  {
    id v20 = MSErrorDomain;
    id v25 = MSUserInfoErrorStringKey;
    NSErrorUserInfoKey v26 = @"Failed to fetch valid home";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  3LL,  v9));
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v13);
    goto LABEL_17;
  }

void sub_100022370(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100025AAC();
    }
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 translateCKErrorToMSError]);
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
  }
}

void sub_1000224C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138477827;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Error fetching publicDB info for %{private}@",  (uint8_t *)&v7,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000228E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", *(void *)(a1 + 32));
  id v5 = sub_10003E9DC();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100025B0C(a1, (uint64_t)v3, v7);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serviceName]);
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched auth tokens for Media Service %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
  [v9 updateAuthRenewalForMediaService:*(void *)(a1 + 40) homeUserID:v4 completion:&stru_100061CD0];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100022A30(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100025BA4();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully updated CloudKit with new AuthInfo",  v7,  2u);
  }
}

uint64_t sub_100022CAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100022E40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002310C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void, void))(v3 + 16))(*(void *)(a1 + 32), 0LL);
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([a2 allObjects]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0LL);
  }

void sub_1000233AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Error switching account info, %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  else if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Successfully switched account info for %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 translateCKErrorToMSError]);
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void sub_1000238D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100023900(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100025D30();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assistant]);
    id v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 appServiceInfoForUser:v11]);

    if (v12)
    {
      id v13 = sub_10003E9DC();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        uint64_t v19 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Returning supported services (found in cache) %@",  (uint8_t *)&v18,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  5LL,  0LL));
      id v16 = sub_10003E9DC();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100025CC4();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }
}

void sub_100024100(_Unwind_Exception *a1)
{
}

uint64_t sub_100024154(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100024164(uint64_t a1)
{
}

void sub_10002416C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100025DF4();
    }
  }

  id v9 = [v5 mutableCopy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_24:
}

id sub_1000246FC(id a1, MSPublicDBInfo *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo serviceID](v2, "serviceID"));

  id v5 = -[NSUUID initWithUUIDString:](v3, "initWithUUIDString:", v4);
  return v5;
}

id sub_100024764(id a1, MSPublicDBInfo *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo serviceID](v2, "serviceID"));

  id v5 = -[NSUUID initWithUUIDString:](v3, "initWithUUIDString:", v4);
  return v5;
}

id sub_1000247CC(id a1, NSDictionary *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v2, "objectForKey:", MediaServiceIdentifier));

  id v5 = -[NSUUID initWithUUIDString:](v3, "initWithUUIDString:", v4);
  return v5;
}

void sub_100024840(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = sub_10003E9DC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully deleted remanent services on account",  buf,  2u);
    }

    if ([*(id *)(a1 + 32) count])
    {
      id v9 = [*(id *)(a1 + 40) mutableCopy];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100024AA0;
      v22[3] = &unk_100061E40;
      uint64_t v10 = *(void **)(a1 + 40);
      id v23 = *(id *)(a1 + 48);
      id v24 = v9;
      id v11 = v9;
      [v10 enumerateObjectsUsingBlock:v22];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      [v12 setObjectWithCustomClass:v11 forDefault:@"publicDBData"];
    }

    else
    {
      id v18 = sub_10003E9DC();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "There are no valid MediaService Developer profiles installed on device, clearing defaults",  buf,  2u);
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      [v11 clearDeveloperDefaults];
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100024B34;
    v21[3] = &unk_100060E68;
    id v20 = *(void **)(a1 + 48);
    void v21[4] = *(void *)(a1 + 56);
    [v20 enumerateObjectsUsingBlock:v21];
  }

  else
  {
    unsigned __int8 v13 = [v5 CKErrorHasErrorCode:11];
    id v14 = sub_10003E9DC();
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100025EF0(a1, (uint64_t)v6, v16);
      }
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "There are no valid MediaService Developer profiles installed on device, clearing defaults",  buf,  2u);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      [v17 clearDeveloperDefaults];
    }
  }
}

void sub_100024AA0(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceID]);
  id v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  LODWORD(v3) = objc_msgSend(v3, "na_safeContainsObject:", v6);

  if ((_DWORD)v3) {
    [*(id *)(a1 + 40) removeObjectIdenticalTo:v7];
  }
}

void sub_100024B34(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 UUIDString]);
  [v2 _clearCachedIconImage:v3];
}

id sub_100024BE4(uint64_t a1)
{
  id v2 = sub_10003E9DC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Refreshing public DB info in cache after startup",  buf,  2u);
  }

  [*(id *)(a1 + 32) _savePublicDBInfoInDefaults];
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Syncing any installed developer profiles",  v14,  2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) syncStatusOfInstalledProfiles];
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finishing setup for multi-user", v13, 2u);
  }

  [*(id *)(a1 + 32) _setupMultiUser];
  [*(id *)(a1 + 32) _initializeCoalescerObject];
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting migration", v12, 2u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  [v10 removeDelegate:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 32) _performMigrationSynchronously];
}

void sub_100024EB8()
{
}

void sub_100024F18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024F88()
{
}

void sub_100024FE8()
{
}

void sub_100025048()
{
}

void sub_1000250A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002511C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002518C()
{
}

void sub_1000251EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002525C()
{
}

void sub_1000252BC()
{
}

void sub_1000252E8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  sub_10000D554();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to fetch all users in home, %{private}@",  v4,  0xCu);
}

void sub_100025378()
{
}

void sub_1000253D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025448()
{
}

void sub_100025474( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000254E4()
{
}

void sub_100025544()
{
}

void sub_1000255A4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
  sub_10000D554();
  __int16 v8 = 2113;
  uint64_t v9 = a2;
  sub_10000D560((void *)&_mh_execute_header, a3, v6, "Error adding service %{private}@ to home: %{private}@", v7);

  sub_100024E90();
}

void sub_10002563C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000256AC()
{
}

void sub_10002570C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002577C()
{
}

void sub_1000257DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002584C()
{
}

void sub_1000258AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002591C()
{
}

void sub_10002597C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000259EC()
{
}

void sub_100025A4C()
{
}

void sub_100025AAC()
{
}

void sub_100025B0C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serviceName]);
  sub_10000D554();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  sub_10000D560((void *)&_mh_execute_header, a3, v6, "Error fetching auth tokens for %@, %@", v7);

  sub_100024E90();
}

void sub_100025BA4()
{
}

void sub_100025C04()
{
}

void sub_100025C64()
{
}

void sub_100025CC4()
{
}

void sub_100025D30()
{
}

void sub_100025D9C()
{
}

void sub_100025DC8()
{
}

void sub_100025DF4()
{
}

void sub_100025E54( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025EC4()
{
}

void sub_100025EF0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2113;
  uint64_t v7 = a2;
  sub_10000D560( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Error deleting service %{private}@ from account %{private}@",  (uint8_t *)&v4);
  sub_1000053CC();
}

void sub_1000265E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, id location)
{
}

void sub_10002664C(id a1)
{
  uint64_t v1 = -[MSDExpireCache initWithExpiration:](objc_alloc(&OBJC_CLASS___MSDExpireCache), "initWithExpiration:", 60.0);
  uint64_t v2 = (void *)qword_1000707D0;
  qword_1000707D0 = (uint64_t)v1;
}

void sub_100026680(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100026AE0((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [WeakRetained _accountHasLocalPlayableContent:*(void *)(a1 + 32)];

    id v16 = sub_10003E9DC();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
        id v18 = @"has";
      }
      else {
        id v18 = @"does not have";
      }
      int v32 = 138412290;
      id v33 = v18;
      uint64_t v19 = "The account %@ localPlaybackContent";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      uint32_t v22 = 12;
      goto LABEL_11;
    }
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 subscriptionStatus]);
    int v24 = [v23 capabilities] & 1;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v24;
    id v25 = sub_10003E9DC();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v32 = 67109120;
      LODWORD(v33) = v24;
      uint64_t v19 = "Fetched Subscription Status %d";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
      uint32_t v22 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, (uint8_t *)&v32, v22);
    }
  }

  id v26 = MSDSignpostFacility();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  id v28 = v27;
  os_signpost_id_t v29 = *(void *)(a1 + 64);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    uint64_t v30 = NSStringFromBOOL(*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
    id v31 = (__CFString *)objc_claimAutoreleasedReturnValue(v30);
    int v32 = 138543362;
    id v33 = v31;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  v29,  "CheckSubscriptionStatus",  "LookupFinishedWithStatus=%{signpost.description:attribute,public}@",  (uint8_t *)&v32,  0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100026A0C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026A40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026A74( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026AE0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

LABEL_12:
}
}

id sub_100027600(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 service]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
  id v7 = [v5 isEqualToString:v6];

  return v7;
}

id sub_100027800(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSServiceAccountRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    if ([v7 isEqual:kAppleMusicServiceIdentifier])
    {
      id v8 = 0LL;
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 homeID]);
      id v8 = [v9 isEqual:*(void *)(a1 + 32)];
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void sub_100027D90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40)
{
}

uint64_t sub_100027DC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100027DD0(uint64_t a1)
{
}

void sub_100027DD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100028D60(a1, (uint64_t)v6, v9);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v11 = v6;
    uint64_t v12 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Fetched Default service object %{private}@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    objc_msgSend(v13, "na_safeSetObject:forKey:", v5, v12);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_100027F10(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))( result,  a1[4],  *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
  }
  return result;
}

void sub_1000283B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_1000283E4(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100028530(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v20 = a1;
    id v7 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v5);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
          id v14 = [v13 copy];

          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceID]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v16));

          id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 homeID]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 homeUserID]);
          [v14 populateMediaService:v17 homeID:v18 homeUserID:v19];

          [v7 addObject:v14];
        }

        id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v9);
    }

    (*(void (**)(void))(*(void *)(v20 + 32) + 16LL))();
  }
}

uint64_t sub_100028A74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  unsigned int v5 = [v4 isEqualToString:MSServiceAccountRecordType];

  if (v5
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]),
        unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)],
        v6,
        v7))
  {
    if (*(void *)(a1 + 40))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceID]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serviceID]);
      uint64_t v12 = (uint64_t)[v10 isEqualToString:v11];
    }

    else
    {
      uint64_t v12 = 1LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

void sub_100028CB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028D20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Missing cached serviceInfo from device",  v1,  2u);
}

void sub_100028D60(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138478083;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error fetching default service for user %{private}@, %@",  (uint8_t *)&v4,  0x16u);
  sub_1000053CC();
}

void sub_100028DE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029074( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1000290A0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) != 0)
  {
    id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v7 = WeakRetained;
    if (WeakRetained)
    {
      if (WeakRetained[2] == 0.0)
      {
        [WeakRetained _performDataRefresh:*(void *)(a1 + 40)];
        goto LABEL_18;
      }

      [WeakRetained refreshDataAfterDelay];
      uint64_t v8 = *(void *)(a1 + 40);
      if (!v8)
      {
LABEL_18:

        goto LABEL_19;
      }

      id v9 = *(void (**)(void))(v8 + 16);
    }

    else
    {
      id v13 = sub_10003E9DC();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002D7D0(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      uint64_t v22 = *(void *)(a1 + 40);
      if (!v22) {
        goto LABEL_18;
      }
      id v9 = *(void (**)(void))(v22 + 16);
    }

    v9();
    goto LABEL_18;
  }

  id v10 = sub_10003E9DC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v23 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CloudKit is not available...returning...",  v23,  2u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0LL, v5);
  }
  [(id)objc_opt_class(*(void *)(a1 + 32)) clearLastRefreshTSForHomes];
LABEL_19:
}

BOOL sub_1000294E8(id a1, HMHome *a2, unint64_t a3, BOOL *a4)
{
  int v4 = a2;
  if ((-[HMHome hasAccessoryTypeHomePod](v4, "hasAccessoryTypeHomePod") & 1) != 0
    || (-[HMHome isMultiUserEnabled](v4, "isMultiUserEnabled") & 1) != 0)
  {
    if (+[MSDeviceInfo deviceSupportsMultipleUsers]( &OBJC_CLASS___MSDeviceInfo,  "deviceSupportsMultipleUsers"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
      __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAccessory]);
      unsigned __int8 v7 = [v6 isPartOfHome:v4];
    }

    else
    {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138477827;
      uint64_t v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{private}@ HomeMUEnabled = NO AND User does not have any HomePods in configured.",  (uint8_t *)&v11,  0xCu);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

void sub_100029604(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100029704;
    v7[3] = &unk_100061FD0;
    v7[4] = v3;
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    [v3 _deleteZombieRecordZonesIfAnyInHomes:v4 completion:v7];
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSCloudKitErrorDomain,  0LL,  0LL));
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0LL, v6);
    }

    [(id)objc_opt_class(*(void *)(a1 + 32)) clearLastRefreshTSForHomes];
  }

void sub_100029704(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  id v5 = sub_10003E9DC();
  __int16 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10002D840();
  }

  if ([v4 isErrorFatal])
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      uint64_t v19 = "-[MSDDataRefresh _performDataRefresh:]_block_invoke";
      __int16 v20 = 2113;
      uint64_t v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Fatal error %{private}@", buf, 0x16u);
    }

    [(id)objc_opt_class(*(void *)(a1 + 32)) clearLastRefreshTSForHomes];
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0LL, v4);
    }
  }

  else
  {
LABEL_10:
    id v10 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000298B8;
    v13[3] = &unk_100061FA8;
    id v11 = v4;
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = v11;
    uint64_t v15 = v12;
    id v17 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    [v10 _refreshDatabases:v13];
  }
}

void sub_1000298B8(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isErrorFatal])
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v10 = 136315395;
      id v11 = "-[MSDDataRefresh _performDataRefresh:]_block_invoke";
      __int16 v12 = 2113;
      uint64_t v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Fatal error %{private}@",  (uint8_t *)&v10,  0x16u);
    }

    [(id)objc_opt_class(a1[5]) clearLastRefreshTSForHomes];
    uint64_t v7 = a1[7];
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
LABEL_10:
      v8();
    }
  }

  else
  {
    if (!v3) {
      [(id)objc_opt_class(a1[5]) cacheLastRefreshforHomes:a1[6]];
    }
    uint64_t v9 = a1[7];
    if (v9)
    {
      id v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }
}

void sub_100029CD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_100029D0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 isErrorFatal];
    id v5 = sub_10003E9DC();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002D8A0();
    }
  }

  else
  {
    id v7 = sub_10003E9DC();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138477827;
      uint64_t v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully Validated Service Configuration Info %{private}@",  (uint8_t *)&v9,  0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_100029E14(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))( result,  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == 0);
  }
  return result;
}

id sub_10002A018(id a1, HMHome *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome currentUser](a2, "currentUser"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIdentifier]);

  return v3;
}

void sub_10002A054(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v33 = v5;
  id v34 = v6;
  if (v5 && !v6)
  {
    group = dispatch_group_create();
    *(void *)&__int128 v57 = 0LL;
    *((void *)&v57 + 1) = &v57;
    uint64_t v58 = 0x3032000000LL;
    __int16 v59 = sub_10002A574;
    id v60 = sub_10002A584;
    id v61 = 0LL;
    id v7 = sub_10003E9DC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      id v54 = "-[MSDDataRefresh _deleteZombieRecordZonesIfAnyInHomes:completion:]_block_invoke";
      __int16 v55 = 2112;
      uint64_t v56 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s User is part of homes %@", buf, 0x16u);
    }

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v11 = [v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v46;
      uint64_t v35 = MSPlaceholderRecordName;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID", v33));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
          unsigned __int8 v17 = [v16 isEqualToString:CKRecordZoneDefaultName];

          if ((v17 & 1) == 0)
          {
            dispatch_group_enter(group);
            uint64_t v18 = objc_alloc(&OBJC_CLASS___CKRecordID);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
            __int16 v20 = -[CKRecordID initWithRecordName:zoneID:](v18, "initWithRecordName:zoneID:", v35, v19);

            uint64_t v21 = *(void **)(a1 + 32);
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472LL;
            v40[2] = sub_10002A58C;
            v40[3] = &unk_1000620D8;
            uint64_t v22 = *(void *)(a1 + 56);
            v40[4] = v14;
            v40[5] = v22;
            id v44 = &v57;
            uint64_t v41 = group;
            id v42 = *(id *)(a1 + 48);
            __int128 v23 = v20;
            id v43 = v23;
            [v21 fetchRecordWithID:v23 completionHandler:v40];
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }

      while (v11);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    __int128 v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002A9A0;
    block[3] = &unk_100062020;
    id v38 = *(id *)(a1 + 64);
    uint64_t v39 = &v57;
    dispatch_group_notify(group, v25, block);

    _Block_object_dispose(&v57, 8);
LABEL_24:

    goto LABEL_25;
  }

  id v26 = sub_10003E9DC();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_10002D938();
  }

  uint64_t v28 = *(void *)(a1 + 64);
  if (v28) {
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v34);
  }
  if (objc_msgSend(v34, "CKErrorHasErrorCode:", 112, v33) && CKErrorIsCode(v34, 2))
  {
    os_signpost_id_t v29 = (void *)objc_claimAutoreleasedReturnValue([v34 userInfo]);
    group = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v29 objectForKey:CKPartialErrorsByItemIDKey]);

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_group_s allKeys](group, "allKeys"));
    id v31 = sub_10003E9DC();
    int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v57) = 138412290;
      *(void *)((char *)&v57 + 4) = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Zones with ManateeIdentity Lost %@",  (uint8_t *)&v57,  0xCu);
    }

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10002A564;
    v49[3] = &unk_100061228;
    id v50 = *(id *)(a1 + 32);
    id v51 = *(id *)(a1 + 40);
    [v30 enumerateObjectsUsingBlock:v49];

    goto LABEL_24;
  }

void sub_10002A534(_Unwind_Exception *a1)
{
}

id sub_10002A564(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCKErrorMissingManateeIdentity:a2 homeUserIDS:*(void *)(a1 + 40)];
}

uint64_t sub_10002A574(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002A584(uint64_t a1)
{
}

void sub_10002A58C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v6 && !v7)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSUUID);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 recordFieldForKey:MSHomeParticipantHomeIdentifier]);
    id v11 = -[NSUUID initWithUUIDString:](v9, "initWithUUIDString:", v10);

    if (v11
      && (uint64_t v12 = *(void **)(a1 + 56),
          v28[0] = _NSConcreteStackBlock,
          v28[1] = 3221225472LL,
          v28[2] = sub_10002A910,
          v28[3] = &unk_1000620B0,
          id v3 = (id *)&v29,
          os_signpost_id_t v29 = v11,
          (objc_msgSend(v12, "ms_anyPassingTest:", v28) & 1) != 0))
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    }

    else
    {
      id v20 = sub_10003E9DC();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) recordName]);
        *(_DWORD *)buf = 138477827;
        id v34 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Detected Zombie recordZone %{private}@",  buf,  0xCu);
      }

      __int128 v23 = *(void **)(a1 + 40);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10002A950;
      v25[3] = &unk_100062088;
      uint64_t v27 = *(void *)(a1 + 72);
      id v26 = *(id *)(a1 + 48);
      [v23 _deleteRecordZone:v24 completion:v25];

      if (!v11) {
        goto LABEL_17;
      }
    }

LABEL_17:
    goto LABEL_18;
  }

  unsigned int v13 = [v7 CKErrorHasErrorCode:11];
  id v14 = sub_10003E9DC();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
      *(_DWORD *)buf = 138477827;
      id v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Possibly a zombie recordZone, deleting %{private}@",  buf,  0xCu);
    }

    uint64_t v18 = *(void **)(a1 + 40);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10002A8C0;
    v30[3] = &unk_100062088;
    uint64_t v32 = *(void *)(a1 + 72);
    id v31 = *(id *)(a1 + 48);
    [v18 _deleteRecordZone:v19 completion:v30];
  }

  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002D998();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

void sub_10002A8C0(uint64_t a1, int a2, id obj)
{
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_10002A910(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 uniqueIdentifier]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_10002A950(uint64_t a1, int a2, id obj)
{
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10002A9A0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  return result;
}

void sub_10002AA94(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002D9F8(a1, (uint64_t)v5, v8);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138477827;
    uint64_t v12 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully Zombie deleted recordZone %{private}@",  (uint8_t *)&v11,  0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void sub_10002AD2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_10002AD50(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  if ([v4 isErrorFatal])
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002DA90();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002ADE8(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      (*(void (**)(uint64_t, void))(v2 + 16))( v2,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    }
  }

  else
  {
    id v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedCloudDatabase]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_10002AF58;
    v14[3] = &unk_100062150;
    int8x16_t v16 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    uint64_t v15 = v3;
    id v6 = v3;
    [v5 refreshDatabase:0 completion:v14];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002B004;
    block[3] = &unk_100062020;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = v9;
    uint64_t v13 = v10;
    dispatch_group_notify(v6, v8, block);
  }

void sub_10002AF58(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  if ([v4 isErrorFatal])
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002DB00();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10002B004(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  return result;
}

id sub_10002B170(id a1, HMHome *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uniqueIdentifier](a2, "uniqueIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

void sub_10002B304( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10002B324(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10002B394;
    v3[3] = &unk_1000621C0;
    v3[4] = WeakRetained;
    [WeakRetained _performDataRefresh:v3];
  }
}

void sub_10002B394(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002DBA4(a1, (uint64_t)v4, v7);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    refreshed = MSDDataRefreshReasonToString(*(void *)(*(void *)(a1 + 32) + 8LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully updated data after %@",  (uint8_t *)&v10,  0xCu);
  }
}

void sub_10002B628( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10002B64C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = kAppleMusicApplicationIdentifier;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002B79C;
    v11[3] = &unk_1000621E8;
    id v14 = a1[5];
    objc_copyWeak(&v15, a1 + 6);
    id v12 = v5;
    id v13 = a1[4];
    +[MSDPublicDBManager getPublicInfoForServiceName:completion:]( &OBJC_CLASS___MSDPublicDBManager,  "getPublicInfoForServiceName:completion:",  v7,  v11);

    objc_destroyWeak(&v15);
  }

  else
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002DC40();
    }

    int v10 = (void (**)(id, id))a1[5];
    if (v10) {
      v10[2](v10, v6);
    }
  }
}

void sub_10002B788(_Unwind_Exception *a1)
{
}

void sub_10002B79C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _checkDataSanity:*(void *)(a1 + 32) publicDBInfo:v3 home:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_7:

    goto LABEL_8;
  }

  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10002DCA0(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  uint64_t v14 = *(void *)(a1 + 48);
  if (v14)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  7LL,  0LL));
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, WeakRetained);
    goto LABEL_7;
  }

void sub_10002BB28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_10002BB54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6
    || (id v7 = objc_loadWeakRetained((id *)(a1 + 80)),
        unsigned __int8 v8 = [v7 _shouldProceedWithExecution:v6],
        v7,
        (v8 & 1) != 0))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 32)]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 40)]);
    uint64_t v11 = MediaServiceIdentifier;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 recordFieldForKey:MediaServiceIdentifier]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 recordFieldForKey:v11]);
    uint64_t v14 = (void *)v13;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (v12)
      {
        if (v13)
        {
LABEL_22:

          goto LABEL_23;
        }

        id v16 = sub_10003E9DC();
        unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "User missing default service record, defaulting to Apple Music",  buf,  2u);
        }

        uint64_t v18 = (id *)(a1 + 80);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
        uint64_t v21 = *(void *)(a1 + 48);
        id v20 = (id *)(a1 + 48);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_10002BEBC;
        v31[3] = &unk_100062238;
        id v34 = v20[3];
        objc_copyWeak(&v35, v18);
        id v32 = v9;
        id v33 = *v20;
        [WeakRetained _updateDefaultService:v21 record:v32 completion:v31];

        objc_destroyWeak(&v35);
        id v22 = v34;
      }

      else
      {
        id v28 = sub_10003E9DC();
        os_signpost_id_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "User missing Apple Music record, creating a new one",  buf,  2u);
        }

        id v22 = objc_loadWeakRetained((id *)(a1 + 80));
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) zoneID]);
        [v22 _createAndSaveAppleMusicRecord:v30 publicDBInfo:*(void *)(a1 + 64) home:*(void *)(a1 + 48) completion:*(void *)(a1 + 72)];
      }
    }

    else
    {
      id v23 = sub_10003E9DC();
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 recordFieldForKey:MSHomeParticipantHomeUserIdentifier]);
        *(_DWORD *)buf = 138477827;
        uint64_t v37 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "User's (%{private}@) Apple Music and Default Service are configured correctly",  buf,  0xCu);
      }

      id v22 = objc_loadWeakRetained((id *)(a1 + 80));
      [v22 _shareThisRecordIfApplicable:v9 home:*(void *)(a1 + 48) completion:*(void *)(a1 + 72)];
    }

    goto LABEL_22;
  }

  uint64_t v27 = *(void *)(a1 + 72);
  if (v27) {
    (*(void (**)(uint64_t, id))(v27 + 16))(v27, v6);
  }
LABEL_23:
}

void sub_10002BEA0(_Unwind_Exception *a1)
{
}

void sub_10002BEBC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = 0LL;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _shareThisRecordIfApplicable:*(void *)(a1 + 32) home:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

    goto LABEL_5;
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    id v7 = v4;
    (*(void (**)(void))(v5 + 16))();
LABEL_5:
    id v4 = v7;
  }
}

void sub_10002C2A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10002C2D0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002DDE4();
    }

    uint64_t v12 = (void (**)(id, id))a1[5];
    if (v12) {
      v12[2](v12, v6);
    }
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Now updating default Service to AppleMusic..",  buf,  2u);
    }

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002C474;
    v13[3] = &unk_100062238;
    id v11 = a1[4];
    id v16 = a1[5];
    objc_copyWeak(&v17, a1 + 6);
    id v14 = v5;
    id v15 = a1[4];
    [WeakRetained _updateDefaultService:v11 record:v14 completion:v13];

    objc_destroyWeak(&v17);
  }
}

void sub_10002C460(_Unwind_Exception *a1)
{
}

void sub_10002C474(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138477827;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Error creating default service for user %{private}@",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v4);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _shareThisRecordIfApplicable:*(void *)(a1 + 32) home:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void sub_10002C774(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentUser]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
      int v14 = 138477827;
      id v15 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully shared data with owner for participant %{private}@",  (uint8_t *)&v14,  0xCu);
    }

    goto LABEL_9;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10002DEB4();
  }

  if ([v6 isErrorFatal])
  {
    id v10 = sub_10003E9DC();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002DE44();
    }
LABEL_9:
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
  }
}

void sub_10002CB24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002DF14();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully updated default service", v11, 2u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v5 != 0LL, v6);
  }
}

void sub_10002CD68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002DF74();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully saved AppleMusic record", v11, 2u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void sub_10002CF10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    unsigned __int8 v8 = objc_alloc(&OBJC_CLASS___NSString);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 clientInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountAuthToken]);
    id v11 = -[NSString initWithData:encoding:](v8, "initWithData:encoding:", v10, 4LL);

    if (v11) {
      goto LABEL_11;
    }
    id v12 = sub_10003E9DC();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002DFD4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  else if (v6)
  {
    id v21 = sub_10003E9DC();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138477827;
      __int128 v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received Nil HMHomeCloudShareResponse, error %{private}@",  (uint8_t *)&v24,  0xCu);
    }

    [*(id *)(a1 + 32) _handleCKShareError:v7 home:*(void *)(a1 + 40)];
  }

  id v11 = 0LL;
LABEL_11:
  uint64_t v23 = *(void *)(a1 + 48);
  if (v23) {
    (*(void (**)(uint64_t, NSString *, void *))(v23 + 16))(v23, v11, v7);
  }
}

id sub_10002D210(id a1, HMHome *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uniqueIdentifier](a2, "uniqueIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

void sub_10002D5C8(id a1, id a2)
{
  uint64_t v2 = (void (**)(id, uint64_t))a2;
  id v3 = -[MSDDataRefresh initWithReason:](objc_alloc(&OBJC_CLASS___MSDDataRefresh), "initWithReason:", 8LL);
  -[MSDDataRefresh performRefreshWithCompletion:](v3, "performRefreshWithCompletion:", &stru_100062380);
  v2[2](v2, 1LL);
}

void sub_10002D630(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002E008();
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully synched data with CloudKit",  v10,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 allKeys]);

    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ms_objectsPassingTest:](v6, "ms_objectsPassingTest:", &stru_1000623C0));
    [v9 enumerateObjectsUsingBlock:&stru_100062400];
  }
}

BOOL sub_10002D728(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  return -[NSString rangeOfString:](a2, "rangeOfString:", @"CKShareErrorRetryCount", a4) != (id)0x7FFFFFFFFFFFFFFFLL;
}

void sub_10002D754(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v5 setObject:&off_100064418 forDefault:v4];
}

void sub_10002D7D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D840()
{
}

void sub_10002D8A0()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10000D560( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Error creating service config block %{private}@, Error is Fatal %@",  v2);
  sub_1000053CC();
}

void sub_10002D938()
{
}

void sub_10002D998()
{
}

void sub_10002D9F8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneName]);
  sub_10000D554();
  __int16 v8 = 2113;
  uint64_t v9 = a2;
  sub_10000D560( (void *)&_mh_execute_header,  a3,  v6,  "Failed to Zombie delete record zoneID %{private}@, error %{private}@",  v7);

  sub_100024E90();
}

void sub_10002DA90()
{
  v2[0] = 136315395;
  sub_10002D7BC();
  sub_10000D560((void *)&_mh_execute_header, v0, v1, "%s Fatal error ... %{private}@", (uint8_t *)v2);
  sub_1000053CC();
}

void sub_10002DB00()
{
  v2[0] = 136315395;
  sub_10002D7BC();
  sub_10000D560((void *)&_mh_execute_header, v0, v1, "%s Fatal error ... %{private}@", (uint8_t *)v2);
  sub_1000053CC();
}

void sub_10002DB70( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DBA4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  refreshed = MSDDataRefreshReasonToString(*(void *)(*(void *)(a1 + 32) + 8LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
  sub_10000D554();
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  sub_10000D560((void *)&_mh_execute_header, a3, v7, "Error refreshing data after %@, %@", v8);

  sub_100024E90();
}

void sub_10002DC40()
{
}

void sub_10002DCA0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DD14( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DD84()
{
}

void sub_10002DDE4()
{
}

void sub_10002DE44()
{
  v2[0] = 136315395;
  sub_10002D7BC();
  sub_10000D560((void *)&_mh_execute_header, v0, v1, "%s Fatal error ...%{private}@ ", (uint8_t *)v2);
  sub_1000053CC();
}

void sub_10002DEB4()
{
}

void sub_10002DF14()
{
}

void sub_10002DF74()
{
}

void sub_10002DFD4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E008()
{
}

void sub_10002E998( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10002E9D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002E9E4(uint64_t a1)
{
}

void sub_10002E9EC(uint64_t a1, void *a2)
{
  if (a2)
  {
    NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
    uint64_t v13 = a2;
    id v4 = a2;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mediasetup.migration",  1LL,  v5));
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  else
  {
    id v9 = 0LL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
    [v10 updatePrimaryUserOnDevice:v11];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10002EB68( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EBD0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to update primary user, Nil Accessory",  v1,  2u);
}

void sub_10002EC10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EEA4(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1000707E0;
  qword_1000707E0 = (uint64_t)v1;
}

void sub_10002F018( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10002F044(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = sub_10003E9DC();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5 || (a2 & 1) == 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      double v29 = *(double *)&v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to add subscription to database %@",  buf,  0xCu);
    }

    if ([v5 CKErrorHasErrorCode:15])
    {
      id v10 = sub_10003E9DC();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000303D0();
      }

      WeakRetained[1] = 3LL;
    }

    else if (([v5 CKErrorHasErrorCode:6] & 1) != 0 {
           || [v5 CKErrorHasErrorCode:7])
    }
    {
      NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:CKErrorRetryAfterKey]);
      [v13 doubleValue];
      double v15 = v14;

      id v16 = sub_10003E9DC();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v29 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "CloudKit asked us to re-try after %f",  buf,  0xCu);
      }

      unint64_t v18 = WeakRetained[1] + 1LL;
      WeakRetained[1] = v18;
      if (v18 <= 2)
      {
        double v19 = v15 + 1.0;
        id v20 = sub_10003E9DC();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Retrying...add subscription to database",  buf,  2u);
        }

        dispatch_time_t v22 = dispatch_time(0LL, (uint64_t)(v19 * 1000000000.0));
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        int v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_10002F358;
        v25[3] = &unk_100062438;
        objc_copyWeak(&v26, (id *)(a1 + 32));
        objc_copyWeak(&v27, (id *)(a1 + 40));
        dispatch_after(v22, v24, v25);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&v26);
      }
    }
  }

  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully added database subscription",  buf,  2u);
    }
  }
}

void sub_10002F358(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addSubscriptionForDatabase:v2];
}

void sub_10002F4BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    goto LABEL_12;
  }

  if (![v5 accountStatus])
  {
    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    goto LABEL_12;
  }

  if ([v5 accountStatus] == (id)1 && objc_msgSend(v5, "supportsDeviceToDeviceEncryption"))
  {
    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
LABEL_12:
    v8();
    goto LABEL_13;
  }

  id v9 = sub_10003E9DC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = CKStringFromAccountStatus([v5 accountStatus]);
    NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412290;
    id v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Current account state %@",  (uint8_t *)&v15,  0xCu);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  6LL,  0LL));
  (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0LL, v14);

LABEL_13:
}

void sub_10002F8D4(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_10003E9DC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003050C();
    }
  }
}

void sub_10002F928(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_10003E9DC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100030570();
    }
  }
}

void sub_10002FA28(_Unwind_Exception *a1)
{
}

void sub_10002FA4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = sub_10003E9DC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003062C();
      }

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      void v34[2] = sub_10002FD40;
      v34[3] = &unk_100060E40;
      v34[4] = WeakRetained;
      NSErrorUserInfoKey v12 = (void ***)v34;
    }

    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [v5 supportsDeviceToDeviceEncryption];
        uint64_t v16 = CKStringFromAccountStatus([v5 accountStatus]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138412802;
        id v36 = v5;
        __int16 v37 = 1024;
        unsigned int v38 = v15;
        __int16 v39 = 2112;
        uint64_t v40 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetched accountInfo %@ : Status of encryption: %d AccountStatus: %@",  buf,  0x1Cu);
      }

      id v18 = [v5 accountStatus];
      if (v18 == (id)3)
      {
        [WeakRetained _handleAccountStatusUnsupported];
      }

      else if (v18 == (id)1)
      {
        if ([v5 supportsDeviceToDeviceEncryption])
        {
          double v19 = (dispatch_queue_s *)WeakRetained[4];
          block = _NSConcreteStackBlock;
          uint64_t v29 = 3221225472LL;
          uint64_t v30 = sub_10002FD4C;
          id v31 = &unk_1000624F0;
          objc_copyWeak(&v33, v7);
          id v32 = v5;
          dispatch_async(v19, &block);

          objc_destroyWeak(&v33);
        }

        else
        {
          id v20 = sub_10003E9DC();
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_100030600();
          }

          dispatch_time_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
          [v22 setObject:&__kCFBooleanFalse forDefault:@"CKAccountSupportsManatee"];

          [WeakRetained setAccountInfo:0];
        }
      }

      uint64_t v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472LL;
      __int128 v25 = sub_10002FD88;
      id v26 = &unk_100060E40;
      id v27 = WeakRetained;
      NSErrorUserInfoKey v12 = &v23;
    }

    objc_msgSend(WeakRetained, "_withAccountCheckLock:", v12, v23, v24, v25, v26, v27, block, v29, v30, v31);
  }

  else
  {
    id v13 = sub_10003E9DC();
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000305D4();
    }
  }
}

uint64_t sub_10002FD40(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 16LL) = 0;
  return result;
}

void sub_10002FD4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDeviceSupportsEncryption:*(void *)(a1 + 32)];
}

uint64_t sub_10002FD88(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 16LL) = 0;
  return result;
}

void sub_10002FF90(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000306BC();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully refreshed data after CKAccountInfo changed",  v7,  2u);
  }
}

void sub_100030154(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = 0LL;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000LL;
    char v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100030250;
    v7[3] = &unk_100062560;
    v7[4] = WeakRetained;
    void v7[5] = &v8;
    [WeakRetained _withAccountCheckLock:v7];
    if (*((_BYTE *)v9 + 24))
    {
      id v4 = objc_loadWeakRetained(v1);
      [v4 _checkAccountStatus];
    }

    _Block_object_dispose(&v8, 8);
  }

  else
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000305D4();
    }
  }
}

void sub_100030238( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100030250(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

void sub_10003031C(void *a1, os_log_s *a2)
{
  uint64_t v3 = CKDatabaseScopeString([a1 databaseScope]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000D554();
  sub_10001D3A0((void *)&_mh_execute_header, a2, v5, "Error adding subscription, unsupported database %@", v6);

  sub_100030310();
}

void sub_1000303A4()
{
}

void sub_1000303D0()
{
}

void sub_100030434(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 userInfo]);
  sub_10000D554();
  sub_10001D3A0((void *)&_mh_execute_header, a2, v4, "Failed to create CkNotification from APSIncomingMessage %@", v5);

  sub_100030310();
}

void sub_1000304B4()
{
}

void sub_1000304E0()
{
}

void sub_10003050C()
{
}

void sub_100030570()
{
}

void sub_1000305D4()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000076EC();
}

void sub_100030600()
{
}

void sub_10003062C()
{
}

void sub_100030690()
{
}

void sub_1000306BC()
{
}

void sub_100030864(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1000707F0;
  qword_1000707F0 = (uint64_t)v1;
}

void sub_100030994(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)WeakRetained[1];
    if (v4)
    {
      [v4 shutdown];
      uint64_t v5 = (void *)v3[1];
      v3[1] = 0LL;
    }

    uint8_t v6 = *(void **)(a1 + 32);
    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _determinePushEnvironment]);
    }
    uint64_t v17 = v7;
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v18, "addObject:", kAPSTopic);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    double v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "consumers", 0));
    id v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          if ([v24 shouldEnablePushTopic])
          {
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 pushTopic]);
            -[NSMutableArray addObject:](v18, "addObject:", v25);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v21);
    }

    id v26 = sub_10003E9DC();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v41 = v17;
      __int16 v42 = 2112;
      id v43 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Starting APS connection env - %@, topics %@",  buf,  0x16u);
    }

    id v28 = objc_alloc(&OBJC_CLASS___APSConnection);
    uint64_t v29 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v28,  "initWithEnvironmentName:namedDelegatePort:queue:",  v17,  kAPSDelegatePort,  v3[3]);
    -[APSConnection _setEnabledTopics:](v29, "_setEnabledTopics:", v18);
    -[APSConnection setDelegate:](v29, "setDelegate:", *(void *)(a1 + 40));
    id v30 = sub_10003E9DC();
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v32 = -[APSConnection isConnected](v29, "isConnected");
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "ApplePushService Connection Status %d",  buf,  8u);
    }

    id v33 = (void *)v3[1];
    v3[1] = v29;
    id v34 = v29;

    id v35 = (void *)v3[2];
    v3[2] = v17;
    id v9 = v17;
  }

  else
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003114C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void sub_10003114C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000311C0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031434(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to create os_transaction, Nil transactionID passed",  v1,  2u);
}

void sub_100031FBC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10003E9DC();
    uint8_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003223C((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100032024( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032094(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to get publicInfo after re-try",  v1,  2u);
}

void sub_1000320D4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordType]);
  int v4 = 138477827;
  id v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unrecognized record type %{private}@",  (uint8_t *)&v4,  0xCu);
}

void sub_100032168( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000321CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003223C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032314(uint64_t a1, uint64_t a2)
{
  id v9 = (id)objc_opt_new(&OBJC_CLASS___CKContainerOptions, a2);
  [v9 setUseZoneWidePCS:1];
  id v3 = objc_alloc(&OBJC_CLASS___CKContainerID);
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) MSDCloudKitContainerID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 initWithContainerIdentifier:v5 environment:1];

  uint64_t v7 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v6,  v9);
  uint64_t v8 = (void *)qword_100070800;
  qword_100070800 = (uint64_t)v7;
}

void sub_100032440(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___CKContainerID);
  id v3 = [(id)objc_opt_class(*(void *)(a1 + 32)) MSDPublicCloudKitContainerID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v7 = [v2 initWithContainerIdentifier:v4 environment:1];

  id v5 = -[CKContainer initWithContainerID:](objc_alloc(&OBJC_CLASS___CKContainer), "initWithContainerID:", v7);
  id v6 = (void *)qword_100070810;
  qword_100070810 = (uint64_t)v5;
}

void sub_1000326E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_10003E9DC();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100032B9C((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v8, v9);
  }
}

void sub_100032A54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_10003E9DC();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100032C44((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v8, v9);
  }
}

void sub_100032AF4(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10003E9DC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138477827;
    id v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "fetchShareMetadataCompletionBlock, any errors %{private}@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_100032B9C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032C04(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Nil share URL", v1, 2u);
}

void sub_100032C44( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032D20(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100070820;
  qword_100070820 = (uint64_t)v1;
}

uint64_t sub_100032EE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100032F9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100035D20();
    }
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) _getMatchingObjectForServiceName:v5 serviceName:*(void *)(a1 + 32)]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

void sub_1000330EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100035D20();
    }
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) _getMatchingObjectForServiceID:v5 serviceID:*(void *)(a1 + 32)]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

void sub_10003323C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100035D20();
    }
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _getMatchingObjectForBundleID:v5 bundleID:*(void *)(a1 + 32)]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

void sub_100033EC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id location, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, char a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

void sub_100033F7C(uint64_t a1)
{
  id v2 = *(_BYTE **)(a1 + 32);
  if (v2[24])
  {
    if (*(void *)(a1 + 40))
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue([v2 queuedPendingRequests]);
      id v3 = objc_retainBlock(*(id *)(a1 + 40));
      [v4 addObject:v3];
    }
  }

  else
  {
    uint8_t v2[24] = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

uint64_t sub_100034004(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100034014(uint64_t a1)
{
}

void sub_10003401C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138477827;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Public] Deleted RecordID %{private}@",  (uint8_t *)&v6,  0xCu);
  }

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "na_safeAddObject:", v3);
}

void sub_1000340E4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_10003E9DC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100035E5C();
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138477827;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[Public] Adding record - %{private}@",  (uint8_t *)&v13,  0xCu);
    }

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "na_safeAddObject:", v8);
  }
}

void sub_10003420C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v5 = sub_10003E9DC();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished sync with public db", buf, 2u);
    }

    id v7 = *(void **)(a1 + 32);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000346EC;
    v43[3] = &unk_1000626B8;
    uint64_t v8 = *(void *)(a1 + 48);
    v43[5] = v7;
    v43[6] = v8;
    v43[4] = WeakRetained;
    [v7 _withLock:v43];
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    if (!v9) {
      id v9 = v3;
    }
    id v10 = v9;
    uint64_t v11 = v10;
    if (!v10)
    {
      id v14 = sub_10003E9DC();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[Public] Returning information stored in defaults",  buf,  2u);
      }

      WeakRetained[4] = 0LL;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForDefaultWithCustomClass:@"publicDBData"]);

      uint64_t v18 = *(void *)(a1 + 40);
      if (v18) {
        (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v17, 0LL);
      }
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      id v20 = WeakRetained;
      id v21 = v17;
      uint64_t v22 = 0LL;
      goto LABEL_24;
    }

    if (CKErrorIsCode(v10, 21LL))
    {
      id v12 = sub_10003E9DC();
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[Public] Change token expired clearing cached data and fetching data again",  buf,  2u);
      }

      [WeakRetained _clearAllDefaultsData];
      [WeakRetained syncDataWithCloudKit:&stru_1000626F8];
      goto LABEL_21;
    }

    if ((CKErrorIsCode(v11, 26LL) & 1) != 0 || CKErrorIsCode(v11, 28LL))
    {
      id v23 = sub_10003E9DC();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        double v45 = *(double *)&v11;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[Public] Received cloud zone deletion error: %{private}@",  buf,  0xCu);
      }

      [WeakRetained _clearAllDefaultsData];
      goto LABEL_21;
    }

    if ((CKErrorIsCode(v11, 6LL) & 1) != 0 || CKErrorIsCode(v11, 7LL))
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:CKErrorRetryAfterKey]);
      [v28 doubleValue];
      double v30 = v29;

      id v31 = sub_10003E9DC();
      unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v45 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Received rate limited error by the server, re-trying after %f",  buf,  0xCu);
      }

      if (WeakRetained[4] < 2uLL)
      {
        dispatch_time_t v33 = dispatch_time(0LL, (uint64_t)(v30 * 1000000000.0));
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        id v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_1000347B0;
        v42[3] = &unk_100060E40;
        void v42[4] = WeakRetained;
        dispatch_after(v33, v35, v42);

LABEL_21:
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForDefaultWithCustomClass:@"publicDBData"]);

        uint64_t v26 = *(void *)(a1 + 40);
        if (v26) {
          (*(void (**)(uint64_t, void *, void *))(v26 + 16))(v26, v17, v11);
        }
        uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
        id v20 = WeakRetained;
        id v21 = v17;
        uint64_t v22 = v11;
LABEL_24:
        [v20 executePendingRequests:v19 forPublicDBInfo:v21 error:v22];

        goto LABEL_25;
      }

      id v36 = sub_10003E9DC();
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int128 v38 = "Retry failed, skipping publicDb Update";
        __int128 v39 = v37;
        uint32_t v40 = 2;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
      }
    }

    else
    {
      id v41 = sub_10003E9DC();
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        double v45 = *(double *)&v11;
        __int128 v38 = "[Public] Some other error occurred %{private}@";
        __int128 v39 = v37;
        uint32_t v40 = 12;
        goto LABEL_36;
      }
    }

    goto LABEL_21;
  }

void sub_1000346EC(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 0;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) queuedPendingRequests]);
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) queuedPendingRequests]);
  [v6 removeAllObjects];
}

void sub_10003475C(id a1, NSArray *a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100035EC8();
    }
  }
}

id sub_1000347B0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100034814;
  v3[3] = &unk_100061A78;
  v3[4] = v1;
  return [v1 syncDataWithCloudKit:v3];
}

void sub_100034814(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(void *)(*(void *)(a1 + 32) + 32LL) = 0LL;
  if (v4)
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100035F28();
    }
  }
}

void sub_100034874(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  id v12 = sub_10003E9DC();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    *(_DWORD *)buf = 138478083;
    id v35 = v10;
    __int16 v36 = 2113;
    __int128 v37 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[Public] Fetched all changes, ChangeToken: %{private}@, RecordZoneName: %{private}@",  buf,  0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a6);
  if (v11)
  {
    id v15 = sub_10003E9DC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100035FE8();
    }

    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0LL;

    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0LL;
  }

  else if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] {
         || [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  }
  {
    id v21 = *(void **)(a1 + 32);
    id v22 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
    id v23 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
    id v33 = 0LL;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 _handleRecordsChanged:v22 deletedRecordIDS:v23 error:&v33]);
    id v25 = v33;

    if (v25 || ![v24 count])
    {
      id v26 = sub_10003E9DC();
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100035F88();
      }
    }

    else
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      [v28 setObjectWithCustomClass:v24 forDefault:@"publicDBData"];

      double v29 = *(void **)(a1 + 32);
      double v30 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
      [v29 _updateDefaultsWithChangeToken:v30 serverChangeToken:v10];

      notify_post((const char *)[kMediaSetupServicesChanged UTF8String]);
      [*(id *)(a1 + 32) _updateLastRefreshTS];
    }
  }

  else
  {
    id v31 = sub_10003E9DC();
    unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "PublicDB records didn't change since last check",  buf,  2u);
    }

    [*(id *)(a1 + 32) _updateLastRefreshTS];
  }
}

NSCopying *__cdecl sub_100034F50(id a1, MSPublicDBInfo *a2)
{
  return (NSCopying *)-[MSPublicDBInfo recordName](a2, "recordName");
}

id sub_100035298(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_1000357C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003607C();
    }
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v7);
  }
}

id sub_1000358D8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceID]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_10003599C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 bundleIDS]);
  id v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

id sub_100035A60(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceName]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100035B68(uint64_t a1)
{
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8LL * (void)v5) + 16LL))(*(void *)(*((void *)&v6 + 1) + 8LL * (void)v5));
        id v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }

    while (v3);
  }
}

void sub_100035D00(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100035D0C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100035D20()
{
}

void sub_100035D80()
{
}

void sub_100035DEC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100035D00((void *)&_mh_execute_header, a1, a3, "[Public] Failed to fetch PublicDB Info, Nil RecordZoneID", v3);
}

void sub_100035E24(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100035D00( (void *)&_mh_execute_header,  a1,  a3,  "Failed to fetch PublicDb Info, Nil FetchRecordZoneChangesConfiguration obj",  v3);
}

void sub_100035E5C()
{
}

void sub_100035EC8()
{
}

void sub_100035F28()
{
}

void sub_100035F88()
{
}

void sub_100035FE8()
{
}

void sub_100036048(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100035D00((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to create PublicDB object", a1);
}

void sub_10003607C()
{
}

void sub_1000363C4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v22 = 138412290;
    id v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] Fetched changes for Database",  (uint8_t *)&v22,  0xCu);
  }

  if (v7)
  {
    id v12 = sub_10003E9DC();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003DCFC(a1, (uint64_t)v7, v13);
    }

    uint64_t v14 = *(void *)(a1 + 64);
    if (v14) {
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v7);
    }
  }

  else
  {
    if (v6)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _handleRecordZonesChanged:*(void *)(a1 + 40) deletedRecordZones:*(void *)(a1 + 48)]);
      id v16 = sub_10003E9DC();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10003DC74((id *)(a1 + 32), v18);
        }
      }

      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          int v22 = 138412290;
          id v23 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%@] Updating ServerChangeToken for DatabaseOperation",  (uint8_t *)&v22,  0xCu);
        }

        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
        -[os_log_s setObjectWithCustomClass:forDefault:]( v18,  "setObjectWithCustomClass:forDefault:",  v6,  *(void *)(a1 + 56));
        id v15 = 0LL;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    uint64_t v21 = *(void *)(a1 + 64);
    if (v21) {
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v15);
    }
  }
}

id sub_1000365E0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", a2);
}

id sub_1000365EC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", a2);
}

void sub_100036928( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_100036964(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    id v17 = sub_10003E9DC();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fetched RecordZones %@", buf, 0xCu);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v21 = [v20 copy];

    id v23 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v22);
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    v82 = sub_1000372A8;
    v83 = sub_1000372B8;
    id v84 = 0LL;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_1000372C0;
    v68[3] = &unk_100062880;
    v68[4] = WeakRetained;
    v72 = buf;
    id v69 = *(id *)(a1 + 48);
    id v70 = *(id *)(a1 + 40);
    id v24 = v23;
    id v71 = v24;
    int v13 = (CKRecordZone *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ms_objectsPassingTest:", v68));

    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      uint64_t v25 = *(void *)(a1 + 72);
      if (v25) {
        (*(void (**)(uint64_t, void))(v25 + 16))(v25, 0LL);
      }
      goto LABEL_44;
    }

    id v26 = sub_10003E9DC();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v77 = 138477827;
      v78 = v13;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Filtered zoneResult %{private}@", v77, 0xCu);
    }

    id v28 = (CKRecordZone *)objc_claimAutoreleasedReturnValue(-[CKRecordZone firstObject](v13, "firstObject"));
    if ([WeakRetained databaseScope] == (id)2
      && (unint64_t)-[CKRecordZone count](v13, "count") >= 2)
    {
      id v29 = sub_10003E9DC();
      double v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "There are duplicate recordZones found with the same account, selecting the one created first",  v77,  2u);
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue([v24 allKeys]);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v31 sortedArrayUsingSelector:"compare:"]);

      id v32 = sub_10003E9DC();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        log = v33;
        __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v58 firstObject]);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v57]);
        __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v56 zoneID]);
        id v34 = (CKRecordZone *)(id)objc_claimAutoreleasedReturnValue([v55 zoneName]);
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v58 firstObject]);
        *(_DWORD *)v77 = 138478083;
        v78 = v34;
        __int16 v79 = 2112;
        v80 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "First zone was created at: %{private}@ created at %@",  v77,  0x16u);

        id v33 = log;
      }

      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v58 firstObject]);
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v24 objectForKey:v36]);

      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v58 firstObject]);
      [v24 removeObjectForKey:v38];

      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_100037534;
      v66[3] = &unk_1000628C8;
      v66[4] = WeakRetained;
      id v67 = *(id *)(a1 + 56);
      [v24 enumerateKeysAndObjectsUsingBlock:v66];

      id v28 = (CKRecordZone *)v37;
    }

    if (v28)
    {
      id v39 = sub_10003E9DC();
      uint32_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v77 = 138477827;
        v78 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched record zone %{private}@",  v77,  0xCu);
      }

      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](v28, "zoneID"));
      [WeakRetained _updateUserInfoToRecordZoneIDMap:v41 userID:*(void *)(a1 + 40)];

      uint64_t v42 = *(void *)(a1 + 72);
      if (v42) {
        (*(void (**)(uint64_t, CKRecordZone *, void))(v42 + 16))(v42, v28, 0LL);
      }
      goto LABEL_43;
    }

    if ([WeakRetained databaseScope] == (id)2)
    {
      if ([*(id *)(a1 + 56) createNewZoneIfMissing])
      {
        id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        id v44 = (NSError *)objc_claimAutoreleasedReturnValue([v43 UUIDString]);

        __int16 v59 = -[CKRecordZone initWithZoneName:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneName:", v44);
        id v45 = sub_10003E9DC();
        __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v77 = 138477827;
          v78 = v59;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Saving Record Zone  %{private}@",  v77,  0xCu);
        }

        uint64_t v47 = *(void *)(a1 + 56);
        uint64_t v48 = *(void *)(a1 + 64);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472LL;
        v60[2] = sub_1000375DC;
        v60[3] = &unk_100061200;
        id v65 = *(id *)(a1 + 72);
        id v61 = *(id *)(a1 + 48);
        id v62 = *(id *)(a1 + 40);
        id v63 = WeakRetained;
        id v49 = v59;
        v64 = v49;
        [WeakRetained _saveRecordZone:v49 withAttribution:v48 andOptions:v47 completion:v60];
      }

      else
      {
        uint64_t v53 = *(void *)(a1 + 72);
        if (!v53)
        {
LABEL_43:

LABEL_44:
          _Block_object_dispose(buf, 8);

LABEL_45:
          goto LABEL_46;
        }

        uint64_t v75 = MSUserInfoErrorStringKey;
        v76 = @"No matching zone found and did not create a new one";
        id v44 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
        id v49 = (CKRecordZone *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  3LL,  v44));
        (*(void (**)(uint64_t, void, CKRecordZone *))(v53 + 16))(v53, 0LL, v49);
      }
    }

    else
    {
      id v50 = sub_10003E9DC();
      id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Zone is missing, but we dont have enough permissions to create",  v77,  2u);
      }

      uint64_t v52 = *(void *)(a1 + 72);
      if (!v52) {
        goto LABEL_43;
      }
      id v44 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL);
      (*(void (**)(uint64_t, void, NSError *))(v52 + 16))(v52, 0LL, v44);
    }

    goto LABEL_43;
  }

  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10003DD84((uint64_t)v6, v8, v9);
  }

  uint64_t v10 = *(void *)(a1 + 72);
  if (v10) {
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0LL, v6);
  }
  if ([v6 CKErrorHasErrorCode:112] && CKErrorIsCode(v6, 2))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:CKPartialErrorsByItemIDKey]);

    int v13 = (CKRecordZone *)objc_claimAutoreleasedReturnValue([WeakRetained allKeys]);
    id v14 = sub_10003E9DC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CKDatabase(MSDCloudDatabase) fetchRecordZoneFor:user:withOptions:withAttribution:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Zones with ManateeIdentity Lost %@",  buf,  0x16u);
    }

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_100037298;
    v73[3] = &unk_100061228;
    id v16 = *(void **)(a1 + 40);
    v73[4] = *(void *)(a1 + 32);
    id v74 = v16;
    -[CKRecordZone enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v73);

    goto LABEL_45;
  }

LABEL_46:
}

void sub_10003724C(_Unwind_Exception *a1)
{
}

id sub_100037298(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCKErrorMissingManateeIdentity:a2 homeUserID:*(void *)(a1 + 40)];
}

uint64_t sub_1000372A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000372B8(uint64_t a1)
{
}

uint64_t sub_1000372C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  unsigned __int8 v6 = [v5 isEqualToString:CKRecordZoneDefaultName];

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id obj = *(id *)(v10 + 40);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 _fetchPlaceholderRecordData:v9 error:&obj]);
    objc_storeStrong((id *)(v10 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
    {
      id v12 = sub_10003E9DC();
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003DE00(a1 + 64, v13, v14, v15, v16, v17, v18, v19);
      }
      uint64_t v7 = 0LL;
    }

    else
    {
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 objectForKey:MSHomeParticipantHomeIdentifier]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:MSHomeParticipantHomeUserIdentifier]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"PlaceholderRecordCreationDate"]);
      id v22 = sub_10003E9DC();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
        *(_DWORD *)buf = 138478083;
        id v29 = v25;
        __int16 v30 = 2113;
        id v31 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Placeholder Record for %{private}@ %{private}@",  buf,  0x16u);
      }

      if (-[os_log_s isEqualToString:](v13, "isEqualToString:", *(void *)(a1 + 40)))
      {
        uint64_t v7 = (uint64_t)[v20 isEqualToString:*(void *)(a1 + 48)];
        if ((_DWORD)v7 && v21)
        {
          objc_msgSend(*(id *)(a1 + 56), "na_safeSetObject:forKey:", v3, v21);
          uint64_t v7 = 1LL;
        }
      }

      else
      {
        uint64_t v7 = 0LL;
      }
    }
  }

  return v7;
}

void sub_100037534(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 zoneID]);
  [v4 deleteRecordZone:v5 withOptions:*(void *)(a1 + 40) completion:&stru_1000628A0];
}

void sub_100037588(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003DE70();
    }
  }
}

void sub_1000375DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003DED0();
    }

    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0LL, v6);
    }
  }

  else
  {
    uint64_t v10 = MSPlaceholderRecordName;
    uint64_t v11 = MSPlaceholderRecordType;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKRecord createRecordWithName:recordType:recordZone:]( &OBJC_CLASS___CKRecord,  "createRecordWithName:recordType:recordZone:",  v10,  v11,  v12));

    [v13 setRecordFieldForKey:MSHomeParticipantHomeIdentifier value:*(void *)(a1 + 32)];
    [v13 setRecordFieldForKey:MSHomeParticipantHomeUserIdentifier value:*(void *)(a1 + 40)];
    id v14 = sub_10003E9DC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138478083;
      uint64_t v25 = v16;
      __int16 v26 = 2113;
      uint64_t v27 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting to save PlaceHolder record with HomeID: %{private}@, HomeUserID : %{private}@",  buf,  0x16u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100037808;
    v19[3] = &unk_100062918;
    uint64_t v18 = *(void **)(a1 + 56);
    id v20 = *(id *)(a1 + 48);
    id v21 = v18;
    id v23 = *(id *)(a1 + 64);
    id v22 = v5;
    [v20 saveRecord:v13 completionHandler:v19];
  }
}

void sub_100037808(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003DF30();
    }

    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneID]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100037988;
    v12[3] = &unk_1000628F0;
    id v14 = *(id *)(a1 + 56);
    id v13 = v4;
    [v8 deleteRecordZone:v9 withOptions:0 completion:v12];
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) zoneID]);
      *(_DWORD *)buf = 138477827;
      uint64_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully saved record to Zone %{private}@",  buf,  0xCu);
    }

    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, void, void))(v11 + 16))(v11, *(void *)(a1 + 48), 0LL);
    }
  }
}

void sub_100037988(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003DF90();
    }
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0LL, *(void *)(a1 + 32));
  }
}

void sub_100037D10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_10003E9DC();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003DFF0();
    }
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v8 != 0LL, v9);
  }
}

void sub_100037F34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue([a2 objectForKey:v5]);
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }

uint64_t sub_10003814C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100038618( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, char a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

void sub_10003867C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_100038F04;
  v68[3] = &unk_100060E90;
  id v69 = *(id *)(a1 + 32);
  id v4 = objc_retainBlock(v68);
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
  if (!v5) {
    uint64_t v5 = v3;
  }
  id v6 = v5;
  id v7 = v6;
  if (!v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "na_filter:", &stru_1000629A8));
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v65;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v65 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(a1 + 40) _checkShareStatusIfApplicable:*(void *)(*((void *)&v64 + 1) + 8 * (void)i)];
        }

        id v12 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }

      while (v12);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "na_filter:", &stru_1000629C8));
    id v16 = [v15 mutableCopy];

    if ((+[MSDeviceInfo isDeviceAudioAccessory](&OBJC_CLASS___MSDeviceInfo, "isDeviceAudioAccessory") & 1) != 0
      || +[MSDeviceInfo isDeviceAppleTV](&OBJC_CLASS___MSDeviceInfo, "isDeviceAppleTV"))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentHome]);

      id v19 = sub_10003E9DC();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = v20;
      if (!v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10003E118();
        }

        ((void (*)(void *, void))v4[2])(v4, 0LL);
        if (!*(void *)(a1 + 72)) {
          goto LABEL_63;
        }
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForDefaultWithCustomClass:*(void *)(a1 + 64)]);

        uint64_t v54 = *(void *)(a1 + 72);
        goto LABEL_61;
      }

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = CKDatabaseScopeString([*(id *)(a1 + 40) databaseScope]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138412547;
        id v71 = v23;
        __int16 v72 = 2113;
        v73 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%@] Device is AppleTV or HomePod, restricting cache update to records in home: %{private}@",  buf,  0x16u);
      }

      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_100039058;
      v62[3] = &unk_1000629F0;
      id v24 = v18;
      id v63 = v24;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "na_filter:", v62));
      id v26 = [v25 mutableCopy];

      if (![v26 count])
      {
        id v27 = sub_10003E9DC();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Device received a database update for a change it is not associated with.",  buf,  2u);
        }
      }

      id v16 = v26;
    }

    if ([v16 count] || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "count"))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) _handleChangedRecords:v16 andDeletedRecordIDS:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)]);
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForDefaultWithCustomClass:*(void *)(a1 + 64)]);

      id v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "na_map:", &stru_100062A10));
      id v32 = sub_10003E9DC();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        id v71 = v61;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Services stored in defaults %{private}@",  buf,  0xCu);
      }

      if (v29 && [v29 count])
      {
        [*(id *)(a1 + 40) _notifyObserversDataChanged:v29 cachedData:v31];
        [*(id *)(a1 + 40) _attemptToRecordServiceRequestLapse:v29 fromRecords:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
        id v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
        [v34 setObjectWithCustomClass:v29 forDefault:*(void *)(a1 + 64)];

        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForDefaultWithCustomClass:*(void *)(a1 + 64)]);

        id v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "na_map:", &stru_100062A30));
        id v37 = sub_10003E9DC();
        __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          id v71 = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Services stored in defaults after update %{private}@",  buf,  0xCu);
        }

        [*(id *)(a1 + 40) _updateServerChangeTokenMap:*(void *)(a1 + 48) serverChangeToken:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
        ((void (*)(void *, uint64_t))v4[2])(v4, 1LL);
        uint64_t v39 = *(void *)(a1 + 72);
        if (v39) {
          (*(void (**)(uint64_t, void *, void))(v39 + 16))(v39, v29, 0LL);
        }
      }

      else
      {
        id v49 = sub_10003E9DC();
        id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          sub_10003E144();
        }

        ((void (*)(void *, void))v4[2])(v4, 0LL);
        uint64_t v51 = *(void *)(a1 + 72);
        if (v51)
        {
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  7LL,  0LL));
          (*(void (**)(uint64_t, void *, void *))(v51 + 16))(v51, v31, v52);
        }
      }

      goto LABEL_62;
    }

    ((void (*)(void *, uint64_t))v4[2])(v4, 1LL);
    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForDefaultWithCustomClass:*(void *)(a1 + 64)]);

    uint64_t v54 = *(void *)(a1 + 72);
    if (!v54)
    {
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }

LABEL_61:
    (*(void (**)(uint64_t, void *, void))(v54 + 16))(v54, v29, 0LL);
    goto LABEL_62;
  }

  if (!CKErrorIsCode(v6, 21LL))
  {
    if ([v7 code] == (id)112)
    {
      id v40 = sub_10003E9DC();
      id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_10003E19C();
      }

      uint64_t v42 = *(void **)(a1 + 40);
      uint64_t v43 = *(void *)(a1 + 48);
      id v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey]);
      [v42 handleCKErrorMissingManateeIdentity:v43 homeUserID:v44];

      goto LABEL_44;
    }

    if (CKErrorIsCode(v7, 26LL))
    {
      id v45 = sub_10003E9DC();
      __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10003E1C8(a1, v46);
      }

      uint64_t v47 = *(void **)(a1 + 40);
      uint64_t v75 = *(void *)(a1 + 48);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
      [v47 _purgeDeletedZonesFromDefaults:v48];

      goto LABEL_44;
    }

    if ((CKErrorIsCode(v7, 3LL) & 1) == 0 && !CKErrorIsCode(v7, 4LL))
    {
      id v58 = sub_10003E9DC();
      __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_10003E24C();
      }

      goto LABEL_44;
    }

    __int16 v55 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForDefaultWithCustomClass:*(void *)(a1 + 64)]);

    uint64_t v56 = *(void *)(a1 + 72);
    if (v56) {
      (*(void (**)(uint64_t, void *, void))(v56 + 16))(v56, v10, 0LL);
    }
    ((void (*)(void *, void))v4[2])(v4, 0LL);
LABEL_64:

    goto LABEL_65;
  }

  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10003E170();
  }

  [*(id *)(a1 + 40) _handleCKErrorChangeTokenExpired:*(void *)(a1 + 48) userInfo:*(void *)(a1 + 56)];
LABEL_44:
  if (*(void *)(a1 + 72))
  {
    ((void (*)(void *, void))v4[2])(v4, 0LL);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }

LABEL_65:
}

id sub_100038F04(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stopwatch]);
  [v4 stop];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stopwatch]);
  [v5 toggleLock:1];

  [*(id *)(a1 + 32) setDidSucceed:a2];
  return +[MSAnalytics sendServiceEvent:](&OBJC_CLASS___MSAnalytics, "sendServiceEvent:", *(void *)(a1 + 32));
}

BOOL sub_100038F78(id a1, CKRecord *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](a2, "recordID"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 recordName]);
  unsigned __int8 v4 = [v3 isEqualToString:CKRecordNameZoneWideShare];

  return v4;
}

BOOL sub_100038FD4(id a1, CKRecord *a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v2, "recordType"));
  if ([v3 isEqualToString:MSServiceAccountRecordType])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v2, "recordType"));
    unsigned __int8 v4 = [v5 isEqualToString:MSDefaultServiceRecordType];
  }

  return v4;
}

id sub_100039058(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = objc_alloc(&OBJC_CLASS___NSUUID);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 recordFieldForKey:MSHomeParticipantHomeUserIdentifier]);

  id v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);
  id v7 = [*(id *)(a1 + 32) userIdentifierBelongsInHome:v6];

  return v7;
}

id sub_1000390E4(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordName](v2, "recordName"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordZoneName](v2, "recordZoneName"));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v3, v4));
  return v5;
}

id sub_100039164(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordName](v2, "recordName"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordZoneName](v2, "recordZoneName"));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v3, v4));
  return v5;
}

void sub_1000391E4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  id v12 = sub_10003E9DC();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138478083;
    id v31 = v9;
    __int16 v32 = 2113;
    id v33 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Fetch Records Completion: recordZoneID %{private}@ serverChangeToken %{private}@",  (uint8_t *)&v30,  0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a6);
  id v14 = sub_10003E9DC();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v30 = 138412802;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Fetched all records for recordZoneID %@, serverChangeToken %@",  (uint8_t *)&v30,  0x20u);
  }

  if (v11)
  {
    id v18 = sub_10003E9DC();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003E2AC();
    }

    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = 0LL;

    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = 0LL;
  }

  else
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v25 = v10;
    id v23 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v25;
  }

  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]
    && ![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    id v26 = sub_10003E9DC();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      int v30 = 138412290;
      id v31 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@ database did not change since last check",  (uint8_t *)&v30,  0xCu);
    }
  }
}

void sub_10003945C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412803;
    id v12 = v10;
    __int16 v13 = 2113;
    id v14 = v5;
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Deleted RecordID %{private}@ and type %{private}@",  (uint8_t *)&v11,  0x20u);
  }

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "na_safeAddObject:", v5);
}

void sub_100039568(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_10003E9DC();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v17 = 138412802;
      id v18 = v16;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[%@] Error fetching record changes for recordID %@, error %@",  (uint8_t *)&v17,  0x20u);
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int v17 = 138412547;
      id v18 = v14;
      __int16 v19 = 2113;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@] Adding recordID %{private}@",  (uint8_t *)&v17,  0x16u);
    }

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "na_safeAddObject:", v8);
  }
}

void sub_10003993C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100039964(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003E30C(a1, (uint64_t)v5, v7);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a3);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id sub_100039EE8(id a1, CKRecordZoneID *a2)
{
  return -[CKRecordZoneID zoneName](a2, "zoneName");
}

id sub_100039EF0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 recordZoneName]);
  id v4 = [v2 containsObject:v3];

  return v4;
}

id sub_100039F34(uint64_t a1, void *a2)
{
  id v3 = a2;
  else {
    id v4 = 0LL;
  }

  return v4;
}

void sub_100039F80(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003A024;
  v9[3] = &unk_100062B88;
  id v7 = v5;
  id v10 = v7;
}

id sub_10003A024(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ownerName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ownerName]);
  if ([v4 isEqualToString:v5])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneName]);
    id v8 = [v6 isEqualToString:v7];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void sub_10003A2D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_10003E9DC();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003E3A4((uint64_t)v9, v11, v12);
    }
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v9);
  }
}

NSCopying *__cdecl sub_10003A70C(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordName](v2, "recordName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordZoneName](v2, "recordZoneName"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v3, v4));
  return (NSCopying *)v5;
}

id sub_10003ACD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  if ([v4 isEqualToString:MSDefaultServiceRecordType])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 recordZoneName]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordZoneName]);
      id v8 = [v6 isEqualToString:v7];
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

id sub_10003AD9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  unsigned __int8 v5 = [v4 isEqualToString:MSDefaultServiceRecordType];

  if ((v5 & 1) != 0)
  {
    id v6 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceID]);
    if ([v8 isEqual:v10])
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v3 homeID]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeID]);
      if ([v11 isEqual:v12])
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homeUserID]);
        if ([v13 isEqual:v14])
        {
          id v18 = v14;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 recordZoneName]);
          __int16 v19 = v13;
          id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordZoneName]);
          id v6 = [v15 isEqualToString:v16];

          uint64_t v13 = v19;
          id v14 = v18;
        }

        else
        {
          id v6 = 0LL;
        }
      }

      else
      {
        id v6 = 0LL;
      }
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

void sub_10003B0E4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue([a2 firstObject]);
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
  }

uint64_t sub_10003B30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 != 0, a4);
  }
  return result;
}

void sub_10003B540(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_10003E9DC();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Encountered error when modifying record %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
}

void sub_10003B7F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10003B81C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003E56C();
    }
  }

  else
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v10 = MSHomeParticipantHomeIdentifier;
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 recordFieldForKey:MSHomeParticipantHomeIdentifier]);
    objc_msgSend(v9, "na_safeSetObject:forKey:", v11, v10);

    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v13 = MSHomeParticipantHomeUserIdentifier;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 recordFieldForKey:MSHomeParticipantHomeUserIdentifier]);
    objc_msgSend(v12, "na_safeSetObject:forKey:", v14, v13);

    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 creationDate]);
    objc_msgSend(v15, "na_safeSetObject:forKey:", v16, @"PlaceholderRecordCreationDate");
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003BB54(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
    -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:](v9, "setPreviousServerChangeToken:", v10);
    objc_msgSend(*(id *)(a1 + 40), "na_safeSetObject:forKey:", v9, *(void *)(a1 + 32));
  }
}

id sub_10003BEF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAllRecordsForRecordZoneID:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48) withOptions:0 completion:0];
}

void sub_10003C0DC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = sub_10003E9DC();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003E6E8();
    }
  }
}

id sub_10003C130(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 recordZoneName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneName]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10003C3D0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10003E9DC();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Did handle Manatee loss on SharedDatabase %@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_10003C5D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003E748(a1, (uint64_t)v4, v7);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] Successfully deleted share after Manatee Loss detected",  (uint8_t *)&v11,  0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);
  }
}

void sub_10003C7E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003E7D0();
    }
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = CKDatabaseScopeString([*(id *)(a1 + 32) databaseScope]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneName]);
      *(_DWORD *)buf = 138412546;
      id v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] Successfully deleted recordZone(%@)",  buf,  0x16u);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 objectForDefaultWithCustomClass:@"privateDatabaseData"]);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10003CAA8;
    v23[3] = &unk_100060D00;
    id v24 = *(id *)(a1 + 40);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s na_filter:](v7, "na_filter:", v23));
    if ([v12 count])
    {
      uint64_t v13 = objc_alloc(&OBJC_CLASS___CKRecordZone);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
      id v16 = -[CKRecordZone initWithZoneName:](v13, "initWithZoneName:", v15);

      int v17 = *(void **)(a1 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10003CB08;
      v20[3] = &unk_100062CA8;
      void v20[4] = v17;
      id v21 = v12;
      id v22 = *(id *)(a1 + 40);
      [v17 _saveRecordZone:v16 withAttribution:0 andOptions:0 completion:v20];
    }

    else
    {
      id v18 = sub_10003E9DC();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneName]);
        *(_DWORD *)buf = 138412290;
        id v26 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No cached Info associated with Zone %@",  buf,  0xCu);
      }
    }
  }
}

id sub_10003CAA8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 recordZoneName]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneName]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10003CB08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003E9DC();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully saved new zone %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _populateRecordZoneWithCachedInfo:v5 cachedInfo:*(void *)(a1 + 40)];
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003E830();
    }
  }

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  [v10 _purgeDeletedZonesFromDefaults:v11];
}

BOOL sub_10003D278(id a1, MSDDefaultsInfo *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordType](a2, "recordType"));
  unsigned __int8 v3 = [v2 isEqualToString:MSServiceAccountRecordType];

  return v3;
}

void sub_10003D2BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = sub_10003E9DC();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003E8BC();
    }
  }

  id v12 = [v7 count];
  if (v12 == [*(id *)(a1 + 32) count])
  {
    id v13 = sub_10003E9DC();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Successfully saved records after manatee loss",  v15,  2u);
    }
  }
}

BOOL sub_10003D5DC(id a1, CKShareParticipant *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = (id)-[CKShareParticipant role](v2, "role") != (id)1
    && -[CKShareParticipant invitationTokenStatus](v2, "invitationTokenStatus") == (id)3;

  return v3;
}

void sub_10003D628(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003E91C();
    }
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___CKShare);
    id v8 = *(id *)(a1 + 32);
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }
    id v10 = v9;

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentHome]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSDHomeCloudShareCreate cloudShareForHome:]( &OBJC_CLASS___MSDHomeCloudShareCreate,  "cloudShareForHome:",  v12));

    [v13 shareRecordWithOwner:v10 completion:&stru_100062D98];
  }
}

void sub_10003D72C(id a1, HMHomeCloudShareResponse *a2, NSError *a3)
{
  BOOL v3 = a3;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003E97C();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully established share after manatee loss",  v7,  2u);
  }
}

id sub_10003DBA8(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a2 service]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

BOOL sub_10003DC10(id a1, CKRecord *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](a2, "recordFieldForKey:", MediaServiceIdentifier));
  BOOL v3 = v2 != 0LL;

  return v3;
}

  ;
}

id sub_10003DC68(uint64_t a1)
{
  return [*(id *)(a1 + 32) databaseScope];
}

void sub_10003DC74(id *a1, os_log_s *a2)
{
  uint64_t v3 = CKDatabaseScopeString([*a1 databaseScope]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000D554();
  sub_10001D3A0( (void *)&_mh_execute_header,  a2,  v5,  "[%@] Error fetching recordZone changes, skipping server token update",  v6);

  sub_100030310();
}

void sub_10003DCFC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v4 = sub_10003DC68(a1);
  uint64_t v5 = CKDatabaseScopeString(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10003DC50();
  sub_10000D560( (void *)&_mh_execute_header,  a3,  v7,  "[%@] Encountered error when fetching changes for database %@, skipping cachedData update",  v8);

  sub_100024E90();
}

void sub_10003DD84(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315394;
  id v4 = "-[CKDatabase(MSDCloudDatabase) fetchRecordZoneFor:user:withOptions:withAttribution:completion:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  sub_10000D560((void *)&_mh_execute_header, a2, a3, "%s Error fetching record zones, %@", (uint8_t *)&v3);
  sub_1000053CC();
}

void sub_10003DE00( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003DE70()
{
}

void sub_10003DED0()
{
}

void sub_10003DF30()
{
}

void sub_10003DF90()
{
}

void sub_10003DFF0()
{
}

void sub_10003E050()
{
}

void sub_10003E07C()
{
}

void sub_10003E0A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E118()
{
  sub_1000076DC( (void *)&_mh_execute_header,  v0,  v1,  "Failed to find the home the accessory is in. Skipping handling updates and returning what's in the cache",  v2,  v3,  v4,  v5,  v6);
  sub_1000076EC();
}

void sub_10003E144()
{
}

void sub_10003E170()
{
}

void sub_10003E19C()
{
}

void sub_10003E1C8(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) zoneName]);
  sub_10000D554();
  sub_10001D3A0( (void *)&_mh_execute_header,  a2,  v4,  "Encountered RecordZoneNotFound Error, purging local cached copy (recordZoneName : %{private}@)",  v5);

  sub_100030310();
}

void sub_10003E24C()
{
}

void sub_10003E2AC()
{
}

void sub_10003E30C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[CKDatabase(MSDCloudDatabase) _handleRecordZonesChanged:deletedRecordZones:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s Error updating records for recordZoneID %@, %@",  (uint8_t *)&v4,  0x20u);
}

void sub_10003E3A4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315395;
  int v4 = "-[CKDatabase(MSDCloudDatabase) _saveRecordZone:withAttribution:andOptions:completion:]_block_invoke";
  __int16 v5 = 2113;
  uint64_t v6 = a1;
  sub_10000D560((void *)&_mh_execute_header, a2, a3, "%s Failed to save recordZone, %{private}@", (uint8_t *)&v3);
  sub_1000053CC();
}

void sub_10003E420(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 recordID]);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  *(_DWORD *)a1 = 138477827;
  *a3 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "Failed to create MediaService object from record %{private}@",  a1,  0xCu);
}

void sub_10003E4AC(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to create MSDDefaultsInfo object",  buf,  2u);
}

void sub_10003E4E8()
{
}

void sub_10003E514()
{
}

void sub_10003E540()
{
}

void sub_10003E56C()
{
}

void sub_10003E5CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E63C()
{
}

void sub_10003E668(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 zoneName]);
  sub_10000D554();
  sub_10001D3A0((void *)&_mh_execute_header, a2, v4, "No cached Info associated with Zone %@", v5);

  sub_100030310();
}

void sub_10003E6E8()
{
}

void sub_10003E748(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v4 = sub_10003DC68(a1);
  uint64_t v5 = CKDatabaseScopeString(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10003DC50();
  sub_10000D560((void *)&_mh_execute_header, a3, v7, "[%@] Error deleting Manatee share, %@", v8);

  sub_100024E90();
}

void sub_10003E7D0()
{
}

void sub_10003E830()
{
}

void sub_10003E890()
{
}

void sub_10003E8BC()
{
}

void sub_10003E91C()
{
}

void sub_10003E97C()
{
}

id sub_10003E9DC()
{
  if (qword_100070838 != -1) {
    dispatch_once(&qword_100070838, &stru_100062E00);
  }
  return (id)qword_100070830;
}

void sub_10003EA1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mediasetupd", "log");
  uint64_t v2 = (void *)qword_100070830;
  qword_100070830 = (uint64_t)v1;
}

void sub_10003EA8C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("Logging Queue", 0LL);
  uint64_t v2 = (void *)qword_100070848;
  qword_100070848 = (uint64_t)v1;
}

void sub_10003EC0C(id a1, NSString *a2, NSDictionary *a3)
{
}

void sub_10003ECBC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  else {
    double v4 = 3600.0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003EDCC;
  v8[3] = &unk_100062E88;
  objc_copyWeak(&v9, v2);
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  v8,  v4));
  id v6 = WeakRetained[2];
  WeakRetained[2] = (id)v5;

  [WeakRetained[1] timeIntervalSinceNow];
  objc_destroyWeak(&v9);
}

void sub_10003EDB4(_Unwind_Exception *a1)
{
}

void sub_10003EDCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fileMetrics];
}

void sub_10003EEAC(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

void sub_10003F230(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);
  [v8 doubleValue];
  double v10 = v9;
  int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v7]);
  double v12 = v10 * (double)(unint64_t)[v11 unsignedIntegerValue];

  [v6 doubleValue];
  double v14 = v13;

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v7]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v15 unsignedIntegerValue] + 1));
  [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v7];

  int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v7]);
  double v18 = (v12 + v14) / (double)(unint64_t)[v17 unsignedIntegerValue];

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
  [*(id *)(a1 + 56) setObject:v19 forKeyedSubscript:v7];
}

void sub_10003F378(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);
  double v9 = (char *)[v8 unsignedIntegerValue];

  id v10 = [v6 unsignedIntegerValue];
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  &v9[(void)v10]));
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];
}

void sub_10003F424(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v7]);

  if (v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_10003F50C(uint64_t a1)
{
  id v20 = *(id *)(*(void *)(a1 + 32) + 32LL);
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v3;

  id v6 = *(id *)(*(void *)(a1 + 32) + 48LL);
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 48);
  *(void *)(v9 + 4_Block_object_dispose(va, 8) = v8;

  uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v11);
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) performanceLog]);
  if (v15)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10003F678;
    v22[3] = &unk_100062F78;
    void v22[4] = *(void *)(a1 + 32);
    [v20 enumerateKeysAndObjectsUsingBlock:v22];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) occuranceLog]);

  if (v16)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10003F804;
    v21[3] = &unk_100062F78;
    void v21[4] = *(void *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v21];
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 8);
  *(void *)(v18 + _Block_object_dispose(va, 8) = v17;

  [*(id *)(a1 + 32) _saveAnalyticsData];
}

void sub_10003F678(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003F77C;
  v13[3] = &unk_100062F28;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v7;
  id v12 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6]);
  [v12 setValuesForKeysWithDictionary:v8];

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[7];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 performanceLog]);
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v12);
}

void sub_10003F77C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 88LL);
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);
  if (!v7) {
    id v7 = v8;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_10003F804(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003F908;
  v13[3] = &unk_100062F28;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v7;
  id v12 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6]);
  [v12 setValuesForKeysWithDictionary:v8];

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[7];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 occuranceLog]);
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v12);
}

void sub_10003F908(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 88LL);
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);
  if (!v7) {
    id v7 = v8;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_10003FB60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10003FB78(void *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7 = a3;
  if ((objc_opt_isKindOfClass(a2, a1[5]) & 1) == 0 || (objc_opt_isKindOfClass(v7, a1[6]) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_1000400E4(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 8) count]
    && ([*(id *)(a1 + 40) isEqualToString:@"Start"] & 1) == 0)
  {
    NSLog( @"Warning: CMSLoggerSession should start with kMSLoggingEventTypeStart. We have %@. It will be insert for you %s",  *(void *)(a1 + 40),  "-[CMSLoggingSession recordEvent:occuredAt:]_block_invoke");
    id v2 = -[MSLoggingEvent initForEventType:atTimestamp:]( objc_alloc(&OBJC_CLASS___MSLoggingEvent),  "initForEventType:atTimestamp:",  @"Start",  *(void *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:v2];
  }

  id v3 = -[MSLoggingEvent initForEventType:atTimestamp:]( objc_alloc(&OBJC_CLASS___MSLoggingEvent),  "initForEventType:atTimestamp:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v3];
}

void sub_100040630(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventDurations]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventOccurance]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40LL));
  [WeakRetained _sumbitFromSessionType:*(void *)(*(void *)(a1 + 32) + 24) withMetadata:*(void *)(*(void *)(a1 + 32) + 32) withEventDurations:v4 withEventOccurance:v2];
}

void sub_10004087C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  id v3 = "-[MSDAppSelectionAssistant homeUserWithService:forEndpoint:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s Failed to find a public entry for provided bundleID: %@",  (uint8_t *)&v2,  0x16u);
  sub_1000053CC();
}

void sub_100040900( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040970(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 UUIDString]);
  int v6 = 136315651;
  id v7 = "-[MSDAppSelectionAssistant homeUserWithService:forEndpoint:]";
  __int16 v8 = 2113;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s No users in the home %{private}@ have the requested service %@",  (uint8_t *)&v6,  0x20u);
}

void sub_100040A30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040AA0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040B04()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "_set_user_dir_suffix failed!",  v0,  2u);
}

id objc_msgSend__resolveAccountForMemberAccountWithService_homeUserIDS_servicesConfigured_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveAccountForMemberAccountWithService:homeUserIDS:servicesConfigured:completion:");
}

id objc_msgSend__sumbitFromSessionType_withMetadata_withEventDurations_withEventOccurance_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sumbitFromSessionType:withMetadata:withEventDurations:withEventOccurance:");
}

id objc_msgSend_establishShareWithHomeOwner_container_allowWriteAccess_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "establishShareWithHomeOwner:container:allowWriteAccess:completionHandler:");
}

id objc_msgSend_modifyCKRecordWithRecordsToSave_recordIDSToDelete_missingManateeIdentity_withAttribution_withOptions_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}