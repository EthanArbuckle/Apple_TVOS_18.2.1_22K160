@interface FAFamilyPhotoCache
+ (id)cacheQueue;
- (BOOL)_isCacheDate:(id)a3 pastDuration:(double)a4;
- (FAFamilyPhotoCache)initWithAltDSID:(id)a3;
- (NSString)altDSID;
- (id)_cacheDirectoryURLWithError:(id *)a3;
- (id)_cacheURL;
- (id)_cacheURLWithError:(id *)a3;
- (id)_createCacheFile;
- (id)_fetchData:(id *)a3;
- (id)invalidateFamilyPhotos;
- (id)load;
- (id)load:(id *)a3;
- (id)updateWithData:(id)a3;
- (void)setAltDSID:(id)a3;
@end

@implementation FAFamilyPhotoCache

- (FAFamilyPhotoCache)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FAFamilyPhotoCache;
  v6 = -[FAFamilyPhotoCache init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (id)_cacheDirectoryURLWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v15]);
  id v6 = v15;

  if (v6)
  {
    uint64_t v9 = _FALogSystem(v7, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002ADA4((uint64_t)v6, v10, v11);
    }

    v12 = 0LL;
    if (a3) {
      *a3 = v6;
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"FamilyCircle/Images"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v13]);
  }

  return v12;
}

- (id)_cacheURLWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache altDSID](self, "altDSID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v5));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache _cacheDirectoryURLWithError:](self, "_cacheDirectoryURLWithError:", a3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v6]);

  return v8;
}

+ (id)cacheQueue
{
  if (qword_100052738 != -1) {
    dispatch_once(&qword_100052738, &stru_100041F50);
  }
  return (id)qword_100052730;
}

- (id)_fetchData:(id *)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_1000148C0;
  v14 = sub_1000148D0;
  id v15 = 0LL;
  id v5 = [(id)objc_opt_class(self) cacheQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000148D8;
  block[3] = &unk_100041580;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  dispatch_sync(v6, block);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)load
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100014A9C;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)load:(id *)a3
{
  uint64_t v5 = _FASignpostLogSystem(self, a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = _FASignpostCreate();
  uint64_t v9 = v8;

  uint64_t v12 = _FASignpostLogSystem(v10, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "LoadFamilyPhotoCache",  "",  buf,  2u);
  }

  uint64_t v17 = _FASignpostLogSystem(v15, v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10002AE88(v7, v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache _fetchData:](self, "_fetchData:", a3));
  unint64_t Nanoseconds = _FASignpostGetNanoseconds(v7, v9);
  uint64_t v22 = _FASignpostLogSystem(Nanoseconds, v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_END,  v7,  "LoadFamilyPhotoCache",  "",  v30,  2u);
  }

  uint64_t v27 = _FASignpostLogSystem(v25, v26);
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_10002AE0C(v7, v28, (double)Nanoseconds / 1000000000.0);
  }

  return v19;
}

- (BOOL)_isCacheDate:(id)a3 pastDuration:(double)a4
{
  id v6 = a3;
  uint64_t v8 = v6;
  if (v6 && (id v6 = [v6 timeIntervalSinceNow], v9 > -a4))
  {
    uint64_t v10 = _FALogSystem(v6, v7);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache altDSID](self, "altDSID"));
      int v17 = 138412546;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Cache photo for member %@ is valid dateCreated: %@",  (uint8_t *)&v17,  0x16u);
    }

    BOOL v13 = 0;
  }

  else
  {
    uint64_t v14 = _FALogSystem(v6, v7);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache altDSID](self, "altDSID"));
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Cache photo for member %@ expired dateCreated: %@",  (uint8_t *)&v17,  0x16u);
    }

    BOOL v13 = 1;
  }

  return v13;
}

- (id)_cacheURL
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100014E88;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)_createCacheFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache _cacheURL](self, "_cacheURL"));
  v4 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue([v3 thenOnQueue]);
  id v5 = [(id)objc_opt_class(self) cacheQueue];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = ((uint64_t (**)(void, void *, Block_layout *))v4)[2](v4, v6, &stru_100041F90);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)updateWithData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000150F8;
  v9[3] = &unk_100041048;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = -[AAFPromise initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (id)invalidateFamilyPhotos
{
  v3 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", 0LL);
  id v4 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[AAFPromise thenOnQueue](v3, "thenOnQueue"));
  id v5 = [(id)objc_opt_class(self) cacheQueue];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000154B4;
  v10[3] = &unk_100040E38;
  v10[4] = self;
  uint64_t v7 = ((uint64_t (**)(void, void *, void *))v4)[2](v4, v6, v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end