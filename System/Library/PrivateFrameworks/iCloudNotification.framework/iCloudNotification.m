int64_t sub_100002C44(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

void sub_10000329C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully handled terms push message!",  v8,  2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1000148CC();
  }
}

void sub_10000344C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _INLogSystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully updated properties for account %@",  (uint8_t *)&v12,  0xCu);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001492C((uint64_t)v6, v9, v11);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v10();
}

void sub_100003568( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100003580( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000359C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100003744(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100014A54(v4, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100014A14(v7);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "aa_appleAccountWithAltDSID:", *(void *)(a1 + 40)));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

id sub_100003910(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureXPCActivityWithCriteria:0];
}

void sub_100003974(uint64_t a1)
{
  uint64_t v2 = _INLogSystem(a1);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) activityID];
    int v5 = 136315138;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping activity... %s", (uint8_t *)&v5, 0xCu);
  }

  xpc_activity_unregister((const char *)[*(id *)(a1 + 32) activityID]);
}

void sub_100003B24(uint64_t a1)
{
  uint64_t v2 = _INLogSystem(a1);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) activityID];
    int v20 = 136315138;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Ensuring timer for activity... %s",  (uint8_t *)&v20,  0xCu);
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[INManagedDefaults sharedInstance](&OBJC_CLASS___INManagedDefaults, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityNextFireDateKey]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForManagedDefault:v6]);

  if (v7)
  {
    [v7 doubleValue];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    if ([v9 compare:*(void *)(a1 + 40)] == (id)1)
    {
      uint64_t v10 = _INLogSystem(1LL);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100014BBC((id *)(a1 + 32));
      }
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v15 = [v9 compare:v14];

      uint64_t v17 = _INLogSystem(v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v11 = v18;
      if (v15 != (id)-1LL)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_100014C24((uint64_t)v9, (id *)(a1 + 32));
        }

        goto LABEL_15;
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [*(id *)(a1 + 32) activityID];
        int v20 = 138412546;
        id v21 = v9;
        __int16 v22 = 2080;
        id v23 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "It looks like we missed an activity scheduled for %@! id=%s",  (uint8_t *)&v20,  0x16u);
      }
    }

    [*(id *)(a1 + 32) _scheduleNextFireForDate:*(void *)(a1 + 40)];
LABEL_15:

    goto LABEL_16;
  }

  uint64_t v12 = _INLogSystem(v8);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100014B54((id *)(a1 + 32));
  }

  [*(id *)(a1 + 32) _scheduleNextFireForDate:*(void *)(a1 + 40)];
LABEL_16:
}

void sub_100003F14(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v5 = _INLogSystem(state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100014EA4(a1);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  v9 = *(dispatch_queue_s **)(v7 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003FEC;
  v11[3] = &unk_100024B08;
  v11[4] = v7;
  uint64_t v12 = v3;
  xpc_activity_state_t v14 = state;
  id v13 = v8;
  uint64_t v10 = v3;
  dispatch_async(v9, v11);
}

void sub_100003FEC(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24LL), *(id *)(a1 + 40));
  if (*(void *)(v2 + 24) == 2LL)
  {
    if (*(void *)(*(void *)v2 + 8LL))
    {
      uint64_t v4 = *(void *)(*(void *)v2 + 16LL);
      uint64_t v5 = _INLogSystem(v3);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      uint64_t v7 = v6;
      if (v4)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          sub_100014FE8((id *)v2);
        }

        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)v2 + 8) methodSignatureForSelector:*(void *)(*(void *)v2 + 16)]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v7));
        [v8 setTarget:*(void *)(*(void *)v2 + 8)];
        [v8 setSelector:*(void *)(*(void *)v2 + 16)];
        [v8 invoke];
      }

      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        sub_100014F80((id *)v2);
      }
    }

    else
    {
      uint64_t v11 = _INLogSystem(v3);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100014F18((id *)v2);
      }
    }
  }

  else if (*(void *)(a1 + 48))
  {
    uint64_t v9 = _INLogSystem(v3);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100015050((id *)v2);
    }

    xpc_activity_set_criteria(*(xpc_activity_t *)(*(void *)(a1 + 32) + 24LL), *(xpc_object_t *)(a1 + 48));
  }
}

void sub_1000044B4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000044C8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_1000044F4(id *a1)
{
  return [*a1 activityID];
}

id sub_100004500(void *a1, const char *a2)
{
  return [a1 activityID];
}

void sub_100004508( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_10000451C(uint64_t a1, void *a2)
{
  return [a2 activityID];
}

void sub_1000048F8(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v11 = _INLogSystem(isKindOfClass);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001547C();
    }
    goto LABEL_13;
  }

  id v8 = [v4 isEqualToString:@"featuresCache"];
  if (!(_DWORD)v8)
  {
    id v13 = [v4 isEqualToString:@"offersCache"];
    int v14 = (int)v13;
    uint64_t v15 = _INLogSystem(v13);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v12 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cleaning offers cache.", v17, 2u);
      }
    }

    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      sub_10001541C();
    }

LABEL_13:
    goto LABEL_14;
  }

  uint64_t v9 = _INLogSystem(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cleaning features cache.", buf, 2u);
  }

  +[CSFFeatureManager clearCacheAndNotify](&OBJC_CLASS___CSFFeatureManager, "clearCacheAndNotify");
LABEL_14:
}

void sub_100004AC4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___INRegistrationDigestCache);
  uint64_t v2 = (void *)qword_10002C210;
  qword_10002C210 = (uint64_t)v1;
}

void sub_100004BC4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:@"INRegistrationDigestCacheDidBecomeAvailable" object:*(void *)(a1 + 32)];
}

void sub_100004D70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100004D88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004D98(uint64_t a1)
{
}

void sub_100004DA0(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 4LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, *(const void **)(a1 + 32));
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.ind.registration");
  CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
  CFTypeRef result = 0LL;
  uint64_t v3 = SecItemCopyMatching(Mutable, &result);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = _INLogSystem(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000154DC();
    }

    if (*(void *)(a1 + 56))
    {
      uint64_t v7 = INCreateErrorWithKeychainError(v4);
      **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue(v7);
    }
  }

  else if (result)
  {
    id v8 = objc_alloc(&OBJC_CLASS___INRegistrationDigest);
    uint64_t v9 = -[INRegistrationDigest initWithData:](v8, "initWithData:", result);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    CFRelease(result);
  }

  CFRelease(Mutable);
}

void sub_100004FFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100005014(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 3LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, *(const void **)(a1 + 32));
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.ind.registration");
  uint64_t v3 = SecItemDelete(Mutable);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = _INLogSystem(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000154DC();
    }

    if ((_DWORD)v4 != -25300 && *(void *)(a1 + 56))
    {
      uint64_t v7 = INCreateErrorWithKeychainError(v4);
      **(void **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue(v7);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  CFRelease(Mutable);
}

void sub_100005250( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100005268(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) data]);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 3LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, *(const void **)(a1 + 40));
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.ind.registration");
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlock);
  uint64_t v4 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1LL, 0LL, 0LL);
  CFDictionaryAddValue(v4, kSecValueData, v2);
  uint64_t v5 = SecItemUpdate(Mutable, v4);
  if (!(_DWORD)v5) {
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  if ((_DWORD)v5 == -25300)
  {
    uint64_t v7 = _INLogSystem(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No existing item. Creating a new one.",  v12,  2u);
    }

    CFDictionaryAddValue(Mutable, kSecValueData, v2);
    uint64_t v5 = SecItemAdd(Mutable, 0LL);
    uint64_t v6 = v5;
    if (!(_DWORD)v5)
    {
LABEL_6:
      uint64_t v6 = 0LL;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    uint64_t v9 = _INLogSystem(v5);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100015540();
    }

    if (*(void *)(a1 + 64))
    {
      uint64_t v11 = INCreateErrorWithKeychainError(v6);
      **(void **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue(v11);
    }
  }

  CFRelease(v4);
  CFRelease(Mutable);
}

void sub_100005494(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  uint64_t v1 = _INLogSystem(v0);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ind reporting for duty!", buf, 2u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[INDaemon sharedInstance](&OBJC_CLASS___INDaemon, "sharedInstance"));
  [v3 start];

  uint64_t v4 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
  if ((_DWORD)v4 == 7)
  {
    uint64_t v5 = _INLogSystem(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "The platform detected as HomePod, Skipping CSF.",  v13,  2u);
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[FeaturesDaemon sharedInstance](&OBJC_CLASS___FeaturesDaemon, "sharedInstance"));
    -[os_log_s start](v6, "start");
  }

  objc_autoreleasePoolPop(v0);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v7 run];

  uint64_t v9 = _INLogSystem(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ind is shutting down!", v12, 2u);
  }

  return 0LL;
}

id sub_100005C40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_CLASS___INRenewingRequest;
  return objc_msgSendSuper2(&v6, "performRequestWithSession:withHandler:", v3, v4);
}

void sub_100006754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = _INLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100015BC4(v5, v8);
  }

  [*(id *)(a1 + 32) _handleRegistrationResponse:v5 forRequest:v6 digest:*(void *)(a1 + 40) account:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void sub_100006CF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100015DD4(v4, v6);
  }

  [*(id *)(a1 + 32) _handleUnregistrationResponse:v4 account:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_100006F00( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006F10(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100006F28(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000072EC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___INDaemon_iOS);
  id v2 = (void *)qword_10002C220;
  qword_10002C220 = (uint64_t)v1;
}

id sub_100007598(uint64_t a1)
{
  return [*(id *)(a1 + 32) _validateRegistrationStateIfFirstLaunch];
}

void sub_10000773C(_Unwind_Exception *a1)
{
}

void sub_100007758(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained apsConnection]);

    if (!v4)
    {
      uint64_t v6 = _INLogSystem(v5);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100016084(v7, v8, v9);
      }
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 apsConnection]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 publicToken]);

    if (v11)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100007A28;
      v35[3] = &unk_100024DF8;
      id v13 = v3;
      id v36 = v13;
      id v37 = *(id *)(a1 + 32);
      id v14 = v11;
      uint64_t v15 = *(void *)(a1 + 64);
      id v38 = v14;
      uint64_t v40 = v15;
      id v39 = *(id *)(a1 + 48);
      uint64_t v16 = objc_retainBlock(v35);
      if (*(void *)(a1 + 32))
      {
        BOOL v17 = +[LoggedOutPushCache wasDeviceRegistered]( &OBJC_CLASS____TtC3ind18LoggedOutPushCache,  "wasDeviceRegistered");
        if (!v17)
        {
          ((void (*)(void *))v16[2])(v16);
          goto LABEL_21;
        }

        uint64_t v18 = _INLogSystem(v17);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100016058();
        }

        int v20 = *(void **)(a1 + 40);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100007DC4;
        v33[3] = &unk_100024E20;
        v34 = v16;
        [v20 unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:1 completion:v33];
        id v21 = v34;
      }

      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v13 registrar]);
        uint64_t v28 = *(void *)(a1 + 64);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_100007E60;
        v29[3] = &unk_100024E48;
        uint64_t v32 = v28;
        id v31 = *(id *)(a1 + 48);
        id v30 = v13;
        [v27 registerForLoggedOutPushWithToken:v14 reason:v28 completion:v29];

        id v21 = v31;
      }

LABEL_21:
      goto LABEL_22;
    }

    uint64_t v23 = _INLogSystem(v12);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10001602C();
    }

    uint64_t v25 = *(void *)(a1 + 48);
    if (v25)
    {
      uint64_t v26 = INCreateError(2LL);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v26);
      (*(void (**)(uint64_t, void, id))(v25 + 16))(v25, 0LL, v14);
LABEL_22:
    }
  }

  else
  {
    uint64_t v22 = *(void *)(a1 + 48);
    if (v22) {
      (*(void (**)(uint64_t, void, void))(v22 + 16))(v22, 0LL, 0LL);
    }
  }
}

void sub_100007A28(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registrar]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007AF8;
  v6[3] = &unk_100024DD0;
  uint64_t v5 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v9 = v5;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v2 registerForPushNotificationsWithAccount:v3 pushToken:v4 reason:v10 completion:v6];
}

void sub_100007AF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[INRegistrationRequest bodyParameterValueForRegistrationReason:]( &OBJC_CLASS___INRegistrationRequest,  "bodyParameterValueForRegistrationReason:",  *(void *)(a1 + 56)));
  uint64_t v9 = _INLogSystem(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000161E8(a2, (uint64_t)v8, v10);
  }

  uint64_t v12 = _INLogSystem(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (a2)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Success!", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    if (a2 == 1)
    {
      uint64_t v15 = (void *)os_transaction_create("com.apple.ind.enablePush");
      uint64_t v16 = _INLogSystem(v15);
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Registration Success!", v29, 2u);
      }

      [*(id *)(a1 + 32) _enablePushTopics];
      [*(id *)(a1 + 32) _planForRegistrationTTL:a3 account:*(void *)(a1 + 40)];
    }
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100016184();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  id v18 = *(id *)(a1 + 32);
  objc_sync_enter(v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accountsToReconsiderAfterReboot]);
  int v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "aa_altDSID"));
  unsigned int v21 = [v19 containsObject:v20];

  if (v21)
  {
    uint64_t v23 = _INLogSystem(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1000160F8();
    }

    [*(id *)(a1 + 32) handlePushRegistrationWithAccount:*(void *)(a1 + 40) reason:5];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accountsToReconsiderAfterReboot]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "aa_altDSID"));
    [v25 removeObject:v26];
  }

  else if ((*(void *)(a1 + 56) | 4LL) == 5)
  {
    uint64_t v27 = _INLogSystem(v22);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_100016124();
    }

    [*(id *)(a1 + 32) handlePushRegistrationWithAccount:*(void *)(a1 + 40) reason:*(void *)(a1 + 56)];
  }

  objc_sync_exit(v18);
}

void sub_100007DA8(_Unwind_Exception *a1)
{
}

void sub_100007DC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100016314(a2, v7, v8, v9, v10, v11, v12, v13);
  }

  if (v5)
  {
    uint64_t v15 = _INLogSystem(v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100016294(v5, v16);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007E60(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[INRegistrationRequest bodyParameterValueForRegistrationReason:]( &OBJC_CLASS___INRegistrationRequest,  "bodyParameterValueForRegistrationReason:",  *(void *)(a1 + 48)));
  uint64_t v9 = _INLogSystem(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
    int v19 = 138412546;
    int v20 = v11;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "INRegistrationResult was %@ for reason: %@",  (uint8_t *)&v19,  0x16u);
  }

  uint64_t v13 = _INLogSystem(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Success!", (uint8_t *)&v19, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    if (a2 == 1)
    {
      uint64_t v16 = (void *)os_transaction_create("com.apple.ind.enablePush");
      uint64_t v17 = _INLogSystem(v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Logged-Out Registration Success!",  (uint8_t *)&v19,  2u);
      }

      [*(id *)(a1 + 32) _enablePushTopics];
      [*(id *)(a1 + 32) _planForRegistrationTTL:a3 account:0];
    }
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100016184();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  [*(id *)(a1 + 32) handlePushRegistrationWithAccount:0 reason:*(void *)(a1 + 48)];
}

void sub_1000081E8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000163F0(a1, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100016458(a1, (uint64_t)v5, v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100008368(_Unwind_Exception *a1)
{
}

void sub_100008384(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained apsConnection]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 publicToken]);

    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = _INLogSystem(v6);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unregistering account %@", buf, 0xCu);
        }

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 registrar]);
        uint64_t v13 = *(void *)(a1 + 32);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100008620;
        v25[3] = &unk_100024EC0;
        id v26 = v3;
        id v27 = *(id *)(a1 + 32);
        id v28 = *(id *)(a1 + 40);
        [v12 unregisterFromPushNotificationsForAccount:v13 pushToken:v5 completion:v25];

        uint64_t v14 = v26;
      }

      else
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unregistering device from logged-out pushes",  buf,  2u);
        }

        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v3 registrar]);
        uint64_t v22 = *(void *)(a1 + 56);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1000086C0;
        v23[3] = &unk_100024EE8;
        id v24 = *(id *)(a1 + 40);
        [v21 unregisterFromLoggedOutPushNotificationsWithToken:v5 reason:v22 completionHandler:v23];

        uint64_t v14 = v24;
      }
    }

    else
    {
      uint64_t v16 = _INLogSystem(v6);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000164D4();
      }

      uint64_t v18 = *(void *)(a1 + 40);
      if (v18)
      {
        uint64_t v19 = INCreateError(2LL);
        int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0LL, v20);
      }
    }
  }

  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void, void))(v15 + 16))(v15, 0LL, 0LL);
    }
  }
}

void sub_100008620(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = _INLogSystem(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregistration Success!", v9, 2u);
    }

    [*(id *)(a1 + 32) _cleanUpIfNoAccountsAreLeftOtherThanAccount:*(void *)(a1 + 40)];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000086C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _INLogSystem(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100016500(v3, v6);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unregistration Success!", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id *sub_100008A2C(id *result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = _INLogSystem(result);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "No primary iCloud account but we have an active feature ticket. Registering for logged out push notifications",  (uint8_t *)v5,  2u);
    }

    return (id *)[v2[4] registerDeviceForLoggedOutiCloudNotificationsWithReason:2 completion:&stru_100024F30];
  }

  return result;
}

void sub_100008EC4(_Unwind_Exception *a1)
{
}

void sub_100008EE0(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  uint64_t v8 = _INLogSystem(v4, v5, v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = @"NO";
    if (v3) {
      BOOL v10 = @"YES";
    }
    int v11 = 138412546;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "FLAB registration validation finished for logged-out device. Success: %@. Error %@",  (uint8_t *)&v11,  0x16u);
  }
}

void sub_100008FB8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v9 = _INLogSystem(v5, v6, v7, v8);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = @"NO";
    int v13 = 138412802;
    if (a2) {
      uint64_t v12 = @"YES";
    }
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "FLAB registration validation finished for account %@. Success: %@. Error %@",  (uint8_t *)&v13,  0x20u);
  }
}

void sub_1000092B0(_Unwind_Exception *a1)
{
}

void sub_10000977C(id a1)
{
  uint64_t v1 = _INLogSystem(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Client connection interrupted/invalidated.",  v3,  2u);
  }
}

void sub_100009D7C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  uint64_t v7 = _INLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Registration complete. Result: %d. Error: %@.",  (uint8_t *)v9,  0x12u);
  }
}

id sub_100009E48(uint64_t a1)
{
  uint64_t v2 = _INLogSystem([*(id *)(*(void *)(a1 + 32) + 56) setActivityState:5]);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Heartbeat activity is set to done, will exit the dameon on audio devices.",  v5,  2u);
  }

  return [*(id *)(a1 + 32) _exitClean];
}

void sub_10000A0E8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  uint64_t v7 = _INLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Registration complete. Result: %d. Error: %@.",  (uint8_t *)v9,  0x12u);
  }
}

id sub_10000A1B4(uint64_t a1)
{
  uint64_t v2 = _INLogSystem([*(id *)(*(void *)(a1 + 32) + 56) setActivityState:5]);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Heartbeat activity is set to done, will exit the dameon on audio devices.",  v5,  2u);
  }

  return [*(id *)(a1 + 32) _exitClean];
}

void sub_10000A72C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A7D8;
  v10[3] = &unk_100024FE8;
  id v8 = *(id *)(a1 + 48);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v6 handlePushUnregistrationWithAccount:v7 completion:v10];
}

uint64_t sub_10000A7D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
}

void sub_10000A900(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_10000A9A0;
  v9[3] = &unk_100024FE8;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 handlePushUnregistrationWithAccount:0 completion:v9];
}

uint64_t sub_10000A9A0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
}

void sub_10000B4CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = _INLogSystem(v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100016854(v7, v9);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 apsEnvironment]);
  [*(id *)(a1 + 32) setActiveAPSEnvironment:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeAPSEnvironment]);
  uint64_t v13 = _INLogSystem(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v15)
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Using production APS env as fallback, since none was specified by the iCloud server.",  (uint8_t *)&v25,  2u);
    }

    goto LABEL_13;
  }

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeAPSEnvironment]);
    int v25 = 138412290;
    id v26 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Server wants us to use the APS env: %@",  (uint8_t *)&v25,  0xCu);
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeAPSEnvironment]);
  unsigned __int8 v18 = +[APSConnection isValidEnvironment:](&OBJC_CLASS___APSConnection, "isValidEnvironment:", v17);

  if ((v18 & 1) == 0)
  {
    uint64_t v20 = _INLogSystem(v19);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100016828();
    }
LABEL_13:

    [*(id *)(a1 + 32) setActiveAPSEnvironment:APSEnvironmentProduction];
  }

  __int16 v21 = objc_alloc(&OBJC_CLASS___APSConnection);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeAPSEnvironment]);
  uint64_t v23 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v21,  "initWithEnvironmentName:namedDelegatePort:queue:",  v22,  @"com.apple.ind.aps",  *(void *)(*(void *)(a1 + 32) + 16LL));
  [*(id *)(a1 + 32) setApsConnection:v23];

  [*(id *)(a1 + 32) _validateEnabledTopics];
  id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) apsConnection]);
  [v24 setDelegate:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000B7AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = _INLogSystem(v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100016854(v7, v9);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 apsEnvironment]);
  if (v10)
  {
    id v11 = (id *)(a1 + 32);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeAPSEnvironment]);
    unsigned int v13 = [v10 isEqualToString:v12];

    uint64_t v15 = _INLogSystem(v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    __int16 v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100016900((id *)(a1 + 32), v17);
      }
LABEL_22:

      goto LABEL_23;
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*v11 activeAPSEnvironment]);
      int v33 = 138412546;
      v34 = v20;
      __int16 v35 = 2112;
      id v36 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Active APS env (%@) does not match server-requested env (%@).",  (uint8_t *)&v33,  0x16u);
    }

    id v21 = +[APSConnection isValidEnvironment:](&OBJC_CLASS___APSConnection, "isValidEnvironment:", v10);
    char v22 = (char)v21;
    uint64_t v23 = _INLogSystem(v21);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    __int16 v17 = v24;
    if ((v22 & 1) == 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100016984();
      }
      goto LABEL_22;
    }

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = (void *)objc_claimAutoreleasedReturnValue([*v11 activeAPSEnvironment]);
      int v33 = 138412290;
      v34 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Shutting down APS connection with env %@...",  (uint8_t *)&v33,  0xCu);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([*v11 apsConnection]);
    [v26 setDelegate:0];

    id v27 = (void *)objc_claimAutoreleasedReturnValue([*v11 apsConnection]);
    [v27 shutdown];

    uint64_t v29 = _INLogSystem(v28);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412290;
      v34 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Starting new APS connection with env %@...",  (uint8_t *)&v33,  0xCu);
    }

    id v31 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( objc_alloc(&OBJC_CLASS___APSConnection),  "initWithEnvironmentName:namedDelegatePort:queue:",  v10,  @"com.apple.ind.aps",  *((void *)*v11 + 2));
    [*v11 setApsConnection:v31];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*v11 apsConnection]);
    [v32 setDelegate:*v11];

    [*v11 setActiveAPSEnvironment:v10];
  }

  else
  {
    uint64_t v18 = _INLogSystem(0LL);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1000168D4();
    }
  }

LABEL_23:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_22:
    -[INDaemon _exitClean](self, "_exitClean");
    goto LABEL_23;
  }

  uint64_t v8 = +[INRegistrationDigestCache isAvailable](&OBJC_CLASS___INRegistrationDigestCache, "isAvailable");
  id v9 = v8;
  id v10 = _INLogSystem(v8);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = "Ignoring new push token from APS because the registration cache is unavailable right now.";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
      goto LABEL_22;
    }

    goto LABEL_22;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100016AC0();
  }

  int v25 = 0u;
  id v26 = 0u;
  uint64_t v23 = 0u;
  id v24 = 0u;
  unsigned int v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        v22[5] = _NSConcreteStackBlock;
        v22[6] = 3221225472LL;
        v22[7] = sub_10000BF2C;
        v22[8] = &unk_100024E98;
        v22[9] = v18;
        v22[10] = self;
        -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( self,  "registerForPushNotificationsWithAccount:reason:completion:");
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v15);
  }

LABEL_23:
}

void sub_10000BF2C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = @"NO";
    int v10 = 138412802;
    if (a2) {
      id v9 = @"YES";
    }
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    unsigned int v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Registration due to new APS token for account %@ finished. Success: %@ . Error %@",  (uint8_t *)&v10,  0x20u);
  }

  [*(id *)(a1 + 40) _exitClean];
}

void sub_10000C01C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (a2) {
      uint64_t v8 = @"YES";
    }
    int v9 = 138412546;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Registration due to new APS token finished for logged-out device. Success: %@. Error %@",  (uint8_t *)&v9,  0x16u);
  }

  [*(id *)(a1 + 32) _exitClean];
}

LABEL_15:
}

void sub_10000C730( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000C8A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, _xpc_event_key_name));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = _INLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    __int16 v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "XPC notifyd matching event stream handler called. Event name: %@",  (uint8_t *)&v13,  0xCu);
  }

  if ([v5 isEqualToString:@"DeviceNameChangeEvent"])
  {
    [*(id *)(a1 + 32) _handleDeviceNameChangeEvent];
  }

  else
  {
    id v8 = [v5 isEqualToString:@"FirstUnlockEvent"];
    if ((_DWORD)v8)
    {
      uint64_t v9 = _INLogSystem(v8);
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received first-unlock launch event.",  (uint8_t *)&v13,  2u);
      }
    }

    else
    {
      if ([v5 isEqualToString:@"DeviceDidPairEvent"])
      {
        [*(id *)(a1 + 32) _handleDeviceDidPairEvent];
        goto LABEL_19;
      }

      if ([v5 isEqualToString:@"LanguageChangedEvent"])
      {
        [*(id *)(a1 + 32) _handleLanguageChangedEvent];
        goto LABEL_19;
      }

      if ([v5 isEqualToString:@"refreshCFAvailability"])
      {
        [*(id *)(a1 + 32) _handleOSEligibilityChange];
        goto LABEL_19;
      }

      if ([v5 isEqualToString:@"refreshGMSAvailability"])
      {
        [*(id *)(a1 + 32) _handleGMSAvailabilityChange];
        goto LABEL_19;
      }

      id v11 = [v5 isEqualToString:@"ModelCatalogChange"];
      if ((_DWORD)v11)
      {
        [*(id *)(a1 + 32) _handleModelCatalogChange];
        goto LABEL_19;
      }

      uint64_t v12 = _INLogSystem(v11);
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100016C3C((uint64_t)v3, v10);
      }
    }
  }

LABEL_19:
}

void sub_10000CAC4(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = _INLogSystem(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100016CB0();
  }
}

void sub_10000CD5C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Registration complete for account %@. Result: %d. Error: %@.",  (uint8_t *)&v9,  0x1Cu);
  }
}

uint64_t sub_10000DC50(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 base64EncodedStringWithOptions:0]);
    [*(id *)(a1 + 32) setValue:v3 forHTTPHeaderField:@"X-Mme-Nas-Qualify"];
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000E1D8(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = (void *)a1[6];
  id v6 = a2;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 identifier]);
  [v3 _handleEventDetailsResponse:v6 forEventID:v4 accountID:v7 pushMessage:a1[7]];
}

void sub_10000EAC0(id a1, AAResponse *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = _INLogSystem(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000174A4(v2);
  }
}

void sub_10000EC58(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___INCachedDeviceInfo);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AADeviceInfo currentInfo](&OBJC_CLASS___AADeviceInfo, "currentInfo"));
  uint64_t v2 = -[INCachedDeviceInfo initWithDeviceInfo:](v1, "initWithDeviceInfo:", v4);
  uint64_t v3 = (void *)qword_10002C230;
  qword_10002C230 = (uint64_t)v2;
}

id sub_10000EDB4()
{
  id result = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  qword_10002C248 = (uint64_t)result;
  return result;
}

uint64_t static LoggedOutPushCache.expirationDate.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_10002C240 != -1) {
    swift_once(&qword_10002C240, sub_10000EDB4);
  }
  uint64_t v2 = (void *)qword_10002C248;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 valueForKey:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(v9, v4);
    swift_unknownObjectRelease(v4);
  }

  else
  {
    memset(v9, 0, sizeof(v9));
  }

  sub_10000F3B4((uint64_t)v9, (uint64_t)v10);
  if (v11)
  {
    uint64_t v5 = type metadata accessor for Date(0LL);
    int v6 = swift_dynamicCast(a1, v10, (char *)&type metadata for Any + 8, v5, 6LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))( a1,  v6 ^ 1u,  1LL,  v5);
  }

  else
  {
    sub_10000F43C((uint64_t)v10);
    uint64_t v8 = type metadata accessor for Date(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))( a1,  1LL,  1LL,  v8);
  }

void static LoggedOutPushCache.registeredDevice(expirationDate:)()
{
  if (qword_10002C240 != -1) {
    swift_once(&qword_10002C240, sub_10000EDB4);
  }
  v0 = (void *)qword_10002C248;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v2 = String._bridgeToObjectiveC()();
  [v0 setObject:isa forKey:v2];
}

void static LoggedOutPushCache.unregisteredDevice()()
{
  if (qword_10002C240 != -1) {
    swift_once(&qword_10002C240, sub_10000EDB4);
  }
  v0 = (void *)qword_10002C248;
  id v1 = String._bridgeToObjectiveC()();
  [v0 setURL:0 forKey:v1];
}

id LoggedOutPushCache.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LoggedOutPushCache();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL _s3ind18LoggedOutPushCacheC19wasDeviceRegisteredSbvgZ_0()
{
  if (qword_10002C240 != -1) {
    swift_once(&qword_10002C240, sub_10000EDB4);
  }
  v0 = (void *)qword_10002C248;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }

  else
  {
    memset(v4, 0, sizeof(v4));
  }

  sub_10000F43C((uint64_t)v4);
  return v2 != 0LL;
}

uint64_t sub_10000F3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000F3FC(&qword_10002C050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F3FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000F43C(uint64_t a1)
{
  uint64_t v2 = sub_10000F3FC(&qword_10002C050);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for LoggedOutPushCache()
{
  return objc_opt_self(&OBJC_CLASS____TtC3ind18LoggedOutPushCache);
}

void sub_10000F49C()
{
}

uint64_t sub_10000F4AC()
{
  uint64_t result = TaskLimiters.__allocating_init()();
  qword_10002C258 = result;
  return result;
}

uint64_t sub_10000F4DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v12, 1LL, 1LL, v13);
  id v14 = (void *)swift_allocObject(&unk_100025370, 80LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = a1;
  v14[5] = a2;
  v14[6] = a3;
  v14[7] = v5;
  v14[8] = a4;
  v14[9] = a5;
  sub_100010078(a1, a2);
  id v15 = v5;
  swift_retain(a5);
  uint64_t v16 = sub_10000FF2C((uint64_t)v12, (uint64_t)&unk_10002C098, (uint64_t)v14);
  return swift_release(v16);
}

uint64_t sub_10000F5D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a8;
  v8[8] = v10;
  v8[5] = a6;
  v8[6] = a7;
  v8[3] = a4;
  v8[4] = a5;
  return swift_task_switch(sub_10000F600, 0LL, 0LL);
}

uint64_t sub_10000F600()
{
  if (qword_10002C250 != -1) {
    swift_once(&qword_10002C250, sub_10000F4AC);
  }
  *(void *)(v0 + 72) = qword_10002C258;
  uint64_t v1 = type metadata accessor for TaskLimiters(0LL);
  uint64_t v2 = sub_1000144D8( &qword_10002C0A8,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskLimiters,  (uint64_t)&protocol conformance descriptor for TaskLimiters);
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, v2);
  return swift_task_switch(sub_10000F6A4, v3, v4);
}

uint64_t sub_10000F6A4()
{
  *(void *)(v0 + 80) = TaskLimiters.limiter(key:)(0xD000000000000015LL, 0x800000010001BA40LL);
  return swift_task_switch(sub_10000F6FC, 0LL, 0LL);
}

uint64_t sub_10000F6FC()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = (void *)v0[6];
  uint64_t v4 = v0[3];
  unint64_t v3 = v0[4];
  uint64_t v5 = (void *)swift_allocObject(&unk_100025778, 48LL, 7LL);
  v0[11] = v5;
  v5[2] = v4;
  v5[3] = v3;
  v5[4] = v2;
  v5[5] = v1;
  sub_100010078(v4, v3);
  uint64_t v6 = *((unsigned int *)&async function pointer to dispatch thunk of TaskLimiter.perform<A>(identifier:operation:) + 1);
  id v7 = v1;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  v0[12] = v8;
  void *v8 = v0;
  v8[1] = sub_10000F7E4;
  return ((uint64_t (*)(void *, unint64_t, unint64_t, void *, void *, void *))v10)( v0 + 2,  0xD000000000000015LL,  0x800000010001BA40LL,  &unk_10002C1F8,  v5,  &type metadata for UInt);
}

uint64_t sub_10000F7E4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 96);
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_10000F894;
  }

  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    swift_release(*(void *)(v2 + 88));
    swift_release(v5);
    uint64_t v4 = sub_10000F858;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10000F858()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F894()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void (**)(void, void, uint64_t))(v0 + 56);
  swift_release(*(void *)(v0 + 88));
  swift_release(v2);
  swift_errorRetain(v1);
  v3(0LL, 0LL, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F908(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000F94C()
{
  __int128 v7 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = swift_task_alloc(dword_10002C094);
  __int128 v5 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + _Block_object_dispose(va, 8) = sub_1000146C0;
  *(void *)(v4 + 64) = v3;
  *(_OWORD *)(v4 + 4_Block_object_dispose(va, 8) = v5;
  *(void *)(v4 + 40) = v2;
  *(_OWORD *)(v4 + 24) = v7;
  return swift_task_switch(sub_10000F600, 0LL, 0LL);
}

uint64_t sub_10000F9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[23] = a3;
  v4[24] = a4;
  v4[21] = a1;
  v4[22] = a2;
  return swift_task_switch(sub_10000F9F0, 0LL, 0LL);
}

uint64_t sub_10000F9F0()
{
  uint64_t v1 = v0 + 2;
  id v2 = [(id)objc_opt_self(AARemoteServer) sharedServerWithNoUrlCache];
  v0[25] = v2;
  v0[7] = v0 + 20;
  v0[2] = v0;
  v0[3] = sub_10000FAB0;
  uint64_t v3 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  uint64_t v4 = v0 + 10;
  v4[1] = 0x40000000LL;
  _OWORD v4[2] = sub_10000FE9C;
  v4[3] = &unk_100025790;
  v4[4] = v3;
  [v2 configurationWithCompletion:v4];
  return swift_continuation_await(v1);
}

uint64_t sub_10000FAB0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 208LL) = v1;
  if (v1) {
    id v2 = sub_10000FE5C;
  }
  else {
    id v2 = sub_10000FB10;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

void sub_10000FB10()
{
  uint64_t v1 = *(void **)(v0 + 200);
  id v2 = *(void **)(v0 + 160);
  *(void *)(v0 + 216) = v2;

  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 _urlStringForKey:v3];

  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 192);
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    uint64_t v8 = v7;

    *(void *)(v0 + 224) = v8;
    id v9 =  [(id)objc_opt_self(INRegistrationRequest) bodyParameterValueForRegistrationReason:v5];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v12 = *(void *)(v0 + 176);
      unint64_t v11 = *(void *)(v0 + 184);
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      uint64_t v15 = v14;

      *(void *)(v0 + 232) = v15;
      *(void *)(v0 + 144) = &type metadata for LoggedOutPushRegistrationRequestBody;
      *(void *)(v0 + 152) = sub_1000143AC();
      uint64_t v16 = (void *)swift_allocObject(&unk_100025710, 48LL, 7LL);
      *(void *)(v0 + 120) = v16;
      v16[2] = v12;
      v16[3] = v11;
      v16[4] = v13;
      v16[5] = v15;
      sub_100010078(v12, v11);
      sub_100010078(v12, v11);
      uint64_t v17 = dword_10002C204;
      swift_bridgeObjectRetain(v15);
      uint64_t v18 = (void *)swift_task_alloc(v17);
      *(void *)(v0 + 240) = v18;
      void *v18 = v0;
      v18[1] = sub_10000FD14;
      sub_1000122E4(v6, v8, 5526864LL, 0xE300000000000000LL, v0 + 120);
      return;
    }

    __break(1u);
  }

  else
  {
    NSString v19 = String._bridgeToObjectiveC()();
    id v20 = (id)INCreateErrorWithMessage(7LL, v19);

    if (v20)
    {
      swift_willThrow();

      (*(void (**)(void))(v0 + 8))();
      return;
    }
  }

  __break(1u);
}

uint64_t sub_10000FD14(uint64_t a1)
{
  id v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 240LL);
  *(void *)(*(void *)v2 + 248LL) = v1;
  swift_task_dealloc(v5);
  swift_bridgeObjectRelease(v4[28]);
  if (v1)
  {
    uint64_t v6 = sub_10000FE00;
  }

  else
  {
    v4[32] = a1;
    sub_100013890(v4 + 15);
    uint64_t v6 = sub_10000FDA4;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_10000FDA4()
{
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  NSString v3 = *(void **)(v0 + 216);
  id v4 = *(void **)(v0 + 168);
  sub_10000F908(*(void *)(v0 + 176), *(void *)(v0 + 184));
  swift_bridgeObjectRelease(v2);

  void *v4 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000FE00()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void **)(v0 + 216);
  sub_10000F908(*(void *)(v0 + 176), *(void *)(v0 + 184));
  swift_bridgeObjectRelease(v1);

  sub_100013890((void *)(v0 + 120));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000FE5C()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000FE9C(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    uint64_t v5 = sub_10000F3FC(&qword_10002C1D0);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    void *v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else if (a2)
  {
    **(void **)(*(void *)(v3 + 64) + 4(*(void (**)(uint64_t, void, void))(v0 + 56))(1LL, *(void *)(v0 + 16), 0LL) = a2;
    id v9 = a2;
    return swift_continuation_throwingResume(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10000FF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100014460(a1, &qword_10002C088);
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
  uint64_t v16 = swift_allocObject(&unk_100025750, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10002C1E8, v16);
}

uint64_t sub_100010078(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_10001022C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = _convertErrorToNSError(_:)(a3);
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);
}

uint64_t sub_100010294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  _OWORD v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch(sub_1000102B0, 0LL, 0LL);
}

uint64_t sub_1000102B0()
{
  if (qword_10002C250 != -1) {
    swift_once(&qword_10002C250, sub_10000F4AC);
  }
  *(void *)(v0 + 4_Block_object_dispose(va, 8) = qword_10002C258;
  uint64_t v1 = type metadata accessor for TaskLimiters(0LL);
  uint64_t v2 = sub_1000144D8( &qword_10002C0A8,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskLimiters,  (uint64_t)&protocol conformance descriptor for TaskLimiters);
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, v2);
  return swift_task_switch(sub_100010354, v3, v4);
}

uint64_t sub_100010354()
{
  *(void *)(v0 + 56) = TaskLimiters.limiter(key:)(0xD000000000000015LL, 0x800000010001BA40LL);
  return swift_task_switch(sub_1000103AC, 0LL, 0LL);
}

uint64_t sub_1000103AC()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = v0[2];
  unint64_t v4 = v0[3];
  uint64_t v5 = (void *)swift_allocObject(&unk_100025398, 48LL, 7LL);
  v0[8] = v5;
  v5[2] = v3;
  v5[3] = v4;
  v5[4] = v2;
  v5[5] = v1;
  sub_100010078(v3, v4);
  uint64_t v6 = *((unsigned int *)&async function pointer to dispatch thunk of TaskLimiter.perform<A>(identifier:operation:) + 1);
  id v7 = v1;
  id v8 = (void *)swift_task_alloc(v6);
  v0[9] = v8;
  void *v8 = v0;
  v8[1] = sub_100010488;
  return v10();
}

uint64_t sub_100010488()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 72);
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    unint64_t v4 = sub_100010508;
  }

  else
  {
    uint64_t v5 = *(void *)(v2 + 56);
    swift_release(*(void *)(v2 + 64));
    swift_release(v5);
    unint64_t v4 = sub_1000104FC;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000104FC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010508()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release(*(void *)(v0 + 64));
  swift_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[22] = a3;
  v4[23] = a4;
  v4[21] = a2;
  return swift_task_switch(sub_100010560, 0LL, 0LL);
}

uint64_t sub_100010560()
{
  uint64_t v1 = v0 + 2;
  id v2 = [(id)objc_opt_self(AARemoteServer) sharedServerWithNoUrlCache];
  v0[24] = v2;
  v0[7] = v0 + 20;
  v0[2] = v0;
  v0[3] = sub_100010620;
  uint64_t v3 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  unint64_t v4 = v0 + 10;
  v4[1] = 0x40000000LL;
  _OWORD v4[2] = sub_10000FE9C;
  v4[3] = &unk_1000256E8;
  v4[4] = v3;
  [v2 configurationWithCompletion:v4];
  return swift_continuation_await(v1);
}

uint64_t sub_100010620()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 20(*(void (**)(uint64_t, void, void))(v0 + 56))(1LL, *(void *)(v0 + 16), 0LL) = v1;
  if (v1) {
    id v2 = sub_1000109AC;
  }
  else {
    id v2 = sub_100010680;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

void sub_100010680()
{
  uint64_t v1 = *(void **)(v0 + 192);
  id v2 = *(void **)(v0 + 160);
  *(void *)(v0 + 20_Block_object_dispose(va, 8) = v2;

  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 _urlStringForKey:v3];

  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    uint64_t v8 = v7;

    *(void *)(v0 + 216) = v8;
    id v9 =  [(id)objc_opt_self(INRegistrationRequest) bodyParameterValueForRegistrationReason:v5];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v12 = *(void *)(v0 + 168);
      unint64_t v11 = *(void *)(v0 + 176);
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      uint64_t v15 = v14;

      *(void *)(v0 + 224) = v15;
      *(void *)(v0 + 144) = &type metadata for LoggedOutPushRegistrationRequestBody;
      *(void *)(v0 + 152) = sub_1000143AC();
      uint64_t v16 = (void *)swift_allocObject(&unk_100025710, 48LL, 7LL);
      *(void *)(v0 + 120) = v16;
      v16[2] = v12;
      v16[3] = v11;
      v16[4] = v13;
      v16[5] = v15;
      sub_100010078(v12, v11);
      sub_100010078(v12, v11);
      uint64_t v17 = dword_10002C19C;
      swift_bridgeObjectRetain(v15);
      uint64_t v18 = (void *)swift_task_alloc(v17);
      *(void *)(v0 + 232) = v18;
      void *v18 = v0;
      v18[1] = sub_100010888;
      sub_100012CB8(v6, v8, 0x4554454C4544LL, 0xE600000000000000LL, v0 + 120);
      return;
    }

    __break(1u);
  }

  else
  {
    NSString v19 = String._bridgeToObjectiveC()();
    id v20 = (id)INCreateErrorWithMessage(7LL, v19);

    if (v20)
    {
      swift_willThrow();

      (*(void (**)(void))(v0 + 8))();
      return;
    }
  }

  __break(1u);
}

uint64_t sub_100010888()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 232);
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc(v3);
  swift_bridgeObjectRelease(*(void *)(v2 + 216));
  if (v0)
  {
    id v4 = sub_100010950;
  }

  else
  {
    sub_100013890((void *)(v2 + 120));
    id v4 = sub_100010908;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100010908()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void **)(v0 + 208);
  sub_10000F908(*(void *)(v0 + 168), *(void *)(v0 + 176));
  swift_bridgeObjectRelease(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010950()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void **)(v0 + 208);
  sub_10000F908(*(void *)(v0 + 168), *(void *)(v0 + 176));
  swift_bridgeObjectRelease(v1);

  sub_100013890((void *)(v0 + 120));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000109AC()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000109F0()
{
  __int128 v5 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc(dword_10002C0B4);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + _Block_object_dispose(va, 8) = sub_1000146C0;
  *(void *)(v3 + 184) = v2;
  *(_OWORD *)(v3 + 16_Block_object_dispose(va, 8) = v5;
  return swift_task_switch(sub_100010560, 0LL, 0LL);
}

uint64_t sub_100010B94(void *a1, uint64_t a2, void *aBlock, void *a4)
{
  _OWORD v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a4;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v12 = v11;

  v4[4] = v10;
  v4[5] = v12;
  uint64_t v13 = (void *)swift_task_alloc(dword_10002C0A4);
  v4[6] = v13;
  *uint64_t v13 = v4;
  v13[1] = sub_100010C48;
  v13[4] = a2;
  v13[5] = v9;
  v13[2] = v10;
  v13[3] = v12;
  return swift_task_switch(sub_1000102B0, 0LL, 0LL);
}

uint64_t sub_100010C48()
{
  unint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v4 = *(void *)(*v1 + 32);
  __int128 v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc(v2);

  sub_10000F908(v4, v3);
  uint64_t v7 = *(void *)(v6 + 24);
  if (v0)
  {
    id v8 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }

  else
  {
    (*(void (**)(void, void))(v7 + 16))(*(void *)(v6 + 24), 0LL);
  }

  _Block_release(*(const void **)(v6 + 24));
  return (*(uint64_t (**)(void))(v6 + 8))();
}

void sub_100010D00(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    uint64_t v6 = sub_10000F3FC(&qword_10002C1D0);
    uint64_t v7 = swift_allocError(v6, &protocol self-conformance witness table for Error, 0LL, 0LL);
    void *v8 = a4;
    id v9 = a4;
    swift_continuation_throwingResumeWithError(v4, v7);
  }

  else
  {
    id v12 = a2;
    id v13 = a3;
    uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a2);
    uint64_t v16 = v15;

    if (v13)
    {
      uint64_t v17 = *(uint64_t **)(*(void *)(v4 + 64) + 40LL);
      *uint64_t v17 = v14;
      v17[1] = v16;
      v17[2] = (uint64_t)v13;
      swift_continuation_throwingResume(v4);
    }

    else
    {
      __break(1u);
    }
  }

uint64_t sub_100010DC4(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_100010DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a3;
}

uint64_t sub_100010E20(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100025230, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100010E70()
{
  return 2LL;
}

uint64_t sub_100010E78()
{
  return 0LL;
}

uint64_t sub_100010E84(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x6E6F73616572LL;
  }
  else {
    return 0x6B6F742D68737570LL;
  }
}

uint64_t sub_100010EBC(char *a1, char *a2)
{
  return sub_100010EC8(*a1, *a2);
}

uint64_t sub_100010EC8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 0x6E6F73616572LL;
  }
  else {
    uint64_t v3 = 0x6B6F742D68737570LL;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006E65LL;
  }
  else {
    unint64_t v4 = 0xE600000000000000LL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0x6E6F73616572LL;
  }
  else {
    uint64_t v5 = 0x6B6F742D68737570LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xE600000000000000LL;
  }
  else {
    unint64_t v6 = 0xEA00000000006E65LL;
  }
  if (v3 == v5 && v4 == v6)
  {
    char v7 = 1;
    unint64_t v6 = v4;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }

  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_100010F6C()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v5, 0LL);
  if (v1) {
    uint64_t v2 = 0x6E6F73616572LL;
  }
  else {
    uint64_t v2 = 0x6B6F742D68737570LL;
  }
  if (v1) {
    unint64_t v3 = 0xE600000000000000LL;
  }
  else {
    unint64_t v3 = 0xEA00000000006E65LL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100010FEC(uint64_t a1)
{
  if (*v1) {
    uint64_t v2 = 0x6E6F73616572LL;
  }
  else {
    uint64_t v2 = 0x6B6F742D68737570LL;
  }
  if (*v1) {
    unint64_t v3 = 0xE600000000000000LL;
  }
  else {
    unint64_t v3 = 0xEA00000000006E65LL;
  }
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100011048(uint64_t a1)
{
  int v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2) {
    uint64_t v3 = 0x6E6F73616572LL;
  }
  else {
    uint64_t v3 = 0x6B6F742D68737570LL;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000LL;
  }
  else {
    unint64_t v4 = 0xEA00000000006E65LL;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_1000110C4@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  unint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100025230, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100011120(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6B6F742D68737570LL;
  if (*v1) {
    uint64_t v2 = 0x6E6F73616572LL;
  }
  unint64_t v3 = 0xEA00000000006E65LL;
  if (*v1) {
    unint64_t v3 = 0xE600000000000000LL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_100011160()
{
  if (*v0) {
    return 0x6E6F73616572LL;
  }
  else {
    return 0x6B6F742D68737570LL;
  }
}

uint64_t sub_10001119C@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100025230, v3);
  uint64_t result = swift_bridgeObjectRelease(object);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_1000111FC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100011208(uint64_t a1)
{
  unint64_t v2 = sub_1000113B4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011230(uint64_t a1)
{
  unint64_t v2 = sub_1000113B4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100011258(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v9 = sub_10000F3FC(&qword_10002C0C0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_100011390(a1, v14);
  unint64_t v15 = sub_1000113B4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys,  &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys,  v15,  v14,  v13);
  v20[0] = a2;
  v20[1] = a3;
  char v21 = 0;
  unint64_t v16 = sub_1000113F8();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v20, &v21, v9, &type metadata for Data, v16);
  if (!v5)
  {
    LOBYTE(v20[0]) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v18, v19, v20, v9);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void *sub_100011390(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_1000113B4()
{
  unint64_t result = qword_10002C0C8;
  if (!qword_10002C0C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002229C, &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C0C8);
  }

  return result;
}

unint64_t sub_1000113F8()
{
  unint64_t result = qword_10002C0D0;
  if (!qword_10002C0D0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10002C0D0);
  }

  return result;
}

uint64_t sub_10001143C(void *a1)
{
  uint64_t result = sub_100013660(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_100011464@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100013660(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }

  return result;
}

uint64_t sub_100011490(void *a1)
{
  return sub_100011258(a1, *v1, v1[1], v1[2], v1[3]);
}

BOOL sub_1000114AC(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100025280, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

BOOL sub_1000114F0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000252B8, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

uint64_t sub_100011534()
{
  return 1LL;
}

unint64_t sub_10001153C()
{
  return 0xD000000000000013LL;
}

Swift::Int sub_100011558()
{
  return Hasher._finalize()();
}

uint64_t sub_1000115AC(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000013LL, 0x800000010001BA20LL);
}

Swift::Int sub_1000115C8(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100011618@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  unint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000252F0, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100011668(void *a1@<X8>)
{
  *a1 = 0xD000000000000013LL;
  a1[1] = 0x800000010001BA20LL;
}

uint64_t sub_100011688@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100025328, v3);
  uint64_t result = swift_bridgeObjectRelease(object);
  *a2 = v5 != 0;
  return result;
}

void sub_1000116DC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1000116E8(uint64_t a1)
{
  unint64_t v2 = sub_10001384C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011710(uint64_t a1)
{
  unint64_t v2 = sub_10001384C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100011738(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000F3FC(&qword_10002C0D8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100011390(a1, v8);
  unint64_t v10 = sub_10001384C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  v10,  v8,  v9);
  KeyedEncodingContainer.encode(_:forKey:)(a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void *sub_100011818(void *a1)
{
  uint64_t v3 = sub_10000F3FC(&qword_10002C0E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_100011390(a1, v7);
  unint64_t v10 = sub_10001384C();
  uint64_t v11 = dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  v10,  v7,  v8);
  if (!v1)
  {
    uint64_t v9 = (void *)KeyedDecodingContainer.decode(_:forKey:)(v11, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  sub_100013890(a1);
  return v9;
}

uint64_t sub_10001191C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10000F3FC(&qword_10002C0E8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100011390(a1, v9);
  unint64_t v11 = sub_10001384C();
  uint64_t v12 = dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_100013890(a1);
  }
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)(v12, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_100013890(a1);
  *a2 = v13;
  return result;
}

uint64_t sub_100011A2C(void *a1)
{
  uint64_t v3 = sub_10000F3FC(&qword_10002C0D8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *v1;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100011390(a1, v8);
  unint64_t v10 = sub_10001384C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys,  v10,  v8,  v9);
  KeyedEncodingContainer.encode(_:forKey:)(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100011B14()
{
  return 0LL;
}

uint64_t sub_100011B20@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_100011B4C(uint64_t a1)
{
  unint64_t v2 = sub_1000138B0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011B74(uint64_t a1)
{
  unint64_t v2 = sub_1000138B0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100011B9C(void *a1)
{
  uint64_t v2 = sub_10000F3FC(&qword_10002C0F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  sub_100011390(a1, v6);
  unint64_t v8 = sub_1000138B0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for EmptyResponse.CodingKeys,  &type metadata for EmptyResponse.CodingKeys,  v8,  v6,  v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100011C60(void *a1)
{
  return sub_100013890(a1);
}

uint64_t sub_100011C84(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100011CE8;
  return v6(a1);
}

uint64_t sub_100011CE8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100011D34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_1000146C0;
  return v6();
}

uint64_t sub_100011D88(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000146C0;
  return v7();
}

uint64_t sub_100011DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100014460(a1, &qword_10002C088);
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
  uint64_t v16 = swift_allocObject(&unk_100025680, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10002C170, v16);
}

uint64_t sub_100011F28(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000146C4;
  return v6(a1);
}

void sub_100011F8C(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_10000F3FC(&qword_10002C1D8);
      uint64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (v1 < 0) {
        uint64_t v7 = v1;
      }
      else {
        uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5) {
        return;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return;
  }
LABEL_15:
  uint64_t v8 = (char *)(v4 + 7);
  uint64_t v44 = v5;
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v9 = 0LL;
    uint64_t v42 = v1;
    while (1)
    {
      uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
      BOOL v11 = __OFADD__(v9++, 1LL);
      if (v11)
      {
        __break(1u);
        goto LABEL_43;
      }

      uint64_t v12 = v10;
      Swift::Int v13 = NSObject._rawHashValue(seed:)(v4[5]);
      uint64_t v14 = -1LL << *((_BYTE *)v4 + 32);
      unint64_t v15 = v13 & ~v14;
      unint64_t v16 = v15 >> 6;
      uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
      uint64_t v18 = 1LL << v15;
      if (((1LL << v15) & v17) != 0)
      {
        sub_10001449C();
        id v19 = *(id *)(v4[6] + 8 * v15);
        char v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
        {
LABEL_17:
          swift_unknownObjectRelease(v12);
          uint64_t v1 = v42;
          goto LABEL_18;
        }

        uint64_t v21 = ~v14;
        while (1)
        {
          unint64_t v15 = (v15 + 1) & v21;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
          uint64_t v18 = 1LL << v15;
          if ((v17 & (1LL << v15)) == 0) {
            break;
          }
          id v22 = *(id *)(v4[6] + 8 * v15);
          char v23 = static NSObject.== infix(_:_:)();

          if ((v23 & 1) != 0) {
            goto LABEL_17;
          }
        }

        uint64_t v1 = v42;
      }

      *(void *)&v8[8 * v16] = v18 | v17;
      *(void *)(v4[6] + 8 * v15) = v12;
      uint64_t v24 = v4[2];
      BOOL v11 = __OFADD__(v24, 1LL);
      uint64_t v25 = v24 + 1;
      if (v11) {
        goto LABEL_44;
      }
      _OWORD v4[2] = v25;
LABEL_18:
      if (v9 == v44) {
        return;
      }
    }
  }

  uint64_t v26 = 0LL;
  uint64_t v43 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v26 != v43)
  {
    Swift::Int v27 = v4[5];
    id v28 = *(id *)(v1 + 32 + 8 * v26);
    Swift::Int v29 = NSObject._rawHashValue(seed:)(v27);
    uint64_t v30 = -1LL << *((_BYTE *)v4 + 32);
    unint64_t v31 = v29 & ~v30;
    unint64_t v32 = v31 >> 6;
    uint64_t v33 = *(void *)&v8[8 * (v31 >> 6)];
    uint64_t v34 = 1LL << v31;
    if (((1LL << v31) & v33) != 0)
    {
      sub_10001449C();
      id v35 = *(id *)(v4[6] + 8 * v31);
      char v36 = static NSObject.== infix(_:_:)();

      if ((v36 & 1) != 0) {
        goto LABEL_30;
      }
      uint64_t v37 = ~v30;
      unint64_t v31 = (v31 + 1) & v37;
      unint64_t v32 = v31 >> 6;
      uint64_t v33 = *(void *)&v8[8 * (v31 >> 6)];
      uint64_t v34 = 1LL << v31;
      if ((v33 & (1LL << v31)) != 0)
      {
        while (1)
        {
          id v38 = *(id *)(v4[6] + 8 * v31);
          char v39 = static NSObject.== infix(_:_:)();

          if ((v39 & 1) != 0) {
            break;
          }
          unint64_t v31 = (v31 + 1) & v37;
          unint64_t v32 = v31 >> 6;
          uint64_t v33 = *(void *)&v8[8 * (v31 >> 6)];
          uint64_t v34 = 1LL << v31;
          if ((v33 & (1LL << v31)) == 0) {
            goto LABEL_38;
          }
        }

LABEL_30:
        uint64_t v5 = v44;
        goto LABEL_31;
      }

LABEL_38:
      uint64_t v5 = v44;
    }

    *(void *)&v8[8 * v32] = v34 | v33;
    *(void *)(v4[6] + 8 * v31) = v28;
    uint64_t v40 = v4[2];
    BOOL v11 = __OFADD__(v40, 1LL);
    uint64_t v41 = v40 + 1;
    if (v11) {
      goto LABEL_45;
    }
    _OWORD v4[2] = v41;
LABEL_31:
    if (++v26 == v5) {
      return;
    }
  }

LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
}

uint64_t sub_1000122E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[33] = a4;
  v5[34] = a5;
  v5[31] = a2;
  v5[32] = a3;
  v5[30] = a1;
  uint64_t v6 = type metadata accessor for String.Encoding(0LL);
  v5[35] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[36] = v7;
  v5[37] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URLRequest(0LL);
  v5[38] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v5[39] = v9;
  v5[40] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_10000F3FC(&qword_10002C1A0);
  v5[41] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  v5[42] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v5[43] = v12;
  v5[44] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000123C0, 0LL, 0LL);
}

void sub_1000123C0()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v4 = *(void *)(v0 + 248);
  uint64_t v6 = static SystemProperties.getDeviceID()();
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0LL;
  }
  *(void *)(v0 + 184) = v8;
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = 0xE000000000000000LL;
  }
  *(void *)(v0 + 216) = v5;
  *(void *)(v0 + 224) = v4;
  *(void *)(v0 + 200) = 0x7D644964757BLL;
  *(void *)(v0 + 20_Block_object_dispose(va, 8) = 0xE600000000000000LL;
  *(void *)(v0 + 192) = v9;
  unint64_t v10 = sub_10001441C();
  uint64_t v11 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v0 + 200,  v0 + 184,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v10,  v10,  v10);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease(v9);
  URL.init(string:)(v11, v13);
  swift_bridgeObjectRelease(v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1) != 1)
  {
    unint64_t v16 = *(void **)(v0 + 272);
    (*(void (**)(void, void, void))(*(void *)(v0 + 344) + 32LL))( *(void *)(v0 + 352),  *(void *)(v0 + 328),  *(void *)(v0 + 336));
    id v17 = objc_allocWithZone(&OBJC_CLASS___NSMutableURLRequest);
    URL._bridgeToObjectiveC()(v18);
    char v20 = v19;
    id v21 = [v17 initWithURL:v19];
    *(void *)(v0 + 360) = v21;

    NSString v22 = String._bridgeToObjectiveC()();
    [v21 setHTTPMethod:v22];

    static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(v21);
    uint64_t v23 = v16[3];
    uint64_t v24 = v16[4];
    uint64_t v25 = sub_100011390(v16, v23);
    uint64_t v26 = type metadata accessor for JSONEncoder(0LL);
    swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
    uint64_t v27 = JSONEncoder.init()();
    uint64_t v28 = dispatch thunk of JSONEncoder.encode<A>(_:)(v25, v23, v24);
    *(void *)(v0 + 36_Block_object_dispose(va, 8) = 0LL;
    uint64_t v32 = v28;
    uint64_t v34 = v33;
    swift_release(v27);
    URLRequest.httpBody.setter(v32, v34);
    v35.value._object = (void *)0x800000010001BB60LL;
    v35.value._countAndFlagsBits = 0xD000000000000010LL;
    v36._countAndFlagsBits = 0x2D746E65746E6F43LL;
    v36._object = (void *)0xEC00000065707954LL;
    URLRequest.setValue(_:forHTTPHeaderField:)(v35, v36);
    id v37 = [(id)objc_opt_self(AAURLSession) sharedSessionWithNoUrlCache];
    id v38 = [v37 urlSession];

    id v39 = [objc_allocWithZone(ACSENetworkRequestController) initWithSession:v38];
    *(void *)(v0 + 376) = v39;

    Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
    *(void *)(v0 + 384) = isa;
    uint64_t v41 = sub_10000F3FC(&qword_10002C1B0);
    uint64_t inited = swift_initStackObject(v41, v0 + 120);
    *(_OWORD *)(inited + 16) = xmmword_1000221D0;
    sub_10001449C();
    *(NSNumber *)(inited + 32) = NSNumber.init(integerLiteral:)(200LL);
    uint64_t v52 = inited;
    specialized Array._endMutation()();
    uint64_t v43 = inited;
    if ((unint64_t)inited >> 62)
    {
      if (inited >= 0) {
        inited &= 0xFFFFFFFFFFFFFF8uLL;
      }
      swift_bridgeObjectRetain(v52);
      uint64_t v47 = _CocoaArrayWrapper.endIndex.getter(inited);
      swift_bridgeObjectRelease(v43);
      uint64_t v44 = v0 + 160;
      if (v47) {
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v44 = v0 + 160;
      if (*(void *)((inited & 0xFFFFFFFFFFFFF8LL) + 0x10))
      {
LABEL_12:
        sub_100011F8C(v43);
        v46 = v45;
LABEL_17:
        swift_bridgeObjectRelease(v43);
        uint64_t v48 = v0 + 16;
        sub_1000144D8( &qword_10002C1C0,  (uint64_t (*)(uint64_t))sub_10001449C,  (uint64_t)&protocol conformance descriptor for NSObject);
        Class v49 = Set._bridgeToObjectiveC()().super.isa;
        *(void *)(v0 + 392) = v49;
        swift_bridgeObjectRelease(v46);
        *(void *)(v0 + 56) = v44;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 24) = sub_1000128D8;
        uint64_t v50 = swift_continuation_init(v0 + 16, 1LL);
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        v51 = (void *)(v0 + 80);
        v51[1] = 0x40000000LL;
        v51[2] = sub_100010D00;
        v51[3] = &unk_1000257A8;
        v51[4] = v50;
        [v39 executeRequest:isa acceptedStatusCodes:v49 completion:v51];
        swift_continuation_await(v48);
        return;
      }
    }

    v46 = &_swiftEmptySetSingleton;
    goto LABEL_17;
  }

  sub_100014460(*(void *)(v0 + 328), &qword_10002C1A0);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = (id)INCreateErrorWithMessage(7LL, v14);

  if (v15)
  {
    swift_willThrow();
    uint64_t v30 = *(void *)(v0 + 320);
    uint64_t v29 = *(void *)(v0 + 328);
    uint64_t v31 = *(void *)(v0 + 296);
    swift_task_dealloc(*(void *)(v0 + 352));
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    (*(void (**)(void))(v0 + 8))();
  }

  else
  {
    __break(1u);
  }

uint64_t sub_1000128D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 40Hasher.init(_seed:)(v1, 0LL) = v1;
  if (v1) {
    uint64_t v2 = sub_100012BEC;
  }
  else {
    uint64_t v2 = sub_100012938;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

void sub_100012938()
{
  uint64_t v2 = *(void **)(v0 + 384);
  uint64_t v1 = *(void **)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 160);
  unint64_t v4 = *(void *)(v0 + 168);

  sub_100010078(v3, v4);
  __asm { BR              X9 }

uint64_t sub_1000129A0()
{
  uint64_t v3 = sub_10000F908(v0, v2);
  if ((v2 & 0xFF000000000000LL) == 0)
  {
    uint64_t v4 = *(void *)(v1 + 288);
    uint64_t v5 = *(void *)(v1 + 296);
    uint64_t v6 = *(void *)(v1 + 280);
    ((void (*)(uint64_t))static String.Encoding.utf8.getter)(v3);
    uint64_t v7 = ((uint64_t (*)(uint64_t, void, uint64_t, unint64_t))String.data(using:allowLossyConversion:))( v5,  0LL,  32123LL,  0xE200000000000000LL);
    unint64_t v9 = v8;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    if (v9 >> 60 != 15)
    {
      sub_10000F908(v0, v2);
      uint64_t v0 = v7;
      unint64_t v2 = v9;
    }
  }

  uint64_t v10 = *(void *)(v1 + 368);
  uint64_t v11 = ((uint64_t (*)(void))type metadata accessor for JSONDecoder)(0LL);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  uint64_t v12 = ((uint64_t (*)(void))JSONDecoder.init())();
  unint64_t v13 = sub_10001467C();
  ((void (*)(ValueMetadata *, uint64_t, unint64_t, ValueMetadata *, unint64_t))dispatch thunk of JSONDecoder.decode<A>(_:from:))( &type metadata for LoggedOutPushRegistrationResponseBody,  v0,  v2,  &type metadata for LoggedOutPushRegistrationResponseBody,  v13);
  NSString v14 = *(void **)(v1 + 376);
  uint64_t v15 = *(void *)(v1 + 352);
  unint64_t v16 = *(void **)(v1 + 360);
  uint64_t v31 = *(void *)(v1 + 344);
  uint64_t v32 = *(void *)(v1 + 336);
  if (v10)
  {
    uint64_t v29 = *(void *)(v1 + 352);
    uint64_t v17 = *(void *)(v1 + 312);
    uint64_t v18 = *(void *)(v1 + 320);
    uint64_t v19 = *(void *)(v1 + 304);
    swift_release(v12);

    sub_10000F908(v0, v2);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v32);
    uint64_t v20 = *(void *)(v1 + 320);
    uint64_t v21 = *(void *)(v1 + 328);
    uint64_t v22 = *(void *)(v1 + 296);
    swift_task_dealloc(*(void *)(v1 + 352));
    swift_task_dealloc(v21);
    swift_task_dealloc(v20);
    swift_task_dealloc(v22);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }

  else
  {
    uint64_t v24 = *(void *)(v1 + 320);
    uint64_t v26 = *(void *)(v1 + 304);
    uint64_t v25 = *(void *)(v1 + 312);
    uint64_t v28 = *(void *)(v1 + 328);
    uint64_t v30 = *(void *)(v1 + 296);
    swift_release(v12);

    sub_10000F908(v0, v2);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v15, v32);
    uint64_t v27 = *(void *)(v1 + 232);
    swift_task_dealloc(v15);
    swift_task_dealloc(v28);
    swift_task_dealloc(v24);
    swift_task_dealloc(v30);
    return (*(uint64_t (**)(uint64_t))(v1 + 8))(v27);
  }

uint64_t sub_100012BEC()
{
  uint64_t v1 = *(void **)(v0 + 376);
  unint64_t v13 = *(void **)(v0 + 392);
  NSString v14 = *(void **)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void **)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 336);
  uint64_t v5 = *(void *)(v0 + 344);
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v6 = *(void *)(v0 + 320);
  uint64_t v8 = *(void *)(v0 + 304);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);

  uint64_t v10 = *(void *)(v0 + 320);
  uint64_t v9 = *(void *)(v0 + 328);
  uint64_t v11 = *(void *)(v0 + 296);
  swift_task_dealloc(*(void *)(v0 + 352));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[32] = a4;
  v5[33] = a5;
  v5[30] = a2;
  v5[31] = a3;
  v5[29] = a1;
  uint64_t v6 = type metadata accessor for String.Encoding(0LL);
  v5[34] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[35] = v7;
  v5[36] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URLRequest(0LL);
  v5[37] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v5[38] = v9;
  v5[39] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_10000F3FC(&qword_10002C1A0);
  v5[40] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  v5[41] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v5[42] = v12;
  v5[43] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100012D94, 0LL, 0LL);
}

void sub_100012D94()
{
  uint64_t v1 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 320);
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v6 = static SystemProperties.getDeviceID()();
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0LL;
  }
  *(void *)(v0 + 184) = v8;
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = 0xE000000000000000LL;
  }
  *(void *)(v0 + 216) = v5;
  *(void *)(v0 + 224) = v4;
  *(void *)(v0 + 200) = 0x7D644964757BLL;
  *(void *)(v0 + 20_Block_object_dispose(va, 8) = 0xE600000000000000LL;
  *(void *)(v0 + 192) = v9;
  unint64_t v10 = sub_10001441C();
  uint64_t v11 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v0 + 200,  v0 + 184,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v10,  v10,  v10);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease(v9);
  URL.init(string:)(v11, v13);
  swift_bridgeObjectRelease(v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1) != 1)
  {
    unint64_t v16 = *(void **)(v0 + 264);
    (*(void (**)(void, void, void))(*(void *)(v0 + 336) + 32LL))( *(void *)(v0 + 344),  *(void *)(v0 + 320),  *(void *)(v0 + 328));
    id v17 = objc_allocWithZone(&OBJC_CLASS___NSMutableURLRequest);
    URL._bridgeToObjectiveC()(v18);
    uint64_t v20 = v19;
    id v21 = [v17 initWithURL:v19];
    *(void *)(v0 + 352) = v21;

    NSString v22 = String._bridgeToObjectiveC()();
    [v21 setHTTPMethod:v22];

    static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(v21);
    uint64_t v23 = v16[3];
    uint64_t v24 = v16[4];
    uint64_t v25 = sub_100011390(v16, v23);
    uint64_t v26 = type metadata accessor for JSONEncoder(0LL);
    swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
    uint64_t v27 = JSONEncoder.init()();
    uint64_t v28 = dispatch thunk of JSONEncoder.encode<A>(_:)(v25, v23, v24);
    *(void *)(v0 + 360) = 0LL;
    uint64_t v32 = v28;
    uint64_t v34 = v33;
    swift_release(v27);
    URLRequest.httpBody.setter(v32, v34);
    v35.value._object = (void *)0x800000010001BB60LL;
    v35.value._countAndFlagsBits = 0xD000000000000010LL;
    v36._countAndFlagsBits = 0x2D746E65746E6F43LL;
    v36._object = (void *)0xEC00000065707954LL;
    URLRequest.setValue(_:forHTTPHeaderField:)(v35, v36);
    id v37 = [(id)objc_opt_self(AAURLSession) sharedSessionWithNoUrlCache];
    id v38 = [v37 urlSession];

    id v39 = [objc_allocWithZone(ACSENetworkRequestController) initWithSession:v38];
    *(void *)(v0 + 36_Block_object_dispose(va, 8) = v39;

    Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
    *(void *)(v0 + 376) = isa;
    uint64_t v41 = sub_10000F3FC(&qword_10002C1B0);
    uint64_t inited = swift_initStackObject(v41, v0 + 120);
    *(_OWORD *)(inited + 16) = xmmword_1000221D0;
    sub_10001449C();
    *(NSNumber *)(inited + 32) = NSNumber.init(integerLiteral:)(200LL);
    uint64_t v52 = inited;
    specialized Array._endMutation()();
    uint64_t v43 = inited;
    if ((unint64_t)inited >> 62)
    {
      if (inited >= 0) {
        inited &= 0xFFFFFFFFFFFFFF8uLL;
      }
      swift_bridgeObjectRetain(v52);
      uint64_t v47 = _CocoaArrayWrapper.endIndex.getter(inited);
      swift_bridgeObjectRelease(v43);
      uint64_t v44 = v0 + 160;
      if (v47) {
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v44 = v0 + 160;
      if (*(void *)((inited & 0xFFFFFFFFFFFFF8LL) + 0x10))
      {
LABEL_12:
        sub_100011F8C(v43);
        v46 = v45;
LABEL_17:
        swift_bridgeObjectRelease(v43);
        uint64_t v48 = v0 + 16;
        sub_1000144D8( &qword_10002C1C0,  (uint64_t (*)(uint64_t))sub_10001449C,  (uint64_t)&protocol conformance descriptor for NSObject);
        Class v49 = Set._bridgeToObjectiveC()().super.isa;
        *(void *)(v0 + 384) = v49;
        swift_bridgeObjectRelease(v46);
        *(void *)(v0 + 56) = v44;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 24) = sub_1000132AC;
        uint64_t v50 = swift_continuation_init(v0 + 16, 1LL);
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        v51 = (void *)(v0 + 80);
        v51[1] = 0x40000000LL;
        v51[2] = sub_100010D00;
        v51[3] = &unk_100025728;
        v51[4] = v50;
        [v39 executeRequest:isa acceptedStatusCodes:v49 completion:v51];
        swift_continuation_await(v48);
        return;
      }
    }

    v46 = &_swiftEmptySetSingleton;
    goto LABEL_17;
  }

  sub_100014460(*(void *)(v0 + 320), &qword_10002C1A0);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = (id)INCreateErrorWithMessage(7LL, v14);

  if (v15)
  {
    swift_willThrow();
    uint64_t v30 = *(void *)(v0 + 312);
    uint64_t v29 = *(void *)(v0 + 320);
    uint64_t v31 = *(void *)(v0 + 288);
    swift_task_dealloc(*(void *)(v0 + 344));
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    (*(void (**)(void))(v0 + 8))();
  }

  else
  {
    __break(1u);
  }

uint64_t sub_1000132AC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 392LL) = v1;
  if (v1) {
    uint64_t v2 = sub_100013594;
  }
  else {
    uint64_t v2 = sub_10001330C;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

void sub_10001330C()
{
  uint64_t v2 = *(void **)(v0 + 376);
  uint64_t v1 = *(void **)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 160);
  unint64_t v4 = *(void *)(v0 + 168);

  sub_100010078(v3, v4);
  __asm { BR              X9 }

uint64_t sub_100013370()
{
  uint64_t v3 = sub_10000F908(v0, v2);
  if ((v2 & 0xFF000000000000LL) == 0)
  {
    uint64_t v5 = *(void *)(v1 + 280);
    uint64_t v4 = *(void *)(v1 + 288);
    uint64_t v6 = *(void *)(v1 + 272);
    ((void (*)(uint64_t))static String.Encoding.utf8.getter)(v3);
    uint64_t v7 = ((uint64_t (*)(uint64_t, void, uint64_t, unint64_t))String.data(using:allowLossyConversion:))( v4,  0LL,  32123LL,  0xE200000000000000LL);
    unint64_t v9 = v8;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    if (v9 >> 60 != 15)
    {
      sub_10000F908(v0, v2);
      uint64_t v0 = v7;
      unint64_t v2 = v9;
    }
  }

  uint64_t v10 = *(void *)(v1 + 360);
  uint64_t v11 = ((uint64_t (*)(void))type metadata accessor for JSONDecoder)(0LL);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  uint64_t v12 = ((uint64_t (*)(void))JSONDecoder.init())();
  unint64_t v13 = sub_100014518();
  ((void (*)(ValueMetadata *, uint64_t, unint64_t, ValueMetadata *, unint64_t))dispatch thunk of JSONDecoder.decode<A>(_:from:))( &type metadata for EmptyResponse,  v0,  v2,  &type metadata for EmptyResponse,  v13);
  NSString v14 = *(void **)(v1 + 368);
  uint64_t v15 = *(void *)(v1 + 344);
  unint64_t v16 = *(void **)(v1 + 352);
  uint64_t v30 = *(void *)(v1 + 336);
  uint64_t v31 = *(void *)(v1 + 328);
  if (v10)
  {
    uint64_t v28 = *(void *)(v1 + 344);
    uint64_t v17 = *(void *)(v1 + 304);
    uint64_t v18 = *(void *)(v1 + 312);
    uint64_t v19 = *(void *)(v1 + 296);
    swift_release(v12);

    sub_10000F908(v0, v2);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v31);
    uint64_t v20 = *(void *)(v1 + 312);
    uint64_t v21 = *(void *)(v1 + 320);
    uint64_t v22 = *(void *)(v1 + 288);
    swift_task_dealloc(*(void *)(v1 + 344));
    swift_task_dealloc(v21);
    swift_task_dealloc(v20);
    swift_task_dealloc(v22);
  }

  else
  {
    uint64_t v23 = *(void *)(v1 + 312);
    uint64_t v25 = *(void *)(v1 + 296);
    uint64_t v24 = *(void *)(v1 + 304);
    uint64_t v27 = *(void *)(v1 + 320);
    uint64_t v29 = *(void *)(v1 + 288);
    swift_release(v12);

    sub_10000F908(v0, v2);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v15, v31);
    swift_task_dealloc(v15);
    swift_task_dealloc(v27);
    swift_task_dealloc(v23);
    swift_task_dealloc(v29);
  }

  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100013594()
{
  uint64_t v1 = *(void **)(v0 + 368);
  unint64_t v13 = *(void **)(v0 + 384);
  NSString v14 = *(void **)(v0 + 376);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void **)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v7 = *(void *)(v0 + 304);
  uint64_t v6 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 296);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);

  uint64_t v10 = *(void *)(v0 + 312);
  uint64_t v9 = *(void *)(v0 + 320);
  uint64_t v11 = *(void *)(v0 + 288);
  swift_task_dealloc(*(void *)(v0 + 344));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013660(void *a1)
{
  uint64_t v3 = sub_10000F3FC(&qword_10002C180);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100011390(a1, v7);
  unint64_t v9 = sub_1000113B4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys,  &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_100013890(a1);
  }

  else
  {
    char v17 = 0;
    unint64_t v10 = sub_100014368();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15, &type metadata for Data, &v17, v3, &type metadata for Data, v10);
    uint64_t v7 = v15;
    unint64_t v12 = v16;
    LOBYTE(v15) = 1;
    sub_100010078(v7, v16);
    KeyedDecodingContainer.decode(_:forKey:)(&v15, v3);
    uint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100010078(v7, v12);
    swift_bridgeObjectRetain(v14);
    sub_10000F908(v7, v12);
    sub_100013890(a1);
    sub_10000F908(v7, v12);
    swift_bridgeObjectRelease(v14);
  }

  return v7;
}

unint64_t sub_10001384C()
{
  unint64_t result = qword_10002C0E0;
  if (!qword_10002C0E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002242C, &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C0E0);
  }

  return result;
}

uint64_t sub_100013890(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000138B0()
{
  unint64_t result = qword_10002C260[0];
  if (!qword_10002C260[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100022668, &type metadata for EmptyResponse.CodingKeys);
    atomic_store(result, qword_10002C260);
  }

  return result;
}

unint64_t sub_1000138F8()
{
  unint64_t result = qword_10002C0F8;
  if (!qword_10002C0F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000221FC, &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C0F8);
  }

  return result;
}

unint64_t sub_100013940()
{
  unint64_t result = qword_10002C100;
  if (!qword_10002C100)
  {
    unint64_t result = swift_getWitnessTable(&unk_100022314, &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C100);
  }

  return result;
}

unint64_t sub_100013988()
{
  unint64_t result = qword_10002C108;
  if (!qword_10002C108)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000222EC, &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C108);
  }

  return result;
}

unint64_t sub_1000139D0()
{
  unint64_t result = qword_10002C110;
  if (!qword_10002C110)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002238C, &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C110);
  }

  return result;
}

unint64_t sub_100013A18()
{
  unint64_t result = qword_10002C118;
  if (!qword_10002C118)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000224A4, &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C118);
  }

  return result;
}

unint64_t sub_100013A60()
{
  unint64_t result = qword_10002C120;
  if (!qword_10002C120)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002247C, &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002C120);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for LoggedOutPushRegistrationRequestBody(uint64_t *a1)
{
  return swift_bridgeObjectRelease(a1[3]);
}

uint64_t *initializeWithCopy for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_100010078(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t *assignWithCopy for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_100010078(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_10000F908(v6, v7);
  a1[2] = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for LoggedOutPushRegistrationRequestBody(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t *assignWithTake for LoggedOutPushRegistrationRequestBody(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10000F908(v4, v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = a1[3];
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(va, 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationRequestBody()
{
  return &type metadata for LoggedOutPushRegistrationRequestBody;
}

_BYTE *initializeBufferWithCopyOfBuffer for LoggedOutPushRegistrationRequestBody.CodingKeys( _BYTE *result, _BYTE *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LoggedOutPushRegistrationRequestBody.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100013D8C + 4 * byte_1000221ED[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100013DC0 + 4 * byte_1000221E8[v4]))();
}

uint64_t sub_100013DC0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013DC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100013DD0LL);
  }
  return result;
}

uint64_t sub_100013DDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100013DE4LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_100013DE8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013DF0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013DFC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100013E04(_BYTE *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationRequestBody.CodingKeys()
{
  return &type metadata for LoggedOutPushRegistrationRequestBody.CodingKeys;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationResponseBody()
{
  return &type metadata for LoggedOutPushRegistrationResponseBody;
}

uint64_t getEnumTagSinglePayload for LoggedOutPushRegistrationResponseBody.CodingKeys( unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for LoggedOutPushRegistrationResponseBody.CodingKeys( uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_100013EC4 + 4 * byte_1000221F2[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100013EE4 + 4 * byte_1000221F7[v4]))();
  }
}

_BYTE *sub_100013EC4(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

_BYTE *sub_100013EE4(_BYTE *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_100013EEC(_DWORD *result, int a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_100013EF4(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_100013EFC(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_100013F04(_DWORD *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t sub_100013F10()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for LoggedOutPushRegistrationResponseBody.CodingKeys()
{
  return &type metadata for LoggedOutPushRegistrationResponseBody.CodingKeys;
}

ValueMetadata *type metadata accessor for EmptyResponse()
{
  return &type metadata for EmptyResponse;
}

ValueMetadata *type metadata accessor for EmptyResponse.CodingKeys()
{
  return &type metadata for EmptyResponse.CodingKeys;
}

void type metadata accessor for INRegistrationResult(uint64_t a1)
{
}

void type metadata accessor for INRegistrationReason(uint64_t a1)
{
}

void sub_100013F70(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

unint64_t sub_100013FB8()
{
  unint64_t result = qword_10002CC70;
  if (!qword_10002CC70)
  {
    unint64_t result = swift_getWitnessTable("I2", &type metadata for EmptyResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002CC70);
  }

  return result;
}

unint64_t sub_100014000()
{
  unint64_t result = qword_10002CC78;
  if (!qword_10002CC78)
  {
    unint64_t result = swift_getWitnessTable(&unk_100022640, &type metadata for EmptyResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002CC78);
  }

  return result;
}

uint64_t sub_100014044()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100014078()
{
  int v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  unsigned int v6 = (void *)swift_task_alloc(dword_10002C13C);
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_1000146C0;
  return ((uint64_t (*)(void *, uint64_t, void *, void *))((char *)&dword_10002C138 + dword_10002C138))( v2,  v3,  v5,  v4);
}

uint64_t sub_1000140F4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10002C14C);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000146C0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10002C148 + dword_10002C148))(v2, v3, v4);
}

uint64_t sub_100014170()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10001419C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc(dword_10002C15C);
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100014220;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10002C158 + dword_10002C158))( a1,  v4,  v5,  v6);
}

uint64_t sub_100014220()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100014268()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001428C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10002C16C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000146C0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10002C168 + dword_10002C168))(a1, v4);
}

uint64_t sub_1000142FC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100014320(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_10001432C()
{
  swift_release(*(void *)(v0 + 72));
  return swift_deallocObject(v0, 80LL, 7LL);
}

unint64_t sub_100014368()
{
  unint64_t result = qword_10002C188;
  if (!qword_10002C188)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10002C188);
  }

  return result;
}

unint64_t sub_1000143AC()
{
  unint64_t result = qword_10002C190;
  if (!qword_10002C190)
  {
    unint64_t result = swift_getWitnessTable(&unk_100022364, &type metadata for LoggedOutPushRegistrationRequestBody);
    atomic_store(result, &qword_10002C190);
  }

  return result;
}

uint64_t sub_1000143F0()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

unint64_t sub_10001441C()
{
  unint64_t result = qword_10002C1A8;
  if (!qword_10002C1A8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10002C1A8);
  }

  return result;
}

uint64_t sub_100014460(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000F3FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_10001449C()
{
  unint64_t result = qword_10002C1B8;
  if (!qword_10002C1B8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002C1B8);
  }

  return result;
}

uint64_t sub_1000144D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100014518()
{
  unint64_t result = qword_10002C1C8;
  if (!qword_10002C1C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002251C, &type metadata for EmptyResponse);
    atomic_store(result, (unint64_t *)&qword_10002C1C8);
  }

  return result;
}

uint64_t sub_10001455C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10002C1E4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000146C0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10002C1E0 + dword_10002C1E0))(a1, v4);
}

uint64_t sub_1000145D0()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000145FC(uint64_t a1)
{
  __int128 v7 = *(_OWORD *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = swift_task_alloc(dword_10002C1F4);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + _Block_object_dispose(va, 8) = sub_100014220;
  *(void *)(v5 + 192) = v4;
  *(_OWORD *)(v5 + 176) = v7;
  *(void *)(v5 + 16_Block_object_dispose(va, 8) = a1;
  return swift_task_switch(sub_10000F9F0, 0LL, 0LL);
}

unint64_t sub_10001467C()
{
  unint64_t result = qword_10002C208;
  if (!qword_10002C208)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000224CC, &type metadata for LoggedOutPushRegistrationResponseBody);
    atomic_store(result, (unint64_t *)&qword_10002C208);
  }

  return result;
}

void sub_1000146CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "No request parameters for registration digest!",  v1,  2u);
}

void sub_10001470C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014740()
{
}

void sub_1000147A0()
{
}

void sub_100014800(uint64_t a1, os_log_s *a2)
{
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  id v5 = v4;
  sub_10000359C((void *)&_mh_execute_header, a2, v6, "Unexpected type %@ for DSID %@.", v7);
}

void sub_100014898( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000148CC()
{
}

void sub_10001492C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412546;
  uint64_t v4 = 0LL;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  sub_10000359C( (void *)&_mh_execute_header,  a2,  a3,  "Failed to discover properties for account %@, error: %@",  (uint8_t *)&v3);
  sub_100003578();
}

void sub_1000149A0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Attempting renew credentials for altDSID %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100014A14(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Renew credentials was successful!", v1, 2u);
}

void sub_100014A54(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to renew credentials. Error: %@",  (uint8_t *)&v4,  0xCu);
}

void sub_100014AE8(uint64_t a1, void *a2)
{
  sub_1000044C8((void *)&_mh_execute_header, v2, v3, "Setting the new run date to %@. id=%s", v4, v5, v6, v7, v8);
  sub_1000044A8();
}

void sub_100014B54(id *a1)
{
  sub_1000044B4( (void *)&_mh_execute_header,  v1,  v2,  "There is no activity already scheduled. id=%s",  v3,  v4,  v5,  v6,  v7);
  sub_1000044A8();
}

void sub_100014BBC(id *a1)
{
  sub_1000044B4( (void *)&_mh_execute_header,  v1,  v2,  "The next scheduled activity is too late. Will reschedule. id=%s",  v3,  v4,  v5,  v6,  v7);
  sub_1000044A8();
}

void sub_100014C24(uint64_t a1, id *a2)
{
  sub_1000044C8( (void *)&_mh_execute_header,  v2,  v3,  "We already have an activity scheduled for %@. id=%s",  v4,  v5,  v6,  v7,  v8);
  sub_1000044A8();
}

void sub_100014C98(void *a1, const char *a2)
{
}

void sub_100014D00(void *a1, const char *a2)
{
  sub_1000044B4( (void *)&_mh_execute_header,  v2,  v3,  "Asked to set criteria but our XPC activity is MIA. Will set after check-in. id=%s",  v4,  v5,  v6,  v7,  v8);
  sub_1000044A8();
}

void sub_100014D68(uint64_t a1, void *a2)
{
  sub_1000044C8((void *)&_mh_execute_header, v2, v3, "Setting a new criteria %@. id=%s", v4, v5, v6, v7, v8);
  sub_1000044A8();
}

void sub_100014DD4(void *a1, const char *a2)
{
  sub_1000044B4( (void *)&_mh_execute_header,  v2,  v3,  "Re-registering non-repeating XPC activity. id=%s",  v4,  v5,  v6,  v7,  v8);
  sub_1000044A8();
}

void sub_100014E3C(void *a1, const char *a2)
{
}

void sub_100014EA4(uint64_t a1)
{
  sub_1000044C8( (void *)&_mh_execute_header,  v1,  v2,  "XPC Activity block invoked with state %ld... id=%s",  v3,  v4,  v5,  v6,  v7);
  sub_1000044A8();
}

void sub_100014F18(id *a1)
{
}

void sub_100014F80(id *a1)
{
}

void sub_100014FE8(id *a1)
{
}

void sub_100015050(id *a1)
{
}

void sub_1000150B8(void *a1, const char *a2, os_log_s *a3)
{
  __int16 v6 = 2112;
  uint8_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Request %s activity date %@ is earlier than now.",  v5,  0x16u);
  sub_1000044A8();
}

void sub_100015140(void *a1, const char *a2)
{
}

void sub_1000151CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000151FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001522C(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "aa_primaryAppleAccount"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  unint64_t v10 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "dsid mimatch. Push dsid: %@, primary account dsid: %@",  (uint8_t *)&v7,  0x16u);
}

void sub_1000152EC(uint64_t a1, os_log_s *a2)
{
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  id v5 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type %@ for DSID %@.", v6, 0x16u);
}

void sub_10001538C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000153BC()
{
}

void sub_10001541C()
{
}

void sub_10001547C()
{
}

void sub_1000154DC()
{
}

void sub_100015540()
{
}

void sub_1000155A4(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 allHTTPHeaderFields]);
  sub_100003590();
  sub_1000044B4((void *)&_mh_execute_header, v2, v3, "Headers: %@", v4, v5, v6, v7, v8);

  sub_1000044A8();
}

void sub_10001561C(void *a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 HTTPBody]);
  uint64_t v4 = -[NSString initWithData:encoding:](v2, "initWithData:encoding:", v3, 4LL);
  sub_100003590();
  sub_1000044B4((void *)&_mh_execute_header, v5, v6, "Body: %@", v7, v8, v9, v10, v11);
}

void sub_1000156D4()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Could not convert push message body to JSON. Error: %@. Body: %@",  v2,  0x16u);
}

void sub_100015758(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 urlString]);
  sub_100003590();
  sub_1000044B4((void *)&_mh_execute_header, v2, v3, "URL: %@", v4, v5, v6, v7, v8);

  sub_1000044A8();
}

void sub_1000157D0(id *a1, os_log_s *a2)
{
  id v4 = [*a1 statusCode];
  id v5 = *a1;
  int v6 = 134218242;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "INTipNetworkResponse has non-200 status code: %zd for response %@",  (uint8_t *)&v6,  0x16u);
}

void sub_100015870(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "No response data for INAccountEventDetailsResponse!",  v1,  2u);
}

void sub_1000158B0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a1, 4LL);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Could not parse server response data: %@. Error: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_100015970(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "showMessage value %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000159E4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Server provided an unparseable URL string: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100015A58()
{
}

void sub_100015A84()
{
}

void sub_100015AB0()
{
}

void sub_100015ADC()
{
}

void sub_100015B40()
{
}

void sub_100015B6C()
{
}

void sub_100015B98()
{
}

void sub_100015BC4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 responseDictionary]);
  sub_100003590();
  sub_100006F28((void *)&_mh_execute_header, a2, v4, "%@", v5);

  sub_1000044A8();
}

void sub_100015C44(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  sub_100003590();
  sub_100006F10( (void *)&_mh_execute_header,  a2,  v4,  "Registration request failed due to network connection problems. Error: %@",  v5);

  sub_1000044A8();
}

void sub_100015CC4()
{
}

void sub_100015D28(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  sub_100003590();
  sub_100006F10((void *)&_mh_execute_header, a2, v4, "Registration failed with error %@", v5);

  sub_1000044A8();
}

void sub_100015DA8()
{
}

void sub_100015DD4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 responseDictionary]);
  sub_100003590();
  __int16 v5 = 2080;
  uint8_t v6 = "-[INRegistrar unregisterFromPushNotificationsForAccount:pushToken:completion:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unregistration response: %@, %s", v4, 0x16u);

  sub_1000044A8();
}

void sub_100015E70(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  sub_100003590();
  sub_100006F10((void *)&_mh_execute_header, a2, v4, "Unregistration request failed due to error: %@", v5);

  sub_1000044A8();
}

void sub_100015EF0()
{
}

void sub_100015F54()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Could not convert push message body to JSON. Error: %@. Body: %@",  v2,  0x16u);
}

void sub_100015FD4()
{
}

void sub_100016000()
{
}

void sub_10001602C()
{
}

void sub_100016058()
{
}

void sub_100016084(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[INDaemon registerForPushNotificationsWithAccount:reason:completion:]_block_invoke";
  sub_100006F10((void *)&_mh_execute_header, a1, a3, "apsConnection is nil! %s was called too early", (uint8_t *)&v3);
  sub_100003578();
}

void sub_1000160F8()
{
}

void sub_100016124()
{
}

void sub_100016184()
{
}

void sub_1000161E8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a1));
  sub_100003590();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "INRegistrationResult was %@ for reason: %@",  v6,  0x16u);

  sub_10000C740();
}

void sub_100016294(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100003590();
  sub_100006F10((void *)&_mh_execute_header, a2, v4, "Unregister device notifications failed with error %@", v5);

  sub_1000044A8();
}

void sub_100016314( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016390()
{
}

void sub_1000163F0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016458(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10000359C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to save account %@ after setting expiration date. Error %@",  (uint8_t *)&v4);
  sub_100003578();
}

void sub_1000164D4()
{
}

void sub_100016500(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100003590();
  sub_100006F10((void *)&_mh_execute_header, a2, v4, "Unregistration completed with error: %@", v5);

  sub_1000044A8();
}

void sub_100016580()
{
}

void sub_1000165AC()
{
}

void sub_1000165D8()
{
}

void sub_100016604()
{
}

void sub_100016630()
{
}

void sub_10001665C()
{
}

void sub_100016688()
{
}

void sub_1000166B4()
{
}

void sub_100016718()
{
}

void sub_100016778()
{
}

void sub_1000167A4()
{
}

void sub_1000167D0()
{
}

void sub_1000167FC()
{
}

void sub_100016828()
{
}

void sub_100016854(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100003590();
  sub_100006F10((void *)&_mh_execute_header, a2, v4, "Error retrieving configuration from AARemoteServer: %@", v5);

  sub_1000044A8();
}

void sub_1000168D4()
{
}

void sub_100016900(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 activeAPSEnvironment]);
  sub_100003590();
  sub_100006F28((void *)&_mh_execute_header, a2, v4, "Current APS env matches server preference. %@", v5);

  sub_1000044A8();
}

void sub_100016984()
{
}

void sub_1000169E8()
{
}

void sub_100016A14()
{
}

void sub_100016A40(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 pushTopics]);
  sub_100003590();
  sub_100006F28((void *)&_mh_execute_header, a2, v4, "Setting APS enabled topics to %@", v5);

  sub_1000044A8();
}

void sub_100016AC0()
{
}

void sub_100016AEC(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 topic]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  sub_10000359C( (void *)&_mh_execute_header,  a2,  v5,  "Dropping incoming push message %@ because its topic %@ is unrecognized.",  (uint8_t *)&v6);

  sub_10000C740();
}

void sub_100016B84()
{
}

void sub_100016BB0()
{
  sub_10000C730( (void *)&_mh_execute_header,  v0,  v1,  "[SUBD] Received XPC call to display a delayed notification. context=[%@]",  v2,  v3,  v4,  v5,  v6);
  sub_100003578();
}

void sub_100016C10()
{
}

void sub_100016C3C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Asked to handle unknown XPC event. %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100016CB0()
{
}

void sub_100016CDC()
{
}

void sub_100016D08()
{
}

void sub_100016D34()
{
}

void sub_100016D60()
{
}

void sub_100016D8C()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Missing iCloud auth token for account %@. Error: %@",  v2,  0x16u);
  sub_100003578();
}

void sub_100016E08( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016E38( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016E68(void *a1, os_log_s *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([a1 urlString]);
  sub_100003590();
  sub_100006F10( (void *)&_mh_execute_header,  a2,  v4,  "Fatal request error: missing account and/or parameters for %@.",  v5);

  sub_1000044A8();
}

void sub_100016EE8()
{
}

void sub_100016F4C(void *a1, os_log_s *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([a1 allHTTPHeaderFields]);
  sub_100003590();
  sub_100006F28((void *)&_mh_execute_header, a2, v4, "Request headers: %@", v5);

  sub_1000044A8();
}

void sub_100016FCC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Attaching Absinthe signature.", v1, 2u);
  sub_100004A60();
}

void sub_100017008()
{
}

void sub_10001706C(void *a1, os_log_s *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([a1 urlString]);
  sub_100003590();
  sub_100006F28((void *)&_mh_execute_header, a2, v4, "Building request for URL %@.", v5);

  sub_1000044A8();
}

void sub_1000170EC()
{
}

void sub_100017118()
{
}

void sub_10001717C(uint64_t a1, os_log_s *a2)
{
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  id v5 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type %@ for DSID %@.", v6, 0x16u);

  sub_1000044A8();
}

void sub_100017214()
{
}

void sub_100017278()
{
}

void sub_1000172A4()
{
}

void sub_1000172D0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  sub_100003590();
  sub_100006F10((void *)&_mh_execute_header, a2, v4, "Could not get event details. Error: %@", v5);

  sub_1000044A8();
}

void sub_100017350(void *a1)
{
}

void sub_1000173BC()
{
}

void sub_1000173E8()
{
}

void sub_10001744C()
{
}

void sub_100017478()
{
}

void sub_1000174A4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a1 statusCode]));
  sub_100003590();
  sub_1000044B4((void *)&_mh_execute_header, v2, v3, "Server response to notification ack: %@", v4, v5, v6, v7, v8);

  sub_1000044A8();
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return _[a1 HTTPBody];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 XPCInterface];
}

id objc_msgSend__basicBodyParameters(void *a1, const char *a2, ...)
{
  return _[a1 _basicBodyParameters];
}

id objc_msgSend__cleanUpIfNoAccountsAreLeftOtherThanAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpIfNoAccountsAreLeftOtherThanAccount:");
}

id objc_msgSend__configureXPCActivityWithCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureXPCActivityWithCriteria:");
}

id objc_msgSend__configureXPCEventStreamHandler(void *a1, const char *a2, ...)
{
  return _[a1 _configureXPCEventStreamHandler];
}

id objc_msgSend__currentBootSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 _currentBootSessionUUID];
}

id objc_msgSend__disablePushTopics(void *a1, const char *a2, ...)
{
  return _[a1 _disablePushTopics];
}

id objc_msgSend__dismissNotificationsForPushEventWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissNotificationsForPushEventWithID:");
}

id objc_msgSend__enablePushTopics(void *a1, const char *a2, ...)
{
  return _[a1 _enablePushTopics];
}

id objc_msgSend__ensureDesiredAPSEnvironmentIsInUseWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureDesiredAPSEnvironmentIsInUseWithCompletion:");
}

id objc_msgSend__exitClean(void *a1, const char *a2, ...)
{
  return _[a1 _exitClean];
}

id objc_msgSend__handleDeviceDidPairEvent(void *a1, const char *a2, ...)
{
  return _[a1 _handleDeviceDidPairEvent];
}

id objc_msgSend__handleDeviceNameChangeEvent(void *a1, const char *a2, ...)
{
  return _[a1 _handleDeviceNameChangeEvent];
}

id objc_msgSend__handleEventDetailsResponse_forEventID_accountID_pushMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleEventDetailsResponse:forEventID:accountID:pushMessage:");
}

id objc_msgSend__handleGMSAvailabilityChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleGMSAvailabilityChange];
}

id objc_msgSend__handleLanguageChangedEvent(void *a1, const char *a2, ...)
{
  return _[a1 _handleLanguageChangedEvent];
}

id objc_msgSend__handleModelCatalogChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleModelCatalogChange];
}

id objc_msgSend__handleOSEligibilityChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleOSEligibilityChange];
}

id objc_msgSend__handleRegistrationResponse_forRequest_digest_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRegistrationResponse:forRequest:digest:account:completion:");
}

id objc_msgSend__handleUnregistrationResponse_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUnregistrationResponse:account:completion:");
}

id objc_msgSend__iCloudAccountType(void *a1, const char *a2, ...)
{
  return _[a1 _iCloudAccountType];
}

id objc_msgSend__initiateAPSConnectionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initiateAPSConnectionWithCompletion:");
}

id objc_msgSend__isFirstLaunchAfterBoot(void *a1, const char *a2, ...)
{
  return _[a1 _isFirstLaunchAfterBoot];
}

id objc_msgSend__isFirstLaunchAfterBootiOS(void *a1, const char *a2, ...)
{
  return _[a1 _isFirstLaunchAfterBootiOS];
}

id objc_msgSend__isValidPush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidPush:");
}

id objc_msgSend__loadPushNotificationHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _loadPushNotificationHandlers];
}

id objc_msgSend__performLoggedOutHeartbeatRegistrationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _performLoggedOutHeartbeatRegistrationIfNeeded];
}

id objc_msgSend__planForRegistrationTTL_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_planForRegistrationTTL:account:");
}

id objc_msgSend__refreshAppleAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshAppleAccount:completion:");
}

id objc_msgSend__requestEventDetailsForPushMessage_withEventID_recipientDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestEventDetailsForPushMessage:withEventID:recipientDSID:");
}

id objc_msgSend__scheduleNextFireForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleNextFireForDate:");
}

id objc_msgSend__sendAcknowledgementForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendAcknowledgementForNotification:");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__stopHeartbeat(void *a1, const char *a2, ...)
{
  return _[a1 _stopHeartbeat];
}

id objc_msgSend__unregisterAccount_fromiCloudNotificationsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterAccount:fromiCloudNotificationsWithCompletion:");
}

id objc_msgSend__unregisterAccount_fromiCloudNotificationsWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterAccount:fromiCloudNotificationsWithReason:completion:");
}

id objc_msgSend__validateEnabledTopics(void *a1, const char *a2, ...)
{
  return _[a1 _validateEnabledTopics];
}

id objc_msgSend__validateRegistrationStateIfFirstLaunch(void *a1, const char *a2, ...)
{
  return _[a1 _validateRegistrationStateIfFirstLaunch];
}

id objc_msgSend_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:");
}

id objc_msgSend_aa_addDeviceIDHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addDeviceIDHeader");
}

id objc_msgSend_aa_addMultiUserDeviceHeaderIfEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addMultiUserDeviceHeaderIfEnabled");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_appleAccountType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountType");
}

id objc_msgSend_aa_appleAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithAltDSID:");
}

id objc_msgSend_aa_appleAccountWithPersonID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithPersonID:");
}

id objc_msgSend_aa_appleAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccounts");
}

id objc_msgSend_aa_authTokenWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_authTokenWithError:");
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isAccountClass:");
}

id objc_msgSend_aa_isPrimaryAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isPrimaryAccount");
}

id objc_msgSend_aa_isSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isSuspended");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aaf_toHexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaf_toHexString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountPushNotificationHandlerForEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountPushNotificationHandlerForEventType:");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_accountsToReconsiderAfterReboot(void *a1, const char *a2, ...)
{
  return _[a1 accountsToReconsiderAfterReboot];
}

id objc_msgSend_actionForOpeningWebURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForOpeningWebURL:");
}

id objc_msgSend_activeAPSEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 activeAPSEnvironment];
}

id objc_msgSend_activityID(void *a1, const char *a2, ...)
{
  return _[a1 activityID];
}

id objc_msgSend_activityNextFireDateKey(void *a1, const char *a2, ...)
{
  return _[a1 activityNextFireDateKey];
}

id objc_msgSend_addBodyParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBodyParameters:");
}

id objc_msgSend_addNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotification:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:forHTTPHeaderField:");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_alternateButtonURL(void *a1, const char *a2, ...)
{
  return _[a1 alternateButtonURL];
}

id objc_msgSend_apsConnection(void *a1, const char *a2, ...)
{
  return _[a1 apsConnection];
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 apsEnvironment];
}

id objc_msgSend_archivedDataWithRootObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attemptRenewCredentialsWithAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptRenewCredentialsWithAccount:completion:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bodyParameterValueForRegistrationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyParameterValueForRegistrationReason:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_checkIn(void *a1, const char *a2, ...)
{
  return _[a1 checkIn];
}

id objc_msgSend_clearCacheAndNotify(void *a1, const char *a2, ...)
{
  return _[a1 clearCacheAndNotify];
}

id objc_msgSend_clearClientCacheWithCacheTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearClientCacheWithCacheTypes:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_configurationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithCompletion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_creationDateOfOldestFollowUpWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creationDateOfOldestFollowUpWithIdentifiers:");
}

id objc_msgSend_currentDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentDeviceInfo];
}

id objc_msgSend_currentInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentInfo];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 defaultButtonTitle];
}

id objc_msgSend_defaultButtonURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultButtonURL];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceBackingColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceBackingColor];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceColor];
}

id objc_msgSend_deviceCoverGlassColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceCoverGlassColor];
}

id objc_msgSend_deviceEnclosureColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceEnclosureColor];
}

id objc_msgSend_deviceHasAnyTicket_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceHasAnyTicket:");
}

id objc_msgSend_deviceHousingColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceHousingColor];
}

id objc_msgSend_deviceInfoProvider(void *a1, const char *a2, ...)
{
  return _[a1 deviceInfoProvider];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoverPropertiesForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverPropertiesForAccount:options:completion:");
}

id objc_msgSend_dismissAlertURL(void *a1, const char *a2, ...)
{
  return _[a1 dismissAlertURL];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_enabledDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 enabledDataclasses];
}

id objc_msgSend_enabledTopics(void *a1, const char *a2, ...)
{
  return _[a1 enabledTopics];
}

id objc_msgSend_ensureNextActivityWillOccurBeforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureNextActivityWillOccurBeforeDate:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_getAccountEventDetailsURL(void *a1, const char *a2, ...)
{
  return _[a1 getAccountEventDetailsURL];
}

id objc_msgSend_handleICloudQuotaPush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleICloudQuotaPush:");
}

id objc_msgSend_handleIncomingPushNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIncomingPushNotification:");
}

id objc_msgSend_handlePushRegistrationWithAccount_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePushRegistrationWithAccount:reason:");
}

id objc_msgSend_handlePushUnregistrationWithAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePushUnregistrationWithAccount:completion:");
}

id objc_msgSend_hasCellularCapability(void *a1, const char *a2, ...)
{
  return _[a1 hasCellularCapability];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_in_registrationExpirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "in_registrationExpirationDate");
}

id objc_msgSend_in_setRegistrationExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "in_setRegistrationExpirationDate:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForAccountWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForAccountWithType:");
}

id objc_msgSend_initWithAccount_pushMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:pushMessage:");
}

id objc_msgSend_initWithAccount_pushToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:pushToken:");
}

id objc_msgSend_initWithAccount_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:store:");
}

id objc_msgSend_initWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:");
}

id objc_msgSend_initWithCallbackMachService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallbackMachService:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDeviceInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceInfo:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithRegistrationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegistrationRequest:");
}

id objc_msgSend_initWithRequest_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:handler:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_internationalMobileEquipmentIdentity(void *a1, const char *a2, ...)
{
  return _[a1 internationalMobileEquipmentIdentity];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invocationWithMethodSignature:");
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _[a1 invoke];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isRepeating(void *a1, const char *a2, ...)
{
  return _[a1 isRepeating];
}

id objc_msgSend_isResponseEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isResponseEmpty];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isValidEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnvironment:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_mobileEquipmentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 mobileEquipmentIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_performRequestWithSession_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithSession:withHandler:");
}

id objc_msgSend_postCFUIfEligible(void *a1, const char *a2, ...)
{
  return _[a1 postCFUIfEligible];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_processPushNotificationDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPushNotificationDictionary:");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return _[a1 publicToken];
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return _[a1 pushToken];
}

id objc_msgSend_pushTopics(void *a1, const char *a2, ...)
{
  return _[a1 pushTopics];
}

id objc_msgSend_quotaPushNotificationHandlerForEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quotaPushNotificationHandlerForEventType:");
}

id objc_msgSend_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:");
}

id objc_msgSend_registerDeviceURL(void *a1, const char *a2, ...)
{
  return _[a1 registerDeviceURL];
}

id objc_msgSend_registerForLoggedOutPushWithToken_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForLoggedOutPushWithToken:reason:completion:");
}

id objc_msgSend_registerForPushNotificationsWithAccount_pushToken_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForPushNotificationsWithAccount:pushToken:reason:completion:");
}

id objc_msgSend_registerForPushNotificationsWithAccount_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForPushNotificationsWithAccount:reason:completion:");
}

id objc_msgSend_registeredDeviceWithExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredDeviceWithExpirationDate:");
}

id objc_msgSend_registrar(void *a1, const char *a2, ...)
{
  return _[a1 registrar];
}

id objc_msgSend_registrationDigestForAccount_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationDigestForAccount:withError:");
}

id objc_msgSend_removeNotificationsWithEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationsWithEventIdentifier:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeRegistrationDigestForAccount_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRegistrationDigestForAccount:withError:");
}

id objc_msgSend_renewCredentialsForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:options:completion:");
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 responseDictionary];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_revalidateCFU(void *a1, const char *a2, ...)
{
  return _[a1 revalidateCFU];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveAccount_withDataclassActions_doVerify_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAccount:withDataclassActions:doVerify:completion:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setActivateAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateAction:");
}

id objc_msgSend_setActivateButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateButtonTitle:");
}

id objc_msgSend_setActiveAPSEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveAPSEnvironment:");
}

id objc_msgSend_setActivityID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityID:");
}

id objc_msgSend_setActivityNextFireDateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityNextFireDateKey:");
}

id objc_msgSend_setActivityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityState:");
}

id objc_msgSend_setApsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsConnection:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabled:");
}

id objc_msgSend_setDismissAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissAction:");
}

id objc_msgSend_setEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventIdentifier:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsRepeating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRepeating:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setNextHeartbeatDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextHeartbeatDate:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPushEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushEnvironment:");
}

id objc_msgSend_setPushMessageInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushMessageInfo:");
}

id objc_msgSend_setPushToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushToken:");
}

id objc_msgSend_setPushTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushTopics:");
}

id objc_msgSend_setRegistrationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistrationReason:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forManagedDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forManagedDefault:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedServerWithNoUrlCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedServerWithNoUrlCache];
}

id objc_msgSend_sharedSessionWithNoUrlCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedSessionWithNoUrlCache];
}

id objc_msgSend_sharedSigner(void *a1, const char *a2, ...)
{
  return _[a1 sharedSigner];
}

id objc_msgSend_showAlert(void *a1, const char *a2, ...)
{
  return _[a1 showAlert];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_signatureForData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureForData:completion:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_storageCapacity(void *a1, const char *a2, ...)
{
  return _[a1 storageCapacity];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeToLive(void *a1, const char *a2, ...)
{
  return _[a1 timeToLive];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return _[a1 udid];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unregisterDeviceFromLoggedOutiCloudNotificationsWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:completion:");
}

id objc_msgSend_unregisterDeviceURL(void *a1, const char *a2, ...)
{
  return _[a1 unregisterDeviceURL];
}

id objc_msgSend_unregisterFromLoggedOutPushNotificationsWithToken_reason_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterFromLoggedOutPushNotificationsWithToken:reason:completionHandler:");
}

id objc_msgSend_unregisterFromPushNotificationsForAccount_pushToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterFromPushNotificationsForAccount:pushToken:completion:");
}

id objc_msgSend_unregisteredDevice(void *a1, const char *a2, ...)
{
  return _[a1 unregisteredDevice];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateRegistrationDigest_forAccount_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRegistrationDigest:forAccount:withError:");
}

id objc_msgSend_urlConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 urlConfiguration];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return _[a1 urlString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForManagedDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForManagedDefault:");
}

id objc_msgSend_wasDeviceRegistered(void *a1, const char *a2, ...)
{
  return _[a1 wasDeviceRegistered];
}