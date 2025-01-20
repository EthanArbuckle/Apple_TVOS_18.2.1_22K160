@interface WLDSubscriptionStore
+ (id)_coalescingIDForUser:(id)a3 forcedReload:(BOOL)a4;
+ (id)sharedInstance;
+ (void)_postDidUpdateCrossProcessNotificationWithProcessID:(unint64_t)a3;
- (BOOL)_shouldFetchFreshCopy;
- (WLDSubscriptionStore)init;
- (id)_coalescedCompletion;
- (id)_getSubscriptionDataMaxAge;
- (id)_inflightCoalescingID;
- (id)_readFromDisk;
- (id)_stubbedDataPath;
- (id)_supportPath;
- (void)_activeAccountChangedNotification:(id)a3;
- (void)_fetchDataFromCommerceWithCoalescingID:(id)a3 completion:(id)a4;
- (void)_setCoalescedCompletion:(id)a3;
- (void)_setInflightCoalescingID:(id)a3;
- (void)_writeToDisk:(id)a3;
- (void)dealloc;
- (void)fetchSubscriptionData:(BOOL)a3 callerProcessID:(unint64_t)a4 completion:(id)a5;
@end

@implementation WLDSubscriptionStore

+ (id)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_10);
  }
  return (id)sharedInstance___singleInstance;
}

void __38__WLDSubscriptionStore_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___WLDSubscriptionStore);
  v2 = (void *)sharedInstance___singleInstance;
  sharedInstance___singleInstance = (uint64_t)v1;
}

- (WLDSubscriptionStore)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___WLDSubscriptionStore;
  v2 = -[WLDSubscriptionStore init](&v20, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v4 = -[NSUserDefaults initWithSuiteName:](v3, "initWithSuiteName:", WLKDefaultsDomain);
    defaults = v2->_defaults;
    v2->_defaults = v4;

    if (v2->_enabled)
    {
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.WatchListKit.SubscriptionStore", 0LL);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v6;

      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[WLDSubscriptionStore _readFromDisk](v2, "_readFromDisk"));
      subscriptionData = v2->_subscriptionData;
      v2->_subscriptionData = (WLKSubscriptionData *)v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
      accountID = v2->_accountID;
      v2->_accountID = (NSNumber *)v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v15 = WLKAccountMonitorAccountDidChange;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAccountMonitor sharedInstance](&OBJC_CLASS___WLKAccountMonitor, "sharedInstance"));
      [v14 addObserver:v2 selector:"_activeAccountChangedNotification:" name:v15 object:v16];

      v2->_propLock._os_unfair_lock_opaque = 0;
      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[WLDSubscriptionStore _getSubscriptionDataMaxAge](v2, "_getSubscriptionDataMaxAge"));
      maxAgeInSeconds = v2->_maxAgeInSeconds;
      v2->_maxAgeInSeconds = (NSNumber *)v17;
    }
  }

  return v2;
}

- (void)dealloc
{
  if (self->_enabled)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WLDSubscriptionStore;
  -[WLDSubscriptionStore dealloc](&v4, "dealloc");
}

- (void)fetchSubscriptionData:(BOOL)a3 callerProcessID:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = (void (**)(id, void, void *))a5;
  uint64_t v10 = WLKSubscriptionSyncLogObject(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetching Subscription Data is not supported on this platform",  buf,  2u);
  }

  if (v8)
  {
    uint64_t v14 = WLKError(202LL, 0LL, @"Fetching Subscription Data is not supported on this platform");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v8[2](v8, 0LL, v15);
  }

  else if (self->_enabled)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_activeiTunesAccount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ams_DSID"));

    if (v18 && (v6 || (BOOL v19 = -[WLDSubscriptionStore _shouldFetchFreshCopy](self, "_shouldFetchFreshCopy"))))
    {
      BOOL v21 = -[WLDSubscriptionStore _shouldFetchFreshCopy](self, "_shouldFetchFreshCopy");
      if (v21)
      {
        uint64_t v23 = WLKSubscriptionSyncLogObject(v21, v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Subscription data has expired or is nil.",  buf,  2u);
        }
      }

      if (v6)
      {
        uint64_t v25 = WLKSubscriptionSyncLogObject(v21, v22);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Subscription client is requesting forced refresh",  buf,  2u);
        }
      }

      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[WLDSubscriptionStore _coalescingIDForUser:forcedReload:]( &OBJC_CLASS___WLDSubscriptionStore,  "_coalescingIDForUser:forcedReload:",  v18,  v6));
      uint64_t v29 = WLKSubscriptionSyncLogObject(v27, v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v27;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Fetching for coalescingID: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke;
      v34[3] = &unk_10003DA10;
      v34[4] = self;
      objc_copyWeak(v36, (id *)buf);
      v36[1] = (id)a4;
      id v35 = 0LL;
      -[WLDSubscriptionStore _fetchDataFromCommerceWithCoalescingID:completion:]( self,  "_fetchDataFromCommerceWithCoalescingID:completion:",  v27,  v34);

      objc_destroyWeak(v36);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      uint64_t v33 = WLKSubscriptionSyncLogObject(v19, v20);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Subscription data is still valid, returning cache",  buf,  2u);
      }
    }
  }

  else
  {
    uint64_t v31 = WLKSubscriptionSyncLogObject(v12, v13);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Subscription sync is disabled", buf, 2u);
    }

    MEMORY[0x10](0LL, 0LL, 0LL);
  }
}

void __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke_2;
  block[3] = &unk_10003D9E8;
  objc_copyWeak(v16, (id *)(a1 + 48));
  uint64_t v8 = *(void **)(a1 + 56);
  id v13 = v5;
  v16[1] = v8;
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(v16);
}

void __73__WLDSubscriptionStore_fetchSubscriptionData_callerProcessID_completion___block_invoke_2( uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_super v4 = -[WLKSubscriptionData initWithDictionary:]( objc_alloc(&OBJC_CLASS___WLKSubscriptionData),  "initWithDictionary:",  *(void *)(a1 + 32));
    if (v4)
    {
      id v5 = [WeakRetained[5] isEqual:v4];
      int v6 = (int)v5;
      uint64_t v8 = WLKSubscriptionSyncLogObject(v5, v7);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "There has been no change in subscription data.",  buf,  2u);
        }

        id v11 = WeakRetained[3];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v11 setObject:v12 forKey:@"SubscriptionSyncLastSync"];
      }

      else
      {
        if (v10)
        {
          v18[0] = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Subscription data has changed. Update cached copy.",  (uint8_t *)v18,  2u);
        }

        objc_storeStrong(WeakRetained + 5, v4);
        [WeakRetained _writeToDisk:v4];
        id v15 = WeakRetained[3];
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v15 setObject:v16 forKey:@"SubscriptionSyncLastSync"];

        objc_msgSend( (id)objc_opt_class(WeakRetained, v17),  "_postDidUpdateCrossProcessNotificationWithProcessID:",  *(void *)(a1 + 64));
      }
    }

    else
    {
      uint64_t v13 = WLKSubscriptionSyncLogObject(0LL, v3);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetched subscription data is nil. No update.",  v20,  2u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    [WeakRetained _setAdPlatformsStatusCondition:v4];
  }
}

- (BOOL)_shouldFetchFreshCopy
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"SubscriptionSyncLastSync"));
  p_propLock = &self->_propLock;
  os_unfair_lock_lock(&self->_propLock);
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v5 timeIntervalSinceDate:v3];
    double v7 = v6;
    -[NSNumber doubleValue](self->_maxAgeInSeconds, "doubleValue");
    BOOL v9 = v7 > v8;
  }

  else
  {
    BOOL v9 = 1;
  }

  os_unfair_lock_unlock(p_propLock);

  return v9;
}

- (id)_inflightCoalescingID
{
  p_propLock = &self->_propLock;
  os_unfair_lock_lock(&self->_propLock);
  objc_super v4 = self->_inflightCoalescingID;
  os_unfair_lock_unlock(p_propLock);
  return v4;
}

- (void)_setInflightCoalescingID:(id)a3
{
  p_propLock = &self->_propLock;
  id v5 = a3;
  os_unfair_lock_lock(p_propLock);
  double v6 = (NSString *)[v5 copy];

  inflightCoalescingID = self->_inflightCoalescingID;
  self->_inflightCoalescingID = v6;

  os_unfair_lock_unlock(p_propLock);
}

- (id)_coalescedCompletion
{
  p_propLock = &self->_propLock;
  os_unfair_lock_lock(&self->_propLock);
  id v4 = objc_retainBlock(self->_coalescedCompletion);
  os_unfair_lock_unlock(p_propLock);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (void)_setCoalescedCompletion:(id)a3
{
  p_propLock = &self->_propLock;
  id v5 = a3;
  os_unfair_lock_lock(p_propLock);
  id v6 = objc_retainBlock(v5);

  id coalescedCompletion = self->_coalescedCompletion;
  self->_id coalescedCompletion = v6;

  os_unfair_lock_unlock(p_propLock);
}

+ (id)_coalescingIDForUser:(id)a3 forcedReload:(BOOL)a4
{
  id v4 = @"NF";
  if (a4) {
    id v4 = @"F";
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"SR-%@-%@", a3, v4);
}

- (void)_fetchDataFromCommerceWithCoalescingID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[WLDSubscriptionStore _inflightCoalescingID](self, "_inflightCoalescingID"));
  if ([v8 isEqualToString:v6]
    && (BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[WLDSubscriptionStore _coalescedCompletion](self, "_coalescedCompletion")),
        v9,
        !v9))
  {
    uint64_t v14 = WLKSubscriptionSyncLogObject(v10, v11);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Will coalesce operation: %@. Will _not_ go outbound.",  (uint8_t *)location,  0xCu);
    }

    -[WLDSubscriptionStore _setCoalescedCompletion:](self, "_setCoalescedCompletion:", v7);
  }

  else
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___WLKSubscriptionDataRequestOperation);
    objc_initWeak(location, v12);
    objc_initWeak(&from, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    id v16[2] = __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke;
    v16[3] = &unk_10003DA60;
    objc_copyWeak(&v18, &from);
    id v17 = v7;
    objc_copyWeak(&v19, location);
    v16[4] = self;
    [v12 setCompletionBlock:v16];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue wlkDefaultQueue](&OBJC_CLASS___NSOperationQueue, "wlkDefaultQueue"));
    [v13 addOperation:v12];

    -[WLDSubscriptionStore _setInflightCoalescingID:](self, "_setInflightCoalescingID:", v6);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

void __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _coalescedCompletion]);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_2;
  v38[3] = &unk_10003DA38;
  id v39 = a1[5];
  id v4 = v3;
  id v40 = v4;
  id v5 = objc_retainBlock(v38);
  id v6 = objc_loadWeakRetained(a1 + 7);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  id v8 = [v7 copy];

  if (v8)
  {
    uint64_t v11 = WLKSubscriptionSyncLogObject(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to fetch subscription data", buf, 2u);
    }

    ((void (*)(void *, void, id))v5[2])(v5, 0LL, v8);
  }

  else
  {
    id v13 = [*((id *)a1[4] + 3) BOOLForKey:@"SubscriptionSyncUseStubbedData"];
    if ((_DWORD)v13)
    {
      uint64_t v15 = WLKSubscriptionSyncLogObject(v13, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Using stubbed subscription data", buf, 2u);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _stubbedDataPath]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v17));

      if (v18)
      {
        id v36 = 0LL;
        id v19 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v18,  &v36);
        id v20 = v36;
        id v35 = v20;
        if (v20)
        {
          uint64_t v22 = WLKSubscriptionSyncLogObject(v20, v21);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_cold_1();
          }
          v24 = 0LL;
        }

        else
        {
          uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
          uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSArray, v26);
          uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber, v29);
          v32 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v34,  v33,  v28,  v30,  objc_opt_class(&OBJC_CLASS___NSDate, v31),  0LL);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v19,  "decodeObjectOfClasses:forKey:",  v23,  NSKeyedArchiveRootObjectKey));
        }
      }

      else
      {
        v24 = 0LL;
      }

      ((void (*)(void *, void *, void))v5[2])(v5, v24, 0LL);
    }

    else
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
      ((void (*)(void *, void *, void))v5[2])(v5, v25, 0LL);
    }
  }

  [a1[4] _setInflightCoalescingID:0];
  [a1[4] _setCoalescedCompletion:0];
}

void __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (id)_readFromDisk
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __37__WLDSubscriptionStore__readFromDisk__block_invoke;
  v5[3] = &unk_10003D930;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__WLDSubscriptionStore__readFromDisk__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _supportPath]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v2));

  if (v3)
  {
    id v30 = 0LL;
    id v4 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v3,  &v30);
    id v5 = v30;
    id v7 = v5;
    if (v5)
    {
      uint64_t v8 = WLKSubscriptionSyncLogObject(v5, v6);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_cold_1();
      }
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___WLKSubscriptionData, v6);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString, v15);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
      id v20 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v12,  v14,  v16,  v18,  objc_opt_class(&OBJC_CLASS___NSDate, v19),  0LL);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v4,  "decodeObjectOfClasses:forKey:",  v9,  NSKeyedArchiveRootObjectKey));
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___WLKSubscriptionData, v22);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v21, v23);
      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v27 = v21;
        uint64_t v28 = *(os_log_s **)(v26 + 40);
        *(void *)(v26 + 40) = v27;
      }

      else
      {
        uint64_t v29 = WLKSubscriptionSyncLogObject(isKindOfClass, v25);
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          __37__WLDSubscriptionStore__readFromDisk__block_invoke_cold_1();
        }
      }
    }
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:@"SubscriptionSyncLastSync"];
  }
}

- (void)_writeToDisk:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v6 = WLKDefaultSupportPath();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v21 = 0LL;
  [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v8 = v21;

  if (v8)
  {
    uint64_t v11 = WLKSubscriptionSyncLogObject(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WLDSubscriptionStore _writeToDisk:].cold.2(v8, v12);
    }
  }

  else
  {
    id v20 = 0LL;
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v20));
    id v13 = v20;
    id v8 = v13;
    if (v13)
    {
      uint64_t v15 = WLKSubscriptionSyncLogObject(v13, v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[WLDSubscriptionStore _writeToDisk:].cold.1(v8, v16);
      }
    }

    else
    {
      if (v12)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WLDSubscriptionStore _supportPath](self, "_supportPath"));
        unsigned int v18 = -[os_log_s writeToFile:atomically:](v12, "writeToFile:atomically:", v17, 1LL);
      }

      else
      {
        unsigned int v18 = 0;
      }

      uint64_t v19 = WLKSubscriptionSyncLogObject(v13, v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wrote subscription store %d", buf, 8u);
      }
    }
  }
}

- (id)_supportPath
{
  uint64_t v2 = WLKDefaultSupportPath(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"subscription.plist"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByExpandingTildeInPath]);
  return v5;
}

- (id)_stubbedDataPath
{
  uint64_t v2 = WLKDefaultSupportPath(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"stubbedData.plist"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByExpandingTildeInPath]);
  return v5;
}

- (void)_activeAccountChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0LL;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke;
  block[3] = &unk_10003DA88;
  id v9 = v7;
  id v19 = v9;
  id v20 = self;
  id v21 = &v22;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v23 + 24) || !v9)
  {
    uint64_t v12 = WLKSubscriptionSyncLogObject(v10, v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "User sign-in or sign-out. Remove persisted cache",  (uint8_t *)&buf,  2u);
    }

    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", @"SubscriptionSyncLastSync");
    objc_initWeak(&buf, self);
    uint64_t v14 = (dispatch_queue_s *)self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke_43;
    v15[3] = &unk_10003D650;
    objc_copyWeak(&v16, &buf);
    v15[4] = self;
    dispatch_async(v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&buf);
  }

  _Block_object_dispose(&v22, 8);
}

void __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)(a1 + 32);
  if (!v3)
  {
LABEL_5:
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = 0LL;

    return;
  }

  if (*(void *)(*(void *)(a1 + 40) + 8LL))
  {
    id v3 = objc_msgSend(v3, "isEqualToNumber:");
    if ((v3 & 1) != 0)
    {
      if (*(void *)(a1 + 32)) {
        return;
      }
      goto LABEL_5;
    }
  }

  uint64_t v6 = WLKSubscriptionSyncLogObject(v3, a2);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DSID changed", v8, 2u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 8LL), *(id *)(a1 + 32));
}

void __58__WLDSubscriptionStore__activeAccountChangedNotification___block_invoke_43(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = (void *)WeakRetained[5];
  WeakRetained[5] = 0LL;

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _supportPath]);
  [v3 removeItemAtPath:v4 error:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLDSubscriptionStore sharedInstance](&OBJC_CLASS___WLDSubscriptionStore, "sharedInstance"));
  [v5 fetchSubscriptionData:0 callerProcessID:getpid() completion:&__block_literal_global_45];

  objc_msgSend( (id)objc_opt_class(*(void *)(a1 + 32), v6),  "_postDidUpdateCrossProcessNotificationWithProcessID:",  _WLKSystemSubscriptionPID);
}

- (id)_getSubscriptionDataMaxAge
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAppBag app](&OBJC_CLASS___TVAppBag, "app"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 integerForKey:@"tvSubscriptionStatusMaxAgeInSeconds"]);

  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = &off_1000417F0;
  }

  return v4;
}

+ (void)_postDidUpdateCrossProcessNotificationWithProcessID:(unint64_t)a3
{
  uint64_t v4 = WLKSubscriptionSyncLogObject(a1, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Posting did update cross process note", v8, 2u);
  }

  int v6 = _postDidUpdateCrossProcessNotificationWithProcessID__token;
  id v7 = (const char *)_WLKSubscriptionStoreSubscriptionDataDidChangeInternal;
  if (!_postDidUpdateCrossProcessNotificationWithProcessID__token)
  {
    notify_register_check( _WLKSubscriptionStoreSubscriptionDataDidChangeInternal,  &_postDidUpdateCrossProcessNotificationWithProcessID__token);
    int v6 = _postDidUpdateCrossProcessNotificationWithProcessID__token;
  }

  notify_set_state(v6, a3);
  notify_post(v7);
}

- (void).cxx_destruct
{
}

void __74__WLDSubscriptionStore__fetchDataFromCommerceWithCoalescingID_completion___block_invoke_cold_1()
{
}

void __37__WLDSubscriptionStore__readFromDisk__block_invoke_cold_1()
{
}

- (void)_writeToDisk:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, v4, "Failed to archive subscription data: %@", v5);
}

- (void)_writeToDisk:(void *)a1 .cold.2(void *a1, os_log_s *a2)
{
  uint64_t v4 = WLKDefaultSupportPath();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to create directory %@: %@",  (uint8_t *)&v7,  0x16u);
}

@end