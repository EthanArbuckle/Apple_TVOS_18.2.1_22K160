@interface SHShazamKitService
+ (id)machServiceName;
+ (void)initializeGlobalServiceState;
- (SHAudioTapProvider)audioTapProvider;
- (SHClientCredentials)clientCredentials;
- (SHEventSignalScheduler)eventSignaller;
- (SHHapticsFetcher)hapticsFetcher;
- (SHMatcherControllerProvider)matcherControllerProvider;
- (SHMediaItemFetcher)mediaItemFetcher;
- (SHMediaLibraryClient)libraryClient;
- (SHMediaLibraryQueryManager)libraryQueryManager;
- (SHPrivacyDisclosureManager)privacyDisclosureManager;
- (SHServiceDelegate)serviceDelegate;
- (SHShazamKitClient)delegate;
- (SHShazamKitService)initWithClientCredentials:(id)a3;
- (SHShazamKitService)initWithClientCredentials:(id)a3 audioTapProvider:(id)a4 eventSignaller:(id)a5 privacyDisclosureManager:(id)a6;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)dealloc;
- (void)finishedWorker:(id)a3;
- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4;
- (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4;
- (void)prepareMatcherForRequestID:(id)a3 completionHandler:(id)a4;
- (void)registerMatcherController:(id)a3 forRequest:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setServiceDelegate:(id)a3;
- (void)shutdownService;
- (void)startRecognitionForRequest:(id)a3;
- (void)startRecognitionForRequest:(id)a3 completionHandler:(id)a4;
- (void)startUpdatingLocationForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
- (void)synchronizeSnapshot:(id)a3 startCondition:(id)a4 completionHandler:(id)a5;
@end

@implementation SHShazamKitService

+ (id)machServiceName
{
  return SHShazamKitServiceName;
}

+ (void)initializeGlobalServiceState
{
  if (qword_100088980 != -1) {
    dispatch_once(&qword_100088980, &stru_10006D180);
  }
}

- (void)dealloc
{
  uint64_t v3 = sh_log_object(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Deallocating the Shazam Service", buf, 2u);
  }

  -[SHShazamKitService disableSpectralOutputNotification](self, "disableSpectralOutputNotification");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SHShazamKitService;
  -[SHShazamKitService dealloc](&v5, "dealloc");
}

- (SHShazamKitService)initWithClientCredentials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHShazamKitService;
  v6 = -[SHShazamKitService init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientCredentials, a3);
  }

  return v7;
}

- (SHShazamKitService)initWithClientCredentials:(id)a3 audioTapProvider:(id)a4 eventSignaller:(id)a5 privacyDisclosureManager:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = -[SHShazamKitService initWithClientCredentials:](self, "initWithClientCredentials:", a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_audioTapProvider, a4);
    objc_storeStrong((id *)&v15->_eventSignaller, a5);
    objc_storeStrong((id *)&v15->_privacyDisclosureManager, a6);
  }

  return v15;
}

- (void)prepareMatcherForRequestID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = objc_alloc(&OBJC_CLASS___SHPreRecordingWorker);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService audioTapProvider](self, "audioTapProvider"));
  v10 = -[SHPreRecordingWorker initWithRequestID:audioTapProvider:](v8, "initWithRequestID:audioTapProvider:", v6, v9);

  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
    id v20 = 0LL;
    unsigned int v13 = [v12 service:self registerWorker:v10 watchdogTimeout:&v20 error:120.0];
    id v14 = v20;

    if (v13)
    {
      -[SHPreRecordingWorker setWorkerDelegate:](v10, "setWorkerDelegate:", self);
      -[SHPreRecordingWorker startRecordingWithCompletionHandler:](v10, "startRecordingWithCompletionHandler:", v7);
    }

    else
    {
      uint64_t v18 = sh_log_object(v15);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v10;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Unable to start prerecording for worker %@ - the pre recording is already running with the same worker id %@ running - %@",  buf,  0x20u);
      }

      if (v7) {
        v7[2](v7);
      }
    }
  }

  else
  {
    uint64_t v16 = sh_log_object(v11);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Unable to start pre recording - it is likely some required entitlements are missing",  buf,  2u);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)startRecognitionForRequest:(id)a3
{
  uint64_t v3 = NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%@ is not supported by shazamd, please use startRecognitionForRequest:completionHandler",  v4);
}

- (void)startRecognitionForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService matcherControllerProvider](self, "matcherControllerProvider"));
  [v9 setDelegate:v8];

  if ([v6 type] == (id)3
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService privacyDisclosureManager](self, "privacyDisclosureManager")),
        unsigned int v11 = [v10 privacyDisclosureAcknowledgementRequired],
        v10,
        v11))
  {
    uint64_t v13 = sh_log_object(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v34 = 138412290;
      id v35 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unable to create matcher for request %@ as privacy disclosure acknowledgement is required",  (uint8_t *)&v34,  0xCu);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  204LL,  0LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService delegate](self, "delegate"));
    v17 = (SHSignature *)objc_claimAutoreleasedReturnValue([v6 signature]);
    uint64_t v18 = v17;
    if (!v17) {
      uint64_t v18 = objc_opt_new(&OBJC_CLASS___SHSignature);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v18,  v15));
    [v16 matcher:self didProduceResponse:v19];

    if (!v17) {
    if (v7)
    }
      v7[2](v7);
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService matcherControllerProvider](self, "matcherControllerProvider"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v20 matcherControllerForRequest:v6]);

    if (v15)
    {
      if ([v6 type] == (id)2)
      {
        uint64_t v22 = sh_log_object(2LL);
        __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v34) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Request type is record, starting location updates",  (uint8_t *)&v34,  2u);
        }

        -[SHShazamKitService startUpdatingLocationForRequest:](self, "startUpdatingLocationForRequest:", v6);
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 attribution]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleIdentifier]);

      if (([v26 isEqualToString:@"com.apple.springboard"] & 1) != 0
        || [v26 isEqualToString:@"com.apple.musicrecognition.MusicRecognitionControls"])
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService eventSignaller](self, "eventSignaller"));
        [v27 sendEventSignal:@"com.apple.musicrecognition.recognition-activated"];
      }

      -[SHShazamKitService registerMatcherController:forRequest:completionHandler:]( self,  "registerMatcherController:forRequest:completionHandler:",  v15,  v6,  v7);
    }

    else
    {
      uint64_t v28 = sh_log_object(v21);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v34) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Unable to fetch matcher controller - it is likely some required entitlements are missing",  (uint8_t *)&v34,  2u);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[SHCoreError errorWithCode:underlyingError:]( &OBJC_CLASS___SHCoreError,  "errorWithCode:underlyingError:",  102LL,  0LL));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService delegate](self, "delegate"));
      v31 = (SHSignature *)objc_claimAutoreleasedReturnValue([v6 signature]);
      v32 = v31;
      if (!v31) {
        v32 = objc_opt_new(&OBJC_CLASS___SHSignature);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v32,  v26));
      [v30 matcher:self didProduceResponse:v33];

      if (!v31) {
      if (v7)
      }
        v7[2](v7);
    }
  }
}

- (void)startUpdatingLocationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SHLocationProvider locationProviderForRequestIdentifier:clientType:]( SHLocationProvider,  "locationProviderForRequestIdentifier:clientType:",  v6,  [v7 clientType]));

  [v8 setWorkerDelegate:self];
  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
    [v4 watchdogTimeout];
    id v16 = 0LL;
    unsigned int v10 = objc_msgSend(v9, "service:registerWorker:watchdogTimeout:error:", self, v8, &v16);
    id v11 = v16;

    uint64_t v13 = sh_log_object(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Registering location provider %@", buf, 0xCu);
      }

      [v8 startUpdatingLocation];
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to register location provider %@",  buf,  0xCu);
      }
    }
  }
}

- (void)registerMatcherController:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  [v9 watchdogTimeout];
  id v23 = 0LL;
  unsigned int v12 = objc_msgSend(v11, "service:registerWorker:watchdogTimeout:error:", self, v8, &v23);
  id v13 = v23;

  if (v12)
  {
    [v8 setWorkerDelegate:self];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService delegate](self, "delegate"));
    [v8 setDelegate:v15];

    [v8 setCompletionHandler:v10];
    [v8 startRecognitionForRequest:v9];
  }

  else
  {
    uint64_t v16 = sh_log_object(v14);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 workerID]);
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Unable to register worker %@ - the matcher is already running with the same worker id %@ running",  buf,  0x16u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService delegate](self, "delegate"));
    id v20 = (SHSignature *)objc_claimAutoreleasedReturnValue([v9 signature]);
    uint64_t v21 = v20;
    if (!v20) {
      uint64_t v21 = objc_opt_new(&OBJC_CLASS___SHSignature);
    }
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v21,  v13));
    [v19 matcher:self didProduceResponse:v22];

    if (!v20) {
    if (v10)
    }
      v10[2](v10);
  }
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v4 = NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%@ is not supported by shazamd, please use synchronizeSnapshot:startCondition:completionHandler",  v5);
}

- (void)synchronizeSnapshot:(id)a3 startCondition:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc(&OBJC_CLASS___SHMediaLibrarySyncManager);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService libraryClient](self, "libraryClient"));
  uint64_t v15 = -[SHMediaLibrarySyncManager initWithClient:completionHandler:]( v11,  "initWithClient:completionHandler:",  v12,  v8);

  -[SHMediaLibrarySyncManager setWorkerDelegate:](v15, "setWorkerDelegate:", self);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService delegate](self, "delegate"));
  -[SHMediaLibrarySyncManager setDelegate:](v15, "setDelegate:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  [v14 service:self registerWorker:v15 watchdogTimeout:0 error:1.79769313e308];

  -[SHMediaLibrarySyncManager _synchronizeSnapshot:startCondition:]( v15,  "_synchronizeSnapshot:startCondition:",  v10,  v9);
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SHShazamKitService libraryQueryManager](self, "libraryQueryManager"));
  [v5 _libraryInfoWithCompletionHandler:v4];
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SHShazamKitService libraryQueryManager](self, "libraryQueryManager"));
  [v8 _queryLibraryWithParameters:v7 completionHandler:v6];
}

- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService mediaItemFetcher](self, "mediaItemFetcher"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100014650;
  v10[3] = &unk_10006D1A8;
  id v11 = v6;
  id v9 = v6;
  [v8 mediaItemsForShazamIDs:v7 completionHandler:v10];
}

- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService hapticsFetcher](self, "hapticsFetcher"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001476C;
  v10[3] = &unk_10006D1A8;
  id v11 = v6;
  id v9 = v6;
  [v8 hapticsForMediaItems:v7 completionHandler:v10];
}

- (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService hapticsFetcher](self, "hapticsFetcher"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100014888;
  v10[3] = &unk_10006D1D0;
  id v11 = v6;
  id v9 = v6;
  [v8 hasHapticTrackForMediaItem:v7 completionHandler:v10];
}

- (void)finishedWorker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sh_log_object(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Worker %@ stopped running",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  [v7 service:self unregisterWorker:v4];
}

- (SHMediaLibraryQueryManager)libraryQueryManager
{
  libraryQueryManager = self->_libraryQueryManager;
  if (!libraryQueryManager)
  {
    id v4 = objc_alloc(&OBJC_CLASS___SHMediaLibraryQueryManager);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService libraryClient](self, "libraryClient"));
    id v6 = -[SHMediaLibraryQueryManager initWithClient:](v4, "initWithClient:", v5);
    id v7 = self->_libraryQueryManager;
    self->_libraryQueryManager = v6;

    libraryQueryManager = self->_libraryQueryManager;
  }

  return libraryQueryManager;
}

- (SHMediaItemFetcher)mediaItemFetcher
{
  mediaItemFetcher = self->_mediaItemFetcher;
  if (!mediaItemFetcher)
  {
    id v4 = objc_alloc(&OBJC_CLASS___SHMediaItemFetcher);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attribution]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 containingAppBundleIdentifier]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
    id v9 = -[SHMediaItemFetcher initWithBundleIdentifier:clientType:]( v4,  "initWithBundleIdentifier:clientType:",  v7,  [v8 clientType]);
    id v10 = self->_mediaItemFetcher;
    self->_mediaItemFetcher = v9;

    mediaItemFetcher = self->_mediaItemFetcher;
  }

  return mediaItemFetcher;
}

- (SHHapticsFetcher)hapticsFetcher
{
  hapticsFetcher = self->_hapticsFetcher;
  if (!hapticsFetcher)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SHHapticsFetcher);
    uint64_t v5 = self->_hapticsFetcher;
    self->_hapticsFetcher = v4;

    hapticsFetcher = self->_hapticsFetcher;
  }

  return hapticsFetcher;
}

- (SHAudioTapProvider)audioTapProvider
{
  audioTapProvider = self->_audioTapProvider;
  if (!audioTapProvider)
  {
    id v4 = objc_alloc(&OBJC_CLASS___SHAudioTapProvider);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SHAudioManager sharedInstance](&OBJC_CLASS___SHAudioManager, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 audioRecordingManager]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
    int v8 = -[SHAudioTapProvider initWithAudioRecordingManager:clientCredentials:]( v4,  "initWithAudioRecordingManager:clientCredentials:",  v6,  v7);
    id v9 = self->_audioTapProvider;
    self->_audioTapProvider = v8;

    audioTapProvider = self->_audioTapProvider;
  }

  return audioTapProvider;
}

- (SHEventSignalScheduler)eventSignaller
{
  eventSignaller = self->_eventSignaller;
  if (!eventSignaller)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SHEventSignalScheduler);
    uint64_t v5 = self->_eventSignaller;
    self->_eventSignaller = v4;

    eventSignaller = self->_eventSignaller;
  }

  return eventSignaller;
}

- (SHMediaLibraryClient)libraryClient
{
  libraryClient = self->_libraryClient;
  if (!libraryClient)
  {
    id v4 = objc_alloc(&OBJC_CLASS___SHMediaLibraryClient);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
    id v6 = -[SHMediaLibraryClient initWithCredentials:](v4, "initWithCredentials:", v5);
    id v7 = self->_libraryClient;
    self->_libraryClient = v6;

    libraryClient = self->_libraryClient;
  }

  return libraryClient;
}

- (SHPrivacyDisclosureManager)privacyDisclosureManager
{
  privacyDisclosureManager = self->_privacyDisclosureManager;
  if (!privacyDisclosureManager)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SHPrivacyDisclosureManager);
    uint64_t v5 = self->_privacyDisclosureManager;
    self->_privacyDisclosureManager = v4;

    privacyDisclosureManager = self->_privacyDisclosureManager;
  }

  return privacyDisclosureManager;
}

- (SHMatcherControllerProvider)matcherControllerProvider
{
  matcherControllerProvider = self->_matcherControllerProvider;
  if (!matcherControllerProvider)
  {
    id v4 = objc_alloc(&OBJC_CLASS___SHMatcherControllerProvider);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService audioTapProvider](self, "audioTapProvider"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attribution]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService clientCredentials](self, "clientCredentials"));
    id v9 = -[SHMatcherControllerProvider initWithAudioTapProvider:attribution:clientType:]( v4,  "initWithAudioTapProvider:attribution:clientType:",  v5,  v7,  [v8 clientType]);
    id v10 = self->_matcherControllerProvider;
    self->_matcherControllerProvider = v9;

    matcherControllerProvider = self->_matcherControllerProvider;
  }

  return matcherControllerProvider;
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allWorkersForService:self]);

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 taskID]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 runningAssociatedRequestID]);
        if ([v15 isEqual:v16])
        {
          unsigned int v17 = [v14 conformsToProtocol:&OBJC_PROTOCOL___SHMatcherDelegate];

          if (v17)
          {
            id v25 = v27;
            [v14 matcher:v27 didProduceResponse:v6];
            __int16 v26 = v9;
            goto LABEL_15;
          }
        }

        else
        {
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v11);
  }

  uint64_t v19 = sh_log_object(v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 runningAssociatedRequestID]);
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Tried to return response ID %@ but could not find a running worker",  buf,  0xCu);
  }

  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  500LL,  0LL));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService delegate](self, "delegate"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 signature]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v23,  v26));
  [v22 matcher:self didProduceResponse:v24];

  id v25 = v27;
LABEL_15:
}

- (void)stopRecognition
{
  uint64_t v3 = sh_log_object(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shazam service stopRecognition called", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allWorkersForService:self]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v9);
  }
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sh_log_object(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v37 = self;
    __int16 v38 = 2112;
    id v39 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[%@] stopRecognition called for worker with task ID %@",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allWorkersForService:self]);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v32;
    *(void *)&__int128 v11 = 138412290LL;
    __int128 v30 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v9);
        }
        __int128 v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "taskID", v30));
        if ([v16 isEqual:v4])
        {
          unsigned int v17 = [v15 conformsToProtocol:&OBJC_PROTOCOL___SHMatcher];

          if (v17)
          {
            uint64_t v20 = sh_log_object(v18);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v22 = (SHShazamKitService *)objc_claimAutoreleasedReturnValue([v15 workerID]);
              *(_DWORD *)buf = 138412546;
              v37 = v22;
              __int16 v38 = 2112;
              id v39 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Worker with worker ID %@ stopping task ID %@",  buf,  0x16u);
            }

            [v15 stopRecognitionForRequestID:v4];
            continue;
          }
        }

        else
        {
        }

        uint64_t v23 = objc_opt_class(&OBJC_CLASS___SHPreRecordingWorker, v19);
        if ((objc_opt_isKindOfClass(v15, v23) & 1) == 0)
        {
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___SHLocationProvider, v24);
          uint64_t isKindOfClass = objc_opt_isKindOfClass(v15, v25);
          if ((isKindOfClass & 1) == 0) {
            continue;
          }
          uint64_t v27 = sh_log_object(isKindOfClass);
          __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            __int128 v29 = (SHShazamKitService *)objc_claimAutoreleasedReturnValue([v15 workerID]);
            *(_DWORD *)buf = v30;
            v37 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Worker of type SHLocationProvider shutting down with worker ID %@",  buf,  0xCu);
          }
        }

        [v15 shutdownWorker];
      }

      id v12 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v12);
  }
}

- (void)shutdownService
{
  uint64_t v3 = sh_log_object(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shazam service stop called", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitService serviceDelegate](self, "serviceDelegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allWorkersForService:self]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "shutdownWorker", (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v9);
  }
}

- (SHServiceDelegate)serviceDelegate
{
  return (SHServiceDelegate *)objc_loadWeakRetained((id *)&self->_serviceDelegate);
}

- (void)setServiceDelegate:(id)a3
{
}

- (SHShazamKitClient)delegate
{
  return (SHShazamKitClient *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHClientCredentials)clientCredentials
{
  return self->_clientCredentials;
}

- (void).cxx_destruct
{
}

@end