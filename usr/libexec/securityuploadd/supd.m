@interface supd
+ (id)serializeLoggingEvent:(id)a3 error:(id *)a4;
- (BOOL)checkSupdEntitlement;
- (BOOL)uploadAnalyticsWithError:(id *)a3 force:(BOOL)a4;
- (NSArray)analyticsTopics;
- (NSDictionary)topicsSamplingRates;
- (NSXPCConnection)connection;
- (SFAnalyticsReporter)reporter;
- (id)getSysdiagnoseDump;
- (id)stringForEventClass:(int64_t)a3;
- (id)sysdiagnoseStringForEventRecord:(id)a3;
- (supd)initWithConnection:(id)a3;
- (supd)initWithConnection:(id)a3 reporter:(id)a4;
- (void)clientStatus:(id)a3;
- (void)createChunkedLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5;
- (void)createLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5;
- (void)fixFiles:(id)a3;
- (void)forceUploadWithReply:(id)a3;
- (void)getSysdiagnoseDumpWithReply:(id)a3;
- (void)performRegularlyScheduledUpload;
- (void)sendNotificationForOncePerReportSamplers;
- (void)setConnection:(id)a3;
- (void)setTopicsSamplingRates:(id)a3;
- (void)setUploadDateWith:(id)a3 reply:(id)a4;
- (void)setupSamplingRates;
- (void)setupTopics;
@end

@implementation supd

- (void)setupTopics
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/Frameworks/Security.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathForResource:@"SFAnalytics" ofType:@"plist"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_topicsSamplingRates,  "objectForKeyedSubscript:",  v12,  (void)v19));
        v14 = objc_alloc(&OBJC_CLASS___SFAnalyticsTopic);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v12]);
        v16 = -[SFAnalyticsTopic initWithDictionary:name:samplingRates:]( v14,  "initWithDictionary:name:samplingRates:",  v15,  v12,  v13);

        [v6 addObject:v16];
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }

  v17 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v6));
  analyticsTopics = self->_analyticsTopics;
  self->_analyticsTopics = v17;
}

- (void)setupSamplingRates
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/Security/Certificates.bundle"));
  CFURLRef v4 = sub_100010C4C(@"private/var/protected/", (uint64_t)@"trustd/");
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[__CFURL URLByAppendingPathComponent:isDirectory:]( v4,  "URLByAppendingPathComponent:isDirectory:",  @"SupplementalsAssets/",  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForResource:@"AssetVersion" withExtension:@"plist"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v6));

  if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"MobileAssetContentVersion"]);
    if (v9 && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)) {
      id v11 = v9;
    }
    else {
      id v11 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"OTAPKIContext.plist"]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v12));

  if (v13 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"MobileAssetContentVersion"]);
    if (v15 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)) {
      id v17 = v15;
    }
    else {
      id v17 = 0LL;
    }
  }

  else
  {
    id v17 = 0LL;
  }

  if (!v11 || !v17)
  {

    goto LABEL_27;
  }

  id v18 = [v17 compare:v11];

  if (v18 != (id)1) {
    goto LABEL_27;
  }
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.plist",  @"AnalyticsSamplingRates"));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v19]);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v20));
  __int128 v22 = sub_100010B50("supd");
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "read sampling rates from SupplementalsAssets dir",  buf,  2u);
  }

  if (!v21 || (uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v21, v24) & 1) == 0))
  {

LABEL_27:
    v25 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForResource:@"AnalyticsSamplingRates" withExtension:@"plist"]);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v25));

    if (!v21) {
      goto LABEL_33;
    }
    goto LABEL_28;
  }

LABEL_28:
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v21, v26) & 1) != 0)
  {
    v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"Topics"]);
    topicsSamplingRates = self->_topicsSamplingRates;
    self->_topicsSamplingRates = v27;

    v29 = self->_topicsSamplingRates;
    if (!v29)
    {
LABEL_32:
      self->_topicsSamplingRates = 0LL;

      goto LABEL_33;
    }

    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v21, v30) & 1) == 0)
    {
      v29 = self->_topicsSamplingRates;
      goto LABEL_32;
    }
  }

- (supd)initWithConnection:(id)a3 reporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___supd;
  id v9 = -[supd init](&v15, "init");
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_reporter, a4);
    -[supd setupSamplingRates](v10, "setupSamplingRates");
    -[supd setupTopics](v10, "setupTopics");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000EE58;
    block[3] = &unk_100018868;
    id v11 = v10;
    uint64_t v14 = v11;
    if (qword_10001DB88 != -1)
    {
      dispatch_once(&qword_10001DB88, block);
      id v11 = v14;
    }
  }

  return v10;
}

- (supd)initWithConnection:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SFAnalyticsReporter);
  v6 = -[supd initWithConnection:reporter:](self, "initWithConnection:reporter:", v4, v5);

  return v6;
}

- (void)sendNotificationForOncePerReportSamplers
{
}

- (void)performRegularlyScheduledUpload
{
  v3 = sub_100010B50("upload");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting uploads in response to regular trigger",  buf,  2u);
  }

  id v13 = 0LL;
  unsigned int v5 = -[supd uploadAnalyticsWithError:force:](self, "uploadAnalyticsWithError:force:", &v13, 0LL);
  id v6 = v13;
  if (v5)
  {
    id v7 = sub_100010B50("upload");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "Regularly scheduled upload successful";
      uint64_t v10 = v8;
      uint32_t v11 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }

  else
  {
    uint64_t v12 = sub_100010B50("SecError");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      id v9 = "upload: Failed to complete regularly scheduled upload: %@";
      uint64_t v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_8;
    }
  }
}

- (BOOL)uploadAnalyticsWithError:(id *)a3 force:(BOOL)a4
{
  uint64_t v4 = a4;
  -[supd sendNotificationForOncePerReportSamplers](self, "sendNotificationForOncePerReportSamplers");
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  v79 = self;
  id v7 = self->_analyticsTopics;
  id v78 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v89,  v98,  16LL);
  id v8 = 0LL;
  id v9 = 0LL;
  if (!v78)
  {
    char v73 = 0;
    goto LABEL_83;
  }

  char v73 = 0;
  uint64_t v77 = *(void *)v90;
  v70 = v7;
  unsigned int v69 = v4;
  v68 = a3;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v90 != v77) {
        objc_enumerationMutation(v7);
      }
      uint32_t v11 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)v10);
      uint64_t v12 = objc_autoreleasePoolPush();
      if (!v8) {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 getSession]);
      }
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 splunkUploadURL:v4 urlSession:v8]);
      context = v12;
      if (!v13)
      {
        __int128 v21 = sub_100010B50("upload");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
          id v17 = v8;
          id v18 = (void *)v22;
          *(_DWORD *)buf = 138412290;
          uint64_t v95 = v22;
          __int128 v19 = v15;
          __int128 v20 = "Skipping upload for %@ because no endpoint";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);

          id v8 = v17;
        }

- (id)sysdiagnoseStringForEventRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  [v5 removeObjectForKey:@"topic"];
  uint64_t v6 = SFAnalyticsEventTime;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:SFAnalyticsEventTime]);
  [v7 doubleValue];
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  v8 / 1000.0));

  [v5 removeObjectForKey:v6];
  uint64_t v10 = SFAnalyticsEventType;
  uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SFAnalyticsEventType]);
  [v5 removeObjectForKey:v10];
  uint64_t v12 = SFAnalyticsEventClassKey;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:SFAnalyticsEventClassKey]);
  id v14 = [v13 integerValue];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[supd stringForEventClass:](self, "stringForEventClass:", v14));
  [v5 removeObjectForKey:v12];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  if ([v5 count])
  {
    [v16 appendString:@" - Attributes: {"];
    v26[0] = 0LL;
    v26[1] = v26;
    v26[2] = 0x2020000000LL;
    char v27 = 1;
    __int128 v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    uint64_t v22 = sub_10000EDC8;
    v23 = &unk_100018890;
    uint64_t v25 = v26;
    id v17 = v16;
    id v24 = v17;
    [v5 enumerateKeysAndObjectsUsingBlock:&v20];
    [v17 appendString:@" }"];

    _Block_object_dispose(v26, 8);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@: %@%@",  v9,  v15,  v11,  v16,  v20,  v21,  v22,  v23));

  return v18;
}

- (id)getSysdiagnoseDump
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = self->_analyticsTopics;
  id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v15)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v4;
        id v5 = *(void **)(*((void *)&v25 + 1) + 8 * v4);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topicClients]);
        id v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v22;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v6);
              }
              uint32_t v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v10);
              v17[0] = _NSConcreteStackBlock;
              v17[1] = 3221225472LL;
              v17[2] = sub_10000EC2C;
              v17[3] = &unk_1000188B8;
              id v18 = v3;
              __int128 v19 = v11;
              __int128 v20 = self;
              [v11 withStore:v17];

              uint64_t v10 = (char *)v10 + 1;
            }

            while (v8 != v10);
            id v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }

          while (v8);
        }

        uint64_t v4 = v16 + 1;
      }

      while ((id)(v16 + 1) != v15);
      id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v15);
  }

  return v3;
}

- (id)stringForEventClass:(int64_t)a3
{
  else {
    return off_100018990[a3];
  }
}

- (BOOL)checkSupdEntitlement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[supd connection](self, "connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForEntitlement:@"com.apple.private.securityuploadd"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)getSysdiagnoseDumpWithReply:(id)a3
{
  unsigned __int8 v5 = (void (**)(id, void *))a3;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[supd getSysdiagnoseDump](self, "getSysdiagnoseDump"));
    v5[2](v5, v4);
  }

  else
  {
    v5[2](v5, @"client not entitled");
  }
}

- (void)createLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5
{
  BOOL v29 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *, void *))a5;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    uint64_t v9 = sub_100010B50("rpcCreateLoggingJSON");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Building a JSON blob resembling the one we would have uploaded",  buf,  2u);
    }

    -[supd sendNotificationForOncePerReportSamplers](self, "sendNotificationForOncePerReportSamplers");
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint32_t v11 = self->_analyticsTopics;
    id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v32,  v38,  16LL);
    if (v12)
    {
      id v13 = v12;
      __int128 v28 = v8;
      uint64_t v14 = 0LL;
      id v15 = 0LL;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v11);
          }
          id v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "internalTopicName", v28));
          unsigned int v20 = [v19 isEqualToString:v7];

          if (v20)
          {
            id v31 = v14;
            uint64_t v21 = objc_claimAutoreleasedReturnValue( [v18 createLoggingJSON:v29 forUpload:0 participatingClients:0 force:1 error:&v31]);
            id v22 = v31;

            uint64_t v14 = v22;
            id v15 = (void *)v21;
          }
        }

        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v32,  v38,  16LL);
      }

      while (v13);

      if (v15)
      {
        __int128 v23 = objc_autoreleasePoolPush();
        id v30 = v14;
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v15,  v29,  &v30));
        id v25 = v30;

        objc_autoreleasePoolPop(v23);
        uint64_t v14 = v25;
        id v8 = v28;
LABEL_21:
        v8[2](v8, v24, v14);

        goto LABEL_22;
      }

      id v8 = v28;
    }

    else
    {

      uint64_t v14 = 0LL;
    }

    __int128 v26 = sub_100010B50("SecError");
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unable to obtain JSON: %@", buf, 0xCu);
    }

    id v15 = 0LL;
    __int128 v24 = 0LL;
    goto LABEL_21;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -34018LL,  0LL));
  v8[2](v8, 0LL, v14);
LABEL_22:
}

- (void)createChunkedLoggingJSON:(BOOL)a3 topic:(id)a4 reply:(id)a5
{
  BOOL v28 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    uint64_t v9 = sub_100010B50("rpcCreateChunkedLoggingJSON");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Building an array of JSON blobs resembling the one we would have uploaded",  buf,  2u);
    }

    -[supd sendNotificationForOncePerReportSamplers](self, "sendNotificationForOncePerReportSamplers");
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint32_t v11 = self->_analyticsTopics;
    id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
    if (v12)
    {
      id v13 = v12;
      __int128 v27 = v8;
      uint64_t v14 = 0LL;
      id v15 = 0LL;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v11);
          }
          id v18 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "internalTopicName", v27));
          unsigned int v20 = [v19 isEqualToString:v7];

          if (v20)
          {
            id v30 = v14;
            uint64_t v21 = objc_claimAutoreleasedReturnValue( [v18 createChunkedLoggingJSON:v28 forUpload:0 participatingClients:0 force:1 error:&v30]);
            id v22 = v30;

            uint64_t v14 = v22;
            id v15 = (void *)v21;
          }
        }

        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
      }

      while (v13);

      __int128 v23 = objc_autoreleasePoolPush();
      if (v15)
      {
        id v29 = v14;
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v15,  v28,  &v29));
        id v25 = v29;
        id v8 = v27;
LABEL_21:

        objc_autoreleasePoolPop(v23);
        v8[2](v8, v24, v25);

        goto LABEL_22;
      }

      id v25 = v14;
      id v8 = v27;
    }

    else
    {

      __int128 v23 = objc_autoreleasePoolPush();
      id v25 = 0LL;
    }

    __int128 v26 = sub_100010B50("SecError");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "Unable to obtain JSON: %@",  buf,  0xCu);
    }

    id v15 = 0LL;
    __int128 v24 = 0LL;
    goto LABEL_21;
  }

  id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -34018LL,  0LL));
  v8[2](v8, 0LL, v25);
LABEL_22:
}

- (void)forceUploadWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, BOOL, id))a3;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    unsigned __int8 v5 = sub_100010B50("upload");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Performing upload in response to rpc message",  buf,  2u);
    }

    id v13 = 0LL;
    BOOL v7 = -[supd uploadAnalyticsWithError:force:](self, "uploadAnalyticsWithError:force:", &v13, 1LL);
    id v8 = v13;
    uint64_t v9 = sub_100010B50("upload");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v11 = @"failure";
      if (v7) {
        uint32_t v11 = @"success";
      }
      *(_DWORD *)buf = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Result of manually triggered upload: %@, error: %@",  buf,  0x16u);
    }

    v4[2](v4, v7, v8);
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -34018LL,  0LL));
    ((void (*)(void (**)(id, BOOL, id), void))v4[2])(v4, 0LL);
  }

- (void)setUploadDateWith:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, uint64_t, void))a4;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = self->_analyticsTopics;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topicClients", (void)v16));
          [v13 updateUploadDateForClients:v14 date:v6 clearData:0];
        }

        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v10);
    }

    v7[2](v7, 1LL, 0LL);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -34018LL,  0LL));
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0LL, v15);
  }
}

- (void)clientStatus:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  if (-[supd checkSupdEntitlement](self, "checkSupdEntitlement"))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = self->_analyticsTopics;
    id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
    if (v16)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(obj);
          }
          BOOL v7 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 topicClients]);
          id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (j = 0LL; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)j);
                v17[0] = _NSConcreteStackBlock;
                v17[1] = 3221225472LL;
                v17[2] = sub_10000EB8C;
                v17[3] = &unk_1000188E0;
                id v18 = v5;
                __int128 v19 = v13;
                [v13 withStore:v17];
              }

              id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }

            while (v10);
          }
        }

        id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
      }

      while (v16);
    }

    v4[2](v4, v5, 0LL);
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -34018LL,  0LL));
    ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v5);
  }
}

- (void)fixFiles:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[supd connection](self, "connection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.trustd.FileHelp"]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) != 0)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___TrustdFileHelper);
    -[TrustdFileHelper fixFiles:](v8, "fixFiles:", v4);
  }

  else
  {
    id v8 = (TrustdFileHelper *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -34018LL,  0LL));
    v4[2](v4, 0LL);
  }
}

- (NSArray)analyticsTopics
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (SFAnalyticsReporter)reporter
{
  return (SFAnalyticsReporter *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSDictionary)topicsSamplingRates
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTopicsSamplingRates:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)serializeLoggingEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    id v12 = 0LL;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  0LL,  &v12));
    id v8 = v12;
    objc_autoreleasePoolPop(v6);
    if (v7) {
      BOOL v9 = v8 == 0LL;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      id v10 = v7;
    }

    else
    {
      id v10 = 0LL;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  else
  {
    id v10 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.supd",  3LL,  0LL));
    }
  }

  return v10;
}

@end