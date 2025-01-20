@interface CloudArtworkImporter
- (CGSize)_sizeForArtworkWithMediaType:(unsigned int)a3 artworkType:(int64_t)a4;
- (CloudArtworkImporter)initWithConfiguration:(id)a3 sourceType:(int64_t)a4;
- (CloudArtworkOperationQueue)artworkDownloadOperationQueue;
- (ICConnectionConfiguration)configuration;
- (ICURLSession)artworkDownloadSession;
- (ML3MusicLibrary)musicLibrary;
- (MPMediaDownloadManager)downloadManager;
- (MSVWatchdog)artworkDownloadWatchdog;
- (NSMutableDictionary)artworkDownloadOperationMap;
- (NSOperationQueue)artworkColorAnalysisOperationQueue;
- (NSString)powerAssertionIdentifier;
- (OS_dispatch_queue)artworkColorAnalysisAccessQueue;
- (OS_dispatch_queue)artworkDownloadAccessQueue;
- (id)_artworkColorAnalysisOperationForArtworkAsset:(id)a3 library:(id)a4 artwork:(id)a5;
- (int64_t)sourceType;
- (void)_adjustOperationQueueStatusForMediaDownloads;
- (void)cancelAllImports;
- (void)cancelAllImportsAndWaitForOperationsToFinish:(BOOL)a3;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)deprioritizeImportArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4;
- (void)importArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4 token:(id)a5 mediaType:(unsigned int)a6 allowsCellularData:(BOOL)a7 clientIdentity:(id)a8 completionHandler:(id)a9;
- (void)importCloudArtworkForRequests:(id)a3;
- (void)increasePriorityForAllOperations;
- (void)setArtworkColorAnalysisAccessQueue:(id)a3;
- (void)setArtworkColorAnalysisOperationQueue:(id)a3;
- (void)setArtworkDownloadAccessQueue:(id)a3;
- (void)setArtworkDownloadOperationMap:(id)a3;
- (void)setArtworkDownloadOperationQueue:(id)a3;
- (void)setArtworkDownloadSession:(id)a3;
- (void)setArtworkDownloadWatchdog:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setPowerAssertionIdentifier:(id)a3;
@end

@implementation CloudArtworkImporter

- (CloudArtworkImporter)initWithConfiguration:(id)a3 sourceType:(int64_t)a4
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userIdentity]);

  if (!v9)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2, self, @"CloudArtworkImporter.m", 111, @"Invalid parameter not satisfying: %@", @"configuration.userIdentity != nil" object file lineNumber description];
  }

  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___CloudArtworkImporter;
  v10 = -[CloudArtworkImporter init](&v41, "init");
  v11 = v10;
  if (v10)
  {
    v10->_sourceType = a4;
    objc_storeStrong((id *)&v10->_configuration, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 userIdentity]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v12));
    musicLibrary = v11->_musicLibrary;
    v11->_musicLibrary = (ML3MusicLibrary *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.itunescloudd.artworkimporter.artworkColorAnalysisAccessQueue", 0LL);
    -[CloudArtworkImporter setArtworkColorAnalysisAccessQueue:](v11, "setArtworkColorAnalysisAccessQueue:", v15);

    v16 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[CloudArtworkImporter setArtworkColorAnalysisOperationQueue:](v11, "setArtworkColorAnalysisOperationQueue:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue( -[CloudArtworkImporter artworkColorAnalysisOperationQueue]( v11,  "artworkColorAnalysisOperationQueue"));
    [v17 setMaxConcurrentOperationCount:5];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    [v18 setHTTPShouldUsePipelining:1];
    v19 = -[ICURLSession initWithConfiguration:maxConcurrentRequests:qualityOfService:]( objc_alloc(&OBJC_CLASS___ICURLSession),  "initWithConfiguration:maxConcurrentRequests:qualityOfService:",  v18,  5LL,  -1LL);
    -[CloudArtworkImporter setArtworkDownloadSession:](v11, "setArtworkDownloadSession:", v19);

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.itunescloudd.artworkimporter.artworkDownloadAccessQueue", 0LL);
    -[CloudArtworkImporter setArtworkDownloadAccessQueue:](v11, "setArtworkDownloadAccessQueue:", v20);

    v21 = -[CloudArtworkOperationQueue initWithSourceType:configuration:]( objc_alloc(&OBJC_CLASS___CloudArtworkOperationQueue),  "initWithSourceType:configuration:",  -[CloudArtworkImporter sourceType](v11, "sourceType"),  v11->_configuration);
    -[CloudArtworkImporter setArtworkDownloadOperationQueue:](v11, "setArtworkDownloadOperationQueue:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadOperationQueue](v11, "artworkDownloadOperationQueue"));
    [v22 setMaxConcurrentOperationCount:5];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadOperationQueue](v11, "artworkDownloadOperationQueue"));
    [v23 setQualityOfService:-1];

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    unsigned int v25 = [v24 isWatch];

    if (v25)
    {
      uint64_t v43 = 0LL;
      v44 = &v43;
      uint64_t v45 = 0x2050000000LL;
      v26 = (void *)qword_1001DB7E8;
      uint64_t v46 = qword_1001DB7E8;
      if (!qword_1001DB7E8)
      {
        location[0] = _NSConcreteStackBlock;
        location[1] = (id)3221225472LL;
        location[2] = sub_1000E6D8C;
        location[3] = &unk_1001A6978;
        location[4] = &v43;
        sub_1000E6D8C((uint64_t)location);
        v26 = (void *)v44[3];
      }

      id v27 = v26;
      _Block_object_dispose(&v43, 8);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 sharedManager]);
      -[CloudArtworkImporter setDownloadManager:](v11, "setDownloadManager:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter downloadManager](v11, "downloadManager"));
      [v29 registerObserver:v11];

      -[CloudArtworkImporter _adjustOperationQueueStatusForMediaDownloads]( v11,  "_adjustOperationQueueStatusForMediaDownloads");
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[CloudArtworkImporter setArtworkDownloadOperationMap:](v11, "setArtworkDownloadOperationMap:", v30);

    v32 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.itunescloudd.%@",  objc_opt_class(v11, v31));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    -[CloudArtworkImporter setPowerAssertionIdentifier:](v11, "setPowerAssertionIdentifier:", v33);

    v34 = objc_alloc_init(&OBJC_CLASS___MSVWatchdog);
    -[CloudArtworkImporter setArtworkDownloadWatchdog:](v11, "setArtworkDownloadWatchdog:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadWatchdog](v11, "artworkDownloadWatchdog"));
    [v35 setTimeoutInterval:3600.0];

    objc_initWeak(location, v11);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000E6F28;
    v39[3] = &unk_1001A5CB8;
    objc_copyWeak(&v40, location);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadWatchdog](v11, "artworkDownloadWatchdog"));
    [v36 setTimeoutCallback:v39];

    objc_destroyWeak(&v40);
    objc_destroyWeak(location);
  }

  return v11;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter downloadManager](self, "downloadManager"));
  [v3 unregisterObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadWatchdog](self, "artworkDownloadWatchdog"));
  [v4 suspend];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter powerAssertionIdentifier](self, "powerAssertionIdentifier"));
  CPSetPowerAssertionWithIdentifier(0LL, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:ICCloudAvailabilityControllerIsCellularDataRestrictedDidChangeNotification object:0];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CloudArtworkImporter;
  -[CloudArtworkImporter dealloc](&v7, "dealloc");
}

- (void)importArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4 token:(id)a5 mediaType:(unsigned int)a6 allowsCellularData:(BOOL)a7 clientIdentity:(id)a8 completionHandler:(id)a9
{
  BOOL v10 = a7;
  uint64_t v11 = *(void *)&a6;
  id v16 = a9;
  id v17 = a8;
  id v18 = a5;
  v19 = -[CloudArtworkImportRequest initWithClientIdentity:]( objc_alloc(&OBJC_CLASS___CloudArtworkImportRequest),  "initWithClientIdentity:",  v17);

  -[CloudArtworkImportRequest setCloudID:](v19, "setCloudID:", a3);
  -[CloudArtworkImportRequest setToken:](v19, "setToken:", v18);

  -[CloudArtworkImportRequest setMediaType:](v19, "setMediaType:", v11);
  -[CloudArtworkImportRequest setArtworkType:](v19, "setArtworkType:", a4);
  -[CloudArtworkImportRequest setAllowsCellularData:](v19, "setAllowsCellularData:", v10);
  -[CloudArtworkImportRequest setCompletionHandler:](v19, "setCompletionHandler:", v16);

  v21 = v19;
  dispatch_queue_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  -[CloudArtworkImporter importCloudArtworkForRequests:](self, "importCloudArtworkForRequests:", v20);
}

- (void)importCloudArtworkForRequests:(id)a3
{
  id v5 = a3;
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadAccessQueue](self, "artworkDownloadAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E6024;
  block[3] = &unk_1001A5D08;
  BOOL v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)deprioritizeImportArtworkForCloudID:(unint64_t)a3 artworkType:(int64_t)a4
{
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadAccessQueue](self, "artworkDownloadAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E5E40;
  block[3] = &unk_1001A5D30;
  block[5] = a3;
  block[6] = a4;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)decreasePriorityForAllOperations
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadAccessQueue](self, "artworkDownloadAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E5E10;
  block[3] = &unk_1001A6B90;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)increasePriorityForAllOperations
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadAccessQueue](self, "artworkDownloadAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E5DE0;
  block[3] = &unk_1001A6B90;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)cancelAllImportsAndWaitForOperationsToFinish:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadOperationQueue](self, "artworkDownloadOperationQueue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 progress]);

  id v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 totalUnitCount];
    *(_DWORD *)buf = 138543618;
    dispatch_queue_t v15 = self;
    __int16 v16 = 2048;
    int64_t v17 = v8 - (_BYTE *)[v6 completedUnitCount];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Cancelling %lld artwork download operations",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadOperationQueue](self, "artworkDownloadOperationQueue"));
  [v9 setSuspended:0];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadOperationQueue](self, "artworkDownloadOperationQueue"));
  [v10 cancelAllOperations];

  SEL v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadAccessQueue](self, "artworkDownloadAccessQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E5D84;
  v12[3] = &unk_1001A5D58;
  BOOL v13 = a3;
  v12[4] = self;
  dispatch_sync(v11, v12);
}

- (void)cancelAllImports
{
}

- (void)_adjustOperationQueueStatusForMediaDownloads
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter downloadManager](self, "downloadManager"));
  unsigned int v4 = [v3 hasActiveDownloads];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadOperationQueue](self, "artworkDownloadOperationQueue"));
  id v6 = [v5 maxConcurrentOperationCount];

  if (((v4 ^ (v6 != (id)1)) & 1) == 0)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "Unthrottling";
      if (v4) {
        id v8 = "Throttling";
      }
      int v12 = 138543618;
      BOOL v13 = self;
      __int16 v14 = 2080;
      dispatch_queue_t v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %s operations in coordination with media downloads",  (uint8_t *)&v12,  0x16u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter artworkDownloadOperationQueue](self, "artworkDownloadOperationQueue"));
    BOOL v10 = v9;
    if (v4) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = 5LL;
    }
    [v9 setMaxConcurrentOperationCount:v11];
  }

- (id)_artworkColorAnalysisOperationForArtworkAsset:(id)a3 library:(id)a4 artwork:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _artworkColorAnalysisOperationForArtworkAsset calling color analysis for artwork asset",  buf,  0xCu);
  }

  id v12 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000E562C;
  v18[3] = &unk_1001A5ED8;
  id v19 = v9;
  id v20 = v8;
  v21 = self;
  id v22 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  id v16 = [v12 initWithStartHandler:v18];

  return v16;
}

- (CGSize)_sizeForArtworkWithMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ArtworkConfiguration systemConfiguration]( &OBJC_CLASS___ML3ArtworkConfiguration,  "systemConfiguration"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sizesToAutogenerateForMediaType:v5 artworkType:a4]);

  uint64_t v12 = 0LL;
  id v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = -8388609;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E55D8;
  v11[3] = &unk_1001A5DF8;
  v11[4] = &v12;
  [v7 enumerateObjectsUsingBlock:v11];
  double v8 = v13[6];
  _Block_object_dispose(&v12, 8);

  double v9 = v8;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (ICURLSession)artworkDownloadSession
{
  return self->_artworkDownloadSession;
}

- (void)setArtworkDownloadSession:(id)a3
{
}

- (OS_dispatch_queue)artworkDownloadAccessQueue
{
  return self->_artworkDownloadAccessQueue;
}

- (void)setArtworkDownloadAccessQueue:(id)a3
{
}

- (CloudArtworkOperationQueue)artworkDownloadOperationQueue
{
  return self->_artworkDownloadOperationQueue;
}

- (void)setArtworkDownloadOperationQueue:(id)a3
{
}

- (NSMutableDictionary)artworkDownloadOperationMap
{
  return self->_artworkDownloadOperationMap;
}

- (void)setArtworkDownloadOperationMap:(id)a3
{
}

- (NSString)powerAssertionIdentifier
{
  return self->_powerAssertionIdentifier;
}

- (void)setPowerAssertionIdentifier:(id)a3
{
}

- (MSVWatchdog)artworkDownloadWatchdog
{
  return self->_artworkDownloadWatchdog;
}

- (void)setArtworkDownloadWatchdog:(id)a3
{
}

- (MPMediaDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (NSOperationQueue)artworkColorAnalysisOperationQueue
{
  return self->_artworkColorAnalysisOperationQueue;
}

- (void)setArtworkColorAnalysisOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)artworkColorAnalysisAccessQueue
{
  return self->_artworkColorAnalysisAccessQueue;
}

- (void)setArtworkColorAnalysisAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end