void sub_100001A4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

LABEL_7:
    v5 = 0LL;
  }

  return v5;
}

id sub_1000023D0(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 pushPlaybackPositionEntity:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

id sub_1000023F4(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 pullPlaybackPositionEntity:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

id sub_100002418(void *a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1[4] + 32) pullLocalPlaybackPositionForEntityIdentifiers:a1[5] clientIdentity:a1[6] completionBlock:a1[7]];
  }
  else {
    return (id)(*(uint64_t (**)(void))(a1[7] + 16LL))();
  }
}

id sub_100002444(uint64_t a1, void *a2)
{
  return [a2 updateForeignDatabaseWithValuesFromPlaybackPositionEntity:*(void *)(a1 + 32) clientIdentity:*(void *)(a1 + 40)];
}

id sub_100002450(uint64_t a1, void *a2)
{
  return [a2 deletePlaybackPositionEntitiesWithClientIdentity:*(void *)(a1 + 32)];
}

id sub_10000245C(uint64_t a1, void *a2)
{
  return [a2 deletePlaybackPositionEntity:*(void *)(a1 + 32) clientIdentity:*(void *)(a1 + 40)];
}

id sub_100002468(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 persistPlaybackPositionEntity:*(void *)(a1 + 32) isCheckpoint:*(unsigned __int8 *)(a1 + 56) clientIdentity:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_10000248C(id a1, SBDDomainSyncServiceHandler *a2)
{
}

void sub_100002494(id a1, SBDDomainSyncServiceHandler *a2)
{
}

id sub_10000249C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    return [a2 synchronizeImmediatelyWithCompletionHandler:v2];
  }
  else {
    return (id)(*(uint64_t (**)(void, void, void))(v2 + 16))(*(void *)(a1 + 32), 0LL, 0LL);
  }
}

void sub_1000024BC(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 48) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), *(id *)(a1 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;

    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) playbackPositionDomain]);
    if (!v6)
    {
      v7 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(v8 + 24);
        uint64_t v10 = *(void *)(v8 + 48);
        int v11 = 138412546;
        uint64_t v12 = v9;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "client %@ did not supply a domain in client connection configuration %@",  (uint8_t *)&v11,  0x16u);
      }
    }
  }
}

void sub_1000025D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412290;
    id v4 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Connection invalidated: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100002690(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412290;
    id v4 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Connection interrupted: %@", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t start()
{
  v0 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Uh oh, I shouldn't be alive!", buf, 2u);
  }

  +[MSVAutoBugCapture snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:]( &OBJC_CLASS___MSVAutoBugCapture,  "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:",  MSVAutoBugCaptureDomainStoreBookKeeper,  @"Bug",  @"Daemon Launched",  @"storebookkeeperd unexpectedly launched",  0LL,  0LL,  0LL);
  return 0LL;
}

void sub_100002C50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000035A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "synchronizeImmediatelyWithCompletionHandler",  v5,  2u);
  }

  [v3 synchronizeImmediatelyWithCompletionHandler:*(void *)(a1 + 32)];
}

void sub_100003638(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "[SBDDomainSyncServiceHandler synchronizeForUpdatedRemoteDomainVersion]",  v5,  2u);
  }

  [v3 synchronizeForUpdatedRemoteDomainVersion:*(void *)(a1 + 32)];
}

void sub_1000036CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = 1;
  if (!*(_BYTE *)(v2 + 25)) {
    BOOL v3 = *(_BYTE *)(a1 + 40) != 0;
  }
  *(_BYTE *)(v2 + 25) = v3;
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 1;
  dispatch_time_t v4 = dispatch_time(0LL, 500000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003770;
  block[3] = &unk_10001D2C8;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, &_dispatch_main_q, block);
}

void sub_100003770(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24))
  {
    if (*(_BYTE *)(v1 + 25))
    {
      BOOL v3 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reloading store accounts", buf, 2u);
      }

      dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      [v4 reloadAccounts];
    }

    dispatch_time_t v5 = dispatch_time(0LL, 500000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003868;
    block[3] = &unk_10001D2C8;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v5, &_dispatch_main_q, block);
  }

void sub_100003868(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 0;
  *(_BYTE *)(*(void *)(a1 + 32) + 25LL) = 0;
  uint64_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Handling account did change notification",  buf,  2u);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 32) valueForKeyPath:@"@distinctUnionOfObjects.domain.foreignDatabasePath"]);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) allSyncingDomains];
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 foreignDatabasePath]);
        unsigned __int8 v12 = [v3 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          __int16 v13 = -[SBDDomainSyncServiceHandler initWithDomain:]( objc_alloc(&OBJC_CLASS___SBDDomainSyncServiceHandler),  "initWithDomain:",  v10);
          [*(id *)(*(void *)(a1 + 32) + 32) addObject:v13];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }

    while (v7);
  }

  [*(id *)(a1 + 32) _updatePushNotificationRegistrations];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v14 = SBKStoreAccountIdentifiers();
  v33 = (void *)objc_claimAutoreleasedReturnValue(v14);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v31 = a1;
  id v15 = *(id *)(*(void *)(a1 + 32) + 32LL);
  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 domain]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 foreignDatabasePath]);

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v20 domain]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 foreignDatabasePath]);
          uint64_t v25 = SBKStoreAccountIdentifierFromDatabasePath();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

          if (v26)
          {
            if ([v33 containsObject:v26])
            {
              v27 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Scheduling reset sync", buf, 2u);
              }

              [v20 synchronizeForChangedAccountStatus];
              [v32 addObject:v20];
            }

            else
            {
              [v20 synchronizeImmediatelyWithCompletionHandler:&stru_10001C868];
            }
          }

          else
          {
            v28 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Dropping handler. handlerAccountID=nil",  buf,  2u);
            }

            v26 = 0LL;
          }
        }

        else
        {
          v26 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Dropping handler. foreignDatabasePath=nil",  buf,  2u);
          }
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }

    while (v17);
  }

  uint64_t v29 = *(void *)(v31 + 32);
  v30 = *(void **)(v29 + 32);
  *(void *)(v29 + 32) = v32;
}

void sub_100003C9C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Dropping handler. handlerAccountID not in storeAccountIdentifiers",  v4,  2u);
  }
}

void sub_100003D0C(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 32LL);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      dispatch_time_t v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend( *(id *)(*((void *)&v6 + 1) + 8 * (void)v5),  "synchronizeIfNeedsInitialSynchronization",  (void)v6);
        dispatch_time_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }

    while (v3);
  }
}

uint64_t sub_100003DF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003E08(uint64_t a1)
{
}

id sub_100003E10(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _updateForAccountChangeAfterReloadingAccounts:1];
}

id sub_100003E24(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _updateForSharedLibraryImportFinished];
}

void sub_100003E34(id a1, NSNumber *a2, NSString *a3, id a4)
{
  id v6 = a4;
  __int128 v7 = a3;
  __int128 v8 = a2;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[SBDServer server](&OBJC_CLASS___SBDServer, "server"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003EF8;
  v11[3] = &unk_10001C828;
  id v12 = v6;
  id v10 = v6;
  [v9 synchronizeForUpdateJobForAccount:v8 withDomain:v7 withCompletionHandler:v11];
}

uint64_t sub_100003EF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004164(id a1)
{
  id v1 = -[SBDServer _init](objc_alloc(&OBJC_CLASS___SBDServer), "_init");
  id v2 = (void *)qword_100023858;
  qword_100023858 = (uint64_t)v1;
}

id sub_100004434(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) count];
}

id sub_10000446C(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result != 0LL;
  return result;
}

uint64_t sub_1000044A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000044B8(uint64_t a1)
{
}

id sub_1000044C0(void *a1)
{
  id v2 = -[XPCTransaction initWithIdentifier:](objc_alloc(&OBJC_CLASS___XPCTransaction), "initWithIdentifier:", a1[4]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1[5] + 16) addObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [*(id *)(*(void *)(a1[6] + 8) + 40) open];
  return [*(id *)(a1[5] + 16) count];
}

void sub_10000476C(uint64_t a1)
{
  id v2 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) _init];
  uint64_t v3 = (void *)qword_100023868;
  qword_100023868 = (uint64_t)v2;
}

void sub_100004BAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005668(_Unwind_Exception *a1)
{
}

void sub_100005974( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

uint64_t sub_100005A28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005A38(uint64_t a1)
{
}

void sub_100005A40(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

BOOL sub_100005A78(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) dateToSyncWithUbiquitousStore]);
  if (!v2
    || ([*(id *)(a1 + 40) timeIntervalSinceReferenceDate],
        double v4 = v3,
        [v2 timeIntervalSinceReferenceDate],
        v4 < v5))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), *(id *)(a1 + 40));
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    __int128 v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    [v7 timeIntervalSinceNow];
    int v22 = 138412546;
    v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    __int128 v9 = "target sync date from client: %@ (in %.2f sec)";
    goto LABEL_5;
  }

  [v2 timeIntervalSinceReferenceDate];
  double v16 = v15;
  [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
  if (v16 <= v17)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), *(id *)(a1 + 48));
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      [v20 timeIntervalSinceNow];
      int v22 = 138412546;
      v23 = v20;
      __int16 v24 = 2048;
      uint64_t v25 = v21;
      __int128 v9 = "target sync date in database has been passed, using sync date of 'now': %@ (in %.2f sec)";
      goto LABEL_5;
    }
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v2);
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      [v18 timeIntervalSinceNow];
      int v22 = 138412546;
      v23 = v18;
      __int16 v24 = 2048;
      uint64_t v25 = v19;
      __int128 v9 = "target sync date from database: %@ (in %.2f sec)";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v22, 0x16u);
    }
  }

LABEL_6:
  id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v10 != v2)
  {
    int v11 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      [v2 timeIntervalSinceDate:*(void *)(a1 + 48)];
      int v22 = 138412546;
      v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "setting target date to: %@ (in %.2f sec)",  (uint8_t *)&v22,  0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) setDateToSyncWithUbiquitousStore:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }

  return v10 != v2;
}

void sub_100005D6C(uint64_t a1)
{
  double v3 = v2;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v3 - v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  double v6 = *(double *)(v5 + 24);
  if (v6 <= 0.0) {
    double v6 = 0.0;
  }
  *(double *)(v5 + 24) = v6;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)));
  uint64_t v8 = *(void *)(a1 + 40);
  __int128 v9 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = v7;
}

id sub_100005E00(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

id sub_100005E0C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

id sub_100005E18(uint64_t a1)
{
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 40),  "updateMusicLibraryWithClientIdentity:applyUbiquitousBookmarkMetadataToTrackWithPersistentID:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "foreignDatabaseEntityID"));
}

id sub_100005E4C(uint64_t a1)
{
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 40),  "updateUbiquitousDatabaseWithClientIdentity:removeUbiquitousMetadataFromTrackWithPersistentID:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "foreignDatabaseEntityID"));
}

uint64_t sub_100005E80(void *a1)
{
  id v2 = [*(id *)(a1[4] + 40) updateUbiquitousDatabaseWithClientIdentity:a1[5] persistUbiquitousMetadataWithEntity:a1[6]];
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, id))(result + 16))(result, v2);
  }
  return result;
}

id sub_100005EC8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40LL);
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  [v2 setDateToSyncWithUbiquitousStore:v3];

  return [*(id *)(*(void *)(a1 + 32) + 32) synchronizeImmediatelyWithCompletionHandler:*(void *)(a1 + 40)];
}

void sub_100005F20(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[2] = sub_100005F9C;
  v4[3] = &unk_10001C9C0;
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  double v3 = *(void **)(v1 + 40);
  v4[1] = 3221225472LL;
  char v6 = *(_BYTE *)(a1 + 48);
  v4[4] = v1;
  id v5 = v2;
  [v3 updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:v4];
}

uint64_t sub_100005F9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    double v4 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "clearing all local changes that had been scheduled for push",  buf,  2u);
    }

    objc_msgSend( *(id *)(*(void *)(a1 + 32) + 40),  "setLastSyncedEntityRevision:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "currentRevision"));
  }

  id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "reseting sync anchor to 0, and scheduling pull from server",  v7,  2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) setLastSyncedDomainVersion:SBKSyncAnchorVersionBase];
  objc_msgSend(*(id *)(a1 + 32), "_onOperationQueue_scheduleSyncBeforeDate:isCheckpoint:", *(void *)(a1 + 40), 0);

  return 1LL;
}

void sub_1000060BC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 40LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006148;
  v6[3] = &unk_10001C998;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v3 updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:v6];
}

BOOL sub_100006148(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) longLongValue];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) lastNotificationDomainVersion]);
  id v4 = [v3 longLongValue];

  if ((uint64_t)v2 <= (uint64_t)v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) lastNotificationDomainVersion]);
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "skipping scheduling a sync, last synced domain version already %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    [*(id *)(*(void *)(a1 + 40) + 40) setLastNotificationDomainVersion:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(a1 + 40), "_onOperationQueue_scheduleSyncBeforeDate:isCheckpoint:", *(void *)(a1 + 48), 0);
  }

  return (uint64_t)v2 > (uint64_t)v4;
}

id sub_10000626C(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onOperationQueue_scheduleSyncBeforeDate:isCheckpoint:",  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48));
}

uint64_t sub_10000627C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000063AC(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([(id)qword_100023888 objectForKey:*(void *)(a1 + 32)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v5 = -[SBDDomainSyncedStorageController initWithPlaybackPositionDomain:]( objc_alloc(&OBJC_CLASS___SBDDomainSyncedStorageController),  "initWithPlaybackPositionDomain:",  *(void *)(a1 + 32));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [(id)qword_100023888 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }

void sub_100006444(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
  uint64_t v2 = (void *)qword_100023888;
  qword_100023888 = v1;

  dispatch_queue_t v3 = dispatch_queue_create(0LL, 0LL);
  id v4 = (void *)qword_100023880;
  qword_100023880 = (uint64_t)v3;
}

os_log_t sub_100006490()
{
  return os_log_create("com.apple.amp.storebookkeeperd", "Push");
}

void sub_100006CAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100006DF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100006ED4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000737C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

BOOL sub_1000075B0(id a1, ML3DatabaseConnection *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[ML3DatabaseConnection executeQuery:]( a2,  "executeQuery:",  @"SELECT key, title, item_pid, bookmark_sync_timestamp, bookmark_time_ms, has_been_played, play_count_user  FROM cloud_kvs JOIN item_kvs using (key) JOIN item_extra using (item_pid)"));
  [v2 enumerateRowsWithBlock:&stru_10001CC48];

  return 1;
}

void sub_1000075F4(id a1, ML3DatabaseRow *a2, NSError *a3, BOOL *a4)
{
  uint64_t v29 = a2;
  v26 = __stderrp;
  id v28 = objc_claimAutoreleasedReturnValue(-[ML3DatabaseRow stringForColumnIndex:](v29, "stringForColumnIndex:", 0LL));
  v23 = (const char *)[v28 UTF8String];
  id v27 = objc_claimAutoreleasedReturnValue(-[ML3DatabaseRow stringForColumnIndex:](v29, "stringForColumnIndex:", 1LL));
  uint64_t v21 = (const char *)[v27 UTF8String];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[ML3DatabaseRow numberForColumnIndex:](v29, "numberForColumnIndex:", 2LL));
  id v24 = objc_claimAutoreleasedReturnValue([v25 stringValue]);
  v20 = (const char *)[v24 UTF8String];
  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[ML3DatabaseRow numberForColumnIndex:](v29, "numberForColumnIndex:", 3LL));
  [v22 doubleValue];
  double v5 = v4;
  if (qword_100023898 != -1) {
    dispatch_once(&qword_100023898, &stru_10001CC68);
  }
  uint64_t v6 = (void *)qword_100023890;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v5));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringFromDate:v7]);

  id v9 = v8;
  uint64_t v19 = (const char *)[v9 UTF8String];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ML3DatabaseRow numberForColumnIndex:](v29, "numberForColumnIndex:", 4LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 unsignedLongLongValue]));
  id v12 = objc_claimAutoreleasedReturnValue([v11 stringValue]);
  uint64_t v13 = (const char *)[v12 UTF8String];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ML3DatabaseRow numberForColumnIndex:](v29, "numberForColumnIndex:", 5LL));
  id v15 = objc_claimAutoreleasedReturnValue([v14 stringValue]);
  double v16 = (const char *)[v15 UTF8String];
  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ML3DatabaseRow numberForColumnIndex:](v29, "numberForColumnIndex:", 6LL));
  id v18 = objc_claimAutoreleasedReturnValue([v17 stringValue]);
  fprintf( v26,  "id = %s; titles = %s; item_pids = %s; timestamp = %s; bookmark_time_ms = %s; has_been_played = %s; play_count_user %s\n",
    v23,
    v21,
    v20,
    v19,
    v13,
    v16,
    (const char *)[v18 UTF8String]);
}

void sub_100007868(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  uint64_t v2 = (void *)qword_100023890;
  qword_100023890 = (uint64_t)v1;

  [(id)qword_100023890 setTimeStyle:3];
  [(id)qword_100023890 setDateStyle:1];
}

uint64_t sub_1000078B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000078C0(uint64_t a1)
{
}

void sub_1000078C8(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = [[ML3DatabasePrivacyContext alloc] initWithClientIdentity:*(void *)(a1 + 32)];
  [v19 setPrivacyContext:v3];

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"SELECT key, play_count_user, has_been_played, bookmark_time_ms, bookmark_sync_timestamp FROM cloud_kvs WHERE key"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[ML3DatabaseStatementRenderer defaultRenderer]( &OBJC_CLASS___ML3DatabaseStatementRenderer,  "defaultRenderer"));
  double v4 = (char *)[*(id *)(a1 + 40) count];
  if (v4)
  {
    double v5 = v4;
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    uint64_t v8 = -1LL;
    do
    {
      else {
        uint64_t v9 = (uint64_t)&v5[-v7];
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", v7, v9));
      if (v8 != v9)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v17 statementWithPrefix:v18 inParameterCount:v9]);

        uint64_t v8 = v9;
        uint64_t v6 = (void *)v11;
      }

      v7 += v9;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 executeQuery:v6 withParameters:v10]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) databasePath]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SBCPlaybackPositionDomain domainForSyncingMusicLibraryWithLibraryPath:]( &OBJC_CLASS___SBCPlaybackPositionDomain,  "domainForSyncingMusicLibraryWithLibraryPath:",  v13));

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100007AA8;
      v20[3] = &unk_10001CBA0;
      uint64_t v15 = *(void *)(a1 + 56);
      id v21 = v14;
      uint64_t v22 = v15;
      id v16 = v14;
      [v12 enumerateRowsWithBlock:v20];
    }

    while (v7 < (unint64_t)v5);
  }
}

void sub_100007AA8(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
    {
      id v4 = a2;
      id v10 = (id)objc_claimAutoreleasedReturnValue([v4 stringForColumnIndex:0]);
      double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 numberForColumnIndex:1]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 numberForColumnIndex:2]);
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 numberForColumnIndex:3]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 numberForColumnIndex:4]);

      uint64_t v9 = -[SBCPlaybackPositionEntity initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:]( objc_alloc(&OBJC_CLASS___SBCPlaybackPositionEntity),  "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:",  *(void *)(a1 + 32),  v10,  0LL);
      -[SBCPlaybackPositionEntity setUserPlayCount:](v9, "setUserPlayCount:", [v5 unsignedIntegerValue]);
      -[SBCPlaybackPositionEntity setHasBeenPlayed:](v9, "setHasBeenPlayed:", [v6 BOOLValue]);
      [v7 doubleValue];
      -[SBCPlaybackPositionEntity setBookmarkTime:](v9, "setBookmarkTime:");
      [v8 doubleValue];
      -[SBCPlaybackPositionEntity setBookmarkTimestamp:](v9, "setBookmarkTimestamp:");
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
    }
  }

void sub_100007BE8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 allObjects]);
  [v4 executeUpdate:v2 withParameters:v5 error:0];
}

uint64_t sub_100007C48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ML3DatabasePrivacyContext alloc] initWithClientIdentity:*(void *)(a1 + 32)];
  [v3 setPrivacyContext:v4];

  id v5 = -[ML3Track initWithPersistentID:inLibrary:]( objc_alloc(&OBJC_CLASS___ML3Track),  "initWithPersistentID:inLibrary:",  *(void *)(a1 + 56),  *(void *)(a1 + 40));
  uint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ML3Track valueForProperty:](v5, "valueForProperty:", ML3TrackPropertyRememberBookmarkTime));
    unsigned int v8 = [v7 BOOLValue];

    if (!v8)
    {
      uint64_t v15 = 0LL;
      goto LABEL_12;
    }

    uint64_t v9 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
    os_log_t v10 = (os_log_t)objc_claimAutoreleasedReturnValue( -[ML3Track valueForProperty:]( v6,  "valueForProperty:",  ML3TrackPropertyStoreBookmarkMetadataIdentifier));
    if (-[os_log_s length](v10, "length"))
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v27 = 0x3032000000LL;
      id v28 = sub_1000078B0;
      uint64_t v29 = sub_1000078C0;
      id v30 = 0LL;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8LL));
      id v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      v20 = sub_100007F30;
      id v21 = &unk_10001CB78;
      id v22 = *(id *)(a1 + 32);
      os_log_t v10 = v10;
      os_log_t v23 = v10;
      p___int128 buf = &buf;
      [WeakRetained databaseConnectionAllowingWrites:1 withBlock:&v18];

      if (*(void *)(*((void *)&buf + 1) + 40LL)) {
        -[ML3Track setValuesForPropertiesWithDictionary:]( v6,  "setValuesForPropertiesWithDictionary:",  v18,  v19,  v20,  v21,  v22);
      }
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ML3Track valueForProperty:](v6, "valueForProperty:", v9, v18, v19, v20, v21));
      v25[0] = &off_10001DE80;
      v25[1] = &off_10001DE90;
      v25[2] = v12;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 3LL));
      id v14 =  objc_msgSend( v3,  "executeQuery:withParameters:",  @"UPDATE cloud_kvs SET bookmark_sync_timestamp = ?, bookmark_sync_revision = ? WHERE key = ?",  v13);

      _Block_object_dispose(&buf, 8);
      uint64_t v15 = 1LL;
      goto LABEL_10;
    }
  }

  else
  {
    os_log_t v10 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "updateMusicLibraryByApplyingUbiquitousBookmarkMetadataToTrackWithPersistentID:, persistentID %lld doesn't exist.",  (uint8_t *)&buf,  0xCu);
    }
  }

  uint64_t v15 = 0LL;
LABEL_10:

LABEL_12:
  return v15;
}

void sub_100007F0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100007F30(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ML3DatabasePrivacyContext alloc] initWithClientIdentity:a1[4]];
  [v3 setPrivacyContext:v4];

  uint64_t v8 = a1[5];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "executeQuery:withParameters:",  @"SELECT play_count_user, has_been_played, bookmark_time_ms FROM cloud_kvs WHERE key = ?",  v5));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008048;
  v7[3] = &unk_10001CB50;
  v7[4] = a1[6];
  [v6 enumerateRowsWithBlock:v7];
}

void sub_100008048(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
    {
      v11[0] = ML3TrackPropertyPlayCountUser;
      id v4 = a2;
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 numberForColumnIndex:0]);
      v12[0] = v5;
      v11[1] = ML3TrackPropertyHasBeenPlayed;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 numberForColumnIndex:1]);
      v12[1] = v6;
      v11[2] = ML3TrackPropertyBookmarkTime;
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 numberForColumnIndex:2]);

      v12[2] = v7;
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
      os_log_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }

void sub_10000816C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ML3DatabasePrivacyContext alloc] initWithClientIdentity:*(void *)(a1 + 32)];
  [v3 setPrivacyContext:v4];

  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 executeUpdate:@"DELETE FROM cloud_kvs WHERE key = ?" withParameters:v5 error:0];
}

void sub_10000823C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ubiquitousIdentifier]);
  uint64_t v8 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 executeQuery:@"SELECT key FROM cloud_kvs WHERE key = ?" withParameters:v6]);
}

BOOL sub_100008320(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ML3DatabasePrivacyContext alloc] initWithClientIdentity:*(void *)(a1 + 32)];
  [v3 setPrivacyContext:v4];

  if ([*(id *)(a1 + 40) _databaseHasEntryForEntity:*(void *)(a1 + 48)])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([*(id *)(a1 + 48) hasBeenPlayedModified])
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 48) hasBeenPlayed]));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, @"has_been_played");
    }

    if ([*(id *)(a1 + 48) userPlayCountModified])
    {
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 48) userPlayCount]));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, @"play_count_user");
    }

    if ([*(id *)(a1 + 48) bookmarkTimeModified])
    {
      [*(id *)(a1 + 48) bookmarkTime];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8 * 1000.0));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v9, @"bookmark_time_ms");
    }

    if ([*(id *)(a1 + 48) bookmarkTimestampModified])
    {
      [*(id *)(a1 + 48) bookmarkTimestamp];
      os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v10, @"bookmark_sync_timestamp");
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5, "allKeys"));
    id v12 = [v11 count];

    if (!v12)
    {

      BOOL v37 = 1LL;
      goto LABEL_20;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [*(id *)(a1 + 56) currentRevision]));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, @"bookmark_sync_revision");

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5, "allKeys"));
    id v15 = [v14 count];

    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    double v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5, "allKeys"));
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_1000089B8;
    v68[3] = &unk_10001CA88;
    v69 = v16;
    v70 = v17;
    v71 = v5;
    id v72 = v15;
    uint64_t v19 = v5;
    id WeakRetained = v17;
    id v21 = v16;
    [v18 enumerateObjectsUsingBlock:v68];

    id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) ubiquitousIdentifier]);
    -[NSMutableArray addObject:](WeakRetained, "addObject:", v22);

    os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UPDATE cloud_kvs SET %@ WHERE key = ?",  v21));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 executeUpdate:v23 withParameters:WeakRetained error:0];
  }

  else
  {
    id v24 = *(void **)(a1 + 40);
    id v21 = (NSMutableString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) ubiquitousIdentifier]);
    id v25 = [*(id *)(a1 + 48) hasBeenPlayed];
    id v26 = [*(id *)(a1 + 48) userPlayCount];
    [*(id *)(a1 + 48) bookmarkTime];
    double v28 = v27 * 1000.0;
    [*(id *)(a1 + 48) bookmarkTimestamp];
    double v30 = v29;
    id WeakRetained = (NSMutableArray *)objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8LL));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend( v24,  "_updateUbiquitousDatabase_setBookmar kMetadataWithValuesFromTrackWithMeta dataIdentifier:hasBeenPlayed:playCou nt:bookmarkTime:timestamp:syncRevisi on:usingConnection:",  v21,  v25,  v26,  -[NSMutableArray currentRevision]( WeakRetained,  "currentRevision"),  v3,  v28,  v30);
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) ubiquitousIdentifier]);
    v74 = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL));
    v33 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "executeQuery:withParameters:",  @"SELECT item_pid, play_count_user, has_been_played, bookmark_time_ms FROM cloud_kvs INNER JOIN item_kvs USING (key) LEFT OUTER JOIN item USING (item_pid) WHERE key = ? AND item.item_pid IS NOT NULL",  v32));

    uint64_t v62 = 0LL;
    v63 = &v62;
    uint64_t v64 = 0x3032000000LL;
    v65 = sub_1000078B0;
    v66 = sub_1000078C0;
    id v67 = 0LL;
    uint64_t v56 = 0LL;
    v57 = &v56;
    uint64_t v58 = 0x3032000000LL;
    v59 = sub_1000078B0;
    v60 = sub_1000078C0;
    id v61 = 0LL;
    uint64_t v50 = 0LL;
    v51 = &v50;
    uint64_t v52 = 0x3032000000LL;
    v53 = sub_1000078B0;
    v54 = sub_1000078C0;
    id v55 = 0LL;
    uint64_t v44 = 0LL;
    v45 = &v44;
    uint64_t v46 = 0x3032000000LL;
    v47 = sub_1000078B0;
    v48 = sub_1000078C0;
    id v49 = 0LL;
    uint64_t v40 = 0LL;
    __int128 v41 = &v40;
    uint64_t v42 = 0x2020000000LL;
    char v43 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100008A6C;
    v39[3] = &unk_10001CAB0;
    v39[4] = &v62;
    v39[5] = &v56;
    v39[6] = &v50;
    v39[7] = &v44;
    v39[8] = &v40;
    [v33 enumerateRowsWithBlock:v39];
    if (*((_BYTE *)v41 + 24) && [(id)v63[5] longLongValue])
    {
      uint64_t v34 = v51[5];
      v73[0] = v45[5];
      v73[1] = v34;
      uint64_t v35 = v63[5];
      v73[2] = v57[5];
      v73[3] = v35;
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 4LL));
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend( v3,  "executeUpdate:withParameters:error:",  @"UPDATE item_stats SET bookmark_time_ms = ?, has_been_played = ?, play_count_user = ? where item_pid = ?",  v36,  0);
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v56, 8);

    _Block_object_dispose(&v62, 8);
    BOOL v37 = *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) != 0;
  }

  else
  {
    BOOL v37 = 0LL;
  }

LABEL_20:
  return v37;
}

void sub_100008968( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

void sub_1000089B8(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendFormat:@"%@ = ?", v6];
  unint64_t v7 = *(void **)(a1 + 40);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKey:v6]);

  [v7 addObject:v8];
  if (*(void *)(a1 + 56) - 1LL > a3) {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", @", ");
  }
}

void sub_100008A6C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 numberForColumnIndex:0]);
  uint64_t v5 = *(void *)(a1[4] + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 numberForColumnIndex:1]);
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 numberForColumnIndex:2]);
  uint64_t v11 = *(void *)(a1[6] + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v3 numberForColumnIndex:3]);
  uint64_t v14 = *(void *)(a1[7] + 8LL);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 1;
}

uint64_t sub_100008B3C(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "_updateUbiquitousDatabase_setBookmarkM etadataWithValuesFromTrackWithMetadata Identifier:hasBeenPlayed:playCount:boo kmarkTime:timestamp:syncRevision:usingConnection:",  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 88),  *(void *)(a1 + 56),  *(void *)(a1 + 80),  a2,  *(double *)(a1 + 64),  *(double *)(a1 + 72));
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
}

uint64_t sub_100008B90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_23:
}

id sub_1000094F4()
{
  if (qword_1000238B8 != -1) {
    dispatch_once(&qword_1000238B8, &stru_10001CE68);
  }
  return (id)qword_1000238B0;
}

void sub_100009534(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = (void *)qword_1000238C0;
  qword_1000238C0 = (uint64_t)v1;

  id v3 = sub_1000094F4();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  [v4 enumerateKeysAndObjectsUsingBlock:&stru_10001CEC8];
}

void sub_100009584(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_100009598(id a1)
{
  v3[0] = SBKUniversalPlaybackPositionMediaItemPropertyStoreID;
  v3[1] = SBKUniversalPlaybackPositionMediaItemPropertySubscriptionStoreID;
  v4[0] = ML3TrackPropertyStoreItemID;
  v4[1] = ML3TrackPropertySubscriptionStoreItemID;
  v3[2] = SBKUniversalPlaybackPositionMediaItemPropertyPodcastURL;
  v3[3] = SBKUniversalPlaybackPositionMediaItemPropertyPodcastGUID;
  v4[2] = ML3TrackPropertyFeedURL;
  v4[3] = ML3TrackPropertyPodcastExternalGUID;
  v3[4] = SBKUniversalPlaybackPositionMediaItemPropertyTitle;
  v3[5] = SBKUniversalPlaybackPositionMediaItemPropertyItemArtist;
  v4[4] = ML3TrackPropertyTitle;
  void v4[5] = ML3TrackPropertyArtist;
  v3[6] = SBKUniversalPlaybackPositionMediaItemPropertyAlbumTitle;
  v3[7] = SBKUniversalPlaybackPositionMediaItemPropertyPlayCount;
  v4[6] = ML3TrackPropertyAlbum;
  v4[7] = ML3TrackPropertyPlayCountUser;
  v3[8] = SBKUniversalPlaybackPositionMediaItemPropertyHasBeenPlayed;
  v3[9] = SBKUniversalPlaybackPositionMediaItemPropertyBookmarkTime;
  v4[8] = ML3TrackPropertyHasBeenPlayed;
  v4[9] = ML3TrackPropertyBookmarkTime;
  v3[10] = SBKUniversalPlaybackPositionMediaItemPropertyMetadataTimestamp;
  v3[11] = SBKUniversalPlaybackPositionMediaItemPropertyEntityType;
  v4[10] = ML3TrackPropertyStoreBookmarkMetadataTimestamp;
  v4[11] = ML3TrackPropertyMediaType;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
  uint64_t v2 = (void *)qword_1000238B0;
  qword_1000238B0 = v1;
}

void sub_100009758(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    id v6 = a2;
  }

  else
  {
    id v7 = a2;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  [*(id *)(a1 + 32) setObject:v8 forKey:a2];
}

uint64_t sub_100009D24(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000A130;
  v3[3] = &unk_10001CDD0;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v3];

  return 1LL;
}

uint64_t sub_100009D9C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 setDateLastSynced:v3];

  [*(id *)(a1 + 32) setLastNotificationDomainVersion:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100009E60;
  v6[3] = &unk_10001CE20;
  id v7 = *(id *)(a1 + 32);
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  return 1LL;
}

void sub_100009E60(uint64_t a1, void *a2)
{
  id v30 = a2;
  id v3 = (void *)ML3TrackPropertyBookmarkTime;
  [v30 bookmarkTime];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v5 = sub_10000A04C(v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = (void *)ML3TrackPropertyHasBeenPlayed;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v30 hasBeenPlayed]));
  id v9 = sub_10000A04C(v7, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  uint64_t v11 = (void *)ML3TrackPropertyPlayCountUser;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v30 playCount]));
  id v13 = sub_10000A04C(v11, v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = MSVTCCIdentityForCurrentProcess();
  double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v30 itemIdentifier]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 readUbiquitousDatabaseMetadataValuesWithClientIdentity:v17 identifier:v18]);

  [v19 bookmarkTimestamp];
  if (!v19 || (double v21 = v20, [v30 timestamp], v22 > v21))
  {
    os_log_t v23 = *(void **)(a1 + 32);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v30 itemIdentifier]);
    id v25 = [v10 BOOLValue];
    id v26 = [v14 unsignedIntegerValue];
    [v6 doubleValue];
    double v28 = v27;
    [v30 timestamp];
    [v23 updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier:v24 hasBeenPlayed:v25 playCount:v26 bookma rkTime:0 timestamp:v28 syncRevision:v29];
  }
}

id sub_10000A04C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqualToString:ML3TrackPropertyMediaType])
  {
    unsigned int v5 = [v4 unsignedIntValue] - 1;
    if (v5 > 7) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = qword_100014980[v5];
    }
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
  }

  else if ([v3 isEqualToString:ML3TrackPropertyBookmarkTime])
  {
    [v4 doubleValue];
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7 * 1000.0));
  }

  else
  {
    id v8 = v4;
  }

  id v9 = v8;

  return v9;
}

void sub_10000A130(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier]);
    if ([v9 length])
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataEntityRevision]);
      id v11 = [v10 unsignedLongLongValue];

      if ((unint64_t)v11 > *(void *)(a1 + 40)
        && (id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataTimestamp]),
            [v12 doubleValue],
            double v14 = v13,
            v12,
            [v5 timestamp],
            v14 >= v15))
      {
        [*(id *)(a1 + 32) addObject:v5];
      }

      else
      {
        uint64_t v16 = (void *)ML3TrackPropertyBookmarkTime;
        [v5 bookmarkTime];
        double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        id v18 = sub_10000A04C(v16, v17);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        double v20 = (void *)ML3TrackPropertyHasBeenPlayed;
        double v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 hasBeenPlayed]));
        id v22 = sub_10000A04C(v20, v21);
        os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

        id v24 = (void *)ML3TrackPropertyPlayCountUser;
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 playCount]));
        id v26 = sub_10000A04C(v24, v25);
        double v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

        v29[0] = v24;
        v29[1] = v20;
        v30[0] = v27;
        v30[1] = v23;
        v29[2] = v16;
        v30[2] = v19;
        double v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
        [v6 setValuesForPropertiesWithDictionary:v28];
      }
    }
  }
}

uint64_t sub_10000A3AC(id *a1, void *a2)
{
  id v3 = a1[5];
  id v4 = a2;
  objc_msgSend(a1[4], "setTransactionEntityRevision:", objc_msgSend(v3, "currentRevision"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[5] uppDatabase]);
  objc_msgSend(a1[4], "setLastSyncedEntityRevision:", objc_msgSend(v5, "lastSyncedEntityRevision"));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1[5] uppDatabase]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastSyncedDomainVersion]);
  [a1[4] setLastSyncedDomainVersion:v7];

  unsigned __int8 v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  [a1[4] setUbiquitousIdentifiersToSync:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1[6],  "SBKQueryForTracksNeedingPushWithEntityRevisionAnchor:orderingTerms:",  objc_msgSend(a1[4], "lastSyncedEntityRevision"),  &__NSArray0__struct));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000A638;
  v19[3] = &unk_10001CD58;
  id v20 = a1[5];
  id v21 = a1[4];
  id v22 = a1[7];
  [v9 enumeratePersistentIDsUsingBlock:v19];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1[6] SBKSQLQueryStringForItemsNeedingPush]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [a1[4] lastSyncedEntityRevision]));
  os_log_t v23 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 executeQuery:v10 withParameters:v12]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000A6EC;
  v15[3] = &unk_10001CD80;
  id v16 = a1[5];
  id v18 = a1[7];
  id v17 = a1[4];
  [v13 enumerateRowsWithBlock:v15];

  return 1LL;
}

void sub_10000A638(uint64_t a1, uint64_t a2)
{
  id v6 = -[SBDPlaybackPositionML3TrackMediaItem initWithPersistentID:inLibrary:]( objc_alloc(&OBJC_CLASS___SBDPlaybackPositionML3TrackMediaItem),  "initWithPersistentID:inLibrary:",  a2,  *(void *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionML3TrackMediaItem track](v6, "track"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier]);

  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ubiquitousIdentifiersToSync]);
    [v5 addObject:v4];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10000A6EC(uint64_t a1, void *a2)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a2 stringForColumnIndex:0]);
  id v3 = -[SBDPlaybackPositionMediaItem initWithUbiquitousIdentifier:inLibrary:]( objc_alloc(&OBJC_CLASS___SBDPlaybackPositionMediaItem),  "initWithUbiquitousIdentifier:inLibrary:",  v5,  *(void *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ubiquitousIdentifiersToSync]);
  [v4 addObject:v5];
}

void sub_10000A81C(id a1)
{
  v6[0] = ML3TrackPropertyFeedURL;
  id v1 = [&stru_10001CCF0 copy];
  v7[0] = v1;
  v6[1] = ML3TrackPropertyMediaType;
  id v2 = [&stru_10001CD10 copy];
  v7[1] = v2;
  v6[2] = ML3TrackPropertyBookmarkTime;
  id v3 = [&stru_10001CD30 copy];
  v7[2] = v3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));
  id v5 = (void *)qword_1000238A0;
  qword_1000238A0 = v4;
}

id sub_10000A914(id a1, id a2)
{
  return +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)[a2 unsignedLongValue] / 1000.0);
}

id sub_10000A950(id a1, id a2)
{
  unsigned int v2 = [a2 unsignedIntValue];
  uint64_t v3 = 5LL;
  uint64_t v4 = 2LL;
  uint64_t v5 = 6LL;
  uint64_t v6 = 8LL;
  uint64_t v7 = 7LL;
  if ((v2 & 0x800) == 0) {
    uint64_t v7 = (v2 >> 3) & 1;
  }
  if ((v2 & 0x2000) == 0) {
    uint64_t v6 = v7;
  }
  if ((v2 & 0x200) == 0) {
    uint64_t v5 = v6;
  }
  if ((v2 & 0x400) == 0) {
    uint64_t v4 = v5;
  }
  if ((v2 & 2) == 0) {
    uint64_t v3 = v4;
  }
  uint64_t v8 = 3LL;
  if ((v2 & 0x104) == 0) {
    uint64_t v8 = v3;
  }
  if ((v2 & 0x1020) != 0) {
    uint64_t v9 = 4LL;
  }
  else {
    uint64_t v9 = v8;
  }
  return +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9);
}

id sub_10000A9DC(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2));
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSURL);
    if ((objc_opt_isKindOfClass(v2, v5) & 1) == 0)
    {
      uint64_t v6 = 0LL;
      goto LABEL_7;
    }

    id v4 = v2;
  }

  uint64_t v6 = v4;
LABEL_7:

  return v6;
}

LABEL_22:
LABEL_23:
    ((void (*)(void *))v13[2])(v13);
    goto LABEL_24;
  }

  if (!v8)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredAccountsForDomains,  "objectForKeyedSubscript:",  v10));
    if ([v17 containsObject:v11])
    {
      id v18 = SBKStoreAccountIdentifiers();
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = [v19 containsObject:v11];

      if ((v20 & 1) == 0)
      {
        id v21 = sub_100006490();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v49 = v10;
          uint64_t v50 = 2112;
          v51 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Skipping opt-out push notification registration attempt for domain '%@' (accountID %@).  reason = 'itunessto red has already sent an opt-out on our behalf'.",  buf,  0x16u);
        }

        os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredAccountsForDomains,  "objectForKeyedSubscript:",  v10));
        [v23 removeObject:v11];

        id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SBKPreferences storeBookkeeperPreferences]( &OBJC_CLASS___SBKPreferences,  "storeBookkeeperPreferences"));
        if (-[NSMutableDictionary count](self->_registeredAccountsForDomains, "count"))
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self->_registeredAccountsForDomains,  1LL,  0LL));
          [v24 setObject:v25 forKey:@"SBKPushNotificationRegisteredDomains"];
        }

        else
        {
          [v24 setObject:0 forKey:@"SBKPushNotificationRegisteredDomains"];
        }

        goto LABEL_23;
      }
    }

    else
    {
    }
  }

  if (sub_10000CD54(v11))
  {
    id v26 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v49 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Making sure blocked accountID %@ is opted-out for push notifications",  buf,  0xCu);
    }

    uint64_t v8 = 0LL;
  }

  double v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingAccountRequests,  "objectForKeyedSubscript:",  v11));

  if (!v27)
  {
    double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingAccountRequests,  "setObject:forKeyedSubscript:",  v28,  v11);
  }

  double v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingAccountRequests,  "objectForKeyedSubscript:",  v11));
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:v10]);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[SBDPushRegistrationRequest requestForDomain:optIn:accountID:typeRegistrationURL:]( &OBJC_CLASS___SBDPushRegistrationRequest,  "requestForDomain:optIn:accountID:typeRegistrationURL:",  v10,  v8,  v11,  self->_typeRegistrationURL));
  if (([v30 isEqualToRegistrationRequest:v31] & 1) == 0)
  {
    __int128 v38 = v30;
    v32 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = @"Opt-out of";
      *(_DWORD *)__int128 buf = 138412802;
      if (v8) {
        v33 = @"Opt-in to";
      }
      id v49 = v33;
      uint64_t v50 = 2112;
      v51 = v10;
      uint64_t v52 = 2112;
      v53 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ push notification registration for domain '%@' (accountID: %@)",  buf,  0x20u);
    }

    [v38 cancel];
    [v29 setObject:v31 forKey:v10];
    uint64_t v34 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      BOOL v37 = v29;
      uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v31 requestProperties]);
      *(_DWORD *)__int128 buf = 138413314;
      id v49 = v35;
      uint64_t v50 = 2112;
      v51 = v10;
      uint64_t v52 = 2112;
      v53 = v11;
      v54 = 2112;
      id v55 = v31;
      uint64_t v56 = 2112;
      v57 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "StoreBookkeeper update push notification registration to %@ for domain '%@' (accountID %@) issuing request %@ wi th properties %@",  buf,  0x34u);

      double v29 = v37;
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10000D040;
    v39[3] = &unk_10001D0A8;
    uint64_t v40 = v29;
    __int128 v41 = v10;
    v45 = v8;
    uint64_t v42 = v11;
    char v43 = self;
    uint64_t v44 = v13;
    [v31 startWithConnectionResponseBlock:v39];

    id v30 = v38;
  }

LABEL_24:
}

void sub_10000CB7C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(dispatch_group_s **)(a1 + 32);
  if (v9)
  {
    dispatch_group_enter(v9);
    uint64_t v10 = *(void **)(a1 + 32);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  id v11 = *(void **)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000CED8;
  void v12[3] = &unk_10001D2C8;
  id v13 = v10;
  objc_msgSend( v11,  "_onQueue_updateStoreBookkeeperNotificationRegistrationForDomain:optIn:accountID:withCompletionHandler:",  v7,  a3,  v8,  v12);
}

void sub_10000CC38(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 optIn])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 storeAccountID]);
    unsigned int v5 = [v4 isEqual:*(void *)(a1 + 32)];

    if (v5) {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

void sub_10000CCA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
}

void sub_10000CD00(uint64_t a1, void *a2)
{
  id v3 = a2;
}

id sub_10000CD54(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SBKPreferences storeBookkeeperPreferences]( &OBJC_CLASS___SBKPreferences,  "storeBookkeeperPreferences"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"SBKBlacklistedAccountIDs" withDefaultValue:0]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@","]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 stringValue]);
  id v6 = [v4 containsObject:v5];

  return v6;
}

uint64_t sub_10000CEB0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_10000CEC4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000CED8(uint64_t a1)
{
  id v1 = *(dispatch_group_s **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void sub_10000CEE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 42))
  {
    *(_BYTE *)(v1 + 42) = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000CF6C;
    v3[3] = &unk_10001D008;
    id v2 = *(void **)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    id v5 = v2;
    [v4 _loadURLBagWithCompletionHandler:v3];
  }

void sub_10000CF6C(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = *(dispatch_queue_s **)(v3 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CFFC;
  void v6[3] = &unk_10001D008;
  void v6[4] = v3;
  id v7 = v4;
  dispatch_after(v2, v5, v6);
}

id sub_10000CFFC(uint64_t a1)
{
  id result = objc_msgSend( *(id *)(a1 + 32),  "_onQueue_updateStoreBookkeeperNotificationRegistration:",  *(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(a1 + 32) + 42LL) = 0;
  return result;
}

uint64_t sub_10000D02C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000D040(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
  id v7 = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bodyData]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListFromData:mutabilityOption:format:errorDescription:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListFromData:mutabilityOption:format:errorDescription:",  v8,  0LL,  0LL,  0LL));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"status"]);
  id v11 = [v10 integerValue];

  if (v9) {
    uint64_t v12 = (uint64_t)v11;
  }
  else {
    uint64_t v12 = -1LL;
  }
  id v13 = @"unknown error";
  if (v12 > 2042)
  {
    switch(v12)
    {
      case 2043LL:
        id v13 = @"unrecognized push notification type";
        break;
      case 2044LL:
        id v13 = @"no push device error";
        break;
      case 2045LL:
        id v13 = @"bad parameters in request";
        break;
    }

LABEL_14:
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request Failed: response status error (%d) '%@'",  v12,  v13));
    double v15 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v50 = NSLocalizedFailureReasonErrorKey;
    *(void *)__int128 buf = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v50,  1LL));
    id v17 =  -[NSError initWithDomain:code:userInfo:]( v15,  "initWithDomain:code:userInfo:",  NSGenericException,  -1LL,  v16);

    goto LABEL_15;
  }

  if (v12)
  {
    if (v12 == 2002) {
      id v13 = @"bad password token";
    }
    goto LABEL_14;
  }

  id v17 = 0LL;
LABEL_15:

  id v18 = v17;
  if (v18) {
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", **error** = %@, %@",  v18,  v6));
  }
  else {
    uint64_t v19 = &stru_10001D408;
  }
  id v20 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(a1 + 72)));
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    id v24 = [v7 statusCode];
    *(_DWORD *)__int128 buf = 138413826;
    *(void *)&buf[4] = v21;
    __int16 v38 = 2112;
    uint64_t v39 = v23;
    __int16 v40 = 2112;
    uint64_t v41 = v22;
    __int16 v42 = 2112;
    id v43 = v7;
    __int16 v44 = 2048;
    id v45 = v24;
    __int16 v46 = 2112;
    v47 = v9;
    __int16 v48 = 2112;
    id v49 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "StoreBookkeeper update push notification registration to %@ for domain '%@' (accountID: %@) returned response %@ w ith status %ld with decoded body %@%@",  buf,  0x48u);
  }

  id v25 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 allHeaderFields]);
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&buf[4] = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "...response-headers %@", buf, 0xCu);
  }

  if ((uint64_t)[v7 statusCode] >= 200)
  {
    uint64_t v27 = (uint64_t)[v7 statusCode];
    if (v9)
    {
      if (v27 <= 299)
      {
        double v28 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"status"]);
        BOOL v29 = [v28 integerValue] == 0;

        if (v29)
        {
          if (*(_BYTE *)(a1 + 72))
          {
            id v30 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 56) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)]);
            BOOL v31 = v30 == 0LL;

            if (v31)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
              [*(id *)(*(void *)(a1 + 56) + 88) setObject:v32 forKeyedSubscript:*(void *)(a1 + 40)];
            }

            v33 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 56) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)]);
            [v33 addObject:*(void *)(a1 + 48)];
          }
        }
      }
    }
  }

  if (!*(_BYTE *)(a1 + 72))
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 56) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    [v34 removeObject:*(void *)(a1 + 48)];
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[SBKPreferences storeBookkeeperPreferences]( &OBJC_CLASS___SBKPreferences,  "storeBookkeeperPreferences"));
  if ([*(id *)(*(void *)(a1 + 56) + 88) count])
  {
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  *(void *)(*(void *)(a1 + 56) + 88LL),  1LL,  0LL));
    [v35 setObject:v36 forKey:@"SBKPushNotificationRegisteredDomains"];
  }

  else
  {
    [v35 setObject:0 forKey:@"SBKPushNotificationRegisteredDomains"];
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_10000D9B4(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SSLockdown sharedInstance](&OBJC_CLASS___SSLockdown, "sharedInstance"));
  id v1 = [v3 copyDeviceGUID];
  dispatch_time_t v2 = (void *)qword_1000238D0;
  qword_1000238D0 = (uint64_t)v1;
}

void sub_10000DA78(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000DB24;
  void v6[3] = &unk_10001D030;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(&_dispatch_main_q, v6);
}

void sub_10000DB24(uint64_t a1)
{
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKeyPath:@"push-notifications.environment"]);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) valueForKeyPath:@"push-notification-types.add-push-notification-type-url"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));

    id v6 = (void *)v8;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0) {
    id v10 = v6;
  }
  else {
    id v10 = 0LL;
  }
  id v11 = v10;
  uint64_t v12 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 56LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DDEC;
  block[3] = &unk_10001CF18;
  id v13 = v11;
  id v29 = v13;
  id v14 = v5;
  uint64_t v15 = *(void *)(a1 + 40);
  id v30 = v14;
  uint64_t v31 = v15;
  id v16 = v2;
  id v32 = v16;
  id v17 = v6;
  id v33 = v17;
  dispatch_sync(v12, block);
  id v18 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(*(void *)(a1 + 40) + 40LL)));
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(v20 + 24);
    uint64_t v22 = *(void *)(v20 + 8);
    *(_DWORD *)__int128 buf = 138412802;
    uint64_t v35 = v19;
    __int16 v36 = 2112;
    uint64_t v37 = v21;
    __int16 v38 = 2112;
    uint64_t v39 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Finished loading URL Bag.  _pushEnabled = %@, _typeRegistrationURL = %@, _env = %@",  buf,  0x20u);
  }

  uint64_t v23 = *(void *)(a1 + 40);
  id v24 = *(dispatch_queue_s **)(v23 + 56);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000DEF8;
  v27[3] = &unk_10001D2C8;
  v27[4] = v23;
  dispatch_sync(v24, v27);
  uint64_t v25 = *(void *)(a1 + 56);
  if (v25) {
    (*(void (**)(void))(v25 + 16))();
  }
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[XPCTransactionController sharedInstance](&OBJC_CLASS___XPCTransactionController, "sharedInstance"));
  [v26 endTransaction:*(void *)(a1 + 48)];
}

void sub_10000DDEC(void *a1)
{
  dispatch_time_t v2 = (void *)APSEnvironmentProduction;
  if (a1[4]
    && (v14[0] = APSEnvironmentProduction,
        v14[1] = APSEnvironmentDevelopment,
        v14[2] = APSEnvironmentDemo,
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL)),
        unsigned int v4 = [v3 containsObject:a1[5]],
        v3,
        v4))
  {
    uint64_t v6 = a1[6];
    id v5 = a1 + 6;
    *(_BYTE *)(v6 + 40) = 1;
    id v7 = [(id)v5[1] copy];
    uint64_t v8 = *(void **)(*v5 + 8LL);
    *(void *)(*v5 + 8LL) = v7;

    dispatch_time_t v2 = (void *)v5[2];
    uint64_t v9 = 24LL;
  }

  else
  {
    uint64_t v10 = a1[6];
    id v5 = a1 + 6;
    *(_BYTE *)(v10 + 40) = 0;
    uint64_t v9 = 8LL;
  }

  uint64_t v11 = *v5;
  id v12 = v2;
  id v13 = *(void **)(v11 + v9);
  *(void *)(v11 + v9) = v12;
}

uint64_t sub_10000DEF8(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 41LL) = 1;
  return result;
}

void sub_10000DF08(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_time_t v2 = *(dispatch_queue_s **)(v1 + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E5CC;
  block[3] = &unk_10001D2C8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void sub_10000DF60(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000DFCC;
  v2[3] = &unk_10001D008;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(&_dispatch_main_q, v2);
}

void sub_10000DFCC(uint64_t a1)
{
  dispatch_time_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(v3 + 40);
    uint64_t v5 = *(void *)(v3 + 8);
    *(_DWORD *)__int128 buf = 138412802;
    uint64_t v35 = (void *)v3;
    __int16 v36 = 1024;
    int v37 = v4;
    __int16 v38 = 2112;
    uint64_t v39 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%@ Push enabled: %d, environment: %@",  buf,  0x1Cu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(dispatch_queue_s **)(v6 + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E308;
  block[3] = &unk_10001D2C8;
  void block[4] = v6;
  dispatch_sync(v7, block);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  uint64_t v9 = -[NSMutableSet initWithObjects:]( v8,  "initWithObjects:",  APSEnvironmentProduction,  *(void *)(*(void *)(a1 + 32) + 8LL),  0LL);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v24 = v9;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9, "allObjects"));
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v13);
        uint64_t v15 = objc_alloc(&OBJC_CLASS___APSConnection);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _portNameForEnvironmentName:v14]);
        id v17 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v15,  "initWithEnvironmentName:namedDelegatePort:queue:",  v14,  v16,  &_dispatch_main_q);

        -[APSConnection setDelegate:](v17, "setDelegate:", *(void *)(a1 + 32));
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(dispatch_queue_s **)(v18 + 56);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_10000E344;
        v26[3] = &unk_10001CF68;
        v26[4] = v14;
        v26[5] = v18;
        uint64_t v27 = v17;
        uint64_t v20 = v17;
        dispatch_sync(v19, v26);

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v11);
  }

  uint64_t v21 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) publicToken]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 base64EncodedStringWithOptions:0]);
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v35 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Push token: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000E308(uint64_t a1)
{
  dispatch_time_t v2 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

void sub_10000E344(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 8)])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 64LL), *(id *)(a1 + 48));
    dispatch_time_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(v3 + 8);
      uint64_t v5 = *(void *)(v3 + 64);
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@->_connection (env:%@) = %@", buf, 0x20u);
    }
  }

  else
  {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
    dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E4B8;
    block[3] = &unk_10001CF68;
    int8x16_t v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    id v9 = *(id *)(a1 + 48);
    dispatch_after(v6, &_dispatch_main_q, block);
  }

void sub_10000E4B8(uint64_t a1)
{
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v4 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412802;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%@ APSConnection (env:%@) = %@ removed from runloop",  (uint8_t *)&v8,  0x20u);
    }

    [*(id *)(a1 + 48) removeFromRunLoop];
    [*(id *)(a1 + 48) setDelegate:0];
  }

id sub_10000E5CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateConnectionTopicsAndStoreRegistrations");
}

uint64_t sub_10000E5D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000E5E4(uint64_t a1)
{
}

void sub_10000E5EC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10000E624(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 32) isEqualToSet:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32LL), *(id *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateConnectionTopicsAndStoreRegistrations");
  }

  return result;
}

void sub_10000E66C(void *a1)
{
  if ([*(id *)(a1[4] + 32) containsObject:a1[5]])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 72) objectForKey:a1[5]]);
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v2 != 0LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  }

id sub_10000E6D4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_opt_new(&OBJC_CLASS___SBDWeakDomainDelegate);
    -[SBDWeakDomainDelegate setDelegate:](v2, "setDelegate:", *(void *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 40) + 72) setObject:v2 forKey:*(void *)(a1 + 48)];
  }

  else
  {
    [*(id *)(*(void *)(a1 + 40) + 72) removeObjectForKey:*(void *)(a1 + 48)];
  }

  return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateConnectionTopicsAndStoreRegistrations");
}

id sub_10000E738(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNotificationRegistrationsWithCompletionBlock:0];
}

void sub_10000E744(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    *(_DWORD *)__int128 buf = 138412546;
    id v32 = v3;
    __int16 v33 = 2112;
    uint64_t v34 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Received push notification for storebookkeeper topic '%@' with userInfo %@",  buf,  0x16u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) valueForKey:@"1"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 72) objectForKey:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);

  if (*(void *)(a1 + 56) == *(void *)(*(void *)(a1 + 48) + 64LL) && v7 != 0LL)
  {
    uint64_t v9 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v32 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Received push notification for storebookkeeper domain '%@",  buf,  0xCu);
    }

    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:@"0"]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 longLongValue]));

      __int16 v10 = (void *)v12;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 88) objectForKeyedSubscript:v5]);
    unsigned int v14 = [v13 containsObject:v10];

    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:@"3"]);
      if (![v15 integerValue])
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) valueForKey:@"2"]);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 stringValue]);

          id v16 = (void *)v18;
        }

        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0
          && (objc_opt_respondsToSelector( v7,  "pushNotificationController:didReceiveUpdateRequestForAccount:withBookkeeperDomain:toDomainRevision:") & 1) != 0)
        {
          uint64_t v20 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412546;
            id v32 = v5;
            __int16 v33 = 2112;
            uint64_t v34 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Processing push notification for storebookkeeper domain '%@', version %@",  buf,  0x16u);
          }

          dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
          uint64_t v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10000EAFC;
          block[3] = &unk_10001CF18;
          id v23 = v7;
          uint64_t v24 = *(void *)(a1 + 48);
          id v26 = v23;
          uint64_t v27 = v24;
          id v28 = v10;
          id v29 = v5;
          id v30 = v16;
          dispatch_async(v22, block);
        }
      }
    }
  }
}

id sub_10000EAFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushNotificationController:*(void *)(a1 + 40) didReceiveUpdateRequestForAccount:*(void *)(a1 + 48) withBookkeeperDomain:*(void *)(a1 + 56) toDomainRevision:*(void *)(a1 + 64)];
}

id sub_10000EB10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000EC38;
  v9[3] = &unk_10001CEF0;
  v9[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v4 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 8);
    uint64_t v7 = *(void *)(v5 + 64);
    *(_DWORD *)__int128 buf = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%@ APSConnection (env:%@) = %@ removed from runloop in dealloc",  buf,  0x20u);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) removeFromRunLoop];
  return [*(id *)(*(void *)(a1 + 32) + 64) setDelegate:0];
}

void sub_10000EC38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ APSConnection (env:%@) = %@ removed from runloop in dealloc",  (uint8_t *)&v9,  0x20u);
  }

  [v6 removeFromRunLoop];
  [v6 setDelegate:0];
}

id sub_10000F940(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearHasChanges");
}

id sub_10000F948(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSynchronizeWithInterval:0 isCheckpoint:1.0];
}

void sub_10000F958(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 17))
  {
    char v3 = *(_BYTE *)(a1 + 64);
    double v4 = 1800.0;
    if (!v3) {
      double v4 = 10.0;
    }
    id v5 = *(void **)(v2 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000FA98;
    v9[3] = &unk_10001D1D8;
    v9[4] = v2;
    double v11 = v4;
    char v12 = v3;
    id v10 = *(id *)(a1 + 56);
    [v5 persistPlaybackPositionEntity:v6 clientIdentity:v7 completionBlock:v9];
  }

  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[UPP] attempt to set hasChangeToPush while inactive may result in changes not being pushed to the servers.",  buf,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

uint64_t sub_10000FA98(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000FB3C;
    block[3] = &unk_10001D1B0;
    void block[4] = v4;
    void block[5] = *(void *)(a1 + 48);
    char v8 = *(_BYTE *)(a1 + 56);
    dispatch_sync(v5, block);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

id sub_10000FB3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSynchronizeWithInterval:*(unsigned __int8 *)(a1 + 48) isCheckpoint:*(double *)(a1 + 40)];
}

id sub_10000FB50(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (*(_BYTE *)(v1 + 17))
  {
    *(_BYTE *)(v1 + 17) = 0;
    return [*((id *)result + 4) _onQueueSynchronizeWithInterval:0 isCheckpoint:10.0];
  }

  return result;
}

void sub_10000FB7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 17))
  {
    *(_BYTE *)(v1 + 17) = 1;
    unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 32) needsPull];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    if (v3)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
      uint64_t v7 = v5;
    }

    else
    {
      char v8 = *(void **)(*(void *)(a1 + 32) + 32LL);
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
      uint64_t v7 = v8;
    }

    id v9 = (id)v6;
    objc_msgSend(v7, "synchronizeBeforeDate:isCheckpoint:");
  }

void sub_10000FFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = 0LL;
  id v9 = v7;
  if (a2 && !v7) {
    id v8 = [*(id *)(a1 + 32) copyWithValuesFromSBKUniversalPlaybackPositionMetadata:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100010060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = 0LL;
  id v9 = v7;
  if (a2 && !v7) {
    id v8 = [*(id *)(a1 + 32) copyWithValuesFromSBKUniversalPlaybackPositionMetadata:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100010A74(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[XPCTransactionController sharedInstance](&OBJC_CLASS___XPCTransactionController, "sharedInstance"));
  [v2 endTransaction:*(void *)(a1 + 32)];
}

id sub_100010AB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v3 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"SBDJobScheduler.m" lineNumber:118 description:@"invalid initialization paramter"];

    uint64_t v2 = *(void *)(a1 + 32);
  }

  return objc_msgSend(*(id *)(a1 + 48), "__initializeBackgroundTaskAgentWithJobRunner:", v2);
}

void sub_100010B1C(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = "no-name";
    if (a2) {
      id v7 = a2;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "SBDJobScheduler: BackgroundTask Fired: %s",  buf,  0xCu);
  }

  id v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  if ([v8 length])
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v5, kBackgroundTaskAgentJobExpired);
    id v10 = objc_autoreleasePoolPush();
    if (!v9)
    {
      int64_t int64 = xpc_dictionary_get_int64(v5, kBackgroundTaskAgentJobStatus);
      if (int64 != 3)
      {
        if (int64 == 2)
        {
          if ([v8 hasPrefix:@"com.apple.storebookkeeperd.updateJob"])
          {
            id v14 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v26 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "SBDJobScheduler: Job fired %@!",  buf,  0xCu);
            }

            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsSeparatedByString:@" "]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:1]);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v16 integerValue]));

            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:2]);
            uint64_t v19 = *(void *)(a1 + 32);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            v22[2] = sub_100010EB0;
            v22[3] = &unk_10001D250;
            id v23 = v18;
            uint64_t v24 = v8;
            uint64_t v20 = *(void (**)(uint64_t, void *, id, void *))(v19 + 16);
            id v21 = v18;
            v20(v19, v17, v21, v22);
          }
        }

        else if (int64 == 1)
        {
          char v12 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = 138412290;
            id v26 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "SBDJobScheduler: Removing job %@",  buf,  0xCu);
          }

          BackgroundTaskAgentRemoveJob([v8 UTF8String]);
        }

        goto LABEL_8;
      }

      __int16 v13 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v26 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "SBDJobScheduler: Adding job %@ (ONE HOUR)",  buf,  0xCu);
      }
    }

    +[SBDJobScheduler addBackgroundJob:nextJobTimeInterval:]( &OBJC_CLASS___SBDJobScheduler,  "addBackgroundJob:nextJobTimeInterval:",  v8,  3600.0);
LABEL_8:
    objc_autoreleasePoolPop(v10);
  }
}

void sub_100010EB0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Could not synchronize domain '%@' (%@).  Synchronization will be re-attempted when the network connectivity, or account status has changed.",  (uint8_t *)&v7,  0x16u);
    }

    +[SBDJobScheduler addBackgroundJob:nextJobTimeInterval:]( &OBJC_CLASS___SBDJobScheduler,  "addBackgroundJob:nextJobTimeInterval:",  *(void *)(a1 + 40),  86400.0);
  }
}

id objc_msgSend_SBKCommitUniversalPlaybackPositionTransaction_domainVersion_metadataEnumerationBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SBKCommitUniversalPlaybackPositionTransaction:domainVersion:metadataEnumerationBlock:");
}

id objc_msgSend__onQueue_updateStoreBookkeeperNotificationRegistrationForDomain_optIn_accountID_withCompletionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_onQueue_updateStoreBookkeeperNotificationRegistrationForDomain:optIn:accountID:withCompletionHandler:");
}

id objc_msgSend__performOnDomainSyncServiceHandlerWithBookkeeperDomain_forAccountWithIdentifier_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performOnDomainSyncServiceHandlerWithBookkeeperDomain:forAccountWithIdentifier:completion:");
}

id objc_msgSend__updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier_hasBeenPlayed_playCount_bookmarkTime_timestamp_syncRevision_usingConnection_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier:hasBeenPlayed:playCoun t:bookmarkTime:timestamp:syncRevision:usingConnection:");
}

id objc_msgSend_initWithDomain_dataSource_automaticSynchronizeOptions_accountIdentifier_isActive_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:dataSource:automaticSynchronizeOptions:accountIdentifier:isActive:");
}

id objc_msgSend_initWithPlaybackPositionDomain_ubiquitousIdentifier_foreignDatabaseEntityID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:");
}

id objc_msgSend_metadataWithItemIdentifier_bookmarkTime_bookmarkTimestamp_hasBeenPlayed_playCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataWithItemIdentifier:bookmarkTime:bookmarkTimestamp:hasBeenPlayed:playCount:");
}

id objc_msgSend_persistPlaybackPositionEntity_isCheckpoint_clientIdentity_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistPlaybackPositionEntity:isCheckpoint:clientIdentity:completionBlock:");
}

id objc_msgSend_pullLocalPlaybackPositionForEntityIdentifiers_clientIdentity_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pullLocalPlaybackPositionForEntityIdentifiers:clientIdentity:completionBlock:");
}

id objc_msgSend_snapshotWithDomain_type_subType_context_triggerThresholdValues_events_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:");
}

id objc_msgSend_updateForeignDatabaseWithValuesFromPlaybackPositionEntity_clientIdentity_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateForeignDatabaseWithValuesFromPlaybackPositionEntity:clientIdentity:");
}

id objc_msgSend_updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier_hasBeenPlayed_playCount_bookmarkTime_timestamp_syncRevision_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier:hasBeenPlayed:playCount:b ookmarkTime:timestamp:syncRevision:");
}

id objc_msgSend_updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers:");
}

id objc_msgSend_updateUbiquitousDatabaseWithClientIdentity_persistUbiquitousMetadataWithEntity_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUbiquitousDatabaseWithClientIdentity:persistUbiquitousMetadataWithEntity:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}