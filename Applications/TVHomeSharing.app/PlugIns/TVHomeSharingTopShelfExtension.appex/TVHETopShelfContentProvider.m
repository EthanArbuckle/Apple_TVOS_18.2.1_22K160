@interface TVHETopShelfContentProvider
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)processingDispatchQueue;
- (TVHETopShelfContentProvider)init;
- (TVHKMediaLibrariesManager)mediaLibrariesManager;
- (TVHKMediaLibrary)mediaLibrary;
- (void)_handleMediaLibrariesDidChange;
- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3;
- (void)_loadTopShelfContentWithCompletionHandler:(id)a3;
- (void)_notfyTopShelfContentDidChange;
- (void)_startObservingManager;
- (void)_startObservingMediaLibrary:(id)a3;
- (void)_startObservingSettings;
- (void)_stopObservingManager;
- (void)_stopObservingMediaLibrary:(id)a3;
- (void)_stopObservingSettings;
- (void)dealloc;
- (void)loadTopShelfContentWithCompletionHandler:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMediaLibrary:(id)a3;
@end

@implementation TVHETopShelfContentProvider

- (TVHETopShelfContentProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHETopShelfContentProvider;
  v2 = -[TVHETopShelfContentProvider init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("TVHETopShelfContentProvider-ProcessingQueue", 0LL);
    processingDispatchQueue = v2->_processingDispatchQueue;
    v2->_processingDispatchQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", @"TVHETopShelfContentProvider-OperationQueue");
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
    v7 = -[TVHKMediaLibrariesManager initWithAccessMode:]( objc_alloc(&OBJC_CLASS___TVHKMediaLibrariesManager),  "initWithAccessMode:",  1LL);
    mediaLibrariesManager = v2->_mediaLibrariesManager;
    v2->_mediaLibrariesManager = v7;

    -[TVHKMediaLibrariesManager start](v2->_mediaLibrariesManager, "start");
    -[TVHETopShelfContentProvider _startObservingManager](v2, "_startObservingManager");
    -[TVHETopShelfContentProvider _startObservingSettings](v2, "_startObservingSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v2 selector:"_handlePhysicalNetworkStateDidChangeNotification:" name:kATVPhysicalNetworkStateChanged object:0];
  }

  return v2;
}

- (void)dealloc
{
  id v3 = sub_100004464();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deallocating content provider: %p", buf, 0xCu);
  }

  -[TVHETopShelfContentProvider _stopObservingManager](self, "_stopObservingManager");
  -[TVHETopShelfContentProvider _stopObservingSettings](self, "_stopObservingSettings");
  -[TVHETopShelfContentProvider _stopObservingMediaLibrary:](self, "_stopObservingMediaLibrary:", self->_mediaLibrary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHETopShelfContentProvider;
  -[TVHETopShelfContentProvider dealloc](&v6, "dealloc");
}

- (void)loadTopShelfContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider processingDispatchQueue](self, "processingDispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000484C;
    block[3] = &unk_1000105C8;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1000155A0 == a6)
  {
    objc_initWeak(&location, self);
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider processingDispatchQueue](self, "processingDispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000049D8;
    block[3] = &unk_1000105F0;
    objc_copyWeak(&v16, &location);
    dispatch_async(v13, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  else if (off_1000155A8 == a6)
  {
    -[TVHETopShelfContentProvider _notfyTopShelfContentDidChange](self, "_notfyTopShelfContentDidChange");
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVHETopShelfContentProvider;
    -[TVHETopShelfContentProvider observeValueForKeyPath:ofObject:change:context:]( &v14,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_handleMediaLibraryConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvhk_numberForKey:", TVHKMediaLibraryConnectionStateUserInfoKeyToState));
  id v7 = [v6 unsignedIntegerValue];

  if (!v7)
  {
    objc_initWeak(&location, self);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider processingDispatchQueue](self, "processingDispatchQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100004B10;
    v9[3] = &unk_1000105F0;
    objc_copyWeak(&v10, &location);
    dispatch_async(v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider processingDispatchQueue](self, "processingDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C24;
  block[3] = &unk_100010618;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_loadTopShelfContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider processingDispatchQueue](self, "processingDispatchQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(&OBJC_CLASS___TVHETopShelfContentOperation);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider mediaLibrariesManager](self, "mediaLibrariesManager"));
  id v8 = -[TVHETopShelfContentOperation initWithMediaLibrariesManager:](v6, "initWithMediaLibrariesManager:", v7);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100004E78;
  v13[3] = &unk_100010668;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  id v9 = v4;
  id v14 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v13));
  [v10 addDependency:v8];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider operationQueue](self, "operationQueue"));
  [v11 addOperation:v8];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider operationQueue](self, "operationQueue"));
  [v12 addOperation:v10];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_handleMediaLibrariesDidChange
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider processingDispatchQueue](self, "processingDispatchQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider mediaLibrary](self, "mediaLibrary"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider mediaLibrariesManager](self, "mediaLibrariesManager"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 mediaLibraries]);

    if ([v6 count]) {
      -[TVHETopShelfContentProvider _notfyTopShelfContentDidChange](self, "_notfyTopShelfContentDidChange");
    }
  }

- (void)_startObservingSettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"mediaServers" options:0 context:off_1000155A8];
}

- (void)_stopObservingSettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"mediaServers" context:off_1000155A8];
}

- (void)_startObservingManager
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider mediaLibrariesManager](self, "mediaLibrariesManager"));
  [v3 addObserver:self forKeyPath:@"mediaLibraries" options:1 context:off_1000155A0];
}

- (void)_stopObservingManager
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHETopShelfContentProvider mediaLibrariesManager](self, "mediaLibrariesManager"));
  [v3 removeObserver:self forKeyPath:@"mediaLibraries" context:off_1000155A0];
}

- (void)_startObservingMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleMediaLibraryConnectionStateDidChangeNotification:" name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_handleMediaLibraryContentsDidChangeNotification:" name:TVHKMediaLibraryContentsDidChangeNotification object:v4];
}

- (void)_stopObservingMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:TVHKMediaLibraryContentsDidChangeNotification object:v4];
}

- (void)setMediaLibrary:(id)a3
{
  v5 = (TVHKMediaLibrary *)a3;
  mediaLibrary = self->_mediaLibrary;
  id v7 = v5;
  if (mediaLibrary != v5)
  {
    if (mediaLibrary) {
      -[TVHETopShelfContentProvider _stopObservingMediaLibrary:](self, "_stopObservingMediaLibrary:");
    }
    objc_storeStrong((id *)&self->_mediaLibrary, a3);
    if (self->_mediaLibrary) {
      -[TVHETopShelfContentProvider _startObservingMediaLibrary:](self, "_startObservingMediaLibrary:");
    }
  }
}

- (void)_notfyTopShelfContentDidChange
{
  id v3 = sub_100004464();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000A224(v4);
  }

  [(id)objc_opt_class(self) topShelfContentDidChange];
}

- (TVHKMediaLibrariesManager)mediaLibrariesManager
{
  return self->_mediaLibrariesManager;
}

- (OS_dispatch_queue)processingDispatchQueue
{
  return self->_processingDispatchQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void).cxx_destruct
{
}

@end