@interface PDDynamicAssociatedDomainService
- (BOOL)_lock_haveDomainsChanged:(id)a3;
- (PDDynamicAssociatedDomainService)init;
- (id)_aasaFilesForDomains:(id)a3;
- (id)initDatabaseManager:(id)a3;
- (void)_processPendingUpdates;
- (void)_storeDomains:(id)a3;
- (void)setAdditionalAssociatedDomains:(id)a3 completion:(id)a4;
@end

@implementation PDDynamicAssociatedDomainService

- (PDDynamicAssociatedDomainService)init
{
  return 0LL;
}

- (id)initDatabaseManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDDynamicAssociatedDomainService;
  v6 = -[PDDynamicAssociatedDomainService init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passd.dynamicAssociatedDomainService.reply", 0LL);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingUpdates = v7->_pendingUpdates;
    v7->_pendingUpdates = v10;
  }

  return v7;
}

- (void)setAdditionalAssociatedDomains:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = objc_alloc_init(&OBJC_CLASS___PendingDomainUpdate);
  -[PendingDomainUpdate setDomains:](v9, "setDomains:", v7);

  -[PendingDomainUpdate setCompletion:](v9, "setCompletion:", v6);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_pendingUpdates, "addObject:", v9);
  id v8 = -[NSMutableArray count](self->_pendingUpdates, "count");
  os_unfair_lock_unlock(&self->_lock);
  if (v8 == (id)1) {
    -[PDDynamicAssociatedDomainService _processPendingUpdates](self, "_processPendingUpdates");
  }
}

- (void)_processPendingUpdates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_pendingUpdates, "firstObject"));
  if (v4) {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingUpdates, "removeObjectAtIndex:", 0LL);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domains]);
  unsigned __int8 v6 = -[PDDynamicAssociatedDomainService _lock_haveDomainsChanged:](self, "_lock_haveDomainsChanged:", v5);
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002EA74C;
    v17[3] = &unk_10063DAE8;
    v17[4] = self;
    id v18 = v4;
    id v7 = objc_retainBlock(v17);
    if ((v6 & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDDynamicAssociatedDomainService _aasaFilesForDomains:](self, "_aasaFilesForDomains:", v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", PKServiceBundleIdentifier));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1002EA83C;
      v12[3] = &unk_1006464A0;
      id v13 = v5;
      v14 = self;
      v15 = v7;
      +[_SWCServiceDetails setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]( &OBJC_CLASS____SWCServiceDetails,  "setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:",  v9,  v8,  v12);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDDynamicAssociatedDomainService: domains haven't changed",  buf,  2u);
      }

      ((void (*)(void *, uint64_t, void))v7[2])(v7, 1LL, 0LL);
    }
  }
}

- (id)_aasaFilesForDomains:(id)a3
{
  id v3 = a3;
  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v27 objects:v42 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v28;
    uint64_t v24 = PKServiceBundleIdentifier;
    *(void *)&__int128 v5 = 138412546LL;
    __int128 v22 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "patterns", v22));
        v11 = v10;
        if (v10 && [v10 count])
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pk_arrayByApplyingBlock:", &stru_100654930));
          v40 = @"applinks";
          v38 = @"details";
          v35[0] = @"appID";
          v35[1] = @"alwaysEnabled";
          v36[0] = v24;
          v36[1] = &__kCFBooleanTrue;
          v36[2] = v12;
          v35[2] = @"components";
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  3LL));
          v37 = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v37,  1LL));
          v39 = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
          v41 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));

          id v26 = 0LL;
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v16,  8LL,  &v26));
          id v18 = v26;
          if (v18 || !v17)
          {
            uint64_t Object = PKLogFacilityTypeGetObject(0LL);
            v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              v32 = v16;
              __int16 v33 = 2112;
              id v34 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "PDDynamicAssociatedDomainService: Unable to serialize associated domain dictionary %@. Error: %@",  buf,  0x16u);
            }
          }

          else
          {
            v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 host]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v17, v19);
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v27 objects:v42 count:16];
    }

    while (v6);
  }

  return v23;
}

- (void)_storeDomains:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PDDatabaseManager insertDynamicAssociatedDomains:](self->_databaseManager, "insertDynamicAssociatedDomains:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_lock_haveDomainsChanged:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager dynamicAssociatedDomains](self->_databaseManager, "dynamicAssociatedDomains"));
  if ((v4 == 0LL) == (v5 != 0LL))
  {
    LOBYTE(v8) = 1;
  }

  else
  {
    id v6 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v4);
    uint64_t v7 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v5);
    int v8 = PKEqualObjects(v6, v7) ^ 1;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end