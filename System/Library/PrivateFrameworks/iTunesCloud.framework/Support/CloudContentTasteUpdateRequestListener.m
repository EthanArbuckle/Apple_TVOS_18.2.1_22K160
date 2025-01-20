@interface CloudContentTasteUpdateRequestListener
+ (id)sharedContentTasteRequestListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CloudContentTasteUpdateRequestListener)init;
- (id)_adjustedContentTasteForLibraryEndpoint:(int64_t)a3;
- (id)_contentTasteRequestHandlerForConfiguration:(id)a3 outError:(id *)a4;
- (id)_init;
- (void)_cancelAllContentTasteRequestHandlers;
- (void)_postContentTasteChangesForPendingItems;
- (void)_updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)handleContentTasteChangedNotification;
- (void)handleMusicAppInstalled;
- (void)handleMusicAppRemoved;
- (void)removeContentTasteOperationsForConnectionConfiguration:(id)a3;
- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8;
- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8;
- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7 withCompletionHandler:(id)a8;
- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 persistentID:(int64_t)a6 timeStamp:(id)a7 configuration:(id)a8 withCompletionHandler:(id)a9;
- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8;
- (void)start;
- (void)stop;
- (void)updateContentTasteForConnectionConfiguration:(id)a3 invalidateLocalCache:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)updateContentTasteForMediaItemsAndInvalidateLocalCache:(BOOL)a3 configuration:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CloudContentTasteUpdateRequestListener

- (CloudContentTasteUpdateRequestListener)init
{
  return 0LL;
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CloudContentTasteUpdateRequestListener;
  v2 = -[CloudContentTasteUpdateRequestListener init](&v12, "init");
  if (v2)
  {
    v2->_musicAppIsInstalled = ICSystemApplicationIsInstalled(0LL);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.iTunesCloud.CloudContentTasteUpdateRequestListener.accessQueue", 0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create( "com.apple.amp.iTunesCloud.CloudContentTasteUpdateRequestListener.callbackQueue",  &_dispatch_queue_attr_concurrent);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    contentTasteRequestHandlerToDSIDMap = v2->_contentTasteRequestHandlerToDSIDMap;
    v2->_contentTasteRequestHandlerToDSIDMap = (NSMutableDictionary *)v7;

    v9 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.itunescloud.contenttaste");
    listener = v2->_listener;
    v2->_listener = v9;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
  }

  return v2;
}

- (void)start
{
  dispatch_queue_t v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ....", buf, 0xCu);
  }

  -[NSXPCListener resume](self->_listener, "resume");
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100110DB4;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)stop
{
  dispatch_queue_t v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping ....", buf, 0xCu);
  }

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100110DAC;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)handleMusicAppInstalled
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100110CDC;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)handleMusicAppRemoved
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100110C10;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)handleContentTasteChangedNotification
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100110B4C;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)updateContentTasteForConnectionConfiguration:(id)a3 invalidateLocalCache:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100110914;
  block[3] = &unk_1001A6C08;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(accessQueue, block);
}

- (void)removeContentTasteOperationsForConnectionConfiguration:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001106E0;
  block[3] = &unk_1001A6C30;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
}

- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7 withCompletionHandler:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CloudContentTasteUpdateRequestListener setContentTaste:forMediaItem:storeIdentifier:persistentID:timeStamp:configuration:withCompletionHandler:]( self,  "setContentTaste:forMediaItem:storeIdentifier:persistentID:timeStamp:configuration:withCompletionHandler:",  a3,  a4,  a5,  0LL,  v15,  v14,  v13);
}

- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 persistentID:(int64_t)a6 timeStamp:(id)a7 configuration:(id)a8 withCompletionHandler:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10010FCC0;
  v22[3] = &unk_1001A6CA8;
  int64_t v26 = a4;
  int64_t v27 = a5;
  v22[4] = self;
  id v23 = v16;
  id v24 = v15;
  id v25 = v17;
  int64_t v28 = a3;
  int64_t v29 = a6;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  dispatch_async(accessQueue, v22);
}

- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CloudContentTasteUpdateRequestListener setContentTaste:forPlaylistGlobalID:persistentID:timeStamp:configuration:withCompletionHandler:]( self,  "setContentTaste:forPlaylistGlobalID:persistentID:timeStamp:configuration:withCompletionHandler:",  a3,  v12,  0LL,  v13,  v11,  v10);
}

- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010F470;
  block[3] = &unk_1001A6CF8;
  void block[4] = self;
  id v24 = v14;
  id v27 = v17;
  int64_t v28 = a3;
  int64_t v29 = a5;
  id v25 = v16;
  id v26 = v15;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  id v22 = v14;
  dispatch_async(accessQueue, block);
}

- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CloudContentTasteUpdateRequestListener setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:]( self,  "setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:",  a3,  3LL,  a4,  v11,  v12,  v10);
}

- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010EC64;
  block[3] = &unk_1001A6D20;
  void block[4] = self;
  id v22 = v15;
  int64_t v25 = a4;
  int64_t v26 = a3;
  id v23 = v14;
  id v24 = v16;
  int64_t v27 = a5;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  dispatch_async(accessQueue, block);
}

- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CloudContentTasteUpdateRequestListener setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:]( self,  "setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:",  a3,  8LL,  a4,  v11,  v12,  v10);
}

- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010DFF4;
  block[3] = &unk_1001A6D20;
  void block[4] = self;
  id v22 = v15;
  int64_t v25 = a4;
  int64_t v26 = a3;
  id v23 = v14;
  id v24 = v16;
  int64_t v27 = a5;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  dispatch_async(accessQueue, block);
}

- (void)updateContentTasteForMediaItemsAndInvalidateLocalCache:(BOOL)a3 configuration:(id)a4 withCompletionHandler:(id)a5
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  BOOL v7 = sub_1000B1A6C(v5, @"com.apple.itunesstored.private");
  if (v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICUpdateContentTasteRequestListener));
    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10010DE74;
    v13[3] = &unk_1001A6D98;
    v13[4] = self;
    unsigned int v14 = v6;
    [v5 setInterruptionHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10010DF34;
    v11[3] = &unk_1001A6D98;
    v11[4] = self;
    unsigned int v12 = v6;
    [v5 setInvalidationHandler:v11];
    [v5 resume];
    v9 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = self;
      __int16 v17 = 1024;
      unsigned int v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ got connection request from pid %i",  buf,  0x12u);
    }
  }

  else
  {
    id v8 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = self;
      __int16 v17 = 1024;
      unsigned int v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@ pid %i is not entitled to connect to content taste update service",  buf,  0x12u);
    }
  }

  return v7;
}

- (id)_contentTasteRequestHandlerForConfiguration:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentityStore]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
  id v14 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 DSIDForUserIdentity:v8 outError:&v14]);
  id v10 = v14;

  if (v9 && !v10 && [v9 longLongValue])
  {
    id v11 = (ICContentTasteRequestHandler *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_contentTasteRequestHandlerToDSIDMap,  "objectForKey:",  v9));
    if (!v11)
    {
      id v11 = -[ICContentTasteRequestHandler initWithConfiguration:]( objc_alloc(&OBJC_CLASS___ICContentTasteRequestHandler),  "initWithConfiguration:",  v6);
      -[NSMutableDictionary setObject:forKey:](self->_contentTasteRequestHandlerToDSIDMap, "setObject:forKey:", v11, v9);
    }
  }

  else
  {
    unsigned int v12 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v16 = self;
      __int16 v17 = 2048;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@ Could not get DSID from configuration=%p, error=%{public}@",  buf,  0x20u);
    }

    id v11 = 0LL;
    if (a4) {
      *a4 = v10;
    }
  }

  return v11;
}

- (id)_adjustedContentTasteForLibraryEndpoint:(int64_t)a3
{
  if (a3 == 1)
  {
    int64_t v3 = 2LL;
  }

  else
  {
    int64_t v3 = a3;
    if (a3)
    {
      id v5 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138543618;
        id v8 = self;
        __int16 v9 = 1024;
        int v10 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ Unsupported content taste value=%d to send to library APIs",  (uint8_t *)&v7,  0x12u);
      }
    }

    else
    {
      int64_t v3 = 1LL;
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v3));
}

- (void)_updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  id v13 = a5;
  dispatch_assert_queue_V2(accessQueue);
  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CloudContentTasteUpdateRequestListener _contentTasteRequestHandlerForConfiguration:outError:]( self,  "_contentTasteRequestHandlerForConfiguration:outError:",  v13,  &v20));

  id v15 = v20;
  if (v15 || !v14)
  {
    if (v11)
    {
      callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10010DE64;
      block[3] = &unk_1001A6BB8;
      id v19 = v11;
      id v18 = v15;
      dispatch_async(callbackQueue, block);
    }
  }

  else
  {
    [v14 updateContentTasteForItem:v10 invalidatingLocalCache:v8 completionHandler:v11];
  }
}

- (void)_cancelAllContentTasteRequestHandlers
{
  contentTasteRequestHandlerToDSIDMap = self->_contentTasteRequestHandlerToDSIDMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10010DD64;
  v4[3] = &unk_1001A6DC0;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( contentTasteRequestHandlerToDSIDMap,  "enumerateKeysAndObjectsUsingBlock:",  v4);
}

- (void)_postContentTasteChangesForPendingItems
{
  if (self->_musicAppIsInstalled)
  {
    if (MSVDeviceSupportsMultipleLibraries(v3))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentityStore defaultIdentityStore]( &OBJC_CLASS___ICUserIdentityStore,  "defaultIdentityStore"));
      id v22 = 0LL;
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentitiesForAllStoreAccountsWithError:&v22]);
      id v6 = (os_log_s *)v22;
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
      v30 = v4;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
      id v6 = 0LL;
    }

    int v7 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [v5 count];
      *(_DWORD *)buf = 138543874;
      int64_t v25 = self;
      __int16 v26 = 1024;
      unsigned int v27 = v8;
      __int16 v28 = 2114;
      int64_t v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Found %d user identities, error=%{public}@",  buf,  0x1Cu);
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13);
          id v15 = objc_alloc(&OBJC_CLASS___ICConnectionConfiguration);
          id v16 = -[ICConnectionConfiguration initWithUserIdentity:](v15, "initWithUserIdentity:", v14, (void)v18);
          id v17 =  -[CloudContentTasteUpdateRequestListener _contentTasteRequestHandlerForConfiguration:outError:]( self,  "_contentTasteRequestHandlerForConfiguration:outError:",  v16,  0LL);

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v11);
    }
  }

  else
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int64_t v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ not processing pending changes as music app is not installed",  buf,  0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedContentTasteRequestListener
{
  if (qword_1001DB898 != -1) {
    dispatch_once(&qword_1001DB898, &stru_1001A6B68);
  }
  return (id)qword_1001DB890;
}

@end