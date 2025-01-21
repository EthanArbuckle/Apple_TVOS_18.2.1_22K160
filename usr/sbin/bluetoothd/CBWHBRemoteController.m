@interface CBWHBRemoteController
- (BOOL)invalidated;
- (CBDaemonServer)daemonServer;
- (CBDiscovery)activatedDiscovery;
- (CBWHBDiscoveryDaemon)whbDaemon;
- (NSString)controllerID;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkDevice)remoteDevice;
- (id)description;
- (unint64_t)activationRetryCount;
- (unint64_t)discoveryFlags;
- (void)activate;
- (void)invalidate;
- (void)setActivatedDiscovery:(id)a3;
- (void)setActivationRetryCount:(unint64_t)a3;
- (void)setControllerID:(id)a3;
- (void)setDaemonServer:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setWhbDaemon:(id)a3;
@end

@implementation CBWHBRemoteController

- (id)description
{
  id v2 = sub_1000348F4(self->_remoteDevice);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = NSPrintF_safe("CBWHBRemoteController: %@", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  if (self->_discoveryFlags != a3)
  {
    self->_discoveryFlags = a3;
    -[CBDiscovery setDiscoveryFlags:](self->_activatedDiscovery, "setDiscoveryFlags:", a3 & 0xFFFFBFFFFFFFFFFFLL);
  }

- (void)activate
{
  if (dword_1008D63E0 <= 30 && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL)))
  {
    id v3 = sub_1000348F4(self->_remoteDevice);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_1008D63E0, "-[CBWHBRemoteController activate]", 30LL, "Remote controller activate: %@", v4);
  }

  v5 = self->_activatedDiscovery;
  if (!v5)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    objc_storeStrong((id *)&self->_activatedDiscovery, v5);
    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", self->_discoveryFlags & 0xFFFFBFFFFFFFFFFFLL);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v6 = -[CBDaemonServer xpcListenerEndpoint];
    if (v6)
    {
      -[CBDiscovery setTestListenerEndpoint:](v5, "setTestListenerEndpoint:", v6);
      v7 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      v8 = -[RPCompanionLinkDevice idsDeviceIdentifier](self->_remoteDevice, "idsDeviceIdentifier");
      -[CBDevice setIdentifier:](v7, "setIdentifier:", v8);

      -[CBDiscovery setRemoteDevice:](v5, "setRemoteDevice:", v7);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100034C38;
      v17[3] = &unk_10087EF10;
      v9 = v5;
      v18 = v9;
      v19 = self;
      -[CBDiscovery setDeviceFoundHandler:](v9, "setDeviceFoundHandler:", v17);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100034C58;
      v14[3] = &unk_10087EF10;
      v10 = v9;
      v15 = v10;
      v16 = self;
      -[CBDiscovery setDeviceLostHandler:](v10, "setDeviceLostHandler:", v14);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100034C78;
      v11[3] = &unk_10087EF38;
      v12 = v10;
      v13 = self;
      -[CBDiscovery activateWithCompletion:](v12, "activateWithCompletion:", v11);
    }

    else if (dword_1008D63E0 <= 90 {
           && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 90LL)))
    }
    {
      LogPrintF_safe(&dword_1008D63E0, "-[CBWHBRemoteController activate]", 90LL, "### No XPC listener endpoint");
    }
  }
}

- (void)invalidate
{
  if (dword_1008D63E0 <= 30 && (dword_1008D63E0 != -1 || _LogCategory_Initialize(&dword_1008D63E0, 30LL)))
  {
    id v3 = sub_1000348F4(self->_remoteDevice);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe( &dword_1008D63E0,  "-[CBWHBRemoteController invalidate]",  30LL,  "Remote controller invalidate: %@",  v4);
  }

  -[CBDiscovery invalidate](self->_activatedDiscovery, "invalidate");
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0LL;

  self->_invalidated = 1;
}

- (CBDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (void)setActivatedDiscovery:(id)a3
{
}

- (NSString)controllerID
{
  return self->_controllerID;
}

- (void)setControllerID:(id)a3
{
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPCompanionLinkDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (CBWHBDiscoveryDaemon)whbDaemon
{
  return self->_whbDaemon;
}

- (void)setWhbDaemon:(id)a3
{
}

- (unint64_t)activationRetryCount
{
  return self->_activationRetryCount;
}

- (void)setActivationRetryCount:(unint64_t)a3
{
  self->_activationRetryCount = a3;
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