@interface MSDAnalytics
+ (id)sharedInstance;
- (BOOL)disableCoreAnalticsTransformSampling;
- (BOOL)rollOverCoreAnalyticsLogs;
- (BOOL)uploadCoreAnalyticsLogs;
- (MSDAnalytics)init;
- (NSFileHandle)testFileHandle;
- (void)sendEvent:(id)a3 withPayload:(id)a4;
- (void)setTestFileHandle:(id)a3;
@end

@implementation MSDAnalytics

+ (id)sharedInstance
{
  if (qword_100125258 != -1) {
    dispatch_once(&qword_100125258, &stru_1000F9400);
  }
  return (id)qword_100125250;
}

- (MSDAnalytics)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDAnalytics;
  v2 = -[MSDAnalytics init](&v8, "init");
  if (v2 && os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v4 = [v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log"];

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v5 createFileAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log" contents:0 attributes:0];
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log"));
    -[MSDAnalytics setTestFileHandle:](v2, "setTestFileHandle:", v6);
  }

  return v2;
}

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    objc_super v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Event triggered: %@, Payload: %@\n",  v6,  v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalytics testFileHandle](v8, "testFileHandle"));
    [v10 seekToEndOfFile];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAnalytics testFileHandle](v8, "testFileHandle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
    [v11 writeData:v12];

    objc_sync_exit(v8);
  }

  if (v6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000A838;
    v13[3] = &unk_1000F9428;
    id v14 = v7;
    AnalyticsSendEventLazy(v6, v13);
  }
}

- (BOOL)rollOverCoreAnalyticsLogs
{
  char v2 = AnalyticsRolloverEvents(self, a2);
  id v3 = sub_10003A95C();
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully rolled over CA logs.", v14, 2u);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100090814(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v2;
}

- (BOOL)uploadCoreAnalyticsLogs
{
  id v2 = objc_alloc_init(&OBJC_CLASS___OSASubmissionClient);
  unsigned __int8 v3 = [v2 submit];
  id v4 = sub_10003A95C();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Successfully uploaded outstanding CA logs to server.",  v15,  2u);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100090844(v6, v8, v9, v10, v11, v12, v13, v14);
  }

  return v3;
}

- (BOOL)disableCoreAnalticsTransformSampling
{
  char v2 = AnalyticsDisableAllTransformSampling(self, a2);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Successfully disabled sampling for all transforms.",  v14,  2u);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100090874(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v2;
}

- (NSFileHandle)testFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTestFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end