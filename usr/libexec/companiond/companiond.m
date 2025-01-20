void sub_100005120( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000513C(uint64_t a1)
{
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState");
    uint64_t v3 = (unint64_t)(v2 - 1) > 4 ? 3LL : qword_100025658[(void)(v2 - 1)];
    v4 = WeakRetained + 2;
    do
      unsigned int v5 = __ldaxr(v4);
    while (__stlxr(v3, v4));
    if (v3 != v5)
    {
      if (qword_10003BF48 != -1) {
        dispatch_once(&qword_10003BF48, &stru_100030858);
      }
      v6 = (os_log_s *)(id)qword_10003BF40;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)(v3 - 1) >= 3) {
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  v3));
        }
        else {
          v7 = off_100030878[v3 - 1];
        }
        *(_DWORD *)buf = 138543362;
        v10 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "System attention state changed: %{public}@",  buf,  0xCu);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v8 postNotificationName:@"CDAppleTVSystemMonitorAttentionStateChangedNotification" object:WeakRetained];
    }
  }
}

void sub_10000530C(id a1)
{
  id v1 = -[CDAppleTVSystemMonitor _init](objc_alloc(&OBJC_CLASS___CDAppleTVSystemMonitor), "_init");
  v2 = (void *)qword_10003BF30;
  qword_10003BF30 = (uint64_t)v1;
}

void sub_100005344(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "AppleTVSystemMonitor");
  v2 = (void *)qword_10003BF40;
  qword_10003BF40 = (uint64_t)v1;
}

void sub_1000054CC(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000054D4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create( (void *)&_mh_execute_header,  "learn more session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v20);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    v14 = objc_alloc_init(&OBJC_CLASS___CDLearnMoreGetAuthInfoResponse);
    v15 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    -[CDLearnMoreGetAuthInfoResponse setDeviceClass:](v14, "setDeviceClass:", v15);

    v16 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
    -[CDLearnMoreGetAuthInfoResponse setDeviceName:](v14, "setDeviceName:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URL]);
    -[CDLearnMoreGetAuthInfoResponse setURL:](v14, "setURL:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDLearnMoreGetAuthInfoResponse makeRapportDictionary](v14, "makeRapportDictionary"));
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v19, 0LL, 0LL);

    os_activity_scope_leave(&v20);
  }
}

void sub_1000056D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000056F4(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000056FC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = _os_activity_create( (void *)&_mh_execute_header,  "learn more session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v18);
    v11 = -[CDLearnMoreDidFinishRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDLearnMoreDidFinishRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_activity_scope_state_s v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    v14 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDLearnMoreDidFinishRequest deviceName](v11, "deviceName"));
    -[CPSDevice setName:](v14, "setName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDLearnMoreDidFinishRequest deviceModel](v11, "deviceModel"));
    -[CPSDevice setModel:](v14, "setModel:", v16);

    -[CPSDevice setFlags:](v14, "setFlags:", -[CDLearnMoreDidFinishRequest deviceFlags](v11, "deviceFlags"));
    [a1 _notifyDeviceAcceptedNotification:v14];
    id v17 = objc_alloc_init(&OBJC_CLASS___CPSLearnMoreResponse);
    sub_100005D40((uint64_t)a1, v17);
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);

    os_activity_scope_leave(&v18);
  }
}

void sub_1000058E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000059E4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(void *)(*(void *)(a1 + 32) + 120LL))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSError);
    id v7 = v14;
    id v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        id v9 = v8;
      }
      else {
        id v9 = 0LL;
      }
    }

    else
    {
      id v9 = 0LL;
    }

    id v10 = v9;

    if (v10) {
      v11 = v10;
    }
    else {
      v11 = v5;
    }
    id v12 = v11;

    if (!v12)
    {
      uint64_t v13 = NSErrorF(CPSErrorDomain, 4294960560LL, "View service dismissed unexpectedly.");
      id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    }

    [*(id *)(a1 + 32) _notifySessionFailed:v12];
    [*(id *)(a1 + 32) _invalidated];
  }
}

void sub_100005D40(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 128))
  {
    [*(id *)(a1 + 120) sessionFinished];
    v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterLearnMoreSession.sessionFinishedTimer");
    id v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    uint64_t v6 = *(void **)(a1 + 128);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100005E3C;
    v8[3] = &unk_1000308E8;
    v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_100005E3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFinished:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100005F9C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100005FA4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "restricted access session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v34);
    v11 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 approversAppleAccountAltDSIDs]);
    BOOL v16 = v15 == 0LL;

    if (v16
      || (id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest appleAccountToken](v11, "appleAccountToken")),
          os_activity_scope_state_s v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v11, "nonce")),
          unsigned __int8 v19 = sub_100006D1C(a1, v17, v18),
          v18,
          v17,
          (v19 & 1) != 0))
    {
      os_activity_scope_state_s v20 = objc_alloc_init(&OBJC_CLASS___CDRestrictedAccessGetAuthInfoResponse);
      v21 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
      -[CDRestrictedAccessGetAuthInfoResponse setDeviceClass:](v20, "setDeviceClass:", v21);

      v22 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
      -[CDRestrictedAccessGetAuthInfoResponse setDeviceName:](v20, "setDeviceName:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
      -[CDRestrictedAccessGetAuthInfoResponse setRestrictionType:]( v20,  "setRestrictionType:",  [v23 restrictionType]);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 userProfilesSnapshot]);

      id v26 = objc_alloc(&OBJC_CLASS___PBSUserProfileAccountInfo);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 selectedUserProfile]);
      id v28 = [v26 initWithUserProfile:v27];

      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 formattedShortName]);
      -[CDRestrictedAccessGetAuthInfoResponse setCurrentUserName:](v20, "setCurrentUserName:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccessGetAuthInfoResponse makeRapportDictionary](v20, "makeRapportDictionary"));
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v30, 0LL, 0LL);
    }

    else
    {
      uint64_t v31 = cps_session_log();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10001EDF4(v32);
      }

      uint64_t v33 = NSErrorF(NSOSStatusErrorDomain, 4294960542LL, "Invalid account token.");
      os_activity_scope_state_s v20 = (CDRestrictedAccessGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v33);
      (*((void (**)(id, void, void, CDRestrictedAccessGetAuthInfoResponse *))v9 + 2))(v9, 0LL, 0LL, v20);
    }

    os_activity_scope_leave(&v34);
  }
}

void sub_1000062EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000631C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100006324(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "restricted access session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v20);
    v11 = -[CDRestrictedAccesssDidFinishAuthRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDRestrictedAccesssDidFinishAuthRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccesssDidFinishAuthRequest deviceName](v11, "deviceName"));
    -[CPSDevice setName:](v14, "setName:", v15);

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccesssDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    -[CPSDevice setModel:](v14, "setModel:", v16);

    -[CPSDevice setFlags:](v14, "setFlags:", -[CDRestrictedAccesssDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPSDevice model](v14, "model"));
    BOOL v18 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v18) {
      [a1 _notifyDeviceAcceptedNotification:v14];
    }
    if (-[CDRestrictedAccesssDidFinishAuthRequest isApproved](v11, "isApproved"))
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___CPSRestrictedAccessResponse);
      sub_100006BD0((uint64_t)a1, v19);
    }

    else
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue(-[CDRestrictedAccesssDidFinishAuthRequest error](v11, "error"));
      sub_100006A80((uint64_t)a1, v19);
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    os_activity_scope_leave(&v20);
  }
}

void sub_100006564( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100006660(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 120))
  {
    id v8 = sub_1000067C4(v7, v5);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    if (v9)
    {
      id v10 = (id)v9;
      uint64_t v11 = cps_session_log();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)os_activity_scope_state_s v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Passcode was entered on TV.", v20, 2u);
      }

      [*(id *)(a1 + 32) _notifySessionFinished:v10];
    }

    else
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSError);
      id v14 = v5;
      v15 = v14;
      if (v13)
      {
        if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
          BOOL v16 = v15;
        }
        else {
          BOOL v16 = 0LL;
        }
      }

      else
      {
        BOOL v16 = 0LL;
      }

      id v17 = v16;

      if (v17) {
        BOOL v18 = v17;
      }
      else {
        BOOL v18 = v6;
      }
      id v10 = v18;

      if (!v10)
      {
        uint64_t v19 = NSErrorF(CPSErrorDomain, 4294960560LL, "View service dismissed unexpectedly.");
        id v10 = (id)objc_claimAutoreleasedReturnValue(v19);
      }

      [*(id *)(a1 + 32) _notifySessionFailed:v10];
    }

    [*(id *)(a1 + 32) _invalidated];
  }
}

id sub_1000067C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
    id v5 = v3;
    id v6 = v5;
    if (v4)
    {
      if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0LL;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    id v8 = v7;

    if (v8)
    {
      uint64_t v9 = objc_opt_self(&OBJC_CLASS___CPSRestrictedAccessResponse);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      id v16 = 0LL;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v10,  v8,  &v16));
      id v12 = v16;

      if (!v11)
      {
        uint64_t v13 = cps_session_log();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10001EE34((uint64_t)v12, v14);
        }
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

void sub_100006A80(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 128))
  {
    [*(id *)(a1 + 120) sessionFailed:v3];
    uint64_t v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterRestrictedAccessSession.sessionFailedTimer");
    id v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    id v6 = *(void **)(a1 + 128);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100006B80;
    v8[3] = &unk_1000308E8;
    v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_100006B80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFailed:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100006BD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 128))
  {
    [*(id *)(a1 + 120) sessionFinished];
    uint64_t v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterRestrictedAccessSession.sessionFinishedTimer");
    id v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    id v6 = *(void **)(a1 + 128);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100006CCC;
    v8[3] = &unk_1000308E8;
    v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_100006CCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFinished:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

void *sub_100006D1C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 approversAppleAccountAltDSIDs]);

    id v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v30;
      uint64_t v27 = kCryptoHashDescriptor_SHA512;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = 0LL;
          if (v6 && *(void *)(*((void *)&v29 + 1) + 8LL * (void)i))
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@+%@",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)i),  v6));
            v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataUsingEncoding:4]);
            if (v15)
            {
              id v16 = malloc(0x40uLL);
              id v17 = v15;
              id v28 = v14;
              id v18 = v10;
              id v19 = v6;
              uint64_t v20 = v11;
              id v21 = v5;
              v22 = v8;
              id v23 = [v17 bytes];
              id v24 = [v17 length];
              id v25 = v23;
              id v8 = v22;
              id v5 = v21;
              uint64_t v11 = v20;
              id v6 = v19;
              id v10 = v18;
              id v14 = v28;
              CryptoHashOneShot(v27, v25, v24, v16);
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v16,  64LL,  1LL));
            }

            else
            {
              uint64_t v13 = 0LL;
            }
          }

          if ([v13 isEqualToData:v5])
          {
            unsigned __int8 v33 = 1;

            a1 = (void *)v33;
            goto LABEL_18;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    a1 = 0LL;
  }

LABEL_18:
  return a1;
}

void sub_1000072E4(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000072EC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "sharing session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v20);
    uint64_t v11 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___CDSharingGetAuthInfoResponse);
    v15 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    -[CDSharingGetAuthInfoResponse setDeviceClass:](v14, "setDeviceClass:", v15);

    id v16 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
    -[CDSharingGetAuthInfoResponse setDeviceName:](v14, "setDeviceName:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 requestData]);
    -[CDSharingGetAuthInfoResponse setRequestData:](v14, "setRequestData:", v18);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDSharingGetAuthInfoResponse makeRapportDictionary](v14, "makeRapportDictionary"));
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v19, 0LL, 0LL);

    os_activity_scope_leave(&v20);
  }
}

void sub_1000074E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000750C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100007514(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "sharing session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v16);
    uint64_t v11 = -[CDSharingDidFinishAuthRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDSharingDidFinishAuthRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDSharingDidFinishAuthRequest error](v11, "error"));
    if (v14)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[CDSharingDidFinishAuthRequest error](v11, "error"));
      sub_100007A10(a1, v15);
    }

    else
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___CPSSharingResponse);
      sub_100007B60(a1, v15);
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    os_activity_scope_leave(&v16);
  }
}

void sub_1000076C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000077B8(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(void *)(*(void *)(a1 + 32) + 120LL))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSError);
    id v7 = v14;
    id v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        id v9 = v8;
      }
      else {
        id v9 = 0LL;
      }
    }

    else
    {
      id v9 = 0LL;
    }

    id v10 = v9;

    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v5;
    }
    id v12 = v11;

    if (!v12)
    {
      uint64_t v13 = NSErrorF(CPSErrorDomain, 4294960560LL, "View service dismissed unexpectedly.");
      id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    }

    [*(id *)(a1 + 32) _notifySessionFailed:v12];
    [*(id *)(a1 + 32) _invalidated];
  }
}

void sub_100007A10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 128))
  {
    [*(id *)(a1 + 120) sessionFailed:v3];
    uint64_t v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterSystemAuthenticationSession.sessionFailedTimer");
    id v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    uint64_t v6 = *(void **)(a1 + 128);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100007B10;
    v8[3] = &unk_1000308E8;
    v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_100007B10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFailed:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100007B60(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 128))
  {
    [*(id *)(a1 + 120) sessionFinished];
    uint64_t v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterSystemAuthenticationSession.sessionFinishedTimer");
    id v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    uint64_t v6 = *(void **)(a1 + 128);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100007C5C;
    v8[3] = &unk_1000308E8;
    v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_100007C5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFinished:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

_BYTE *sub_100007E0C(uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (!result[41]) {
    return [result _activated];
  }
  return result;
}

id sub_100007EC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}
}

id sub_10000822C(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"serviceListener"];
  return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"currentSession"];
}

id sub_100008628(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDeviceTappedNotification:a2];
}

id sub_100008634(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDeviceStartedAuthentication:a2];
}

id sub_100008640(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFinishWithResponse:a2];
}

id sub_10000864C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFailWithError:a2];
}

void sub_100008658(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0LL;
}

void sub_100008A30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 65)) {
    sub_100008A44(v1);
  }
}

void sub_100008A44(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    if (*(void *)(a1 + 96))
    {
      sub_100008C40(a1);
    }

    else
    {
      sub_100008CA8((id)a1);
      if (*(void *)(a1 + 112) == 1LL) {
        sub_100008E50(a1);
      }
      else {
        sub_100008B14(a1);
      }
    }
  }

void sub_100008B0C(uint64_t a1)
{
}

void sub_100008B14(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    if (!*(_BYTE *)(a1 + 65))
    {
      uint64_t v2 = cps_session_log();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Session invalidated.", v13, 2u);
      }

      [*(id *)(a1 + 16) invalidate];
      uint64_t v4 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0LL;

      [*(id *)(a1 + 24) invalidate];
      id v5 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0LL;

      [*(id *)(a1 + 32) invalidate];
      uint64_t v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0LL;

      [*(id *)(a1 + 40) invalidate];
      id v7 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0LL;

      [*(id *)(a1 + 48) invalidate];
      id v8 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0LL;

      [*(id *)(a1 + 56) invalidate];
      id v9 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0LL;

      [*(id *)(a1 + 80) cancel];
      id v10 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0LL;

      uint64_t v11 = *(void *)(a1 + 144);
      if (v11)
      {
        (*(void (**)(void))(v11 + 16))();
        id v12 = *(void **)(a1 + 144);
        *(void *)(a1 + 144) = 0LL;
      }

      *(_BYTE *)(a1 + 65) = 1;
    }
  }

void sub_100008C40(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (id *)(a1 + 96);
    uint64_t v3 = cps_session_log([*(id *)(a1 + 96) authType]);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001EEA8(v2, v4);
    }

    sub_100008B14(a1);
  }

id sub_100008CA8(id result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = cps_session_log(result);
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting device discovery.", buf, 2u);
    }

    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
    id v5 = (void *)*((void *)v1 + 6);
    *((void *)v1 + 6) = v4;

    [*((id *)v1 + 6) setDispatchQueue:*((void *)v1 + 15)];
    [*((id *)v1 + 6) setChangeFlags:1];
    [*((id *)v1 + 6) setDiscoveryFlags:16];
    uint64_t v6 = (void *)*((void *)v1 + 6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    [v6 setPurpose:v8];

    [*((id *)v1 + 6) setScanRate:30];
    [*((id *)v1 + 6) setRssiThreshold:-75];
    [*((id *)v1 + 6) setOverrideScreenOff:1];
    id v9 = (void *)*((void *)v1 + 6);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100009578;
    v14[3] = &unk_100030A48;
    v14[4] = v1;
    [v9 setDeviceChangedHandler:v14];
    id v10 = (void *)*((void *)v1 + 6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000096D8;
    v13[3] = &unk_100030A70;
    v13[4] = v1;
    [v10 setDeviceLostHandler:v13];
    uint64_t v11 = (void *)*((void *)v1 + 6);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000097B0;
    v12[3] = &unk_1000309B0;
    v12[4] = v1;
    return [v11 activateWithCompletion:v12];
  }

  return result;
}

void sub_100008E50(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
    -[RPCompanionLinkDevice setIdentifier:](v2, "setIdentifier:", *(void *)(a1 + 104));
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v3;

    [*(id *)(a1 + 16) setDispatchQueue:*(void *)(a1 + 120)];
    [*(id *)(a1 + 16) setControlFlags:0x80000103800];
    [*(id *)(a1 + 16) setDestinationDevice:v2];
    id v5 = *(void **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100008F14;
    v6[3] = &unk_1000309B0;
    v6[4] = a1;
    [v5 activateWithCompletion:v6];
  }

void sub_100008F14(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = cps_session_log(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001EF28();
    }

    sub_100008B14(*(void *)(a1 + 32));
  }

  else
  {
    sub_100008F88(*(void *)(a1 + 32));
  }
}

void sub_100008F88(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = _os_activity_create( (void *)&_mh_execute_header,  "auth session/send get auth type request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v2, &state);
    uint64_t v4 = cps_session_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending get auth type request.", buf, 2u);
    }

    uint64_t v6 = *(void **)(a1 + 16);
    uint64_t v7 = *(void *)(a1 + 72);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000909C;
    v8[3] = &unk_1000309D8;
    v8[4] = a1;
    [v6 sendRequestID:@"com.apple.CompanionAuthentication.GetAuthType" request:&__NSDictionary0__struct options:v7 responseHandler:v8];
    os_activity_scope_leave(&state);
  }

void sub_100009084(_Unwind_Exception *a1)
{
}

void sub_10000909C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000090A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "auth session/handle get auth type response",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v20);
    if (v9)
    {
      uint64_t v12 = cps_session_log(v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10001EFC4();
      }

      sub_100008B14(a1);
    }

    else
    {
      id v14 = -[CDGetAuthTypeResponse initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetAuthTypeResponse),  "initWithRapportDictionary:",  v7);
      uint64_t v15 = cps_session_log(v14);
      os_activity_scope_state_s v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received get auth type response: %@",  buf,  0xCu);
      }

      id v17 = -[CDGetAuthTypeResponse authType](v14, "authType");
      if (v17 == (id)9)
      {
        sub_1000092A0(a1);
      }

      else
      {
        uint64_t v18 = cps_session_log(v17);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10001EF88((uint64_t)buf, -[CDGetAuthTypeResponse authType](v14, "authType"), v19);
        }

        sub_100008B14(a1);
      }
    }

    os_activity_scope_leave(&v20);
  }
}

void sub_100009270( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000092A0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = _os_activity_create( (void *)&_mh_execute_header,  "sharing session/start",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v2, &state);
    uint64_t v4 = cps_session_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting Sharing session.", v6, 2u);
    }

    sub_10000986C(a1);
    os_activity_scope_leave(&state);
  }

void sub_100009354( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_10000936C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create( (void *)&_mh_execute_header,  "auth session/send get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &state);
    uint64_t v9 = cps_session_log(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending get auth info request: %@",  buf,  0xCu);
    }

    uint64_t v11 = *(void **)(a1 + 16);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 makeRapportDictionary]);
    uint64_t v13 = (void *)v12;
    if (v12) {
      id v14 = (void *)v12;
    }
    else {
      id v14 = &__NSDictionary0__struct;
    }
    uint64_t v15 = *(void *)(a1 + 72);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100009520;
    v16[3] = &unk_100030A00;
    id v17 = v6;
    [v11 sendRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" request:v14 options:v15 responseHandler:v16];

    os_activity_scope_leave(&state);
  }
}

void sub_100009500( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

uint64_t sub_100009520(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000952C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    [v4 activate];
  }
}

void sub_100009578(uint64_t a1, void *a2)
{
}

void sub_100009580(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = objc_msgSend(v3, "cad_matchesDeviceIdentifier:", *(void *)(a1 + 104));
    if ((_DWORD)v5)
    {
      uint64_t v6 = cps_session_log(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Discovery device changed: %@",  (uint8_t *)&v12,  0xCu);
      }

      uint64_t v8 = *(void *)(a1 + 112);
      if (v8 == 2)
      {
        id v9 = [v4 deviceActionType];
        if ((_DWORD)v9 == 28) {
          goto LABEL_13;
        }
      }

      else
      {
        if (v8 != 1) {
          goto LABEL_13;
        }
        id v9 = [v4 deviceActionType];
        if ((_DWORD)v9 == 34) {
          goto LABEL_13;
        }
      }

      uint64_t v10 = cps_session_log(v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Discovery device removed nearby action: %@",  (uint8_t *)&v12,  0xCu);
      }

      sub_100008B14(a1);
    }
  }

LABEL_13:
}

void sub_1000096D8(uint64_t a1, void *a2)
{
}

void sub_1000096E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = objc_msgSend(v3, "cad_matchesDeviceIdentifier:", *(void *)(a1 + 104));
    if ((_DWORD)v5)
    {
      uint64_t v6 = cps_session_log(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Discovery device lost: %@",  (uint8_t *)&v8,  0xCu);
      }

      sub_100008B14(a1);
    }
  }
}

void sub_1000097B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = cps_session_log(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001F024();
    }

    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(os_log_s **)(v7 + 48);
    *(void *)(v7 + 48) = 0LL;
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device discovery started.", v8, 2u);
  }
}

void sub_10000986C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CDGetInfoRequest);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));

    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_altDSID"));
    int v8 = (void *)v7;
    if (v3) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = 0LL;
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@+%@", v7, v3));
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
      uint64_t v13 = (void *)v12;
      if (v12)
      {
        id v14 = malloc(0x40uLL);
        uint64_t v16 = kCryptoHashDescriptor_SHA512;
        id v15 = v13;
        CryptoHashOneShot(v16, [v15 bytes], objc_msgSend(v15, "length"), v14);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v14,  64LL,  1LL));
      }

      else
      {
        uint64_t v10 = 0LL;
      }
    }

    -[CDGetInfoRequest setAppleAccountToken:](v4, "setAppleAccountToken:", v10);

    -[CDGetInfoRequest setNonce:](v4, "setNonce:", v3);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100009A4C;
    v17[3] = &unk_1000309D8;
    v17[4] = a1;
    sub_10000936C(a1, v4, v17);
  }

void sub_100009A4C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100009A54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "sharing session/handle get auth info response",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v19);
    if (v9)
    {
      uint64_t v12 = cps_session_log(v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10001F084();
      }

      sub_100008B14(a1);
    }

    else
    {
      id v14 = -[CDSharingGetAuthInfoResponse initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDSharingGetAuthInfoResponse),  "initWithRapportDictionary:",  v7);
      uint64_t v15 = cps_session_log(v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received get auth info response: %@",  buf,  0xCu);
      }

      id v17 = sub_100009C18(a1, v14);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      sub_10000952C(a1, v18);
    }

    os_activity_scope_leave(&v19);
  }
}

void sub_100009BEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

CUUserNotificationSession *sub_100009C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    id v5 = v4;
    if (!v4) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v11[0] = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceName]);
    id v7 = v6;
    if (!v6) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v11[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    if (!v6) {

    }
    if (!v4) {
    id v9 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
    }
    -[CUUserNotificationSession setFlags:](v9, "setFlags:", 1LL);
    -[CUUserNotificationSession setIdentifier:](v9, "setIdentifier:", *(void *)(a1 + 104));
    -[CUUserNotificationSession setBundleID:](v9, "setBundleID:", @"com.apple.CompanionNotifications");
    -[CUUserNotificationSession setCategoryID:](v9, "setCategoryID:", @"CDUserNotificationCategoryGeneric");
    -[CUUserNotificationSession setTitleKey:](v9, "setTitleKey:", @"Apple TV");
    -[CUUserNotificationSession setBodyKey:](v9, "setBodyKey:", @"Use your %@ to share from “%@”.");
    -[CUUserNotificationSession setBodyArguments:](v9, "setBodyArguments:", v8);
    -[CUUserNotificationSession setDispatchQueue:](v9, "setDispatchQueue:", *(void *)(a1 + 120));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

void sub_100009ECC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100009EDC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

id sub_10000A9EC()
{
  if (qword_10003BF58 != -1) {
    dispatch_once(&qword_10003BF58, &stru_100030B58);
  }
  return (id)qword_10003BF50;
}

void sub_10000ADFC(uint64_t a1)
{
}

void sub_10000AE04(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 8))
  {
    id v2 = sub_10000A9EC();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Presenting view service. request: %@",  buf,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userPresentationServiceProxy]);
    uint64_t v7 = *(void *)(a1 + 8);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000B9EC;
    v8[3] = &unk_100030B10;
    v8[4] = a1;
    [v6 presentUIWithRequest:v7 completion:v8];
  }

void sub_10000AF78(uint64_t a1)
{
}

void sub_10000AF80(uint64_t a1)
{
  if (a1)
  {
    id v2 = sub_10000A9EC();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidated.", v9, 2u);
    }

    uint64_t v4 = *(void *)(a1 + 24);
    if (v4)
    {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0LL, 0LL);
      id v5 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0LL;
    }

    if (*(void *)(a1 + 8))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userPresentationServiceProxy]);
      [v7 dismissUIWithRequest:*(void *)(a1 + 8)];

      id v8 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0LL;
    }
  }

void sub_10000B0D8(uint64_t a1)
{
}

void sub_10000B0E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && *(void *)(a1 + 8))
  {
    id v4 = sub_10000A9EC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = &off_100032F00;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending fetch app icon message: %@",  buf,  0xCu);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userPresentationServiceProxy]);
    uint64_t v8 = *(void *)(a1 + 8);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000BC10;
    v9[3] = &unk_100030B38;
    id v10 = v3;
    [v7 messageUIWithRequest:v8 message:&off_100032F00 reply:v9];
  }
}

void sub_10000B2A8(uint64_t a1)
{
}

void sub_10000B2B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && *(void *)(a1 + 8))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v4 setObject:&off_100032E78 forKeyedSubscript:@"messageType"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 flags]));
    [v4 setObject:v5 forKeyedSubscript:@"deviceFlags"];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    [v4 setObject:v6 forKeyedSubscript:@"deviceModel"];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    [v4 setObject:v7 forKeyedSubscript:@"deviceName"];

    id v8 = sub_10000A9EC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending device tapped notification message: %@",  (uint8_t *)&v12,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userPresentationServiceProxy]);
    [v11 messageUIWithRequest:*(void *)(a1 + 8) message:v4 reply:0];
  }
}

void sub_10000B4E8(uint64_t a1)
{
}

void sub_10000B4F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && *(void *)(a1 + 8))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v4 setObject:&off_100032E90 forKeyedSubscript:@"messageType"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 flags]));
    [v4 setObject:v5 forKeyedSubscript:@"deviceFlags"];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    [v4 setObject:v6 forKeyedSubscript:@"deviceModel"];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    [v4 setObject:v7 forKeyedSubscript:@"deviceName"];

    id v8 = sub_10000A9EC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending device started authentication message: %@",  (uint8_t *)&v12,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userPresentationServiceProxy]);
    [v11 messageUIWithRequest:*(void *)(a1 + 8) message:v4 reply:0];
  }
}

void sub_10000B704(uint64_t a1)
{
}

void sub_10000B70C(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 8))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v2 setObject:&off_100032EA8 forKeyedSubscript:@"messageType"];
    id v3 = sub_10000A9EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Sending session finished message: %@",  (uint8_t *)&v7,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userPresentationServiceProxy]);
    [v6 messageUIWithRequest:*(void *)(a1 + 8) message:v2 reply:0];
  }

void sub_10000B8A0(uint64_t a1)
{
}

void sub_10000B8AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && *(void *)(a1 + 8))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v4 setObject:&off_100032EC0 forKeyedSubscript:@"messageType"];
    [v4 setObject:v3 forKeyedSubscript:@"error"];
    id v5 = sub_10000A9EC();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending session failed message: %@",  (uint8_t *)&v9,  0xCu);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userPresentationServiceProxy]);
    [v8 messageUIWithRequest:*(void *)(a1 + 8) message:v4 reply:0];
  }
}

void sub_10000B9EC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_10000A9EC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = a2;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "View service dismissed. reason: %ld, result: %@, error: %@",  buf,  0x20u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  int v12 = *(dispatch_queue_s **)(v11 + 16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000BB38;
  v15[3] = &unk_100030AE8;
  v15[4] = v11;
  id v16 = v7;
  id v17 = v8;
  uint64_t v18 = a2;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v12, v15);
}

void sub_10000BB38(uint64_t *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    if (a1[7] == 2)
    {
      (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, a1[5], 0LL);
    }

    else
    {
      uint64_t v4 = a1[6];
      if (v4)
      {
        (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0LL, v4);
      }

      else
      {
        uint64_t v5 = NSErrorF(CPSErrorDomain, 4294960560LL, "View service dismissed unexpectedly. reason: %ld", a1[7]);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
        (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0LL, v6);
      }
    }

    uint64_t v7 = a1[4];
    id v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0LL;

    uint64_t v2 = a1[4];
  }

  id v9 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0LL;

  sub_10000AF80(a1[4]);
}

void sub_10000BC10(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_10000A9EC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109634;
    v21[1] = a2;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received app icon reply. success: %{BOOL}d, response: %@, error: %@",  (uint8_t *)v21,  0x1Cu);
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v12 = v7;
  id v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  id v15 = v14;

  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v15, @"appIconData", TypeID, 0LL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t NSNumber = NSDictionaryGetNSNumber(v15, @"appIconScale", 0LL);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000BDF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "RequesterViewService");
  uint64_t v2 = (void *)qword_10003BF50;
  qword_10003BF50 = (uint64_t)v1;
}

void sub_10000BFD4(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000BFDC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "store authentication session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v35);
    uint64_t v11 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest storeAccountToken](v11, "storeAccountToken"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v11, "nonce"));
    unsigned __int8 v16 = sub_10000C698(a1, v14, v15);

    if ((v16 & 1) != 0)
    {
      uint64_t v18 = objc_alloc_init(&OBJC_CLASS___CDStoreAuthenticationGetAuthInfoResponse);
      -[CDStoreAuthenticationGetAuthInfoResponse setAuthenticationRequest:](v18, "setAuthenticationRequest:", a1[15]);
      os_activity_scope_state_s v19 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
      -[CDStoreAuthenticationGetAuthInfoResponse setDeviceClass:](v18, "setDeviceClass:", v19);

      uint64_t v20 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
      -[CDStoreAuthenticationGetAuthInfoResponse setDeviceName:](v18, "setDeviceName:", v20);

      uint64_t v22 = cps_session_log(v21);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Sending get auth info response: %@",  buf,  0xCu);
      }

      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationGetAuthInfoResponse makeRapportDictionary](v18, "makeRapportDictionary"));
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v24, 0LL, 0LL);
    }

    else
    {
      uint64_t v25 = cps_session_log(v17);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10001F148(v26, v27, v28, v29, v30, v31, v32, v33);
      }

      uint64_t v34 = NSErrorF(NSOSStatusErrorDomain, 4294960542LL, "Invalid store account token.");
      uint64_t v18 = (CDStoreAuthenticationGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v34);
      (*((void (**)(id, void, void, CDStoreAuthenticationGetAuthInfoResponse *))v9 + 2))( v9,  0LL,  0LL,  v18);
    }

    os_activity_scope_leave(&v35);
  }
}

void sub_10000C2B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000C2E0(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000C2E8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "store authentication session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v28);
    uint64_t v11 = -[CDStoreAuthenticationDidFinishAuthRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDStoreAuthenticationDidFinishAuthRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest deviceName](v11, "deviceName"));
    -[CPSDevice setName:](v12, "setName:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    -[CPSDevice setModel:](v12, "setModel:", v14);

    -[CPSDevice setFlags:]( v12,  "setFlags:",  -[CDStoreAuthenticationDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPSDevice model](v12, "model"));
    BOOL v16 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v16) {
      id v17 = [a1 _notifyDeviceAcceptedNotification:v12];
    }
    uint64_t v18 = cps_session_log(v17);
    os_activity_scope_state_s v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest authenticationResult](v11, "authenticationResult"));
    BOOL v21 = v20 == 0LL;

    if (v21)
    {
      id v25 = (id)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest error](v11, "error"));
      [a1 _notifySessionFailed:v25];
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeStringForKey:", RPOptionSenderModelID));
      id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags));
      id v24 = [v23 unsignedIntegerValue];
      if (&OBJC_CLASS___CPSMetrics) {
        +[CPSMetrics sendProviderDeviceUsageEvent:](&OBJC_CLASS___CPSMetrics, "sendProviderDeviceUsageEvent:", v22, v24);
      }
      else {

      }
      id v26 = objc_alloc(&OBJC_CLASS___CPSStoreAuthenticationResponse);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CDStoreAuthenticationDidFinishAuthRequest authenticationResult](v11, "authenticationResult"));
      id v25 = [v26 initWithAuthenticationResult:v27];

      [a1 _notifySessionFinished:v25];
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    [a1 _invalidated];

    os_activity_scope_leave(&v28);
  }
}

void sub_10000C5C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void *sub_10000C698(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (void *)a1[16];
    id v7 = a2;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_altDSID"));
    id v9 = (void *)v8;
    id v10 = 0LL;
    if (v5 && v8)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@+%@", v8, v5));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
      if (v12)
      {
        id v13 = malloc(0x40uLL);
        uint64_t v14 = kCryptoHashDescriptor_SHA512;
        id v15 = v12;
        CryptoHashOneShot(v14, [v15 bytes], objc_msgSend(v15, "length"), v13);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v13,  64LL,  1LL));
      }

      else
      {
        id v10 = 0LL;
      }
    }

    a1 = [v10 isEqualToData:v7];
  }

  return a1;
}

void sub_10000CA64( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10000CBA0(uint64_t a1)
{
  return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"connection"];
}

void sub_10000CC50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    if ([v10 hasStorePurchaseEntitlement])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }

    else
    {
      id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  103LL,  0LL));
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_10000CD18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 overrideBundleIdentifier]);

    if (v9)
    {
      if ([v13 hasAppSignInOverrideBundleIdentifierEntitlement])
      {
        if ((_BSIsInternalInstall("-[CDServiceConnection _serviceClient:startAppSignInSessionWithRequest:completionHandler:]") & 1) != 0) {
          goto LABEL_5;
        }
        uint64_t v11 = CPSErrorDomain;
        uint64_t v12 = 101LL;
      }

      else
      {
        uint64_t v11 = CPSErrorDomain;
        uint64_t v12 = 103LL;
      }

      id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  v12,  0LL));
      v8[2](v8, WeakRetained);
      goto LABEL_9;
    }

LABEL_5:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained serviceConnection:a1 serviceClient:v13 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
LABEL_9:
  }
}

void sub_10000CE24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    if ([v10 hasSystemAuthenticationEntitlement])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }

    else
    {
      id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  103LL,  0LL));
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_10000CEEC(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    id v7 = (id *)(a1 + 16);
    id v8 = a4;
    id v9 = a3;
    id v10 = a2;
    id WeakRetained = objc_loadWeakRetained(v7);
    [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v9 completionHandler:v8];
  }

void sub_10000CF7C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v10 hasRestrictedAccessEntitlement])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }

    else
    {
      id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  103LL,  0LL));
      v8[2](v8, WeakRetained);
    }
  }
}

void sub_10000D044(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v10 hasStoreAuthenticationEntitlement])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained serviceConnection:a1 serviceClient:v10 startAuthenticationSessionWithRequest:v7 completionHandler:v8];
    }

    else
    {
      id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CPSErrorDomain,  103LL,  0LL));
      v8[2](v8, WeakRetained);
    }
  }
}

LABEL_22:
  os_activity_scope_leave(&state);
}

void sub_10000D5D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10000D604(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = cps_service_log();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001F1A8((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Started authentication session.", v13, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000D888( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000DA08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000DA2C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = cps_service_log();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10001F20C((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_10000DBD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000DBFC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = cps_service_log();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10001F20C((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

LABEL_8:
    uint64_t v12 = (LSApplicationRecord *)v17;
    id v15 = 0LL;
    *a5 = v12;
    goto LABEL_13;
  }

  BOOL v21 = 0LL;
  uint64_t v12 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v11,  0LL,  &v21);
  id v13 = v21;
  uint64_t v14 = v13;
  if (!v12)
  {
    uint64_t v18 = cps_session_log(v13);
    os_activity_scope_state_s v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10001F270((uint64_t)v14, v19);
    }

    id v17 = v14;
    uint64_t v14 = v17;
    if (!v17) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }

  id v15 = -[CDAuthInfoInstalledApplication initWithApplicationRecord:]( objc_alloc(&OBJC_CLASS___CDAuthInfoInstalledApplication),  "initWithApplicationRecord:",  v12);
LABEL_13:

  return v15;
}
}

_BYTE *sub_10000E0C0(uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_10000E12C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_10000E18C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRapportDiscovery];
}

id sub_10000E200()
{
  if (qword_10003BF68 != -1) {
    dispatch_once(&qword_10003BF68, &stru_100030C08);
  }
  return (id)qword_10003BF60;
}

uint64_t sub_10000E37C(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40LL);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000E478(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = 0LL;

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40LL);
  if (v7) {
    (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v8, a3);
  }
}

void sub_10000E4E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0LL;
}

void sub_10000E554(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "CDDeviceDiscovery");
  uint64_t v2 = (void *)qword_10003BF60;
  qword_10003BF60 = (uint64_t)v1;
}

_BYTE *sub_10000E650(uint64_t a1)
{
  uint64_t result = *(_BYTE **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_10000E6BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_10000E7CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleDeviceFound:a2];
}

void sub_10000E7D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000E8A0();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001F2E4((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 16);
    *(void *)(v13 + 16) = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Discovery started.", v15, 2u);
    }

    [*(id *)(a1 + 32) _startDiscoveryTimer];
  }
}

id sub_10000E8A0()
{
  if (qword_10003BF78 != -1) {
    dispatch_once(&qword_10003BF78, &stru_100030C50);
  }
  return (id)qword_10003BF70;
}

id sub_10000EB54(uint64_t a1)
{
  id v2 = sub_10000E8A0();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer fired.", v5, 2u);
  }

  return [*(id *)(a1 + 32) _invalidated];
}

void sub_10000EC40(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "CDRapportDiscovery");
  id v2 = (void *)qword_10003BF70;
  qword_10003BF70 = (uint64_t)v1;
}

void sub_10000ED08(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "CompAuth/RapportClient/handleRequest",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &v23);
  if (!*(_BYTE *)(a1 + 40)
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags)),
        unsigned int v12 = [v11 integerValue],
        v11,
        (v12 & 0x80000) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_10001F3B4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v21 = NSErrorF(CPSErrorDomain, 4294960542LL, "Owner device required");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v22);
  }

  os_activity_scope_leave(&v23);
}

void sub_10000EE54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000EF04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "CompAuth/RapportClient/handleEvent",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &v18);
  if (!*(_BYTE *)(a1 + 40)
    || (id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeNumberForKey:", RPOptionStatusFlags)),
        unsigned int v9 = [v8 integerValue],
        v8,
        (v9 & 0x80000) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_10001F3B4(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  os_activity_scope_leave(&v18);
}

void sub_10000EFF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000F0E4(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000F0EC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    BOOL v10 = _os_activity_create( (void *)&_mh_execute_header,  "system auth session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v28);
    uint64_t v11 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appleAccountAltDSID]);
    BOOL v16 = v15 == 0LL;

    if (v16
      || (uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest appleAccountToken](v11, "appleAccountToken")),
          os_activity_scope_state_s v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v11, "nonce")),
          unsigned __int8 v19 = sub_10000FF24(a1, v17, v18),
          v18,
          v17,
          (v19 & 1) != 0))
    {
      uint64_t v21 = objc_alloc_init(&OBJC_CLASS___CDSystemAuthenticationGetAuthInfoResponse);
      uint64_t v22 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
      -[CDSystemAuthenticationGetAuthInfoResponse setDeviceClass:](v21, "setDeviceClass:", v22);

      os_activity_scope_state_s v23 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
      -[CDSystemAuthenticationGetAuthInfoResponse setDeviceName:](v21, "setDeviceName:", v23);

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationGetAuthInfoResponse makeRapportDictionary](v21, "makeRapportDictionary"));
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v24, 0LL, 0LL);
    }

    else
    {
      uint64_t v25 = cps_session_log(v20);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10001F3EC(v26);
      }

      uint64_t v27 = NSErrorF(NSOSStatusErrorDomain, 4294960542LL, "Invalid account token.");
      uint64_t v21 = (CDSystemAuthenticationGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v27);
      (*((void (**)(id, void, void, CDSystemAuthenticationGetAuthInfoResponse *))v9 + 2))( v9,  0LL,  0LL,  v21);
    }

    os_activity_scope_leave(&v28);
  }
}

void sub_10000F388( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000F3B0(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_10000F3B8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    BOOL v10 = _os_activity_create( (void *)&_mh_execute_header,  "system auth session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v24);
    uint64_t v11 = -[CDSystemAuthenticationDidFinishAuthRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDSystemAuthenticationDidFinishAuthRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationDidFinishAuthRequest deviceName](v11, "deviceName"));
    -[CPSDevice setName:](v14, "setName:", v15);

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    -[CPSDevice setModel:](v14, "setModel:", v16);

    -[CPSDevice setFlags:]( v14,  "setFlags:",  -[CDSystemAuthenticationDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPSDevice model](v14, "model"));
    BOOL v18 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v18) {
      [a1 _notifyDeviceAcceptedNotification:v14];
    }
    if (-[CDSystemAuthenticationDidFinishAuthRequest isEnabled](v11, "isEnabled"))
    {
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
      +[CPSMetrics sendSystemSessionCompletedEvent:]( CPSMetrics,  "sendSystemSessionCompletedEvent:",  [v19 service],  1);

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeStringForKey:", RPOptionSenderModelID));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags));
      id v22 = [v21 unsignedIntegerValue];
      if (&OBJC_CLASS___CPSMetrics) {
        +[CPSMetrics sendProviderDeviceUsageEvent:](&OBJC_CLASS___CPSMetrics, "sendProviderDeviceUsageEvent:", v20, v22);
      }
      else {

      }
      id v23 = objc_alloc_init(&OBJC_CLASS___CPSSystemAuthenticationResponse);
      sub_10000FDD8((uint64_t)a1, v23);
    }

    else
    {
      id v23 = (id)objc_claimAutoreleasedReturnValue(-[CDSystemAuthenticationDidFinishAuthRequest error](v11, "error"));
      sub_10000F894(a1, v23);
      sub_10000FC88((uint64_t)a1, v23);
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    os_activity_scope_leave(&v24);
  }
}

void sub_10000F694( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000F790(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(void *)(*(void *)(a1 + 32) + 120LL))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSError);
    id v7 = v14;
    id v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        id v9 = v8;
      }
      else {
        id v9 = 0LL;
      }
    }

    else
    {
      id v9 = 0LL;
    }

    id v10 = v9;

    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v5;
    }
    id v12 = v11;

    if (!v12)
    {
      uint64_t v13 = NSErrorF(CPSErrorDomain, 4294960560LL, "View service dismissed unexpectedly.");
      id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    }

    sub_10000F894(*(void **)(a1 + 32), v12);
    [*(id *)(a1 + 32) _notifySessionFailed:v12];
    [*(id *)(a1 + 32) _invalidated];
  }
}

void sub_10000F894(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v4 isEqualToString:CPSErrorDomain])
    {
      id v5 = [v8 code];

      if (v5 == (id)104)
      {
        uint64_t v6 = 2LL;
LABEL_7:
        id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
        +[CPSMetrics sendSystemSessionCompletedEvent:]( CPSMetrics,  "sendSystemSessionCompletedEvent:",  [v7 service],  v6);

        id v3 = v8;
        goto LABEL_8;
      }
    }

    else
    {
    }

    uint64_t v6 = 3LL;
    goto LABEL_7;
  }

void sub_10000FC88(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 128))
  {
    [*(id *)(a1 + 120) sessionFailed:v3];
    id v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterSystemAuthenticationSession.sessionFailedTimer");
    id v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    uint64_t v6 = *(void **)(a1 + 128);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FD88;
    v8[3] = &unk_1000308E8;
    v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_10000FD88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFailed:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_10000FDD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 128))
  {
    [*(id *)(a1 + 120) sessionFinished];
    id v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterSystemAuthenticationSession.sessionFinishedTimer");
    id v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    uint64_t v6 = *(void **)(a1 + 128);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FED4;
    v8[3] = &unk_1000308E8;
    v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_10000FED4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFinished:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_10000FF24(id a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 appleAccountAltDSID]);
    id v9 = (void *)v8;
    id v10 = 0LL;
    if (v5 && v8)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@+%@", v8, v5));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
      if (v12)
      {
        uint64_t v13 = malloc(0x40uLL);
        uint64_t v14 = kCryptoHashDescriptor_SHA512;
        id v15 = v12;
        CryptoHashOneShot(v14, [v15 bytes], objc_msgSend(v15, "length"), v13);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v13,  64LL,  1LL));
      }

      else
      {
        id v10 = 0LL;
      }
    }

    a1 = [v10 isEqualToData:v6];
  }

  return a1;
}

_BYTE *sub_1000101BC(uint64_t a1)
{
  uint64_t result = *(_BYTE **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_100010228(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_1000102D0(_Unwind_Exception *a1)
{
}

void sub_1000102EC(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[9]) {
    [WeakRetained _handleEvent:v5];
  }
}

LABEL_11:
  id v10 = xpc_dictionary_get_BOOL(xdict, "replyRequired");
  uint64_t v11 = xdict;
  if (v10)
  {
    reply = xpc_dictionary_create_reply(xdict);
    uint64_t v13 = reply;
    if (reply) {
      xpc_dictionary_send_reply(reply);
    }

    uint64_t v11 = xdict;
  }
}

  return a1;
}

id sub_100010664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleGetAuthInfoRequest:a2 options:a3 responseHandler:a4];
}

void sub_1000109BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100010B8C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100010B94(void *a1, void *a2, void *a3, void *a4)
{
  id v38 = a2;
  id v37 = a3;
  id v7 = a4;
  if (a1)
  {
    uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "store purchase session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v38);
    uint64_t v10 = cps_session_log(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest storeAccountToken](v9, "storeAccountToken"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest nonce](v9, "nonce"));
    unsigned __int8 v14 = sub_100011444(a1, v12, v13);

    if ((v14 & 1) != 0)
    {
      BOOL v16 = objc_alloc_init(&OBJC_CLASS___CDStorePurchaseGetAuthInfoResponse);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest deviceBuildVersion](v9, "deviceBuildVersion"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[BSBuildVersion fromString:](&OBJC_CLASS___BSBuildVersion, "fromString:", v17));

      id v18 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:RPOptionSenderModelID]);
      LOBYTE(v17) = [v18 hasPrefix:@"iPhone"];

      if (((v17 & 1) != 0
         || (id v19 = v18,
             unsigned int v20 = [v19 hasPrefix:@"iPad"],
             v19,
             v20))
        && (uint64_t v21 = (uint64_t)objc_msgSend(v36, "majorBuildNumber", v36), v21 <= 20))
      {
        uint64_t v22 = cps_session_log(v21);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "iOS device requires legacy purchase request",  buf,  2u);
        }

        os_activity_scope_state_s v24 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDelegatePurchaseTask bagSubProfile](&OBJC_CLASS___AMSDelegatePurchaseTask, "bagSubProfile"));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDelegatePurchaseTask bagSubProfileVersion]( &OBJC_CLASS___AMSDelegatePurchaseTask,  "bagSubProfileVersion"));
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  v24,  v25));

        id v27 = [[AMSDelegatePurchasePaymentDialogTask alloc] initWithDelegatePurchaseRequest:a1[15] bag:v26 andDesignVersion:&off_100032ED8];
        uint64_t v28 = cps_session_log(v27);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Loading legacy purchase request.",  buf,  2u);
        }

        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v27 performTask]);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_1000116DC;
        v39[3] = &unk_100030D18;
        v39[4] = a1;
        id v41 = v7;
        v40 = v16;
        [v30 addFinishBlock:v39];
      }

      else
      {
        uint64_t v34 = cps_session_log(-[CDStorePurchaseGetAuthInfoResponse setPurchaseRequest:](v16, "setPurchaseRequest:", a1[15], v36));
        os_activity_scope_state_s v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Sending get auth info response: %@",  buf,  0xCu);
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseGetAuthInfoResponse makeRapportDictionary](v16, "makeRapportDictionary"));
        (*((void (**)(id, void *, void, void))v7 + 2))(v7, v26, 0LL, 0LL);
      }
    }

    else
    {
      uint64_t v31 = cps_session_log(v15);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10001F42C();
      }

      uint64_t v33 = NSErrorF(NSOSStatusErrorDomain, 4294960542LL, "Invalid store account token.");
      BOOL v16 = (CDStorePurchaseGetAuthInfoResponse *)objc_claimAutoreleasedReturnValue(v33);
      (*((void (**)(id, void, void, CDStorePurchaseGetAuthInfoResponse *))v7 + 2))(v7, 0LL, 0LL, v16);
    }

    os_activity_scope_leave(&state);
  }
}

void sub_100011044( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_10001108C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100011094(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "store purchase session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v28);
    uint64_t v11 = -[CDStorePurchaseDidFinishAuthRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDStorePurchaseDidFinishAuthRequest),  "initWithRapportDictionary:",  v7);
    id v12 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest deviceName](v11, "deviceName"));
    -[CPSDevice setName:](v12, "setName:", v13);

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest deviceModel](v11, "deviceModel"));
    -[CPSDevice setModel:](v12, "setModel:", v14);

    -[CPSDevice setFlags:](v12, "setFlags:", -[CDStorePurchaseDidFinishAuthRequest deviceFlags](v11, "deviceFlags"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPSDevice model](v12, "model"));
    BOOL v16 = GestaltProductTypeStringToDeviceClass() == 6;

    if (v16) {
      id v17 = [a1 _notifyDeviceAcceptedNotification:v12];
    }
    uint64_t v18 = cps_session_log(v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest purchaseResult](v11, "purchaseResult"));
    BOOL v21 = v20 == 0LL;

    if (v21)
    {
      id v25 = (id)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest error](v11, "error"));
      [a1 _notifySessionFailed:v25];
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeStringForKey:", RPOptionSenderModelID));
      id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeNumberForKey:", RPOptionStatusFlags));
      id v24 = [v23 unsignedIntegerValue];
      if (&OBJC_CLASS___CPSMetrics) {
        +[CPSMetrics sendProviderDeviceUsageEvent:](&OBJC_CLASS___CPSMetrics, "sendProviderDeviceUsageEvent:", v22, v24);
      }
      else {

      }
      id v26 = objc_alloc(&OBJC_CLASS___CPSStorePurchaseResponse);
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CDStorePurchaseDidFinishAuthRequest purchaseResult](v11, "purchaseResult"));
      id v25 = [v26 initWithPurchaseResult:v27];

      [a1 _notifySessionFinished:v25];
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    [a1 _invalidated];

    os_activity_scope_leave(&v28);
  }
}

void sub_100011374( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void *sub_100011444(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)a1[16];
    id v7 = a2;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_altDSID"));
    id v9 = (void *)v8;
    uint64_t v10 = 0LL;
    if (v5 && v8)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@+%@", v8, v5));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
      if (v12)
      {
        uint64_t v13 = malloc(0x40uLL);
        uint64_t v14 = kCryptoHashDescriptor_SHA512;
        id v15 = v12;
        CryptoHashOneShot(v14, [v15 bytes], objc_msgSend(v15, "length"), v13);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v13,  64LL,  1LL));
      }

      else
      {
        uint64_t v10 = 0LL;
      }
    }

    a1 = [v10 isEqualToData:v7];
  }

  return a1;
}

void sub_1000116DC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] dispatchQueue]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000117C0;
  v10[3] = &unk_100030CF0;
  id v11 = v6;
  id v14 = a1[6];
  id v12 = v5;
  id v13 = a1[5];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void sub_1000117C0(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = cps_session_log(a1);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001F4BC(v2, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Got legacy purchase request: %@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v8 = cps_session_log([*(id *)(a1 + 48) setPurchaseRequest:*(void *)(a1 + 40)]);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending get auth info response: %@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) makeRapportDictionary]);
    (*(void (**)(uint64_t, void *, void, void))(v11 + 16))(v11, v12, 0LL, 0LL);
  }

_BYTE *sub_100011A88(uint64_t a1)
{
  uint64_t result = *(_BYTE **)(a1 + 32);
  if (!result[21]) {
    return [result _activated];
  }
  return result;
}

id sub_100011B24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100011D1C(id a1, int a2)
{
  uint64_t v2 = cps_service_listener_log(a1, *(void *)&a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System language changed. Exiting.", v4, 2u);
  }

  xpc_transaction_exit_clean();
}

id sub_100011E6C(uint64_t a1)
{
  return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"listener"];
}

id sub_100012054(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

void sub_1000120C4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000128B8(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (v2[41])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = NSErrorF(NSOSStatusErrorDomain, 4294960575LL, "Session already activated.");
LABEL_5:
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

    return;
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (v2[42])
  {
    uint64_t v4 = NSErrorF(NSOSStatusErrorDomain, 4294896148LL, "Session already invalidated.");
    goto LABEL_5;
  }

  sub_100012964(v2, *(void **)(a1 + 40));
}

void sub_100012964(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_100012A48((uint64_t)a1);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100012AEC;
    v4[3] = &unk_100030D80;
    v4[4] = a1;
    id v5 = v3;
    [a1 _prepareForActivationWithCompletionHandler:v4];
  }
}

id sub_100012A40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100012A48(uint64_t a1)
{
  if (a1)
  {
    if (!*(void *)(a1 + 32))
    {
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100013A54;
      v5[3] = &unk_100030DD0;
      v5[4] = a1;
      uint64_t v3 = objc_claimAutoreleasedReturnValue( [v2 addObserverForName:@"CDAppleTVSystemMonitorAttentionStateChangedNotification" object:0 queue:0 usingBlock:v5]);
      uint64_t v4 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v3;
    }
  }

void sub_100012AEC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) _invalidated];
  }

  else
  {
    [*(id *)(a1 + 32) _sessionActivated];
    [*(id *)(a1 + 32) _presentViewService];
    sub_100012B4C(*(void *)(a1 + 32), *(void **)(a1 + 40));
    sub_100012D08(*(id *)(a1 + 32));
    sub_100012D54(*(id **)(a1 + 32));
  }

void sub_100012B4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [(id)a1 _requireOwnerDevice];
    id v5 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    id v6 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v5;

    [*(id *)(a1 + 16) setDispatchQueue:*(void *)(a1 + 72)];
    [(id)a1 _configureRapportClient:*(void *)(a1 + 16)];
    uint64_t v7 = *(void **)(a1 + 16);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100012F2C;
    v17[3] = &unk_100030898;
    v17[4] = a1;
    objc_msgSend( v7,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.GetNotifInfo",  0,  v4,  v17);
    uint64_t v8 = *(void **)(a1 + 16);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000132E4;
    v16[3] = &unk_100030DA8;
    void v16[4] = a1;
    objc_msgSend( v8,  "cad_registerEventID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.DidTapNotif",  0,  v4,  v16);
    id v9 = *(void **)(a1 + 16);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000134DC;
    v15[3] = &unk_100030898;
    v15[4] = a1;
    objc_msgSend( v9,  "cad_registerRequestID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.GetAuthType",  0,  v4,  v15);
    uint64_t v10 = *(void **)(a1 + 16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000136FC;
    v14[3] = &unk_100030DA8;
    v14[4] = a1;
    objc_msgSend( v10,  "cad_registerEventID:options:requireOwnerDevice:handler:",  @"com.apple.CompanionAuthentication.DidStartAuth",  0,  v4,  v14);
    uint64_t v11 = *(void **)(a1 + 16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000138C8;
    v12[3] = &unk_100030D80;
    v12[4] = a1;
    id v13 = v3;
    [v11 activateWithCompletion:v12];
  }
}

id sub_100012D08(id result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = objc_alloc_init(&OBJC_CLASS___CDIDSService);
    id v3 = (void *)*((void *)v1 + 6);
    *((void *)v1 + 6) = v2;

    [*((id *)v1 + 6) setDispatchQueue:*((void *)v1 + 9)];
    return [*((id *)v1 + 6) activate];
  }

  return result;
}

void sub_100012D54(id *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _idsMessageRecipientUsernames]);
    if ([v2 count])
    {
      [a1[6] sendMessage:0 toUsernames:v2];
    }

    else
    {
      uint64_t v3 = cps_session_log(0LL);
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10001F59C(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

void sub_100012EB8(id *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _idsMessageRecipientUsernames]);
    if ([v2 count])
    {
      [a1[6] sendMessage:1 toUsernames:v2];
    }

    else
    {
      uint64_t v3 = cps_session_log(0LL);
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10001F59C(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

void sub_100012F2C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100012F34(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "auth session/handle get notif info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v36);
    uint64_t v11 = (CDGetInfoRequest *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:RPOptionSenderIDSDeviceID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _notifyDeviceIDSIdentifier]);
    id v13 = v12;
    if (v12 && v11 && ([v12 isEqualToString:v11] & 1) == 0)
    {
      uint64_t v33 = NSErrorF(CPSErrorDomain, 4294960582LL, "Get notif info request not handled.");
      uint64_t v14 = (CDGetInfoRequest *)objc_claimAutoreleasedReturnValue(v33);
      uint64_t v34 = cps_session_log(v14);
      os_activity_scope_state_s v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Rejecting get notif info request from device with IDS ID %@",  buf,  0xCu);
      }

      (*((void (**)(id, void, void, CDGetInfoRequest *))v9 + 2))(v9, 0LL, 0LL, v14);
    }

    else
    {
      uint64_t v14 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
      uint64_t v15 = cps_session_log(v14);
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received get notif info request: %@",  buf,  0xCu);
      }

      id v17 = (CDGetInfoRequest *)objc_claimAutoreleasedReturnValue([a1 _responseForGetNotifInfoRequest:v14]);
      if (v17)
      {
        uint64_t v18 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
        -[CDGetInfoRequest setDeviceClass:](v17, "setDeviceClass:", v18);

        id v19 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
        -[CDGetInfoRequest setDeviceName:](v17, "setDeviceName:", v19);

        uint64_t v21 = cps_session_log(v20);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Sending get notif info response: %@",  buf,  0xCu);
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetInfoRequest makeRapportDictionary](v17, "makeRapportDictionary"));
        (*((void (**)(id, void *, void, void))v9 + 2))(v9, v23, 0LL, 0LL);
      }

      else
      {
        uint64_t v24 = NSErrorF(CPSErrorDomain, 4294960582LL, "Get notif info request not handled.");
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v24);
        uint64_t v25 = cps_session_log(v23);
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_10001F5D0((uint64_t)v23, v26, v27, v28, v29, v30, v31, v32);
        }

        (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v23);
      }
    }

    os_activity_scope_leave(&v36);
  }
}

void sub_1000132A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000132E4(uint64_t a1, void *a2, void *a3)
{
}

void sub_1000132EC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create( (void *)&_mh_execute_header,  "auth session/handle did tap notif event",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &v16);
    id v8 = -[CDDeviceUpdateEvent initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDDeviceUpdateEvent),  "initWithRapportDictionary:",  v5);
    uint64_t v9 = cps_session_log(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received did tap notif event: %@", buf, 0xCu);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceModel](v8, "deviceModel"));
    BOOL v12 = GestaltProductTypeStringToDeviceClass() == 6;

    if (!v12) {
      [a1 _stopAdvertisingNearbyAction];
    }
    id v13 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    -[CPSDevice setFlags:](v13, "setFlags:", -[CDDeviceUpdateEvent deviceFlags](v8, "deviceFlags"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceModel](v8, "deviceModel"));
    -[CPSDevice setModel:](v13, "setModel:", v14);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceName](v8, "deviceName"));
    -[CPSDevice setName:](v13, "setName:", v15);

    [a1 _notifyDeviceAcceptedNotification:v13];
    os_activity_scope_leave(&v16);
  }
}

void sub_1000134B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000134DC(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000134E4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = _os_activity_create( (void *)&_mh_execute_header,  "auth session/handle get auth type request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v20);
    uint64_t v12 = cps_session_log(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received get auth type request.", buf, 2u);
    }

    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___CDGetAuthTypeResponse);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    id v16 = [v15 authType];

    -[CDGetAuthTypeResponse setAuthType:](v14, "setAuthType:", v16);
    -[CDGetAuthTypeResponse setSandboxPurchase:](v14, "setSandboxPurchase:", [a1 _isSandboxPurchase]);
    uint64_t v17 = cps_session_log(-[CDGetAuthTypeResponse setAuthFlags:](v14, "setAuthFlags:", [a1 _authFlags]));
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Sending get auth type response: %@",  buf,  0xCu);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDGetAuthTypeResponse makeRapportDictionary](v14, "makeRapportDictionary"));
    (*((void (**)(id, void *, void, void))v9 + 2))(v9, v19, 0LL, 0LL);

    os_activity_scope_leave(&v20);
  }
}

void sub_1000136D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000136FC(uint64_t a1, void *a2, void *a3)
{
}

void sub_100013704(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = _os_activity_create( (void *)&_mh_execute_header,  "auth session/handle did start auth event",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &v14);
    id v8 = -[CDDeviceUpdateEvent initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDDeviceUpdateEvent),  "initWithRapportDictionary:",  v5);
    uint64_t v9 = cps_session_log(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received did start auth event: %@",  buf,  0xCu);
    }

    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    -[CPSDevice setFlags:](v11, "setFlags:", -[CDDeviceUpdateEvent deviceFlags](v8, "deviceFlags"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceModel](v8, "deviceModel"));
    -[CPSDevice setModel:](v11, "setModel:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDDeviceUpdateEvent deviceName](v8, "deviceName"));
    -[CPSDevice setName:](v11, "setName:", v13);

    [a1 _notifyDeviceStartedAuthentication:v11];
    os_activity_scope_leave(&v14);
  }
}

void sub_1000138A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000138C8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) _invalidated];
  }

  else
  {
    sub_100013908(*(void *)(a1 + 32), *(void **)(a1 + 40));
  }

void sub_100013908(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SFService);
    id v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v4;

    [*(id *)(a1 + 24) setDispatchQueue:*(void *)(a1 + 72)];
    objc_msgSend(*(id *)(a1 + 24), "setDeviceActionType:", objc_msgSend((id)a1, "_deviceActionType"));
    id v6 = *(void **)(a1 + 24);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    [v6 setIdentifier:v8];

    [*(id *)(a1 + 24) setAdvertiseRate:50];
    uint64_t v9 = *(void **)(a1 + 24);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100013A18;
    v10[3] = &unk_100030D80;
    void v10[4] = a1;
    id v11 = v3;
    [v9 activateWithCompletion:v10];
  }
}

id sub_100013A18(uint64_t a1, uint64_t a2)
{
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  if (!a2) {
    return (id)v3();
  }
  v3();
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100013A54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013AAC;
  block[3] = &unk_100030910;
  block[4] = v1;
  dispatch_async(v2, block);
}

void sub_100013AAC(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 42LL))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDAppleTVSystemMonitor sharedInstance](&OBJC_CLASS___CDAppleTVSystemMonitor, "sharedInstance"));
    id v3 = [v2 attentionState];

    if (v3 != (id)1)
    {
      if (v3 == (id)2)
      {
        id v5 = @"ScreenSaver";
      }

      else if (v3 == (id)3)
      {
        id v5 = @"Asleep";
      }

      else
      {
        uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(unknown: %ld)", v3));
        id v5 = (__CFString *)v4;
      }

      uint64_t v6 = cps_session_log(v4);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10001F634((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
      }

      os_activity_scope_state_s v14 = *(void **)(a1 + 32);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"System attention state changed: %@",  v5));
      uint64_t v16 = CPSErrorMake(-6709LL, v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      [v14 _notifySessionFailed:v17];

      [*(id *)(a1 + 32) _invalidated];
    }
  }

uint64_t start(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = cps_daemon_log(a1, a2);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The companion daemon is starting.", v17, 2u);
  }

  uint64_t v4 = objc_autoreleasePoolPush();
  uint64_t v5 = _set_user_dir_suffix("com.apple.companiond");
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = cps_daemon_log(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10001F6FC(v8);
    }
  }

  +[AMSEphemeralDefaults setPreferEphemeralURLSessions:]( &OBJC_CLASS___AMSEphemeralDefaults,  "setPreferEphemeralURLSessions:",  1LL);
  +[AMSEphemeralDefaults setSuppressEngagement:](&OBJC_CLASS___AMSEphemeralDefaults, "setSuppressEngagement:", 1LL);
  if (MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 7)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    id v10 = +[CDAppleTVSystemMonitor sharedInstance](&OBJC_CLASS___CDAppleTVSystemMonitor, "sharedInstance");
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___CDRequesterDaemon);
  }

  dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.companiond.main", v12);
  -[CDRequesterDaemon setDispatchQueue:](v9, "setDispatchQueue:", v13);
  -[CDRequesterDaemon activate](v9, "activate");
  id v14 = objc_alloc_init(&OBJC_CLASS___DTDaemonShim);
  [v14 activate];

  objc_autoreleasePoolPop(v4);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v15 run];

  return 0LL;
}

void sub_1000144A8(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_1000144B0(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "legacy app sign in session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &state);
    dispatch_queue_attr_t v11 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log(v11);
    dispatch_queue_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    [a1 _stopAdvertisingNearbyAction];
    sub_100016F7C(a1, v11, v8);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100017344;
    v35[3] = &unk_100030F00;
    id v36 = v9;
    id v14 = objc_retainBlock(v35);
    id v15 = [a1[16] copy];
    uint64_t v16 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
    [v15 setDeviceName:v16];

    uint64_t v17 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    [v15 setDeviceClass:v17];

    [v15 setIsRapportLogin:1];
    [v15 setAuthKitAccount:0];
    uint64_t v28 = v11;
    uint64_t v18 = v10;
    id v19 = v9;
    id v20 = v8;
    id v21 = v7;
    uint64_t v22 = dispatch_group_create();
    dispatch_group_enter(v22);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100017448;
    v32[3] = &unk_100030ED8;
    id v23 = v15;
    id v33 = v23;
    uint64_t v24 = v22;
    uint64_t v34 = v24;
    sub_100016A58((uint64_t)a1, v32);
    uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 dispatchQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001749C;
    block[3] = &unk_100030F28;
    id v30 = v23;
    id v31 = v14;
    id v26 = v23;
    uint64_t v27 = v14;
    dispatch_group_notify(v24, v25, block);

    id v7 = v21;
    id v8 = v20;
    id v9 = v19;

    os_activity_scope_leave(&state);
  }
}

void sub_1000147D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, os_activity_scope_state_s state)
{
}

void sub_1000147FC(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100014804(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "legacy app sign in session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &v22);
    dispatch_queue_attr_t v11 = -[CDLegacyAppSignInDidFinishAuthRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDLegacyAppSignInDidFinishAuthRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log(v11);
    dispatch_queue_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDLegacyAppSignInDidFinishAuthRequest authorization](v11, "authorization"));
    BOOL v15 = v14 == 0LL;

    if (v15)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDLegacyAppSignInDidFinishAuthRequest error](v11, "error"));
      id v21 = sub_100017078(a1, v20);
      id v19 = (id)objc_claimAutoreleasedReturnValue(v21);

      +[CDAppSignInUtilities sendSessionCompletedMetricsWithError:]( &OBJC_CLASS___CDAppSignInUtilities,  "sendSessionCompletedMetricsWithError:",  v19);
      sub_100016CE0((uint64_t)a1, v19);
    }

    else
    {
      sub_100017168((uint64_t)&OBJC_CLASS___CDRequesterAppSignInSession, 5LL, v8);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDLegacyAppSignInDidFinishAuthRequest authorization](v11, "authorization"));
      sub_100016AC4((uint64_t)a1, v16);

      id v17 = objc_alloc(&OBJC_CLASS___CPSAppSignInResponse);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDLegacyAppSignInDidFinishAuthRequest authorization](v11, "authorization"));
      id v19 = [v17 initWithAppleIDAuthorization:v18];

      sub_100016E30((uint64_t)a1, v19);
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    os_activity_scope_leave(&v22);
  }
}

void sub_100014A34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100014A5C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100014A64(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v36 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = _os_activity_create( (void *)&_mh_execute_header,  "app sign in session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v9, &state);
    id v10 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v11 = cps_session_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received get auth info request: %@",  buf,  0xCu);
    }

    dispatch_queue_t v13 = objc_alloc_init(&OBJC_CLASS___CDAppSignInGetAuthInfoResponse);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) applicationIdentifier]);
    -[CDAppSignInGetAuthInfoResponse setAppIdentifier:](v13, "setAppIdentifier:", v14);

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) bundleIdentifier]);
    -[CDAppSignInGetAuthInfoResponse setAppBundleIdentifier:](v13, "setAppBundleIdentifier:", v15);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) teamIdentifier]);
    -[CDAppSignInGetAuthInfoResponse setAppTeamIdentifier:](v13, "setAppTeamIdentifier:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) localizedName]);
    -[CDAppSignInGetAuthInfoResponse setAppName:](v13, "setAppName:", v17);

    uint64_t v18 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    -[CDAppSignInGetAuthInfoResponse setDeviceClass:](v13, "setDeviceClass:", v18);

    id v19 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
    -[CDAppSignInGetAuthInfoResponse setDeviceName:](v13, "setDeviceName:", v19);

    -[CDAppSignInGetAuthInfoResponse setAppDomains:](v13, "setAppDomains:", *(void *)(a1 + 144));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 request]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 webRequest]);

    if (v21)
    {
      uint64_t v22 = cps_session_log(-[CDAppSignInGetAuthInfoResponse setWebRequest:](v13, "setWebRequest:", v21));
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Sending get auth info response: %@",  buf,  0xCu);
      }

      uint64_t v24 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CDAppSignInGetAuthInfoResponse makeRapportDictionary](v13, "makeRapportDictionary"));
      (*((void (**)(id, dispatch_group_s *, void, void))v8 + 2))(v8, v24, 0LL, 0LL);
    }

    else
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 request]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 appleIDRequest]);
      -[CDAppSignInGetAuthInfoResponse setAppleIDRequest:](v13, "setAppleIDRequest:", v26);

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 request]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 passwordRequest]);
      -[CDAppSignInGetAuthInfoResponse setPasswordRequest:](v13, "setPasswordRequest:", v28);

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 request]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 platformKeyCredentialAssertionOptions]);
      -[CDAppSignInGetAuthInfoResponse setPlatformKeyCredentialAssertionOptions:]( v13,  "setPlatformKeyCredentialAssertionOptions:",  v30);

      id v31 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 request]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 platformKeyCredentialRegistrationOptions]);
      -[CDAppSignInGetAuthInfoResponse setPlatformKeyCredentialRegistrationOptions:]( v13,  "setPlatformKeyCredentialRegistrationOptions:",  v32);

      id v33 = dispatch_group_create();
      dispatch_group_enter(v33);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_100017220;
      v40[3] = &unk_100030ED8;
      uint64_t v34 = v13;
      id v41 = v34;
      uint64_t v24 = v33;
      v42 = v24;
      sub_100016A58(a1, v40);
      os_activity_scope_state_s v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100017274;
      block[3] = &unk_100030AC0;
      id v38 = v34;
      id v39 = v8;
      dispatch_group_notify(v24, v35, block);
    }

    os_activity_scope_leave(&state);
  }
}

void sub_100014F0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, os_activity_scope_state_s state)
{
}

void sub_100014F3C(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_100014F44(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "app sign in session/handle did finish auth request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &state);
    uint64_t v11 = -[CDAppSignInDidFinishAuthRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDAppSignInDidFinishAuthRequest),  "initWithRapportDictionary:",  v7);
    uint64_t v12 = cps_session_log(v11);
    dispatch_queue_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received did finish auth request: %@",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 webRequest]);
    BOOL v16 = v15 == 0LL;

    if (v16)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppSignInDidFinishAuthRequest appleIDAuthorization](v11, "appleIDAuthorization"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppSignInDidFinishAuthRequest passwordCredential](v11, "passwordCredential"));
      v44 = (void *)objc_claimAutoreleasedReturnValue( -[CDAppSignInDidFinishAuthRequest platformKeyCredentialAssertion]( v11,  "platformKeyCredentialAssertion"));
      v43 = (void *)objc_claimAutoreleasedReturnValue( -[CDAppSignInDidFinishAuthRequest platformKeyCredentialRegistration]( v11,  "platformKeyCredentialRegistration"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 appleIDRequest]);
      if (v25) {
        BOOL v26 = v22 == 0LL;
      }
      else {
        BOOL v26 = 1;
      }
      int v27 = !v26;

      if (v27)
      {
        sub_100017168((uint64_t)&OBJC_CLASS___CDRequesterAppSignInSession, 5LL, v8);
        sub_100016AC4((uint64_t)a1, v22);
        id v28 = [[CPSAppSignInResponse alloc] initWithAppleIDAuthorization:v22];
        sub_100016E30((uint64_t)a1, v28);
      }

      else
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 passwordRequest]);
        if (v30) {
          BOOL v31 = v23 == 0LL;
        }
        else {
          BOOL v31 = 1;
        }
        int v32 = !v31;

        if (v32)
        {
          sub_100017168((uint64_t)&OBJC_CLASS___CDRequesterAppSignInSession, 6LL, v8);
          id v28 = [[CPSAppSignInResponse alloc] initWithPasswordCredential:v23];
          sub_100016E30((uint64_t)a1, v28);
        }

        else
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 platformKeyCredentialAssertionOptions]);
          if (v34) {
            BOOL v35 = v44 == 0LL;
          }
          else {
            BOOL v35 = 1;
          }
          int v36 = !v35;

          if (v36)
          {
            sub_100017168((uint64_t)&OBJC_CLASS___CDRequesterAppSignInSession, 11LL, v8);
            id v28 = [[CPSAppSignInResponse alloc] initWithPlatformKeyCredentialAssertion:v44];
            sub_100016E30((uint64_t)a1, v28);
          }

          else
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
            id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 platformKeyCredentialRegistrationOptions]);
            if (v38) {
              BOOL v39 = v43 == 0LL;
            }
            else {
              BOOL v39 = 1;
            }
            int v40 = !v39;

            if (v40)
            {
              sub_100017168((uint64_t)&OBJC_CLASS___CDRequesterAppSignInSession, 12LL, v8);
              id v28 = [[CPSAppSignInResponse alloc] initWithPlatformKeyCredentialRegistration:v43];
              sub_100016E30((uint64_t)a1, v28);
            }

            else
            {
              id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppSignInDidFinishAuthRequest error](v11, "error"));
              id v42 = sub_100017078(a1, v41);
              id v28 = (id)objc_claimAutoreleasedReturnValue(v42);

              +[CDAppSignInUtilities sendSessionCompletedMetricsWithError:]( &OBJC_CLASS___CDAppSignInUtilities,  "sendSessionCompletedMetricsWithError:",  v28);
              sub_100016CE0((uint64_t)a1, v28);
            }
          }
        }
      }

      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppSignInDidFinishAuthRequest webCallbackURL](v11, "webCallbackURL"));
      BOOL v18 = v17 == 0LL;

      if (v18)
      {
        id v21 = (id)objc_claimAutoreleasedReturnValue(-[CDAppSignInDidFinishAuthRequest error](v11, "error"));
        +[CDAppSignInUtilities sendSessionCompletedMetricsWithError:]( &OBJC_CLASS___CDAppSignInUtilities,  "sendSessionCompletedMetricsWithError:",  v21);
        sub_100016CE0((uint64_t)a1, v21);
      }

      else
      {
        sub_100017168((uint64_t)&OBJC_CLASS___CDRequesterAppSignInSession, 10LL, v8);
        id v19 = objc_alloc(&OBJC_CLASS___CPSAppSignInResponse);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDAppSignInDidFinishAuthRequest webCallbackURL](v11, "webCallbackURL"));
        id v21 = [v19 initWithWebCallbackURL:v20];

        sub_100016E30((uint64_t)a1, v21);
      }

      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    }

    os_activity_scope_leave(&state);
  }
}

void sub_1000153F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_1000156A8(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(void *)(*(void *)(a1 + 32) + 152LL))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSError);
    id v7 = v14;
    id v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        id v9 = v8;
      }
      else {
        id v9 = 0LL;
      }
    }

    else
    {
      id v9 = 0LL;
    }

    id v10 = v9;

    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v5;
    }
    id v12 = v11;

    if (!v12)
    {
      uint64_t v13 = NSErrorF(CPSErrorDomain, 4294960560LL, "View service dismissed unexpectedly.");
      id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    }

    +[CDAppSignInUtilities sendSessionCompletedMetricsWithError:]( &OBJC_CLASS___CDAppSignInUtilities,  "sendSessionCompletedMetricsWithError:",  v12);
    [*(id *)(a1 + 32) _notifySessionFailed:v12];
    [*(id *)(a1 + 32) _invalidated];
  }
}

void sub_100015A4C(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (sub_100015DE4((uint64_t)a1))
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[15] applicationIdentifier]);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100015E78;
      v5[3] = &unk_100030DF8;
      v5[4] = a1;
      id v6 = v3;
      +[CDAppSignInUtilities approvedWebCredentialsDomainsForApplicationIdentifier:completionHandler:]( &OBJC_CLASS___CDAppSignInUtilities,  "approvedWebCredentialsDomainsForApplicationIdentifier:completionHandler:",  v4,  v5);
    }

    else
    {
      sub_100015E84(a1, 0LL, v3);
    }
  }
}

uint64_t sub_100015DE4(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([(id)result request]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 passwordRequest]);

    if (v3) {
      return 1LL;
    }
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 request]);
    uint64_t v5 = [v4 isPasskeyRequest];

    if ((v5 & 1) != 0)
    {
      return 1LL;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v1 request]);
      id v7 = [v6 isWebAuthRequest];

      return (uint64_t)v7;
    }
  }

  return result;
}

void sub_100015E78(uint64_t a1, void *a2)
{
}

void sub_100015E84(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = dispatch_group_create();
    v37[0] = 0LL;
    v37[1] = v37;
    v37[2] = 0x2810000000LL;
    v37[3] = &unk_10002DBBB;
    int v38 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000161C8;
    v34[3] = &unk_100030E20;
    int v36 = v37;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v35 = v8;
    id v9 = objc_retainBlock(v34);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appleIDRequest]);

    if (v11)
    {
      dispatch_group_enter(v7);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100016224;
      v31[3] = &unk_100030D80;
      id v33 = v9;
      int v32 = v7;
      sub_10001629C(a1, v31);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 passwordRequest]);

    if (v13)
    {
      dispatch_group_enter(v7);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100016508;
      v28[3] = &unk_100030D80;
      id v30 = v9;
      uint64_t v29 = v7;
      sub_100016580(a1, v28);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
    unsigned int v15 = [v14 isPasskeyRequest];

    if (v15)
    {
      dispatch_group_enter(v7);
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([a1[15] applicationIdentifier]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000166BC;
      v25[3] = &unk_100030D80;
      int v27 = v9;
      BOOL v26 = v7;
      +[CDAppSignInUtilities preparePasskeyRequestsWithRequest:applicationIdentifier:approvedWebCredentialsDomains:completionHandler:]( &OBJC_CLASS___CDAppSignInUtilities,  "preparePasskeyRequestsWithRequest:applicationIdentifier:approvedWebCredentialsDomains:completionHandler:",  v16,  v17,  v5,  v25);
    }

    BOOL v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 dispatchQueue]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100016734;
    v20[3] = &unk_100030CF0;
    id v21 = v8;
    id v24 = v6;
    uint64_t v22 = a1;
    id v23 = v5;
    id v19 = v8;
    dispatch_group_notify(v7, v18, v20);

    _Block_object_dispose(v37, 8);
  }
}

void sub_1000161B0(_Unwind_Exception *a1)
{
}

void sub_1000161C8(uint64_t a1, void *a2)
{
  id v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  [*(id *)(a1 + 32) addObject:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL));
}

void sub_100016224(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = cps_session_log(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001F7A0();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001629C(id *a1, void *a2)
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_4;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appleIDRequest]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryAuthKitAccount]);

    id v8 = objc_alloc_init(&OBJC_CLASS___CDCredentialRequestBuilder);
    -[CDCredentialRequestBuilder setAuthKitAccount:](v8, "setAuthKitAccount:", v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[15] bundleIdentifier]);
    -[CDCredentialRequestBuilder setAppBundleIdentifier:](v8, "setAppBundleIdentifier:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1[15] teamIdentifier]);
    -[CDCredentialRequestBuilder setAppTeamIdentifier:](v8, "setAppTeamIdentifier:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1[15] applicationIdentifier]);
    -[CDCredentialRequestBuilder setAppIdentifier:](v8, "setAppIdentifier:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1[15] localizedName]);
    -[CDCredentialRequestBuilder setAppName:](v8, "setAppName:", v12);

    -[CDCredentialRequestBuilder setBaseAppleIDRequest:](v8, "setBaseAppleIDRequest:", v5);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDCredentialRequestBuilder credentialRequest](v8, "credentialRequest"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1[15] bundleIdentifier]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000168D4;
    v18[3] = &unk_100030E48;
    v18[4] = a1;
    id v19 = v8;
    id v20 = v13;
    id v21 = v3;
    id v15 = v13;
    BOOL v16 = v8;
    +[CDAppSignInUtilities canPerformAuthKitRequest:withAuthKitAccount:clientBundleIdentifier:completionHandler:]( &OBJC_CLASS___CDAppSignInUtilities,  "canPerformAuthKitRequest:withAuthKitAccount:clientBundleIdentifier:completionHandler:",  v15,  v7,  v14,  v18);

LABEL_4:
    return;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"appleIDRequest"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001F800("_prepareAppleIDRequestWithCompletionHandler:");
  }
  _bs_set_crash_log_message([v17 UTF8String]);
  __break(0);
}

void sub_100016508(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = cps_session_log(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001F8AC();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100016580(id *a1, void *a2)
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_4;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 request]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 passwordRequest]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1[15] applicationIdentifier]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100016938;
    v8[3] = &unk_100030E70;
    id v9 = v3;
    +[CDAppSignInUtilities allWebCredentialsDomainsForApplicationIdentifier:completionHandler:]( &OBJC_CLASS___CDAppSignInUtilities,  "allWebCredentialsDomainsForApplicationIdentifier:completionHandler:",  v6,  v8);

LABEL_4:
    return;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[[self request] passwordRequest]"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001F90C("_preparePasswordRequestWithCompletionHandler:");
  }
  _bs_set_crash_log_message([v7 UTF8String]);
  __break(0);
}

void sub_1000166BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = cps_session_log(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001F9B8();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100016734(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) count];
  if (v3)
  {
    uint64_t v4 = cps_session_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001FA18(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = CPSErrorDomain;
    v21[0] = @"Failed to prepare authorization requests";
    v20[0] = NSLocalizedDescriptionKey;
    v20[1] = NSMultipleUnderlyingErrorsKey;
    id v14 = [*(id *)(a1 + 32) copy];
    v21[1] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  205LL,  v15));
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v16);
  }

  else
  {
    id v17 = [*(id *)(a1 + 48) copy];
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = *(void **)(v18 + 144);
    *(void *)(v18 + 144) = v17;

    (*(void (**)(void, void))(*(void *)(a1 + 56) + 16LL))(*(void *)(a1 + 56), 0LL);
  }

uint64_t sub_1000168D4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL);
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128LL), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 136LL), *(id *)(a1 + 48));
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL);
  }

  return v3();
}

void sub_100016938(uint64_t a1, void *a2)
{
  id v3 = [a2 count];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);
  }

  else
  {
    uint64_t v5 = CPSErrorDomain;
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    uint64_t v9 = @"Missing associated web credentials domains";
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  205LL,  v6));
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }

void sub_100016A58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 152);
    id v5 = v3;
    if (!v4)
    {
      (*((void (**)(id, void, void))v3 + 2))(v3, 0LL, 0LL);
      uint64_t v4 = *(void **)(a1 + 152);
    }

    [v4 fetchAppIconWithReplyHandler:v5];
    id v3 = v5;
  }
}

void sub_100016AC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (!*(void *)(a1 + 136))
    {
      NSErrorUserInfoKey v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_localCredentialRequest != nil"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10001FA80("_saveAuthorization:");
      }
      _bs_set_crash_log_message([v8 UTF8String]);
      __break(0);
      JUMPOUT(0x100016C38LL);
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationController);
    uint64_t v5 = cps_session_log(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 136);
      *(_DWORD *)buf = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Saving authorization (%@) for credential request (%@).",  buf,  0x16u);
    }

    [v4 storeAuthorization:v3 forProxiedRequest:*(void *)(a1 + 136) completion:&stru_100030EB0];
  }
}

void sub_100016C40(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  uint64_t v5 = cps_session_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)NSErrorUserInfoKey v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Save authorization finished.", v8, 2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10001FB2C();
  }
}

void sub_100016CE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 160))
  {
    [*(id *)(a1 + 152) sessionFailed:v3];
    id v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterAppSignInSession.sessionFailedTimer");
    uint64_t v5 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v4;

    uint64_t v6 = *(void **)(a1 + 160);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100016DE0;
    v8[3] = &unk_1000308E8;
    void v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_100016DE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFailed:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100016E30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 160))
  {
    [*(id *)(a1 + 152) sessionFinished];
    id v4 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRequesterAppSignInSession.sessionFinishedTimer");
    uint64_t v5 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v4;

    uint64_t v6 = *(void **)(a1 + 160);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100016F2C;
    v8[3] = &unk_1000308E8;
    void v8[4] = a1;
    id v9 = v3;
    [v6 scheduleWithFireInterval:v7 leewayInterval:v8 queue:2.25 handler:0.1];
  }
}

id sub_100016F2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0LL;

  [*(id *)(a1 + 32) _notifySessionFinished:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_100016F7C(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
    -[CPSDevice setFlags:](v6, "setFlags:", [v10 deviceFlags]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceModel]);
    if (v7)
    {
      -[CPSDevice setModel:](v6, "setModel:", v7);
    }

    else
    {
      NSErrorUserInfoKey v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeStringForKey:", RPOptionSenderModelID));
      -[CPSDevice setModel:](v6, "setModel:", v8);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceName]);
    -[CPSDevice setName:](v6, "setName:", v9);

    [a1 _notifyDeviceAcceptedNotification:v6];
  }
}

id sub_100017078(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v5 isEqualToString:ASCAuthorizationErrorDomain]
      && [v4 code] == (id)2)
    {

LABEL_7:
      uint64_t v8 = NSErrorNestedF(CPSErrorDomain, 104LL, v4, "User canceled authorization");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
LABEL_10:
      a1 = v9;
      goto LABEL_11;
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if ([v6 isEqualToString:AKAppleIDAuthenticationErrorDomain])
    {
      id v7 = [v4 code];

      if (v7 == (id)-7003LL) {
        goto LABEL_7;
      }
    }

    else
    {
    }

    id v9 = v4;
    goto LABEL_10;
  }

void sub_100017168(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_opt_self(a1);
  +[CPSMetrics sendAppSignInSessionCompletedEvent:](&OBJC_CLASS___CPSMetrics, "sendAppSignInSessionCompletedEvent:", a2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeStringForKey:", RPOptionSenderModelID));
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeNumberForKey:", RPOptionStatusFlags));

  id v7 = [v8 unsignedIntegerValue];
  if (&OBJC_CLASS___CPSMetrics) {
    +[CPSMetrics sendProviderDeviceUsageEvent:](&OBJC_CLASS___CPSMetrics, "sendProviderDeviceUsageEvent:", v6, v7);
  }
  else {
}
  }

void sub_100017220(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setAppIconData:a2];
  [*(id *)(a1 + 32) setAppIconScale:v6];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100017274(uint64_t a1)
{
  uint64_t v2 = cps_session_log(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Sending get auth info response: %@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) makeRapportDictionary]);
  (*(void (**)(uint64_t, void *, void, void))(v5 + 16))(v5, v6, 0LL, 0LL);
}

void sub_100017344(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CDLegacyAppSignInGetAuthInfoResponse);
  -[CDLegacyAppSignInGetAuthInfoResponse setCredentialRequest:](v4, "setCredentialRequest:", v3);

  uint64_t v6 = cps_session_log(v5);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    __int16 v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Sending get auth info response: %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDLegacyAppSignInGetAuthInfoResponse makeRapportDictionary](v4, "makeRapportDictionary"));
  (*(void (**)(uint64_t, void *, void, void))(v8 + 16))(v8, v9, 0LL, 0LL);
}

void sub_100017448(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setAppIconData:a2];
  [*(id *)(a1 + 32) setAppIconScale:v6];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10001749C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) credentialRequest]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1000175BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_1000175CC()
{
  return objc_opt_class(v0);
}

  ;
}

  ;
}

void sub_1000184E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_self(a1);
  if (v6)
  {
    if ([v5 length])
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100018FC4;
      v16[3] = &unk_100030E70;
      id v17 = v6;
      +[SFSafariCredentialStore getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:completionHandler:]( &OBJC_CLASS___SFSafariCredentialStore,  "getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:completionHandler:",  v5,  v16);
    }

    else
    {
      BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7) {
        sub_10001FC38(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      (*((void (**)(id, void *))v6 + 2))(v6, &__NSArray0__struct);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completionHandler != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001FB8C("_approvedWebCredentialsDomainsForApplicationIdentifier:completionHandler:");
    }
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
  }

void sub_100018648(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_self(a1);
  if (v6)
  {
    if ([v5 length])
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
      uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001910C;
      block[3] = &unk_100030AC0;
      id v19 = v5;
      id v20 = v6;
      dispatch_async(v8, block);
    }

    else
    {
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v9) {
        sub_10001FD1C(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      (*((void (**)(id, void *))v6 + 2))(v6, &__NSArray0__struct);
    }
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completionHandler != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001FC70("_allWebCredentialsDomainsForApplicationIdentifier:completionHandler:");
    }
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
  }

void sub_1000187CC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = a2;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000192FC;
  v15[3] = &unk_100030FC8;
  id v17 = v10;
  uint64_t v18 = objc_opt_self(a1);
  id v16 = v9;
  id v13 = v10;
  id v14 = v9;
  sub_100019554(v18, v12, v11, v15);
}

void sub_1000189F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_100018A08(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = CPSCustomAuthenticationMethodOther;
  id v7 = a2;
  unsigned int v8 = [v7 isEqualToString:CPSCustomAuthenticationMethodVideoSubscriberAccount];

  if (v8) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL) |= 0x10u;
  }
  *a4 = (~*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL) & 0x1C) == 0;
}

id sub_100018EE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_self(a1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 relyingPartyIdentifier]);

  objc_msgSend(v7, "bs_safeAddObject:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 relyingPartyIdentifier]);

  objc_msgSend(v7, "bs_safeAddObject:", v9);
  if ([v7 count] == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);
    if ([v10 length]) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }
    id v12 = v11;
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

void sub_100018FC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000190C8;
  v9[3] = &unk_100030F78;
  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v10 = v8;
  [v3 enumerateObjectsUsingBlock:v9];

  if (IsAppleInternalBuild())
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringArrayForKey:@"ExtraAssociatedDomains"]);
    -[NSMutableOrderedSet addObjectsFromArray:](v8, "addObjectsFromArray:", v5);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v8, "array"));
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void sub_1000190C8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 domain]);
  [v2 addObject:v3];
}

void sub_10001910C(uint64_t a1)
{
  id v2 = [[_SWCServiceSpecifier alloc] initWithServiceType:0 applicationIdentifier:*(void *)(a1 + 32) domain:0];
  id v15 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCServiceDetails serviceDetailsWithServiceSpecifier:error:]( &OBJC_CLASS____SWCServiceDetails,  "serviceDetailsWithServiceSpecifier:error:",  v2,  &v15));
  id v4 = v15;
  if (v3)
  {
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = sub_1000192A4;
    id v13 = &unk_100030FA0;
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    id v14 = v5;
    if (IsAppleInternalBuild([v3 enumerateObjectsUsingBlock:&v10]))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults",  v10,  v11,  v12,  v13));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringArrayForKey:@"ExtraAssociatedDomains"]);
      -[NSMutableOrderedSet addObjectsFromArray:](v5, "addObjectsFromArray:", v7);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v5, "array", v10, v11, v12, v13));
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001FE00((uint64_t)v4);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_1000192A4(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a2 serviceSpecifier]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_1000192FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  unsigned int v5 = [v4 isEqualToString:AKAppleIDAuthenticationErrorDomain];

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000193D8;
    v8[3] = &unk_100030F28;
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    id v9 = v3;
    sub_1000193E8(v7, v9, v6, v8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

uint64_t sub_1000193D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000193E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  objc_opt_self(a1);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  id v11 = [v10 mutableCopy];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v14 = v13;

  [v14 setObject:v9 forKeyedSubscript:AKClientBundleIDKey];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v15,  [v7 code],  v14));

  id v17 = objc_alloc_init(&OBJC_CLASS___AKAlertHandler);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000196F4;
  v19[3] = &unk_100031018;
  id v20 = v8;
  id v18 = v8;
  [v17 showAlertForError:v16 withCompletion:v19];
}

void sub_100019554(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  objc_opt_self(a1);
  id v18 = 0LL;
  LOBYTE(a1) = +[AKAuthorizationValidator canPerformCredentialRequest:error:]( &OBJC_CLASS___AKAuthorizationValidator,  "canPerformCredentialRequest:error:",  v9,  &v18);

  id v10 = v18;
  if ((a1 & 1) != 0)
  {
    if (v7
      && (id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance")),
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 continuationTokenForAccount:v7]),
          v12,
          v11,
          !v12))
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
      [v13 setUsername:v14];

      [v13 setIsUsernameEditable:0];
      id v15 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000196E4;
      v16[3] = &unk_100030FF0;
      id v17 = v8;
      [v15 authenticateWithContext:v13 completion:v16];
    }

    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
  }

  else
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

uint64_t sub_1000196E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000196F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

_BYTE *sub_1000197CC(uint64_t a1)
{
  uint64_t result = *(_BYTE **)(a1 + 32);
  if (!result[9]) {
    return [result _activated];
  }
  return result;
}

id sub_100019838(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

id sub_1000198E0()
{
  if (qword_10003BF88 != -1) {
    dispatch_once(&qword_10003BF88, &stru_100031060);
  }
  return (id)qword_10003BF80;
}

void sub_100019A44(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)IDSCopyBestGuessIDForID(*(void *)(*((void *)&v23 + 1) + 8LL * (void)v7));
        if (v8) {
          [v2 addObject:v8];
        }

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }

    while (v5);
  }

  v35[0] = IDSSessionAlwaysSkipSelfKey;
  v35[1] = IDSSendMessageOptionFireAndForgetKey;
  v36[0] = &__kCFBooleanTrue;
  v36[1] = &__kCFBooleanTrue;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
  id v33 = @"type";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
  uint64_t v34 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));

  id v12 = *(void **)(*(void *)(a1 + 40) + 16LL);
  id v21 = 0LL;
  id v22 = 0LL;
  unsigned __int8 v13 = [v12 sendMessage:v11 toDestinations:v2 priority:300 options:v9 identifier:&v22 error:&v21];
  id v14 = v22;
  id v15 = v21;
  id v16 = sub_1000198E0();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      id v30 = v2;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Sent IDS message. {users = %@, destinations = %@, identifier=%@}",  buf,  0x20u);
    }
  }

  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    id v30 = v2;
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Error sending IDS message. {usernames = %@, destinations = %@, error = %@}",  buf,  0x20u);
  }
}

void sub_10001A020(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "CDIDSService");
  id v2 = (void *)qword_10003BF80;
  qword_10003BF80 = (uint64_t)v1;
}

id sub_10001AD0C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  id v8 = v5;
  id v9 = v6;
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v8, v9, TypeID, 0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v12)
  {
    id v23 = 0LL;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v7,  v12,  &v23));
    id v14 = v23;
    if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001FE7C((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  else
  {
    unsigned __int8 v13 = 0LL;
  }

  return v13;
}

id sub_10001AFE4(uint64_t a1)
{
  if (a1)
  {
    id v11 = 0LL;
    os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a1,  1LL,  &v11));
    id v2 = v11;
    if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001FEEC((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  else
  {
    os_log_t v1 = 0LL;
  }

  return v1;
}

_BYTE *sub_10001E348(uint64_t a1)
{
  uint64_t result = *(_BYTE **)(a1 + 32);
  if (!result[49]) {
    return [result _activated];
  }
  return result;
}

id sub_10001E3B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void sub_10001E644(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0LL;
}

id sub_10001E6E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _foundDeviceWithIdentifier:a2 discoveryType:a3];
}

void *sub_10001E77C(void *result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result[4] + 32) invalidate];
  }
  if (!a2)
  {
    uint64_t v2 = result[4];
    if (!*(void *)(v2 + 32)) {
      return [*(id *)(v2 + 24) startDiscovery];
    }
  }

  return result;
}

id sub_10001E868(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"serviceListener"];
  id v3 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"deviceDiscovery"];
  return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"currentSession"];
}

id sub_10001EC04(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFinishWithResponse:a2];
}

id sub_10001EC10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) authenticationSessionDidFailWithError:a2];
}

void sub_10001EC1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0LL;
}

void sub_10001EDF4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Device account is not in list of approvers.",  v1,  2u);
}

void sub_10001EE34(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to decode view service result: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10001EEA8(id *a1, os_log_s *a2)
{
}

void sub_10001EF28()
{
}

void sub_10001EF88(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_100009EDC((void *)&_mh_execute_header, a3, (uint64_t)a3, "Received unknown auth type: %ld", (uint8_t *)a1);
}

void sub_10001EFC4()
{
}

void sub_10001F024()
{
}

void sub_10001F084()
{
}

void sub_10001F0E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F148( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F178( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F1A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F20C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009ECC((void *)&_mh_execute_header, a2, a3, "Failed to get remote object proxy. error=%@", a5, a6, a7, a8, 2u);
  sub_100009EF4();
}

void sub_10001F270(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to load application record: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10001F2E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F34C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F3B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F3EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid account token.", v1, 2u);
}

void sub_10001F42C()
{
}

void sub_10001F458()
{
}

void sub_10001F484()
{
}

void sub_10001F4BC(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to load legacy purchase request: %@",  (uint8_t *)&v3,  0xCu);
}

void sub_10001F534( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F568( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F59C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F5D0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F634( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F698( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F6FC(os_log_s *a1)
{
  int v2 = *__error();
  int v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_FAULT,  "_set_user_dir_suffix failed. Error code: %d, Error: %s",  (uint8_t *)v5,  0x12u);
}

void sub_10001F7A0()
{
}

void sub_10001F800(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_1000175CC();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100017584();
  sub_1000175D8();
  sub_1000175E8();
  sub_1000175BC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000175AC();
}

void sub_10001F8AC()
{
}

void sub_10001F90C(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_1000175CC();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100017584();
  sub_1000175D8();
  sub_1000175E8();
  sub_1000175BC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000175AC();
}

void sub_10001F9B8()
{
}

void sub_10001FA18( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FA80(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_1000175CC();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100017584();
  sub_1000175D8();
  sub_1000175E8();
  sub_1000175BC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000175AC();
}

void sub_10001FB2C()
{
}

void sub_10001FB8C(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_1000175CC();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100017584();
  sub_1000175D8();
  sub_1000175E8();
  sub_1000175BC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000175AC();
}

void sub_10001FC38( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FC70(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_1000175CC();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100017584();
  sub_1000175D8();
  sub_1000175E8();
  sub_1000175BC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000175AC();
}

void sub_10001FD1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FD54(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_1000175CC();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100017584();
  sub_1000175D8();
  sub_1000175E8();
  sub_1000175BC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_1000175AC();
}

void sub_10001FE00(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to fetch associated domains: %@",  (uint8_t *)&v1,  0xCu);
}

void sub_10001FE7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FEEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_addPermanentObserverForProperty_notifyInitial_invokeOnMainThread_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:");
}

id objc_msgSend_appSignInViewServiceWithRequest_applicationBundleIdentifier_authKitAccount_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appSignInViewServiceWithRequest:applicationBundleIdentifier:authKitAccount:");
}

id objc_msgSend_canPerformAuthKitRequest_withAuthKitAccount_clientBundleIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformAuthKitRequest:withAuthKitAccount:clientBundleIdentifier:completionHandler:");
}

id objc_msgSend_getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:completionHandler:");
}

id objc_msgSend_preparePasskeyRequestsWithRequest_applicationIdentifier_approvedWebCredentialsDomains_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "preparePasskeyRequestsWithRequest:applicationIdentifier:approvedWebCredentialsDomains:completionHandler:");
}

id objc_msgSend_serviceConnection_serviceClient_startAuthenticationSessionWithRequest_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceConnection:serviceClient:startAuthenticationSessionWithRequest:completionHandler:");
}

id objc_msgSend_webRequest(void *a1, const char *a2, ...)
{
  return [a1 webRequest];
}