@interface TVHScreenSaverProviderService
+ (id)new;
- (NSMutableArray)inflightRequests;
- (OS_dispatch_queue_serial)processingQueue;
- (TVHKMediaLibrariesManager)mediaLibrariesManager;
- (TVHScreenSaverProviderService)init;
- (TVHScreenSaverProviderService)initWithMediaLibrariesManager:(id)a3;
- (TVPhotoServerInterface)remotePhotoServerInterface;
- (void)_startPhotoAssetsRequestWithScreenSaverDescriptor:(id)a3 photoServiceResponseBlock:(id)a4;
- (void)photoAssetsWithOptions:(id)a3 responseBlock:(id)a4;
- (void)registerRemotePhotoServer:(id)a3;
- (void)setRemotePhotoServerInterface:(id)a3;
@end

@implementation TVHScreenSaverProviderService

+ (id)new
{
  return 0LL;
}

- (TVHScreenSaverProviderService)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHScreenSaverProviderService)initWithMediaLibrariesManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHScreenSaverProviderService;
  v6 = -[TVHScreenSaverProviderService init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrariesManager, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    inflightRequests = v7->_inflightRequests;
    v7->_inflightRequests = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.TVHomeSharing.TVHScreenSaverProviderService.processingQueue", 0LL);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue_serial *)v10;
  }

  return v7;
}

- (void)photoAssetsWithOptions:(id)a3 responseBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10007A008();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverProviderService: Recieved request for photo assets",  (uint8_t *)buf,  2u);
  }

  if (v7)
  {
    dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 currentScreenSaverInfo]);

    v12 = -[TVHScreenSaverDescriptor initWithSerializedDictionary:]( objc_alloc(&OBJC_CLASS___TVHScreenSaverDescriptor),  "initWithSerializedDictionary:",  v11);
    objc_initWeak(buf, self);
    objc_super v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderService processingQueue](self, "processingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000640A4;
    block[3] = &unk_1000FED10;
    objc_copyWeak(&v19, buf);
    v17 = v12;
    id v18 = v7;
    v14 = v12;
    dispatch_async(v13, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }

  else
  {
    id v15 = sub_10007A008();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009CA10(v11);
    }
  }
}

- (void)registerRemotePhotoServer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderService processingQueue](self, "processingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000641BC;
  block[3] = &unk_1000FDB38;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_startPhotoAssetsRequestWithScreenSaverDescriptor:(id)a3 photoServiceResponseBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderService processingQueue](self, "processingQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc(&OBJC_CLASS___TVHScreenSaverPhotoAssetsRequest);
  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderService mediaLibrariesManager](self, "mediaLibrariesManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderService processingQueue](self, "processingQueue"));
  v12 = -[TVHScreenSaverPhotoAssetsRequest initWithScreenSaverDescriptor:mediaLibrariesManager:processingQueue:]( v9,  "initWithScreenSaverDescriptor:mediaLibrariesManager:processingQueue:",  v6,  v10,  v11);

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverProviderService inflightRequests](self, "inflightRequests"));
  [v13 addObject:v12];

  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006437C;
  v16[3] = &unk_1000FED38;
  objc_copyWeak(&v19, &location);
  v14 = v12;
  v17 = v14;
  id v15 = v7;
  id v18 = v15;
  -[TVHScreenSaverPhotoAssetsRequest startWithResponseHandler:](v14, "startWithResponseHandler:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (TVHKMediaLibrariesManager)mediaLibrariesManager
{
  return self->_mediaLibrariesManager;
}

- (NSMutableArray)inflightRequests
{
  return self->_inflightRequests;
}

- (OS_dispatch_queue_serial)processingQueue
{
  return self->_processingQueue;
}

- (TVPhotoServerInterface)remotePhotoServerInterface
{
  return self->_remotePhotoServerInterface;
}

- (void)setRemotePhotoServerInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end