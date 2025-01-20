@interface CNDLimitedAccessSyncService
+ (id)log;
+ (id)sharedInstance;
- (BOOL)startLimitedAccessTableUpdateEventNotifyWatchTimer;
- (CNDLimitedAccessSyncService)init;
- (OS_dispatch_queue)fDispatchQueue;
- (OS_dispatch_source)fLimitedAccessTableUpdateEventNotifyTimer;
- (RPCompanionLinkClient)companionClient;
- (RPCompanionLinkClient)discoveryClient;
- (RPCompanionLinkDevice)linkedDevice;
- (id)beginService;
- (id)convertStringtoIntArray:(id)a3;
- (id)interestedNotifications;
- (void)cancelLimitedAccessTableUpdateEventNotifyWatchTimer;
- (void)connectWithCompanionDevice;
- (void)handleBundleIdentifiers:(id)a3;
- (void)handleNotificationName:(id)a3;
- (void)invalidateCompanionClient;
- (void)notifyConnectedWatch;
- (void)onEventhandler:(id)a3;
- (void)onRapportDeviceFound:(id)a3;
- (void)onRapportDeviceLost:(id)a3;
- (void)sendSyncRequest;
- (void)setCompanionClient:(id)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setFDispatchQueue:(id)a3;
- (void)setFLimitedAccessTableUpdateEventNotifyTimer:(id)a3;
- (void)setLinkedDevice:(id)a3;
@end

@implementation CNDLimitedAccessSyncService

+ (id)log
{
  if (qword_10001F680 != -1) {
    dispatch_once(&qword_10001F680, &stru_100018E30);
  }
  return (id)qword_10001F688;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B70C;
  block[3] = &unk_100018A10;
  block[4] = a1;
  if (qword_10001F690 != -1) {
    dispatch_once(&qword_10001F690, block);
  }
  return (id)qword_10001F698;
}

- (CNDLimitedAccessSyncService)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CNDLimitedAccessSyncService;
  v2 = -[CNDLimitedAccessSyncService init](&v7, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.contactsd.Sync", 0LL);
    fDispatchQueue = v2->_fDispatchQueue;
    v2->_fDispatchQueue = (OS_dispatch_queue *)v3;

    v5 = (CNDLimitedAccessSyncService *)objc_claimAutoreleasedReturnValue(-[CNDLimitedAccessSyncService beginService](v2, "beginService"));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)beginService
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "log");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "beginService", (uint8_t *)buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = v5;

  -[RPCompanionLinkClient setControlFlags:](self->_discoveryClient, "setControlFlags:", 32LL);
  objc_initWeak(buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000B954;
  v12[3] = &unk_100018E58;
  objc_copyWeak(&v13, buf);
  -[RPCompanionLinkClient setDeviceFoundHandler:](self->_discoveryClient, "setDeviceFoundHandler:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000B99C;
  v10[3] = &unk_100018E58;
  objc_copyWeak(&v11, buf);
  -[RPCompanionLinkClient setDeviceLostHandler:](self->_discoveryClient, "setDeviceLostHandler:", v10);
  objc_super v7 = self->_discoveryClient;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000B9E4;
  v9[3] = &unk_100018E80;
  v9[4] = self;
  -[RPCompanionLinkClient activateWithCompletion:](v7, "activateWithCompletion:", v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
  return self;
}

- (void)onRapportDeviceFound:(id)a3
{
  id v5 = a3;
  id v7 = objc_msgSend((id)objc_opt_class(self, v6), "log");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveIdentifier]);
    int v14 = 138412803;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v10;
    __int16 v18 = 2113;
    v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#Rapport discovered nearby device model:%@, name:%@,effectiveID:%{private}@ ",  (uint8_t *)&v14,  0x20u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveIdentifier]);
  unsigned int v13 = [v12 hasPrefix:@"BTPipe"];

  if (v13) {
    objc_storeStrong((id *)&self->_linkedDevice, a3);
  }
}

- (void)onRapportDeviceLost:(id)a3
{
  v4 = (RPCompanionLinkDevice *)a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "log");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice name](v4, "name"));
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Device Lost:name:%@", (uint8_t *)&v10, 0xCu);
  }

  if (self->_linkedDevice == v4)
  {
    self->_linkedDevice = 0LL;

    companionClient = self->_companionClient;
    self->_companionClient = 0LL;

    -[CNDLimitedAccessSyncService cancelLimitedAccessTableUpdateEventNotifyWatchTimer]( self,  "cancelLimitedAccessTableUpdateEventNotifyWatchTimer");
  }
}

- (void)invalidateCompanionClient
{
  companionClient = self->_companionClient;
  self->_companionClient = 0LL;
}

- (void)onEventhandler:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "log");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kABLimitedAccessEventKeyType"]);
    int v14 = 138412290;
    v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "onEventhandler eventDict %@",  (uint8_t *)&v14,  0xCu);
  }

  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kABLimitedAccessEventKeyType"]);
    unsigned int v10 = [v9 isEqualToString:@"SyncTableUpdate"];

    if (v10)
    {
      if (self->_companionClient)
      {
        id v12 = objc_msgSend((id)objc_opt_class(self, v11), "log");
        unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "connectWithCompanionDevice activated, sendSyncRequest",  (uint8_t *)&v14,  2u);
        }

        -[CNDLimitedAccessSyncService sendSyncRequest](self, "sendSyncRequest");
      }

      else
      {
        -[CNDLimitedAccessSyncService connectWithCompanionDevice](self, "connectWithCompanionDevice");
      }
    }
  }
}

- (void)connectWithCompanionDevice
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "log");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = v4;
  if (self->_linkedDevice)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice effectiveIdentifier](self->_linkedDevice, "effectiveIdentifier"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_linkedDevice, "model"));
      *(_DWORD *)buf = 138478083;
      __int16 v18 = v6;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "connecting with companion device, activating %{private}@ %@",  buf,  0x16u);
    }

    v8 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    companionClient = self->_companionClient;
    self->_companionClient = v8;

    -[RPCompanionLinkClient setControlFlags:](self->_companionClient, "setControlFlags:", 32LL);
    -[RPCompanionLinkClient setDestinationDevice:](self->_companionClient, "setDestinationDevice:", self->_linkedDevice);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000C060;
    v15[3] = &unk_100018A38;
    unsigned int v10 = v5;
    __int16 v16 = v10;
    -[RPCompanionLinkClient setInvalidationHandler:](self->_companionClient, "setInvalidationHandler:", v15);
    uint64_t v11 = self->_companionClient;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000C0BC;
    v12[3] = &unk_100018EA8;
    unsigned int v13 = v10;
    int v14 = self;
    -[RPCompanionLinkClient activateWithCompletion:](v11, "activateWithCompletion:", v12);
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10000E894();
  }
}

- (void)notifyConnectedWatch
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "log");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  linkedDevice = self->_linkedDevice;
  id v7 = objc_msgSend((id)objc_opt_class(self, v6), "log");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (linkedDevice)
  {
    if (v9)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice effectiveIdentifier](self->_linkedDevice, "effectiveIdentifier"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_linkedDevice, "model"));
      *(_DWORD *)buf = 138478083;
      __int16 v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Activating connection with device %{private}@ %@",  buf,  0x16u);
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    companionClient = self->_companionClient;
    self->_companionClient = v12;

    -[RPCompanionLinkClient setControlFlags:](self->_companionClient, "setControlFlags:", 32LL);
    -[RPCompanionLinkClient setDestinationDevice:](self->_companionClient, "setDestinationDevice:", self->_linkedDevice);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000C3C8;
    v16[3] = &unk_100018A38;
    v17 = v4;
    -[RPCompanionLinkClient setInvalidationHandler:](self->_companionClient, "setInvalidationHandler:", v16);
    int v14 = self->_companionClient;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000C424;
    v15[3] = &unk_100018E80;
    void v15[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v14, "activateWithCompletion:", v15);
    v8 = v17;
  }

  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No Active device", buf, 2u);
  }
}

- (id)interestedNotifications
{
  return &off_100019618;
}

- (void)handleNotificationName:(id)a3
{
  if ([a3 isEqualToString:@"CNContactStoreLimitedAccessDidChangeNotification"]) {
    -[CNDLimitedAccessSyncService startLimitedAccessTableUpdateEventNotifyWatchTimer]( self,  "startLimitedAccessTableUpdateEventNotifyWatchTimer");
  }
}

- (void)handleBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "log");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "handleBundleIdentifiers unregistered app", buf, 2u);
  }

  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CNDLimitedAccessSyncService fDispatchQueue](self, "fDispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000C7D8;
  v10[3] = &unk_100018A88;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (id)convertStringtoIntArray:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", @", "));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "intValue", (void)v12)));
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)sendSyncRequest
{
  uint64_t v27 = RPOptionStatusFlags;
  v28 = &off_1000195F8;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v4 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactStore getLimitedAccessLastSyncSequenceNumber:]( v4,  "getLimitedAccessLastSyncSequenceNumber:",  &v20));
  id v7 = v20;
  if (!v5 || [v5 integerValue] == (id)-1)
  {
    id v17 = objc_msgSend((id)objc_opt_class(self, v6), "log");
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000E8EC();
    }
  }

  else
  {
    id v8 = objc_msgSend((id)objc_opt_class(self, v6), "log");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "sendSyncRequest lastSyncedSequenceNumber = %@ ",  buf,  0xCu);
    }

    v25 = @"LastSyncedSequenceNumber";
    v26 = v5;
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v12 = objc_msgSend((id)objc_opt_class(self, v11), "log");
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_companionClient, "destinationDevice"));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 effectiveIdentifier]);
      *(_DWORD *)buf = 138478083;
      v22 = v15;
      __int16 v23 = 2112;
      v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "sendRequest device %{private}@ last sequence num %@",  buf,  0x16u);
    }

    companionClient = self->_companionClient;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000CD40;
    v18[3] = &unk_100018EF8;
    v18[4] = self;
    __int16 v19 = v4;
    -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:]( companionClient,  "sendRequestID:request:options:responseHandler:",  @"com.apple.contacts.LimitedAccessSync",  v10,  v3,  v18);
  }
}

- (BOOL)startLimitedAccessTableUpdateEventNotifyWatchTimer
{
  id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_fDispatchQueue);
  fLimitedAccessTableUpdateEventNotifyTimer = self->_fLimitedAccessTableUpdateEventNotifyTimer;
  self->_fLimitedAccessTableUpdateEventNotifyTimer = v3;

  id v5 = self->_fLimitedAccessTableUpdateEventNotifyTimer;
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    id v7 = self->_fLimitedAccessTableUpdateEventNotifyTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000D188;
    handler[3] = &unk_100018A38;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    dispatch_resume((dispatch_object_t)self->_fLimitedAccessTableUpdateEventNotifyTimer);
  }

  return v5 != 0LL;
}

- (void)cancelLimitedAccessTableUpdateEventNotifyWatchTimer
{
  if (self->_fLimitedAccessTableUpdateEventNotifyTimer)
  {
    id v3 = objc_msgSend((id)objc_opt_class(self, a2), "log");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_time_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Cancelling fLimitedAccessTableUpdateEventNotifyTimer",  v6,  2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_fLimitedAccessTableUpdateEventNotifyTimer);
    fLimitedAccessTableUpdateEventNotifyTimer = self->_fLimitedAccessTableUpdateEventNotifyTimer;
    self->_fLimitedAccessTableUpdateEventNotifyTimer = 0LL;
  }

- (RPCompanionLinkClient)discoveryClient
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDiscoveryClient:(id)a3
{
}

- (RPCompanionLinkClient)companionClient
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCompanionClient:(id)a3
{
}

- (OS_dispatch_queue)fDispatchQueue
{
  return self->_fDispatchQueue;
}

- (void)setFDispatchQueue:(id)a3
{
}

- (RPCompanionLinkDevice)linkedDevice
{
  return self->_linkedDevice;
}

- (void)setLinkedDevice:(id)a3
{
}

- (OS_dispatch_source)fLimitedAccessTableUpdateEventNotifyTimer
{
  return self->_fLimitedAccessTableUpdateEventNotifyTimer;
}

- (void)setFLimitedAccessTableUpdateEventNotifyTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end