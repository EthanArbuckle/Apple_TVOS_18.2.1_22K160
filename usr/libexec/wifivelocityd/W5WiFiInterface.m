@interface W5WiFiInterface
- (BOOL)isAWDLRealTimeMode;
- (BOOL)isSnifferSupported;
- (BOOL)isUsingCustomDNSSettings;
- (BOOL)isUsingCustomProxySetting;
- (BOOL)setChannel:(id)a3;
- (BOOL)setSTBCEnabled:(BOOL)a3;
- (BOOL)smartCCADesenseSupported;
- (BOOL)smartCCADesenseUSBPresence;
- (NSString)interfaceName;
- (W5WiFiInterface)init;
- (W5WiFiInterface)initWithCoreWiFiInterface:(id)a3;
- (id)__dnsSetupConfig;
- (id)__dnsStateConfig;
- (id)__ipv4SetupConfig;
- (id)__ipv4StateConfig;
- (id)__ipv6SetupConfig;
- (id)__ipv6StateConfig;
- (id)__proxiesSetupConfig;
- (id)cachedPreferredNetworksListWithUUID:(id)a3;
- (id)channel;
- (id)currentNetwork;
- (id)currentPreferredNetwork;
- (id)lastAssociatedSSID;
- (id)lastAssociatedSSIDString;
- (id)linkQualityUpdates;
- (id)performScanOnChannels:(id)a3 translate:(BOOL)a4;
- (id)preferredNetworksList;
- (id)scanCache:(BOOL)a3;
- (id)supportedChannels;
- (id)updatedWiFiCallback;
- (int)role;
- (int64_t)ipv4ConfigMethod;
- (int64_t)ipv6ConfigMethod;
- (int64_t)security;
- (void)__addlinkQualityUpdate:(id)a3;
- (void)__clearLinkQualityUpdates;
- (void)__startEventMonitoring;
- (void)__stopEventMonitoring;
- (void)__updateAWDLRealTimeMode:(BOOL)a3;
- (void)__updateLastAssociatedSSID;
- (void)clearCachedPreferredNetworksListWithUUID:(id)a3;
- (void)dealloc;
- (void)disassociate;
- (void)setUpdatedWiFiCallback:(id)a3;
- (void)setUpdatedWiFiInterfaceCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5WiFiInterface

- (W5WiFiInterface)initWithCoreWiFiInterface:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___W5WiFiInterface;
  v4 = -[W5WiFiInterface init](&v15, "init");
  v5 = v4;
  if (!a3) {
    goto LABEL_15;
  }
  if (!v4) {
    goto LABEL_15;
  }
  v6 = (CWFInterface *)a3;
  v5->_corewifi = v6;
  v7 = (NSString *)objc_msgSend(-[CWFInterface interfaceName](v6, "interfaceName"), "copy");
  v5->_interfaceName = v7;
  if (!v7) {
    goto LABEL_15;
  }
  v14 = 0LL;
  v5->_a11Ref = v14;
  v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.wifivelocityd.wifi-%@",  v5->_interfaceName);
  v9 = dispatch_queue_create((const char *)-[__CFString UTF8String](v8, "UTF8String"), 0LL);
  v5->_queue = (OS_dispatch_queue *)v9;
  if (!v9) {
    goto LABEL_15;
  }
  dispatch_queue_set_specific(v9, &v5->_queue, (void *)1, 0LL);
  dispatch_queue_t v10 = dispatch_queue_create( (const char *)objc_msgSend( -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", @".event"),  "UTF8String"),  0);
  v5->_eventQueue = (OS_dispatch_queue *)v10;
  if (!v10
    || (v5->_linkQualityUpdates = objc_alloc_init(&OBJC_CLASS___NSMutableArray),
        v5->_cachedPreferredNetworksListUUIDMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary),
        v5->_lastAssociatedSSID = (NSData *)objc_msgSend(-[CWFInterface SSID](v5->_corewifi, "SSID"), "copy"),
        v5->_lastAssociatedSSIDString = (NSString *)objc_msgSend( -[CWFInterface networkName](v5->_corewifi, "networkName"),  "copy"),  SCDynamicStoreRef v11 = SCDynamicStoreCreate(kCFAllocatorDefault, v8, 0, 0),  (v5->_storeRef = v11) == 0))
  {
LABEL_15:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v13 = -[NSString UTF8String](v5->_interfaceName, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v17 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to initialize Wi-Fi interface (%{public}s)",  buf,  0xCu);
    }

    return 0LL;
  }

  return v5;
}

- (W5WiFiInterface)init
{
  return result;
}

- (void)setUpdatedWiFiInterfaceCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004B974;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)dealloc
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  eventQueue = (dispatch_object_s *)self->_eventQueue;
  if (eventQueue) {
    dispatch_release(eventQueue);
  }
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  if (self->_a11Ref) {
    Apple80211Close();
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___W5WiFiInterface;
  -[W5WiFiInterface dealloc](&v6, "dealloc");
}

- (int)role
{
  return -[CWFInterface virtualInterfaceRole](self->_corewifi, "virtualInterfaceRole");
}

- (id)preferredNetworksList
{
  id v2 = -[CWFInterface knownNetworkProfilesWithProperties:]( self->_corewifi,  "knownNetworkProfilesWithProperties:",  +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000E3BE8));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if (!v5) {
          id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        }
        [v5 addObject:sub_10004BBA4(v8)];
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return [v5 copy];
}

- (void)__startEventMonitoring
{
  corewifi = self->_corewifi;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004BFF8;
  v4[3] = &unk_1000D2A20;
  v4[4] = self;
  -[CWFInterface setEventHandler:eventID:]( corewifi,  "setEventHandler:eventID:",  v4,  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 0LL, 0LL));
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 1LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 2LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 3LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 4LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 6LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 8LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 7LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 14LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 15LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 16LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 17LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 23LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 18LL, 0LL),  0LL);
  -[CWFInterface startMonitoringEvent:error:]( self->_corewifi,  "startMonitoringEvent:error:",  +[CWFEventID eventIDWithType:interfaceName:](&OBJC_CLASS___CWFEventID, "eventIDWithType:interfaceName:", 24LL, 0LL),  0LL);
  Apple80211EventMonitoringInit2(self->_a11Ref, sub_10004C548, self, self->_eventQueue);
  Apple80211StartMonitoringEvent(self->_a11Ref, 20LL);
  Apple80211StartMonitoringEvent(self->_a11Ref, 34LL);
  Apple80211StartMonitoringEvent(self->_a11Ref, 49LL);
  Apple80211StartMonitoringEvent(self->_a11Ref, 55LL);
  Apple80211StartMonitoringEvent(self->_a11Ref, 54LL);
}

- (void)startEventMonitoring
{
  eventQueue = (dispatch_queue_s *)self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C710;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

- (void)__stopEventMonitoring
{
}

- (void)stopEventMonitoring
{
  eventQueue = (dispatch_queue_s *)self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C80C;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

- (void)__updateAWDLRealTimeMode:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004C8B0;
  v4[3] = &unk_1000D2A48;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)__updateLastAssociatedSSID
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C934;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__clearLinkQualityUpdates
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C9FC;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__addlinkQualityUpdate:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004CA88;
  v4[3] = &unk_1000D1BA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)linkQualityUpdates
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10004CBA4;
  __int128 v10 = sub_10004CBB4;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004CBC0;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)supportedChannels
{
  id v2 = -[CWFInterface supportedChannelsWithCountryCode:](self->_corewifi, "supportedChannelsWithCountryCode:", 0LL);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(W5WiFiChannel **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if (!v5) {
          id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        }
        [v5 addObject:sub_10004CD2C(v8)];
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return [v5 copy];
}

- (id)lastAssociatedSSID
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10004CBA4;
  __int128 v10 = sub_10004CBB4;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004CE50;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)lastAssociatedSSIDString
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10004CBA4;
  __int128 v10 = sub_10004CBB4;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004CF54;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)channel
{
  return sub_10004CD2C((W5WiFiChannel *)-[CWFInterface channel](self->_corewifi, "channel"));
}

- (id)performScanOnChannels:(id)a3 translate:(BOOL)a4
{
  BOOL v4 = a4;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        if (!v8) {
          id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        }
        id v12 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
        objc_msgSend(v12, "setChannel:", objc_msgSend(v11, "channel"));
        objc_msgSend(v12, "setFlags:", objc_msgSend(v11, "flags"));
        [v8 addObject:v12];
      }

      id v7 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
  [v13 setIncludeHiddenNetworks:1];
  [v13 setMergeScanResults:0];
  [v13 setChannels:v8];
  objc_msgSend( v13,  "setIncludeProperties:",  +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E3C00));
  id v14 = -[CWFInterface performScanWithParameters:error:](self->_corewifi, "performScanWithParameters:error:", v13, 0LL);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v15)
  {
    id v17 = 0LL;
    return [v17 copy];
  }

  id v16 = v15;
  id v17 = 0LL;
  uint64_t v18 = *(void *)v25;
  do
  {
    v19 = 0LL;
    do
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(v14);
      }
      id v20 = *(id *)(*((void *)&v24 + 1) + 8LL * (void)v19);
      if (v17)
      {
        if (!v4) {
          goto LABEL_20;
        }
LABEL_19:
        id v20 = sub_10004D23C(v20);
        goto LABEL_20;
      }

      id v17 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      if (v4) {
        goto LABEL_19;
      }
LABEL_20:
      [v17 addObject:v20];
      v19 = (char *)v19 + 1;
    }

    while (v16 != v19);
    id v21 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    id v16 = v21;
  }

  while (v21);
  return [v17 copy];
}

- (void)disassociate
{
}

- (BOOL)setChannel:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
  objc_msgSend(v5, "setChannel:", objc_msgSend(a3, "channel"));
  objc_msgSend(v5, "setFlags:", objc_msgSend(a3, "flags"));
  -[CWFInterface setChannel:error:](self->_corewifi, "setChannel:error:", v5, &v7);
  return v7 == 0;
}

- (id)scanCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
  [v5 setCacheOnly:1];
  [v5 setIncludeHiddenNetworks:1];
  [v5 setMergeScanResults:0];
  objc_msgSend( v5,  "setIncludeProperties:",  +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E3C18));
  id v6 = -[CWFInterface performScanWithParameters:error:](self->_corewifi, "performScanWithParameters:error:", v5, 0LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7)
  {
    id v9 = 0LL;
    return [v9 copy];
  }

  id v8 = v7;
  id v9 = 0LL;
  uint64_t v10 = *(void *)v16;
  do
  {
    uint64_t v11 = 0LL;
    do
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)v11);
      if (v9)
      {
        if (!v3) {
          goto LABEL_9;
        }
LABEL_8:
        id v12 = sub_10004D23C(v12);
        goto LABEL_9;
      }

      id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      if (v3) {
        goto LABEL_8;
      }
LABEL_9:
      [v9 addObject:v12];
      uint64_t v11 = (char *)v11 + 1;
    }

    while (v8 != v11);
    id v13 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    id v8 = v13;
  }

  while (v13);
  return [v9 copy];
}

- (int64_t)security
{
  return sub_10004D94C( (uint64_t)-[CWFInterface securityType](self->_corewifi, "securityType"),  (uint64_t)-[CWFInterface WEPSubtype](self->_corewifi, "WEPSubtype"),  (uint64_t)-[CWFInterface WAPISubtype](self->_corewifi, "WAPISubtype"));
}

- (id)currentNetwork
{
  return sub_10004D23C(-[CWFInterface currentScanResult](self->_corewifi, "currentScanResult"));
}

- (id)currentPreferredNetwork
{
  return sub_10004BBA4(-[CWFInterface currentKnownNetworkProfile](self->_corewifi, "currentKnownNetworkProfile"));
}

- (id)cachedPreferredNetworksListWithUUID:(id)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  uint64_t v10 = sub_10004CBA4;
  uint64_t v11 = sub_10004CBB4;
  uint64_t v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004DAD4;
  block[3] = &unk_1000D29D0;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v7;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)clearCachedPreferredNetworksListWithUUID:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004DBAC;
  v4[3] = &unk_1000D1BA8;
  v4[4] = a3;
  void v4[5] = self;
  dispatch_async(queue, v4);
}

- (id)__ipv4StateConfig
{
  BOOL v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3) {
    return 0LL;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v3,  kSCEntNetIPv4);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  id v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

- (id)__ipv6StateConfig
{
  BOOL v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3) {
    return 0LL;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v3,  kSCEntNetIPv6);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  id v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

- (id)__ipv4SetupConfig
{
  BOOL v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3) {
    return 0LL;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  v3,  kSCEntNetIPv4);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  id v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

- (id)__ipv6SetupConfig
{
  BOOL v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3) {
    return 0LL;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  v3,  kSCEntNetIPv6);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  id v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

- (id)__dnsStateConfig
{
  BOOL v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3) {
    return 0LL;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v3,  kSCEntNetDNS);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  id v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

- (id)__dnsSetupConfig
{
  BOOL v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3) {
    return 0LL;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  v3,  kSCEntNetDNS);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  id v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

- (id)__proxiesSetupConfig
{
  BOOL v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3) {
    return 0LL;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  v3,  kSCEntNetProxies);
  if (!NetworkServiceEntity) {
    return 0LL;
  }
  id v5 = NetworkServiceEntity;
  id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 copy];
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

- (int64_t)ipv6ConfigMethod
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004E110;
  v5[3] = &unk_1000D1CA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)ipv4ConfigMethod
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004E2B8;
  v5[3] = &unk_1000D1CA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isUsingCustomDNSSettings
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004E4B0;
  v5[3] = &unk_1000D1CA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isUsingCustomProxySetting
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004E588;
  v5[3] = &unk_1000D1CA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)smartCCADesenseSupported
{
  return 0;
}

- (BOOL)smartCCADesenseUSBPresence
{
  return 0;
}

- (BOOL)isSnifferSupported
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = -[CWFInterface capabilities](self->_corewifi, "capabilities", 0LL);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) unsignedIntValue] == 11)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return (char)v3;
}

- (BOOL)setSTBCEnabled:(BOOL)a3
{
  uint64_t v18 = 0LL;
  BOOL v4 = !a3;
  uint64_t v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"stbc_disable=%d", !a3);
  __strlcpy_chk( v32,  objc_msgSend(-[CWFInterface interfaceName](self->_corewifi, "interfaceName"), "UTF8String"),  16,  16);
  int v33 = 157;
  bzero(&v30, 0x3BDC0uLL);
  uint64_t v29 = 0x1000000000001LL;
  __int16 v30 = 1;
  __strlcpy_chk(v31, -[NSString UTF8String](v5, "UTF8String"), 128LL, 128LL);
  *(_OWORD *)&v31[1446] = xmmword_1000A5190;
  int v34 = 245192;
  v35 = &v29;
  -[CWFInterface setUserAutoJoinDisabled:error:](self->_corewifi, "setUserAutoJoinDisabled:error:", 1LL, &v18);
  uint64_t v6 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = -[CWFInterface userAutoJoinDisabled](self->_corewifi, "userAutoJoinDisabled");
    int v19 = 136316162;
    id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
    __int16 v21 = 2080;
    v22 = "W5WiFiInterface.m";
    __int16 v23 = 1024;
    int v24 = 1628;
    __int16 v25 = 1024;
    unsigned int v26 = v7;
    __int16 v27 = 2114;
    uint64_t v28 = v18;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) Disabled User Auto Join Disabled, status: %d, error: %{public}@",  &v19,  44);
  }

  if (v18)
  {
    __int128 v15 = (os_log_s *)sub_10008C90C();
    BOOL v11 = 0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
      __int16 v21 = 2080;
      v22 = "W5WiFiInterface.m";
      __int16 v23 = 1024;
      int v24 = 1629;
      LODWORD(v16) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Unable to disable User Auto Join",  &v19,  v16);
LABEL_7:
      BOOL v11 = 0;
    }
  }

  else
  {
    int v8 = Apple80211RawSet(self->_a11Ref, v32);
    __int128 v9 = (os_log_s *)sub_10008C90C();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        int v19 = 136316162;
        id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
        __int16 v21 = 2080;
        v22 = "W5WiFiInterface.m";
        __int16 v23 = 1024;
        int v24 = 1637;
        __int16 v25 = 1024;
        unsigned int v26 = v4;
        __int16 v27 = 1024;
        LODWORD(v28) = v8;
        LODWORD(v16) = 40;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) Failed to set STBC Disable to: %d, error: %d",  &v19,  v16);
      }

      goto LABEL_7;
    }

    if (v10)
    {
      int v19 = 136315906;
      id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
      __int16 v21 = 2080;
      v22 = "W5WiFiInterface.m";
      __int16 v23 = 1024;
      int v24 = 1633;
      __int16 v25 = 1024;
      unsigned int v26 = v4;
      LODWORD(v16) = 34;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) Successfully set STBC Disable to: %d",  (const char *)&v19,  v16,  v17,  v18);
    }

    sub_10008C3EC((uint64_t)@"disable_stbc=1", v4);
    BOOL v11 = 1;
  }

  -[CWFInterface setUserAutoJoinDisabled:error:](self->_corewifi, "setUserAutoJoinDisabled:error:", 0LL, &v18);
  uint64_t v12 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = -[CWFInterface userAutoJoinDisabled](self->_corewifi, "userAutoJoinDisabled");
    int v19 = 136316162;
    id v20 = "-[W5WiFiInterface setSTBCEnabled:]";
    __int16 v21 = 2080;
    v22 = "W5WiFiInterface.m";
    __int16 v23 = 1024;
    int v24 = 1643;
    __int16 v25 = 1024;
    unsigned int v26 = v13;
    __int16 v27 = 2114;
    uint64_t v28 = v18;
    LODWORD(v16) = 44;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) Enabled User Auto Join, status: %d, error: %{public}@",  &v19,  v16);
  }

  return v11;
}

- (id)updatedWiFiCallback
{
  return self->_updatedWiFiCallback;
}

- (void)setUpdatedWiFiCallback:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)isAWDLRealTimeMode
{
  return self->_isAWDLRealTimeMode;
}

@end