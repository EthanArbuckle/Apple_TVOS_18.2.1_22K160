@interface NRLinkManagerWiFi
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)dealloc;
- (void)handleThermalStateUpdate;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerWiFi

- (void)cancel
{
  if (self)
  {
    v3 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

    -[NRLinkManager reportEvent:](self, "reportEvent:", 2003LL);
    if (self->super._state == 1004)
    {
      if (qword_1001DCBF8 != -1) {
        dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DCBF0, 1LL))
      {
        if (qword_1001DCBF8 != -1) {
          dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
        }
        _NRLogWithArgs(qword_1001DCBF0, 1LL, "%s%.30s:%-4d Already cancelled", ", "-[NRLinkManagerWiFi cancel]"", 248);
      }

      return;
    }

    self->super._state = 1004;
    -[NRLinkManagerWiFi invalidateManager](self, "invalidateManager");
    links = self->_links;
  }

  else
  {
    dispatch_assert_queue_V2(0LL);
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0LL;
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = -[NSMutableSet copy](links, "copy");
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)i) cancelWithReason:@"Cancelling all links"];
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  if (self) {
    v10 = self->_links;
  }
  else {
    v10 = 0LL;
  }
  -[NSMutableSet removeAllObjects](v10, "removeAllObjects");
}

- (void)invalidateManager
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NRLinkManagerWiFi;
  -[NRLinkManager invalidateManager](&v19, "invalidateManager");
  if (self)
  {
    scdynamicStoreRef = self->_scdynamicStoreRef;
    if (scdynamicStoreRef)
    {
      SCDynamicStoreSetDispatchQueue(scdynamicStoreRef, 0LL);
      v4 = self->_scdynamicStoreRef;
      if (v4)
      {
        CFRelease(v4);
        self->_scdynamicStoreRef = 0LL;
      }
    }

    coreWiFiHandle = self->_coreWiFiHandle;
    if (coreWiFiHandle)
    {
      id v6 = coreWiFiHandle;
      if (qword_1001DCC00 != -1) {
        dispatch_once(&qword_1001DCC00, &stru_1001B08F0);
      }
      id v7 = (dispatch_queue_s *)qword_1001DCC08;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10013CD28;
      block[3] = &unk_1001B0A88;
      uint64_t v8 = v6;
      v18 = v8;
      dispatch_async(v7, block);
      v9 = self->_coreWiFiHandle;
      self->_coreWiFiHandle = 0LL;

      wowActivity = self->_wowActivity;
      self->_wowActivity = 0LL;

      backgroundActivity = self->_backgroundActivity;
      self->_backgroundActivity = 0LL;

      directToCloudActivity = self->_directToCloudActivity;
      self->_directToCloudActivity = 0LL;
    }

    sub_10013CD30((uint64_t)self);
    wifiAutojoinClients = self->_wifiAutojoinClients;
    self->_wifiAutojoinClients = 0LL;

    assertionReasonDictionary = self->_assertionReasonDictionary;
    self->_assertionReasonDictionary = 0LL;

    assertionClientDictionary = self->_assertionClientDictionary;
    self->_assertionClientDictionary = 0LL;

    lastAssertionReport = self->_lastAssertionReport;
    self->_lastAssertionReport = 0LL;

    sub_10013BC04((uint64_t)self);
  }

  else
  {
    sub_10013CD30(0LL);
  }

- (void)dealloc
{
  if (qword_1001DCBF8 != -1) {
    dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DCBF0, 1LL))
  {
    if (qword_1001DCBF8 != -1) {
      dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
    }
    id v3 = (id)qword_1001DCBF0;
    id v4 = -[NRLinkManagerWiFi copyName](self, "copyName");
    _NRLogWithArgs(v3, 1LL, "%s%.30s:%-4d %@", ", "-[NRLinkManagerWiFi dealloc]"", 297LL, v4);
  }

  -[NRLinkManagerWiFi invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkManagerWiFi;
  -[NRLinkManagerWiFi dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return @"Link Manager - WiFi";
}

- (id)copyStatusString
{
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v4 = queue;
  dispatch_assert_queue_V2(v4);

  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v6 = -[NRLinkManagerWiFi copyName](self, "copyName");
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nName: %@", v6);

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType(self->super._type);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinkManager type: %@", StringFromNRLinkType);

    uint64_t state = self->super._state;
  }

  else
  {
    v21 = (void *)createStringFromNRLinkType(0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinkManager type: %@", v21);

    uint64_t state = 0LL;
  }

  v9 = sub_1000A2B20(state);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nState: %@", v9);

  if (self)
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinks: %@", self->_links);
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nWiFi Interface config: %@",  self->_wifiInterfaceConfig);
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nAWDL Interface config: %@",  self->_awdlInterfaceConfig);
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nNAN Interface config: %@",  self->_nanInterfaceConfig);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nIR Interface config: %@", self->_irInterfaceConfig);
    if (self->_wowActivity) {
      v10 = "YES";
    }
    else {
      v10 = "NO";
    }
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nWiFi WoW Enabled: %s", v10);
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nWiFi Client Type: %zd",  self->_currentWiFiClientType);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLocal WiFi Endpoint: %@", self->_localWiFiEndpoint);
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nLocal WiFi Signature: %@",  self->_localWiFiSignature);
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nRemote WiFi Signature: %@",  self->_peerWiFiSignature);
    wifiInterfaceConfig = self->_wifiInterfaceConfig;
    if (wifiInterfaceConfig) {
      wifiInterfaceConfig = (NRSCDInterfaceConfig *)wifiInterfaceConfig->_peerEndpointDictionary;
    }
    __int128 v12 = wifiInterfaceConfig;
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote WiFi Endpoints: %@", v12);

    awdlInterfaceConfig = self->_awdlInterfaceConfig;
    if (awdlInterfaceConfig) {
      awdlInterfaceConfig = (NRSCDInterfaceConfig *)awdlInterfaceConfig->_peerEndpointDictionary;
    }
  }

  else
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinks: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nWiFi Interface config: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nAWDL Interface config: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nNAN Interface config: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nIR Interface config: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nWiFi WoW Enabled: %s", "NO");
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nWiFi Client Type: %zd", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLocal WiFi Endpoint: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLocal WiFi Signature: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote WiFi Signature: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote WiFi Endpoints: %@", 0LL);
    awdlInterfaceConfig = 0LL;
  }

  __int128 v14 = awdlInterfaceConfig;
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote AWDL EndpointDict: %@", v14);

  if (self)
  {
    nanInterfaceConfig = self->_nanInterfaceConfig;
    if (nanInterfaceConfig) {
      nanInterfaceConfig = (NRSCDInterfaceConfig *)nanInterfaceConfig->_peerEndpointDictionary;
    }
    v16 = nanInterfaceConfig;
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote NAN EndpointDict: %@", v16);

    irInterfaceConfig = self->_irInterfaceConfig;
    if (irInterfaceConfig) {
      irInterfaceConfig = (NRSCDInterfaceConfig *)irInterfaceConfig->_peerEndpointDictionary;
    }
  }

  else
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote NAN EndpointDict: %@", 0LL);
    irInterfaceConfig = 0LL;
  }

  v18 = irInterfaceConfig;
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote IR EndpointDict: %@", v18);

  if (self)
  {
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nPrefer WiFi asserts: %d",  self->_preferWiFiAsserts);
    uint64_t clearedPreferWiFiAssertCounts = self->_clearedPreferWiFiAssertCounts;
  }

  else
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nPrefer WiFi asserts: %d", 0LL);
    uint64_t clearedPreferWiFiAssertCounts = 0LL;
  }

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nCleared Prefer WiFi asserts: %d",  clearedPreferWiFiAssertCounts);
  return v5;
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2004LL);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001DCBF8 != -1) {
          dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DCBF0, 1LL))
        {
          if (qword_1001DCBF8 != -1) {
            dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
          }
          _NRLogWithArgs( qword_1001DCBF0,  1LL,  "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@",  ",  "-[NRLinkManagerWiFi linkIsAvailable:]"",  418LL,  self);
        }

        goto LABEL_14;
      }

      -[NSMutableSet addObject:](self->_links, "addObject:", v4);
      id v7 = self->super._queue;
    }

    else
    {
      [0 addObject:v4];
      id v7 = 0LL;
    }

    uint64_t v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013CC18;
    block[3] = &unk_1001B0720;
    id v13 = v4;
    __int128 v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }

  id v9 = sub_10013A600();
  int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17LL);

  if (IsLevelEnabled)
  {
    id v11 = sub_10013A600();
    _NRLogWithArgs(v11, 17LL, "%s called with null link", "-[NRLinkManagerWiFi linkIsAvailable:]");
  }

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2005LL);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001DCBF8 != -1) {
          dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DCBF0, 1LL))
        {
          if (qword_1001DCBF8 != -1) {
            dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
          }
          _NRLogWithArgs( qword_1001DCBF0,  1LL,  "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@",  ",  "-[NRLinkManagerWiFi linkIsReady:]"",  442LL,  self);
        }

        goto LABEL_14;
      }

      id v7 = self->super._queue;
    }

    else
    {
      id v7 = 0LL;
    }

    uint64_t v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013CB08;
    block[3] = &unk_1001B0720;
    id v13 = v4;
    __int128 v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }

  id v9 = sub_10013A600();
  int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17LL);

  if (IsLevelEnabled)
  {
    id v11 = sub_10013A600();
    _NRLogWithArgs(v11, 17LL, "%s called with null link", "-[NRLinkManagerWiFi linkIsReady:]");
  }

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2006LL);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001DCBF8 != -1) {
          dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DCBF0, 1LL))
        {
          if (qword_1001DCBF8 != -1) {
            dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
          }
          _NRLogWithArgs( qword_1001DCBF0,  1LL,  "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@",  ",  "-[NRLinkManagerWiFi linkIsSuspended:]"",  471LL,  self);
        }

        goto LABEL_14;
      }

      id v7 = self->super._queue;
    }

    else
    {
      id v7 = 0LL;
    }

    uint64_t v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013C9F8;
    block[3] = &unk_1001B0720;
    id v13 = v4;
    __int128 v14 = self;
    dispatch_async(v8, block);

    goto LABEL_14;
  }

  id v9 = sub_10013A600();
  int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17LL);

  if (IsLevelEnabled)
  {
    id v11 = sub_10013A600();
    _NRLogWithArgs(v11, 17LL, "%s called with null link", "-[NRLinkManagerWiFi linkIsSuspended:]");
  }

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2007LL);
    if (self)
    {
      if (self->super._state == 1004)
      {
        if (qword_1001DCBF8 != -1) {
          dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DCBF0, 1LL))
        {
          if (qword_1001DCBF8 != -1) {
            dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
          }
          _NRLogWithArgs( qword_1001DCBF0,  1LL,  "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@",  ",  "-[NRLinkManagerWiFi linkIsUnavailable:]"",  493LL,  self);
        }

        goto LABEL_14;
      }

      -[NSMutableSet removeObject:](self->_links, "removeObject:", v4);
      id v7 = self->super._queue;
    }

    else
    {
      [0 removeObject:v4];
      id v7 = 0LL;
    }

    uint64_t v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013A640;
    block[3] = &unk_1001B0720;
    void block[4] = self;
    id v13 = v4;
    dispatch_async(v8, block);

    goto LABEL_14;
  }

  id v9 = sub_10013A600();
  int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 17LL);

  if (IsLevelEnabled)
  {
    id v11 = sub_10013A600();
    _NRLogWithArgs(v11, 17LL, "%s called with null link", "-[NRLinkManagerWiFi linkIsUnavailable:]");
  }

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self)
  {
    dispatch_assert_queue_V2(0LL);
    [0 reportEvent:2008];
    queue = 0LL;
    goto LABEL_10;
  }

  uint64_t v8 = self->super._queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2008LL);
  if (self->super._state != 1004)
  {
    queue = self->super._queue;
LABEL_10:
    v10 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013A5B4;
    block[3] = &unk_1001B0748;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);

    goto LABEL_11;
  }

  if (qword_1001DCBF8 != -1) {
    dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DCBF0, 1LL))
  {
    if (qword_1001DCBF8 != -1) {
      dispatch_once(&qword_1001DCBF8, &stru_1001B08D0);
    }
    _NRLogWithArgs( qword_1001DCBF0,  1LL,  "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@",  ",  "-[NRLinkManagerWiFi linkDidReceiveData:data:]"",  520LL,  self);
  }

- (void)handleThermalStateUpdate
{
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v4 = queue;
  dispatch_assert_queue_V2(v4);

  objc_opt_self(&OBJC_CLASS___NRLinkDirector);
  if (qword_1001DC878 != -1) {
    dispatch_once(&qword_1001DC878, &stru_1001AEED0);
  }
  objc_super v5 = (id)qword_1001DC870;
  if (v5 && (unsigned int v6 = v5[5], v5, v6 >= 0x1E))
  {
    if (self) {
      links = self->_links;
    }
    else {
      links = 0LL;
    }
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = -[NSMutableSet copy](links, "copy");
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        }

        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v10);
    }
  }

  else
  {
    sub_100139DFC((uint64_t)self);
  }

- (void).cxx_destruct
{
}

@end