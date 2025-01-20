@interface FAScreenTimeSettingsCacheOperation
+ (id)cacheQueue;
- (FAScreenTimeSettingsCacheOperation)initWithDSID:(id)a3;
- (NSNumber)dsid;
- (id)_cacheURL;
- (id)_cacheURLWithError:(id *)a3;
- (id)_createCacheFile;
- (id)_fetchData:(id *)a3;
- (id)_onQueue:(id)a3;
- (id)cacheScreenTimeSettingsObject:(id)a3;
- (id)invalidate;
- (id)loadScreenTimeSettingsObject;
- (void)setDsid:(id)a3;
@end

@implementation FAScreenTimeSettingsCacheOperation

- (FAScreenTimeSettingsCacheOperation)initWithDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FAScreenTimeSettingsCacheOperation;
  v6 = -[FAScreenTimeSettingsCacheOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dsid, a3);
  }

  return v7;
}

+ (id)cacheQueue
{
  if (qword_1000526E8 != -1) {
    dispatch_once(&qword_1000526E8, &stru_1000414C8);
  }
  return (id)qword_1000526E0;
}

- (id)cacheScreenTimeSettingsObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAScreenTimeSettingsCacheOperation _createCacheFile](self, "_createCacheFile"));
  v6 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dataRepresentation]);

  v8 = -[AAFPromise initWithValue:](v6, "initWithValue:", v7);
  v15[0] = v8;
  v15[1] = v5;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AAFPromise all:](&OBJC_CLASS___AAFPromise, "all:", v9));
  v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v10 then]);
  uint64_t v12 = ((uint64_t (**)(void, Block_layout *))v11)[2](v11, &stru_100041508);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)loadScreenTimeSettingsObject
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100007A34;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAScreenTimeSettingsCacheOperation _cacheURL](self, "_cacheURL"));
  id v4 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v3 then]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007C84;
  v8[3] = &unk_100041558;
  v8[4] = self;
  uint64_t v5 = ((uint64_t (**)(void, void *))v4)[2](v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)_cacheURLWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAScreenTimeSettingsCacheOperation dsid](self, "dsid"));

  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v35 = 0LL;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v35]);
    id v10 = v35;

    if (v10)
    {
      uint64_t v13 = _FALogSystem(v11, v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002A268((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);
      }

      if (a3) {
        *a3 = v10;
      }
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue( [v9 URLByAppendingPathComponent:@"com.apple.family/cachedObjects" isDirectory:1]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FAScreenTimeSettingsCacheOperation dsid](self, "dsid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v21 URLByAppendingPathComponent:v23 isDirectory:0]);

    return v24;
  }

  else if (a3)
  {
    uint64_t v26 = _FALogSystem(v6, v7);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002A234(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError fa_familyErrorWithCode:]( &OBJC_CLASS___NSError,  "fa_familyErrorWithCode:",  -1013LL));
    return 0LL;
  }

  else
  {
    return 0LL;
  }

- (id)_fetchData:(id *)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_100008028;
  v14 = sub_100008038;
  id v15 = 0LL;
  id v5 = [(id)objc_opt_class(self) cacheQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008040;
  block[3] = &unk_100041580;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  dispatch_sync(v6, block);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_cacheURL
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100008168;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)_createCacheFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAScreenTimeSettingsCacheOperation _cacheURL](self, "_cacheURL"));
  id v4 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v3 then]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100008274;
  v8[3] = &unk_100041558;
  v8[4] = self;
  uint64_t v5 = ((uint64_t (**)(void, void *))v4)[2](v4, v8);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)_onQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100008470;
  v9[3] = &unk_1000415D0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = -[AAFPromise initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end