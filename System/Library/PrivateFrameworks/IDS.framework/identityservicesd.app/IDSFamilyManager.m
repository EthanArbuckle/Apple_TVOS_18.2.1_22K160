@interface IDSFamilyManager
+ (IDSFamilyManager)sharedInstance;
- (BOOL)canForceFamilyFetch;
- (BOOL)isPendingFetch;
- (BOOL)storedIncomingFamilyMessage;
- (IDSFamilyManager)init;
- (IDSFamilyManager)initWithFamilyRequest:(id)a3;
- (NSMutableSet)familyHandles;
- (NSSet)familyDevices;
- (NSSet)familyMembers;
- (id)handlesFromFamilyMember:(id)a3;
- (void)_familyDidUpdate:(id)a3;
- (void)_notifyFamilyServicesOfUpdate;
- (void)fetchFamilyWithFamilyRequest:(id)a3;
- (void)forceFamilyFetch;
- (void)setFamilyDevices:(id)a3;
- (void)setFamilyHandles:(id)a3;
- (void)setFamilyMembers:(id)a3;
- (void)setIsPendingFetch:(BOOL)a3;
- (void)setStoredIncomingFamilyMessage:(BOOL)a3;
@end

@implementation IDSFamilyManager

+ (IDSFamilyManager)sharedInstance
{
  if (qword_1009BEB20 != -1) {
    dispatch_once(&qword_1009BEB20, &stru_1008FB108);
  }
  return (IDSFamilyManager *)(id)qword_1009BEB28;
}

- (id)handlesFromFamilyMember:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appleID]);
  -[NSMutableSet addObject:](v4, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionary]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"member-appleID-aliases"]);

  if (v7 && [v7 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
    -[NSMutableSet unionSet:](v4, "unionSet:", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionary]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"member-phone-numbers"]);

  if (v10 && [v10 length])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", @", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
    -[NSMutableSet unionSet:](v4, "unionSet:", v12);
  }

  return v4;
}

- (void)fetchFamilyWithFamilyRequest:(id)a3
{
  id v4 = a3;
  self->_isPendingFetch = 1;
  -[NSMutableSet removeAllObjects](self->_familyHandles, "removeAllObjects");
  uint64_t v5 = OSLogHandleForIDSCategory("IDSFamilyManager");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching Family", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"IDSFamilyManager"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"IDSFamilyManager", @"Fetching Family");
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001280D4;
  v8[3] = &unk_1008FB130;
  v8[4] = self;
  [v4 startRequestWithCompletionHandler:v8];
}

- (IDSFamilyManager)init
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDSFamilyManager");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing IDS Family Manager", v9, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v5)
    && _IDSShouldLog(0LL, @"IDSFamilyManager"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"IDSFamilyManager", @"Initializing IDS Family Manager");
  }

  id v6 = objc_alloc_init((Class)IMWeakLinkClass(@"FAFetchFamilyCircleRequest", @"FamilyCircle"));
  uint64_t v7 = -[IDSFamilyManager initWithFamilyRequest:](self, "initWithFamilyRequest:", v6);

  return v7;
}

- (IDSFamilyManager)initWithFamilyRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSFamilyManager;
  uint64_t v5 = -[IDSFamilyManager init](&v10, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v6 addObserver:v5 selector:"_familyDidUpdate:" name:@"com.apple.family.family_updated" object:0];

    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    familyHandles = v5->_familyHandles;
    v5->_familyHandles = v7;

    v5->_storedIncomingFamilyMessage = 0;
    v5->currentFetchCount = 0;
    *(_WORD *)&v5->allowForceFetch = 1;
    -[IDSFamilyManager fetchFamilyWithFamilyRequest:](v5, "fetchFamilyWithFamilyRequest:", v4);
  }

  return v5;
}

- (BOOL)canForceFamilyFetch
{
  return self->allowForceFetch && self->currentFetchCount < 2;
}

- (void)forceFamilyFetch
{
  if (self->_isPendingFetch)
  {
    uint64_t v2 = OSLogHandleForIDSCategory("IDSFamilyManager");
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "We're doing a  Forced Fetch already, we'll let that continue",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v4))
    {
      if (_IDSShouldLog(0LL, @"IDSFamilyManager")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSFamilyManager",  @"We're doing a  Forced Fetch already, we'll let that continue");
      }
    }
  }

  else
  {
    ++self->currentFetchCount;
    uint64_t v6 = OSLogHandleForIDSCategory("IDSFamilyManager");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int currentFetchCount = self->currentFetchCount;
      *(_DWORD *)buf = 67109120;
      int v12 = currentFetchCount;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting Forced Fetch. Fetch count is now at: %d",  buf,  8u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"IDSFamilyManager"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSFamilyManager",  @"Starting Forced Fetch. Fetch count is now at: %d");
    }

    id v10 = objc_alloc_init((Class)IMWeakLinkClass(@"FAFetchFamilyCircleRequest", @"FamilyCircle"));
    -[IDSFamilyManager fetchFamilyWithFamilyRequest:](self, "fetchFamilyWithFamilyRequest:", v10);
  }

- (void)_familyDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSFamilyManager");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notification received for family update.",  v9,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"IDSFamilyManager"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"IDSFamilyManager", @"Notification received for family update.");
  }

  self->int currentFetchCount = 0;
  self->allowForceFetch = 1;
  id v8 = objc_alloc_init((Class)IMWeakLinkClass(@"FAFetchFamilyCircleRequest", @"FamilyCircle"));
  -[IDSFamilyManager fetchFamilyWithFamilyRequest:](self, "fetchFamilyWithFamilyRequest:", v8);
}

- (void)_notifyFamilyServicesOfUpdate
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_familyHandles, "allObjects"));
  id v5 = [v4 copy];

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allFamilyServices]);

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v9 = self->_familyMembers;
  id v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v36,  v43,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        v15 = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 dictionaryRepresentation]);
        -[NSMutableArray addObject:](v3, "addObject:", v16);

        objc_autoreleasePoolPop(v15);
      }

      id v11 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v36,  v43,  16LL);
    }

    while (v11);
  }

  v29 = v5;
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v5, IDSFamilyHandlesKey);
  v30 = v3;
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v3, IDSFamilyMembersKey);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v8;
  id v17 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
        v22 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v21 pushTopic]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v23 broadcasterForTopic:v24 messageContext:v22]);

        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v21 pushTopic]);
          *(_DWORD *)buf = 138412290;
          v41 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "broadcasting family update on %@",  buf,  0xCu);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue([v21 pushTopic]);
        [v25 service:v28 familyInfoUpdated:v6];
      }

      id v18 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }

    while (v18);
  }
}

- (NSSet)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
}

- (NSSet)familyDevices
{
  return self->_familyDevices;
}

- (void)setFamilyDevices:(id)a3
{
}

- (NSMutableSet)familyHandles
{
  return self->_familyHandles;
}

- (void)setFamilyHandles:(id)a3
{
}

- (BOOL)isPendingFetch
{
  return self->_isPendingFetch;
}

- (void)setIsPendingFetch:(BOOL)a3
{
  self->_isPendingFetch = a3;
}

- (BOOL)storedIncomingFamilyMessage
{
  return self->_storedIncomingFamilyMessage;
}

- (void)setStoredIncomingFamilyMessage:(BOOL)a3
{
  self->_storedIncomingFamilyMessage = a3;
}

- (void).cxx_destruct
{
}

@end