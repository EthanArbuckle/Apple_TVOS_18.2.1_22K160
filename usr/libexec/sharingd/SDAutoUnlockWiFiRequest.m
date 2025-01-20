@interface SDAutoUnlockWiFiRequest
- (BOOL)activateCalled;
- (BOOL)calledAWDLStarted;
- (BOOL)invalidateCalled;
- (BOOL)invalidated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRangingInitiator;
- (BOOL)rangeable;
- (BOOL)rangingStarted;
- (BOOL)waitingForNetworkToDisable;
- (NSArray)wifiRangingResults;
- (NSDictionary)awdlInfo;
- (NSError)wifiRangingError;
- (NSString)identifier;
- (SDAutoUnlockRangingPeer)rangingPeer;
- (SDAutoUnlockWiFiRequest)initWithAwdlInfo:(id)a3 isRangingInitiator:(BOOL)a4 rangingPeer:(id)a5 queueAvailableHandler:(id)a6 awdlStartedHandler:(id)a7 peerFoundHandler:(id)a8 rangingStartedHandler:(id)a9 rangingCompletedHandler:(id)a10 invalidationHandler:(id)a11;
- (id)awdlStartedHandler;
- (id)invalidationHandler;
- (id)peerFoundHandler;
- (id)queueAvailableHandler;
- (id)rangingCompletedHandler;
- (id)rangingStartedHandler;
- (int64_t)rangingTimeout;
- (unint64_t)hash;
- (void)_invalidate;
- (void)setActivateCalled:(BOOL)a3;
- (void)setAwdlStartedHandler:(id)a3;
- (void)setCalledAWDLStarted:(BOOL)a3;
- (void)setInvalidateCalled:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeerFoundHandler:(id)a3;
- (void)setQueueAvailableHandler:(id)a3;
- (void)setRangeable:(BOOL)a3;
- (void)setRangingCompletedHandler:(id)a3;
- (void)setRangingPeer:(id)a3;
- (void)setRangingStarted:(BOOL)a3;
- (void)setRangingStartedHandler:(id)a3;
- (void)setRangingTimeout:(int64_t)a3;
- (void)setWaitingForNetworkToDisable:(BOOL)a3;
- (void)setWifiRangingError:(id)a3;
- (void)setWifiRangingResults:(id)a3;
@end

@implementation SDAutoUnlockWiFiRequest

- (SDAutoUnlockWiFiRequest)initWithAwdlInfo:(id)a3 isRangingInitiator:(BOOL)a4 rangingPeer:(id)a5 queueAvailableHandler:(id)a6 awdlStartedHandler:(id)a7 peerFoundHandler:(id)a8 rangingStartedHandler:(id)a9 rangingCompletedHandler:(id)a10 invalidationHandler:(id)a11
{
  id v42 = a3;
  id v41 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___SDAutoUnlockWiFiRequest;
  v23 = -[SDAutoUnlockWiFiRequest init](&v43, "init");
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 UUIDString]);
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v25;

    objc_storeStrong((id *)&v23->_awdlInfo, a3);
    v23->_isRangingInitiator = a4;
    objc_storeStrong((id *)&v23->_rangingPeer, a5);
    id v27 = [v17 copy];
    id queueAvailableHandler = v23->_queueAvailableHandler;
    v23->_id queueAvailableHandler = v27;

    id v29 = [v18 copy];
    id awdlStartedHandler = v23->_awdlStartedHandler;
    v23->_id awdlStartedHandler = v29;

    id v31 = [v19 copy];
    id peerFoundHandler = v23->_peerFoundHandler;
    v23->_id peerFoundHandler = v31;

    id v33 = [v20 copy];
    id rangingStartedHandler = v23->_rangingStartedHandler;
    v23->_id rangingStartedHandler = v33;

    id v35 = [v21 copy];
    id rangingCompletedHandler = v23->_rangingCompletedHandler;
    v23->_id rangingCompletedHandler = v35;

    id v37 = [v22 copy];
    id invalidationHandler = v23->_invalidationHandler;
    v23->_id invalidationHandler = v37;
  }

  return v23;
}

- (void)_invalidate
{
  uint64_t v3 = auto_unlock_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SDAutoUnlockWiFiRequest _invalidate]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  -[SDAutoUnlockWiFiRequest setInvalidated:](self, "setInvalidated:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiRequest invalidationHandler](self, "invalidationHandler"));

  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiRequest invalidationHandler](self, "invalidationHandler"));
    v6[2]();
  }

  -[SDAutoUnlockWiFiRequest setInvalidationHandler:](self, "setInvalidationHandler:", 0LL);
  -[SDAutoUnlockWiFiRequest setQueueAvailableHandler:](self, "setQueueAvailableHandler:", 0LL);
  -[SDAutoUnlockWiFiRequest setAwdlStartedHandler:](self, "setAwdlStartedHandler:", 0LL);
  -[SDAutoUnlockWiFiRequest setPeerFoundHandler:](self, "setPeerFoundHandler:", 0LL);
  -[SDAutoUnlockWiFiRequest setRangingStartedHandler:](self, "setRangingStartedHandler:", 0LL);
  -[SDAutoUnlockWiFiRequest setRangingCompletedHandler:](self, "setRangingCompletedHandler:", 0LL);
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiRequest identifier](self, "identifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSDictionary)awdlInfo
{
  return self->_awdlInfo;
}

- (BOOL)isRangingInitiator
{
  return self->_isRangingInitiator;
}

- (SDAutoUnlockRangingPeer)rangingPeer
{
  return self->_rangingPeer;
}

- (void)setRangingPeer:(id)a3
{
}

- (int64_t)rangingTimeout
{
  return self->_rangingTimeout;
}

- (void)setRangingTimeout:(int64_t)a3
{
  self->_rangingTimeout = a3;
}

- (NSError)wifiRangingError
{
  return self->_wifiRangingError;
}

- (void)setWifiRangingError:(id)a3
{
}

- (NSArray)wifiRangingResults
{
  return self->_wifiRangingResults;
}

- (void)setWifiRangingResults:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)queueAvailableHandler
{
  return self->_queueAvailableHandler;
}

- (void)setQueueAvailableHandler:(id)a3
{
}

- (id)awdlStartedHandler
{
  return self->_awdlStartedHandler;
}

- (void)setAwdlStartedHandler:(id)a3
{
}

- (id)peerFoundHandler
{
  return self->_peerFoundHandler;
}

- (void)setPeerFoundHandler:(id)a3
{
}

- (id)rangingStartedHandler
{
  return self->_rangingStartedHandler;
}

- (void)setRangingStartedHandler:(id)a3
{
}

- (id)rangingCompletedHandler
{
  return self->_rangingCompletedHandler;
}

- (void)setRangingCompletedHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)activateCalled
{
  return self->_activateCalled;
}

- (void)setActivateCalled:(BOOL)a3
{
  self->_activateCalled = a3;
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)rangeable
{
  return self->_rangeable;
}

- (void)setRangeable:(BOOL)a3
{
  self->_rangeable = a3;
}

- (BOOL)calledAWDLStarted
{
  return self->_calledAWDLStarted;
}

- (void)setCalledAWDLStarted:(BOOL)a3
{
  self->_calledAWDLStarted = a3;
}

- (BOOL)rangingStarted
{
  return self->_rangingStarted;
}

- (void)setRangingStarted:(BOOL)a3
{
  self->_rangingStarted = a3;
}

- (BOOL)waitingForNetworkToDisable
{
  return self->_waitingForNetworkToDisable;
}

- (void)setWaitingForNetworkToDisable:(BOOL)a3
{
  self->_waitingForNetworkToDisable = a3;
}

- (void).cxx_destruct
{
}

@end