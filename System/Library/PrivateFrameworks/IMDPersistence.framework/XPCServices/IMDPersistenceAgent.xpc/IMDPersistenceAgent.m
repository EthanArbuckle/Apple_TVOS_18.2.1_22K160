uint64_t start()
{
  void *v0;
  uint64_t IsRunningInDatabaseServerProcess;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  os_log_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_s *v10;
  uint64_t v11;
  os_log_s *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_s *v16;
  uint64_t v17;
  os_log_s *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _DWORD v28[2];
  v0 = objc_autoreleasePoolPush();
  xpc_track_activity();
  IsRunningInDatabaseServerProcess = IMDSetIsRunningInDatabaseServerProcess(1LL);
  v2 = MKBDeviceUnlockedSinceBoot(IsRunningInDatabaseServerProcess);
  if ((_DWORD)v2 == 1)
  {
    v7 = IMOSLoggingEnabled(v2, v3);
    if ((_DWORD)v7)
    {
      v9 = OSLogHandleForIMFoundationCategory("Warning");
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "ProtectionMerge: Device has been unlocked, loading real database",  (uint8_t *)v28,  2u);
      }
    }

    if (IMOSLoggingEnabled(v7, v8))
    {
      v11 = OSLogHandleForIMFoundationCategory("Warning");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "ProtectionDelete: Checking to see if we need to delete the temp db",  (uint8_t *)v28,  2u);
      }
    }

    v13 = IMDPersistenceProtectionMerge_UnprotectedDatabaseExists();
    if ((_DWORD)v13)
    {
      if (IMOSLoggingEnabled(v13, v14))
      {
        v15 = OSLogHandleForIMFoundationCategory("Warning");
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "ProtectionDelete: device unlocked after boot and need to delete temp db",  (uint8_t *)v28,  2u);
        }
      }

      IMDPersistenceProtectionMerge_DeleteUnprotectedDatabase();
      notify_post("com.apple.imdpersistenceagent.notification.switchcompleted");
    }
  }

  else
  {
    v4 = v2;
    if ((_DWORD)v2)
    {
      if (IMOSLoggingEnabled(v2, v3))
      {
        v17 = OSLogHandleForIMFoundationCategory("Warning");
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v28[0] = 67109120;
          v28[1] = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "ProtectionMerge: unable to get device unlock state from MobileKeyBag: %d\n",  (uint8_t *)v28,  8u);
        }
      }
    }

    else
    {
      if (IMOSLoggingEnabled(v2, v3))
      {
        v5 = OSLogHandleForIMFoundationCategory("Warning");
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "ProtectionMerge: Device has not been unlocked since boot, registering for lock state notifications",  (uint8_t *)v28,  2u);
        }
      }

      dispatch_assert_queue_V2(&_dispatch_main_q);
      notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &dword_100008030, &_dispatch_main_q, &stru_1000041D0);
    }
  }

  dispatch_assert_queue_V2(&_dispatch_main_q);
  notify_register_dispatch( "AppleLanguagePreferencesChangedNotification",  &dword_100008034,  &_dispatch_main_q,  &stru_1000041F0);

  v19 = IMSetAppBoolForKey(@"LogAllIOErrors", 1LL);
  v20 = IMSyncronizeAppPreferences(v19);
  IMSetEmbeddedTempDirectory(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMImagePreviewGenerator UTITypes](&OBJC_CLASS___IMImagePreviewGenerator, "UTITypes"));
  v22 = [v21 mutableCopy];

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMAnimatedImagePreviewGenerator UTITypes](&OBJC_CLASS___IMAnimatedImagePreviewGenerator, "UTITypes"));
  [v22 addObjectsFromArray:v23];

  CGImageSourceSetAllowableTypes(v22);
  objc_autoreleasePoolPop(v0);
  v24 = objc_autoreleasePoolPush();
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  LODWORD(v23) = [v25 isModernPersistenceXPCEnabled];

  if (!(_DWORD)v23) {
    xpc_main((xpc_connection_handler_t)sub_100003378);
  }
  v26 = objc_alloc_init(&OBJC_CLASS___IMDPersistenceServiceListener);
  [v26 resume];

  objc_autoreleasePoolPop(v24);
  return 0LL;
}

void sub_100003378(void *a1)
{
  v1 = a1;
  if (qword_100008040 != -1) {
    dispatch_once(&qword_100008040, &stru_100004230);
  }
  xpc_connection_set_target_queue(v1, (dispatch_queue_t)qword_100008038);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003670;
  handler[3] = &unk_100004278;
  v4 = v1;
  v2 = v1;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_resume(v2);
}

void sub_10000342C(id a1, int a2)
{
  uint64_t v2 = IMOSLoggingEnabled(a1, *(void *)&a2);
  if ((_DWORD)v2)
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("Warning");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = kMobileKeyBagLockStatusNotifyToken;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "ProtectionMerge: %s notification\n",  (uint8_t *)&v9,  0xCu);
    }
  }

  uint64_t v5 = MKBDeviceUnlockedSinceBoot(v2);
  if ((_DWORD)v5 == 1)
  {
    if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory("Warning");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "ProtectionMerge: device unlocked after boot, IMDPersistenceAgent dying\n",  (uint8_t *)&v9,  2u);
      }
    }

    sub_100003580();
    exit(0);
  }
}

uint64_t sub_100003580()
{
  uint64_t result = dword_100008030;
  if (dword_100008030 != -1)
  {
    uint64_t result = notify_cancel(dword_100008030);
    dword_100008030 = -1;
  }

  return result;
}

void sub_1000035C0(id a1, int a2)
{
  if (IMOSLoggingEnabled(a1, *(void *)&a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("System language preferences changed: %s notification\n", v4);
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v4) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "AppleLanguagePreferencesChangedNotification",  (uint8_t *)&v4,  2u);
    }
  }

  exit(0);
}

void sub_100003644(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("IMDPersistenceAgentConnectionQueue", 0LL);
  uint64_t v2 = (void *)qword_100008038;
  qword_100008038 = (uint64_t)v1;
}

void sub_100003670(uint64_t a1, void *a2)
{
  id v3 = a2;
  __IMDPersistenceIPCServer_peer_event_handler(*(void *)(a1 + 32), v3);
}

void sub_1000036E0(id a1)
{
  uint64_t v1 = IMDPersistenceProtectionMerge_CurrentlyUsingUnprotectedDatabase(a1);
  if ((_DWORD)v1)
  {
    if (IMOSLoggingEnabled(v1, v2))
    {
      uint64_t v3 = OSLogHandleForIMFoundationCategory("ProtectionMerge");
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "We are past first unlock but still using the unprotected database. Restarting",  v5,  2u);
      }
    }

    exit(0);
  }

id objc_msgSend_sharedFeatureFlags(void *a1, const char *a2, ...)
{
  return [a1 sharedFeatureFlags];
}