@interface TVPScreenSaverService
- (PHPhotoLibrary)photoLibrary;
- (TVPScreenSaverService)init;
- (void)_fetchAssetsForCollection:(id)a3 options:(id)a4 queue:(id)a5 remotePhotoServer:(id)a6 responseBlock:(id)a7;
- (void)_fetchPhotoCollectionsWithOptions:(id)a3 remotePhotoServer:(id)a4 responseBlock:(id)a5;
- (void)photoAssetsWithOptions:(id)a3 remotePhotoServer:(id)a4 responseBlock:(id)a5;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation TVPScreenSaverService

- (TVPScreenSaverService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPScreenSaverService;
  v2 = -[TVPScreenSaverService init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary"));
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v3;
  }

  return v2;
}

- (void)photoAssetsWithOptions:(id)a3 remotePhotoServer:(id)a4 responseBlock:(id)a5
{
}

- (void)_fetchPhotoCollectionsWithOptions:(id)a3 remotePhotoServer:(id)a4 responseBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    sub_100079A20();
  }
  v11 = (void (**)(void, void, void))v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentScreenSaverInfo]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CollectionID"]);

  uint64_t v15 = PLUIGetLog();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Fetching photo collection for ID '%{public}@'",  buf,  0xCu);
  }

  if (!v14)
  {
LABEL_18:
    uint64_t v31 = PLUIGetLog();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Photo collection for ID '%{public}@' is nil",  buf,  0xCu);
    }

    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    v34 = @"Failed to retrieve photo collection";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVPScreenSaverErrorDomain",  0LL,  v18));
    ((void (**)(void, void *, void *))v11)[2](v11, &__NSArray0__struct, v26);
    goto LABEL_21;
  }

  if ([v14 isEqualToString:@"ActivityFeedCollection"])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedAlbumsActivityFeedCache sharedInstance]( &OBJC_CLASS___TVPSharedAlbumsActivityFeedCache,  "sharedInstance"));
    [v17 loadCacheIfNeeded];
    else {
      v18 = 0LL;
    }

LABEL_14:
    if (v18)
    {
      uint64_t v28 = PLUIGetLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Photo collection for ID '%{public}@' was fetched, and is being sent back",  buf,  0xCu);
      }

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v26 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      -[TVPScreenSaverService _fetchAssetsForCollection:options:queue:remotePhotoServer:responseBlock:]( self,  "_fetchAssetsForCollection:options:queue:remotePhotoServer:responseBlock:",  v18,  v8,  v26,  v9,  v11);
      goto LABEL_21;
    }

    goto LABEL_18;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverService photoLibrary](self, "photoLibrary"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 librarySpecificFetchOptions]);

  v37 = v14;
  uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithLocalIdentifiers:options:",  v21,  v20));

  v18 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
  LOBYTE(v21) = [v18 isSlideshowCompatible];

  if ((v21 & 1) != 0) {
    goto LABEL_14;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v23 setDefaultScreenSaver];

  uint64_t v24 = PLUIGetLog();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Photo collection for ID '%{public}@' is not slideshow compatible",  buf,  0xCu);
  }

  NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
  v36 = @"Photo collection is not slideshow compatible";
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVPScreenSaverErrorDomain",  0LL,  v26));
  ((void (**)(void, void *, void *))v11)[2](v11, &__NSArray0__struct, v27);

LABEL_21:
}

- (void)_fetchAssetsForCollection:(id)a3 options:(id)a4 queue:(id)a5 remotePhotoServer:(id)a6 responseBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  v13 = (dispatch_queue_s *)a5;
  id v14 = a6;
  id v15 = a7;
  if (!v15) {
    sub_100079A48();
  }
  v16 = (void (**)(void, void, void))v15;
  if ([v11 assetCollectionType] == (id)4) {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchCuratedAssetsInAssetCollection:]( &OBJC_CLASS___PHAsset,  "fetchCuratedAssetsInAssetCollection:",  v11));
  }
  else {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v11,  0LL));
  }
  v18 = v17;
  if ([v17 count])
  {
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x2020000000LL;
    v27[3] = 0LL;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000951C;
    v21[3] = &unk_1000C9AA0;
    id v22 = v18;
    id v23 = v12;
    v26 = v27;
    v25 = v16;
    id v24 = v14;
    dispatch_async(v13, v21);

    _Block_object_dispose(v27, 8);
  }

  else
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    v29 = @"Collection contained zero assets";
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVPScreenSaverErrorDomain",  0LL,  v19));
    ((void (**)(void, void *, void *))v16)[2](v16, &__NSArray0__struct, v20);

    [v14 didFinishFetchingPhotoAssets];
  }
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