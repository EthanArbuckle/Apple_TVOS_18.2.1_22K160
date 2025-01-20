@interface IDSNRDeviceBridge
- (BOOL)isClassCConnected;
- (BOOL)isConnected;
- (BOOL)isDevicesIdentifierEqualTo:(id)a3;
- (BOOL)isNearby;
- (BOOL)isRegistered;
- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4;
- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4 startMonitor:(BOOL)a5;
- (IDSNRDeviceBridgeDelegate)delegate;
- (NRDeviceMonitor)nrDeviceMonitor;
- (NSUUID)deviceIdentifier;
- (OS_dispatch_queue)nrMonitorQueue;
- (unsigned)latestLinkType;
- (void)_notifyWirelessRadioManagerAboutLinkChange:(unsigned __int8)a3;
- (void)_startNRDeviceMonitor:(id)a3;
- (void)dealloc;
- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4;
- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4;
- (void)deviceIsCloudConnectedDidChange:(id)a3 isCloudConnected:(BOOL)a4;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setLatestLinkType:(unsigned __int8)a3;
- (void)setNrDeviceMonitor:(id)a3;
- (void)setNrMonitorQueue:(id)a3;
@end

@implementation IDSNRDeviceBridge

- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4
{
  return -[IDSNRDeviceBridge initWithDeviceIdentifier:delegate:startMonitor:]( self,  "initWithDeviceIdentifier:delegate:startMonitor:",  a3,  a4,  1LL);
}

- (IDSNRDeviceBridge)initWithDeviceIdentifier:(id)a3 delegate:(id)a4 startMonitor:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSNRDeviceBridge;
  v10 = -[IDSNRDeviceBridge init](&v20, "init");
  if (v10)
  {
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("NRDeviceMonitor", v14);
    nrMonitorQueue = v10->_nrMonitorQueue;
    v10->_nrMonitorQueue = (OS_dispatch_queue *)v15;

    objc_storeWeak((id *)&v10->_delegate, v9);
    v17 = (NSUUID *)[v8 copy];
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = v17;

    if (v5) {
      -[IDSNRDeviceBridge _startNRDeviceMonitor:](v10, "_startNRDeviceMonitor:", v8);
    }
  }

  return v10;
}

- (void)dealloc
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Dealloc'ing IDSNRDeviceBridge {pointer: %p}",  buf,  0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSNRDeviceBridge;
  -[IDSNRDeviceBridge dealloc](&v4, "dealloc");
}

- (void)_startNRDeviceMonitor:(id)a3
{
  id v4 = a3;
  nrMonitorQueue = (dispatch_queue_s *)self->_nrMonitorQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001A2CC;
  v7[3] = &unk_1008F5F80;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(nrMonitorQueue, v7);
}

- (BOOL)isNearby
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDeviceBridge nrDeviceMonitor](self, "nrDeviceMonitor"));
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (BOOL)isConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDeviceBridge nrDeviceMonitor](self, "nrDeviceMonitor"));
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (BOOL)isRegistered
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDeviceBridge nrDeviceMonitor](self, "nrDeviceMonitor"));
  unsigned __int8 v3 = [v2 isRegistered];

  return v3;
}

- (BOOL)isDevicesIdentifierEqualTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDeviceBridge deviceIdentifier](self, "deviceIdentifier"));
  unsigned __int8 v6 = [v5 isEqual:v4];

  return v6;
}

- (BOOL)isClassCConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNRDeviceBridge nrDeviceMonitor](self, "nrDeviceMonitor"));
  unsigned __int8 v3 = [v2 isClassCConnected];

  return v3;
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    if (v7) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    *(_DWORD *)buf = 138543875;
    v19 = v9;
    __int16 v20 = 2114;
    v21 = v10;
    __int16 v22 = 2113;
    v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "isConnected didChange {isConnected: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}",  buf,  0x20u);
  }

  if (v7)
  {
    uint64_t v14 = im_primary_queue(v12, v13);
    dispatch_queue_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001A6F0;
    v16[3] = &unk_1008F6418;
    v16[4] = self;
    BOOL v17 = v4;
    dispatch_async(v15, v16);
  }
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    if (v7) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    *(_DWORD *)buf = 138543875;
    v19 = v9;
    __int16 v20 = 2114;
    v21 = v10;
    __int16 v22 = 2113;
    v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "isNearby didChange {isNearby: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}",  buf,  0x20u);
  }

  if (v7)
  {
    uint64_t v14 = im_primary_queue(v12, v13);
    dispatch_queue_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001A8A8;
    v16[3] = &unk_1008F6418;
    v16[4] = self;
    BOOL v17 = v4;
    dispatch_async(v15, v16);
  }
}

- (void)deviceIsCloudConnectedDidChange:(id)a3 isCloudConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    if (v7) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    *(_DWORD *)buf = 138543875;
    v19 = v9;
    __int16 v20 = 2114;
    v21 = v10;
    __int16 v22 = 2113;
    v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "isCloudConnected didChange {isCloudConnected: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}",  buf,  0x20u);
  }

  if (v7)
  {
    uint64_t v14 = im_primary_queue(v12, v13);
    dispatch_queue_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001AA60;
    v16[3] = &unk_1008F6418;
    v16[4] = self;
    BOOL v17 = v4;
    dispatch_async(v15, v16);
  }
}

- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v9 = @"NO";
    }
    else {
      id v9 = @"YES";
    }
    if (v7) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    *(_DWORD *)buf = 138543875;
    __int16 v20 = v9;
    __int16 v21 = 2114;
    __int16 v22 = v10;
    __int16 v23 = 2113;
    v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "isAwake didChange {isAwake: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}",  buf,  0x20u);
  }

  if (v7)
  {
    BOOL v14 = !v4;
    uint64_t v15 = im_primary_queue(v12, v13);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10001AC1C;
    v17[3] = &unk_1008F6418;
    v17[4] = self;
    BOOL v18 = v14;
    dispatch_async(v16, v17);
  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  StringFromNRLinkType = (void *)j__createStringFromNRLinkType(v4);
  unsigned int v8 = [v6 isRegistered];
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    *(_DWORD *)buf = 138543875;
    __int16 v23 = StringFromNRLinkType;
    __int16 v24 = 2114;
    v25 = v10;
    __int16 v26 = 2113;
    v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "linkType didChange {linkType: %{public}@, isRegistered: %{public}@ deviceIdentifier: %{private}@}",  buf,  0x20u);
  }

  uint64_t v12 = objc_alloc(&OBJC_CLASS___NSDictionary);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v4));
  BOOL v14 = -[NSDictionary initWithObjectsAndKeys:](v12, "initWithObjectsAndKeys:", v13, @"IPsecLinkType", 0LL);

  uint64_t v15 = v4;
  if (!(_DWORD)v4) {
    uint64_t v15 = -[IDSNRDeviceBridge latestLinkType](self, "latestLinkType", v4);
  }
  id v16 = -[IDSNRDeviceBridge setLatestLinkType:](self, "setLatestLinkType:", v15);
  uint64_t v18 = im_primary_queue(v16, v17);
  v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AE60;
  block[3] = &unk_1008F6418;
  block[4] = self;
  char v21 = v4;
  dispatch_async(v19, block);

  IDSPowerLogDictionary(@"IPsec Link", v14);
  -[IDSNRDeviceBridge _notifyWirelessRadioManagerAboutLinkChange:]( self,  "_notifyWirelessRadioManagerAboutLinkChange:",  v4);
}

- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 isRegistered];
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    if (v7) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    *(_DWORD *)buf = 138543875;
    v19 = v9;
    __int16 v20 = 2114;
    char v21 = v10;
    __int16 v22 = 2113;
    __int16 v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "isClassCConnected didChange {isClassCConnected: %{public}@, isRegistered: %{public}@, deviceIdentifier: %{private}@}",  buf,  0x20u);
  }

  if (v7)
  {
    uint64_t v14 = im_primary_queue(v12, v13);
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001B018;
    v16[3] = &unk_1008F6418;
    v16[4] = self;
    BOOL v17 = v4;
    dispatch_async(v15, v16);
  }
}

- (void)_notifyWirelessRadioManagerAboutLinkChange:(unsigned __int8)a3
{
  if (a3 == 2)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
    id v5 = v3;
    uint64_t v4 = 1LL;
  }

  else if (a3 == 1)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
    id v5 = v3;
    uint64_t v4 = 3LL;
  }

  else
  {
    if (a3) {
      return;
    }
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
    id v5 = v3;
    uint64_t v4 = 2LL;
  }

  [v3 handleActiveLinkChange:v4];
}

- (IDSNRDeviceBridgeDelegate)delegate
{
  return (IDSNRDeviceBridgeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)nrMonitorQueue
{
  return self->_nrMonitorQueue;
}

- (void)setNrMonitorQueue:(id)a3
{
}

- (NRDeviceMonitor)nrDeviceMonitor
{
  return self->_nrDeviceMonitor;
}

- (void)setNrDeviceMonitor:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (unsigned)latestLinkType
{
  return self->_latestLinkType;
}

- (void)setLatestLinkType:(unsigned __int8)a3
{
  self->_latestLinkType = a3;
}

- (void).cxx_destruct
{
}

@end