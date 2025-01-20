@interface TVSettingsContinuityCameraFacade
+ (BOOL)automaticallyNotifiesObserversOfConnectedDevice;
+ (BOOL)automaticallyNotifiesObserversOfDedicatedDevice;
+ (BOOL)isEnabled;
+ (BOOL)isSupported;
+ (id)sharedInstance;
- (BOOL)isActive;
- (NSString)selectedIdentifier;
- (RPRemoteDisplayDiscovery)discoverySession;
- (TVSContinuityCameraDevice)connectedDevice;
- (TVSContinuityCameraDevice)dedicatedDevice;
- (TVSettingsContinuityCameraFacade)init;
- (id)deviceForIdentifier:(id)a3;
- (void)_updateDevices;
- (void)activateWithCompletion:(id)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setSelectedIdentifier:(id)a3;
@end

@implementation TVSettingsContinuityCameraFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007D574;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1880 != -1) {
    dispatch_once(&qword_1001E1880, block);
  }
  return (id)qword_1001E1878;
}

+ (BOOL)isSupported
{
  return +[DDPeoplePickerViewController isSupported]( &OBJC_CLASS___DDPeoplePickerViewController,  "isSupported");
}

+ (BOOL)isEnabled
{
  return _os_feature_enabled_impl("Sharing", "DedicatedLaguna");
}

+ (BOOL)automaticallyNotifiesObserversOfConnectedDevice
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfDedicatedDevice
{
  return 0;
}

- (TVSettingsContinuityCameraFacade)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsContinuityCameraFacade;
  result = -[TVSettingsContinuityCameraFacade init](&v3, "init");
  if (result) {
    result->_isActive = 0;
  }
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (-[TVSettingsContinuityCameraFacade isActive](self, "isActive"))
  {
    v4[2](v4, 0LL);
  }

  else
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDiscovery);
    discoverySession = self->_discoverySession;
    self->_discoverySession = v5;

    -[RPRemoteDisplayDiscovery setDiscoveryFlags:](self->_discoverySession, "setDiscoveryFlags:", 3LL);
    v7 = self->_discoverySession;
    v8 = &_dispatch_main_q;
    -[RPRemoteDisplayDiscovery setDispatchQueue:](v7, "setDispatchQueue:", &_dispatch_main_q);

    v9 = self->_discoverySession;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10007D868;
    v20[3] = &unk_100191BE0;
    objc_copyWeak(&v21, &location);
    -[RPRemoteDisplayDiscovery setDedicatedDeviceChangedHandler:](v9, "setDedicatedDeviceChangedHandler:", v20);
    v10 = self->_discoverySession;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10007D978;
    v18[3] = &unk_100191C08;
    objc_copyWeak(&v19, &location);
    -[RPRemoteDisplayDiscovery setDiscoverySessionStateChangedHandler:]( v10,  "setDiscoverySessionStateChangedHandler:",  v18);
    v11 = self->_discoverySession;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10007D9A8;
    v16[3] = &unk_10018E810;
    objc_copyWeak(&v17, &location);
    -[RPRemoteDisplayDiscovery setInvalidationHandler:](v11, "setInvalidationHandler:", v16);
    v12 = self->_discoverySession;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10007D9C8;
    v13[3] = &unk_100191C30;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    -[RPRemoteDisplayDiscovery activateWithCompletion:](v12, "activateWithCompletion:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (id)deviceForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery discoveredDevices](self->_discoverySession, "discoveredDevices"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10007DBA8;
  v13[3] = &unk_100191C58;
  id v14 = v4;
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_firstObjectPassingTest:", v13));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery dedicatedDevice](self->_discoverySession, "dedicatedDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 persistentIdentifier]);
  id v10 = [v9 isEqualToString:v6];

  v11 = -[TVSContinuityCameraDevice initWithRPDevice:isDedicated:]( objc_alloc(&OBJC_CLASS___TVSContinuityCameraDevice),  "initWithRPDevice:isDedicated:",  v7,  v10);
  return v11;
}

- (void)_updateDevices
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery peerDeviceIdentifier](self->_discoverySession, "peerDeviceIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery discoveredDevices](self->_discoverySession, "discoveredDevices"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007DE08;
  v17[3] = &unk_100191C58;
  id v5 = v3;
  id v18 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_firstObjectPassingTest:", v17));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDiscovery dedicatedDevice](self->_discoverySession, "dedicatedDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentIdentifier]);
  id v9 = [v8 isEqualToString:v5];

  id v10 = -[TVSContinuityCameraDevice initWithRPDevice:isDedicated:]( objc_alloc(&OBJC_CLASS___TVSContinuityCameraDevice),  "initWithRPDevice:isDedicated:",  v6,  v9);
  v11 = -[TVSContinuityCameraDevice initWithRPDevice:isDedicated:]( objc_alloc(&OBJC_CLASS___TVSContinuityCameraDevice),  "initWithRPDevice:isDedicated:",  v7,  1LL);
  id v12 = sub_10007D938();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v11;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 1024;
    int v24 = (int)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Updating continuity devices... \n Dedicated device: %@ \n Connected device: %@ \n Connected device is dedicated: %d",  buf,  0x1Cu);
  }

  -[TVSettingsContinuityCameraFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"connectedDevice");
  -[TVSettingsContinuityCameraFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"dedicatedDevice");
  connectedDevice = self->_connectedDevice;
  self->_connectedDevice = v10;
  id v15 = v10;

  dedicatedDevice = self->_dedicatedDevice;
  self->_dedicatedDevice = v11;

  -[TVSettingsContinuityCameraFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"connectedDevice");
  -[TVSettingsContinuityCameraFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"dedicatedDevice");
}

- (TVSContinuityCameraDevice)dedicatedDevice
{
  return self->_dedicatedDevice;
}

- (TVSContinuityCameraDevice)connectedDevice
{
  return self->_connectedDevice;
}

- (RPRemoteDisplayDiscovery)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSString)selectedIdentifier
{
  return self->_selectedIdentifier;
}

- (void)setSelectedIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end