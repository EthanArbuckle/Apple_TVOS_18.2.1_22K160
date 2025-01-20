@interface TVHScreenSaverProviderMediaEntitiesRequest
- (TVHKAsynchronousWorkToken)fetchWorkToken;
- (TVHKMediaEntityIdentifier)mediaEntityCollectionIdentifier;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHKStateMachine)stateMachine;
- (TVHScreenSaverProviderMediaEntitiesRequest)initWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaEntityCollectionIdentifier:(id)a5;
- (id)completionBlock;
- (unint64_t)mediaCategoryType;
- (void)_completeWithFetchResponse:(id)a3 error:(id)a4;
- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)_setupStateMachine;
- (void)_startFetchingMediaEntities;
- (void)_startObservingMediaLibrary:(id)a3;
- (void)_stopObservingMediaLibrary:(id)a3;
- (void)dealloc;
- (void)fetchMediaEntitiesWithCompletionBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setFetchWorkToken:(id)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation TVHScreenSaverProviderMediaEntitiesRequest

- (TVHScreenSaverProviderMediaEntitiesRequest)initWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaEntityCollectionIdentifier:(id)a5
{
  v8 = (TVHKMediaLibrary *)a3;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVHScreenSaverProviderMediaEntitiesRequest;
  v10 = -[TVHScreenSaverProviderMediaEntitiesRequest init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    v10->_mediaLibrary = v8;
    v10->_mediaCategoryType = a4;
    objc_storeStrong((id *)&v10->_mediaEntityCollectionIdentifier, a5);
    v12 = objc_alloc(&OBJC_CLASS___TVHKStateMachine);
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = -[TVHKStateMachine initWithName:initialState:mode:]( v12,  "initWithName:initialState:mode:",  v15,  @"Not Started",  0LL);
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = v16;

    -[TVHScreenSaverProviderMediaEntitiesRequest _setupStateMachine](v11, "_setupStateMachine");
    -[TVHScreenSaverProviderMediaEntitiesRequest _startObservingMediaLibrary:]( v11,  "_startObservingMediaLibrary:",  v11->_mediaLibrary);
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHScreenSaverProviderMediaEntitiesRequest;
  -[TVHScreenSaverProviderMediaEntitiesRequest dealloc](&v3, "dealloc");
}

- (void)fetchMediaEntitiesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B960;
  block[3] = &unk_1000FD2E8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_numberForKey:", TVHKMediaLibraryConnectionStateUserInfoKeyToState));
  id v6 = [v5 unsignedIntegerValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderMediaEntitiesRequest stateMachine](self, "stateMachine"));
  v10 = @"ConnectionState";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
  v11 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  [v7 postEvent:@"Media Server Connection State Did Change" withContext:0 userInfo:v9];
}

- (void)_setupStateMachine
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderMediaEntitiesRequest stateMachine](self, "stateMachine"));
  [v3 setShouldAcceptEvents:1];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderMediaEntitiesRequest stateMachine](self, "stateMachine"));
  id v4 = sub_10007A008();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v6 setLogObject:v5];
}

- (void)_registerStateMachineHandlers
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderMediaEntitiesRequest stateMachine](self, "stateMachine"));
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001BD78;
  v12[3] = &unk_1000FD310;
  objc_copyWeak(&v13, &location);
  [v3 registerHandlerForEvent:@"Start" onState:@"Not Started" withBlock:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001BE54;
  v9[3] = &unk_1000FD338;
  objc_copyWeak(&v11, &location);
  id v4 = v3;
  id v10 = v4;
  [v4 registerHandlerForEvent:@"Media Server Connection State Did Change" onState:@"Connecting Media Server" withBlock:v9];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001BF5C;
  v6[3] = &unk_1000FD388;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [v5 registerHandlerForEvent:@"Media Entities Fetch Did Complete" onState:@"Executing Fetch Request" withBlock:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_startObservingMediaLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleMediaLibraryConnectionStateDidChangeNotification:" name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];
}

- (void)_stopObservingMediaLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];
}

- (void)_startFetchingMediaEntities
{
  unint64_t v3 = -[TVHScreenSaverProviderMediaEntitiesRequest mediaCategoryType](self, "mediaCategoryType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHScreenSaverProviderMediaEntitiesRequest mediaEntityCollectionIdentifier]( self,  "mediaEntityCollectionIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_imagePreviewFetchRequestWithMediaCategoryType:photoPlaylistIdentifier:maxMediaEntities:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_imagePreviewFetchRequestWithMediaCategoryType:photoPlaylistIdentifier:maxMediaEntities:",  v3,  v4,  500LL));

  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_10001C418;
  v24 = sub_10001C428;
  id v25 = 0LL;
  id v6 = sub_10007A008();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverProviderMediaEntitiesRequest: Starting fetch: %@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderMediaEntitiesRequest mediaLibrary](self, "mediaLibrary"));
  v26 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10001C430;
  v16 = &unk_1000FD3D8;
  objc_copyWeak(&v19, (id *)buf);
  id v10 = v5;
  id v17 = v10;
  v18 = &v20;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 enqueueFetchRequests:v9 completionHandler:&v13]);
  v12 = (void *)v21[5];
  v21[5] = v11;

  -[TVHScreenSaverProviderMediaEntitiesRequest setFetchWorkToken:]( self,  "setFetchWorkToken:",  v21[5],  v13,  v14,  v15,  v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v20, 8);
}

- (void)_completeWithFetchResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderMediaEntitiesRequest fetchWorkToken](self, "fetchWorkToken"));
  [v8 cancel];

  -[TVHScreenSaverProviderMediaEntitiesRequest setFetchWorkToken:](self, "setFetchWorkToken:", 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderMediaEntitiesRequest completionBlock](self, "completionBlock"));
  id v10 = [v9 copy];

  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C7B0;
    block[3] = &unk_1000FD400;
    id v16 = v10;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v12, block);
  }
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (unint64_t)mediaCategoryType
{
  return self->_mediaCategoryType;
}

- (TVHKMediaEntityIdentifier)mediaEntityCollectionIdentifier
{
  return self->_mediaEntityCollectionIdentifier;
}

- (TVHKStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (TVHKAsynchronousWorkToken)fetchWorkToken
{
  return self->_fetchWorkToken;
}

- (void)setFetchWorkToken:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end