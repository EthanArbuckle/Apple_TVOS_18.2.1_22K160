@interface ICCloudContentTasteResponseCacheManager
+ (id)sharedCloudContentTasteResponseCacheManager;
- (BOOL)setCachedContentTasteUpdateResponse:(id)a3 forConnectionConfiguration:(id)a4;
- (ICCloudContentTasteResponseCacheManager)init;
- (id)_init;
- (id)_mediaContentTasteCacheFilePathForAccount:(id)a3;
- (id)_prepareArchiveWithContentTasteReponse:(id)a3;
- (id)_prepareCachedResponseFromArchiveAtPath:(id)a3;
- (id)getCachedContentTasteResponseForConnectionConfiguration:(id)a3;
- (void)removeAllCachedContentTasteResponses;
- (void)removeCachedContentTasteResponseForConnectionConfiguration:(id)a3;
@end

@implementation ICCloudContentTasteResponseCacheManager

- (ICCloudContentTasteResponseCacheManager)init
{
  return 0LL;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICCloudContentTasteResponseCacheManager;
  v2 = -[ICCloudContentTasteResponseCacheManager init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICCloudContentTasteResponseCacheManager.accessQueue", 0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    id v7 = objc_msgSend( (id)CPSharedResourcesDirectory(v5, v6),  "stringByAppendingPathComponent:",  @"Library/Caches/com.apple.itunescloud/MediaContentTaste");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    mediaContentTasteCacheDirectoryPath = v2->_mediaContentTasteCacheDirectoryPath;
    v2->_mediaContentTasteCacheDirectoryPath = (NSString *)v8;
  }

  return v2;
}

- (id)getCachedContentTasteResponseForConnectionConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000A82E8;
  v16 = sub_1000A82F8;
  id v17 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A8300;
  block[3] = &unk_1001A47E8;
  block[4] = self;
  id v10 = v4;
  objc_super v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)setCachedContentTasteUpdateResponse:(id)a3 forConnectionConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 1;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A8090;
  v12[3] = &unk_1001A4810;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessQueue, v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (void)removeAllCachedContentTasteResponses
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A7DF4;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)removeCachedContentTasteResponseForConnectionConfiguration:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A7CBC;
  block[3] = &unk_1001A6C30;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
}

- (id)_mediaContentTasteCacheFilePathForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentityStore]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
  id v13 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 DSIDForUserIdentity:v6 outError:&v13]);
  id v8 = v13;

  if (v8 || !v7)
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v15 = self;
      __int16 v16 = 2048;
      id v17 = v4;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ Could not get DSID for configuration=%p. error=%{public}@",  buf,  0x20u);
    }

    objc_super v11 = 0LL;
  }

  else
  {
    mediaContentTasteCacheDirectoryPath = self->_mediaContentTasteCacheDirectoryPath;
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"SyncResponse-%llu",  [v7 unsignedLongLongValue]));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( mediaContentTasteCacheDirectoryPath,  "stringByAppendingPathComponent:",  v10));
  }

  return v11;
}

- (id)_prepareArchiveWithContentTasteReponse:(id)a3
{
  id v3 = a3;
  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  0LL));
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_prepareCachedResponseFromArchiveAtPath:(id)a3
{
  id v3 = a3;
  if (!v3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
        unsigned int v5 = [v4 fileExistsAtPath:v3],
        v4,
        !v5))
  {
    __int16 v16 = 0LL;
    goto LABEL_10;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
  if ([v6 length])
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSKeyedUnarchiver, v7);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v11);
    id v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v10,  v12,  objc_opt_class(&OBJC_CLASS___NSNumber, v13),  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v15,  v6,  0LL));

    if (!v16) {
      goto LABEL_8;
    }
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSCachedURLResponse, v17);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
      goto LABEL_8;
    }
  }

  __int16 v16 = 0LL;
LABEL_8:

LABEL_10:
  return v16;
}

- (void).cxx_destruct
{
}

+ (id)sharedCloudContentTasteResponseCacheManager
{
  if (qword_1001DB708 != -1) {
    dispatch_once(&qword_1001DB708, &stru_1001A47C0);
  }
  return (id)qword_1001DB700;
}

@end