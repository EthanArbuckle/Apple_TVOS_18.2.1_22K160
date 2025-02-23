@interface KTPublicKeyStore
- (BOOL)anyStoreExpired;
- (BOOL)clearDiskApplicationKeyStore:(id)a3 error:(id *)a4;
- (BOOL)configureWithDisk:(id)a3 contextStore:(id)a4 error:(id *)a5;
- (BOOL)forceRefresh;
- (BOOL)hasApplicationPublicKeyStoreOnDisk:(id)a3 error:(id *)a4;
- (BOOL)initiallyFetched;
- (BOOL)ready;
- (BOOL)readyWithRefresh:(BOOL)a3;
- (BOOL)saveDiskApplicationKeyStore:(id)a3 error:(id *)a4;
- (BOOL)stop;
- (BOOL)writePublicKeyStoreToDisk:(id)a3 error:(id *)a4;
- (KTApplicationPublicKeyStore)tltKeyStore;
- (KTPublicKeyStore)initWithDataStore:(id)a3 settings:(id)a4;
- (NSArray)applications;
- (NSDictionary)applicationKeyStores;
- (NSMutableDictionary)_applicationKeyStores;
- (OS_dispatch_group)configureGroup;
- (OS_dispatch_queue)configureQueue;
- (TransparencySettingsProtocol)settings;
- (id)applicationPublicKeyStore:(id)a3;
- (id)copyKeyStoreState;
- (id)copyMetadata;
- (id)createApplicationKeyStore:(id)a3 keyStoreData:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7;
- (id)createApplicationKeyStore:(id)a3 keyStoreResponse:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7;
- (id)keyStoreFileName;
- (id)readPublicKeyStoreFromDisk:(id *)a3;
- (void)clearApplicationState:(id)a3 error:(id *)a4;
- (void)clearForEnvironmentChange;
- (void)configureWithClient:(id)a3 dataStore:(id)a4 contextStore:(id)a5 applicationHandler:(id)a6 completionHandler:(id)a7;
- (void)configureWithClient:(id)a3 ignoreCachedKeys:(BOOL)a4 dataStore:(id)a5 contextStore:(id)a6 applicationHandler:(id)a7 completionHandler:(id)a8;
- (void)fetchKeyStore:(id)a3 application:(id)a4 contextStore:(id)a5 completionHandler:(id)a6;
- (void)setApplications:(id)a3;
- (void)setConfigureGroup:(id)a3;
- (void)setConfigureQueue:(id)a3;
- (void)setForceRefresh:(BOOL)a3;
- (void)setPublicKeyStoreDelegate:(id)a3;
- (void)setSettings:(id)a3;
- (void)setStop:(BOOL)a3;
- (void)setTltKeyStore:(id)a3;
- (void)set_applicationKeyStores:(id)a3;
- (void)updatePublicKeyStores:(id)a3 diskStore:(id)a4 contextStore:(id)a5 complete:(id)a6;
- (void)updateTLTKeyStoreWithApplicationKeyStore:(id)a3;
@end

@implementation KTPublicKeyStore

- (void)setPublicKeyStoreDelegate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  objc_sync_enter(v5);
  objc_storeWeak((id *)&self->_delegate, v4);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

        [v12 setDelegate:v4];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (NSDictionary)applicationKeyStores
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));

  objc_sync_exit(v3);
  return (NSDictionary *)v5;
}

- (id)applicationPublicKeyStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (void)updateTLTKeyStoreWithApplicationKeyStore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v52 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));

    if (v5)
    {
      id obj = (id)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
      objc_sync_enter(obj);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keyBag]);
      id v8 = [v7 tltLogBeginningMs];
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 keyBag]);
      id v10 = [v9 tltLogBeginningMs];

      if (v8 < v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v4 keyBag]);
        id v12 = [v11 copyTltBag];
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        [v13 setKeyBag:v12];

        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 receiptTime]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        [v15 setReceiptTime:v14];

        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](v52, "applicationKeyStores"));
        id v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v54;
          do
          {
            v19 = 0LL;
            do
            {
              if (*(void *)v54 != v18) {
                objc_enumerationMutation(v16);
              }
              v20 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application", obj));
              unsigned __int8 v22 = [v20 isEqualToString:v21];

              if ((v22 & 1) == 0)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](v52, "applicationKeyStores"));
                v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v20]);
                v25 = (void *)objc_claimAutoreleasedReturnValue([v24 keyBag]);
                v26 = (void *)objc_claimAutoreleasedReturnValue([v25 tltKeyStore]);
                v27 = (void *)objc_claimAutoreleasedReturnValue([v26 signatureVerifier]);
                [v27 setNeedsRefresh:1];
              }

              v19 = (char *)v19 + 1;
            }

            while (v17 != v19);
            id v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
          }

          while (v17);
        }

        goto LABEL_20;
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 keyBag]);
      id v31 = [v30 tltLogBeginningMs];
      v32 = (void *)objc_claimAutoreleasedReturnValue([v4 keyBag]);
      id v33 = [v32 tltLogBeginningMs];

      if (v31 <= v33)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        unsigned __int8 v38 = [v37 readyWithRefresh:0];

        if ((v38 & 1) != 0)
        {
LABEL_20:
          objc_sync_exit(obj);

          goto LABEL_21;
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 keyBag]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 vrfKey]);
        [v41 setNeedsRefresh:0];

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 keyBag]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 appSthKeyStore]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 signatureVerifier]);
        [v45 setNeedsRefresh:0];

        v46 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 keyBag]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v47 appSmtKeyStore]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v48 signatureVerifier]);
        [v49 setNeedsRefresh:0];

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 keyBag]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 tltKeyStore]);
        v50 = (void *)objc_claimAutoreleasedReturnValue([v36 signatureVerifier]);
        [v50 setNeedsRefresh:0];
      }

      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v4 keyBag]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 tltKeyStore]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 signatureVerifier]);
        [v36 setNeedsRefresh:1];
      }

      goto LABEL_20;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 createTLTApplicationPublicKeyStore]);
    -[KTPublicKeyStore setTltKeyStore:](v52, "setTltKeyStore:", v28);
  }

- (void)updatePublicKeyStores:(id)a3 diskStore:(id)a4 contextStore:(id)a5 complete:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001989F0;
  v11[3] = &unk_100279428;
  id v12 = a6;
  id v10 = v12;
  -[KTPublicKeyStore configureWithClient:ignoreCachedKeys:dataStore:contextStore:applicationHandler:completionHandler:]( self,  "configureWithClient:ignoreCachedKeys:dataStore:contextStore:applicationHandler:completionHandler:",  a3,  1LL,  a4,  a5,  0LL,  v11);
}

- (id)copyMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[KTPublicKeyStore readyWithRefresh:](self, "readyWithRefresh:", 0LL)));
  v7[0] = v2;
  v6[0] = off_1002E5320;
  v6[1] = off_1002E5328;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", kTransparencyProtocolVersion));
  v7[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

- (id)copyKeyStoreState
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = -[KTPublicKeyStore copyMetadata](self, "copyMetadata");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, off_1002E5318);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        id v12 = [v11 copyKeyStoreState];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)keyStoreFileName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore settings](self, "settings"));
  id v3 = [v2 getEnvironment];

  if (v3 == (id)2)
  {
    if (qword_1002EECE0 != -1) {
      dispatch_once(&qword_1002EECE0, &stru_100287678);
    }
    id v6 = (os_log_s *)qword_1002EECE8;
    if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "using QA2 key store", v7, 2u);
    }

    return @"KTPublicKeyStore-qa2.plist";
  }

  else if (v3 == (id)1)
  {
    if (qword_1002EECE0 != -1) {
      dispatch_once(&qword_1002EECE0, &stru_100287658);
    }
    id v4 = (os_log_s *)qword_1002EECE8;
    if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "using QA1 key store", buf, 2u);
    }

    return @"KTPublicKeyStore-qa1.plist";
  }

  else
  {
    return @"KTPublicKeyStore.plist";
  }

- (id)readPublicKeyStoreFromDisk:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore keyStoreFileName](self, "keyStoreFileName"));
  id v9 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport readDictionaryFromFile:error:]( &OBJC_CLASS___TransparencyFileSupport,  "readDictionaryFromFile:error:",  v4,  &v9));
  id v6 = v9;

  if (!v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v7 logResultForEvent:@"ktDiskPublicKeyStoreEvent" hardFailure:1 result:v6 withAttributes:&off_10029A448];

    if (a3) {
      *a3 = v6;
    }
  }

  return v5;
}

- (BOOL)writePublicKeyStoreToDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore keyStoreFileName](self, "keyStoreFileName"));
  BOOL v8 = +[TransparencyFileSupport writeDictionaryToFile:fileName:error:]( &OBJC_CLASS___TransparencyFileSupport,  "writeDictionaryToFile:fileName:error:",  v6,  v7,  a4);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  uint64_t v10 = v9;
  if (v8) {
    [v9 logSuccessForEventNamed:@"ktDiskPublicKeyStoreWriteEvent"];
  }
  else {
    [v9 logResultForEvent:@"ktDiskPublicKeyStoreEvent" hardFailure:1 result:*a4 withAttributes:&off_10029A470];
  }

  return v8;
}

- (BOOL)clearDiskApplicationKeyStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", 0LL));
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  [v8 setObject:0 forKeyedSubscript:v6];
  BOOL v9 = -[KTPublicKeyStore writePublicKeyStoreToDisk:error:](self, "writePublicKeyStoreToDisk:error:", v8, a4);

  return v9;
}

- (BOOL)hasApplicationPublicKeyStoreOnDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", 0LL));
  id v7 = [v6 mutableCopy];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);
    BOOL v9 = v8 != 0LL;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)saveDiskApplicationKeyStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", 0LL));
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v9 = [v6 copyKeyStoreState];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 application]);

  [v8 setObject:v9 forKeyedSubscript:v10];
  id v11 = -[KTPublicKeyStore copyMetadata](self, "copyMetadata");
  [v8 setObject:v11 forKeyedSubscript:off_1002E5318];

  BOOL v12 = -[KTPublicKeyStore writePublicKeyStoreToDisk:error:](self, "writePublicKeyStoreToDisk:error:", v8, a4);
  return v12;
}

- (id)createApplicationKeyStore:(id)a3 keyStoreData:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int128 v16 = objc_alloc(&OBJC_CLASS___KTApplicationPublicKeyStore);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore settings](self, "settings"));
  uint64_t v18 = -[KTApplicationPublicKeyStore initWithApplication:dataStore:diskState:contextStore:settings:error:]( v16,  "initWithApplication:dataStore:diskState:contextStore:settings:error:",  v12,  v14,  v13,  v15,  v17,  a7);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    objc_sync_enter(v19);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[KTApplicationPublicKeyStore setDelegate:](v18, "setDelegate:", WeakRetained);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    [v21 setValue:v18 forKey:v12];

    objc_sync_exit(v19);
    unsigned __int8 v22 = v18;
  }

  return v18;
}

- (id)createApplicationKeyStore:(id)a3 keyStoreResponse:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int128 v16 = objc_alloc(&OBJC_CLASS___KTApplicationPublicKeyStore);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore settings](self, "settings"));
  uint64_t v18 = -[KTApplicationPublicKeyStore initWithApplication:dataStore:response:contextStore:settings:error:]( v16,  "initWithApplication:dataStore:response:contextStore:settings:error:",  v12,  v14,  v13,  v15,  v17,  a7);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    objc_sync_enter(v19);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[KTApplicationPublicKeyStore setDelegate:](v18, "setDelegate:", WeakRetained);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    [v21 setValue:v18 forKey:v12];

    objc_sync_exit(v19);
    unsigned __int8 v22 = v18;
  }

  return v18;
}

- (void)fetchKeyStore:(id)a3 application:(id)a4 contextStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v23 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyRPCRequestBuilder buildPublicKeysRequest:error:]( &OBJC_CLASS___TransparencyRPCRequestBuilder,  "buildPublicKeysRequest:error:",  v11,  &v23));
  id v15 = v23;
  __int128 v16 = v15;
  if (v14) {
    BOOL v17 = v15 == 0LL;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100199538;
    v18[3] = &unk_100287740;
    id v22 = v13;
    v18[4] = self;
    id v19 = v11;
    id v20 = v10;
    id v21 = v12;
    [v20 fetchPublicKeys:v14 completionHandler:v18];
  }

  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }
}

- (void)configureWithClient:(id)a3 ignoreCachedKeys:(BOOL)a4 dataStore:(id)a5 contextStore:(id)a6 applicationHandler:(id)a7 completionHandler:(id)a8
{
  id v45 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a4)
  {
    id v44 = v14;
    id v18 = 0LL;
LABEL_16:
    v43 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications", v18));
    id v26 = [v25 count];

    if (v26)
    {
      unint64_t v27 = 0LL;
      do
      {
        v28 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore configureGroup](self, "configureGroup"));
        dispatch_group_enter(v28);

        ++v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications"));
        id v30 = [v29 count];
      }

      while (v27 < (unint64_t)v30);
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v31 = self->_applications;
    id v32 = -[NSArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v51;
      do
      {
        v35 = 0LL;
        do
        {
          id v36 = v15;
          if (*(void *)v51 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v37 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)v35);
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472LL;
          v48[2] = sub_100199E98;
          v48[3] = &unk_100286E50;
          id v38 = v16;
          v48[5] = self;
          id v49 = v38;
          v48[4] = v37;
          uint64_t v39 = v37;
          id v15 = v36;
          -[KTPublicKeyStore fetchKeyStore:application:contextStore:completionHandler:]( self,  "fetchKeyStore:application:contextStore:completionHandler:",  v45,  v39,  v36,  v48);

          v35 = (char *)v35 + 1;
        }

        while (v33 != v35);
        id v33 = -[NSArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
      }

      while (v33);
    }

    v40 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore configureGroup](self, "configureGroup"));
    v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore configureQueue](self, "configureQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100199EEC;
    block[3] = &unk_10027A7D0;
    id v17 = v43;
    id v47 = v43;
    dispatch_group_notify(v40, v41, block);

    id v14 = v44;
    id v18 = v42;
    goto LABEL_27;
  }

  id v58 = 0LL;
  unsigned int v19 = -[KTPublicKeyStore configureWithDisk:contextStore:error:]( self,  "configureWithDisk:contextStore:error:",  v14,  v15,  &v58);
  id v18 = v58;
  if (!v19)
  {
    id v44 = v14;
    goto LABEL_16;
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v20 = self->_applications;
  id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v55;
    do
    {
      v24 = 0LL;
      do
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(v20);
        }
        if (v16) {
          (*((void (**)(id, void, id))v16 + 2))( v16,  *(void *)(*((void *)&v54 + 1) + 8LL * (void)v24),  v18);
        }
        v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
    }

    while (v22);
  }

  if (v17) {
    (*((void (**)(id, id))v17 + 2))(v17, v18);
  }
LABEL_27:
}

- (void)configureWithClient:(id)a3 dataStore:(id)a4 contextStore:(id)a5 applicationHandler:(id)a6 completionHandler:(id)a7
{
}

- (BOOL)configureWithDisk:(id)a3 contextStore:(id)a4 error:(id *)a5
{
  id v34 = a3;
  id v33 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", a5));
  id v9 = v8;
  if (v8)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:off_1002E5318]);
    if (v30
      && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:off_1002E5328]),
          id v11 = [v10 unsignedIntegerValue],
          unint64_t v12 = kTransparencyProtocolVersion,
          v10,
          (unint64_t)v11 >= v12))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:off_1002E5320]);

      if (v18)
      {
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:off_1002E5320]);
        -[KTPublicKeyStore setForceRefresh:](self, "setForceRefresh:", [v19 BOOLValue] ^ 1);
      }

      id v15 = self;
      objc_sync_enter(v15);
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v20 = v15->_applications;
      id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
      if (v21)
      {
        uint64_t v22 = *(void *)v36;
        uint64_t v31 = kTransparencyErrorFile;
        char v32 = 1;
        do
        {
          uint64_t v23 = 0LL;
          do
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(KTPublicKeyStore **)(*((void *)&v35 + 1) + 8LL * (void)v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v24]);

            if (v25)
            {
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v24]);
              unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[KTPublicKeyStore createApplicationKeyStore:keyStoreData:dataStore:contextStore:error:]( v15,  "createApplicationKeyStore:keyStoreData:dataStore:contextStore:error:",  v24,  v26,  v34,  v33,  a5));

              if (v27)
              {
                -[KTPublicKeyStore updateTLTKeyStoreWithApplicationKeyStore:]( v15,  "updateTLTKeyStoreWithApplicationKeyStore:",  v27);
              }

              else
              {
                -[KTPublicKeyStore clearDiskApplicationKeyStore:error:]( v15,  "clearDiskApplicationKeyStore:error:",  v24,  a5);
                char v32 = 0;
              }
            }

            else
            {
              if (a5) {
                *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  v31,  -39LL,  *a5,  @"On-disk key store not found for %@",  v24));
              }
              if (qword_1002EECE0 != -1) {
                dispatch_once(&qword_1002EECE0, &stru_1002877C0);
              }
              v28 = (os_log_s *)qword_1002EECE8;
              if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v24;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "On-disk key store not found for %@",  buf,  0xCu);
              }
            }

            uint64_t v23 = (char *)v23 + 1;
          }

          while (v21 != v23);
          id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
        }

        while (v21);
      }

      else
      {
        char v32 = 1;
      }

      objc_sync_exit(v15);
    }

    else
    {
      if (qword_1002EECE0 != -1) {
        dispatch_once(&qword_1002EECE0, &stru_100287780);
      }
      id v13 = (os_log_s *)qword_1002EECE8;
      if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Updating to newer protocol version used by this client",  buf,  2u);
      }

      -[KTPublicKeyStore setForceRefresh:](self, "setForceRefresh:", 1LL);
      id v39 = 0LL;
      unsigned __int8 v14 = [v34 clearState:&v39];
      id v15 = (KTPublicKeyStore *)v39;
      if ((v14 & 1) == 0)
      {
        if (qword_1002EECE0 != -1) {
          dispatch_once(&qword_1002EECE0, &stru_1002877A0);
        }
        id v16 = (os_log_s *)qword_1002EECE8;
        if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to clear DB state: %@", buf, 0xCu);
        }
      }

      char v32 = 0;
    }
  }

  else
  {
    -[KTPublicKeyStore setForceRefresh:](self, "setForceRefresh:", 1LL);
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorFile,  -38LL,  *a5,  @"On-disk key store not found"));
    }
    if (qword_1002EECE0 != -1) {
      dispatch_once(&qword_1002EECE0, &stru_100287760);
    }
    id v17 = (os_log_s *)qword_1002EECE8;
    if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "On-disk key store not found", buf, 2u);
    }

    char v32 = 0;
  }

  return v32 & 1;
}

- (KTPublicKeyStore)initWithDataStore:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___KTPublicKeyStore;
  id v8 = -[KTPublicKeyStore init](&v23, "init");
  if (!v8)
  {
LABEL_9:
    unsigned int v19 = v8;
    goto LABEL_15;
  }

  v26[0] = kKTApplicationIdentifierIDS;
  v26[1] = kKTApplicationIdentifierIDSMultiplex;
  v26[2] = kKTApplicationIdentifierIDSFaceTime;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
  -[KTPublicKeyStore setApplications:](v8, "setApplications:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](v8, "applications"));
  id v11 = [v10 count];

  if (v11 == (id)3)
  {
    unint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[KTPublicKeyStore set_applicationKeyStores:](v8, "set_applicationKeyStores:", v12);

    dispatch_group_t v13 = dispatch_group_create();
    -[KTPublicKeyStore setConfigureGroup:](v8, "setConfigureGroup:", v13);

    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.transparency.keyStoreConfiguration", v15);
    -[KTPublicKeyStore setConfigureQueue:](v8, "setConfigureQueue:", v16);

    -[KTPublicKeyStore setSettings:](v8, "setSettings:", v7);
    id v22 = 0LL;
    LOBYTE(v16) = -[KTPublicKeyStore configureWithDisk:contextStore:error:]( v8,  "configureWithDisk:contextStore:error:",  v6,  0LL,  &v22);
    id v17 = v22;
    if ((v16 & 1) == 0)
    {
      if (qword_1002EECE0 != -1) {
        dispatch_once(&qword_1002EECE0, &stru_100287800);
      }
      id v18 = (os_log_s *)qword_1002EECE8;
      if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "failed to read disk public key store:%@",  buf,  0xCu);
      }
    }

    goto LABEL_9;
  }

  if (qword_1002EECE0 != -1) {
    dispatch_once(&qword_1002EECE0, &stru_1002877E0);
  }
  id v20 = (os_log_s *)qword_1002EECE8;
  if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "hey silly, update the KT_APPLICATION_COUNT, too!",  buf,  2u);
  }

  unsigned int v19 = 0LL;
LABEL_15:

  return v19;
}

- (void)clearApplicationState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if ([v6 isEqualToString:kKTApplicationIdentifierTLT])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));

    id v8 = (void *)v9;
  }

  if (v8)
  {
    [v8 clearState:a4];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
    -[KTPublicKeyStore clearDiskApplicationKeyStore:error:](self, "clearDiskApplicationKeyStore:error:", v10, a4);
  }

  else
  {
    if (qword_1002EECE0 != -1) {
      dispatch_once(&qword_1002EECE0, &stru_100287820);
    }
    id v11 = (os_log_s *)qword_1002EECE8;
    if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unknown key store for application %@",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)clearForEnvironmentChange
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications"));
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v19 = v5;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores", v19));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

        if (v11)
        {
          id v21 = 0LL;
          [v11 clearState:&v21];
          id v12 = v21;
          if (v12)
          {
            if (qword_1002EECE0 != -1) {
              dispatch_once(&qword_1002EECE0, &stru_100287860);
            }
            id v13 = (os_log_s *)qword_1002EECE8;
            if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v27 = v9;
              __int16 v28 = 2112;
              id v29 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error clearing application keystore state[%@]: %@",  buf,  0x16u);
            }
          }
        }

        else
        {
          if (qword_1002EECE0 != -1) {
            dispatch_once(&qword_1002EECE0, &stru_100287840);
          }
          dispatch_queue_attr_t v14 = (os_log_s *)qword_1002EECE8;
          if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            id v27 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Tried to clear key store for unknown application %@",  buf,  0xCu);
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v6);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
  if (v15)
  {
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
    id v20 = 0LL;
    [v16 clearState:&v20];
    id v17 = v20;

    if (v17)
    {
      if (qword_1002EECE0 != -1) {
        dispatch_once(&qword_1002EECE0, &stru_100287880);
      }
      id v18 = (os_log_s *)qword_1002EECE8;
      if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Error clearing application keystore state[TLT]: %@",  buf,  0xCu);
      }
    }
  }

- (BOOL)readyWithRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[KTPublicKeyStore forceRefresh](self, "forceRefresh"))
  {
    LOBYTE(v5) = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
          if (v13)
          {
            dispatch_queue_attr_t v14 = (void *)v13;
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
            unsigned int v16 = [v15 readyWithRefresh:v3];

            if (v16) {
              continue;
            }
          }

          goto LABEL_16;
        }

        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
    if (v17)
    {
      id v18 = (void *)v17;
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
      unsigned int v5 = [v19 readyWithRefresh:v3];

      if (v5) {
        LOBYTE(v5) = [v6 count] != 0;
      }
    }

    else
    {
LABEL_16:
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (BOOL)ready
{
  return -[KTPublicKeyStore readyWithRefresh:](self, "readyWithRefresh:", 1LL);
}

- (BOOL)anyStoreExpired
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( [v3 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)i)]);
        unsigned __int8 v10 = [v9 storeExpired];

        if ((v10 & 1) != 0)
        {
          unsigned __int8 v11 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
  unsigned __int8 v11 = [v4 storeExpired];
LABEL_11:

  return v11;
}

- (BOOL)initiallyFetched
{
  id v15 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", &v15));
  id v3 = v15;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:off_1002E5318]);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:off_1002E5320]);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        unsigned __int8 v10 = [v7 BOOLValue];
      }

      else
      {
        if (qword_1002EECE0 != -1) {
          dispatch_once(&qword_1002EECE0, &stru_1002878E0);
        }
        __int128 v13 = (os_log_s *)qword_1002EECE8;
        if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Disk data store ready flag wrong class",  buf,  2u);
        }

        unsigned __int8 v10 = 0;
      }
    }

    else
    {
      if (qword_1002EECE0 != -1) {
        dispatch_once(&qword_1002EECE0, &stru_1002878C0);
      }
      uint64_t v12 = (os_log_s *)qword_1002EECE8;
      if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Disk data store missing metadata", buf, 2u);
      }

      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    if (qword_1002EECE0 != -1) {
      dispatch_once(&qword_1002EECE0, &stru_1002878A0);
    }
    unsigned __int8 v11 = (os_log_s *)qword_1002EECE8;
    if (os_log_type_enabled((os_log_t)qword_1002EECE8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Initial readPublicKeyStoreFromDisk failed with: %@",  buf,  0xCu);
    }

    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (OS_dispatch_group)configureGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConfigureGroup:(id)a3
{
}

- (OS_dispatch_queue)configureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConfigureQueue:(id)a3
{
}

- (NSMutableDictionary)_applicationKeyStores
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)set_applicationKeyStores:(id)a3
{
}

- (NSArray)applications
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setApplications:(id)a3
{
}

- (KTApplicationPublicKeyStore)tltKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTltKeyStore:(id)a3
{
}

- (BOOL)forceRefresh
{
  return self->_forceRefresh;
}

- (void)setForceRefresh:(BOOL)a3
{
  self->_forceRefresh = a3;
}

- (BOOL)stop
{
  return self->_stop;
}

- (void)setStop:(BOOL)a3
{
  self->_stop = a3;
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end