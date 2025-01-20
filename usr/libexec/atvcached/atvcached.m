void sub_10000228C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

id sub_1000022C8(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  uint64_t v5 = (a2 - 1);
  else {
    uint64_t v6 = 3LL;
  }
  id v7 = [WeakRetained purgeableAmountWithUrgency:v6];

  return v7;
}

id sub_100002310(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  uint64_t v7 = (a3 - 1);
  else {
    uint64_t v8 = 3LL;
  }
  id v9 = [WeakRetained purgeAmount:a2 withUrgency:v8 isPeriodic:0];

  return v9;
}

void sub_10000236C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancelPurge];
}

id sub_100002398(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  uint64_t v7 = (a3 - 1);
  else {
    uint64_t v8 = 3LL;
  }
  id v9 = [WeakRetained purgeAmount:a2 withUrgency:v8 isPeriodic:1];

  return v9;
}

void sub_100002588( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000025B0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _purgeTasksForUrgency:*(void *)(a1 + 48)]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&__int128 v4 = 134218242LL;
    __int128 v12 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v9 = objc_msgSend(v8, "purgeableAmountWithUrgency:", *(void *)(a1 + 48), v12);
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v9;
        id v10 = sub_100007290();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          id v18 = v9;
          __int16 v19 = 2114;
          v20 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%lld purgeable from %{public}@.",  buf,  0x16u);
        }
      }

      id v5 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v5);
  }
}

void sub_1000029AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000029D8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _purgeTasksForUrgency:*(void *)(a1 + 48)]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&__int128 v5 = 134218242LL;
    __int128 v13 = v5;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      id v10 = [v9 purgeAmount:*(void *)(a1 + 56) - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) withUrgency:*(void *)(a1 + 48)];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v10;
      id v11 = sub_100007290();
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v13;
        id v19 = v10;
        __int16 v20 = 2114;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Purged %lld from %{public}@.", buf, 0x16u);
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) >= *(void *)(a1 + 56)) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}
}

void sub_100003088(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    if (![v7 fileExistsAtPath:v12])
    {
LABEL_8:

      goto LABEL_9;
    }

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v8);

    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));
      id v10 = -[TVAggregateAppCachePurgeRequest initWithPropertyListRepresentation:]( objc_alloc(&OBJC_CLASS___TVAggregateAppCachePurgeRequest),  "initWithPropertyListRepresentation:",  v5);
      id v11 = v10;
      if (v7 && v10) {
        [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];
      }

      goto LABEL_8;
    }
  }

LABEL_9:
}

void sub_1000033C0(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 propertyListRepresentation]);
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
}

id sub_1000034E0(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mutableDoNotPurgeApplications]);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v2) {
    [v3 addObject:v5];
  }
  else {
    [v3 removeObject:v5];
  }

  return [*(id *)(a1 + 32) savePolicies];
}

void sub_100003620(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mutablePurgeRequests]);
  uint64_t v5 = (TVAggregateAppCachePurgeRequest *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  id v3 = v5;
  if (!v5) {
    id v3 = -[TVAggregateAppCachePurgeRequest initWithCacheURL:]( objc_alloc(&OBJC_CLASS___TVAggregateAppCachePurgeRequest),  "initWithCacheURL:",  *(void *)(a1 + 40));
  }
  uint64_t v6 = v3;
  -[TVAggregateAppCachePurgeRequest setPurgeRequest:forApplication:]( v3,  "setPurgeRequest:forApplication:",  *(void *)(a1 + 48),  *(void *)(a1 + 56));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mutablePurgeRequests]);
  [v4 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) savePolicies];
}

void sub_10000377C(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mutablePurgeRequests]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  id v3 = v7;
  if (v7)
  {
    [v7 setPurgeRequest:0 forApplication:*(void *)(a1 + 48)];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 applications]);
    id v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mutablePurgeRequests]);
      [v6 removeObjectForKey:*(void *)(a1 + 40)];
    }

    [*(id *)(a1 + 32) savePolicies];
    id v3 = v7;
  }
}

void sub_1000038C4(uint64_t a1)
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mutablePurgeRequests]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000039A8;
  v5[3] = &unk_10000C4B8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = &v9;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  if (*((_BYTE *)v10 + 24)) {
    [*(id *)(a1 + 32) savePolicies];
  }

  _Block_object_dispose(&v9, 8);
}

void sub_100003990( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000039A8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 applications]);
  unsigned int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    [v5 setPurgeRequest:0 forApplication:*(void *)(a1 + 32)];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 applications]);
    id v9 = [v8 count];

    if (!v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mutablePurgeRequests]);
      [v10 removeObjectForKey:v11];
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

void sub_100003B54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100003B6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003B7C(uint64_t a1)
{
}

void sub_100003B84(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _allowedPurgeRequestsForUrgency:*(void *)(a1 + 48)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100003C58(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeRequest]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 cacheURL]);

  if (v4)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mutablePurgeRequests]);
    [v3 removeObjectForKey:v4];

    [*(id *)(a1 + 40) savePolicies];
  }
}

void sub_100003F5C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100003FD8(id a1)
{
  id v1 = -[TVCacheDeleteService _init](objc_alloc(&OBJC_CLASS___TVCacheDeleteService), "_init");
  uint64_t v2 = (void *)qword_1000134D0;
  qword_1000134D0 = (uint64_t)v1;
}

void sub_100004708(id a1)
{
  id v1 = (void *)qword_1000134E0;
  qword_1000134E0 = (uint64_t)&off_10000CAA8;
}

void sub_100004720(uint64_t a1)
{
  uint64_t v2 = -[TVCacheDeleteServiceConnection initWithConnection:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___TVCacheDeleteServiceConnection),  "initWithConnection:bundleIdentifier:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) policyManager]);
  -[TVCacheDeleteServiceConnection setPolicyManager:](v2, "setPolicyManager:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) activeConnections]);
  [v4 addObject:v2];

  -[TVCacheDeleteServiceConnection resume](v2, "resume");
  id v5 = sub_100007290();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection remoteConnection](v2, "remoteConnection"));
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Listener accepted new connection %{public}@",  (uint8_t *)&v8,  0xCu);
  }
}

void sub_100004E48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100004E74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRemoteConnectionInvalidation];
}

void sub_100004EA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRemoteConnectionInterruption];
}

uint64_t sub_100005788(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005DF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100005E08(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id result = [a3 urgency];
  else {
    uint64_t v6 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
  return result;
}

void sub_100005F30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
}

void sub_100006280(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 propertyListRepresentation]);
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void sub_100006458(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      id v8 = [[TVSAppCachePurgeRequest alloc] initWithPropertyListRepresentation:v5];
      if (v8) {
        [*(id *)(a1 + 32) setPurgeRequest:v8 forApplication:v9];
      }
    }
  }
}

void sub_100006AA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

uint64_t sub_100006AF8(uint64_t a1, void *a2)
{
  if ([a2 assertionState] != (id)1) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_11:
  id v19 = v25[3];
  _Block_object_dispose(&v24, 8);
  return v19;
}

void sub_100006D50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100006D70(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 longLongValue];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006EBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100006ED4(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0 || *(void *)(a1 + 48) == 2LL)
  {
    uint64_t v3 = (id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= (uint64_t)[*(id *)(a1 + 32) urgency])
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5 == 3)
      {
        id v10 = sub_100007290();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to remove OS udpate assets",  buf,  2u);
        }

        dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
        if (!v12) {
          sub_100007A48();
        }
        dispatch_semaphore_t v13 = v12;
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_100007190;
        v26[3] = &unk_10000C648;
        uint64_t v15 = *(void *)(a1 + 40);
        dispatch_semaphore_t v27 = v13;
        uint64_t v28 = v15;
        id v8 = v13;
        [v14 purgeAssetsWithCompletion:v26];

        dispatch_time_t v16 = dispatch_time(0LL, 30000000000LL);
        dispatch_semaphore_wait(v8, v16);
      }

      else if (v5 == 2)
      {
        id v6 = sub_100007290();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Attempting to remove items from AVAssetCache",  buf,  2u);
        }

        id v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[TVPMediaCacheManager sharedInstance]( &OBJC_CLASS___TVPMediaCacheManager,  "sharedInstance"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  *(void *)(a1 + 64)));
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -[dispatch_semaphore_s clearSpace:]( v8,  "clearSpace:",  v9);
      }

      else
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*v3 cacheURL]);
        id v19 = objc_msgSend(v17, "tvcd_sizeOfFileAtURL:", v18);

        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([*v3 cacheURL]);
        id v25 = 0LL;
        unsigned int v22 = [v20 removeItemAtURL:v21 error:&v25];
        id v8 = (dispatch_semaphore_s *)v25;

        if (v22)
        {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v19;
        }

        else
        {
          id v23 = sub_100007290();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_100007998(v3, (uint64_t)v8, v24);
          }
        }
      }
    }
  }

uint64_t sub_100007190(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 longLongValue];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100007290()
{
  if (qword_1000134F8 != -1) {
    dispatch_once(&qword_1000134F8, &stru_10000C690);
  }
  return (id)qword_1000134F0;
}

void sub_1000072D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.atvcached", "TVCDSERVICE");
  uint64_t v2 = (void *)qword_1000134F0;
  qword_1000134F0 = (uint64_t)v1;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = sub_100007290();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting atvcached...", buf, 2u);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCacheDeleteService sharedInstance](&OBJC_CLASS___TVCacheDeleteService, "sharedInstance"));
  [v3 start];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v4 run];

  id v5 = sub_100007290();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Exiting atvcached.", v8, 2u);
  }

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_1000075E4(_Unwind_Exception *a1)
{
}

uint64_t sub_100007600(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    qword_100013500 += *(void *)(a2 + 96);
  }
  return 0LL;
}

void sub_100007620(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 URL]);
  sub_100003F70();
  sub_100003F5C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to properly deserialize app cache policies from file located at %{public}@. Error: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100003F88();
}

void sub_1000076A0(uint64_t a1)
{
  id v1 = (objc_class *)objc_opt_class(a1);
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100003F70();
  sub_100003F5C( (void *)&_mh_execute_header,  v4,  v5,  "Failed to save %{public}@ policies to disk. Error: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100003F88();
}

void sub_100007724(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Document directory path exists but is not a directory.",  v1,  2u);
}

void sub_100007764(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error attempting to create documents directory (%{public}@).",  (uint8_t *)&v2,  0xCu);
}

void sub_1000077D8(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 purgeRequest]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cacheURL]);
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to delete cache at URL %{public}@. Error: %{public}@",  (uint8_t *)&v7,  0x16u);
}

void sub_100007894(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 cacheURL]);
  int v6 = 138543618;
  int v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to delete item at URL %{public}@. Error: %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_100007940(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Cache configured to require system app termination:  %{public}@.",  buf,  0xCu);
}

void sub_100007998(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 cacheURL]);
  int v6 = 138543618;
  int v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to delete item at URL %{public}@. Error: %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_100007A48()
{
  __assert_rtn( "-[TVAggregateAppCachePurgeRequest purgeAmount:withUrgency:]_block_invoke",  "TVAggregateAppCachePurgeRequest.m",  295,  "semaphore != nil");
}

void sub_100007A70(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to determine size of path %{public}@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return [a1 xpcListener];
}