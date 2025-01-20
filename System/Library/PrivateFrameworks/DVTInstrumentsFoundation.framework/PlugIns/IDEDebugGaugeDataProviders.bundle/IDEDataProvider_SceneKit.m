@interface IDEDataProvider_SceneKit
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (BOOL)captureShadersToDictionary:(id)a3 forPID:(id)a4;
- (IDEDataProvider_SceneKit)init;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_SceneKit

+ (id)sharedDataProvider
{
  if (qword_11400 != -1) {
    dispatch_once(&qword_11400, &stru_C630);
  }
  return (id)qword_113F8;
}

- (IDEDataProvider_SceneKit)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDEDataProvider_SceneKit;
  v2 = -[IDEDataProvider_SceneKit init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    collectionStartedForPidDictionary = v2->_collectionStartedForPidDictionary;
    v2->_collectionStartedForPidDictionary = v3;

    dispatch_queue_t v5 = dispatch_queue_create("Lock to protect multithread access during capturing", 0LL);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (id)supportedAttributes
{
  if (qword_11410 != -1) {
    dispatch_once(&qword_11410, &stru_C650);
  }
  return (id)qword_11408;
}

- (id)startSamplingForPIDs:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  capture_lock = self->_capture_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_5B34;
  block[3] = &unk_C588;
  id v13 = v4;
  v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  dispatch_sync((dispatch_queue_t)capture_lock, block);
  v9 = v15;
  id v10 = v7;

  return v10;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_collectionStartedForPidDictionary, "objectForKey:", v8));
  if ([v9 BOOLValue])
  {
    uint64_t v10 = _SCNGetPerformanceStatisticsForPid([v8 intValue]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = v11 != 0LL;
    if (v11)
    {
      [v7 addEntriesFromDictionary:v11];
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDEDataProvider initialQueryTimeForPidDictionary](self, "initialQueryTimeForPidDictionary"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v8]);
      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v15 timeIntervalSinceDate:v14];
        double v17 = v16;

        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  vcvtpd_u64_f64(v17)));
        [v7 setObject:v18 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }

      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v13 setObject:v14 forKeyedSubscript:v8];
        [v7 setObject:&off_D960 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)captureShadersToDictionary:(id)a3 forPID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_collectionStartedForPidDictionary, "objectForKey:", v7));
  if ([v8 BOOLValue])
  {
    uint64_t v9 = _SCNGetCollectedShadersForPid([v7 intValue]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = v10 != 0LL;
    if (v10) {
      [v6 addEntriesFromDictionary:v10];
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v4 = a3;
  capture_lock = self->_capture_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_6044;
  v9[3] = &unk_C678;
  id v6 = v4;
  id v10 = v6;
  BOOL v11 = self;
  dispatch_sync((dispatch_queue_t)capture_lock, v9);
  id v7 = v6;

  return v7;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  capture_lock = self->_capture_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_62B4;
  v16[3] = &unk_C480;
  id v17 = v7;
  id v18 = v6;
  v19 = self;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync((dispatch_queue_t)capture_lock, v16);
  id v13 = v20;
  id v14 = v10;

  return v14;
}

- (void).cxx_destruct
{
}

@end