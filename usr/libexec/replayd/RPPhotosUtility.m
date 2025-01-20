@interface RPPhotosUtility
+ (BOOL)showAlertFailedSaveToPhotosWithError:(id)a3;
+ (id)fetchLastSavedVideoAssetInPhotos;
+ (void)exportVideoToPhotosAsynchronously:(id)a3 mixAudioTracks:(BOOL)a4 completionHandler:(id)a5;
+ (void)exportVideoToPhotosLibrary:(id)a3 completionHandler:(id)a4;
@end

@implementation RPPhotosUtility

+ (void)exportVideoToPhotosLibrary:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 31;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  uint64_t v20 = 0LL;
  v7 = -[AVURLAsset initWithURL:options:](objc_alloc(&OBJC_CLASS___AVURLAsset), "initWithURL:options:", v5, 0LL);
  v8 = v7;
  if (v7)
  {
    -[AVURLAsset duration](v7, "duration");
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(Float64 *)(*(void *)&buf[8] + 24LL) = Seconds;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100038418;
  v14[3] = &unk_100071CE8;
  id v16 = v6;
  v17 = buf;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v11, v14);

  _Block_object_dispose(buf, 8);
}

+ (void)exportVideoToPhotosAsynchronously:(id)a3 mixAudioTracks:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000388F0;
    v9[3] = &unk_100071230;
    id v10 = v7;
    id v11 = v8;
    +[RPAudioMixUtility mixAudioForMovie:withCompletionHandler:]( &OBJC_CLASS___RPAudioMixUtility,  "mixAudioForMovie:withCompletionHandler:",  v10,  v9);
  }

  else
  {
    +[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]( &OBJC_CLASS___RPPhotosUtility,  "exportVideoToPhotosLibrary:completionHandler:",  v7,  v8);
  }
}

+ (BOOL)showAlertFailedSaveToPhotosWithError:(id)a3
{
  id v3 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "+[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]";
    __int16 v7 = 1024;
    int v8 = 115;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v5,  0x12u);
  }

  return 1;
}

+ (id)fetchLastSavedVideoAssetInPhotos
{
  v2 = objc_alloc_init(&OBJC_CLASS___PHFetchOptions);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  1LL));
  int v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  -[PHFetchOptions setSortDescriptors:](v2, "setSortDescriptors:", v4);

  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithMediaType:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithMediaType:options:",  2LL,  v2));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);

  return v6;
}

@end