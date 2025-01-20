@interface WiFiStateRelay
- (BOOL)wiFiActiveAndUsingPersonalHotspot;
- (CWFInterface)coreWiFiInterface;
- (WiFiStateRelay)initWithMonitoring:(WiFiStateDelegate *)a3;
- (char)retrieveWiFILQM:(id)a3;
- (id).cxx_construct;
- (optional<std::string>)retrieveRadioTech;
- (queue)getQueue;
- (void)configureCWFInterfaceEventHandler;
- (void)configureSCDynamicStore;
- (void)dealloc;
- (void)deregisterForCWEventTypes;
- (void)refreshWiFiLQM;
- (void)refreshWiFiLQM:(id)a3;
- (void)refreshWiFiRadioTech;
- (void)registerForCWEventTypes;
- (void)registerForSCDynamicStoreLQMUpdates;
- (void)setCoreWiFiInterface:(id)a3;
- (void)teardownSCDynamicStore;
- (void)updateDelegateWithInitialStates;
@end

@implementation WiFiStateRelay

- (WiFiStateRelay)initWithMonitoring:(WiFiStateDelegate *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___WiFiStateRelay;
  id v4 = -[WiFiStateRelay init](&v12, "init");
  if (!v4) {
    goto LABEL_4;
  }
  if (objc_opt_class(&OBJC_CLASS___CWFInterface))
  {
    *((void *)v4 + 1) = a3;
    dispatch_queue_t v5 = dispatch_queue_create("analyticsd.NetworkingStateResolver.WiFiStateRelay.myQueue", 0LL);
    v6 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v5;

    [v4 configureSCDynamicStore];
    *(_OWORD *)buf = xmmword_1000F4198;
    uint64_t v14 = 1LL;
    sub_10004E6E4((char *)v4 + 32, (char *)buf, (uint64_t)&v15, 3uLL);
    v7 = objc_alloc_init(&OBJC_CLASS___CWFInterface);
    v8 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v7;

    [v4 configureCWFInterfaceEventHandler];
    [*((id *)v4 + 8) activate];
    [v4 registerForCWEventTypes];
    [v4 registerForSCDynamicStoreLQMUpdates];
    [v4 updateDelegateWithInitialStates];
LABEL_4:
    v9 = (WiFiStateRelay *)v4;
    goto LABEL_8;
  }

  v10 = (os_log_s *)qword_100131948;
  if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[WiFiStateRelay] WARNING: Failed to get CoreWiFiInterface",  buf,  2u);
  }

  v9 = 0LL;
LABEL_8:

  return v9;
}

- (void)dealloc
{
  fObj = self->_stateRelayQueue.fObj.fObj;
  p_stateRelayQueue = &self->_stateRelayQueue;
  if (fObj)
  {
    id v5 = sub_10000B718((id *)&p_stateRelayQueue->fObj.fObj);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004D5E0;
    block[3] = &unk_100127CD0;
    block[4] = self;
    dispatch_sync(v6, block);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WiFiStateRelay;
  -[WiFiStateRelay dealloc](&v7, "dealloc");
}

- (queue)getQueue
{
  v3 = v2;
  id v4 = self->_stateRelayQueue.fObj.fObj;
  *v3 = v4;
  return (queue)v4;
}

- (void)registerForCWEventTypes
{
  if (self->_coreWiFiInterface)
  {
    begin = self->_registeredCWEventTypes.__begin_;
    end = self->_registeredCWEventTypes.__end_;
    while (begin != end)
    {
      uint64_t v5 = *begin++;
      -[CWFInterface startMonitoringEventType:error:]( self->_coreWiFiInterface,  "startMonitoringEventType:error:",  v5,  0LL);
    }
  }

- (void)teardownSCDynamicStore
{
  if (self->_scDynamicStore)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    v3 = self->_scKeyPatterns;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v7,  16LL);
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        v6 = 0LL;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          SCDynamicStoreRemoveWatchedKey( self->_scDynamicStore,  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v6),  1LL);
          v6 = (char *)v6 + 1;
        }

        while (v4 != v6);
        id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v7,  16LL);
      }

      while (v4);
    }

    CFRelease(self->_scDynamicStore);
  }

- (void)deregisterForCWEventTypes
{
  if (self->_coreWiFiInterface)
  {
    begin = self->_registeredCWEventTypes.__begin_;
    end = self->_registeredCWEventTypes.__end_;
    while (begin != end)
    {
      uint64_t v5 = *begin++;
      -[CWFInterface stopMonitoringEventType:](self->_coreWiFiInterface, "stopMonitoringEventType:", v5);
    }
  }

- (void)configureSCDynamicStore
{
  context.version = 0LL;
  context.info = self;
  memset(&context.retain, 0, 24);
  v3 = SCDynamicStoreCreate( 0LL,  @"com.apple.analyticsd.WiFiAnalytics",  (SCDynamicStoreCallBack)sub_10004D938,  &context);
  self->_scDynamicStore = v3;
  if (v3)
  {
    id v4 = sub_10000B718((id *)&self->_stateRelayQueue.fObj.fObj);
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
    SCDynamicStoreSetDispatchQueue(v3, v5);

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    scKeyPatterns = self->_scKeyPatterns;
    self->_scKeyPatterns = v6;
  }

  else
  {
    __int128 v8 = (os_log_s *)qword_100131948;
    if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[WiFiStateRelay] WARNING: Failed to create SCDynamicStore",  buf,  2u);
    }
  }

- (void)registerForSCDynamicStoreLQMUpdates
{
  if (self->_scDynamicStore)
  {
    NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  @"(en)[^/]+",  kSCEntNetLinkQuality);
    if (NetworkInterfaceEntity)
    {
      if (SCDynamicStoreAddWatchedKey(self->_scDynamicStore, NetworkInterfaceEntity, 1LL))
      {
        -[NSMutableArray addObject:](self->_scKeyPatterns, "addObject:", NetworkInterfaceEntity);
      }

      else
      {
        objc_super v12 = (os_log_s *)qword_100131948;
        if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_ERROR)) {
          sub_1000D874C(v12);
        }
      }
    }

    else
    {
      id v4 = (os_log_s *)qword_100131948;
      if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_ERROR)) {
        sub_1000D86D8(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

- (void)updateDelegateWithInitialStates
{
  id v3 = sub_10000B718((id *)&self->_stateRelayQueue.fObj.fObj);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004DD78;
  v5[3] = &unk_100127CD0;
  v5[4] = self;
  dispatch_async(v4, v5);
}

- (void)refreshWiFiLQM
{
  coreWiFiInterface = self->_coreWiFiInterface;
  if (coreWiFiInterface) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CWFInterface interfaceName](self->_coreWiFiInterface, "interfaceName"));
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = (id)v4;
  -[WiFiStateRelay refreshWiFiLQM:](self, "refreshWiFiLQM:", v4);
  if (coreWiFiInterface) {
}
  }

- (void)refreshWiFiLQM:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[NWInterface alloc] initWithInterfaceName:v4];
    uint64_t v6 = v5;
    if (v5 && [v5 type] == (id)1 && objc_msgSend(v6, "subtype") == (id)1001)
    {
      (*((void (**)(id *__return_ptr, WiFiStateDelegate *, uint64_t))self->delegate->var0 + 2))( &v9,  self->delegate,  -[WiFiStateRelay retrieveWiFILQM:](self, "retrieveWiFILQM:", v4) | 0x100LL);
      id v7 = v9;
      id v9 = 0LL;
    }
  }

  else
  {
    (*((void (**)(void **__return_ptr, WiFiStateDelegate *, uint64_t))self->delegate->var0 + 2))( &v10,  self->delegate,  510LL);
    uint64_t v8 = v10;
    uint64_t v10 = 0LL;

    uint64_t v6 = v10;
  }
}

- (void)configureCWFInterfaceEventHandler
{
  if (objc_opt_class(&OBJC_CLASS___CWFEvent))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10004E0A8;
    v4[3] = &unk_100127CF8;
    objc_copyWeak(&v5, &location);
    -[CWFInterface setEventHandler:](self->_coreWiFiInterface, "setEventHandler:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

  else
  {
    id v3 = (os_log_s *)qword_100131948;
    if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_INFO))
    {
      LOWORD(location) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[WiFiStateRelay] WARNING: Failed to get CoreWiFiEvent",  (uint8_t *)&location,  2u);
    }
  }

- (void)refreshWiFiRadioTech
{
  delegate = self->delegate;
  -[WiFiStateRelay retrieveRadioTech](self, "retrieveRadioTech");
  (*((void (**)(id *__return_ptr, WiFiStateDelegate *, void **))delegate->var0 + 3))(&v4, delegate, &__p);
  id v3 = v4;
  id v4 = 0LL;

  if (v7)
  {
    if (v6 < 0) {
      operator delete(__p);
    }
  }

- (optional<std::string>)retrieveRadioTech
{
  uint64_t v2 = v1;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var0.var0 = v4;
  *((_OWORD *)&retstr->var0.var1.var0.var0.var0.var1 + 1) = v4;
  retstr->var0.var0 = 0;
  LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = 0;
  result = *(optional<std::string> **)(v1 + 64);
  if (!result) {
    return result;
  }
  if ((unk_100133010(result, "powerOn") & 1) == 0)
  {
    id v9 = (const std::string *)&unk_100131740;
    return (optional<std::string> *)sub_10004E3F0((std::string *)retstr, v9);
  }

  char v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 64) networkName]);

  if (!v6)
  {
    id v9 = (const std::string *)&unk_100131758;
    return (optional<std::string> *)sub_10004E3F0((std::string *)retstr, v9);
  }

  char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 64) maxPHYModeDescription]);
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v10 = (std::string::value_type *)[v7 UTF8String];
    sub_10004E458((std::string *)retstr, &v10);
  }

  return result;
}

- (char)retrieveWiFILQM:(id)a3
{
  __int128 v4 = (__CFString *)a3;
  if (self->_scDynamicStore)
  {
    uint64_t v5 = kSCEntNetLinkQuality;
    NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v4,  kSCEntNetLinkQuality);
    if (NetworkInterfaceEntity)
    {
      char v7 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, NetworkInterfaceEntity);
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);
        char v10 = [v9 intValue];
      }

      else
      {
        char v10 = -1;
      }
    }

    else
    {
      uint64_t v11 = (os_log_s *)qword_100131948;
      if (os_log_type_enabled((os_log_t)qword_100131948, OS_LOG_TYPE_ERROR)) {
        sub_1000D87B8(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      char v10 = -1;
    }
  }

  else
  {
    char v10 = -1;
  }

  return v10;
}

- (BOOL)wiFiActiveAndUsingPersonalHotspot
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface NANData](self->_coreWiFiInterface, "NANData"));
  __int128 v4 = v3;
  if (v3 && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentKnownNetworkProfile])) != 0
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[CWFInterface currentKnownNetworkProfile]( self->_coreWiFiInterface,  "currentKnownNetworkProfile"))) != 0LL)
  {
    unsigned __int8 v6 = [v5 isPersonalHotspot];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (CWFInterface)coreWiFiInterface
{
  return self->_coreWiFiInterface;
}

- (void)setCoreWiFiInterface:(id)a3
{
}

- (void).cxx_destruct
{
  fObj = self->_stateRelayQueue.fObj.fObj;
  self->_stateRelayQueue.fObj.fObj = 0LL;

  begin = self->_registeredCWEventTypes.__begin_;
  if (begin)
  {
    self->_registeredCWEventTypes.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_scKeyPatterns, 0LL);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

@end