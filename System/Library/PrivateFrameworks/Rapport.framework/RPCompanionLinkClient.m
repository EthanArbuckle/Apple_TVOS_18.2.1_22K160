@interface RPCompanionLinkClient
+ (BOOL)supportsSecureCoding;
- (BOOL)encodeSensitiveProperties;
- (BOOL)reactivateCalled;
- (BOOL)shouldReportDevice:(id)a3 toXPCConnectionWithLaunchInstanceID:(id)a4 outReason:(id *)a5;
- (BOOL)targetUserSession;
- (BOOL)usingOnDemandConnection;
- (NSArray)activeDevices;
- (NSArray)allowedMACAddresses;
- (NSArray)deviceFilter;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSDictionary)siriInfo;
- (NSString)appID;
- (NSString)cloudServiceID;
- (NSString)password;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkClient)init;
- (RPCompanionLinkClient)initWithCoder:(id)a3;
- (RPCompanionLinkClient)initWithUserProvider:(id)a3;
- (RPCompanionLinkDevice)activePersonalCompanion;
- (RPCompanionLinkDevice)destinationDevice;
- (RPCompanionLinkDevice)localDevice;
- (double)awdlGuestDiscoveryTimeout;
- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (id)_clientError:(id)a3;
- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7;
- (id)_ensureXPCStarted;
- (id)activateAssertionID:(id)a3 destinationID:(id)a4 options:(id)a5 completion:(id)a6;
- (id)authCompletionHandler;
- (id)description;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)disconnectHandler;
- (id)errorFlagsChangedHandler;
- (id)eventIDRegistrationCompletion;
- (id)hidePasswordHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)localDeviceUpdatedHandler;
- (id)promptForPasswordHandler;
- (id)requestIDRegistrationCompletion;
- (id)showPasswordHandler;
- (id)stateUpdatedHandler;
- (int)passwordType;
- (int)passwordTypeActual;
- (int64_t)bleClientUseCase;
- (int64_t)bleScreenOffRescanInterval;
- (int64_t)rssiThreshold;
- (unint64_t)controlFlags;
- (unint64_t)errorFlags;
- (unsigned)bleScreenOffScanRate;
- (unsigned)clientID;
- (unsigned)flags;
- (unsigned)internalAuthFlags;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (unsigned)useCase;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidateAssertion:(id)a3;
- (void)_invalidated;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_lostAllDevices;
- (void)_registerEventID:(id)a3 options:(id)a4 reregister:(BOOL)a5;
- (void)_registerProfileID:(id)a3 reregister:(BOOL)a4 completion:(id)a5;
- (void)_registerRequestID:(id)a3 options:(id)a4 reregister:(BOOL)a5;
- (void)_registerRequestIDOnQueue:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_reregisterAssertions;
- (void)_reregisterEvents;
- (void)_reregisterProfileIDs;
- (void)_reregisterRequests;
- (void)_startNWActivity:(unsigned int)a3 options:(id)a4 result:(id)a5;
- (void)activateWithCompletion:(id)a3;
- (void)companionLinkAuthCompleted:(id)a3;
- (void)companionLinkChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)companionLinkFoundDevice:(id)a3;
- (void)companionLinkHandleDisconnect;
- (void)companionLinkLocalDeviceUpdated:(id)a3;
- (void)companionLinkLostDevice:(id)a3;
- (void)companionLinkPromptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5;
- (void)companionLinkReceivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)companionLinkReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)companionLinkUpdateClientState:(id)a3;
- (void)companionLinkUpdateErrorFlags:(unint64_t)a3;
- (void)createDeviceToEndpointMappingForDevice:(id)a3 completion:(id)a4;
- (void)deregisterEventID:(id)a3;
- (void)deregisterProfileID:(id)a3 completion:(id)a4;
- (void)deregisterRequestID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)launchAppWithBundleID:(id)a3 destinationID:(id)a4 completion:(id)a5;
- (void)launchAppWithURL:(id)a3 destinationID:(id)a4 completion:(id)a5;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerProfileID:(id)a3 completion:(id)a4;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)removeLocalDeviceAsContextCollectorWithCompletion:(id)a3;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAwdlGuestDiscoveryTimeout:(double)a3;
- (void)setBleClientUseCase:(int64_t)a3;
- (void)setBleScreenOffRescanInterval:(int64_t)a3;
- (void)setBleScreenOffScanRate:(unsigned int)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setCloudServiceID:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDestinationDevice:(id)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFilter:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEncodeSensitiveProperties:(BOOL)a3;
- (void)setErrorFlags:(unint64_t)a3;
- (void)setErrorFlagsChangedHandler:(id)a3;
- (void)setEventIDRegistrationCompletion:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocalDevice:(id)a3;
- (void)setLocalDeviceAsContextCollectorWithCompletion:(id)a3;
- (void)setLocalDeviceUpdatedHandler:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setReactivateCalled:(BOOL)a3;
- (void)setRequestIDRegistrationCompletion:(id)a3;
- (void)setRssiThreshold:(int64_t)a3;
- (void)setServiceType:(id)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)setSiriInfo:(id)a3;
- (void)setStateUpdatedHandler:(id)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUsingOnDemandConnection:(BOOL)a3;
- (void)triggerEnhancedDiscoveryForReason:(id)a3 completion:(id)a4;
- (void)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 completion:(id)a5;
- (void)tryPassword:(id)a3;
@end

@implementation RPCompanionLinkClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPCompanionLinkClient)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___RPSignedInUserProvider);
  v4 = -[RPCompanionLinkClient initWithUserProvider:](self, "initWithUserProvider:", v3);

  return v4;
}

- (RPCompanionLinkClient)initWithUserProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RPCompanionLinkClient;
  v6 = -[RPCompanionLinkClient init](&v11, sel_init);
  if (v6)
  {
    if (gRPCompanionLinkClientIDOnce != -1) {
      dispatch_once(&gRPCompanionLinkClientIDOnce, &__block_literal_global_3);
    }
    do
    {
      unsigned int v7 = __ldaxr((unsigned int *)&gRPCompanionLinkClientIDNext);
      unsigned int v8 = v7 + 1;
    }

    while (__stlxr(v8, (unsigned int *)&gRPCompanionLinkClientIDNext));
    v6->_clientID = v8;
    v6->_controlFlags = 36LL;
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1895F8AE0]);
    objc_storeStrong((id *)&v6->_userProvider, a3);
    v9 = v6;
  }

  return v6;
}

uint64_t __46__RPCompanionLinkClient_initWithUserProvider___block_invoke()
{
  uint64_t result = RandomBytes();
  gRPCompanionLinkClientIDNext = (unsigned __int16)word_18C4C0C5A << 16;
  return result;
}

- (RPCompanionLinkClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___RPCompanionLinkClient;
  id v5 = -[RPCompanionLinkClient init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    if ([v8 containsValueForKey:@"agdt"])
    {
      [v8 decodeDoubleForKey:@"agdt"];
      v6->_awdlGuestDiscoveryTimeout = v9;
    }

    id v10 = v8;
    id v11 = v10;

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSDecodeNSArrayOfClassIfPresent();

    id v15 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v17 = v16;
    id v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v20 = v19;
    id v21 = v20;

    id v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v23 = v22;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    id v24 = v23;
    v25 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v26 = a3;
  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses) {
    [v26 encodeObject:allowedMACAddresses forKey:@"MAcAddrs"];
  }
  appID = self->_appID;
  if (appID) {
    [v26 encodeObject:appID forKey:@"appID"];
  }
  if (self->_awdlGuestDiscoveryTimeout != 0.0) {
    objc_msgSend(v26, "encodeDouble:forKey:", @"agdt");
  }
  int64_t bleClientUseCase = self->_bleClientUseCase;
  if (bleClientUseCase) {
    [v26 encodeInteger:bleClientUseCase forKey:@"bleCUC"];
  }
  int64_t bleScreenOffRescanInterval = self->_bleScreenOffRescanInterval;
  if (bleScreenOffRescanInterval) {
    [v26 encodeInteger:bleScreenOffRescanInterval forKey:@"bleScnOffIntvl"];
  }
  uint64_t bleScreenOffScanRate = self->_bleScreenOffScanRate;
  if ((_DWORD)bleScreenOffScanRate) {
    [v26 encodeInt64:bleScreenOffScanRate forKey:@"bleScnOffScnRt"];
  }
  uint64_t clientID = self->_clientID;
  if ((_DWORD)clientID) {
    [v26 encodeInt64:clientID forKey:@"cid"];
  }
  cloudServiceID = self->_cloudServiceID;
  if (cloudServiceID) {
    [v26 encodeObject:cloudServiceID forKey:@"clSI"];
  }
  unint64_t controlFlags = self->_controlFlags;
  if (controlFlags) {
    [v26 encodeInt64:controlFlags forKey:@"cFl"];
  }
  -[RPEndpoint identifier](self->_destinationDevice, "identifier");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[RPCompanionLinkDevice publicIdentifier](self->_destinationDevice, "publicIdentifier"),
        (id v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [v26 encodeObject:v12 forKey:@"ddID"];
  }

  deviceFilter = self->_deviceFilter;
  if (deviceFilter) {
    [v26 encodeObject:deviceFilter forKey:@"dFtr"];
  }
  v14 = -[RPEndpoint ipAddress](self->_destinationDevice, "ipAddress");
  if (v14) {
    [v26 encodeObject:v14 forKey:@"ddIP"];
  }

  if (self->_encodeSensitiveProperties) {
    [v26 encodeBool:1 forKey:@"esp"];
  }
  uint64_t flags = self->_flags;
  id v16 = v26;
  if ((_DWORD)flags)
  {
    [v26 encodeInt64:flags forKey:@"flags"];
    id v16 = v26;
  }

  uint64_t internalAuthFlags = self->_internalAuthFlags;
  if ((_DWORD)internalAuthFlags)
  {
    [v26 encodeInt64:internalAuthFlags forKey:@"iaf"];
    id v16 = v26;
  }

  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    [v26 encodeObject:pairingInfo forKey:@"pairI"];
    id v16 = v26;
  }

  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    [v26 encodeObject:pairSetupACL forKey:@"acl"];
    id v16 = v26;
  }

  password = self->_password;
  if (password)
  {
    [v26 encodeObject:password forKey:@"pw"];
    id v16 = v26;
  }

  uint64_t passwordType = self->_passwordType;
  if ((_DWORD)passwordType)
  {
    [v26 encodeInteger:passwordType forKey:@"pwTy"];
    id v16 = v26;
  }

  if (self->_reactivateCalled)
  {
    [v26 encodeBool:1 forKey:@"reAcC"];
    id v16 = v26;
  }

  int64_t rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold)
  {
    [v26 encodeInteger:rssiThreshold forKey:@"rssiTh"];
    id v16 = v26;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v26 encodeObject:serviceType forKey:@"st"];
    id v16 = v26;
  }

  siriInfo = self->_siriInfo;
  if (siriInfo)
  {
    [v26 encodeObject:siriInfo forKey:@"siriInfo"];
    id v16 = v26;
  }

  uint64_t useCase = self->_useCase;
  if ((_DWORD)useCase)
  {
    [v26 encodeInt64:useCase forKey:@"useCase"];
    id v16 = v26;
  }

  if (self->_usingOnDemandConnection)
  {
    [v26 encodeBool:1 forKey:@"uOnd"];
    id v16 = v26;
  }
}

- (id)description
{
  unint64_t controlFlags = self->_controlFlags;
  uint64_t flags = self->_flags;
  int64_t clientID = self->_clientID;
  NSAppendPrintF();
  id v3 = 0LL;
  id v4 = v3;
  appID = self->_appID;
  if (appID)
  {
    v36 = v3;
    int64_t clientID = appID;
    NSAppendPrintF();
    id v6 = v36;

    id v4 = v6;
  }

  if (self->_bleClientUseCase)
  {
    int64_t clientID = self->_bleClientUseCase;
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }

  if (self->_useCase)
  {
    int64_t clientID = self->_useCase;
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }

  cloudServiceID = self->_cloudServiceID;
  if (cloudServiceID)
  {
    int64_t clientID = cloudServiceID;
    NSAppendPrintF();
    id v10 = v4;

    id v4 = v10;
  }

  if (self->_rssiThreshold)
  {
    int64_t clientID = self->_rssiThreshold;
    NSAppendPrintF();
    id v11 = v4;

    id v4 = v11;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    int64_t clientID = serviceType;
    NSAppendPrintF();
    id v13 = v4;

    id v4 = v13;
  }

  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses)
  {
    id v15 = allowedMACAddresses;
    -[NSArray count](v15, "count", clientID, flags, &unk_1873E6372, controlFlags, &unk_1873E641A);
    NSAppendPrintF();
    id v16 = v4;

    id v4 = v16;
  }

  if (self->_passwordType)
  {
    NSAppendPrintF();
    id v17 = v4;

    id v4 = v17;
  }

  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    id v19 = pairingInfo;
    -[NSData length](v19, "length");
    NSAppendPrintF();
    id v20 = v4;

    id v4 = v20;
  }

  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    v32 = pairSetupACL;
    NSAppendPrintF();
    id v22 = v4;

    id v4 = v22;
  }

  if (self->_usingOnDemandConnection)
  {
    NSAppendPrintF();
    id v23 = v4;

    id v4 = v23;
  }

  NSAppendPrintF();
  id v24 = v4;

  if (self->_bleScreenOffRescanInterval)
  {
    NSAppendPrintF();
    id v25 = v24;

    id v24 = v25;
  }

  if (self->_bleScreenOffScanRate)
  {
    NSAppendPrintF();
    id v27 = v24;

    id v24 = v27;
  }

  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
  {
    v33 = deviceFilter;
    NSAppendPrintF();
    id v29 = v24;

    id v24 = v29;
  }

  return v24;
}

- (void)setBleScreenOffRescanInterval:(int64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __55__RPCompanionLinkClient_setBleScreenOffRescanInterval___block_invoke;
  v3[3] = &unk_18A0322F0;
  v3[4] = self;
  v3[5] = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __55__RPCompanionLinkClient_setBleScreenOffRescanInterval___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24LL) = *(void *)(result + 40);
  return result;
}

- (void)setBleScreenOffScanRate:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __49__RPCompanionLinkClient_setBleScreenOffScanRate___block_invoke;
  v3[3] = &unk_18A032318;
  v3[4] = self;
  unsigned int v4 = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __49__RPCompanionLinkClient_setBleScreenOffScanRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32LL) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setControlFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__RPCompanionLinkClient_setControlFlags___block_invoke;
  v3[3] = &unk_18A0322F0;
  v3[4] = self;
  void v3[5] = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __41__RPCompanionLinkClient_setControlFlags___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 248LL) = *(void *)(result + 40);
  return result;
}

- (void)setDeviceFilter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__RPCompanionLinkClient_setDeviceFilter___block_invoke;
  v6[3] = &unk_18A031AE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);
}

void __41__RPCompanionLinkClient_setDeviceFilter___block_invoke(uint64_t a1)
{
}

- (void)setSiriInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __37__RPCompanionLinkClient_setSiriInfo___block_invoke;
  v6[3] = &unk_18A031AE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);
}

void __37__RPCompanionLinkClient_setSiriInfo___block_invoke(uint64_t a1)
{
}

- (void)setServiceType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __40__RPCompanionLinkClient_setServiceType___block_invoke;
  v6[3] = &unk_18A031AE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);
}

void __40__RPCompanionLinkClient_setServiceType___block_invoke(uint64_t a1)
{
}

- (void)setUseCase:(unsigned int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __36__RPCompanionLinkClient_setUseCase___block_invoke;
  v3[3] = &unk_18A032318;
  v3[4] = self;
  unsigned int v4 = a3;
  -[RPCompanionLinkClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __36__RPCompanionLinkClient_setUseCase___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 104LL) = *(_DWORD *)(result + 40);
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __48__RPCompanionLinkClient_activateWithCompletion___block_invoke;
  v8[3] = &unk_18A031B60;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __48__RPCompanionLinkClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 168))
  {
    *(_DWORD *)(v1 + 136) |= 8u;
    uint64_t v1 = *(void *)(a1 + 32);
  }

  if (*(void *)(v1 + 184))
  {
    *(_DWORD *)(v1 + 136) |= 1u;
    uint64_t v1 = *(void *)(a1 + 32);
  }

  if (*(void *)(v1 + 192))
  {
    *(_DWORD *)(v1 + 136) |= 2u;
    uint64_t v1 = *(void *)(a1 + 32);
  }

  if (*(void *)(v1 + 200))
  {
    *(_DWORD *)(v1 + 136) |= 4u;
    uint64_t v1 = *(void *)(a1 + 32);
  }

  return [(id)v1 _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      if (self->_targetUserSession) {
        id v7 = (RPCompanionLinkClient *)@"(TargetUserSession)";
      }
      else {
        id v7 = self;
      }
      v14 = v7;
      LogPrintF();
    }

    self->_reactivateCalled = 1;
  }

  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    if (self->_targetUserSession) {
      id v8 = (RPCompanionLinkClient *)@"(TargetUserSession)";
    }
    else {
      id v8 = self;
    }
    v14 = v8;
    LogPrintF();
  }

  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v14);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v6) {
      v6[2](v6, v9);
    }
  }

  else
  {
    daemonCnx = self->_daemonCnx;
    uint64_t v11 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke;
    v18[3] = &unk_18A032340;
    v18[4] = self;
    BOOL v20 = v4;
    id v12 = v6;
    id v19 = v12;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v18);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472LL;
    v15[2] = __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke_2;
    v15[3] = &unk_18A032368;
    v15[4] = self;
    BOOL v17 = v4;
    id v16 = v12;
    [v13 companionLinkActivateClient:self completion:v15];
  }
}

void __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }

  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = v7;
    if (v5) {
      goto LABEL_7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

void __60__RPCompanionLinkClient__activateWithCompletion_reactivate___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v19 = a2;
  id v18 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_clientError:");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v6 = v19;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v10 identifier];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11
            || ([v10 publicIdentifier], (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (!*(void *)(*(void *)(a1 + 32) + 48LL))
            {
              id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
              uint64_t v13 = *(void *)(a1 + 32);
              v14 = *(void **)(v13 + 48);
              *(void *)(v13 + 48) = v12;
            }

            id v15 = (void *)MEMORY[0x1895A45CC]();
            if ((*(_BYTE *)(*(void *)(a1 + 32) + 254LL) & 4) == 0) {
              [v10 setSiriInfo:0];
            }
            objc_autoreleasePoolPop(v15);
            [*(id *)(*(void *)(a1 + 32) + 48) setObject:v10 forKeyedSubscript:v11];
          }
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v7);
    }

    objc_sync_exit(obj);
    if (*(_BYTE *)(a1 + 48))
    {
    }

    else if (gLogCategory_CLinkClient > 30 {
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_37;
    }

    LogPrintF();
    goto LABEL_37;
  }

  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())) {
LABEL_26:
    }
      LogPrintF();
  }

  else if (gLogCategory_CLinkClient <= 60 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_26;
  }

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  int v5 = (objc_class *)MEMORY[0x189607B30];
  id v6 = a3;
  uint64_t v7 = (void *)[[v5 alloc] initWithMachServiceName:v6 options:a4];

  return v7;
}

- (id)_clientError:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if ([v4 code] == 4099)
    {
      id v6 = v5;
      if (self->_invalidateCalled)
      {
        RPErrorF();
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v12 = a5;
  id v32 = a7;
  id v31 = a6;
  id v34 = a4;
  id v30 = a3;
  -[RPCompanionLinkClient _XPCConnectionWithMachServiceName:options:]( self,  "_XPCConnectionWithMachServiceName:options:",  @"com.apple.CompanionLink",  0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  __int128 v22 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D7EE8];
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 setClasses:v22 forSelector:sel_companionLinkReceivedEventID_event_options_ argumentIndex:1 ofReply:0];
  [v23 setClasses:v22 forSelector:sel_companionLinkReceivedRequestID_request_options_responseHandler_ argumentIndex:1 ofReply:0];
  [v23 setClasses:v22 forSelector:sel_companionLinkReceivedRequestID_request_options_responseHandler_ argumentIndex:0 ofReply:1];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5C20];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v26 = objc_opt_class();
  id v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  [v24 setClasses:v27 forSelector:sel_companionLinkActivateClient_completion_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v22 forSelector:sel_companionLinkSendEventID_event_destinationID_options_nwActivityToken_completion_ argumentIndex:1 ofReply:0];
  [v24 setClasses:v22 forSelector:sel_companionLinkSendRequestID_request_destinationID_options_nwActivityToken_responseHandler_ argumentIndex:1 ofReply:0];
  [v24 setClasses:v22 forSelector:sel_companionLinkSendRequestID_request_destinationID_options_nwActivityToken_responseHandler_ argumentIndex:0 ofReply:1];
  [v13 setExportedInterface:v23];
  [v13 setExportedObject:v30];

  [v13 setInterruptionHandler:v31];
  [v13 setInvalidationHandler:v32];

  [v13 setRemoteObjectInterface:v24];
  [v13 _setQueue:v34];

  if (self->_targetUserSession
    && [v12 supportsMultipleUsers]
    && [v12 signedInUserID])
  {
    objc_msgSend(v13, "_setTargetUserIdentifier:", objc_msgSend(v12, "signedInUserID"));
  }

  [v13 resume];
  uint64_t v28 = -[RPCompanionLinkClientDaemonConnection_XPC initWithConnection:]( objc_alloc(&OBJC_CLASS___RPCompanionLinkClientDaemonConnection_XPC),  "initWithConnection:",  v13);

  return v28;
}

- (id)_ensureXPCStarted
{
  if (!self->_daemonCnx)
  {
    if (self->_invalidateCalled)
    {
      RPErrorF();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }

    uint64_t v4 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke;
    v14[3] = &unk_18A031A30;
    v14[4] = self;
    int v5 = (void *)MEMORY[0x1895A4770](v14, a2);
    v13[0] = v4;
    v13[1] = 3221225472LL;
    v13[2] = __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_18A031A30;
    v13[4] = self;
    id v6 = (void *)MEMORY[0x1895A4770](v13);
    if (-[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
      && self->_targetUserSession)
    {
      unsigned int v7 = -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID");
      if (!v7)
      {
        if (gLogCategory_CLinkClient <= 50
          && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        RPErrorF();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }

      if (gLogCategory_CLinkClient <= 30)
      {
        unsigned int v8 = v7;
        if (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize())
        {
          uint64_t v12 = v8;
          LogPrintF();
        }
      }
    }

    -[RPCompanionLinkClient _connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:]( self,  "_connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:",  self,  self->_dispatchQueue,  self->_userProvider,  v5,  v6,  v12);
    id v9 = (RPDaemonConnection *)objc_claimAutoreleasedReturnValue();
    daemonCnx = self->_daemonCnx;
    self->_daemonCnx = v9;

    v2 = 0LL;
LABEL_20:

    return v2;
  }

  v2 = 0LL;
  return v2;
}

uint64_t __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __42__RPCompanionLinkClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __50__RPCompanionLinkClient__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_18A032390;
    v7[4] = v5;
    unsigned int v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }

  else
  {
    v4[2](v4);
  }

  objc_sync_exit(v5);
}

void __50__RPCompanionLinkClient__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 companionLinkUpdateClient:*(void *)(a1 + 32)];
}

- (void)_interrupted
{
  if (self->_activateCalled) {
    -[RPCompanionLinkClient _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0LL, 1LL);
  }
  -[RPCompanionLinkClient _reregisterAssertions](self, "_reregisterAssertions");
  -[RPCompanionLinkClient _reregisterEvents](self, "_reregisterEvents");
  -[RPCompanionLinkClient _reregisterRequests](self, "_reregisterRequests");
  -[RPCompanionLinkClient _reregisterProfileIDs](self, "_reregisterProfileIDs");
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__RPCompanionLinkClient_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPCompanionLinkClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 64))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 64) = 1;
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = *(void *)(v2 + 32);
      LogPrintF();
    }

    objc_msgSend(*(id *)(*(void *)(v2 + 32) + 40), "invalidate", v3);
    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CLinkClient <= 60
      && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (!self->_daemonCnx)
    {
      invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler) {
        invalidationHandler[2]();
      }
      -[NSMutableSet removeAllObjects](self->_assertions, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_eventRegistrations, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_requestRegistrations, "removeAllObjects");
      id authCompletionHandler = self->_authCompletionHandler;
      self->_id authCompletionHandler = 0LL;

      id deviceFoundHandler = self->_deviceFoundHandler;
      self->_id deviceFoundHandler = 0LL;

      id deviceLostHandler = self->_deviceLostHandler;
      self->_id deviceLostHandler = 0LL;

      id deviceChangedHandler = self->_deviceChangedHandler;
      self->_id deviceChangedHandler = 0LL;

      id disconnectHandler = self->_disconnectHandler;
      self->_id disconnectHandler = 0LL;

      id errorFlagsChangedHandler = self->_errorFlagsChangedHandler;
      self->_id errorFlagsChangedHandler = 0LL;

      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0LL;

      id v11 = self->_invalidationHandler;
      self->_invalidationHandler = 0LL;

      id localDeviceUpdatedHandler = self->_localDeviceUpdatedHandler;
      self->_id localDeviceUpdatedHandler = 0LL;

      id showPasswordHandler = self->_showPasswordHandler;
      self->_id showPasswordHandler = 0LL;

      id hidePasswordHandler = self->_hidePasswordHandler;
      self->_id hidePasswordHandler = 0LL;

      id promptForPasswordHandler = self->_promptForPasswordHandler;
      self->_id promptForPasswordHandler = 0LL;

      id stateUpdatedHandler = self->_stateUpdatedHandler;
      self->_id stateUpdatedHandler = 0LL;

      self->_invalidateDone = 1;
    }
  }

- (id)activateAssertionID:(id)a3 destinationID:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkAssertion);
  -[RPCompanionLinkAssertion setAssertionID:](v12, "setAssertionID:", v11);

  -[RPCompanionLinkAssertion setClient:](v12, "setClient:", self);
  -[RPCompanionLinkAssertion setDestinationID:](v12, "setDestinationID:", v10);

  [MEMORY[0x189607AB8] UUID];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 UUIDString];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkAssertion setIdentifier:](v12, "setIdentifier:", v14);

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __78__RPCompanionLinkClient_activateAssertionID_destinationID_options_completion___block_invoke;
  block[3] = &unk_18A0323B8;
  block[4] = self;
  uint64_t v16 = v12;
  __int128 v22 = v16;
  id v23 = v9;
  id v17 = v9;
  dispatch_async(dispatchQueue, block);
  uint64_t v18 = v23;
  uint64_t v19 = v16;

  return v19;
}

void __78__RPCompanionLinkClient_activateAssertionID_destinationID_options_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  }

  [v2 addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v9 = 0LL;
    [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 companionLinkActivateAssertion:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];

    goto LABEL_7;
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v9 = v6;
    (*(void (**)(void))(v7 + 16))();
LABEL_7:
    id v6 = v9;
  }
}

- (void)_invalidateAssertion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__RPCompanionLinkClient__invalidateAssertion___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__RPCompanionLinkClient__invalidateAssertion___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 companionLinkInvalidateAssertion:*(void *)(a1 + 40)];
}

- (void)_reregisterAssertions
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (-[NSMutableSet count](self->_assertions, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = self->_assertions;
  uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = MEMORY[0x1895F87A8];
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted");
        if (v10)
        {
          uint64_t v12 = (void *)v10;
          if (gLogCategory_CLinkClient <= 90
            && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }

          goto LABEL_20;
        }

        -[RPDaemonConnection remoteObjectProxy](self->_daemonCnx, "remoteObjectProxy");
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v7;
        v13[1] = 3221225472LL;
        v13[2] = __46__RPCompanionLinkClient__reregisterAssertions__block_invoke;
        v13[3] = &unk_18A031A58;
        v13[4] = self;
        void v13[5] = v9;
        [v11 companionLinkActivateAssertion:v9 completion:v13];
      }

      uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

void __46__RPCompanionLinkClient__reregisterAssertions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v4 = (void *)v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    uint64_t v7 = (void *)v3;
    if (gLogCategory_CLinkClient != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      [*(id *)(a1 + 40) assertionID];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      uint64_t v4 = v7;
    }
  }
}

- (void)tryPassword:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __37__RPCompanionLinkClient_tryPassword___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __37__RPCompanionLinkClient_tryPassword___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 companionLinkTryPassword:*(void *)(a1 + 40)];
}

- (void)companionLinkPromptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    uint64_t v9 = MEMORY[0x1895A4770](self->_promptForPasswordHandler);
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      self->_passwordTypeActual = a3;
      uint64_t v12 = (void *)v9;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v6, v5);
LABEL_4:

      return;
    }

    if (gLogCategory_CLinkClient <= 90)
    {
      uint64_t v12 = 0LL;
      if (gLogCategory_CLinkClient != -1 || (int v11 = _LogCategory_Initialize(), v10 = 0LL, v11))
      {
        LogPrintF();
        goto LABEL_4;
      }
    }
  }

- (void)companionLinkAuthCompleted:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = MEMORY[0x1895A4770](self->_authCompletionHandler);
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }

  else if (gLogCategory_CLinkClient <= 90 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (NSArray)activeDevices
{
  id v2 = self;
  objc_sync_enter(v2);
  deviceDictionary = v2->_deviceDictionary;
  if (deviceDictionary)
  {
    -[NSMutableDictionary allValues](deviceDictionary, "allValues");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = (void *)MEMORY[0x189604A58];
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (RPCompanionLinkDevice)activePersonalCompanion
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy_;
  int v11 = __Block_byref_object_dispose_;
  id v12 = 0LL;
  deviceDictionary = v2->_deviceDictionary;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __48__RPCompanionLinkClient_activePersonalCompanion__block_invoke;
  v6[3] = &unk_18A0323E0;
  v6[4] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceDictionary, "enumerateKeysAndObjectsUsingBlock:", v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  objc_sync_exit(v2);
  return (RPCompanionLinkDevice *)v4;
}

void __48__RPCompanionLinkClient_activePersonalCompanion__block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  id v7 = a3;
  if ([v7 isPersonal])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    *a4 = 1;
  }
}

- (void)companionLinkFoundDevice:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = self;
  objc_sync_enter(v4);
  [v10 identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || ([v10 publicIdentifier], (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (!v4->_deviceDictionary)
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      deviceDictionary = v4->_deviceDictionary;
      v4->_deviceDictionary = v6;
    }

    id v8 = (void *)MEMORY[0x1895A45CC]();
    if ((v4->_controlFlags & 0x4000000000000LL) == 0) {
      [v10 setSiriInfo:0];
    }
    objc_autoreleasePoolPop(v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_deviceDictionary, "setObject:forKeyedSubscript:", v10, v5);

    objc_sync_exit(v4);
    id deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      deviceFoundHandler[2](deviceFoundHandler, v10);
    }

    else if (v4->_appID {
           && gLogCategory_CLinkClient <= 40
    }
           && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  else
  {
    objc_sync_exit(v4);
  }
}

- (void)companionLinkLostDevice:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = self;
  objc_sync_enter(v4);
  [v8 identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    [v8 publicIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_sync_exit(v4);

      goto LABEL_6;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_deviceDictionary, "setObject:forKeyedSubscript:", 0LL, v5);

  objc_sync_exit(v4);
  id deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
  id v7 = v8;
  if (deviceLostHandler)
  {
    deviceLostHandler[2](deviceLostHandler, v8);
LABEL_6:
    id v7 = v8;
  }
}

- (void)companionLinkChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = self;
  objc_sync_enter(v6);
  [v11 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    [v11 publicIdentifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_sync_exit(v6);

      goto LABEL_8;
    }
  }

  id v8 = (void *)MEMORY[0x1895A45CC]( -[NSMutableDictionary setObject:forKeyedSubscript:]( v6->_deviceDictionary,  "setObject:forKeyedSubscript:",  v11,  v7));
  if ((v6->_controlFlags & 0x4000000000000LL) == 0) {
    [v11 setSiriInfo:0];
  }
  objc_autoreleasePoolPop(v8);

  objc_sync_exit(v6);
  id deviceChangedHandler = (void (**)(id, id, void))v6->_deviceChangedHandler;
  id v10 = v11;
  if (deviceChangedHandler)
  {
    deviceChangedHandler[2](deviceChangedHandler, v11, v4);
LABEL_8:
    id v10 = v11;
  }
}

- (void)companionLinkLocalDeviceUpdated:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = (void *)MEMORY[0x1895A45CC](-[RPCompanionLinkClient setLocalDevice:](self, "setLocalDevice:", v7));
  if ((self->_controlFlags & 0x4000000000000LL) == 0) {
    [v7 setSiriInfo:0];
  }
  objc_autoreleasePoolPop(v4);
  id localDeviceUpdatedHandler = (void (**)(id, id))self->_localDeviceUpdatedHandler;
  id v6 = v7;
  if (localDeviceUpdatedHandler)
  {
    localDeviceUpdatedHandler[2](localDeviceUpdatedHandler, v7);
    id v6 = v7;
  }
}

- (void)_lostAllDevices
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id deviceLostHandler = self->_deviceLostHandler;
  id obj = self;
  objc_sync_enter(obj);
  deviceDictionary = obj->_deviceDictionary;
  if (deviceLostHandler)
  {
    -[NSMutableDictionary allValues](deviceDictionary, "allValues");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](obj->_deviceDictionary, "removeAllObjects");
    objc_sync_exit(obj);

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = (void (**)(id, void))self->_deviceLostHandler;
          if (v10) {
            v10[2](v10, *(void *)(*((void *)&v12 + 1) + 8 * i));
          }
        }

        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](deviceDictionary, "removeAllObjects");
    objc_sync_exit(obj);
  }

- (BOOL)shouldReportDevice:(id)a3 toXPCConnectionWithLaunchInstanceID:(id)a4 outReason:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 flags] & 1) == 0 || (self->_flags)
  {
    if (([v8 flags] & 0x2000) != 0)
    {
      if ((self->_flags & 0x2000) == 0)
      {
        LOBYTE(v10) = 0;
        if (a5)
        {
          id v11 = @"deviceFlag.homeHubDevice";
          goto LABEL_50;
        }

        goto LABEL_51;
      }

      [v8 launchInstanceID];
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v9 isEqual:v12];

      if (v13)
      {
        LOBYTE(v10) = 0;
        if (a5)
        {
          id v11 = @"deviceFlag.homeHubDevice.launchInstanceIDMatches";
          goto LABEL_50;
        }

        goto LABEL_51;
      }
    }

    if (v9) {
      unint64_t v14 = self->_controlFlags | ((unint64_t)(self->_flags & 1) << 10) | 0x4000000000LL;
    }
    else {
      unint64_t v14 = self->_controlFlags | ((unint64_t)(self->_flags & 1) << 10);
    }
    uint64_t v15 = [v8 statusFlags];
    char v16 = [v8 flags];
    uint64_t v17 = v15 | 0x200080000LL;
    if ((v16 & 0x40) == 0) {
      uint64_t v17 = v15;
    }
    if (!(v14 & 0x400 | v17 & 0x80000)
      && ((v17 & 0x4000) == 0 || (v14 & 0x1000) == 0)
      && ((v17 & 0x20000) == 0 || (v14 & 0x100000) == 0)
      && ((v17 & 0x8000) == 0 || (v14 & 0x2000) == 0)
      && ((v17 & 0x2000000000LL) == 0 || (v14 & 0x100000000000LL) == 0)
      && ((v17 & 0x4000000000LL) == 0 || (v14 & 0x200000000000LL) == 0)
      && ((v17 & 0x2000) == 0 || (v14 & 0x800) == 0)
      && ((v17 & 0x1000000000LL) == 0 || (v14 & 0x80000000000LL) == 0))
    {
      LOBYTE(v10) = 0;
      if (!a5) {
        goto LABEL_51;
      }
      id v11 = @"missingFlag.trustCircle";
      goto LABEL_50;
    }

    if ((v17 & 0x80000000) != 0 || (v14 & 0x1000000000000LL) == 0)
    {
      if ((v17 & 0x200000) != 0 && (v14 & 0x4000000) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          id v11 = @"containsFlag.RPControlFlagsAppSignIn";
          goto LABEL_50;
        }
      }

      else if ((v14 & v17 & 8) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          id v11 = @"containsFlag.RPControlFlagsAWDL";
          goto LABEL_50;
        }
      }

      else if ((v14 & v17 & 2) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          id v11 = @"containsFlag.RPControlFlagsBLE";
          goto LABEL_50;
        }
      }

      else if ((v17 & 1) != 0 && (v14 & 0x20) != 0)
      {
        LOBYTE(v10) = 1;
        if (a5)
        {
          id v11 = @"containsFlag.RPControlFlagsBTPipe";
          goto LABEL_50;
        }
      }

      else
      {
        if ((v17 & 0x100000) != 0 && (v14 & 0x800000) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          id v11 = @"containsFlag.RPControlFlagsCloud";
          goto LABEL_50;
        }

        if ((v17 & 0x8000000) != 0 && (v14 & 0x100000000LL) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          id v11 = @"containsFlag.RPControlFlagsFitness";
          goto LABEL_50;
        }

        if ((v17 & 0x10000000) != 0 && (v14 & 0x400000000LL) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          id v11 = @"containsFlag.RPControlFlagsHomeHubDevice";
          goto LABEL_50;
        }

        if ((v17 & 0x200000000LL) != 0 && (v14 & 0x4000000000LL) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          id v11 = @"containsFlag.RPControlFlagsLaunchInstance";
          goto LABEL_50;
        }

        if ((v14 & v17 & 4) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          id v11 = @"containsFlag.RPControlFlagsInfraWiFi";
          goto LABEL_50;
        }

        if ((v14 & v17 & 0x10) != 0)
        {
          LOBYTE(v10) = 1;
          if (!a5) {
            goto LABEL_51;
          }
          id v11 = @"containsFlag.RPControlFlagsNAN";
          goto LABEL_50;
        }

        int v10 = (v14 >> 37) & 1 & (v17 >> 30);
        id v11 = @"statusControlFlagMismatch";
        if (v10) {
          id v11 = @"containsFlag.RPControlFlagsCompanionAuthentication";
        }
        if (a5) {
LABEL_50:
        }
          *a5 = v11;
      }
    }

    else
    {
      LOBYTE(v10) = 0;
      if (a5)
      {
        id v11 = @"missingFlag.RPStatusFlagsAWDLPairingMode";
        goto LABEL_50;
      }
    }
  }

  else
  {
    LOBYTE(v10) = 0;
    if (a5)
    {
      id v11 = @"deviceFlag.unauthenticated";
      goto LABEL_50;
    }
  }

- (void)companionLinkUpdateErrorFlags:(unint64_t)a3
{
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_errorFlags == a3)
  {
    objc_sync_exit(obj);
  }

  else
  {
    obj->_errorFlags = a3;
    objc_sync_exit(obj);

    dispatchQueue = (dispatch_queue_s *)obj->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __55__RPCompanionLinkClient_companionLinkUpdateErrorFlags___block_invoke;
    block[3] = &unk_18A031A30;
    block[4] = obj;
    dispatch_async(dispatchQueue, block);
  }

void __55__RPCompanionLinkClient_companionLinkUpdateErrorFlags___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 288LL));
  if (v1)
  {
    id v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

- (void)companionLinkUpdateClientState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int usingOnDemandConnection = v5->_usingOnDemandConnection;
  if (usingOnDemandConnection == [v4 usingOnDemandConnection])
  {
    objc_sync_exit(v5);
  }

  else
  {
    v5->_int usingOnDemandConnection = [v4 usingOnDemandConnection];
    objc_sync_exit(v5);

    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__RPCompanionLinkClient_companionLinkUpdateClientState___block_invoke;
    block[3] = &unk_18A031A30;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
}

void __56__RPCompanionLinkClient_companionLinkUpdateClientState___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 368LL));
  if (v1)
  {
    id v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __57__RPCompanionLinkClient_registerEventID_options_handler___block_invoke;
  v15[3] = &unk_18A032408;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __57__RPCompanionLinkClient_registerEventID_options_handler___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(&OBJC_CLASS___RPEventRegistration);
  -[RPEventRegistration setEventID:](v6, "setEventID:", *(void *)(a1 + 32));
  -[RPEventRegistration setOptions:](v6, "setOptions:", *(void *)(a1 + 40));
  -[RPEventRegistration setHandler:](v6, "setHandler:", *(void *)(a1 + 56));
  id v2 = *(void **)(*(void *)(a1 + 48) + 56LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    id v2 = *(void **)(*(void *)(a1 + 48) + 56LL);
  }

  [v2 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) _registerEventID:*(void *)(a1 + 32) options:*(void *)(a1 + 40) reregister:0];
}

- (void)_registerEventID:(id)a3 options:(id)a4 reregister:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v15 = v8;
      LogPrintF();
    }
  }

  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v15);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
  }

  else
  {
    daemonCnx = self->_daemonCnx;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke;
    v19[3] = &unk_18A032430;
    v19[4] = self;
    BOOL v21 = v5;
    id v13 = v8;
    id v20 = v13;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v19);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472LL;
    v16[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_2;
    v16[3] = &unk_18A032430;
    v16[4] = self;
    BOOL v18 = v5;
    id v17 = v13;
    [v14 companionLinkRegisterEventID:v17 options:v9 completion:v16];
  }
}

void __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (uint64_t v7 = v3, v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        id v6 = v3;
        LogPrintF();

        return;
      }
    }
  }

  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    id v8 = v3;
    int v5 = _LogCategory_Initialize();
    id v3 = v8;
    if (v5) {
      goto LABEL_7;
    }
  }
}

void __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 _clientError:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
    }

    else if (gLogCategory_CLinkClient > 60 {
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_14;
    }

    LogPrintF();
LABEL_14:

    goto LABEL_15;
  }

  if (v4[48])
  {
    id v6 = (dispatch_queue_s *)v4[34];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_3;
    block[3] = &unk_18A031AE8;
    block[4] = v4;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }

uint64_t __61__RPCompanionLinkClient__registerEventID_options_reregister___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 384LL) + 16LL))();
}

- (void)_reregisterEvents
{
  if (-[NSMutableDictionary count](self->_eventRegistrations, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  eventRegistrations = self->_eventRegistrations;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __42__RPCompanionLinkClient__reregisterEvents__block_invoke;
  v4[3] = &unk_18A032458;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( eventRegistrations,  "enumerateKeysAndObjectsUsingBlock:",  v4);
}

void __42__RPCompanionLinkClient__reregisterEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  [v4 eventID];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 options];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 _registerEventID:v6 options:v5 reregister:1];
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke;
  v7[3] = &unk_18A031AE8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke(uint64_t a1)
{
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    LogPrintF();
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", 0, *(void *)(a1 + 32), v8);
  [*(id *)(a1 + 40) _ensureXPCStarted];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
  }

  else
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    int v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = *(void **)(v4 + 40);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke_2;
    v12[3] = &unk_18A031A58;
    v12[4] = v4;
    id v13 = v5;
    [v6 remoteObjectProxyWithErrorHandler:v12];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v10[1] = 3221225472LL;
    v10[2] = __43__RPCompanionLinkClient_deregisterEventID___block_invoke_3;
    v10[3] = &unk_18A031A58;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    [v7 companionLinkDeregisterEventID:(id)v9.i64[0] completion:v10];
  }
}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v3 = (void *)v2;
  if (gLogCategory_CLinkClient <= 60)
  {
    int v5 = (void *)v2;
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
  }
}

void __43__RPCompanionLinkClient_deregisterEventID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
    uint64_t v3 = (void *)v2;
    if (gLogCategory_CLinkClient <= 60)
    {
      int v5 = (void *)v2;
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  id v49 = 0LL;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  id v43 = 0LL;
  uint64_t v17 = MEMORY[0x1895F87A8];
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke;
  v37[3] = &unk_18A032480;
  v37[4] = &v44;
  v37[5] = &v38;
  -[RPCompanionLinkClient _startNWActivity:options:result:](self, "_startNWActivity:options:result:", 1LL, v15, v37);
  +[RPNWActivityUtils tokenForActivity:](&OBJC_CLASS___RPNWActivityUtils, "tokenForActivity:", v45[5]);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)v39[5] valueForKey:@"highPriority"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 BOOLValue];

  if (!CFDictionaryGetInt64())
  {
    id v20 = v12;
    if (([v20 isEqual:@"HIDRelay"] & 1) != 0
      || ([v20 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
      || ([v20 isEqual:@"_hidT"] & 1) != 0
      || ([v20 isEqual:@"_laData"] & 1) != 0)
    {
    }

    else
    {
      int v28 = [v20 isEqual:@"_siA"];

      if (!v28)
      {
        int v21 = 30;
        goto LABEL_8;
      }
    }
  }

  int v21 = 10;
LABEL_8:
  if (v21 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    [v13 count];
    LogPrintF();
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = v17;
  block[1] = 3221225472LL;
  block[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_2;
  block[3] = &unk_18A0324D0;
  block[4] = self;
  id v30 = v12;
  id v31 = v14;
  id v32 = v13;
  v35 = &v44;
  v36 = &v38;
  id v33 = v18;
  id v34 = v16;
  id v23 = v18;
  id v24 = v13;
  id v25 = v14;
  id v26 = v12;
  id v27 = v16;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL),  v2);
    uint64_t v3 = *(void *)(a1 + 72);
    if (v3) {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
    }
  }

  else
  {
    uint64_t v4 = MEMORY[0x1895F87A8];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(v5 + 40);
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_3;
    v22[3] = &unk_18A0324A8;
    v22[4] = v5;
    id v23 = v6;
    id v24 = *(id *)(a1 + 48);
    __int128 v16 = *(_OWORD *)(a1 + 72);
    id v8 = (id)v16;
    __int128 v25 = v16;
    [v7 remoteObjectProxyWithErrorHandler:v22];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
    uint64_t v13 = *(void *)(a1 + 64);
    v18[0] = v4;
    v18[1] = 3221225472LL;
    v18[2] = __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_4;
    v18[3] = &unk_18A0324A8;
    id v14 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v14;
    id v20 = *(id *)(a1 + 48);
    __int128 v17 = *(_OWORD *)(a1 + 72);
    id v15 = (id)v17;
    __int128 v21 = v17;
    [v9 companionLinkSendEventID:v19 event:v10 destinationID:v11 options:v12 nwActivityToken:v13 completion:v18];
  }
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v9 = (id)v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = (uint64_t)v9, v4))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = v3;
      uint64_t v6 = *(void *)(a1 + 40);
      LogPrintF();
      uint64_t v3 = (uint64_t)v9;
    }
  }

  +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL),  v3,  v6,  v7,  v8);
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v9);
  }
}

void __76__RPCompanionLinkClient_sendEventID_event_destinationID_options_completion___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v14 = (void *)v3;
  if (v3)
  {
    uint64_t v4 = v3;
    if (gLogCategory_CLinkClient <= 60
      && (gLogCategory_CLinkClient != -1 || (int v5 = _LogCategory_Initialize(), v4 = (uint64_t)v14, v5)))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = v4;
      uint64_t v9 = *(void *)(a1 + 40);
      LogPrintF();
      +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL),  v14,  v9,  v11,  v13);
    }

    else
    {
      +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL),  v4,  v8,  v10,  v12);
    }
  }

  else
  {
    nw_activity_complete_with_reason();
  }

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = v14;
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v14);
    uint64_t v7 = v14;
  }
}

- (void)companionLinkReceivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", v15);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 handler];
  uint64_t v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    ((void (**)(void, id, id))v11)[2](v11, v8, v9);
LABEL_8:

    goto LABEL_9;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", @"*");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 handler];
  uint64_t v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v9) {
      id v13 = (id)[v9 mutableCopy];
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    id v14 = v13;
    [v13 setObject:v15 forKeyedSubscript:@"eventID"];
    ((void (**)(void, id, void *))v11)[2](v11, v8, v14);

    goto LABEL_8;
  }

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __59__RPCompanionLinkClient_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_18A0324F8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __59__RPCompanionLinkClient_registerRequestID_options_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerRequestIDOnQueue:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_registerRequestIDOnQueue:(id)a3 options:(id)a4 handler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___RPRequestRegistration);
  -[RPRequestRegistration setRequestID:](v10, "setRequestID:", v14);
  -[RPRequestRegistration setOptions:](v10, "setOptions:", v8);
  -[RPRequestRegistration setHandler:](v10, "setHandler:", v9);

  requestRegistrations = self->_requestRegistrations;
  if (!requestRegistrations)
  {
    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v13 = self->_requestRegistrations;
    self->_requestRegistrations = v12;

    requestRegistrations = self->_requestRegistrations;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](requestRegistrations, "setObject:forKeyedSubscript:", v10, v14);
  -[RPCompanionLinkClient _registerRequestID:options:reregister:]( self,  "_registerRequestID:options:reregister:",  v14,  v8,  0LL);
}

- (void)_registerRequestID:(id)a3 options:(id)a4 reregister:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v15 = v8;
      LogPrintF();
    }
  }

  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v15);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
  }

  else
  {
    daemonCnx = self->_daemonCnx;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke;
    v19[3] = &unk_18A032430;
    v19[4] = self;
    BOOL v21 = v5;
    id v13 = v8;
    id v20 = v13;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v19);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472LL;
    v16[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_2;
    v16[3] = &unk_18A032430;
    v16[4] = self;
    BOOL v18 = v5;
    id v17 = v13;
    [v14 companionLinkRegisterRequestID:v17 options:v9 completion:v16];
  }
}

void __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (uint64_t v7 = v3, v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        uint64_t v6 = v3;
        LogPrintF();

        return;
      }
    }
  }

  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    id v8 = v3;
    int v5 = _LogCategory_Initialize();
    uint64_t v3 = v8;
    if (v5) {
      goto LABEL_7;
    }
  }
}

void __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 _clientError:v3];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
    }

    else if (gLogCategory_CLinkClient > 60 {
           || gLogCategory_CLinkClient == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_14;
    }

    LogPrintF();
LABEL_14:

    goto LABEL_15;
  }

  if (v4[47])
  {
    uint64_t v6 = (dispatch_queue_s *)v4[34];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_3;
    block[3] = &unk_18A031AE8;
    block[4] = v4;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }

uint64_t __63__RPCompanionLinkClient__registerRequestID_options_reregister___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 376LL) + 16LL))();
}

- (void)_reregisterRequests
{
  if (-[NSMutableDictionary count](self->_requestRegistrations, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  requestRegistrations = self->_requestRegistrations;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __44__RPCompanionLinkClient__reregisterRequests__block_invoke;
  v4[3] = &unk_18A032520;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( requestRegistrations,  "enumerateKeysAndObjectsUsingBlock:",  v4);
}

void __44__RPCompanionLinkClient__reregisterRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  [v4 requestID];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 options];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 _registerRequestID:v6 options:v5 reregister:1];
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke;
  v7[3] = &unk_18A031AE8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke(uint64_t a1)
{
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    LogPrintF();
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "setObject:forKeyedSubscript:", 0, *(void *)(a1 + 32), v8);
  [*(id *)(a1 + 40) _ensureXPCStarted];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
  }

  else
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    int v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = *(void **)(v4 + 40);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_2;
    v12[3] = &unk_18A031A58;
    v12[4] = v4;
    id v13 = v5;
    [v6 remoteObjectProxyWithErrorHandler:v12];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v10[1] = 3221225472LL;
    v10[2] = __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_3;
    v10[3] = &unk_18A031A58;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    [v7 companionLinkDeregisterRequestID:(id)v9.i64[0] completion:v10];
  }
}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v3 = (void *)v2;
  if (gLogCategory_CLinkClient <= 60)
  {
    int v5 = (void *)v2;
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
  }
}

void __45__RPCompanionLinkClient_deregisterRequestID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientError:a2];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      int v5 = (void *)v2;
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
      {
        LogPrintF();
        uint64_t v3 = v5;
      }
    }
  }
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  uint64_t v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0LL;
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x3032000000LL;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  id v36 = 0LL;
  uint64_t v17 = MEMORY[0x1895F87A8];
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  v34[3] = &unk_18A032480;
  v34[4] = &v37;
  v34[5] = v35;
  -[RPCompanionLinkClient _startNWActivity:options:result:](self, "_startNWActivity:options:result:", 2LL, v15, v34);
  +[RPNWActivityUtils tokenForActivity:](&OBJC_CLASS___RPNWActivityUtils, "tokenForActivity:", v38[5]);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v25[0] = v17;
  v25[1] = 3221225472LL;
  v25[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_2;
  v25[3] = &unk_18A032570;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = self;
  id v32 = v35;
  id v33 = &v37;
  id v30 = v18;
  id v31 = v16;
  id v20 = v18;
  id v21 = v16;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  dispatch_async(dispatchQueue, v25);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 BOOLValue];

  if (v3) {
    int v4 = "at high priority";
  }
  else {
    int v4 = "";
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = v6;
  if (Int64)
  {
    int v8 = 10;
  }

  else if ([v6 isEqual:@"_ftSm"])
  {
    int v8 = 9;
  }

  else
  {
    int v8 = 9;
    if (([v7 isEqual:@"_ftLg"] & 1) == 0)
    {
      else {
        int v8 = 30;
      }
    }
  }

  if (v8 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    uint64_t v27 = *(void *)(a1 + 48);
    id v28 = v4;
    uint64_t v25 = v9;
    uint64_t v26 = v10;
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 56), "_ensureXPCStarted", v25, v26, v27, v28);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL),  v11);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }

  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = *(void **)(v12 + 40);
    uint64_t v14 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_3;
    v34[3] = &unk_18A0324A8;
    v34[4] = v12;
    id v35 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 88);
    id v36 = v15;
    uint64_t v38 = v16;
    id v37 = *(id *)(a1 + 72);
    [v13 remoteObjectProxyWithErrorHandler:v34];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
    v29[0] = v14;
    v29[1] = 3221225472LL;
    v29[2] = __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_4;
    v29[3] = &unk_18A032548;
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 64);
    v29[4] = *(void *)(a1 + 56);
    id v30 = v18;
    id v23 = *(id *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 88);
    id v31 = v23;
    uint64_t v33 = v24;
    id v32 = *(id *)(a1 + 72);
    [v17 companionLinkSendRequestID:v30 request:v19 destinationID:v21 options:v20 nwActivityToken:v22 responseHandler:v29];
  }
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clientError:a2];
  id v8 = (id)v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = (uint64_t)v8, v4))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = v3;
      uint64_t v5 = *(void *)(a1 + 40);
      LogPrintF();
      uint64_t v3 = (uint64_t)v8;
    }
  }

  +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL),  v3,  v5,  v6,  v7);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void __85__RPCompanionLinkClient_sendRequestID_request_destinationID_options_responseHandler___block_invoke_4( void *a1,  void *a2,  void *a3,  uint64_t a4)
{
  uint64_t v7 = (void *)a1[4];
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 _clientError:a4];
  id v19 = (id)v10;
  if (v10)
  {
    id v11 = (id)v10;
    if (gLogCategory_CLinkClient <= 60
      && (gLogCategory_CLinkClient != -1 || (v12 = _LogCategory_Initialize(), id v11 = v19, v12)))
    {
      uint64_t v16 = a1[6];
      id v18 = v11;
      uint64_t v14 = a1[5];
      LogPrintF();
      +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(a1[8] + 8LL) + 40LL),  v19,  v14,  v16,  v18);
    }

    else
    {
      +[RPNWActivityUtils failActivity:error:]( &OBJC_CLASS___RPNWActivityUtils,  "failActivity:error:",  *(void *)(*(void *)(a1[8] + 8LL) + 40LL),  v11,  v13,  v15,  v17);
    }
  }

  else
  {
    nw_activity_complete_with_reason();
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

- (void)companionLinkReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t Int64 = CFDictionaryGetInt64();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", v10);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 handler];
  uint64_t v16 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke;
    v18[3] = &unk_18A0325C0;
    v18[4] = self;
    id v19 = v10;
    BOOL v21 = Int64 != 0;
    id v20 = v13;
    ((void (**)(void, id, id, void *))v16)[2](v16, v11, v12, v18);
  }

  else
  {
    RPErrorF();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v17);
  }
}

void __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 40);
  id v11 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 272LL);
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke_2;
  v17[3] = &unk_18A032598;
  id v12 = v10;
  char v23 = *(_BYTE *)(a1 + 56);
  id v18 = v12;
  id v19 = v7;
  id v13 = *(id *)(a1 + 48);
  id v21 = v9;
  id v22 = v13;
  id v20 = v8;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v11, v17);
}

uint64_t __88__RPCompanionLinkClient_companionLinkReceivedRequestID_request_options_responseHandler___block_invoke_2( uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  id v3 = *(id *)(a1 + 32);
  int v4 = v3;
  if (v2)
  {
    int v5 = 10;
  }

  else if ([v3 isEqual:@"_ftSm"])
  {
    int v5 = 9;
  }

  else
  {
    int v5 = 9;
    if (([v4 isEqual:@"_ftLg"] & 1) == 0)
    {
      else {
        int v5 = 30;
      }
    }
  }

  if (v5 >= gLogCategory_CLinkClient && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    [*(id *)(a1 + 40) count];
    LogPrintF();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

- (void)companionLinkHandleDisconnect
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__RPCompanionLinkClient_companionLinkHandleDisconnect__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __54__RPCompanionLinkClient_companionLinkHandleDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 176LL));
  if (v1)
  {
    int v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

- (void)launchAppWithBundleID:(id)a3 destinationID:(id)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v16 = @"_bundleID";
  v17[0] = a3;
  id v9 = (void *)MEMORY[0x189603F68];
  id v10 = a4;
  id v11 = a3;
  [v9 dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __72__RPCompanionLinkClient_launchAppWithBundleID_destinationID_completion___block_invoke;
  v14[3] = &unk_18A0325E8;
  id v15 = v8;
  id v13 = v8;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:]( self,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_launchApp",  v12,  v10,  0LL,  v14);
}

uint64_t __72__RPCompanionLinkClient_launchAppWithBundleID_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)launchAppWithURL:(id)a3 destinationID:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v15 = @"_urlS";
  id v9 = a4;
  [a3 absoluteString];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __67__RPCompanionLinkClient_launchAppWithURL_destinationID_completion___block_invoke;
  v13[3] = &unk_18A0325E8;
  id v14 = v8;
  id v12 = v8;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:]( self,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_launchApp",  v11,  v9,  0LL,  v13);
}

uint64_t __67__RPCompanionLinkClient_launchAppWithURL_destinationID_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)triggerEnhancedDiscoveryForReason:(id)a3 completion:(id)a4
{
}

- (void)triggerEnhancedDiscoveryForReason:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke;
  v13[3] = &unk_18A031C00;
  id v14 = v8;
  id v15 = v9;
  unsigned int v16 = a4;
  void v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(dispatchQueue, v13);
}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke( uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v2);
    }
  }

  else
  {
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    if (!(_DWORD)v3) {
      uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 32) + 104LL);
    }
    uint64_t v5 = MEMORY[0x1895F87A8];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(v6 + 40);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_2;
    v14[3] = &unk_18A032610;
    void v14[4] = v6;
    id v15 = v7;
    id v16 = *(id *)(a1 + 48);
    [v8 remoteObjectProxyWithErrorHandler:v14];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472LL;
    v11[2] = __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_3;
    v11[3] = &unk_18A032610;
    id v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    id v13 = *(id *)(a1 + 48);
    [v9 companionLinkTriggerEnhancedDiscovery:v12 useCase:v3 completion:v11];
  }
}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

void __78__RPCompanionLinkClient_triggerEnhancedDiscoveryForReason_useCase_completion___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

- (void)createDeviceToEndpointMappingForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke;
  block[3] = &unk_18A031B38;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke(id *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v10 = (void (**)(id, void, void *))a1[6];
    if (v10) {
      v10[2](v10, 0LL, v2);
    }
  }

  else
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    int v4 = a1[4];
    id v5 = a1[5];
    id v6 = (void *)v4[5];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_2;
    v14[3] = &unk_18A032610;
    void v14[4] = v4;
    id v15 = v5;
    id v16 = a1[6];
    [v6 remoteObjectProxyWithErrorHandler:v14];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [a1[5] identifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472LL;
    v11[2] = __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_3;
    v11[3] = &unk_18A032638;
    id v9 = a1[5];
    v11[4] = a1[4];
    id v12 = v9;
    id v13 = a1[6];
    [v7 companionLinkCreateDeviceToEndpointMappingForDeviceID:v8 completion:v11];
  }
}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0LL, v6);
    uint64_t v3 = v6;
  }
}

void __75__RPCompanionLinkClient_createDeviceToEndpointMappingForDevice_completion___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v7 = a2;
  [*(id *)(a1 + 32) _clientError:a3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && gLogCategory_CLinkClient <= 60
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v7, v5);
  }
}

- (void)setLocalDeviceAsContextCollectorWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
    }
  }

  else
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(*(void *)(a1 + 32) + 344) idsDeviceIdentifier];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    uint64_t v4 = MEMORY[0x1895F87A8];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v7 = *(void **)(v5 + 40);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_2;
    v13[3] = &unk_18A032290;
    void v13[4] = v5;
    id v14 = v6;
    [v7 remoteObjectProxyWithErrorHandler:v13];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472LL;
    v11[2] = __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_3;
    v11[3] = &unk_18A032290;
    id v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    [v8 companionLinkSetLocalDeviceAsContextCollector:v11];
  }
}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

void __72__RPCompanionLinkClient_setLocalDeviceAsContextCollectorWithCompletion___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

- (void)removeLocalDeviceAsContextCollectorWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke( uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
    }
  }

  else
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(*(void *)(a1 + 32) + 344) idsDeviceIdentifier];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

    uint64_t v4 = MEMORY[0x1895F87A8];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v7 = *(void **)(v5 + 40);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_2;
    v13[3] = &unk_18A032290;
    void v13[4] = v5;
    id v14 = v6;
    [v7 remoteObjectProxyWithErrorHandler:v13];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472LL;
    v11[2] = __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_3;
    v11[3] = &unk_18A032290;
    id v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    [v8 companionLinkRemoveLocalDeviceAsContextCollector:v11];
  }
}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

void __75__RPCompanionLinkClient_removeLocalDeviceAsContextCollectorWithCompletion___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        uint64_t v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    uint64_t v3 = v6;
  }
}

- (void)_startNWActivity:(unsigned int)a3 options:(id)a4 result:(id)a5
{
  id v10 = a4;
  id v6 = (void (**)(id, void *, void *))a5;
  id v7 = (void *)nw_activity_create();
  if (v10)
  {
    id v8 = (void *)[v10 mutableCopy];
    [v8 objectForKeyedSubscript:@"nwActivity"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      nw_activity_set_parent_activity();
      [v8 removeObjectForKey:@"nwActivity"];
    }
  }

  else
  {
    id v8 = 0LL;
  }

  nw_activity_activate();
  v6[2](v6, v7, v8);
}

- (void)registerProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__RPCompanionLinkClient_registerProfileID_completion___block_invoke;
  block[3] = &unk_18A0323B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__RPCompanionLinkClient_registerProfileID_completion___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 72LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FD0]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v3;

    int v2 = *(void **)(*(void *)(a1 + 32) + 72LL);
  }

  [v2 addObject:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _registerProfileID:*(void *)(a1 + 40) reregister:0 completion:*(void *)(a1 + 48)];
}

- (void)_registerProfileID:(id)a3 reregister:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      id v16 = v8;
      LogPrintF();
    }
  }

  else if (gLogCategory_CLinkClient <= 30 {
         && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  -[RPCompanionLinkClient _ensureXPCStarted](self, "_ensureXPCStarted", v16);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
  }

  else
  {
    daemonCnx = self->_daemonCnx;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke;
    v21[3] = &unk_18A032660;
    v21[4] = self;
    BOOL v24 = v6;
    id v13 = v8;
    id v22 = v13;
    id v14 = v9;
    id v23 = v14;
    -[RPDaemonConnection remoteObjectProxyWithErrorHandler:](daemonCnx, "remoteObjectProxyWithErrorHandler:", v21);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472LL;
    void v17[2] = __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke_2;
    v17[3] = &unk_18A032660;
    void v17[4] = self;
    BOOL v20 = v6;
    id v18 = v13;
    id v19 = v14;
    [v15 companionLinkRegisterProfileID:v18 completion:v17];
  }
}

void __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }

  else if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = v7;
    if (v5) {
      goto LABEL_7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

void __66__RPCompanionLinkClient__registerProfileID_reregister_completion___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      if (gLogCategory_CLinkClient <= 60)
      {
        if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
        {
LABEL_8:
          LogPrintF();
          id v3 = v7;
        }
      }
    }

    else if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1) {
        goto LABEL_8;
      }
      int v5 = _LogCategory_Initialize();
      id v3 = v7;
      if (v5) {
        goto LABEL_8;
      }
    }
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

- (void)_reregisterProfileIDs
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (-[NSMutableOrderedSet count](self->_registeredProfileIDs, "count")
    && gLogCategory_CLinkClient <= 30
    && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = self->_registeredProfileIDs;
  uint64_t v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[RPCompanionLinkClient _registerProfileID:reregister:completion:]( self,  "_registerProfileID:reregister:completion:",  *(void *)(*((void *)&v8 + 1) + 8 * i),  1LL,  0LL,  (void)v8);
      }

      uint64_t v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (void)deregisterProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke;
  block[3] = &unk_18A0323B8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_CLinkClient <= 30 && (gLogCategory_CLinkClient != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    LogPrintF();
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "removeObject:", *(void *)(a1 + 32), v8);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 40);
  if (v3)
  {
    uint64_t v4 = MEMORY[0x1895F87A8];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_2;
    v13[3] = &unk_18A032610;
    void v13[4] = v2;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    [v3 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472LL;
    v10[2] = __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_3;
    v10[3] = &unk_18A032610;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    id v6 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    id v12 = *(id *)(a1 + 48);
    [v5 companionLinkDeregisterProfileID:v6 completion:v10];
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0LL);
    }
  }

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  if (gLogCategory_CLinkClient <= 60)
  {
    if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      id v3 = v6;
    }
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void __56__RPCompanionLinkClient_deregisterProfileID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_CLinkClient <= 60)
    {
      if (gLogCategory_CLinkClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_uint64_t passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (unsigned)bleScreenOffScanRate
{
  return self->_bleScreenOffScanRate;
}

- (int64_t)bleScreenOffRescanInterval
{
  return self->_bleScreenOffRescanInterval;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (double)awdlGuestDiscoveryTimeout
{
  return self->_awdlGuestDiscoveryTimeout;
}

- (void)setAwdlGuestDiscoveryTimeout:(double)a3
{
  self->_awdlGuestDiscoveryTimeout = a3;
}

- (int64_t)bleClientUseCase
{
  return self->_bleClientUseCase;
}

- (void)setBleClientUseCase:(int64_t)a3
{
  self->_int64_t bleClientUseCase = a3;
}

- (NSString)cloudServiceID
{
  return self->_cloudServiceID;
}

- (void)setCloudServiceID:(id)a3
{
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (RPCompanionLinkDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setDestinationDevice:(id)a3
{
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

- (void)setErrorFlags:(unint64_t)a3
{
  self->_errorFlags = a3;
}

- (id)errorFlagsChangedHandler
{
  return self->_errorFlagsChangedHandler;
}

- (void)setErrorFlagsChangedHandler:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_int64_t rssiThreshold = a3;
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (RPCompanionLinkDevice)localDevice
{
  return (RPCompanionLinkDevice *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setLocalDevice:(id)a3
{
}

- (id)localDeviceUpdatedHandler
{
  return self->_localDeviceUpdatedHandler;
}

- (void)setLocalDeviceUpdatedHandler:(id)a3
{
}

- (BOOL)usingOnDemandConnection
{
  return self->_usingOnDemandConnection;
}

- (void)setUsingOnDemandConnection:(BOOL)a3
{
  self->_int usingOnDemandConnection = a3;
}

- (NSDictionary)siriInfo
{
  return self->_siriInfo;
}

- (id)stateUpdatedHandler
{
  return self->_stateUpdatedHandler;
}

- (void)setStateUpdatedHandler:(id)a3
{
}

- (id)requestIDRegistrationCompletion
{
  return self->_requestIDRegistrationCompletion;
}

- (void)setRequestIDRegistrationCompletion:(id)a3
{
}

- (id)eventIDRegistrationCompletion
{
  return self->_eventIDRegistrationCompletion;
}

- (void)setEventIDRegistrationCompletion:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_int64_t clientID = a3;
}

- (BOOL)encodeSensitiveProperties
{
  return self->_encodeSensitiveProperties;
}

- (void)setEncodeSensitiveProperties:(BOOL)a3
{
  self->_encodeSensitiveProperties = a3;
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (BOOL)reactivateCalled
{
  return self->_reactivateCalled;
}

- (void)setReactivateCalled:(BOOL)a3
{
  self->_reactivateCalled = a3;
}

- (void).cxx_destruct
{
}

@end