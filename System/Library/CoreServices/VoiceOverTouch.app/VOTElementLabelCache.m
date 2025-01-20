@interface VOTElementLabelCache
+ (id)sharedManager;
- (VOTElementLabelCache)init;
- (id)userLabelForIdentification:(id)a3;
- (void)_iCloudPublishData:(id)a3;
- (void)_iCloudReconcileDataStore:(id)a3;
- (void)_icloudDataChanged:(id)a3;
- (void)_syncLabelCache;
- (void)dealloc;
- (void)storeUserLabel:(id)a3 forIdentification:(id)a4;
@end

@implementation VOTElementLabelCache

+ (id)sharedManager
{
  if (qword_1001AD058 != -1) {
    dispatch_once(&qword_1001AD058, &stru_10017A0E8);
  }
  return (id)qword_1001AD050;
}

- (VOTElementLabelCache)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___VOTElementLabelCache;
  v2 = -[VOTElementLabelCache init](&v30, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 preferenceForKey:@"LabelCache"]);
    id v5 = [v4 mutableCopyWithZone:0];

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v10);
          labelCache = v2->_labelCache;
          if (!labelCache)
          {
            id v13 = objc_allocWithZone(&OBJC_CLASS___NSMutableDictionary);
            v14 = (NSMutableDictionary *)objc_msgSend(v13, "init", (void)v26);
            v15 = v2->_labelCache;
            v2->_labelCache = v14;

            labelCache = v2->_labelCache;
          }

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11, (void)v26));
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElementUniqueIdentification identificationFromKey:]( &OBJC_CLASS___VOTElementUniqueIdentification,  "identificationFromKey:",  v11));
          -[NSMutableDictionary setObject:forKey:](labelCache, "setObject:forKey:", v16, v17);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v8);
    }

    dispatch_queue_t v18 = dispatch_queue_create("vot-label-access-queue", 0LL);
    labelCacheAccessQueue = v2->_labelCacheAccessQueue;
    v2->_labelCacheAccessQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("vot-label-icloud-interaction-queue", 0LL);
    iCloudInteractionQueue = v2->_iCloudInteractionQueue;
    v2->_iCloudInteractionQueue = (OS_dispatch_queue *)v20;

    -[VOTElementLabelCache _icloudDataChanged:](v2, "_icloudDataChanged:", 0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
    [v22 addObserver:v2 selector:"_icloudDataChanged:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:v23];

    v24 = v2;
  }

  return v2;
}

- (void)dealloc
{
  iCloudInteractionQueue = self->_iCloudInteractionQueue;
  self->_iCloudInteractionQueue = 0LL;

  labelCacheAccessQueue = self->_labelCacheAccessQueue;
  self->_labelCacheAccessQueue = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTElementLabelCache;
  -[VOTElementLabelCache dealloc](&v5, "dealloc");
}

- (void)_icloudDataChanged:(id)a3
{
  iCloudInteractionQueue = (dispatch_queue_s *)self->_iCloudInteractionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DE700;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_async(iCloudInteractionQueue, block);
}

- (void)_iCloudReconcileDataStore:(id)a3
{
  id v4 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    id v7 = v5;
    char v20 = 0;
    uint64_t v8 = *(void *)v22;
    *(void *)&__int128 v6 = 138543618LL;
    __int128 v19 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10, v19));
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElementUniqueIdentification identificationFromKey:]( &OBJC_CLASS___VOTElementUniqueIdentification,  "identificationFromKey:",  v10));
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_labelCache, "objectForKey:", v12));

        if (!v13)
        {
          if (!self->_labelCache)
          {
            v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            labelCache = self->_labelCache;
            self->_labelCache = v14;
          }

          uint64_t v16 = VOTLogICloud();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            __int128 v26 = v11;
            __int16 v27 = 2114;
            uint64_t v28 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Made changes from iCloud: %{public}@ =  %{public}@",  buf,  0x16u);
          }

          dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElementUniqueIdentification identificationFromKey:]( &OBJC_CLASS___VOTElementUniqueIdentification,  "identificationFromKey:",  v10));
          -[NSMutableDictionary setObject:forKey:](self->_labelCache, "setObject:forKey:", v11, v18);

          char v20 = 1;
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v7);
    if ((v20 & 1) != 0) {
      -[VOTElementLabelCache _syncLabelCache](self, "_syncLabelCache");
    }
  }
}

- (void)_iCloudPublishData:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    iCloudInteractionQueue = (dispatch_queue_s *)self->_iCloudInteractionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DEB28;
    block[3] = &unk_100176D38;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(iCloudInteractionQueue, block);
  }

- (void)_syncLabelCache
{
  id v3 = [objc_allocWithZone(NSMutableDictionary) init];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_labelCache;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_labelCache, "objectForKey:", v9));
        if (v10)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 hashKey]);
          [v3 setObject:v10 forKey:v11];
        }

        else
        {
          _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"***Label cache had a nil value in it. That is not good.");
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  [v12 setPreference:v3 forKey:@"LabelCache"];
}

- (void)storeUserLabel:(id)a3 forIdentification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  labelCacheAccessQueue = (dispatch_queue_s *)self->_labelCacheAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DEF64;
  block[3] = &unk_100177E90;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(labelCacheAccessQueue, block);
}

- (id)userLabelForIdentification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_labelCache)
  {
    uint64_t v12 = 0LL;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    __int128 v15 = sub_1000DF1D0;
    __int128 v16 = sub_1000DF1E0;
    id v17 = 0LL;
    labelCacheAccessQueue = (dispatch_queue_s *)self->_labelCacheAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DF1E8;
    block[3] = &unk_100176DD0;
    void block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(labelCacheAccessQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end