@interface SDAutoUnlockProxySession
- (BOOL)activeConnection;
- (BOOL)invalidated;
- (BOOL)notified;
- (NSDate)startDate;
- (NSString)model;
- (SDAutoUnlockProxySession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5;
- (SFBLEDevice)bleDevice;
- (double)connectionTime;
- (double)proxyDiscoveryTime;
- (id)results;
- (int)proxyRSSI;
- (int64_t)state;
- (void)_start;
- (void)addObservers;
- (void)deviceConnected:(id)a3;
- (void)handleFoundBLEDevice:(id)a3;
- (void)invalidate;
- (void)notifyDelegateWithError:(id)a3;
- (void)removeObservers;
- (void)sendProxyTrigger;
- (void)setActiveConnection:(BOOL)a3;
- (void)setBleDevice:(id)a3;
- (void)setConnectionTime:(double)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setNotified:(BOOL)a3;
- (void)setProxyDiscoveryTime:(double)a3;
- (void)setProxyRSSI:(int)a3;
- (void)setStartDate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
@end

@implementation SDAutoUnlockProxySession

- (SDAutoUnlockProxySession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDAutoUnlockProxySession;
  v10 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v13, "initWithDevice:sessionID:", a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bleDevice, a5);
    -[SDAutoUnlockProxySession addObservers](v11, "addObservers");
  }

  return v11;
}

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008F778;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
  [v3 startUnlockBLEConnectionWithDevice:v4 encrypted:1];

  -[SDAutoUnlockProxySession setState:](self, "setState:", 1LL);
  -[SDAutoUnlockProxySession sendProxyTrigger](self, "sendProxyTrigger");
}

- (void)invalidate
{
  if (!-[SDAutoUnlockProxySession invalidated](self, "invalidated"))
  {
    -[SDAutoUnlockProxySession setInvalidated:](self, "setInvalidated:", 1LL);
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___SDAutoUnlockProxySession;
    -[SDAutoUnlockPairingSession invalidate](&v5, "invalidate");
    -[SDAutoUnlockProxySession removeObservers](self, "removeObservers");
    if (-[SDAutoUnlockProxySession activeConnection](self, "activeConnection"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
      [v3 stopUnlockBLEConnectionWithDevice:v4];
    }
  }

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"deviceConnected:" name:SFBluetoothNotificationNameConnected object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (id)results
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  SDAutoUnlockManagerMetricUsingProxyDeviceKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession model](self, "model"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  SDAutoUnlockManagerMetricProxyDeviceModelKey);

  if (-[SDAutoUnlockProxySession proxyRSSI](self, "proxyRSSI"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SDAutoUnlockProxySession proxyRSSI](self, "proxyRSSI")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  SDAutoUnlockManagerMetricProxyDeviceRSSIKey);
  }

  -[SDAutoUnlockProxySession proxyDiscoveryTime](self, "proxyDiscoveryTime");
  if (v6 != 0.0)
  {
    -[SDAutoUnlockProxySession proxyDiscoveryTime](self, "proxyDiscoveryTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey);
  }

  return v3;
}

- (void)deviceConnected:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:SFBluetoothNotificationKeyPeerDevice]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned int v8 = [v5 isEqual:v7];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectTime]);
    [v9 doubleValue];
    -[SDAutoUnlockProxySession setConnectionTime:](self, "setConnectionTime:");

    if ((id)-[SDAutoUnlockProxySession state](self, "state") == (id)1) {
      -[SDAutoUnlockProxySession setState:](self, "setState:", 2LL);
    }
  }
}

- (void)handleFoundBLEDevice:(id)a3
{
  id v4 = a3;
  -[SDAutoUnlockProxySession setProxyRSSI:](self, "setProxyRSSI:", [v4 rssi]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession startDate](self, "startDate"));
  [v5 timeIntervalSinceDate:v6];
  -[SDAutoUnlockProxySession setProxyDiscoveryTime:](self, "setProxyDiscoveryTime:");

  BOOL v7 = sub_10008A0CC(v4);
  if (v7)
  {
    uint64_t v8 = auto_unlock_log(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Proxy available for unlock", v17, 2u);
    }

    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    -[__CFString sessionDidStartConnection:](v10, "sessionDidStartConnection:", self);
  }

  else
  {
    if (sub_10008A0F8(v4))
    {
      uint64_t v12 = SFLocalizedStringForKey(@"UNLOCK_WATCH_LOCKED_ON_WRIST", v11);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v13 = 135LL;
    }

    else
    {
      id v10 = @"Watch Not On Wrist";
      uint64_t v13 = 144LL;
    }

    uint64_t v14 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    v19 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  v13,  v15));
    -[SDAutoUnlockProxySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v16);
  }
}

- (void)notifyDelegateWithError:(id)a3
{
  id v7 = a3;
  if (!-[SDAutoUnlockProxySession notified](self, "notified"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    char v5 = objc_opt_respondsToSelector(v4, "session:didCompleteWithError:");

    if ((v5 & 1) != 0)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
      [v6 session:self didCompleteWithError:v7];

      -[SDAutoUnlockProxySession setNotified:](self, "setNotified:", 1LL);
    }
  }
}

- (void)sendProxyTrigger
{
  id v3 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockProxyTrigger);
  uint64_t v4 = auto_unlock_log(-[SDAutoUnlockProxyTrigger setVersion:](v3, "setVersion:", 1LL));
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending SDAutoUnlockMessageTypeProxyTrigger",  buf,  2u);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxyTrigger data](v3, "data"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v6, 307LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10008FF0C;
  v10[3] = &unk_1005CB3E8;
  v10[4] = self;
  [v8 sendUnlockData:v7 toBLEDevice:v9 completion:v10];

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580((double)35LL));
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (int)proxyRSSI
{
  return self->_proxyRSSI;
}

- (void)setProxyRSSI:(int)a3
{
  self->_proxyRSSI = a3;
}

- (double)proxyDiscoveryTime
{
  return self->_proxyDiscoveryTime;
}

- (void)setProxyDiscoveryTime:(double)a3
{
  self->_proxyDiscoveryTime = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(BOOL)a3
{
  self->_activeConnection = a3;
}

- (BOOL)notified
{
  return self->_notified;
}

- (void)setNotified:(BOOL)a3
{
  self->_notified = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
}

@end