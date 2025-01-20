}

void sub_100001DFC(uint64_t a1, void *a2)
{
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "xpc_activity to show welcome notification run received",  (uint8_t *)&v14,  2u);
    }

    [*(id *)(a1 + 32) setWelcomeXPCActivityScheduleInProgress:0];
    [*(id *)(a1 + 32) registerToNotifyWelcome];
  }

  else if (!state)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "xpc activity check in state received.",  (uint8_t *)&v14,  2u);
    }

    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    v7 = v6;
    if (!v6 || xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY) <= 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getCurrentWelcomeActivityCriteria]);

      xpc_activity_set_criteria(v3, v8);
      int64_t int64 = xpc_dictionary_get_int64(v8, XPC_ACTIVITY_DELAY);
      int64_t v10 = xpc_dictionary_get_int64(v8, XPC_ACTIVITY_GRACE_PERIOD);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2048;
        int64_t v17 = int64;
        __int16 v18 = 2048;
        int64_t v19 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Schedule welcome notification with identifier %@, delay %lld, grace period %lld",  (uint8_t *)&v14,  0x20u);
      }

      v7 = v8;
    }
  }
}

void sub_10000263C(id *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [a1[4] setObject:a1[5] forKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
    [a1[4] synchronize];
    xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1[6] getCurrentWelcomeActivityCriteria]);
    id v7 = a1[4];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v7 setObject:v8 forKey:@"TPSWelcomeNotificationStartDate"];

    [a1[4] synchronize];
    v9 = (const char *)[a1[5] UTF8String];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100002844;
    handler[3] = &unk_10001C988;
    handler[4] = a1[6];
    xpc_activity_register(v9, v6, handler);
    int64_t int64 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY);
    int64_t v11 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_GRACE_PERIOD);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = a1[5];
      *(_DWORD *)buf = 138412802;
      id v16 = v13;
      __int16 v17 = 2048;
      int64_t v18 = int64;
      __int16 v19 = 2048;
      int64_t v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Schedule welcome notification with identifier %@, delay %lld, grace period %lld",  buf,  0x20u);
    }
  }

  else
  {
    if ((+[TPSUserTypesValidation isBetaBuild](&OBJC_CLASS___TPSUserTypesValidation, "isBetaBuild") & 1) == 0
      && (+[TPSUserTypesValidation isInternalBuild]( TPSUserTypesValidation,  "isInternalBuild") & 1) == 0 && [v5 code] != (id)-1009)
    {
      [a1[6] stopWelcomeNotification];
    }

    [a1[6] setWelcomeXPCActivityScheduleInProgress:0];
  }
}

id sub_100002844(uint64_t a1, xpc_activity_t activity)
{
  id result = (id)xpc_activity_get_state(activity);
  if (result == (id)2)
  {
    [*(id *)(a1 + 32) setWelcomeXPCActivityScheduleInProgress:0];
    return [*(id *)(a1 + 32) registerToNotifyWelcome];
  }

  return result;
}

id sub_100003220(uint64_t a1)
{
  return _[*(id *)(a1 + 32) registerXPCEventHandlers];
}

void sub_100003764(_Unwind_Exception *a1)
{
}

void sub_100003780(uint64_t a1, int a2)
{
  if ((int)MKBDeviceUnlockedSinceBoot() >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    while (!__ldaxr(byte_100022190))
    {
      if (!__stlxr(1u, byte_100022190)) {
        goto LABEL_7;
      }
    }

    __clrex();
LABEL_7:
    xpc_object_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = atomic_load(byte_100022190);
      v8[0] = 67109120;
      v8[1] = v7 & 1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "First unlock received %d", (uint8_t *)v8, 8u);
    }

    [WeakRetained initialize];
    notify_cancel(a2);
  }

BOOL sub_100003904(uint64_t a1, void *a2, xpc_activity_state_t a3)
{
  id v5 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v5);
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v17 = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    xpc_activity_state_t v20 = state;
    __int16 v21 = 2048;
    xpc_activity_state_t v22 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Transitioning activity (%@) from state %ld to state %ld.",  (uint8_t *)&v17,  0x20u);
  }

  BOOL v9 = state == a3;
  if (state == a3)
  {
    int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      xpc_activity_state_t v20 = a3;
      uint64_t v12 = "Activity (%@) state is already %ld. No change necessary.";
      id v13 = v10;
      uint32_t v14 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if (!xpc_activity_set_state(v5, a3))
  {
    int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v17 = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2048;
      xpc_activity_state_t v20 = state;
      __int16 v21 = 2048;
      xpc_activity_state_t v22 = a3;
      uint64_t v12 = "Failed to transition activity (%@) from state %ld to state %ld.";
      id v13 = v10;
      uint32_t v14 = 32;
      goto LABEL_10;
    }

LABEL_11:
    goto LABEL_12;
  }

  BOOL v9 = 1LL;
LABEL_12:

  return v9;
}

uint64_t sub_100003B7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(_BYTE *)(v2 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
LABEL_4:
    *(_BYTE *)(v2 + 24) = 1;
  }

  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void sub_100003E98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id a21)
{
}

void sub_100003EBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  LODWORD(v5) = [WeakRetained contentUpdatePostProcessingContentPackage:v7 shouldUpdateNotification:*(unsigned __int8 *)(a1 + 64) shouldDeferBlock:*(void *)(a1 + 40) error:v6];

  if ((_DWORD)v5) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = 5LL;
  }
  (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 32),  v8);
}

void sub_1000042DC(_Unwind_Exception *a1)
{
}

void sub_100004344()
{
}

void sub_10000434C(uint64_t a1, void *a2)
{
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (state == 2)
  {
    uint64_t v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) shouldDeferBlockForXPCActivity:v3]);
    id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) xpcActivitySetStateBlockForIdentifier:@"com.apple.tipsd.postInstall-utility"]);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = @"com.apple.tipsd.postInstall-utility";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "1 to 5 minutes post install load event received: %@",  buf,  0xCu);
    }

    if ((v6[2](v6) & 1) == 0) {
      [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonUpgrade];
    }
    if ((v6[2](v6) & 1) != 0)
    {
      uint64_t v9 = 3LL;
    }

    else if (!*(_BYTE *)(a1 + 48) {
           && (unsigned __int8 v10 = atomic_load(byte_100022190), (v10 & 1) != 0)
    }
           && [WeakRetained setupCompleted])
    {
      LOBYTE(v11) = 0;
      [WeakRetained updateContentWithActivity:v3 identifier:@"com.apple.tipsd.postInstall-utility" preferredNotificationIdentifiers:0 multiuserModeOn:*(unsigned __int8 *)(a1 + 48) contextualEligibility:1 widg etEligibility:1 notificationEligibility:v11];
      else {
        uint64_t v9 = 5LL;
      }
    }

    else
    {
      uint64_t v9 = 5LL;
    }

    ((void (**)(void, _xpc_activity_s *, uint64_t))v7)[2](v7, v3, v9);
  }
}

void sub_10000452C(uint64_t a1, void *a2)
{
  id v7 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v7);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (state == 2)
  {
    [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonContentCheck];
    LOBYTE(v6) = 1;
    [v5 updateContentWithActivity:v7 identifier:@"com.apple.tipsd.update-content" preferredNotificationIdentifiers:0 multiuserModeOn:*(unsigned __int8 *)(a1 + 40) contextualEligibility:1 widget Eligibility:1 notificationEligibility:v6];
  }
}

void sub_1000045C4(uint64_t a1, void *a2)
{
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (state == 2)
  {
    if (!*(_BYTE *)(a1 + 40))
    {
      if (WeakRetained)
      {
        unsigned __int8 v7 = atomic_load(byte_100022190);
        if ((v7 & 1) != 0)
        {
          [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonAnalyticsMaintenance];
          if ([v6 setupCompleted])
          {
            id v8 = objc_alloc(&OBJC_CLASS___TPSAnalyticsProcessingController);
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6[14] tipStatusMap]);
            unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 contextualInfoMap]);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6[15] eventsHistoryController]);
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 contextualEventsForIdentifiers]);
            uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 tipsManager]);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 experiment]);
            id v16 = [v8 initWithAllTipStatus:v10 contextualInfoMap:v11 eventHistoryMap:v13 experiment:v15];

            [v16 processAnalytics];
          }
        }
      }
    }

    if (!xpc_activity_set_state(v3, 5LL))
    {
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed setting activity state to done",  v18,  2u);
      }
    }
  }
}

void sub_100004784(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  kNSURLSessionLaunchOnDemandNotificationName));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ launch event received", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000484C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.coreduetcontext.client_event_stream"));
    int v13 = 138412290;
    uint32_t v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ launch event received",  (uint8_t *)&v13,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v7 = WeakRetained;
  if (!*(_BYTE *)(a1 + 40))
  {
    if (WeakRetained)
    {
      unsigned __int8 v8 = atomic_load(byte_100022190);
      if ((v8 & 1) != 0)
      {
        [WeakRetained logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonDuet];
        string = xpc_dictionary_get_string(v3, "msgtype");
        if (string)
        {
          unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
          unsigned int v11 = [v10 isEqualToString:@"notification"];

          if (v11)
          {
            if (xpc_dictionary_get_string(v3, "id"))
            {
              uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
                sub_100010918();
              }
            }
          }
        }
      }
    }
  }
}

void sub_1000049FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (*(_BYTE *)(a1 + 48)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = WeakRetained == 0LL;
  }
  if (!v6)
  {
    unsigned __int8 v7 = atomic_load(byte_100022190);
    if ((v7 & 1) != 0)
    {
      unsigned __int8 v8 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, _xpc_event_key_name));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "notifyd.matching event received %@",  buf,  0xCu);
      }

      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationTimingDarwinKey]);
      unsigned int v12 = [v9 isEqualToString:v11];

      if (v12)
      {
      }

      else
      {
        if (![v9 isEqualToString:BYSetupAssistantExitedDarwinNotification])
        {
          if ([v9 isEqualToString:@"com.apple.language.changed"])
          {
            [v5 handleLanguageDidChangeNotification];
          }

          else
          {
            if (![v9 isEqualToString:@"com.apple.mobile.keybagd.first_unlock"])
            {
              if ([v9 isEqualToString:@"com.apple.bluetooth.pairing"])
              {
                uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TPSTipsManager immediateNotificationIdentifierForType:]( &OBJC_CLASS___TPSTipsManager,  "immediateNotificationIdentifierForType:",  0LL));
                __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[TPSTipsManager immediateNotificationIdentifierForType:]( &OBJC_CLASS___TPSTipsManager,  "immediateNotificationIdentifierForType:",  1LL));
                v25[0] = v19;
                v25[1] = v18;
                xpc_activity_state_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v25,  2LL));
              }

              else
              {
                uint64_t v21 = TPSHMManagerSpeakersConfiguredChangedNotificationString();
                xpc_activity_state_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                unsigned int v23 = [v9 isEqualToString:v22];

                if (v23)
                {
                  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TPSTipsManager immediateNotificationIdentifierForType:]( &OBJC_CLASS___TPSTipsManager,  "immediateNotificationIdentifierForType:",  2LL));
                  v24 = v18;
                  xpc_activity_state_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v24,  1LL));
                }

                else
                {
                  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v27 = v9;
                    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Event %@ not handled",  buf,  0xCu);
                  }

                  xpc_activity_state_t v20 = 0LL;
                }
              }

              [v5 immediateNotificationForIdentifiers:v20];
              goto LABEL_29;
            }

            [v5 handleDeviceFirstUnlockNotification];
          }

LABEL_30:
          goto LABEL_31;
        }

        if (*(_BYTE *)(a1 + 48)) {
          exit(0);
        }
        id v13 = +[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance");
        uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[TPSCommonDefines clientBundleIdentifier]( &OBJC_CLASS___TPSCommonDefines,  "clientBundleIdentifier"));
        unsigned int v15 = +[TPSCommonDefines isAppValidWithBundleIdentifier:]( &OBJC_CLASS___TPSCommonDefines,  "isAppValidWithBundleIdentifier:",  v14);

        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v27) = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "App state valid: %d", buf, 8u);
        }

        int v17 = (void *)objc_claimAutoreleasedReturnValue([v5 welcome]);
        [v17 createWelcomeXPCActivity];
      }

LABEL_29:
      [v5 unregisterDarwinNotification:v9];
      goto LABEL_30;
    }
  }

  if (v3 < 0) {
    v90 = v3;
  }
  else {
    v90 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v3);
  v91 = sub_10000CA48(&qword_100022820);
  v79 = _bridgeCocoaArray<A>(_:)(v90, v91);
  swift_bridgeObjectRelease(v3);
LABEL_27:
  v80 = v0 + 16;
  v81 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease(v3);
  v82 = (void *)objc_opt_self(&OBJC_CLASS___TPSTargetingValidator);
  sub_10000CA48(&qword_100022820);
  v83 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 376) = v83;
  swift_bridgeObjectRelease(v79);
  v84 = [v26 joinType];
  ResultContext.resultId.getter(v84);
  v86 = v85;
  v87 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 384) = v87;
  swift_bridgeObjectRelease(v86);
  *(void *)(v0 + 56) = v0 + 400;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_10000D200;
  v88 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  v89 = (void *)(v0 + 80);
  v89[1] = 0x40000000LL;
  v89[2] = sub_10000E514;
  v89[3] = &unk_10001D0E0;
  v89[4] = v88;
  [v82 validateConditions:v83 joinType:v84 context:v87 cache:v81 completionQueue:0 completionHandler:v89];
  return swift_continuation_await(v80);
}

LABEL_31:
}

void sub_1000053F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) document]);
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      int v7 = 138412546;
      unsigned __int8 v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Notification image for %@ cache at %@",  (uint8_t *)&v7,  0x16u);
    }
  }

  [*(id *)(a1 + 40) prepareForNotifications];
}

void sub_10000560C(_Unwind_Exception *a1)
{
}

void sub_100005630(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 correlationID]);

  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v13)
    {
      int v19 = 138413058;
      xpc_activity_state_t v20 = v10;
      __int16 v21 = 2112;
      xpc_activity_state_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = a3;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to send a notification with identifier: %@ correlation id: %@, type: %ld with error: %@",  (uint8_t *)&v19,  0x2Au);
    }

    if ([v7 code] == (id)4)
    {
      id v14 = [[TPSAnalyticsEventTipNotDisplayed alloc] initWithTipID:v10 correlationID:v11 reason:5 context:0];
      [v14 log];
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained notificationController]);
      [WeakRetained notificationController:v15 markIdentifier:v10 type:a3 ineligibleWithReason:5];
    }

    if (a3 != 3) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  if (v13)
  {
    int v19 = 138412802;
    xpc_activity_state_t v20 = v10;
    __int16 v21 = 2112;
    xpc_activity_state_t v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Sent a notification with identifier: %@ correlation id: %@, type: %ld",  (uint8_t *)&v19,  0x20u);
  }

  switch(a3)
  {
    case 3LL:
      +[TPSTipsManager removeWelcomeDocumentCache](&OBJC_CLASS___TPSTipsManager, "removeWelcomeDocumentCache");
LABEL_15:
      id v16 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained welcome]);
      [v16 welcomeNotificationDisplayed];
LABEL_16:

      break;
    case 2LL:
      if (v11) {
        int v17 = v11;
      }
      else {
        int v17 = v10;
      }
      id v18 = v17;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](&OBJC_CLASS___TPSCloudController, "sharedInstance"));
      [v16 hintDisplayedForContentID:v18];

      goto LABEL_16;
    case 1LL:
      [WeakRetained hintDisplayedForIdentifier:v10 correlationID:v11 context:0];
      break;
  }

LABEL_17:
}

  else {
    v63 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v2);
  v64 = _CocoaArrayWrapper.endIndex.getter(v63);
  *(void *)(v0 + 328) = v64;
  if (!v64) {
    goto LABEL_21;
  }
LABEL_3:
  v1 = 0LL;
  while (1)
  {
    int v4 = *(void *)(v0 + 264);
    if ((v4 & 0xC000000000000001LL) != 0) {
      uint64_t v2 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v1);
    }
    else {
      uint64_t v2 = *(id *)(v4 + 8 * v1 + 32);
    }
    id v5 = v2;
    *(void *)(v0 + 336) = v2;
    *(void *)(v0 + 344) = v1 + 1;
    if (__OFADD__(v1, 1LL))
    {
      __break(1u);
      goto LABEL_17;
    }

    BOOL v6 = ResultContext.conditions.getter();
    *(void *)(v0 + 352) = 0LL;
    id v7 = v6;
    id v8 = *(void *)(v0 + 312);
    id v10 = *(void *)(v0 + 288);
    __int16 v9 = *(void *)(v0 + 296);
    static TipsLog.targeting.getter(v6);
    *(void *)(v0 + 176) = 0LL;
    *(void *)(v0 + 184) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    unsigned int v11 = *(void *)(v0 + 184);
    BOOL v13 = ResultContext.resultId.getter(v12);
    unsigned int v15 = v14;
    swift_bridgeObjectRelease(v11);
    *(void *)(v0 + 160) = v13;
    *(void *)(v0 + 168) = v15;
    v16._countAndFlagsBits = 0xD000000000000022LL;
    v16._object = (void *)0x8000000100015380LL;
    String.append(_:)(v16);
    v17._countAndFlagsBits = Dictionary.description.getter( v7,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    object = v17._object;
    String.append(_:)(v17);
    swift_bridgeObjectRelease(object);
    int v19 = *(void *)(v0 + 168);
    logDebug(_:_:)(v8, *(void *)(v0 + 160), v19);
    swift_bridgeObjectRelease(v19);
    xpc_activity_state_t v20 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    *(void *)(v0 + 360) = v20;
    v20(v8, v10);
    if (!*(void *)(v7 + 16))
    {
      v34 = *(void *)(v0 + 312);
      v35 = *(void *)(v0 + 288);
      swift_bridgeObjectRelease(*(void *)(v0 + 264));
      v36 = swift_bridgeObjectRelease(v7);
      static TipsLog.targeting.getter(v36);
      _StringGuts.grow(_:)(29LL);
      v38 = ResultContext.resultId.getter(v37);
      v40 = v39;
      swift_bridgeObjectRelease(0xE000000000000000LL);
      v41._object = (void *)0x8000000100015410LL;
      v41._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v41);
      log(_:_:)(v34, v38, v40);
      swift_bridgeObjectRelease(v40);
      v20(v34, v35);
      v42 = *(id *)(v0 + 336);
      v43 = ResultContext.resultId.getter(v42);
      v45 = v44;

      v46 = *(void **)(v0 + 336);
      goto LABEL_22;
    }

    __int16 v21 = sub_10000E150(v7);
    swift_bridgeObjectRelease(v7);
    xpc_activity_state_t v22 = objc_allocWithZone(&OBJC_CLASS___TPSDeliveryPrecondition);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    uint64_t v24 = [v22 initWithDictionary:isa];
    *(void *)(v0 + 368) = v24;

    if (v24) {
      break;
    }
    id v26 = *(void *)(v0 + 312);
    v27 = *(void *)(v0 + 288);
    static TipsLog.targeting.getter(v25);
    *(void *)(v0 + 208) = 0LL;
    *(void *)(v0 + 216) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(58LL);
    v28 = *(void *)(v0 + 216);
    *(void *)(v0 + 144) = *(void *)(v0 + 208);
    *(void *)(v0 + 152) = v28;
    v30._countAndFlagsBits = ResultContext.resultId.getter(v29);
    v31 = v30._object;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(v31);
    v32._countAndFlagsBits = 0xD000000000000038LL;
    v32._object = (void *)0x80000001000153B0LL;
    String.append(_:)(v32);
    v33 = *(void *)(v0 + 152);
    logError(_:_:)(v26, *(void *)(v0 + 144), v33);

    swift_bridgeObjectRelease(v33);
    v20(v26, v27);
    v1 = *(void *)(v0 + 344);
    if (v1 == *(void *)(v0 + 328)) {
      goto LABEL_21;
    }
  }

  v47 = [v24 conditions];
  v48 = sub_1000106F4(0LL, &qword_100022818, &OBJC_CLASS___TPSCondition_ptr);
  v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v47, v48);

  if ((unint64_t)v49 >> 62)
  {
    if (v49 < 0) {
      v68 = v49;
    }
    else {
      v68 = v49 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v49);
    v69 = sub_10000CA48(&qword_100022820);
    v51 = _bridgeCocoaArray<A>(_:)(v68, v69);
    swift_bridgeObjectRelease(v49);
  }

  else
  {
    v50 = swift_bridgeObjectRetain(v49);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v50);
    v51 = v49;
  }

  v52 = v0 + 16;
  v53 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease(v49);
  v54 = (void *)objc_opt_self(&OBJC_CLASS___TPSTargetingValidator);
  sub_10000CA48(&qword_100022820);
  v55 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 376) = v55;
  swift_bridgeObjectRelease(v51);
  v56 = [v24 joinType];
  ResultContext.resultId.getter(v56);
  v58 = v57;
  v59 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 384) = v59;
  swift_bridgeObjectRelease(v58);
  *(void *)(v0 + 56) = v0 + 400;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_10000D200;
  v60 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  v61 = (void *)(v0 + 80);
  v61[1] = 0x40000000LL;
  v61[2] = sub_10000E514;
  v61[3] = &unk_10001D0E0;
  v61[4] = v60;
  [v54 validateConditions:v55 joinType:v56 context:v59 cache:v53 completionQueue:0 completionHandler:v61];
  return swift_continuation_await(v52);
}

  BOOL v6 = *a1;
  id v7 = v6 >= 3;
  id v8 = v6 - 3;
  if (!v7) {
    id v8 = -1;
  }
  return (v8 + 1);
}

void sub_100005B70(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && !v5) {
    [*(id *)(a1 + 32) indexContentPackage:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100005DA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_100005DC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005DD0(uint64_t a1)
{
}

void sub_100005DD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](&OBJC_CLASS___TPSLogger, "indexing"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001097C();
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSSearchItemIndexer default](&OBJC_CLASS___TPSSearchItemIndexer, "default"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tipMap]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005ED0;
  v9[3] = &unk_10001CBA8;
  id v10 = v3;
  id v8 = v3;
  [v5 indexTips:v7 qualityOfService:9 completionHandler:v9];
}

void sub_100005ED0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](&OBJC_CLASS___TPSLogger, "indexing"));
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000109A8();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tips indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005F84(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](&OBJC_CLASS___TPSLogger, "indexing"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100010A08();
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userGuides]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSSearchItemIndexer default](&OBJC_CLASS___TPSSearchItemIndexer, "default"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_10000606C;
  v8[3] = &unk_10001CBA8;
  id v9 = v3;
  id v7 = v3;
  [v6 indexUserGuides:v5 qualityOfService:9 completionHandler:v8];
}

void sub_10000606C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](&OBJC_CLASS___TPSLogger, "indexing"));
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100010A34();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "User Guide indexing completed successfully.",  v6,  2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100006120(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_100006948( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000696C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3)
  {
    id v10 = v7;
    unsigned int v9 = [v7 intValue];
    id v8 = v10;
    if (v9)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }
  }
}

void sub_100006CC8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assistantConnections]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_100006DCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assistantConnections]);
  [v2 addObject:*(void *)(a1 + 32)];
}

void sub_100006ED0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assistantConnections]);
    unsigned int v4 = [v3 containsObject:*(void *)(a1 + 32)];

    id WeakRetained = v6;
    if (v4)
    {
      [*(id *)(a1 + 32) invalidate];
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 assistantConnections]);
      [v5 removeObject:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

void sub_10000700C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assistantConnections]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_100007110(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained discoverabilityConnections]);
  [v2 addObject:*(void *)(a1 + 32)];
}

void sub_100007214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained discoverabilityConnections]);
    unsigned int v4 = [v3 containsObject:*(void *)(a1 + 32)];

    id WeakRetained = v6;
    if (v4)
    {
      [*(id *)(a1 + 32) invalidate];
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 discoverabilityConnections]);
      [v5 removeObject:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

void sub_100007390( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000073A8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appConnections]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_1000074AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger default](&OBJC_CLASS___TPSLogger, "default"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100010D1C();
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained appConnections]);
  [v4 addObject:*(void *)(a1 + 32)];
}

void sub_1000075E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained appConnections]);
    unsigned int v4 = [v3 containsObject:*(void *)(a1 + 32)];

    id WeakRetained = v6;
    if (v4)
    {
      [*(id *)(a1 + 32) invalidate];
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 appConnections]);
      [v5 removeObject:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

void sub_100007E38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id location)
{
}

void sub_100007EC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAssistantXPCConnection:v3];

  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Device Expert xpc connection invalidated",  v5,  2u);
  }
}

void sub_100007F64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAppXPCConnection:v3];

  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App xpc connection invalidated", v5, 2u);
  }
}

void sub_100008000(id a1)
{
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "standard access connection invalidated", v2, 2u);
  }
}

void sub_10000806C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeDiscoverabilityXPCConnection:v3];

  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Discoverability xpc connection invalidated",  v5,  2u);
  }
}

void sub_100008108(id a1)
{
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "xpc connection from client interrupted!",  v2,  2u);
  }
}

LABEL_7:
}

void sub_100008B00(id a1, TPSContentPackage *a2, NSError *a3)
{
  id v3 = a3;
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      unsigned int v12 = v3;
      id v6 = "Failed to update content for language change. Error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "Successfully updated content for language change";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  xpc_transaction_exit_clean(v9, v10);
}

void sub_100008CA4(id a1, TPSContentPackage *a2, NSError *a3)
{
  id v3 = a3;
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      unsigned int v12 = v3;
      id v6 = "Failed to reregister event registration. Error: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "Successfully registered events from first unlock notification";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  xpc_transaction_exit_clean(v9, v10);
}

void sub_100009014( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100009038(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained notificationController]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 notificationCache]);

  if (!v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No document found to notify.", buf, 2u);
    }

    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionMap]);
    id v21 = v3;
    xpc_activity_state_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 tipMap]);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v14]);

          if (v15)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
            int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
            [v16 activatedCollections:v17];

            id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](&OBJC_CLASS___TPSCloudController, "sharedInstance"));
            [v18 hintDisplayedForContentID:v14];
          }

          else
          {
            int v19 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v14]);
            id v18 = v19;
            if (v19)
            {
              xpc_activity_state_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 correlationID]);
              [WeakRetained hintDisplayedForIdentifier:v14 correlationID:v20 context:0];
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v11);
    }

    id v3 = v21;
    id v6 = 0LL;
  }

  [WeakRetained updateNotificationStatus];
}

void sub_10000948C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1000094A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained tipsManager]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 processUserGuidesFromContentPackage:v6]);

  if (v5)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "User guide map may be missing items due to %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100009754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a2 firstObject]);
  if (v5)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100010E08(a1, v5, v7);
    }
  }

  else
  {
    uint32_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    id v7 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v16 = 138412290;
        uint64_t v17 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Downloaded remote tip %@",  (uint8_t *)&v16,  0xCu);
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_100010DA0(a1, v7, v10, v11, v12, v13, v14, v15);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100009B18(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  uint64_t v3 = 32LL;
  if (!v2) {
    uint64_t v3 = 40LL;
  }
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + v3) error]);

  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100010F1C(a1, v5, v6, v7, v8, v9, v10, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    id v12 = objc_alloc(&OBJC_CLASS___TPSAssetsInfo);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetIdentifier]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) downloadedURL]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetIdentifier]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadedURL]);
    id v17 = [v12 initWithVideoIdentifier:v13 videoURL:v14 imageIdentifier:v15 imageURL:v16];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

LABEL_12:
  return v5;
}

void sub_10000AD6C(_Unwind_Exception *a1)
{
}

void sub_10000AD98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v12);
        if (v6)
        {
          uint64_t v14 = 0LL;
        }

        else
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "miniTipMetadataForContent:bundleID:context:",  *(void *)(*((void *)&v21 + 1) + 8 * (void)v12),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  (void)v21));
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 error]);
          if (v15) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = v14 == 0LL;
          }
          if (v16)
          {
            id v6 = (id)v15;
          }

          else
          {
            [*(id *)(a1 + 56) addObject:v14];
            id v6 = 0LL;
          }
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", (void)v21));
        [WeakRetained donateContentRetrieved:v17 bundleID:*(void *)(a1 + 40) context:*(void *)(a1 + 48) error:v6];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  id v18 = *(void **)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 64);
  if (v18)
  {
    id v20 = [v18 copy];
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v20, v6);
  }

  else
  {
    (*(void (**)(void, void, id))(v19 + 16))(*(void *)(a1 + 64), 0LL, v6);
  }
}

void sub_10000B194(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000B250;
  v10[3] = &unk_10001CE48;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(&_dispatch_main_q, v10);
}

void sub_10000B250(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tipsManager]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 welcomeCollectionFromContentPackage:*(void *)(a1 + 40)]);

  if (v3 && (unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]), v4, v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) language]);
    unsigned __int8 v6 = +[TPSTipsManager deviceLocalesContainLanguage:]( &OBJC_CLASS___TPSTipsManager,  "deviceLocalesContainLanguage:",  v5);

    if ((v6 & 1) != 0) {
      goto LABEL_10;
    }
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No proper translated content found for the device.",  (uint8_t *)&v12,  2u);
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) collectionMap]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 collectionIdentifierForCurrentUserType]);
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to display welcome notification because collection map %@ does not contain proper notification for collection %@",  (uint8_t *)&v12,  0x16u);
    }
  }

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_10000C1DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000C1F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000C218(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_10000C230( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

int main(int argc, const char **argv, const char **envp)
{
  qword_100022840 = 0LL;
  qword_100022848 = 0LL;
  qword_100022850 = 0LL;
  uint64_t v3 = objc_autoreleasePoolPush();
  sub_10000C3C0();
  objc_autoreleasePoolPop(v3);
  id v4 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  [v4 run];

  return 0;
}

id sub_10000C3C0()
{
  uint64_t v0 = type metadata accessor for TipsLog(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!_set_user_dir_suffix("com.apple.tipsd"))
  {
    static TipsLog.default.getter();
    uint64_t v25 = 0LL;
    unint64_t v26 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(59LL);
    v20._countAndFlagsBits = 0xD000000000000039LL;
    v20._object = (void *)0x80000001000151D0LL;
    String.append(_:)(v20);
    v24[3] = errno.getter();
    v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    object = v21._object;
    String.append(_:)(v21);
    swift_bridgeObjectRelease(object);
    unint64_t v23 = v26;
    logError(_:_:)(v3, v25, v26);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    abort();
  }

  id v4 = NSTemporaryDirectory();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  swift_bridgeObjectRelease(v7);
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000LL) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8
    || [(id)objc_opt_self(TPSCommonDefines) isInternalDevice]
    && ([(id)objc_opt_self(TPSDaemonCLIHandler) run] & 1) != 0)
  {
    exit(0);
  }

  id v9 = [objc_allocWithZone((Class)TPSDaemon) init];
  id v10 = (void *)qword_100022840;
  qword_100022840 = (uint64_t)v9;

  id v11 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [v11 initWithMachServiceName:v12];

  __int16 v14 = (void *)qword_100022848;
  qword_100022848 = (uint64_t)v13;

  if (qword_100022848)
  {
    [(id)qword_100022848 setDelegate:qword_100022840];
    if (qword_100022848) {
      [(id)qword_100022848 resume];
    }
  }

  id result = [(id)objc_opt_self(TPSFeatureFlags) allowsDE];
  if ((_DWORD)result)
  {
    id v16 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
    NSString v17 = String._bridgeToObjectiveC()();
    id v18 = [v16 initWithMachServiceName:v17];

    uint64_t v19 = (void *)qword_100022850;
    qword_100022850 = (uint64_t)v18;

    id result = (id)qword_100022850;
    if (qword_100022850)
    {
      [(id)qword_100022850 setDelegate:qword_100022840];
      id result = (id)qword_100022850;
      if (qword_100022850) {
        return [(id)qword_100022850 resume];
      }
    }
  }

  return result;
}

BOOL sub_10000C6B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000C6CC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000C710()
{
}

Swift::Int sub_10000C738(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t TPSDaemon.findMatchingResultId(from:reply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[0] = a2;
  sub_10000CA48(&qword_1000227A0);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TipsLog(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  __int16 v14 = (char *)v29 - v13;
  static TipsLog.default.getter(v12);
  unint64_t v30 = 0LL;
  unint64_t v31 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(32LL);
  swift_bridgeObjectRelease(v31);
  unint64_t v30 = 0xD00000000000001ELL;
  unint64_t v31 = 0x8000000100015230LL;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v28 = a1;
    }
    else {
      uint64_t v28 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v28);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v15 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  v29[1] = v15;
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(object);
  unint64_t v18 = v31;
  logDebug(_:_:)(v14, v30, v31);
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  uint64_t v20 = v19(v14, v7);
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v26 = a1;
    }
    else {
      uint64_t v26 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v26);
    uint64_t v20 = swift_bridgeObjectRelease(a1);
    if (v27) {
      goto LABEL_5;
    }
  }

  else if (*(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_5:
    uint64_t v21 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v6, 1LL, 1LL, v21);
    __int128 v22 = (void *)swift_allocObject(&unk_10001CF70, 56LL, 7LL);
    v22[2] = 0LL;
    v22[3] = 0LL;
    uint64_t v23 = v29[0];
    v22[4] = a1;
    v22[5] = v23;
    v22[6] = a3;
    swift_bridgeObjectRetain(a1);
    swift_retain(a3);
    uint64_t v24 = sub_10000E594((uint64_t)v6, (uint64_t)&unk_1000227B0, (uint64_t)v22);
    return swift_release(v24);
  }

  static TipsLog.targeting.getter(v20);
  log(_:_:)(v11, 0xD000000000000028LL, 0x8000000100015250LL);
  v19(v11, v7);
  return ((uint64_t (*)(void, void, void))v29[0])(0LL, 0LL, 0LL);
}

uint64_t sub_10000CA48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000CA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[34] = a5;
  v6[35] = a6;
  v6[33] = a4;
  uint64_t v7 = type metadata accessor for TipsLog(0LL);
  v6[36] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[37] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[38] = swift_task_alloc(v9);
  v6[39] = swift_task_alloc(v9);
  return swift_task_switch(sub_10000CAFC, 0LL, 0LL);
}

uint64_t sub_10000CAFC()
{
  unint64_t v1 = *(void *)(v0 + 264);
  *(void *)(v0 + 320) = [objc_allocWithZone(TPSTargetingCache) init];
  id v2 = *(id *)(v0 + 264);
  if (!(v1 >> 62))
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v2);
    *(void *)(v0 + 32_Block_object_dispose(va, 8) = v3;
    if (v3) {
      goto LABEL_3;
    }
LABEL_21:
    swift_bridgeObjectRelease(*(void *)(v0 + 264));
    uint64_t v43 = 0LL;
    uint64_t v45 = 0LL;
    v46 = 0LL;
LABEL_22:
    uint64_t v65 = *(void *)(v0 + 312);
    v66 = *(void **)(v0 + 320);
    uint64_t v67 = *(void *)(v0 + 304);
    (*(void (**)(uint64_t, uint64_t, void))(v0 + 272))(v43, v45, 0LL);

    swift_bridgeObjectRelease(v45);
    swift_task_dealloc(v65);
    swift_task_dealloc(v67);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_10000D200()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 392LL) = v1;
  if (v1) {
    id v2 = sub_10000D9E4;
  }
  else {
    id v2 = sub_10000D260;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000D260()
{
  id v2 = *(void **)(v0 + 376);
  uint64_t v1 = *(void **)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 360);
  uint64_t v4 = *(void **)(v0 + 368);
  uint64_t v5 = *(void *)(v0 + 304);
  uint64_t v6 = *(void *)(v0 + 288);
  int v7 = *(unsigned __int8 *)(v0 + 400);

  uint64_t v9 = static TipsLog.targeting.getter(v8);
  *(void *)(v0 + 224) = ResultContext.resultId.getter(v9);
  *(void *)(v0 + 232) = v10;
  v11._countAndFlagsBits = 32LL;
  v11._object = (void *)0xE100000000000000LL;
  String.append(_:)(v11);
  if (v7) {
    uint64_t v12 = 0x6465686374616DLL;
  }
  else {
    uint64_t v12 = 0x6374616D20746F6ELL;
  }
  if (v7) {
    unint64_t v13 = 0xE700000000000000LL;
  }
  else {
    unint64_t v13 = 0xEB00000000646568LL;
  }
  unint64_t v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease(v13);
  uint64_t v15 = *(void *)(v0 + 232);
  log(_:_:)(v5, *(void *)(v0 + 224), v15);
  swift_bridgeObjectRelease(v15);

  ((void (*)(uint64_t, uint64_t))v3)(v5, v6);
  if ((v7 & 1) != 0)
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 264));
LABEL_9:
    id v16 = *(id *)(v0 + 336);
    uint64_t v17 = ResultContext.resultId.getter(v16);
    uint64_t v19 = v18;

    uint64_t v20 = *(void **)(v0 + 336);
    goto LABEL_12;
  }

  uint64_t v21 = *(void *)(v0 + 344);
  if (v21 == *(void *)(v0 + 328))
  {
LABEL_11:
    swift_bridgeObjectRelease(*(void *)(v0 + 264));
    uint64_t v17 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
LABEL_12:
    uint64_t v22 = *(void *)(v0 + 312);
    uint64_t v23 = *(void **)(v0 + 320);
    uint64_t v24 = *(void *)(v0 + 304);
    (*(void (**)(uint64_t, uint64_t, void))(v0 + 272))(v17, v19, 0LL);

    swift_bridgeObjectRelease(v19);
    swift_task_dealloc(v22);
    swift_task_dealloc(v24);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  id v26 = *(id *)(v0 + 352);
  while (1)
  {
    uint64_t v39 = *(void *)(v0 + 264);
    if ((v39 & 0xC000000000000001LL) != 0) {
      id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v21);
    }
    else {
      id v40 = *(id *)(v39 + 8 * v21 + 32);
    }
    Swift::String v41 = v40;
    *(void *)(v0 + 336) = v40;
    *(void *)(v0 + 344) = v21 + 1;
    if (__OFADD__(v21, 1LL))
    {
      __break(1u);
      goto LABEL_29;
    }

    uint64_t v42 = ResultContext.conditions.getter();
    *(void *)(v0 + 352) = v26;
    if (!v26) {
      break;
    }
    uint64_t v27 = *(void **)(v0 + 336);
    uint64_t v28 = *(void *)(v0 + 312);
    uint64_t v29 = *(void *)(v0 + 288);
    uint64_t v3 = *(void *)(v0 + 296);
    static TipsLog.targeting.getter(v42);
    *(void *)(v0 + 240) = 0LL;
    *(void *)(v0 + 24_Block_object_dispose(va, 8) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(53LL);
    uint64_t v30 = *(void *)(v0 + 248);
    *(void *)(v0 + 192) = *(void *)(v0 + 240);
    *(void *)(v0 + 200) = v30;
    v32._countAndFlagsBits = ResultContext.resultId.getter(v31);
    object = v32._object;
    String.append(_:)(v32);
    swift_bridgeObjectRelease(object);
    v34._countAndFlagsBits = 0xD000000000000026LL;
    v34._object = (void *)0x8000000100015350LL;
    String.append(_:)(v34);
    swift_getErrorValue(v26, v0 + 256, v0 + 120);
    v35._countAndFlagsBits = Error.localizedDescription.getter(*(void *)(v0 + 128), *(void *)(v0 + 136));
    uint64_t v36 = v35._object;
    String.append(_:)(v35);
    swift_bridgeObjectRelease(v36);
    v37._countAndFlagsBits = 0x697070696B53202ELL;
    v37._object = (void *)0xEB000000002E676ELL;
    String.append(_:)(v37);
    uint64_t v38 = *(void *)(v0 + 200);
    logError(_:_:)(v28, *(void *)(v0 + 192), v38);

    swift_bridgeObjectRelease(v38);
    swift_errorRelease(v26);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v28, v29);
LABEL_15:
    id v26 = 0LL;
    uint64_t v21 = *(void *)(v0 + 344);
    if (v21 == *(void *)(v0 + 328)) {
      goto LABEL_11;
    }
  }

  uint64_t v43 = v42;
  uint64_t v44 = *(void *)(v0 + 312);
  uint64_t v46 = *(void *)(v0 + 288);
  uint64_t v45 = *(void *)(v0 + 296);
  static TipsLog.targeting.getter(v42);
  *(void *)(v0 + 176) = 0LL;
  *(void *)(v0 + 184) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(38LL);
  uint64_t v47 = *(void *)(v0 + 184);
  uint64_t v49 = ResultContext.resultId.getter(v48);
  uint64_t v51 = v50;
  swift_bridgeObjectRelease(v47);
  *(void *)(v0 + 160) = v49;
  *(void *)(v0 + 16_Block_object_dispose(va, 8) = v51;
  v52._countAndFlagsBits = 0xD000000000000022LL;
  v52._object = (void *)0x8000000100015380LL;
  String.append(_:)(v52);
  v53._countAndFlagsBits = Dictionary.description.getter( v43,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v54 = v53._object;
  String.append(_:)(v53);
  swift_bridgeObjectRelease(v54);
  uint64_t v55 = *(void *)(v0 + 168);
  logDebug(_:_:)(v44, *(void *)(v0 + 160), v55);
  swift_bridgeObjectRelease(v55);
  uint64_t v3 = *(void *)(v45 + 8);
  *(void *)(v0 + 360) = v3;
  ((void (*)(uint64_t, uint64_t))v3)(v44, v46);
  if (!*(void *)(v43 + 16))
  {
    uint64_t v68 = *(void *)(v0 + 312);
    uint64_t v69 = *(void *)(v0 + 288);
    swift_bridgeObjectRelease(*(void *)(v0 + 264));
    uint64_t v70 = swift_bridgeObjectRelease(v43);
    static TipsLog.targeting.getter(v70);
    _StringGuts.grow(_:)(29LL);
    uint64_t v72 = ResultContext.resultId.getter(v71);
    uint64_t v74 = v73;
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v75._object = (void *)0x8000000100015410LL;
    v75._countAndFlagsBits = 0xD00000000000001BLL;
    String.append(_:)(v75);
    log(_:_:)(v68, v72, v74);
    swift_bridgeObjectRelease(v74);
    ((void (*)(uint64_t, uint64_t))v3)(v68, v69);
    goto LABEL_9;
  }

  uint64_t v56 = sub_10000E150(v43);
  swift_bridgeObjectRelease(v43);
  id v57 = objc_allocWithZone(&OBJC_CLASS___TPSDeliveryPrecondition);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v56);
  id v26 = [v57 initWithDictionary:isa];
  *(void *)(v0 + 36_Block_object_dispose(va, 8) = v26;

  if (!v26)
  {
    uint64_t v60 = *(void *)(v0 + 312);
    uint64_t v61 = *(void *)(v0 + 288);
    static TipsLog.targeting.getter(v59);
    *(void *)(v0 + 20_Block_object_dispose(va, 8) = 0LL;
    *(void *)(v0 + 216) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(58LL);
    uint64_t v62 = *(void *)(v0 + 216);
    *(void *)(v0 + 144) = *(void *)(v0 + 208);
    *(void *)(v0 + 152) = v62;
    v64._countAndFlagsBits = ResultContext.resultId.getter(v63);
    uint64_t v65 = v64._object;
    String.append(_:)(v64);
    swift_bridgeObjectRelease(v65);
    v66._countAndFlagsBits = 0xD000000000000038LL;
    v66._object = (void *)0x80000001000153B0LL;
    String.append(_:)(v66);
    uint64_t v67 = *(void *)(v0 + 152);
    logError(_:_:)(v60, *(void *)(v0 + 144), v67);

    swift_bridgeObjectRelease(v67);
    ((void (*)(uint64_t, uint64_t))v3)(v60, v61);
    goto LABEL_15;
  }

  id v76 = [v26 conditions];
  uint64_t v77 = sub_1000106F4(0LL, &qword_100022818, &OBJC_CLASS___TPSCondition_ptr);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v76, v77);

  if (!((unint64_t)v3 >> 62))
  {
    uint64_t v78 = swift_bridgeObjectRetain(v3);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v78);
    uint64_t v79 = v3;
    goto LABEL_27;
  }

uint64_t sub_10000D9E4()
{
  uint64_t v1 = *(void **)(v0 + 384);
  uint64_t v3 = *(void **)(v0 + 368);
  id v2 = *(void **)(v0 + 376);
  uint64_t v4 = *(void **)(v0 + 320);
  swift_willThrow();

  uint64_t v5 = v0 + 120;
  id v6 = *(id *)(v0 + 392);
  int v7 = *(void **)(v0 + 336);
  uint64_t v8 = *(void *)(v0 + 312);
  uint64_t v9 = *(void *)(v0 + 296);
  uint64_t v84 = *(void *)(v0 + 288);
  static TipsLog.targeting.getter(v10);
  *(void *)(v0 + 240) = 0LL;
  *(void *)(v0 + 24_Block_object_dispose(va, 8) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(53LL);
  uint64_t v11 = *(void *)(v0 + 248);
  *(void *)(v0 + 192) = *(void *)(v0 + 240);
  *(void *)(v0 + 200) = v11;
  v13._countAndFlagsBits = ResultContext.resultId.getter(v12);
  object = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(object);
  v15._countAndFlagsBits = 0xD000000000000026LL;
  v15._object = (void *)0x8000000100015350LL;
  String.append(_:)(v15);
  swift_getErrorValue(v6, v0 + 256, v0 + 120);
  v16._countAndFlagsBits = Error.localizedDescription.getter(*(void *)(v0 + 128), *(void *)(v0 + 136));
  uint64_t v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._countAndFlagsBits = 0x697070696B53202ELL;
  v18._object = (void *)0xEB000000002E676ELL;
  String.append(_:)(v18);
  uint64_t v19 = *(void *)(v0 + 200);
  logError(_:_:)(v8, *(void *)(v0 + 192), v19);

  swift_bridgeObjectRelease(v19);
  swift_errorRelease(v6);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v84);
  while (1)
  {
    uint64_t v20 = *(void *)(v0 + 344);
    if (v20 == *(void *)(v0 + 328))
    {
      swift_bridgeObjectRelease(*(void *)(v0 + 264));
      uint64_t v51 = 0LL;
      uint64_t v52 = 0LL;
      Swift::String v53 = 0LL;
LABEL_12:
      uint64_t v64 = *(void *)(v0 + 312);
      uint64_t v65 = *(void **)(v0 + 320);
      uint64_t v66 = *(void *)(v0 + 304);
      (*(void (**)(uint64_t, uint64_t, void))(v0 + 272))(v51, v52, 0LL);

      swift_bridgeObjectRelease(v52);
      swift_task_dealloc(v64);
      swift_task_dealloc(v66);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }

    uint64_t v21 = *(void *)(v0 + 264);
    id v22 = (v21 & 0xC000000000000001LL) != 0
        ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(*(void *)(v0 + 344))
        : *(id *)(v21 + 8 * v20 + 32);
    id v23 = v22;
    *(void *)(v0 + 336) = v22;
    *(void *)(v0 + 344) = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    uint64_t v24 = ResultContext.conditions.getter();
    *(void *)(v0 + 352) = 0LL;
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)(v0 + 312);
    uint64_t v27 = v23;
    uint64_t v28 = *(void **)(v0 + 288);
    uint64_t v29 = *(void *)(v0 + 296);
    static TipsLog.targeting.getter(v24);
    *(void *)(v0 + 176) = 0LL;
    *(void *)(v0 + 184) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    uint64_t v30 = *(void *)(v0 + 184);
    uint64_t v85 = v27;
    uint64_t v32 = ResultContext.resultId.getter(v31);
    uint64_t v34 = v33;
    swift_bridgeObjectRelease(v30);
    *(void *)(v0 + 160) = v32;
    *(void *)(v0 + 16_Block_object_dispose(va, 8) = v34;
    v35._countAndFlagsBits = 0xD000000000000022LL;
    v35._object = (void *)0x8000000100015380LL;
    String.append(_:)(v35);
    v36._countAndFlagsBits = Dictionary.description.getter( v25,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    Swift::String v37 = v36._object;
    String.append(_:)(v36);
    swift_bridgeObjectRelease(v37);
    uint64_t v38 = *(void *)(v0 + 168);
    logDebug(_:_:)(v26, *(void *)(v0 + 160), v38);
    swift_bridgeObjectRelease(v38);
    uint64_t v39 = *(void (**)(uint64_t, id))(v29 + 8);
    *(void *)(v0 + 360) = v39;
    v39(v26, v28);
    if (!*(void *)(v25 + 16))
    {
      uint64_t v54 = *(void *)(v0 + 312);
      uint64_t v55 = *(void **)(v0 + 288);
      swift_bridgeObjectRelease(*(void *)(v0 + 264));
      uint64_t v56 = swift_bridgeObjectRelease(v25);
      static TipsLog.targeting.getter(v56);
      _StringGuts.grow(_:)(29LL);
      uint64_t v58 = ResultContext.resultId.getter(v57);
      uint64_t v60 = v59;
      swift_bridgeObjectRelease(0xE000000000000000LL);
      v61._object = (void *)0x8000000100015410LL;
      v61._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v61);
      log(_:_:)(v54, v58, v60);
      swift_bridgeObjectRelease(v60);
      v39(v54, v55);
      id v62 = *(id *)(v0 + 336);
      uint64_t v51 = ResultContext.resultId.getter(v62);
      uint64_t v52 = v63;

      Swift::String v53 = *(void **)(v0 + 336);
      goto LABEL_12;
    }

    uint64_t v40 = sub_10000E150(v25);
    swift_bridgeObjectRelease(v25);
    id v41 = objc_allocWithZone(&OBJC_CLASS___TPSDeliveryPrecondition);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v40);
    id v6 = [v41 initWithDictionary:isa];
    *(void *)(v0 + 36_Block_object_dispose(va, 8) = v6;

    if (v6)
    {
      id v68 = [v6 conditions];
      uint64_t v69 = sub_1000106F4(0LL, &qword_100022818, &OBJC_CLASS___TPSCondition_ptr);
      uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v68, v69);

      uint64_t v70 = swift_bridgeObjectRetain(v5);
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v70);
      uint64_t v71 = v5;
      goto LABEL_15;
    }

    uint64_t v44 = *(void *)(v0 + 312);
    id v6 = *(id *)(v0 + 288);
    static TipsLog.targeting.getter(v43);
    *(void *)(v0 + 20_Block_object_dispose(va, 8) = 0LL;
    *(void *)(v0 + 216) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(58LL);
    uint64_t v45 = *(void *)(v0 + 216);
    *(void *)(v0 + 144) = *(void *)(v0 + 208);
    *(void *)(v0 + 152) = v45;
    v47._countAndFlagsBits = ResultContext.resultId.getter(v46);
    uint64_t v48 = v47._object;
    String.append(_:)(v47);
    swift_bridgeObjectRelease(v48);
    v49._countAndFlagsBits = 0xD000000000000038LL;
    v49._object = (void *)0x80000001000153B0LL;
    String.append(_:)(v49);
    uint64_t v50 = *(void *)(v0 + 152);
    logError(_:_:)(v44, *(void *)(v0 + 144), v50);

    swift_bridgeObjectRelease(v50);
    v39(v44, v6);
  }

  __break(1u);
LABEL_17:
  if (v5 < 0) {
    uint64_t v82 = v5;
  }
  else {
    uint64_t v82 = v5 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v5);
  uint64_t v83 = sub_10000CA48(&qword_100022820);
  uint64_t v71 = _bridgeCocoaArray<A>(_:)(v82, v83);
  swift_bridgeObjectRelease(v5);
LABEL_15:
  uint64_t v72 = v0 + 16;
  uint64_t v73 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease(v5);
  uint64_t v74 = (void *)objc_opt_self(&OBJC_CLASS___TPSTargetingValidator);
  sub_10000CA48(&qword_100022820);
  Class v75 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 376) = v75;
  swift_bridgeObjectRelease(v71);
  id v76 = [v6 joinType];
  ResultContext.resultId.getter(v76);
  uint64_t v78 = v77;
  NSString v79 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 384) = v79;
  swift_bridgeObjectRelease(v78);
  *(void *)(v0 + 56) = v0 + 400;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_10000D200;
  uint64_t v80 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  v81 = (void *)(v0 + 80);
  v81[1] = 0x40000000LL;
  v81[2] = sub_10000E514;
  v81[3] = &unk_10001D0E0;
  v81[4] = v80;
  [v74 validateConditions:v75 joinType:v76 context:v79 cache:v73 completionQueue:0 completionHandler:v81];
  return swift_continuation_await(v72);
}

uint64_t sub_10000E0D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_1000227AC);
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100010910;
  return sub_10000CA88(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10000E150(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10000CA48(&qword_100022828);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v29 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

LABEL_27:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    int64_t v9 = v16;
LABEL_28:
    Swift::String v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_1000105E0(*(void *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(void *)&__int128 v40 = v20;
    *((void *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v20;
    *((void *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_10001072C(v39, v33);
    __int128 v34 = v30;
    __int128 v35 = v31;
    uint64_t v36 = v32;
    sub_10001072C(v33, v37);
    __int128 v30 = v34;
    __int128 v31 = v35;
    uint64_t v32 = v36;
    sub_10001072C(v37, v38);
    sub_10001072C(v38, &v34);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v21 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)]) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)&v7[8 * v23];
      }

      while (v27 == -1);
      unint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v10;
    uint64_t v11 = v3[6] + 40 * v10;
    *(_OWORD *)uint64_t v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(void *)(v11 + 32) = v32;
    uint64_t result = (uint64_t)sub_10001072C(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }

  int64_t v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10001073C(a1);
    return (uint64_t)v3;
  }

  unint64_t v15 = *(void *)(v29 + 8 * v17);
  if (v15)
  {
    int64_t v16 = v9 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v16 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v16 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_27;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10000E514(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_10000CA48(&qword_1000227F0);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    void *v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    **(_BYTE **)(*(void *)(v3 + 64) + 40LL) = a2;
    return swift_continuation_throwingResume(v3);
  }

uint64_t sub_10000E594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100010620(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_10001D0C8, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    int64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    int64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100022810, v16);
}

void sub_10000E758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    NSString v6 = 0LL;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0LL;
    goto LABEL_6;
  }

  NSString v6 = String._bridgeToObjectiveC()();
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = _convertErrorToNSError(_:)(a3);
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, NSString))(a4 + 16))(a4, v6);
}

uint64_t TPSDaemon.availableUserGuideIdentifiers(reply:)(uint64_t (*a1)(void *))
{
  uint64_t v2 = static UserGuideManager.userGuides()();
  uint64_t v3 = v2;
  if (!((unint64_t)v2 >> 62))
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain(v2);
    int64_t v17 = (void (*)(char *))a1;
    if (v4) {
      goto LABEL_4;
    }
LABEL_20:
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease_n(v3, 2LL);
    v17(v7);
    return swift_bridgeObjectRelease(v7);
  }

  if (v2 < 0) {
    uint64_t v16 = v2;
  }
  else {
    uint64_t v16 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v2);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v16);
  uint64_t v4 = result;
  int64_t v17 = (void (*)(char *))a1;
  if (!result) {
    goto LABEL_20;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if ((v3 & 0xC000000000000001LL) != 0) {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      uint64_t v10 = UserGuide.identifier.getter();
      uint64_t v12 = v11;

      if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0) {
        uint64_t v7 = sub_10000FA8C(0LL, *((void *)v7 + 2) + 1LL, 1, v7);
      }
      unint64_t v14 = *((void *)v7 + 2);
      unint64_t v13 = *((void *)v7 + 3);
      if (v14 >= v13 >> 1) {
        uint64_t v7 = sub_10000FA8C((char *)(v13 > 1), v14 + 1, 1, v7);
      }
      ++v6;
      *((void *)v7 + 2) = v14 + 1;
      unsigned __int8 v15 = &v7[16 * v14];
      *((void *)v15 + 4) = v10;
      *((void *)v15 + 5) = v12;
    }

    while (v4 != v6);
    goto LABEL_21;
  }

  __break(1u);
  return result;
}

uint64_t TPSDaemon.fetchDocument(identifier:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_10000CA48(&qword_1000227A0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v11, 1LL, 1LL, v12);
  unint64_t v13 = (void *)swift_allocObject(&unk_10001CF98, 72LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = v4;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a1;
  v13[8] = a2;
  id v14 = v4;
  swift_retain(a4);
  swift_bridgeObjectRetain(a2);
  uint64_t v15 = sub_10000E594((uint64_t)v11, (uint64_t)&unk_1000227C0, (uint64_t)v13);
  return swift_release(v15);
}

uint64_t sub_10000EAFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[23] = a7;
  v8[24] = a8;
  v8[21] = a5;
  v8[22] = a6;
  v8[20] = a4;
  uint64_t v9 = type metadata accessor for TipsLog(0LL);
  v8[25] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[26] = v10;
  v8[27] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v8[28] = v11;
  void *v11 = v8;
  v11[1] = sub_10000EBB8;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( v8 + 32,  0LL,  0LL,  0xD000000000000023LL,  0x80000001000152A0LL,  sub_10000F5C8,  0LL,  &type metadata for Bool);
}

uint64_t sub_10000EBB8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 224LL);
  *(void *)(*(void *)v1 + 232LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_10000ED60;
  }
  else {
    uint64_t v3 = sub_10000EC1C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

id sub_10000EC1C()
{
  if (*(_BYTE *)(v0 + 256) == 1)
  {
    id result = [*(id *)(v0 + 160) tipsManager];
    *(void *)(v0 + 240) = result;
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = v0 + 16;
      *(void *)(v0 + 56) = v0 + 152;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_10000EE88;
      uint64_t v4 = swift_continuation_init(v0 + 16, 1LL);
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      uint64_t v5 = (void *)(v0 + 80);
      v5[1] = 0x40000000LL;
      v5[2] = sub_10000F398;
      v5[3] = &unk_10001D050;
      v5[4] = v4;
      [v2 contentFromOrigin:0 processTipKitContent:0 contextualEligibility:0 widgetEligibility:0 notificationEligibility:0 preferred NotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:v5];
      return (id)swift_continuation_await(v3);
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    uint64_t v6 = *(void (**)(void, uint64_t))(v0 + 168);
    unint64_t v7 = sub_100010284();
    uint64_t v8 = swift_allocError(&_s12ServiceErrorON, v7, 0LL, 0LL);
    _BYTE *v9 = 2;
    v6(0LL, v8);
    swift_errorRelease(v8);
    swift_task_dealloc(*(void *)(v0 + 216));
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }

  return result;
}

uint64_t sub_10000ED60()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v5 = *(void (**)(void, uint64_t))(v0 + 168);
  static TipsLog.data.getter();
  _StringGuts.grow(_:)(34LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  swift_getErrorValue(v1, v0 + 144, v0 + 120);
  v6._countAndFlagsBits = Error.localizedDescription.getter(*(void *)(v0 + 128), *(void *)(v0 + 136));
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  logError(_:_:)(v2, 0xD000000000000020LL, 0x80000001000152D0LL);
  swift_bridgeObjectRelease(0x80000001000152D0LL);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_errorRetain(v1);
  v5(0LL, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  swift_task_dealloc(*(void *)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000EE88()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 248LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10000F264;
  }
  else {
    uint64_t v2 = sub_10000EEE8;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000EEE8()
{
  uint64_t v1 = *(void **)(v0 + 152);

  id v2 = [v1 collectionMap];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_1000106F4(0LL, &qword_1000227E8, &OBJC_CLASS___TPSCollection_ptr);
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v3,  &type metadata for String,  v4,  &protocol witness table for String);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  id v6 = [v1 tipMap];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = sub_1000106F4(0LL, &qword_1000227E0, &OBJC_CLASS___TPSTip_ptr);
    uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v7,  &type metadata for String,  v8,  &protocol witness table for String);

    if (!v5) {
      goto LABEL_16;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    if (!v5) {
      goto LABEL_16;
    }
  }

  if (*(void *)(v5 + 16))
  {
    uint64_t v11 = *(void *)(v0 + 184);
    uint64_t v10 = *(void *)(v0 + 192);
    swift_bridgeObjectRetain(v10);
    unint64_t v12 = sub_10000F948(v11, v10);
    uint64_t v13 = *(void *)(v0 + 192);
    if ((v14 & 1) != 0)
    {
      id v15 = *(id *)(*(void *)(v5 + 56) + 8 * v12);
      swift_bridgeObjectRelease(v5);
      id v6 = (id)swift_bridgeObjectRelease(v13);
      if (v9) {
        goto LABEL_17;
      }
LABEL_11:
      if (v15)
      {
        uint64_t v9 = 0LL;
LABEL_22:
        swift_bridgeObjectRelease(v9);
        goto LABEL_23;
      }

LABEL_25:
      uint64_t v29 = *(void *)(v0 + 208);
      uint64_t v28 = *(void *)(v0 + 216);
      __int128 v31 = *(void **)(v0 + 192);
      uint64_t v30 = *(void *)(v0 + 200);
      uint64_t v32 = *(void *)(v0 + 184);
      uint64_t v33 = *(void (**)(void, uint64_t))(v0 + 168);
      static TipsLog.data.getter(v6);
      _StringGuts.grow(_:)(27LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      strcpy((char *)v40, "Document with ");
      HIBYTE(v40[1]) = -18;
      v34._countAndFlagsBits = v32;
      v34._object = v31;
      String.append(_:)(v34);
      v35._countAndFlagsBits = 0x756F6620746F6E20LL;
      v35._object = (void *)0xEB000000002E646ELL;
      String.append(_:)(v35);
      logDebug(_:_:)(v28, v40[0], v40[1]);
      swift_bridgeObjectRelease(v40[1]);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      unint64_t v36 = sub_100010284();
      uint64_t v37 = swift_allocError(&_s12ServiceErrorON, v36, 0LL, 0LL);
      *uint64_t v38 = 0;
      v33(0LL, v37);
      swift_errorRelease(v37);
      goto LABEL_26;
    }

    swift_bridgeObjectRelease(v5);
    uint64_t v16 = v13;
  }

  else
  {
    uint64_t v16 = v5;
  }

  id v6 = (id)swift_bridgeObjectRelease(v16);
LABEL_16:
  id v15 = 0LL;
  if (!v9) {
    goto LABEL_11;
  }
LABEL_17:
  if (!*(void *)(v9 + 16))
  {
LABEL_21:
    if (v15) {
      goto LABEL_22;
    }
    uint64_t v26 = *(void *)(v0 + 184);
    uint64_t v25 = *(void *)(v0 + 192);
    swift_bridgeObjectRetain(v25);
    sub_1000102C8(v9, v26, v25);
    id v15 = v27;
    swift_bridgeObjectRelease(v25);
    id v6 = (id)swift_bridgeObjectRelease(v9);
    if (v15) {
      goto LABEL_23;
    }
    goto LABEL_25;
  }

  uint64_t v18 = *(void *)(v0 + 184);
  uint64_t v17 = *(void *)(v0 + 192);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v9);
  unint64_t v19 = sub_10000F948(v18, v17);
  uint64_t v20 = *(void *)(v0 + 192);
  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v20);
    goto LABEL_21;
  }

  id v22 = *(id *)(*(void *)(v9 + 56) + 8 * v19);
  swift_bridgeObjectRelease_n(v9, 2LL);
  swift_bridgeObjectRelease(v20);

  id v15 = v22;
LABEL_23:
  unint64_t v23 = *(void (**)(id, void))(v0 + 168);
  id v24 = v15;
  v23(v15, 0LL);

LABEL_26:
  swift_task_dealloc(*(void *)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F264()
{
  uint64_t v1 = *(void **)(v0 + 240);
  swift_willThrow();

  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 200);
  id v6 = *(void (**)(void, uint64_t))(v0 + 168);
  static TipsLog.data.getter();
  _StringGuts.grow(_:)(34LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  swift_getErrorValue(v2, v0 + 144, v0 + 120);
  v7._countAndFlagsBits = Error.localizedDescription.getter(*(void *)(v0 + 128), *(void *)(v0 + 136));
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  logError(_:_:)(v3, 0xD000000000000020LL, 0x80000001000152D0LL);
  swift_bridgeObjectRelease(0x80000001000152D0LL);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_errorRetain(v2);
  v6(0LL, v2);
  swift_errorRelease(v2);
  swift_errorRelease(v2);
  swift_task_dealloc(*(void *)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F398(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    uint64_t v5 = sub_10000CA48(&qword_1000227F0);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    void *v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else if (a2)
  {
    **(void **)(*(void *)(v3 + 64) + 40LL) = a2;
    id v9 = a2;
    return swift_continuation_throwingResume(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_10000F570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_10000F5C8(uint64_t a1)
{
  uint64_t v2 = sub_10000CA48(&qword_1000227F8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v5 = [objc_allocWithZone(TPSDeviceCapability) init];
  [v5 setType:2];
  [v5 setKey:kTPSCapabilitySiriLanguageMatchesSystemLanguageEnabled];
  id v6 =  [(id)objc_opt_self(TPSCustomCapabilityValidationBuilder) targetValidationForCapability:v5];
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))( (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v2);
  uint64_t v7 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = (v7 + 16) & ~v7;
  uint64_t v9 = swift_allocObject(&unk_10001D078, v8 + v4, v7 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))( v9 + v8,  (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v2);
  aBlock[4] = sub_100010558;
  uint64_t v13 = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000F810;
  aBlock[3] = &unk_10001D090;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release(v13);
  [v6 getCurrentStateWithCompletion:v10];
  _Block_release(v10);

  return swift_unknownObjectRelease(v6);
}

uint64_t sub_10000F770(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v7[0] = a2;
    swift_errorRetain(a2);
    uint64_t v2 = sub_10000CA48(&qword_1000227F8);
    return CheckedContinuation.resume(throwing:)(v7, v2);
  }

  else
  {
    sub_1000105E0(a1, (uint64_t)v7);
    char v4 = swift_dynamicCast(&v6, v7, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL);
    LOBYTE(v7[0]) = v4 & v6;
    uint64_t v5 = sub_10000CA48(&qword_1000227F8);
    return CheckedContinuation.resume(returning:)(v7, v5);
  }

uint64_t sub_10000F810(uint64_t a1, uint64_t a2, void *a3)
{
  char v6 = *(void (**)(void *, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[3] = swift_getObjectType(a2);
  v9[0] = a2;
  swift_retain(v5);
  swift_unknownObjectRetain(a2);
  id v7 = a3;
  v6(v9, a3);
  swift_release(v5);

  return sub_1000105C0(v9);
}

uint64_t sub_10000F898(uint64_t a1, int *a2)
{
  char v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  char v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000F8FC;
  return v6(a1);
}

uint64_t sub_10000F8FC()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_10000F948(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10000F9AC(a1, a2, v5);
}

unint64_t sub_10000F9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

char *sub_10000FA8C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000CA48(&qword_100022800);
    BOOL v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    BOOL v11 = (char *)&_swiftEmptyArrayStorage;
  }

  BOOL v14 = v11 + 32;
  id v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_10000FB90(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  BOOL v11 = (void *)swift_task_alloc(dword_1000227BC);
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_100010910;
  return sub_10000EAFC(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_10000FC24(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000FC30()
{
  swift_release(*(void *)(v0 + 48));
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  return swift_deallocObject(v0, 72LL, 7LL);
}

uint64_t sub_10000FC6C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  BOOL v11 = (void *)swift_task_alloc(dword_1000227BC);
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_10000FD00;
  return sub_10000EAFC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10000FD00()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000FD48(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_10000CA48(&qword_1000227A0);
  __chkstk_darwin(v4);
  v30[0] = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TipsLog(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  int64_t v12 = (char *)v30 - v11;
  uint64_t v13 = swift_allocObject(&unk_10001D010, 24LL, 7LL);
  *(void *)(v13 + 16) = a2;
  BOOL v14 = _Block_copy(a2);
  static TipsLog.default.getter(v14);
  unint64_t v31 = 0LL;
  unint64_t v32 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(32LL);
  swift_bridgeObjectRelease(v32);
  unint64_t v31 = 0xD00000000000001ELL;
  unint64_t v32 = 0x8000000100015230LL;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v29 = a1;
    }
    else {
      uint64_t v29 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter(v29);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v15 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  v30[1] = v15;
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(object);
  unint64_t v18 = v32;
  logDebug(_:_:)(v12, v31, v32);
  swift_bridgeObjectRelease(v18);
  unint64_t v19 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t v20 = v19(v12, v6);
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v26 = a1;
    }
    else {
      uint64_t v26 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v26);
    uint64_t v20 = swift_bridgeObjectRelease(a1);
    if (v27) {
      goto LABEL_5;
    }
LABEL_10:
    static TipsLog.targeting.getter(v20);
    log(_:_:)(v10, 0xD000000000000028LL, 0x8000000100015250LL);
    v19(v10, v6);
    a2[2](a2, 0LL, 0LL);
    uint64_t v25 = v13;
    return swift_release(v25);
  }

  if (!*(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = v30[0];
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v30[0], 1LL, 1LL, v21);
  unint64_t v23 = (void *)swift_allocObject(&unk_10001D038, 56LL, 7LL);
  v23[2] = 0LL;
  v23[3] = 0LL;
  v23[4] = a1;
  v23[5] = sub_100010244;
  v23[6] = v13;
  swift_bridgeObjectRetain(a1);
  swift_retain(v13);
  uint64_t v24 = sub_10000E594(v22, (uint64_t)&unk_1000227D0, (uint64_t)v23);
  swift_release(v13);
  uint64_t v25 = v24;
  return swift_release(v25);
}

void sub_100010034(uint64_t a1)
{
  if (![(id)objc_opt_self(TPSCommonDefines) supportsUserGuide])
  {
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t))(a1 + 16))(a1);
LABEL_22:

    return;
  }

  type metadata accessor for UserGuideManager(0LL);
  uint64_t v2 = static UserGuideManager.userGuides()();
  uint64_t v3 = v2;
  if (!((unint64_t)v2 >> 62))
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v2);
    if (v4) {
      goto LABEL_4;
    }
LABEL_20:
    uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease_n(v3, 2LL);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t))(a1 + 16))(a1);
    swift_bridgeObjectRelease(v6);
    goto LABEL_22;
  }

  if (v2 < 0) {
    uint64_t v15 = v2;
  }
  else {
    uint64_t v15 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v2);
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v15);
  if (!v4) {
    goto LABEL_20;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if ((v3 & 0xC000000000000001LL) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5);
      }
      else {
        id v7 = *(id *)(v3 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      uint64_t v9 = UserGuide.identifier.getter();
      uint64_t v11 = v10;

      if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0) {
        uint64_t v6 = sub_10000FA8C(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
      }
      unint64_t v13 = *((void *)v6 + 2);
      unint64_t v12 = *((void *)v6 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v6 = sub_10000FA8C((char *)(v12 > 1), v13 + 1, 1, v6);
      }
      ++v5;
      *((void *)v6 + 2) = v13 + 1;
      BOOL v14 = &v6[16 * v13];
      *((void *)v14 + 4) = v9;
      *((void *)v14 + 5) = v11;
    }

    while (v4 != v5);
    goto LABEL_21;
  }

  __break(1u);
}

uint64_t sub_100010220()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100010244(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_100010250()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

unint64_t sub_100010284()
{
  unint64_t result = qword_1000227D8;
  if (!qword_1000227D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000148E8, &_s12ServiceErrorON);
    atomic_store(result, (unint64_t *)&qword_1000227D8);
  }

  return result;
}

void sub_1000102C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v7 = -1LL;
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v24 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0LL;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_22;
    }

    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_32;
    }

    if (v12 >= v24) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v24) {
        goto LABEL_28;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v24) {
          goto LABEL_28;
        }
        unint64_t v13 = *(void *)(v23 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v24) {
            goto LABEL_28;
          }
          unint64_t v13 = *(void *)(v23 + 8 * v9);
          if (!v13)
          {
            int64_t v14 = v12 + 4;
            if (v14 >= v24) {
              goto LABEL_28;
            }
            unint64_t v13 = *(void *)(v23 + 8 * v14);
            int64_t v9 = v14;
            if (!v13) {
              break;
            }
          }
        }
      }
    }

LABEL_21:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_22:
    id v15 = *(id *)(*(void *)(a1 + 56) + 8 * v11);
    id v16 = [v15 correlationID];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v20 = v19;

      if (v18 == a2 && v20 == a3)
      {
        swift_release(a1);
        swift_bridgeObjectRelease(a3);
        return;
      }

      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, a2, a3, 0LL);
      swift_bridgeObjectRelease(v20);
      if ((v22 & 1) != 0)
      {
LABEL_28:
        swift_release(a1);
        return;
      }
    }
  }

  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v9 >= v24) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_21;
    }
  }

LABEL_32:
  __break(1u);
}

uint64_t sub_1000104F4()
{
  uint64_t v1 = sub_10000CA48(&qword_1000227F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100010558(uint64_t a1, uint64_t a2)
{
  return sub_10000F770(a1, a2);
}

uint64_t sub_1000105A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000105B8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000105C0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000105E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010620(uint64_t a1)
{
  uint64_t v2 = sub_10000CA48(&qword_1000227A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100010660()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100010684(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10002280C);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000FD00;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100022808 + dword_100022808))(a1, v4);
}

uint64_t sub_1000106F4(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

_OWORD *sub_10001072C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001073C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_BYTE *_s12ServiceErrorOwCP(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t _s12ServiceErrorOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t _s12ServiceErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_100010830 + 4 * byte_100014815[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100010864 + 4 * byte_100014810[v4]))();
}

uint64_t sub_100010864(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001086C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100010874LL);
  }
  return result;
}

uint64_t sub_100010880(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100010888LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_10001088C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010894(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000108A0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000108AC(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *_s12ServiceErrorOMa()
{
  return &_s12ServiceErrorON;
}

unint64_t sub_1000108CC()
{
  unint64_t result = qword_100022830;
  if (!qword_100022830)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000148C0, &_s12ServiceErrorON);
    atomic_store(result, (unint64_t *)&qword_100022830);
  }

  return result;
}

void sub_100010918()
{
}

void sub_10001097C()
{
}

void sub_1000109A8()
{
}

void sub_100010A08()
{
}

void sub_100010A34()
{
}

void sub_100010A94(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 URL]);
  sub_10000C224();
  sub_10000C218((void *)&_mh_execute_header, a2, v4, "discretionary task with URL %@", v5);
}

void sub_100010B1C()
{
}

void sub_100010B48( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010BB0()
{
}

void sub_100010BDC()
{
}

void sub_100010C08()
{
}

void sub_100010C34()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "VersionTokens %@, minor version %ld",  v2,  0x16u);
  sub_10000C210();
}

void sub_100010CB0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010D1C()
{
}

void sub_100010D48()
{
}

void sub_100010D74()
{
}

void sub_100010DA0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010E08(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  int64_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Error downloading remote tip %@, %@",  (uint8_t *)&v6,  0x16u);
}

void sub_100010EB8()
{
}

void sub_100010F1C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__addAppXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAppXPCConnection:");
}

id objc_msgSend__addAssistantXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAssistantXPCConnection:");
}

id objc_msgSend__addDiscoverabilityXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addDiscoverabilityXPCConnection:");
}

id objc_msgSend__adoptPersonaForContainerLookupIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _adoptPersonaForContainerLookupIfNeeded];
}

id objc_msgSend__appXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appXPCConnectionContainsConnection:");
}

id objc_msgSend__assistantXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assistantXPCConnectionContainsConnection:");
}

id objc_msgSend__clearDisplayedContentIDs(void *a1, const char *a2, ...)
{
  return _[a1 _clearDisplayedContentIDs];
}

id objc_msgSend__discoverabilityXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discoverabilityXPCConnectionContainsConnection:");
}

id objc_msgSend__errorForHintIneligibleReason_contentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorForHintIneligibleReason:contentID:");
}

id objc_msgSend__listDisplayContentIDs(void *a1, const char *a2, ...)
{
  return _[a1 _listDisplayContentIDs];
}

id objc_msgSend__removeAppXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAppXPCConnection:");
}

id objc_msgSend__removeAssistantXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAssistantXPCConnection:");
}

id objc_msgSend__removeDiscoverabilityXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDiscoverabilityXPCConnection:");
}

id objc_msgSend_activatedCollections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedCollections:");
}

id objc_msgSend_addBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBarrierBlock:");
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDependency:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addHintDisplayedForIdentifier_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHintDisplayedForIdentifier:context:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_analyticsExperiment(void *a1, const char *a2, ...)
{
  return _[a1 analyticsExperiment];
}

id objc_msgSend_appConnections(void *a1, const char *a2, ...)
{
  return _[a1 appConnections];
}

id objc_msgSend_appGroupDefaults(void *a1, const char *a2, ...)
{
  return _[a1 appGroupDefaults];
}

id objc_msgSend_appRemovalCleanupIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 appRemovalCleanupIfNeeded];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 assetIdentifier];
}

id objc_msgSend_assetPathFromAssetConfiguration_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetPathFromAssetConfiguration:type:");
}

id objc_msgSend_assistantConnections(void *a1, const char *a2, ...)
{
  return _[a1 assistantConnections];
}

id objc_msgSend_assistantSupportInterface(void *a1, const char *a2, ...)
{
  return _[a1 assistantSupportInterface];
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_bodyContent(void *a1, const char *a2, ...)
{
  return _[a1 bodyContent];
}

id objc_msgSend_bodyText(void *a1, const char *a2, ...)
{
  return _[a1 bodyText];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cacheIdentifierForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheIdentifierForType:");
}

id objc_msgSend_cachedUserGuideMap(void *a1, const char *a2, ...)
{
  return _[a1 cachedUserGuideMap];
}

id objc_msgSend_camp(void *a1, const char *a2, ...)
{
  return _[a1 camp];
}

id objc_msgSend_cancelQueryWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelQueryWithIdentifier:");
}

id objc_msgSend_clearCachedUserGuides(void *a1, const char *a2, ...)
{
  return _[a1 clearCachedUserGuides];
}

id objc_msgSend_clearDataCache(void *a1, const char *a2, ...)
{
  return _[a1 clearDataCache];
}

id objc_msgSend_clearNotificationCache(void *a1, const char *a2, ...)
{
  return _[a1 clearNotificationCache];
}

id objc_msgSend_clearNotificationCount(void *a1, const char *a2, ...)
{
  return _[a1 clearNotificationCount];
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientBundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 collectionIdentifier];
}

id objc_msgSend_collectionIdentifierForCurrentUserType(void *a1, const char *a2, ...)
{
  return _[a1 collectionIdentifierForCurrentUserType];
}

id objc_msgSend_collectionMap(void *a1, const char *a2, ...)
{
  return _[a1 collectionMap];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentForVariantIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentForVariantIdentifiers:completionHandler:");
}

id objc_msgSend_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "contentFromOrigin:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:prefer redNotificationIdentifiers:shouldDeferBlock:completionHandler:");
}

id objc_msgSend_contentUpdatePostProcessingContentPackage_shouldUpdateNotification_shouldDeferBlock_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentUpdatePostProcessingContentPackage:shouldUpdateNotification:shouldDeferBlock:error:");
}

id objc_msgSend_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "contextualEligibilityWithTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:experimentCampChangesToAll:");
}

id objc_msgSend_contextualEventsForIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 contextualEventsForIdentifiers];
}

id objc_msgSend_contextualInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextualInfoForIdentifier:");
}

id objc_msgSend_contextualInfoMap(void *a1, const char *a2, ...)
{
  return _[a1 contextualInfoMap];
}

id objc_msgSend_contextualTipsInactive(void *a1, const char *a2, ...)
{
  return _[a1 contextualTipsInactive];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return _[a1 correlationID];
}

id objc_msgSend_correlationIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "correlationIdentifierForIdentifier:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createWelcomeXPCActivity(void *a1, const char *a2, ...)
{
  return _[a1 createWelcomeXPCActivity];
}

id objc_msgSend_customizationIDForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customizationIDForContentID:");
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return _[a1 daemon];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_default(void *a1, const char *a2, ...)
{
  return _[a1 default];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _[a1 defaultContext];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllSearchableItemsWithCompletionHandler:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceLocalesContainLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceLocalesContainLanguage:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoverability(void *a1, const char *a2, ...)
{
  return _[a1 discoverability];
}

id objc_msgSend_discoverabilityConnections(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilityConnections];
}

id objc_msgSend_discoverabilityController(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilityController];
}

id objc_msgSend_displayBundleID(void *a1, const char *a2, ...)
{
  return _[a1 displayBundleID];
}

id objc_msgSend_displayDarwinNotificationKey(void *a1, const char *a2, ...)
{
  return _[a1 displayDarwinNotificationKey];
}

id objc_msgSend_displayStatusCheckForHintIneligibleReasonWithContent_context_bypassExperiment_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStatusCheckForHintIneligibleReasonWithContent:context:bypassExperiment:");
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return _[a1 displayType];
}

id objc_msgSend_displayTypeStringForDisplayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayTypeStringForDisplayType:");
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return _[a1 document];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_donateContentRetrieved_bundleID_context_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateContentRetrieved:bundleID:context:error:");
}

id objc_msgSend_donateHintIneligibleReason_contentID_bundleID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateHintIneligibleReason:contentID:bundleID:context:");
}

id objc_msgSend_downloadedURL(void *a1, const char *a2, ...)
{
  return _[a1 downloadedURL];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _[a1 event];
}

id objc_msgSend_eventWithReason_alreadyRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithReason:alreadyRunning:");
}

id objc_msgSend_eventWithTipID_correlationID_bundleID_context_displayType_reason_date_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithTipID:correlationID:bundleID:context:displayType:reason:date:");
}

id objc_msgSend_eventWithTipID_correlationID_bundleID_context_serviceError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithTipID:correlationID:bundleID:context:serviceError:");
}

id objc_msgSend_eventsHistoryController(void *a1, const char *a2, ...)
{
  return _[a1 eventsHistoryController];
}

id objc_msgSend_experiment(void *a1, const char *a2, ...)
{
  return _[a1 experiment];
}

id objc_msgSend_experimentCampIDStringForCamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "experimentCampIDStringForCamp:");
}

id objc_msgSend_fetchNotificationAssetIfNeededCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchNotificationAssetIfNeededCompletionHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getCurrentWelcomeActivityCriteria(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentWelcomeActivityCriteria];
}

id objc_msgSend_handleDeviceFirstUnlockNotification(void *a1, const char *a2, ...)
{
  return _[a1 handleDeviceFirstUnlockNotification];
}

id objc_msgSend_handleLanguageDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 handleLanguageDidChangeNotification];
}

id objc_msgSend_hasWidgetDocument(void *a1, const char *a2, ...)
{
  return _[a1 hasWidgetDocument];
}

id objc_msgSend_hintDisplayedDates(void *a1, const char *a2, ...)
{
  return _[a1 hintDisplayedDates];
}

id objc_msgSend_hintDisplayedForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintDisplayedForContentID:");
}

id objc_msgSend_hintDisplayedForIdentifier_correlationID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintDisplayedForIdentifier:correlationID:context:");
}

id objc_msgSend_hintInelgibileReasonForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintInelgibileReasonForIdentifier:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreCloud(void *a1, const char *a2, ...)
{
  return _[a1 ignoreCloud];
}

id objc_msgSend_immediateNotificationForIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "immediateNotificationForIdentifiers:");
}

id objc_msgSend_immediateNotificationIdentifierForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "immediateNotificationIdentifierForType:");
}

id objc_msgSend_indexContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexContentPackage:");
}

id objc_msgSend_indexTips_qualityOfService_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexTips:qualityOfService:completionHandler:");
}

id objc_msgSend_indexUserGuides_qualityOfService_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexUserGuides:qualityOfService:completionHandler:");
}

id objc_msgSend_indexing(void *a1, const char *a2, ...)
{
  return _[a1 indexing];
}

id objc_msgSend_ineligibleReasonStringForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ineligibleReasonStringForReason:");
}

id objc_msgSend_initWithAllTipStatus_contextualInfoMap_eventHistoryMap_experiment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAllTipStatus:contextualInfoMap:eventHistoryMap:experiment:");
}

id objc_msgSend_initWithAssetIdentifier_assetURLPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetIdentifier:assetURLPath:");
}

id objc_msgSend_initWithAsyncBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAsyncBlock:");
}

id objc_msgSend_initWithAuthenticationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAuthenticationContext:");
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContent:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDelegate_tipsManager_notificationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:tipsManager:notificationController:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithTipID_correlationID_bundleID_reason_context_date_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTipID:correlationID:bundleID:reason:context:date:");
}

id objc_msgSend_initWithTipID_correlationID_reason_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTipID:correlationID:reason:context:");
}

id objc_msgSend_initWithTipStatusController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTipStatusController:");
}

id objc_msgSend_initWithVideoIdentifier_videoURL_imageIdentifier_imageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVideoIdentifier:videoURL:imageIdentifier:imageURL:");
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _[a1 initialize];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_isAppValidWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppValidWithBundleIdentifier:");
}

id objc_msgSend_isBetaBuild(void *a1, const char *a2, ...)
{
  return _[a1 isBetaBuild];
}

id objc_msgSend_isContentHintDisplayMaxDisplayedCountExceededForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentHintDisplayMaxDisplayedCountExceededForIdentifier:");
}

id objc_msgSend_isContentIdentifierHoldoutCamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentIdentifierHoldoutCamp:");
}

id objc_msgSend_isContentIneligibleDueToViewOnOtherDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentIneligibleDueToViewOnOtherDevices:");
}

id objc_msgSend_isContextualInfoExistForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContextualInfoExistForIdentifier:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHintDisplayed(void *a1, const char *a2, ...)
{
  return _[a1 isHintDisplayed];
}

id objc_msgSend_isHintDisplayedOnCloudDevices(void *a1, const char *a2, ...)
{
  return _[a1 isHintDisplayedOnCloudDevices];
}

id objc_msgSend_isHintInelgibileForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHintInelgibileForIdentifier:");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isInternalDevice(void *a1, const char *a2, ...)
{
  return _[a1 isInternalDevice];
}

id objc_msgSend_isLocalContent(void *a1, const char *a2, ...)
{
  return _[a1 isLocalContent];
}

id objc_msgSend_isNotificationSettingValid(void *a1, const char *a2, ...)
{
  return _[a1 isNotificationSettingValid];
}

id objc_msgSend_isPreconditionMatchedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreconditionMatchedForIdentifier:");
}

id objc_msgSend_isPreconditionValidForIdentifier_preconditionDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreconditionValidForIdentifier:preconditionDictionary:");
}

id objc_msgSend_isReminderCompleted(void *a1, const char *a2, ...)
{
  return _[a1 isReminderCompleted];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_lastDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 lastDisplayContext];
}

id objc_msgSend_lastFetchedLanguage(void *a1, const char *a2, ...)
{
  return _[a1 lastFetchedLanguage];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_logAnalyticsEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAnalyticsEvent:");
}

id objc_msgSend_logAnalyticsEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAnalyticsEvents:");
}

id objc_msgSend_logDaemonActiveEventWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDaemonActiveEventWithReason:");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return _[a1 majorVersion];
}

id objc_msgSend_markHintIneligibleForIdentifiers_bundleID_context_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markHintIneligibleForIdentifiers:bundleID:context:reason:");
}

id objc_msgSend_markHintIneligibleForIdentifiers_context_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markHintIneligibleForIdentifiers:context:reason:");
}

id objc_msgSend_miniContent(void *a1, const char *a2, ...)
{
  return _[a1 miniContent];
}

id objc_msgSend_miniTipMetadataForContent_bundleID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "miniTipMetadataForContent:bundleID:context:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_monitoringEventsForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoringEventsForContentID:");
}

id objc_msgSend_multiuserModeOn(void *a1, const char *a2, ...)
{
  return _[a1 multiuserModeOn];
}

id objc_msgSend_needImmediateNotificationForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needImmediateNotificationForType:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationCache(void *a1, const char *a2, ...)
{
  return _[a1 notificationCache];
}

id objc_msgSend_notificationController(void *a1, const char *a2, ...)
{
  return _[a1 notificationController];
}

id objc_msgSend_notificationController_markIdentifier_type_ineligibleWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationController:markIdentifier:type:ineligibleWithReason:");
}

id objc_msgSend_notificationDocument(void *a1, const char *a2, ...)
{
  return _[a1 notificationDocument];
}

id objc_msgSend_notificationTimingDarwinKey(void *a1, const char *a2, ...)
{
  return _[a1 notificationTimingDarwinKey];
}

id objc_msgSend_notifiedCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifiedCollection:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 performMigrationIfNeeded];
}

id objc_msgSend_performQuery_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performQuery:completion:");
}

id objc_msgSend_preconditions(void *a1, const char *a2, ...)
{
  return _[a1 preconditions];
}

id objc_msgSend_prepareForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 prepareForNotifications];
}

id objc_msgSend_processAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 processAnalytics];
}

id objc_msgSend_processAppInteractedByUser(void *a1, const char *a2, ...)
{
  return _[a1 processAppInteractedByUser];
}

id objc_msgSend_processUserGuidesFromContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUserGuidesFromContentPackage:");
}

id objc_msgSend_reconnectWelcomeIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconnectWelcomeIfNeeded:");
}

id objc_msgSend_registerDarwinNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDarwinNotification:");
}

id objc_msgSend_registerForMobileKeyBagLockStatusNotify(void *a1, const char *a2, ...)
{
  return _[a1 registerForMobileKeyBagLockStatusNotify];
}

id objc_msgSend_registerImmediateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerImmediateNotifications];
}

id objc_msgSend_registerToNotifyWelcome(void *a1, const char *a2, ...)
{
  return _[a1 registerToNotifyWelcome];
}

id objc_msgSend_reindexAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexAllSearchableItemsWithCompletionHandler:");
}

id objc_msgSend_reindexSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexSearchableItemsWithIdentifiers:completionHandler:");
}

id objc_msgSend_reloadAppGroupDefaults(void *a1, const char *a2, ...)
{
  return _[a1 reloadAppGroupDefaults];
}

id objc_msgSend_reminderState(void *a1, const char *a2, ...)
{
  return _[a1 reminderState];
}

id objc_msgSend_removeAllNotifications(void *a1, const char *a2, ...)
{
  return _[a1 removeAllNotifications];
}

id objc_msgSend_removeAssetCacheDirectory(void *a1, const char *a2, ...)
{
  return _[a1 removeAssetCacheDirectory];
}

id objc_msgSend_removeContextualInfoCache(void *a1, const char *a2, ...)
{
  return _[a1 removeContextualInfoCache];
}

id objc_msgSend_removeExperimentCache(void *a1, const char *a2, ...)
{
  return _[a1 removeExperimentCache];
}

id objc_msgSend_removeNotificationCache(void *a1, const char *a2, ...)
{
  return _[a1 removeNotificationCache];
}

id objc_msgSend_removeNotificationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationWithIdentifier:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeWelcomeDocumentCache(void *a1, const char *a2, ...)
{
  return _[a1 removeWelcomeDocumentCache];
}

id objc_msgSend_removeWidgetUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 removeWidgetUpdateDate];
}

id objc_msgSend_resetAllDataIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 resetAllDataIfNeeded];
}

id objc_msgSend_resetAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 resetAnalytics];
}

id objc_msgSend_resetBasicDefaults(void *a1, const char *a2, ...)
{
  return _[a1 resetBasicDefaults];
}

id objc_msgSend_resetDaemonData(void *a1, const char *a2, ...)
{
  return _[a1 resetDaemonData];
}

id objc_msgSend_resetWelcomeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 resetWelcomeNotifications];
}

id objc_msgSend_restartTriggerTrackingIfNotDisplayedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restartTriggerTrackingIfNotDisplayedForIdentifier:");
}

id objc_msgSend_restartTriggerTrackingIfNotDisplayedForIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restartTriggerTrackingIfNotDisplayedForIdentifiers:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_revertTipStatusArchivalIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 revertTipStatusArchivalIfNeeded];
}

id objc_msgSend_rulesVersion(void *a1, const char *a2, ...)
{
  return _[a1 rulesVersion];
}

id objc_msgSend_scheduleWelcomeNotificationActivity(void *a1, const char *a2, ...)
{
  return _[a1 scheduleWelcomeNotificationActivity];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAuthenticationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationHandler:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCustomizationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomizationID:");
}

id objc_msgSend_setDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataProvider:");
}

id objc_msgSend_setDefaultSessionDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultSessionDelegate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExcludeCachingDataTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeCachingDataTypes:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setInteractivityMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractivityMode:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastMajorVersionUpdateDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMajorVersionUpdateDate:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMonitoringEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitoringEvents:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotificationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationController:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setTipsFeedURLSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTipsFeedURLSession:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserLanguage:");
}

id objc_msgSend_setWelcomeXPCActivityScheduleInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWelcomeXPCActivityScheduleInProgress:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_setupCompleted(void *a1, const char *a2, ...)
{
  return _[a1 setupCompleted];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldDeferBlockForXPCActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDeferBlockForXPCActivity:");
}

id objc_msgSend_shouldShowWelcomeNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowWelcomeNotification];
}

id objc_msgSend_showNewTipNotification(void *a1, const char *a2, ...)
{
  return _[a1 showNewTipNotification];
}

id objc_msgSend_showNotificationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNotificationWithCompletionHandler:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_statusCheckForHintIneligibleReasonWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCheckForHintIneligibleReasonWithContentID:");
}

id objc_msgSend_statusForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusForIdentifier:");
}

id objc_msgSend_stopWelcomeNotification(void *a1, const char *a2, ...)
{
  return _[a1 stopWelcomeNotification];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsRemoteIcon(void *a1, const char *a2, ...)
{
  return _[a1 supportsRemoteIcon];
}

id objc_msgSend_supportsWelcomeNotification(void *a1, const char *a2, ...)
{
  return _[a1 supportsWelcomeNotification];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_tipMap(void *a1, const char *a2, ...)
{
  return _[a1 tipMap];
}

id objc_msgSend_tipStatusController(void *a1, const char *a2, ...)
{
  return _[a1 tipStatusController];
}

id objc_msgSend_tipStatusForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipStatusForIdentifier:");
}

id objc_msgSend_tipStatusMap(void *a1, const char *a2, ...)
{
  return _[a1 tipStatusMap];
}

id objc_msgSend_tipsAppInstalled(void *a1, const char *a2, ...)
{
  return _[a1 tipsAppInstalled];
}

id objc_msgSend_tipsFeedURLSession(void *a1, const char *a2, ...)
{
  return _[a1 tipsFeedURLSession];
}

id objc_msgSend_tipsInValidState(void *a1, const char *a2, ...)
{
  return _[a1 tipsInValidState];
}

id objc_msgSend_tipsManager(void *a1, const char *a2, ...)
{
  return _[a1 tipsManager];
}

id objc_msgSend_tps_userLanguageCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tps_userLanguageCode");
}

id objc_msgSend_transactionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionWithName:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unregisterDarwinNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterDarwinNotification:");
}

id objc_msgSend_unregisterImmediateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterImmediateNotifications];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateContentFromOrigin_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotification Identifiers:shouldDeferBlock:completionHandler:");
}

id objc_msgSend_updateContentIfOverrideImmediately_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContentIfOverrideImmediately:");
}

id objc_msgSend_updateContentWithActivity_identifier_preferredNotificationIdentifiers_multiuserModeOn_contextualEligibility_widgetEligibility_notificationEligibility_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "updateContentWithActivity:identifier:preferredNotificationIdentifiers:multiuserModeOn:contextualEligibility:w idgetEligibility:notificationEligibility:");
}

id objc_msgSend_updateContextualInfoForIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContextualInfoForIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:");
}

id objc_msgSend_updateHintDismissedForIdentifier_dismissType_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHintDismissedForIdentifier:dismissType:context:");
}

id objc_msgSend_updateHintWouldHaveBeenDisplayedForIdentifier_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHintWouldHaveBeenDisplayedForIdentifier:context:");
}

id objc_msgSend_updateNotificationCacheWithCollectionIdentifier_document_type_extensionPayload_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNotificationCacheWithCollectionIdentifier:document:type:extensionPayload:");
}

id objc_msgSend_updateNotificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateNotificationStatus];
}

id objc_msgSend_usageEventManager(void *a1, const char *a2, ...)
{
  return _[a1 usageEventManager];
}

id objc_msgSend_userGuides(void *a1, const char *a2, ...)
{
  return _[a1 userGuides];
}

id objc_msgSend_userInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfoForIdentifier:");
}

id objc_msgSend_userLanguage(void *a1, const char *a2, ...)
{
  return _[a1 userLanguage];
}

id objc_msgSend_userLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 userLanguageCode];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_variantIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "variantIdentifierForIdentifier:");
}

id objc_msgSend_welcome(void *a1, const char *a2, ...)
{
  return _[a1 welcome];
}

id objc_msgSend_welcome_contentAvailableRemotelyWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcome:contentAvailableRemotelyWithCompletionHandler:");
}

id objc_msgSend_welcome_notifyWelcomeDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcome:notifyWelcomeDocument:");
}

id objc_msgSend_welcomeCollectionFromContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeCollectionFromContentPackage:");
}

id objc_msgSend_welcomeDocumentFromContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeDocumentFromContentPackage:");
}

id objc_msgSend_welcomeNotificationDelay(void *a1, const char *a2, ...)
{
  return _[a1 welcomeNotificationDelay];
}

id objc_msgSend_welcomeNotificationDisplayed(void *a1, const char *a2, ...)
{
  return _[a1 welcomeNotificationDisplayed];
}

id objc_msgSend_welcomeNotificationGracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 welcomeNotificationGracePeriod];
}

id objc_msgSend_welcomeXPCActivityScheduleInProgress(void *a1, const char *a2, ...)
{
  return _[a1 welcomeXPCActivityScheduleInProgress];
}

id objc_msgSend_xpcActivitySetStateBlockForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcActivitySetStateBlockForIdentifier:");
}