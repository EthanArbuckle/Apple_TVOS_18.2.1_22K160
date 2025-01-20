@interface KTContextStore
- (BOOL)shouldGossip;
- (KTAccountKeyProtocol)accountKeyServer;
- (KTCloudRecordsProtocol)cloudRecords;
- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 settings:(id)a8 followup:(id)a9;
- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 stateMachine:(id)a8 kvs:(id)a9 settings:(id)a10 followup:(id)a11;
- (KTKVSProtocol)kvs;
- (KTPublicKeyStore)keyStore;
- (KTSMManager)stateMachine;
- (NSData)cachedGossip;
- (NSDictionary)contexts;
- (NSMutableDictionary)_contexts;
- (TransparencyFollowUpProtocol)followup;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (TransparencyStaticKeyStore)staticKeyStore;
- (id)createContextForApplication:(id)a3 dataStore:(id)a4 staticKeyStore:(id)a5 logClient:(id)a6 stateMachine:(id)a7;
- (id)createContextForTLT:(id)a3 staticKeyStore:(id)a4 logClient:(id)a5 stateMachine:(id)a6;
- (id)getCachedValidatePeerResults:(id)a3 application:(id)a4;
- (id)serializeTranscripts;
- (void)changeOptInState:(unint64_t)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6;
- (void)clearApplicationState:(id)a3 logClient:(id)a4 completionBlock:(id)a5;
- (void)clearContextForApplication:(id)a3;
- (void)clearGossip;
- (void)configureWithClient:(id)a3 applicationHandler:(id)a4 completionHandler:(id)a5;
- (void)configureWithClient:(id)a3 force:(BOOL)a4 applicationHandler:(id)a5 completionHandler:(id)a6;
- (void)contextForApplication:(id)a3 logClient:(id)a4 fetchState:(BOOL)a5 completionHandler:(id)a6;
- (void)failHeadDownload:(id)a3 application:(id)a4 failure:(id)a5 retry:(BOOL)a6 logClient:(id)a7;
- (void)forcedConfigure:(BOOL)a3 logClient:(id)a4 applicationHandler:(id)a5 completionHandler:(id)a6;
- (void)getKTOptInState:(id)a3 sync:(BOOL)a4 logClient:(id)a5 completionblock:(id)a6;
- (void)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 application:(id)a7 logClient:(id)a8 transparentDataHandler:(id)a9 completionHandler:(id)a10;
- (void)handlePeerStateChange:(id)a3 application:(id)a4;
- (void)ignoreFailure:(id)a3 error:(id *)a4;
- (void)ignoreFailureForResults:(id)a3 application:(id)a4 completionBlock:(id)a5;
- (void)queryForUris:(id)a3 application:(id)a4 logClient:(id)a5 userInitiated:(BOOL)a6 cachedYoungerThan:(id)a7 completionHandler:(id)a8;
- (void)receivedSTHsFromPeers:(id)a3 logClient:(id)a4 verifier:(id)a5 block:(id)a6;
- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 logClient:(id)a9 completionHandler:(id)a10;
- (void)retrieveTLTSTH:(id)a3 block:(id)a4;
- (void)rollKeyForApplication:(id)a3 logClient:(id)a4 completionBlock:(id)a5;
- (void)setAccountKeyServer:(id)a3;
- (void)setCachedGossip:(id)a3;
- (void)setCloudRecords:(id)a3;
- (void)setContext:(id)a3 forKey:(id)a4;
- (void)setDataStore:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setKeyStore:(id)a3;
- (void)setKvs:(id)a3;
- (void)setSettings:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)set_contexts:(id)a3;
- (void)signData:(id)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6;
- (void)storeContext:(id)a3 application:(id)a4;
- (void)validateEnrollmentRequestId:(id)a3 application:(id)a4 logClient:(id)a5 cloudOptIn:(id)a6 completionHandler:(id)a7;
- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 completionHandler:(id)a7;
- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 revalidate:(BOOL)a7 fetchNow:(BOOL)a8 completionHandler:(id)a9;
- (void)validatePeers:(id)a3 application:(id)a4 fetchNow:(BOOL)a5 logClient:(id)a6 completionBlock:(id)a7;
- (void)verifyHeadConsistencyDownload:(id)a3 application:(id)a4 logClient:(id)a5;
- (void)verifyHeadInclusionDownload:(id)a3 application:(id)a4 logClient:(id)a5;
@end

@implementation KTContextStore

- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 stateMachine:(id)a8 kvs:(id)a9 settings:(id)a10 followup:(id)a11
{
  id v29 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___KTContextStore;
  v25 = -[KTContextStore init](&v30, "init");
  v26 = v25;
  if (v25)
  {
    -[KTContextStore setKeyStore:](v25, "setKeyStore:", v18);
    -[KTContextStore setDataStore:](v26, "setDataStore:", v29);
    -[KTContextStore setStaticKeyStore:](v26, "setStaticKeyStore:", v17);
    -[KTContextStore setAccountKeyServer:](v26, "setAccountKeyServer:", v20);
    -[KTContextStore setStateMachine:](v26, "setStateMachine:", v21);
    -[KTContextStore setKvs:](v26, "setKvs:", v22);
    -[KTContextStore setCloudRecords:](v26, "setCloudRecords:", v19);
    -[KTContextStore setFollowup:](v26, "setFollowup:", v24);
    -[KTContextStore setSettings:](v26, "setSettings:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTContextStore set_contexts:](v26, "set_contexts:", v27);
  }

  return v26;
}

- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 settings:(id)a8 followup:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[KTKVSSoftStore sharedStore](&OBJC_CLASS___KTKVSSoftStore, "sharedStore"));
  id v24 = -[KTContextStore initWithDataStore:staticKeyStore:keyStore:cloudRecords:accountKeyServer:stateMachine:kvs:settings:followup:]( self,  "initWithDataStore:staticKeyStore:keyStore:cloudRecords:accountKeyServer:stateMachine:kvs:settings:followup:",  v22,  v21,  v20,  v19,  v18,  0LL,  v23,  v17,  v16);

  return v24;
}

- (NSDictionary)contexts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));

  objc_sync_exit(v3);
  return (NSDictionary *)v5;
}

- (void)setContext:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  [v8 setObject:v9 forKeyedSubscript:v6];

  objc_sync_exit(v7);
}

- (void)forcedConfigure:(BOOL)a3 logClient:(id)a4 applicationHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  unsigned int v14 = [v13 ready];

  if (!v14 || v8)
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B198);
    }
    id v23 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v10;
      __int16 v33 = 1024;
      unsigned int v34 = v14;
      __int16 v35 = 1024;
      BOOL v36 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Configuring key store with log client %@, ready = %d, forced = %d",  buf,  0x18u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
    [v24 configureWithClient:v10 ignoreCachedKeys:1 dataStore:v25 contextStore:self applicationHandler:v11 completionHandler:v12];
  }

  else
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B1B8);
    }
    v15 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Key store configuration skipped. Using existing key stores.",  buf,  2u);
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore", 0LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 applicationKeyStores]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);

    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          if (v11) {
            (*((void (**)(id, void, void))v11 + 2))( v11,  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i),  0LL);
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v20);
    }

    if (v12) {
      v12[2](v12, 0LL);
    }
  }
}

- (void)configureWithClient:(id)a3 applicationHandler:(id)a4 completionHandler:(id)a5
{
}

- (void)configureWithClient:(id)a3 force:(BOOL)a4 applicationHandler:(id)a5 completionHandler:(id)a6
{
}

- (void)storeContext:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B1D8);
    }
    BOOL v8 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "KTContext initialization for application %{public}@ success",  (uint8_t *)&v11,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
    objc_sync_enter(v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
    [v10 setValue:v6 forKey:v7];

    objc_sync_exit(v9);
  }
}

- (id)createContextForApplication:(id)a3 dataStore:(id)a4 staticKeyStore:(id)a5 logClient:(id)a6 stateMachine:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 applicationKeyStores]);
  id v19 = (KTContext *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v12]);

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 applicationKeyStores]);
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v12]);

    id v22 = objc_alloc_init(&OBJC_CLASS___KTContextDependencies);
    -[KTContextDependencies setApplicationKeyStore:](v22, "setApplicationKeyStore:", v35);
    -[KTContextDependencies setDataStore:](v22, "setDataStore:", v13);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore stateMachine](self, "stateMachine"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 deps]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 smDataStore]);
    -[KTContextDependencies setSmDataStore:](v22, "setSmDataStore:", v25);

    -[KTContextDependencies setLogClient:](v22, "setLogClient:", v15);
    -[KTContextDependencies setStateMachine:](v22, "setStateMachine:", v16);
    -[KTContextDependencies setContextStore:](v22, "setContextStore:", self);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore accountKeyServer](self, "accountKeyServer"));
    -[KTContextDependencies setAccountKeyServer:](v22, "setAccountKeyServer:", v26);

    -[KTContextDependencies setStaticKeyStore:](v22, "setStaticKeyStore:", v14);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore kvs](self, "kvs"));
    -[KTContextDependencies setKvs:](v22, "setKvs:", v27);

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cloudRecords](self, "cloudRecords"));
    -[KTContextDependencies setCloudRecords:](v22, "setCloudRecords:", v28);

    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore followup](self, "followup"));
    -[KTContextDependencies setFollowup:](v22, "setFollowup:", v29);

    objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v16 statusReporting]);
    -[KTContextDependencies setEligibilityStatusReporter:](v22, "setEligibilityStatusReporter:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue([v16 deps]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 tapToRadar]);
    -[KTContextDependencies setTapToRadar:](v22, "setTapToRadar:", v32);

    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore settings](self, "settings"));
    -[KTContextDependencies setSettings:](v22, "setSettings:", v33);

    id v19 = -[KTContext initWithApplicationID:dependencies:]( objc_alloc(&OBJC_CLASS___KTContext),  "initWithApplicationID:dependencies:",  v12,  v22);
    -[KTContextStore storeContext:application:](self, "storeContext:application:", v19, v12);
  }

  return v19;
}

- (id)createContextForTLT:(id)a3 staticKeyStore:(id)a4 logClient:(id)a5 stateMachine:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tltKeyStore]);

  id v16 = objc_alloc_init(&OBJC_CLASS___KTContextDependencies);
  -[KTContextDependencies setApplicationKeyStore:](v16, "setApplicationKeyStore:", v15);
  -[KTContextDependencies setDataStore:](v16, "setDataStore:", v13);

  -[KTContextDependencies setLogClient:](v16, "setLogClient:", v11);
  -[KTContextDependencies setStateMachine:](v16, "setStateMachine:", v10);

  -[KTContextDependencies setContextStore:](v16, "setContextStore:", self);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore accountKeyServer](self, "accountKeyServer"));
  -[KTContextDependencies setAccountKeyServer:](v16, "setAccountKeyServer:", v17);

  -[KTContextDependencies setStaticKeyStore:](v16, "setStaticKeyStore:", v12);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore settings](self, "settings"));
  -[KTContextDependencies setSettings:](v16, "setSettings:", v18);

  id v19 = objc_alloc(&OBJC_CLASS___KTContext);
  uint64_t v20 = kKTApplicationIdentifierTLT;
  uint64_t v21 = -[KTContext initWithApplicationID:dependencies:]( v19,  "initWithApplicationID:dependencies:",  kKTApplicationIdentifierTLT,  v16);
  -[KTContextStore storeContext:application:](self, "storeContext:application:", v21, v20);

  return v21;
}

- (void)contextForApplication:(id)a3 logClient:(id)a4 fetchState:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *, void))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v10]);

  if (v14 && [v14 ready:0])
  {
    v12[2](v12, v14, 0LL);
  }

  else if (v7)
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B1F8);
    }
    id v15 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Fetching state needed for application %@",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000LL;
    __int128 v29 = sub_100051C88;
    objc_super v30 = sub_100051C98;
    id v31 = 0LL;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100051CA0;
    v22[3] = &unk_10027B240;
    p___int128 buf = &buf;
    id v23 = v10;
    id v24 = self;
    id v25 = v11;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100051E64;
    v17[3] = &unk_10027B268;
    v17[4] = self;
    id v18 = v25;
    uint64_t v21 = &buf;
    uint64_t v20 = v12;
    id v19 = v23;
    -[KTContextStore configureWithClient:applicationHandler:completionHandler:]( self,  "configureWithClient:applicationHandler:completionHandler:",  v18,  v22,  v17);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B288);
    }
    id v16 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Not fetching state needed for application %@",  (uint8_t *)&buf,  0xCu);
    }

    v12[2](v12, 0LL, 0LL);
  }
}

- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 revalidate:(BOOL)a7 fetchNow:(BOOL)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if ([v18 ready])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000521A8;
    v22[3] = &unk_10027B2B0;
    id v26 = v19;
    id v23 = v16;
    id v24 = v17;
    id v25 = v15;
    BOOL v27 = a7;
    BOOL v28 = a8;
    -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v24,  v18,  1LL,  v22);
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -229LL,  @"log client not ready"));
    uint64_t v21 = -[KTVerifierResult initWithUri:application:ktResult:]( objc_alloc(&OBJC_CLASS___KTVerifierResult),  "initWithUri:application:ktResult:",  v16,  v17,  2LL);
    (*((void (**)(id, KTVerifierResult *, void *))v19 + 2))(v19, v21, v20);
  }
}

- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 completionHandler:(id)a7
{
}

- (void)validateEnrollmentRequestId:(id)a3 application:(id)a4 logClient:(id)a5 cloudOptIn:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v14 ready])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005241C;
    v18[3] = &unk_10027B2D8;
    id v22 = v16;
    id v19 = v13;
    id v20 = v12;
    id v21 = v15;
    -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v19,  v14,  1LL,  v18);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -229LL,  @"log client not ready"));
    (*((void (**)(id, uint64_t, void, void, void *))v16 + 2))(v16, 2LL, 0LL, 0LL, v17);
  }
}

- (void)ignoreFailure:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1002E6550 != -1) {
    dispatch_once(&qword_1002E6550, &stru_10027B2F8);
  }
  BOOL v7 = (void *)qword_1002E6558;
  if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 requestId]);
    int v15 = 138543362;
    id v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Saving ignored failure for requestId %{public}@",  (uint8_t *)&v15,  0xCu);
  }

  [v6 setVerificationResult:3];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  unsigned __int8 v11 = [v10 persistWithError:a4];

  if ((v11 & 1) == 0)
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B318);
    }
    id v12 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0LL;
      }
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "failed to save updated request: %@",  (uint8_t *)&v15,  0xCu);
    }

    if (a4 && *a4)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
      [v14 reportCoreDataPersistEventForLocation:@"updateRequest" underlyingError:*a4];
    }
  }
}

- (void)clearApplicationState:(id)a3 logClient:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1002E6550 != -1) {
    dispatch_once(&qword_1002E6550, &stru_10027B338);
  }
  unsigned __int8 v11 = (os_log_s *)qword_1002E6558;
  if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Clearing KT context for application '%@'",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  id v17 = 0LL;
  [v12 clearStateForApplication:v8 error:&v17];
  id v13 = v17;

  if (v13)
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B358);
    }
    id v14 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed clearing managed data store: %@",  buf,  0xCu);
    }
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  uint64_t v16 = 0LL;
  [v15 clearApplicationState:v8 error:&v16];

  -[KTContextStore configureWithClient:force:applicationHandler:completionHandler:]( self,  "configureWithClient:force:applicationHandler:completionHandler:",  v9,  1LL,  &stru_10027B398,  v10);
}

- (void)clearContextForApplication:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  [v5 setObject:0 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

- (void)verifyHeadInclusionDownload:(id)a3 application:(id)a4 logClient:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100052C34;
  v11[3] = &unk_10027B400;
  id v12 = a4;
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v10,  a5,  1LL,  v11);
}

- (void)verifyHeadConsistencyDownload:(id)a3 application:(id)a4 logClient:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100052E7C;
  v11[3] = &unk_10027B400;
  id v12 = a4;
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v10,  a5,  1LL,  v11);
}

- (void)failHeadDownload:(id)a3 application:(id)a4 failure:(id)a5 retry:(BOOL)a6 logClient:(id)a7
{
  id v11 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10005310C;
  v16[3] = &unk_10027B448;
  id v17 = a4;
  id v18 = self;
  id v19 = v11;
  id v20 = a5;
  id v21 = a7;
  id v12 = v21;
  id v13 = v20;
  id v14 = v11;
  id v15 = v17;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v15,  v12,  1LL,  v16);
}

- (id)serializeTranscripts
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100053254;
  v7[3] = &unk_10027B470;
  v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (void)clearGossip
{
}

- (void)retrieveTLTSTH:(id)a3 block:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  if (!-[KTContextStore shouldGossip](self, "shouldGossip"))
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B490);
    }
    id v15 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "All applications have exceeded 30 days since shutting down.",  buf,  2u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"GossipAllApplicationsShutDownAfter30Days",  kKTApplicationIdentifierTLT));
    uint64_t v16 = kTransparencyErrorGossip;
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    BOOL v28 = @"All applications have exceeded 30 days since shutting down.";
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  -280LL,  v17));

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v19 logResultForEvent:v14 hardFailure:0 result:v18];

    v7[2](v7, 0LL, v18);
    goto LABEL_14;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSData, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));

    if (v11 != v12)
    {
      if (qword_1002E6550 != -1) {
        dispatch_once(&qword_1002E6550, &stru_10027B4B0);
      }
      id v13 = (os_log_s *)qword_1002E6558;
      if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Sending cached gossip", buf, 2u);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
      ((void (**)(id, void *, void *))v7)[2](v7, v14, 0LL);
LABEL_14:

      goto LABEL_23;
    }
  }

  else
  {
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));

  if (v20 == v21)
  {
    if (qword_1002E6550 != -1) {
      dispatch_once(&qword_1002E6550, &stru_10027B4D0);
    }
    id v23 = (os_log_s *)qword_1002E6558;
    if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Sending empty cached gossip", buf, 2u);
    }

    v7[2](v7, 0LL, 0LL);
  }

  else
  {
    uint64_t v22 = kKTApplicationIdentifierTLT;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100053718;
    v24[3] = &unk_10027B538;
    v24[4] = self;
    id v25 = v7;
    -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v22,  v6,  1LL,  v24);
  }

- (void)receivedSTHsFromPeers:(id)a3 logClient:(id)a4 verifier:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = kKTApplicationIdentifierTLT;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100053AA0;
  v17[3] = &unk_10027B560;
  id v19 = v11;
  id v20 = v12;
  id v18 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v13,  a4,  1LL,  v17);
}

- (BOOL)shouldGossip
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  if (!v3) {
    return 1;
  }
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  id v6 = [v5 count];

  if (!v6) {
    return 1;
  }
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100053C60;
  v10[3] = &unk_10027B588;
  v10[4] = &v11;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  BOOL v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)signData:(id)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = kKTApplicationIdentifierTLT;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100053D60;
  v14[3] = &unk_10027B538;
  id v15 = v9;
  id v16 = v10;
  id v12 = v9;
  id v13 = v10;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v11,  a5,  1LL,  v14);
}

- (void)rollKeyForApplication:(id)a3 logClient:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  uint64_t v8 = kKTApplicationIdentifierTLT;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100053EA0;
  v10[3] = &unk_10027B5B0;
  id v11 = v7;
  id v9 = v7;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v8,  a4,  1LL,  v10);
}

- (void)getKTOptInState:(id)a3 sync:(BOOL)a4 logClient:(id)a5 completionblock:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100053FFC;
  v12[3] = &unk_10027B5D8;
  id v13 = a3;
  id v14 = a6;
  BOOL v15 = a4;
  id v10 = v14;
  id v11 = v13;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v11,  a5,  1LL,  v12);
}

- (void)changeOptInState:(unint64_t)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100054184;
  v13[3] = &unk_10027B600;
  id v16 = a6;
  unint64_t v17 = a3;
  id v14 = v10;
  BOOL v15 = self;
  id v11 = v16;
  id v12 = v10;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v12,  a5,  1LL,  v13);
}

- (void)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 application:(id)a7 logClient:(id)a8 transparentDataHandler:(id)a9 completionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000543C0;
  v27[3] = &unk_10027B628;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v31 = v19;
  id v32 = a10;
  id v33 = v20;
  id v21 = v20;
  id v22 = v19;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v32;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  a7,  a8,  1LL,  v27);
}

- (void)queryForUris:(id)a3 application:(id)a4 logClient:(id)a5 userInitiated:(BOOL)a6 cachedYoungerThan:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100054568;
  v19[3] = &unk_10027B670;
  id v20 = a4;
  id v21 = v14;
  BOOL v24 = a6;
  id v22 = a7;
  id v23 = a8;
  id v15 = v22;
  id v16 = v14;
  id v17 = v23;
  id v18 = v20;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v18,  a5,  1LL,  v19);
}

- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 logClient:(id)a9 completionHandler:(id)a10
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100054844;
  v22[3] = &unk_10027B698;
  id v23 = a3;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a10;
  id v16 = v27;
  id v17 = v26;
  id v18 = v25;
  id v19 = v24;
  id v20 = v23;
  id v21 = v28;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  a4,  a9,  1LL,  v22);
}

- (void)validatePeers:(id)a3 application:(id)a4 fetchNow:(BOOL)a5 logClient:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100054960;
  v16[3] = &unk_10027B6C0;
  id v18 = a4;
  id v19 = a7;
  id v17 = v12;
  BOOL v20 = a5;
  id v13 = v18;
  id v14 = v12;
  id v15 = v19;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:]( self,  "contextForApplication:logClient:fetchState:completionHandler:",  v13,  a6,  1LL,  v16);
}

- (void)ignoreFailureForResults:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  id v11 = 0LL;
  [v9 ignoreFailureForResults:v8 error:&v11];

  id v10 = v11;
  v7[2](v7, v10);
}

- (void)handlePeerStateChange:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[KTContextStore getCachedValidatePeerResults:application:]( self,  "getCachedValidatePeerResults:application:",  v6,  a4));
  if (qword_1002E6550 != -1) {
    dispatch_once(&qword_1002E6550, &stru_10027B6E0);
  }
  id v8 = (void *)qword_1002E6558;
  if (os_log_type_enabled((os_log_t)qword_1002E6558, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
    int v12 = 138412290;
    id v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "HandlePeerStateChange will update IDS cache for %@",  (uint8_t *)&v12,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  [v11 updateIDSCacheWithResults:v7];
}

- (id)getCachedValidatePeerResults:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore", (void)v19));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 verifierResultForPeer:v14 application:v7]);

        if (v16)
        {
          [v8 addObject:v16];
        }

        else
        {
          id v17 = -[KTVerifierResult initUnavailableForUri:application:]( objc_alloc(&OBJC_CLASS___KTVerifierResult),  "initUnavailableForUri:application:",  v14,  v7);
          [v8 addObject:v17];
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v11);
  }

  return v8;
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->stateMachine);
}

- (void)setStateMachine:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (KTPublicKeyStore)keyStore
{
  return (KTPublicKeyStore *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setKeyStore:(id)a3
{
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCloudRecords:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (NSMutableDictionary)_contexts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)set_contexts:(id)a3
{
}

- (NSData)cachedGossip
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCachedGossip:(id)a3
{
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setKvs:(id)a3
{
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setFollowup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end