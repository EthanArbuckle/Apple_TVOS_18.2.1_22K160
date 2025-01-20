void start(dispatch_queue_s *a1)
{
  CFDictionaryRef v2;
  io_service_t MatchingService;
  io_service_t v4;
  IONotificationPort *v5;
  kern_return_t v6;
  BOOL v7;
  const char *v8;
  io_object_t notification;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  notification = 0;
  v2 = IOServiceMatching("AppleKeyStore");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    v4 = MatchingService;
    v5 = IONotificationPortCreate(kIOMainPortDefault);
    qword_40C0 = (uint64_t)v5;
    if (v5)
    {
      IONotificationPortSetDispatchQueue(v5, a1);
      v6 = IOServiceAddInterestNotification( (IONotificationPortRef)qword_40C0,  v4,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_39C4,  0LL,  &notification);
      if (!v6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MKBPLUGINSTART: LockStateNotifier Started",  buf,  2u);
        }

        if (MKBDeviceUnlockedSinceBoot() == 1)
        {
          v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
          v8 = (const char *)kMobileKeyBagLockStatusNotifyToken;
          if (v7)
          {
            *(_DWORD *)buf = 136315394;
            v11 = "start";
            v12 = 2080;
            v13 = kMobileKeyBagLockStatusNotifyToken;
            _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MKBPLUGINSTART: LockStateNotifier %s posting notification: %s\n",  buf,  0x16u);
          }

          notify_post(v8);
        }

        return;
      }

      printf("Can't register for notification: %08x\n", v6);
      if (notification) {
        IOObjectRelease(notification);
      }
    }

    else
    {
      puts("Can't create notification port");
    }
  }

  else
  {
    printf("Can't find %s service\n", "AppleKeyStore");
  }

  if (qword_40C0) {
    IONotificationPortDestroy((IONotificationPortRef)qword_40C0);
  }
}

void sub_39C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __int16 v17 = 0;
  memset(v16, 0, sizeof(v16));
  DWORD1(v16[0]) = -1;
  switch(a3)
  {
    case -469774324:
      v7 = (const char *)kMobileKeyBagPasscodeThresholdNotifyToken;
      notify_post(kMobileKeyBagPasscodeThresholdNotifyToken);
      aks_get_extended_device_state(a4, v16);
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v8 = 136315906;
      v9 = "aksNotificationCallback";
      __int16 v10 = 2080;
      v11 = v7;
      __int16 v12 = 1024;
      int v13 = a4;
      __int16 v14 = 1024;
      int v15 = DWORD1(v16[0]);
      v6 = " LockStateNotifier %s posting notification: %s (handle: %d, lock state: %d)\n";
      goto LABEL_10;
    case -469774321:
      notify_post("com.apple.mobile.keybagd.first_unlock");
      aks_get_extended_device_state(a4, v16);
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v8 = 136315906;
      v9 = "aksNotificationCallback";
      __int16 v10 = 2080;
      v11 = "com.apple.mobile.keybagd.first_unlock";
      __int16 v12 = 1024;
      int v13 = a4;
      __int16 v14 = 1024;
      int v15 = DWORD1(v16[0]);
      v6 = "MKBPLUGINSTART: LockStateNotifier %s posting notification: %s (handle: %d, lock state: %d)\n";
      goto LABEL_10;
    case -469774323:
      v5 = (const char *)kMobileKeyBagLockStatusNotifyToken;
      notify_post(kMobileKeyBagLockStatusNotifyToken);
      aks_get_extended_device_state(a4, v16);
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v8 = 136315906;
      v9 = "aksNotificationCallback";
      __int16 v10 = 2080;
      v11 = v5;
      __int16 v12 = 1024;
      int v13 = a4;
      __int16 v14 = 1024;
      int v15 = DWORD1(v16[0]);
      v6 = " LockStateNotifier %s posted notification: %s (handle: %d, lock state: %d)\n";
LABEL_10:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x22u);
      return;
  }

  aks_get_extended_device_state(a4, v16);
}

void init_mkb_watchstate()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  xpc_event_module_get_queue();
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}