@interface CSDCallCapabilities
+ (CSDCallCapabilities)sharedInstance;
- (BOOL)_accountsMatchForSecondaryCalling;
- (BOOL)_deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled;
- (BOOL)_isAudioAccessoryDevice;
- (BOOL)_isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:(id)a3;
- (BOOL)_isWatchDevice;
- (BOOL)_relayCallingEnabledDefault;
- (BOOL)_supportsBasebandCalling;
- (BOOL)_supportsCellularData;
- (BOOL)_supportsDisplayingFaceTimeAudioCalls;
- (BOOL)_supportsDisplayingFaceTimeVideoCalls;
- (BOOL)_supportsDisplayingTelephonyCalls;
- (BOOL)_supportsPrimaryCalling;
- (BOOL)_supportsRelayCalling;
- (BOOL)_supportsThumperCallingUsingSenderIdentityCapabilitiesState:(id)a3;
- (BOOL)_supportslaunchingInCallApplicationForIncomingCall;
- (BOOL)isThumperCallingSupportedForAccountID:(id)a3;
- (BOOL)isThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4;
- (CSDAccountsController)accountsController;
- (CSDCallCapabilities)init;
- (CSDCallCapabilities)initWithRelayService:(id)a3 thumperService:(id)a4 featureFlags:(id)a5;
- (CSDClientManager)clientManager;
- (CSDIDSService)relayService;
- (CSDIDSService)thumperService;
- (CSDPinExchangeController)thumperPinExchangeController;
- (CSDProcessObserverProtocol)processObserver;
- (CSDTelephonyCallCapabilities)telephonyCallCapabilities;
- (CSDThumperCapabilitiesMonitor)thumperCapabilitiesMonitor;
- (CSDThumperPushHandler)thumperPushHandler;
- (NSArray)localThumperAccounts;
- (NSArray)secondaryThumperAccounts;
- (NSDictionary)thumperCallingCapabilitiesStateByUUID;
- (NSString)debugDescription;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (TUCallCapabilitiesState)callCapabilitiesState;
- (TUCallCapabilitiesState)pairedHostDeviceState;
- (TUCallCapabilitiesState)state;
- (TUFeatureFlags)featureFlags;
- (id)_cloudCallingDevices;
- (id)_outgoingCallerID;
- (id)_primaryThumperAccountRequiringAvailableDeviceSlots;
- (id)_primaryThumperAccountRequiringMatchingCallerID;
- (id)_primaryThumperAccountRequiringMatchingCallerID:(BOOL)a3 requiringAvailableDeviceSlots:(BOOL)a4;
- (id)_relayCallingDisabledForDeviceIDDefault;
- (id)secondaryThumperAccountForAccountID:(id)a3;
- (id)thumperCallingCapabilitiesStateForAccountID:(id)a3;
- (unsigned)_defaultOverrideForDisableDefault:(id)a3 forceDefault:(id)a4;
- (void)_initializePairedHostDeviceState;
- (void)_savePairedHostDeviceState;
- (void)_setRelayCallingEnabled:(BOOL)a3;
- (void)_setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4;
- (void)_setRelayCallingEnabledDefault:(BOOL)a3;
- (void)_setRelayCallingEnabledDefault:(BOOL)a3 forDeviceWithID:(id)a4;
- (void)_setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
- (void)_setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_updateCTCapabilities;
- (void)_updateCallAvailability;
- (void)_updateClientsWithState;
- (void)_updateDefaultAppIfNecessary;
- (void)_updateDynamicCapabilitiesAndUpdateClients;
- (void)_updateHostingAndDisplayingSupport;
- (void)_updateRelayCapabilities;
- (void)_updateState;
- (void)accountsChanged;
- (void)addThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4;
- (void)callCapabilitiesState:(id)a3;
- (void)cancelPinRequestFromPrimaryDevice;
- (void)dealloc;
- (void)deviceCapabilityChanged:(id)a3;
- (void)deviceListChanged:(id)a3;
- (void)endEmergencyCallbackMode;
- (void)faceTimeAvailabilityChanged;
- (void)invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:(id)a3;
- (void)invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:(id)a3;
- (void)outgoingCallerIDChanged;
- (void)registerClient:(id)a3;
- (void)removeThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4;
- (void)requestPinFromPrimaryDevice;
- (void)setPairedHostDeviceState:(id)a3;
- (void)setRelayCallingEnabled:(BOOL)a3;
- (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4;
- (void)setState:(id)a3;
- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
- (void)setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)telephonyCallCapabilitiesChanged;
- (void)unregisterClient:(id)a3;
- (void)updatePairedHostDeviceCallCapabilitiesState:(id)a3;
- (void)updateState;
@end

@implementation CSDCallCapabilities

+ (CSDCallCapabilities)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BD188;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044CF88 != -1) {
    dispatch_once(&qword_10044CF88, block);
  }
  return (CSDCallCapabilities *)(id)qword_10044CF80;
}

- (CSDCallCapabilities)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
  v5 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v6 = -[CSDCallCapabilities initWithRelayService:thumperService:featureFlags:]( self,  "initWithRelayService:thumperService:featureFlags:",  v3,  v4,  v5);

  return v6;
}

- (CSDCallCapabilities)initWithRelayService:(id)a3 thumperService:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CSDCallCapabilities;
  v12 = -[CSDCallCapabilities init](&v37, "init");
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callcapabilities", 0LL);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_featureFlags, a5);
    v15 = -[CSDClientManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDClientManager),  "initWithSerialQueue:",  v12->_queue);
    clientManager = v12->_clientManager;
    v12->_clientManager = v15;

    v17 = (dispatch_queue_s *)v12->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000BD4D0;
    block[3] = &unk_1003D7730;
    v18 = v12;
    v36 = v18;
    dispatch_sync(v17, block);
    objc_storeStrong((id *)&v18->_relayService, a3);
    objc_storeStrong((id *)&v18->_thumperService, a4);
    v19 = objc_alloc_init(&OBJC_CLASS___CSDAccountsController);
    accountsController = v18->_accountsController;
    v18->_accountsController = v19;

    -[CSDAccountsController setDelegate:](v18->_accountsController, "setDelegate:", v18);
    v21 = -[CSDTelephonyCallCapabilities initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDTelephonyCallCapabilities),  "initWithQueue:",  v12->_queue);
    telephonyCallCapabilities = v18->_telephonyCallCapabilities;
    v18->_telephonyCallCapabilities = v21;

    -[CSDTelephonyCallCapabilities setDelegate:](v18->_telephonyCallCapabilities, "setDelegate:", v18);
    v23 = objc_alloc_init(&OBJC_CLASS___CSDThumperPushHandler);
    thumperPushHandler = v18->_thumperPushHandler;
    v18->_thumperPushHandler = v23;

    v25 = -[CSDPinExchangeController initWithDelegate:]( objc_alloc(&OBJC_CLASS___CSDPinExchangeController),  "initWithDelegate:",  v18->_thumperPushHandler);
    thumperPinExchangeController = v18->_thumperPinExchangeController;
    v18->_thumperPinExchangeController = v25;

    v27 = objc_alloc_init(&OBJC_CLASS___CSDThumperCapabilitiesMonitor);
    thumperCapabilitiesMonitor = v18->_thumperCapabilitiesMonitor;
    v18->_thumperCapabilitiesMonitor = v27;

    -[CSDThumperCapabilitiesMonitor setDataSource:](v18->_thumperCapabilitiesMonitor, "setDataSource:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v18 selector:"deviceListChanged:" name:@"CSDIDSDeviceListChangedNotification" object:v18->_relayService];

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v30 addObserver:v18 selector:"deviceCapabilityChanged:" name:FaceTimeDeviceCapabilityChangedNotification object:0];

    v31 = (dispatch_queue_s *)v12->_queue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000BD770;
    v33[3] = &unk_1003D7730;
    v34 = v18;
    dispatch_async(v31, v33);
  }

  return v12;
}

- (NSString)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@\n",  self));
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BD954;
  block[3] = &unk_1003D7758;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(v4, block);

  id v6 = v5;
  return (NSString *)v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities xpcListener](self, "xpcListener"));
  [v3 invalidate];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSDCallCapabilities;
  -[CSDCallCapabilities dealloc](&v5, "dealloc");
}

- (void)_updateClientsWithState
{
  id v3 = sub_1001704C4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Updating clients with new call capabilities state: %@",  buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  id v7 = [v6 copy];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 publiclyAccessibleCopy]);

  id v10 = sub_1001545BC(@"access-call-capabilities");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000BDC9C;
  v18[3] = &unk_1003D9628;
  id v20 = v9;
  id v21 = v11;
  id v19 = v7;
  id v13 = v9;
  id v14 = v7;
  id v15 = v11;
  v16 = NSStringFromSelector("capabilityStateUpdated:");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v12 performBlockOnClients:v18 coalescedByIdentifier:v17];
}

- (TUCallCapabilitiesState)callCapabilitiesState
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000BDDE8;
  id v11 = sub_1000BDDF8;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000BDE00;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUCallCapabilitiesState *)v4;
}

- (void)updatePairedHostDeviceCallCapabilitiesState:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BDED0;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)callCapabilitiesState:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 processName]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "TUCallCapabilitiesXPCServer - callCapabilitiesState request from %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_1000BDDE8;
  id v15 = sub_1000BDDF8;
  id v16 = 0LL;
  v10[5] = &buf;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000BE134;
  v11[3] = &unk_1003D7850;
  v11[4] = self;
  v11[5] = &buf;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BE184;
  v10[3] = &unk_1003D7850;
  v10[4] = self;
  sub_1001544C8(v6, @"access-call-capabilities", v11, v10, 0LL);
  v4[2](v4, *(void *)(*((void *)&buf + 1) + 40LL));
  _Block_object_dispose(&buf, 8);
}

- (void)setRelayCallingEnabled:(BOOL)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BE280;
  v7[3] = &unk_1003D7878;
  BOOL v8 = a3;
  v7[4] = self;
  sub_1001544C8( v6,  @"modify-call-capabilities",  v7,  0LL,  (uint64_t)"-[CSDCallCapabilities setRelayCallingEnabled:]");
}

- (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BE404;
  v10[3] = &unk_1003D7918;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1001544C8( v8,  @"modify-call-capabilities",  v10,  0LL,  (uint64_t)"-[CSDCallCapabilities setRelayCallingEnabled:forDeviceWithID:]");
}

- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BE598;
  v10[3] = &unk_1003D7918;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1001544C8( v8,  @"modify-call-capabilities",  v10,  0LL,  (uint64_t)"-[CSDCallCapabilities setWiFiCallingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BE72C;
  v10[3] = &unk_1003D7918;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1001544C8( v8,  @"modify-call-capabilities",  v10,  0LL,  (uint64_t)"-[CSDCallCapabilities setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BE8C0;
  v10[3] = &unk_1003D7918;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1001544C8( v8,  @"modify-call-capabilities",  v10,  0LL,  (uint64_t)"-[CSDCallCapabilities setVoLTECallingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BEA54;
  v10[3] = &unk_1003D7918;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1001544C8( v8,  @"modify-call-capabilities",  v10,  0LL,  (uint64_t)"-[CSDCallCapabilities setThumperCallingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentClient]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000BEC0C;
  v14[3] = &unk_1003D8FE0;
  BOOL v18 = a3;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v12 = v9;
  id v13 = v8;
  sub_1001544C8( v11,  @"modify-call-capabilities",  v14,  0LL,  (uint64_t)"-[CSDCallCapabilities setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:]");
}

- (void)setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BEDAC;
  v10[3] = &unk_1003D7918;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1001544C8( v8,  @"modify-call-capabilities",  v10,  0LL,  (uint64_t)"-[CSDCallCapabilities setThumperCallingAllowedOnDefaultPairedDevice:forSenderIdentityWithUUID:]");
}

- (void)endEmergencyCallbackMode
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentClient]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000BEF24;
  v6[3] = &unk_1003D7730;
  v6[4] = self;
  sub_1001544C8( v5,  @"modify-call-capabilities",  v6,  0LL,  (uint64_t)"-[CSDCallCapabilities endEmergencyCallbackMode]");
}

- (void)invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000BF068;
  v8[3] = &unk_1003D7758;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  sub_1001544C8( v6,  @"modify-call-capabilities",  v8,  0LL,  (uint64_t)"-[CSDCallCapabilities invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:]");
}

- (void)invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000BF1EC;
  v8[3] = &unk_1003D7758;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  sub_1001544C8( v6,  @"modify-call-capabilities",  v8,  0LL,  (uint64_t)"-[CSDCallCapabilities invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:]");
}

- (void)requestPinFromPrimaryDevice
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BF34C;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8( v4,  @"modify-call-capabilities",  v5,  0LL,  (uint64_t)"-[CSDCallCapabilities requestPinFromPrimaryDevice]");
}

- (void)cancelPinRequestFromPrimaryDevice
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BF600;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8( v4,  @"modify-call-capabilities",  v5,  0LL,  (uint64_t)"-[CSDCallCapabilities cancelPinRequestFromPrimaryDevice]");
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BF718;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BF7F0;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)deviceListChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received device list changed notification: %@",  buf,  0xCu);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BF930;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)deviceCapabilityChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received device capability changed notification: %@",  buf,  0xCu);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BFA38;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)accountsChanged
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received accounts changed delegate callback",  buf,  2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BFB14;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)faceTimeAvailabilityChanged
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received FaceTime availability changed delegate callback",  buf,  2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BFBD0;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)outgoingCallerIDChanged
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received outgoingCallerIDChanged delegate callback",  buf,  2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BFC8C;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)telephonyCallCapabilitiesChanged
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received telephonyCallCapabilitiesChanged delegate callback",  v6,  2u);
  }

  -[CSDCallCapabilities _updateDynamicCapabilitiesAndUpdateClients](self, "_updateDynamicCapabilitiesAndUpdateClients");
}

- (BOOL)isThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateForAccountID:]( self,  "thumperCallingCapabilitiesStateForAccountID:",  a4));
  id v8 = v7;
  if (v7)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "approvedSecondaryDeviceIDs", 0));
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if ((TUStringsAreCaseInsensitiveEqual(v6, *(void *)(*((void *)&v14 + 1) + 8LL * (void)i)) & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

- (void)addThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateByUUID]( self,  "thumperCallingCapabilitiesStateByUUID"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v19 allKeys]);
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    BOOL v18 = v6;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateByUUID]( self,  "thumperCallingCapabilitiesStateByUUID",  v18));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountID]);
        int v16 = TUStringsAreCaseInsensitiveEqual(v15, v7);

        if (v16)
        {
          __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000C0260;
          block[3] = &unk_1003D7828;
          void block[4] = self;
          id v6 = v18;
          id v22 = v18;
          uint64_t v23 = v12;
          dispatch_async(v17, block);

          goto LABEL_11;
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v6 = v18;
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)removeThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateByUUID]( self,  "thumperCallingCapabilitiesStateByUUID"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v18 allKeys]);
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        if (v6)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateByUUID]( self,  "thumperCallingCapabilitiesStateByUUID"));
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
          int v15 = TUStringsAreCaseInsensitiveEqual(v14, v6);

          if (v15)
          {
            __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472LL;
            v24[2] = sub_1000C04C0;
            v24[3] = &unk_1003D7828;
            v24[4] = self;
            id v25 = v19;
            uint64_t v26 = v11;
            dispatch_async(v17, v24);

            goto LABEL_12;
          }
        }

        else
        {
          int v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000C04D4;
          block[3] = &unk_1003D7828;
          void block[4] = self;
          id v22 = v19;
          uint64_t v23 = v11;
          dispatch_async(v16, block);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v8);
  }

- (NSArray)localThumperAccounts
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000BDDE8;
  uint64_t v11 = sub_1000BDDF8;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C05C8;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)secondaryThumperAccounts
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000BDDE8;
  uint64_t v11 = sub_1000BDDF8;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C06FC;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)secondaryThumperAccountForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_1000BDDE8;
  int v16 = sub_1000BDDF8;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C0858;
  block[3] = &unk_1003D9650;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)thumperCallingCapabilitiesStateForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateByUUID]( self,  "thumperCallingCapabilitiesStateByUUID"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    BOOL v18 = v5;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateByUUID]( self,  "thumperCallingCapabilitiesStateByUUID",  v18));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountID]);
        int v14 = TUStringsAreCaseInsensitiveEqual(v13, v4);

        if (v14)
        {
          int v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities thumperCallingCapabilitiesStateByUUID]( self,  "thumperCallingCapabilitiesStateByUUID"));
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v10]);

          goto LABEL_11;
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }

    int v15 = 0LL;
LABEL_11:
    id v5 = v18;
  }

  else
  {
    int v15 = 0LL;
  }

  return v15;
}

- (NSDictionary)thumperCallingCapabilitiesStateByUUID
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000BDDE8;
  uint64_t v11 = sub_1000BDDF8;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C0B48;
  v6[3] = &unk_1003D9288;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)updateState
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C0D14;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_updateState
{
}

- (void)_updateHostingAndDisplayingSupport
{
  BOOL v3 = -[CSDCallCapabilities _supportsPrimaryCalling](self, "_supportsPrimaryCalling");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v4 setSupportsPrimaryCalling:v3];

  BOOL v5 = -[CSDCallCapabilities _supportsBasebandCalling](self, "_supportsBasebandCalling");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v6 setSupportsBasebandCalling:v5];

  BOOL v7 = -[CSDCallCapabilities _supportsCellularData](self, "_supportsCellularData");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v8 setSupportsCellularData:v7];

  BOOL v9 = -[CSDCallCapabilities _supportsDisplayingTelephonyCalls](self, "_supportsDisplayingTelephonyCalls");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v10 setSupportsDisplayingTelephonyCalls:v9];

  BOOL v11 = -[CSDCallCapabilities _supportsDisplayingFaceTimeAudioCalls](self, "_supportsDisplayingFaceTimeAudioCalls");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v12 setSupportsDisplayingFaceTimeAudioCalls:v11];

  BOOL v13 = -[CSDCallCapabilities _supportsDisplayingFaceTimeVideoCalls](self, "_supportsDisplayingFaceTimeVideoCalls");
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v14 setSupportsDisplayingFaceTimeVideoCalls:v13];
}

- (unsigned)_defaultOverrideForDisableDefault:(id)a3 forceDefault:(id)a4
{
  BOOL v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  BOOL v7 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  if (CFPreferencesGetAppBooleanValue(v5, TUBundleIdentifierTelephonyUtilitiesFramework, &keyExistsAndHasValidFormat)) {
    BOOL v8 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    unsigned __int8 v9 = 0;
  }

  else
  {
    id v10 = sub_1001704C4();
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Disabling support because %@ was set to YES",  buf,  0xCu);
    }

    unsigned __int8 v9 = 2;
  }

  if (CFPreferencesGetAppBooleanValue(v6, v7, &keyExistsAndHasValidFormat)) {
    BOOL v13 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    id v14 = sub_1001704C4();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Enabling support because %@ was set to YES",  buf,  0xCu);
    }

    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)_supportsPrimaryCalling
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v4 = [v3 isTelephonyDevice];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1150;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  if (qword_10044CF98 != -1) {
    dispatch_once(&qword_10044CF98, block);
  }
  if (byte_10044CF90 == 2) {
    return 0;
  }
  if (byte_10044CF90 == 1) {
    return 1;
  }
  return v4;
}

- (BOOL)_supportsBasebandCalling
{
  char v3 = MGGetBoolAnswer(@"telephony");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1224;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  if (qword_10044CFA8 != -1) {
    dispatch_once(&qword_10044CFA8, block);
  }
  if (byte_10044CFA0 == 1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3;
  }
  return byte_10044CFA0 != 2 && v4;
}

- (BOOL)_supportsCellularData
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v4 = [v3 supportsCellularData];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1318;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  if (qword_10044CFB8 != -1) {
    dispatch_once(&qword_10044CFB8, block);
  }
  if (byte_10044CFB0 == 2) {
    return 0;
  }
  if (byte_10044CFB0 == 1) {
    return 1;
  }
  return v4;
}

- (BOOL)_supportsDisplayingTelephonyCalls
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C13C4;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  if (qword_10044CFC8 != -1) {
    dispatch_once(&qword_10044CFC8, block);
  }
  return byte_10044CFC0 != 2;
}

- (BOOL)_supportsDisplayingFaceTimeAudioCalls
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v4 = objc_msgSend(v3, "inProcess_isCallingSupported");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C14B8;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  if (qword_10044CFD8 != -1) {
    dispatch_once(&qword_10044CFD8, block);
  }
  if (byte_10044CFD0 == 2) {
    return 0;
  }
  if (byte_10044CFD0 == 1) {
    return 1;
  }
  return v4;
}

- (BOOL)_supportsDisplayingFaceTimeVideoCalls
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v4 = [v3 faceTimeSupported];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C15AC;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  if (qword_10044CFE8 != -1) {
    dispatch_once(&qword_10044CFE8, block);
  }
  if (byte_10044CFE0 == 2) {
    return 0;
  }
  if (byte_10044CFE0 == 1) {
    return 1;
  }
  return v4;
}

- (void)_updateCallAvailability
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities accountsController](self, "accountsController"));
  id v4 = [v3 isFaceTimeAudioAvailable];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v5 setFaceTimeAudioAvailable:v4];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities accountsController](self, "accountsController"));
  id v6 = [v8 isFaceTimeVideoAvailable];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v7 setFaceTimeVideoAvailable:v6];
}

- (void)_updateDynamicCapabilitiesAndUpdateClients
{
}

- (void)_updateCTCapabilities
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
  id v6 = [v5 areCapabilitiesValid];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v7 setCtCapabilitiesValid:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
  id v9 = [v8 isEmergencyCallbackModeEnabled];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v10 setEmergencyCallbackModeEnabled:v9];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
  id v12 = [v11 isEmergencyCallbackPossible];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v13 setEmergencyCallbackPossible:v12];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1CA4;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  if (qword_10044CFF8 != -1) {
    dispatch_once(&qword_10044CFF8, block);
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 senderIdentityCapabilitiesStateByUUID]);

  v51 = v15;
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v15 count]));
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v15 allKeys]);
  id v16 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v50 = *(void *)v54;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v54 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:v19]);
        id v21 = [v20 copy];

        if (byte_10044CFF0 == 1)
        {
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 wiFiCallingCapabilitiesState]);
          __int128 v23 = v22;
          uint64_t v24 = 1LL;
        }

        else
        {
          if (byte_10044CFF0 != 2) {
            goto LABEL_13;
          }
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 wiFiCallingCapabilitiesState]);
          __int128 v23 = v22;
          uint64_t v24 = 0LL;
        }

        [v22 setSupported:v24];

LABEL_13:
        if (byte_10044CFF1 == 1)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 voLTECallingCapabilitiesState]);
          uint64_t v26 = v25;
          uint64_t v27 = 1LL;
        }

        else
        {
          if (byte_10044CFF1 != 2) {
            goto LABEL_18;
          }
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 voLTECallingCapabilitiesState]);
          uint64_t v26 = v25;
          uint64_t v27 = 0LL;
        }

        [v25 setSupported:v27];

LABEL_18:
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v21 thumperCallingCapabilitiesState]);
        __int128 v29 = v28;
        if (byte_10044CFF2 == 2)
        {
          uint64_t v30 = 0LL;
          goto LABEL_22;
        }

        if (byte_10044CFF2 == 1)
        {
          uint64_t v30 = 1LL;
LABEL_22:
          [v28 setSupported:v30];
        }

        objc_msgSend( v29,  "setSupported:",  -[CSDCallCapabilities _supportsThumperCallingUsingSenderIdentityCapabilitiesState:]( self,  "_supportsThumperCallingUsingSenderIdentityCapabilitiesState:",  v21));
        objc_msgSend( v29,  "setApproved:",  -[CSDCallCapabilities _isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:]( self,  "_isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:",  v21));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
        unsigned __int8 v32 = [v31 isRelayCallingEnabled];
        if ((v32 & 1) == 0)
        {
          v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
          char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 defaultPairedDevice]);
          if (!v3)
          {
            [v29 setEnabled:0];
LABEL_32:

            goto LABEL_33;
          }
        }

        if ([v29 isSupported] && objc_msgSend(v29, "isApproved"))
        {
          id v33 = [v29 isEnabled];
          v34 = v29;
        }

        else
        {
          v34 = v29;
          id v33 = 0LL;
        }

        [v34 setEnabled:v33];
        if ((v32 & 1) == 0) {
          goto LABEL_32;
        }
LABEL_33:

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
        unsigned __int8 v36 = [v35 supportsBasebandCalling];

        if ((v36 & 1) == 0) {
          [v21 setSupportsSimultaneousVoiceAndData:1];
        }
        [v52 setObject:v21 forKeyedSubscript:v19];
      }

      id v17 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }

    while (v17);
  }

  objc_super v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v37 setSenderIdentityCapabilitiesStateByUUID:v52];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  unsigned int v40 = [v39 accountsSupportSecondaryCalling];

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities _primaryThumperAccountRequiringMatchingCallerID]( self,  "_primaryThumperAccountRequiringMatchingCallerID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v41 accountID]);

    id v42 = sub_1001704C4();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      v59 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Found primary Thumper account ID %@",  buf,  0xCu);
    }

    if (v38
      && !-[CSDCallCapabilities isThumperCallingSupportedForAccountID:]( self,  "isThumperCallingSupportedForAccountID:",  v38))
    {
      id v44 = sub_1001704C4();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        v59 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Thumper calling is not supported for account ID %@",  buf,  0xCu);
      }

      v38 = 0LL;
    }

    id v46 = sub_1001704C4();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      v59 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Setting associated Thumper account ID %@",  buf,  0xCu);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
    [v48 setThumperCallingAssociatedAccountID:v38];

LABEL_49:
  }
}

- (BOOL)isThumperCallingSupportedForAccountID:(id)a3
{
  id v4 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 senderIdentityCapabilitiesStateByUUID]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 senderIdentityCapabilitiesStateByUUID]);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v12]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 thumperCallingCapabilitiesState]);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountID]);
        LODWORD(v14) = TUStringsAreCaseInsensitiveEqual(v17, v4);

        if ((_DWORD)v14)
        {
          unsigned __int8 v18 = [v16 isSupported];

          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  unsigned __int8 v18 = 0;
LABEL_11:

  return v18;
}

- (void)_setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 senderIdentityCapabilitiesStateByUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 wiFiCallingCapabilitiesState]);
  unsigned int v11 = [v10 isEnabled];

  id v12 = sub_1001704C4();
  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setWiFiCallingEnabled: not updating value. Is currently %d and asked to set to %d",  (uint8_t *)&v15,  0xEu);
    }
  }

  else
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setWiFiCallingEnabled: asking to change value from %d to %d",  (uint8_t *)&v15,  0xEu);
    }

    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
    -[os_log_s setWiFiCallingEnabled:forSenderIdentityWithUUID:]( v13,  "setWiFiCallingEnabled:forSenderIdentityWithUUID:",  v4,  v6);
  }
}

- (void)_setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 senderIdentityCapabilitiesStateByUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 voLTECallingCapabilitiesState]);
  unsigned int v11 = [v10 isEnabled];

  id v12 = sub_1001704C4();
  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setVoLTECallingEnabled: not updating value. Is currently %d and asked to set to %d",  (uint8_t *)&v15,  0xEu);
    }
  }

  else
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setVoLTECallingEnabled: asking to change value from %d to %d",  (uint8_t *)&v15,  0xEu);
    }

    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
    -[os_log_s setVoLTECallingEnabled:forSenderIdentityWithUUID:]( v13,  "setVoLTECallingEnabled:forSenderIdentityWithUUID:",  v4,  v6);
  }
}

- (void)_setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 senderIdentityCapabilitiesStateByUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 wiFiCallingCapabilitiesState]);
  unsigned int v11 = [v10 isRoamingEnabled];

  id v12 = sub_1001704C4();
  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setWiFiCallingRoamingEnabled: not updating value. Is currently %d and asked to set to %d",  (uint8_t *)&v15,  0xEu);
    }
  }

  else
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setWiFiCallingRoamingEnabled: asking to change value from %d to %d",  (uint8_t *)&v15,  0xEu);
    }

    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
    -[os_log_s setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:]( v13,  "setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:",  v4,  v6);
  }
}

- (void)_setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 senderIdentityCapabilitiesStateByUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 thumperCallingCapabilitiesState]);
  unsigned int v11 = [v10 isEnabled];

  id v12 = sub_1001704C4();
  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setThumperCallingEnabled: not updating value. Is currently %d and asked to set to %d",  (uint8_t *)&v15,  0xEu);
    }
  }

  else
  {
    if (v14)
    {
      int v15 = 67109376;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_setThumperCallingEnabled: asking to change value from %d to %d",  (uint8_t *)&v15,  0xEu);
    }

    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
    -[os_log_s setThumperCallingEnabled:forSenderIdentityWithUUID:]( v13,  "setThumperCallingEnabled:forSenderIdentityWithUUID:",  v4,  v6);
  }
}

- (void)_setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 senderIdentityCapabilitiesStateByUUID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 thumperCallingCapabilitiesState]);

  if (!v13)
  {
    id v28 = sub_1001704C4();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)uint64_t v50 = v9;
    __int128 v29 = "[WARN] Could not find Thumper capabilities for sender identity UUID %@";
    uint64_t v30 = v17;
    uint32_t v31 = 12;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    goto LABEL_35;
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 approvedSecondaryDeviceIDs]);
  unsigned int v15 = [v14 containsObject:v8];

  if (v15 == v6)
  {
    id v32 = sub_1001704C4();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)__int128 buf = 67109634;
    *(_DWORD *)uint64_t v50 = v15;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v6;
    LOWORD(v51[0]) = 2112;
    *(void *)((char *)v51 + 2) = v8;
    __int128 v29 = "_setThumperCallingAllowed: not updating value. Is currently %d and asked to set to %d on secondary device ID %@";
    uint64_t v30 = v17;
    uint32_t v31 = 24;
    goto LABEL_19;
  }

  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
  __int16 v17 = v16;
  if (v6)
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
    if ([v44 length])
    {
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id v18 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s localThumperAccounts](v17, "localThumperAccounts"));
      id v19 = [v18 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v19)
      {
        id v20 = v19;
        unsigned int v40 = v15;
        int v41 = v6;
        id v42 = v9;
        id v43 = v8;
        id v21 = 0LL;
        uint64_t v22 = *(void *)v46;
LABEL_7:
        __int128 v23 = v18;
        uint64_t v24 = 0LL;
        id v25 = v21;
        while (1)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v23);
          }
          id v21 = *(id *)(*((void *)&v45 + 1) + 8LL * (void)v24);

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 accountID]);
          char v27 = TUStringsAreCaseInsensitiveEqual(v26, v44);

          if ((v27 & 1) != 0) {
            break;
          }
          uint64_t v24 = (char *)v24 + 1;
          id v25 = v21;
          if (v20 == v24)
          {
            id v18 = v23;
            id v20 = [v23 countByEnumeratingWithState:&v45 objects:v52 count:16];
            if (v20) {
              goto LABEL_7;
            }

            id v9 = v42;
            id v8 = v43;
            goto LABEL_14;
          }
        }

        id v18 = v23;

        id v9 = v42;
        id v8 = v43;
        if (!v21) {
          goto LABEL_26;
        }
        uint64_t v33 = (uint64_t)[v21 availableDeviceSlots];
        id v34 = sub_1001704C4();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (v33 < 1)
        {
          if (v36)
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not changing Thumper calling allowed value. No device slots remain for this device. Displaying noti fication to the user",  buf,  2u);
          }

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities thumperPinExchangeController](self, "thumperPinExchangeController"));
          [v39 displaySlotsFullNotification];
        }

        else
        {
          if (v36)
          {
            *(_DWORD *)__int128 buf = 67109634;
            *(_DWORD *)uint64_t v50 = v40;
            *(_WORD *)&v50[4] = 1024;
            *(_DWORD *)&v50[6] = v41;
            LOWORD(v51[0]) = 2112;
            *(void *)((char *)v51 + 2) = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Changing Thumper calling allowed value from %d to %d on secondary device ID %@",  buf,  0x18u);
          }

          -[os_log_s setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:]( v17,  "setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:",  1LL,  v43,  v42);
        }
      }

      else
      {
LABEL_14:

LABEL_26:
        id v37 = sub_1001704C4();
        id v21 = (id)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)uint64_t v50 = v8;
          *(_WORD *)&v50[8] = 2112;
          v51[0] = v17;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not set Thumper calling allowed for secondary device with identifier %@; unable to retrieve loc"
            "al Thumper account from call capabilities %@",
            buf,
            0x16u);
        }
      }
    }

    else
    {
      id v38 = sub_1001704C4();
      id v18 = (id)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)uint64_t v50 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not retrieve account ID from Thumper capabilities %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    -[os_log_s setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:]( v16,  "setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:",  0LL,  v8,  v9);
  }

- (void)_setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultPairedDevice]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultPairedDevice]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    -[CSDCallCapabilities _setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:]( self,  "_setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:",  v4,  v11,  v6);
  }

  else
  {
    id v12 = sub_1001704C4();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cloudCallingDevices]);
      int v16 = 138412290;
      __int16 v17 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] No cloud calling device appears to be a default paired device: %@. Ignoring setThumperCallingAllowedOnDef aultPairedDevice request",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (BOOL)_supportsThumperCallingUsingSenderIdentityCapabilitiesState:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  unsigned int v6 = [v5 supportsPrimaryCalling];

  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 senderIdentityUUID]);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 telephonySubscriptionLabelIdentifierForSenderIdentityUUID:v7]);

      if ([v9 length])
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 thumperCallingCapabilitiesState]);
        if ([v10 isSupported])
        {
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities thumperService](self, "thumperService"));
          LOBYTE(v12) = [v11 isServiceEnabledForTelephonySubscriptionLabelIdentifier:v9];
        }

        else
        {
          LOBYTE(v12) = 0;
        }
      }

      else
      {
        LOBYTE(v12) = 0;
      }
    }

    else
    {
      id v14 = sub_1001704C4();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not obtain UUID from sender identity capabilities state %@",  (uint8_t *)&v18,  0xCu);
      }

      LOBYTE(v12) = 0;
    }
  }

  else
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities _primaryThumperAccountRequiringMatchingCallerID]( self,  "_primaryThumperAccountRequiringMatchingCallerID"));
    LODWORD(v12) = v13 != 0LL;
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  unsigned __int8 v16 = [v15 supportsRelayCalling];

  return v16 & v12;
}

- (BOOL)_isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 thumperCallingCapabilitiesState]);
  unsigned __int8 v6 = [v5 isSupported];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  unsigned __int8 v8 = [v7 supportsPrimaryCalling];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities _primaryThumperAccountRequiringMatchingCallerID]( self,  "_primaryThumperAccountRequiringMatchingCallerID"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allowedSecondaryDeviceIDs]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 thumperCallingCapabilitiesState]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localDeviceID]);
    unsigned __int8 v6 = [v10 containsObject:v12];
  }

  return v6;
}

- (id)_primaryThumperAccountRequiringMatchingCallerID
{
  return -[CSDCallCapabilities _primaryThumperAccountRequiringMatchingCallerID:requiringAvailableDeviceSlots:]( self,  "_primaryThumperAccountRequiringMatchingCallerID:requiringAvailableDeviceSlots:",  1LL,  0LL);
}

- (id)_primaryThumperAccountRequiringAvailableDeviceSlots
{
  return -[CSDCallCapabilities _primaryThumperAccountRequiringMatchingCallerID:requiringAvailableDeviceSlots:]( self,  "_primaryThumperAccountRequiringMatchingCallerID:requiringAvailableDeviceSlots:",  0LL,  1LL);
}

- (id)_primaryThumperAccountRequiringMatchingCallerID:(BOOL)a3 requiringAvailableDeviceSlots:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities telephonyCallCapabilities](self, "telephonyCallCapabilities"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities thumperService](self, "thumperService"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 devices]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 outgoingRelayCallerID]);
  uint64_t v12 = TUCopyIDSCanonicalAddressForDestinationID();
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v7 primaryThumperAccountUsingDevices:v9 outgoingCallerIDURI:v13 requireMatchingCallerIDURI:v5 requireAvailableDeviceSlots:v4]);

  return v14;
}

- (void)_updateRelayCapabilities
{
  BOOL v4 = -[CSDCallCapabilities _supportsRelayCalling](self, "_supportsRelayCalling");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v5 setSupportsRelayCalling:v4];

  BOOL v6 = -[CSDCallCapabilities _accountsMatchForSecondaryCalling](self, "_accountsMatchForSecondaryCalling");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v7 setAccountsMatchForSecondaryCalling:v6];

  if (!-[CSDCallCapabilities _isWatchDevice](self, "_isWatchDevice"))
  {
    if (-[CSDCallCapabilities _isAudioAccessoryDevice](self, "_isAudioAccessoryDevice"))
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      id v19 = [v18 supportsRelayCalling];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      [v20 setRelayCallingEnabled:v19];

      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      [v21 setSupportsFaceTimeAudioRelayCalling:1];

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      [v22 setAccountsSupportSecondaryCalling:1];

      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      [v23 setRelayCallingFeaturesEnabled:1];
LABEL_21:

      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      id v43 = [v42 isRelayCallingEnabled];
      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      [v44 setRelayCallingAvailability:v43];

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      [v9 setSupportsFaceTimeVideoRelayCalling:0];
      goto LABEL_22;
    }

    BOOL v25 = -[CSDCallCapabilities _relayCallingEnabledDefault](self, "_relayCallingEnabledDefault");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    [v26 setRelayCallingEnabled:v25];

    char v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    [v27 setSupportsFaceTimeAudioRelayCalling:0];

    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    id v29 = [v28 accountsMatchForSecondaryCalling];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    [v30 setAccountsSupportSecondaryCalling:v29];

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    unsigned int v31 = [v23 supportsRelayCalling];
    if (v31)
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      if ([v30 accountsSupportSecondaryCalling])
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
        int v32 = 1;
        BOOL v33 = 1LL;
      }

      else
      {
        int v32 = 0;
      }
    }

    else
    {
      int v32 = 0;
    }

    BOOL v33 = -[CSDCallCapabilities _deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled]( self,  "_deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled");
LABEL_17:
    int v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    [v41 setRelayCallingFeaturesEnabled:v33];

    if (v32) {
    if (v31)
    }

    goto LABEL_21;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities relayService](self, "relayService"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultPairedDevice]);

  unsigned int v10 = [v9 isConnected];
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  uint64_t v12 = v11;
  if (v10)
  {
    [v11 setRelayCallingEnabled:1];

    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    [v13 setRelayCallingFeaturesEnabled:1];

    unsigned int v14 = [v9 isNearby];
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    unsigned __int8 v16 = v15;
    if (v14) {
      uint64_t v17 = 2LL;
    }
    else {
      uint64_t v17 = 1LL;
    }
  }

  else
  {
    [v11 setRelayCallingEnabled:0];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    [v24 setRelayCallingFeaturesEnabled:0];

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    unsigned __int8 v16 = v15;
    uint64_t v17 = 0LL;
  }

  [v15 setRelayCallingAvailability:v17];

  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities pairedHostDeviceState](self, "pairedHostDeviceState"));
  id v35 = [v34 isFaceTimeAudioAvailable];
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v36 setSupportsFaceTimeAudioRelayCalling:v35];

  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities pairedHostDeviceState](self, "pairedHostDeviceState"));
  id v38 = [v37 isFaceTimeVideoAvailable];
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v39 setSupportsFaceTimeVideoRelayCalling:v38];

  unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v40 setAccountsSupportSecondaryCalling:1];

LABEL_22:
  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v45 setSupportsTelephonyRelayCalling:1];

  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities _relayCallingDisabledForDeviceIDDefault]( self,  "_relayCallingDisabledForDeviceIDDefault"));
  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v47 setRelayCallingDisabledForDeviceID:v46];

  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities _outgoingCallerID](self, "_outgoingCallerID"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v49 setOutgoingRelayCallerID:v48];

  id v51 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities _cloudCallingDevices](self, "_cloudCallingDevices"));
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  [v50 setCloudCallingDevices:v51];
}

- (BOOL)_supportsRelayCalling
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities relayService](self, "relayService"));
  unsigned int v4 = [v3 defaultPairedDeviceExists];

  if (-[CSDCallCapabilities _isWatchDevice](self, "_isWatchDevice"))
  {
    id v5 = sub_1001704C4();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      unsigned int v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "defaultPairedDeviceExists: %d",  (uint8_t *)&v15,  8u);
    }
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
    if ([v7 supportsPrimaryCalling])
    {
      unsigned int v8 = 1;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities relayService](self, "relayService"));
      unsigned int v8 = [v9 telephonyCapableDeviceExists];
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities relayService](self, "relayService"));
    unsigned int v11 = [v10 relayCapableDeviceExists];

    id v12 = sub_1001704C4();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109632;
      unsigned int v16 = v8;
      __int16 v17 = 1024;
      unsigned int v18 = v11;
      __int16 v19 = 1024;
      unsigned int v20 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "telephonyDeviceExists: %d, relayCapableDeviceExists: %d, defaultPairedDeviceExists: %d",  (uint8_t *)&v15,  0x14u);
    }

    LOBYTE(v4) = v8 & v11 | v4;
  }

  return v4;
}

- (BOOL)_accountsMatchForSecondaryCalling
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities accountsController](self, "accountsController"));
  unsigned __int8 v3 = [v2 faceTimeIDMatchesAppleID];

  return v3;
}

- (id)_outgoingCallerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities accountsController](self, "accountsController"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 outgoingCallerID]);

  return v3;
}

- (id)_cloudCallingDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities relayService](self, "relayService"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9);
        unsigned int v11 = objc_alloc(&OBJC_CLASS___TUCloudCallingDevice);
        id v12 = -[TUCloudCallingDevice initWithIDSDevice:](v11, "initWithIDSDevice:", v10, (void)v15);
        [v4 addObject:v12];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingComparator:&stru_1003D9690]);
  return v13;
}

- (BOOL)_deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities relayService](self, "relayService", 0LL));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)i) supportsRelayCallingWithoutLocalRelayCallingEnabled])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)_relayCallingEnabledDefault
{
  return !CFPreferencesGetAppBooleanValue( @"relayCallingDisabled",  TUBundleIdentifierTelephonyUtilitiesFramework,  &keyExistsAndHasValidFormat)
      || keyExistsAndHasValidFormat == 0;
}

- (void)_setRelayCallingEnabledDefault:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_1001704C4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_setRelayCallingEnabledDefault: changing value to %d",  (uint8_t *)v8,  8u);
  }

  id v6 = (CFPropertyListRef *)&kCFBooleanFalse;
  if (!v3) {
    id v6 = (CFPropertyListRef *)&kCFBooleanTrue;
  }
  id v7 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  CFPreferencesSetAppValue(@"relayCallingDisabled", *v6, TUBundleIdentifierTelephonyUtilitiesFramework);
  CFPreferencesAppSynchronize(v7);
}

- (void)_setRelayCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  unsigned int v6 = [v5 isRelayCallingEnabled];

  id v7 = sub_1001704C4();
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 == v3)
  {
    if (v9)
    {
      *(_DWORD *)__int128 buf = 67109376;
      unsigned int v24 = v6;
      __int16 v25 = 1024;
      BOOL v26 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_setRelayCallingEnabled: Not updating value. Is currently %d and asked to set to %d",  buf,  0xEu);
    }
  }

  else
  {
    if (v9)
    {
      *(_DWORD *)__int128 buf = 67109376;
      unsigned int v24 = v6;
      __int16 v25 = 1024;
      BOOL v26 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_setRelayCallingEnabled: Changing value from %d to %d",  buf,  0xEu);
    }

    -[CSDCallCapabilities _setRelayCallingEnabledDefault:](self, "_setRelayCallingEnabledDefault:", v3);
    if (!v3)
    {
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 senderIdentityCapabilitiesStateByUUID]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          __int128 v17 = 0LL;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            -[CSDCallCapabilities _setThumperCallingEnabled:forSenderIdentityWithUUID:]( self,  "_setThumperCallingEnabled:forSenderIdentityWithUUID:",  0LL,  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v17),  (void)v18);
            __int128 v17 = (char *)v17 + 1;
          }

          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v15);
      }
    }

    -[CSDCallCapabilities _updateDynamicCapabilitiesAndUpdateClients]( self,  "_updateDynamicCapabilitiesAndUpdateClients",  (void)v18);
  }

- (id)_relayCallingDisabledForDeviceIDDefault
{
  return (id)(id)CFPreferencesCopyAppValue( @"relayCallingDisabledForDeviceID",  TUBundleIdentifierTelephonyUtilitiesFramework);
}

- (void)_setRelayCallingEnabledDefault:(BOOL)a3 forDeviceWithID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = v4;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "setRelayCallingEnabledDefault:forDeviceWithID: changing value to %d for %@",  (uint8_t *)v16,  0x12u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallCapabilities _relayCallingDisabledForDeviceIDDefault]( self,  "_relayCallingDisabledForDeviceIDDefault"));
  id v10 = [v9 mutableCopy];
  __int128 v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v13 = v12;

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", !v4));
  [v13 setObject:v14 forKeyedSubscript:v6];

  id v15 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  CFPreferencesSetAppValue(@"relayCallingDisabledForDeviceID", v13, TUBundleIdentifierTelephonyUtilitiesFramework);
  CFPreferencesAppSynchronize(v15);
}

- (void)_setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 relayCallingDisabledForDeviceID]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  unsigned int v10 = [v9 BOOLValue];

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10 == v4)
  {
    if (v13)
    {
      *(_DWORD *)__int128 buf = 67109634;
      int v28 = v10 ^ 1;
      __int16 v29 = 1024;
      BOOL v30 = v4;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "_setRelayCallingEnabled:forDeviceWithID: Changing value from %d to %d for %@",  buf,  0x18u);
    }

    -[CSDCallCapabilities _setRelayCallingEnabledDefault:forDeviceWithID:]( self,  "_setRelayCallingEnabledDefault:forDeviceWithID:",  v4,  v6);
    if (!v4)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 senderIdentityCapabilitiesStateByUUID]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeys]);

      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v23;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v17);
            }
            -[CSDCallCapabilities _setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:]( self,  "_setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:",  0LL,  v6,  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i),  (void)v22);
          }

          id v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }

        while (v19);
      }
    }

    -[CSDCallCapabilities _updateDynamicCapabilitiesAndUpdateClients]( self,  "_updateDynamicCapabilitiesAndUpdateClients",  (void)v22);
  }

  else
  {
    if (v13)
    {
      *(_DWORD *)__int128 buf = 67109634;
      int v28 = v10 ^ 1;
      __int16 v29 = 1024;
      BOOL v30 = v4;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "_setRelayCallingEnabled:forDeviceWithID: Not updating value. Is currently %d and asked to set to %d for %@",  buf,  0x18u);
    }
  }
}

- (BOOL)_isWatchDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  BOOL v3 = [v2 deviceType] == (id)6;

  return v3;
}

- (BOOL)_isAudioAccessoryDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  BOOL v3 = [v2 deviceType] == (id)7;

  return v3;
}

- (void)_updateDefaultAppIfNecessary
{
  if (supportsDefaultAppRelayTelephonySetting(self, a2))
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state", 0LL));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 senderIdentityCapabilitiesStateByUUID]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities state](self, "state"));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 senderIdentityCapabilitiesStateByUUID]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 thumperCallingCapabilitiesState]);
          unsigned __int8 v14 = [v13 isEnabled];

          if ((v14 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (void)_initializePairedHostDeviceState
{
  if (!-[CSDCallCapabilities _isWatchDevice](self, "_isWatchDevice")) {
    return;
  }
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"pairedHostDeviceState", TUBundleIdentifierTelephonyUtilitiesFramework);
  if (!v4)
  {
    id v13 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No saved paired host device state found",  (uint8_t *)&v23,  2u);
    }

    goto LABEL_15;
  }

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v3);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = -[CSDMessagingCallCapabilitiesState initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallCapabilitiesState),  "initWithData:",  v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s state](v6, "state"));
    -[CSDCallCapabilities setPairedHostDeviceState:](self, "setPairedHostDeviceState:", v7);

    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities pairedHostDeviceState](self, "pairedHostDeviceState"));
    id v9 = sub_1001704C4();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities pairedHostDeviceState](self, "pairedHostDeviceState"));
        int v23 = 138412290;
        id v24 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Initialized pairedHostDeviceState: %@",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_14;
    }

    if (!v11)
    {
LABEL_14:

      goto LABEL_15;
    }

    int v23 = 138412290;
    id v24 = v4;
    unsigned __int8 v16 = "[WARN] Could not de-serialize pairedHostDeviceStateData %@";
    uint64_t v17 = v10;
    uint32_t v18 = 12;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, v18);
    goto LABEL_14;
  }

  id v14 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    id v24 = (id)objc_opt_class(v4, v15);
    __int16 v25 = 2112;
    BOOL v26 = v4;
    unsigned int v10 = (os_log_s *)v24;
    unsigned __int8 v16 = "[WARN] Saved pairedHostDeviceStateData was not an NSData type (class=%@): %@";
    uint64_t v17 = v6;
    uint32_t v18 = 22;
    goto LABEL_13;
  }

- (void)_savePairedHostDeviceState
{
  if (-[CSDCallCapabilities _isWatchDevice](self, "_isWatchDevice"))
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___CSDMessagingCallCapabilitiesState);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallCapabilities pairedHostDeviceState](self, "pairedHostDeviceState"));
    uint64_t v7 = -[CSDMessagingCallCapabilitiesState initWithCallCapabilitiesState:](v3, "initWithCallCapabilitiesState:", v4);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallCapabilitiesState data](v7, "data"));
    id v6 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
    CFPreferencesSetAppValue(@"pairedHostDeviceState", v5, TUBundleIdentifierTelephonyUtilitiesFramework);
    CFPreferencesAppSynchronize(v6);
  }

- (BOOL)_supportslaunchingInCallApplicationForIncomingCall
{
  BOOL v3 = !-[CSDCallCapabilities _isAudioAccessoryDevice](self, "_isAudioAccessoryDevice")
    && !-[CSDCallCapabilities _isWatchDevice](self, "_isWatchDevice");
  id v4 = sub_1001704C4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_supportslaunchingInCallApplicationForIncomingCall: %d",  (uint8_t *)v7,  8u);
  }

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (CSDProcessObserverProtocol)processObserver
{
  return self->_processObserver;
}

- (CSDAccountsController)accountsController
{
  return self->_accountsController;
}

- (CSDTelephonyCallCapabilities)telephonyCallCapabilities
{
  return self->_telephonyCallCapabilities;
}

- (CSDThumperPushHandler)thumperPushHandler
{
  return self->_thumperPushHandler;
}

- (CSDPinExchangeController)thumperPinExchangeController
{
  return self->_thumperPinExchangeController;
}

- (CSDThumperCapabilitiesMonitor)thumperCapabilitiesMonitor
{
  return self->_thumperCapabilitiesMonitor;
}

- (CSDIDSService)relayService
{
  return self->_relayService;
}

- (CSDIDSService)thumperService
{
  return self->_thumperService;
}

- (TUCallCapabilitiesState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (TUCallCapabilitiesState)pairedHostDeviceState
{
  return self->_pairedHostDeviceState;
}

- (void)setPairedHostDeviceState:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
}

@end