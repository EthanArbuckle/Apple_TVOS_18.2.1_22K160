@interface ODRManager
+ (void)initialize;
- (ODRManager)init;
- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5;
- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6;
- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5;
- (void)cancelPurge;
@end

@implementation ODRManager

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___ODRManager, a2) == a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v3 registerDefaults:&off_10040E100];

    id v4 = sub_1001C9810((uint64_t)a1);
  }

- (ODRManager)init
{
  v2 = self;
  if (qword_1004621F0)
  {
    v3 = (ODRManager *)(id)qword_1004621F0;
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___ODRManager;
    id v4 = -[ODRManager init](&v16, "init");
    if (v4)
    {
      v5 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
      resourcesLock = v4->_resourcesLock;
      v4->_resourcesLock = v5;

      dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vfs, 0LL, 0x204uLL, 0LL);
      lowDisk = v4->_lowDisk;
      v4->_lowDisk = (OS_dispatch_source *)v7;

      v9 = (dispatch_source_s *)v4->_lowDisk;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1001CAAC4;
      handler[3] = &unk_1003E9880;
      handler[4] = v4;
      dispatch_source_set_event_handler(v9, handler);
      v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      applicationMapping = v4->_applicationMapping;
      v4->_applicationMapping = v10;

      v12 = objc_opt_new(&OBJC_CLASS___UnfairLock);
      applicationMappingLock = v4->_applicationMappingLock;
      v4->_applicationMappingLock = v12;
    }

    v3 = v4;
    v2 = v3;
  }

  v14 = v3;

  return v14;
}

- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5
{
  id v5 = sub_100185E88((uint64_t)&OBJC_CLASS___ODRBackgroundMaintenance);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100185F6C(v6);

  id v7 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = sub_1001CAE34((uint64_t)v8, 1);

  id v10 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = sub_1001CAE34((uint64_t)v11, 2);

  id v13 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = sub_1001CAE34((uint64_t)v14, 3);

  id v16 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = sub_1001CAE34((uint64_t)v17, 4);

  v25[0] = &off_10040C250;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  v26[0] = v19;
  v25[1] = &off_10040C268;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
  v26[1] = v20;
  v25[2] = &off_10040C280;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
  v26[2] = v21;
  v25[3] = &off_10040C298;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18));
  v26[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));

  return v23;
}

- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5
{
  int v5 = a4;
  id v6 = sub_100185E88((uint64_t)&OBJC_CLASS___ODRBackgroundMaintenance);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100185F6C(v7);

  id v8 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  int64_t v10 = sub_1001CAE34((uint64_t)v9, v5);

  return v10;
}

- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6
{
  int v6 = a4;
  id v7 = a5;
  id v8 = sub_100185E88((uint64_t)&OBJC_CLASS___ODRBackgroundMaintenance);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  sub_100185F6C(v9);

  id v10 = [v7 unsignedLongLongValue];
  id v11 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  uint64_t v12 = (id *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = sub_1001CB004(v12, (uint64_t)v10, v6);

  return (int64_t)v13;
}

- (void)cancelPurge
{
  id v2 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v2);
  if (v5)
  {
    uint64_t v3 = ASDLogHandleForCategory(19LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PURGING : Purging cancelled.", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end