@interface SDStreamManager
+ (id)sharedManager;
- (BOOL)servicesContainIdentifier:(id)a3;
- (NSMutableArray)companionServices;
- (NSMutableArray)incomingStreams;
- (NSMutableDictionary)continuationStreams;
- (NSMutableDictionary)managers;
- (NSNetService)service;
- (NSString)serviceType;
- (NSTimer)publishTimer;
- (SDStreamManager)initWithServiceType:(id)a3;
- (int64_t)connectedStreams;
- (void)activityContinuationPayloadSent:(id)a3;
- (void)addObservers;
- (void)addService:(id)a3;
- (void)closeStreamsForIdentifier:(id)a3;
- (void)companionStreamClosedStreams:(id)a3;
- (void)continuationStream:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6;
- (void)dealloc;
- (void)debugInfoRequested:(id)a3;
- (void)getContinuationStreamsForMessage:(id)a3 bundleID:(id)a4 usingID:(id)a5 completionHandler:(id)a6;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)publish;
- (void)publishTimerFired:(id)a3;
- (void)registerConnectedStreams;
- (void)registerManager:(id)a3;
- (void)removeObservers;
- (void)removeService:(id)a3;
- (void)restartPublishTimer;
- (void)setCompanionServices:(id)a3;
- (void)setConnectedStreams:(int64_t)a3;
- (void)setContinuationStreams:(id)a3;
- (void)setIncomingStreams:(id)a3;
- (void)setManagers:(id)a3;
- (void)setPublishTimer:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceType:(id)a3;
- (void)unpublish;
- (void)unregisterConnectedStreams;
- (void)unregisterManager:(id)a3;
@end

@implementation SDStreamManager

+ (id)sharedManager
{
  if (qword_100656D38 != -1) {
    dispatch_once(&qword_100656D38, &stru_1005CB748);
  }
  return (id)qword_100656D30;
}

- (SDStreamManager)initWithServiceType:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SDStreamManager;
  v6 = -[SDStreamManager init](&v18, "init");
  v7 = v6;
  if (v6)
  {
    service = v6->_service;
    v6->_service = 0LL;

    objc_storeStrong((id *)&v7->_serviceType, a3);
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    managers = v7->_managers;
    v7->_managers = v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    companionServices = v7->_companionServices;
    v7->_companionServices = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    incomingStreams = v7->_incomingStreams;
    v7->_incomingStreams = v13;

    v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    continuationStreams = v7->_continuationStreams;
    v7->_continuationStreams = v15;

    v7->_connectedStreams = 0LL;
    -[SDStreamManager addObservers](v7, "addObservers");
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDStreamManager;
  -[SDStreamManager dealloc](&v3, "dealloc");
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"debugInfoRequested:" name:@"com.apple.sharingd.DebugInfoRequested" object:0];
  [v3 addObserver:self selector:"activityContinuationPayloadSent:" name:@"com.apple.sharingd.ContinuationPayloadSent" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)debugInfoRequested:(id)a3
{
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (self->_service) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Publishing:%@", v4));
  -[NSMutableArray addObject:](v12, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Registered Activities:%d",  -[NSMutableArray count](self->_companionServices, "count")));
  -[NSMutableArray addObject:](v12, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Connected Streams:%ld",  self->_connectedStreams));
  -[NSMutableArray addObject:](v12, "addObject:", v7);

  v9 = (objc_class *)objc_opt_class(self, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_10002FC8C(v11, (uint64_t)v12);
}

- (void)activityContinuationPayloadSent:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100037498;
  v5[3] = &unk_1005CB480;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (BOOL)servicesContainIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_companionServices;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "serviceType", (void)v14));
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        v8 |= v12;
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }

  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)registerConnectedStreams
{
  uint64_t v3 = streams_log();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t connectedStreams = self->_connectedStreams;
    int v6 = 134217984;
    int64_t v7 = connectedStreams;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Added connected stream, total = %ld",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)getContinuationStreamsForMessage:(id)a3 bundleID:(id)a4 usingID:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v54 = a4;
  id v53 = a5;
  id v52 = a6;
  uint64_t v11 = streams_log(v52, v10);
  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSFCompanionServiceBonjourNameKey]);
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Streams are being requested for bonjour name = %@",  buf,  0xCu);
  }

  NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
  v61 = @"Could not set up internal streams";
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  94LL,  v14));

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v17 = [v16 wirelessEnabled];

  if ((v17 & 1) != 0
    || (objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor")),
        unsigned int v19 = [v18 alwaysSendPayload],
        v18,
        v19))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSFCompanionServiceBonjourNameKey, self));
    if (v23)
    {
      v24 = -[NSNetService initWithDomain:type:name:]( objc_alloc(&OBJC_CLASS___NSNetService),  "initWithDomain:type:name:",  @"local.",  @"_continuity._tcp.",  v23);
      v26 = v24;
      v28 = v53;
      v27 = v54;
      if (v24)
      {
        *(void *)buf = 0LL;
        id v57 = 0LL;
        -[NSNetService _setIncludesAWDL:](v24, "_setIncludesAWDL:", 1LL);
        BOOL v29 = -[NSNetService getInputStream:outputStream:](v26, "getInputStream:outputStream:", buf, &v57);
        if (v29)
        {
          v31 = objc_alloc(&OBJC_CLASS___SDStreamHandler);
          v32 = -[SDStreamHandler initWithInputStream:outputStream:isClient:]( v31,  "initWithInputStream:outputStream:isClient:",  *(void *)buf,  v57,  1LL);
          v34 = v32;
          if (v32)
          {
            -[SDStreamHandler setBundleID:](v32, "setBundleID:", v54);
            v35 = objc_alloc(&OBJC_CLASS___SDCompanionStream);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSFCompanionServiceAuthorDataKey]);
            v37 = -[SDCompanionStream initWithAuthorData:streamHandler:]( v35,  "initWithAuthorData:streamHandler:",  v36,  v34);

            -[SDCompanionStream setDelegate:](v37, "setDelegate:", v51);
            -[SDCompanionStream setIdentifier:](v37, "setIdentifier:", v53);
            -[SDCompanionStream start](v37, "start");
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472LL;
            v55[2] = sub_100037CC4;
            v55[3] = &unk_1005CB770;
            v38 = v52;
            id v56 = v52;
            -[SDCompanionStream getStreamsWithCompletionHandler:](v37, "getStreamsWithCompletionHandler:", v55);
            [*(id *)(v51 + 48) setObject:v37 forKeyedSubscript:v53];
          }

          else
          {
            uint64_t v48 = streams_log(0LL, v33);
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
              sub_100038C5C();
            }

            v38 = v52;
            (*((void (**)(id, void, void *))v52 + 2))(v52, 0LL, v15);
          }
        }

        else
        {
          uint64_t v46 = streams_log(v29, v30);
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            sub_100038C30();
          }

          v38 = v52;
          (*((void (**)(id, void, void *))v52 + 2))(v52, 0LL, v15);
        }
      }

      else
      {
        uint64_t v44 = streams_log(0LL, v25);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100038C30();
        }

        v38 = v52;
        (*((void (**)(id, void, void *))v52 + 2))(v52, 0LL, v15);
      }
    }

    else
    {
      uint64_t v39 = streams_log(0LL, v22);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      v28 = v53;
      v27 = v54;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_100038C04();
      }

      v38 = v52;
      (*((void (**)(id, void, void *))v52 + 2))(v52, 0LL, v15);
    }
  }

  else
  {
    uint64_t v41 = streams_log(v20, v21);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_100038C88();
    }

    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    v59 = @"Wi-Fi not enabled";
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  50LL,  v23));
    v38 = v52;
    (*((void (**)(id, void, void *))v52 + 2))(v52, 0LL, v43);

    v28 = v53;
    v27 = v54;
  }
}

- (void)unregisterConnectedStreams
{
  uint64_t v3 = streams_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t connectedStreams = self->_connectedStreams;
    int v8 = 134217984;
    int64_t v9 = connectedStreams;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removed connected streams, total = %ld",  (uint8_t *)&v8,  0xCu);
  }

  if (self->_connectedStreams <= 0)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned __int8 v7 = [v6 alwaysSendPayload];

    if ((v7 & 1) == 0) {
      -[SDStreamManager unpublish](self, "unpublish");
    }
  }

- (void)restartPublishTimer
{
  uint64_t v3 = streams_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting publish timer", v8, 2u);
  }

  publishTimer = self->_publishTimer;
  if (publishTimer) {
    -[NSTimer invalidate](publishTimer, "invalidate");
  }
  int v6 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "publishTimerFired:",  0LL,  0LL,  90.0));
  unsigned __int8 v7 = self->_publishTimer;
  self->_publishTimer = v6;
}

- (void)publishTimerFired:(id)a3
{
  if (self->_connectedStreams <= 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor", a3));
    unsigned __int8 v5 = [v4 alwaysSendPayload];

    if ((v5 & 1) == 0)
    {
      uint64_t v8 = streams_log(v6, v7);
      int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Publish timer fired, no more connected streams",  v11,  2u);
      }

      -[SDStreamManager unpublish](self, "unpublish");
    }
  }

  publishTimer = self->_publishTimer;
  self->_publishTimer = 0LL;
}

- (void)publish
{
  if (self->_service)
  {
    uint64_t v3 = streams_log(self, a2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already publishing", v19, 2u);
    }

    if (!self->_connectedStreams) {
      -[SDStreamManager restartPublishTimer](self, "restartPublishTimer");
    }
  }

  else
  {
    uint64_t v6 = (__CFString *)sub_100116914();
    if (v6)
    {
      uint64_t v7 = -[NSNetService initWithDomain:type:name:port:]( objc_alloc(&OBJC_CLASS___NSNetService),  "initWithDomain:type:name:port:",  @"local",  self->_serviceType,  v6,  8771LL);
      service = self->_service;
      self->_service = v7;

      uint64_t v10 = self->_service;
      if (v10)
      {
        -[NSNetService setDelegate:](v10, "setDelegate:", self);
        -[NSNetService _setIncludesAWDL:](self->_service, "_setIncludesAWDL:", 1LL);
        uint64_t v11 = self->_service;
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
        -[NSNetService scheduleInRunLoop:forMode:](v11, "scheduleInRunLoop:forMode:", v12, NSRunLoopCommonModes);

        -[NSNetService publishWithOptions:](self->_service, "publishWithOptions:", 3LL);
        id v13 = -[SDStreamManager restartPublishTimer](self, "restartPublishTimer");
        uint64_t v15 = streams_log(v13, v14);
        __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Publishing net service", buf, 2u);
        }
      }

      else
      {
        uint64_t v18 = streams_log(0LL, v9);
        __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100038CE0();
        }
      }
    }

    else
    {
      uint64_t v17 = streams_log(0LL, v5);
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100038CB4();
      }
    }
  }

- (void)unpublish
{
  if (self->_service)
  {
    uint64_t v3 = streams_log(self, a2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unpublishing", v8, 2u);
    }

    service = self->_service;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    -[NSNetService removeFromRunLoop:forMode:](service, "removeFromRunLoop:forMode:", v6, NSRunLoopCommonModes);

    -[NSNetService setDelegate:](self->_service, "setDelegate:", 0LL);
    -[NSNetService stop](self->_service, "stop");
    uint64_t v7 = self->_service;
    self->_service = 0LL;
  }

- (void)addService:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray containsObject:](self->_companionServices, "containsObject:", v4);
  if ((v5 & 1) != 0)
  {
    uint64_t v7 = streams_log(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Service has already been added",  (uint8_t *)&v16,  2u);
    }
  }

  else
  {
    id v9 = -[NSMutableArray addObject:](self->_companionServices, "addObject:", v4);
    uint64_t v11 = streams_log(v9, v10);
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      unsigned int v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Added service to publisher %@ with identifier %@",  (uint8_t *)&v16,  0x16u);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v15 = [v14 alwaysSendPayload];

    if (v15) {
      -[SDStreamManager publish](self, "publish");
    }
  }
}

- (void)removeService:(id)a3
{
  id v4 = a3;
  uint64_t v6 = streams_log(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removed stream support for activity with identifier = %@",  (uint8_t *)&v12,  0xCu);
  }

  -[NSMutableArray removeObject:](self->_companionServices, "removeObject:", v4);
  if (!-[NSMutableArray count](self->_companionServices, "count"))
  {
    uint64_t v10 = streams_log(0LL, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No more activities that support streams",  (uint8_t *)&v12,  2u);
    }

    -[SDStreamManager unpublish](self, "unpublish");
  }
}

- (void)closeStreamsForIdentifier:(id)a3
{
  continuationStreams = self->_continuationStreams;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](continuationStreams, "objectForKeyedSubscript:", v5));
  [v6 stop];
  -[NSMutableDictionary removeObjectForKey:](self->_continuationStreams, "removeObjectForKey:", v5);
}

- (void)registerManager:(id)a3
{
  managers = self->_managers;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 managerID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](managers, "setObject:forKeyedSubscript:", v4, v5);
}

- (void)unregisterManager:(id)a3
{
  managers = self->_managers;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 managerID]);
  -[NSMutableDictionary removeObjectForKey:](managers, "removeObjectForKey:", v4);
}

- (void)netServiceDidPublish:(id)a3
{
  id v3 = a3;
  uint64_t v4 = streams_log();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Published net service = %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = streams_log(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100038D0C((uint64_t)v6, (uint64_t)v7, v10);
  }

  -[SDStreamManager unpublish](self, "unpublish");
  dispatch_time_t v11 = sub_100114580(2.0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000386A8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_after(v11, &_dispatch_main_q, block);
}

- (void)netServiceDidStop:(id)a3
{
  uint64_t v3 = streams_log(self, a2, a3);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Publisher stopped publishing", v5, 2u);
  }
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = -[SDStreamHandler initWithInputStream:outputStream:isClient:]( objc_alloc(&OBJC_CLASS___SDStreamHandler),  "initWithInputStream:outputStream:isClient:",  v8,  v7,  0LL);

  if (v9)
  {
    int v12 = -[SDCompanionStream initWithStreamHandler:]( objc_alloc(&OBJC_CLASS___SDCompanionStream),  "initWithStreamHandler:",  v9);
    -[SDCompanionStream setDelegate:](v12, "setDelegate:", self);
    -[SDCompanionStream start](v12, "start");
    id v13 = -[NSMutableArray addObject:](self->_incomingStreams, "addObject:", v12);
    uint64_t v15 = streams_log(v13, v14);
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Net service did accept streams", v18, 2u);
    }
  }

  else
  {
    uint64_t v17 = streams_log(v10, v11);
    int v12 = (SDCompanionStream *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_100038D88();
    }
  }
}

- (void)continuationStream:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  p_managers = (uint64_t *)&self->_managers;
  managers = self->_managers;
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 managerID]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](managers, "objectForKeyedSubscript:", v16));

  if (v17)
  {
    if ((objc_opt_respondsToSelector(v17, "manager:connectedToService:withFileHandle:acceptHandler:") & 1) != 0)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100038A5C;
      v26[3] = &unk_1005CB098;
      id v27 = v13;
      [v17 manager:self connectedToService:v11 withFileHandle:v12 acceptHandler:v26];
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleID]);
    [v10 setBundleID:v20];

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    [v10 setIdentifier:v21];

    continuationStreams = self->_continuationStreams;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](continuationStreams, "setObject:forKeyedSubscript:", v10, v23);

    -[NSMutableArray removeObject:](self->_incomingStreams, "removeObject:", v10);
  }

  else
  {
    uint64_t v24 = streams_log(v18, v19);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100038DB4(v11, p_managers, v25);
    }
  }
}

- (void)companionStreamClosedStreams:(id)a3
{
  id v7 = a3;
  [v7 setDelegate:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  if (v4)
  {
    continuationStreams = self->_continuationStreams;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    -[NSMutableDictionary removeObjectForKey:](continuationStreams, "removeObjectForKey:", v6);
  }

  -[NSMutableArray removeObject:](self->_incomingStreams, "removeObject:", v7);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setServiceType:(id)a3
{
}

- (NSNetService)service
{
  return (NSNetService *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)managers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setManagers:(id)a3
{
}

- (NSMutableArray)companionServices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCompanionServices:(id)a3
{
}

- (NSMutableArray)incomingStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIncomingStreams:(id)a3
{
}

- (NSMutableDictionary)continuationStreams
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setContinuationStreams:(id)a3
{
}

- (int64_t)connectedStreams
{
  return self->_connectedStreams;
}

- (void)setConnectedStreams:(int64_t)a3
{
  self->_int64_t connectedStreams = a3;
}

- (NSTimer)publishTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPublishTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end