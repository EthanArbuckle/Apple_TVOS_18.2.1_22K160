@interface VCPPhotoLibraryManager
+ (id)sharedManager;
- (VCPPhotoLibraryManager)init;
- (VCPPhotoLibraryManager)initWithPhotoLibraryPaths:(id)a3;
- (id)allPhotoLibraries;
- (id)photoLibraryWithURL:(id)a3;
- (void)dealloc;
- (void)persistPhotoLibraries;
@end

@implementation VCPPhotoLibraryManager

- (VCPPhotoLibraryManager)init
{
  return 0LL;
}

- (VCPPhotoLibraryManager)initWithPhotoLibraryPaths:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___VCPPhotoLibraryManager;
  v5 = -[VCPPhotoLibraryManager init](&v17, "init");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaanalysisd.VCPPhotoLibraryManager", 0LL);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    openPhotoLibraries = v5->_openPhotoLibraries;
    v5->_openPhotoLibraries = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v4));
    knownPhotoLibraries = v5->_knownPhotoLibraries;
    v5->_knownPhotoLibraries = (NSMutableArray *)v10;

    v12 = objc_autoreleasePoolPush();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000DDD44;
    v15[3] = &unk_1001BD420;
    v16 = v5;
    v13 = objc_retainBlock(v15);
    ((void (*)(void *, uint64_t, const __CFString *))v13[2])(v13, 1LL, @"System");

    objc_autoreleasePoolPop(v12);
  }

  return v5;
}

+ (id)sharedManager
{
  if (qword_1001E6648 != -1) {
    dispatch_once(&qword_1001E6648, &stru_1001BD440);
  }
  return (id)qword_1001E6640;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___VCPPhotoLibraryManager;
  -[VCPPhotoLibraryManager dealloc](&v2, "dealloc");
}

- (id)allPhotoLibraries
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000DE124;
  uint64_t v10 = sub_1000DE134;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DE13C;
  v5[3] = &unk_1001BD4A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)persistPhotoLibraries
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 7)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      knownPhotoLibraries = self->_knownPhotoLibraries;
      int v17 = 138412290;
      v18 = knownPhotoLibraries;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Persisting Photo Library paths %@", (uint8_t *)&v17, 0xCu);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v9 setObject:self->_knownPhotoLibraries forKey:VCPPhotoLibrariesDefaultsKey];
  id v10 = [v9 synchronize];
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
    if ((int)v12 >= 4)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v15, v16))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Failed to persist known Photo Libraries",  (uint8_t *)&v17,  2u);
      }
    }
  }
}

- (id)photoLibraryWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisLogLevel(v4, v5);
  if ((int)v6 >= 7)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Request for photo library at path %@", (uint8_t *)&buf, 0xCu);
    }
  }

  if (v4)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x3032000000LL;
    v26 = sub_1000DE124;
    v27 = sub_1000DE134;
    id v28 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DE858;
    block[3] = &unk_1001BD4D0;
    v22 = self;
    p___int128 buf = &buf;
    id v21 = v4;
    dispatch_sync(queue, block);
    id v13 = *(id *)(*((void *)&buf + 1) + 40LL);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    uint64_t v14 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v14 >= 4)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v17, v18))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Photo Library requested with nil URL", (uint8_t *)&buf, 2u);
      }
    }

    id v13 = 0LL;
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end