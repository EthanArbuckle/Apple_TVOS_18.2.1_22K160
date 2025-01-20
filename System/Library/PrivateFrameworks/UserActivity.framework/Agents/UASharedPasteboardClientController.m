@interface UASharedPasteboardClientController
- (BOOL)advertiseTypes;
- (BOOL)hasFetchedLocalData;
- (BOOL)isScreenWatcherPresent;
- (BOOL)isUIVisible;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)localReflection;
- (BOOL)remoteAvailable;
- (NSArray)currentLocalPasteboard;
- (NSBundle)uaBundle;
- (NSDate)dontHideUIBefore;
- (NSMutableSet)controlConnections;
- (NSProgress)fetchProgress;
- (NSTimer)localTimeout;
- (NSTimer)showUITimer;
- (NSXPCConnection)auxConnection;
- (NSXPCConnection)clientConnection;
- (NSXPCConnection)clientNotificationConnection;
- (NSXPCConnection)osxUIConnection;
- (NSXPCListener)auxlistener;
- (NSXPCListener)controlListener;
- (NSXPCListener)xpclistener;
- (OS_dispatch_queue)clientq;
- (OS_dispatch_semaphore)pboardFetchSem;
- (SFCompanionAdvertiser)pasteAdvertiser;
- (UARemotePasteboardDidSendLocalEvent)localInfo;
- (UARemotePasteboardWasRequestedEvent)pasteInfo;
- (UASharedPasteboardClientController)initWithManager:(id)a3 name:(id)a4;
- (UASharedPasteboardInfo)currentLocalTypes;
- (UASharedPasteboardInfoWrapper)pboardInfoToSend;
- (UASharedPasteboardInputStreamManager)inStream;
- (UASharedPasteboardOutputStreamManager)outStream;
- (UCRemotePasteboardGeneration)remoteGeneration;
- (UCStreamCoder)coders;
- (__CFUserNotification)notificationRef;
- (id)currentPasteboardActivityInfo;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)localPBStatus;
- (id)statusString;
- (id)uuid;
- (int64_t)currentLocalPasteboardSize;
- (int64_t)sendingCoderVersion;
- (unint64_t)currentLocalGeneration;
- (unint64_t)localSendStartTime;
- (unint64_t)pasteFetchStartTime;
- (unint64_t)streamOpenStartTime;
- (unint64_t)streamXferStartTime;
- (void)advertiser:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
- (void)clearLocalPasteboardInformation;
- (void)clearLocalPasteboardTypes:(id)a3;
- (void)dealloc;
- (void)fetchRemoteDeviceName:(id)a3;
- (void)fetchRemotePasteboardForProcess:(int)a3 withCompletion:(id)a4;
- (void)fetchRemotePasteboardStatus:(id)a3;
- (void)fetchRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4;
- (void)getLocalPasteboardInfoData:(id)a3;
- (void)hideProgressUI:(BOOL)a3;
- (void)localPasteboardTypesDidChange:(id)a3 forGeneration:(unint64_t)a4;
- (void)receivePasteboardStreamData:(id)a3 version:(int64_t)a4 withCompletion:(id)a5;
- (void)removeLocalPasteboardFromAdvertisers:(id)a3;
- (void)setAdvertiseTypes:(BOOL)a3;
- (void)setAuxConnection:(id)a3;
- (void)setAuxlistener:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setClientNotificationConnection:(id)a3;
- (void)setClientq:(id)a3;
- (void)setCoders:(id)a3;
- (void)setControlConnections:(id)a3;
- (void)setControlListener:(id)a3;
- (void)setCurrentLocalGeneration:(unint64_t)a3;
- (void)setCurrentLocalPasteboard:(id)a3;
- (void)setCurrentLocalPasteboardSize:(int64_t)a3;
- (void)setCurrentLocalTypes:(id)a3;
- (void)setDontHideUIBefore:(id)a3;
- (void)setFetchProgress:(id)a3;
- (void)setHasFetchedLocalData:(BOOL)a3;
- (void)setInStream:(id)a3;
- (void)setIsUIVisible:(BOOL)a3;
- (void)setLocalInfo:(id)a3;
- (void)setLocalPasteboardReflection:(BOOL)a3;
- (void)setLocalReflection:(BOOL)a3;
- (void)setLocalSendStartTime:(unint64_t)a3;
- (void)setLocalTimeout:(id)a3;
- (void)setNotificationRef:(__CFUserNotification *)a3;
- (void)setOsxUIConnection:(id)a3;
- (void)setOutStream:(id)a3;
- (void)setPasteAdvertiser:(id)a3;
- (void)setPasteFetchStartTime:(unint64_t)a3;
- (void)setPasteInfo:(id)a3;
- (void)setPboardFetchSem:(id)a3;
- (void)setPboardInfoToSend:(id)a3;
- (void)setRemoteAvailable:(BOOL)a3;
- (void)setRemoteGeneration:(id)a3;
- (void)setRemotePasteboardAvalibility:(BOOL)a3 withDataRequester:(id)a4;
- (void)setReturnPasteboardDataEarlyWithCompletion:(id)a3;
- (void)setScreenWatcherPresent:(BOOL)a3;
- (void)setSendingCoderVersion:(int64_t)a3;
- (void)setShowUITimer:(id)a3;
- (void)setStreamOpenStartTime:(unint64_t)a3;
- (void)setStreamXferStartTime:(unint64_t)a3;
- (void)setUaBundle:(id)a3;
- (void)setXpclistener:(id)a3;
- (void)showProgressUI:(id)a3;
- (void)startConnection:(int)a3;
- (void)startServiceForPasteVersion:(int64_t)a3 handler:(id)a4;
@end

@implementation UASharedPasteboardClientController

- (UASharedPasteboardClientController)initWithManager:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___UASharedPasteboardClientController;
  v8 = -[UAClientController initWithManager:name:](&v44, "initWithManager:name:", v6, v7);
  if (v8)
  {
    os_log_t v9 = sub_100039584(@"pasteboard-server");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Creating pboard client controller",  (uint8_t *)buf,  2u);
    }

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.coreservices.uasharedpboardclientq", &_dispatch_queue_attr_concurrent);
    -[UASharedPasteboardClientController setClientq:](v8, "setClientq:", v11);

    v12 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    id v13 = UASharedPasteboardManagerServiceName();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[NSXPCListener initWithMachServiceName:](v12, "initWithMachServiceName:", v14);
    -[UASharedPasteboardClientController setXpclistener:](v8, "setXpclistener:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController xpclistener](v8, "xpclistener"));
    [v16 setDelegate:v8];

    v17 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    id v18 = UASharedPasteboardAUXServiceName();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = -[NSXPCListener initWithMachServiceName:](v17, "initWithMachServiceName:", v19);
    -[UASharedPasteboardClientController setAuxlistener:](v8, "setAuxlistener:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController auxlistener](v8, "auxlistener"));
    [v21 setDelegate:v8];

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[UASharedPasteboardClientController setControlConnections:](v8, "setControlConnections:", v22);

    v23 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    id v24 = UASharedPasteboardControllServiceName();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = -[NSXPCListener initWithMachServiceName:](v23, "initWithMachServiceName:", v25);
    -[UASharedPasteboardClientController setControlListener:](v8, "setControlListener:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController controlListener](v8, "controlListener"));
    [v27 setDelegate:v8];

    v28 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.coreservices.uauseractivitypasteboardclient.xpc",  0LL);
    -[UASharedPasteboardClientController setClientNotificationConnection:](v8, "setClientNotificationConnection:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UAPasteboardClientProtocol));
    v30 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController clientNotificationConnection]( v8,  "clientNotificationConnection"));
    [v30 setRemoteObjectInterface:v29];

    v31 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController clientNotificationConnection]( v8,  "clientNotificationConnection"));
    [v31 setInterruptionHandler:&stru_1000BD330];

    objc_initWeak(buf, v8);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100024E04;
    v41[3] = &unk_1000BCE50;
    objc_copyWeak(&v42, buf);
    v32 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController clientNotificationConnection]( v8,  "clientNotificationConnection"));
    [v32 setInvalidationHandler:v41];

    v33 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[UASharedPasteboardClientController setCoders:](v8, "setCoders:", v33);

    -[UASharedPasteboardClientController setRemoteAvailable:](v8, "setRemoteAvailable:", 0LL);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/UserActivity.framework"));
    -[UASharedPasteboardClientController setUaBundle:](v8, "setUaBundle:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController uaBundle](v8, "uaBundle"));
    [v35 load];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController xpclistener](v8, "xpclistener"));
    [v36 resume];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController auxlistener](v8, "auxlistener"));
    [v37 resume];

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController controlListener](v8, "controlListener"));
    [v38 resume];

    v39 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController clientNotificationConnection]( v8,  "clientNotificationConnection"));
    [v39 resume];

    objc_destroyWeak(&v42);
    objc_destroyWeak(buf);
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController clientConnection](self, "clientConnection"));
  [v3 invalidate];

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController clientNotificationConnection]( self,  "clientNotificationConnection"));
  [v4 invalidate];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController xpclistener](self, "xpclistener"));
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UASharedPasteboardClientController;
  -[UASharedPasteboardClientController dealloc](&v6, "dealloc");
}

- (id)uuid
{
  if (qword_1000DE2F8 != -1) {
    dispatch_once(&qword_1000DE2F8, &stru_1000BD350);
  }
  return (id)qword_1000DE2F0;
}

- (BOOL)localReflection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned __int8 v3 = [v2 localPasteboardRefection];

  return v3;
}

- (void)setLocalReflection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v4 setLocalPasteboardReflection:v3];
}

- (BOOL)isScreenWatcherPresent
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL screenWatcherPresent = v2->_screenWatcherPresent;
  objc_sync_exit(v2);

  return screenWatcherPresent;
}

- (void)setScreenWatcherPresent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_screenWatcherPresent != v3)
  {
    v4->_BOOL screenWatcherPresent = v3;
    if (v3)
    {
      os_log_t v5 = sub_100039584(@"pasteboard-server");
      objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Screen sharing session started, disabling universal clipboard",  buf,  2u);
      }

      -[UASharedPasteboardClientController setRemotePasteboardAvalibility:withDataRequester:]( v4,  "setRemotePasteboardAvalibility:withDataRequester:",  0LL,  0LL);
      -[UASharedPasteboardClientController clearLocalPasteboardInformation](v4, "clearLocalPasteboardInformation");
    }

    else
    {
      os_log_t v7 = sub_100039584(@"pasteboard-server");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)os_log_t v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] No more screen sharing sessions, enabling universal clipboard",  v9,  2u);
      }
    }
  }

  objc_sync_exit(v4);
}

- (void)startConnection:(int)a3
{
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Process %d requested for UC to disable",  (uint8_t *)v6,  8u);
  }
}

- (id)eligibleAdvertiseableItemsInOrder
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController currentPasteboardActivityInfo]( self,  "currentPasteboardActivityInfo"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
    int v10 = 138412290;
    dispatch_queue_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "[PBOARD CONTROLLER] Return Client Items in Order: %@",  (uint8_t *)&v10,  0xCu);
  }

  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController currentPasteboardActivityInfo]( self,  "currentPasteboardActivityInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  return v8;
}

- (id)currentPasteboardActivityInfo
{
  if (!-[UASharedPasteboardClientController advertiseTypes](self, "advertiseTypes")) {
    return 0LL;
  }
  os_log_t v3 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardActivityInfo);
  -[UASharedPasteboardActivityInfo setActivityType:](v3, "setActivityType:", @"com.apple.continuitypasteboard");
  -[UASharedPasteboardActivityInfo setType:](v3, "setType:", 1LL);
  os_log_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalTypes](self, "currentLocalTypes", 0LL));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) types]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
        -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:", v12);
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  -[UASharedPasteboardActivityInfo setGeneration:]( v3,  "setGeneration:",  -[UASharedPasteboardClientController currentLocalGeneration](self, "currentLocalGeneration"));
  -[UASharedPasteboardActivityInfo setPasteboardTypes:](v3, "setPasteboardTypes:", v4);
  -[UASharedPasteboardActivityInfo setEligibleForHandoff:](v3, "setEligibleForHandoff:", 1LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController uuid](self, "uuid"));
  -[UASharedPasteboardActivityInfo setUuid:](v3, "setUuid:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));
  return v14;
}

- (void)setRemotePasteboardAvalibility:(BOOL)a3 withDataRequester:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!-[UASharedPasteboardClientController isScreenWatcherPresent](self, "isScreenWatcherPresent") || !v4)
  {
    id v7 = self;
    objc_sync_enter(v7);
    if (v6 && v4)
    {
      id v8 = -[UCRemotePasteboardGeneration initWithRequester:]( objc_alloc(&OBJC_CLASS___UCRemotePasteboardGeneration),  "initWithRequester:",  v6);
      -[UASharedPasteboardClientController setRemoteGeneration:](v7, "setRemoteGeneration:", v8);
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController fetchProgress](v7, "fetchProgress"));

      if (!v9) {
        -[UASharedPasteboardClientController setRemoteGeneration:](v7, "setRemoteGeneration:", 0LL);
      }
    }

    os_log_t v10 = sub_100039584(@"pasteboard-server");
    dispatch_queue_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = @"NO";
      if (v4) {
        v12 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      __int128 v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Sending client xpc remote available update: %@",  buf,  0xCu);
    }

    if (v4)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v7, "remoteGeneration"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100025700;
      v16[3] = &unk_1000BD378;
      v16[4] = v7;
      [v13 requestRemoteTypeInfo:v16];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardClientController clientNotificationConnection]( v7,  "clientNotificationConnection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteObjectProxyWithErrorHandler:&stru_1000BD3B8]);
    [v15 remotePasteboardAvailable:v4];

    objc_sync_exit(v7);
  }
}

- (void)setReturnPasteboardDataEarlyWithCompletion:(id)a3
{
  id v8 = (void (**)(id, BOOL))a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v4, "remoteGeneration"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v4, "remoteGeneration"));
    [v6 setReturnEarly:1];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v4, "remoteGeneration"));
    v8[2](v8, [v7 state] == (id)5);
  }

  else
  {
    v8[2](v8, 1);
  }

  objc_sync_exit(v4);
}

- (void)fetchRemotePasteboardStatus:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](self, "remoteGeneration"));
  (*((void (**)(id, BOOL))a3 + 2))(v5, v6 != 0LL);
}

- (void)fetchRemoteDeviceName:(id)a3
{
  id v5 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](self, "remoteGeneration"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 dataRequester]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 peer]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  (*((void (**)(id, void *))a3 + 2))(v5, v8);
}

- (void)localPasteboardTypesDidChange:(id)a3 forGeneration:(unint64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v38 = a4;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Got type update from client, gen: %lu, %@",  buf,  0x16u);
  }

  if (-[UASharedPasteboardClientController isScreenWatcherPresent](self, "isScreenWatcherPresent"))
  {
    os_log_t v9 = sub_100039584(@"pasteboard-server");
    os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      dispatch_queue_t v11 = "[PBOARD CONTROLLER] Ignoring type updates, screen sharing session in progress";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_21;
    }

    goto LABEL_21;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  unsigned __int8 v13 = [v12 clipboardSharingEnabled];

  if ((v13 & 1) == 0)
  {
    os_log_t v21 = sub_100039584(@"pasteboard-server");
    os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      dispatch_queue_t v11 = "[PBOARD CONTROLLER] Ignoring type updates, clipboard sharing disabled";
      goto LABEL_15;
    }

- (void)clearLocalPasteboardInformation
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Clear local pasteboard info: from client",  v6,  2u);
  }

  -[UASharedPasteboardClientController setCurrentLocalGeneration:](self, "setCurrentLocalGeneration:", 0LL);
  -[UASharedPasteboardClientController clearLocalPasteboardTypes:](self, "clearLocalPasteboardTypes:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
  [v5 submitLocalPasteboardInfoWasCleared];
}

- (void)clearLocalPasteboardTypes:(id)a3
{
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Remove Local Types Fired",  v16,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController pasteAdvertiser](self, "pasteAdvertiser"));
  [v6 stop];

  -[UASharedPasteboardClientController setPasteAdvertiser:](self, "setPasteAdvertiser:", 0LL);
  -[UASharedPasteboardClientController setCurrentLocalTypes:](self, "setCurrentLocalTypes:", 0LL);
  -[UASharedPasteboardClientController setCurrentLocalPasteboard:](self, "setCurrentLocalPasteboard:", 0LL);
  -[UASharedPasteboardClientController setCurrentLocalPasteboardSize:](self, "setCurrentLocalPasteboardSize:", 0LL);
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localInfo](self, "localInfo"));

  if (!v7) {
    -[UASharedPasteboardClientController setPboardInfoToSend:](self, "setPboardInfoToSend:", 0LL);
  }
  if (-[UASharedPasteboardClientController localReflection](self, "localReflection")) {
    -[UASharedPasteboardClientController setRemotePasteboardAvalibility:withDataRequester:]( self,  "setRemotePasteboardAvalibility:withDataRequester:",  0LL,  0LL);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localTimeout](self, "localTimeout"));
  [v8 invalidate];

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v9 scheduleUpdatingAdvertisableItems];

  os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v10 localPasteboardAvalibilityClearedTimeout];
  double v12 = v11;

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "removeLocalPasteboardFromAdvertisers:",  0LL,  0LL,  v12));
  -[UASharedPasteboardClientController setLocalTimeout:](self, "setLocalTimeout:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localTimeout](self, "localTimeout"));
  [v14 addTimer:v15 forMode:NSRunLoopCommonModes];
}

- (void)removeLocalPasteboardFromAdvertisers:(id)a3
{
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Remove Local Timer Fired",  v8,  2u);
  }

  -[UASharedPasteboardClientController setAdvertiseTypes:](self, "setAdvertiseTypes:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localTimeout](self, "localTimeout"));
  [v6 invalidate];

  -[UASharedPasteboardClientController setLocalTimeout:](self, "setLocalTimeout:", 0LL);
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v7 scheduleUpdatingAdvertisableItems];
}

- (void)fetchRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, UASharedPasteboardClientController *, void))a4;
  os_log_t v6 = sub_100039584(@"pasteboard-server");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Pasteboard types fetch requested",  buf,  2u);
  }

  if (-[UASharedPasteboardClientController localReflection](self, "localReflection"))
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardInfo);
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalPasteboard](self, "currentLocalPasteboard"));
    -[UASharedPasteboardClientController setItems:](v8, "setItems:", v9);

    v5[2](v5, v8, 0LL);
  }

  else
  {
    id v8 = self;
    objc_sync_enter(v8);
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v8, "remoteGeneration"));

    if (v10)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v8, "remoteGeneration"));
      id v12 = [v11 state];

      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v8, "remoteGeneration"));
      if ((unint64_t)v12 < 3)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_100026410;
        v15[3] = &unk_1000BD3E0;
        v15[4] = v8;
        __int128 v16 = v5;
        [v13 requestRemoteTypeInfo:v15];

        unsigned __int8 v13 = v16;
      }

      else
      {
        v14 = (UASharedPasteboardClientController *)objc_claimAutoreleasedReturnValue([v13 pbInfo]);
        v5[2](v5, v14, 0LL);
      }
    }

    else
    {
      v5[2](v5, 0LL, 0LL);
    }

    objc_sync_exit(v8);
  }
}

- (void)fetchRemotePasteboardForProcess:(int)a3 withCompletion:(id)a4
{
  v83[0] = 0LL;
  v83[1] = v83;
  v83[2] = 0x2020000000LL;
  char v84 = 0;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_100026E0C;
  v80[3] = &unk_1000BD408;
  v82 = v83;
  v80[4] = self;
  id v60 = a4;
  id v81 = v60;
  v59 = objc_retainBlock(v80);
  os_log_t v6 = sub_100039584(@"pasteboard-server");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v90) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Pasteboard data fetch requested for pid: %d",  buf,  8u);
  }

  if (!-[UASharedPasteboardClientController localReflection](self, "localReflection"))
  {
    double v11 = self;
    objc_sync_enter(v11);
    val = (UASharedPasteboardInfo *)v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v11, "remoteGeneration"));
    LODWORD(v11) = [v12 state] == (id)5;

    if ((_DWORD)v11)
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo remoteGeneration](val, "remoteGeneration"));
      id v57 = (id)objc_claimAutoreleasedReturnValue([v13 pbInfo]);

      os_log_t v14 = sub_100039584(@"pasteboard-server");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v90 = *(double *)&v57;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Already have remote data, using it: %@",  buf,  0xCu);
      }

      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v57 items]);
      id v64 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
      if (v64)
      {
        uint64_t v63 = *(void *)v77;
        do
        {
          v65 = 0LL;
          do
          {
            if (*(void *)v77 != v63) {
              objc_enumerationMutation(obj);
            }
            __int128 v16 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)v65);
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            __int128 v75 = 0u;
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 types]);
            id v18 = [v17 countByEnumeratingWithState:&v72 objects:v87 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v73;
              do
              {
                v20 = 0LL;
                do
                {
                  if (*(void *)v73 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 remotePasteboardBlobForReading]);
                  id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 types]);
                  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v21]);
                  [v25 setDataFile:v23];

                  v20 = (char *)v20 + 1;
                }

                while (v18 != v20);
                id v18 = [v17 countByEnumeratingWithState:&v72 objects:v87 count:16];
              }

              while (v18);
            }

            v65 = (char *)v65 + 1;
          }

          while (v65 != v64);
          id v64 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
        }

        while (v64);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 remotePasteboardBlobForReading]);
      [v57 setDataFile:v27];

      (*((void (**)(id, id, void))v60 + 2))(v60, v57, 0LL);
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo remoteGeneration](val, "remoteGeneration"));
      BOOL v29 = [v28 state] == (id)6;

      if (v29)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -125LL,  0LL));
        (*((void (**)(id, void, void *))v60 + 2))(v60, 0LL, v58);

LABEL_32:
        objc_sync_exit(val);
        goto LABEL_33;
      }

      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo remoteGeneration](val, "remoteGeneration"));

      if (!v30)
      {
        ((void (*)(void *, void, void))v59[2])(v59, 0LL, 0LL);
        goto LABEL_32;
      }

      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo remoteGeneration](val, "remoteGeneration"));
      os_log_t v32 = sub_100039584(@"pasteboard-server");
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Requesting data from remote device",  buf,  2u);
      }

      -[UASharedPasteboardInfo setPasteFetchStartTime:](val, "setPasteFetchStartTime:", mach_absolute_time());
      v34 = objc_alloc_init(&OBJC_CLASS___UARemotePasteboardWasRequestedEvent);
      -[UASharedPasteboardInfo setPasteInfo:](val, "setPasteInfo:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo remoteGeneration](val, "remoteGeneration"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 dataRequester]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 peer]);
      unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 modelIdentifier]);
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo pasteInfo](val, "pasteInfo"));
      [v39 setRemoteDeviceType:v38];

      id v40 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      [v40 pasteboardShowUIDelay];
      double v42 = v41;

      os_log_t v43 = sub_100039584(@"pasteboard-server");
      objc_super v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v90 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Starting timer to show UI in %lf sec",  buf,  0xCu);
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  val,  "showProgressUI:",  0LL,  0LL,  v42));
      -[UASharedPasteboardInfo setShowUITimer:](val, "setShowUITimer:", v45);

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo showUITimer](val, "showUITimer"));
      [v46 addTimer:v47 forMode:NSRunLoopCommonModes];

      objc_initWeak((id *)buf, val);
      v48 = objc_alloc(&OBJC_CLASS___NSProgress);
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress currentProgress](&OBJC_CLASS___NSProgress, "currentProgress"));
      uint64_t v85 = NSProgressCategoryKey;
      v86 = @"UASharedPasteboard";
      v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
      v51 = -[NSProgress initWithParent:userInfo:](v48, "initWithParent:userInfo:", v49, v50);
      -[UASharedPasteboardInfo setFetchProgress:](val, "setFetchProgress:", v51);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo fetchProgress](val, "fetchProgress"));
      [v52 setKind:NSProgressKindFile];

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo fetchProgress](val, "fetchProgress"));
      [v53 setCancellable:1];

      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = sub_100026EEC;
      v69[3] = &unk_1000BD430;
      objc_copyWeak(&v71, (id *)buf);
      v54 = v59;
      id v70 = v54;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo fetchProgress](val, "fetchProgress"));
      [v55 setCancellationHandler:v69];

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfo fetchProgress](val, "fetchProgress"));
      [v56 _publish];

      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_10002718C;
      v66[3] = &unk_1000BD458;
      v66[4] = val;
      v68 = v54;
      id v67 = v31;
      id v57 = v67;
      [v67 requestRemotePasteboardData:v66];

      objc_destroyWeak(&v71);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_32;
  }

  val = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardInfo);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localPasteboardBlobForReading]);
  -[UASharedPasteboardInfo setDataFile:](val, "setDataFile:", v9);

  os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalPasteboard](self, "currentLocalPasteboard"));
  -[UASharedPasteboardInfo setItems:](val, "setItems:", v10);

  -[UASharedPasteboardInfo setDataSize:]( val,  "setDataSize:",  -[UASharedPasteboardClientController currentLocalPasteboardSize](self, "currentLocalPasteboardSize"));
  (*((void (**)(id, UASharedPasteboardInfo *, void))v60 + 2))(v60, val, 0LL);
LABEL_33:

  _Block_object_dispose(v83, 8);
}

- (void)receivePasteboardStreamData:(id)a3 version:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController pasteInfo](self, "pasteInfo"));
  [v10 setUsedStreams:1];

  if (objc_opt_class(&OBJC_CLASS___SFCompanionAdvertiser)) {
    double v11 = -[SFCompanionAdvertiser initWithServiceType:]( objc_alloc(&OBJC_CLASS___SFCompanionAdvertiser),  "initWithServiceType:",  0LL);
  }
  else {
    double v11 = 0LL;
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  unsigned __int8 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027B50;
  block[3] = &unk_1000BD4F8;
  id v20 = v9;
  int64_t v21 = a4;
  block[4] = self;
  id v18 = v11;
  id v19 = v8;
  id v14 = v9;
  id v15 = v8;
  __int128 v16 = v11;
  dispatch_async(v13, block);
}

- (void)setLocalPasteboardReflection:(BOOL)a3
{
}

- (void)getLocalPasteboardInfoData:(id)a3
{
  os_log_t v4 = (void (**)(id, void *, void))a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardInfoWrapper);
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalTypes](self, "currentLocalTypes"));
  -[UASharedPasteboardInfoWrapper setPbinfo:](v5, "setPbinfo:", v6);

  -[UASharedPasteboardInfoWrapper setProtocolVersion:](v5, "setProtocolVersion:", 2LL);
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    double v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[PBOARD CONTROLLER] Archiving pbinfo: %@",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  0LL));
  v4[2](v4, v9, 0LL);
}

- (void)startServiceForPasteVersion:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  -[UASharedPasteboardClientController setLocalSendStartTime:](self, "setLocalSendStartTime:", mach_absolute_time());
  os_log_t v7 = objc_alloc_init(&OBJC_CLASS___UARemotePasteboardDidSendLocalEvent);
  -[UASharedPasteboardClientController setLocalInfo:](self, "setLocalInfo:", v7);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100029944;
  v34[3] = &unk_1000BD290;
  v34[4] = self;
  id v8 = v6;
  id v35 = v8;
  id v9 = objc_retainBlock(v34);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100029B98;
  v31[3] = &unk_1000BD520;
  int64_t v33 = a3;
  v31[4] = self;
  id v10 = v8;
  id v32 = v10;
  double v11 = objc_retainBlock(v31);
  if (-[UASharedPasteboardClientController hasFetchedLocalData](self, "hasFetchedLocalData"))
  {
    os_log_t v12 = sub_100039584(@"pasteboard-server");
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Pasteboard data alread fetched sending now",  buf,  2u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController pboardInfoToSend](self, "pboardInfoToSend"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pbinfo]);
    id v16 = [v15 dataSize];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    id v18 = [v17 pasteboardEmbeddedPayloadSizeLimitInBytes];

    else {
      ((void (*)(void *))v9[2])(v9);
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController pboardFetchSem](self, "pboardFetchSem"));

    if (!v19)
    {
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
      -[UASharedPasteboardClientController setPboardFetchSem:](self, "setPboardFetchSem:", v20);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100029DF0;
    v26[3] = &unk_1000BD598;
    v26[4] = self;
    id v27 = v10;
    v28 = v9;
    BOOL v29 = v11;
    int64_t v21 = objc_retainBlock(v26);
    v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController clientq](self, "clientq"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10002A924;
    v24[3] = &unk_1000BD290;
    v24[4] = self;
    id v25 = v21;
    v23 = v21;
    dispatch_async(v22, v24);
  }
}

- (void)advertiser:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_t v11 = sub_100039584(@"pasteboard-server");
  os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Received streams, waiting for local data to be available",  (uint8_t *)buf,  2u);
  }

  unint64_t v13 = +[UADiagnosticUtils absoluteToNSec:]( &OBJC_CLASS___UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - -[UASharedPasteboardClientController streamOpenStartTime](self, "streamOpenStartTime"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localInfo](self, "localInfo"));
  [v14 setStreamOpenDelay:v13];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController pboardFetchSem](self, "pboardFetchSem"));
  if (!v15
    || (id v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController pboardFetchSem](self, "pboardFetchSem")),
        dispatch_time_t v17 = dispatch_time(0LL, 2000000000LL),
        uint64_t v18 = dispatch_semaphore_wait(v16, v17),
        v16,
        -[UASharedPasteboardClientController setPboardFetchSem:](self, "setPboardFetchSem:", 0LL),
        !v18))
  {
    os_log_t v22 = sub_100039584(@"pasteboard-server");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Local data available, starting out stream",  (uint8_t *)buf,  2u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController pboardInfoToSend](self, "pboardInfoToSend"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 localPasteboardBlobForReading]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 pbinfo]);
    [v27 setDataFile:v26];

    objc_initWeak(buf, self);
    -[UASharedPasteboardClientController setStreamXferStartTime:](self, "setStreamXferStartTime:", mach_absolute_time());
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10002AFD4;
    v32[3] = &unk_1000BD5E8;
    objc_copyWeak(&v33, buf);
    v28 = objc_retainBlock(v32);
    if ((id)-[UASharedPasteboardClientController sendingCoderVersion](self, "sendingCoderVersion") == (id)1)
    {
      BOOL v29 = -[UAPBStreamCoderV1 initWithInputStream:outputStream:]( objc_alloc(&OBJC_CLASS___UAPBStreamCoderV1),  "initWithInputStream:outputStream:",  v9,  v10);
      -[UAPBStreamCoderV1 sendPasteboard:withCompletion:](v29, "sendPasteboard:withCompletion:", v24, v28);
      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController coders](self, "coders"));
      objc_sync_enter(v30);
      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController coders](self, "coders"));
      [v31 addObject:v29];
    }

    else
    {
      if ((id)-[UASharedPasteboardClientController sendingCoderVersion](self, "sendingCoderVersion") != (id)2)
      {
LABEL_15:

        objc_destroyWeak(&v33);
        objc_destroyWeak(buf);

        goto LABEL_16;
      }

      BOOL v29 = -[UCStreamCoderV2 initWithInputStream:outputStream:]( objc_alloc(&OBJC_CLASS___UCStreamCoderV2),  "initWithInputStream:outputStream:",  v9,  v10);
      -[UAPBStreamCoderV1 sendPasteboard:withCompletion:](v29, "sendPasteboard:withCompletion:", v24, v28);
      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController coders](self, "coders"));
      objc_sync_enter(v30);
      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController coders](self, "coders"));
      [v31 addObject:v29];
    }

    objc_sync_exit(v30);
    goto LABEL_15;
  }

  os_log_t v19 = sub_100039584(@"pasteboard-server");
  dispatch_semaphore_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Timeout getting local pasteboard",  (uint8_t *)buf,  2u);
  }

  sub_1000282E8(v21, v9, v10);
LABEL_16:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  os_log_t v7 = (UAAuditToken *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[UAAuditToken valueForEntitlement:]( v7,  "valueForEntitlement:",  @"com.apple.private.coreservices.useractivityd.sharedpasteboard"));
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) == 0)
  {
    os_log_t v20 = sub_100039584(@"pasteboard-server");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      os_log_t v22 = objc_alloc(&OBJC_CLASS___UAAuditToken);
      if (v7) {
        -[UAAuditToken auditToken](v7, "auditToken");
      }
      else {
        memset(v50, 0, sizeof(v50));
      }
      unint64_t v38 = -[UAAuditToken initWithAuditToken:](v22, "initWithAuditToken:", v50);
      *(_DWORD *)buf = 138412290;
      v52 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] New client connection does not have correct entitlement: %@",  buf,  0xCu);
    }

    -[UAAuditToken invalidate](v7, "invalidate");
    goto LABEL_21;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController xpclistener](self, "xpclistener"));
  unsigned int v11 = [v6 isEqual:v10];

  if (!v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController auxlistener](self, "auxlistener"));
    unsigned int v24 = [v6 isEqual:v23];

    if (v24)
    {
      os_log_t v25 = sub_100039584(@"pasteboard-server");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Received new aux connection: %@",  buf,  0xCu);
      }

      -[UAAuditToken setExportedObject:](v7, "setExportedObject:", self);
      id v27 = sub_10003AD30();
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      -[UAAuditToken setExportedInterface:](v7, "setExportedInterface:", v28);

      -[UAAuditToken setInterruptionHandler:](v7, "setInterruptionHandler:", &stru_1000BD650);
      objc_initWeak((id *)buf, self);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10002BBBC;
      v45[3] = &unk_1000BCE50;
      objc_copyWeak(&v46, (id *)buf);
      -[UAAuditToken setInvalidationHandler:](v7, "setInvalidationHandler:", v45);
      -[UAAuditToken resume](v7, "resume");
      -[UASharedPasteboardClientController setAuxConnection:](self, "setAuxConnection:", v7);
      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);
      goto LABEL_17;
    }

    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController controlListener](self, "controlListener"));
    unsigned int v30 = [v6 isEqual:v29];

    if (v30)
    {
      -[UAAuditToken setExportedObject:](v7, "setExportedObject:", self);
      id v31 = sub_10003ADA4();
      id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      -[UAAuditToken setExportedInterface:](v7, "setExportedInterface:", v32);

      -[UAAuditToken setInterruptionHandler:](v7, "setInterruptionHandler:", &stru_1000BD670);
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v7);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_10002BC48;
      v41[3] = &unk_1000BD698;
      objc_copyWeak(&v42, (id *)buf);
      objc_copyWeak(&v43, &location);
      -[UAAuditToken setInvalidationHandler:](v7, "setInvalidationHandler:", v41);
      -[UAAuditToken resume](v7, "resume");
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController controlConnections](self, "controlConnections"));
      objc_sync_enter(v33);
      os_log_t v34 = sub_100039584(@"pasteboard-server");
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v40[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "New Controller connection, disabling UC",  (uint8_t *)v40,  2u);
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController controlConnections](self, "controlConnections"));
      [v36 addObject:v7];

      objc_sync_exit(v33);
      -[UASharedPasteboardClientController setScreenWatcherPresent:](self, "setScreenWatcherPresent:", 1LL);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
      goto LABEL_17;
    }

- (void)showProgressUI:(id)a3
{
  id v4 = a3;
  [v4 invalidate];
  id v5 = self;
  objc_sync_enter(v5);
  if (-[UASharedPasteboardClientController isUIVisible](v5, "isUIVisible"))
  {
    os_log_t v6 = sub_100039584(@"pasteboard-server");
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] show pbui, but already visible, skipping",  (uint8_t *)&v32,  2u);
    }

    objc_sync_exit(v5);
  }

  else
  {
    -[UASharedPasteboardClientController setIsUIVisible:](v5, "setIsUIVisible:", 1LL);
    objc_sync_exit(v5);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    [v8 pasteboardUIMinimumDurration];
    double v10 = v9;

    os_log_t v11 = sub_100039584(@"pasteboard-server");
    os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v32 = 134217984;
      double v33 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Setting durration time for %lf sec",  (uint8_t *)&v32,  0xCu);
    }

    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v10));
    -[UASharedPasteboardClientController setDontHideUIBefore:](v5, "setDontHideUIBefore:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](v5, "remoteGeneration"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataRequester]);
    id v16 = (UASharedPasteboardClientController *)objc_claimAutoreleasedReturnValue([v15 peer]);

    os_log_t v17 = sub_100039584(@"pasteboard-server");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](v16, "name"));
      os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController modelIdentifier](v16, "modelIdentifier"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController deviceColor](v16, "deviceColor"));
      int v32 = 138412802;
      double v33 = *(double *)&v19;
      __int16 v34 = 2112;
      id v35 = v20;
      __int16 v36 = 2112;
      BOOL v37 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Setup progress UI: %@, %@, %@",  (uint8_t *)&v32,  0x20u);
    }

    os_log_t v22 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.coreservices.uasharedpasteboardprogressui.xpc",  0LL);
    -[UASharedPasteboardClientController setOsxUIConnection:](v5, "setOsxUIConnection:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UASharedPasteboardProgressUIProtocol));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController osxUIConnection](v5, "osxUIConnection"));
    [v24 setRemoteObjectInterface:v23];

    os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController osxUIConnection](v5, "osxUIConnection"));
    [v25 resume];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController osxUIConnection](v5, "osxUIConnection"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 remoteObjectProxyWithErrorHandler:&stru_1000BD6B8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController uuid](v5, "uuid"));
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](v16, "name"));
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController modelIdentifier](v16, "modelIdentifier"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController deviceColor](v16, "deviceColor"));
    [v27 showProgressForUUID:v28 fromDevice:v29 deviceModel:v30 deviceColor:v31];

    id v5 = v16;
  }
}

- (void)hideProgressUI:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[UASharedPasteboardClientController setIsUIVisible:](v4, "setIsUIVisible:", 0LL);
  objc_sync_exit(v4);

  double v5 = 0.0;
  if (!v3)
  {
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController dontHideUIBefore](v4, "dontHideUIBefore"));
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    if (v8 < 0.0) {
      double v5 = 0.0;
    }
    else {
      double v5 = v8;
    }
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v9 pasteboardHideUIDelay];
  double v11 = v10;

  os_log_t v12 = sub_100039584(@"pasteboard-server");
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Adding hide delay of %lf sec",  buf,  0xCu);
  }

  os_log_t v14 = sub_100039584(@"pasteboard-server");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  double v16 = v5 + v11;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v17 = @"NO";
    if (v3) {
      os_log_t v17 = @"YES";
    }
    *(_DWORD *)buf = 134218242;
    double v23 = v16;
    __int16 v24 = 2112;
    os_log_t v25 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Hide progress in %lf sec with fail: %@",  buf,  0x16u);
  }

  dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)(v16 * 1000000000.0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002C490;
  v20[3] = &unk_1000BD700;
  v20[4] = v4;
  BOOL v21 = v3;
  dispatch_after(v18, &_dispatch_main_q, v20);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController fetchProgress](v4, "fetchProgress"));
  [v19 _unpublish];
}

- (id)statusString
{
  return &stru_1000BE738;
}

- (id)localPBStatus
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (-[UASharedPasteboardClientController isScreenWatcherPresent](self, "isScreenWatcherPresent"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController controlConnections](self, "controlConnections"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"##### Screen Sharing session in progress, Universal Clipboard is disabled: %lu #####\n",  [v4 count]));
    -[NSMutableString appendString:](v3, "appendString:", v5);
  }

  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController remoteGeneration](self, "remoteGeneration"));
  if (v6) {
    double v7 = @"Available";
  }
  else {
    double v7 = @"Unavailable";
  }
  unint64_t v8 = -[UASharedPasteboardClientController currentLocalGeneration](self, "currentLocalGeneration");
  if (-[UASharedPasteboardClientController isScreenWatcherPresent](self, "isScreenWatcherPresent")) {
    double v9 = @"SCREENSHARING ";
  }
  else {
    double v9 = &stru_1000BE738;
  }
  unsigned int v10 = -[UASharedPasteboardClientController localReflection](self, "localReflection");
  double v11 = @"off";
  if (v10) {
    double v11 = @"ON";
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"##### Continuity Pasteboard: Remote Pasteboard:%@, Local generation=%ld, %@reflection:%@\n",  v7,  v8,  v9,  v11);

  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalPasteboard](self, "currentLocalPasteboard"));
  if (v12)
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalPasteboard](self, "currentLocalPasteboard"));
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          dispatch_time_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * (void)i) description]);
          -[NSMutableString appendFormat:](v3, "appendFormat:", @"  %@\r\n", v18);
        }

        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v15);
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalTypes](self, "currentLocalTypes"));
    os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 items]);
    id v21 = [v20 count];

    if (v21)
    {
      unint64_t v22 = 0LL;
      do
      {
        double v23 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalTypes](self, "currentLocalTypes"));
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 items]);
        os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v22]);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v22));
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 description]);
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"Item: %@ %@\r\n", v26, v27);

        ++v22;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController currentLocalTypes](self, "currentLocalTypes"));
        BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v28 items]);
        id v30 = [v29 count];
      }

      while ((unint64_t)v30 > v22);
    }
  }

  return v3;
}

- (OS_dispatch_queue)clientq
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setClientq:(id)a3
{
}

- (NSXPCListener)xpclistener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setXpclistener:(id)a3
{
}

- (NSXPCListener)auxlistener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAuxlistener:(id)a3
{
}

- (NSXPCListener)controlListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setControlListener:(id)a3
{
}

- (NSXPCConnection)auxConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setAuxConnection:(id)a3
{
}

- (NSXPCConnection)clientConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setClientConnection:(id)a3
{
}

- (NSXPCConnection)clientNotificationConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setClientNotificationConnection:(id)a3
{
}

- (NSMutableSet)controlConnections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setControlConnections:(id)a3
{
}

- (UASharedPasteboardInfo)currentLocalTypes
{
  return (UASharedPasteboardInfo *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setCurrentLocalTypes:(id)a3
{
}

- (unint64_t)currentLocalGeneration
{
  return self->_currentLocalGeneration;
}

- (void)setCurrentLocalGeneration:(unint64_t)a3
{
  self->_currentLocalGeneration = a3;
}

- (NSTimer)localTimeout
{
  return (NSTimer *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setLocalTimeout:(id)a3
{
}

- (BOOL)hasFetchedLocalData
{
  return self->_hasFetchedLocalData;
}

- (void)setHasFetchedLocalData:(BOOL)a3
{
  self->_hasFetchedLocalData = a3;
}

- (NSArray)currentLocalPasteboard
{
  return (NSArray *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setCurrentLocalPasteboard:(id)a3
{
}

- (int64_t)currentLocalPasteboardSize
{
  return self->_currentLocalPasteboardSize;
}

- (void)setCurrentLocalPasteboardSize:(int64_t)a3
{
  self->_currentLocalPasteboardSize = a3;
}

- (BOOL)advertiseTypes
{
  return self->_advertiseTypes;
}

- (void)setAdvertiseTypes:(BOOL)a3
{
  self->_advertiseTypes = a3;
}

- (BOOL)remoteAvailable
{
  return self->_remoteAvailable;
}

- (void)setRemoteAvailable:(BOOL)a3
{
  self->_remoteAvailable = a3;
}

- (SFCompanionAdvertiser)pasteAdvertiser
{
  return (SFCompanionAdvertiser *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setPasteAdvertiser:(id)a3
{
}

- (UCRemotePasteboardGeneration)remoteGeneration
{
  return (UCRemotePasteboardGeneration *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setRemoteGeneration:(id)a3
{
}

- (OS_dispatch_semaphore)pboardFetchSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setPboardFetchSem:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)pboardInfoToSend
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setPboardInfoToSend:(id)a3
{
}

- (UASharedPasteboardOutputStreamManager)outStream
{
  return (UASharedPasteboardOutputStreamManager *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setOutStream:(id)a3
{
}

- (UASharedPasteboardInputStreamManager)inStream
{
  return (UASharedPasteboardInputStreamManager *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setInStream:(id)a3
{
}

- (UCStreamCoder)coders
{
  return (UCStreamCoder *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setCoders:(id)a3
{
}

- (int64_t)sendingCoderVersion
{
  return self->_sendingCoderVersion;
}

- (void)setSendingCoderVersion:(int64_t)a3
{
  self->_sendingCoderVersion = a3;
}

- (NSProgress)fetchProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setFetchProgress:(id)a3
{
}

- (NSTimer)showUITimer
{
  return (NSTimer *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setShowUITimer:(id)a3
{
}

- (NSDate)dontHideUIBefore
{
  return (NSDate *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setDontHideUIBefore:(id)a3
{
}

- (BOOL)isUIVisible
{
  return self->_isUIVisible;
}

- (void)setIsUIVisible:(BOOL)a3
{
  self->_isUIVisible = a3;
}

- (NSXPCConnection)osxUIConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setOsxUIConnection:(id)a3
{
}

- (__CFUserNotification)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(__CFUserNotification *)a3
{
  self->_notificationRef = a3;
}

- (unint64_t)pasteFetchStartTime
{
  return self->_pasteFetchStartTime;
}

- (void)setPasteFetchStartTime:(unint64_t)a3
{
  self->_pasteFetchStartTime = a3;
}

- (unint64_t)localSendStartTime
{
  return self->_localSendStartTime;
}

- (void)setLocalSendStartTime:(unint64_t)a3
{
  self->_localSendStartTime = a3;
}

- (unint64_t)streamOpenStartTime
{
  return self->_streamOpenStartTime;
}

- (void)setStreamOpenStartTime:(unint64_t)a3
{
  self->_streamOpenStartTime = a3;
}

- (unint64_t)streamXferStartTime
{
  return self->_streamXferStartTime;
}

- (void)setStreamXferStartTime:(unint64_t)a3
{
  self->_streamXferStartTime = a3;
}

- (UARemotePasteboardWasRequestedEvent)pasteInfo
{
  return (UARemotePasteboardWasRequestedEvent *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setPasteInfo:(id)a3
{
}

- (UARemotePasteboardDidSendLocalEvent)localInfo
{
  return (UARemotePasteboardDidSendLocalEvent *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setLocalInfo:(id)a3
{
}

- (NSBundle)uaBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setUaBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end