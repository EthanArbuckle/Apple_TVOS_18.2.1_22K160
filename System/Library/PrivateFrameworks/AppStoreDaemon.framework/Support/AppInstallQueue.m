@interface AppInstallQueue
- (AppInstallQueue)init;
- (void)coordinatorPromiseDataConsumer:(id)a3 willBeginUsingPromise:(id)a4 forReference:(id)a5;
- (void)finishInstallID:(int64_t)a3 transaction:(id)a4;
- (void)finishPostProcessingForID:(int64_t)a3 transaction:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startInstallIDs:(id)a3 transaction:(id)a4;
- (void)startPostProcessingForID:(int64_t)a3 transaction:(id)a4;
- (void)stopInstallID:(int64_t)a3 withReason:(int64_t)a4 transaction:(id)a5;
@end

@implementation AppInstallQueue

- (AppInstallQueue)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AppInstallQueue;
  v2 = -[AppInstallQueue init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AppInstallQueue", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    requestLookup = v2->_requestLookup;
    v2->_requestLookup = v9;

    id v11 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v12;

    id v14 = sub_1002B9840((uint64_t)&OBJC_CLASS___AssetSession);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    assetSession = v2->_assetSession;
    v2->_assetSession = (AssetSession *)v15;

    id v17 = +[InstallCoordinationObserver sharedInstance](&OBJC_CLASS___InstallCoordinationObserver, "sharedInstance");
  }

  return v2;
}

- (void)finishInstallID:(int64_t)a3 transaction:(id)a4
{
  id v17 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v7 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v17 connection]);
    id v11 = -[SQLiteEntity initWithPersistentID:onConnection:](v9, "initWithPersistentID:onConnection:", a3, v10);

    id v12 = sub_10031DA6C((uint64_t)&OBJC_CLASS___AppInstallInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity getValuesForProperties:](v11, "getValuesForProperties:", v13));

    uint64_t v15 = objc_alloc(&OBJC_CLASS___AppInstallInfo);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    id v8 = sub_10031DB1C(v15, v16, v14);

    sub_10031DCC4((uint64_t)&OBJC_CLASS___AppInstallInfo, v8);
  }

  sub_100317D60((uint64_t)self, v8, v17);
}

- (void)finishPostProcessingForID:(int64_t)a3 transaction:(id)a4
{
  id v17 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v7 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    v9 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v17 connection]);
    id v11 = -[SQLiteEntity initWithPersistentID:onConnection:](v9, "initWithPersistentID:onConnection:", a3, v10);

    id v12 = sub_10031DA6C((uint64_t)&OBJC_CLASS___AppInstallInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity getValuesForProperties:](v11, "getValuesForProperties:", v13));

    uint64_t v15 = objc_alloc(&OBJC_CLASS___AppInstallInfo);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    id v8 = sub_10031DB1C(v15, v16, v14);

    sub_10031DCC4((uint64_t)&OBJC_CLASS___AppInstallInfo, v8);
  }

  sub_100317D60((uint64_t)self, v8, v17);
}

- (void)startInstallIDs:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v29 = a4;
  id v7 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v14 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          uint64_t v16 = ASDLogHandleForCategory(2LL);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_super v19 = self;
            id v20 = objc_getProperty(v15, v18, 80LL, 1);
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v20;
            _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[%@]: Skipping start, appears to already be running",  (uint8_t *)&buf,  0xCu);

            self = v19;
          }
        }

        else
        {
          -[NSMutableOrderedSet addObject:](v7, "addObject:", v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v10);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"ROWID",  v7));
  id v22 = v29;
  if (self)
  {
    id v23 = v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 connection]);
    id v25 = sub_10024C1D0((uint64_t)&OBJC_CLASS___AppInstallEntity, v24, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    id v27 = sub_10031DA6C((uint64_t)&OBJC_CLASS___AppInstallInfo);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v36 = sub_1003195BC;
    v37 = &unk_1003EF8B0;
    id v38 = v22;
    v39 = self;
    [v26 enumeratePersistentIDsAndProperties:v28 usingBlock:&buf];
  }
}

- (void)startPostProcessingForID:(int64_t)a3 transaction:(id)a4
{
  id v24 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v7 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    id v9 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v24 connection]);
    uint64_t v11 = -[SQLiteEntity initWithPersistentID:onConnection:](v9, "initWithPersistentID:onConnection:", a3, v10);

    id v12 = sub_10031DA6C((uint64_t)&OBJC_CLASS___AppInstallInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity getValuesForProperties:](v11, "getValuesForProperties:", v13));

    uint64_t v15 = objc_alloc(&OBJC_CLASS___AppInstallInfo);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    id v8 = sub_10031DB1C(v15, v16, v14);

    sub_10031DCC4((uint64_t)&OBJC_CLASS___AppInstallInfo, v8);
  }

  id v17 = v8;
  if (self)
  {
    id v18 = v24;
    uint64_t v19 = ASDLogHandleForCategory(2LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      if (v17) {
        id Property = objc_getProperty(v17, v21, 80LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v23 = Property;
      *(_DWORD *)__int128 buf = 138412290;
      id v26 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "[%@] Post-processing requested on platform that does not support it. Skipping to Postamble.",  buf,  0xCu);
    }

    sub_100317D60((uint64_t)self, v17, v18);
  }
}

- (void)stopInstallID:(int64_t)a3 withReason:(int64_t)a4 transaction:(id)a5
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3, a4, a5));
  id v6 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v5);
  selfa = (id *)objc_claimAutoreleasedReturnValue(v6);

  id v7 = selfa;
  if (selfa)
  {
    id WeakRetained = objc_loadWeakRetained(selfa + 11);

    if (WeakRetained)
    {
      id v10 = objc_loadWeakRetained(selfa + 11);
      [v10 cancel];
    }

    id v11 = objc_getProperty(selfa, v9, 16LL, 1);

    if (v11)
    {
      id v13 = objc_getProperty(selfa, v12, 16LL, 1);
      [v13 cancel];
    }

    sub_10031DD7C((uint64_t)&OBJC_CLASS___AppInstallInfo, selfa);
    id v7 = selfa;
  }
}

- (void)coordinatorPromiseDataConsumer:(id)a3 willBeginUsingPromise:(id)a4 forReference:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7 && v8)
  {
    databaseStore = self->_databaseStore;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10031893C;
    v13[3] = &unk_1003EBCA0;
    id v14 = v8;
    id v15 = v7;
    -[AppInstallsDatabaseStore modifyUsingTransaction:](databaseStore, "modifyUsingTransaction:", v13);
  }

  else
  {
    uint64_t v11 = ASDLogHandleForCategory(2LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543618;
      id v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSProgress, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"AppInstallExternalID"]);
    if (v10)
    {
      [v6 fractionCompleted];
      double v12 = v11;
      v20[0] = @"kind";
      v20[1] = @"identifier";
      *(void *)__int128 buf = @"progress";
      id v22 = v10;
      v20[2] = @"fraction";
      id v13 = v10;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
      id v23 = v14;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v20,  3LL));

      id v16 = v15;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v16));

      [v17 postNotificationName:@"LegacyNotifications" object:v18];
    }

    else
    {
      uint64_t v19 = ASDLogHandleForCategory(2LL);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_INFO,  "Skipping legacy progress notification because we don't have an identifier for it.",  buf,  2u);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end