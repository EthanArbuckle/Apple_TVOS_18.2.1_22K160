@interface KTLogClient
+ (id)formatEventName:(id)a3 application:(id)a4 state:(id)a5;
+ (id)formatEventName:(id)a3 state:(id)a4;
+ (id)requiredBagKeys;
- (BOOL)configured;
- (BOOL)shouldUseReversePush:(BOOL)a3;
- (KTLogClient)init;
- (KTLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6;
- (KTLogClient)initWithSettings:(id)a3;
- (KTSMTriggerInterface)triggerInterface;
- (NSURL)consistencyProofURI;
- (NSURL)publicKeysURI;
- (TransparencyConfigBag)configBag;
- (double)idmsFetchTime;
- (double)overrideIDMSFetchTime;
- (id)batchQueryURI;
- (id)copyConfigurationBag:(id *)a3;
- (id)queryURI;
- (id)reportToAppleURI;
- (id)revisionLogProofURI;
- (unint64_t)batchQueryMaxURIs;
- (unint64_t)consistencyMaxProofs;
- (unint64_t)currentEnvironment;
- (unint64_t)revisionLogMaxProofs;
- (unint64_t)userReversePushPercentage;
- (unint64_t)xpcActivityReversePushPercentage;
- (void)clearState:(id *)a3;
- (void)configure:(id)a3;
- (void)configureFromNetwork:(id)a3;
- (void)fetchBatchQueries:(id)a3 userInitiated:(BOOL)a4 responseHandler:(id)a5 completionHandler:(id)a6;
- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6;
- (void)fetchConfigBag:(id)a3 completionHandler:(id)a4;
- (void)fetchConsistencyProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)fetchMessage:(id)a3 uri:(id)a4 uuid:(id)a5 application:(id)a6 userInitiated:(BOOL)a7 completionHandler:(id)a8;
- (void)fetchPublicKeys:(id)a3 completionHandler:(id)a4;
- (void)fetchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)fetchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6;
- (void)fetchRevisionLogInclusionProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5;
- (void)postReport:(id)a3 uuid:(id)a4 application:(id)a5 completionHandler:(id)a6;
- (void)setConfigBag:(id)a3;
- (void)setCurrentEnvironment:(unint64_t)a3;
- (void)setOverrideIDMSFetchTime:(double)a3;
- (void)setTriggerInterface:(id)a3;
- (void)triggerConfigBagFetch:(double)a3;
@end

@implementation KTLogClient

+ (id)requiredBagKeys
{
  v12[0] = @"build-version";
  v13[0] = objc_opt_class(&OBJC_CLASS___NSString, a2);
  v12[1] = @"rest-query";
  v13[1] = objc_opt_class(&OBJC_CLASS___NSString, v2);
  v12[2] = @"rest-batch-query";
  v13[2] = objc_opt_class(&OBJC_CLASS___NSString, v3);
  v12[3] = @"batch-query-max-uris";
  v13[3] = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  v12[4] = @"batch-log-inclusion-max-proofs";
  v13[4] = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  v12[5] = @"batch-consistency-max-proofs";
  v13[5] = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  v12[6] = @"rest-consistency-proof";
  v13[6] = objc_opt_class(&OBJC_CLASS___NSString, v7);
  v12[7] = @"rest-public-keys";
  v13[7] = objc_opt_class(&OBJC_CLASS___NSString, v8);
  v12[8] = @"rest-revision-log-inclusion-proof";
  v13[8] = objc_opt_class(&OBJC_CLASS___NSString, v9);
  v12[9] = @"rest-report-to-apple";
  v13[9] = objc_opt_class(&OBJC_CLASS___NSString, v10);
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  10LL));
}

- (KTLogClient)init
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TransparencySettings);
  uint64_t v4 = -[KTLogClient initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (KTLogClient)initWithSettings:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KTLogClient;
  uint64_t v5 = -[KTLogClient init](&v14, "init");
  uint64_t v6 = v5;
  if (v5)
  {
    -[KTLogClient setOverrideIDMSFetchTime:](v5, "setOverrideIDMSFetchTime:", 604800.0);
    -[TransparencyLogClient setSettings:](v6, "setSettings:", v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient settings](v6, "settings"));
    -[KTLogClient setCurrentEnvironment:](v6, "setCurrentEnvironment:", [v7 getEnvironment]);

    uint64_t v8 = objc_alloc(&OBJC_CLASS___TransparencyConfigBag);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[KTLogClient requiredBagKeys](&OBJC_CLASS___KTLogClient, "requiredBagKeys"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient settings](v6, "settings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  0LL));
    v12 = -[TransparencyConfigBag initWithRequiredKeys:settings:directory:configApp:]( v8,  "initWithRequiredKeys:settings:directory:configApp:",  v9,  v10,  v11,  1LL);
    -[KTLogClient setConfigBag:](v6, "setConfigBag:", v12);
  }

  return v6;
}

- (KTLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6
{
  id v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___KTLogClient;
  v11 = -[TransparencyLogClient initWithBackgroundSession:transparencyAnalytics:dataStore:settings:]( &v19,  "initWithBackgroundSession:transparencyAnalytics:dataStore:settings:",  a3,  a4,  a5,  v10);
  v12 = v11;
  if (v11)
  {
    -[KTLogClient setOverrideIDMSFetchTime:](v11, "setOverrideIDMSFetchTime:", 604800.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient settings](v12, "settings"));
    -[KTLogClient setCurrentEnvironment:](v12, "setCurrentEnvironment:", [v13 getEnvironment]);

    objc_super v14 = objc_alloc(&OBJC_CLASS___TransparencyConfigBag);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[KTLogClient requiredBagKeys](&OBJC_CLASS___KTLogClient, "requiredBagKeys"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  0LL));
    v17 = -[TransparencyConfigBag initWithRequiredKeys:settings:directory:configApp:]( v14,  "initWithRequiredKeys:settings:directory:configApp:",  v15,  v10,  v16,  1LL);
    -[KTLogClient setConfigBag:](v12, "setConfigBag:", v17);
  }

  return v12;
}

- (void)configure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018E454;
  v7[3] = &unk_100279748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 configureWithFetcher:self completionHandler:v7];
}

- (void)configureFromNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018E55C;
  v7[3] = &unk_100279748;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 configureFromNetworkWithFetcher:self completionHandler:v7];
}

- (BOOL)configured
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  unsigned __int8 v3 = [v2 configured];

  return v3;
}

- (void)clearState:(id *)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  [v4 clearState:a3];
}

- (void)fetchConfigBag:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018E6C8;
  v7[3] = &unk_100286D60;
  id v8 = a4;
  id v6 = v8;
  -[TransparencyLogClient fetch:allowEmptyData:useReversePush:completionHandler:]( self,  "fetch:allowEmptyData:useReversePush:completionHandler:",  a3,  0LL,  0LL,  v7);
}

- (void)triggerConfigBagFetch:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[KTLogClient triggerInterface](self, "triggerInterface"));
  [v4 triggerConfigBagFetch:a3];
}

+ (id)formatEventName:(id)a3 state:(id)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", a3, a4);
}

+ (id)formatEventName:(id)a3 application:(id)a4 state:(id)a5
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"kt%@%@-%@", a4, a3, a5);
}

- (double)idmsFetchTime
{
  return result;
}

- (id)copyConfigurationBag:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v5 = [v4 copyConfigurationBag:a3];

  return v5;
}

- (unint64_t)userReversePushPercentage
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  unsigned int v4 = [v3 overrideReversePushConfig];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v6 = v5;
  if (v4) {
    id v7 = [v5 overrideReversePushPercentage];
  }
  else {
    id v7 = [v5 percentageForKey:@"reverse-push-user-action-percent"];
  }
  unint64_t v8 = (unint64_t)v7;

  return v8;
}

- (unint64_t)xpcActivityReversePushPercentage
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  unsigned int v4 = [v3 overrideReversePushConfig];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v6 = v5;
  if (v4) {
    id v7 = [v5 overrideReversePushPercentage];
  }
  else {
    id v7 = [v5 percentageForKey:@"reverse-push-nightly-task-percent"];
  }
  unint64_t v8 = (unint64_t)v7;

  return v8;
}

- (unint64_t)batchQueryMaxURIs
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = [v2 uintegerForKey:@"batch-query-max-uris"];

  return (unint64_t)v3;
}

- (unint64_t)consistencyMaxProofs
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = [v2 uintegerForKey:@"batch-consistency-max-proofs"];

  return (unint64_t)v3;
}

- (unint64_t)revisionLogMaxProofs
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = [v2 uintegerForKey:@"batch-log-inclusion-max-proofs"];

  return (unint64_t)v3;
}

- (id)queryURI
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlForKey:@"rest-query"]);

  return v3;
}

- (id)batchQueryURI
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlForKey:@"rest-batch-query"]);

  return v3;
}

- (NSURL)consistencyProofURI
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlForKey:@"rest-consistency-proof"]);

  return (NSURL *)v3;
}

- (NSURL)publicKeysURI
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlForKey:@"rest-public-keys"]);

  return (NSURL *)v3;
}

- (id)revisionLogProofURI
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlForKey:@"rest-revision-log-inclusion-proof"]);

  return v3;
}

- (id)reportToAppleURI
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlForKey:@"rest-report-to-apple"]);

  return v3;
}

- (BOOL)shouldUseReversePush:(BOOL)a3
{
  if (a3) {
    unint64_t v3 = -[KTLogClient userReversePushPercentage](self, "userReversePushPercentage");
  }
  else {
    unint64_t v3 = -[KTLogClient xpcActivityReversePushPercentage](self, "xpcActivityReversePushPercentage");
  }
  unint64_t v4 = v3;
  if (v3 == 100)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100286DA0);
    }
    id v7 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Reverse push enabled by config bag",  (uint8_t *)&v12,  2u);
    }

    return 1;
  }

  else if (v3)
  {
    uint32_t v8 = arc4random();
    double v9 = (double)v4 * 4294967300.0 / 100.0;
    BOOL v6 = v9 > (double)v8;
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100286DC0);
    }
    id v10 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218496;
      unint64_t v13 = v4;
      __int16 v14 = 1024;
      uint32_t v15 = v8;
      __int16 v16 = 1024;
      BOOL v17 = v9 > (double)v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Reverse push percentage: %lu; die roll: %u; decision: %d",
        (uint8_t *)&v12,
        0x18u);
    }
  }

  else
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100286D80);
    }
    id v5 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Reverse push disabled by config bag",  (uint8_t *)&v12,  2u);
    }

    return 0;
  }

  return v6;
}

- (void)fetchPublicKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v9 = [v8 ktDisable];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"fetchPublicKeys not permitted when kt disabled"));
    v7[2](v7, 0LL, v10);
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10018EE9C;
    v11[3] = &unk_100286E50;
    __int16 v14 = v7;
    id v12 = v6;
    unint64_t v13 = self;
    -[KTLogClient configure:](self, "configure:", v11);
  }
}

- (void)postReport:(id)a3 uuid:(id)a4 application:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (void (**)(id, void *))a6;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v15 = [v14 ktDisable];

  if (v15)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100286E70);
    }
    __int16 v16 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "postReport not permitted when kt disabled",  buf,  2u);
    }

    BOOL v17 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"postReport not permitted when kt disabled"));
    v13[2](v13, v17);
  }

  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10018F6C4;
    v18[3] = &unk_100286EC0;
    v22 = v13;
    v18[4] = self;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    -[KTLogClient configure:](self, "configure:", v18);

    BOOL v17 = v22;
  }
}

- (void)fetchMessage:(id)a3 uri:(id)a4 uuid:(id)a5 application:(id)a6 userInitiated:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v20 = objc_alloc(&OBJC_CLASS___KTLogNetworkRequest);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 data]);

  id v22 = -[KTLogNetworkRequest initPOSTWithURL:data:uuid:application:]( v20,  "initPOSTWithURL:data:uuid:application:",  v17,  v21,  v14,  v15);
  [v22 setAdditionalHeaders:&off_10029A420];
  BOOL v23 = -[KTLogClient shouldUseReversePush:](self, "shouldUseReversePush:", v9);
  [v22 setAuthenticated:1];
  [v22 setUseReversePush:v23];
  if (v9) {
    +[TransparencySettings defaultNetworkTimeout](&OBJC_CLASS___TransparencySettings, "defaultNetworkTimeout");
  }
  else {
    +[TransparencySettings backgroundNetworkTimeout](&OBJC_CLASS___TransparencySettings, "backgroundNetworkTimeout");
  }
  objc_msgSend(v22, "setTimeout:");
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10018FAA0;
  v27[3] = &unk_100286F50;
  BOOL v32 = v23;
  v27[4] = self;
  id v28 = v15;
  id v29 = v14;
  id v30 = v16;
  CFAbsoluteTime v31 = Current;
  id v24 = v16;
  id v25 = v14;
  id v26 = v15;
  -[TransparencyLogClient fetchRequest:completionHandler:](self, "fetchRequest:completionHandler:", v22, v27);
}

- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v14 = [v13 ktDisable];

  if (v14)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100286F70);
    }
    id v15 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "fetchBatchQuery not permitted when kt disabled",  buf,  2u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"fetchBatchQuery not permitted when kt disabled"));
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v16);
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001902E8;
    v17[3] = &unk_100277C68;
    id v21 = v12;
    id v18 = v10;
    id v19 = self;
    id v20 = v11;
    BOOL v22 = a5;
    -[KTLogClient configure:](self, "configure:", v17);

    id v16 = v21;
  }
}

- (void)fetchBatchQueries:(id)a3 userInitiated:(BOOL)a4 responseHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v39 = a5;
  id v11 = (void (**)(void))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v13 = [v12 ktDisable];

  if (v13)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100286FB8);
    }
    unsigned int v14 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "fetchBatchQueries not permitted when kt disabled",  buf,  2u);
    }

    v11[2](v11);
  }

  else
  {
    v36 = v11;
    id v15 = dispatch_group_create();
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    queue = dispatch_queue_create("com.apple.transparencyd.batchQueue", v17);

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v37 = v10;
    id obj = v10;
    id v18 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    id v19 = _NSConcreteStackBlock;
    if (v18)
    {
      id v20 = v18;
      uint64_t v21 = *(void *)v48;
      BOOL v22 = off_100275000;
      do
      {
        BOOL v23 = 0LL;
        do
        {
          if (*(void *)v48 != v21) {
            objc_enumerationMutation(obj);
          }
          v40 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v23);
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class UUID](v22[95], "UUID"));
          if (qword_1002EECA0 != -1) {
            dispatch_once(&qword_1002EECA0, &stru_100286FD8);
          }
          id v25 = (void *)qword_1002EECA8;
          if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = v25;
            v27 = v15;
            id v28 = v20;
            uint64_t v29 = v21;
            id v30 = self;
            BOOL v31 = v8;
            BOOL v32 = v19;
            v33 = (void *)objc_claimAutoreleasedReturnValue([v40 uriArray]);
            *(_DWORD *)buf = 138543874;
            v52 = v24;
            __int16 v53 = 2160;
            uint64_t v54 = 1752392040LL;
            __int16 v55 = 2112;
            v56 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Fetching batch query response with fetchId %{public}@ for uris %{mask.hash}@",  buf,  0x20u);

            id v19 = v32;
            BOOL v8 = v31;
            self = v30;
            uint64_t v21 = v29;
            id v20 = v28;
            id v15 = v27;
            BOOL v22 = off_100275000;
          }

          dispatch_group_enter(v15);
          v43[0] = v19;
          v43[1] = 3221225472LL;
          v43[2] = sub_100190A20;
          v43[3] = &unk_100287000;
          id v46 = v39;
          id v44 = v24;
          v45 = v15;
          id v34 = v24;
          -[KTLogClient fetchBatchQuery:uuid:userInitiated:completionHandler:]( self,  "fetchBatchQuery:uuid:userInitiated:completionHandler:",  v40,  v34,  v8,  v43);

          BOOL v23 = (char *)v23 + 1;
        }

        while (v20 != v23);
        id v20 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      }

      while (v20);
    }

    block[0] = v19;
    block[1] = 3221225472LL;
    block[2] = sub_100190A54;
    block[3] = &unk_10027A7D0;
    id v11 = v36;
    v42 = v36;
    dispatch_group_notify(v15, queue, block);

    id v10 = v37;
  }
}

- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100287020);
    }
    unsigned int v13 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "fetchBatchQuery not permitted when kt disabled",  v15,  2u);
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"fetchBatchQuery not permitted when kt disabled"));
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v14);
  }

  else
  {
    -[KTLogClient fetchBatchQuery:uuid:userInitiated:completionHandler:]( self,  "fetchBatchQuery:uuid:userInitiated:completionHandler:",  v8,  v9,  0LL,  v10);
  }
}

- (void)fetchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (void (**)(id, void, void *))a6;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v14 = [v13 ktDisable];

  if (v14)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100287040);
    }
    id v15 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "fetchQuery not permitted when kt disabled",  buf,  2u);
    }

    dispatch_queue_attr_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"fetchQuery not permitted when kt disabled"));
    v12[2](v12, 0LL, v16);
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100190DB0;
    v17[3] = &unk_100277C68;
    uint64_t v21 = v12;
    id v18 = v10;
    id v19 = self;
    id v20 = v11;
    BOOL v22 = a5;
    -[KTLogClient configure:](self, "configure:", v17);

    dispatch_queue_attr_t v16 = v21;
  }
}

- (void)fetchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100287060);
    }
    unsigned int v13 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "fetchQuery not permitted when kt disabled",  v15,  2u);
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"fetchQuery not permitted when kt disabled"));
    v10[2](v10, 0LL, v14);
  }

  else
  {
    -[KTLogClient fetchQuery:uuid:userInitiated:completionHandler:]( self,  "fetchQuery:uuid:userInitiated:completionHandler:",  v8,  v9,  0LL,  v10);
  }
}

- (void)fetchConsistencyProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_100287080);
    }
    unsigned int v13 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "fetchConsistencyProof not permitted when kt disabled",  buf,  2u);
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"fetchConsistencyProof not permitted when kt disabled"));
    v10[2](v10, 0LL, v14);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001913B8;
    v15[3] = &unk_1002870A8;
    id v18 = v10;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    -[KTLogClient configure:](self, "configure:", v15);

    unsigned int v14 = v18;
  }
}

- (void)fetchRevisionLogInclusionProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  unsigned int v12 = [v11 ktDisable];

  if (v12)
  {
    if (qword_1002EECA0 != -1) {
      dispatch_once(&qword_1002EECA0, &stru_1002870C8);
    }
    unsigned int v13 = (os_log_s *)qword_1002EECA8;
    if (os_log_type_enabled((os_log_t)qword_1002EECA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "fetchRevisionLogInclusionProof not permitted when kt disabled",  buf,  2u);
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorKTDisabled,  -390LL,  @"fetchRevisionLogInclusionProof not permitted when kt disabled"));
    v10[2](v10, 0LL, v14);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001917F0;
    v15[3] = &unk_1002870A8;
    id v18 = v10;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    -[KTLogClient configure:](self, "configure:", v15);

    unsigned int v14 = v18;
  }
}

- (unint64_t)currentEnvironment
{
  return self->currentEnvironment;
}

- (void)setCurrentEnvironment:(unint64_t)a3
{
  self->currentEnvironment = a3;
}

- (KTSMTriggerInterface)triggerInterface
{
  return (KTSMTriggerInterface *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTriggerInterface:(id)a3
{
}

- (TransparencyConfigBag)configBag
{
  return (TransparencyConfigBag *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setConfigBag:(id)a3
{
}

- (double)overrideIDMSFetchTime
{
  return self->_overrideIDMSFetchTime;
}

- (void)setOverrideIDMSFetchTime:(double)a3
{
  self->_overrideIDMSFetchTime = a3;
}

- (void).cxx_destruct
{
}

@end