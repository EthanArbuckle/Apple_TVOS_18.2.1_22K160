@interface SFAnalyticsClient
+ (id)getSharedClientNamed:(id)a3 orCreateWithStorePath:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6;
+ (void)clearSFAnalyticsClientGlobalCache;
- (BOOL)requireDeviceAnalytics;
- (BOOL)requireiCloudAnalytics;
- (NSString)name;
- (NSString)storePath;
- (OS_dispatch_queue)queue;
- (SFAnalyticsClient)initWithStore:(id)a3 queue:(id)a4 name:(id)a5 requireDeviceAnalytics:(BOOL)a6 requireiCloudAnalytics:(BOOL)a7;
- (SFAnalyticsClient)initWithStorePath:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6;
- (SFAnalyticsSQLiteStore)store;
- (id)initFromExistingClient:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6;
- (void)withStore:(id)a3;
@end

@implementation SFAnalyticsClient

- (NSString)storePath
{
  return (NSString *)-[SFAnalyticsSQLiteStore path](self->_store, "path");
}

- (SFAnalyticsClient)initWithStorePath:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc(&OBJC_CLASS___SFAnalyticsSQLiteStore);
  v13 = -[SFAnalyticsSQLiteStore initWithPath:schema:](v12, "initWithPath:schema:", v11, SFAnalyticsTableSchema);

  id v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"SFAnalyticsClient queue-%@", v10));
  v15 = (const char *)[v14 UTF8String];
  dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
  dispatch_queue_t v18 = dispatch_queue_create(v15, v17);

  v19 = -[SFAnalyticsClient initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:]( self,  "initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:",  v13,  v18,  v10,  v7,  v6);
  return v19;
}

- (id)initFromExistingClient:(id)a3 name:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"SFAnalyticsClient queue-%@", v10));
  v13 = (const char *)[v12 UTF8String];
  dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
  dispatch_queue_attr_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 queue]);
  dispatch_queue_t v17 = dispatch_queue_create_with_target_V2(v13, v15, v16);

  dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 store]);
  v19 = -[SFAnalyticsClient initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:]( self,  "initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:",  v18,  v17,  v10,  v7,  v6);

  return v19;
}

- (SFAnalyticsClient)initWithStore:(id)a3 queue:(id)a4 name:(id)a5 requireDeviceAnalytics:(BOOL)a6 requireiCloudAnalytics:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SFAnalyticsClient;
  dispatch_queue_attr_t v16 = -[SFAnalyticsClient init](&v19, "init");
  dispatch_queue_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_store, a3);
    objc_storeStrong((id *)&v17->_queue, a4);
    objc_storeStrong((id *)&v17->_name, a5);
    v17->_requireDeviceAnalytics = a6;
    v17->_requireiCloudAnalytics = a7;
  }

  return v17;
}

- (void)withStore:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005880;
  block[3] = &unk_100018668;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)requireDeviceAnalytics
{
  return self->_requireDeviceAnalytics;
}

- (BOOL)requireiCloudAnalytics
{
  return self->_requireiCloudAnalytics;
}

- (SFAnalyticsSQLiteStore)store
{
  return self->_store;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

+ (void)clearSFAnalyticsClientGlobalCache
{
  v2 = (void *)qword_10001DB70;
  qword_10001DB70 = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);
}

+ (id)getSharedClientNamed:(id)a3 orCreateWithStorePath:(id)a4 requireDeviceAnalytics:(BOOL)a5 requireiCloudAnalytics:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10001DB68);
  if (!qword_10001DB70)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v12 = (void *)qword_10001DB70;
    qword_10001DB70 = v11;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByStandardizingPath]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10001DB70 objectForKeyedSubscript:v13]);
  id v15 = v14;
  if (v14)
  {
    dispatch_queue_attr_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);
    if (v16)
    {
      dispatch_queue_t v17 = v16;
      dispatch_queue_t v18 = v17;
    }

    else
    {
      id v23 = v15;
      *(void *)buf = 0LL;
      v32 = buf;
      uint64_t v33 = 0x3032000000LL;
      v34 = sub_100005DB0;
      v35 = sub_100005DC0;
      id v36 = 0LL;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100005DC8;
      v30[3] = &unk_100018908;
      v30[4] = buf;
      [v23 enumerateKeysAndObjectsUsingBlock:v30];
      dispatch_queue_t v17 = (SFAnalyticsClient *)*((id *)v32 + 5);
      _Block_object_dispose(buf, 8);

      dispatch_queue_t v18 = -[SFAnalyticsClient initFromExistingClient:name:requireDeviceAnalytics:requireiCloudAnalytics:]( objc_alloc(&OBJC_CLASS___SFAnalyticsClient),  "initFromExistingClient:name:requireDeviceAnalytics:requireiCloudAnalytics:",  v17,  v9,  v7,  v6);
      [v23 setObject:v18 forKeyedSubscript:v9];
    }

@end