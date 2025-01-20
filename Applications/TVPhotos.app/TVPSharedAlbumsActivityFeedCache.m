@interface TVPSharedAlbumsActivityFeedCache
+ (id)sharedInstance;
- (BOOL)hasFeedInfo;
- (BOOL)loadCache;
- (NSArray)activityPhotoBatches;
- (NSArray)sortedMostRecentlyModifiedAssets;
- (PHAssetCollection)activityFeedCollection;
- (PHPhotoLibrary)photoLibrary;
- (TVPSharedAlbumsActivityFeedCache)init;
- (void)loadCacheIfNeeded;
- (void)setActivityFeedCollection:(id)a3;
- (void)setActivityPhotoBatches:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setSortedMostRecentlyModifiedAssets:(id)a3;
@end

@implementation TVPSharedAlbumsActivityFeedCache

- (TVPSharedAlbumsActivityFeedCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPSharedAlbumsActivityFeedCache;
  v2 = -[TVPSharedAlbumsActivityFeedCache init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary"));
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v3;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_100102E88 != -1) {
    dispatch_once(&qword_100102E88, &stru_1000C9B80);
  }
  return (id)qword_100102E80;
}

- (BOOL)hasFeedInfo
{
  uint64_t Log = PLPhotoSharingGetLog(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    activityFeedCollection = self->_activityFeedCollection;
    NSUInteger v6 = -[NSArray count](self->_activityPhotoBatches, "count");
    NSUInteger v7 = -[NSArray count](self->_sortedMostRecentlyModifiedAssets, "count");
    int v10 = 138543874;
    v11 = activityFeedCollection;
    __int16 v12 = 2050;
    NSUInteger v13 = v6;
    __int16 v14 = 2050;
    NSUInteger v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Activity feed cache 'hasFeedInfo' (activityFeedCollection: %{public}@, activityPhotoBatches: %{public}lu, sortedMo stRecentlyModifiedAssets: %{public}lu)",  (uint8_t *)&v10,  0x20u);
  }

  if (self->_activityFeedCollection)
  {
    NSUInteger v8 = -[NSArray count](self->_activityPhotoBatches, "count");
    if (v8) {
      LOBYTE(v8) = -[NSArray count](self->_sortedMostRecentlyModifiedAssets, "count") != 0;
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)loadCacheIfNeeded
{
  if (!-[TVPSharedAlbumsActivityFeedCache hasFeedInfo](self, "hasFeedInfo")) {
    -[TVPSharedAlbumsActivityFeedCache loadCache](self, "loadCache");
  }
}

- (BOOL)loadCache
{
  uint64_t Log = PLPhotoSharingGetLog(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = +[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Loading shared albums activity feed cache (called from main thread: %d)",  buf,  8u);
  }

  *(void *)buf = 0LL;
  v26 = buf;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedAlbumsActivityFeedCache photoLibrary](self, "photoLibrary"));
  NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue([v5 librarySpecificFetchOptions]);

  [v6 setIncludeAssetSourceTypes:2];
  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v6));
  id v8 = [v7 count];
  if (v8)
  {
    uint64_t v10 = PLPhotoSharingGetLog(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 134349056;
      id v24 = [v7 count];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Preparing cache's asset collection with fetched assets (count: %{public}lu)",  v23,  0xCu);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000CB48;
    v19[3] = &unk_1000C9BA8;
    v20 = v7;
    v21 = self;
    v22 = buf;
    __int16 v12 = objc_retainBlock(v19);
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      ((void (*)(void *))v12[2])(v12);
    }

    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000CC48;
      v17[3] = &unk_1000C95F0;
      v18 = v12;
      dispatch_sync(&_dispatch_main_q, v17);
    }

    __int16 v14 = v20;
  }

  else
  {
    uint64_t v13 = PLPhotoSharingGetLog(0LL, v9);
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No assets were fetched to store in the activity feed cache.",  v23,  2u);
    }
  }

  BOOL v15 = v26[24] != 0;
  _Block_object_dispose(buf, 8);
  return v15;
}

- (PHAssetCollection)activityFeedCollection
{
  return self->_activityFeedCollection;
}

- (void)setActivityFeedCollection:(id)a3
{
}

- (NSArray)activityPhotoBatches
{
  return self->_activityPhotoBatches;
}

- (void)setActivityPhotoBatches:(id)a3
{
}

- (NSArray)sortedMostRecentlyModifiedAssets
{
  return self->_sortedMostRecentlyModifiedAssets;
}

- (void)setSortedMostRecentlyModifiedAssets:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end