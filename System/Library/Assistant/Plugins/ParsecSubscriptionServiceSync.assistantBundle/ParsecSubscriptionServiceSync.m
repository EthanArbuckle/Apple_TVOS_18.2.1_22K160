void sub_2A48(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue([a2 bundleIdentifier]);
  [v2 addObject:v3];
}

void sub_2A8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[PSSSSiriSyncHandler _startSubscriptionFetch]_block_invoke_2";
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl( &dword_0,  v7,  OS_LOG_TYPE_ERROR,  "%s Error getting active subscription services: %{public}@",  buf,  0x16u);
    }
  }

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_2C48;
  v18 = &unk_41B0;
  id v9 = v5;
  id v19 = v9;
  v10 = v8;
  v20 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:&v15];
  v11 = objc_alloc_init(&OBJC_CLASS___SAAppSubscriptions);
  v12 = objc_alloc(&OBJC_CLASS___NSURL);
  v13 = -[NSURL initWithString:](v12, "initWithString:", @"com.apple.app-subscriptions:all", v15, v16, v17, v18);
  -[SAAppSubscriptions setIdentifier:](v11, "setIdentifier:", v13);

  -[SAAppSubscriptions setActiveSubscriptions:](v11, "setActiveSubscriptions:", v10);
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, SAAppSubscriptions *))(v14 + 16))(v14, v11);
  }
}

void sub_2C48(uint64_t a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:a2]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"provider"]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"active"]);
    unsigned int v6 = [v5 isEqualToNumber:&__kCFBooleanTrue];

    if (v6)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___SAAppSubscription);
      v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.app-subscription:%@",  v4);
      id v9 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v8);
      [v7 setIdentifier:v9];

      [v7 setBundleId:v4];
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"type"]);
      v11 = (void *)v10;
      if (v10)
      {
        uint64_t v13 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
        [v7 setSubscriptionTiers:v12];
      }

      else
      {
        [v7 setSubscriptionTiers:&__NSArray0__struct];
      }

      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

id objc_msgSend_getActiveSubscriptionServicesMatchingBundleIdentifiers_domainIdentifiers_maximumExpirationLimit_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getActiveSubscriptionServicesMatchingBundleIdentifiers:domainIdentifiers:maximumExpirationLimit:completionHandler:");
}

id objc_msgSend_waitForValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForValue:");
}