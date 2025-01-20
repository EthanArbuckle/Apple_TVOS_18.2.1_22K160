@interface RPConnection
- (BOOL)_clientError:(id)a3;
- (BOOL)_pairVerifyVerifySignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 error:(id *)a6;
- (BOOL)_receivedSystemInfo:(id)a3 xid:(id)a4;
- (BOOL)_serverPairingAllowed;
- (BOOL)canDecode128bit;
- (BOOL)clientMode;
- (BOOL)containsInUseProcess:(int)a3;
- (BOOL)flowControlReadEnabled;
- (BOOL)invalidationHandled;
- (BOOL)preAuthEnabled;
- (BOOL)present;
- (CUBLEConnection)bleConnection;
- (CUBluetoothScalablePipe)btPipe;
- (CUBluetoothScalablePipe)btPipeHighPriority;
- (CUBonjourDevice)bonjourPeerDevice;
- (CUHomeKitManager)homeKitManager;
- (CUNetLinkManager)netLinkManager;
- (CUTCPConnection)tcpConnection;
- (NSArray)allowedMACAddresses;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSData)pskData;
- (NSDictionary)appInfoPeer;
- (NSDictionary)appInfoSelf;
- (NSMutableArray)proxyDevices;
- (NSMutableArray)receivedMessages;
- (NSMutableSet)inUseProcesses;
- (NSString)appID;
- (NSString)clientBundleID;
- (NSString)destinationString;
- (NSString)identifierOverride;
- (NSString)label;
- (NSString)password;
- (NSString)peerAddrString;
- (NSString)peerHomeKitUserIdentifier;
- (NSString)peerIdentifier;
- (NSString)serviceType;
- (NSUUID)blePeerIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPCloudDaemon)cloudDaemon;
- (RPCompanionLinkDevice)localDeviceInfo;
- (RPCompanionLinkDevice)peerDeviceInfo;
- (RPConnection)init;
- (RPIdentity)forcedPeerIdentity;
- (RPIdentity)forcedSelfIdentity;
- (RPIdentity)identityResolved;
- (RPIdentity)identityVerified;
- (RPIdentityDaemon)identityDaemon;
- (id)_allowedMACAddressesForMCFeature:(id)a3;
- (id)_getCurrentProcessName;
- (id)_identityProofDataClient;
- (id)_identityProofDataServer;
- (id)_pairVerifySignData:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)_systeminfo;
- (id)authCompletionHandler;
- (id)client;
- (id)configurePairingHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)flowControlWriteChangedHandler;
- (id)hidePasswordHandler;
- (id)homeKitUserIdentifierHandler;
- (id)inUseProcessesToString;
- (id)invalidationHandler;
- (id)pairVerifyCompletion;
- (id)peerUpdatedHandler;
- (id)promptForPasswordHandler;
- (id)proxyDeviceUpdateHandler;
- (id)readErrorHandler;
- (id)receivedEventHandler;
- (id)receivedRequestHandler;
- (id)sessionStartHandler;
- (id)showPasswordHandler;
- (id)stateChangedHandler;
- (int)flowControlWriteState;
- (int)keepAliveSeconds;
- (int)linkType;
- (int)pairVerifyAuthType;
- (int)passwordType;
- (int)passwordTypeActual;
- (int)preferredIdentityType;
- (int)state;
- (int64_t)bleClientUseCase;
- (unint64_t)controlFlags;
- (unint64_t)statusFlags;
- (unint64_t)statusFlagsUsingIdentities:(id)a3;
- (unsigned)bleConnectionPSM;
- (unsigned)flags;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (unsigned)trafficFlags;
- (void)_abortRequestsWithError:(id)a3;
- (void)_clientConnectCompleted:(id)a3;
- (void)_clientConnectStart;
- (void)_clientConnectStartBLE;
- (void)_clientConnectStartBTPipe;
- (void)_clientConnectStartTCP;
- (void)_clientNetworkError:(id)a3 label:(const char *)a4;
- (void)_clientPairSetupCompleted:(id)a3;
- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 handler:(id)a5;
- (void)_clientPairSetupStart;
- (void)_clientPairSetupWithData:(id)a3;
- (void)_clientPairVerifyCompleted:(id)a3;
- (void)_clientPairVerifyStart;
- (void)_clientPairVerifyWithData:(id)a3;
- (void)_clientPreAuthResponseWithData:(id)a3;
- (void)_clientPreAuthStart;
- (void)_clientRetryFired;
- (void)_clientRetryStart;
- (void)_clientRun;
- (void)_clientStartSession;
- (void)_clientStarted;
- (void)_configureForSessionPairing:(id)a3;
- (void)_identityProofsAdd:(id)a3 update:(BOOL)a4;
- (void)_identityProofsAddWithHomeKitUUID:(id)a3;
- (void)_identityProofsVerify:(id)a3;
- (void)_identityProofsVerifyHomeKitSignature:(id)a3 identifier:(id)a4;
- (void)_idleTimerFired;
- (void)_idleTimerStart:(unsigned int)a3 repeat:(unsigned int)a4;
- (void)_invalidate;
- (void)_invalidateCore:(id)a3;
- (void)_invalidateWithError:(id)a3;
- (void)_invalidated;
- (void)_logConnectionInvalidatedWithError:(id)a3;
- (void)_pairSetupInvalidate;
- (void)_pairVerifyInvalidate;
- (void)_processSends;
- (void)_pskPrepare:(BOOL)a3;
- (void)_receiveCompletion:(id)a3 readFrame:(id *)a4 requestable:(id)a5;
- (void)_receiveStart:(id)a3 readFrame:(id *)a4 requestable:(id)a5;
- (void)_receivedEvent:(id)a3 ctx:(id *)a4;
- (void)_receivedHeader:(id *)a3 body:(id)a4 ctx:(id *)a5;
- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4 ctx:(id *)a5;
- (void)_receivedObject:(id)a3 ctx:(id *)a4;
- (void)_receivedRequest:(id)a3 ctx:(id *)a4;
- (void)_receivedResponse:(id)a3 ctx:(id *)a4;
- (void)_run;
- (void)_sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)_sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 sendEntry:(id)a7 responseHandler:(id)a8;
- (void)_sendEncryptedResponse:(id)a3 options:(id)a4 error:(id)a5 xid:(id)a6 requestID:(id)a7 highPriority:(BOOL)a8 isChatty:(BOOL)a9 replyStartTime:(id)a10;
- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4;
- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4;
- (void)_serverAccept;
- (void)_serverAcceptBLE;
- (void)_serverAcceptBTPipe;
- (void)_serverAcceptTCP;
- (void)_serverError:(id)a3;
- (void)_serverNetworkError:(id)a3 label:(const char *)a4;
- (void)_serverPairSetupCompleted:(id)a3;
- (void)_serverPairSetupWithData:(id)a3 start:(BOOL)a4;
- (void)_serverPairVerifyCompleted:(id)a3;
- (void)_serverPairVerifyWithData:(id)a3 start:(BOOL)a4;
- (void)_serverPreAuthRequestWithData:(id)a3;
- (void)_serverRun;
- (void)_serverStarted;
- (void)_timeoutForSendEntry:(id)a3;
- (void)_timeoutForXID:(id)a3;
- (void)_updateExternalState;
- (void)_updateLinkInfo;
- (void)activate;
- (void)addInUseProcess:(int)a3;
- (void)dealloc;
- (void)homeKitIdentityUpdated;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)processSendsUsingConnection:(id)a3;
- (void)removeInUseProcess:(int)a3;
- (void)sameAccountIdentityUpdated;
- (void)sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)sendEncryptedEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendReachabilityProbe:(const char *)a3;
- (void)sessionStopped:(id)a3;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppInfoSelf:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setBleClientUseCase:(int64_t)a3;
- (void)setBleConnection:(id)a3;
- (void)setBleConnectionPSM:(unsigned __int16)a3;
- (void)setBlePeerIdentifier:(id)a3;
- (void)setBonjourPeerDevice:(id)a3;
- (void)setBtPipe:(id)a3;
- (void)setBtPipeHighPriority:(id)a3;
- (void)setCanDecode128bit:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientMode:(BOOL)a3;
- (void)setCloudDaemon:(id)a3;
- (void)setConfigurePairingHandler:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDestinationString:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFlowControlReadEnabled:(BOOL)a3;
- (void)setFlowControlWriteChangedHandler:(id)a3;
- (void)setForcedPeerIdentity:(id)a3;
- (void)setForcedSelfIdentity:(id)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setHomeKitManager:(id)a3;
- (void)setHomeKitUserIdentifierHandler:(id)a3;
- (void)setIdentifierOverride:(id)a3;
- (void)setIdentityDaemon:(id)a3;
- (void)setIdentityResolved:(id)a3;
- (void)setInUseProcesses:(id)a3;
- (void)setInvalidationHandled:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setKeepAliveSeconds:(int)a3;
- (void)setLabel:(id)a3;
- (void)setLocalDeviceInfo:(id)a3;
- (void)setNetLinkManager:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyCompletion:(id)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)setPeerUpdatedHandler:(id)a3;
- (void)setPreAuthEnabled:(BOOL)a3;
- (void)setPreferredIdentityType:(int)a3;
- (void)setPresent:(BOOL)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setProxyDeviceUpdateHandler:(id)a3;
- (void)setProxyDevices:(id)a3;
- (void)setPskData:(id)a3;
- (void)setReadErrorHandler:(id)a3;
- (void)setReceivedEventHandler:(id)a3;
- (void)setReceivedMessages:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionStartHandler:(id)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)setState:(int)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)setTcpConnection:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)tryPassword:(id)a3;
@end

@implementation RPConnection

- (RPConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPConnection;
  v2 = -[RPConnection init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_flowControlReadEnabled = 1;
    v4 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
    peerDeviceInfo = v3->_peerDeviceInfo;
    v3->_peerDeviceInfo = v4;

    -[RPCompanionLinkDevice setDaemon:](v3->_peerDeviceInfo, "setDaemon:", 1LL);
    *(void *)&v3->_pairSetupFlags = 0x40000000000018LL;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    sendArray = v3->_sendArray;
    v3->_sendArray = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    receivedMessages = v3->_receivedMessages;
    v3->_receivedMessages = v8;

    v3->_ucat = (LogCategory *)&gLogCategory_RPCnx;
    RandomBytes();
    v3->_readFrame.header = 0;
    *(_WORD *)&v3->_readFrame.receivingHeader = 0;
    v3->_readFrameBTPipeHighPriority.header = 0;
    *(_WORD *)&v3->_readFrameBTPipeHighPriority.receivingHeader = 0;
    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPConnection;
  -[RPConnection dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  v5 = self->_peerDeviceInfo;
  BOOL v6 = shouldPrintSensitiveData();
  uint64_t v135 = 0LL;
  NSAppendPrintF();
  id v134 = 0LL;
  unint64_t retryCount = (unint64_t)_StateToString(self->_internalState);
  NSAppendPrintF();
  id v7 = v134;

  unsigned int linkType = self->_linkType;
  if (linkType)
  {
    id v133 = v7;
    if (linkType > 0xB) {
      v9 = "?";
    }
    else {
      v9 = off_18A032C18[linkType - 1];
    }
    unint64_t retryCount = (unint64_t)v9;
    NSAppendPrintF();
    id v10 = v133;

    id v7 = v10;
  }

  trafficFlags = (const char *)self->_trafficFlags;
  if ((_DWORD)trafficFlags)
  {
    v132[1] = v7;
    unint64_t retryCount = (unint64_t)trafficFlags;
    v126 = &unk_1873E6D04;
    NSAppendPrintF();
    id v12 = v7;

    id v7 = v12;
  }

  if (self->_pairVerifyCompleted)
  {
    if (self->_pairVerifyUsedIdentity)
    {
      v132[0] = v7;
      v13 = (id *)v132;
    }

    else
    {
      id v131 = v7;
      v13 = &v131;
    }
  }

  else
  {
    if (!self->_mainStream) {
      goto LABEL_15;
    }
    id v130 = v7;
    v13 = &v130;
  }

  NSAppendPrintF();
  id v14 = *v13;

  id v7 = v14;
LABEL_15:
  unsigned int passwordType = self->_passwordType;
  if (passwordType)
  {
    if (passwordType > 0xB) {
      v16 = "?";
    }
    else {
      v16 = off_18A032C70[passwordType - 1];
    }
    unint64_t retryCount = (unint64_t)v16;
    NSAppendPrintF();
    id v17 = v7;

    id v7 = v17;
  }

  unsigned int pairVerifyAuthType = self->_pairVerifyAuthType;
  if (pairVerifyAuthType)
  {
    if (pairVerifyAuthType > 0xA) {
      v19 = "?";
    }
    else {
      v19 = off_18A032CC8[pairVerifyAuthType - 1];
    }
    unint64_t retryCount = (unint64_t)v19;
    NSAppendPrintF();
    id v20 = v7;

    id v7 = v20;
  }

  if (self->_retryCount > 0)
  {
    unint64_t retryCount = self->_retryCount;
    NSAppendPrintF();
    id v21 = v7;

    id v7 = v21;
  }

  v22 = self->_stepError;
  v23 = v22;
  if (v22)
  {
    unint64_t retryCount = (unint64_t)v22;
    NSAppendPrintF();
    id v24 = v7;

    id v7 = v24;
  }

  uint64_t v25 = -[RPConnection inUseProcessesToString](self, "inUseProcessesToString", retryCount);
  v26 = (void *)v25;
  if (v25)
  {
    unint64_t controlFlags = v25;
    NSAppendPrintF();
    id v27 = v7;

    id v7 = v27;
  }

  if (v6)
  {
    peerIdentifier = self->_peerIdentifier;
    if (peerIdentifier)
    {
      int v29 = 0;
      v30 = self->_peerIdentifier;
    }

    else
    {
      uint64_t v31 = -[RPEndpoint identifier](v5, "identifier");
      v26 = (void *)v31;
      if (v31)
      {
        int v29 = 0;
        v30 = (void *)v31;
      }

      else
      {
        v30 = -[RPCompanionLinkDevice publicIdentifier](v5, "publicIdentifier");
        int v29 = 1;
      }
    }

    NSAppendPrintF();
    id v32 = v7;

    if (v29) {
    if (!peerIdentifier)
    }

    uint64_t v33 = -[RPEndpoint idsDeviceIdentifier](v5, "idsDeviceIdentifier", v30, v126);
    v34 = (void *)v33;
    if (v33)
    {
      uint64_t v127 = v33;
      NSAppendPrintF();
      id v35 = v32;

      id v32 = v35;
    }
    v116 = -[RPEndpoint name](v5, "name");
    NSAppendPrintF();
    id v36 = v32;
    v117 = -[RPEndpoint model](v5, "model", v116);
    NSAppendPrintF();
    id v37 = v36;
    v118 = -[RPEndpoint accountID](v5, "accountID", v117);
    NSAppendPrintF();
    id v7 = v37;

    v38 = self->_appID;
    v39 = v38;
    if (v38)
    {
      v118 = v38;
      NSAppendPrintF();
      id v40 = v7;

      id v7 = v40;
    }

    uint64_t v41 = -[RPCompanionLinkDevice idsPersonalDeviceIdentifier](v5, "idsPersonalDeviceIdentifier", v118);
    v42 = (void *)v41;
    if (v41)
    {
      uint64_t v119 = v41;
      NSAppendPrintF();
      id v43 = v7;

      id v7 = v43;
    }

    uint64_t v44 = -[RPCompanionLinkDevice homeKitIdentifier](v5, "homeKitIdentifier");
    v45 = (void *)v44;
    if (v44)
    {
      uint64_t v119 = v44;
      NSAppendPrintF();
      id v46 = v7;

      id v7 = v46;
    }

    uint64_t v47 = -[RPEndpoint mediaRemoteIdentifier](v5, "mediaRemoteIdentifier");
    v48 = (void *)v47;
    if (v47)
    {
      uint64_t v119 = v47;
      NSAppendPrintF();
      id v49 = v7;

      id v7 = v49;
    }

    uint64_t v50 = -[RPEndpoint mediaRouteIdentifier](v5, "mediaRouteIdentifier");
    v51 = (void *)v50;
    if (v50)
    {
      uint64_t v119 = v50;
      NSAppendPrintF();
      id v52 = v7;

      id v7 = v52;
    }

    uint64_t v53 = -[RPCompanionLinkDevice mediaSystemIdentifier](v5, "mediaSystemIdentifier");
    v54 = (void *)v53;
    if (v53)
    {
      uint64_t v119 = v53;
      NSAppendPrintF();
      id v55 = v7;

      id v7 = v55;
    }

    uint64_t v56 = -[RPCompanionLinkDevice mediaSystemName](v5, "mediaSystemName");
    v57 = (void *)v56;
    if (v56)
    {
      uint64_t v119 = v56;
      NSAppendPrintF();
      id v58 = v7;

      id v7 = v58;
    }

    unsigned int v59 = -[RPCompanionLinkDevice mediaSystemRole](v5, "mediaSystemRole");
    if (v59)
    {
      if (v59 > 3) {
        v60 = "?";
      }
      else {
        v60 = off_18A032D18[v59 - 1];
      }
      uint64_t v119 = (uint64_t)v60;
      NSAppendPrintF();
      id v61 = v7;

      id v7 = v61;
    }

    unsigned int v62 = -[RPCompanionLinkDevice mediaSystemState](v5, "mediaSystemState", v119, v127);
    if (v62)
    {
      if (v62 > 4) {
        v63 = "?";
      }
      else {
        v63 = off_18A032D30[v62 - 1];
      }
      v120 = v63;
      NSAppendPrintF();
      id v64 = v7;

      id v7 = v64;
    }

    int v65 = -[RPCompanionLinkDevice personalDeviceState](v5, "personalDeviceState", v120);
    if (v65)
    {
      if (v65 >= 8)
      {
        v66 = "-";
        if (v65 > 9) {
          v66 = "U";
        }
      }

      else
      {
        v66 = off_18A032D50[v65 - 1];
      }

      uint64_t v121 = (uint64_t)v66;
      NSAppendPrintF();
      id v67 = v7;

      id v7 = v67;
    }

    v68 = self->_peerHomeKitUserIdentifier;
    v69 = v68;
    if (v68)
    {
      uint64_t v121 = (uint64_t)v68;
      NSAppendPrintF();
      id v70 = v7;

      id v7 = v70;
    }

    uint64_t v71 = -[RPCompanionLinkDevice publicIdentifier](v5, "publicIdentifier");
    v72 = (void *)v71;
    if (v71)
    {
      uint64_t v121 = v71;
      NSAppendPrintF();
      id v73 = v7;

      id v7 = v73;
    }

    int v74 = -[RPCompanionLinkDevice personalRequestsState](v5, "personalRequestsState");
    if (v74)
    {
      if (v74 >= 8)
      {
        v75 = "-";
        if (v74 > 9) {
          v75 = "U";
        }
      }

      else
      {
        v75 = off_18A032D50[v74 - 1];
      }

      uint64_t v121 = (uint64_t)v75;
      NSAppendPrintF();
      id v76 = v7;

      id v7 = v76;
    }

    uint64_t v77 = -[RPCompanionLinkDevice roomName](v5, "roomName", v121);
    v78 = (void *)v77;
    if (v77)
    {
      unint64_t controlFlags = v77;
      NSAppendPrintF();
      id v79 = v7;

      id v7 = v79;
    }

    uint64_t v80 = -[RPEndpoint verifiedIdentity](v5, "verifiedIdentity");
    v81 = (void *)v80;
    if (v80)
    {
      unint64_t controlFlags = v80;
      NSAppendPrintF();
      id v82 = v7;

      id v7 = v82;
    }
  }

  if (a3 <= 20)
  {
    if (self->_controlFlags)
    {
      unint64_t controlFlags = self->_controlFlags;
      v126 = &unk_1873E6D77;
      NSAppendPrintF();
      id v83 = v7;

      id v7 = v83;
    }

    uint64_t v84 = -[RPCompanionLinkDevice deviceColor](v5, "deviceColor", controlFlags, v126);
    v85 = (void *)v84;
    if (v84)
    {
      uint64_t v122 = v84;
      NSAppendPrintF();
      id v86 = v7;

      id v7 = v86;
    }

    uint64_t v87 = -[RPCompanionLinkDevice deviceCapabilityFlags](v5, "deviceCapabilityFlags");
    if ((_DWORD)v87)
    {
      uint64_t v122 = v87;
      v128 = &unk_1873E6FFC;
      NSAppendPrintF();
      id v88 = v7;

      id v7 = v88;
    }

    uint64_t v89 = -[RPEndpoint serviceTypes](v5, "serviceTypes", v122, v128);
    v90 = (void *)v89;
    if (v89)
    {
      uint64_t v123 = v89;
      NSAppendPrintF();
      id v91 = v7;

      id v7 = v91;
    }
    v92 = -[RPCompanionLinkDevice siriInfo](v5, "siriInfo");
    v93 = v92;
    if (v92)
    {
      uint64_t v123 = [v92 count];
      NSAppendPrintF();
      id v94 = v7;

      id v7 = v94;
    }

    uint64_t v95 = -[RPEndpoint sourceVersion](v5, "sourceVersion");
    v96 = (void *)v95;
    if (v95)
    {
      uint64_t v123 = v95;
      NSAppendPrintF();
      id v97 = v7;

      id v7 = v97;
    }

    unsigned int flags = self->_flags;
    if (flags)
    {
      uint64_t v123 = RPCompanionLinkFlagsToShortString(flags, (uint64_t)v136);
      NSAppendPrintF();
      id v99 = v7;

      id v7 = v99;
    }

    unsigned int v100 = -[RPCompanionLinkDevice flags](v5, "flags", v123);
    if (v100)
    {
      uint64_t v124 = RPCompanionLinkFlagsToShortString(v100, (uint64_t)v136);
      NSAppendPrintF();
      id v101 = v7;

      id v7 = v101;
    }

    uint64_t v102 = -[RPEndpoint statusFlags](v5, "statusFlags", v124);
    if (v102)
    {
      uint64_t v125 = v102;
      v129 = &unk_1873E7012;
      NSAppendPrintF();
      id v103 = v7;

      id v7 = v103;
    }
    v104 = -[RPEndpoint verifiedAcl](v5, "verifiedAcl", v125, v129);
    if (v104)
    {
      NSAppendPrintF();
      id v105 = v7;

      id v7 = v105;
    }

    v106 = self->_btPipe;
    if (v106)
    {
      NSAppendPrintF();
      id v107 = v7;

      id v7 = v107;
    }

    v108 = self->_bleConnection;
    if (v108)
    {
      NSAppendPrintF();
      id v109 = v7;

      id v7 = v109;
    }

    v110 = self->_tcpConnection;
    if (v110)
    {
      NSAppendPrintF();
      id v111 = v7;

      id v7 = v111;
    }
  }

  id v112 = v7;

  return v112;
}

- (id)_getCurrentProcessName
{
  appID = self->_appID;
  if (appID)
  {
    v3 = appID;
  }

  else
  {
    [MEMORY[0x1896079D8] processInfo];
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 processName];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [MEMORY[0x1896079D8] processInfo];
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 processName];
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v3 = @"Unknown";
    }
  }

  return v3;
}

- (void)setFlowControlReadEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_flowControlReadEnabled != v3)
  {
    self->_flowControlReadEnabled = v3;
    int var0 = self->_ucat->var0;
    if (v3)
    {
      if (!self->_readFrame.readRequested) {
        -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrame,  self->_requestable);
      }
      if (self->_btPipeHighPriority)
      {
        if (!self->_readFrameBTPipeHighPriority.readRequested) {
          -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrameBTPipeHighPriority);
        }
      }
    }
  }

- (int)flowControlWriteState
{
  return -[CUTCPConnection flowControlState](self->_tcpConnection, "flowControlState");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];

  LogCategoryReplaceF();
}

- (void)setPresent:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_present != v3)
  {
    int var0 = self->_ucat->var0;
    self->_present = v3;
    if (v3)
    {
      probeTimer = self->_probeTimer;
      if (probeTimer)
      {
        v15 = probeTimer;
        dispatch_source_cancel(v15);
        id v7 = self->_probeTimer;
        self->_probeTimer = 0LL;

LABEL_19:
      }
    }

    else
    {
      if (!self->_tcpConnection)
      {
        int v14 = self->_ucat->var0;
        RPErrorF();
        v15 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
        -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v15);
        goto LABEL_19;
      }

      v8 = self->_probeTimer;
      if (v8)
      {
        v9 = v8;
        dispatch_source_cancel(v9);
        id v10 = self->_probeTimer;
        self->_probeTimer = 0LL;
      }

      v11 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      id v12 = self->_probeTimer;
      self->_probeTimer = v11;

      v13 = self->_probeTimer;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __27__RPConnection_setPresent___block_invoke;
      handler[3] = &unk_18A031A30;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v13, handler);
      CUDispatchTimerSet();
      dispatch_resume((dispatch_object_t)self->_probeTimer);
    }
  }

uint64_t __27__RPConnection_setPresent___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 96LL);
  if (v2)
  {
    BOOL v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = 0LL;
  }

  return [*(id *)(a1 + 32) sendReachabilityProbe:"not present"];
}

- (void)setTrafficFlags:(unsigned int)a3
{
  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_activateCalled)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      v4[0] = MEMORY[0x1895F87A8];
      v4[1] = 3221225472LL;
      v4[2] = __32__RPConnection_setTrafficFlags___block_invoke;
      v4[3] = &unk_18A032318;
      v4[4] = self;
      unsigned int v5 = a3;
      dispatch_async(dispatchQueue, v4);
    }
  }

uint64_t __32__RPConnection_setTrafficFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 776) setTrafficFlags:*(unsigned int *)(a1 + 40)];
}

- (void)activate
{
  self->_activateCalled = 1;
  -[RPConnection _updateLinkInfo](self, "_updateLinkInfo");
  if (self->_bonjourPeerDevice)
  {
    self->_clientMode = 1;
    -[RPCompanionLinkDevice updateWithBonjourDevice:](self->_peerDeviceInfo, "updateWithBonjourDevice:");
    -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 4);
    int var0 = self->_ucat->var0;
LABEL_21:
    identifierOverride = self->_identifierOverride;
    v8 = identifierOverride;
    id v24 = v8;
    if (v8)
    {
      -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:", v8);
      objc_storeStrong((id *)&self->_peerIdentifier, identifierOverride);
    }

    else if (self->_peerIdentifier)
    {
      -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:");
    }

    self->_activatedTicks = mach_absolute_time();
    -[RPConnection _getCurrentProcessName](self, "_getCurrentProcessName");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    initiator = self->_initiator;
    self->_initiator = v9;

    -[RPConnection _run](self, "_run");
    return;
  }

  if (self->_destinationString)
  {
    self->_clientMode = 1;
    int v4 = self->_ucat->var0;
    goto LABEL_21;
  }

  if (self->_blePeerIdentifier)
  {
    self->_clientMode = 1;
    -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 2);
    int v5 = self->_ucat->var0;
    goto LABEL_21;
  }

  if (self->_bleConnection)
  {
    self->_clientMode = 0;
    -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 2);
    objc_storeStrong((id *)&self->_requestable, self->_bleConnection);
    int v6 = self->_ucat->var0;
    goto LABEL_29;
  }

  if (self->_btPipe)
  {
    self->_clientMode = GestaltGetDeviceClass() == 6;
    -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x41);
    objc_storeStrong((id *)&self->_requestable, self->_btPipe);
    int v11 = self->_ucat->var0;
LABEL_29:
    RPDataLinkTypeToString(self->_linkType);
LABEL_20:
    LogPrintF();
    goto LABEL_21;
  }

  if (self->_tcpConnection)
  {
    self->_clientMode = 0;
    int linkType = self->_linkType;
    peerDeviceInfo = self->_peerDeviceInfo;
    uint64_t v14 = -[RPEndpoint statusFlags](peerDeviceInfo, "statusFlags");
    uint64_t v15 = 4LL;
    if (linkType == 4) {
      uint64_t v15 = 8LL;
    }
    -[RPEndpoint setStatusFlags:](peerDeviceInfo, "setStatusFlags:", v14 | v15);
    objc_storeStrong((id *)&self->_requestable, self->_tcpConnection);
    int v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
    {
      unint64_t controlFlags = self->_controlFlags;
      tcpConnection = self->_tcpConnection;
      v23 = RPDataLinkTypeToString(self->_linkType);
      unint64_t v20 = controlFlags;
      id v21 = &unk_1873E6D77;
      LogPrintF();
    }
    v19 = -[RPEndpoint ipAddress](self->_peerDeviceInfo, "ipAddress", v20, v21, tcpConnection, v23);
    if (v19)
    {
    }

    else if (self->_peerAddrString)
    {
      -[RPEndpoint setIpAddress:](self->_peerDeviceInfo, "setIpAddress:");
    }

    goto LABEL_21;
  }

  int v18 = self->_ucat->var0;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__RPConnection_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__RPConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__RPConnection_invalidateWithError___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __36__RPConnection_invalidateWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:*(void *)(a1 + 40)];
}

- (void)_invalidateWithError:(id)a3
{
  id v4 = a3;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    id v8 = v4;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
      {
        id v7 = v4;
        LogPrintF();
      }
    }

    -[RPConnection _invalidateCore:](self, "_invalidateCore:", v8, v7);
    -[RPConnection _invalidated](self, "_invalidated");
    id v4 = v8;
  }
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", 0LL);
    -[RPConnection _invalidated](self, "_invalidated");
  }

- (void)_invalidateCore:(id)a3
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v4 = (NSError *)a3;
  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    int v6 = bleConnectTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0LL;
  }

  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    v9 = idleTimer;
    dispatch_source_cancel(v9);
    id v10 = self->_idleTimer;
    self->_idleTimer = 0LL;
  }

  probeTimer = self->_probeTimer;
  if (probeTimer)
  {
    id v12 = probeTimer;
    dispatch_source_cancel(v12);
    v13 = self->_probeTimer;
    self->_probeTimer = 0LL;
  }

  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    uint64_t v15 = retryTimer;
    dispatch_source_cancel(v15);
    int v16 = self->_retryTimer;
    self->_retryTimer = 0LL;
  }

  startTimer = self->_startTimer;
  if (startTimer)
  {
    int v18 = startTimer;
    dispatch_source_cancel(v18);
    v19 = self->_startTimer;
    self->_startTimer = 0LL;
  }

  -[CUBLEConnection invalidate](self->_bleConnection, "invalidate");
  -[CUTCPConnection invalidate](self->_tcpConnection, "invalidate");
  unint64_t v20 = (void (**)(void, void))MEMORY[0x1895A4770](self->_readErrorHandler);
  if (v20)
  {
    if (v4) {
      RPNestedErrorF();
    }
    else {
      NSErrorWithOSStatusF();
    }
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v20)[2](v20, v21);
  }

  if (self->_showPasswordCalled)
  {
    self->_showPasswordCalled = 0;
    uint64_t v22 = MEMORY[0x1895A4770](self->_hidePasswordHandler);
    v23 = (void *)v22;
    if (v22) {
      (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0LL);
    }
  }

  stepError = v4;
  uint64_t v53 = v4;
  if (v4 || (stepError = self->_stepError) != 0LL)
  {
    uint64_t v25 = stepError;
  }

  else
  {
    RPErrorF();
    uint64_t v25 = (NSError *)objc_claimAutoreleasedReturnValue();
  }

  v26 = v25;
  -[RPConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v25);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v27 = self->_sendArray;
  uint64_t v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v58,  v63,  16LL);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v59;
    do
    {
      for (uint64_t i = 0LL; i != v29; ++i)
      {
        if (*(void *)v59 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        int var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v34 = [v32 requestID];
          id v35 = (void *)v34;
          if (v34)
          {
            v51 = (void *)v34;
            id v52 = v26;
            LogPrintF();
          }

          else
          {
            [v32 eventID];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            id v52 = v26;
            LogPrintF();
          }
        }

        objc_msgSend(v32, "timer", v51, v52);
        id v36 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
        [v32 setTimer:0];
        if (v36) {
          dispatch_source_cancel(v36);
        }
        [v32 completion];
        id v37 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        [v32 setCompletion:0];
        if (v37)
        {
          ((void (**)(void, NSError *))v37)[2](v37, v26);
        }

        else
        {
          [v32 responseHandler];
          v38 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          [v32 setResponseHandler:0];
          if (v38) {
            ((void (**)(void, void, void, NSError *))v38)[2](v38, 0LL, 0LL, v26);
          }
        }
      }

      uint64_t v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v58,  v63,  16LL);
    }

    while (v29);
  }

  -[NSMutableArray removeAllObjects](self->_sendArray, "removeAllObjects");
  sendArray = self->_sendArray;
  self->_sendArray = 0LL;

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v40 = self->_receivedMessages;
  uint64_t v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v54,  v62,  16LL);
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      for (uint64_t j = 0LL; j != v42; ++j)
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        int v46 = self->_ucat->var0;
        if (v46 <= 60 && (v46 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v47 = [v45 requestID];
          v48 = (void *)v47;
          if (v47)
          {
            v51 = (void *)v47;
            id v52 = v26;
            LogPrintF();
          }

          else
          {
            [v45 eventID];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            id v52 = v26;
            LogPrintF();
          }
        }

        objc_msgSend(v45, "responseHandler", v51, v52);
        id v49 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        [v45 setResponseHandler:0];
        if (v49) {
          ((void (**)(void, void, void, NSError *))v49)[2](v49, 0LL, 0LL, v26);
        }
      }

      uint64_t v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v54,  v62,  16LL);
    }

    while (v42);
  }

  -[NSMutableArray removeAllObjects](self->_receivedMessages, "removeAllObjects");
  receivedMessages = self->_receivedMessages;
  self->_receivedMessages = 0LL;

  -[RPConnection _logConnectionInvalidatedWithError:](self, "_logConnectionInvalidatedWithError:", v53);
}

- (void)_invalidated
{
  if (!self->_invalidateDone && !self->_bleConnection && !self->_tcpConnection)
  {
    -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
    -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
    startTimer = self->_startTimer;
    if (startTimer)
    {
      id v4 = startTimer;
      dispatch_source_cancel(v4);
      int v5 = self->_startTimer;
      self->_startTimer = 0LL;
    }

    int var0 = self->_ucat->var0;
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0LL;

    id configurePairingHandler = self->_configurePairingHandler;
    self->_id configurePairingHandler = 0LL;

    id flowControlWriteChangedHandler = self->_flowControlWriteChangedHandler;
    self->_id flowControlWriteChangedHandler = 0LL;

    id homeKitUserIdentifierHandler = self->_homeKitUserIdentifierHandler;
    self->_id homeKitUserIdentifierHandler = 0LL;

    -[NSMutableSet removeAllObjects](self->_inUseProcesses, "removeAllObjects");
    inUseProcesses = self->_inUseProcesses;
    self->_inUseProcesses = 0LL;

    id v13 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id pairVerifyCompletion = self->_pairVerifyCompletion;
    self->_id pairVerifyCompletion = 0LL;

    id showPasswordHandler = self->_showPasswordHandler;
    self->_id showPasswordHandler = 0LL;

    id hidePasswordHandler = self->_hidePasswordHandler;
    self->_id hidePasswordHandler = 0LL;

    id v17 = self->_homeKitUserIdentifierHandler;
    self->_id homeKitUserIdentifierHandler = 0LL;

    id promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_id promptForPasswordHandler = 0LL;

    -[NSMutableArray removeAllObjects](self->_proxyDevices, "removeAllObjects");
    proxyDevices = self->_proxyDevices;
    self->_proxyDevices = 0LL;

    id proxyDeviceUpdateHandler = self->_proxyDeviceUpdateHandler;
    self->_id proxyDeviceUpdateHandler = 0LL;

    id peerUpdatedHandler = self->_peerUpdatedHandler;
    self->_id peerUpdatedHandler = 0LL;

    id readErrorHandler = self->_readErrorHandler;
    self->_id readErrorHandler = 0LL;

    id receivedEventHandler = self->_receivedEventHandler;
    self->_id receivedEventHandler = 0LL;

    id receivedRequestHandler = self->_receivedRequestHandler;
    self->_id receivedRequestHandler = 0LL;

    id sessionStartHandler = self->_sessionStartHandler;
    self->_id sessionStartHandler = 0LL;

    id stateChangedHandler = self->_stateChangedHandler;
    self->_id stateChangedHandler = 0LL;

    self->_invalidateDone = 1;
  }

- (void)homeKitIdentityUpdated
{
  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0 && (self->_flags & 1) == 0)
  {
    if ((self->_statusFlags & 0x80000) != 0)
    {
      -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
      int v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 identifier];
      int v6 = (void *)objc_claimAutoreleasedReturnValue();

      id v7 = self->_peerHomeKitUserIdentifier;
      id v8 = v6;
      id v13 = v8;
      if (v7 == v8)
      {

        peerHomeKitUserIdentifier = v13;
        BOOL v3 = v13;
      }

      else
      {
        if ((v8 != 0LL) != (v7 == 0LL))
        {
          char v9 = -[NSString isEqual:](v7, "isEqual:", v8);

          if ((v9 & 1) != 0)
          {
            id v10 = v13;
LABEL_23:

            return;
          }
        }

        else
        {
        }

        BOOL v3 = v13;
        peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
        self->_peerHomeKitUserIdentifier = v3;
      }
    }

    else
    {
      BOOL v3 = (NSString *)objc_alloc_init(MEMORY[0x189603FC8]);
      -[RPConnection _identityProofsAdd:update:](self, "_identityProofsAdd:update:", v3, 1LL);
      if (-[NSString count](v3, "count"))
      {
        int var0 = self->_ucat->var0;
        -[RPConnection sendEncryptedEventID:event:options:completion:]( self,  "sendEncryptedEventID:event:options:completion:",  @"_systemInfoUpdate",  v3,  0LL,  0LL);
      }

      peerHomeKitUserIdentifier = self->_homeKitIdentityIdentifier;
      if (peerHomeKitUserIdentifier)
      {
        homeKitIdentitySignature = self->_homeKitIdentitySignature;
        if (homeKitIdentitySignature)
        {
          uint64_t v14 = peerHomeKitUserIdentifier;
          -[RPConnection _identityProofsVerifyHomeKitSignature:identifier:]( self,  "_identityProofsVerifyHomeKitSignature:identifier:",  homeKitIdentitySignature,  peerHomeKitUserIdentifier);
          peerHomeKitUserIdentifier = v14;
        }
      }
    }

    id v10 = v3;
    goto LABEL_23;
  }

- (void)sameAccountIdentityUpdated
{
  if (self->_pairVerifyCompleted
    && (self->_controlFlags & 0x200) == 0
    && (self->_flags & 1) == 0
    && (self->_statusFlags & 0x80000) == 0)
  {
    BOOL v3 = self->_identityDaemon;
    id v4 = v3;
    if (v3)
    {
      if (self->_identityKeyData && self->_identitySignature)
      {
        int v11 = v3;
        uint64_t v5 = (-[RPIdentityDaemon resolveIdentityTypesForSignature:data:typeFlags:]( v3,  "resolveIdentityTypesForSignature:data:typeFlags:") << 18) & 0x80000;
        -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | v5);
        self->_statusFlags |= v5;
        int var0 = self->_ucat->var0;
        uint64_t v9 = MEMORY[0x1895A4770](self->_peerUpdatedHandler);
        id v10 = (void *)v9;
        if (v9) {
          (*(void (**)(uint64_t))(v9 + 16))(v9);
        }
      }

      else
      {
        int v7 = self->_ucat->var0;
        if (v7 > 30) {
          goto LABEL_22;
        }
        int v11 = v3;
        if (v7 == -1)
        {
          int v8 = _LogCategory_Initialize();
          id v4 = v11;
          if (!v8) {
            goto LABEL_22;
          }
        }

        LogPrintF();
      }

      id v4 = v11;
    }

- (void)_logConnectionInvalidatedWithError:(id)a3
{
  id v4 = a3;
  mach_absolute_time();
  uint64_t v5 = UpTicksToSeconds();
  -[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkDevice mediaSystemIdentifier](self->_peerDeviceInfo, "mediaSystemIdentifier");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  id v9 = v7;
  id v10 = v9;
  if (v8 == v9)
  {
  }

  else
  {
    if ((v8 == 0LL) == (v9 != 0LL))
    {
      uint64_t v11 = 0LL;
      id v13 = v9;
      id v12 = v8;
      goto LABEL_9;
    }

    uint64_t v11 = [v8 isEqual:v9];

    if (!(_DWORD)v11) {
      goto LABEL_12;
    }
  }

  -[RPEndpoint model](self->_localDeviceInfo, "model");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (GestaltProductTypeStringToDeviceClass() != 7)
  {
    uint64_t v11 = 0LL;
    goto LABEL_11;
  }

  -[RPEndpoint model](self->_peerDeviceInfo, "model");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = GestaltProductTypeStringToDeviceClass() == 7;
LABEL_9:

LABEL_11:
LABEL_12:

  -[RPEndpoint model](self->_localDeviceInfo, "model");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = GestaltProductTypeStringToDeviceClass();
  RPDeviceClassToString(v15);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  -[RPEndpoint model](self->_peerDeviceInfo, "model");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = GestaltProductTypeStringToDeviceClass();
  RPDeviceClassToString(v17);
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[RPConnectionMetrics sharedMetrics](&OBJC_CLASS___RPConnectionMetrics, "sharedMetrics");
  LODWORD(v20) = self->_linkType;
  [v19 logConnectionWithDeviceModelFrom:v21 deviceModelTo:v18 error:v4 initiator:self->_initiator isOnDemand:(self->_controlFlags >> 9) & 1 isStereoPair:v11 lifetime:v5 linkType:v20];
}

- (void)_pairSetupInvalidate
{
  mainStream = self->_mainStream;
  self->_mainStream = 0LL;

  highPriorityStream = self->_highPriorityStream;
  self->_highPriorityStream = 0LL;

  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", 0LL);
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", 0LL);
  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0LL;
}

- (void)_pairVerifyInvalidate
{
  identityKeyData = self->_identityKeyData;
  if (identityKeyData)
  {
    id v4 = -[NSData bytes](identityKeyData, "bytes");
    rsize_t v5 = -[NSData length](self->_identityKeyData, "length");
    if (v4) {
      memset_s(v4, v5, 0, v5);
    }
  }

  identitySignature = self->_identitySignature;
  if (identitySignature)
  {
    int v7 = -[NSData bytes](identitySignature, "bytes");
    rsize_t v8 = -[NSData length](self->_identitySignature, "length");
    if (v7) {
      memset_s(v7, v8, 0, v8);
    }
  }

  homeKitIdentitySignature = self->_homeKitIdentitySignature;
  if (homeKitIdentitySignature)
  {
    id v10 = -[NSData bytes](homeKitIdentitySignature, "bytes");
    rsize_t v11 = -[NSData length](self->_homeKitIdentitySignature, "length");
    if (v10) {
      memset_s(v10, v11, 0, v11);
    }
  }

  id v12 = self->_identityKeyData;
  self->_identityKeyData = 0LL;

  id v13 = self->_identitySignature;
  self->_identitySignature = 0LL;

  homeKitIdentityIdentifier = self->_homeKitIdentityIdentifier;
  self->_homeKitIdentityIdentifier = 0LL;

  int v15 = self->_homeKitIdentitySignature;
  self->_homeKitIdentitySignature = 0LL;

  identityVerified = self->_identityVerified;
  self->_identityVerified = 0LL;

  mainStream = self->_mainStream;
  self->_mainStream = 0LL;

  highPriorityStream = self->_highPriorityStream;
  self->_highPriorityStream = 0LL;

  self->_pairVerifyIdentityType = 0;
  -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", 0LL);
  -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", 0LL);
  -[CUPairingSession invalidate](self->_pairVerifySession, "invalidate");
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0LL;
}

- (id)_pairVerifySignData:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  id v7 = a3;
  rsize_t v8 = self->_forcedSelfIdentity;
  char v9 = -[CUPairingSession peerAppFlags](self->_pairVerifySession, "peerAppFlags");
  if ((self->_controlFlags & 0x40) != 0 || (v9 & 1) != 0 || v8)
  {
    if (self->_clientMode)
    {
      if (!v8)
      {
LABEL_11:
        -[CUPairingSession copyIdentityHandler](self->_pairVerifySession, "copyIdentityHandler");
        rsize_t v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[CUPairingSession copyIdentityHandler](self->_pairVerifySession, "copyIdentityHandler");
          id v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          v12[2](v12, 2LL, 0LL);
          id v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            rsize_t v8 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
            [v13 altIRK];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[RPIdentity setDeviceIRKData:](v8, "setDeviceIRKData:", v14);

            [v13 publicKey];
            int v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[RPIdentity setEdPKData:](v8, "setEdPKData:", v15);

            [v13 secretKey];
            int v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[RPIdentity setEdSKData:](v8, "setEdSKData:", v16);

            if (v8) {
              goto LABEL_14;
            }
          }

          else
          {
          }
        }

        identityDaemon = self->_identityDaemon;
        id v28 = 0LL;
        -[RPIdentityDaemon identityOfSelfAndReturnError:](identityDaemon, "identityOfSelfAndReturnError:", &v28);
        rsize_t v8 = (RPIdentity *)objc_claimAutoreleasedReturnValue();
        id v17 = v28;
        if (!v8)
        {
          int var0 = self->_ucat->var0;
          if (a5)
          {
            id v17 = v17;
            rsize_t v8 = 0LL;
            v19 = 0LL;
            *a5 = v17;
          }

          else
          {
            rsize_t v8 = 0LL;
            v19 = 0LL;
          }

          goto LABEL_33;
        }

- (BOOL)_pairVerifyVerifySignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = self->_forcedPeerIdentity;
  char v13 = -[CUPairingSession peerAppFlags](self->_pairVerifySession, "peerAppFlags");
  unint64_t controlFlags = self->_controlFlags;
  if ((controlFlags & 0x40) != 0 || (v13 & 1) != 0 || v12)
  {
    self->_pairVerifyUsedIdentity = 1;
    if (v12)
    {
      id v16 = 0LL;
    }

    else
    {
      uint64_t v17 = controlFlags & 0x400000000000LL;
      if (self->_pairVerifyAuthType != 8 && v17 == 0) {
        uint64_t v19 = 19498LL;
      }
      else {
        uint64_t v19 = 19458LL;
      }
      identityDaemon = self->_identityDaemon;
      id v27 = 0LL;
      -[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]( identityDaemon,  "resolveIdentityForSignature:data:typeFlags:error:",  v10,  v11,  v19,  &v27);
      id v12 = (RPIdentity *)objc_claimAutoreleasedReturnValue();
      id v16 = v27;
      if (!v12)
      {
        int var0 = self->_ucat->var0;
        if (a6)
        {
          id v16 = v16;
          BOOL v24 = 0;
          id v12 = 0LL;
          *a6 = v16;
        }

        else
        {
          BOOL v24 = 0;
          id v12 = 0LL;
        }

        goto LABEL_25;
      }
    }

    objc_storeStrong((id *)&self->_identityKeyData, a4);
    objc_storeStrong((id *)&self->_identitySignature, a3);
    objc_storeStrong((id *)&self->_identityVerified, v12);
    -[RPIdentity identifier](v12, "identifier");
    int v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPEndpoint setVerifiedIdentity:](self->_peerDeviceInfo, "setVerifiedIdentity:", v21);

    self->_pairVerifyIdentityType = -[RPIdentity type](v12, "type");
    int v22 = self->_ucat->var0;
    BOOL v24 = 1;
LABEL_25:

    goto LABEL_30;
  }

  int v15 = self->_ucat->var0;
  if (a6)
  {
    id v25 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-6714 userInfo:0];
    *a6 = v25;
  }

  BOOL v24 = 0;
LABEL_30:

  return v24;
}

- (void)_pskPrepare:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x18960ED88]);
  pskData = self->_pskData;
  id v19 = 0LL;
  char v7 = [v5 prepareWithName:@"main" isClient:v3 pskData:pskData error:&v19];
  id v8 = v19;
  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_mainStream, v5);
    self->_mainAuthTagLength = [v5 authTagLength];
    if (self->_btPipeHighPriority)
    {
      char v9 = (NSError *)objc_alloc_init(MEMORY[0x18960ED88]);
      id v10 = self->_pskData;
      id v18 = v8;
      char v11 = -[NSError prepareWithName:isClient:pskData:error:]( v9,  "prepareWithName:isClient:pskData:error:",  @"hipri",  v3,  v10,  &v18);
      id v12 = v18;

      if ((v11 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_highPriorityStream, v9);
        self->_highPriorityAuthTagLength = -[NSError authTagLength](v9, "authTagLength");
      }

      else
      {
        int var0 = self->_ucat->var0;
        if (!self->_stepError)
        {
          RPNestedErrorF();
          id v16 = (NSError *)objc_claimAutoreleasedReturnValue();
          stepError = self->_stepError;
          self->_stepError = v16;
        }
      }

      id v8 = v12;
      goto LABEL_18;
    }
  }

  else
  {
    int v13 = self->_ucat->var0;
    if (!self->_stepError)
    {
      RPNestedErrorF();
      int v15 = (NSError *)objc_claimAutoreleasedReturnValue();
      char v9 = self->_stepError;
      self->_stepError = v15;
LABEL_18:
    }
  }
}

- (unint64_t)statusFlagsUsingIdentities:(id)a3
{
  return 0LL;
}

- (void)_run
{
  if (self->_clientMode) {
    -[RPConnection _clientRun](self, "_clientRun");
  }
  else {
    -[RPConnection _serverRun](self, "_serverRun");
  }
}

- (void)sessionStopped:(id)a3
{
}

- (void)tryPassword:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientMode)
  {
    int var0 = self->_ucat->var0;
LABEL_9:
    LogPrintF();
    goto LABEL_13;
  }

  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    -[CUPairingSession tryPIN:](pairSetupSession, "tryPIN:", v7);
    goto LABEL_13;
  }

  int v6 = self->_ucat->var0;
LABEL_13:
}

- (void)_updateExternalState
{
  int internalState = self->_internalState;
  BOOL v4 = internalState == 21 || internalState == 28;
  int state = self->_state;
  if (state != v4)
  {
    int var0 = self->_ucat->var0;
    self->_int state = v4;
    id stateChangedHandler = (void (**)(id, BOOL))self->_stateChangedHandler;
    if (stateChangedHandler) {
      stateChangedHandler[2](stateChangedHandler, v4);
    }
  }

- (void)_updateLinkInfo
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  tcpConnection = self->_tcpConnection;
  if (tcpConnection)
  {
    -[CUTCPConnection peerAddr](tcpConnection, "peerAddr");
    char v20 = 0;
    SockAddrToString();
    peerAddrString = self->_peerAddrString;
    self->_peerAddrString = 0LL;

    int v6 = self->_tcpConnection;
    if (v6) {
      -[CUTCPConnection selfAddr](v6, "selfAddr");
    }
    char v19 = 0;
    SockAddrToString();
  }

  else
  {
    BOOL v4 = self->_peerAddrString;
    self->_peerAddrString = 0LL;
  }

  selfAddrString = self->_selfAddrString;
  self->_selfAddrString = 0LL;

  id v8 = self->_tcpConnection;
  if (v8)
  {
    char v9 = -[CUTCPConnection netTransportType](v8, "netTransportType");
    if ((v9 & 2) != 0) {
      int v10 = 6;
    }
    else {
      int v10 = 3;
    }
    if ((v9 & 8) != 0) {
      int v11 = 8;
    }
    else {
      int v11 = v10;
    }
    if (v9 < 0) {
      int v12 = 5;
    }
    else {
      int v12 = v11;
    }
    if ((v9 & 1) != 0) {
      int v13 = 7;
    }
    else {
      int v13 = v12;
    }
    if ((v9 & 0x10) != 0) {
      int v14 = 9;
    }
    else {
      int v14 = v13;
    }
    if ((v9 & 4) != 0) {
      int v15 = 4;
    }
    else {
      int v15 = v14;
    }
  }

  else if (self->_blePeerIdentifier || self->_bleConnection)
  {
    int v15 = 1;
  }

  else if (self->_btPipe)
  {
    int v15 = 2;
  }

  else
  {
    bonjourPeerDevice = self->_bonjourPeerDevice;
    if (bonjourPeerDevice)
    {
      -[CUBonjourDevice deviceInfo](bonjourPeerDevice, "deviceInfo");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      char Int64Ranged = CFDictionaryGetInt64Ranged();

      if ((Int64Ranged & 4) != 0)
      {
        int v15 = 4;
      }

      else if ((Int64Ranged & 0x10) != 0)
      {
        int v15 = 9;
      }

      else if ((Int64Ranged & 1) != 0)
      {
        int v15 = 7;
      }

      else if (Int64Ranged < 0)
      {
        int v15 = 5;
      }

      else if ((Int64Ranged & 8) != 0)
      {
        int v15 = 8;
      }

      else if ((Int64Ranged & 2) != 0)
      {
        int v15 = 6;
      }

      else
      {
        int v15 = 3;
      }
    }

    else if (self->_destinationString)
    {
      int v15 = 3;
    }

    else
    {
      int v15 = 0;
    }
  }

  if (v15 != self->_linkType) {
    self->_int linkType = v15;
  }
}

- (void)_clientRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unsigned int internalState = self->_internalState;
      switch(internalState)
      {
        case 0u:
          goto LABEL_38;
        case 0xAu:
          self->_unsigned int internalState = 11;
          -[RPConnection _clientConnectStart](self, "_clientConnectStart");
          goto LABEL_64;
        case 0xBu:
          if (self->_stepError) {
            goto LABEL_31;
          }
          if (!self->_stepDone) {
            goto LABEL_64;
          }
          if (self->_preAuthEnabled)
          {
            int v4 = 12;
            goto LABEL_63;
          }

- (void)_clientConnectStart
{
  int var0 = self->_ucat->var0;
  if (self->_blePeerIdentifier)
  {
    -[RPConnection _clientConnectStartBLE](self, "_clientConnectStartBLE");
  }

  else if (self->_btPipe)
  {
    -[RPConnection _clientConnectStartBTPipe](self, "_clientConnectStartBTPipe");
  }

  else
  {
    -[RPConnection _clientConnectStartTCP](self, "_clientConnectStartTCP");
  }

- (void)_clientConnectStartBLE
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  -[CUBLEConnection invalidate](self->_bleConnection, "invalidate");
  id v4 = objc_alloc_init(MEMORY[0x18960ED10]);
  objc_storeStrong((id *)&self->_bleConnection, v4);
  [v4 setClientBundleID:self->_clientBundleID];
  [v4 setClientUseCase:self->_bleClientUseCase];
  if (self->_bleConnectionPSM) {
    uint64_t bleConnectionPSM = self->_bleConnectionPSM;
  }
  else {
    uint64_t bleConnectionPSM = 129LL;
  }
  [v4 setDestinationPSM:bleConnectionPSM];
  [v4 setDestinationUUID:self->_blePeerIdentifier];
  [v4 setDispatchQueue:self->_dispatchQueue];
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  [v4 setLabel:label];
  if (self->_clientBundleID)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [v4 clientBundleID];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v4, "clientUseCase"));
      int v16 = v8;
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __38__RPConnection__clientConnectStartBLE__block_invoke;
  v21[3] = &unk_18A031A58;
  v21[4] = v4;
  v21[5] = self;
  objc_msgSend(v4, "setErrorHandler:", v21, v16, v17);
  v20[0] = v9;
  v20[1] = 3221225472LL;
  v20[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_2;
  v20[3] = &unk_18A031AE8;
  v20[4] = v4;
  v20[5] = self;
  [v4 setInvalidationHandler:v20];
  v19[0] = v9;
  v19[1] = 3221225472LL;
  v19[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_3;
  v19[3] = &unk_18A031A58;
  v19[4] = v4;
  v19[5] = self;
  [v4 activateWithCompletion:v19];
  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    BOOL v11 = bleConnectTimer;
    dispatch_source_cancel(v11);
    uint64_t v12 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0LL;
  }

  int v13 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  int v14 = self->_bleConnectTimer;
  self->_bleConnectTimer = v13;

  int v15 = self->_bleConnectTimer;
  handler[0] = v9;
  handler[1] = 3221225472LL;
  handler[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_4;
  handler[3] = &unk_18A031A30;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v15, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_bleConnectTimer);
}

void *__38__RPConnection__clientConnectStartBLE__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[59]) {
    return (void *)[result _clientNetworkError:a2 label:"BLE cnx error"];
  }
  return result;
}

uint64_t __38__RPConnection__clientConnectStartBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 472))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 296);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    id v5 = *(void **)(v1 + 472);
    *(void *)(v1 + 472) = 0LL;

    uint64_t v6 = *(void *)(v2 + 40);
    id v7 = *(void **)(v6 + 256);
    *(void *)(v6 + 256) = 0LL;

    result = *(void *)(v2 + 40);
    if (*(_BYTE *)(result + 80)) {
      return [(id)result _invalidated];
    }
  }

  return result;
}

void __38__RPConnection__clientConnectStartBLE__block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 472))
  {
    objc_storeStrong((id *)(v4 + 256), v3);
    id v6 = a2;
    [*(id *)(a1 + 40) _clientConnectCompleted:v6];
  }

void __38__RPConnection__clientConnectStartBLE__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0LL;
  }

  id v6 = *(void **)(a1 + 32);
  RPErrorF();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _clientConnectCompleted:v7];
}

- (void)_clientConnectStartBTPipe
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__RPConnection__clientConnectStartBTPipe__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__RPConnection__clientConnectStartBTPipe__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clientConnectCompleted:0];
}

- (void)_clientConnectStartTCP
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  -[CUTCPConnection invalidate](self->_tcpConnection, "invalidate");
  id v4 = objc_alloc_init(MEMORY[0x18960EDA8]);
  objc_storeStrong((id *)&self->_tcpConnection, v4);
  [v4 setConnectTimeoutSecs:30.0];
  [v4 setDataTimeoutSecs:20.0];
  [v4 setDestinationBonjour:self->_bonjourPeerDevice];
  [v4 setDestinationString:self->_destinationString];
  [v4 setDispatchQueue:self->_dispatchQueue];
  unsigned int keepAliveSeconds = self->_keepAliveSeconds;
  if (keepAliveSeconds) {
    uint64_t v6 = keepAliveSeconds;
  }
  else {
    uint64_t v6 = 150LL;
  }
  [v4 setKeepAliveIdleSeconds:v6];
  [v4 setKeepAliveIntervalSeconds:10];
  [v4 setKeepAliveMaxCount:3];
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  [v4 setLabel:label];
  [v4 setTrafficFlags:self->_trafficFlags];
  unint64_t controlFlags = self->_controlFlags;
  if ((controlFlags & 1) != 0) {
    int v9 = 57;
  }
  else {
    int v9 = 41;
  }
  [v4 setFlags:(controlFlags >> 12) & 0x80 | v9];
  uint64_t v10 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __38__RPConnection__clientConnectStartTCP__block_invoke;
  v14[3] = &unk_18A031A58;
  v14[4] = v4;
  v14[5] = self;
  [v4 setErrorHandler:v14];
  if (self->_flowControlWriteChangedHandler)
  {
    v13[0] = v10;
    v13[1] = 3221225472LL;
    v13[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_2;
    v13[3] = &unk_18A031AE8;
    v13[4] = v4;
    v13[5] = self;
    [v4 setFlowControlChangedHandler:v13];
  }

  v12[0] = v10;
  v12[1] = 3221225472LL;
  v12[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_3;
  v12[3] = &unk_18A031AE8;
  v12[4] = v4;
  v12[5] = self;
  [v4 setInvalidationHandler:v12];
  v11[0] = v10;
  v11[1] = 3221225472LL;
  v11[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_4;
  v11[3] = &unk_18A031A58;
  v11[4] = v4;
  v11[5] = self;
  [v4 activateWithCompletion:v11];
}

void *__38__RPConnection__clientConnectStartTCP__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == result[97]) {
    return (void *)[result _clientNetworkError:a2 label:"TCP cnx error"];
  }
  return result;
}

void __38__RPConnection__clientConnectStartTCP__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 776))
  {
    uint64_t v2 = (void (**)(void))MEMORY[0x1895A4770](*(void *)(v1 + 560));
    if (v2)
    {
      uint64_t v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __38__RPConnection__clientConnectStartTCP__block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 776))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 296);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }

    id v5 = *(void **)(v1 + 776);
    *(void *)(v1 + 776) = 0LL;

    uint64_t v6 = *(void *)(v2 + 40);
    id v7 = *(void **)(v6 + 256);
    *(void *)(v6 + 256) = 0LL;

    result = *(void *)(v2 + 40);
    if (*(_BYTE *)(result + 80)) {
      return [(id)result _invalidated];
    }
  }

  return result;
}

void __38__RPConnection__clientConnectStartTCP__block_invoke_4(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 776))
  {
    objc_storeStrong((id *)(v4 + 256), v3);
    id v6 = a2;
    [*(id *)(a1 + 40) _clientConnectCompleted:v6];
  }

- (void)_clientConnectCompleted:(id)a3
{
  id v4 = a3;
  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    id v6 = bleConnectTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0LL;
  }

  if (v4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v20 = v4;
      LogPrintF();
    }

    if (!self->_stepError)
    {
      RPNestedErrorF();
      unsigned int v17 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v17;
    }
  }

  else
  {
    -[RPConnection _updateLinkInfo](self, "_updateLinkInfo");
    if (self->_linkType == 4)
    {
      -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") & 0xFFFFFFFFFFEFFFE0LL);
      -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 8);
    }

    -[RPEndpoint ipAddress](self->_peerDeviceInfo, "ipAddress");
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
    }

    else if (self->_peerAddrString)
    {
      -[RPEndpoint setIpAddress:](self->_peerDeviceInfo, "setIpAddress:");
    }

    startTimer = self->_startTimer;
    if (startTimer)
    {
      BOOL v11 = startTimer;
      dispatch_source_cancel(v11);
      uint64_t v12 = self->_startTimer;
      self->_startTimer = 0LL;
    }

    int v13 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    int v14 = self->_startTimer;
    self->_startTimer = v13;

    int v15 = self->_startTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __40__RPConnection__clientConnectCompleted___block_invoke;
    handler[3] = &unk_18A031A30;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v15, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_startTimer);
    if (!self->_readFrame.readRequested)
    {
      int v16 = self->_ucat->var0;
      -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrame,  self->_requestable);
    }

    if (self->_btPipeHighPriority && !self->_readFrameBTPipeHighPriority.readRequested)
    {
      int v19 = self->_ucat->var0;
      -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrameBTPipeHighPriority,  self->_btPipeHighPriority);
    }

    self->_stepDone = 1;
  }

  -[RPConnection _run](self, "_run", v20);
}

uint64_t __40__RPConnection__clientConnectCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128LL);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0LL;
  }

  id v6 = *(void **)(a1 + 32);
  if (!v6[18])
  {
    uint64_t v7 = RPErrorF();
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 144);
    *(void *)(v8 + 144) = v7;

    id v6 = *(void **)(a1 + 32);
  }

  return [v6 _run];
}

- (BOOL)_clientError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v24 = v4;
    LogPrintF();
  }

  bleConnectTimer = self->_bleConnectTimer;
  if (bleConnectTimer)
  {
    uint64_t v7 = bleConnectTimer;
    dispatch_source_cancel(v7);
    uint64_t v8 = self->_bleConnectTimer;
    self->_bleConnectTimer = 0LL;
  }

  startTimer = self->_startTimer;
  if (startTimer)
  {
    uint64_t v10 = startTimer;
    dispatch_source_cancel(v10);
    BOOL v11 = self->_startTimer;
    self->_startTimer = 0LL;
  }

  if (v4)
  {
    -[RPConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v4);
  }

  else
  {
    RPErrorF();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v12);
  }

  -[CUBLEConnection invalidate](self->_bleConnection, "invalidate", v24);
  -[CUTCPConnection invalidate](self->_tcpConnection, "invalidate");
  if (self->_btPipe) {
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", v4);
  }
  uint64_t v13 = [v4 code];
  if (v13 == -6776)
  {
    int v14 = self->_ucat->var0;
    goto LABEL_35;
  }

  if ((self->_controlFlags & 0x200) != 0)
  {
    int v19 = self->_ucat->var0;
LABEL_35:
    LogPrintF();
LABEL_46:
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v4);
    BOOL v21 = 0;
    goto LABEL_47;
  }

  bonjourPeerDevice = self->_bonjourPeerDevice;
  if (bonjourPeerDevice)
  {
    uint64_t retryCount = self->_retryCount;
    if ((int)retryCount >= 10)
    {
      uint64_t v17 = v13;
      int v18 = self->_ucat->var0;
      if (v18 > 30) {
        goto LABEL_41;
      }
      if (v18 == -1)
      {
        if (!_LogCategory_Initialize())
        {
LABEL_41:
          if (v17 == -6754
            && (-[RPIdentity type](self->_identityResolved, "type") == 8
             || -[RPIdentity type](self->_identityResolved, "type") == 9))
          {
            uint64_t v22 = mach_absolute_time();
            -[RPIdentity setDisabledUntilTicks:]( self->_identityResolved,  "setDisabledUntilTicks:",  SecondsToUpTicks() + v22);
          }

          -[CUBonjourDevice reconfirm](self->_bonjourPeerDevice, "reconfirm", v25, v26);
          goto LABEL_46;
        }

        uint64_t retryCount = self->_retryCount;
        bonjourPeerDevice = self->_bonjourPeerDevice;
      }

      uint64_t v25 = retryCount;
      v26 = bonjourPeerDevice;
      LogPrintF();
      goto LABEL_41;
    }
  }

  int v20 = self->_ucat->var0;
  if (!self->_present)
  {
    goto LABEL_35;
  }

  BOOL v21 = 1;
LABEL_47:

  return v21;
}

- (void)_clientNetworkError:(id)a3 label:(const char *)a4
{
  id v9 = a3;
  if ([v9 code] == -6758)
  {
    -[RPConnection sendReachabilityProbe:](self, "sendReachabilityProbe:", "client no ack");
  }

  else
  {
    if (!self->_stepError)
    {
      uint64_t v8 = a4;
      RPNestedErrorF();
      id v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v6;
    }

    -[RPConnection _run](self, "_run", v8);
  }
}

- (void)_clientPreAuthStart
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v7 setObject:@"630.42.2" forKeyedSubscript:@"_sv"];
  int var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    id v5 = v7;
    if (var0 == -1)
    {
      id v5 = v7;
    }

    id v6 = v5;
    LogPrintF();
  }

- (void)_clientPreAuthResponseWithData:(id)a3
{
  id v4 = (void *)OPACKDecodeData();
  if (!v4 || v9)
  {
    int var0 = self->_ucat->var0;
LABEL_13:
    LogPrintF();
    goto LABEL_23;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = self->_ucat->var0;
    goto LABEL_13;
  }

  int v5 = self->_ucat->var0;
  if (self->_internalState != 13)
  {
    goto LABEL_13;
  }

  stepError = self->_stepError;
  self->_stepError = 0LL;

  self->_stepDone = 1;
  -[RPConnection _run](self, "_run");
LABEL_23:
}

- (void)_clientPairSetupStart
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  id v4 = (CUPairingSession *)objc_alloc_init(MEMORY[0x18960ED80]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v4;

  -[CUPairingSession setDispatchQueue:](self->_pairSetupSession, "setDispatchQueue:", self->_dispatchQueue);
  -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", self->_pairSetupFlags);
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  -[CUPairingSession setLabel:](self->_pairSetupSession, "setLabel:", label);
  -[CUPairingSession setSessionType:](self->_pairSetupSession, "setSessionType:", 1LL);
  if (-[NSArray count](self->_allowedMACAddresses, "count")) {
    -[CUPairingSession setAllowedMACAddresses:]( self->_pairSetupSession,  "setAllowedMACAddresses:",  self->_allowedMACAddresses);
  }
  if ((self->_controlFlags & 0x1000000000LL) != 0)
  {
    int var0 = self->_ucat->var0;
    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v8 setObject:&unk_18A04DE88 forKeyedSubscript:@"RPIdentityFeatureFlags"];
    -[CUPairingSession setAdditionalPeerInfo:](self->_pairSetupSession, "setAdditionalPeerInfo:", v8);
  }

  if (-[NSString length](self->_password, "length"))
  {
    password = (const __CFString *)self->_password;
    uint64_t v10 = self->_pairSetupSession;
LABEL_14:
    -[CUPairingSession setFixedPIN:](v10, "setFixedPIN:", password);
    goto LABEL_16;
  }

  if (!self->_passwordType)
  {
    uint64_t v10 = self->_pairSetupSession;
    password = @"public";
    goto LABEL_14;
  }

uint64_t __37__RPConnection__clientPairSetupStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _clientPairSetupPromptWithFlags:a2 throttleSeconds:a3 handler:*(void *)(a1 + 40)];
}

void __37__RPConnection__clientPairSetupStart__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  int v5 = (objc_class *)MEMORY[0x189603FC8];
  id v6 = a3;
  id v11 = objc_alloc_init(v5);
  [v11 setObject:v6 forKeyedSubscript:@"_pd"];

  int v7 = *(_DWORD **)(a1 + 32);
  if (v7[50] == 8)
  {
    [MEMORY[0x189607968] numberWithInt:8];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v8 forKeyedSubscript:@"_auTy"];

    int v7 = *(_DWORD **)(a1 + 32);
  }

  if (v7[86])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v9 forKeyedSubscript:@"_pwTy"];

    int v7 = *(_DWORD **)(a1 + 32);
  }

  if ((a2 & 1) != 0) {
    uint64_t v10 = 3LL;
  }
  else {
    uint64_t v10 = 4LL;
  }
  [v7 _sendFrameType:v10 unencryptedObject:v11];
}

uint64_t __37__RPConnection__clientPairSetupStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _clientPairSetupCompleted:a2];
}

- (void)_clientPairSetupWithData:(id)a3
{
  id v4 = a3;
  if (self->_pairSetupSession)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = (void *)[v4 length];
      LogPrintF();
    }

    id v6 = (void *)OPACKDecodeData();
    if (!v6)
    {
      id v10 = RPErrorF();
      id v8 = 0LL;
      goto LABEL_11;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (CFDictionaryGetInt64Ranged())
      {
        CFStringGetTypeID();
        uint64_t TypedValue = CFDictionaryGetTypedValue();
        uint64_t v13 = &stru_18A035BB8;
        if (TypedValue) {
          uint64_t v13 = (const __CFString *)TypedValue;
        }
        uint64_t v15 = (void *)v13;
      }

      else
      {
        CFDataGetTypeID();
        uint64_t v7 = CFDictionaryGetTypedValue();
        if (v7)
        {
          id v8 = (void *)v7;
          -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v7);
LABEL_11:
          int v9 = 0LL;
          goto LABEL_12;
        }
      }

      RPErrorF();
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      RPErrorF();
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    RPErrorF();
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = 0LL;
  }

  if (v9)
  {
    int v14 = self->_ucat->var0;
    if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPConnection _clientPairSetupCompleted:](self, "_clientPairSetupCompleted:", v9, v9);
    }

    else
    {
      -[RPConnection _clientPairSetupCompleted:](self, "_clientPairSetupCompleted:", v9, v15);
    }
  }

  id v8 = 0LL;
LABEL_12:
}

- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  pairSetupSession = self->_pairSetupSession;
  id v11 = (void (**)(id, uint64_t, uint64_t))a5;
  unsigned int v9 = -[CUPairingSession pinTypeActual](pairSetupSession, "pinTypeActual") - 1;
  if (v9 > 7) {
    int v10 = 0;
  }
  else {
    int v10 = dword_1873E7288[v9];
  }
  self->_passwordTypeActual = v10;
  v11[2](v11, v6, v5);
}

- (void)_clientPairSetupCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    pairSetupSession = self->_pairSetupSession;
    id v23 = 0LL;
    -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", @"main", &v23);
    uint64_t v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
    id v8 = v23;
    mainStream = self->_mainStream;
    self->_mainStream = v7;

    int v10 = self->_mainStream;
    if (!v10)
    {
      id v13 = v8;
      if (!v8) {
        goto LABEL_23;
      }
      goto LABEL_16;
    }

    self->_mainAuthTagLength = -[CUPairingStream authTagLength](v10, "authTagLength");
    if (self->_btPipeHighPriority)
    {
      id v11 = self->_pairSetupSession;
      id v22 = v8;
      -[CUPairingSession openStreamWithName:error:](v11, "openStreamWithName:error:", @"hipri", &v22);
      id v12 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      id v13 = v22;

      highPriorityStream = self->_highPriorityStream;
      self->_highPriorityStream = v12;

      uint64_t v15 = self->_highPriorityStream;
      if (!v15) {
        goto LABEL_15;
      }
      self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v15, "authTagLength");
    }

    else
    {
      id v13 = v8;
    }

    self->_statusFlags &= 0xFFFFFFEFFFF51FFFLL;
    if ((-[CUPairingSession flags](self->_pairSetupSession, "flags") & 0x10) != 0)
    {
      unsigned int v16 = self->_flags | 1;
    }

    else
    {
      self->_statusFlags |= 0x8000uLL;
      unsigned int v16 = self->_flags & 0xFFFFFFFE;
    }

    self->_unsigned int flags = v16;
    int var0 = self->_ucat->var0;
    self->_stepDone = 1;
LABEL_15:
    if (!v13) {
      goto LABEL_23;
    }
    goto LABEL_16;
  }

  id v13 = v4;
LABEL_16:
  int v18 = self->_ucat->var0;
  if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
  {
    id v21 = v13;
    LogPrintF();
  }

  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, v13);
  }
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v21);
LABEL_23:
  uint64_t v19 = MEMORY[0x1895A4770](self->_authCompletionHandler);
  int v20 = (void *)v19;
  if (v19) {
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v13);
  }

  -[RPConnection _run](self, "_run");
}

- (void)_clientPairVerifyStart
{
  v36[1] = *MEMORY[0x1895F89C0];
  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
  self->_pairVerifyCompleted = 0;
  self->_pairVerifyUsedIdentity = 0;
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  id v4 = (CUPairingSession *)objc_alloc_init(MEMORY[0x18960ED80]);
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = v4;

  -[CUPairingSession setDispatchQueue:](self->_pairVerifySession, "setDispatchQueue:", self->_dispatchQueue);
  -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", self->_pairVerifyFlags);
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  -[CUPairingSession setLabel:](self->_pairVerifySession, "setLabel:", label);
  -[CUPairingSession setSessionType:](self->_pairVerifySession, "setSessionType:", 3LL);
  unint64_t controlFlags = self->_controlFlags;
  if ((controlFlags & 0x20000000) != 0)
  {
    id v35 = @"_cf";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:controlFlags & 0x20000000];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setAppInfoSelf:](self->_pairVerifySession, "setAppInfoSelf:", v9);

    unint64_t controlFlags = self->_controlFlags;
  }

  self->_unsigned int pairVerifyAuthType = 0;
  uint64_t passwordType = self->_passwordType;
  int preferredIdentityType = self->_preferredIdentityType;
  uint64_t v12 = MEMORY[0x1895F87A8];
  if (preferredIdentityType == 2)
  {
    if ((controlFlags & 0xC00000000000LL) != 0)
    {
LABEL_8:
      self->_unsigned int pairVerifyAuthType = 8;
      self->_pairSetupAuthType = 8;
      -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFE3LL);
LABEL_9:
      -[CUPairingSession setSelfAppFlags:](self->_pairVerifySession, "setSelfAppFlags:", 1LL);
      goto LABEL_32;
    }
  }

  else
  {
    if ((controlFlags & 0x8000000) != 0)
    {
      unsigned int pairVerifyAuthType = 2;
      self->_unsigned int pairVerifyAuthType = 2;
      goto LABEL_37;
    }

    switch(preferredIdentityType)
    {
      case 13:
        goto LABEL_8;
      case 9:
        self->_unsigned int pairVerifyAuthType = 3;
        -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
        int v14 = self->_pairVerifySession;
        uint64_t v15 = -[CUPairingSession flags](v14, "flags") | 0x4000000;
        goto LABEL_31;
      case 8:
        goto LABEL_29;
    }

    if ((controlFlags & 0xC00000000000LL) != 0) {
      goto LABEL_8;
    }
    if (preferredIdentityType == 15 && self->_configurePairingHandler)
    {
      self->_unsigned int pairVerifyAuthType = 9;
      -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
      -[CUPairingSession setSelfAppFlags:](self->_pairVerifySession, "setSelfAppFlags:", 1LL);
      (*((void (**)(void))self->_configurePairingHandler + 2))();
      goto LABEL_32;
    }
  }

  if (((controlFlags & 0x400) != 0 || (self->_flags & 1) != 0 || (controlFlags & 0x8000000000LL) != 0)
    && (_DWORD)passwordType)
  {
    if ((_DWORD)passwordType == 4)
    {
      self->_unsigned int pairVerifyAuthType = 7;
      -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
      int v14 = self->_pairVerifySession;
      uint64_t v15 = -[CUPairingSession flags](v14, "flags") | 0x1000;
LABEL_31:
      -[CUPairingSession setFlags:](v14, "setFlags:", v15);
      goto LABEL_32;
    }

void __38__RPConnection__clientPairVerifyStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  if ((a2 & 1) != 0)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v7 forKeyedSubscript:@"_auTy"];
    }

    uint64_t v6 = 5LL;
  }

  else
  {
    uint64_t v6 = 6LL;
  }

  [v5 setObject:v8 forKeyedSubscript:@"_pd"];
  [*(id *)(a1 + 32) _sendFrameType:v6 unencryptedObject:v5];
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) _pairVerifySignData:a3 flags:a2 error:a4];
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _pairVerifyVerifySignature:a4 data:a3 flags:a2 error:a5];
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _clientPairVerifyCompleted:a2];
}

- (void)_clientPairVerifyWithData:(id)a3
{
  id v4 = a3;
  if (self->_pairVerifySession)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = (void *)[v4 length];
      LogPrintF();
    }

    uint64_t v6 = (void *)OPACKDecodeData();
    if (!v6)
    {
      id v10 = RPErrorF();
      id v8 = 0LL;
      goto LABEL_10;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CFDataGetTypeID();
      uint64_t v7 = CFDictionaryGetTypedValue();
      if (v7)
      {
        id v8 = (void *)v7;
        -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v7);
LABEL_10:
        unsigned int v9 = 0LL;
        goto LABEL_11;
      }

      RPErrorF();
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      RPErrorF();
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    RPErrorF();
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 0LL;
  }

  if (v9)
  {
    int v12 = self->_ucat->var0;
    if (v12 <= 60 && (v12 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPConnection _clientPairVerifyCompleted:](self, "_clientPairVerifyCompleted:", v9, v9);
    }

    else
    {
      -[RPConnection _clientPairVerifyCompleted:](self, "_clientPairVerifyCompleted:", v9, v13);
    }
  }

  id v8 = 0LL;
LABEL_11:
}

- (void)_clientPairVerifyCompleted:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    if ((self->_controlFlags & 0x20000000) != 0
      && (-[CUPairingSession appInfoPeer](self->_pairVerifySession, "appInfoPeer"),
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
          int Int64 = CFDictionaryGetInt64(),
          v7,
          (Int64 & 0x20000000) != 0))
    {
      pairVerifySession = self->_pairVerifySession;
      id v70 = 0LL;
      -[CUPairingSession openStreamWithName:type:error:]( pairVerifySession,  "openStreamWithName:type:error:",  @"main",  2LL,  &v70);
      int v17 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      id v11 = v70;
      mainStream = self->_mainStream;
      self->_mainStream = v17;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      uint64_t v19 = self->_pairVerifySession;
      id v69 = v11;
      -[CUPairingSession openStreamWithName:type:error:]( v19,  "openStreamWithName:type:error:",  @"hipri",  2LL,  &v69);
      int v14 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = v69;
    }

    else
    {
      unsigned int v9 = self->_pairVerifySession;
      id v68 = 0LL;
      -[CUPairingSession openStreamWithName:error:](v9, "openStreamWithName:error:", @"main", &v68);
      id v10 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      id v11 = v68;
      int v12 = self->_mainStream;
      self->_mainStream = v10;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      id v13 = self->_pairVerifySession;
      id v67 = v11;
      -[CUPairingSession openStreamWithName:error:](v13, "openStreamWithName:error:", @"hipri", &v67);
      int v14 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = v67;
    }

    id v20 = v15;

    highPriorityStream = self->_highPriorityStream;
    self->_highPriorityStream = v14;

    id v22 = self->_highPriorityStream;
    id v11 = v20;
    if (!v22) {
      goto LABEL_52;
    }
    self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v22, "authTagLength");
    id v11 = v20;
LABEL_10:
    id v23 = self->_mainStream;
    if (v23)
    {
      self->_mainAuthTagLength = -[CUPairingStream authTagLength](v23, "authTagLength");
      self->_pairVerifyCompleted = 1;
      -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") & 0xFFFFFF8FFFF50FFFLL);
      unint64_t v24 = self->_statusFlags & 0xFFFFFF8FFFF50FFFLL;
      self->_unint64_t statusFlags = v24;
      int pairVerifyAuthType = self->_pairVerifyAuthType;
      __int128 v26 = "PSAuth";
      switch(pairVerifyAuthType)
      {
        case 0:
        case 1:
        case 2:
        case 8:
        case 9:
          switch(self->_pairVerifyIdentityType)
          {
            case 0:
            case 2:
              self->_flags &= ~1u;
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x80000);
              unint64_t v24 = self->_statusFlags | 0x80000;
              self->_unint64_t statusFlags = v24;
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              __int128 v28 = "(RPI-Owner)";
              goto LABEL_22;
            case 4:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000);
              unint64_t v39 = self->_statusFlags | 0x4000;
              self->_unint64_t statusFlags = v39;
              __int128 v26 = "(RPI-Family)";
              if ((v39 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 6:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x20000);
              unint64_t v40 = self->_statusFlags | 0x20000;
              self->_unint64_t statusFlags = v40;
              __int128 v26 = "(RPI-Friend)";
              if ((v40 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xC:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x1000000000LL);
              unint64_t v41 = self->_statusFlags | 0x1000000000LL;
              self->_unint64_t statusFlags = v41;
              __int128 v26 = "(RPI-SharedTVUser)";
              if ((v41 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xD:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000000000LL);
              unint64_t v42 = self->_statusFlags | 0x2000000000LL;
              self->_unint64_t statusFlags = v42;
              __int128 v26 = "(RPI-SessionPaired)";
              if ((v42 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xF:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000000000LL);
              unint64_t v43 = self->_statusFlags | 0x4000000000LL;
              self->_unint64_t statusFlags = v43;
              __int128 v26 = "(RPI-AdHocPaired)";
              if ((v43 & 0x80000) != 0) {
                goto LABEL_36;
              }
              goto LABEL_39;
            default:
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              __int128 v28 = "(RPI-?)";
LABEL_22:
              if (pairVerifyUsedIdentity) {
                __int128 v26 = v28;
              }
              else {
                __int128 v26 = "(HK)";
              }
              if ((v24 & 0x80000) == 0) {
                goto LABEL_39;
              }
LABEL_36:
              -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
              [v44 identifier];
              v45 = (NSString *)objc_claimAutoreleasedReturnValue();
              peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
              self->_peerHomeKitUserIdentifier = v45;

              break;
          }

          goto LABEL_39;
        case 3:
          -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000);
          self->_statusFlags |= 0x2000uLL;
          -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 identifier];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 UUIDString];
          uint64_t v31 = (NSString *)objc_claimAutoreleasedReturnValue();
          id v32 = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v31;

          __int128 v26 = "HKShared";
          goto LABEL_39;
        case 4:
          -[CUPairingSession aclActual](self->_pairVerifySession, "aclActual");
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v34 = CFDictionaryGetInt64();

          if (v34)
          {
            -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
            id v35 = (void *)objc_claimAutoreleasedReturnValue();
            [v35 identifier];
            id v36 = (NSString *)objc_claimAutoreleasedReturnValue();
            id v37 = self->_peerHomeKitUserIdentifier;
            self->_peerHomeKitUserIdentifier = v36;

            uint64_t v38 = 557056LL;
          }

          else
          {
            uint64_t v38 = 0x8000LL;
          }

          -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | v38);
          self->_statusFlags |= v38;
          __int128 v26 = "CUPair";
LABEL_39:
          if ((pairVerifyAuthType - 3) <= 1 && !self->_identityVerified)
          {
            -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              v48 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
              [v47 publicKey];
              id v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setEdPKData:](v48, "setEdPKData:", v49);

              [v47 identifier];
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
              [v50 UUIDString];
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setIdentifier:](v48, "setIdentifier:", v51);

              -[RPIdentity setType:](v48, "setType:", 8LL);
              identityVerified = self->_identityVerified;
              self->_identityVerified = v48;
              uint64_t v53 = v48;

              -[RPIdentity identifier](self->_identityVerified, "identifier");
              __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPEndpoint setVerifiedIdentity:](self->_peerDeviceInfo, "setVerifiedIdentity:", v54);
            }
          }

          break;
        case 5:
          break;
        case 6:
          __int128 v26 = "PSGuest";
          break;
        case 7:
          -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x20000);
          self->_statusFlags |= 0x20000uLL;
          __int128 v26 = "PV-AID";
          break;
        case 10:
          __int128 v26 = "AuthEnd";
          break;
        default:
          __int128 v26 = "?";
          break;
      }

      self->_stepDone = 1;
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        int v65 = &unk_1873E7012;
        v66 = self->_identityVerified;
        v63 = &unk_1873E71DF;
        unint64_t statusFlags = self->_statusFlags;
        __int128 v61 = v26;
        uint64_t flags = self->_flags;
        LogPrintF();
      }

      uint64_t v56 = MEMORY[0x1895A4770](self->_authCompletionHandler);
      __int128 v57 = (void *)v56;
      if (v56 && pairVerifyAuthType) {
        (*(void (**)(uint64_t, void))(v56 + 16))(v56, 0LL);
      }
    }

- (void)_clientStartSession
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  -[RPConnection _systeminfo](self, "_systeminfo");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    unsigned int v9 = v4;
    LogPrintF();
  }

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __35__RPConnection__clientStartSession__block_invoke;
  v10[3] = &unk_18A0329B0;
  v10[4] = self;
  -[RPConnection _sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:]( self,  "_sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:",  @"_systemInfo",  v4,  0LL,  0LL,  0LL,  v10,  v9);
  unint64_t v6 = self->_statusFlags & 0x10000AE000LL;
  uint64_t v7 = MEMORY[0x1895A4770](self->_proxyDeviceUpdateHandler);
  id v8 = (void *)v7;
  if (v6 && v7) {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

void __35__RPConnection__clientStartSession__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11)
  {
    char v9 = [*(id *)(a1 + 32) _receivedSystemInfo:v11 xid:0];
    if (!v8 && (v9 & 1) == 0)
    {
      RPErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  if (v8)
  {
    RPNestedErrorF();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = 0LL;
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144LL), v10);
  if (v8) {

  }
  *(_BYTE *)(*(void *)(a1 + 32) + 140LL) = 1;
  [*(id *)(a1 + 32) _run];
}

- (void)_clientRetryStart
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    id v4 = retryTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_retryTimer;
    self->_retryTimer = 0LL;
  }

  uint64_t v6 = mach_absolute_time();
  if (self->_retryTicks)
  {
    UpTicksToSecondsF();
    double v8 = v7;
  }

  else
  {
    double v8 = -1.0;
  }

  self->_retryTicks = v6;
  if (v8 >= 10.0 || v8 < 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = 10.0 - v8;
  }
  int var0 = self->_ucat->var0;
  if (v10 <= 0.0)
  {
    if (v8 < 0.0)
    {
    }

    else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_28;
    }

    LogPrintF();
LABEL_28:
    self->_retryFired = 1;
    return;
  }

  self->_retryFired = 0;
  int v12 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  id v13 = self->_retryTimer;
  self->_retryTimer = v12;

  int v14 = self->_retryTimer;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __33__RPConnection__clientRetryStart__block_invoke;
  handler[3] = &unk_18A031A30;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v14, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_retryTimer);
}

uint64_t __33__RPConnection__clientRetryStart__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 112LL) = mach_absolute_time();
  return [*(id *)(a1 + 32) _clientRetryFired];
}

- (void)_clientRetryFired
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    id v4 = retryTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_retryTimer;
    self->_retryTimer = 0LL;
  }

  if (self->_present)
  {
    self->_retryFired = 1;
    -[RPConnection _run](self, "_run");
  }

  else
  {
    int var0 = self->_ucat->var0;
    RPErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v7);
  }

- (void)_clientStarted
{
  startTimer = self->_startTimer;
  if (startTimer)
  {
    id v4 = startTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_startTimer;
    self->_startTimer = 0LL;
  }

  self->_uint64_t retryCount = 0;
}

- (void)_serverRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unsigned int internalState = self->_internalState;
      switch(internalState)
      {
        case 0x19u:
          self->_unsigned int internalState = 26;
          -[RPConnection _serverAccept](self, "_serverAccept");
          if (self->_pskData)
          {
            -[RPConnection _pskPrepare:](self, "_pskPrepare:", 0LL);
            -[RPConnection _serverStarted](self, "_serverStarted");
            int v4 = 28;
            goto LABEL_14;
          }

          break;
        case 0x1Au:
          if (self->_stepError) {
            goto LABEL_16;
          }
          if (self->_stepDone)
          {
            self->_stepDone = 0;
            int v4 = 27;
            goto LABEL_14;
          }

          break;
        case 0x1Bu:
          if (self->_stepError) {
            goto LABEL_16;
          }
          if (self->_stepDone)
          {
            self->_stepDone = 0;
            -[RPConnection _serverStarted](self, "_serverStarted");
            int v4 = self->_internalState + 1;
LABEL_14:
            self->_unsigned int internalState = v4;
          }

          break;
        case 0x1Cu:
          if (self->_stepError) {
LABEL_16:
          }
            self->_unsigned int internalState = 29;
          else {
            -[RPConnection _processSends](self, "_processSends");
          }
          break;
        case 0x1Du:
          goto LABEL_7;
        default:
          if (!internalState) {
LABEL_7:
          }
            self->_unsigned int internalState = 25;
          break;
      }

      unsigned int v5 = self->_internalState;
      int var0 = self->_ucat->var0;
      if (var0 <= 30)
      {
        if (var0 != -1) {
          goto LABEL_20;
        }
      }

- (void)_serverAccept
{
  startTimer = self->_startTimer;
  if (startTimer)
  {
    int v4 = startTimer;
    dispatch_source_cancel(v4);
    unsigned int v5 = self->_startTimer;
    self->_startTimer = 0LL;
  }

  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  id v7 = self->_startTimer;
  self->_startTimer = v6;

  double v8 = self->_startTimer;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __29__RPConnection__serverAccept__block_invoke;
  handler[3] = &unk_18A031A30;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_startTimer);
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
  self->_pairVerifyCompleted = 0;
  self->_BOOL pairVerifyUsedIdentity = 0;
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0LL;

  -[RPConnection _updateLinkInfo](self, "_updateLinkInfo");
  if (self->_bleConnection)
  {
    -[RPConnection _serverAcceptBLE](self, "_serverAcceptBLE");
  }

  else if (self->_btPipe)
  {
    -[RPConnection _serverAcceptBTPipe](self, "_serverAcceptBTPipe");
  }

  else
  {
    -[RPConnection _serverAcceptTCP](self, "_serverAcceptTCP");
  }

void __29__RPConnection__serverAccept__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128LL);
  if (v2)
  {
    int v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    unsigned int v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0LL;
  }

  uint64_t v6 = *(void **)(a1 + 32);
  RPErrorF();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _serverError:v7];
}

- (void)_serverAcceptBLE
{
  uint64_t v3 = MEMORY[0x1895F87A8];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __32__RPConnection__serverAcceptBLE__block_invoke;
  v5[3] = &unk_18A031AC0;
  v5[4] = self;
  -[CUBLEConnection setErrorHandler:](self->_bleConnection, "setErrorHandler:", v5);
  v4[0] = v3;
  v4[1] = 3221225472LL;
  v4[2] = __32__RPConnection__serverAcceptBLE__block_invoke_2;
  v4[3] = &unk_18A031A30;
  v4[4] = self;
  -[CUBLEConnection setInvalidationHandler:](self->_bleConnection, "setInvalidationHandler:", v4);
  -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrame,  self->_requestable);
}

uint64_t __32__RPConnection__serverAcceptBLE__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverNetworkError:a2 label:"BLE cnx error"];
}

uint64_t __32__RPConnection__serverAcceptBLE__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 296);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  unsigned int v5 = *(void **)(v2 + 472);
  *(void *)(v2 + 472) = 0LL;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_serverAcceptBTPipe
{
  if (!self->_readFrame.readRequested)
  {
    int var0 = self->_ucat->var0;
    -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrame,  self->_requestable);
  }

  if (!self->_readFrameBTPipeHighPriority.readRequested)
  {
    int v4 = self->_ucat->var0;
    -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrameBTPipeHighPriority,  self->_btPipeHighPriority);
  }

- (void)_serverAcceptTCP
{
  uint64_t v3 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __32__RPConnection__serverAcceptTCP__block_invoke;
  v6[3] = &unk_18A031AC0;
  v6[4] = self;
  -[CUTCPConnection setErrorHandler:](self->_tcpConnection, "setErrorHandler:", v6);
  if (self->_flowControlWriteChangedHandler)
  {
    v5[0] = v3;
    v5[1] = 3221225472LL;
    v5[2] = __32__RPConnection__serverAcceptTCP__block_invoke_2;
    v5[3] = &unk_18A031A30;
    v5[4] = self;
    -[CUTCPConnection setFlowControlChangedHandler:](self->_tcpConnection, "setFlowControlChangedHandler:", v5);
  }

  v4[0] = v3;
  v4[1] = 3221225472LL;
  v4[2] = __32__RPConnection__serverAcceptTCP__block_invoke_3;
  v4[3] = &unk_18A031A30;
  v4[4] = self;
  -[CUTCPConnection setInvalidationHandler:](self->_tcpConnection, "setInvalidationHandler:", v4);
  -[RPConnection _receiveStart:readFrame:requestable:]( self,  "_receiveStart:readFrame:requestable:",  0LL,  &self->_readFrame,  self->_requestable);
}

uint64_t __32__RPConnection__serverAcceptTCP__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverNetworkError:a2 label:"TCP cnx error"];
}

void __32__RPConnection__serverAcceptTCP__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 776))
  {
    uint64_t v2 = (void (**)(void))MEMORY[0x1895A4770](*(void *)(v1 + 560));
    if (v2)
    {
      uint64_t v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }

uint64_t __32__RPConnection__serverAcceptTCP__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 296);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  unsigned int v5 = *(void **)(v2 + 776);
  *(void *)(v2 + 776) = 0LL;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_serverError:(id)a3
{
  id v5 = a3;
  int var0 = self->_ucat->var0;
  id v9 = v5;
  if (var0 <= 60)
  {
    if (var0 != -1 || (int v7 = _LogCategory_Initialize(), v5 = v9, v7))
    {
      id v8 = v5;
      LogPrintF();
      id v5 = v9;
    }
  }

  if (self->_btPipe)
  {
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", v5);
    if (!self->_stepError) {
      objc_storeStrong((id *)&self->_stepError, a3);
    }
    -[RPConnection _run](self, "_run", v8);
  }

  else
  {
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v5);
  }
}

- (void)_serverNetworkError:(id)a3 label:(const char *)a4
{
  id v8 = a3;
  if ([v8 code] == -6758)
  {
    -[RPConnection sendReachabilityProbe:](self, "sendReachabilityProbe:", "server no ack");
  }

  else
  {
    int v7 = a4;
    RPNestedErrorF();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _serverError:](self, "_serverError:", v6, v7);
  }
}

- (void)_serverPreAuthRequestWithData:(id)a3
{
  int v4 = (void *)OPACKDecodeData();
  if (!v4 || v11)
  {
    int var0 = self->_ucat->var0;
LABEL_12:
    LogPrintF();
    goto LABEL_23;
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v6 = self->_ucat->var0;
  if ((isKindOfClass & 1) == 0)
  {
    goto LABEL_12;
  }

  if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v4;
    LogPrintF();
  }

  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v8 setObject:@"630.42.2" forKeyedSubscript:@"_sv"];
  int v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v8;
    LogPrintF();
  }

  -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 11LL, v8, v10);

LABEL_23:
}

- (BOOL)_serverPairingAllowed
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  getMCFeatureRemoteAppPairingAllowed[0]();
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v2 effectiveBoolValueForSetting:v3];

  return v4 != 2;
}

- (void)_serverPairSetupWithData:(id)a3 start:(BOOL)a4
{
  v67[2] = *MEMORY[0x1895F89C0];
  int v6 = (void *)OPACKDecodeData();
  if (!v6)
  {
    id v49 = RPErrorF();
    goto LABEL_95;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    RPErrorF();
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_100;
  }

  int passwordType = self->_passwordType;
  if (!passwordType)
  {
    if ((-[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 8) != 0) {
      goto LABEL_7;
    }
    int passwordType = self->_passwordType;
  }

  if (passwordType != 3)
  {
    if ((self->_flags & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }

void __47__RPConnection__serverPairSetupWithData_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 408LL));
  int v6 = (void *)v5;
  if (v5)
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 288LL) = 1;
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void (**)(void, void))MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 416LL));
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v3 + 288))
    {
      *(_BYTE *)(v3 + 288) = 0;
      id v4 = v2;
      v2[2](v2, 0LL);
      uint64_t v2 = (void (**)(void, void))v4;
    }
  }
}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = @"_pd";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _sendFrameType:4 unencryptedObject:v6];
}

uint64_t __47__RPConnection__serverPairSetupWithData_start___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverPairSetupCompleted:a2];
}

- (void)_serverPairSetupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v13 = v4;
  }

  else
  {
    pairSetupSession = self->_pairSetupSession;
    id v29 = 0LL;
    -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", @"main", &v29);
    id v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
    id v8 = v29;
    mainStream = self->_mainStream;
    self->_mainStream = v7;

    id v10 = self->_mainStream;
    if (v10)
    {
      self->_mainAuthTagLength = -[CUPairingStream authTagLength](v10, "authTagLength");
      if (self->_btPipeHighPriority)
      {
        unsigned int v11 = self->_pairSetupSession;
        id v28 = v8;
        -[CUPairingSession openStreamWithName:error:](v11, "openStreamWithName:error:", @"hipri", &v28);
        int v12 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
        id v13 = v28;

        highPriorityStream = self->_highPriorityStream;
        self->_highPriorityStream = v12;

        uint64_t v15 = self->_highPriorityStream;
        if (!v15) {
          goto LABEL_25;
        }
        self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v15, "authTagLength");
      }

      else
      {
        id v13 = v8;
      }

      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t pairSetupAuthType = self->_pairSetupAuthType;
        else {
          unsigned int v18 = off_18A032F60[pairSetupAuthType];
        }
        int v26 = v18;
        LogPrintF();
      }

      int v19 = self->_pairSetupAuthType;
      if (v19 == 8)
      {
        unint64_t v20 = self->_statusFlags & 0xFFFFFFDFFFFFEFFFLL | 0x2000000000LL;
      }

      else
      {
        if (v19 != 5)
        {
          self->_unint64_t statusFlags = self->_statusFlags & 0xFFFFFFEFFFF50FFFLL | 0x1000;
          self->_flags |= 1u;
LABEL_21:
          if (self->_internalState == 26)
          {
            self->_stepDone = 1;
            uint64_t v21 = MEMORY[0x1895A4770](self->_authCompletionHandler);
            id v22 = (void *)v21;
            if (v21) {
              (*(void (**)(uint64_t, id))(v21 + 16))(v21, v13);
            }

            -[RPConnection _run](self, "_run");
          }

- (void)_serverPairVerifyWithData:(id)a3 start:(BOOL)a4
{
  v31[1] = *MEMORY[0x1895F89C0];
  int v6 = (void *)OPACKDecodeData();
  if (!v6)
  {
    id v22 = RPErrorF();
    goto LABEL_26;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
    RPErrorF();
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }

  if (a4 || !self->_pairVerifySession)
  {
    -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
    self->_BOOL pairVerifyUsedIdentity = 0;
    id v7 = (CUPairingSession *)objc_alloc_init(MEMORY[0x18960ED80]);
    pairVerifySession = self->_pairVerifySession;
    self->_pairVerifySession = v7;

    if ((self->_controlFlags & 0xC0) != 0) {
      -[CUPairingSession setSelfAppFlags:](self->_pairVerifySession, "setSelfAppFlags:", 1LL);
    }
    -[CUPairingSession setDispatchQueue:](self->_pairVerifySession, "setDispatchQueue:", self->_dispatchQueue);
    -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", self->_pairVerifyFlags);
    if (self->_label) {
      label = (const __CFString *)self->_label;
    }
    else {
      label = @"RPCnx";
    }
    -[CUPairingSession setLabel:](self->_pairVerifySession, "setLabel:", label);
    -[CUPairingSession setSessionType:](self->_pairVerifySession, "setSessionType:", 4LL);
    unint64_t controlFlags = self->_controlFlags;
    if ((controlFlags & 0x20000000) != 0)
    {
      int v30 = @"_cf";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:controlFlags & 0x20000000];
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      int v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setAppInfoSelf:](self->_pairVerifySession, "setAppInfoSelf:", v12);
    }

    int Int64Ranged = CFDictionaryGetInt64Ranged();
    int v14 = Int64Ranged;
    switch(Int64Ranged)
    {
      case 3:
        -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
        uint64_t v15 = self->_pairVerifySession;
        uint64_t v16 = -[CUPairingSession flags](v15, "flags") | 0x4000000;
        break;
      case 8:
        -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFE3LL);
        -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairVerifySession);
        goto LABEL_19;
      case 4:
        -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
        uint64_t v15 = self->_pairVerifySession;
        uint64_t v16 = -[CUPairingSession flags](v15, "flags") | 0xC;
        break;
      default:
LABEL_19:
        self->_int pairVerifyAuthType = v14;
        self->_uint64_t pairSetupAuthType = v14;
        uint64_t v17 = MEMORY[0x1895F87A8];
        v29[0] = MEMORY[0x1895F87A8];
        v29[1] = 3221225472LL;
        v29[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke;
        v29[3] = &unk_18A032910;
        v29[4] = self;
        -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", v29);
        if ((v14 - 5) <= 0xFFFFFFFD)
        {
          v28[0] = v17;
          v28[1] = 3221225472LL;
          v28[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_2;
          v28[3] = &unk_18A032960;
          v28[4] = self;
          -[CUPairingSession setSignDataHandler:](self->_pairVerifySession, "setSignDataHandler:", v28);
          v27[0] = v17;
          v27[1] = 3221225472LL;
          v27[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_3;
          v27[3] = &unk_18A032988;
          v27[4] = self;
          -[CUPairingSession setVerifySignatureHandler:](self->_pairVerifySession, "setVerifySignatureHandler:", v27);
        }

        v26[0] = v17;
        v26[1] = 3221225472LL;
        v26[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_4;
        v26[3] = &unk_18A031AC0;
        v26[4] = self;
        -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", v26);
        id configurePairingHandler = (void (**)(id, CUPairingSession *))self->_configurePairingHandler;
        if (configurePairingHandler) {
          configurePairingHandler[2](configurePairingHandler, self->_pairVerifySession);
        }
        -[CUPairingSession activate](self->_pairVerifySession, "activate");
        goto LABEL_24;
    }

    -[CUPairingSession setFlags:](v15, "setFlags:", v16);
    goto LABEL_19;
  }

void __48__RPConnection__serverPairVerifyWithData_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = @"_pd";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _sendFrameType:6 unencryptedObject:v6];
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) _pairVerifySignData:a3 flags:a2 error:a4];
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return [*(id *)(a1 + 32) _pairVerifyVerifySignature:a4 data:a3 flags:a2 error:a5];
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serverPairVerifyCompleted:a2];
}

- (void)_serverPairVerifyCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    if ((self->_controlFlags & 0x20000000) != 0
      && (-[CUPairingSession appInfoPeer](self->_pairVerifySession, "appInfoPeer"),
          int v6 = (void *)objc_claimAutoreleasedReturnValue(),
          int Int64 = CFDictionaryGetInt64(),
          v6,
          (Int64 & 0x20000000) != 0))
    {
      pairVerifySession = self->_pairVerifySession;
      id v69 = 0LL;
      -[CUPairingSession openStreamWithName:type:error:]( pairVerifySession,  "openStreamWithName:type:error:",  @"main",  2LL,  &v69);
      uint64_t v16 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      id v10 = v69;
      mainStream = self->_mainStream;
      self->_mainStream = v16;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      unsigned int v18 = self->_pairVerifySession;
      id v68 = v10;
      -[CUPairingSession openStreamWithName:type:error:]( v18,  "openStreamWithName:type:error:",  @"hipri",  2LL,  &v68);
      id v13 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      int v14 = v68;
    }

    else
    {
      id v8 = self->_pairVerifySession;
      id v67 = 0LL;
      -[CUPairingSession openStreamWithName:error:](v8, "openStreamWithName:error:", @"main", &v67);
      int v9 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      id v10 = v67;
      unsigned int v11 = self->_mainStream;
      self->_mainStream = v9;

      if (!self->_btPipeHighPriority) {
        goto LABEL_10;
      }
      int v12 = self->_pairVerifySession;
      id v66 = v10;
      -[CUPairingSession openStreamWithName:error:](v12, "openStreamWithName:error:", @"hipri", &v66);
      id v13 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      int v14 = v66;
    }

    id v19 = v14;

    highPriorityStream = self->_highPriorityStream;
    self->_highPriorityStream = v13;

    uint64_t v21 = self->_highPriorityStream;
    id v10 = v19;
    if (!v21) {
      goto LABEL_50;
    }
    self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v21, "authTagLength");
    id v10 = v19;
LABEL_10:
    id v22 = self->_mainStream;
    if (v22)
    {
      self->_mainAuthTagLength = -[CUPairingStream authTagLength](v22, "authTagLength");
      self->_pairVerifyCompleted = 1;
      -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") & 0xFFFFFF8FFFF50FFFLL);
      unint64_t v23 = self->_statusFlags & 0xFFFFFF8FFFF50FFFLL;
      self->_unint64_t statusFlags = v23;
      int pairVerifyAuthType = self->_pairVerifyAuthType;
      __int128 v25 = "PSAuth";
      switch(pairVerifyAuthType)
      {
        case 0:
        case 1:
        case 2:
        case 8:
        case 9:
          switch(self->_pairVerifyIdentityType)
          {
            case 0:
            case 2:
              self->_flags &= ~1u;
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x80000);
              unint64_t v23 = self->_statusFlags | 0x80000;
              self->_unint64_t statusFlags = v23;
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              id v27 = "(RPI-Owner)";
              goto LABEL_22;
            case 4:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000);
              unint64_t v38 = self->_statusFlags | 0x4000;
              self->_unint64_t statusFlags = v38;
              __int128 v25 = "(RPI-Family)";
              if ((v38 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 6:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x20000);
              unint64_t v39 = self->_statusFlags | 0x20000;
              self->_unint64_t statusFlags = v39;
              __int128 v25 = "(RPI-Friend)";
              if ((v39 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xC:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x1000000000LL);
              unint64_t v40 = self->_statusFlags | 0x1000000000LL;
              self->_unint64_t statusFlags = v40;
              __int128 v25 = "(RPI-SharedTVUser)";
              if ((v40 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xD:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000000000LL);
              unint64_t v41 = self->_statusFlags | 0x2000000000LL;
              self->_unint64_t statusFlags = v41;
              __int128 v25 = "(RPI-SessionPaired)";
              if ((v41 & 0x80000) == 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            case 0xF:
              -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000000000LL);
              unint64_t v42 = self->_statusFlags | 0x4000000000LL;
              self->_unint64_t statusFlags = v42;
              __int128 v25 = "(RPI-AdHocPaired)";
              if ((v42 & 0x80000) != 0) {
                goto LABEL_36;
              }
              goto LABEL_39;
            default:
              BOOL pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              id v27 = "(RPI-?)";
LABEL_22:
              if (pairVerifyUsedIdentity) {
                __int128 v25 = v27;
              }
              else {
                __int128 v25 = "(HK)";
              }
              if ((v23 & 0x80000) == 0) {
                goto LABEL_39;
              }
LABEL_36:
              -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
              [v43 identifier];
              uint64_t v44 = (NSString *)objc_claimAutoreleasedReturnValue();
              peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
              self->_peerHomeKitUserIdentifier = v44;

              break;
          }

          goto LABEL_39;
        case 3:
          -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000);
          self->_statusFlags |= 0x2000uLL;
          -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 identifier];
          id v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 UUIDString];
          int v30 = (NSString *)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v30;

          __int128 v25 = "HKShared";
          goto LABEL_39;
        case 4:
          -[CUPairingSession aclActual](self->_pairVerifySession, "aclActual");
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v33 = CFDictionaryGetInt64();

          if (v33)
          {
            -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            [v34 identifier];
            id v35 = (NSString *)objc_claimAutoreleasedReturnValue();
            uint64_t v36 = self->_peerHomeKitUserIdentifier;
            self->_peerHomeKitUserIdentifier = v35;

            uint64_t v37 = 557056LL;
          }

          else
          {
            uint64_t v37 = 0x8000LL;
          }

          -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | v37);
          self->_statusFlags |= v37;
          __int128 v25 = "CUPair";
LABEL_39:
          if ((pairVerifyAuthType - 3) <= 1 && !self->_identityVerified)
          {
            -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
            int v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              uint64_t v47 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
              [v46 publicKey];
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setEdPKData:](v47, "setEdPKData:", v48);

              [v46 identifier];
              id v49 = (void *)objc_claimAutoreleasedReturnValue();
              [v49 UUIDString];
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setIdentifier:](v47, "setIdentifier:", v50);

              -[RPIdentity setType:](v47, "setType:", 8LL);
              identityVerified = self->_identityVerified;
              self->_identityVerified = v47;
              id v52 = v47;

              -[RPIdentity identifier](self->_identityVerified, "identifier");
              uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPEndpoint setVerifiedIdentity:](self->_peerDeviceInfo, "setVerifiedIdentity:", v53);
            }
          }

          break;
        case 5:
          break;
        case 6:
          __int128 v25 = "PSGuest";
          break;
        case 7:
          __int128 v25 = "PV-AID";
          break;
        case 10:
          __int128 v25 = "AuthEnd";
          break;
        default:
          __int128 v25 = "?";
          break;
      }

      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v64 = &unk_1873E7012;
        int v65 = self->_identityVerified;
        __int128 v62 = &unk_1873E71DF;
        unint64_t statusFlags = self->_statusFlags;
        __int128 v60 = v25;
        id flags = (id)self->_flags;
        LogPrintF();
      }

      if (self->_internalState == 26)
      {
        self->_stepDone = 1;
        -[RPConnection _run](self, "_run");
      }
    }

- (void)_serverStarted
{
  startTimer = self->_startTimer;
  if (startTimer)
  {
    id v4 = startTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_startTimer;
    self->_startTimer = 0LL;
  }

  if (!self->_peerIdentifier)
  {
    RandomBytes();
    NSPrintF();
    int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    peerIdentifier = self->_peerIdentifier;
    self->_peerIdentifier = v6;
  }

- (void)_processSends
{
  uint64_t v3 = -[NSMutableArray firstObject](self->_sendArray, "firstObject");
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", 0LL);
      [v4 requestID];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        [v4 requestID];
        int v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 request];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v4 xpcID];
        [v4 options];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 responseHandler];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPConnection _sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:]( self,  "_sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:",  v6,  v7,  v8,  v9,  v4,  v10);
      }

      else
      {
        [v4 eventID];
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          int var0 = self->_ucat->var0;
          goto LABEL_8;
        }

        [v4 eventID];
        int v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 eventData];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v4 xid];
        [v4 options];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 completion];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPConnection _sendEncryptedEventID:data:xid:options:completion:]( self,  "_sendEncryptedEventID:data:xid:options:completion:",  v6,  v7,  v12,  v9,  v10);
      }

LABEL_8:
      -[NSMutableArray firstObject](self->_sendArray, "firstObject");
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    while (v4);
  }

- (void)sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v25 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = (void (**)(id, void *))a7;
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (v14)
    {
      RPErrorF();
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v19);
    }
  }

  else
  {
    int internalState = self->_internalState;
    BOOL v17 = internalState == 28 || internalState == 21;
    if (v17 && !-[NSMutableArray count](self->_sendArray, "count"))
    {
      -[RPConnection _sendEncryptedEventID:data:xid:options:completion:]( self,  "_sendEncryptedEventID:data:xid:options:completion:",  v25,  v12,  v9,  v13,  v14);
    }

    else
    {
      int v18 = self->_ucat->var0;
      if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = v9;
        uint64_t v24 = -[NSMutableArray count](self->_sendArray, "count");
        id v22 = v25;
        LogPrintF();
      }

      unint64_t v20 = objc_alloc_init(&OBJC_CLASS___RPSendEntry);
      -[RPSendEntry setCompletion:](v20, "setCompletion:", v14);
      -[RPSendEntry setEventID:](v20, "setEventID:", v25);
      -[RPSendEntry setEventData:](v20, "setEventData:", v12);
      -[RPSendEntry setOptions:](v20, "setOptions:", v13);
      -[RPSendEntry setQueueTicks:](v20, "setQueueTicks:", mach_absolute_time());
      if (!(_DWORD)v9)
      {
        unsigned int xidLast = self->_xidLast;
        if (xidLast + 1 > 1) {
          uint64_t v9 = xidLast + 1;
        }
        else {
          uint64_t v9 = 1LL;
        }
        self->_unsigned int xidLast = v9;
      }

      -[RPSendEntry setXid:](v20, "setXid:", v9, v22, v23, v24);
      -[NSMutableArray addObject:](self->_sendArray, "addObject:", v20);
    }
  }
}

- (void)sendEncryptedEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    uint64_t v14 = xidLast + 1;
  }
  else {
    uint64_t v14 = 1LL;
  }
  self->_unsigned int xidLast = v14;
  id v15 = a4;
  uint64_t Int64 = CFDictionaryGetInt64();
  BOOL v17 = (void *)MEMORY[0x189603FC8];
  [MEMORY[0x189607968] numberWithUnsignedInt:v14];
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v17,  "dictionaryWithObjectsAndKeys:",  v15,  @"_c",  v10,  @"_i",  &unk_18A04DEB8,  @"_t",  v18,  @"_x",  0);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (Int64) {
    [v19 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"_cht"];
  }
  [v11 objectForKeyedSubscript:@"inUseProcess"];
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    BOOL clientMode = self->_clientMode;

    if (clientMode)
    {
      [v11 objectForKeyedSubscript:@"inUseProcess"];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setObject:v22 forKeyedSubscript:@"_inUseProc"];
    }
  }

  uint64_t v23 = (void *)MEMORY[0x1895A3F3C](v19, 16 * self->_canDecode128bit, &v25);
  if (v23)
  {
    -[RPConnection sendEncryptedEventID:data:xid:options:completion:]( self,  "sendEncryptedEventID:data:xid:options:completion:",  v10,  v23,  v14,  v11,  v12);
  }

  else if (v12)
  {
    RPErrorF();
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v24);
  }
}

- (void)_sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v53 = *(void *)&a5;
  v77[2] = *MEMORY[0x1895F89C0];
  id v55 = a3;
  id v57 = a4;
  id v58 = a6;
  id v11 = a7;
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x3032000000LL;
  int v74 = __Block_byref_object_copy__1;
  v75 = __Block_byref_object_dispose__1;
  uint64_t v12 = MEMORY[0x1895F87A8];
  id v76 = 0LL;
  v68[0] = MEMORY[0x1895F87A8];
  v68[1] = 3221225472LL;
  v68[2] = __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke;
  v68[3] = &unk_18A032A00;
  id v70 = &v71;
  id v54 = v11;
  id v69 = v54;
  id v13 = (void (**)(void, void))MEMORY[0x1895A4770](v68);
  btPipe = self->_btPipe;
  if (btPipe
    && -[CUBluetoothScalablePipe peerHostState](btPipe, "peerHostState") != 2
    && CFDictionaryGetInt64())
  {
    RPErrorF();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    ((void (**)(void, id))v13)[2](v13, v15);
    id v27 = 0LL;
    uint64_t v43 = 0LL;
    uint64_t v36 = 0LL;
    int v26 = 0LL;
    goto LABEL_49;
  }

  uint64_t v56 = self->_requestable;
  if (-[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 1 && CFDictionaryGetInt64())
  {
    BOOL v17 = self->_btPipeHighPriority;

    int v18 = 1;
    uint64_t v56 = v17;
  }

  else
  {
    int v18 = 0;
  }

  v67[0] = 8;
  uint64_t v19 = [v57 length];
  unint64_t mainAuthTagLength = self->_mainAuthTagLength;
  uint64_t v21 = self->_mainStream;
  if (v18)
  {
    id v22 = self->_highPriorityStream;

    v67[0] = 12;
    unint64_t v23 = self->_highPriorityAuthTagLength + [v57 length];
    uint64_t v21 = v22;
  }

  else
  {
    unint64_t v23 = mainAuthTagLength + v19;
  }

  uint64_t Int64 = CFDictionaryGetInt64();
  if (v23 >> 24)
  {
    RPErrorF();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = 0LL;
    uint64_t v43 = 0LL;
    uint64_t v36 = 0LL;
    int v26 = 0LL;
  }

  else
  {
    uint64_t v25 = Int64;
    v67[1] = BYTE2(v23);
    v67[2] = BYTE1(v23);
    void v67[3] = v23;
    int v26 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v67 length:4];
    if (v21)
    {
      id v66 = 0LL;
      -[CUPairingStream encryptData:aadData:error:](v21, "encryptData:aadData:error:", v57, v26, &v66);
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = v66;
      if (v27)
      {
        if (!v25)
        {
          id v28 = v55;
          if (([v28 isEqual:@"HIDRelay"] & 1) != 0
            || ([v28 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
            || ([v28 isEqual:@"_hidT"] & 1) != 0
            || ([v28 isEqual:@"_laData"] & 1) != 0)
          {
          }

          else
          {
            int v52 = [v28 isEqual:@"_siA"];

            if (!v52)
            {
              int v29 = 30;
LABEL_24:
              int v30 = self->_ucat->var0;
              if (v29 >= v30 && (v30 != -1 || _LogCategory_Initialize()))
              {
                uint64_t linkType = self->_linkType;
                else {
                  uint64_t v32 = off_18A032FB8[linkType];
                }
                uint64_t v33 = "";
                if (v18) {
                  uint64_t v33 = "at high priority";
                }
                uint64_t v50 = v32;
                int v51 = v33;
                v48 = v27;
                unint64_t v49 = v23;
                id v46 = v55;
                uint64_t v47 = v53;
                LogPrintF();
              }

              +[RPConnectionMetrics sharedMetrics]( &OBJC_CLASS___RPConnectionMetrics,  "sharedMetrics",  v46,  v47,  v48,  v49,  v50,  v51);
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
              [v34 logMessageForClient:self->_initiator length:v23 linkType:self->_linkType];

              [v58 objectForKeyedSubscript:@"nwActivityMetrics"];
              id v35 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v36 = v35;
              if (v35)
              {
                [v35 setEventSize:v23];
                [v36 submitMetrics];
              }

              uint64_t v37 = +[RPNWActivityMessageMetrics startMessageMetrics:withParent:]( &OBJC_CLASS___RPNWActivityMessageMetrics,  "startMessageMetrics:withParent:",  1LL,  v36);
              unint64_t v38 = (void *)v72[5];
              v72[5] = v37;

              [(id)v72[5] setMessageSize:v23];
              [(id)v72[5] setLinkType:self->_linkType];
              -[RPEndpoint model](self->_peerDeviceInfo, "model");
              unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
              [(id)v72[5] setPeerDeviceModel:v39];

              peerDeviceInfo = self->_peerDeviceInfo;
              if (peerDeviceInfo)
              {
                -[RPEndpoint operatingSystemVersion](peerDeviceInfo, "operatingSystemVersion");
              }

              else
              {
                __int128 v64 = 0uLL;
                uint64_t v65 = 0LL;
              }

              unint64_t v41 = (void *)v72[5];
              __int128 v62 = v64;
              uint64_t v63 = v65;
              [v41 setPeerOSVersion:&v62];
              [(id)v72[5] submitMetrics];
              id v42 = objc_alloc_init(MEMORY[0x18960EDD0]);
              uint64_t v43 = v42;
              if (v13)
              {
                v59[0] = v12;
                v59[1] = 3221225472LL;
                v59[2] = __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke_2;
                v59[3] = &unk_18A031B60;
                id v60 = v42;
                __int128 v61 = v13;
                [v60 setCompletion:v59];
              }

              v77[0] = v26;
              v77[1] = v27;
              [MEMORY[0x189603F18] arrayWithObjects:v77 count:2];
              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
              [v43 setDataArray:v44];

              -[CUReadWriteRequestable writeWithRequest:](v56, "writeWithRequest:", v43);
              goto LABEL_42;
            }
          }
        }

        int v29 = 10;
        goto LABEL_24;
      }
    }

    else
    {
      RPErrorF();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = 0LL;
    }

    uint64_t v43 = 0LL;
    uint64_t v36 = 0LL;
  }

void __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v5 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) nwActivity];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (v5) {
      +[RPNWActivityUtils failActivity:error:](&OBJC_CLASS___RPNWActivityUtils, "failActivity:error:", v3);
    }
    else {
      nw_activity_complete_with_reason();
    }
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = (id)v2;
  if (v2)
  {
    RPNestedErrorF();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }

  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
}

- (void)sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 responseHandler:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    RPErrorF();
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0LL, 0LL, v20);
  }

  else
  {
    int internalState = self->_internalState;
    BOOL v18 = internalState == 28 || internalState == 21;
    if (v18 && !-[NSMutableArray count](self->_sendArray, "count"))
    {
      -[RPConnection _sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:]( self,  "_sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:",  v12,  v13,  v9,  v14,  0LL,  v15);
    }

    else
    {
      int v19 = self->_ucat->var0;
      if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
      {
        id v24 = v12;
        uint64_t v25 = -[NSMutableArray count](self->_sendArray, "count");
        LogPrintF();
      }

      uint64_t v21 = objc_alloc_init(&OBJC_CLASS___RPSendEntry);
      -[RPSendEntry setOptions:](v21, "setOptions:", v14);
      -[RPSendEntry setQueueTicks:](v21, "setQueueTicks:", mach_absolute_time());
      -[RPSendEntry setRequestID:](v21, "setRequestID:", v12);
      -[RPSendEntry setRequest:](v21, "setRequest:", v13);
      -[RPSendEntry setXpcID:](v21, "setXpcID:", v9);
      -[RPSendEntry setResponseHandler:](v21, "setResponseHandler:", v15);
      if (v14)
      {
        CFDictionaryGetDouble();
        if (v22 > 0.0)
        {
          unint64_t v23 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_dispatchQueue);
          handler[0] = MEMORY[0x1895F87A8];
          handler[1] = 3221225472LL;
          handler[2] = __77__RPConnection_sendEncryptedRequestID_request_xpcID_options_responseHandler___block_invoke;
          handler[3] = &unk_18A032A28;
          handler[4] = v23;
          void handler[5] = self;
          handler[6] = v21;
          dispatch_source_set_event_handler(v23, handler);
          CUDispatchTimerSet();
          dispatch_resume(v23);
          -[RPSendEntry setTimer:](v21, "setTimer:", v23);
        }
      }

      -[NSMutableArray addObject:](self->_sendArray, "addObject:", v21, v24, v25);
    }
  }
}

uint64_t __77__RPConnection_sendEncryptedRequestID_request_xpcID_options_responseHandler___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 40) _timeoutForSendEntry:*(void *)(a1 + 48)];
}

- (void)_sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 sendEntry:(id)a7 responseHandler:(id)a8
{
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v83 = a3;
  id v73 = a4;
  id v13 = a6;
  id v81 = a7;
  id v76 = a8;
  uint64_t v96 = 0LL;
  id v97 = &v96;
  uint64_t v98 = 0x3032000000LL;
  id v99 = __Block_byref_object_copy__1;
  unsigned int v100 = __Block_byref_object_dispose__1;
  id v101 = 0LL;
  v93[0] = MEMORY[0x1895F87A8];
  v93[1] = 3221225472LL;
  v93[2] = __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke;
  v93[3] = &unk_18A032A50;
  id v94 = 0LL;
  uint64_t v95 = &v96;
  v72 = (void *)MEMORY[0x1895A4770](v93);
  btPipe = self->_btPipe;
  if (btPipe
    && -[CUBluetoothScalablePipe peerHostState](btPipe, "peerHostState") != 2
    && CFDictionaryGetInt64())
  {
    RPErrorF();
    id v79 = (id)objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    (*((void (**)(id, void, void, id))v76 + 2))(v76, 0LL, 0LL, v79);
    int v52 = 0LL;
    uint64_t v31 = 0LL;
    id v58 = 0LL;
    uint64_t v77 = 0LL;
    v78 = 0LL;
    id v27 = 0LL;
    goto LABEL_73;
  }

  int v74 = self->_requestable;
  v75 = self->_mainStream;
  if (-[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 1 && CFDictionaryGetInt64())
  {
    uint64_t v16 = self->_btPipeHighPriority;

    uint64_t v17 = 1LL;
    int v74 = v16;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    os_signpost_id_t v19 = xidLast + 1;
  }
  else {
    os_signpost_id_t v19 = 1LL;
  }
  self->_unsigned int xidLast = v19;
  [MEMORY[0x189607968] numberWithUnsignedInt:v19];
  id v82 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v20 = (void *)MEMORY[0x189603FC8];
  [MEMORY[0x189607968] numberWithBool:v17];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v20,  "dictionaryWithObjectsAndKeys:",  v73,  @"_c",  v83,  @"_i",  &unk_18A04DED0,  @"_t",  v82,  @"_x",  v21,  @"_btHP",  0);
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t Int64 = CFDictionaryGetInt64();
  if (Int64) {
    [v80 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"_cht"];
  }
  [v13 objectForKeyedSubscript:@"inUseProcess"];
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    BOOL v24 = !self->_clientMode;

    if (!v24)
    {
      [v13 objectForKeyedSubscript:@"inUseProcess"];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v80 setObject:v25 forKeyedSubscript:@"_inUseProc"];
    }
  }

  if (CFDictionaryGetInt64()) {
    [v80 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"_pttEligible"];
  }
  int v26 = (void *)MEMORY[0x1895A3F3C](v80, 16 * self->_canDecode128bit, &v92);
  id v27 = v26;
  if (!v26
    || ((v91[0] = 8, uint64_t v28 = [v26 length], !(_DWORD)v17)
      ? (CUPairingStream *)(unint64_t v30 = self->_mainAuthTagLength + v28)
      : (int v29 = self->_highPriorityStream,
         v75,
         v91[0] = 12,
         unint64_t v30 = self->_highPriorityAuthTagLength + [v27 length],
         v75 = v29),
        v30 >> 24))
  {
    RPErrorF();
    id v79 = (id)objc_claimAutoreleasedReturnValue();
    int v52 = 0LL;
    uint64_t v31 = 0LL;
    id v58 = 0LL;
    uint64_t v77 = 0LL;
    v78 = 0LL;
  }

  else
  {
    v91[1] = BYTE2(v30);
    v91[2] = BYTE1(v30);
    v91[3] = v30;
    v78 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v91 length:4];
    if (v75)
    {
      id v90 = 0LL;
      -[CUPairingStream encryptData:aadData:error:](v75, "encryptData:aadData:error:", v27, v78, &v90);
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
      id v79 = v90;
      if (v77)
      {
        uint64_t v31 = objc_alloc_init(&OBJC_CLASS___RPRequestEntry);
        -[RPRequestEntry setOptions:](v31, "setOptions:", v13);
        -[RPRequestEntry setRequestID:](v31, "setRequestID:", v83);
        -[RPRequestEntry setResponseHandler:](v31, "setResponseHandler:", v76);
        -[RPRequestEntry setSendTicks:](v31, "setSendTicks:", mach_absolute_time());
        -[RPRequestEntry setXpcID:](v31, "setXpcID:", a5);
        -[RPRequestEntry setLength:](v31, "setLength:", v30);
        if (v81)
        {
          [v81 timer];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[RPRequestEntry setTimer:](v31, "setTimer:", v32);

          [v81 setXidObj:v82];
        }

        requests = self->_requests;
        if (!requests)
        {
          uint64_t v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
          id v35 = self->_requests;
          self->_requests = v34;

          requests = self->_requests;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](requests, "setObject:forKeyedSubscript:", v31, v82);
        RPConnectionLog();
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v36))
        {
          uint64_t v37 = [v83 UTF8String];
          label = self->_label;
          uint64_t linkType = self->_linkType;
          else {
            unint64_t v40 = off_18A032FB8[linkType];
          }
          peerIdentifier = self->_peerIdentifier;
          *(_DWORD *)buf = 67110658;
          int v105 = v19;
          __int16 v106 = 2080;
          uint64_t v107 = v37;
          __int16 v108 = 2112;
          id v109 = label;
          __int16 v110 = 2048;
          unint64_t v111 = v30;
          __int16 v112 = 2080;
          v113 = v40;
          __int16 v114 = 1024;
          int v115 = v17;
          __int16 v116 = 2112;
          v117 = peerIdentifier;
          _os_signpost_emit_with_name_impl( &dword_18736A000,  v36,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "RPConnectionSendRequestTime",  " enableTelemetry=YES {XID:0x%X, requestID=%{signpost.telemetry:string1}s, connectionID:%@, requestSize:%zu, linkType:%s, highPriority:%d, peer:%@, signpost.description:begin_time}",  buf,  0x40u);
        }

        BOOL v42 = Int64 == 0;

        id v43 = v83;
        uint64_t v44 = v43;
        if (v42)
        {
          if (([v43 isEqual:@"_ftSm"] & 1) != 0
            || ([v44 isEqual:@"_ftLg"] & 1) != 0)
          {
            int v45 = 9;
          }

          else if ([v44 isEqual:@"_ftRs"])
          {
            int v45 = 9;
          }

          else
          {
            int v45 = 30;
          }
        }

        else
        {
          int v45 = 10;
        }

        int v46 = self->_ucat->var0;
        if (v45 >= v46 && (v46 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v47 = self->_linkType;
          else {
            v48 = off_18A032FB8[v47];
          }
          unint64_t v49 = "";
          if ((_DWORD)v17) {
            unint64_t v49 = "at high priority";
          }
          id v69 = v48;
          id v70 = v49;
          id v67 = v77;
          unint64_t v68 = v30;
          uint64_t v65 = v44;
          os_signpost_id_t v66 = v19;
          LogPrintF();
        }

        +[RPConnectionMetrics sharedMetrics]( &OBJC_CLASS___RPConnectionMetrics,  "sharedMetrics",  v65,  v66,  v67,  v68,  v69,  v70);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v50 logMessageForClient:self->_initiator length:v30 linkType:self->_linkType];

        [v13 objectForKeyedSubscript:@"nwActivityMetrics"];
        int v51 = (void *)objc_claimAutoreleasedReturnValue();
        int v52 = v51;
        if (v51) {
          [v51 setRequestSize:v30];
        }
        uint64_t v53 = +[RPNWActivityMessageMetrics startMessageMetrics:withParent:]( &OBJC_CLASS___RPNWActivityMessageMetrics,  "startMessageMetrics:withParent:",  2LL,  v52);
        id v54 = (void *)v97[5];
        v97[5] = v53;

        [(id)v97[5] setMessageSize:v30];
        [(id)v97[5] setLinkType:self->_linkType];
        -[RPEndpoint model](self->_peerDeviceInfo, "model");
        id v55 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)v97[5] setPeerDeviceModel:v55];

        peerDeviceInfo = self->_peerDeviceInfo;
        if (peerDeviceInfo)
        {
          -[RPEndpoint operatingSystemVersion](peerDeviceInfo, "operatingSystemVersion");
        }

        else
        {
          __int128 v88 = 0uLL;
          uint64_t v89 = 0LL;
        }

        id v57 = (void *)v97[5];
        __int128 v86 = v88;
        uint64_t v87 = v89;
        [v57 setPeerOSVersion:&v86];
        [(id)v97[5] submitMetrics];
        id v58 = objc_alloc_init(MEMORY[0x18960EDD0]);
        [v58 setCompletion:v72];
        if (v30)
        {
          v103[0] = v78;
          v103[1] = v77;
          __int128 v59 = (void **)v103;
          uint64_t v60 = 2LL;
        }

        else
        {
          uint64_t v102 = v78;
          __int128 v59 = &v102;
          uint64_t v60 = 1LL;
        }

        [MEMORY[0x189603F18] arrayWithObjects:v59 count:v60];
        __int128 v61 = (void *)objc_claimAutoreleasedReturnValue();
        [v58 setDataArray:v61];

        -[CUReadWriteRequestable writeWithRequest:](v74, "writeWithRequest:", v58);
        if (v13)
        {
          CFDictionaryGetDouble();
          if (v62 > 0.0)
          {
            uint64_t v63 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_dispatchQueue);
            handler[0] = MEMORY[0x1895F87A8];
            handler[1] = 3221225472LL;
            handler[2] = __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke_370;
            handler[3] = &unk_18A032A78;
            handler[4] = v63;
            void handler[5] = self;
            handler[6] = v82;
            int v85 = v19;
            dispatch_source_set_event_handler(v63, handler);
            CUDispatchTimerSet();
            dispatch_resume(v63);
            -[RPRequestEntry setTimer:](v31, "setTimer:", v63);
          }
        }

        goto LABEL_66;
      }
    }

    else
    {
      RPErrorF();
      id v79 = (id)objc_claimAutoreleasedReturnValue();
      v75 = 0LL;
    }

    int v52 = 0LL;
    uint64_t v31 = 0LL;
    id v58 = 0LL;
    uint64_t v77 = 0LL;
  }

void __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v4 = v2;
    [*(id *)(a1 + 32) error];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3) {
      +[RPNWActivityUtils failActivity:error:](&OBJC_CLASS___RPNWActivityUtils, "failActivity:error:", v4, v3);
    }
    else {
      nw_activity_complete_with_reason();
    }

    uint64_t v2 = v4;
  }
}

void __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke_370( uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  [*(id *)(a1 + 40) _timeoutForXID:*(void *)(a1 + 48)];
  RPConnectionLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v4 && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(v5 + 640);
    uint64_t v7 = *(void *)(v5 + 680);
    v8[0] = 67109634;
    v8[1] = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_signpost_emit_with_name_impl( &dword_18736A000,  v3,  OS_SIGNPOST_INTERVAL_END,  v4,  "RPConnectionSendRequestTime",  " enableTelemetry=YES {XID:0x%X, connectionID:%@, peer:%@, signpost.description:end_time, error:request_timed_out}",  (uint8_t *)v8,  0x1Cu);
  }
}

- (void)_sendEncryptedResponse:(id)a3 options:(id)a4 error:(id)a5 xid:(id)a6 requestID:(id)a7 highPriority:(BOOL)a8 isChatty:(BOOL)a9 replyStartTime:(id)a10
{
  BOOL v72 = a8;
  uint64_t v106 = *MEMORY[0x1895F89C0];
  id v69 = a3;
  id v65 = a4;
  id v75 = a5;
  id v74 = a6;
  id v68 = a7;
  id v73 = a10;
  uint64_t v86 = 0LL;
  uint64_t v87 = &v86;
  uint64_t v88 = 0x3032000000LL;
  uint64_t v89 = __Block_byref_object_copy__1;
  id v90 = __Block_byref_object_dispose__1;
  id v91 = 0LL;
  v83[0] = MEMORY[0x1895F87A8];
  v83[1] = 3221225472LL;
  v83[2] = __104__RPConnection__sendEncryptedResponse_options_error_xid_requestID_highPriority_isChatty_replyStartTime___block_invoke;
  v83[3] = &unk_18A032A50;
  id v84 = 0LL;
  int v85 = &v86;
  id v67 = (void *)MEMORY[0x1895A4770](v83);
  id v15 = self->_requestable;
  uint64_t v16 = self->_mainStream;
  btPipeHighPriority = self->_btPipeHighPriority;
  if (btPipeHighPriority && v72)
  {
    BOOL v18 = btPipeHighPriority;

    id v15 = v18;
  }

  mach_absolute_time();
  id v19 = objc_alloc_init(MEMORY[0x189603FC8]);
  unint64_t v20 = v19;
  if (v75) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v69 == 0LL;
  }
  if (v21) {
    id v22 = (id)MEMORY[0x189604A60];
  }
  else {
    id v22 = v69;
  }
  [v19 setObject:v22 forKeyedSubscript:@"_c"];
  [v20 setObject:&unk_18A04DEE8 forKeyedSubscript:@"_t"];
  [v20 setObject:v74 forKeyedSubscript:@"_x"];
  os_signpost_id_t spid = [v74 unsignedIntValue];
  if (v75)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      os_signpost_id_t v59 = spid;
      id v60 = v75;
      LogPrintF();
    }

    RPEncodeNSError(v75, v20);
  }

  os_signpost_id_t v66 = v15;
  if (v73)
  {
    [v73 unsignedLongLongValue];
    [MEMORY[0x189607968] numberWithUnsignedLongLong:UpTicksToMilliseconds()];
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 setObject:v24 forKeyedSubscript:@"_rT"];
  }

  uint64_t v25 = (void *)MEMORY[0x1895A3F3C](v20, 16 * self->_canDecode128bit, &v82);
  int v26 = v25;
  if (!v25) {
    goto LABEL_62;
  }
  v81[0] = 8;
  uint64_t v27 = [v25 length];
  if (v72)
  {
    v81[0] = 12;
    uint64_t v28 = [v26 length];
    unint64_t highPriorityAuthTagLength = self->_highPriorityAuthTagLength;
    unint64_t v30 = self->_highPriorityStream;

    unint64_t v31 = highPriorityAuthTagLength + v28;
    uint64_t v16 = v30;
  }

  else
  {
    unint64_t v31 = self->_mainAuthTagLength + v27;
  }

  if (v31 >> 24)
  {
LABEL_62:
    RPErrorF();
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    id v54 = 0LL;
    uint64_t v32 = 0LL;
LABEL_64:
    uint64_t v33 = 0LL;
    goto LABEL_56;
  }

  v81[1] = BYTE2(v31);
  v81[2] = BYTE1(v31);
  v81[3] = v31;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v81 length:4];
  if (!v16)
  {
    RPErrorF();
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 0LL;
    id v54 = 0LL;
    goto LABEL_64;
  }

  id v80 = 0LL;
  -[CUPairingStream encryptData:aadData:error:](v16, "encryptData:aadData:error:", v26, v32, &v80);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  id v70 = v80;
  if (v33)
  {
    id v34 = v68;
    id v35 = v34;
    if (a9)
    {
      int v36 = 10;
    }

    else if (([v34 isEqual:@"_ftSm"] & 1) != 0 {
           || ([v35 isEqual:@"_ftLg"] & 1) != 0)
    }
    {
      int v36 = 9;
    }

    else if ([v35 isEqual:@"_ftRs"])
    {
      int v36 = 9;
    }

    else
    {
      int v36 = 30;
    }

    int v37 = self->_ucat->var0;
    if (v36 >= v37 && (v37 != -1 || _LogCategory_Initialize()))
    {
      uint64_t linkType = self->_linkType;
      else {
        unint64_t v39 = off_18A032FB8[linkType];
      }
      uint64_t v40 = objc_msgSend(v75, "code", v59, v60);
      unint64_t v41 = "";
      if (v72) {
        unint64_t v41 = " at high priority";
      }
      uint64_t v63 = v41;
      uint64_t v64 = v40;
      unint64_t v61 = v31;
      double v62 = v39;
      os_signpost_id_t v59 = spid;
      id v60 = v33;
      LogPrintF();
    }

    +[RPConnectionMetrics sharedMetrics]( &OBJC_CLASS___RPConnectionMetrics,  "sharedMetrics",  v59,  v60,  v61,  v62,  v63,  v64);
    BOOL v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 logMessageForClient:self->_initiator length:v31 linkType:self->_linkType];

    RPConnectionLog();
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = v43;
    if ((_DWORD)spid && os_signpost_enabled(v43))
    {
      label = self->_label;
      uint64_t v46 = self->_linkType;
      else {
        uint64_t v47 = off_18A032FB8[v46];
      }
      peerIdentifier = self->_peerIdentifier;
      *(_DWORD *)buf = 67110402;
      int v95 = spid;
      __int16 v96 = 2112;
      id v97 = label;
      __int16 v98 = 2048;
      unint64_t v99 = v31;
      __int16 v100 = 2080;
      id v101 = v47;
      __int16 v102 = 1024;
      BOOL v103 = v72;
      __int16 v104 = 2112;
      int v105 = peerIdentifier;
      _os_signpost_emit_with_name_impl( &dword_18736A000,  v44,  OS_SIGNPOST_INTERVAL_END,  spid,  "RPConnectionClientResponseTime",  " enableTelemetry=YES {XID:0x%X, connectionID:%@, responseSize:%zu, linkType:%s, highPriority:%d, peer:%@, signpo st.description:end_time}",  buf,  0x36u);
    }

    uint64_t v49 = +[RPNWActivityMessageMetrics startMessageMetrics:withParent:]( &OBJC_CLASS___RPNWActivityMessageMetrics,  "startMessageMetrics:withParent:",  3LL,  0LL);
    uint64_t v50 = (void *)v87[5];
    v87[5] = v49;

    [(id)v87[5] setMessageSize:v31];
    [(id)v87[5] setLinkType:self->_linkType];
    -[RPEndpoint model](self->_peerDeviceInfo, "model");
    int v51 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)v87[5] setPeerDeviceModel:v51];

    peerDeviceInfo = self->_peerDeviceInfo;
    if (peerDeviceInfo)
    {
      -[RPEndpoint operatingSystemVersion](peerDeviceInfo, "operatingSystemVersion");
    }

    else
    {
      __int128 v78 = 0uLL;
      uint64_t v79 = 0LL;
    }

    uint64_t v53 = (void *)v87[5];
    __int128 v76 = v78;
    uint64_t v77 = v79;
    [v53 setPeerOSVersion:&v76];
    [(id)v87[5] submitMetrics];
    id v54 = objc_alloc_init(MEMORY[0x18960EDD0]);
    [v54 setCompletion:v67];
    if (v31)
    {
      v93[0] = v32;
      v93[1] = v33;
      id v55 = (void **)v93;
      uint64_t v56 = 2LL;
    }

    else
    {
      int v92 = v32;
      id v55 = &v92;
      uint64_t v56 = 1LL;
    }

    [MEMORY[0x189603F18] arrayWithObjects:v55 count:v56];
    id v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v54 setDataArray:v57];

    -[CUReadWriteRequestable writeWithRequest:](v66, "writeWithRequest:", v54);
  }

  else
  {
    id v54 = 0LL;
  }

void __104__RPConnection__sendEncryptedResponse_options_error_xid_requestID_highPriority_isChatty_replyStartTime___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v4 = v2;
    [*(id *)(a1 + 32) error];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3) {
      +[RPNWActivityUtils failActivity:error:](&OBJC_CLASS___RPNWActivityUtils, "failActivity:error:", v4, v3);
    }
    else {
      nw_activity_complete_with_reason();
    }

    uint64_t v2 = v4;
  }
}

- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4
{
  uint64_t v4 = a3;
  v25[2] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v23[0] = v4;
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7;
  if (!(v7 >> 24))
  {
    v23[1] = BYTE2(v7);
    v23[2] = BYTE1(v7);
    v23[3] = v7;
    __int16 v9 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v23 length:4];
    int var0 = self->_ucat->var0;
    if (var0 > 9 || var0 == -1 && !_LogCategory_Initialize())
    {
LABEL_37:
      id v12 = objc_alloc_init(MEMORY[0x18960EDD0]);
      if (v8)
      {
        v25[0] = v9;
        v25[1] = v6;
        uint64_t v13 = (void *)MEMORY[0x189603F18];
        id v14 = (void **)v25;
        uint64_t v15 = 2LL;
      }

      else
      {
        BOOL v24 = v9;
        uint64_t v13 = (void *)MEMORY[0x189603F18];
        id v14 = &v24;
        uint64_t v15 = 1LL;
      }

      objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v19, v20, v21, v22);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setDataArray:v16];

      -[CUReadWriteRequestable writeWithRequest:](self->_requestable, "writeWithRequest:", v12);
      uint64_t v17 = 0LL;
      goto LABEL_41;
    }

    if ((int)v4 <= 47)
    {
      __int16 v11 = "Invalid";
      switch((int)v4)
      {
        case 0:
          goto LABEL_36;
        case 1:
          __int16 v11 = "NoOp";
          break;
        case 3:
          __int16 v11 = "PS_Start";
          break;
        case 4:
          __int16 v11 = "PS_Next";
          break;
        case 5:
          __int16 v11 = "PV_Start";
          break;
        case 6:
          __int16 v11 = "PV_Next";
          break;
        case 7:
          __int16 v11 = "U_OPACK";
          break;
        case 8:
          __int16 v11 = "E_OPACK";
          break;
        case 9:
          __int16 v11 = "P_OPACK";
          break;
        case 10:
          __int16 v11 = "PA_Req";
          break;
        case 11:
          __int16 v11 = "PA_Rsp";
          break;
        case 16:
          __int16 v11 = "SessionStartRequest";
          break;
        case 17:
          __int16 v11 = "SessionStartResponse";
          break;
        case 18:
          __int16 v11 = "SessionData";
          break;
        case 32:
          __int16 v11 = "FamilyIdentityRequest";
          break;
        case 33:
          __int16 v11 = "FamilyIdentityResponse";
          break;
        case 34:
          __int16 v11 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_35;
      }

      goto LABEL_36;
    }

    if ((int)v4 <= 63)
    {
      if ((_DWORD)v4 == 48)
      {
        __int16 v11 = "WatchIdentityRequest";
        goto LABEL_36;
      }

      if ((_DWORD)v4 == 49)
      {
        __int16 v11 = "WatchIdentityResponse";
        goto LABEL_36;
      }
    }

    else
    {
      switch((_DWORD)v4)
      {
        case '@':
          __int16 v11 = "FriendIdentityRequest";
          goto LABEL_36;
        case 'A':
          __int16 v11 = "FriendIdentityResponse";
          goto LABEL_36;
        case 'B':
          __int16 v11 = "FriendIdentityUpdate";
LABEL_36:
          id v21 = v6;
          unint64_t v22 = v8;
          uint64_t v19 = v4;
          unint64_t v20 = v11;
          LogPrintF();
          goto LABEL_37;
      }
    }

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4 = a3;
  id v6 = (void *)MEMORY[0x1895A3F3C](a4, 16 * self->_canDecode128bit, &v8);
  if (v6)
  {
    -[RPConnection _sendFrameType:body:](self, "_sendFrameType:body:", v4, v6);
  }

  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      RPFrameTypeToString(v4);
      LogPrintF();
    }
  }
}

- (void)sendReachabilityProbe:(const char *)a3
{
  int var0 = self->_ucat->var0;
  -[RPConnection _sendFrameType:body:](self, "_sendFrameType:body:", 1LL, 0LL);
}

- (void)processSendsUsingConnection:(id)a3
{
  id v36 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = -[NSMutableArray firstObject](self->_sendArray, "firstObject");
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", 0LL);
      [v5 options];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      double v7 = 0.0;
      double v8 = 0.0;
      if (v6)
      {
        [v5 options];
        __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionaryGetDouble();
        double v8 = v10;
      }

      [v5 timer];
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && v8 > 0.0)
      {
        mach_absolute_time();
        [v5 queueTicks];
        UpTicksToSecondsF();
        double v13 = v8 - v12;
        if (v13 > 1.0) {
          double v7 = v13;
        }
        else {
          double v7 = 1.0;
        }
        [v5 options];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = (void *)[v14 mutableCopy];

        [MEMORY[0x189607968] numberWithDouble:v7];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 setObject:v16 forKeyedSubscript:@"timeoutSeconds"];

        [v5 setOptions:v15];
        [v5 timer];
        uint64_t v17 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v17);

        [v5 setTimer:0];
      }

      [v5 requestID];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          [v5 requestID];
          unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v36 label];
          double v35 = v7;
          uint64_t v33 = v20;
          id v34 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
        }

        objc_msgSend(v5, "requestID", v33, v34, *(void *)&v35);
        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 request];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v5 xpcID];
        [v5 options];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 responseHandler];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 sendEncryptedRequestID:v24 request:v25 xpcID:v26 options:v27 responseHandler:v28];
      }

      else
      {
        [v5 eventID];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();

        int v22 = self->_ucat->var0;
        if (v21)
        {
          if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize()))
          {
            [v5 eventID];
            unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v36 label];
            uint64_t v33 = v23;
            id v34 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();
          }

          objc_msgSend(v5, "eventID", v33, v34);
          int v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 eventData];
          unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 options];
          unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 completion];
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v36 sendEncryptedEventID:v29 data:v30 xid:0 options:v31 completion:v32];
        }

        else if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }

      -[NSMutableArray firstObject](self->_sendArray, "firstObject");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    while (v5);
  }
}

- (void)_receiveStart:(id)a3 readFrame:(id *)a4 requestable:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int var0 = self->_ucat->var0;
  if (self->_flowControlReadEnabled)
  {
    a4->var1 = 1;
    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x18960EDA0]);
    }
    [v8 setBufferBytes:a4];
    [v8 setBufferData:0];
    [v8 setMinLength:4];
    [v8 setMaxLength:4];
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    id v14 = __52__RPConnection__receiveStart_readFrame_requestable___block_invoke;
    uint64_t v15 = &unk_18A032AA0;
    uint64_t v16 = self;
    id v8 = v8;
    id v17 = v8;
    uint64_t v19 = a4;
    id v11 = v9;
    id v18 = v11;
    [v8 setCompletion:&v12];
    objc_msgSend(v11, "readWithRequest:", v8, v12, v13, v14, v15, v16);
    a4->var2 = 1;
  }

  else if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __52__RPConnection__receiveStart_readFrame_requestable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40) readFrame:*(void *)(a1 + 56) requestable:*(void *)(a1 + 48)];
}

- (void)_receiveCompletion:(id)a3 readFrame:(id *)a4 requestable:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  a4->var2 = 0;
  [v8 error];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    int var0 = self->_ucat->var0;
    uint64_t v16 = MEMORY[0x1895A4770](self->_readErrorHandler);
    id v17 = (void *)v16;
    if (v16) {
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v10);
    }

    goto LABEL_27;
  }

  if (!a4->var1)
  {
    uint64_t v14 = [v8 length];
    uint64_t v23 = v14;
    char v24 = 0;
    int v15 = self->_ucat->var0;
    if (v15 <= 9 && (v15 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = v14;
      LogPrintF();
    }

    unint64_t v20 = v8;
    goto LABEL_26;
  }

  int v12 = self->_ucat->var0;
  uint64_t v13 = (a4->var0.var1[0] << 16) | (a4->var0.var1[1] << 8) | a4->var0.var1[2];
  if (!(_DWORD)v13)
  {
    uint64_t v23 = 0LL;
    char v24 = [v8 statusFlags] & 1;
    unint64_t v20 = (void *)MEMORY[0x189603F48];
LABEL_26:
    objc_msgSend(v20, "data", v22);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _receivedHeader:body:ctx:](self, "_receivedHeader:body:ctx:", a4, v21, &v23);

    -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", v8, a4, v9);
    goto LABEL_27;
  }

  if (v12 <= 9 && (v12 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v22 = v13;
    LogPrintF();
  }

  a4->var1 = 0;
  objc_msgSend(v8, "setBufferBytes:", 0, v22);
  [v8 setBufferData:0];
  [v8 setMinLength:v13];
  [v8 setMaxLength:v13];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __57__RPConnection__receiveCompletion_readFrame_requestable___block_invoke;
  void v25[3] = &unk_18A032AA0;
  v25[4] = self;
  id v18 = v8;
  id v26 = v18;
  uint64_t v28 = a4;
  id v19 = v9;
  id v27 = v19;
  [v18 setCompletion:v25];
  [v19 readWithRequest:v18];
  a4->var2 = 1;

LABEL_27:
}

uint64_t __57__RPConnection__receiveCompletion_readFrame_requestable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40) readFrame:*(void *)(a1 + 56) requestable:*(void *)(a1 + 48)];
}

- (void)_receivedHeader:(id *)a3 body:(id)a4 ctx:(id *)a5
{
  id v8 = a4;
  ++self->_receivedFrameCountCurrent;
  uint64_t var0 = a3->var0;
  int v10 = self->_ucat->var0;
  id v33 = v8;
  if (v10 > 9) {
    goto LABEL_36;
  }
  if (v10 == -1)
  {
    int v12 = _LogCategory_Initialize();
    id v8 = v33;
    if (!v12) {
      goto LABEL_36;
    }
  }

  if ((int)var0 <= 47)
  {
    id v11 = "Invalid";
    switch((int)var0)
    {
      case 0:
        goto LABEL_35;
      case 1:
        id v11 = "NoOp";
        break;
      case 3:
        id v11 = "PS_Start";
        break;
      case 4:
        id v11 = "PS_Next";
        break;
      case 5:
        id v11 = "PV_Start";
        break;
      case 6:
        id v11 = "PV_Next";
        break;
      case 7:
        id v11 = "U_OPACK";
        break;
      case 8:
        id v11 = "E_OPACK";
        break;
      case 9:
        id v11 = "P_OPACK";
        break;
      case 10:
        id v11 = "PA_Req";
        break;
      case 11:
        id v11 = "PA_Rsp";
        break;
      case 16:
        id v11 = "SessionStartRequest";
        break;
      case 17:
        id v11 = "SessionStartResponse";
        break;
      case 18:
        id v11 = "SessionData";
        break;
      case 32:
        id v11 = "FamilyIdentityRequest";
        break;
      case 33:
        id v11 = "FamilyIdentityResponse";
        break;
      case 34:
        id v11 = "FamilyIdentityUpdate";
        break;
      default:
        goto LABEL_34;
    }

    goto LABEL_35;
  }

  if ((int)var0 <= 63)
  {
    if ((_DWORD)var0 == 48)
    {
      id v11 = "WatchIdentityRequest";
      goto LABEL_35;
    }

    if ((_DWORD)var0 == 49)
    {
      id v11 = "WatchIdentityResponse";
      goto LABEL_35;
    }

- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4 ctx:(id *)a5
{
  id v8 = a4;
  int var0 = a3->var0;
  int v10 = self->_mainStream;
  if (var0 == 12)
  {
    id v11 = self->_highPriorityStream;

    int v10 = v11;
  }

  if (v10)
  {
    id v24 = 0LL;
    -[CUPairingStream decryptData:aadBytes:aadLength:error:]( v10,  "decryptData:aadBytes:aadLength:error:",  v8,  a3,  4LL,  &v24);
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v24;
    if (v12)
    {
      uint64_t v14 = OPACKDecodeData();
      if (v14)
      {
        int v15 = (void *)v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          int v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = RPErrorF();

          id v13 = (id)v22;
          goto LABEL_9;
        }

        int v16 = (void *)[v15 mutableCopy];
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 setObject:v17 forKeyedSubscript:&unk_18A04DF00];

        id v18 = v16;
        -[RPConnection _receivedObject:ctx:](self, "_receivedObject:ctx:", v18, a5);
      }

      else
      {
        id v20 = RPErrorF();
      }
    }
  }

  else
  {
    RPErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

- (void)_receivedObject:(id)a3 ctx:(id *)a4
{
  id v10 = a3;
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 3)
  {
    -[RPConnection _receivedResponse:ctx:](self, "_receivedResponse:ctx:", v10, a4);
    goto LABEL_10;
  }

  if (Int64Ranged == 2)
  {
    -[RPConnection _receivedRequest:ctx:](self, "_receivedRequest:ctx:", v10, a4);
    goto LABEL_10;
  }

  double v7 = v10;
  if (Int64Ranged == 1)
  {
    -[RPConnection _receivedEvent:ctx:](self, "_receivedEvent:ctx:", v10, a4);
LABEL_10:
    double v7 = v10;
    goto LABEL_11;
  }

  int var0 = self->_ucat->var0;
  if (var0 <= 60)
  {
    if (var0 != -1 || (v9 = _LogCategory_Initialize(), double v7 = v10, v9))
    {
      LogPrintF();
      goto LABEL_10;
    }
  }

- (void)_receivedEvent:(id)a3 ctx:(id *)a4
{
  v71[16] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      int var0 = self->_ucat->var0;
      goto LABEL_73;
    }

    uint64_t Int64 = CFDictionaryGetInt64();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && !self->_clientMode)
    {
      inUseProcesses = self->_inUseProcesses;
      if (!inUseProcesses)
      {
        int v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
        id v13 = self->_inUseProcesses;
        self->_inUseProcesses = v12;

        inUseProcesses = self->_inUseProcesses;
      }

      -[NSMutableSet addObject:](inUseProcesses, "addObject:", v10);
      int v14 = self->_ucat->var0;
      if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
      {
        -[RPConnection inUseProcessesToString](self, "inUseProcessesToString");
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }

    NSDictionaryGetNSNumber();
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 unsignedIntValue];
    if (!Int64)
    {
      id v19 = v8;
      if (([v19 isEqual:@"HIDRelay"] & 1) != 0
        || ([v19 isEqual:@"synchSetupStateFromStereoCounterpart"] & 1) != 0
        || ([v19 isEqual:@"_hidT"] & 1) != 0
        || [v19 isEqual:@"_laData"])
      {
      }

      else
      {
        int v55 = [v19 isEqual:@"_siA"];

        if (!v55)
        {
          int v20 = 30;
LABEL_28:
          int v21 = self->_ucat->var0;
          if (v20 >= v21 && (v21 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v58 = objc_msgSend(v7, "count", v56);
            peerIdentifier = self->_peerIdentifier;
            uint64_t v56 = v8;
            uint64_t v57 = v18;
            LogPrintF();
          }

          if (objc_msgSend(v8, "isEqual:", @"_systemInfoUpdate", v56, v57, v58, peerIdentifier))
          {
            -[RPConnection _receivedSystemInfo:xid:](self, "_receivedSystemInfo:xid:", v7, 0LL);
          }

          else if (self->_receivedEventHandler)
          {
            uint64_t v22 = (__CFString *)self->_peerIdentifier;
            if (!v22) {
              uint64_t v22 = @"?";
            }
            int v23 = v22;
            if ([v8 isEqualToString:@"ids-message"]
              && (-[RPCompanionLinkDevice publicIdentifier](self->_peerDeviceInfo, "publicIdentifier"),
                  id v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  v24,
                  v24))
            {
              uint64_t v25 = -[RPCompanionLinkDevice publicIdentifier](self->_peerDeviceInfo, "publicIdentifier");

              id v69 = (void *)v25;
            }

            else
            {
              id v69 = v23;
            }

            peerDeviceInfo = self->_peerDeviceInfo;
            id receivedEventHandler = (void (**)(id, void *, void *, void *))self->_receivedEventHandler;
            v70[0] = @"dlt";
            int v27 = (void *)MEMORY[0x189607968];
            uint64_t linkType = self->_linkType;
            uint64_t v29 = peerDeviceInfo;
            [v27 numberWithInt:linkType];
            id v68 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = v68;
            v70[1] = @"senderIDSCID";
            uint64_t v30 = -[RPEndpoint idsCorrelationIdentifier](v29, "idsCorrelationIdentifier");
            id v67 = (void *)v30;
            if (v30) {
              id v31 = (const __CFString *)v30;
            }
            else {
              id v31 = &stru_18A035BB8;
            }
            v71[1] = v31;
            v70[2] = @"length";
            [MEMORY[0x189607968] numberWithUnsignedLong:a4->var0];
            os_signpost_id_t v66 = (void *)objc_claimAutoreleasedReturnValue();
            v71[2] = v66;
            v70[3] = @"moreComing";
            uint64_t v32 = [MEMORY[0x189607968] numberWithBool:a4->var1];
            uint64_t v64 = (void *)v32;
            peerAddrString = (const __CFString *)self->_peerAddrString;
            peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
            if (!peerAddrString) {
              peerAddrString = &stru_18A035BB8;
            }
            v71[3] = v32;
            v71[4] = peerAddrString;
            v70[4] = @"peerAddr";
            v70[5] = @"peerHomeKitUserIdentifier";
            if (peerHomeKitUserIdentifier) {
              double v35 = (const __CFString *)peerHomeKitUserIdentifier;
            }
            else {
              double v35 = &stru_18A035BB8;
            }
            v71[5] = v35;
            v70[6] = @"peerVerifiedIdentity";
            uint64_t v36 = -[RPEndpoint verifiedIdentity](v29, "verifiedIdentity");
            uint64_t v63 = (void *)v36;
            if (v36) {
              int v37 = (const __CFString *)v36;
            }
            else {
              int v37 = @"?";
            }
            selfAddrString = (const __CFString *)self->_selfAddrString;
            if (!selfAddrString) {
              selfAddrString = &stru_18A035BB8;
            }
            v71[6] = v37;
            v71[7] = selfAddrString;
            v70[7] = @"selfAddr";
            v70[8] = @"senderAccountAltDSID";
            uint64_t v39 = -[RPEndpoint accountAltDSID](v29, "accountAltDSID");
            double v62 = (void *)v39;
            if (v39) {
              uint64_t v40 = (const __CFString *)v39;
            }
            else {
              uint64_t v40 = &stru_18A035BB8;
            }
            v71[8] = v40;
            v70[9] = @"senderAccountID";
            uint64_t v41 = -[RPEndpoint accountID](v29, "accountID");
            unint64_t v61 = (void *)v41;
            if (v41) {
              BOOL v42 = (const __CFString *)v41;
            }
            else {
              BOOL v42 = &stru_18A035BB8;
            }
            v71[9] = v42;
            v70[10] = @"senderDeviceName";
            uint64_t v43 = -[RPEndpoint name](v29, "name");
            id v60 = (void *)v43;
            if (v43) {
              uint64_t v44 = (const __CFString *)v43;
            }
            else {
              uint64_t v44 = &stru_18A035BB8;
            }
            v71[10] = v44;
            v71[11] = v69;
            v70[11] = @"senderID";
            v70[12] = @"senderIDS";
            uint64_t v45 = -[RPEndpoint idsDeviceIdentifier](v29, "idsDeviceIdentifier");
            uint64_t v46 = (void *)v45;
            if (v45) {
              uint64_t v47 = (const __CFString *)v45;
            }
            else {
              uint64_t v47 = @"?";
            }
            v71[12] = v47;
            v70[13] = @"senderModelID";
            uint64_t v48 = -[RPEndpoint model](v29, "model");
            uint64_t v49 = (void *)v48;
            if (v48) {
              uint64_t v50 = (const __CFString *)v48;
            }
            else {
              uint64_t v50 = @"?";
            }
            v71[13] = v50;
            v70[14] = @"statusFlags";
            uint64_t v51 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[RPEndpoint statusFlags](v29, "statusFlags"));
            int v52 = (void *)v51;
            v70[15] = @"xid";
            uint64_t v53 = &unk_18A04DF18;
            if (v17) {
              uint64_t v53 = v17;
            }
            v71[14] = v51;
            v71[15] = v53;
            [MEMORY[0x189603F68] dictionaryWithObjects:v71 forKeys:v70 count:16];
            id v54 = (void *)objc_claimAutoreleasedReturnValue();
            receivedEventHandler[2](receivedEventHandler, v8, v7, v54);
          }

LABEL_73:
          goto LABEL_74;
        }
      }
    }

    int v20 = 10;
    goto LABEL_28;
  }

  int v15 = self->_ucat->var0;
LABEL_74:
}

- (void)_receivedRequest:(id)a3 ctx:(id *)a4
{
  uint64_t v102 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  NSDictionaryGetNSNumber();
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 unsignedIntValue];
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CFDictionaryGetTypeID();
      uint64_t v11 = CFDictionaryGetTypedValue();
      int v12 = (void *)v11;
      if (v11)
      {
        uint64_t v87 = (void *)v11;
        uint64_t Int64 = CFDictionaryGetInt64();
        BOOL v83 = Int64 != 0;
        uint64_t v13 = CFDictionaryGetInt64();
        BOOL v82 = v13 != 0;
        uint64_t v80 = CFDictionaryGetInt64();
        CFStringGetTypeID();
        uint64_t v14 = CFDictionaryGetTypedValue();
        if (v14 && !self->_clientMode)
        {
          inUseProcesses = self->_inUseProcesses;
          if (!inUseProcesses)
          {
            int v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
            id v17 = self->_inUseProcesses;
            self->_inUseProcesses = v16;

            inUseProcesses = self->_inUseProcesses;
          }

          -[NSMutableSet addObject:](inUseProcesses, "addObject:", v14);
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            -[RPConnection inUseProcessesToString](self, "inUseProcessesToString");
            uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();
          }
        }

        uint64_t v86 = (void *)v14;
        RPConnectionLog();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v22))
        {
          uint64_t v23 = [v10 UTF8String];
          label = self->_label;
          peerIdentifier = self->_peerIdentifier;
          *(_DWORD *)buf = 67109890;
          int v95 = v9;
          __int16 v96 = 2080;
          uint64_t v97 = v23;
          __int16 v98 = 2112;
          unint64_t v99 = label;
          __int16 v100 = 2112;
          id v101 = peerIdentifier;
          _os_signpost_emit_with_name_impl( &dword_18736A000,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "RPConnectionClientResponseTime",  " enableTelemetry=YES {XID:0x%X, requestID=%{signpost.telemetry:string1}s, connectionID:%@, peer:%@, signpost .description:begin_time}",  buf,  0x26u);
        }

        id v26 = v10;
        int v27 = v26;
        if (v13)
        {
          int v28 = 10;
        }

        else if ([v26 isEqual:@"_ftSm"])
        {
          int v28 = 9;
        }

        else
        {
          int v28 = 9;
          if (([v27 isEqual:@"_ftLg"] & 1) == 0)
          {
            else {
              int v28 = 30;
            }
          }
        }

        int v29 = self->_ucat->var0;
        if (v28 >= v29 && (v29 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v66 = objc_msgSend(v87, "count", v64);
          id v67 = self->_peerIdentifier;
          uint64_t v64 = v27;
          uint64_t v65 = v9;
          LogPrintF();
        }

        uint64_t v30 = [MEMORY[0x189607968] numberWithUnsignedLongLong:mach_absolute_time()];
        if ([v27 isEqual:@"_ping"])
        {
          LOBYTE(v64) = v13 != 0;
          int v12 = v87;
          -[RPConnection _sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:]( self,  "_sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:",  v87,  0LL,  0LL,  v7,  v27,  Int64 != 0,  v64,  v30,  v66,  v67);
          id v31 = (void *)v30;
        }

        else
        {
          uint64_t v79 = (void *)v30;
          if ([v27 isEqual:@"_systemInfo"])
          {
            int v12 = v87;
            -[RPConnection _receivedSystemInfo:xid:](self, "_receivedSystemInfo:xid:", v87, v7);
            id v31 = (void *)v30;
          }

          else
          {
            id receivedRequestHandler = (void (**)(id, void *, void *, void *, void *))self->_receivedRequestHandler;
            if (receivedRequestHandler)
            {
              BOOL v74 = v80 != 0;
              BOOL v33 = v13 != 0;
              peerDeviceInfo = self->_peerDeviceInfo;
              v92[0] = @"dlt";
              double v35 = (void *)MEMORY[0x189607968];
              uint64_t linkType = self->_linkType;
              __int128 v76 = receivedRequestHandler;
              int v37 = peerDeviceInfo;
              [v35 numberWithInt:linkType];
              int v85 = (void *)objc_claimAutoreleasedReturnValue();
              v93[0] = v85;
              v92[1] = @"senderIDSCID";
              uint64_t v38 = -[RPEndpoint idsCorrelationIdentifier](v37, "idsCorrelationIdentifier");
              id v81 = (void *)v38;
              if (v38) {
                uint64_t v39 = (const __CFString *)v38;
              }
              else {
                uint64_t v39 = &stru_18A035BB8;
              }
              v93[1] = v39;
              v92[2] = @"length";
              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", a4->var0, v64, v65, v66, v67);
              __int128 v78 = (void *)objc_claimAutoreleasedReturnValue();
              void v93[2] = v78;
              v92[3] = @"chatty";
              [MEMORY[0x189607968] numberWithBool:v33];
              uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
              v93[3] = v77;
              v92[4] = @"moreComing";
              uint64_t v40 = [MEMORY[0x189607968] numberWithBool:a4->var1];
              id v75 = (void *)v40;
              peerAddrString = (const __CFString *)self->_peerAddrString;
              peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
              if (!peerAddrString) {
                peerAddrString = &stru_18A035BB8;
              }
              void v93[4] = v40;
              v93[5] = peerAddrString;
              v92[5] = @"peerAddr";
              v92[6] = @"peerHomeKitUserIdentifier";
              if (peerHomeKitUserIdentifier) {
                uint64_t v43 = (const __CFString *)peerHomeKitUserIdentifier;
              }
              else {
                uint64_t v43 = &stru_18A035BB8;
              }
              v93[6] = v43;
              v92[7] = @"peerVerifiedIdentity";
              uint64_t v44 = -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
              id v73 = (void *)v44;
              if (v44) {
                uint64_t v45 = (const __CFString *)v44;
              }
              else {
                uint64_t v45 = @"?";
              }
              selfAddrString = (const __CFString *)self->_selfAddrString;
              if (!selfAddrString) {
                selfAddrString = &stru_18A035BB8;
              }
              v93[7] = v45;
              v93[8] = selfAddrString;
              v92[8] = @"selfAddr";
              v92[9] = @"senderAccountAltDSID";
              uint64_t v47 = -[RPEndpoint accountAltDSID](v37, "accountAltDSID");
              BOOL v72 = (void *)v47;
              if (v47) {
                uint64_t v48 = (const __CFString *)v47;
              }
              else {
                uint64_t v48 = &stru_18A035BB8;
              }
              v93[9] = v48;
              v92[10] = @"senderAccountID";
              uint64_t v49 = -[RPEndpoint accountID](v37, "accountID");
              uint64_t v71 = (void *)v49;
              if (v49) {
                uint64_t v50 = (const __CFString *)v49;
              }
              else {
                uint64_t v50 = &stru_18A035BB8;
              }
              v93[10] = v50;
              v92[11] = @"senderDeviceName";
              id v70 = v37;
              uint64_t v51 = -[RPEndpoint name](v37, "name");
              id v69 = (void *)v51;
              if (v51) {
                int v52 = (const __CFString *)v51;
              }
              else {
                int v52 = &stru_18A035BB8;
              }
              uint64_t v53 = (const __CFString *)self->_peerIdentifier;
              if (!v53) {
                uint64_t v53 = @"?";
              }
              v93[11] = v52;
              v93[12] = v53;
              v92[12] = @"senderID";
              v92[13] = @"senderIDS";
              uint64_t v54 = -[RPEndpoint idsDeviceIdentifier](v37, "idsDeviceIdentifier");
              id v68 = (void *)v54;
              if (v54) {
                int v55 = (const __CFString *)v54;
              }
              else {
                int v55 = @"?";
              }
              v93[13] = v55;
              v92[14] = @"senderModelID";
              uint64_t v56 = -[RPEndpoint model](v37, "model");
              uint64_t v57 = (void *)v56;
              if (v56) {
                uint64_t v58 = (const __CFString *)v56;
              }
              else {
                uint64_t v58 = @"?";
              }
              v93[14] = v58;
              v92[15] = @"statusFlags";
              objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[RPEndpoint statusFlags](v37, "statusFlags"));
              os_signpost_id_t v59 = (void *)objc_claimAutoreleasedReturnValue();
              v93[15] = v59;
              v93[16] = v7;
              v92[16] = @"xid";
              v92[17] = @"_pttEligible";
              [MEMORY[0x189607968] numberWithBool:v74];
              id v60 = (void *)objc_claimAutoreleasedReturnValue();
              v93[17] = v60;
              [MEMORY[0x189603F68] dictionaryWithObjects:v93 forKeys:v92 count:18];
              unint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
              v88[0] = MEMORY[0x1895F87A8];
              v88[1] = 3221225472LL;
              v88[2] = __37__RPConnection__receivedRequest_ctx___block_invoke;
              v88[3] = &unk_18A032AC8;
              v88[4] = self;
              v88[5] = v27;
              v88[6] = v7;
              BOOL v90 = v83;
              BOOL v91 = v82;
              id v31 = v79;
              id v89 = v79;
              v76[2](v76, v27, v87, v61, v88);

              int v12 = v87;
            }

            else
            {
              int v62 = self->_ucat->var0;
              id v31 = (void *)v30;
              if (v62 <= 90 && (v62 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v64 = v27;
                LogPrintF();
              }

              RPErrorF();
              uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v64) = v13 != 0;
              -[RPConnection _sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:]( self,  "_sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:",  0LL,  0LL,  v63,  v7,  v27,  Int64 != 0,  v64,  v79);

              int v12 = v87;
            }
          }
        }
      }

      else
      {
        int v21 = self->_ucat->var0;
      }
    }

    else
    {
      int v20 = self->_ucat->var0;
    }
  }

  else
  {
    int v19 = self->_ucat->var0;
  }
}

void __37__RPConnection__receivedRequest_ctx___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v9 + 80))
  {
    int v10 = **(_DWORD **)(v9 + 296);
  }

  else
  {
    LOBYTE(v11) = *(_BYTE *)(a1 + 65);
    [(id)v9 _sendEncryptedResponse:v12 options:v7 error:v8 xid:*(void *)(a1 + 48) requestID:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 64) isChatty:v11 replyStartTime:*(void *)(a1 + 56)];
  }
}

- (void)_receivedResponse:(id)a3 ctx:(id *)a4
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  NSDictionaryGetNSNumber();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 unsignedIntValue];
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v7);
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0LL, v7);
      [v10 requestID];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 options];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 timer];
      uint64_t v13 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
      [v10 setTimer:0];
      if (v13) {
        dispatch_source_cancel(v13);
      }
      CFDictionaryGetTypeID();
      uint64_t v14 = CFDictionaryGetTypedValue();
      int v15 = (void *)v14;
      if (v14)
      {
        id v84 = (void *)v14;
        mach_absolute_time();
        [v10 sendTicks];
        uint64_t v82 = UpTicksToMilliseconds();
        uint64_t v83 = RPDecodeNSError(v6);
        if (v83)
        {
          int var0 = self->_ucat->var0;
          id v17 = (void *)v83;
          int v15 = v84;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          {
            peerIdentifier = self->_peerIdentifier;
            uint64_t v66 = v82;
            uint64_t v63 = v9;
            uint64_t v64 = v83;
            LogPrintF();
          }

          objc_msgSend(v10, "responseHandler", v63, v64, peerIdentifier, v66);
          int v29 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          v29[2](v29, 0LL, 0LL, v83);
        }

        else
        {
          uint64_t v77 = v13;
          uint64_t Int64 = CFDictionaryGetInt64();
          uint64_t v21 = CFDictionaryGetInt64();
          RPConnectionLog();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          __int128 v78 = v11;
          uint64_t v79 = v12;
          if (os_signpost_enabled(v22))
          {
            label = self->_label;
            uint64_t v24 = [v10 length];
            uint64_t v25 = self->_peerIdentifier;
            *(_DWORD *)buf = 67110402;
            int v88 = v9;
            __int16 v89 = 2112;
            BOOL v90 = label;
            id v12 = v79;
            __int16 v91 = 2048;
            uint64_t v92 = v82;
            __int16 v93 = 2048;
            uint64_t v94 = v24;
            __int16 v95 = 2048;
            uint64_t v96 = Int64;
            __int16 v97 = 2112;
            __int16 v98 = v25;
            _os_signpost_emit_with_name_impl( &dword_18736A000,  v22,  OS_SIGNPOST_INTERVAL_END,  v9,  "RPConnectionSendRequestTime",  " enableTelemetry=YES {XID:0x%X, connectionID:%@, rtt:%llu, requestSize:%zu, responseSize:%zu, peer:%@, sig npost.description:end_time}",  buf,  0x3Au);
          }

          id v26 = v11;
          int v27 = v26;
          if (v21)
          {
            int v28 = 10;
          }

          else if ([v26 isEqual:@"_ftSm"])
          {
            int v28 = 9;
          }

          else
          {
            int v28 = 9;
            if (([v27 isEqual:@"_ftLg"] & 1) == 0)
            {
              else {
                int v28 = 30;
              }
            }
          }

          int v30 = self->_ucat->var0;
          if (v28 >= v30 && (v30 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v31 = [v84 count];
            uint64_t v32 = self->_peerIdentifier;
            uint64_t v67 = [v10 length];
            uint64_t v68 = Int64;
            peerIdentifier = v32;
            uint64_t v66 = v82;
            uint64_t v63 = v9;
            uint64_t v64 = v31;
            LogPrintF();
            id v12 = v79;
          }

          objc_msgSend( v12,  "objectForKeyedSubscript:",  @"nwActivityMetrics",  v63,  v64,  peerIdentifier,  v66,  v67,  v68);
          BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
          id v34 = v33;
          if (v33)
          {
            [v33 setResponseSize:Int64];
            *(_DWORD *)buf = 0;
            uint64_t v35 = CFDictionaryGetInt64();
            if (!*(_DWORD *)buf) {
              [v34 setReplyTime:v35];
            }
            [v34 submitMetrics];
          }

          uint64_t v36 = self->_peerDeviceInfo;
          [v10 responseHandler];
          uint64_t v80 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          v85[0] = @"dlt";
          [MEMORY[0x189607968] numberWithInt:self->_linkType];
          id v75 = (void *)objc_claimAutoreleasedReturnValue();
          v86[0] = v75;
          v85[1] = @"senderIDSCID";
          uint64_t v37 = -[RPEndpoint idsCorrelationIdentifier](v36, "idsCorrelationIdentifier");
          BOOL v74 = (void *)v37;
          if (v37) {
            uint64_t v38 = (const __CFString *)v37;
          }
          else {
            uint64_t v38 = &stru_18A035BB8;
          }
          v86[1] = v38;
          v85[2] = @"length";
          uint64_t v39 = [MEMORY[0x189607968] numberWithUnsignedLong:a4->var0];
          id v73 = (void *)v39;
          peerAddrString = (const __CFString *)self->_peerAddrString;
          peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
          if (!peerAddrString) {
            peerAddrString = &stru_18A035BB8;
          }
          v86[2] = v39;
          v86[3] = peerAddrString;
          v85[3] = @"peerAddr";
          v85[4] = @"peerHomeKitUserIdentifier";
          if (peerHomeKitUserIdentifier) {
            BOOL v42 = (const __CFString *)peerHomeKitUserIdentifier;
          }
          else {
            BOOL v42 = &stru_18A035BB8;
          }
          selfAddrString = (const __CFString *)self->_selfAddrString;
          if (!selfAddrString) {
            selfAddrString = &stru_18A035BB8;
          }
          v86[4] = v42;
          v86[5] = selfAddrString;
          v85[5] = @"selfAddr";
          v85[6] = @"peerVerifiedIdentity";
          uint64_t v44 = -[RPEndpoint verifiedIdentity](v36, "verifiedIdentity");
          BOOL v72 = (void *)v44;
          __int128 v76 = (void (**)(void, void, void, void))v34;
          if (v44) {
            uint64_t v45 = (const __CFString *)v44;
          }
          else {
            uint64_t v45 = @"?";
          }
          v86[6] = v45;
          v85[7] = @"senderAccountAltDSID";
          uint64_t v46 = -[RPEndpoint accountAltDSID](v36, "accountAltDSID");
          uint64_t v71 = (void *)v46;
          if (v46) {
            uint64_t v47 = (const __CFString *)v46;
          }
          else {
            uint64_t v47 = &stru_18A035BB8;
          }
          v86[7] = v47;
          v85[8] = @"senderAccountID";
          uint64_t v48 = -[RPEndpoint accountID](v36, "accountID");
          id v70 = (void *)v48;
          if (v48) {
            uint64_t v49 = (const __CFString *)v48;
          }
          else {
            uint64_t v49 = &stru_18A035BB8;
          }
          v86[8] = v49;
          v85[9] = @"senderDeviceName";
          uint64_t v50 = -[RPEndpoint name](v36, "name");
          id v69 = (void *)v50;
          if (v50) {
            uint64_t v51 = (const __CFString *)v50;
          }
          else {
            uint64_t v51 = &stru_18A035BB8;
          }
          int v52 = (const __CFString *)self->_peerIdentifier;
          if (!v52) {
            int v52 = @"?";
          }
          v86[9] = v51;
          v86[10] = v52;
          v85[10] = @"senderID";
          v85[11] = @"senderIDS";
          uint64_t v53 = -[RPEndpoint idsDeviceIdentifier](v36, "idsDeviceIdentifier");
          uint64_t v54 = (void *)v53;
          if (v53) {
            int v55 = (const __CFString *)v53;
          }
          else {
            int v55 = @"?";
          }
          v86[11] = v55;
          v85[12] = @"senderModelID";
          uint64_t v56 = -[RPEndpoint model](v36, "model");
          uint64_t v57 = (void *)v56;
          if (v56) {
            uint64_t v58 = (const __CFString *)v56;
          }
          else {
            uint64_t v58 = @"?";
          }
          v86[12] = v58;
          v85[13] = @"statusFlags";
          objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[RPEndpoint statusFlags](v36, "statusFlags"));
          os_signpost_id_t v59 = (void *)objc_claimAutoreleasedReturnValue();
          v85[14] = @"xid";
          v86[13] = v59;
          v86[14] = v7;
          [MEMORY[0x189603F68] dictionaryWithObjects:v86 forKeys:v85 count:15];
          id v60 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void *, void *, void))v80)[2](v80, v84, v60, 0LL);

          id v12 = v79;
          +[RPConnectionMetrics sharedMetrics](&OBJC_CLASS___RPConnectionMetrics, "sharedMetrics");
          unint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t linkType = self->_linkType;

          int v15 = v84;
          objc_msgSend(v61, "logRequestOnLinkType:length:rtt:", linkType, objc_msgSend(v10, "length") + Int64, v82);

          int v29 = v76;
          uint64_t v13 = v77;
          uint64_t v11 = v78;
          id v17 = 0LL;
        }
      }

      else
      {
        int v20 = self->_ucat->var0;
      }
    }

    else
    {
      int v19 = self->_ucat->var0;
    }
  }

  else
  {
    int v18 = self->_ucat->var0;
  }
}

- (void)_abortRequestsWithError:(id)a3
{
  id v4 = a3;
  requests = self->_requests;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__RPConnection__abortRequestsWithError___block_invoke;
  v7[3] = &unk_18A032AF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requests, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSMutableDictionary removeAllObjects](self->_requests, "removeAllObjects");
}

void __40__RPConnection__abortRequestsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 296LL);
  if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v11 unsignedIntValue];
    uint64_t v10 = *(void *)(a1 + 40);
    LogPrintF();
  }

  objc_msgSend(v5, "timer", v9, v10);
  id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  [v5 setTimer:0];
  if (v7) {
    dispatch_source_cancel(v7);
  }
  [v5 responseHandler];
  id v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  [v5 setResponseHandler:0];
  if (v8) {
    v8[2](v8, 0LL, 0LL, *(void *)(a1 + 40));
  }
}

- (void)_timeoutForSendEntry:(id)a3
{
  id v15 = a3;
  [v15 xidObj];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPConnection _timeoutForXID:](self, "_timeoutForXID:", v4);
    goto LABEL_15;
  }

  mach_absolute_time();
  [v15 queueTicks];
  UpTicksToSecondsF();
  uint64_t v6 = v5;
  uint64_t v7 = -[NSMutableArray indexOfObject:](self->_sendArray, "indexOfObject:", v15);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", v7);
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      id v11 = v15;
      if (var0 == -1)
      {
        id v11 = v15;
      }

      [v11 requestID];
      uint64_t v14 = v6;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

- (void)_timeoutForXID:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 unsignedIntValue];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v14);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0LL, v14);
    mach_absolute_time();
    [v5 sendTicks];
    UpTicksToSecondsF();
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      uint64_t v8 = v6;
      if (var0 != -1 || _LogCategory_Initialize())
      {
        uint64_t v13 = v8;
        uint64_t v12 = v4;
        LogPrintF();
      }
    }

    objc_msgSend(v5, "responseHandler", v12, v13);
    uint64_t v10 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    RPErrorF();
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void, void *))v10)[2](v10, 0LL, 0LL, v11);
  }

  else
  {
    int v9 = self->_ucat->var0;
  }
}

- (id)_identityProofDataClient
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = self->_pairVerifySession;
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_8:
    uint64_t v6 = 0LL;
    goto LABEL_9;
  }

  if (-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]( v3,  "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:",  "IdentityProofClient-Salt",  24LL,  "IdentityProofClient-Info",  24LL,  32LL,  __s))
  {
    int var0 = self->_ucat->var0;
    goto LABEL_8;
  }

  uint64_t v6 = (void *)[MEMORY[0x189603F48] _newZeroingDataWithBytes:__s length:32];
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_9:

  return v6;
}

- (id)_identityProofDataServer
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = self->_pairVerifySession;
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_8:
    uint64_t v6 = 0LL;
    goto LABEL_9;
  }

  if (-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]( v3,  "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:",  "IdentityProofServer-Salt",  24LL,  "IdentityProofServer-Info",  24LL,  32LL,  __s))
  {
    int var0 = self->_ucat->var0;
    goto LABEL_8;
  }

  uint64_t v6 = (void *)[MEMORY[0x189603F48] _newZeroingDataWithBytes:__s length:32];
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_9:

  return v6;
}

- (void)_identityProofsAdd:(id)a3 update:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self->_identityDaemon;
  if (v7)
  {
    if (self->_clientMode) {
      -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
    }
    else {
      -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!a4)
      {
        -[RPIdentityDaemon identityOfSelfAndReturnError:](v7, "identityOfSelfAndReturnError:", 0LL);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v9;
        if (v9)
        {
          id v24 = 0LL;
          [v9 signData:v8 error:&v24];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          id v12 = v24;
          int var0 = self->_ucat->var0;
          if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
          {
            id v21 = v12;
            LogPrintF();
          }

          if (v11) {
            [v6 setObject:v11 forKeyedSubscript:@"_sigRP"];
          }
        }

        if ((self->_statusFlags & 0x8000) == 0)
        {
          v23[0] = MEMORY[0x1895F87A8];
          v23[1] = 3221225472LL;
          v23[2] = __42__RPConnection__identityProofsAdd_update___block_invoke;
          v23[3] = &unk_18A032B18;
          _BYTE v23[4] = self;
          void v23[5] = v8;
          id v14 = (void *)MEMORY[0x1895A4770](v23);
          -[RPIdentityDaemon getPairedIdentityWithCompletion:](v7, "getPairedIdentityWithCompletion:", v14);
        }
      }

      -[RPIdentityDaemon homeKitIdentity](v7, "homeKitIdentity", v21);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = v15;
      if (v15)
      {
        id v22 = 0LL;
        [v15 signData:v8 error:&v22];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v22;
        int v19 = self->_ucat->var0;
        if (v17)
        {
          [v16 identifier];
          int v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 setObject:v20 forKeyedSubscript:@"_idHKU"];

          [v6 setObject:v17 forKeyedSubscript:@"_sigHKU"];
        }
      }
    }
  }
}

void __42__RPConnection__identityProofsAdd_update___block_invoke(int8x16_t *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5 && !a3)
  {
    uint64_t v7 = *(dispatch_queue_s **)(a1[2].i64[0] + 552);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __42__RPConnection__identityProofsAdd_update___block_invoke_2;
    block[3] = &unk_18A032A28;
    id v9 = v5;
    int8x16_t v10 = vextq_s8(a1[2], a1[2], 8uLL);
    dispatch_async(v7, block);
  }
}

void __42__RPConnection__identityProofsAdd_update___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0LL;
  [v3 signData:v4 error:&v10];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  int v7 = **(_DWORD **)(*(void *)(a1 + 48) + 296LL);
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v6;
    uint64_t v9 = [v5 length];
    LogPrintF();
  }

  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:@"_sigPD"];
  }
  if (objc_msgSend(v2, "count", v8, v9)) {
    [*(id *)(a1 + 48) sendEncryptedEventID:@"_systemInfoUpdate" event:v2 options:0 completion:0];
  }
}

- (void)_identityProofsAddWithHomeKitUUID:(id)a3
{
  id v4 = a3;
  id v5 = self->_identityDaemon;
  if (v5)
  {
    if (self->_clientMode) {
      -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
    }
    else {
      -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      int var0 = self->_ucat->var0;
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      _DWORD v8[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke;
      v8[3] = &unk_18A032B18;
      v8[4] = self;
      v8[5] = v6;
      -[RPIdentityDaemon getPairingIdentityFromHomeWithAccessory:completion:]( v5,  "getPairingIdentityFromHomeWithAccessory:completion:",  v4,  v8);
    }
  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  uint64_t v8 = a1[2].i64[0];
  if (!v5 || v6)
  {
    int v10 = **(_DWORD **)(v8 + 296);
  }

  else
  {
    uint64_t v9 = *(dispatch_queue_s **)(v8 + 552);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_2;
    block[3] = &unk_18A032A28;
    id v12 = v5;
    int8x16_t v13 = vextq_s8(a1[2], a1[2], 8uLL);
    dispatch_async(v9, block);
  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0LL;
  [v2 signData:v3 error:&v12];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v12;
  if (v4)
  {
    int v6 = **(_DWORD **)(*(void *)(a1 + 48) + 296LL);
    if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v5;
      LogPrintF();
    }

    objc_msgSend(MEMORY[0x189603FC8], "dictionary", v10);
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) identifier];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v8 forKeyedSubscript:@"_idHKU"];

    [v7 setObject:v4 forKeyedSubscript:@"_sigHKU"];
    uint64_t v9 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_3;
    v11[3] = &unk_18A031AC0;
    v11[4] = v9;
    [v9 sendEncryptedEventID:@"_systemInfoUpdate" event:v7 options:0 completion:v11];
  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 296LL);
    if (v4 <= 30)
    {
      id v6 = v3;
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = v6, v5))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
}

- (void)_identityProofsVerify:(id)a3
{
  id v19 = a3;
  int v4 = self->_identityDaemon;
  if (v4)
  {
    if (self->_clientMode) {
      -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
    }
    else {
      -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
    }
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((self->_statusFlags & 0x24000) == 0)
    {
      CFDataGetTypeID();
      uint64_t v6 = CFDictionaryGetTypedValue();
      int v7 = (void *)v6;
      if (v5)
      {
        if (v6)
        {
          objc_storeStrong((id *)&self->_identityKeyData, v5);
          objc_storeStrong((id *)&self->_identitySignature, v7);
          unsigned int v8 = -[RPIdentityDaemon resolveIdentityTypesForSignature:data:typeFlags:]( v4,  "resolveIdentityTypesForSignature:data:typeFlags:",  v7,  v5,  3112LL);
          unint64_t v9 = ((v8 << 11) & 0x4000 | (((v8 >> 5) & 1) << 17)) & 0xFFFFFFCFFFFFFFFFLL | ((((unint64_t)(v8 & 0xC00) >> 10) & 3) << 36);
          -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  v9 | -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags"));
          self->_statusFlags |= v9;
          int var0 = self->_ucat->var0;
        }
      }
    }

    CFDataGetTypeID();
    uint64_t v11 = CFDictionaryGetTypedValue();
    id v12 = (void *)v11;
    if (v5 && v11 && (self->_statusFlags & 0x8000) == 0)
    {
      -[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:]( v4,  "resolveIdentityForSignature:data:typeFlags:error:",  v11,  v5,  128LL,  0LL);
      int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x8000);
        [v13 acl];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPEndpoint setVerifiedAcl:](self->_peerDeviceInfo, "setVerifiedAcl:", v14);

        self->_statusFlags |= 0x8000uLL;
        int v15 = self->_ucat->var0;
      }
    }

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    uint64_t v17 = CFDictionaryGetTypedValue();
    id v18 = (void *)v17;
    if (v16 && v17)
    {
      objc_storeStrong((id *)&self->_homeKitIdentityIdentifier, v16);
      objc_storeStrong((id *)&self->_homeKitIdentitySignature, v18);
      -[RPConnection _identityProofsVerifyHomeKitSignature:identifier:]( self,  "_identityProofsVerifyHomeKitSignature:identifier:",  v18,  v16);
    }
  }
}

- (void)_identityProofsVerifyHomeKitSignature:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((self->_statusFlags & 0x80000) != 0)
  {
    unint64_t v9 = 0LL;
  }

  else
  {
    -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (self->_clientMode) {
        -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
      }
      else {
        -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
      }
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        id v25 = 0LL;
        int v10 = [v8 verifySignature:v6 data:v9 error:&v25];
        id v11 = v25;
        int var0 = self->_ucat->var0;
        if (v10)
        {
          -[RPEndpoint setStatusFlags:]( self->_peerDeviceInfo,  "setStatusFlags:",  -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x80000);
          self->_statusFlags |= 0x80000uLL;
          [v8 identifier];
          int8x16_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v13;

          uint64_t v15 = MEMORY[0x1895A4770](self->_peerUpdatedHandler);
          int v16 = (void *)v15;
          if (v15) {
            (*(void (**)(uint64_t))(v15 + 16))(v15);
          }
        }
      }
    }

    else
    {
      unint64_t v9 = 0LL;
    }
  }

  if (self->_homeKitManager)
  {
    int v17 = self->_ucat->var0;
    id v18 = objc_alloc_init(MEMORY[0x18960ED68]);
    id v19 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v7];
    [v18 setIdentifier:v19];

    homeKitManager = self->_homeKitManager;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __65__RPConnection__identityProofsVerifyHomeKitSignature_identifier___block_invoke;
    v21[3] = &unk_18A032B40;
    v21[4] = self;
    id v22 = v7;
    id v23 = v9;
    id v24 = v6;
    -[CUHomeKitManager findPairedPeer:options:completion:]( homeKitManager,  "findPairedPeer:options:completion:",  v18,  32LL,  v21);
  }
}

void __65__RPConnection__identityProofsVerifyHomeKitSignature_identifier___block_invoke( void *a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    int v10 = **(_DWORD **)(a1[4] + 296LL);
  }

  else
  {
    unsigned int v8 = (void *)a1[6];
    if (v8)
    {
      id v9 = v8;
    }

    else
    {
      id v11 = (_BYTE *)a1[4];
      if (v11[328]) {
        [v11 _identityProofDataServer];
      }
      else {
        [v11 _identityProofDataClient];
      }
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9) {
        goto LABEL_25;
      }
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    [v5 publicKey];
    int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPIdentity setEdPKData:](v12, "setEdPKData:", v13);

    uint64_t v14 = a1[7];
    id v24 = 0LL;
    BOOL v15 = -[RPIdentity verifySignature:data:error:](v12, "verifySignature:data:error:", v14, v9, &v24);
    id v16 = v24;
    int v17 = **(_DWORD **)(a1[4] + 296LL);
    if (v15)
    {
      objc_msgSend( *(id *)(a1[4] + 672),  "setStatusFlags:",  objc_msgSend(*(id *)(a1[4] + 672), "statusFlags") | 0x2000);
      *(void *)(a1[4] + 768LL) |= 0x2000uLL;
      uint64_t v18 = a1[4];
      if (!*(void *)(v18 + 64))
      {
        uint64_t v19 = [v5 identifierStr];
        uint64_t v20 = a1[4];
        id v21 = *(void **)(v20 + 64);
        *(void *)(v20 + 64) = v19;

        uint64_t v18 = a1[4];
      }

      uint64_t v22 = MEMORY[0x1895A4770](*(void *)(v18 + 688));
      id v23 = (void *)v22;
      if (v22) {
        (*(void (**)(uint64_t))(v22 + 16))(v22);
      }
    }
  }

- (void)_idleTimerStart:(unsigned int)a3 repeat:(unsigned int)a4
{
  self->_receivedFrameCountLast = self->_receivedFrameCountCurrent;
  int var0 = self->_ucat->var0;
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    id v7 = idleTimer;
    dispatch_source_cancel(v7);
    unsigned int v8 = self->_idleTimer;
    self->_idleTimer = 0LL;
  }

  id v9 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  int v10 = self->_idleTimer;
  self->_idleTimer = v9;
  id v11 = v9;

  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __39__RPConnection__idleTimerStart_repeat___block_invoke;
  handler[3] = &unk_18A031AE8;
  handler[4] = v11;
  void handler[5] = self;
  dispatch_source_set_event_handler(v11, handler);
  CUDispatchTimerSet();
  dispatch_activate(v11);
}

void *__39__RPConnection__idleTimerStart_repeat___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[11]) {
    return (void *)[result _idleTimerFired];
  }
  return result;
}

- (void)_idleTimerFired
{
  unint64_t receivedFrameCountCurrent = self->_receivedFrameCountCurrent;
  int var0 = self->_ucat->var0;
  if (receivedFrameCountCurrent == self->_receivedFrameCountLast)
  {
    RPErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v5);
  }

  else
  {
    self->_receivedFrameCountLast = receivedFrameCountCurrent;
  }

- (BOOL)_receivedSystemInfo:(id)a3 xid:(id)a4
{
  uint64_t v138 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  unint64_t statusFlags = self->_statusFlags;
  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0) {
    -[RPConnection _identityProofsVerify:](self, "_identityProofsVerify:", v6);
  }
  if ((statusFlags & 0x10000AE000LL) != 0)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || v136 == -6756)
    {
      -[RPEndpoint setAccountAltDSID:](self->_peerDeviceInfo, "setAccountAltDSID:", v9);
    }

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || v136 == -6756)
    {
      -[RPEndpoint setAccountID:](self->_peerDeviceInfo, "setAccountID:", v10);
    }
  }

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!v136) {
    -[RPEndpoint setActivityLevel:](self->_peerDeviceInfo, "setActivityLevel:", Int64Ranged);
  }
  uint64_t v102 = statusFlags & 0x10000AE000LL;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    objc_storeStrong((id *)&self->_appID, v12);
  }
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13) {
    objc_storeStrong((id *)&self->_appInfoPeer, v13);
  }

  unsigned int Int64 = CFDictionaryGetInt64();
  if (!v136)
  {
    unsigned int v15 = Int64;
    unsigned int v135 = -[RPCompanionLinkDevice flags](self->_peerDeviceInfo, "flags");
    RPCompanionLinkFlagsWithUpdateBonjourFlags(&v135, v15);
    -[RPCompanionLinkDevice setFlags:](self->_peerDeviceInfo, "setFlags:", v135);
  }

  uint64_t v16 = statusFlags & 0x10000AE000LL;
  if (v102 || (self->_statusFlags & 0x2000000000LL) != 0)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    int v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 || v136 == -6756) {
      -[RPConnection setServiceType:](self, "setServiceType:", v17);
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v94 = v17;
      LogPrintF();
    }

    if (v102)
    {
      __int16 v19 = CFDictionaryGetInt64Ranged();
      if (!v136) {
        -[RPCompanionLinkDevice setFlags:]( self->_peerDeviceInfo,  "setFlags:",  -[RPCompanionLinkDevice flags](self->_peerDeviceInfo, "flags") & 0xFFFFFD7F | v19 & 0x280);
      }
    }
  }

  else
  {
    int v17 = v12;
  }

  __int16 v20 = CFDictionaryGetInt64();
  if ((v20 & 0x200) != 0) {
    self->_controlFlags |= v20 & 0x200;
  }
  if (!v102)
  {
LABEL_38:
    if ((statusFlags & 0x80000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }

  CFStringGetTypeID();
  uint64_t v21 = CFDictionaryGetTypedValue();

  if (!v21 && v136 != -6756)
  {
    int v17 = 0LL;
    goto LABEL_38;
  }

  -[RPCompanionLinkDevice setDeviceColor:](self->_peerDeviceInfo, "setDeviceColor:", v21, v94);
  int v17 = (void *)v21;
  if ((statusFlags & 0x80000) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  CFStringGetTypeID();
  uint64_t v22 = CFDictionaryGetTypedValue();

  if (v22 || v136 == -6756)
  {
    -[RPCompanionLinkDevice setRole:](self->_peerDeviceInfo, "setRole:", v22, v94);
    int v17 = (void *)v22;
  }

  else
  {
    int v17 = 0LL;
  }

void __40__RPConnection__receivedSystemInfo_xid___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = 0LL;
  }

  else
  {
    [*(id *)(a1 + 32) _systeminfo];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[37];
  if (v5 <= 10)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), int v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
    }
  }

  LOBYTE(v7) = 0;
  [v4 _sendEncryptedResponse:v3 options:0 error:v8 xid:*(void *)(a1 + 40) requestID:@"_systemInfo" highPriority:0 isChatty:v7 replyStartTime:0];
  *(_BYTE *)(*(void *)(a1 + 32) + 140LL) = 1;
  [*(id *)(a1 + 32) _run];
}

- (id)_systeminfo
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  unint64_t statusFlags = self->_statusFlags;
  uint64_t v5 = statusFlags & 0x10000AE000LL;
  uint64_t v6 = -[RPEndpoint accountAltDSID](self->_localDeviceInfo, "accountAltDSID");
  id v7 = (void *)v6;
  if ((statusFlags & 0x10000AE000LL) != 0 && v6 != 0) {
    [v3 setObject:v6 forKeyedSubscript:@"_accAltDSID"];
  }
  -[RPEndpoint accountID](self->_localDeviceInfo, "accountID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    [v3 setObject:v9 forKeyedSubscript:@"_accID"];
  }
  id v11 = self->_appID;

  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"_appID"];
  }
  id v12 = self->_appInfoSelf;

  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"_appInfo"];
  }
  unint64_t v63 = 0LL;
  RPBonjourFlagsUpdateWithRPCompanionLinkFlags(&v63, -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags"));
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v63];
  int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKeyedSubscript:@"_bf"];

  if (v5 || (self->_statusFlags & 0x2000000000LL) != 0)
  {
    p_isa = self->_serviceType;

    if (p_isa) {
      [v3 setObject:p_isa forKeyedSubscript:@"_clSrv"];
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      serviceType = self->_serviceType;
      LogPrintF();
    }

    if (v5)
    {
      __int16 v17 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags");
      uint64_t v14 = v17 & 0x280;
      if ((v17 & 0x280) != 0)
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:v14];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 setObject:v18 forKeyedSubscript:@"_clFl"];
      }
    }
  }

  else
  {
    p_isa = (NSString *)&v12->super.isa;
  }

  if ((self->_controlFlags & 0x200) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_controlFlags & 0x200];
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v19 forKeyedSubscript:@"_cf"];
  }

  if (v5)
  {
    uint64_t v20 = -[RPCompanionLinkDevice deviceColor](self->_localDeviceInfo, "deviceColor", v14);

    if (!v20)
    {
      p_isa = 0LL;
      if ((statusFlags & 0x80000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_33;
    }

    [v3 setObject:v20 forKeyedSubscript:@"_dC"];
    p_isa = (NSString *)v20;
  }

  if ((statusFlags & 0x80000) == 0) {
    goto LABEL_38;
  }
LABEL_33:
  uint64_t v21 = -[RPCompanionLinkDevice role](self->_localDeviceInfo, "role", v14, serviceType);

  if (v21)
  {
    [v3 setObject:v21 forKeyedSubscript:@"_forcedRole"];
    p_isa = (NSString *)v21;
  }

  else
  {
    p_isa = 0LL;
  }

- (id)_allowedMACAddressesForMCFeature:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  -[objc_class sharedConnection](getMCProfileConnectionClass(), "sharedConnection");
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 effectiveValuesForUnionSetting:v3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v12 UTF8String]
            && !TextToHardwareAddress())
          {
            int8x16_t v13 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v15 length:6];
            [v6 addObject:v13];
          }

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_configureForSessionPairing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_identityDaemon;
  if (v5)
  {
    int var0 = self->_ucat->var0;
    uint64_t v7 = MEMORY[0x1895F87A8];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __44__RPConnection__configureForSessionPairing___block_invoke;
    v10[3] = &unk_18A032B68;
    v10[4] = v5;
    void v10[5] = self;
    [v4 setCopyIdentityHandler:v10];
    v9[0] = v7;
    v9[1] = 3221225472LL;
    v9[2] = __44__RPConnection__configureForSessionPairing___block_invoke_2;
    v9[3] = &unk_18A032B90;
    v9[4] = self;
    v9[5] = v5;
    [v4 setFindPeerHandler:v9];
    v8[0] = v7;
    v8[1] = 3221225472LL;
    _DWORD v8[2] = __44__RPConnection__configureForSessionPairing___block_invoke_3;
    v8[3] = &unk_18A032BB8;
    v8[4] = self;
    v8[5] = v5;
    [v4 setSavePeerHandler:v8];
  }
}

id __44__RPConnection__configureForSessionPairing___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = *(void **)(a1 + 32);
  id v17 = 0LL;
  [v6 identityOfSelfAndReturnError:&v17];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v17;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0LL;
  }
  if (v9)
  {
    int v10 = **(_DWORD **)(*(void *)(a1 + 40) + 296LL);
    id v11 = 0LL;
    if (a3) {
      *a3 = v8;
    }
  }

  else
  {
    id v11 = objc_alloc_init(MEMORY[0x18960ED70]);
    [*(id *)(a1 + 32) sessionPairingIdentifier];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setIdentifier:v12];

    [v7 deviceIRKData];
    int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setAltIRK:v13];

    [v7 edPKData];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setPublicKey:v14];

    if ((a2 & 2) != 0)
    {
      [v7 edSKData];
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setSecretKey:v15];
    }
  }

  return v11;
}

uint64_t __44__RPConnection__configureForSessionPairing___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  int v8 = **(_DWORD **)(*(void *)(a1 + 32) + 296LL);
  if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
  {
    id v26 = v7;
    uint64_t v27 = a3;
    LogPrintF();
  }

  BOOL v9 = *(void **)(a1 + 40);
  id v34 = 0LL;
  objc_msgSend(v9, "identitiesOfType:error:", 13, &v34, v26, v27);
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v34;
  id v12 = v11;
  if (v11)
  {
    if (a4) {
      *a4 = v11;
    }
  }

  else
  {
    [v7 identifier];
    int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 UUIDString];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v15 = v10;
    id v16 = (id)[v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v16)
    {
      int v28 = v10;
      id v29 = v7;
      uint64_t v17 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0LL; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          __int128 v19 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          [v19 identifier];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          int v21 = [v20 isEqual:v14];

          if (v21)
          {
            id v16 = v19;
            goto LABEL_18;
          }
        }

        id v16 = (id)[v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v16) {
          continue;
        }
        break;
      }

BOOL __44__RPConnection__configureForSessionPairing___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 296LL);
  uint64_t v5 = -[RPIdentity initWithPairedPeer:type:]( objc_alloc(&OBJC_CLASS___RPIdentity),  "initWithPairedPeer:type:",  v3,  13LL);
  if (v5)
  {
    objc_msgSend( *(id *)(*(void *)(a1 + 32) + 672),  "setStatusFlags:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "statusFlags") | 0x2000000000);
    -[RPIdentity identifier](v5, "identifier");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 32) + 672) setVerifiedIdentity:v6];

    [*(id *)(a1 + 40) addSessionPairedIdentity:v5];
  }

  return v5 != 0LL;
}

- (void)addInUseProcess:(int)a3
{
  uint64_t v4 = RPProcessIDToNameString(*(uint64_t *)&a3);
  inUseProcesses = self->_inUseProcesses;
  id v8 = (id)v4;
  if (!inUseProcesses)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    id v7 = self->_inUseProcesses;
    self->_inUseProcesses = v6;

    uint64_t v4 = (uint64_t)v8;
    inUseProcesses = self->_inUseProcesses;
  }

  -[NSMutableSet addObject:](inUseProcesses, "addObject:", v4);
}

- (BOOL)containsInUseProcess:(int)a3
{
  if (!self->_inUseProcesses) {
    return 0;
  }
  id v3 = self;
  RPProcessIDToNameString(*(uint64_t *)&a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[NSMutableSet containsObject:](v3->_inUseProcesses, "containsObject:", v4);

  return (char)v3;
}

- (id)inUseProcessesToString
{
  inUseProcesses = self->_inUseProcesses;
  if (inUseProcesses)
  {
    -[NSMutableSet allObjects](inUseProcesses, "allObjects");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", @", ");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (void)removeInUseProcess:(int)a3
{
  if (self->_inUseProcesses)
  {
    RPProcessIDToNameString(*(uint64_t *)&a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](self->_inUseProcesses, "removeObject:", v4);
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
  self->_int passwordType = a3;
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

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSDictionary)appInfoPeer
{
  return self->_appInfoPeer;
}

- (NSDictionary)appInfoSelf
{
  return self->_appInfoSelf;
}

- (void)setAppInfoSelf:(id)a3
{
}

- (int64_t)bleClientUseCase
{
  return self->_bleClientUseCase;
}

- (void)setBleClientUseCase:(int64_t)a3
{
  self->_bleClientUseCase = a3;
}

- (CUBLEConnection)bleConnection
{
  return self->_bleConnection;
}

- (void)setBleConnection:(id)a3
{
}

- (NSUUID)blePeerIdentifier
{
  return self->_blePeerIdentifier;
}

- (void)setBlePeerIdentifier:(id)a3
{
}

- (unsigned)bleConnectionPSM
{
  return self->_bleConnectionPSM;
}

- (void)setBleConnectionPSM:(unsigned __int16)a3
{
  self->_uint64_t bleConnectionPSM = a3;
}

- (CUBonjourDevice)bonjourPeerDevice
{
  return self->_bonjourPeerDevice;
}

- (void)setBonjourPeerDevice:(id)a3
{
}

- (CUBluetoothScalablePipe)btPipe
{
  return self->_btPipe;
}

- (void)setBtPipe:(id)a3
{
}

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (BOOL)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(BOOL)a3
{
  self->_BOOL clientMode = a3;
}

- (RPCloudDaemon)cloudDaemon
{
  return self->_cloudDaemon;
}

- (void)setCloudDaemon:(id)a3
{
}

- (id)configurePairingHandler
{
  return self->_configurePairingHandler;
}

- (void)setConfigurePairingHandler:(id)a3
{
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_unint64_t controlFlags = a3;
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_id flags = a3;
}

- (BOOL)flowControlReadEnabled
{
  return self->_flowControlReadEnabled;
}

- (id)flowControlWriteChangedHandler
{
  return self->_flowControlWriteChangedHandler;
}

- (void)setFlowControlWriteChangedHandler:(id)a3
{
}

- (RPIdentity)forcedPeerIdentity
{
  return self->_forcedPeerIdentity;
}

- (void)setForcedPeerIdentity:(id)a3
{
}

- (RPIdentity)forcedSelfIdentity
{
  return self->_forcedSelfIdentity;
}

- (void)setForcedSelfIdentity:(id)a3
{
}

- (CUHomeKitManager)homeKitManager
{
  return self->_homeKitManager;
}

- (void)setHomeKitManager:(id)a3
{
}

- (id)homeKitUserIdentifierHandler
{
  return self->_homeKitUserIdentifierHandler;
}

- (void)setHomeKitUserIdentifierHandler:(id)a3
{
}

- (NSString)identifierOverride
{
  return self->_identifierOverride;
}

- (void)setIdentifierOverride:(id)a3
{
}

- (RPIdentityDaemon)identityDaemon
{
  return self->_identityDaemon;
}

- (void)setIdentityDaemon:(id)a3
{
}

- (RPIdentity)identityResolved
{
  return self->_identityResolved;
}

- (void)setIdentityResolved:(id)a3
{
}

- (RPIdentity)identityVerified
{
  return self->_identityVerified;
}

- (BOOL)invalidationHandled
{
  return self->_invalidationHandled;
}

- (void)setInvalidationHandled:(BOOL)a3
{
  self->_invalidationHandled = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (int)keepAliveSeconds
{
  return self->_keepAliveSeconds;
}

- (void)setKeepAliveSeconds:(int)a3
{
  self->_unsigned int keepAliveSeconds = a3;
}

- (NSString)label
{
  return self->_label;
}

- (int)linkType
{
  return self->_linkType;
}

- (RPCompanionLinkDevice)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (void)setLocalDeviceInfo:(id)a3
{
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNetLinkManager:(id)a3
{
}

- (int)pairVerifyAuthType
{
  return self->_pairVerifyAuthType;
}

- (id)pairVerifyCompletion
{
  return self->_pairVerifyCompletion;
}

- (void)setPairVerifyCompletion:(id)a3
{
}

- (NSString)peerAddrString
{
  return self->_peerAddrString;
}

- (RPCompanionLinkDevice)peerDeviceInfo
{
  return self->_peerDeviceInfo;
}

- (NSString)peerHomeKitUserIdentifier
{
  return self->_peerHomeKitUserIdentifier;
}

- (NSString)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (id)peerUpdatedHandler
{
  return self->_peerUpdatedHandler;
}

- (void)setPeerUpdatedHandler:(id)a3
{
}

- (BOOL)preAuthEnabled
{
  return self->_preAuthEnabled;
}

- (void)setPreAuthEnabled:(BOOL)a3
{
  self->_preAuthEnabled = a3;
}

- (int)preferredIdentityType
{
  return self->_preferredIdentityType;
}

- (void)setPreferredIdentityType:(int)a3
{
  self->_int preferredIdentityType = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (id)proxyDeviceUpdateHandler
{
  return self->_proxyDeviceUpdateHandler;
}

- (void)setProxyDeviceUpdateHandler:(id)a3
{
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
}

- (id)readErrorHandler
{
  return self->_readErrorHandler;
}

- (void)setReadErrorHandler:(id)a3
{
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
}

- (NSMutableArray)receivedMessages
{
  return self->_receivedMessages;
}

- (void)setReceivedMessages:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)sessionStartHandler
{
  return self->_sessionStartHandler;
}

- (void)setSessionStartHandler:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (CUTCPConnection)tcpConnection
{
  return self->_tcpConnection;
}

- (void)setTcpConnection:(id)a3
{
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (NSMutableArray)proxyDevices
{
  return self->_proxyDevices;
}

- (void)setProxyDevices:(id)a3
{
}

- (CUBluetoothScalablePipe)btPipeHighPriority
{
  return self->_btPipeHighPriority;
}

- (void)setBtPipeHighPriority:(id)a3
{
}

- (NSMutableSet)inUseProcesses
{
  return self->_inUseProcesses;
}

- (void)setInUseProcesses:(id)a3
{
}

- (BOOL)canDecode128bit
{
  return self->_canDecode128bit;
}

- (void)setCanDecode128bit:(BOOL)a3
{
  self->_canDecode128bit = a3;
}

- (void).cxx_destruct
{
}

@end