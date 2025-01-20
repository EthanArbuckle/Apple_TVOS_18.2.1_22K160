@interface IDSRapportClient
+ (IDSRapportClient)sharedInstance;
- (BOOL)_isDiscoveredOverWiFi:(id)a3;
- (BOOL)isDeviceDiscovered:(id)a3;
- (IDSRapportClient)init;
- (IDSTTLCache)ttlCache;
- (IMMultiQueue)multiQueue;
- (RPCompanionLinkClient)companionLinkClient;
- (id)_deviceWithIdentifier:(id)a3 error:(id *)a4;
- (id)_newCompanionLinkClient;
- (void)_companionLinkClientForDeviceIdentifier:(id)a3 completion:(id)a4;
- (void)_handleDiscoveredDevice:(id)a3;
- (void)_handleIncomingIDSMessageEvent:(id)a3 options:(id)a4;
- (void)_handleLostDevice:(id)a3;
- (void)_notifyDelegatesWithBlock:(id)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)sendMessage:(id)a3 toDeviceIdentifier:(id)a4 completionBlock:(id)a5;
- (void)setMultiQueue:(id)a3;
- (void)setTtlCache:(id)a3;
- (void)ttlCache:(id)a3 willReturnCachedObject:(id)a4 forKey:(id)a5 completion:(id)a6;
@end

@implementation IDSRapportClient

+ (IDSRapportClient)sharedInstance
{
  if (qword_1009C0768 != -1) {
    dispatch_once(&qword_1009C0768, &stru_1008FE9B0);
  }
  return (IDSRapportClient *)(id)qword_1009C0770;
}

- (IDSRapportClient)init
{
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___IDSRapportClient;
  v2 = -[IDSRapportClient init](&v58, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_alloc(&OBJC_CLASS___IMMultiQueue);
    uint64_t v7 = im_primary_queue(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[IMMultiQueue initWithQueue:](v5, "initWithQueue:", v8);
    multiQueue = v2->_multiQueue;
    v2->_multiQueue = v9;

    v11 = objc_alloc(&OBJC_CLASS___IDSTTLCache);
    uint64_t v13 = im_primary_queue(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[IDSTTLCache initWithQueue:ttlInSeconds:](v11, "initWithQueue:ttlInSeconds:", v14, 300.0);
    ttlCache = v2->_ttlCache;
    v2->_ttlCache = v15;

    -[IDSTTLCache setDelegate:](v2->_ttlCache, "setDelegate:", v2);
    if (!v2->_discoveredDevices)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      discoveredDevices = v2->_discoveredDevices;
      v2->_discoveredDevices = v17;
    }

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v19 = -[IDSRapportClient _newCompanionLinkClient](v2, "_newCompanionLinkClient");
    companionLinkClient = v2->_companionLinkClient;
    v2->_companionLinkClient = v19;

    v21 = v2->_companionLinkClient;
    uint64_t v24 = im_primary_queue(v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[RPCompanionLinkClient setDispatchQueue:](v21, "setDispatchQueue:", v25);

    v26 = v2->_companionLinkClient;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100240F30;
    v55[3] = &unk_1008FE9D8;
    objc_copyWeak(&v56, &location);
    -[RPCompanionLinkClient setDeviceFoundHandler:](v26, "setDeviceFoundHandler:", v55);
    v27 = v2->_companionLinkClient;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_100240F78;
    v53[3] = &unk_1008FE9D8;
    objc_copyWeak(&v54, &location);
    -[RPCompanionLinkClient setDeviceLostHandler:](v27, "setDeviceLostHandler:", v53);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = sub_100240FC0();
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = @"ids-message";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Registering for events {eventID: %@, options: %@}",  buf,  0x16u);
    }

    v31 = v2->_companionLinkClient;
    id v32 = sub_100240FC0();
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v61 = v33;
    v62 = &__kCFBooleanTrue;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_10024101C;
    v51[3] = &unk_1008FEA00;
    objc_copyWeak(&v52, &location);
    -[RPCompanionLinkClient registerEventID:options:handler:]( v31,  "registerEventID:options:handler:",  @"ids-message",  v34,  v51);

    -[RPCompanionLinkClient setInvalidationHandler:]( v2->_companionLinkClient,  "setInvalidationHandler:",  &stru_1008FEA20);
    -[RPCompanionLinkClient setInterruptionHandler:]( v2->_companionLinkClient,  "setInterruptionHandler:",  &stru_1008FEA40);
    v35 = dispatch_group_create();
    dispatch_group_enter(v35);
    v36 = v2->_companionLinkClient;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100241160;
    v48[3] = &unk_1008F8938;
    objc_copyWeak(&v50, &location);
    v37 = v35;
    v49 = v37;
    -[RPCompanionLinkClient activateWithCompletion:](v36, "activateWithCompletion:", v48);
    dispatch_group_enter(v37);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v60 = 0;
    v38 = v2->_companionLinkClient;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100241254;
    v45[3] = &unk_1008FEA68;
    v47 = buf;
    v39 = v37;
    v46 = v39;
    -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](v38, "setLocalDeviceUpdatedHandler:", v45);
    v40 = v2->_multiQueue;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100241350;
    v43[3] = &unk_1008FEA90;
    v41 = v39;
    v44 = v41;
    -[IMMultiQueue addBlock:forKey:description:]( v40,  "addBlock:forKey:description:",  v43,  @"kDefaultMultiQueueKey",  @"init");

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v50);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc'ing IDSRapportClient", buf, 2u);
  }

  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSRapportClient;
  -[IDSRapportClient dealloc](&v4, "dealloc");
}

- (void)addDelegate:(id)a3
{
  id v7 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  delegateMap = self->_delegateMap;
  if (!delegateMap)
  {
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    uint64_t v6 = self->_delegateMap;
    self->_delegateMap = v5;

    delegateMap = self->_delegateMap;
  }

  if (!-[NSHashTable containsObject:](delegateMap, "containsObject:", v7)) {
    -[NSHashTable addObject:](self->_delegateMap, "addObject:", v7);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)removeDelegate:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[NSHashTable removeObject:](self->_delegateMap, "removeObject:", v5);

  if (!-[NSHashTable count](self->_delegateMap, "count"))
  {
    delegateMap = self->_delegateMap;
    self->_delegateMap = 0LL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isDeviceDiscovered:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  LOBYTE(lock) = -[NSMutableSet containsObject:](self->_discoveredDevices, "containsObject:", v5);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (char)lock;
}

- (void)sendMessage:(id)a3 toDeviceIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "outgoing IDS Message {deviceIentifier: %@, event: %@}",  buf,  0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100241778;
  v15[3] = &unk_1008FEAB8;
  id v17 = v8;
  id v18 = v10;
  id v16 = v9;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  -[IDSRapportClient _companionLinkClientForDeviceIdentifier:completion:]( self,  "_companionLinkClientForDeviceIdentifier:completion:",  v14,  v15);
}

- (void)ttlCache:(id)a3 willReturnCachedObject:(id)a4 forKey:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = (void (**)(void, void))v9;
  if (a4)
  {
    (*((void (**)(id, id))v9 + 2))(v9, a4);
  }

  else
  {
    id v21 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRapportClient _deviceWithIdentifier:error:](self, "_deviceWithIdentifier:error:", a5, &v21));
    id v12 = v21;
    if (v11)
    {
      id v13 = -[IDSRapportClient _newCompanionLinkClient](self, "_newCompanionLinkClient");
      [v13 setDestinationDevice:v11];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100241B9C;
      v18[3] = &unk_1008F9660;
      id v19 = v13;
      id v20 = v10;
      id v14 = v13;
      [v14 activateWithCompletion:v18];
    }

    else
    {
      id v15 = objc_alloc(&OBJC_CLASS___CUTResult);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRapportClient companionLinkClient](self, "companionLinkClient"));
      id v17 = [v15 initWithSuccess:v16];

      ((void (**)(void, id))v10)[2](v10, v17);
      id v14 = v12;
      id v12 = v17;
    }
  }
}

- (void)_notifyDelegatesWithBlock:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_delegateMap, "allObjects"));
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (BOOL)_isDiscoveredOverWiFi:(id)a3
{
  return ((unint64_t)[a3 statusFlags] >> 2) & 1;
}

- (void)_handleDiscoveredDevice:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Discovered device %@", buf, 0xCu);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  if (v6)
  {
    id v7 = (void *)v6;
    unsigned int v8 = -[IDSRapportClient _isDiscoveredOverWiFi:](self, "_isDiscoveredOverWiFi:", v4);

    if (v8)
    {
      -[NSRecursiveLock lock](self->_lock, "lock");
      discoveredDevices = self->_discoveredDevices;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
      -[NSMutableSet addObject:](discoveredDevices, "addObject:", v10);

      -[NSRecursiveLock unlock](self->_lock, "unlock");
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100241EB0;
      v11[3] = &unk_1008FEAE0;
      v11[4] = self;
      id v12 = v4;
      -[IDSRapportClient _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v11);
    }
  }
}

- (void)_handleLostDevice:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Lost device %@", buf, 0xCu);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  if (v6)
  {
    id v7 = (void *)v6;
    unsigned int v8 = -[IDSRapportClient _isDiscoveredOverWiFi:](self, "_isDiscoveredOverWiFi:", v4);

    if (v8)
    {
      -[NSRecursiveLock lock](self->_lock, "lock");
      discoveredDevices = self->_discoveredDevices;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
      -[NSMutableSet removeObject:](discoveredDevices, "removeObject:", v10);

      -[NSRecursiveLock unlock](self->_lock, "unlock");
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10024207C;
      v11[3] = &unk_1008FEAE0;
      v11[4] = self;
      id v12 = v4;
      -[IDSRapportClient _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v11);
    }
  }
}

- (void)_handleIncomingIDSMessageEvent:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "incoming IDS Message {event: %@, options: %@}",  buf,  0x16u);
  }

  if (qword_1009C0780)
  {
    uint64_t v9 = (os_log_s *)(id)qword_1009C0780;
    goto LABEL_9;
  }

  id v10 = (void **)IMWeakLinkSymbol("RPOptionSenderID", @"Rapport");
  if (v10) {
    __int128 v11 = *v10;
  }
  else {
    __int128 v11 = 0LL;
  }
  objc_storeStrong((id *)&qword_1009C0780, v11);
  uint64_t v9 = (os_log_s *)(id)qword_1009C0780;
  if (v9)
  {
LABEL_9:
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
    if ([v12 length])
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"guest-device:%@",  v12));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100242324;
      v15[3] = &unk_1008FEB08;
      void v15[4] = self;
      id v16 = v6;
      id v17 = v13;
      id v14 = v13;
      -[IDSRapportClient _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v15);
    }

    else
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1006A4BB8();
      }
    }

    goto LABEL_14;
  }

  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1006A4B58();
  }
LABEL_14:
}

- (void)_companionLinkClientForDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRapportClient ttlCache](self, "ttlCache"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100242434;
  v11[3] = &unk_1008FEB30;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 fetchCachedObjectForKey:v9 completion:v11];
}

- (id)_deviceWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRapportClient companionLinkClient](self, "companionLinkClient", 0LL));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeDevices]);

  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 effectiveIdentifier]);
        unsigned __int8 v15 = [v14 isEqualToString:v6];

        if ((v15 & 1) != 0)
        {
          id v17 = v13;
          goto LABEL_12;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    uint64_t v16 = IDSSendErrorDomain;
    NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
    uint64_t v24 = @"We failed to find a rapport destination for the provided deviceIdentifier";
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v17 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  1LL,  v8));
LABEL_12:
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (id)_newCompanionLinkClient
{
  id v2 = objc_alloc_init((Class)IMWeakLinkClass(@"RPCompanionLinkClient", @"Rapport"));
  objc_msgSend(v2, "setFlags:", objc_msgSend(v2, "flags") | 1);
  return v2;
}

- (IMMultiQueue)multiQueue
{
  return self->_multiQueue;
}

- (void)setMultiQueue:(id)a3
{
}

- (IDSTTLCache)ttlCache
{
  return self->_ttlCache;
}

- (void)setTtlCache:(id)a3
{
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void).cxx_destruct
{
}

@end