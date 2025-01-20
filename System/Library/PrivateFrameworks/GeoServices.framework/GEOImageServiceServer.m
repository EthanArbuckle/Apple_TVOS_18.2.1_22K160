@interface GEOImageServiceServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOImageServiceServer)initWithDaemon:(id)a3;
- (void)calculateFreeableWithRequest:(id)a3;
- (void)cancelImageServiceRequestWithRequest:(id)a3;
- (void)purgeDiskCacheWithRequest:(id)a3;
- (void)startImageServiceRequestWithRequest:(id)a3;
@end

@implementation GEOImageServiceServer

+ (id)identifier
{
  return @"ImageService";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 > 2506)
  {
    if (v13 == 2563)
    {
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___GEOImageServiceRequestSimple, v14, v15);
      id v32 = sub_100012270(@"ImageService", v10, v11, v31, v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v22 = v33;
      BOOL v16 = v33 != 0LL;
      if (v33)
      {
        [v33 setSignpostId:a6];
        -[GEOImageServiceServer cancelImageServiceRequestWithRequest:]( self,  "cancelImageServiceRequestWithRequest:",  v22);
        goto LABEL_16;
      }

      goto LABEL_17;
    }

    if (v13 == 2507)
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___GEOImageServiceRequestSimple, v14, v15);
      id v24 = sub_100012270(@"ImageService", v10, v11, v23, v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v22 = v25;
      BOOL v16 = v25 != 0LL;
      if (v25)
      {
        [v25 setSignpostId:a6];
        -[GEOImageServiceServer startImageServiceRequestWithRequest:](self, "startImageServiceRequestWithRequest:", v22);
        goto LABEL_16;
      }

- (GEOImageServiceServer)initWithDaemon:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GEOImageServiceServer;
  v3 = -[GEOImageServiceServer initWithDaemon:](&v20, "initWithDaemon:", a3);
  if (v3)
  {
    uint64_t v4 = geo_isolater_create("com.apple.geod.ImageServiceServer");
    isolater = v3->_isolater;
    v3->_isolater = (geo_isolater *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    requestsConsultingPersistence = v3->_requestsConsultingPersistence;
    v3->_requestsConsultingPersistence = (NSMutableArray *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  0LL,  512LL));
    originalRequestToPendingRequest = v3->_originalRequestToPendingRequest;
    v3->_originalRequestToPendingRequest = (NSMapTable *)v8;

    id v10 = objc_alloc(&OBJC_CLASS___GEOImageServicePersistence);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths urlFor:](&OBJC_CLASS___GEOFilePaths, "urlFor:", 26LL));
    id v12 = -[GEOImageServicePersistence initWithDBFileURL:](v10, "initWithDBFileURL:", v11);
    persistence = v3->_persistence;
    v3->_persistence = v12;

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEODiskSpaceManager sharedManager](&OBJC_CLASS___GEODiskSpaceManager, "sharedManager"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 diskSpaceProviderForIdentifier:@"com.apple.geod.ImageService"]);

    uint64_t v17 = objc_opt_class(&OBJC_CLASS___GEOImageServiceDiskSpaceProvider, v16);
    if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0) {
      [v15 setPersistence:v3->_persistence];
    }
    uint64_t v18 = v3;
  }

  return v3;
}

- (void)startImageServiceRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOImageServiceReplySimple alloc] initWithRequest:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);

  if (v6)
  {
    v30 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 imageIds]);
    id v34 = [v8 mutableCopy];

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    unsigned int v33 = [v9 width];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    id v11 = [v10 height];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    isolater = self->_isolater;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10001EA48;
    v48[3] = &unk_100059520;
    v48[4] = self;
    id v31 = v4;
    id v14 = v4;
    id v49 = v14;
    geo_isolate_sync_data(isolater, v48);
    uint64_t v15 = dispatch_group_create();
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v29 = v14;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 request]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 imageIds]);

    id obj = v17;
    id v18 = [v17 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        v21 = 0LL;
        do
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)v21);
          dispatch_group_enter(v15);
          persistence = self->_persistence;
          global_queue = (void *)geo_get_global_queue(21LL);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472LL;
          v40[2] = sub_10001EA94;
          v40[3] = &unk_100059DA0;
          v40[4] = v22;
          v40[5] = self;
          id v41 = v34;
          id v42 = v12;
          v43 = v15;
          -[GEOImageServicePersistence getDataForIdentifier:width:height:callbackQueue:callback:]( persistence,  "getDataForIdentifier:width:height:callbackQueue:callback:",  v22,  v33,  v11,  global_queue,  v40);

          v21 = (char *)v21 + 1;
        }

        while (v19 != v21);
        id v19 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      }

      while (v19);
    }

    v25 = (dispatch_queue_s *)geo_get_global_queue(21LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001EBAC;
    block[3] = &unk_100059E40;
    block[4] = self;
    id v36 = v29;
    id v37 = v34;
    id v38 = v12;
    id v5 = v30;
    id v39 = v30;
    id v26 = v12;
    id v27 = v34;
    dispatch_group_notify(v15, v25, block);

    id v4 = v31;
  }

  else
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -10LL));
    [v5 setError:v28];

    [v5 send];
  }
}

- (void)cancelImageServiceRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOImageServiceReplySimple alloc] initWithRequest:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);

  if (v6)
  {
    uint64_t v13 = 0LL;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    uint64_t v16 = sub_10001ED38;
    uint64_t v17 = sub_10001ED48;
    id v18 = 0LL;
    isolater = self->_isolater;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001F728;
    v10[3] = &unk_100059070;
    id v12 = &v13;
    v10[4] = self;
    id v11 = v4;
    geo_isolate_sync_data(isolater, v10);
    if (v14[5])
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEOImageServiceServerRequester sharedRequester]( &OBJC_CLASS___GEOImageServiceServerRequester,  "sharedRequester"));
      [v8 cancelSimpleImageServiceRequest:v14[5]];
    }

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -10LL));
    [v5 setError:v9];

    [v5 send];
  }
}

- (void)calculateFreeableWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOImageServiceCalculateFreeableSizeReply alloc] initWithRequest:v4];

  objc_msgSend( v5,  "setSize:",  -[GEOImageServicePersistence calculateFreeableSize](self->_persistence, "calculateFreeableSize"));
  [v5 send];
}

- (void)purgeDiskCacheWithRequest:(id)a3
{
  id v4 = a3;
  id v7 = [[GEOImageServicePurgeCacheToSizeReply alloc] initWithRequest:v4];
  persistence = self->_persistence;
  id v6 = [v4 targetSize];

  objc_msgSend(v7, "setAmountDeleted:", -[GEOImageServicePersistence shrinkToSize:](persistence, "shrinkToSize:", v6));
  [v7 send];
}

- (void).cxx_destruct
{
}

@end