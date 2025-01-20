@interface TVHScreenSaverPhotoAssetsRequest
+ (id)_photoAssetsFromMediaEntities:(id)a3 mediaLibrary:(id)a4;
+ (id)_uniqueImageMediaEntities:(id)a3;
+ (id)new;
- (BOOL)_startFetchingPhotoAssets;
- (BOOL)isFetchingPhotoAssets;
- (BOOL)isListeningForMediaLibrariesManagerNotifications;
- (BSWatchdog)mediaLibraryWatchdog;
- (OS_dispatch_queue_serial)processingQueue;
- (TVHKMediaLibrariesManager)mediaLibrariesManager;
- (TVHScreenSaverDescriptor)screenSaverDescriptor;
- (TVHScreenSaverPhotoAssetsRequest)init;
- (TVHScreenSaverPhotoAssetsRequest)initWithScreenSaverDescriptor:(id)a3 mediaLibrariesManager:(id)a4 processingQueue:(id)a5;
- (TVHScreenSaverProviderMediaEntitiesRequest)mediaEntitiesRequest;
- (id)responseHandler;
- (void)_callRequestResponseHandlerWithPhotoAssets:(id)a3 responseCount:(unint64_t)a4 finishedRequest:(BOOL)a5;
- (void)_completeRequestEarly;
- (void)_startListentingToMediaLibrariesManagerNotifications;
- (void)_stopListentingToMediaLibrariesManagerNotifications;
- (void)_stopListentingToMediaLibrariesManagerNotificationsAndInvalidateWatchdog;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFetchingPhotoAssets:(BOOL)a3;
- (void)setListeningForMediaLibrariesManagerNotifications:(BOOL)a3;
- (void)setMediaEntitiesRequest:(id)a3;
- (void)setMediaLibraryWatchdog:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)startWithResponseHandler:(id)a3;
@end

@implementation TVHScreenSaverPhotoAssetsRequest

+ (id)new
{
  return 0LL;
}

- (TVHScreenSaverPhotoAssetsRequest)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHScreenSaverPhotoAssetsRequest)initWithScreenSaverDescriptor:(id)a3 mediaLibrariesManager:(id)a4 processingQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPhotoAssetsRequest;
  v12 = -[TVHScreenSaverPhotoAssetsRequest init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_screenSaverDescriptor, a3);
    objc_storeStrong((id *)&v13->_mediaLibrariesManager, a4);
    objc_storeStrong((id *)&v13->_processingQueue, a5);
  }

  return v13;
}

- (void)dealloc
{
  if (self->_listeningForMediaLibrariesManagerNotifications) {
    -[TVHScreenSaverPhotoAssetsRequest _stopListentingToMediaLibrariesManagerNotifications]( self,  "_stopListentingToMediaLibrariesManagerNotifications");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPhotoAssetsRequest;
  -[TVHScreenSaverPhotoAssetsRequest dealloc](&v3, "dealloc");
}

- (void)startWithResponseHandler:(id)a3
{
  v4 = (void (**)(id, TVHScreenSaverPhotoAssetsResponse *))a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest responseHandler](self, "responseHandler"));

    if (v6)
    {
      id v7 = sub_10007A008();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009CC18(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      v16 = objc_alloc_init(&OBJC_CLASS___TVHScreenSaverPhotoAssetsResponse);
      v4[2](v4, v16);
    }

    else
    {
      -[TVHScreenSaverPhotoAssetsRequest setResponseHandler:](self, "setResponseHandler:", v4);
      v16 = (TVHScreenSaverPhotoAssetsResponse *)objc_claimAutoreleasedReturnValue( -[TVHScreenSaverPhotoAssetsRequest screenSaverDescriptor]( self,  "screenSaverDescriptor"));
      if (-[TVHScreenSaverPhotoAssetsResponse mediaCategoryType](v16, "mediaCategoryType"))
      {
        if (!-[TVHScreenSaverPhotoAssetsRequest _startFetchingPhotoAssets](self, "_startFetchingPhotoAssets"))
        {
          id v17 = sub_10007A008();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest screenSaverDescriptor](self, "screenSaverDescriptor"));
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 mediaServerIdentifier]);
            *(_DWORD *)buf = 138412290;
            v36 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Unable to find media library with identifier: %@. Will start listening f or media library notifications",  buf,  0xCu);
          }

          -[TVHScreenSaverPhotoAssetsRequest _startListentingToMediaLibrariesManagerNotifications]( self,  "_startListentingToMediaLibrariesManagerNotifications");
          objc_initWeak((id *)buf, self);
          v21 = objc_alloc(&OBJC_CLASS___BSWatchdog);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest processingQueue](self, "processingQueue"));
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_1000778B0;
          v33[3] = &unk_1000FD870;
          objc_copyWeak(&v34, (id *)buf);
          v23 = -[BSWatchdog initWithTimeout:queue:completion:]( v21,  "initWithTimeout:queue:completion:",  v22,  v33,  15.0);

          -[TVHScreenSaverPhotoAssetsRequest setMediaLibraryWatchdog:](self, "setMediaLibraryWatchdog:", v23);
          -[BSWatchdog start](v23, "start");

          objc_destroyWeak(&v34);
          objc_destroyWeak((id *)buf);
        }
      }

      else
      {
        id v24 = sub_10007A008();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10009CBE4(v25, v26, v27, v28, v29, v30, v31, v32);
        }

        -[TVHScreenSaverPhotoAssetsRequest _completeRequestEarly](self, "_completeRequestEarly");
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100156BF8 == a6)
  {
    id v13 = sub_10007A008();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Received KVO notification that the media libraries have changed.",  (uint8_t *)buf,  2u);
    }

    objc_initWeak(buf, self);
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest processingQueue](self, "processingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100077AB8;
    block[3] = &unk_1000FCEF8;
    objc_copyWeak(&v18, buf);
    dispatch_async(v15, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPhotoAssetsRequest;
    -[TVHScreenSaverPhotoAssetsRequest observeValueForKeyPath:ofObject:change:context:]( &v16,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_completeRequestEarly
{
}

- (void)_callRequestResponseHandlerWithPhotoAssets:(id)a3 responseCount:(unint64_t)a4 finishedRequest:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v9);

  id v13 = (void (**)(id, TVHScreenSaverPhotoAssetsResponse *))objc_claimAutoreleasedReturnValue( -[TVHScreenSaverPhotoAssetsRequest responseHandler]( self,  "responseHandler"));
  if (v5)
  {
    -[TVHScreenSaverPhotoAssetsRequest setResponseHandler:](self, "setResponseHandler:", 0LL);
    -[TVHScreenSaverPhotoAssetsRequest setFetchingPhotoAssets:](self, "setFetchingPhotoAssets:", 0LL);
  }

  id v10 = &__NSArray0__struct;
  if (v8) {
    id v10 = v8;
  }
  id v11 = v10;
  id v12 = objc_alloc_init(&OBJC_CLASS___TVHScreenSaverPhotoAssetsResponse);
  -[TVHScreenSaverPhotoAssetsResponse setResponseCount:](v12, "setResponseCount:", a4);
  -[TVHScreenSaverPhotoAssetsResponse setFinishedRequest:](v12, "setFinishedRequest:", v5);
  -[TVHScreenSaverPhotoAssetsResponse setPhotoAssets:](v12, "setPhotoAssets:", v11);

  v13[2](v13, v12);
}

- (void)_stopListentingToMediaLibrariesManagerNotificationsAndInvalidateWatchdog
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest mediaLibraryWatchdog](self, "mediaLibraryWatchdog"));
  [v3 invalidate];

  -[TVHScreenSaverPhotoAssetsRequest setMediaLibraryWatchdog:](self, "setMediaLibraryWatchdog:", 0LL);
}

- (void)_startListentingToMediaLibrariesManagerNotifications
{
  id v3 = sub_10007A008();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Will start listening to media libraries manager notifications",  v6,  2u);
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest mediaLibrariesManager](self, "mediaLibrariesManager"));
  [v5 addObserver:self forKeyPath:@"mediaLibraries" options:1 context:off_100156BF8];
  -[TVHScreenSaverPhotoAssetsRequest setListeningForMediaLibrariesManagerNotifications:]( self,  "setListeningForMediaLibrariesManagerNotifications:",  1LL);
}

- (void)_stopListentingToMediaLibrariesManagerNotifications
{
  id v3 = sub_10007A008();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Will stop listening to media libraries manager notifications",  v6,  2u);
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest mediaLibrariesManager](self, "mediaLibrariesManager"));
  [v5 removeObserver:self forKeyPath:@"mediaLibraries" context:off_100156BF8];
  -[TVHScreenSaverPhotoAssetsRequest setListeningForMediaLibrariesManagerNotifications:]( self,  "setListeningForMediaLibrariesManagerNotifications:",  0LL);
}

- (BOOL)_startFetchingPhotoAssets
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest screenSaverDescriptor](self, "screenSaverDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaServerIdentifier]);
  if (v4
    && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPhotoAssetsRequest mediaLibrariesManager](self, "mediaLibrariesManager")),
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaLibraryForMediaServerIdentifier:v4]),
        v5,
        v6))
  {
    id v7 = [v3 mediaCategoryType];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaEntityCollectionIdentifier]);
    id v9 = sub_10007A008();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = TVHKMediaCategoryTypeLogString(v7);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      *(_DWORD *)buf = 138412802;
      v25 = v12;
      __int16 v26 = 2112;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Processing media entities request for media category %@ and collection '%@' fr om media library '%@'",  buf,  0x20u);
    }

    uint64_t v14 = -[TVHScreenSaverProviderMediaEntitiesRequest initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionIdentifier:]( objc_alloc(&OBJC_CLASS___TVHScreenSaverProviderMediaEntitiesRequest),  "initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionIdentifier:",  v6,  v7,  v8);
    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000780C0;
    v19[3] = &unk_1000FF2E8;
    objc_copyWeak(v23, (id *)buf);
    id v20 = v3;
    v23[1] = v7;
    id v15 = v8;
    id v21 = v15;
    id v16 = v6;
    id v22 = v16;
    -[TVHScreenSaverProviderMediaEntitiesRequest fetchMediaEntitiesWithCompletionBlock:]( v14,  "fetchMediaEntitiesWithCompletionBlock:",  v19);
    -[TVHScreenSaverPhotoAssetsRequest setMediaEntitiesRequest:](self, "setMediaEntitiesRequest:", v14);
    -[TVHScreenSaverPhotoAssetsRequest setFetchingPhotoAssets:](self, "setFetchingPhotoAssets:", 1LL);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);

    BOOL v17 = 1;
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (id)_photoAssetsFromMediaEntities:(id)a3 mediaLibrary:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _uniqueImageMediaEntities:v6]);
  id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v23 count]));
  context = objc_autoreleasePoolPush();
  id v7 = dispatch_group_create();
  id v8 = objc_alloc_init(&OBJC_CLASS___NSLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_fullSizeImageProxyForMediaEntities:mediaLibrary:]( &OBJC_CLASS___TVImageProxy,  "tvh_fullSizeImageProxyForMediaEntities:mediaLibrary:",  v23,  v22));
  id v10 = [v9 mutableCopy];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        dispatch_group_enter(v7);
        objc_initWeak(&location, v14);
        objc_initWeak(&from, v10);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_100078908;
        v29[3] = &unk_1000FF310;
        uint64_t v30 = v8;
        objc_copyWeak(&v33, &location);
        objc_copyWeak(&v34, &from);
        id v31 = v25;
        uint64_t v32 = v7;
        [v14 setWriteCompletionHandler:v29];
        [v14 load];

        objc_destroyWeak(&v34);
        objc_destroyWeak(&v33);

        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }

      id v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v11);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  BOOL v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v16);

  dispatch_time_t v18 = dispatch_time(0LL, 240000000000LL);
  dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak(&location, v10);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100078A28;
  handler[3] = &unk_1000FD360;
  uint64_t v27 = v8;
  v19 = v8;
  objc_copyWeak(&v28, &location);
  dispatch_source_set_event_handler(v17, handler);
  dispatch_resume(v17);
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_source_cancel(v17);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(context);

  return v25;
}

+ (id)_uniqueImageMediaEntities:(id)a3
{
  id v3 = a3;
  id v4 = sub_10007A008();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10009CD78(v3);
  }

  if (v3)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v8 = v3;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageIdentifier", (void)v20));
          if (v14)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v14));

            if (!v15)
            {
              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, v14);
              -[NSMutableArray addObject:](v6, "addObject:", v13);
            }
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v10);
    }

    id v16 = -[NSMutableArray copy](v6, "copy");
  }

  else
  {
    id v16 = 0LL;
  }

  id v17 = sub_10007A008();
  dispatch_time_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10009CCEC(v16);
  }

  return v16;
}

- (TVHScreenSaverDescriptor)screenSaverDescriptor
{
  return self->_screenSaverDescriptor;
}

- (TVHKMediaLibrariesManager)mediaLibrariesManager
{
  return self->_mediaLibrariesManager;
}

- (OS_dispatch_queue_serial)processingQueue
{
  return self->_processingQueue;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (TVHScreenSaverProviderMediaEntitiesRequest)mediaEntitiesRequest
{
  return self->_mediaEntitiesRequest;
}

- (void)setMediaEntitiesRequest:(id)a3
{
}

- (BOOL)isFetchingPhotoAssets
{
  return self->_fetchingPhotoAssets;
}

- (void)setFetchingPhotoAssets:(BOOL)a3
{
  self->_fetchingPhotoAssets = a3;
}

- (BOOL)isListeningForMediaLibrariesManagerNotifications
{
  return self->_listeningForMediaLibrariesManagerNotifications;
}

- (void)setListeningForMediaLibrariesManagerNotifications:(BOOL)a3
{
  self->_listeningForMediaLibrariesManagerNotifications = a3;
}

- (BSWatchdog)mediaLibraryWatchdog
{
  return self->_mediaLibraryWatchdog;
}

- (void)setMediaLibraryWatchdog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end