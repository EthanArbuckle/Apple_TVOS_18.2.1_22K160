@interface IDSConnectivityMonitor
- (BOOL)isConnected;
- (BOOL)isNearby;
- (IDSConnectivityMonitor)init;
- (NRDeviceMonitor)deviceMonitor;
- (NSDate)lastConnection;
- (NSDate)lastDisconnection;
- (NSString)cbuuidString;
- (NSString)pairedDeviceCBUUIDString;
- (double)timeConnected;
- (double)timeDisconnected;
- (void)checkConnectivityState:(id)a3;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5;
- (void)sendMonitorMessage;
- (void)setCbuuidString:(id)a3;
- (void)setDeviceMonitor:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
- (void)setLastConnection:(id)a3;
- (void)setLastDisconnection:(id)a3;
- (void)setPairedDeviceCBUUIDString:(id)a3;
- (void)setTimeConnected:(double)a3;
- (void)setTimeDisconnected:(double)a3;
@end

@implementation IDSConnectivityMonitor

- (IDSConnectivityMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSConnectivityMonitor;
  return -[IDSConnectivityMonitor init](&v3, "init");
}

- (void)checkConnectivityState:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pairedDeviceUUIDString]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
    unsigned int v7 = [v6 isConnected];

    if (v7)
    {
      -[IDSConnectivityMonitor sendMonitorMessage](self, "sendMonitorMessage");
    }

    else
    {
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ConnectivityMonitor](&OBJC_CLASS___IDSFoundationLog, "ConnectivityMonitor"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IDS is not connected, do not send monitoring message.",  v15,  2u);
      }

      v9 = objc_alloc_init(&OBJC_CLASS___IDSConnectivityMonitorMetricProperties);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      -[IDSConnectivityMonitorMetricProperties setTerminusConnected:]( v9,  "setTerminusConnected:",  [v10 isTerminusConnected]);

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      -[IDSConnectivityMonitorMetricProperties setTerminusNearby:]( v9,  "setTerminusNearby:",  [v11 isTerminusNearby]);

      v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      -[IDSConnectivityMonitorMetricProperties setTerminusRegistered:]( v9,  "setTerminusRegistered:",  [v12 isTerminusRegistered]);

      -[IDSConnectivityMonitorMetricProperties setPairedDeviceCBUUIDString:](v9, "setPairedDeviceCBUUIDString:", v5);
      -[IDSConnectivityMonitorMetricProperties setSuccess:](v9, "setSuccess:", 0LL);
      -[IDSConnectivityMonitor timeConnected](self, "timeConnected");
      -[IDSConnectivityMonitorMetricProperties setTimeConnected:](v9, "setTimeConnected:");
      -[IDSConnectivityMonitor timeDisconnected](self, "timeDisconnected");
      -[IDSConnectivityMonitorMetricProperties setTimeDisconnected:](v9, "setTimeDisconnected:");
      v13 = -[IDSConnectivityMonitorMetric initWithProperties:]( objc_alloc(&OBJC_CLASS___IDSConnectivityMonitorMetric),  "initWithProperties:",  v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRTCLogger loggerWithCategory:](&OBJC_CLASS___IDSRTCLogger, "loggerWithCategory:", 3000LL));
      [v14 logMetric:v13];
    }
  }
}

- (void)sendMonitorMessage
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  id v4 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
  [v4 setPriority:200];
  uint64_t v19 = IDSDefaultPairedDevice;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDestination destinationWithStrings:](&OBJC_CLASS___IDSDestination, "destinationWithStrings:", v6));
  [v4 setDestinations:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 242LL));
  [v4 setCommand:v8];

  [v4 setFromID:0];
  [v4 setIdentifier:v3];
  uint64_t v9 = IDSGetUUIDData(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v4 setMessageUUID:v10];

  [v4 setLocalDelivery:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceWithIdentifier:@"com.apple.private.alloy.connectivity.monitor"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 localAccountOnService:v13]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001272DC;
  v16[3] = &unk_1008F7C00;
  id v17 = v3;
  v18 = self;
  id v15 = v3;
  [v14 sendMessageWithSendParameters:v4 willSendBlock:0 completionBlock:v16];
}

- (double)timeConnected
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitor lastConnection](self, "lastConnection"));

  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitor lastConnection](self, "lastConnection"));
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (double)timeDisconnected
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitor lastDisconnection](self, "lastDisconnection"));

  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSConnectivityMonitor lastDisconnection](self, "lastDisconnection"));
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", a3, a4));
  if (v5)
  {
    -[IDSConnectivityMonitor setLastConnection:](self, "setLastConnection:", v7);

    -[IDSConnectivityMonitor setLastDisconnection:](self, "setLastDisconnection:", 0LL);
  }

  else
  {
    -[IDSConnectivityMonitor setLastDisconnection:](self, "setLastDisconnection:", v7);

    -[IDSConnectivityMonitor setLastConnection:](self, "setLastConnection:", 0LL);
  }

- (NRDeviceMonitor)deviceMonitor
{
  return self->_deviceMonitor;
}

- (void)setDeviceMonitor:(id)a3
{
}

- (NSString)cbuuidString
{
  return self->_cbuuidString;
}

- (void)setCbuuidString:(id)a3
{
}

- (NSString)pairedDeviceCBUUIDString
{
  return self->_pairedDeviceCBUUIDString;
}

- (void)setPairedDeviceCBUUIDString:(id)a3
{
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void)setIsNearby:(BOOL)a3
{
  self->_isNearby = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (void)setTimeConnected:(double)a3
{
  self->_timeConnected = a3;
}

- (void)setTimeDisconnected:(double)a3
{
  self->_timeDisconnected = a3;
}

- (NSDate)lastConnection
{
  return self->_lastConnection;
}

- (void)setLastConnection:(id)a3
{
}

- (NSDate)lastDisconnection
{
  return self->_lastDisconnection;
}

- (void)setLastDisconnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end