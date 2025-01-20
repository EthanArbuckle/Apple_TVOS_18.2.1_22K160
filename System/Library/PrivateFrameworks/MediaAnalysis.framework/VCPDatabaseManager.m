@interface VCPDatabaseManager
+ (BOOL)existsDatabaseForPhotoLibrary:(id)a3;
+ (id)sharedDatabaseForPhotoLibrary:(id)a3;
+ (id)sharedDatabaseManager;
+ (void)releaseSharedDatabaseForPhotoLibrary:(id)a3;
- (VCPDatabaseManager)init;
- (id)sharedDatabaseForPhotoLibrary:(id)a3;
- (void)releaseSharedDatabaseForPhotoLibrary:(id)a3;
@end

@implementation VCPDatabaseManager

- (VCPDatabaseManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VCPDatabaseManager;
  v2 = -[VCPDatabaseManager init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysisd.VCPDatabaseManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    databases = v2->_databases;
    v2->_databases = (NSMutableDictionary *)v5;
  }

  return v2;
}

+ (id)sharedDatabaseManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009E09C;
  block[3] = &unk_1001B9958;
  block[4] = a1;
  if (qword_1001E6560 != -1) {
    dispatch_once(&qword_1001E6560, block);
  }
  return (id)qword_1001E6558;
}

- (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10009E1E4;
  v18 = sub_10009E1F4;
  id v19 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 photoLibraryURL]);
  v6 = v5;
  if (v5)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009E1FC;
    v10[3] = &unk_1001BC828;
    v13 = &v14;
    v10[4] = self;
    id v11 = v5;
    id v12 = v4;
    dispatch_sync(queue, v10);
  }

  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(a1) sharedDatabaseManager];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedDatabaseForPhotoLibrary:v4]);

  return v7;
}

+ (BOOL)existsDatabaseForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vcp_mediaAnalysisDatabaseFilepath"));

  LOBYTE(v3) = [v4 fileExistsAtPath:v5];
  return (char)v3;
}

- (void)releaseSharedDatabaseForPhotoLibrary:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = [v9 isSystemPhotoLibrary];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v9 photoLibraryURL]);
    v7 = v6;
    if (v6)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10009E40C;
      block[3] = &unk_1001B9E00;
      block[4] = self;
      id v11 = v6;
      dispatch_sync(queue, block);
    }

    id v5 = v9;
  }
}

+ (void)releaseSharedDatabaseForPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(a1) sharedDatabaseManager];
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  [v6 releaseSharedDatabaseForPhotoLibrary:v4];
}

- (void).cxx_destruct
{
}

@end