@interface SDXPCConnection
- (SDXPCConnection)initWithServer:(id)a3 xpcConnection:(id)a4;
- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5;
- (int)_entitledService:(id)a3 state:(BOOL *)a4;
- (void)_getInteractionsFromDBPerPeopleSuggestion:(id)a3 completion:(id)a4;
- (void)_getPeopleInfo:(id)a3 completion:(id)a4;
- (void)_getPeopleSuggestions:(id)a3 completion:(id)a4;
- (void)_invalidateAssertions;
- (void)accountForAppleID:(id)a3 withCompletion:(id)a4;
- (void)activateAssertionWithIdentifier:(id)a3;
- (void)activityStateWithCompletion:(id)a3;
- (void)appleIDInfoWithCompletion:(id)a3;
- (void)autoFillHelperActivate:(id)a3 completion:(id)a4;
- (void)autoFillHelperDidPickUsername:(id)a3 password:(id)a4 error:(id)a5;
- (void)autoFillHelperTryPIN:(id)a3;
- (void)autoFillHelperUserNotificationDidActivate:(id)a3;
- (void)autoFillHelperUserNotificationDidDismiss:(id)a3;
- (void)bluetoothUserInteraction;
- (void)clearXPCHelperImageCacheWithCompletion:(id)a3;
- (void)connectionInvalidated;
- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5;
- (void)coordinatedAlertsRequestCancel;
- (void)coordinatedAlertsRequestFinish;
- (void)coordinatedAlertsRequestStart:(id)a3 completion:(id)a4;
- (void)deviceDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)deviceDiscoveryFastScanCancel:(id)a3;
- (void)deviceDiscoveryFastScanTrigger:(id)a3;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3;
- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5;
- (void)deviceDiscoveryUpdate:(id)a3;
- (void)diagnosticBLEModeWithCompletion:(id)a3;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticLogControl:(id)a3 completion:(id)a4;
- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5;
- (void)diagnosticMockStart:(id)a3;
- (void)diagnosticMockStop:(id)a3;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)diagnosticUnlockTestClientWithDevice:(id)a3;
- (void)diagnosticUnlockTestServer;
- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5;
- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5;
- (void)getDeviceAssets:(id)a3 completion:(id)a4;
- (void)getPeopleSuggestions:(id)a3 completion:(id)a4;
- (void)getProblemFlagsWithCompletionHandler:(id)a3;
- (void)hashManagerControl:(id)a3 completion:(id)a4;
- (void)myAccountWithCompletion:(id)a3;
- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5;
- (void)openSetupURL:(id)a3 completion:(id)a4;
- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4;
- (void)preheatXPCConnection;
- (void)preventExitForLocaleReason:(id)a3;
- (void)proximityClientActivate:(id)a3 completion:(id)a4;
- (void)proximityClientDismissContentForDevice:(id)a3 completion:(id)a4;
- (void)proximityClientProvideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6;
- (void)proximityClientRequestScannerTimerReset;
- (void)proximityClientStopSuppressingDevice:(id)a3 completion:(id)a4;
- (void)proximityClientSuppressDevice:(id)a3 completion:(id)a4;
- (void)proximityClientUpdate:(id)a3;
- (void)proximityClientUpdateContent:(id)a3 forDevice:(id)a4 completion:(id)a5;
- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4;
- (void)remoteInteractionSessionActivate:(id)a3 completion:(id)a4;
- (void)remoteInteractionSessionSendPayload:(id)a3;
- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)requestWithInfo:(id)a3 completion:(id)a4;
- (void)retriggerProximityPairing:(id)a3;
- (void)retriggerProximitySetup:(id)a3;
- (void)serviceActivate:(id)a3 completion:(id)a4;
- (void)servicePeerDisconnected:(id)a3 error:(id)a4;
- (void)serviceSendEvent:(id)a3;
- (void)serviceSendFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5;
- (void)serviceSendRequest:(id)a3;
- (void)serviceSendResponse:(id)a3;
- (void)serviceUpdate:(id)a3;
- (void)sessionActivate:(id)a3 completion:(id)a4;
- (void)sessionSendEvent:(id)a3;
- (void)sessionSendFrameType:(unsigned __int8)a3 data:(id)a4;
- (void)sessionSendRequest:(id)a3;
- (void)sessionSendResponse:(id)a3;
- (void)setAudioRoutingScore:(int)a3 completion:(id)a4;
- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5;
- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4;
- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)statusInfoWithCompletion:(id)a3;
- (void)testContinuityKeyboardBegin:(BOOL)a3;
- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4;
- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4;
- (void)userNotificationPresent:(id)a3;
- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3;
@end

@implementation SDXPCConnection

- (SDXPCConnection)initWithServer:(id)a3 xpcConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SDXPCConnection;
  v9 = -[SDXPCConnection init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_server, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
  }

  return v10;
}

- (void)connectionInvalidated
{
  if (dword_100642CD8 <= 20 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 20LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection connectionInvalidated]",  20LL,  "XPC connection invalidated from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  -[SDXPCConnection _invalidateAssertions](self, "_invalidateAssertions");
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestCancel:](self->_server->_nearbyAgent, "coordinatedAlertRequestCancel:");
    -[SFCoordinatedAlertRequest invalidate](self->_caRequest, "invalidate");
    caRequest = self->_caRequest;
    self->_caRequest = 0LL;
  }

  if (self->_diagnosticBLEModeStarted)
  {
    -[SDNearbyAgent diagnosticBLEModeStop:](self->_server->_nearbyAgent, "diagnosticBLEModeStop:", self);
    self->_diagnosticBLEModeStarted = 0;
  }

  if (self->_ddRequest)
  {
    -[SDNearbyAgent deviceDiscoveryRequestStop:](self->_server->_nearbyAgent, "deviceDiscoveryRequestStop:");
    -[SFDeviceDiscovery invalidate](self->_ddRequest, "invalidate");
    ddRequest = self->_ddRequest;
    self->_ddRequest = 0LL;
  }

  notification = self->_notification;
  if (notification)
  {
    -[SFUserAlert invalidate](notification, "invalidate");
    v6 = self->_notification;
    self->_notification = 0LL;
  }

  if (self->_preventExitForLocaleReason)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    [v7 removePreventExitForLocaleReason:self->_preventExitForLocaleReason];

    preventExitForLocaleReason = self->_preventExitForLocaleReason;
    self->_preventExitForLocaleReason = 0LL;
  }

  if (self->_proxClient)
  {
    -[SDProxHandoffAgent proximityClientStop:](self->_server->_proxHandoffAgent, "proximityClientStop:");
    -[SFProximityClient invalidate](self->_proxClient, "invalidate");
    proxClient = self->_proxClient;
    self->_proxClient = 0LL;
  }

  if (self->_riSession)
  {
    -[SDRemoteInteractionAgent sessionStop:](self->_server->_riAgent, "sessionStop:");
    -[SFRemoteInteractionSession invalidate](self->_riSession, "invalidate");
    riSession = self->_riSession;
    self->_riSession = 0LL;
  }

  service = self->_service;
  if (service)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFService identifier](service, "identifier"));
    unsigned int v13 = [v12 isEqualToString:SFServiceIdentifierPasswordSharing];

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 postNotificationName:SFWiFiPasswordSharingAdvertisingEnded object:0];
    }

    -[SDNearbyAgent serviceStop:](self->_server->_nearbyAgent, "serviceStop:", self->_service);
    -[SFService invalidate](self->_service, "invalidate");
    v15 = self->_service;
    self->_service = 0LL;
  }

  if (self->_session)
  {
    -[SDNearbyAgent sessionStop:](self->_server->_nearbyAgent, "sessionStop:");
    -[SFSession invalidate](self->_session, "invalidate");
    session = self->_session;
    self->_session = 0LL;
  }

  if (self->_unlockTestClientStarted)
  {
    -[SDNearbyAgent unlockStopTestClient](self->_server->_nearbyAgent, "unlockStopTestClient");
    self->_unlockTestClientStarted = 0;
  }

- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (*a4
    || (v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  v8)),  *a4 = [v10 isEqual:&__kCFBooleanTrue],  v10,  *a4))
  {
    int v11 = 0;
  }

  else
  {
    if (dword_100642CD8 <= 60
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _entitled:state:label:]",  60LL,  "### %#{pid} lacks %''@ entitlement to use %@\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v8,  v9);
    }

    int v11 = -6768;
  }

  return v11;
}

- (int)_entitledService:(id)a3 state:(BOOL *)a4
{
  id v6 = a3;
  if (*a4)
  {
    int v10 = 0;
    id v7 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.sharing.Services"));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0 || CFGetInt64(v7, 0LL))
    {
      int v10 = 0;
    }

    else
    {
      if (dword_100642CD8 <= 60
        && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
      {
        LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _entitledService:state:]",  60LL,  "### %#{pid} lacks %''@ entitlement for service %''@\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.sharing.Services",  v6);
      }

      int v10 = -6768;
    }
  }

  return v10;
}

- (void)autoFillHelperActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperActivate:completion:]",  30LL,  "%@\n",  @"AutoFillHelperActivate");
  }
  uint64_t v9 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.RemoteInteractionSession",  &self->_entitledRemoteInteractionSession,  @"AutoFillHelperActivate");
  if (!(_DWORD)v9)
  {
    if (!self->_afsHelper)
    {
      [v7 setDispatchQueue:self->_server->_dispatchQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000DA9B8;
      v19[3] = &unk_1005CB2F8;
      v19[4] = self;
      [v7 setDismissUserNotificationHandler:v19];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000DAA08;
      v18[3] = &unk_1005CDD38;
      v18[4] = self;
      [v7 setPairingResponseHandler:v18];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000DAA7C;
      v17[3] = &unk_1005CC698;
      v17[4] = self;
      [v7 setPromptForPINHandler:v17];
      uint64_t v9 = -[SDAutoFillAgent helperStart:](self->_server->_autoFillAgent, "helperStart:", v7);
      if ((_DWORD)v9) {
        goto LABEL_10;
      }
      objc_storeStrong((id *)&self->_afsHelper, a3);
    }

    uint64_t v9 = 0LL;
  }

- (void)autoFillHelperDidPickUsername:(id)a3 password:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperDidPickUsername:password:error:]",  30LL,  "%@\n",  @"AutoFillHelperTryPIN");
  }
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    uint64_t v11 = -[SDAutoFillAgent helper:didPickUsername:password:error:]( self->_server->_autoFillAgent,  "helper:didPickUsername:password:error:",  afsHelper,  v12,  v8,  v9);
    if (!(_DWORD)v11) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v11 = 4294960576LL;
  }

  if (dword_100642CD8 <= 60 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperDidPickUsername:password:error:]",  60LL,  "### %@ failed: %#m\n",  @"AutoFillHelperTryPIN",  v11);
  }
LABEL_11:
}

- (void)autoFillHelperTryPIN:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperTryPIN:]",  30LL,  "%@, PIN: %@\n",  @"AutoFillHelperTryPIN",  v6);
  }
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    uint64_t v5 = -[SDAutoFillAgent helper:tryPIN:](self->_server->_autoFillAgent, "helper:tryPIN:", afsHelper, v6);
    if (!(_DWORD)v5) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v5 = 4294960576LL;
  }

  if (dword_100642CD8 <= 60 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperTryPIN:]",  60LL,  "### %@ failed: %#m\n",  @"AutoFillHelperTryPIN",  v5);
  }
LABEL_11:
}

- (void)autoFillHelperUserNotificationDidActivate:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperUserNotificationDidActivate:]",  30LL,  "%@, %@\n",  @"AutoFillHelperNotificationDidActivate",  v6);
  }
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    uint64_t v5 = -[SDAutoFillAgent helper:userNotificationDidActivate:]( self->_server->_autoFillAgent,  "helper:userNotificationDidActivate:",  afsHelper,  v6);
    if (!(_DWORD)v5) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v5 = 4294960576LL;
  }

  if (dword_100642CD8 <= 60 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperUserNotificationDidActivate:]",  60LL,  "### %@ failed: %#m\n",  @"AutoFillHelperNotificationDidActivate",  v5);
  }
LABEL_11:
}

- (void)autoFillHelperUserNotificationDidDismiss:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperUserNotificationDidDismiss:]",  30LL,  "%@, %@\n",  @"AutoFillHelperNotificationDidDismiss",  v6);
  }
  afsHelper = self->_afsHelper;
  if (afsHelper)
  {
    uint64_t v5 = -[SDAutoFillAgent helper:userNotificationDidDismiss:]( self->_server->_autoFillAgent,  "helper:userNotificationDidDismiss:",  afsHelper,  v6);
    if (!(_DWORD)v5) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v5 = 4294960576LL;
  }

  if (dword_100642CD8 <= 60 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection autoFillHelperUserNotificationDidDismiss:]",  60LL,  "### %@ failed: %#m\n",  @"AutoFillHelperNotificationDidDismiss",  v5);
  }
LABEL_11:
}

- (void)activateAssertionWithIdentifier:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  unsigned int v4 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"ActivateAssertion");
  uint64_t v5 = v17;
  if (!v4)
  {
    id v6 = v17;
    if (!v6)
    {
LABEL_27:

      uint64_t v5 = v17;
      goto LABEL_28;
    }

    if (-[NSMutableSet containsObject:](self->_assertions, "containsObject:", v6))
    {
      if (dword_100642CD8 <= 30
        && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
      {
        LogPrintF( &dword_100642CD8,  "-[SDXPCConnection activateAssertionWithIdentifier:]",  30LL,  "Ignoring duplicate assertion '%@'\n",  v6);
      }

      goto LABEL_27;
    }

    assertions = self->_assertions;
    if (!assertions)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v9 = self->_assertions;
      self->_assertions = v8;

      assertions = self->_assertions;
    }

    -[NSMutableSet addObject:](assertions, "addObject:", v6);
    NSUInteger v10 = -[NSCountedSet countForObject:](self->_server->_assertions, "countForObject:", v6);
    uint64_t v11 = self->_server->_assertions;
    if (!v11)
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
      server = self->_server;
      v14 = server->_assertions;
      server->_assertions = v12;

      uint64_t v11 = self->_server->_assertions;
    }

    -[NSCountedSet addObject:](v11, "addObject:", v6);
    if (dword_100642CD8 <= 30
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection activateAssertionWithIdentifier:]",  30LL,  "Activate assertion '%@': %ld -> %ld\n",  v6,  v10,  v10 + 1);
    }

    if (v10) {
      goto LABEL_27;
    }
    if ([v6 isEqual:@"com.apple.sharing.PreventAppleCardActivation"])
    {
      byte_100669394 = 1;
      goto LABEL_27;
    }

    if ([v6 isEqual:@"com.apple.sharing.DuetSync"])
    {
      byte_100669395 = 1;
    }

    else
    {
      if ([v6 isEqual:@"com.apple.sharing.PreventContinuityKeyboard"])
      {
        -[SDAutoFillAgent setPreventNotifications:](self->_server->_autoFillAgent, "setPreventNotifications:", 1LL);
        -[SDRemoteInteractionAgent setPreventNotifications:](self->_server->_riAgent, "setPreventNotifications:", 1LL);
        goto LABEL_27;
      }

      if (![v6 isEqual:@"com.apple.sharing.PreventNearbyActionAdvertising"])
      {
        if ([v6 isEqual:@"com.apple.sharing.PreventProxCards"])
        {
          gSDProxCardsSuppressed = 1;
          goto LABEL_27;
        }

        if ([v6 isEqual:@"com.apple.sharing.PreventRepair"])
        {
          -[SDSetupAgent setPreventRepair:](self->_server->_setupAgent, "setPreventRepair:", 1LL);
          goto LABEL_27;
        }

        if (![v6 isEqual:@"com.apple.sharing.EnhancedDiscovery"])
        {
          if (dword_100642CD8 <= 30
            && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
          {
            LogPrintF( &dword_100642CD8,  "-[SDXPCConnection activateAssertionWithIdentifier:]",  30LL,  "Ignoring add unknown assertion '%@'\n",  v6);
          }

          goto LABEL_27;
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
        [v15 setEnhancedDiscovery:1];
        goto LABEL_24;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      [v16 setPreventNearbyActionAdvertising:1];
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    [v15 update];
LABEL_24:

    goto LABEL_27;
  }

- (void)_invalidateAssertions
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v3 = self->_assertions;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v7);
        NSUInteger v9 = -[NSCountedSet countForObject:](self->_server->_assertions, "countForObject:", v8);
        -[NSCountedSet removeObject:](self->_server->_assertions, "removeObject:", v8);
        if (dword_100642CD8 <= 30
          && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
        {
          LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _invalidateAssertions]",  30LL,  "Invalidate assertion '%@': %ld -> %ld\n",  v8,  v9,  v9 - 1);
        }

        if (v9 == 1)
        {
          if ([v8 isEqual:@"com.apple.sharing.PreventAppleCardActivation"])
          {
            byte_100669394 = 0;
            goto LABEL_21;
          }

          if ([v8 isEqual:@"com.apple.sharing.DuetSync"])
          {
            byte_100669395 = 0;
            goto LABEL_19;
          }

          if ([v8 isEqual:@"com.apple.sharing.PreventContinuityKeyboard"])
          {
            -[SDAutoFillAgent setPreventNotifications:](self->_server->_autoFillAgent, "setPreventNotifications:", 0LL);
            -[SDRemoteInteractionAgent setPreventNotifications:]( self->_server->_riAgent,  "setPreventNotifications:",  0LL);
            goto LABEL_21;
          }

          if ([v8 isEqual:@"com.apple.sharing.PreventNearbyActionAdvertising"])
          {
            NSUInteger v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
            [v10 setPreventNearbyActionAdvertising:0];

LABEL_19:
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
            [v11 update];
LABEL_20:

            goto LABEL_21;
          }

          if ([v8 isEqual:@"com.apple.sharing.PreventProxCards"])
          {
            gSDProxCardsSuppressed = 0;
          }

          else if ([v8 isEqual:@"com.apple.sharing.PreventRepair"])
          {
            -[SDSetupAgent setPreventRepair:](self->_server->_setupAgent, "setPreventRepair:", 0LL);
          }

          else
          {
            if ([v8 isEqual:@"com.apple.sharing.EnhancedDiscovery"])
            {
              uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
              [v11 setEnhancedDiscovery:0];
              goto LABEL_20;
            }

            if (dword_100642CD8 <= 30
              && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
            {
              LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _invalidateAssertions]",  30LL,  "Ignoring remove unknown assertion '%@'\n",  v8);
            }
          }
        }

- (void)activityStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v5 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"ActivityState");
  if ((_DWORD)v5)
  {
    if (v4)
    {
      uint64_t v6 = (int)v5;
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      id v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v5, 0LL, 0LL));
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
      NSUInteger v9 = (void *)v8;
      NSUInteger v10 = @"?";
      if (v8) {
        NSUInteger v10 = (const __CFString *)v8;
      }
      __int128 v14 = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v6,  v11));
      v4[2](v4, 0LL, v12);
    }
  }

  else
  {
    -[SDNearbyAgent activityStateWithCompletion:](self->_server->_nearbyAgent, "activityStateWithCompletion:", v4);
  }
}

- (void)accountForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"AppleIDAuth");
    if ((_DWORD)v8)
    {
      uint64_t v10 = v8;
    }

    else
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent accountForAppleID:](self->_server->_appleIDAgent, "accountForAppleID:", v6));
      if (v8)
      {
        NSUInteger v9 = (void *)v8;
        sub_1000DB930(v8);
        v7[2](v7, v9, 0LL);
LABEL_5:

        goto LABEL_6;
      }

      uint64_t v10 = 201202LL;
    }

    sub_1000DB930(v8);
    uint64_t v11 = (int)v10;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v10, 0LL, 0LL));
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    NSUInteger v9 = (void *)v13;
    __int128 v14 = @"?";
    if (v13) {
      __int128 v14 = (const __CFString *)v13;
    }
    v18 = v14;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v11,  v15));
    ((void (**)(id, void *, void *))v7)[2](v7, 0LL, v16);

    goto LABEL_5;
  }

- (void)appleIDInfoWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v6 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"AppleIDInfo");
  if ((_DWORD)v6)
  {
    uint64_t v8 = 0LL;
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 myAppleID]);
    if (!v7)
    {
      if (dword_100642CD8 > 60)
      {
        uint64_t v8 = 0LL;
        uint64_t v10 = 0LL;
      }

      else if (dword_100642CD8 == -1)
      {
        uint64_t v8 = 0LL;
        if (!_LogCategory_Initialize(&dword_100642CD8, 60LL))
        {
          uint64_t v6 = 4294960569LL;
          uint64_t v10 = 0LL;
          goto LABEL_22;
        }

        uint64_t v10 = 0LL;
        LogPrintF(&dword_100642CD8, "-[SDXPCConnection appleIDInfoWithCompletion:]", 60LL, "### No appleID?\n");
      }

      else
      {
        uint64_t v8 = 0LL;
        uint64_t v10 = 0LL;
        LogPrintF(&dword_100642CD8, "-[SDXPCConnection appleIDInfoWithCompletion:]", 60LL, "### No appleID?\n");
      }

- (void)clearXPCHelperImageCacheWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  +[SDXPCHelperImageCache clearCacheWithSync:]( &OBJC_CLASS____TtC16DaemoniOSLibrary21SDXPCHelperImageCache,  "clearCacheWithSync:",  1LL);
  v3[2](v3, 0LL);
}

- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  if (a5)
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v6 = a5;
    uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960561LL, 0LL, 0LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    NSUInteger v9 = (void *)v8;
    uint64_t v10 = @"?";
    if (v8) {
      uint64_t v10 = (const __CFString *)v8;
    }
    __int128 v14 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6735LL,  v11));
    (*((void (**)(id, void, void *))a5 + 2))(v6, 0LL, v12);
  }

- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  if (a5)
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v6 = a5;
    uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960561LL, 0LL, 0LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    NSUInteger v9 = (void *)v8;
    uint64_t v10 = @"?";
    if (v8) {
      uint64_t v10 = (const __CFString *)v8;
    }
    __int128 v14 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6735LL,  v11));
    (*((void (**)(id, void, void *))a5 + 2))(v6, 0LL, v12);
  }

- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  if (a5)
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v6 = a5;
    uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960561LL, 0LL, 0LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    NSUInteger v9 = (void *)v8;
    uint64_t v10 = @"?";
    if (v8) {
      uint64_t v10 = (const __CFString *)v8;
    }
    __int128 v14 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6735LL,  v11));
    (*((void (**)(id, void, void, void *))a5 + 2))(v6, 0LL, 0LL, v12);
  }

- (void)myAccountWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v4)
  {
    uint64_t v5 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"AppleIDAuth");
    if ((_DWORD)v5)
    {
      uint64_t v7 = v5;
    }

    else
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent myAccount](self->_server->_appleIDAgent, "myAccount"));
      if (v5)
      {
        id v6 = (void *)v5;
        sub_1000DB930(v5);
        v4[2](v4, v6, 0LL);
LABEL_5:

        goto LABEL_6;
      }

      uint64_t v7 = 201202LL;
    }

    sub_1000DB930(v5);
    uint64_t v8 = (int)v7;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    NSUInteger v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v7, 0LL, 0LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    id v6 = (void *)v10;
    uint64_t v11 = @"?";
    if (v10) {
      uint64_t v11 = (const __CFString *)v10;
    }
    uint64_t v15 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v8,  v12));
    ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v13);

    goto LABEL_5;
  }

- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  NSUInteger v9 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v10 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"FindContact");
  if ((_DWORD)v10)
  {
    uint64_t v11 = NSErrorWithOSStatusF(v10, "Missing entitlement");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v9[2](v9, 0LL, v12);
  }

  else
  {
    contactsQueue = (dispatch_queue_s *)self->_server->_contactsQueue;
    if (!contactsQueue)
    {
      dispatch_queue_t v14 = dispatch_queue_create("SharingFindContact", 0LL);
      server = self->_server;
      __int128 v16 = server->_contactsQueue;
      server->_contactsQueue = (OS_dispatch_queue *)v14;

      contactsQueue = (dispatch_queue_s *)self->_server->_contactsQueue;
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DC310;
    block[3] = &unk_1005CDD60;
    id v18 = v8;
    BOOL v20 = a4;
    v19 = v9;
    dispatch_async(contactsQueue, block);
  }
}

- (void)getDeviceAssets:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v4 = NSErrorF(NSOSStatusErrorDomain, 4294960561LL, "Not supported on this platform");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (dword_100642CD8 <= 90 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 90LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection getDeviceAssets:completion:]",  90LL,  "### GetDeviceAssets failed: %{error}\n",  v5);
  }
  v6[2](v6, 0LL, v5);
}

- (void)getPeopleSuggestions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void **)a4;
  dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  NSUInteger v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = dispatch_queue_create("SharingGetPeopleSuggestions", v9);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 contactIDs]);
  if (v11)
  {
    BOOL v20 = _NSConcreteStackBlock;
    id v12 = sub_1000DCD30;
    NSErrorUserInfoKey v13 = &v20;
  }

  else
  {
    if (dword_100642CD8 <= 30
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
    {
      unsigned int v14 = [v6 maxPeople];
      unsigned int v15 = [v6 excludeBackfills];
      __int128 v16 = "NO";
      if (v15) {
        __int128 v16 = "YES";
      }
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection getPeopleSuggestions:completion:]",  30LL,  "GetPeopleSuggestions start: max %d, excludeBackfills %s\n",  v14,  v16);
    }

    v19 = _NSConcreteStackBlock;
    id v12 = sub_1000DCD40;
    NSErrorUserInfoKey v13 = &v19;
  }

  v13[1] = (void **)3221225472LL;
  v13[2] = (void **)v12;
  v13[3] = (void **)&unk_1005CB858;
  v13[4] = (void **)&self->super.isa;
  v13[5] = (void **)v6;
  v13[6] = v7;
  NSErrorUserInfoKey v17 = v7;
  id v18 = v6;
  dispatch_async(v10, v13);
}

- (void)_getPeopleInfo:(id)a3 completion:(id)a4
{
  v32 = (void (**)(id, NSMutableArray *, void))a4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 contactIDs]);
  id v6 = [v5 count];
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _getPeopleInfo:completion:]",  30LL,  "GetPeopleInfo start: contacts %d\n",  (_DWORD)v6);
  }
  if (v6)
  {
    v53[0] = CNContactEmailAddressesKey;
    v53[1] = CNContactInstantMessageAddressesKey;
    v53[2] = CNContactPhoneNumbersKey;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 3LL));
    dispatch_queue_attr_t v8 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
    NSUInteger v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsWithIdentifiers:]( &OBJC_CLASS___CNContact,  "predicateForContactsWithIdentifiers:",  v5));
    id v50 = 0LL;
    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:]( v8,  "unifiedContactsMatchingPredicate:keysToFetch:error:",  v9,  v7,  &v50));
    id v11 = v50;
    id v12 = v11;
    v38 = (void *)v10;
    if ((!v10 || v11)
      && dword_100642CD8 <= 90
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 90LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _getPeopleInfo:completion:]",  90LL,  "### GetPeopleInfo failed: contacts, %{error}\n",  v12);
    }
  }

  else
  {
    v38 = 0LL;
  }

  v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = v5;
  id v39 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v39)
  {
    int v13 = 0;
    int v40 = 0;
    unsigned int v14 = 0LL;
    uint64_t v37 = *(void *)v47;
    int v33 = (int)v6;
    int v34 = 0;
    do
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        int v41 = v13;
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v17 = v38;
        id v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v43;
LABEL_21:
          uint64_t v21 = 0LL;
          while (1)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v42 + 1) + 8 * v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
            unsigned __int8 v24 = [v23 isEqual:v16];

            if ((v24 & 1) != 0) {
              break;
            }
            if (v19 == (id)++v21)
            {
              id v19 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
              if (v19) {
                goto LABEL_21;
              }
              goto LABEL_27;
            }
          }

          id v25 = v22;

          if (!v25) {
            goto LABEL_32;
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
          unsigned int v27 = [v26 contactIsBlocked:v25];

          if (v27)
          {
            id v28 = objc_alloc_init(&OBJC_CLASS___SFPeopleSuggesterResult);
            [v28 setContactID:v16];
            [v28 setFlags:1];
            -[NSMutableArray addObject:](v36, "addObject:", v28);
            ++v34;
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue([v25 emailAddresses]);
          v30 = &v14[(void)[v29 count]];

          v31 = (void *)objc_claimAutoreleasedReturnValue([v25 phoneNumbers]);
          unsigned int v14 = (char *)[v31 count] + (void)v30;
        }

        else
        {
LABEL_27:

LABEL_32:
          id v25 = objc_alloc_init(&OBJC_CLASS___SFPeopleSuggesterResult);
          [v25 setContactID:v16];
          [v25 setFlags:2];
          -[NSMutableArray addObject:](v36, "addObject:", v25);
          ++v40;
        }

        int v13 = v41 + 1;
        if (__ROR8__(0x8F5C28F5C28F5C29LL * (void)v14, 2) <= 0x28F5C28F5C28F5CuLL
          && dword_100642CD8 <= 30
          && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
        {
          LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _getPeopleInfo:completion:]",  30LL,  "GetPeopleInfo progress: %d of %d, handles %d, blocked %d, notFound %d\n",  v13,  v33,  (_DWORD)v14,  v34,  v40);
        }
      }

      id v39 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }

    while (v39);
  }

  else
  {
    int v34 = 0;
    int v40 = 0;
  }

  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection _getPeopleInfo:completion:]",  30,  "GetPeopleInfo: requested %d, blocked %d, not found %d\n",  [obj count],  v34,  v40);
  }
  v32[2](v32, v36, 0LL);
}

- (void)_getPeopleSuggestions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS____PSSuggesterConfiguration);
  id v29 = v5;
  unsigned int v7 = [v5 maxPeople];
  if (v7) {
    uint64_t v8 = 2 * v7;
  }
  else {
    uint64_t v8 = 100LL;
  }
  [v6 setMaximumNumberOfSuggestions:v8];
  unsigned int v27 = v6;
  id v9 = [[_PSSuggester alloc] initWithConfiguration:v6];
  id v25 = objc_alloc_init(&OBJC_CLASS____PSPredictionContext);
  v26 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rankedGlobalSuggestionsFromContext:contactsOnly:"));
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v31 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        unsigned int v15 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recipients]);
        id v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v35;
          while (2)
          {
            for (j = 0LL; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v35 != v19) {
                objc_enumerationMutation(v16);
              }
              if ((-[NSMutableSet containsObject:](v11, "containsObject:", v21) & 1) == 0)
              {
                -[NSMutableSet addObject:](v11, "addObject:", v21);
                if (v7)
                {
                  if ((unint64_t)-[NSMutableSet count](v11, "count") >= v7)
                  {

                    goto LABEL_23;
                  }
                }
              }
            }

            id v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

- (void)_getInteractionsFromDBPerPeopleSuggestion:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v64 = (void (**)(id, void *, void))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDInteractionStore defaultDatabaseDirectory]( &OBJC_CLASS____CDInteractionStore,  "defaultDatabaseDirectory"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDInteractionStore storeWithDirectory:readOnly:]( &OBJC_CLASS____CDInteractionStore,  "storeWithDirectory:readOnly:",  v6,  1LL));

  v67 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"direction == %i",  1LL));
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"sender.personId != nil"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"ANY recipients.personId IN %@",  v5));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingTimeInterval:28800.0]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"endDate < %@",  v13));

  v61 = (void *)v9;
  -[NSMutableArray addObject:](v8, "addObject:", v9);
  v60 = (void *)v10;
  -[NSMutableArray addObject:](v8, "addObject:", v10);
  v59 = (void *)v11;
  -[NSMutableArray addObject:](v8, "addObject:", v11);
  v58 = (void *)v14;
  -[NSMutableArray addObject:](v8, "addObject:", v14);
  v62 = v8;
  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  0LL));
  v95 = v56;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v95, 1LL));
  id v90 = 0LL;
  v63 = v7;
  v57 = (void *)v15;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( [v7 queryInteractionsUsingPredicate:v15 sortDescriptors:v16 limit:1000 error:&v90]);
  id v55 = v90;

  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id obj = v17;
  id v73 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v73)
  {
    uint64_t v71 = *(void *)v87;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v87 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v19;
        uint64_t v20 = *(void **)(*((void *)&v86 + 1) + 8 * v19);
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 recipients]);
        id v22 = [v21 countByEnumeratingWithState:&v82 objects:v93 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v83;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v83 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)i);
              unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 personId]);
              unsigned int v28 = [v5 containsObject:v27];

              if (v28)
              {
                id v29 = (void *)objc_claimAutoreleasedReturnValue([v20 sender]);
                v30 = v29;
                if (v29)
                {
                  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
                  if (v31) {
                    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v31, v26);
                  }
                }
              }
            }

            id v23 = [v21 countByEnumeratingWithState:&v82 objects:v93 count:16];
          }

          while (v23);
        }

        uint64_t v19 = v75 + 1;
      }

      while ((id)(v75 + 1) != v73);
      id v73 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
    }

    while (v73);
  }

  v32 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  v92[0] = CNContactEmailAddressesKey;
  v92[1] = CNContactInstantMessageAddressesKey;
  v92[2] = CNContactPhoneNumbersKey;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 3LL));
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v33 = v18;
  id v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v78,  v91,  16LL);
  if (v34)
  {
    id v35 = v34;
    v65 = v32;
    uint64_t v66 = 0LL;
    v68 = v33;
    uint64_t v69 = 0LL;
    uint64_t v76 = *(void *)v79;
    __int128 v36 = v67;
    while (1)
    {
      __int128 v37 = 0LL;
      id v74 = v35;
      do
      {
        if (*(void *)v79 != v76) {
          objc_enumerationMutation(v33);
        }
        __int128 v38 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)v37);
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
        id v40 = [v38 type];
        if (v40 == (id)3)
        {
          [v39 rangeOfString:@"@"];
          if (!v43)
          {
            id v42 = v39;
            goto LABEL_32;
          }

- (void)getProblemFlagsWithCompletionHandler:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  unint64_t v4 = -[SDSetupAgent problemFlags](self->_server->_setupAgent, "problemFlags");
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, unint64_t, void))v6 + 2))(v6, v4, 0LL);
    id v5 = v6;
  }
}

- (void)hashManagerControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"HashManagerControl");
    if ((_DWORD)v8)
    {
      uint64_t v25 = NSErrorWithOSStatusF(v8, "Missing entitlement");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
      id v22 = 0LL;
      uint64_t v10 = 0LL;
      goto LABEL_16;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cmd"]);
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 isEqualToString:@"hmrebuild"])
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager shared]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "shared"));
        [v11 rebuildDB];

        id v12 = 0LL;
LABEL_15:
        id v22 = 0LL;
        goto LABEL_16;
      }

      id v9 = [v10 isEqualToString:@"hmdump"];
      if ((_DWORD)v9)
      {
        id v13 = NSTemporaryDirectory();
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:@"airdrop-hash-db.txt"]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));

        if (v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager shared]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "shared"));
          unsigned __int8 v18 = [v17 dumpDBAtFileURL:v16];

          if ((v18 & 1) != 0)
          {
            unsigned int v28 = @"filePath";
            uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 path]);
            uint64_t v20 = (void *)v19;
            uint64_t v21 = @"<unknown>";
            if (v19) {
              uint64_t v21 = (const __CFString *)v19;
            }
            id v29 = v21;
            id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));

            id v12 = 0LL;
            goto LABEL_12;
          }

          v26 = "Failed to perform hash database dump";
        }

        else
        {
          v26 = "Failed to create destination URL";
        }

        uint64_t v27 = NSErrorWithOSStatusF(0LL, v26);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v27);
        id v22 = 0LL;
LABEL_12:

LABEL_16:
        v7[2](v7, v22, v12);

        goto LABEL_17;
      }

      id v23 = "Unknown command";
    }

    else
    {
      id v23 = "Missing command";
    }

    uint64_t v24 = NSErrorWithOSStatusF(v9, v23);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_15;
  }

- (void)openSetupURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"OpenSetupURL");
  if ((_DWORD)v8)
  {
    if (v7)
    {
      uint64_t v9 = (int)v8;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v8, 0LL, 0LL));
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)v11;
      id v13 = @"?";
      if (v11) {
        id v13 = (const __CFString *)v11;
      }
      id v17 = v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  v14));
      v7[2](v7, v15);
    }
  }

  else
  {
    -[SDSetupAgent openSetupURL:](self->_server->_setupAgent, "openSetupURL:", v6);
    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)preheatXPCConnection
{
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (v7)
  {
    uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"AppleIDAuth");
    if ((_DWORD)v8)
    {
      uint64_t v9 = v8;
      sub_1000DB930(v8);
      uint64_t v10 = (int)v9;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v9, 0LL, 0LL));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)v12;
      uint64_t v14 = @"?";
      if (v12) {
        uint64_t v14 = (const __CFString *)v12;
      }
      unsigned __int8 v18 = v14;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v10,  v15));
      v7[2](v7, 0LL, v16);
    }

    else
    {
      -[SDAppleIDAgent personInfoWithEmailOrPhone:completion:]( self->_server->_appleIDAgent,  "personInfoWithEmailOrPhone:completion:",  v6,  v7);
    }
  }
}

- (void)preventExitForLocaleReason:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (-[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"PreventExitForLocale"))
  {
    id v6 = 0LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    id v6 = v5;
    preventExitForLocaleReason = self->_preventExitForLocaleReason;
    p_preventExitForLocaleReason = &self->_preventExitForLocaleReason;
    if (preventExitForLocaleReason) {
      objc_msgSend(v5, "removePreventExitForLocaleReason:");
    }
    objc_storeStrong((id *)p_preventExitForLocaleReason, a3);
    if (v9) {
      [v6 addPreventExitForLocaleReason:v9];
    }
  }
}

- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v7 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"ReenableProxCardType");
  if (!(_DWORD)v7)
  {
    if (-[SDSetupAgent reenableProxCardType:](self->_server->_setupAgent, "reenableProxCardType:", v4))
    {
      if (v6) {
        v6[2](v6, 0LL);
      }
      goto LABEL_54;
    }

    if (dword_100642CD8 <= 60
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
    {
      uint64_t v8 = "Unspecified";
      switch((int)v4)
      {
        case 0:
          break;
        case 1:
          uint64_t v8 = "ATVSetup";
          break;
        case 2:
        case 3:
        case 15:
        case 16:
        case 23:
        case 26:
        case 27:
        case 35:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 53:
        case 54:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
          goto LABEL_13;
        case 4:
          uint64_t v8 = "MobileBackup";
          break;
        case 5:
          uint64_t v8 = "WatchSetup";
          break;
        case 6:
          uint64_t v8 = "ATVPair";
          break;
        case 7:
          uint64_t v8 = "InternetRelay";
          break;
        case 8:
          uint64_t v8 = "WiFiPassword";
          break;
        case 9:
          uint64_t v8 = "iOSSetup";
          break;
        case 10:
          uint64_t v8 = "Repair";
          break;
        case 11:
          uint64_t v8 = "LegacyHomePodSetup";
          break;
        case 12:
          uint64_t v8 = "ApplePay";
          break;
        case 13:
          uint64_t v8 = "WHASetup";
          break;
        case 14:
          uint64_t v8 = "DevToolsPair";
          break;
        case 17:
          uint64_t v8 = "DDPing";
          break;
        case 18:
          uint64_t v8 = "DDPong";
          break;
        case 19:
          uint64_t v8 = "RemoteAutoFill";
          break;
        case 20:
          uint64_t v8 = "CompanionLinkProx";
          break;
        case 21:
          uint64_t v8 = "RemoteManagement";
          break;
        case 22:
          uint64_t v8 = "RemoteAutoFillPong";
          break;
        case 24:
          uint64_t v8 = "AccessorySetup";
          break;
        case 25:
          uint64_t v8 = "TVLS";
          break;
        case 28:
          uint64_t v8 = "AppSignIn";
          break;
        case 29:
          uint64_t v8 = "Fitness";
          break;
        case 30:
          uint64_t v8 = "TVCCS";
          break;
        case 31:
          uint64_t v8 = "TVSA";
          break;
        case 32:
          uint64_t v8 = "AuthenticateAccounts";
          break;
        case 33:
          uint64_t v8 = "HomePodSetup";
          break;
        case 34:
          uint64_t v8 = "CompanionAuthentication";
          break;
        case 36:
          uint64_t v8 = "dovePeace";
          break;
        case 43:
          uint64_t v8 = "AuthenticateAccountsV2";
          break;
        case 50:
          uint64_t v8 = "NeedsRDLink";
          break;
        case 51:
          uint64_t v8 = "NeedsCLink";
          break;
        case 52:
          uint64_t v8 = "Goodbye";
          break;
        case 55:
          uint64_t v8 = "AUAction";
          break;
        case 56:
          uint64_t v8 = "AcceptedInvitations";
          break;
        case 84:
          uint64_t v8 = "HasInvitations";
          break;
        default:
          if ((_DWORD)v4 == 100) {
            uint64_t v8 = "B238SetupAfterWiFi";
          }
          else {
LABEL_13:
          }
            uint64_t v8 = "?";
          break;
      }

      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection reenableProxCardType:completion:]",  60LL,  "Ignored re-enable of unsupported prox card type %s\n",  v8);
    }

    uint64_t v7 = 4294960561LL;
  }

  if (v6)
  {
    uint64_t v9 = (int)v7;
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v7, 0LL, 0LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)v11;
    id v13 = @"?";
    if (v11) {
      id v13 = (const __CFString *)v11;
    }
    NSErrorUserInfoKey v17 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  v14));
    ((void (**)(id, void *))v6)[2](v6, v15);
  }

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v13 = a3;
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v9 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"RepairDevice");
  if ((_DWORD)v9)
  {
    uint64_t v11 = NSErrorWithOSStatusF(v9, "Missing entitlement '%@' for RepairDevice", @"com.apple.sharing.Client");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    uint64_t v10 = (void *)v12;
    if (v8 && v12) {
      v8[2](v8, v12);
    }
  }

  else
  {
    -[SDSetupAgent repairDevice:flags:completion:]( self->_server->_setupAgent,  "repairDevice:flags:completion:",  v13,  v6,  v8);
    uint64_t v10 = 0LL;
  }
}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"AppleIDAuth");
  if ((_DWORD)v8)
  {
    if (v7)
    {
      uint64_t v9 = v8;
      sub_1000DB930(v8);
      uint64_t v10 = (int)v9;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v9, 0LL, 0LL));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)v12;
      uint64_t v14 = @"?";
      if (v12) {
        uint64_t v14 = (const __CFString *)v12;
      }
      unsigned __int8 v18 = v14;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v10,  v15));
      v7[2](v7, 0LL, v16);
    }
  }

  else
  {
    -[SDAppleIDAgent requestWithInfo:completion:](self->_server->_appleIDAgent, "requestWithInfo:completion:", v6, v7);
  }
}

- (void)retriggerProximityPairing:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  LODWORD(v5) = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"RetriggerProximityPairing");
  if (v4)
  {
    if ((_DWORD)v5) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = 4294960561LL;
    }
    uint64_t v6 = (int)v5;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v5, 0LL, 0LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = (void *)v8;
    uint64_t v10 = @"?";
    if (v8) {
      uint64_t v10 = (const __CFString *)v8;
    }
    uint64_t v14 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v6,  v11));
    v4[2](v4, v12);
  }
}

- (void)retriggerProximitySetup:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v5 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"RetriggerProximitySetup");
  if ((_DWORD)v5)
  {
    if (v4)
    {
      uint64_t v6 = (int)v5;
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v5, 0LL, 0LL));
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = (void *)v8;
      uint64_t v10 = @"?";
      if (v8) {
        uint64_t v10 = (const __CFString *)v8;
      }
      uint64_t v14 = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v6,  v11));
      v4[2](v4, v12);
    }
  }

  else
  {
    -[SDSetupAgent retriggerProximitySetup:](self->_server->_setupAgent, "retriggerProximitySetup:", v4);
  }
}

- (void)setAudioRoutingScore:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v10 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v6 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"SetAudioRoutingScore");
  if ((_DWORD)v6)
  {
    uint64_t v7 = NSErrorWithOSStatusF( v6,  "Missing entitlement '%@' for SetAudioRoutingScore",  @"com.apple.sharing.Client");
LABEL_6:
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10[2](v10, v9);

    goto LABEL_7;
  }

  if (v4 >= 0x10)
  {
    uint64_t v7 = NSErrorWithOSStatusF(4294960591LL, "Out-of-range score: %d, min %d, max %d");
    goto LABEL_6;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  [v8 setAudioRoutingScore:v4];

  v10[2](v10, 0LL);
LABEL_7:
}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v10 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"SetupDevice");
  if ((_DWORD)v10)
  {
    uint64_t v12 = NSErrorWithOSStatusF(v10, "Missing entitlement '%@' for SetupDevice", @"com.apple.sharing.Client");
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    uint64_t v11 = (void *)v13;
    if (v9 && v13) {
      v9[2](v9, v13);
    }
  }

  else
  {
    -[SDSetupAgent setupDevice:homeIdentifier:completion:]( self->_server->_setupAgent,  "setupDevice:homeIdentifier:completion:",  v14,  v8,  v9);
    uint64_t v11 = 0LL;
  }
}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
{
  id v11 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v7 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"ShowDevicePicker");
  if ((_DWORD)v7)
  {
    uint64_t v9 = NSErrorWithOSStatusF(v7, "Missing entitlement '%@' for ShowDevicePicker", @"com.apple.sharing.Client");
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    id v8 = (void *)v10;
    if (v6 && v10) {
      v6[2](v6, v10);
    }
  }

  else
  {
    -[SDSetupAgent showDevicePickerWithInfo:completion:]( self->_server->_setupAgent,  "showDevicePickerWithInfo:completion:",  v11,  v6);
    id v8 = 0LL;
  }
}

- (void)statusInfoWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v5 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"AppleIDAuth");
  if ((_DWORD)v5)
  {
    if (v4)
    {
      uint64_t v8 = v5;
      sub_1000DB930(v5);
      uint64_t v9 = (int)v8;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v8, 0LL, 0LL));
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)v11;
      uint64_t v13 = @"?";
      if (v11) {
        uint64_t v13 = (const __CFString *)v11;
      }
      NSErrorUserInfoKey v17 = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  v14));
      v4[2](v4, 0LL, v15);
    }

    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent statusInfo](self->_server->_appleIDAgent, "statusInfo"));
    uint64_t v7 = (void *)v6;
    if (v4)
    {
      sub_1000DB930(v6);
      ((void (**)(id, void *, void *))v4)[2](v4, v7, 0LL);
    }
  }
}

- (void)testContinuityKeyboardBegin:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  riAgent = self->_server->_riAgent;
  if (v3) {
    -[SDRemoteInteractionAgent handleInputDidBeginWithFlags:sessionInfo:]( riAgent,  "handleInputDidBeginWithFlags:sessionInfo:",  0LL,  0LL);
  }
  else {
    -[SDRemoteInteractionAgent handleInputDidEndWithFlags:sessionInfo:]( riAgent,  "handleInputDidEndWithFlags:sessionInfo:",  0LL,  0LL);
  }
}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"TriggerHomeKitDeviceDetected");
  if ((_DWORD)v8)
  {
    if (v7)
    {
      uint64_t v9 = (int)v8;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      uint64_t v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v8, 0LL, 0LL));
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)v11;
      uint64_t v13 = @"?";
      if (v11) {
        uint64_t v13 = (const __CFString *)v11;
      }
      NSErrorUserInfoKey v17 = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  v14));
      v7[2](v7, v15);
    }
  }

  else
  {
    -[SDSetupAgent triggerHomeKitDeviceDetectedWithURL:completion:]( self->_server->_setupAgent,  "triggerHomeKitDeviceDetectedWithURL:completion:",  v6,  v7);
  }
}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection triggerProximityAutoFillDetectedWithURL:completion:]",  30LL,  "Triggering AutoFill detected with URL\n");
  }
  -[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:]( self->_server->_autoFillAgent,  "triggerProximityAutoFillDetectedWithURL:completion:",  v7,  v6);
}

- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v5 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Services",  &self->_entitledClient,  @"WiFiPasswordSharingAvailability");
  if ((_DWORD)v5)
  {
    if (v4)
    {
      uint64_t v8 = (int)v5;
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      uint64_t v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v5, 0LL, 0LL));
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = (void *)v10;
      uint64_t v12 = @"?";
      if (v10) {
        uint64_t v12 = (const __CFString *)v10;
      }
      NSErrorUserInfoKey v16 = v12;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v8,  v13));
      v4[2](v4, 1LL, v14);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    id v7 = [v6 wifiPasswordSharingAvailability];

    if (dword_100642CD8 <= 30
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection wifiPasswordSharingAvailabilityWithCompletion:]",  30LL,  "PWS availability: %#{flags}\n",  v7,  &unk_1004CB09D);
    }

    if (v4) {
      v4[2](v4, (uint64_t)v7, 0LL);
    }
  }
}

- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (gSDProxCardsSuppressed)
  {
    if (dword_100642CD8 <= 90
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 90LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection startProxCardTransactionWithOptions:completion:]",  90LL,  "Suppressing prox cards currently");
    }
  }

  else if (-[SDSetupAgent uiShowing](self->_server->_setupAgent, "uiShowing"))
  {
    if (dword_100642CD8 <= 90
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 90LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection startProxCardTransactionWithOptions:completion:]",  90LL,  "Already have prox card UI showing");
    }
  }

  else
  {
    if ((v4 & 4) != 0) {
      int v6 = 509955;
    }
    else {
      int v6 = 509963;
    }
    if ((v4 & 0x10) != 0) {
      v6 &= 0x7C809u;
    }
    if ((v4 & 8) != 0) {
      v6 &= 0x7880Bu;
    }
    int v7 = v6 & 0x7C80A;
    if ((v4 & 1) == 0) {
      int v7 = v6;
    }
    if ((v4 & 2) != 0) {
      v7 &= ~0x20000u;
    }
    if ((v4 & 0x20) != 0) {
      v7 &= 0x6C80Bu;
    }
    if ((v4 & 0x40) != 0) {
      unsigned int v8 = v7 & 0xFFFFF7FF;
    }
    else {
      unsigned int v8 = v7;
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v10 = [v9 systemUIFlags] & v8;

    if (!v10)
    {
      -[SDXPCConnection activateAssertionWithIdentifier:]( self,  "activateAssertionWithIdentifier:",  @"com.apple.sharing.PreventProxCards");
      uint64_t v11 = 1LL;
      goto LABEL_36;
    }

    if (dword_100642CD8 <= 90
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 90LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection startProxCardTransactionWithOptions:completion:]",  90LL,  "Blocking UI currently showing");
    }
  }

  uint64_t v11 = 0LL;
LABEL_36:
  uint64_t v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, v11);
    uint64_t v12 = v13;
  }
}

- (void)coordinatedAlertsRequestStart:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void *, uint64_t, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL)))
  {
    unint64_t v9 = (unint64_t)[v7 type];
    if (v9 > 6) {
      unsigned int v10 = "?";
    }
    else {
      unsigned int v10 = (&off_1005CDEE0)[v9];
    }
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection coordinatedAlertsRequestStart:completion:]",  30LL,  "%@ (%s)\n",  @"CoordinatedAlertStart",  v10);
  }

  signed int v20 = 0;
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"caEntitlements", &v20);
  if (v20
    || !Int64
    || (signed int v20 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.CoordinatedAlerts",  &self->_entitledCoordinatedAlerts,  @"CoordinatedAlertStart")) == 0)
  {
    if (self->_caRequest)
    {
      signed int v20 = -6721;
      if (dword_100642CD8 <= 60
        && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
      {
        LogPrintF( &dword_100642CD8,  "-[SDXPCConnection coordinatedAlertsRequestStart:completion:]",  60LL,  "### %@ rejected for %#{pid}: already in use\n",  @"CoordinatedAlertStart",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
      }
    }

    else
    {
      [v7 setCompletionHandler:v8];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      [v7 setXpcConnection:v12];

      objc_storeStrong((id *)&self->_caRequest, a3);
      -[SDNearbyAgent coordinatedAlertRequestStart:](self->_server->_nearbyAgent, "coordinatedAlertRequestStart:", v7);
      signed int v20 = 0;
    }
  }

  if (v8 && v20)
  {
    uint64_t v13 = v20;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    id v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v20, 0LL, 0LL));
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    NSErrorUserInfoKey v16 = (void *)v15;
    NSErrorUserInfoKey v17 = @"?";
    if (v15) {
      NSErrorUserInfoKey v17 = (const __CFString *)v15;
    }
    id v22 = v17;
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v13,  v18));
    v8[2](v8, v19, 1LL, 0LL);
  }
}

- (void)coordinatedAlertsRequestFinish
{
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestFinish:](self->_server->_nearbyAgent, "coordinatedAlertRequestFinish:");
    -[SFCoordinatedAlertRequest invalidate](self->_caRequest, "invalidate");
    caRequest = self->_caRequest;
    self->_caRequest = 0LL;
  }

- (void)coordinatedAlertsRequestCancel
{
  if (self->_caRequest)
  {
    -[SDNearbyAgent coordinatedAlertRequestCancel:](self->_server->_nearbyAgent, "coordinatedAlertRequestCancel:");
    caRequest = self->_caRequest;
    self->_caRequest = 0LL;
  }

- (void)deviceDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection deviceDiscoveryActivate:completion:]",  30LL,  "%@: %@, from %#{pid}\n",  @"DeviceDiscoveryActivate",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  uint64_t v9 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.DeviceDiscovery",  &self->_entitledDeviceDiscovery,  @"DeviceDiscoveryActivate");
  if ((_DWORD)v9)
  {
    if (v8)
    {
      uint64_t v10 = (int)v9;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v9, 0LL, 0LL));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = (void *)v12;
      id v14 = @"?";
      if (v12) {
        id v14 = (const __CFString *)v12;
      }
      id v22 = v14;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v10,  v15));
      v8[2](v8, v16);
    }
  }

  else
  {
    if (!self->_ddRequest)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000E024C;
      v20[3] = &unk_1005CB8C8;
      v20[4] = self;
      [v7 setDeviceFoundHandler:v20];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000E02B8;
      v19[3] = &unk_1005CB8C8;
      v19[4] = self;
      [v7 setDeviceLostHandler:v19];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000E0324;
      v18[3] = &unk_1005CB8F0;
      v18[4] = self;
      [v7 setDeviceChangedHandler:v18];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000E0398;
      v17[3] = &unk_1005CBB40;
      v17[4] = self;
      [v7 setScanStateChangedHandler:v17];
      objc_storeStrong((id *)&self->_ddRequest, a3);
      -[SDNearbyAgent deviceDiscoveryRequestStart:](self->_server->_nearbyAgent, "deviceDiscoveryRequestStart:", v7);
    }

    if (v8) {
      v8[2](v8, 0LL);
    }
  }
}

- (void)deviceDiscoveryUpdate:(id)a3
{
  id v24 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection deviceDiscoveryUpdate:]",  30LL,  "%@: %@\n",  @"DeviceDiscoveryUpdate",  v24);
  }
  if (self->_ddRequest)
  {
    unsigned int v4 = [v24 changeFlags];
    id v5 = [v24 discoveryFlags];
    if (v5 != -[SFDeviceDiscovery discoveryFlags](self->_ddRequest, "discoveryFlags")) {
      -[SFDeviceDiscovery setDiscoveryFlags:]( self->_ddRequest,  "setDiscoveryFlags:",  [v24 discoveryFlags]);
    }
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_ddRequest, "deviceFilter"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceFilter]);
    id v8 = v6;
    id v9 = v7;
    if (v8 == v9)
    {
    }

    else
    {
      uint64_t v10 = v9;
      if ((v8 == 0LL) == (v9 != 0LL))
      {
      }

      else
      {
        unsigned __int8 v11 = [v8 isEqual:v9];

        if ((v11 & 1) != 0)
        {
LABEL_18:
          id v12 = [v24 fastScanMode];
          if (v12 != -[SFDeviceDiscovery fastScanMode](self->_ddRequest, "fastScanMode")) {
            -[SFDeviceDiscovery setFastScanMode:]( self->_ddRequest,  "setFastScanMode:",  [v24 fastScanMode]);
          }
          unsigned int v13 = [v24 overrideScreenOff];
          if (v13 != -[SFDeviceDiscovery overrideScreenOff](self->_ddRequest, "overrideScreenOff")) {
            -[SFDeviceDiscovery setOverrideScreenOff:]( self->_ddRequest,  "setOverrideScreenOff:",  [v24 overrideScreenOff]);
          }
          id v14 = [v24 overrideScreenOffRescanInterval];
          if (v14 != -[SFDeviceDiscovery overrideScreenOffRescanInterval]( self->_ddRequest,  "overrideScreenOffRescanInterval")) {
            -[SFDeviceDiscovery setOverrideScreenOffRescanInterval:]( self->_ddRequest,  "setOverrideScreenOffRescanInterval:",  [v24 overrideScreenOffRescanInterval]);
          }
          id v15 = [v24 rssiThreshold];
          if (v15 != -[SFDeviceDiscovery rssiThreshold](self->_ddRequest, "rssiThreshold")) {
            -[SFDeviceDiscovery setRssiThreshold:]( self->_ddRequest,  "setRssiThreshold:",  [v24 rssiThreshold]);
          }
          id v16 = [v24 scanRate];
          if (v16 != -[SFDeviceDiscovery scanRate](self->_ddRequest, "scanRate")) {
            -[SFDeviceDiscovery setScanRate:](self->_ddRequest, "setScanRate:", [v24 scanRate]);
          }
          unsigned int v17 = [v24 trackPeers];
          unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery useCases](self->_ddRequest, "useCases"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v24 useCases]);
          id v20 = v18;
          id v21 = v19;
          if (v20 == v21)
          {
          }

          else
          {
            id v22 = v21;
            if ((v20 == 0LL) == (v21 != 0LL))
            {
            }

            else
            {
              unsigned __int8 v23 = [v20 isEqual:v21];

              if ((v23 & 1) != 0) {
                goto LABEL_38;
              }
            }

            id v20 = (id)objc_claimAutoreleasedReturnValue([v24 useCases]);
            -[SFDeviceDiscovery setUseCases:](self->_ddRequest, "setUseCases:", v20);
          }

LABEL_38:
          -[SDNearbyAgent deviceDiscoveryRequestUpdate:]( self->_server->_nearbyAgent,  "deviceDiscoveryRequestUpdate:",  self->_ddRequest);
          goto LABEL_39;
        }
      }

      id v8 = (id)objc_claimAutoreleasedReturnValue([v24 deviceFilter]);
      -[SFDeviceDiscovery setDeviceFilter:](self->_ddRequest, "setDeviceFilter:", v8);
    }

    goto LABEL_18;
  }

  if (dword_100642CD8 <= 60 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection deviceDiscoveryUpdate:]",  60LL,  "### %@ failed: %#m\n",  @"DeviceDiscoveryUpdate",  4294960576LL);
  }
LABEL_39:
}

- (void)deviceDiscoveryFastScanTrigger:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    -[SDNearbyAgent deviceDiscoveryFastScanTrigger:reason:]( self->_server->_nearbyAgent,  "deviceDiscoveryFastScanTrigger:reason:",  ddRequest,  v5);
  }
}

- (void)deviceDiscoveryFastScanCancel:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    -[SDNearbyAgent deviceDiscoveryFastScanCancel:reason:]( self->_server->_nearbyAgent,  "deviceDiscoveryFastScanCancel:reason:",  ddRequest,  v5);
  }
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    -[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:]( self->_server->_nearbyAgent,  "deviceDiscoveryTriggerEnhancedDiscovery:reason:",  ddRequest,  v5);
  }
}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v10 = a3;
  id v8 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  ddRequest = self->_ddRequest;
  if (ddRequest) {
    -[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:]( self->_server->_nearbyAgent,  "deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:",  ddRequest,  v10,  v6);
  }
  if (v8) {
    v8[2](v8, 0LL);
  }
}

- (void)bluetoothUserInteraction
{
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection bluetoothUserInteraction]",  30LL,  "%@\n",  @"BluetoothUserInteraction");
  }
  -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.BluetoothUserInteraction",  &self->_entitledBluetoothUserInteraction,  @"BluetoothUserInteraction");
}

- (void)diagnosticBLEModeWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection diagnosticBLEModeWithCompletion:]",  30LL,  "%@\n",  @"DiagnosticBLEMode");
  }
  uint64_t v5 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Diagnostics",  &self->_entitledDiagnostics,  @"DiagnosticBLEMode");
  if ((_DWORD)v5)
  {
    uint64_t v6 = (int)v5;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v5, 0LL, 0LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)v8;
    id v10 = @"?";
    if (v8) {
      id v10 = (const __CFString *)v8;
    }
    id v14 = v10;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v6,  v11));
    v4[2](v4, v12);
  }

  else
  {
    -[SDNearbyAgent diagnosticBLEModeStart:](self->_server->_nearbyAgent, "diagnosticBLEModeStart:", self);
    self->_diagnosticBLEModeStarted = 1;
    v4[2](v4, 0LL);
  }
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection diagnosticControl:completion:]",  30LL,  "%@( '%@')\n",  @"DiagnosticControl",  v6);
  }
  uint64_t v45 = 0LL;
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Diagnostics",  &self->_entitledDiagnostics,  @"DiagnosticControl");
  if ((_DWORD)v8) {
    goto LABEL_73;
  }
  if ([v6 hasPrefix:@"afui"])
  {
    autoFillAgent = self->_server->_autoFillAgent;
    id v10 = v6;
    uint64_t v11 = 4LL;
LABEL_8:
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 substringFromIndex:v11]);
    [autoFillAgent testUI:v12];
LABEL_15:

LABEL_16:
    v7[2](v7, 0LL);
    goto LABEL_17;
  }

  if ([v6 hasPrefix:@"afremote"])
  {
    NSErrorUserInfoKey v13 = self->_server->_autoFillAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 substringFromIndex:8]);
    -[SDAutoFillAgent testRemote:](v13, "testRemote:", v12);
    goto LABEL_15;
  }

  if ([v6 hasPrefix:@"afservice"])
  {
    id v14 = self->_server->_autoFillAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 substringFromIndex:9]);
    -[SDAutoFillAgent testService:](v14, "testService:", v12);
    goto LABEL_15;
  }

  if ([v6 hasPrefix:@"afkc"])
  {
    id v15 = self->_server->_autoFillAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 substringFromIndex:4]);
    -[SDAutoFillAgent testKeychain:](v15, "testKeychain:", v12);
    goto LABEL_15;
  }

  if (![v6 caseInsensitiveCompare:@"au1"])
  {
    nearbyAgent = self->_server->_nearbyAgent;
    uint64_t v18 = 1LL;
LABEL_24:
    -[SDNearbyAgent setAutoUnlockActive:](nearbyAgent, "setAutoUnlockActive:", v18);
    goto LABEL_16;
  }

  if (![v6 caseInsensitiveCompare:@"au0"])
  {
    nearbyAgent = self->_server->_nearbyAgent;
    uint64_t v18 = 0LL;
    goto LABEL_24;
  }

  id v16 = v6;
  if (sscanf((const char *)[v16 UTF8String], "auua-%X-%X", (char *)&v45 + 4, &v45) == 2)
  {
    -[SDNearbyAgent unlockUpdateAdvertising:mask:]( self->_server->_nearbyAgent,  "unlockUpdateAdvertising:mask:",  HIDWORD(v45),  v45);
    goto LABEL_16;
  }

  if ([v16 hasPrefix:@"choui"])
  {
    autoFillAgent = self->_server->_proxHandoffAgent;
    id v10 = v16;
    uint64_t v11 = 5LL;
    goto LABEL_8;
  }

  if (![v16 caseInsensitiveCompare:@"btpipe"])
  {
    id v20 = -[SDNearbyAgent sharedNearbyPipe](self->_server->_nearbyAgent, "sharedNearbyPipe");
    goto LABEL_16;
  }

  if (![v16 caseInsensitiveCompare:@"metrics"])
  {
    SFMetricsLog(@"com.apple.sharing.test", &off_1005F9A90);
    goto LABEL_16;
  }

  if (![v16 caseInsensitiveCompare:@"pping"])
  {
    -[SDNearbyAgent testPipePing](self->_server->_nearbyAgent, "testPipePing");
    goto LABEL_16;
  }

  id v19 = v16;
  if (sscanf((const char *)[v19 UTF8String], "hotspot=%X", (char *)&v45 + 4) == 1)
  {
    -[SDNearbyAgent setHotspotInfo:](self->_server->_nearbyAgent, "setHotspotInfo:", HIDWORD(v45));
    goto LABEL_16;
  }

  if ([v19 hasPrefix:@"atvui"])
  {
    setupAgent = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:5]);
    -[SDSetupAgent testUIAppleTVSetup:](setupAgent, "testUIAppleTVSetup:", v12);
    goto LABEL_15;
  }

  if (([v19 hasPrefix:@"b238ui"] & 1) != 0
    || [v19 hasPrefix:@"homepodui"])
  {
    id v22 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:6]);
    -[SDSetupAgent testSetupUIB238:](v22, "testSetupUIB238:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"hkui"])
  {
    unsigned __int8 v23 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:4]);
    -[SDSetupAgent testHomeKitDeviceDetected:](v23, "testHomeKitDeviceDetected:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"nfcui"])
  {
    id v24 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:5]);
    -[SDSetupAgent testNFCUI:](v24, "testNFCUI:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"ppui"])
  {
    uint64_t v25 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:4]);
    -[SDSetupAgent testPairUI:](v25, "testPairUI:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"pinshow"])
  {
    v26 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:7]);
    -[SDSetupAgent testPINShow:](v26, "testPINShow:", v12);
    goto LABEL_15;
  }

  if (![v19 caseInsensitiveCompare:@"pinhide"])
  {
    -[SDSetupAgent testPINHide](self->_server->_setupAgent, "testPINHide");
    goto LABEL_16;
  }

  if ([v19 hasPrefix:@"dpick"])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:5]);
    uint64_t v27 = self->_server->_setupAgent;
    __int128 v48 = @"debugParams";
    __int128 v49 = v12;
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    -[SDSetupAgent showDevicePickerWithInfo:completion:]( v27,  "showDevicePickerWithInfo:completion:",  v28,  &stru_1005CDDA8);

    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"pwui"])
  {
    id v29 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:4]);
    -[SDSetupAgent testSetupUIPasswordSharing:](v29, "testSetupUIPasswordSharing:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"rpui"])
  {
    v30 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:4]);
    -[SDSetupAgent testRepairUI:](v30, "testRepairUI:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"TVLatencyUI"])
  {
    uint64_t v31 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:11]);
    -[SDSetupAgent testUITVLatencySetup:](v31, "testUITVLatencySetup:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"TVColorCalibrator"])
  {
    v32 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:17]);
    -[SDSetupAgent testUITVLatencyColorimeterSetup:](v32, "testUITVLatencyColorimeterSetup:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"whaui"])
  {
    id v33 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:5]);
    -[SDSetupAgent testSetupUIWHA:](v33, "testSetupUIWHA:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"wsui"])
  {
    id v34 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:4]);
    -[SDSetupAgent testSetupUIWatch:](v34, "testSetupUIWatch:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"testProxCardKit"])
  {
    id v35 = self->_server->_setupAgent;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:8]);
    -[SDSetupAgent testProxCardKit:](v35, "testProxCardKit:", v12);
    goto LABEL_15;
  }

  if ([v19 hasPrefix:@"unpost"])
  {
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](&OBJC_CLASS___SDNotificationManager, "sharedManager"));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v19 substringFromIndex:6]);
    [v36 testPost:v37];

    goto LABEL_16;
  }

  if (dword_100642CD8 <= 50 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 50LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection diagnosticControl:completion:]",  50LL,  "### Unsupported diagnostic control command: '%@'\n",  v19);
  }
  uint64_t v8 = 4294960561LL;
LABEL_73:
  uint64_t v38 = (int)v8;
  NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
  __int128 v39 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v8, 0LL, 0LL));
  uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
  uint64_t v41 = (void *)v40;
  id v42 = @"?";
  if (v40) {
    id v42 = (const __CFString *)v40;
  }
  uint64_t v47 = v42;
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v38,  v43));
  ((void (**)(id, void *))v7)[2](v7, v44);

LABEL_17:
}

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, const __CFString *))a4;
  NSErrorUserInfoKey v13 = 0LL;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Diagnostics",  &self->_entitledDiagnostics,  @"DiagnosticLogControl");
  if (!(_DWORD)v8)
  {
    if (!v6 || (uint64_t v8 = LogControl([v6 UTF8String]), !(_DWORD)v8)) {
      uint64_t v8 = LogShow(&v13);
    }
  }

  if (v7)
  {
    if (v13)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
      id v10 = (__CFString *)v9;
      if (v9) {
        uint64_t v11 = (const __CFString *)v9;
      }
      else {
        uint64_t v11 = @"?";
      }
      v7[2](v7, v11);
    }

    else
    {
      uint64_t v12 = NSPrintF("### Error: %#m\n", v8);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
      v7[2](v7, v10);
    }
  }

  if (v13) {
    free(v13);
  }
}

- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  if ([v10 caseInsensitiveCompare:@"change"])
  {
    if ([v10 caseInsensitiveCompare:@"found"])
    {
      if ([v10 caseInsensitiveCompare:@"lost"])
      {
        if (dword_100642CD8 <= 50
          && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 50LL)))
        {
          LogPrintF( &dword_100642CD8,  "-[SDXPCConnection diagnosticMock:device:completion:]",  50LL,  "### Unsupported mock event: '%@'\n",  v10);
        }
      }

      else
      {
        -[SDNearbyAgent diagnosticMockLost:](self->_server->_nearbyAgent, "diagnosticMockLost:", v8);
      }
    }

    else
    {
      -[SDNearbyAgent diagnosticMockFound:](self->_server->_nearbyAgent, "diagnosticMockFound:", v8);
    }
  }

  else
  {
    -[SDNearbyAgent diagnosticMockChanged:](self->_server->_nearbyAgent, "diagnosticMockChanged:", v8);
  }

  if (v9) {
    v9[2](v9, 0LL);
  }
}

- (void)diagnosticMockStart:(id)a3
{
  id v5 = a3;
  -[SDNearbyAgent diagnosticBLEModeStart:](self->_server->_nearbyAgent, "diagnosticBLEModeStart:", self);
  unsigned int v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0LL);
    unsigned int v4 = v5;
  }
}

- (void)diagnosticMockStop:(id)a3
{
  id v5 = a3;
  -[SDNearbyAgent diagnosticBLEModeStop:](self->_server->_nearbyAgent, "diagnosticBLEModeStop:", self);
  unsigned int v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0LL);
    unsigned int v4 = v5;
  }
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Diagnostics",  &self->_entitledDiagnostics,  @"DiagnosticShow");
  if ((_DWORD)v8)
  {
    NSErrorUserInfoKey v13 = 0LL;
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  if ([v6 isEqual:@"ids"])
  {
    nearbyAgent = self->_server->_nearbyAgent;
    id v70 = 0LL;
    -[SDNearbyAgent idsDevicesAppendDescription:](nearbyAgent, "idsDevicesAppendDescription:", &v70);
    id v10 = v70;
LABEL_11:
    NSErrorUserInfoKey v13 = 0LL;
    goto LABEL_12;
  }

  if ([v6 isEqual:@"prox"])
  {
    uint64_t v69 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfo](self->_server->_nearbyAgent, "bleProximityInfo"));
    NSAppendPrintF(&v69, "%@", v11);
    uint64_t v12 = v69;
LABEL_10:
    id v10 = v12;

    goto LABEL_11;
  }

  if ([v6 isEqual:@"autofill"])
  {
    v68 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoFillAgent description](self->_server->_autoFillAgent, "description"));
    NSAppendPrintF(&v68, "%@", v11);
    uint64_t v12 = v68;
    goto LABEL_10;
  }

  if ([v6 isEqual:@"handoff"])
  {
    v67 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent description](self->_server->_proxHandoffAgent, "description"));
    NSAppendPrintF(&v67, "%@", v11);
    uint64_t v12 = v67;
    goto LABEL_10;
  }

  unsigned __int8 v16 = [v6 isEqual:@"ss"];
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent description](self->_server->_nearbyAgent, "description"));
  uint64_t v18 = (void *)v17;
  if (v17)
  {
    id v66 = 0LL;
    NSAppendPrintF(&v66, "%@\n", v17);
    id v19 = v66;
    if ((v16 & 1) != 0) {
      goto LABEL_29;
    }
  }

  else
  {
    id v19 = 0LL;
    if ((v16 & 1) != 0) {
      goto LABEL_29;
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent detailedDescription](self->_server->_appleIDAgent, "detailedDescription"));

  if (v20)
  {
    id v65 = v19;
    NSAppendPrintF(&v65, "%@\n", v20);
    id v21 = v65;

    id v19 = v21;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager shared]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "shared"));
  unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 detailedDescription]);

  if (v23)
  {
    id v64 = v19;
    NSAppendPrintF(&v64, "%@\n", v23);
    id v24 = v64;

    id v19 = v24;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v25 description]);

  if (v18)
  {
    id v63 = v19;
    NSAppendPrintF(&v63, "%@\n", v18);
    id v26 = v63;

    id v19 = v26;
  }

- (void)diagnosticUnlockTestClientWithDevice:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v4 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Diagnostics",  &self->_entitledDiagnostics,  @"DiagnosticUnlockTestClientWithDevice");
  if ((_DWORD)v4)
  {
    if (dword_100642CD8 <= 60)
    {
      if (dword_100642CD8 != -1 || (v5 = v4, int v6 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v4 = v5, v6)) {
        LogPrintF( &dword_100642CD8,  "-[SDXPCConnection diagnosticUnlockTestClientWithDevice:]",  60LL,  "### %@ failed: %#m\n",  @"DiagnosticUnlockTestClientWithDevice",  v4);
      }
    }
  }

  else
  {
    -[SDNearbyAgent unlockStartTestClientWithDevice:]( self->_server->_nearbyAgent,  "unlockStartTestClientWithDevice:",  v7);
    self->_unlockTestClientStarted = 1;
  }
}

- (void)diagnosticUnlockTestServer
{
  uint64_t v3 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Diagnostics",  &self->_entitledDiagnostics,  @"DiagnosticUnlockTestServer");
  if ((_DWORD)v3)
  {
    if (dword_100642CD8 <= 60)
    {
      if (dword_100642CD8 != -1 || (v4 = v3, int v5 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v3 = v4, v5)) {
        LogPrintF( &dword_100642CD8,  "-[SDXPCConnection diagnosticUnlockTestServer]",  60LL,  "### %@ failed: %#m\n",  @"DiagnosticUnlockTestServer",  v3);
      }
    }
  }

  else
  {
    -[SDNearbyAgent unlockStartTestServer](self->_server->_nearbyAgent, "unlockStartTestServer");
  }

- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection nfcTagReaderUIActivateWithEndpoint:params:completion:]",  30LL,  "%@\n",  @"NFCTagReaderUIActivate");
  }
  uint64_t v11 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Client",  &self->_entitledClient,  @"NFCTagReaderUIActivate");
  if ((_DWORD)v11)
  {
    uint64_t v12 = v11;
    if (dword_100642CD8 <= 60
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection nfcTagReaderUIActivateWithEndpoint:params:completion:]",  60LL,  "### %@ failed: %#m\n",  @"NFCTagReaderUIActivate",  v12);
    }

    if (v10)
    {
      uint64_t v13 = (int)v12;
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      uint64_t v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v12, 0LL, 0LL));
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      unsigned __int8 v16 = (void *)v15;
      uint64_t v17 = @"?";
      if (v15) {
        uint64_t v17 = (const __CFString *)v15;
      }
      id v21 = v17;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v13,  v18));
      v10[2](v10, v19);
    }
  }

  else
  {
    -[SDSetupAgent nfcTagReaderUIActivateWithEndpoint:params:completion:]( self->_server->_setupAgent,  "nfcTagReaderUIActivateWithEndpoint:params:completion:",  v8,  v9,  v10);
  }
}

- (void)proximityClientActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection proximityClientActivate:completion:]",  30LL,  "%@\n",  @"ProximityClientActivate");
  }
  uint64_t v9 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.ProximityClient",  &self->_entitledProximityClient,  @"ProximityClientActivate");
  if (!(_DWORD)v9)
  {
    if (self->_proxClient)
    {
LABEL_11:
      uint64_t v9 = 0LL;
      goto LABEL_12;
    }

    [v7 setDispatchQueue:self->_server->_dispatchQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000E2724;
    v26[3] = &unk_1005CDDD0;
    v26[4] = self;
    [v7 setDeviceEnteredImmediateHandler:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000E2790;
    v25[3] = &unk_1005CDDD0;
    v25[4] = self;
    [v7 setDeviceExitedImmediateHandler:v25];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000E27FC;
    v24[3] = &unk_1005CDDD0;
    v24[4] = self;
    [v7 setDeviceEnteredNearbyHandler:v24];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000E2868;
    v23[3] = &unk_1005CDDD0;
    v23[4] = self;
    [v7 setDeviceExitedNearbyHandler:v23];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000E28D4;
    v22[3] = &unk_1005CDDD0;
    v22[4] = self;
    [v7 setDeviceWasDismissedHandler:v22];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000E2944;
    v21[3] = &unk_1005CC740;
    v21[4] = self;
    [v7 setDeviceWasDismissedHandlerEx:v21];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000E29B8;
    v20[3] = &unk_1005CDDD0;
    v20[4] = self;
    [v7 setDeviceWasSelectedHandler:v20];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000E2A24;
    v19[3] = &unk_1005CDDD0;
    v19[4] = self;
    [v7 setDeviceWillTriggerHandler:v19];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000E2A90;
    v18[3] = &unk_1005CDDD0;
    v18[4] = self;
    [v7 setDeviceDidUntriggerHandler:v18];
    if ([v7 wantsUpdates])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000E2AFC;
      v17[3] = &unk_1005CDDF8;
      v17[4] = self;
      [v7 setDeviceUpdateHandler:v17];
    }

    uint64_t v9 = -[SDProxHandoffAgent proximityClientStart:](self->_server->_proxHandoffAgent, "proximityClientStart:", v7);
    if (!(_DWORD)v9)
    {
      objc_storeStrong((id *)&self->_proxClient, a3);
      goto LABEL_11;
    }
  }

- (void)proximityClientUpdate:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection proximityClientUpdate:]",  30LL,  "%@: %@\n",  @"ProximityClientUpdate",  v5);
  }
  if (self->_proxClient)
  {
    unsigned int v4 = [v5 shouldAdvertise];
    if (v4 != -[SFProximityClient shouldAdvertise](self->_proxClient, "shouldAdvertise")) {
      -[SFProximityClient setShouldAdvertise:]( self->_proxClient,  "setShouldAdvertise:",  [v5 shouldAdvertise]);
    }
    -[SDProxHandoffAgent proximityClientUpdate:]( self->_server->_proxHandoffAgent,  "proximityClientUpdate:",  self->_proxClient);
  }

  else if (dword_100642CD8 <= 60 {
         && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
  }
  {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection proximityClientUpdate:]",  60LL,  "### %@ failed: %#m\n",  @"ProximityClientUpdate",  4294960576LL);
  }
}

- (void)proximityClientDismissContentForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.ProximityClient",  &self->_entitledProximityClient,  @"ProximityClientDismissContent");
  if (!(_DWORD)v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7) {
        goto LABEL_10;
      }
      uint64_t v8 = 4294960576LL;
      goto LABEL_6;
    }

    uint64_t v8 = -[SDProxHandoffAgent proximityClient:dismissContentForDevice:]( self->_server->_proxHandoffAgent,  "proximityClient:dismissContentForDevice:",  proxClient,  v6);
  }

  if (!v7) {
    goto LABEL_10;
  }
  if (!(_DWORD)v8)
  {
    v7[2](v7, 0LL);
    goto LABEL_10;
  }

- (void)proximityClientProvideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v13 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.ProximityClient",  &self->_entitledProximityClient,  @"ProximityClientProvideContent");
  if (!(_DWORD)v13)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v12) {
        goto LABEL_10;
      }
      uint64_t v13 = 4294960576LL;
      goto LABEL_6;
    }

    uint64_t v13 = -[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]( self->_server->_proxHandoffAgent,  "proximityClient:provideContent:forDevice:force:",  proxClient,  v10,  v11,  v7);
  }

  if (!v12) {
    goto LABEL_10;
  }
  if (!(_DWORD)v13)
  {
    v12[2](v12, 0LL);
    goto LABEL_10;
  }

- (void)proximityClientSuppressDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.ProximityClient",  &self->_entitledProximityClient,  @"ProximityClientSuppressDevice");
  if (!(_DWORD)v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7) {
        goto LABEL_10;
      }
      uint64_t v8 = 4294960576LL;
      goto LABEL_6;
    }

    uint64_t v8 = -[SDProxHandoffAgent proximityClient:suppressDevice:]( self->_server->_proxHandoffAgent,  "proximityClient:suppressDevice:",  proxClient,  v6);
  }

  if (!v7) {
    goto LABEL_10;
  }
  if (!(_DWORD)v8)
  {
    v7[2](v7, 0LL);
    goto LABEL_10;
  }

- (void)proximityClientStopSuppressingDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v8 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.ProximityClient",  &self->_entitledProximityClient,  @"ProximityClientStopSuppressingDevice");
  if (!(_DWORD)v8)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v7) {
        goto LABEL_10;
      }
      uint64_t v8 = 4294960576LL;
      goto LABEL_6;
    }

    uint64_t v8 = -[SDProxHandoffAgent proximityClient:stopSuppressingDevice:]( self->_server->_proxHandoffAgent,  "proximityClient:stopSuppressingDevice:",  proxClient,  v6);
  }

  if (!v7) {
    goto LABEL_10;
  }
  if (!(_DWORD)v8)
  {
    v7[2](v7, 0LL);
    goto LABEL_10;
  }

- (void)proximityClientUpdateContent:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  uint64_t v11 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.ProximityClient",  &self->_entitledProximityClient,  @"ProximityClientUpdateContent");
  if (!(_DWORD)v11)
  {
    proxClient = self->_proxClient;
    if (!proxClient)
    {
      if (!v10) {
        goto LABEL_10;
      }
      uint64_t v11 = 4294960576LL;
      goto LABEL_6;
    }

    uint64_t v11 = -[SDProxHandoffAgent proximityClient:updateContent:forDevice:]( self->_server->_proxHandoffAgent,  "proximityClient:updateContent:forDevice:",  proxClient,  v8,  v9);
  }

  if (!v10) {
    goto LABEL_10;
  }
  if (!(_DWORD)v11)
  {
    v10[2](v10, 0LL);
    goto LABEL_10;
  }

- (void)proximityClientRequestScannerTimerReset
{
  uint64_t v3 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.ProximityClient",  &self->_entitledProximityClient,  @"ProximityClientUpdateContent");
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
  }

  else
  {
    if (self->_proxClient)
    {
      -[SDProxHandoffAgent proximityClientRequestScannerTimerReset:]( self->_server->_proxHandoffAgent,  "proximityClientRequestScannerTimerReset:");
      return;
    }

    uint64_t v4 = 4294960576LL;
  }

  if (dword_100642CD8 <= 90 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 90LL)))
  {
    uint64_t v5 = (int)v4;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    id v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v4, 0LL, 0LL));
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)v7;
    id v9 = @"?";
    if (v7) {
      id v9 = (const __CFString *)v7;
    }
    uint64_t v13 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v5,  v10));
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection proximityClientRequestScannerTimerReset]",  90LL,  "### Request scanner timer reset failed: %@\n",  v11,  v12);
  }

- (void)remoteInteractionSessionActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection remoteInteractionSessionActivate:completion:]",  30LL,  "%@\n",  @"RemoteInteractionSessionActivate");
  }
  uint64_t v9 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.RemoteInteractionSession",  &self->_entitledRemoteInteractionSession,  @"RemoteInteractionSessionActivate");
  if (!(_DWORD)v9)
  {
    if (!self->_riSession)
    {
      [v7 setDispatchQueue:self->_server->_dispatchQueue];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000E3A0C;
      v20[3] = &unk_1005CD2B8;
      v20[4] = self;
      [v7 setRemoteTextEventHandler:v20];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000E3A78;
      v19[3] = &unk_1005CDE20;
      v19[4] = self;
      [v7 setTextSessionDidBegin:v19];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000E3AE4;
      v18[3] = &unk_1005CDE20;
      v18[4] = self;
      [v7 setTextSessionDidEnd:v18];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000E3B50;
      v17[3] = &unk_1005CDE20;
      v17[4] = self;
      [v7 setTextSessionDidChange:v17];
      uint64_t v9 = -[SDRemoteInteractionAgent sessionStart:](self->_server->_riAgent, "sessionStart:", v7);
      if ((_DWORD)v9) {
        goto LABEL_10;
      }
      objc_storeStrong((id *)&self->_riSession, a3);
    }

    uint64_t v9 = 0LL;
  }

- (void)remoteInteractionSessionSendPayload:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection remoteInteractionSessionSendPayload:]",  30LL,  "%@\n",  @"RemoteInteractionSessionSendData");
  }
  riSession = self->_riSession;
  if (riSession)
  {
    -[SFRemoteInteractionSession sendPayload:](riSession, "sendPayload:", v7);
LABEL_7:
    uint64_t v5 = v7;
    goto LABEL_8;
  }

  uint64_t v5 = v7;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v6 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v5 = v7, v6))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection remoteInteractionSessionSendPayload:]",  60LL,  "### %@ failed: %#m\n",  @"RemoteInteractionSessionSendData",  4294960576LL);
      goto LABEL_7;
    }
  }

- (void)serviceActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (!v9)
  {
    int v17 = -6705;
    goto LABEL_21;
  }

  signed int v32 = -[SDXPCConnection _entitledService:state:](self, "_entitledService:state:", v9, &self->_entitledService);
  if (!v32)
  {
    if (self->_service)
    {
      int v17 = -6721;
      goto LABEL_21;
    }

    uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"dedDisable", &v32);
    if (!v32)
    {
      if (Int64)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        uint64_t v12 = SFServiceIdentifierDeviceDiagnostics;
        unsigned int v13 = [v11 isEqual:SFServiceIdentifierDeviceDiagnostics];

        if (v13)
        {
          if (dword_100642CD8 <= 60
            && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
          {
            LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceActivate:completion:]",  60LL,  "### Service identifier %@ is disabled via pref\n",  v12);
          }

          int v17 = -71165;
LABEL_21:
          signed int v32 = v17;
          if (!v8) {
            goto LABEL_27;
          }
          goto LABEL_22;
        }
      }
    }

    [v7 setDispatchQueue:self->_server->_dispatchQueue];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000E416C;
    v31[3] = &unk_1005CB3E8;
    v31[4] = self;
    [v7 setErrorHandler:v31];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000E41D8;
    v30[3] = &unk_1005CD188;
    v30[4] = self;
    [v7 setEventMessageHandler:v30];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000E4290;
    v29[3] = &unk_1005CDE48;
    v29[4] = self;
    [v7 setPeerDisconnectedHandler:v29];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000E4320;
    v28[3] = &unk_1005CDE70;
    v28[4] = self;
    [v7 setReceivedFramePeerHandler:v28];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000E43B0;
    v27[3] = &unk_1005CBAD0;
    v27[4] = self;
    [v7 setRequestMessageHandler:v27];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000E4468;
    v26[3] = &unk_1005CDE98;
    v26[4] = self;
    [v7 setResponseMessageInternalHandler:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000E4520;
    v25[3] = &unk_1005CDE70;
    v25[4] = self;
    [v7 setSendFramePeerHandler:v25];
    signed int v32 = -[SDNearbyAgent serviceStart:](self->_server->_nearbyAgent, "serviceStart:", v7);
    if (!v32)
    {
      objc_storeStrong((id *)&self->_service, a3);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SFService identifier](self->_service, "identifier"));
      unsigned int v15 = [v14 isEqualToString:SFServiceIdentifierPasswordSharing];

      if (v15)
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v16 postNotificationName:SFWiFiPasswordSharingAdvertisingBegan object:0];
      }
    }
  }

  if (!v8) {
    goto LABEL_27;
  }
LABEL_22:
  uint64_t v18 = v32;
  if (v32)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    id v19 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v32, 0LL, 0LL));
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    NSErrorUserInfoKey v21 = (void *)v20;
    NSErrorUserInfoKey v22 = @"?";
    if (v20) {
      NSErrorUserInfoKey v22 = (const __CFString *)v20;
    }
    id v34 = v22;
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v18,  v23));
    v8[2](v8, v24);
  }

  else
  {
    v8[2](v8, 0LL);
  }

- (void)serviceUpdate:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  service = self->_service;
  if (service)
  {
    -[SFService updateWithService:](service, "updateWithService:", v7);
    -[SDNearbyAgent update](self->_server->_nearbyAgent, "update");
LABEL_7:
    uint64_t v5 = v7;
    goto LABEL_8;
  }

  uint64_t v5 = v7;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v6 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v5 = v7, v6))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceUpdate:]",  60LL,  "### %@ failed: %#m\n",  @"ServiceUpdate",  4294960576LL);
      goto LABEL_7;
    }
  }

- (void)servicePeerDisconnected:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 10 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 10LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection servicePeerDisconnected:error:]",  10LL,  "%@: %@\n",  @"ServicePeerDisconnected",  v8);
  }
  service = self->_service;
  if (service)
  {
    -[SFService servicePeerDisconnected:error:](service, "servicePeerDisconnected:error:", v8, v6);
  }

  else if (dword_100642CD8 <= 60 {
         && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
  }
  {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection servicePeerDisconnected:error:]",  60LL,  "### %@ failed: %#m\n",  @"ServicePeerDisconnected",  4294960551LL);
  }
}

- (void)serviceSendEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (self->_service)
  {
    -[SDNearbyAgent serviceSendEvent:service:](self->_server->_nearbyAgent, "serviceSendEvent:service:", v6);
LABEL_7:
    uint64_t v4 = v6;
    goto LABEL_8;
  }

  uint64_t v4 = v6;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v5 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v4 = v6, v5))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceSendEvent:]",  60LL,  "### %@ failed: %#m\n",  @"ServiceSendEvent",  4294960551LL);
      goto LABEL_7;
    }
  }

- (void)serviceSendFrameType:(unsigned __int8)a3 data:(id)a4 peer:(id)a5
{
  uint64_t v6 = a3;
  id v11 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 10 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 10LL)))
  {
    else {
      uint64_t v9 = (&off_1005CDF18)[(char)v6];
    }
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceSendFrameType:data:peer:]",  10,  "%@: %s, %ld bytes\n",  @"ServiceSendFrame",  v9,  [v11 length]);
  }

  service = self->_service;
  if (service)
  {
    -[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]( self->_server->_nearbyAgent,  "bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:",  v6,  -[SFService serviceType](service, "serviceType"),  v11,  v8,  0LL);
  }

  else if (dword_100642CD8 <= 60 {
         && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
  }
  {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceSendFrameType:data:peer:]",  60LL,  "### %@ failed: %#m\n",  @"ServiceSendFrame",  4294960551LL);
  }
}

- (void)serviceSendRequest:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 10 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 10LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceSendRequest:]",  10LL,  "%@: %@\n",  @"ServiceSendRequest",  v6);
  }
  if (self->_service)
  {
    -[SDNearbyAgent serviceSendRequest:service:](self->_server->_nearbyAgent, "serviceSendRequest:service:", v6);
LABEL_7:
    uint64_t v4 = v6;
    goto LABEL_8;
  }

  uint64_t v4 = v6;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v5 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v4 = v6, v5))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceSendRequest:]",  60LL,  "### %@ failed: %#m\n",  @"ServiceSendRequest",  4294960551LL);
      goto LABEL_7;
    }
  }

- (void)serviceSendResponse:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 10 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 10LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceSendResponse:]",  10LL,  "%@: %@\n",  @"ServiceSendResponse",  v6);
  }
  if (self->_service)
  {
    -[SDNearbyAgent serviceSendResponse:service:](self->_server->_nearbyAgent, "serviceSendResponse:service:", v6);
LABEL_7:
    uint64_t v4 = v6;
    goto LABEL_8;
  }

  uint64_t v4 = v6;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v5 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v4 = v6, v5))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection serviceSendResponse:]",  60LL,  "### %@ failed: %#m\n",  @"ServiceSendResponse",  4294960551LL);
      goto LABEL_7;
    }
  }

- (void)sessionActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 30 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 30LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionActivate:completion:]",  30LL,  "%@\n",  @"SessionActivate");
  }
  uint64_t v9 = -[SDXPCConnection _entitled:state:label:]( self,  "_entitled:state:label:",  @"com.apple.sharing.Session",  &self->_entitledSession,  @"SessionActivate");
  if (!(_DWORD)v9)
  {
    if (self->_session)
    {
      uint64_t v9 = 4294960575LL;
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceUUID]);

      if (v10)
      {
        [v7 setDispatchQueue:self->_server->_dispatchQueue];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_1000E4FD8;
        v24[3] = &unk_1005CBB40;
        v24[4] = self;
        [v7 setBluetoothStateChangedHandler:v24];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1000E5030;
        v23[3] = &unk_1005CB3E8;
        v23[4] = self;
        [v7 setErrorHandler:v23];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000E509C;
        v22[3] = &unk_1005CD188;
        v22[4] = self;
        [v7 setEventMessageHandler:v22];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1000E5108;
        v21[3] = &unk_1005CDEC0;
        v21[4] = self;
        [v7 setReceivedFrameHandler:v21];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000E517C;
        v20[3] = &unk_1005CBAD0;
        v20[4] = self;
        [v7 setRequestMessageHandler:v20];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1000E51E8;
        v19[3] = &unk_1005CDE98;
        v19[4] = self;
        [v7 setResponseMessageInternalHandler:v19];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_1000E5254;
        v18[3] = &unk_1005CDEC0;
        v18[4] = self;
        [v7 setSendFrameHandler:v18];
        objc_storeStrong((id *)&self->_session, a3);
        uint64_t v9 = -[SDNearbyAgent sessionStart:](self->_server->_nearbyAgent, "sessionStart:", v7);
      }

      else
      {
        uint64_t v9 = 4294960551LL;
      }
    }
  }

  if (v8)
  {
    if ((_DWORD)v9)
    {
      uint64_t v11 = (int)v9;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      uint64_t v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v9, 0LL, 0LL));
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = (void *)v13;
      unsigned int v15 = @"?";
      if (v13) {
        unsigned int v15 = (const __CFString *)v13;
      }
      id v26 = v15;
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v11,  v16));
      v8[2](v8, v17);
    }

    else
    {
      v8[2](v8, 0LL);
    }
  }
}

- (void)sessionSendEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (self->_session)
  {
    objc_msgSend(v6, "setSession:");
    -[SDNearbyAgent sessionSendEvent:session:]( self->_server->_nearbyAgent,  "sessionSendEvent:session:",  v6,  self->_session);
LABEL_7:
    uint64_t v4 = v6;
    goto LABEL_8;
  }

  uint64_t v4 = v6;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v5 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v4 = v6, v5))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionSendEvent:]",  60LL,  "### %@ failed: %#m\n",  @"SessionSendEvent",  4294960551LL);
      goto LABEL_7;
    }
  }

- (void)sessionSendFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 10 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 10LL)))
  {
    else {
      id v6 = (&off_1005CDF18)[(char)v4];
    }
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionSendFrameType:data:]",  10,  "%@: %s, %ld bytes\n",  @"SessionSendFrame",  v6,  [v13 length]);
  }

  session = self->_session;
  if (session)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession peerDevice](session, "peerDevice"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);

    if (v9)
    {
      -[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]( self->_server->_nearbyAgent,  "bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:",  v4,  -[SFSession serviceType](self->_session, "serviceType"),  v13,  v9,  1LL);

LABEL_12:
      uint64_t v10 = v13;
      goto LABEL_13;
    }

    uint64_t v11 = 4294960588LL;
  }

  else
  {
    uint64_t v11 = 4294960551LL;
  }

  uint64_t v10 = v13;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v12 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v10 = v13, v12))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionSendFrameType:data:]",  60LL,  "### %@ failed: %#m\n",  @"SessionSendFrame",  v11);
      goto LABEL_12;
    }
  }

- (void)sessionSendRequest:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 10 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 10LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionSendRequest:]",  10LL,  "%@: %@\n",  @"SessionSendRequest",  v6);
  }
  if (self->_session)
  {
    objc_msgSend(v6, "setSession:");
    -[SDNearbyAgent sessionSendRequest:session:]( self->_server->_nearbyAgent,  "sessionSendRequest:session:",  v6,  self->_session);
LABEL_7:
    uint64_t v4 = v6;
    goto LABEL_8;
  }

  uint64_t v4 = v6;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v5 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v4 = v6, v5))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionSendRequest:]",  60LL,  "### %@ failed: %#m\n",  @"SessionSendRequest",  4294960551LL);
      goto LABEL_7;
    }
  }

- (void)sessionSendResponse:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_server->_dispatchQueue);
  if (dword_100642CD8 <= 10 && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 10LL))) {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionSendResponse:]",  10LL,  "%@: %@\n",  @"SessionSendResponse",  v6);
  }
  if (self->_session)
  {
    objc_msgSend(v6, "setSession:");
    -[SDNearbyAgent sessionSendResponse:session:]( self->_server->_nearbyAgent,  "sessionSendResponse:session:",  v6,  self->_session);
LABEL_7:
    uint64_t v4 = v6;
    goto LABEL_8;
  }

  uint64_t v4 = v6;
  if (dword_100642CD8 <= 60)
  {
    if (dword_100642CD8 != -1 || (int v5 = _LogCategory_Initialize(&dword_100642CD8, 60LL), v4 = v6, v5))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCConnection sessionSendResponse:]",  60LL,  "### %@ failed: %#m\n",  @"SessionSendResponse",  4294960551LL);
      goto LABEL_7;
    }
  }

- (void)userNotificationPresent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (dword_100642CD8 <= 50
    && ((id v6 = v3, dword_100642CD8 != -1) || (v5 = _LogCategory_Initialize(&dword_100642CD8, 50LL), v4 = v6, v5)))
  {
    LogPrintF( &dword_100642CD8,  "-[SDXPCConnection userNotificationPresent:]",  50LL,  "UserNotification XPC not supported on current platform\n");
  }

  else
  {
  }

- (void).cxx_destruct
{
}

@end