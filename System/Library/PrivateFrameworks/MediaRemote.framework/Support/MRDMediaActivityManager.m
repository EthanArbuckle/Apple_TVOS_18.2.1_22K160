@interface MRDMediaActivityManager
+ (MRDMediaActivityManager)manager;
- (BOOL)isPresentingBanner;
- (BOOL)isPresentingConnectedPill;
- (BOOL)presentingConnectedPillFor:(id)a3;
- (MRDBannerCenter)bannerCenter;
- (MRDBannerCenter)pillCenter;
- (MRDMediaActivityManager)init;
- (MRRouteBannerRequest)activePillRequest;
- (MRRouteBannerRequest)activeRequest;
- (NSMutableArray)pendingRequests;
- (id)completion;
- (id)pillCompletion;
- (id)staticRequestForRoute:(id)a3 devices:(id)a4;
- (unint64_t)activeBannerState;
- (unint64_t)activePillBannerState;
- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4;
- (void)dequeueNextPendingRequest;
- (void)dismissAllBannerRequests;
- (void)dismissBannerRequest:(id)a3;
- (void)dismissConnectedBanner;
- (void)dismissPillBannerRequest:(id)a3;
- (void)enqueueRequest:(id)a3 completion:(id)a4;
- (void)postAutoRouteBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6;
- (void)postBannerRequest:(id)a3 completion:(id)a4;
- (void)postConnectedBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 remoteControl:(BOOL)a6 completion:(id)a7;
- (void)postDeltaBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7;
- (void)postOneTapSuggestionBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6;
- (void)postPillBannerRequest:(id)a3 completion:(id)a4;
- (void)presentControlCenterCallToActionVideo:(BOOL)a3 completion:(id)a4;
- (void)setActiveBannerState:(unint64_t)a3;
- (void)setActivePillBannerState:(unint64_t)a3;
- (void)setActivePillRequest:(id)a3;
- (void)setActiveRequest:(id)a3;
- (void)setBannerCenter:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPillCenter:(id)a3;
- (void)setPillCompletion:(id)a3;
@end

@implementation MRDMediaActivityManager

+ (MRDMediaActivityManager)manager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154C18;
  block[3] = &unk_10039A688;
  block[4] = a1;
  if (qword_1003FE208[0] != -1) {
    dispatch_once(qword_1003FE208, block);
  }
  return (MRDMediaActivityManager *)(id)qword_1003FE200;
}

- (MRDMediaActivityManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDMediaActivityManager;
  v2 = -[MRDMediaActivityManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v3;

    v5 = -[MRDBannerCenter initWithDelegate:](objc_alloc(&OBJC_CLASS___MRDBannerCenter), "initWithDelegate:", v2);
    -[MRDMediaActivityManager setBannerCenter:](v2, "setBannerCenter:", v5);

    v6 = -[MRDBannerCenter initWithDelegate:](objc_alloc(&OBJC_CLASS___MRDBannerCenter), "initWithDelegate:", v2);
    -[MRDMediaActivityManager setPillCenter:](v2, "setPillCenter:", v6);
  }

  return v2;
}

- (MRRouteBannerRequest)activeRequest
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)setActiveRequest:(id)a3
{
  v4 = (MRRouteBannerRequest *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeRequest = obj->_activeRequest;
  obj->_activeRequest = v4;

  objc_sync_exit(obj);
}

- (MRRouteBannerRequest)activePillRequest
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activePillRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)setActivePillRequest:(id)a3
{
  v4 = (MRRouteBannerRequest *)a3;
  obj = self;
  objc_sync_enter(obj);
  activePillRequest = obj->_activePillRequest;
  obj->_activePillRequest = v4;

  objc_sync_exit(obj);
}

- (void)postPillBannerRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MRDMediaActivityManager setActivePillRequest:](self, "setActivePillRequest:", v7);
  -[MRDMediaActivityManager setPillCompletion:](self, "setPillCompletion:", v6);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pillCenter](self, "pillCenter"));
  [v8 postBannerRequest:v7];
}

- (void)postBannerRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MRDMediaActivityManager setActiveRequest:](self, "setActiveRequest:", v7);
  -[MRDMediaActivityManager setCompletion:](self, "setCompletion:", v6);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager bannerCenter](self, "bannerCenter"));
  [v8 postBannerRequest:v7];
}

- (void)postDeltaBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = (void (**)(id, void, void *))a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));

  if (v15)
  {
    uint64_t v17 = _MRLogForCategory(13LL, v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));
      int v25 = 138412290;
      v26 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM already presenting %@, bailing out",  (uint8_t *)&v25,  0xCu);
    }

    if (v14)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MRBannerErrorDomain",  1LL,  0LL));
      v14[2](v14, 0LL, v20);
    }
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaActivityManager staticRequestForRoute:devices:]( self,  "staticRequestForRoute:devices:",  v11,  v12));
    [v21 setBannerType:4];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 outputDevices]);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "msv_compactMap:", &stru_1003A3228));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v21 staticRequest]);
    [v24 setUserSelectedDeviceNames:v23];

    -[MRDMediaActivityManager postBannerRequest:completion:](self, "postBannerRequest:completion:", v21, v14);
  }
}

- (void)postOneTapSuggestionBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));

  if (v12)
  {
    uint64_t v14 = _MRLogForCategory(13LL, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));
      int v19 = 138412290;
      v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM already presenting %@, bailing out",  (uint8_t *)&v19,  0xCu);
    }

    if (v11)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MRBannerErrorDomain",  1LL,  0LL));
      v11[2](v11, 0LL, v17);
    }
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaActivityManager staticRequestForRoute:devices:]( self,  "staticRequestForRoute:devices:",  v9,  v10));
    -[MRDMediaActivityManager postBannerRequest:completion:](self, "postBannerRequest:completion:", v18, v11);
  }
}

- (void)postAutoRouteBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));

  if (v12)
  {
    uint64_t v14 = _MRLogForCategory(13LL, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));
      int v19 = 138412290;
      v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM already presenting %@, bailing out",  (uint8_t *)&v19,  0xCu);
    }

    if (v11)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MRBannerErrorDomain",  1LL,  0LL));
      v11[2](v11, 0LL, v17);
    }
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaActivityManager staticRequestForRoute:devices:]( self,  "staticRequestForRoute:devices:",  v9,  v10));
    [v18 setBannerType:1];
    -[MRDMediaActivityManager postBannerRequest:completion:](self, "postBannerRequest:completion:", v18, v11);
  }
}

- (void)enqueueRequest:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___MRRouteBannerRequestQueueItem);
  -[MRRouteBannerRequestQueueItem setRequest:](v7, "setRequest:", v10);
  -[MRRouteBannerRequestQueueItem setCompletion:](v7, "setCompletion:", v6);
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pendingRequests](v8, "pendingRequests"));
  [v9 addObject:v7];

  objc_sync_exit(v8);
}

- (void)dequeueNextPendingRequest
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pendingRequests](obj, "pendingRequests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 request]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 completion]);
    -[MRDMediaActivityManager postPillBannerRequest:completion:](obj, "postPillBannerRequest:completion:", v4, v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pendingRequests](obj, "pendingRequests"));
    [v6 removeObject:v3];
  }

  objc_sync_exit(obj);
}

- (void)postConnectedBannerRequestForRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 remoteControl:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = objc_claimAutoreleasedReturnValue([a5 outputDevices]);
  uint64_t v16 = (void *)v15;
  if (v15) {
    id v17 = (id)v15;
  }
  else {
    id v17 = v13;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaActivityManager staticRequestForRoute:devices:]( self,  "staticRequestForRoute:devices:",  v14,  v17));

  int v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 primaryUIApplicationBundleIdentifier]);
  [v18 setBundleIdentifierAffinity:v20];

  if (v7) {
    uint64_t v21 = 3LL;
  }
  else {
    uint64_t v21 = 2LL;
  }
  [v18 setBannerType:v21];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activePillRequest](self, "activePillRequest"));

  if (v22)
  {
    uint64_t v24 = _MRLogForCategory(13LL, v23);
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activePillRequest](self, "activePillRequest"));
      int v27 = 138412546;
      v28 = v26;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM already presenting pill %@, enqueueing request %@",  (uint8_t *)&v27,  0x16u);
    }

    -[MRDMediaActivityManager enqueueRequest:completion:](self, "enqueueRequest:completion:", v18, v12);
  }

  else
  {
    -[MRDMediaActivityManager postPillBannerRequest:completion:](self, "postPillBannerRequest:completion:", v18, v12);
  }
}

- (BOOL)isPresentingBanner
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)isPresentingConnectedPill
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activePillRequest](self, "activePillRequest"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)presentingConnectedPillFor:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activePillRequest](self, "activePillRequest"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 bundleIdentifierAffinity]);
  BOOL v7 = v6;
  if (v6 == v4) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = [v6 isEqual:v4];
  }

  return v8;
}

- (void)dismissConnectedBanner
{
  if (-[MRDMediaActivityManager isPresentingConnectedPill](self, "isPresentingConnectedPill"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activePillRequest](self, "activePillRequest"));
    -[MRDMediaActivityManager dismissPillBannerRequest:](self, "dismissPillBannerRequest:", v3);
  }

  obj = self;
  objc_sync_enter(obj);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pendingRequests](obj, "pendingRequests"));
  [v4 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)dismissBannerRequest:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager bannerCenter](self, "bannerCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);

  [v6 dismissBannerWithIdentifier:v5];
}

- (void)dismissPillBannerRequest:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pillCenter](self, "pillCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);

  [v6 dismissBannerWithIdentifier:v5];
}

- (void)dismissAllBannerRequests
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));
    -[MRDMediaActivityManager dismissBannerRequest:](self, "dismissBannerRequest:", v4);
  }

- (id)staticRequestForRoute:(id)a3 devices:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___MRStaticRouteBannerRequest);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 routeIdentifier]);

  [v7 setRouteIdentifier:v8];
  if ([v5 count])
  {
    else {
      id v9 = @"airplayaudio";
    }
    [v7 setActionImageName:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_compactMap:", &stru_1003A3248));
    [v7 setOutputDeviceNames:v10];

    id v11 = [v5 count];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    unsigned int v13 = [v12 deviceSubtype];

    if (v11 == (id)1 && v13 == 12)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 modelID]);
      [v7 setSoloModelID:v15];

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceEnclosureColor]);
      [v7 setSoloDeviceEnclosureColor:v16];
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputDeviceSymbolProvider symbolNameForOutputDevices:]( &OBJC_CLASS___MRAVOutputDeviceSymbolProvider,  "symbolNameForOutputDevices:",  v5));
    [v7 setRouteSymbolName:v17];

    uint64_t v19 = _MRLogForCategory(13LL, v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 routeSymbolName]);
      int v24 = 138412546;
      int v25 = v21;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM Static Request symbol name=%@ for devices:%@",  (uint8_t *)&v24,  0x16u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[MRRouteBannerRequest requestWithStaticRequest:]( &OBJC_CLASS___MRRouteBannerRequest,  "requestWithStaticRequest:",  v7));
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4
{
  id v6 = a3;
  if (a4 > 4) {
    id v7 = 0LL;
  }
  else {
    id v7 = (void *)*((void *)&off_1003A3268 + a4);
  }
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestIdentifier]);
  unsigned int v10 = [v6 isEqualToString:v9];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activePillRequest](self, "activePillRequest"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestIdentifier]);
  unsigned int v13 = [v6 isEqualToString:v12];

  uint64_t v15 = _MRLogForCategory(13LL, v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v74 = 138413058;
    id v75 = v7;
    __int16 v76 = 2112;
    id v77 = v6;
    __int16 v78 = 1024;
    LODWORD(v79[0]) = v10;
    WORD2(v79[0]) = 1024;
    *(_DWORD *)((char *)v79 + 6) = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM got event %@ for %@ r=%d p=%d",  (uint8_t *)&v74,  0x22u);
  }

  unint64_t v17 = -[MRDMediaActivityManager activeBannerState](self, "activeBannerState");
  if (v17 > 4)
  {
    uint64_t v19 = 0LL;
    if (!v10) {
      goto LABEL_8;
    }
LABEL_13:
    switch(a4)
    {
      case 0uLL:
        unint64_t v22 = -[MRDMediaActivityManager activeBannerState](self, "activeBannerState") - 1;
        if (v22 > 3) {
          unint64_t v23 = 0LL;
        }
        else {
          unint64_t v23 = qword_10034BB38[v22];
        }
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager completion](self, "completion"));

        if (v58)
        {
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager completion](self, "completion"));
          (*((void (**)(os_log_s *, unint64_t, void))v60 + 2))(v60, v23, 0LL);
        }

        else
        {
          uint64_t v61 = _MRLogForCategory(13LL, v59);
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            if (v23 > 4) {
              v62 = 0LL;
            }
            else {
              v62 = (void *)*((void *)&off_1003A32B8 + v23);
            }
            int v74 = 138412546;
            id v75 = v62;
            __int16 v76 = 2112;
            id v77 = 0LL;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM Would have called completion with result %@ error %@ but completion is nil",  (uint8_t *)&v74,  0x16u);
          }
        }

        -[MRDMediaActivityManager setActiveBannerState:](self, "setActiveBannerState:", 0LL);
        -[MRDMediaActivityManager setActiveRequest:](self, "setActiveRequest:", 0LL);
        uint64_t v69 = _MRLogForCategory(13LL, v68);
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v74) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM cleared activeRequest",  (uint8_t *)&v74,  2u);
        }

        -[MRDMediaActivityManager setCompletion:](self, "setCompletion:", 0LL);
        goto LABEL_83;
      case 1uLL:
        if ((id)-[MRDMediaActivityManager activeBannerState](self, "activeBannerState") != (id)1)
        {
          uint64_t v31 = _MRLogForCategory(13LL, v30);
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            int v74 = 138412546;
            id v75 = v7;
            __int16 v76 = 2112;
            id v77 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM unexpected event %@ while current state is %@, letting it slide.",  (uint8_t *)&v74,  0x16u);
          }
        }

        v33 = self;
        uint64_t v34 = 2LL;
        goto LABEL_61;
      case 2uLL:
        if ((id)-[MRDMediaActivityManager activeBannerState](self, "activeBannerState") != (id)1)
        {
          uint64_t v36 = _MRLogForCategory(13LL, v35);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            int v74 = 138412546;
            id v75 = v7;
            __int16 v76 = 2112;
            id v77 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM unexpected event %@ while current state is %@, letting it slide.",  (uint8_t *)&v74,  0x16u);
          }
        }

        v33 = self;
        uint64_t v34 = 3LL;
        goto LABEL_61;
      case 3uLL:
        if (!-[MRDMediaActivityManager activeBannerState](self, "activeBannerState"))
        {
          v33 = self;
          uint64_t v34 = 1LL;
LABEL_61:
          -[MRDMediaActivityManager setActiveBannerState:](v33, "setActiveBannerState:", v34);
          goto LABEL_83;
        }

        uint64_t v39 = _MRLogForCategory(13LL, v38);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_51;
        }
        int v74 = 138412546;
        id v75 = v7;
        __int16 v76 = 2112;
        id v77 = v19;
        v41 = "[MRDRRC].MAM unexpected event %@ while current state is %@, ignoring.";
        break;
      case 4uLL:
        if ((id)-[MRDMediaActivityManager activeBannerState](self, "activeBannerState") != (id)1)
        {
          uint64_t v43 = _MRLogForCategory(13LL, v42);
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            int v74 = 138412546;
            id v75 = v7;
            __int16 v76 = 2112;
            id v77 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM unexpected event %@ while current state is %@, letting it slide.",  (uint8_t *)&v74,  0x16u);
          }
        }

        v33 = self;
        uint64_t v34 = 4LL;
        goto LABEL_61;
      default:
        goto LABEL_83;
    }

    goto LABEL_50;
  }

  uint64_t v19 = (void *)*((void *)&off_1003A3290 + v17);
  if (v10) {
    goto LABEL_13;
  }
LABEL_8:
  if (!v13)
  {
    uint64_t v24 = _MRLogForCategory(13LL, v18);
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activeRequest](self, "activeRequest"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 requestIdentifier]);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager activePillRequest](self, "activePillRequest"));
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 requestIdentifier]);
      int v74 = 138412802;
      id v75 = v6;
      __int16 v76 = 2112;
      id v77 = v27;
      __int16 v78 = 2112;
      v79[0] = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM got unexpected event from %@. active route is %@ active pill is %@",  (uint8_t *)&v74,  0x20u);
    }

    goto LABEL_83;
  }

  switch(a4)
  {
    case 0uLL:
      unint64_t v20 = -[MRDMediaActivityManager activePillBannerState](self, "activePillBannerState") - 1;
      if (v20 > 3) {
        unint64_t v21 = 0LL;
      }
      else {
        unint64_t v21 = qword_10034BB38[v20];
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pillCompletion](self, "pillCompletion"));

      if (v63)
      {
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MRDMediaActivityManager pillCompletion](self, "pillCompletion"));
        (*((void (**)(os_log_s *, unint64_t, void))v65 + 2))(v65, v21, 0LL);
      }

      else
      {
        uint64_t v66 = _MRLogForCategory(13LL, v64);
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          if (v21 > 4) {
            v67 = 0LL;
          }
          else {
            v67 = (void *)*((void *)&off_1003A32B8 + v21);
          }
          int v74 = 138412546;
          id v75 = v67;
          __int16 v76 = 2112;
          id v77 = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM Would have called pill completion with result %@ error %@ but completion is nil",  (uint8_t *)&v74,  0x16u);
        }
      }

      -[MRDMediaActivityManager setActivePillBannerState:](self, "setActivePillBannerState:", 0LL);
      -[MRDMediaActivityManager setActivePillRequest:](self, "setActivePillRequest:", 0LL);
      uint64_t v72 = _MRLogForCategory(13LL, v71);
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v74) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM cleared activePillRequest",  (uint8_t *)&v74,  2u);
      }

      -[MRDMediaActivityManager setPillCompletion:](self, "setPillCompletion:", 0LL);
      -[MRDMediaActivityManager dequeueNextPendingRequest](self, "dequeueNextPendingRequest");
      goto LABEL_83;
    case 1uLL:
      if ((id)-[MRDMediaActivityManager activePillBannerState](self, "activePillBannerState") != (id)1)
      {
        uint64_t v46 = _MRLogForCategory(13LL, v45);
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          int v74 = 138412546;
          id v75 = v7;
          __int16 v76 = 2112;
          id v77 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM unexpected pill event %@ while current state is %@, letting it slide.",  (uint8_t *)&v74,  0x16u);
        }
      }

      v48 = self;
      uint64_t v49 = 2LL;
      goto LABEL_69;
    case 2uLL:
      if ((id)-[MRDMediaActivityManager activePillBannerState](self, "activePillBannerState") != (id)1)
      {
        uint64_t v51 = _MRLogForCategory(13LL, v50);
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          int v74 = 138412546;
          id v75 = v7;
          __int16 v76 = 2112;
          id v77 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM unexpected pill event %@ while current state is %@, letting it slide.",  (uint8_t *)&v74,  0x16u);
        }
      }

      v48 = self;
      uint64_t v49 = 3LL;
      goto LABEL_69;
    case 3uLL:
      if (!-[MRDMediaActivityManager activePillBannerState](self, "activePillBannerState"))
      {
        v48 = self;
        uint64_t v49 = 1LL;
LABEL_69:
        -[MRDMediaActivityManager setActivePillBannerState:](v48, "setActivePillBannerState:", v49);
        goto LABEL_83;
      }

      uint64_t v54 = _MRLogForCategory(13LL, v53);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      int v74 = 138412546;
      id v75 = v7;
      __int16 v76 = 2112;
      id v77 = v19;
      v41 = "[MRDRRC].MAM unexpected pill event %@ while current state is %@, ignoring.";
      break;
    case 4uLL:
      if ((id)-[MRDMediaActivityManager activePillBannerState](self, "activePillBannerState") != (id)1)
      {
        uint64_t v56 = _MRLogForCategory(13LL, v55);
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          int v74 = 138412546;
          id v75 = v7;
          __int16 v76 = 2112;
          id v77 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].MAM unexpected pill event %@ while current state is %@, letting it slide.",  (uint8_t *)&v74,  0x16u);
        }
      }

      v48 = self;
      uint64_t v49 = 4LL;
      goto LABEL_69;
    default:
      goto LABEL_83;
  }

- (void)presentControlCenterCallToActionVideo:(BOOL)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (MRDBannerCenter)bannerCenter
{
  return self->_bannerCenter;
}

- (void)setBannerCenter:(id)a3
{
}

- (MRDBannerCenter)pillCenter
{
  return self->_pillCenter;
}

- (void)setPillCenter:(id)a3
{
}

- (unint64_t)activePillBannerState
{
  return self->_activePillBannerState;
}

- (void)setActivePillBannerState:(unint64_t)a3
{
  self->_activePillBannerState = a3;
}

- (unint64_t)activeBannerState
{
  return self->_activeBannerState;
}

- (void)setActiveBannerState:(unint64_t)a3
{
  self->_activeBannerState = a3;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)pillCompletion
{
  return self->_pillCompletion;
}

- (void)setPillCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end