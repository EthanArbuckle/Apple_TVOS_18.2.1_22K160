@interface RPNearbyInvitationDaemon
+ (id)sharedInvitationDaemon;
- (BOOL)_clientBLENearbyActionAdvertiserShouldRun;
- (BOOL)_clientBLENearbyActionDiscoveryShouldRun;
- (BOOL)_clientBLEServerShouldRun;
- (BOOL)_clientProximityEstimatorShouldRun;
- (BOOL)_serverBLEClientConnectionShouldStart;
- (BOOL)_serverBLENearbyActionAdvertiserShouldRun;
- (BOOL)_serverBLENearbyActionDiscoveryShouldRun;
- (BOOL)_serverBLENearbyInfoDiscoveryShouldRun;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)invalidateCalled;
- (BOOL)invalidateDone;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)prefClientEnabled;
- (BOOL)prefGuestClientEnabled;
- (BOOL)prefGuestServerEnabled;
- (BOOL)prefServerEnabled;
- (BOOL)prefServerRSSIDisabled;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (CUBLEServer)bleServer;
- (CUSystemMonitor)systemMonitor;
- (NSMutableDictionary)bleClientConnections;
- (NSMutableSet)bleServerConnections;
- (NSMutableSet)devicesWantingInvitations;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)clientDisabledDupeFilterTimer;
- (OS_dispatch_source)clientNearbyActionAdvertiserTimer;
- (OS_dispatch_source)clientNearbyActionDiscoveryTimer;
- (OS_dispatch_source)serverNearbyActionAdvertiserTimer;
- (RPCompanionLinkClient)bleNearbyInfoDiscovery;
- (RPCompanionLinkDevice)bleDeviceWantingInvitations;
- (RPNIProximityEstimator)proximityEstimator;
- (RPNearbyInvitationDaemon)init;
- (RPNearbyInvitationDevice)bleDeviceAcceptedInvitations;
- (SFDeviceDiscovery)bleNearbyActionDiscovery;
- (SFDeviceDiscovery)clientBLENearbyActionDiscovery;
- (SFService)bleNearbyActionAdvertiser;
- (SFService)clientBLENearbyActionAdvertiser;
- (id)_findMatchingDeviceWithIdentifier:(id)a3;
- (id)_idleSessionConnection;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)cnxIDLast;
- (unsigned)sessionIDLast;
- (void)_activate;
- (void)_bleClientConnectionEnded:(id)a3;
- (void)_bleClientConnectionStateChanged:(int)a3 cnx:(id)a4 sessionID:(id)a5;
- (void)_clientBLENearbyActionAdvertiserEnsureStarted;
- (void)_clientBLENearbyActionAdvertiserEnsureStopped;
- (void)_clientBLENearbyActionAdvertiserStartTimer;
- (void)_clientBLENearbyActionDisableDupeFilter;
- (void)_clientBLENearbyActionDiscoveryDeviceFound:(id)a3;
- (void)_clientBLENearbyActionDiscoveryDeviceLost:(id)a3;
- (void)_clientBLENearbyActionDiscoveryEnsureStarted;
- (void)_clientBLENearbyActionDiscoveryEnsureStopped;
- (void)_clientBLENearbyActionDiscoveryScanRateStartTimer;
- (void)_clientBLENearbyActionEnableDupeFilter;
- (void)_clientBLEServerEnsureStarted;
- (void)_clientBLEServerEnsureStopped;
- (void)_clientBLEServerHandleConnectionEnded:(id)a3;
- (void)_clientBLEServerHandleConnectionStarted:(id)a3;
- (void)_clientBLEServerHandleConnectionStateChange:(int)a3 cnx:(id)a4;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_clientProximityEstimatorEnsureStarted;
- (void)_clientProximityEstimatorEnsureStopped;
- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)_clientReportFoundDevice:(id)a3;
- (void)_clientReportLostDevice:(id)a3;
- (void)_handleServerActivation:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 xpcCnx:(id)a6 sessionID:(id)a7;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 xpcCnx:(id)a7 sessionID:(id)a8;
- (void)_serverBLEClientConnectionEnsureStarted;
- (void)_serverBLENearbyActionAdvertiserEnsureStarted;
- (void)_serverBLENearbyActionAdvertiserEnsureStopped;
- (void)_serverBLENearbyActionAdvertiserRestartTimer;
- (void)_serverBLENearbyActionDiscoveryDeviceFound:(id)a3;
- (void)_serverBLENearbyActionDiscoveryEnsureStarted;
- (void)_serverBLENearbyActionDiscoveryEnsureStopped;
- (void)_serverBLENearbyInfoDiscoveryDeviceFound:(id)a3;
- (void)_serverBLENearbyInfoDiscoveryDeviceLost:(id)a3;
- (void)_serverBLENearbyInfoDiscoveryEnsureStarted;
- (void)_serverBLENearbyInfoDiscoveryEnsureStopped;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_update;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)prefsChanged;
- (void)setBleClientConnections:(id)a3;
- (void)setBleDeviceAcceptedInvitations:(id)a3;
- (void)setBleDeviceWantingInvitations:(id)a3;
- (void)setBleNearbyActionAdvertiser:(id)a3;
- (void)setBleNearbyActionDiscovery:(id)a3;
- (void)setBleNearbyInfoDiscovery:(id)a3;
- (void)setBleServer:(id)a3;
- (void)setBleServerConnections:(id)a3;
- (void)setClientBLENearbyActionAdvertiser:(id)a3;
- (void)setClientBLENearbyActionDiscovery:(id)a3;
- (void)setClientDisabledDupeFilterTimer:(id)a3;
- (void)setClientNearbyActionAdvertiserTimer:(id)a3;
- (void)setClientNearbyActionDiscoveryTimer:(id)a3;
- (void)setCnxIDLast:(unsigned int)a3;
- (void)setDevicesWantingInvitations:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidateCalled:(BOOL)a3;
- (void)setInvalidateDone:(BOOL)a3;
- (void)setPrefClientEnabled:(BOOL)a3;
- (void)setPrefGuestClientEnabled:(BOOL)a3;
- (void)setPrefGuestServerEnabled:(BOOL)a3;
- (void)setPrefServerEnabled:(BOOL)a3;
- (void)setPrefServerRSSIDisabled:(BOOL)a3;
- (void)setProximityEstimator:(id)a3;
- (void)setServerNearbyActionAdvertiserTimer:(id)a3;
- (void)setSessionIDLast:(unsigned int)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation RPNearbyInvitationDaemon

- (RPNearbyInvitationDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationDaemon;
  v2 = -[RPNearbyInvitationDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000534A8;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_xpcListener)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _activate]",  30LL,  "Activating XPC listener %@\n",  @"com.apple.rapport.NearbyInvitation");
    }

    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.rapport.NearbyInvitation");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  -[RPNearbyInvitationDaemon prefsChanged](self, "prefsChanged");
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053644;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF(&dword_100131F70, "-[RPNearbyInvitationDaemon _invalidate]", 30LL, "Invalidating\n");
    }

    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0LL;

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0LL;

    -[RPNearbyInvitationDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPNearbyInvitationDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPNearbyInvitationDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF(&dword_100131F70, "-[RPNearbyInvitationDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)prefsChanged
{
  int DeviceClass = GestaltGetDeviceClass(v3, v4);
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.rapport", @"nearbyInvitationClient", &v32);
  if (v32) {
    BOOL v7 = DeviceClass == 1;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v9 = v7 || Int64 != 0;
  if (self->_prefClientEnabled != v9)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      v10 = "yes";
      if (v9) {
        v11 = "no";
      }
      else {
        v11 = "yes";
      }
      if (!v9) {
        v10 = "no";
      }
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon prefsChanged]",  30LL,  "Client enabled: %s -> %s\n",  v11,  v10);
    }

    self->_prefClientEnabled = v9;
  }

  uint64_t v12 = CFPrefs_GetInt64(@"com.apple.rapport", @"nearbyInvitationServer", &v32);
  if (v32) {
    BOOL v13 = DeviceClass == 7;
  }
  else {
    BOOL v13 = 0;
  }
  BOOL v15 = v13 || v12 != 0;
  if (self->_prefServerEnabled != v15)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      v16 = "yes";
      if (v15) {
        v17 = "no";
      }
      else {
        v17 = "yes";
      }
      if (!v15) {
        v16 = "no";
      }
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon prefsChanged]",  30LL,  "Server enabled: %s -> %s\n",  v17,  v16);
    }

    self->_prefServerEnabled = v15;
  }

  uint64_t v18 = CFPrefs_GetInt64(@"com.apple.rapport", @"nearbyInvitationGuestServer", &v32);
  if (v32) {
    BOOL v19 = DeviceClass == 7;
  }
  else {
    BOOL v19 = 0;
  }
  BOOL v21 = v19 || v18 != 0;
  if (self->_prefGuestServerEnabled != v21)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      v22 = "yes";
      if (v21) {
        v23 = "no";
      }
      else {
        v23 = "yes";
      }
      if (!v21) {
        v22 = "no";
      }
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon prefsChanged]",  30LL,  "Guest server enabled: %s -> %s\n",  v23,  v22);
    }

    self->_prefGuestServerEnabled = v21;
  }

  BOOL v24 = CFPrefs_GetInt64(@"com.apple.rapport", @"nearbyInvitationGuestClient", &v32) != 0;
  if (v32 && (DeviceClass | 2) == 3) {
    BOOL v24 = 1;
  }
  if (self->_prefGuestClientEnabled != v24)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      v25 = "yes";
      if (v24) {
        v26 = "no";
      }
      else {
        v26 = "yes";
      }
      if (!v24) {
        v25 = "no";
      }
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon prefsChanged]",  30LL,  "Guest client enabled: %s -> %s\n",  v26,  v25);
    }

    self->_prefGuestClientEnabled = v24;
  }

  uint64_t v27 = CFPrefs_GetInt64(@"com.apple.rapport", @"nearbyInvitationDisableServerRSSI", &v32);
  BOOL v28 = v27 != 0;
  if (self->_prefServerRSSIDisabled != v28)
  {
    if (dword_100131F70 <= 30)
    {
      uint64_t v29 = v27;
      if (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL))
      {
        v30 = "yes";
        if (v29) {
          v31 = "no";
        }
        else {
          v31 = "yes";
        }
        if (!v29) {
          v30 = "no";
        }
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon prefsChanged]",  30LL,  "Server RSSI disabled: %s -> %s\n",  v31,  v30);
      }
    }

    self->_prefServerRSSIDisabled = v28;
  }

  -[RPNearbyInvitationDaemon _update](self, "_update");
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

+ (id)sharedInvitationDaemon
{
  if (qword_1001333C8 != -1) {
    dispatch_once(&qword_1001333C8, &stru_100112DC0);
  }
  return (id)qword_1001333C0;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4 = 0LL;
  NSAppendPrintF(&v4, "-- RPNearbyInvitationDaemon --\n", *(void *)&a3);
  return v4;
}

- (void)setBleDeviceWantingInvitations:(id)a3
{
  id v4 = a3;
  v5 = self->_bleDeviceWantingInvitations;
  objc_super v6 = (RPCompanionLinkDevice *)v4;
  uint64_t v12 = v6;
  if (v5 == v6)
  {

    bleDeviceWantingInvitations = v12;
  }

  else
  {
    if ((v6 != 0LL) != (v5 == 0LL))
    {
      unsigned __int8 v7 = -[RPCompanionLinkDevice isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {

      v8 = v12;
    }

    if (dword_100131F70 <= 30)
    {
      if (dword_100131F70 != -1 || (int v10 = _LogCategory_Initialize(&dword_100131F70, 30LL), v8 = v12, v10))
      {
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:]",  30LL,  "BLE device wanting invitations: %@ -> %@\n",  self->_bleDeviceWantingInvitations,  v8);
        v8 = v12;
      }
    }

    v11 = v8;
    bleDeviceWantingInvitations = self->_bleDeviceWantingInvitations;
    self->_bleDeviceWantingInvitations = v11;
  }

  v8 = v12;
LABEL_13:
}

- (void)setBleDeviceAcceptedInvitations:(id)a3
{
  id v4 = a3;
  v5 = self->_bleDeviceAcceptedInvitations;
  objc_super v6 = (RPNearbyInvitationDevice *)v4;
  uint64_t v12 = v6;
  if (v5 == v6)
  {

    bleDeviceAcceptedInvitations = v12;
  }

  else
  {
    if ((v6 != 0LL) != (v5 == 0LL))
    {
      unsigned __int8 v7 = -[RPNearbyInvitationDevice isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {

      v8 = v12;
    }

    if (dword_100131F70 <= 30)
    {
      if (dword_100131F70 != -1 || (int v10 = _LogCategory_Initialize(&dword_100131F70, 30LL), v8 = v12, v10))
      {
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:]",  30LL,  "BLE device accepted invitations: %@ -> %@\n",  self->_bleDeviceAcceptedInvitations,  v8);
        v8 = v12;
      }
    }

    v11 = v8;
    bleDeviceAcceptedInvitations = self->_bleDeviceAcceptedInvitations;
    self->_bleDeviceAcceptedInvitations = v11;
  }

  v8 = v12;
LABEL_13:
}

- (void)_clientEnsureStarted
{
  if (-[RPNearbyInvitationDaemon _clientProximityEstimatorShouldRun](self, "_clientProximityEstimatorShouldRun")) {
    -[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStarted](self, "_clientProximityEstimatorEnsureStarted");
  }
  else {
    -[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStopped](self, "_clientProximityEstimatorEnsureStopped");
  }
  if (-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryShouldRun]( self,  "_clientBLENearbyActionDiscoveryShouldRun"))
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStarted]( self,  "_clientBLENearbyActionDiscoveryEnsureStarted");
  }

  else
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStopped]( self,  "_clientBLENearbyActionDiscoveryEnsureStopped");
  }

  if (-[RPNearbyInvitationDaemon _clientBLEServerShouldRun](self, "_clientBLEServerShouldRun")) {
    -[RPNearbyInvitationDaemon _clientBLEServerEnsureStarted](self, "_clientBLEServerEnsureStarted");
  }
  else {
    -[RPNearbyInvitationDaemon _clientBLEServerEnsureStopped](self, "_clientBLEServerEnsureStopped");
  }
  if (-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserShouldRun]( self,  "_clientBLENearbyActionAdvertiserShouldRun"))
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStarted]( self,  "_clientBLENearbyActionAdvertiserEnsureStarted");
  }

  else
  {
    -[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStopped]( self,  "_clientBLENearbyActionAdvertiserEnsureStopped");
  }

- (void)_clientEnsureStopped
{
}

- (BOOL)_clientBLENearbyActionDiscoveryShouldRun
{
  unsigned int v3 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  if (v3) {
    LOBYTE(v3) = -[NSMutableSet count](self->_activatedDiscoverySet, "count") != 0LL;
  }
  return v3;
}

- (void)_clientBLENearbyActionDiscoveryEnsureStarted
{
  if (!self->_clientBLENearbyActionDiscovery)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStarted]",  30LL,  "BLE NearbyAction scanner start\n");
    }

    unsigned int v3 = (SFDeviceDiscovery *)objc_alloc_init(off_100131FE0());
    clientBLENearbyActionDiscovery = self->_clientBLENearbyActionDiscovery;
    self->_clientBLENearbyActionDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_clientBLENearbyActionDiscovery, "setChangeFlags:", 1LL);
    -[SFDeviceDiscovery setDispatchQueue:]( self->_clientBLENearbyActionDiscovery,  "setDispatchQueue:",  self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_clientBLENearbyActionDiscovery, "setPurpose:", @"RPNearbyInvitation");
    -[SFDeviceDiscovery setRssiThreshold:](self->_clientBLENearbyActionDiscovery, "setRssiThreshold:", -70LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_clientBLENearbyActionDiscovery, "setDiscoveryFlags:", 16LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100054120;
    v9[3] = &unk_100112DE8;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_clientBLENearbyActionDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005412C;
    v8[3] = &unk_100112DE8;
    v8[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_clientBLENearbyActionDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100054138;
    v7[3] = &unk_100112E10;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_clientBLENearbyActionDiscovery, "setDeviceChangedHandler:", v7);
    -[SFDeviceDiscovery setInterruptionHandler:]( self->_clientBLENearbyActionDiscovery,  "setInterruptionHandler:",  &stru_100112E30);
    v5 = self->_clientBLENearbyActionDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000541A4;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_clientBLENearbyActionDiscoveryEnsureStopped
{
  if (self->_clientBLENearbyActionDiscovery)
  {
    if (dword_100131F70 <= 50
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStopped]",  50LL,  "BLE NearbyAction discovery stop");
    }

    -[SFDeviceDiscovery invalidate](self->_clientBLENearbyActionDiscovery, "invalidate");
    clientBLENearbyActionDiscovery = self->_clientBLENearbyActionDiscovery;
    self->_clientBLENearbyActionDiscovery = 0LL;
  }

  discoveredDevices = self->_discoveredDevices;
  self->_discoveredDevices = 0LL;

  clientNearbyActionDiscoveryTimer = self->_clientNearbyActionDiscoveryTimer;
  if (clientNearbyActionDiscoveryTimer)
  {
    unsigned __int8 v7 = clientNearbyActionDiscoveryTimer;
    dispatch_source_cancel(v7);
    objc_super v6 = self->_clientNearbyActionDiscoveryTimer;
    self->_clientNearbyActionDiscoveryTimer = 0LL;
  }

- (void)_clientBLENearbyActionDiscoveryDeviceFound:(id)a3
{
  id v38 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v4 = [v38 deviceActionType] == 84;
  v5 = v38;
  if (v4)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    if (!v7)
    {
      if (dword_100131F70 <= 90
        && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 90LL)))
      {
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]",  90LL,  "### Ignoring BLE device found: no ID, %@\n",  v38);
      }

      goto LABEL_49;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([v38 bleDevice]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 advertisementFields]);
    CFTypeID TypeID = CFDataGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v9, @"tatag", TypeID, 0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (v12)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      v14 = (RPNearbyInvitationDevice *)objc_claimAutoreleasedReturnValue([v13 identityOfSelfAndReturnError:0]);

      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearbyInvitationDevice authTagForData:type:error:]( v14,  "authTagForData:type:error:",  v15,  2LL,  0LL));
      if (dword_100131F70 <= 30
        && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
      {
        id v17 = v38;
        if ((objc_opt_respondsToSelector(v17, "shortDescription") & 1) != 0)
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 shortDescription]);
        }

        else if ((objc_opt_respondsToSelector(v17, "descriptionWithLevel:") & 1) != 0)
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 descriptionWithLevel:50]);
        }

        else
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 description]);
        }

        BOOL v19 = (void *)v18;

        LogPrintF( &dword_100131F70, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]", 30, "Evaluating target AuthTag <%@> from device (%@) using BLE addr %.6a selfAuthTag <%@>\n", v12, v19, [v15 bytes], v16);
      }

      id v20 = v16;
      id v21 = [v20 bytes];
      id v22 = v12;
      if (memcmp(v21, [v22 bytes], (size_t)objc_msgSend(v22, "length")))
      {
        if (dword_100131F70 <= 30
          && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
        {
          LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]",  30LL,  "Ignoring BLE device as target AuthTag <%@> did not match hash <%@>\n",  v22,  v20);
        }

LABEL_48:
LABEL_49:

        v5 = v38;
        goto LABEL_50;
      }
    }

    v23 = (RPNearbyInvitationDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredDevices,  "objectForKeyedSubscript:",  v7));
    if (v23)
    {
      v14 = v23;
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDevice bleDevice](v23, "bleDevice"));
      unsigned int v25 = [v24 isBLEDeviceReplaced];

      if (v25
        && dword_100131F70 <= 30
        && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDevice bleDevice](v14, "bleDevice"));
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]",  30LL,  "Replaced BLE device %@ -> %@",  v26,  v38);
      }

      id v32 = -[RPNearbyInvitationDevice updateWithSFDevice:](v14, "updateWithSFDevice:", v38);
      if ((_DWORD)v32)
      {
        id v33 = v32;
        if (-[RPNearbyInvitationDevice inBubble](v14, "inBubble"))
        {
          if (dword_100131F70 <= 10
            && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 10LL)))
          {
            uint64_t v34 = CUDescriptionWithLevel(v38, 30LL);
            v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]",  10LL,  "BLE device changed: %@\n",  v35);
          }

          -[RPNearbyInvitationDaemon _clientReportChangedDevice:changes:]( self,  "_clientReportChangedDevice:changes:",  v14,  v33);
        }
      }

      if (dword_100131F70 <= 10
        && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 10LL)))
      {
        uint64_t v36 = CUDescriptionWithLevel(v14, 30LL);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]",  10LL,  "BLE device in cache: %@\n",  v37);
      }
    }

    else
    {
      if (dword_100131F70 <= 30
        && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
      {
        uint64_t v27 = CUDescriptionWithLevel(v38, 30LL);
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceFound:]",  30LL,  "BLE device found: %@\n",  v28);
      }

      v14 = objc_alloc_init(&OBJC_CLASS___RPNearbyInvitationDevice);
      -[RPNearbyInvitationDevice setIdentifier:](v14, "setIdentifier:", v7);
      -[RPNearbyInvitationDevice updateWithSFDevice:](v14, "updateWithSFDevice:", v38);
      discoveredDevices = self->_discoveredDevices;
      if (!discoveredDevices)
      {
        v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v31 = self->_discoveredDevices;
        self->_discoveredDevices = v30;

        discoveredDevices = self->_discoveredDevices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v14, v7);
      -[SFDeviceDiscovery setScanRate:](self->_clientBLENearbyActionDiscovery, "setScanRate:", 30LL);
      -[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryScanRateStartTimer]( self,  "_clientBLENearbyActionDiscoveryScanRateStartTimer");
      -[RPNearbyInvitationDaemon _clientBLENearbyActionDisableDupeFilter]( self,  "_clientBLENearbyActionDisableDupeFilter");
      -[RPNIProximityEstimator sendSampleForDevice:](self->_proximityEstimator, "sendSampleForDevice:", v38);
      -[RPNearbyInvitationDaemon _update](self, "_update");
    }

    goto LABEL_48;
  }

- (void)_clientBLENearbyActionDiscoveryDeviceLost:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredDevices,  "objectForKeyedSubscript:",  v5));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoveredDevices,  "setObject:forKeyedSubscript:",  0LL,  v5);
    if (!-[NSMutableDictionary count](self->_discoveredDevices, "count")) {
      -[RPNearbyInvitationDaemon _clientBLENearbyActionEnableDupeFilter](self, "_clientBLENearbyActionEnableDupeFilter");
    }
  }

  else if (dword_100131F70 <= 90 {
         && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 90LL)))
  }
  {
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryDeviceLost:]",  90LL,  "### Ignoring BLE device lost: no ID, %@\n",  v7);
  }
}

- (void)_clientBLENearbyActionDiscoveryScanRateStartTimer
{
  if (!self->_clientNearbyActionDiscoveryTimer)
  {
    unsigned int v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    clientNearbyActionDiscoveryTimer = self->_clientNearbyActionDiscoveryTimer;
    self->_clientNearbyActionDiscoveryTimer = v3;
    v5 = v3;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100054AF8;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(v5, 30.0, -1.0, 1.0);
    dispatch_activate(v5);
  }

- (void)_clientBLENearbyActionDisableDupeFilter
{
  if ((-[SFDeviceDiscovery changeFlags](self->_clientBLENearbyActionDiscovery, "changeFlags") & 4) == 0)
  {
    if (dword_100131F70 <= 50
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionDisableDupeFilter]",  50LL,  "Disabling dupe filter to measure RSSI");
    }

    -[SFDeviceDiscovery setChangeFlags:]( self->_clientBLENearbyActionDiscovery,  "setChangeFlags:",  -[SFDeviceDiscovery changeFlags](self->_clientBLENearbyActionDiscovery, "changeFlags") | 4);
  }

  clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
  if (clientDisabledDupeFilterTimer)
  {
    BOOL v4 = clientDisabledDupeFilterTimer;
    dispatch_source_cancel(v4);
    v5 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0LL;

    objc_super v6 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0LL;
  }

  id v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  v8 = self->_clientDisabledDupeFilterTimer;
  self->_clientDisabledDupeFilterTimer = v7;
  BOOL v9 = v7;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100054D00;
  handler[3] = &unk_1001110A8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet(v9, 300.0, -1.0, 1.0);
  dispatch_activate(v9);
}

- (void)_clientBLENearbyActionEnableDupeFilter
{
  if (self->_clientBLENearbyActionDiscovery)
  {
    if (dword_100131F70 <= 50
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionEnableDupeFilter]",  50LL,  "Enabling dupe filter");
    }

    clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
    if (clientDisabledDupeFilterTimer)
    {
      BOOL v4 = clientDisabledDupeFilterTimer;
      dispatch_source_cancel(v4);
      v5 = self->_clientDisabledDupeFilterTimer;
      self->_clientDisabledDupeFilterTimer = 0LL;
    }

    -[SFDeviceDiscovery setChangeFlags:]( self->_clientBLENearbyActionDiscovery,  "setChangeFlags:",  (unint64_t)-[SFDeviceDiscovery changeFlags](self->_clientBLENearbyActionDiscovery, "changeFlags") & 0xFFFFFFFB);
  }

- (id)_idleSessionConnection
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v2 = self->_xpcConnections;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activatedSession", (void)v13));
        if (v7)
        {
          v8 = (void *)v7;
          BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 activatedSession]);
          if ([v9 waitingToConnect])
          {
            int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 activatedSession]);
            unsigned __int8 v11 = [v10 failedToConnect];

            if ((v11 & 1) == 0)
            {
              id v3 = v6;
              goto LABEL_13;
            }
          }

          else
          {
          }
        }
      }

      id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v3);
  }

- (BOOL)_clientBLENearbyActionAdvertiserShouldRun
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon _idleSessionConnection](self, "_idleSessionConnection"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activatedSession]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (void)_clientBLENearbyActionAdvertiserEnsureStarted
{
  if (!self->_clientBLENearbyActionAdvertiser)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStarted]",  30LL,  "BLE NearbyAction advertiser start\n");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon _idleSessionConnection](self, "_idleSessionConnection"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activatedSession]);

    BOOL v5 = (SFService *)objc_alloc_init(off_100131FE8());
    clientBLENearbyActionAdvertiser = self->_clientBLENearbyActionAdvertiser;
    self->_clientBLENearbyActionAdvertiser = v5;

    -[SFService setDeviceActionType:](self->_clientBLENearbyActionAdvertiser, "setDeviceActionType:", 56LL);
    -[SFService setDispatchQueue:](self->_clientBLENearbyActionAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    id v7 = off_100131FF0();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SFService setIdentifier:](self->_clientBLENearbyActionAdvertiser, "setIdentifier:", v8);

    -[SFService setLabel:](self->_clientBLENearbyActionAdvertiser, "setLabel:", @"RPNearbyInvitation");
    -[SFService setPairSetupDisabled:](self->_clientBLENearbyActionAdvertiser, "setPairSetupDisabled:", 1LL);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 daemonDevice]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bleTargetData]);
    -[SFService setTargetAuthTag:](self->_clientBLENearbyActionAdvertiser, "setTargetAuthTag:", v10);

    -[SFService setAdvertiseRate:](self->_clientBLENearbyActionAdvertiser, "setAdvertiseRate:", 50LL);
    unsigned __int8 v11 = self->_clientBLENearbyActionAdvertiser;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10005512C;
    v13[3] = &unk_100112230;
    v13[4] = self;
    id v14 = v4;
    id v12 = v4;
    -[SFService activateWithCompletion:](v11, "activateWithCompletion:", v13);
  }

- (void)_clientBLENearbyActionAdvertiserEnsureStopped
{
  if (self->_clientBLENearbyActionAdvertiser)
  {
    if (dword_100131F70 <= 50
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStopped]",  50LL,  "BLE NearbyAction advertiser stop");
    }

    -[SFService invalidate](self->_clientBLENearbyActionAdvertiser, "invalidate");
    clientBLENearbyActionAdvertiser = self->_clientBLENearbyActionAdvertiser;
    self->_clientBLENearbyActionAdvertiser = 0LL;
  }

  clientNearbyActionAdvertiserTimer = self->_clientNearbyActionAdvertiserTimer;
  if (clientNearbyActionAdvertiserTimer)
  {
    objc_super v6 = clientNearbyActionAdvertiserTimer;
    dispatch_source_cancel(v6);
    BOOL v5 = self->_clientNearbyActionAdvertiserTimer;
    self->_clientNearbyActionAdvertiserTimer = 0LL;
  }

- (void)_clientBLENearbyActionAdvertiserStartTimer
{
  if (!self->_clientNearbyActionAdvertiserTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    clientNearbyActionAdvertiserTimer = self->_clientNearbyActionAdvertiserTimer;
    self->_clientNearbyActionAdvertiserTimer = v3;
    BOOL v5 = v3;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000553D4;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet(v5, 15.0, -1.0, 1.0);
    dispatch_activate(v5);
  }

- (BOOL)_clientProximityEstimatorShouldRun
{
  return -[NSMutableSet count](self->_activatedDiscoverySet, "count") != 0LL;
}

- (void)_clientProximityEstimatorEnsureStarted
{
  if (!self->_proximityEstimator)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStarted]",  30LL,  "Proximity estimator start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___RPNIProximityEstimator);
    proximityEstimator = self->_proximityEstimator;
    self->_proximityEstimator = v3;

    -[RPNIProximityEstimator setInnerPresencePreset:](self->_proximityEstimator, "setInnerPresencePreset:", 6LL);
    -[RPNIProximityEstimator setInnerRegionName:]( self->_proximityEstimator,  "setInnerRegionName:",  @"nearbyInvitation-inner");
    -[RPNIProximityEstimator setOuterRegionName:]( self->_proximityEstimator,  "setOuterRegionName:",  @"nearbyInvitation-outer");
    -[RPNIProximityEstimator setDispatchQueue:](self->_proximityEstimator, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10005566C;
    v7[3] = &unk_100112E58;
    v7[4] = self;
    -[RPNIProximityEstimator setDeviceRegionChangedHandler:]( self->_proximityEstimator,  "setDeviceRegionChangedHandler:",  v7);
    BOOL v5 = self->_proximityEstimator;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000557A0;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[RPNIProximityEstimator activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_clientProximityEstimatorEnsureStopped
{
  if (self->_proximityEstimator)
  {
    if (dword_100131F70 <= 50
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStopped]",  50LL,  "Proximity estimator stop");
    }

    -[RPNIProximityEstimator invalidate](self->_proximityEstimator, "invalidate");
    proximityEstimator = self->_proximityEstimator;
    self->_proximityEstimator = 0LL;
  }

  clientDisabledDupeFilterTimer = self->_clientDisabledDupeFilterTimer;
  if (clientDisabledDupeFilterTimer)
  {
    objc_super v6 = clientDisabledDupeFilterTimer;
    dispatch_source_cancel(v6);
    BOOL v5 = self->_clientDisabledDupeFilterTimer;
    self->_clientDisabledDupeFilterTimer = 0LL;
  }

- (void)_clientReportFoundDevice:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "reportFoundDevice:outReason:",  v4,  0,  (void)v10);
        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)_clientReportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = self->_xpcConnections;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "reportChangedDevice:changes:",  v6,  v4,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }
}

- (void)_clientReportLostDevice:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "reportLostDevice:", v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (id)_findMatchingDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 compareWithDeviceIdentifier:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)_clientBLEServerShouldRun
{
  if (self->_prefClientEnabled && self->_prefGuestClientEnabled)
  {
    id v3 = -[NSMutableDictionary count](self->_discoveredDevices, "count");
    if (v3) {
      LOBYTE(v3) = -[NSMutableSet count](self->_activatedSessionSet, "count") != 0LL;
    }
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return (char)v3;
}

- (void)_clientBLEServerEnsureStarted
{
  if (!self->_bleServer)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLEServerEnsureStarted]",  30LL,  "BLE server start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUBLEServer);
    bleServer = self->_bleServer;
    self->_bleServer = v3;

    -[CUBLEServer setDispatchQueue:](self->_bleServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBLEServer setLabel:](self->_bleServer, "setLabel:", @"RPNearbyInvitation");
    -[CUBLEServer setListenPSM:](self->_bleServer, "setListenPSM:", CBAssignedL2CAPPSMForNearbyInvitation);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100055F04;
    v7[3] = &unk_100111BC0;
    v7[4] = self;
    -[CUBLEServer setConnectionStartedHandler:](self->_bleServer, "setConnectionStartedHandler:", v7);
    BOOL v5 = self->_bleServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100055F10;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[CUBLEServer activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_clientBLEServerHandleConnectionStarted:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  -[RPConnection setBleConnection:](v5, "setBleConnection:", v4);
  -[RPConnection setControlFlags:](v5, "setControlFlags:", 1536LL);
  -[RPConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v5, "setIdentityDaemon:", v6);

  uint64_t v7 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v8 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v8;
  id v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"NICnx-%u", v8);
  -[RPConnection setLabel:](v5, "setLabel:", v9);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localDeviceInfo]);
  -[RPConnection setLocalDeviceInfo:](v5, "setLocalDeviceInfo:", v11);

  -[RPConnection setPasswordType:](v5, "setPasswordType:", 0LL);
  -[RPConnection setPresent:](v5, "setPresent:", 1LL);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v12 = self->_xpcConnections;
  id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activatedSession]);

        if (v18)
        {
          -[RPConnection setClient:](v5, "setClient:", v17);
          goto LABEL_11;
        }
      }

      id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

- (void)_clientBLEServerHandleConnectionEnded:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setClient:0];
    -[NSMutableSet removeObject:](self->_bleServerConnections, "removeObject:", v4);
  }

- (void)_clientBLEServerHandleConnectionStateChange:(int)a3 cnx:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v8 = v6;
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLEServerHandleConnectionStateChange:cnx:]",  30LL,  "Nearby invitation BLE connection setup complete: %@\n",  v8);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon _idleSessionConnection](self, "_idleSessionConnection"));
    [v7 sessionActivatedWithError:0];
    [v7 setNetCnx:v8];
    -[RPNearbyInvitationDaemon _update](self, "_update");

    id v6 = v8;
  }
}

- (void)_clientBLEServerEnsureStopped
{
  if (self->_bleServer)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _clientBLEServerEnsureStopped]",  30LL,  "BLE server stop\n");
    }

    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v3 = self->_bleServerConnections;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)i), "invalidate", (void)v10);
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_bleServerConnections, "removeAllObjects");
    bleServerConnections = self->_bleServerConnections;
    self->_bleServerConnections = 0LL;

    -[CUBLEServer invalidate](self->_bleServer, "invalidate");
    bleServer = self->_bleServer;
    self->_bleServer = 0LL;
  }

- (void)_serverEnsureStarted
{
  if (-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryShouldRun]( self,  "_serverBLENearbyInfoDiscoveryShouldRun"))
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStarted]( self,  "_serverBLENearbyInfoDiscoveryEnsureStarted");
  }

  else
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStopped]( self,  "_serverBLENearbyInfoDiscoveryEnsureStopped");
  }

  if (-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryShouldRun]( self,  "_serverBLENearbyActionDiscoveryShouldRun"))
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted]( self,  "_serverBLENearbyActionDiscoveryEnsureStarted");
  }

  else
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStopped]( self,  "_serverBLENearbyActionDiscoveryEnsureStopped");
  }

  if (-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserShouldRun]( self,  "_serverBLENearbyActionAdvertiserShouldRun"))
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]( self,  "_serverBLENearbyActionAdvertiserEnsureStarted");
  }

  else
  {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStopped]( self,  "_serverBLENearbyActionAdvertiserEnsureStopped");
  }

  if (-[RPNearbyInvitationDaemon _serverBLEClientConnectionShouldStart](self, "_serverBLEClientConnectionShouldStart")) {
    -[RPNearbyInvitationDaemon _serverBLEClientConnectionEnsureStarted](self, "_serverBLEClientConnectionEnsureStarted");
  }
}

- (void)_serverEnsureStopped
{
}

- (BOOL)_serverBLENearbyInfoDiscoveryShouldRun
{
  return -[NSMutableDictionary count](self->_activatedServerXPCCnxMap, "count") != 0LL;
}

- (void)_serverBLENearbyInfoDiscoveryEnsureStarted
{
  if (!self->_bleNearbyInfoDiscovery)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStarted]",  30LL,  "BLE NearbyInfo scanner start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    bleNearbyInfoDiscovery = self->_bleNearbyInfoDiscovery;
    self->_bleNearbyInfoDiscovery = v3;

    -[RPCompanionLinkClient setDispatchQueue:](self->_bleNearbyInfoDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[RPCompanionLinkClient setEncodeSensitiveProperties:]( self->_bleNearbyInfoDiscovery,  "setEncodeSensitiveProperties:",  1LL);
    -[RPCompanionLinkClient setControlFlags:](self->_bleNearbyInfoDiscovery, "setControlFlags:", 0x200000002LL);
    if (self->_prefGuestServerEnabled)
    {
      -[RPCompanionLinkClient setControlFlags:]( self->_bleNearbyInfoDiscovery,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](self->_bleNearbyInfoDiscovery, "controlFlags") | 0x400);
      -[RPCompanionLinkClient setFlags:](self->_bleNearbyInfoDiscovery, "setFlags:", 1LL);
    }

    if (!self->_prefServerRSSIDisabled) {
      -[RPCompanionLinkClient setRssiThreshold:](self->_bleNearbyInfoDiscovery, "setRssiThreshold:", -57LL);
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100056B84;
    v9[3] = &unk_100112EA0;
    v9[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_bleNearbyInfoDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100056B90;
    v8[3] = &unk_100112EA0;
    v8[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_bleNearbyInfoDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100056B9C;
    v7[3] = &unk_100112EC8;
    v7[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_bleNearbyInfoDiscovery, "setDeviceChangedHandler:", v7);
    id v5 = self->_bleNearbyInfoDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100056BA8;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serverBLENearbyInfoDiscoveryEnsureStopped
{
  if (self->_bleNearbyInfoDiscovery)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStopped]",  30LL,  "BLE NearbyInfo scanner stop\n");
    }

    -[RPCompanionLinkClient invalidate](self->_bleNearbyInfoDiscovery, "invalidate");
    bleNearbyInfoDiscovery = self->_bleNearbyInfoDiscovery;
    self->_bleNearbyInfoDiscovery = 0LL;
  }

  devicesWantingInvitations = self->_devicesWantingInvitations;
  self->_devicesWantingInvitations = 0LL;

  -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", 0LL);
}

- (void)_serverBLENearbyInfoDiscoveryDeviceFound:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_devicesWantingInvitations;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) isEqualToDevice:v4])
        {

          if (dword_100131F70 <= 10
            && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 10LL)))
          {
            LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryDeviceFound:]",  10LL,  "BLE NearbyInfo device exists: %@\n",  v4);
          }

          goto LABEL_24;
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_100131F70 <= 30 && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryDeviceFound:]",  30LL,  "BLE NearbyInfo scanner found device: %@ %@\n",  v4,  v10,  (void)v15);
  }

  devicesWantingInvitations = self->_devicesWantingInvitations;
  if (!devicesWantingInvitations)
  {
    __int128 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v13 = self->_devicesWantingInvitations;
    self->_devicesWantingInvitations = v12;

    devicesWantingInvitations = self->_devicesWantingInvitations;
  }

  -[NSMutableSet addObject:](devicesWantingInvitations, "addObject:", v4);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceWantingInvitations](self, "bleDeviceWantingInvitations"));

  if (!v14) {
    -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", v4);
  }
  -[RPNearbyInvitationDaemon _update](self, "_update");
  if ((unint64_t)-[NSMutableSet count](self->_devicesWantingInvitations, "count") >= 2) {
    -[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserRestartTimer]( self,  "_serverBLENearbyActionAdvertiserRestartTimer");
  }
LABEL_24:
}

- (void)_serverBLENearbyInfoDiscoveryDeviceLost:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_devicesWantingInvitations;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      __int128 v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    __int128 v11 = v10;

    if (!v11) {
      goto LABEL_17;
    }
    if (dword_100131F70 <= 50
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryDeviceLost:]",  50LL,  "BLE NearbyInfo scanner lost device wanting invitations: %@\n",  v4);
    }

    -[NSMutableSet removeObject:](self->_devicesWantingInvitations, "removeObject:", v11);
    -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", 0LL);
    -[RPNearbyInvitationDaemon _update](self, "_update");
  }

  else
  {
LABEL_9:
    __int128 v11 = v5;
  }

LABEL_17:
}

- (BOOL)_serverBLENearbyActionDiscoveryShouldRun
{
  return -[NSMutableSet count](self->_devicesWantingInvitations, "count") != 0LL;
}

- (void)_serverBLENearbyActionDiscoveryEnsureStarted
{
  if (!self->_bleNearbyActionDiscovery)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted]",  30LL,  "BLE NearbyAction scanner start\n");
    }

    id v3 = (SFDeviceDiscovery *)objc_alloc_init(off_100131FE0());
    bleNearbyActionDiscovery = self->_bleNearbyActionDiscovery;
    self->_bleNearbyActionDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleNearbyActionDiscovery, "setChangeFlags:", 1LL);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleNearbyActionDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_bleNearbyActionDiscovery, "setPurpose:", @"RPNearbyInvitation");
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleNearbyActionDiscovery, "setRssiThreshold:", -60LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleNearbyActionDiscovery, "setDiscoveryFlags:", 16LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000572EC;
    v8[3] = &unk_100112DE8;
    v8[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleNearbyActionDiscovery, "setDeviceFoundHandler:", v8);
    -[SFDeviceDiscovery setDeviceLostHandler:]( self->_bleNearbyActionDiscovery,  "setDeviceLostHandler:",  &stru_100112F08);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100057378;
    v7[3] = &unk_100112E10;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleNearbyActionDiscovery, "setDeviceChangedHandler:", v7);
    -[SFDeviceDiscovery setInterruptionHandler:]( self->_bleNearbyActionDiscovery,  "setInterruptionHandler:",  &stru_100112F28);
    id v5 = self->_bleNearbyActionDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000573E4;
    v6[3] = &unk_1001118A0;
    v6[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serverBLENearbyActionDiscoveryEnsureStopped
{
  bleNearbyActionDiscovery = self->_bleNearbyActionDiscovery;
  self->_bleNearbyActionDiscovery = 0LL;
}

- (void)_serverBLENearbyActionDiscoveryDeviceFound:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v10 deviceActionType] == 56)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

    if (v5)
    {
      bleDeviceAcceptedInvitations = self->_bleDeviceAcceptedInvitations;
      if (bleDeviceAcceptedInvitations
        && (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDevice identifier](bleDeviceAcceptedInvitations, "identifier")),
            unsigned __int8 v8 = [v5 isEqualToString:v7],
            v7,
            (v8 & 1) == 0))
      {
        if (dword_100131F70 <= 30
          && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
        {
          LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]",  30LL,  "Ignoring new BLE device (%@) that accepted invitation while accepting from existing device (%@)\n",  v10,  self->_bleDeviceAcceptedInvitations);
        }
      }

      else
      {
        if (dword_100131F70 <= 30
          && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
        {
          LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]",  30LL,  "BLE NearbyAction found device: %@\n",  v10);
        }

        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___RPNearbyInvitationDevice);
        -[RPNearbyInvitationDevice setIdentifier:](v9, "setIdentifier:", v5);
        -[RPNearbyInvitationDevice updateWithSFDevice:](v9, "updateWithSFDevice:", v10);
        -[RPNearbyInvitationDaemon setBleDeviceWantingInvitations:](self, "setBleDeviceWantingInvitations:", 0LL);
        -[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:](self, "setBleDeviceAcceptedInvitations:", v9);
        -[RPNearbyInvitationDaemon _update](self, "_update");
      }
    }

    else if (dword_100131F70 <= 30 {
           && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    }
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]",  30LL,  "Ignoring device without an identifier: %@\n",  v10);
    }
  }

  else if (dword_100131F70 <= 10 {
         && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 10LL)))
  }
  {
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryDeviceFound:]",  10LL,  "### Ignoring BLE device with wrong action type: %@\n",  v10);
  }
}

- (BOOL)_serverBLENearbyActionAdvertiserShouldRun
{
  return -[NSMutableSet count](self->_devicesWantingInvitations, "count") != 0LL;
}

- (void)_serverBLENearbyActionAdvertiserEnsureStarted
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceWantingInvitations](self, "bleDeviceWantingInvitations"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 bleTargetData]);
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (bleNearbyActionAdvertiser)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SFService targetAuthTag](bleNearbyActionAdvertiser, "targetAuthTag"));
    if ((unint64_t)-[NSMutableSet count](self->_devicesWantingInvitations, "count") >= 2)
    {

      id v4 = 0LL;
    }

    if (v6 != v4)
    {
      if (dword_100131F70 <= 30
        && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
      {
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]",  30LL,  "BLE NearbyAction advertiser updating target %@ -> %@ \n",  v6,  v4);
      }

      -[SFService setTargetAuthTag:](self->_bleNearbyActionAdvertiser, "setTargetAuthTag:", v4);
    }
  }

  else
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]",  30LL,  "BLE NearbyAction advertiser start\n");
    }

    id v7 = (SFService *)objc_alloc_init(off_100131FE8());
    unsigned __int8 v8 = self->_bleNearbyActionAdvertiser;
    self->_bleNearbyActionAdvertiser = v7;

    -[SFService setDeviceActionType:](self->_bleNearbyActionAdvertiser, "setDeviceActionType:", 84LL);
    -[SFService setDispatchQueue:](self->_bleNearbyActionAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    id v9 = off_100131FF8();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SFService setIdentifier:](self->_bleNearbyActionAdvertiser, "setIdentifier:", v10);

    -[SFService setLabel:](self->_bleNearbyActionAdvertiser, "setLabel:", @"RPNearbyInvitation");
    -[SFService setPairSetupDisabled:](self->_bleNearbyActionAdvertiser, "setPairSetupDisabled:", 1LL);
    -[SFService setAdvertiseRate:](self->_bleNearbyActionAdvertiser, "setAdvertiseRate:", 50LL);
    id v11 = -[NSMutableSet count](self->_devicesWantingInvitations, "count");
    if (v11 == (id)1) {
      -[SFService setTargetAuthTag:](self->_bleNearbyActionAdvertiser, "setTargetAuthTag:", v4);
    }
    BOOL v12 = v11 == (id)1;
    __int128 v13 = self->_bleNearbyActionAdvertiser;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000579DC;
    v14[3] = &unk_100112F50;
    v14[4] = self;
    BOOL v17 = v12;
    id v15 = v3;
    id v4 = v4;
    id v16 = v4;
    -[SFService activateWithCompletion:](v13, "activateWithCompletion:", v14);
  }
}

- (void)_serverBLENearbyActionAdvertiserEnsureStopped
{
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0LL;

  serverNearbyActionAdvertiserTimer = self->_serverNearbyActionAdvertiserTimer;
  if (serverNearbyActionAdvertiserTimer)
  {
    id v6 = serverNearbyActionAdvertiserTimer;
    dispatch_source_cancel(v6);
    id v5 = self->_serverNearbyActionAdvertiserTimer;
    self->_serverNearbyActionAdvertiserTimer = 0LL;
  }

- (void)_serverBLENearbyActionAdvertiserRestartTimer
{
  if (self->_bleNearbyActionAdvertiser)
  {
    serverNearbyActionAdvertiserTimer = self->_serverNearbyActionAdvertiserTimer;
    if (serverNearbyActionAdvertiserTimer)
    {
      id v4 = serverNearbyActionAdvertiserTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_serverNearbyActionAdvertiserTimer;
      self->_serverNearbyActionAdvertiserTimer = 0LL;

      if (dword_100131F70 <= 50
        && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
      {
        LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserRestartTimer]",  50LL,  "Restarting HasInvitation advertiser timer\n");
      }
    }

    else if (dword_100131F70 <= 50 {
           && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 50LL)))
    }
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserRestartTimer]",  50LL,  "Starting HasInvitation advertiser timer\n");
    }

    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    id v7 = self->_serverNearbyActionAdvertiserTimer;
    self->_serverNearbyActionAdvertiserTimer = v6;
    unsigned __int8 v8 = v6;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100057D08;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    CUDispatchTimerSet(v8, 45.0, -1.0, 1.0);
    dispatch_activate(v8);
  }

- (BOOL)_serverBLEClientConnectionShouldStart
{
  BOOL result = 0;
  if (self->_prefServerEnabled && self->_prefGuestServerEnabled)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceAcceptedInvitations](self, "bleDeviceAcceptedInvitations"));
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = -[NSMutableDictionary count](self->_bleClientConnections, "count");

      if (!v5) {
        return 1;
      }
    }
  }

  return result;
}

- (void)_serverBLEClientConnectionEnsureStarted
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  ++self->_sessionIDLast;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationDaemon bleDeviceAcceptedInvitations](self, "bleDeviceAcceptedInvitations"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bleDevice]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  -[RPConnection setBlePeerIdentifier:](v3, "setBlePeerIdentifier:", v7);
  -[RPConnection setBleClientUseCase:](v3, "setBleClientUseCase:", 131091LL);
  -[RPConnection setControlFlags:]( v3,  "setControlFlags:",  (unint64_t)-[RPConnection controlFlags](v3, "controlFlags") | 0x600);
  -[RPConnection setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
  unsigned __int8 v8 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  id v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"NICnx-%u", v9);
  -[RPConnection setLabel:](v3, "setLabel:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localDeviceInfo]);
  -[RPConnection setLocalDeviceInfo:](v3, "setLocalDeviceInfo:", v12);

  -[RPConnection setPasswordType:](v3, "setPasswordType:", 0LL);
  -[RPConnection setPresent:](v3, "setPresent:", 1LL);
  -[RPConnection setBleConnectionPSM:](v3, "setBleConnectionPSM:", CBAssignedL2CAPPSMForNearbyInvitation);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v13 = self->_xpcConnections;
  id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        __int128 v18 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activatedServer]);

        if (v19)
        {
          -[RPConnection setClient:](v3, "setClient:", v18);
          goto LABEL_11;
        }
      }

      id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
      if (v15) {
        continue;
      }
      break;
    }
  }

- (void)_bleClientConnectionEnded:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 blePeerIdentifier]);
  bleClientConnections = self->_bleClientConnections;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](bleClientConnections, "setObject:forKeyedSubscript:", 0LL, v5);

  -[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:](self, "setBleDeviceAcceptedInvitations:", 0LL);
}

- (void)_bleClientConnectionStateChanged:(int)a3 cnx:(id)a4 sessionID:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 client]);
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 activatedServer]);

    if (v11)
    {
      -[RPNearbyInvitationDaemon setBleDeviceAcceptedInvitations:](self, "setBleDeviceAcceptedInvitations:", 0LL);
      if (a3 == 1) {
        [v10 sessionStartWithID:v8 netCnx:v12 completion:&stru_100112FE0];
      }
      else {
        [v10 sessionEndedWithID:v8 netCnx:v12];
      }
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = -[RPNearbyInvitationXPCConnection initWithDaemon:xpcCnx:]( objc_alloc(&OBJC_CLASS___RPNearbyInvitationXPCConnection),  "initWithDaemon:xpcCnx:",  self,  v5);
  -[RPNearbyInvitationXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  ++self->_xpcLastID;
  -[RPNearbyInvitationXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  [v5 _setQueue:self->_dispatchQueue];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface));
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100058828;
  v14[3] = &unk_100111968;
  v14[4] = self;
  id v11 = v6;
  id v15 = v11;
  [v5 setInvalidationHandler:v14];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPNearbyInvitationXPCClientInterface));
  [v5 setRemoteObjectInterface:v12];

  [v5 resume];
  if (dword_100131F70 <= 20 && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 20LL))) {
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started from %#{pid}\n",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    [v4 connectionInvalidated];
    -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v4);
    -[RPNearbyInvitationDaemon _update](self, "_update");
  }
}

- (void)_update
{
  if (!self->_systemMonitor)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100058978;
    v5[3] = &unk_1001110A8;
    v5[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v5);
    -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", 0LL);
  }

  if (self->_prefClientEnabled || self->_prefGuestClientEnabled) {
    -[RPNearbyInvitationDaemon _clientEnsureStarted](self, "_clientEnsureStarted");
  }
  else {
    -[RPNearbyInvitationDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
  }
  if (self->_prefServerEnabled || self->_prefGuestServerEnabled) {
    -[RPNearbyInvitationDaemon _serverEnsureStarted](self, "_serverEnsureStarted");
  }
  else {
    -[RPNearbyInvitationDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
  }
}

- (void)_handleServerActivation:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 activatedServer]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);

  if (v5)
  {
    activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
    if (!activatedServerXPCCnxMap)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v8 = self->_activatedServerXPCCnxMap;
      self->_activatedServerXPCCnxMap = v7;

      activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( activatedServerXPCCnxMap,  "setObject:forKeyedSubscript:",  v9,  v5);
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 xpcCnx:(id)a6 sessionID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058B28;
  block[3] = &unk_100113008;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async(dispatchQueue, block);
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 xpcCnx:(id)a7 sessionID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100058D98;
  v27[3] = &unk_100113030;
  id v28 = v18;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v19;
  id v33 = v17;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v18;
  dispatch_async(dispatchQueue, v27);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFService)bleNearbyActionAdvertiser
{
  return self->_bleNearbyActionAdvertiser;
}

- (void)setBleNearbyActionAdvertiser:(id)a3
{
}

- (SFService)clientBLENearbyActionAdvertiser
{
  return self->_clientBLENearbyActionAdvertiser;
}

- (void)setClientBLENearbyActionAdvertiser:(id)a3
{
}

- (SFDeviceDiscovery)bleNearbyActionDiscovery
{
  return self->_bleNearbyActionDiscovery;
}

- (void)setBleNearbyActionDiscovery:(id)a3
{
}

- (SFDeviceDiscovery)clientBLENearbyActionDiscovery
{
  return self->_clientBLENearbyActionDiscovery;
}

- (void)setClientBLENearbyActionDiscovery:(id)a3
{
}

- (unsigned)cnxIDLast
{
  return self->_cnxIDLast;
}

- (void)setCnxIDLast:(unsigned int)a3
{
  self->_cnxIDLast = a3;
}

- (RPCompanionLinkClient)bleNearbyInfoDiscovery
{
  return self->_bleNearbyInfoDiscovery;
}

- (void)setBleNearbyInfoDiscovery:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (NSMutableSet)devicesWantingInvitations
{
  return self->_devicesWantingInvitations;
}

- (void)setDevicesWantingInvitations:(id)a3
{
}

- (RPCompanionLinkDevice)bleDeviceWantingInvitations
{
  return self->_bleDeviceWantingInvitations;
}

- (RPNearbyInvitationDevice)bleDeviceAcceptedInvitations
{
  return self->_bleDeviceAcceptedInvitations;
}

- (CUBLEServer)bleServer
{
  return self->_bleServer;
}

- (void)setBleServer:(id)a3
{
}

- (NSMutableSet)bleServerConnections
{
  return self->_bleServerConnections;
}

- (void)setBleServerConnections:(id)a3
{
}

- (NSMutableDictionary)bleClientConnections
{
  return self->_bleClientConnections;
}

- (void)setBleClientConnections:(id)a3
{
}

- (RPNIProximityEstimator)proximityEstimator
{
  return self->_proximityEstimator;
}

- (void)setProximityEstimator:(id)a3
{
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (BOOL)invalidateDone
{
  return self->_invalidateDone;
}

- (void)setInvalidateDone:(BOOL)a3
{
  self->_invalidateDone = a3;
}

- (BOOL)prefClientEnabled
{
  return self->_prefClientEnabled;
}

- (void)setPrefClientEnabled:(BOOL)a3
{
  self->_prefClientEnabled = a3;
}

- (BOOL)prefGuestServerEnabled
{
  return self->_prefGuestServerEnabled;
}

- (void)setPrefGuestServerEnabled:(BOOL)a3
{
  self->_prefGuestServerEnabled = a3;
}

- (BOOL)prefGuestClientEnabled
{
  return self->_prefGuestClientEnabled;
}

- (void)setPrefGuestClientEnabled:(BOOL)a3
{
  self->_prefGuestClientEnabled = a3;
}

- (BOOL)prefServerEnabled
{
  return self->_prefServerEnabled;
}

- (void)setPrefServerEnabled:(BOOL)a3
{
  self->_prefServerEnabled = a3;
}

- (BOOL)prefServerRSSIDisabled
{
  return self->_prefServerRSSIDisabled;
}

- (void)setPrefServerRSSIDisabled:(BOOL)a3
{
  self->_prefServerRSSIDisabled = a3;
}

- (OS_dispatch_source)clientNearbyActionDiscoveryTimer
{
  return self->_clientNearbyActionDiscoveryTimer;
}

- (void)setClientNearbyActionDiscoveryTimer:(id)a3
{
}

- (OS_dispatch_source)serverNearbyActionAdvertiserTimer
{
  return self->_serverNearbyActionAdvertiserTimer;
}

- (void)setServerNearbyActionAdvertiserTimer:(id)a3
{
}

- (OS_dispatch_source)clientNearbyActionAdvertiserTimer
{
  return self->_clientNearbyActionAdvertiserTimer;
}

- (void)setClientNearbyActionAdvertiserTimer:(id)a3
{
}

- (OS_dispatch_source)clientDisabledDupeFilterTimer
{
  return self->_clientDisabledDupeFilterTimer;
}

- (void)setClientDisabledDupeFilterTimer:(id)a3
{
}

- (unsigned)sessionIDLast
{
  return self->_sessionIDLast;
}

- (void)setSessionIDLast:(unsigned int)a3
{
  self->_sessionIDLast = a3;
}

- (void).cxx_destruct
{
}

@end