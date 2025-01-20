@interface CBDaemonXPCConnection
+ (unint64_t)indexForCBApprovedAppID:(id)a3;
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)_entitledCBAdvertiserAndReturnError:(id)a3 error:(id *)a4;
- (BOOL)entitled;
- (BOOL)remoteAccepted;
- (CBAdvertiser)activatedAdvertiser;
- (CBConnection)activatedConnection;
- (CBController)activatedController;
- (CBDaemonServer)daemon;
- (CBDevice)remoteDevice;
- (CBDiscovery)activatedDiscovery;
- (CBDiscovery)activatedDiscoveryWHB;
- (CBSpatialInteractionSession)activatedSpatialInteractionSession;
- (NSMutableDictionary)deviceMap;
- (NSNumber)remoteClientID;
- (NSString)appID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (RPCompanionLinkClient)remoteClient;
- (id)_spatialInteractionDecodePeerTokenRequest:(id)a3 error:(id *)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)pid;
- (int64_t)_powerStateForClient;
- (unint64_t)xpcToken;
- (void)_remoteInvalidate;
- (void)_setupWHBTimer;
- (void)_spatialInteractionDeviceFound:(id)a3 checkOnly:(BOOL)a4;
- (void)_spatialInteractionDeviceLost:(id)a3 removeUnmatched:(BOOL)a4 reason:(const char *)a5;
- (void)_spatialInteractionReevaluateDevices;
- (void)_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:(unsigned __int8)a3 device:(id)a4;
- (void)_whbTimerFired;
- (void)_xpcAdvertisingAddressChanged;
- (void)_xpcCBAdvertiserActivate:(id)a3;
- (void)_xpcCBAdvertiserUpdate:(id)a3;
- (void)_xpcCBConnection:(id)a3 pairingCompletedWithDevice:(id)a4 error:(id)a5;
- (void)_xpcCBConnection:(id)a3 pairingPromptWithPairingInfo:(id)a4;
- (void)_xpcCBConnectionActivate:(id)a3;
- (void)_xpcCBConnectionDisconnect:(id)a3;
- (void)_xpcCBConnectionPairingContinue:(id)a3;
- (void)_xpcCBControllerActivate:(id)a3;
- (void)_xpcCBDiscoveryActivate:(id)a3;
- (void)_xpcCBDiscoveryActivateLocal:(id)a3 discovery:(id)a4;
- (void)_xpcCBDiscoveryActivateWHB:(id)a3 discovery:(id)a4;
- (void)_xpcCBDiscoveryClearDuplicateFilterCache:(id)a3;
- (void)_xpcCBDiscoveryFinish:(id)a3;
- (void)_xpcCBDiscoveryGetDevices:(id)a3;
- (void)_xpcCBDiscoveryUpdate:(id)a3;
- (void)_xpcCBSpatialInteractionSessionActivate:(id)a3;
- (void)_xpcCBSpatialInteractionSessionAddPeerToken:(id)a3;
- (void)_xpcCBSpatialInteractionSessionRemovePeerToken:(id)a3;
- (void)_xpcCBSpatialInteractionSessionUpdate:(id)a3;
- (void)_xpcDeleteDevice:(id)a3;
- (void)_xpcDeviceFound:(id)a3;
- (void)_xpcDeviceLost:(id)a3;
- (void)_xpcDevicesBuffered:(id)a3;
- (void)_xpcDiagnosticAdvertiser;
- (void)_xpcDiagnosticAssertion;
- (void)_xpcDiagnosticControl:(id)a3;
- (void)_xpcDiagnosticDiscovery;
- (void)_xpcDiagnosticLog:(id)a3;
- (void)_xpcDiagnosticShow:(id)a3;
- (void)_xpcDiagnosticTipiChanged;
- (void)_xpcDiscoverableStateChanged:(int)a3;
- (void)_xpcGetControllerInfo:(id)a3;
- (void)_xpcGetControllerSettings:(id)a3;
- (void)_xpcGetDevices:(id)a3;
- (void)_xpcGetPowerState:(id)a3;
- (void)_xpcInquiryStateChanged:(int)a3;
- (void)_xpcModifyControllerSettings:(id)a3;
- (void)_xpcModifyDevice:(id)a3;
- (void)_xpcPerformDeviceRequest:(id)a3;
- (void)_xpcPowerStateChanged:(int64_t)a3;
- (void)_xpcReadPrefs:(id)a3;
- (void)_xpcReceivedMessage:(id)a3 remoteDevice:(id)a4;
- (void)_xpcReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6;
- (void)_xpcSendAudioAccessoryConfigMessage:(id)a3;
- (void)_xpcSendAudioAccessoryEventMessage:(id)a3;
- (void)_xpcSendConversationDetectMessage:(id)a3;
- (void)_xpcSendEvent:(id)a3;
- (void)_xpcSendRelayMessage:(id)a3;
- (void)_xpcSendReply:(id)a3;
- (void)_xpcSendReplyError:(id)a3 request:(id)a4;
- (void)_xpcSendSmartRoutingInformation:(id)a3;
- (void)_xpcSetLowPowerMode:(id)a3;
- (void)_xpcSetPowerState:(id)a3;
- (void)_xpcSpatialInteractionAOPDataReceived:(id)a3;
- (void)_xpcSystemOverrideChanged;
- (void)_xpcTipiChanged:(id)a3;
- (void)_xpcUpdateIdentities:(id)a3;
- (void)_xpcWritePref:(id)a3;
- (void)activate;
- (void)aopMessageReceived:(id)a3;
- (void)invalidate;
- (void)reportDeviceFound:(id)a3;
- (void)reportDeviceLost:(id)a3;
- (void)reportDevicesBuffered:(id)a3;
- (void)setActivatedAdvertiser:(id)a3;
- (void)setActivatedConnection:(id)a3;
- (void)setActivatedController:(id)a3;
- (void)setActivatedDiscovery:(id)a3;
- (void)setActivatedDiscoveryWHB:(id)a3;
- (void)setActivatedSpatialInteractionSession:(id)a3;
- (void)setAppID:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDeviceMap:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setRemoteAccepted:(BOOL)a3;
- (void)setRemoteClient:(id)a3;
- (void)setRemoteClientID:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)setXpcToken:(unint64_t)a3;
- (void)whbStop;
- (void)xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3;
- (void)xpcReceivedAudioAccessoryEventType:(unsigned __int8)a3 messageData:(id)a4 sourceDevice:(id)a5;
- (void)xpcReceivedEvent:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
- (void)xpcReceivedRequest:(id)a3;
@end

@implementation CBDaemonXPCConnection

- (id)description
{
  return -[CBDaemonXPCConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v102 = 0LL;
  v103 = &v102;
  uint64_t v104 = 0x3032000000LL;
  v105 = sub_1000526D0;
  v106 = sub_1000526E0;
  id v107 = 0LL;
  if (self->_xpcCnx)
  {
    id obj = 0LL;
    uint64_t v5 = CUPrintPID(self->_pid);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    NSAppendPrintF_safe(&obj, "%@", v6);
    objc_storeStrong(&v107, obj);
    goto LABEL_8;
  }

  unint64_t xpcToken = self->_xpcToken;
  if (xpcToken)
  {
    v100 = 0LL;
    NSAppendPrintF_safe(&v100, "Proxy %llu", xpcToken);
    v8 = v100;
LABEL_5:
    id v9 = v8;
    id v6 = v107;
    id v107 = v9;
    goto LABEL_8;
  }

  remoteDevice = self->_remoteDevice;
  if (!remoteDevice)
  {
    v98 = 0LL;
    NSAppendPrintF_safe(&v98, "Direct %@", self->_appID);
    v8 = v98;
    goto LABEL_5;
  }

  id v99 = 0LL;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](remoteDevice, "identifier"));
  NSAppendPrintF_safe(&v99, "Remote %@", v6);
  objc_storeStrong(&v107, v99);
LABEL_8:

  v11 = self->_activatedAdvertiser;
  v12 = v11;
  if (v11)
  {
    v13 = (id *)(v103 + 5);
    id v97 = (id)v103[5];
    NSAppendPrintF_safe(&v97, ", %@", v11);
    objc_storeStrong(v13, v97);
    int v14 = 1;
  }

  else
  {
    int v14 = 0;
  }

  v15 = self->_activatedConnection;
  v16 = v15;
  if (v15)
  {
    v17 = (id *)(v103 + 5);
    id v96 = (id)v103[5];
    NSAppendPrintF_safe(&v96, ", %@", v15);
    objc_storeStrong(v17, v96);
    ++v14;
  }

  v18 = self->_activatedController;
  v19 = v18;
  if (v18)
  {
    v20 = (id *)(v103 + 5);
    id v95 = (id)v103[5];
    NSAppendPrintF_safe(&v95, ", %@", v18);
    objc_storeStrong(v20, v95);
    ++v14;
  }

  v21 = self->_activatedDiscovery;
  v22 = v21;
  if (v21)
  {
    v23 = (id *)(v103 + 5);
    id v94 = (id)v103[5];
    NSAppendPrintF_safe(&v94, ", %@", v21);
    objc_storeStrong(v23, v94);
    ++v14;
  }

  v24 = self->_activatedDiscoveryWHB;
  v25 = v24;
  if (v24)
  {
    v26 = (id *)(v103 + 5);
    id v93 = (id)v103[5];
    NSAppendPrintF_safe(&v93, ", %@", v24);
    objc_storeStrong(v26, v93);
    int v14 = 1;
  }

  unsigned int v27 = v3;
  v28 = self;
  v29 = self->_activatedSpatialInteractionSession;
  if (v27 > 0x14)
  {
    if (v29)
    {
      v30 = (id *)(v103 + 5);
      id v92 = (id)v103[5];
      v31 = v29;
      NSAppendPrintF_safe(&v92, ", %@", v29);
      objc_storeStrong(v30, v92);
      v29 = v31;
    }

    v32 = self;
    id v33 = -[NSMutableArray count](self->_spatialPeers, "count");
    if (v33)
    {
      v34 = (id *)(v103 + 5);
      id v91 = (id)v103[5];
      NSAppendPrintF_safe(&v91, ", PeerTokens %d", (_DWORD)v33);
      objc_storeStrong(v34, v91);
      v32 = self;
    }

    unint64_t v35 = (unint64_t)-[NSMutableDictionary count](v32->_spatialDeviceMapMatched, "count");
    unint64_t v36 = (unint64_t)-[NSMutableDictionary count](v32->_spatialDeviceMapUnmatched, "count");
    if (v35 | v36)
    {
      v37 = v103;
      id v90 = (id)v103[5];
      NSAppendPrintF_safe(&v90, ", Matched %d/%d", v35, v36);
      id v38 = v90;
      v70 = (void *)v37[5];
      v37[5] = (uint64_t)v38;
    }

    goto LABEL_72;
  }

  v71 = v29;
  id v67 = -[NSMutableArray count](self->_spatialPeers, "count");
  *((void *)&v68 + 1) = -[NSMutableDictionary count](self->_spatialDeviceMapMatched, "count");
  *(void *)&__int128 v68 = -[NSMutableDictionary count](self->_spatialDeviceMapUnmatched, "count");
  if (v71) {
    BOOL v39 = v14 == 0;
  }
  else {
    BOOL v39 = 1;
  }
  int v40 = !v39;
  int v66 = v40;
  if (v39)
  {
    if (!v71) {
      goto LABEL_37;
    }
    v41 = (void **)(v103 + 5);
    v88 = (void *)v103[5];
    NSAppendPrintF_safe(&v88, "%@", v71);
    v42 = v88;
  }

  else
  {
    v41 = (void **)(v103 + 5);
    v89 = (void *)v103[5];
    NSAppendPrintF_safe(&v89, "\n        %@", v71);
    v42 = v89;
  }

  id v43 = v42;
  v44 = *v41;
  *v41 = v43;

  v28 = self;
LABEL_37:
  BOOL v69 = v67 != 0LL;
  if (v67)
  {
    v45 = (id *)(v103 + 5);
    id v87 = (id)v103[5];
    NSAppendPrintF_safe(&v87, ", PeerTokens: %d", (_DWORD)v67);
    objc_storeStrong(v45, v87);
    if (v68 == 0)
    {
LABEL_42:
      v47 = (id *)(v103 + 5);
      id v85 = (id)v103[5];
      NSAppendPrintF_safe(&v85, "\n");
      objc_storeStrong(v47, v85);
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      v48 = self->_spatialPeers;
      id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v81,  v108,  16LL);
      if (v49)
      {
        uint64_t v50 = *(void *)v82;
        do
        {
          for (i = 0LL; i != v49; i = (char *)i + 1)
          {
            if (*(void *)v82 != v50) {
              objc_enumerationMutation(v48);
            }
            v52 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
            v53 = (id *)(v103 + 5);
            id v80 = (id)v103[5];
            v54 = (void *)objc_claimAutoreleasedReturnValue([v52 tokenData]);
            v55 = (void *)objc_claimAutoreleasedReturnValue([v52 identifierData]);
            v56 = (void *)objc_claimAutoreleasedReturnValue([v52 irkData]);
            NSAppendPrintF_safe( &v80,  "        PeerToken <%@>, IDD <%@>, IRK <%@>, PeerID 0x%X\n",  v54,  v55,  v56,  [v52 peerID]);
            objc_storeStrong(v53, v80);
          }

          id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v81,  v108,  16LL);
        }

        while (v49);

        v28 = self;
        if (!*((void *)&v68 + 1))
        {
LABEL_57:
          if (!(void)v68) {
            goto LABEL_64;
          }
          if (v69) {
            goto LABEL_60;
          }
          goto LABEL_59;
        }
      }

      else
      {

        v28 = self;
        if (!*((void *)&v68 + 1)) {
          goto LABEL_56;
        }
      }

- (void)activate
{
  self->_isHomePod = GestaltGetDeviceClass(self) == 7;
  if (dword_1008D6630 <= 20 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
  {
    uint64_t v3 = CUPrintPID(self->_pid);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection activate]", 20LL, "XPC connection start: %@", v4);
  }

- (void)invalidate
{
  xpcCnx = self->_xpcCnx;
  if (xpcCnx) {
    xpc_connection_cancel(xpcCnx);
  }
  id v4 = self->_activatedAdvertiser;
  if (v4)
  {
    if (dword_1008D6630 < 31
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v5 = CUPrintPID(self->_pid);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection invalidate]", 30LL, "Invalidate: %@, from %@", v4, v6);
    }

    -[CBAdvertiser invalidate](v4, "invalidate");
    activatedAdvertiser = self->_activatedAdvertiser;
    self->_activatedAdvertiser = 0LL;

    -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self->_daemon, "scheduleAdvertiserUpdateImmediate:", 0LL);
  }

  v8 = self->_activatedConnection;
  if (v8)
  {
    if (dword_1008D6630 < 31
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v9 = CUPrintPID(self->_pid);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection invalidate]", 30LL, "Invalidate: %@, from %@", v8, v10);
    }

    -[CBConnection invalidate](v8, "invalidate");
    if (self->_connectionAddedPairingClient)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      [v11 removePairingClient:v8];

      self->_connectionAddedPairingClient = 0;
    }

    activatedConnection = self->_activatedConnection;
    self->_activatedConnection = 0LL;
  }

  v13 = self->_activatedController;
  if (v13)
  {
    if (dword_1008D6630 < 31
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v14 = CUPrintPID(self->_pid);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection invalidate]", 30LL, "Invalidate: %@, from %@", v13, v15);
    }

    if (self->_addedDiscoverableController)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      [v16 removeDiscoverableController:v13];

      self->_addedDiscoverableController = 0;
    }

    -[CBController invalidate](v13, "invalidate");
    activatedController = self->_activatedController;
    self->_activatedController = 0LL;

    -[CBDaemonServer scheduleControlUpdateImmediate:](self->_daemon, "scheduleControlUpdateImmediate:", 0LL);
  }

  v18 = self->_activatedDiscovery;
  if (v18)
  {
    if (dword_1008D6630 < 31
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v19 = CUPrintPID(self->_pid);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection invalidate]", 30LL, "Invalidate: %@, from %@", v18, v20);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
    [v21 reportCBDiscovery:v18 daemonCnx:self action:@"stop"];

    -[CBDiscovery invalidate](v18, "invalidate");
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0LL;

    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0LL);
  }

  v23 = self->_activatedDiscoveryWHB;
  if (v23)
  {
    if (dword_1008D6630 < 31
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v24 = CUPrintPID(self->_pid);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection invalidate]", 30LL, "Invalidate: %@, from %@", v23, v25);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
    [v26 reportCBDiscovery:v23 daemonCnx:self action:@"stop"];

    -[CBDiscovery invalidate](v23, "invalidate");
    activatedDiscoveryWHB = self->_activatedDiscoveryWHB;
    self->_activatedDiscoveryWHB = 0LL;

    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0LL);
  }

  if (self->_remoteClient)
  {
    -[CBDaemonXPCConnection _remoteInvalidate](self, "_remoteInvalidate");
    -[CBDaemonServer scheduleUpdateImmediate:](self->_daemon, "scheduleUpdateImmediate:", 0LL);
  }

  whbTimer = self->_whbTimer;
  if (whbTimer)
  {
    v29 = whbTimer;
    dispatch_source_cancel(v29);
    v30 = self->_whbTimer;
    self->_whbTimer = 0LL;
  }

  v31 = self->_activatedSpatialInteractionSession;
  if (v31)
  {
    if (dword_1008D6630 < 31
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v32 = CUPrintPID(self->_pid);
      id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection invalidate]", 30LL, "Invalidate: %@, from %@", v31, v33);
    }

    -[CBSpatialInteractionSession invalidate](v31, "invalidate");
    activatedSpatialInteractionSession = self->_activatedSpatialInteractionSession;
    self->_activatedSpatialInteractionSession = 0LL;

    -[CBDaemonServer scheduleSpatialUpdateImmediate:](self->_daemon, "scheduleSpatialUpdateImmediate:", 0LL);
  }

  -[CBDaemonServer xpcConnectionInvalidated:](self->_daemon, "xpcConnectionInvalidated:", self);
}

- (void)aopMessageReceived:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession aopDataHandler](self->_activatedSpatialInteractionSession, "aopDataHandler"));
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    }
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (!self->_entitled)
  {
    memset(v30, 0, sizeof(v30));
    xpc_connection_get_audit_token(self->_xpcCnx, v30);
    id v6 = (void *)xpc_copy_entitlement_for_token(0LL, v30);
    v7 = v6;
    if (!v6
      || !xpc_dictionary_get_BOOL(v6, "com.apple.bluetooth.system")
      && !xpc_dictionary_get_BOOL(v7, "com.apple.bluetooth.internal"))
    {
      uint64_t v23 = CBErrorF(4294896128LL, "Missing entitlement: %s", "com.apple.bluetooth.system");
      uint64_t v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(v23);
      if (dword_1008D6630 <= 90
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      {
        uint64_t v24 = CUPrintPID(self->_pid);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        uint64_t v26 = CUPrintNSError(v9);
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _entitledAndReturnError:]",  90LL,  "### CoreBluetooth denied: %@, %@",  v25,  v27);
      }

      if (a3)
      {
        uint64_t v9 = v9;
        BOOL v3 = 0;
        *a3 = v9;
      }

      else
      {
        BOOL v3 = 0;
      }

      goto LABEL_36;
    }

    string = (const char *)xpc_copy_code_signing_identity_for_token(v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100053100;
    v29[3] = &unk_10087EB20;
    v29[4] = string;
    uint64_t v9 = objc_retainBlock(v29);
    if (string || (string = xpc_dictionary_get_string(v7, "application-identifier")) != 0LL)
    {
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
      appID = self->_appID;
      self->_appID = v10;

      char v12 = 0;
    }

    else
    {
      char v12 = 1;
    }

    if (-[CBDaemonServer prefEnforceApprovedList](self->_daemon, "prefEnforceApprovedList"))
    {
      if ((v12 & 1) != 0)
      {
LABEL_15:
        uint64_t v17 = CBErrorF(4294960523LL, "App ID not approved: %s", string);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (dword_1008D6630 <= 90
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        {
          uint64_t v19 = CUPrintPID(self->_pid);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          uint64_t v21 = CUPrintNSError(v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _entitledAndReturnError:]",  90LL,  "### CoreBluetooth denied: %@, %@",  v20,  v22);
        }

        if (a3) {
          *a3 = v18;
        }

        BOOL v3 = 0;
LABEL_35:
        v9[2](v9);
LABEL_36:

        return v3;
      }

      v13 = self->_appID;
      uint64_t v14 = CBGenerateObfuscatedSHA256HashedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = 0LL;
      while (([v15 isEqualToString:off_1008803A8[v16]] & 1) == 0)
      {
        if (++v16 == 166)
        {

          goto LABEL_15;
        }
      }
    }

    if ((v12 & 1) == 0 && !strcmp(string, "com.apple.cloudpaird")) {
      self->_supportsRestrictedMode = 1;
    }
    BOOL v3 = 1;
    self->_entitled = 1;
    goto LABEL_35;
  }

  return 1;
}

+ (unint64_t)indexForCBApprovedAppID:(id)a3
{
  uint64_t v3 = CBGenerateObfuscatedSHA256HashedString(a3, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  for (unint64_t i = 0LL; i != 166; ++i)
  {
  }

  return i;
}

- (int64_t)_powerStateForClient
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
  id v4 = [v3 powerState];

  if (v4 == (id)10)
  {
    if (self->_supportsRestrictedMode)
    {
      return 10LL;
    }

    else if (self->_activatedDiscovery)
    {
      return 5LL;
    }

    else if (self->_activatedSpatialInteractionSession)
    {
      return 5LL;
    }

    else
    {
      return 10LL;
    }
  }

  return (int64_t)v4;
}

- (void)_remoteInvalidate
{
  uint64_t v3 = self->_remoteClient;
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  self->_remoteClientID,  @"cid");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", @"Invl", @"mTyp");
  BOOL remoteAccepted = self->_remoteAccepted;
  unsigned int v6 = -[NSNumber unsignedIntValue](self->_remoteClientID, "unsignedIntValue");
  if (dword_1008D6630 <= 30 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL))) {
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _remoteInvalidate]",  30LL,  "Remote invalidate send: CID 0x%X",  v6);
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v16 = RPOptionTimeoutSeconds;
    uint64_t v17 = &off_1008C28A0;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100053440;
    v13[3] = &unk_10087F338;
    unsigned int v14 = v6;
    BOOL v15 = remoteAccepted;
    v13[4] = v3;
    -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( v3,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.bluetooth.event",  v4,  v8,  v9,  v13);

LABEL_8:
    -[CBDaemonServer remoteDeregisterConnection:](self->_daemon, "remoteDeregisterConnection:", self);
    self->_BOOL remoteAccepted = 0;
    remoteClient = self->_remoteClient;
    self->_remoteClient = 0LL;

    remoteClientID = self->_remoteClientID;
    self->_remoteClientID = 0LL;

    remoteDevice = self->_remoteDevice;
    self->_remoteDevice = 0LL;

    goto LABEL_9;
  }

  if (dword_1008D6630 <= 90 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL))) {
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _remoteInvalidate]",  90LL,  "### Remote event send no remote device");
  }

LABEL_9:
}

- (void)reportDeviceFound:(id)a3
{
  id v20 = a3;
  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    uint64_t v5 = activatedDiscovery;
    goto LABEL_4;
  }

  uint64_t v5 = self->_activatedDiscoveryWHB;
  if (v5)
  {
LABEL_4:
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
    if (!v6)
    {
LABEL_59:

      goto LABEL_60;
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v6));
    if ([v20 discoveryTypesContainCBDiscovery:v5])
    {
      if (v7)
      {
        if (v7 != v20) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:");
        }
        if ((-[CBDiscovery discoveryFlags](v5, "discoveryFlags") & 0x100000) == 0
          && ![v20 changedTypesContainCBDiscovery:v5])
        {
          goto LABEL_58;
        }

        if (((unint64_t)[v20 discoveryFlags] & 0x1400000) != 0)
        {
          -[CBDaemonXPCConnection _setupWHBTimer](self, "_setupWHBTimer");
          v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_whbLostDevicesMap,  "objectForKeyedSubscript:",  v6));

          if (v8)
          {
            if (dword_1008D6630 <= 30
              && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
            {
              LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection reportDeviceFound:]",  30LL,  "WHB device found: %@. Cancelling lost timer",  v20);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_whbLostDevicesMap,  "setObject:forKeyedSubscript:",  0LL,  v6);
          }

          if (([v20 changeFlags] & 0x40000000) == 0)
          {
            if (v7 != v20)
            {
              unsigned int v13 = [v7 bleRSSI];
              if ((int)v13 <= -51)
              {
                BOOL v15 = v20;
                if (v13 <= 0xFFFFFFB9)
                {
                  if (v13 <= 0xFFFFFFAF) {
                    uint64_t v14 = v13 > 0xFFFFFFAA ? 3LL : 4LL;
                  }
                  else {
                    uint64_t v14 = 2LL;
                  }
                }

                else
                {
                  uint64_t v14 = 1LL;
                }
              }

              else
              {
                uint64_t v14 = 0LL;
                BOOL v15 = v20;
              }

              unsigned int v16 = [v15 bleRSSI];
              if ((int)v16 <= -51)
              {
                if (v16 <= 0xFFFFFFB9)
                {
                  if (v16 <= 0xFFFFFFAF)
                  {
                    uint64_t v17 = 3LL;
                    if (v16 <= 0xFFFFFFAA) {
                      uint64_t v17 = 4LL;
                    }
                  }

                  else
                  {
                    uint64_t v17 = 2LL;
                  }
                }

                else
                {
                  uint64_t v17 = 1LL;
                }
              }

              else
              {
                uint64_t v17 = 0LL;
              }

              if (v14 == v17)
              {
LABEL_63:
                if (dword_1008D6630 <= 20
                  && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
                {
                  LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection reportDeviceFound:]",  20LL,  "Ignoring WHB device found: %@ - no RSSI level change",  v20);
                }

                v18 = (void *)objc_claimAutoreleasedReturnValue( +[CBMetricsDaemon sharedCBMetricsDaemon]( &OBJC_CLASS___CBMetricsDaemon,  "sharedCBMetricsDaemon"));
                [v18 reportRSSIMetric:@"RSSILevelNoChange"];
LABEL_57:

                goto LABEL_58;
              }
            }

            if (dword_1008D6630 <= 20
              && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
            {
              LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection reportDeviceFound:]",  20LL,  "WHB device found: %@ - RSSI level change",  v20);
            }

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[CBMetricsDaemon sharedCBMetricsDaemon]( &OBJC_CLASS___CBMetricsDaemon,  "sharedCBMetricsDaemon"));
            [v19 reportRSSIMetric:@"RSSILevelChange"];
          }
        }
      }

      else
      {
        deviceMap = self->_deviceMap;
        if (!deviceMap)
        {
          v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          char v12 = self->_deviceMap;
          self->_deviceMap = v11;

          deviceMap = self->_deviceMap;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v20, v6);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceFoundHandler](v5, "deviceFoundHandler"));
    }

    else
    {
      if (!v7)
      {
LABEL_58:

        goto LABEL_59;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v6);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceLostHandler](v5, "deviceLostHandler"));
    }

    v18 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v20);
    }
    goto LABEL_57;
  }

- (void)reportDeviceLost:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      activatedDiscovery = self->_activatedDiscovery;
      if (activatedDiscovery)
      {
        id v7 = activatedDiscovery;
      }

      else
      {
        id v7 = self->_activatedDiscoveryWHB;
        if (!v7) {
          goto LABEL_16;
        }
      }

      if (((unint64_t)[v13 changeFlags] & 0x1400000) != 0
        && (v8 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteHostID]), v8, !v8))
      {
        -[CBDaemonXPCConnection _setupWHBTimer](self, "_setupWHBTimer");
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection reportDeviceLost:]",  30LL,  "WHB device lost :%@. Started lost timer",  v4);
        }

        uint64_t v11 = mach_absolute_time();
        char v12 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  UpTicksToSeconds(v11));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_whbLostDevicesMap,  "setObject:forKeyedSubscript:",  v10,  v4);
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v4);
        uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceLostHandler](v7, "deviceLostHandler"));
        v10 = (void *)v9;
        if (v9) {
          (*(void (**)(uint64_t, id))(v9 + 16))(v9, v13);
        }
      }
    }
  }

- (void)reportDevicesBuffered:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_activatedDiscovery;
  if (v5)
  {
    unsigned int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          char v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v11);
          id v13 = objc_autoreleasePoolPush();
          objc_autoreleasePoolPop(v13);
          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }

    if (-[NSMutableArray count](v6, "count"))
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CBDiscovery devicesBufferedHandler](v5, "devicesBufferedHandler"));
      BOOL v15 = (void *)v14;
      if (v14) {
        (*(void (**)(uint64_t, NSMutableArray *))(v14 + 16))(v14, v6);
      }
    }
  }
}

- (void)xpcReceivedMessage:(id)a3
{
  xpc_object_t xdict = a3;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "rmtD");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    if (v8) {
      -[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:](self, "_xpcReceivedMessage:remoteDevice:", xdict, v8);
    }
    else {
      -[CBDaemonXPCConnection xpcReceivedRequest:](self, "xpcReceivedRequest:", xdict);
    }

    goto LABEL_17;
  }

  id v4 = xdict;
  if (xdict == &_xpc_error_connection_invalid)
  {
    if (dword_1008D6630 <= 20
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
    {
      uint64_t v9 = CUPrintPID(self->_pid);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection xpcReceivedMessage:]",  20LL,  "XPC connection ended: %@",  v10);
    }

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0LL;

    -[CBDaemonXPCConnection invalidate](self, "invalidate");
    goto LABEL_17;
  }

  if (dword_1008D6630 <= 90)
  {
    if (dword_1008D6630 != -1 || (v11 = _LogCategory_Initialize(&dword_1008D6630, 90LL), id v4 = xdict, v11))
    {
      uint64_t v5 = CUPrintXPC(v4);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection xpcReceivedMessage:]",  90LL,  "### XPC connection error: %@",  v6);

LABEL_17:
      id v4 = xdict;
    }
  }
}

- (void)_xpcReceivedMessage:(id)a3 remoteDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v40 = 0LL;
  unsigned __int8 v8 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v40);
  id v9 = v40;
  if ((v8 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v6);
    goto LABEL_41;
  }

  if (!self->_remoteAccepted)
  {
    uint64_t v10 = self->_remoteClient;
    if (v10)
    {
      int v11 = v10;
    }

    else
    {
      int v11 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
      objc_storeStrong((id *)&self->_remoteClient, v11);
      -[RPCompanionLinkClient setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
      -[RPCompanionLinkClient setServiceType:](v11, "setServiceType:", @"com.apple.bluetooth.remote");
      id v39 = v9;
      uint64_t v41 = 0LL;
      else {
        uint64_t v12 = 0LL;
      }
      id v13 = v39;

      if (v13)
      {
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v13, v6);
        id v9 = v13;
        goto LABEL_40;
      }

      if (!(_DWORD)v12)
      {
        uint64_t v26 = CBErrorF(4294960585LL, "No client ID");
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v27, v6);

        id v9 = 0LL;
        goto LABEL_40;
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12));
      objc_storeStrong((id *)&self->_remoteClientID, v14);
      id v38 = 0LL;
      BOOL v15 = -[CBDevice initWithXPCObject:error:]( objc_alloc(&OBJC_CLASS___CBDevice),  "initWithXPCObject:error:",  v7,  &v38);
      id v9 = v38;
      if (!v15)
      {
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v6);
        goto LABEL_39;
      }

      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](v15, "identifier"));
      if (!v16)
      {
        uint64_t v28 = CBErrorF(4294960584LL, "Remote device without ID");
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v29, v6);

        goto LABEL_37;
      }

      objc_storeStrong((id *)&self->_remoteDevice, v15);
      -[CBDaemonServer remoteRegisterConnection:clientID:]( self->_daemon,  "remoteRegisterConnection:clientID:",  self,  v14);
      __int128 v17 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
      -[RPCompanionLinkDevice setIdentifier:](v17, "setIdentifier:", v16);
      -[RPCompanionLinkClient setDestinationDevice:](v11, "setDestinationDevice:", v17);
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]",  30LL,  "Remote client start: peer %@",  v16);
      }

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1000543DC;
      v34[3] = &unk_100880908;
      int v11 = v11;
      unint64_t v35 = v11;
      unint64_t v36 = self;
      v37 = v16;
      -[RPCompanionLinkClient activateWithCompletion:](v11, "activateWithCompletion:", v34);
    }

    uint64_t v14 = (void *)CUXPCCreateCFObjectFromXPCObject(v6);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v19) & 1) == 0)
    {
      uint64_t v25 = CBErrorF(4294960540LL, "Remote message non-dict");
      BOOL v15 = (CBDevice *)objc_claimAutoreleasedReturnValue(v25);
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v15, v6);
      goto LABEL_38;
    }

    BOOL v15 = (CBDevice *)[v14 mutableCopy];
    -[CBDevice setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", 0LL, @"rmtD");
    uint64_t v42 = RPOptionTimeoutSeconds;
    id v43 = &off_1008C28A0;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
    if (CUXPCDictionaryExpectsReply(v6))
    {
      if (dword_1008D6630 <= 20
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
      {
        uint64_t v20 = CUPrintNSObjectOneLine(v15);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]",  20LL,  "Remote request send: request %@",  v21);
      }

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1000544F4;
      v32[3] = &unk_100880958;
      v32[4] = self;
      id v33 = v6;
      -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:]( v11,  "sendRequestID:request:options:responseHandler:",  @"com.apple.bluetooth.request",  v15,  v16,  v32);
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
      if (v22)
      {
        if (dword_1008D6630 <= 20
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
        {
          uint64_t v23 = CUPrintNSObjectOneLine(v15);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]",  20LL,  "Remote event send: %@",  v24);
        }

        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        _OWORD v30[2] = sub_1000546F0;
        v30[3] = &unk_10087F1A8;
        v31 = v15;
        -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( v11,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.bluetooth.event",  v31,  v22,  v16,  v30);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]",  90LL,  "### Remote event send no remote device");
      }
    }

- (void)xpcReceivedEvent:(id)a3
{
  xpc_object_t xdict = a3;
  if (!self->_remoteDevice || (id v4 = xpc_dictionary_get_string(xdict, "mTyp")) == 0LL)
  {
LABEL_5:
    id v6 = self->_activatedConnection;
    if (v6 && (string = xpc_dictionary_get_string(xdict, "mTyp")) != 0LL && !strcmp(string, "CnxF"))
    {
      -[CBConnection xpcReceivedForwardedEvent:](v6, "xpcReceivedForwardedEvent:", xdict);
    }

    else
    {
      unsigned __int8 v8 = self->_xpcCnx;
      id v9 = v8;
      if (v8)
      {
        xpc_connection_send_message(v8, xdict);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection xpcReceivedEvent:]",  90LL,  "### XPC received event with no handler");
      }
    }

    goto LABEL_21;
  }

  uint64_t v5 = v4;
  if (strcmp(v4, "Invl"))
  {
    if (!strcmp(v5, "DscU"))
    {
      -[CBDaemonXPCConnection _xpcCBDiscoveryUpdate:](self, "_xpcCBDiscoveryUpdate:", xdict);
      goto LABEL_21;
    }

    goto LABEL_5;
  }

  if (dword_1008D6630 <= 20 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
  {
    uint64_t v10 = CUPrintPID(self->_pid);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection xpcReceivedEvent:]",  20LL,  "XPC connection ended: %@, remote %@",  v11,  v12);
  }

  -[CBDaemonXPCConnection invalidate](self, "invalidate");
LABEL_21:
}

- (void)xpcReceivedRequest:(id)a3
{
  id v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (string)
  {
    uint64_t v5 = string;
    if (!strcmp(string, "AdvA"))
    {
      -[CBDaemonXPCConnection _xpcCBAdvertiserActivate:](self, "_xpcCBAdvertiserActivate:", v8);
    }

    else if (!strcmp(v5, "AdvU"))
    {
      -[CBDaemonXPCConnection _xpcCBAdvertiserUpdate:](self, "_xpcCBAdvertiserUpdate:", v8);
    }

    else if (!strcmp(v5, "CnxA"))
    {
      -[CBDaemonXPCConnection _xpcCBConnectionActivate:](self, "_xpcCBConnectionActivate:", v8);
    }

    else
    {
      if (!strcmp(v5, "CnxD"))
      {
        -[CBDaemonXPCConnection _xpcCBConnectionDisconnect:](self, "_xpcCBConnectionDisconnect:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "CnPC"))
      {
        -[CBDaemonXPCConnection _xpcCBConnectionPairingContinue:](self, "_xpcCBConnectionPairingContinue:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "CtrA"))
      {
        -[CBDaemonXPCConnection _xpcCBControllerActivate:](self, "_xpcCBControllerActivate:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "GCtI"))
      {
        -[CBDaemonXPCConnection _xpcGetControllerInfo:](self, "_xpcGetControllerInfo:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "GCtS"))
      {
        -[CBDaemonXPCConnection _xpcGetControllerSettings:](self, "_xpcGetControllerSettings:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "MCtS"))
      {
        -[CBDaemonXPCConnection _xpcModifyControllerSettings:](self, "_xpcModifyControllerSettings:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "GtDv"))
      {
        -[CBDaemonXPCConnection _xpcGetDevices:](self, "_xpcGetDevices:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DltD"))
      {
        -[CBDaemonXPCConnection _xpcDeleteDevice:](self, "_xpcDeleteDevice:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "UpDv"))
      {
        -[CBDaemonXPCConnection _xpcModifyDevice:](self, "_xpcModifyDevice:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "PfDR"))
      {
        -[CBDaemonXPCConnection _xpcPerformDeviceRequest:](self, "_xpcPerformDeviceRequest:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DiCt"))
      {
        -[CBDaemonXPCConnection _xpcDiagnosticControl:](self, "_xpcDiagnosticControl:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DiLg"))
      {
        -[CBDaemonXPCConnection _xpcDiagnosticLog:](self, "_xpcDiagnosticLog:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DiSh"))
      {
        -[CBDaemonXPCConnection _xpcDiagnosticShow:](self, "_xpcDiagnosticShow:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "LpmS"))
      {
        -[CBDaemonXPCConnection _xpcSetLowPowerMode:](self, "_xpcSetLowPowerMode:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "PwrG"))
      {
        -[CBDaemonXPCConnection _xpcGetPowerState:](self, "_xpcGetPowerState:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "PwrS"))
      {
        -[CBDaemonXPCConnection _xpcSetPowerState:](self, "_xpcSetPowerState:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "RdPf"))
      {
        -[CBDaemonXPCConnection _xpcReadPrefs:](self, "_xpcReadPrefs:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "WrPf"))
      {
        -[CBDaemonXPCConnection _xpcWritePref:](self, "_xpcWritePref:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SnAE"))
      {
        -[CBDaemonXPCConnection _xpcSendAudioAccessoryEventMessage:](self, "_xpcSendAudioAccessoryEventMessage:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SnAC"))
      {
        -[CBDaemonXPCConnection _xpcSendAudioAccessoryConfigMessage:](self, "_xpcSendAudioAccessoryConfigMessage:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SnCD"))
      {
        -[CBDaemonXPCConnection _xpcSendConversationDetectMessage:](self, "_xpcSendConversationDetectMessage:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SnRM"))
      {
        -[CBDaemonXPCConnection _xpcSendRelayMessage:](self, "_xpcSendRelayMessage:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SnSR"))
      {
        -[CBDaemonXPCConnection _xpcSendSmartRoutingInformation:](self, "_xpcSendSmartRoutingInformation:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "UpId"))
      {
        -[CBDaemonXPCConnection _xpcUpdateIdentities:](self, "_xpcUpdateIdentities:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DscA"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryActivate:](self, "_xpcCBDiscoveryActivate:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DscF"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryFinish:](self, "_xpcCBDiscoveryFinish:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DscU"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryUpdate:](self, "_xpcCBDiscoveryUpdate:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DsCD"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryClearDuplicateFilterCache:]( self,  "_xpcCBDiscoveryClearDuplicateFilterCache:",  v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "DsGD"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryGetDevices:](self, "_xpcCBDiscoveryGetDevices:", v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SpIn"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionActivate:]( self,  "_xpcCBSpatialInteractionSessionActivate:",  v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SpIU"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionUpdate:]( self,  "_xpcCBSpatialInteractionSessionUpdate:",  v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SpAT"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionAddPeerToken:]( self,  "_xpcCBSpatialInteractionSessionAddPeerToken:",  v8);
        goto LABEL_87;
      }

      if (!strcmp(v5, "SpRT"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionRemovePeerToken:]( self,  "_xpcCBSpatialInteractionSessionRemovePeerToken:",  v8);
        goto LABEL_87;
      }

      if (dword_1008D6630 <= 90
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection xpcReceivedRequest:]",  90LL,  "### XPC unknown message type: '%s'",  v5);
      }

      if (CUXPCDictionaryExpectsReply(v8))
      {
        uint64_t v6 = CBErrorF(4294960561LL, "Unknown message type: '%s'");
        goto LABEL_50;
      }
    }
  }

  else
  {
    if (dword_1008D6630 <= 90
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    {
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection xpcReceivedRequest:]", 90LL, "### XPC no message type");
    }

    if (CUXPCDictionaryExpectsReply(v8))
    {
      uint64_t v6 = CBErrorF(4294960591LL, "No message type");
LABEL_50:
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v8);
    }
  }

- (void)_xpcSendEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_xpcCnx;
  uint64_t v6 = v5;
  if (v5)
  {
    xpc_connection_send_message(v5, v4);
  }

  else
  {
    id v7 = self->_remoteClient;
    if (v7)
    {
      id v8 = (void *)CUXPCCreateCFObjectFromXPCObject(v4);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        id v10 = [v8 mutableCopy];
        [v10 setObject:self->_remoteClientID forKeyedSubscript:@"cid"];
        [v10 setObject:0 forKeyedSubscript:@"rmtD"];
        int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
        if (v11)
        {
          if (dword_1008D6630 <= 20
            && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
          {
            uint64_t v12 = CUPrintNSObjectOneLine(v10);
            id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendEvent:]",  20LL,  "Remote event send: %@",  v13);
          }

          uint64_t v17 = RPOptionTimeoutSeconds;
          uint64_t v18 = &off_1008C28A0;
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_1000552D8;
          v15[3] = &unk_10087F1A8;
          id v16 = v10;
          -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( v7,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.bluetooth.event",  v16,  v11,  v14,  v15);
        }

        else if (dword_1008D6630 <= 90 {
               && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        }
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendEvent:]",  90LL,  "### Remote event send no remote device");
        }
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendEvent:]",  90LL,  "### Send event failed: convert XPC to CF");
      }
    }

    else if (dword_1008D6630 <= 90 {
           && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    }
    {
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection _xpcSendEvent:]", 90LL, "### Send event with no cnx");
    }
  }
}

- (void)_xpcSendReply:(id)a3
{
  id v4 = a3;
  xpcCnx = self->_xpcCnx;
  id v16 = v4;
  if (xpcCnx)
  {
    xpc_connection_send_message(xpcCnx, v4);
  }

  else
  {
    uint64_t ResponseHandler = CUXPCObjectGetResponseHandler(v4);
    id v7 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(ResponseHandler);
    if (v7)
    {
      id v8 = (void *)CUXPCCreateCFObjectFromXPCObject(v16);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v10 = CUPrintNSObjectOneLine(v8);
          int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendReply:]",  30LL,  "Remote reply send: %@",  v11);
        }

        ((void (**)(void, void *, void, void))v7)[2](v7, v8, 0LL, 0LL);
      }

      else
      {
        uint64_t v12 = CBErrorF(4294960579LL, "Convert XPC to CF failed");
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (dword_1008D6630 <= 90
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        {
          uint64_t v14 = CUPrintNSError(v13);
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendReply:]",  90LL,  "### Send reply failed: %@",  v15);
        }

        ((void (**)(void, void, void, void *))v7)[2](v7, 0LL, 0LL, v13);
      }
    }

    else if (dword_1008D6630 <= 90 {
           && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    }
    {
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection _xpcSendReply:]", 90LL, "### Send reply with no cnx");
    }
  }
}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t Reply = CUXPCDictionaryCreateReply();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);
  if (v8)
  {
    CUXPCEncodeNSError(v14, v8, "errO", "errC", "errD", "errM", "errO");
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      xpc_connection_send_message(xpcCnx, v8);
    }

    else
    {
      uint64_t ResponseHandler = CUXPCObjectGetResponseHandler(v6);
      int v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(ResponseHandler);
      if (v11)
      {
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v12 = CUPrintNSError(v14);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendReplyError:request:]",  30LL,  "Remote reply error: %@",  v13);
        }

        ((void (**)(void, void, void, id))v11)[2](v11, 0LL, 0LL, v14);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendReplyError:request:]",  90LL,  "### Send error with no cnx");
      }
    }
  }

  else if (dword_1008D6630 <= 90 {
         && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendReplyError:request:]",  90LL,  "### Send error create reply failed");
  }
}

- (BOOL)_entitledCBAdvertiserAndReturnError:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 safetyAlertsSignature]);
  if (v7)
  {
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 safetyAlertsAlertData]);

    if (!v8)
    {
LABEL_7:
      BOOL v11 = 1;
      goto LABEL_15;
    }
  }

  memset(v19, 0, sizeof(v19));
  xpc_connection_get_audit_token(self->_xpcCnx, v19);
  uint64_t v9 = (void *)xpc_copy_entitlement_for_token(0LL, v19);
  uint64_t v10 = v9;
  if (v9 && xpc_dictionary_get_BOOL(v9, "com.apple.bluetooth.safetyalerts"))
  {

    goto LABEL_7;
  }

  self->_entitled = 0;
  uint64_t v12 = CBErrorF(4294896128LL, "Missing entitlement for Safety Alerts");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (dword_1008D6630 <= 90 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
  {
    uint64_t v14 = CUPrintPID(self->_pid);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = CUPrintNSError(v13);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _entitledCBAdvertiserAndReturnError:error:]",  90LL,  "### CBAdvertiser denied: %@, %@",  v15,  v17);
  }

  if (a4) {
    *a4 = v13;
  }

  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (void)_xpcCBAdvertiserActivate:(id)a3
{
  id v4 = a3;
  v47[0] = 0LL;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", v47);
  id v6 = v47[0];
  if ((v5 & 1) != 0)
  {
    id v46 = v6;
    id v7 = -[CBAdvertiser initWithXPCObject:error:]( objc_alloc(&OBJC_CLASS___CBAdvertiser),  "initWithXPCObject:error:",  v4,  &v46);
    id v8 = v46;

    if (v7)
    {
      id v45 = v8;
      unsigned __int8 v9 = -[CBDaemonXPCConnection _entitledCBAdvertiserAndReturnError:error:]( self,  "_entitledCBAdvertiserAndReturnError:error:",  v7,  &v45);
      id v6 = v45;

      if ((v9 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_activatedAdvertiser, v7);
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v10 = CUPrintPID(self->_pid);
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBAdvertiserActivate:]",  30LL,  "Activate: %@, from %@",  v7,  v11);
        }

        -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self->_daemon, "scheduleAdvertiserUpdateImmediate:", 1LL);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_100055D84;
        v44[3] = &unk_10087EFC8;
        v44[4] = v7;
        v44[5] = self;
        -[CBAdvertiser setBluetoothStateChangedHandler:](v7, "setBluetoothStateChangedHandler:", v44);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100055DC8;
        v43[3] = &unk_10087EFC8;
        v43[4] = v7;
        v43[5] = self;
        -[CBAdvertiser setAdvertisingAddressChangedHandler:](v7, "setAdvertisingAddressChangedHandler:", v43);
        uint64_t Reply = CUXPCDictionaryCreateReply(v4);
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(Reply);
        if (v15)
        {
          id v41 = v6;
          id v42 = v4;
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 connectableAddressData]);

          -[CBAdvertiser setAdvertisingAddressDataConnectable:](v7, "setAdvertisingAddressDataConnectable:", v17);
          if (v17)
          {
            id v18 = v17;
            id v19 = v15;
            id v20 = v18;
            uint64_t v21 = (const char *)[v20 bytes];
            if (v21) {
              v22 = v21;
            }
            else {
              v22 = "";
            }
            id v23 = [v20 length];

            xpc_dictionary_set_data(v19, "aaCN", v22, (size_t)v23);
          }

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 nonConnectableAddressData]);

          -[CBAdvertiser setAdvertisingAddressDataNonConnectable:](v7, "setAdvertisingAddressDataNonConnectable:", v25);
          if (v25)
          {
            id v26 = v25;
            id v27 = v15;
            id v28 = v26;
            v29 = (const char *)[v28 bytes];
            if (v29) {
              v30 = v29;
            }
            else {
              v30 = "";
            }
            id v31 = [v28 length];

            xpc_dictionary_set_data(v27, "aaNC", v30, (size_t)v31);
          }

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 nonConnectableSecondaryAddressData]);

          -[CBAdvertiser setAdvertisingAddressDataNonConnectableSecondary:]( v7,  "setAdvertisingAddressDataNonConnectableSecondary:",  v33);
          if (v33)
          {
            id v34 = v33;
            id v35 = v15;
            id v36 = v34;
            v37 = (const char *)[v36 bytes];
            if (v37) {
              id v38 = v37;
            }
            else {
              id v38 = "";
            }
            id v39 = [v36 length];

            xpc_dictionary_set_data(v35, "aaNC2", v38, (size_t)v39);
          }

          int64_t v40 = -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient");
          if (v40) {
            xpc_dictionary_set_int64(v15, "pwrS", v40);
          }
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);

          id v6 = v41;
          id v4 = v42;
        }

        else if (dword_1008D6630 <= 90 {
               && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        }
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBAdvertiserActivate:]",  90LL,  "### CBAdvertiser activate create reply failed");
        }
      }

      else
      {
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
      }
    }

    else
    {
      if (dword_1008D6630 <= 90
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      {
        uint64_t v12 = CUPrintNSError(v8);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBAdvertiserActivate:]",  90LL,  "### CBAdvertiser activate decode failed: %@",  v13);
      }

      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v4);
      id v6 = v8;
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
  }
}

- (void)_xpcCBAdvertiserUpdate:(id)a3
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = sub_1000526D0;
  id v33 = sub_1000526E0;
  id v34 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100056340;
  v26[3] = &unk_10087F4C8;
  id v28 = &v29;
  v26[4] = self;
  id v4 = a3;
  id v27 = v4;
  unsigned __int8 v5 = objc_retainBlock(v26);
  id v6 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___CBAdvertiser);
    unsigned __int8 v9 = (id *)(v30 + 5);
    id v24 = (id)v30[5];
    uint64_t v10 = -[CBAdvertiser initWithXPCObject:error:](v8, "initWithXPCObject:error:", v4, &v24);
    objc_storeStrong(v9, v24);
    if (v10)
    {
      BOOL v11 = (id *)(v30 + 5);
      id v23 = (id)v30[5];
      unsigned int v12 = -[CBDaemonXPCConnection _entitledCBAdvertiserAndReturnError:error:]( self,  "_entitledCBAdvertiserAndReturnError:error:",  v10,  &v23);
      objc_storeStrong(v11, v23);
      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }

      id v13 = self->_activatedAdvertiser;
      uint64_t v14 = v13;
      if (v13)
      {
        unsigned int v15 = -[CBAdvertiser updateWithCBAdvertiser:](v13, "updateWithCBAdvertiser:", v10);
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v16 = CUPrintPID(self->_pid);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBAdvertiserUpdate:]",  30LL,  "CBAdvertiser Update: %@, from %@",  v14,  v17);
        }

        if (!v15) {
          goto LABEL_12;
        }
        -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self->_daemon, "scheduleAdvertiserUpdateImmediate:", 0LL);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
        [v18 reportxpcCBAdvertiserUpdate:v10];
      }

      else
      {
        uint64_t v21 = CBErrorF(4294960551LL, "No advertiser");
        uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
        id v18 = (void *)v30[5];
        v30[5] = v22;
      }
    }

    else
    {
      uint64_t v19 = CBErrorF(4294960591LL, "Decode failed");
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      uint64_t v14 = (CBAdvertiser *)v30[5];
      v30[5] = v20;
    }

- (void)_xpcCBConnectionActivate:(id)a3
{
  uint64_t v49 = 0LL;
  uint64_t v50 = (id *)&v49;
  uint64_t v51 = 0x3032000000LL;
  v52 = sub_1000526D0;
  v53 = sub_1000526E0;
  id v54 = 0LL;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000568F4;
  v46[3] = &unk_10087F4C8;
  v48 = &v49;
  v46[4] = self;
  id v4 = a3;
  id v47 = v4;
  unsigned __int8 v5 = objc_retainBlock(v46);
  id v6 = v50;
  id v45 = v50[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v45);
  objc_storeStrong(v6 + 5, v45);
  if ((v7 & 1) != 0)
  {
    if (self->_activatedConnection)
    {
      uint64_t v30 = CBErrorF(4294960575LL, "Already activated");
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
      uint64_t v10 = (CBConnection *)v50[5];
      v50[5] = (id)v31;
      goto LABEL_25;
    }

    id v8 = objc_alloc(&OBJC_CLASS___CBConnection);
    unsigned __int8 v9 = v50;
    id v44 = v50[5];
    uint64_t v10 = -[CBConnection initWithXPCObject:error:](v8, "initWithXPCObject:error:", v4, &v44);
    objc_storeStrong(v9 + 5, v44);
    if (!v10)
    {
LABEL_25:

      goto LABEL_26;
    }

    -[CBConnection setDispatchQueue:](v10, "setDispatchQueue:", self->_dispatchQueue);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBConnection peerDevice](v10, "peerDevice"));
    if (!v11)
    {
      uint64_t v32 = CBErrorF(4294960591LL, "No device");
      uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
      id v34 = v50[5];
      v50[5] = (id)v33;

      goto LABEL_24;
    }

    if ((-[CBConnection internalFlags](v10, "internalFlags") & 0x100) != 0)
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_1000569BC;
      v43[3] = &unk_100880980;
      v43[4] = v10;
      v43[5] = self;
      -[CBConnection setPairingCompletedHandler:](v10, "setPairingCompletedHandler:", v43);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_1000569DC;
      v42[3] = &unk_1008809A8;
      v42[4] = v10;
      v42[5] = self;
      -[CBConnection setPairingPromptHandler:](v10, "setPairingPromptHandler:", v42);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      id v13 = v50;
      id obj = v50[5];
      unsigned __int8 v14 = [v12 addPairingClient:v10 error:&obj];
      objc_storeStrong(v13 + 5, obj);

      if ((v14 & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }

      self->_connectionAddedPairingClient = 1;
    }

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1000569F8;
    v40[3] = &unk_10087F248;
    v40[4] = v10;
    v40[5] = self;
    -[CBConnection setXpcSendEventHandler:](v10, "setXpcSendEventHandler:", v40);
    objc_storeStrong((id *)&self->_activatedConnection, v10);
    unsigned int v15 = self->_appID;
    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v16 = CUPrintPID(self->_pid);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBConnectionActivate:]",  30LL,  "Activate: %@, from %@ (%@)",  v10,  v17,  v15);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBConnection clientBundleID](v10, "clientBundleID"));
    id v19 = [v18 length];

    if (!v19) {
      -[CBConnection setClientBundleID:](v10, "setClientBundleID:", v15);
    }
    id v20 = -[CBConnection serviceFlags](v10, "serviceFlags");
    if ((_DWORD)v20)
    {
      id v21 = -[CBConnection connectionFlags](v10, "connectionFlags");
      daemon = self->_daemon;
      if ((v21 & 2) == 0)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](daemon, "stackController"));
        id v24 = v50;
        id v37 = v50[5];
        unsigned __int8 v25 = [v23 connectDevice:v11 connectionFlags:v21 serviceFlags:v20 error:&v37];
        objc_storeStrong(v24 + 5, v37);

        if ((v25 & 1) != 0)
        {
          uint64_t Reply = CUXPCDictionaryCreateReply(v4);
          id v27 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v27);
        }

        goto LABEL_23;
      }

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](daemon, "stackController"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100056A14;
      v38[3] = &unk_100880908;
      v38[4] = v10;
      v38[5] = self;
      id v39 = v4;
      [v29 connectWithCBConnection:v10 completionHandler:v38];

      id v28 = v39;
    }

    else
    {
      if (self->_remoteClient) {
        -[CBConnection setInternalFlags:]( v10,  "setInternalFlags:",  -[CBConnection internalFlags](v10, "internalFlags") | 0x20);
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100056B50;
      v35[3] = &unk_100880908;
      v35[4] = v10;
      v35[5] = self;
      id v36 = v4;
      -[CBConnection activateWithCompletion:](v10, "activateWithCompletion:", v35);
      id v28 = v36;
    }

LABEL_23:
    goto LABEL_24;
  }

- (void)_xpcCBConnectionDisconnect:(id)a3
{
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = sub_1000526D0;
  uint64_t v33 = sub_1000526E0;
  id v34 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100056FB4;
  v26[3] = &unk_10087F4C8;
  id v28 = &v29;
  v26[4] = self;
  id v4 = a3;
  id v27 = v4;
  unsigned __int8 v5 = objc_retainBlock(v26);
  id v6 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___CBConnection);
    unsigned __int8 v9 = (id *)(v30 + 5);
    id v24 = (id)v30[5];
    uint64_t v10 = -[CBConnection initWithXPCObject:error:](v8, "initWithXPCObject:error:", v4, &v24);
    objc_storeStrong(v9, v24);
    if (!v10)
    {
LABEL_14:

      goto LABEL_15;
    }

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBConnection peerDevice](v10, "peerDevice"));
    if (v11)
    {
      id v12 = -[CBConnection serviceFlags](v10, "serviceFlags");
      if ((_DWORD)v12)
      {
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v13 = CUPrintFlags32(v12, &unk_1006BB328);
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBConnectionDisconnect:]",  30LL,  "CBConnection disconnect: %@, %@",  v11,  v14);
        }

        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        uint64_t v16 = (id *)(v30 + 5);
        id v23 = (id)v30[5];
        unsigned __int8 v17 = [v15 disconnectDevice:v11 serviceFlags:v12 error:&v23];
        objc_storeStrong(v16, v23);

        if ((v17 & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t Reply = CUXPCDictionaryCreateReply(v4);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(Reply);
        if (v19)
        {
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v19);
        }

        else if (dword_1008D6630 <= 90 {
               && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        }
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBConnectionDisconnect:]",  90LL,  "### CBConnection disconnect create reply failed");
        }

- (void)_xpcCBConnection:(id)a3 pairingCompletedWithDevice:(id)a4 error:(id)a5
{
  id v9 = a5;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v8, "mTyp", "PrCm");
  CUXPCEncodeObject(v8, "devi", v7, 0LL);

  if (v9) {
    CUXPCEncodeNSError(v9, v8, "errO", "errC", "errD", "errM", "errO");
  }
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v8);
}

- (void)_xpcCBConnection:(id)a3 pairingPromptWithPairingInfo:(id)a4
{
  id v5 = a4;
  id v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, "mTyp", "PrPm");
  CUXPCEncodeObject(v6, "prIn", v5, 0LL);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v6);
}

- (void)_xpcCBConnectionPairingContinue:(id)a3
{
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = sub_1000526D0;
  id v34 = sub_1000526E0;
  id v35 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000574FC;
  v27[3] = &unk_10087F4C8;
  uint64_t v29 = &v30;
  v27[4] = self;
  id v4 = a3;
  id v28 = v4;
  id v5 = objc_retainBlock(v27);
  id v6 = (id *)(v31 + 5);
  id obj = (id)v31[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    xpc_object_t v8 = self->_activatedConnection;
    if (v8)
    {
      id v25 = 0LL;
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___CBPairingInfo);
      uint64_t v10 = (id *)(v31 + 5);
      id v24 = (id)v31[5];
      CUXPCDecodeObject(v4, "prIn", v9, &v25, &v24);
      objc_storeStrong(v10, v24);
      if (!v31[5])
      {
        if (v25)
        {
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          id v12 = (id *)(v31 + 5);
          id v23 = (id)v31[5];
          [v11 pairingContinueWithPairingInfo:v25 error:&v23];
          objc_storeStrong(v12, v23);

          if (dword_1008D6630 <= 30
            && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
          {
            id v13 = v25;
            uint64_t v14 = CUPrintNSError(v31[5]);
            unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBConnectionPairingContinue:]",  30LL,  "CBConnection pairing continue: %@, %@, %@",  v8,  v13,  v15);
          }

          uint64_t Reply = CUXPCDictionaryCreateReply(v4);
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v17)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);
          }

          else if (dword_1008D6630 <= 90 {
                 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
          }
          {
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBConnectionPairingContinue:]",  90LL,  "### CBController PairingContinue create reply failed");
          }
        }

        else
        {
          uint64_t v21 = CBErrorF(4294960591LL, "No pairingInfo");
          uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
          unsigned __int8 v17 = (void *)v31[5];
          v31[5] = v22;
        }
      }
    }

    else
    {
      uint64_t v18 = CBErrorF(4294960551LL, "No connection");
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = (void *)v31[5];
      v31[5] = v19;
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v30, 8);
}

- (void)_xpcCBControllerActivate:(id)a3
{
  id v4 = a3;
  id v27 = 0LL;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  id v6 = v27;
  if ((v5 & 1) != 0)
  {
    id v26 = v6;
    unsigned __int8 v7 = -[CBController initWithXPCObject:error:]( objc_alloc(&OBJC_CLASS___CBController),  "initWithXPCObject:error:",  v4,  &v26);
    id v8 = v26;

    if (v7)
    {
      -[CBController setAppID:](v7, "setAppID:", self->_appID);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000579B4;
      v25[3] = &unk_10087EFC8;
      v25[4] = v7;
      v25[5] = self;
      -[CBController setBluetoothStateChangedHandler:](v7, "setBluetoothStateChangedHandler:", v25);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000579F8;
      v24[3] = &unk_10087EFC8;
      v24[4] = v7;
      v24[5] = self;
      -[CBController setDiscoverableStateChangedHandler:](v7, "setDiscoverableStateChangedHandler:", v24);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100057A5C;
      v23[3] = &unk_10087EFC8;
      v23[4] = v7;
      v23[5] = self;
      -[CBController setInquiryStateChangedHandler:](v7, "setInquiryStateChangedHandler:", v23);
      if ((-[CBController internalFlags](v7, "internalFlags") & 0x40) != 0)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_100057AC0;
        v22[3] = &unk_10087F2C0;
        v22[4] = v7;
        v22[5] = self;
        -[CBController setRelayMessageHandler:](v7, "setRelayMessageHandler:", v22);
      }

      if ((-[CBController internalFlags](v7, "internalFlags") & 0x200) != 0)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100057AE8;
        v21[3] = &unk_10087EF10;
        v21[4] = v7;
        v21[5] = self;
        -[CBController setTipiChangedHandler:](v7, "setTipiChangedHandler:", v21);
      }

      objc_storeStrong((id *)&self->_activatedController, v7);
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        uint64_t v9 = CUPrintPID(self->_pid);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBControllerActivate:]",  30LL,  "Activate: %@, from %@",  v7,  v10);
      }

      -[CBDaemonServer scheduleControlUpdateImmediate:](self->_daemon, "scheduleControlUpdateImmediate:", 0LL);
      uint64_t Reply = CUXPCDictionaryCreateReply(v4);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v14)
      {
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        signed int v16 = [v15 discoverableState];
        if (v16) {
          xpc_dictionary_set_int64(v14, "dsSt", v16);
        }

        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        signed int v18 = [v17 inquiryState];
        if (v18) {
          xpc_dictionary_set_int64(v14, "inqS", v18);
        }

        int64_t v19 = -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient");
        if (v19) {
          xpc_dictionary_set_int64(v14, "pwrS", v19);
        }
        if ((-[CBController internalFlags](v7, "internalFlags") & 0x2000) != 0)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer getAudioAccessoryDeviceArray](self->_daemon, "getAudioAccessoryDeviceArray"));
          if (v20) {
            xpc_dictionary_set_value(v14, "aaDD", v20);
          }
        }

        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBControllerActivate:]",  90LL,  "### CBController activate create reply failed");
      }
    }

    else
    {
      if (dword_1008D6630 <= 90
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      {
        uint64_t v11 = CUPrintNSError(v8);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBControllerActivate:]",  90LL,  "### CBController activate decode failed: %@",  v12);
      }

      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v4);
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    id v8 = v6;
  }
}

- (void)_xpcGetControllerInfo:(id)a3
{
  id v14 = 0LL;
  id v4 = a3;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v14);
  id v6 = v14;
  if ((v5 & 1) != 0)
  {
    uint64_t Reply = CUXPCDictionaryCreateReply(v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 controllerInfo]);

      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        uint64_t v11 = CUDescriptionWithLevel(v10, 134217778LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetControllerInfo:]",  30LL,  "GetControllerInfo: %@",  v12);
      }

      xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
      [v10 encodeWithXPCObject:v13];
      xpc_dictionary_set_value(v8, "ctrI", v13);
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v8);
    }

    else if (dword_1008D6630 <= 90 {
           && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetControllerInfo:]",  90LL,  "### GetControllerInfo create reply failed");
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    id v8 = v4;
  }
}

- (void)_xpcGetControllerSettings:(id)a3
{
  id v32 = 0LL;
  id v4 = a3;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v32);
  id v6 = v32;
  if ((v5 & 1) != 0)
  {
    uint64_t Reply = CUXPCDictionaryCreateReply(v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);

    if (v8)
    {
      id v31 = v6;
      id v9 = objc_alloc_init(&OBJC_CLASS___CBControllerSettings);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      objc_msgSend(v9, "setDiscoverableState:", objc_msgSend(v10, "discoverableState"));

      uint64_t v11 = (void *)CFPreferencesCopyValue( @"move3PPLEMSToLegacyMode",  @"com.apple.bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
      char v13 = 1;
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        else {
          char v13 = 2;
        }
      }

      [v9 setHid3ppLELegacyMode:v13];
      id v14 = (void *)CFPreferencesCopyValue( @"btvcDefaultAdvRSSI",  @"com.apple.bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t v30 = v11;
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
        signed __int8 v16 = [v14 intValue];
      }
      else {
        signed __int8 v16 = -60;
      }
      unsigned __int8 v17 = self;
      [v9 setBleAdvRSSI:v16];
      signed int v18 = (void *)CFPreferencesCopyValue( @"BluetoothAutoSeekKeyboard",  @"com.apple.Bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
      char v20 = 1;
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        else {
          char v20 = 2;
        }
      }

      [v9 setSetupAssistantIfNoKeyboard:v20];
      uint64_t v21 = (void *)CFPreferencesCopyValue( @"BluetoothAutoSeekPointingDevice",  @"com.apple.Bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
      char v23 = 1;
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      {
        else {
          char v23 = 2;
        }
      }

      [v9 setSetupAssistantIfNoPointingDevice:v23];
      id v24 = (void *)CFPreferencesCopyValue( @"SpatialSoundProfileAllowed",  @"com.apple.bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber);
      char v26 = 1;
      if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      {
        else {
          char v26 = 2;
        }
      }

      [v9 setSpatialSoundProfileAllowed:v26];
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        uint64_t v27 = CUDescriptionWithLevel(v9, 134217778LL);
        id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetControllerSettings:]",  30LL,  "GetControllerSettings: %@",  v28,  v30);
      }

      xpc_object_t v29 = xpc_dictionary_create(0LL, 0LL, 0LL);
      [v9 encodeWithXPCObject:v29];
      xpc_dictionary_set_value(v8, "ctrS", v29);
      -[CBDaemonXPCConnection _xpcSendReply:](v17, "_xpcSendReply:", v8);

      id v6 = v31;
    }

    else if (dword_1008D6630 <= 90 {
           && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetControllerSettings:]",  90LL,  "### GetControllerSettings create reply failed");
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    id v8 = v4;
  }
}

- (void)_xpcModifyControllerSettings:(id)a3
{
  uint64_t v46 = 0LL;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  uint64_t v49 = sub_1000526D0;
  uint64_t v50 = sub_1000526E0;
  id v51 = 0LL;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000587B4;
  v43[3] = &unk_10087F4C8;
  id v45 = &v46;
  v43[4] = self;
  id v4 = a3;
  id v44 = v4;
  unsigned __int8 v5 = objc_retainBlock(v43);
  id v6 = (id *)(v47 + 5);
  id obj = (id)v47[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    id v41 = 0LL;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CBControllerSettings);
    id v9 = (id *)(v47 + 5);
    id v40 = (id)v47[5];
    CUXPCDecodeObject(v4, "ctrS", v8, &v41, &v40);
    objc_storeStrong(v9, v40);
    if (v47[5])
    {
LABEL_78:

      goto LABEL_79;
    }

    id v10 = v41;
    if (!v41)
    {
      uint64_t v37 = CBErrorF(4294960591LL, "No settings");
      uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
      id v14 = (CBController *)v47[5];
      v47[5] = v38;
LABEL_77:

      goto LABEL_78;
    }

    if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 != -1 || (int v11 = _LogCategory_Initialize(&dword_1008D6630, 30LL), v10 = v41, v11))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]",  30LL,  "ModifyControllerSettings: %@",  v10);
        id v10 = v41;
      }
    }

    unsigned int v12 = [v10 discoverableState];
    if (v12)
    {
      char v13 = self->_activatedController;
      id v14 = v13;
      if (v12 == 2)
      {
        if (!v13)
        {
          id v14 = objc_alloc_init(&OBJC_CLASS___CBController);
          -[CBController setAppID:](v14, "setAppID:", self->_appID);
          objc_storeStrong((id *)&self->_activatedController, v14);
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        signed __int8 v16 = (id *)(v47 + 5);
        id v39 = (id)v47[5];
        unsigned __int8 v17 = [v15 addDiscoverableController:v14 error:&v39];
        objc_storeStrong(v16, v39);

        if ((v17 & 1) == 0) {
          goto LABEL_77;
        }
        self->_addedDiscoverableController = 1;
        goto LABEL_16;
      }

      if (v13)
      {
        signed int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        [v18 removeDiscoverableController:v14];

LABEL_16:
      }
    }

    unsigned int v19 = [v41 hid3ppLELegacyMode];
    unsigned int v20 = v19;
    if (v19 == 1) {
      CFBooleanRef v21 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v21 = kCFBooleanFalse;
    }
    if (v19)
    {
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        if (v20 > 2) {
          uint64_t v22 = "?";
        }
        else {
          uint64_t v22 = off_100880B68[v20];
        }
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]",  30LL,  "hid3ppLELegacyMode: %s",  v22);
      }

      CFPreferencesSetValue( @"move3PPLEMSToLegacyMode",  v21,  @"com.apple.bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
      notify_post("com.apple.bluetooth.prefsChanged");
    }

    signed int v23 = [v41 bleAdvRSSI];
    if (v23)
    {
      if (dword_1008D6630 <= 50
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 50LL)))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]",  50LL,  "bleAdvRSSI: %d",  v23);
      }

      CFPrefs_SetInt64(@"com.apple.bluetooth", @"btvcDefaultAdvRSSI", v23);
      notify_post("com.apple.bluetooth.prefsChanged");
    }

    unsigned int v24 = [v41 setupAssistantIfNoKeyboard];
    unsigned int v25 = v24;
    if (v24 == 1) {
      CFBooleanRef v26 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v26 = kCFBooleanFalse;
    }
    if (v24)
    {
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        if (v25 > 2) {
          uint64_t v27 = "?";
        }
        else {
          uint64_t v27 = off_100880B68[v25];
        }
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]",  30LL,  "SetupAssistantIfNoKeyboard: %s",  v27);
      }

      CFPreferencesSetValue( @"BluetoothAutoSeekKeyboard",  v26,  @"com.apple.Bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
    }

    unsigned int v28 = [v41 setupAssistantIfNoPointingDevice];
    unsigned int v29 = v28;
    if (v28 == 1) {
      CFBooleanRef v30 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v30 = kCFBooleanFalse;
    }
    if (v28)
    {
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        if (v29 > 2) {
          id v31 = "?";
        }
        else {
          id v31 = off_100880B68[v29];
        }
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]",  30LL,  "SetupAssistantIfNoPointingDevice: %s",  v31);
      }

      CFPreferencesSetValue( @"BluetoothAutoSeekPointingDevice",  v30,  @"com.apple.Bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
    }

    unsigned int v32 = [v41 spatialSoundProfileAllowed];
    unsigned int v33 = v32;
    if (v32 == 1) {
      CFBooleanRef v34 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v34 = kCFBooleanFalse;
    }
    if (v32)
    {
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        if (v33 > 2) {
          id v35 = "?";
        }
        else {
          id v35 = off_100880B68[v33];
        }
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]",  30LL,  "spatialSoundProfileAllowed: %s",  v35);
      }

      CFPreferencesSetValue( @"SpatialSoundProfileAllowed",  v34,  @"com.apple.bluetooth",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
      notify_post("com.apple.bluetooth.prefsChanged");
    }

    uint64_t Reply = CUXPCDictionaryCreateReply(v4);
    id v14 = (CBController *)objc_claimAutoreleasedReturnValue(Reply);
    if (v14)
    {
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);
    }

    else if (dword_1008D6630 <= 90 {
           && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]",  90LL,  "### ModifyControllerSettings create reply failed");
    }

    goto LABEL_77;
  }

- (void)_xpcGetDevices:(id)a3
{
  uint64_t v24 = 0LL;
  unsigned int v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_1000526D0;
  unsigned int v28 = sub_1000526E0;
  id v29 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100058B78;
  v21[3] = &unk_10087F4C8;
  signed int v23 = &v24;
  v21[4] = self;
  id v4 = a3;
  id v22 = v4;
  unsigned __int8 v5 = objc_retainBlock(v21);
  id v6 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  uint64_t v8 = (id *)(v25 + 5);
  if ((v7 & 1) != 0)
  {
    id v19 = (id)v25[5];
    uint64_t v30 = 0LL;
    else {
      uint64_t v9 = 0LL;
    }
    objc_storeStrong(v8, v19);
    if (!v25[5])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      int v11 = (id *)(v25 + 5);
      id v18 = (id)v25[5];
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 getDevicesWithFlags:v9 error:&v18]);
      objc_storeStrong(v11, v18);

      if (v12)
      {
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v13 = CUPrintFlags32(v9, &unk_1006BB480);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetDevices:]",  30,  "GetDevices: flags %@, total %d",  v14,  [v12 count]);
        }

        uint64_t Reply = CUXPCDictionaryCreateReply(v4);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(Reply);
        unsigned __int8 v17 = (void *)v16;
        if (v16)
        {
          CUXPCEncodeNSArrayOfObjects(v16, "devA", v12);
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);
        }

        else if (dword_1008D6630 <= 90 {
               && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        }
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetDevices:]",  90LL,  "### GetDevices create reply failed");
        }
      }
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v25[5], v4);
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v24, 8);
}

- (void)_xpcDeleteDevice:(id)a3
{
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1000526D0;
  uint64_t v30 = sub_1000526E0;
  id v31 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100058F24;
  v23[3] = &unk_10087F4C8;
  unsigned int v25 = &v26;
  v23[4] = self;
  id v4 = a3;
  id v24 = v4;
  unsigned __int8 v5 = objc_retainBlock(v23);
  id v6 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v4, "devi");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    if (v9)
    {
      id v10 = objc_alloc(&OBJC_CLASS___CBDevice);
      int v11 = (id *)(v27 + 5);
      id v21 = (id)v27[5];
      unsigned int v12 = -[CBDevice initWithXPCObject:error:](v10, "initWithXPCObject:error:", v9, &v21);
      objc_storeStrong(v11, v21);
      if (v12)
      {
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection _xpcDeleteDevice:]", 30LL, "DeleteDevice: %@", v12);
        }

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        id v14 = (id *)(v27 + 5);
        id v20 = (id)v27[5];
        unsigned __int8 v15 = [v13 deleteDevice:v12 error:&v20];
        objc_storeStrong(v14, v20);

        if ((v15 & 1) != 0)
        {
          uint64_t Reply = CUXPCDictionaryCreateReply(v4);
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v17)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);
          }

          else if (dword_1008D6630 <= 90 {
                 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
          }
          {
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDeleteDevice:]",  90LL,  "### DeleteDevice create reply failed");
          }
        }
      }
    }

    else
    {
      uint64_t v18 = CBErrorF(4294960591LL, "No device");
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      unsigned int v12 = (CBDevice *)v27[5];
      void v27[5] = v19;
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v26, 8);
}

- (void)_xpcModifyDevice:(id)a3
{
  uint64_t v73 = 0LL;
  v74 = (id *)&v73;
  uint64_t v75 = 0x3032000000LL;
  v76 = sub_1000526D0;
  id v77 = sub_1000526E0;
  id v78 = 0LL;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10005973C;
  v70[3] = &unk_10087F4C8;
  v72 = &v73;
  v70[4] = self;
  id v4 = a3;
  id v71 = v4;
  unsigned __int8 v5 = objc_retainBlock(v70);
  id v6 = v74;
  id obj = v74[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v4, "devi");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    if (!v9)
    {
      uint64_t v50 = CBErrorF(4294960591LL, "No device");
      uint64_t v51 = objc_claimAutoreleasedReturnValue(v50);
      unsigned int v12 = (CBDevice *)v74[5];
      void v74[5] = (id)v51;
      goto LABEL_51;
    }

    id v10 = objc_alloc(&OBJC_CLASS___CBDevice);
    int v11 = v74;
    id v68 = v74[5];
    unsigned int v12 = -[CBDevice initWithXPCObject:error:](v10, "initWithXPCObject:error:", v9, &v68);
    objc_storeStrong(v11 + 5, v68);
    if (!v12)
    {
LABEL_51:

      goto LABEL_52;
    }

    uint64_t v13 = v74;
    id v66 = v74[5];
    id v67 = 0LL;
    char v14 = CUXPCDecodeNSArrayOfNSString(v4, "dvIA", &v67, &v66);
    objc_storeStrong(v13 + 5, v66);
    if ((v14 & 1) == 0)
    {
LABEL_50:

      goto LABEL_51;
    }

    id v65 = 0LL;
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___CBDevice);
    uint64_t v16 = v74;
    id v64 = v74[5];
    char v17 = CUXPCDecodeObject(v4, "prSD", v15, &v65, &v64);
    objc_storeStrong(v16 + 5, v64);
    if ((v17 & 1) == 0) {
      goto LABEL_49;
    }
    uint64_t v18 = v74 + 5;
    id v63 = v74[5];
    v79[0] = 0LL;
    int v19 = CUXPCDecodeSInt64RangedEx(v4, "prSS", -128LL, 127LL, v79, &v63);
    unsigned __int8 v20 = v19 == 6 ? LOBYTE(v79[0]) : 0;
    objc_storeStrong(v18, v63);
    if (v19 == 5
      || ((id v21 = v74 + 5,
           id v62 = v74[5],
           v79[0] = 0LL,
           int v22 = CUXPCDecodeUInt64RangedEx(v4, "dvRF", 0LL, 0xFFFFFFFFLL, v79, &v62),
           v22 != 6)
        ? (uint64_t v23 = 0LL)
        : (uint64_t v23 = LODWORD(v79[0])),
          objc_storeStrong(v21, v62),
          v22 == 5))
    {
LABEL_49:

      goto LABEL_50;
    }

    v79[0] = 0LL;
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___CBDeviceSettings);
    unsigned int v25 = v74;
    id v61 = v74[5];
    char v26 = CUXPCDecodeObject(v4, "dvSt", v24, v79, &v61);
    objc_storeStrong(v25 + 5, v61);
    if ((v26 & 1) == 0
      || (uint64_t v27 = v74,
          id v59 = v74[5],
          double v60 = 0.0,
          char v28 = CUXPCDecodeDouble(v4, "timO", &v60, &v59),
          objc_storeStrong(v27 + 5, v59),
          (v28 & 1) == 0))
    {
LABEL_48:

      goto LABEL_49;
    }

    id v29 = v67;
    if (v67)
    {
      if (dword_1008D6630 <= 30)
      {
        if (dword_1008D6630 == -1)
        {
          id v29 = v67;
        }

        uint64_t v30 = CUPrintNSObjectOneLine(v29);
        id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcModifyDevice:]",  30LL,  "ModifyDevice CnxPri start: %@, %@",  v12,  v31);
      }

- (void)_xpcPerformDeviceRequest:(id)a3
{
  uint64_t v29 = 0LL;
  uint64_t v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = sub_1000526D0;
  unsigned int v33 = sub_1000526E0;
  id v34 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100059C30;
  v26[3] = &unk_10087F4C8;
  char v28 = &v29;
  v26[4] = self;
  id v4 = a3;
  id v27 = v4;
  unsigned __int8 v5 = objc_retainBlock(v26);
  id v6 = v30;
  id obj = v30[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    id v24 = 0LL;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CBDevice);
    uint64_t v9 = v30;
    id v23 = v30[5];
    char v10 = CUXPCDecodeObject(v4, "devi", v8, &v24, &v23);
    objc_storeStrong(v9 + 5, v23);
    if ((v10 & 1) != 0)
    {
      id v22 = 0LL;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___CBDeviceRequest);
      unsigned int v12 = v30;
      id v21 = v30[5];
      char v13 = CUXPCDecodeObject(v4, "dvRq", v11, &v22, &v21);
      objc_storeStrong(v12 + 5, v21);
      if ((v13 & 1) != 0)
      {
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcPerformDeviceRequest:]",  30LL,  "PerformDeviceRequest start: %@, %@",  v24,  v22);
        }

        char v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        id v15 = v22;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100059CF8;
        v16[3] = &unk_1008809F8;
        id v17 = v24;
        id v18 = v22;
        int v19 = self;
        id v20 = v4;
        [v14 performDeviceRequest:v15 device:v17 completionHandler:v16];
      }
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v29, 8);
}

- (void)_xpcDiagnosticControl:(id)a3
{
  uint64_t v174 = 0LL;
  v175 = (id *)&v174;
  uint64_t v176 = 0x3032000000LL;
  v177 = sub_1000526D0;
  v178 = sub_1000526E0;
  id v179 = 0LL;
  v171[0] = _NSConcreteStackBlock;
  v171[1] = 3221225472LL;
  v171[2] = sub_10005B450;
  v171[3] = &unk_10087F4C8;
  v173 = &v174;
  v171[4] = self;
  id v4 = a3;
  id v172 = v4;
  v118 = objc_retainBlock(v171);
  unsigned __int8 v5 = v175;
  id obj = v175[5];
  unsigned __int8 v6 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v5 + 5, obj);
  if ((v6 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v175[5], v4);
    goto LABEL_47;
  }

  xpc_object_t value = xpc_dictionary_get_value(v4, "parm");
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  if (xdict)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = xpc_dictionary_get_string(xdict, "iStr");
      uint64_t v9 = string;
      if (!string)
      {
        uint64_t v68 = CBErrorF(4294960591LL, "No input string");
        uint64_t v69 = objc_claimAutoreleasedReturnValue(v68);
        id v70 = v175[5];
        v175[5] = (id)v69;

        goto LABEL_131;
      }

      if (stricmp_prefix(string, "accessory-"))
      {
        if (stricmp_prefix(v9, "advertise"))
        {
          if (stricmp_prefix(v9, "assert"))
          {
            if (!stricmp_prefix(v9, "coredump"))
            {
              if (dword_1008D6630 <= 30
                && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
              {
                LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: %s",  v9);
              }

              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 diagnosticControl:xdict]);

              id v165 = 0LL;
              NSAppendPrintF_safe(&v165, "%@", v30);
              int v19 = (__CFString *)v165;

              goto LABEL_38;
            }

            if (!stricmp_prefix(v9, "crash"))
            {
              if (dword_1008D6630 <= 30
                && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
              {
                LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: %s",  v9);
              }

              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
              id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 diagnosticControl:xdict]);

              id v164 = 0LL;
              NSAppendPrintF_safe(&v164, "%@", v32);
              int v19 = (__CFString *)v164;

              goto LABEL_38;
            }

            if (stricmp_prefix(v9, "discover"))
            {
              if (stricmp_prefix(v9, "evaluate"))
              {
                if (!stricmp_prefix(v9, "fakeAccessoryCrash"))
                {
                  if (dword_1008D6630 <= 30
                    && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                  {
                    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: %s",  v9);
                  }

                  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
                  id v58 = (void *)objc_claimAutoreleasedReturnValue([v57 diagnosticControl:xdict]);

                  id v157 = 0LL;
                  NSAppendPrintF_safe(&v157, "%@", v58);
                  int v19 = (__CFString *)v157;

                  goto LABEL_38;
                }

                if (!stricmp_prefix(v9, "gapa"))
                {
                  if (dword_1008D6630 <= 30
                    && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                  {
                    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: %s",  v9);
                  }

                  id v59 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
                  double v60 = (void *)objc_claimAutoreleasedReturnValue([v59 diagnosticControl:xdict]);

                  id v156 = 0LL;
                  NSAppendPrintF_safe(&v156, "%@", v60);
                  int v19 = (__CFString *)v156;

                  goto LABEL_38;
                }

                if (!strcasecmp(v9, "LoD-connected"))
                {
                  unsigned int v33 = (void *)CUXPCCreateCFObjectFromXPCObject(xdict);
                  if (!v33)
                  {
                    uint64_t v104 = CBErrorF(4294960591LL, "Convert params failed");
                    uint64_t v105 = objc_claimAutoreleasedReturnValue(v104);
                    id v106 = v175[5];
                    v175[5] = (id)v105;

                    goto LABEL_131;
                  }

                  CFTypeID TypeID = CFStringGetTypeID();
                  uint64_t TypedValue = CFDictionaryGetTypedValue(v33, @"deviceID", TypeID, 0LL);
                  double v36 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
                  if (!v36)
                  {
                    uint64_t v107 = CBErrorF(4294960591LL, "No device UUID");
                    uint64_t v108 = objc_claimAutoreleasedReturnValue(v107);
                    id v109 = v175[5];
                    v175[5] = (id)v108;

                    goto LABEL_131;
                  }

                  v117 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v36);
                  if (!v117)
                  {
                    uint64_t v110 = CBErrorF(4294960591LL, "Bad device UUID");
                    uint64_t v111 = objc_claimAutoreleasedReturnValue(v110);
                    id v112 = v175[5];
                    v175[5] = (id)v111;

                    goto LABEL_131;
                  }

                  v113 = v36;
                  CFTypeID v37 = CFStringGetTypeID();
                  uint64_t v38 = CFDictionaryGetTypedValue(v33, @"name", v37, 0LL);
                  v115 = (void *)objc_claimAutoreleasedReturnValue(v38);
                  v116 = v33;
                  id v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  CFTypeID v40 = CFStringGetTypeID();
                  uint64_t v41 = CFDictionaryGetTypedValue(v33, @"serviceUUIDs", v40, 0LL);
                  id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
                  __int128 v154 = 0u;
                  __int128 v155 = 0u;
                  __int128 v152 = 0u;
                  __int128 v153 = 0u;
                  id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 componentsSeparatedByString:@","]);
                  id v44 = [v43 countByEnumeratingWithState:&v152 objects:v180 count:16];
                  v114 = v42;
                  if (v44)
                  {
                    uint64_t v45 = *(void *)v153;
                    do
                    {
                      for (unint64_t i = 0LL; i != v44; unint64_t i = (char *)i + 1)
                      {
                        if (*(void *)v153 != v45) {
                          objc_enumerationMutation(v43);
                        }
                        unsigned int v47 = -[CBUUID initWithString:safe:]( objc_alloc(&OBJC_CLASS___CBUUID),  "initWithString:safe:",  *(void *)(*((void *)&v152 + 1) + 8LL * (void)i),  1LL);
                        if (v47) {
                          -[NSMutableArray addObject:](v39, "addObject:", v47);
                        }
                      }

                      id v44 = [v43 countByEnumeratingWithState:&v152 objects:v180 count:16];
                    }

                    while (v44);
                  }

                  uint64_t v48 = v117;
                  uint64_t v49 = v114;
                  if (dword_1008D6630 <= 30
                    && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                  {
                    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v117, "UUIDString"));
                    uint64_t v51 = CUPrintNSObjectOneLine(v39);
                    id v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
                    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: %s: device %@, serviceUUIDs %@",  v9,  v50,  v52,  v113);

                    uint64_t v48 = v117;
                    uint64_t v49 = v114;
                  }

                  -[CBDaemonServer notifyConnectedDeviceUUID:name:servicesUUIDs:]( self->_daemon,  "notifyConnectedDeviceUUID:name:servicesUUIDs:",  v48,  v115,  v39);
                  id v151 = 0LL;
                  NSAppendPrintF_safe(&v151, "");
                  int v19 = (__CFString *)v151;

                  goto LABEL_38;
                }

                if (!strcasecmp(v9, "mp-error"))
                {
                  if (dword_1008D6630 <= 30
                    && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                  {
                    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: %s",  v9);
                  }

                  id v61 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
                  id v62 = (void *)objc_claimAutoreleasedReturnValue([v61 diagnosticControl:xdict]);

                  id v150 = 0LL;
                  NSAppendPrintF_safe(&v150, "%@\n", v62);
                  int v19 = (__CFString *)v150;

                  goto LABEL_38;
                }

                if (!strcasecmp(v9, "mp-keys-reset"))
                {
                  if (dword_1008D6630 <= 30
                    && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                  {
                    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: %s",  v9);
                  }

                  id v71 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
                  v72 = (void *)objc_claimAutoreleasedReturnValue([v71 diagnosticControl:xdict]);

                  id v149 = 0LL;
                  NSAppendPrintF_safe(&v149, "%@\n", v72);
                  int v19 = (__CFString *)v149;

                  goto LABEL_38;
                }

                if (stricmp_prefix(v9, "tipiChanged"))
                {
                  if (stricmp_prefix(v9, "whbEvent"))
                  {
                    if (stricmp_prefix(v9, "wifiCritical"))
                    {
                      if (stricmp_prefix(v9, "writeStackshot"))
                      {
                        if (*v9 && strcasecmp(v9, "help"))
                        {
                          uint64_t v10 = CBErrorF(4294960591LL, "Unsupported diag command: '%s'", v9);
                          uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
                          id v12 = v175[5];
                          v175[5] = (id)v11;

LABEL_131:
                          int v19 = 0LL;
                          goto LABEL_46;
                        }

                        if (dword_1008D6630 <= 30
                          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                        {
                          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: help");
                        }

                        id v143 = 0LL;
                        NSAppendPrintF_safe(&v143, "%s", "Commands:\n");
                        id v78 = v143;
                        id v142 = v78;
                        NSAppendPrintF_safe( &v142,  "%s",  "    accessory-fake        Publish/unpublish fake accessory.\n");
                        id v79 = v142;

                        id v141 = v79;
                        NSAppendPrintF_safe(&v141, "%s", "    advertise             Start/stop test advertister.\n");
                        id v80 = v141;

                        id v140 = v80;
                        NSAppendPrintF_safe(&v140, "%s", "    assert                Start/stop test assertion.\n");
                        id v81 = v140;

                        id v139 = v81;
                        NSAppendPrintF_safe( &v139,  "%s",  "    coredump              Trigger a Bluetooth stack core dump.\n");
                        id v82 = v139;

                        id v138 = v82;
                        NSAppendPrintF_safe(&v138, "%s", "    crash                 Force a crash.\n");
                        id v83 = v138;

                        id v137 = v83;
                        NSAppendPrintF_safe(&v137, "%s", "    crash-FE              Call FatalError.\n");
                        id v84 = v137;

                        id v136 = v84;
                        NSAppendPrintF_safe(&v136, "%s", "    crash-RC              Call RestartWithContext.\n");
                        id v85 = v136;

                        id v135 = v85;
                        NSAppendPrintF_safe(&v135, "%s", "    crash-sim             Simulate a crash.\n");
                        id v86 = v135;

                        id v134 = v86;
                        NSAppendPrintF_safe(&v134, "%s", "    discover              Start/stop test discovery.\n");
                        id v87 = v134;

                        id v133 = v87;
                        NSAppendPrintF_safe(&v133, "%s", "    evaluate              Re-evaluate spatial devices.\n");
                        id v88 = v133;

                        id v132 = v88;
                        NSAppendPrintF_safe(&v132, "%s", "    fakeAccessoryCrash    Fake an accessory crashing.\n");
                        id v89 = v132;

                        id v131 = v89;
                        NSAppendPrintF_safe(&v131, "%s", "    forcejustwork         Enables/disables forcejustwork.\n");
                        id v90 = v131;

                        id v130 = v90;
                        NSAppendPrintF_safe( &v130,  "%s",  "    gapa                  Set GAPA flags: deviceID <UUID/MAC> flags <flags> mask <mask>\n");
                        id v91 = v130;

                        id v129 = v91;
                        NSAppendPrintF_safe( &v129,  "%s",  "    hciUnlimited          Enables/disables unlimited file size HCI tracing.\n");
                        id v92 = v129;

                        id v128 = v92;
                        NSAppendPrintF_safe(&v128, "%s", "    help                  Show this help menu.\n");
                        id v93 = v128;

                        id v127 = v93;
                        NSAppendPrintF_safe( &v127,  "%s",  "    LoD-connected         Launch-on-demand connection: deviceID <UUID> serviceUUIDs UUID1,UUID2,etc.\n");
                        id v94 = v127;

                        id v126 = v94;
                        NSAppendPrintF_safe( &v126,  "%s",  "    logRawAudio           Enables/disables HCI audio tracing.\n");
                        id v95 = v126;

                        id v125 = v95;
                        NSAppendPrintF_safe( &v125,  "%s",  "    mp-error <ID> <error> Simulate Magic Pairing error 1 or 7. deviceID <UUID> status <Int>\n");
                        id v96 = v125;

                        id v124 = v96;
                        NSAppendPrintF_safe( &v124,  "%s",  "    mp-keys-reset <ID>    Magic Pairing keys reset to initial keys from current account keys. deviceID <UUID> \n");
                        id v97 = v124;

                        id v123 = v97;
                        NSAppendPrintF_safe( &v123,  "%s",  "    timeline              Enables/disables timeline logging.\n");
                        id v98 = v123;

                        id v122 = v98;
                        NSAppendPrintF_safe(&v122, "%s", "    tipiChanged           Simulate Tipi change.\n");
                        id v99 = v122;

                        id v121 = v99;
                        NSAppendPrintF_safe(&v121, "%s", "    wifiCritical          Override WiFi critical on/off.\n");
                        id v100 = v121;

                        id v120 = v100;
                        NSAppendPrintF_safe( &v120,  "%s",  "    writeStackshot        Trigger bluetoothd stackshot manually.\n");
                        int v19 = (__CFString *)v120;
                      }

                      else
                      {
                        if (dword_1008D6630 <= 30
                          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                        {
                          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: writeStackshot");
                        }

                        id v145 = 0LL;
                        NSAppendPrintF_safe(&v145, "");
                        id v101 = v145;
                        uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
                        v103 = (void *)objc_claimAutoreleasedReturnValue([v102 diagnosticControl:xdict]);

                        id v144 = v101;
                        NSAppendPrintF_safe(&v144, "%@", v103);
                        int v19 = (__CFString *)v144;
                      }
                    }

                    else
                    {
                      -[CBDaemonServer setWifiCriticalOverride:]( self->_daemon,  "setWifiCriticalOverride:",  -[CBDaemonServer wifiCriticalOverride](self->_daemon, "wifiCriticalOverride") == 0);
                      if (dword_1008D6630 <= 30
                        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
                      {
                        unsigned int v63 = -[CBDaemonServer wifiCriticalOverride](self->_daemon, "wifiCriticalOverride");
                        if (v63 > 2) {
                          id v64 = "?";
                        }
                        else {
                          id v64 = off_100880B68[v63];
                        }
                        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticControl:]",  30LL,  "Diags: wifiCritical: %s",  v64);
                      }

                      id v146 = 0LL;
                      NSAppendPrintF_safe(&v146, "");
                      int v19 = (__CFString *)v146;
                      -[CBDaemonServer scheduleUpdateImmediate:](self->_daemon, "scheduleUpdateImmediate:", 0LL);
                    }

- (void)_xpcDiagnosticAdvertiser
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CBDaemonServer testAdvertiser](self->_daemon, "testAdvertiser"));
  if (v3)
  {
    id v4 = (void *)v3;
    id v14 = (id)v3;
    if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 != -1 || (int v5 = _LogCategory_Initialize(&dword_1008D6630, 30LL), v4 = v14, v5))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticAdvertiser]",  30LL,  "Diags: advertiser stop",  v14);
        id v4 = v14;
      }
    }

    objc_msgSend(v4, "invalidate", v14);
    -[CBDaemonServer setTestAdvertiser:](self->_daemon, "setTestAdvertiser:", 0LL);
  }

  else
  {
    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticAdvertiser]",  30LL,  "Diags: advertiser start");
    }

    unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___CBAdvertiserDaemon);
    -[CBDaemonServer setTestAdvertiser:](self->_daemon, "setTestAdvertiser:", v6);
    -[CBAdvertiserDaemon setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAdvertiserDaemon setSpatialInteractionFlags:](v6, "setSpatialInteractionFlags:", 105LL);
    -[CBAdvertiserDaemon setSpatialInteractionConfigFlags:](v6, "setSpatialInteractionConfigFlags:", 1LL);
    uint64_t v7 = NSRandomData(4LL, 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v18 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    -[CBAdvertiserDaemon setSpatialInteractionIdentifiers:](v6, "setSpatialInteractionIdentifiers:", v9);

    uint64_t v10 = NSRandomData(5LL, 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[CBAdvertiserDaemon setSpatialInteractionUWBConfigData:](v6, "setSpatialInteractionUWBConfigData:", v11);

    uint64_t v12 = NSRandomData(1LL, 0LL);
    char v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[CBAdvertiserDaemon setSpatialInteractionPresenceConfigData:](v6, "setSpatialInteractionPresenceConfigData:", v13);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10005B7B4;
    v17[3] = &unk_10087EEC8;
    v17[4] = v6;
    -[CBAdvertiserDaemon setInvalidationHandler:](v6, "setInvalidationHandler:", v17);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10005B830;
    v16[3] = &unk_10087EF38;
    void v16[4] = v6;
    v16[5] = self;
    -[CBAdvertiserDaemon activateWithCompletion:](v6, "activateWithCompletion:", v16);
  }

- (void)_xpcDiagnosticAssertion
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CBDaemonServer testAssertion](self->_daemon, "testAssertion"));
  if (v3)
  {
    id v4 = (void *)v3;
    id v7 = (id)v3;
    if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 != -1 || (int v5 = _LogCategory_Initialize(&dword_1008D6630, 30LL), v4 = v7, v5))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticAssertion]",  30LL,  "Diags: assertion stop");
        id v4 = v7;
      }
    }

    [v4 invalidate];
    -[CBDaemonServer setTestAssertion:](self->_daemon, "setTestAssertion:", 0LL);
  }

  else
  {
    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticAssertion]",  30LL,  "Diags: assertion start");
    }

    unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___CBController);
    -[CBDaemonServer setTestAssertion:](self->_daemon, "setTestAssertion:", v6);
    -[CBController setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    -[CBController setLabel:](v6, "setLabel:", @"CBDiags");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005BAE4;
    v8[3] = &unk_10087EF38;
    v8[4] = v6;
    v8[5] = self;
    -[CBController activateAssertionWithFlags:completion:](v6, "activateAssertionWithFlags:completion:", 1LL, v8);
  }

- (void)_xpcDiagnosticDiscovery
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CBDaemonServer testDiscovery](self->_daemon, "testDiscovery"));
  if (v3)
  {
    id v4 = (void *)v3;
    id v7 = (id)v3;
    if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 != -1 || (int v5 = _LogCategory_Initialize(&dword_1008D6630, 30LL), v4 = v7, v5))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticDiscovery]",  30LL,  "Diags: discovery stop",  v7);
        id v4 = v7;
      }
    }

    objc_msgSend(v4, "invalidate", v7);
    -[CBDaemonServer setTestDiscovery:](self->_daemon, "setTestDiscovery:", 0LL);
  }

  else
  {
    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticDiscovery]",  30LL,  "Diags: discovery start");
    }

    unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    -[CBDaemonServer setTestDiscovery:](self->_daemon, "setTestDiscovery:", v6);
    -[CBDiscovery setDiscoveryFlags:](v6, "setDiscoveryFlags:", 16LL);
    -[CBDiscovery setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10005BE30;
    v12[3] = &unk_10087EF10;
    v12[4] = v6;
    v12[5] = self;
    -[CBDiscovery setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005BED8;
    v11[3] = &unk_10087EF10;
    v11[4] = v6;
    v11[5] = self;
    -[CBDiscovery setDeviceLostHandler:](v6, "setDeviceLostHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005BF80;
    v10[3] = &unk_10087EEC8;
    v10[4] = v6;
    -[CBDiscovery setInvalidationHandler:](v6, "setInvalidationHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005BFFC;
    v9[3] = &unk_10087EF38;
    v9[4] = v6;
    v9[5] = self;
    -[CBDiscovery activateWithCompletion:](v6, "activateWithCompletion:", v9);
  }

- (void)_xpcDiagnosticLog:(id)a3
{
  uint64_t v27 = 0LL;
  char v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1000526D0;
  uint64_t v31 = sub_1000526E0;
  id v32 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005C3EC;
  v24[3] = &unk_10087F4C8;
  char v26 = &v27;
  v24[4] = self;
  id v4 = a3;
  id v25 = v4;
  int v5 = objc_retainBlock(v24);
  unsigned __int8 v6 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v28[5], v4);
    goto LABEL_11;
  }

  xpc_object_t value = xpc_dictionary_get_value(v4, "parm");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (!v9) {
    goto LABEL_6;
  }
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v10 = xpc_dictionary_get_string(v9, "iStr");
    if (!v10 || (uint64_t v11 = LogControl(v10), !(_DWORD)v11))
    {
LABEL_6:
      string = 0LL;
      uint64_t v12 = LogShow(&string);
      if (string)
      {
        uint64_t Reply = CUXPCDictionaryCreateReply(v4);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
        id v15 = v14;
        if (v14)
        {
          xpc_dictionary_set_string(v14, "oStr", string);
          free(string);
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);
        }

        else if (dword_1008D6630 <= 90 {
               && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        }
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticLog:]",  90LL,  "### DiagnosticLog create reply failed");
        }
      }

      else
      {
        uint64_t v16 = CBErrorF(v12, "LogShow failed");
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
        id v15 = (void *)v28[5];
        v28[5] = v17;
      }

      goto LABEL_10;
    }

    uint64_t v20 = CBErrorF(v11, "LogControl failed");
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v20);
  }

  else
  {
    uint64_t v18 = CBErrorF(4294960591LL, "Non-dict input");
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
  }

  id v21 = (void *)v28[5];
  v28[5] = v19;

LABEL_10:
LABEL_11:
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v27, 8);
}

- (void)_xpcDiagnosticShow:(id)a3
{
  id v4 = a3;
  id v39 = 0LL;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v39);
  id v6 = v39;
  if ((v5 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    goto LABEL_33;
  }

  xpc_object_t value = xpc_dictionary_get_value(v4, "parm");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (!v8)
  {
    uint64_t v15 = 20LL;
    goto LABEL_13;
  }

  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v8, "iStr");
    int64_t int64 = xpc_dictionary_get_int64(v8, "vrbL");
    if (string)
    {
      if (stricmp_prefix(string, "ident"))
      {
        uint64_t v11 = CBErrorF(4294960591LL, "Unknown show type: '%s'", string);
        uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);

        if (dword_1008D6630 <= 90
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
        {
          uint64_t v13 = CUPrintNSError(v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticShow:]",  90LL,  "### DiagnosticShow failed: %@",  v14);
        }

        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v12, v4);
        id v6 = (id)v12;
        goto LABEL_32;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer identityArray](self->_daemon, "identityArray"));
      id v37 = 0LL;
      NSAppendPrintF_safe(&v37, "-- Identities: %d total --\n", [v23 count]);
      uint64_t v18 = (__CFString *)v37;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v17 = v23;
      id v24 = [v17 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v34;
        do
        {
          uint64_t v27 = 0LL;
          char v28 = v18;
          do
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v17);
            }
            uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v27);
            id v32 = v28;
            NSAppendPrintF_safe(&v32, "%@\n", v29);
            uint64_t v18 = v32;

            uint64_t v27 = (char *)v27 + 1;
            char v28 = v18;
          }

          while (v25 != v27);
          id v25 = [v17 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }

        while (v25);
      }

LABEL_14:
      uint64_t Reply = CUXPCDictionaryCreateReply(v4);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v20)
      {
        if (v18) {
          id v21 = v18;
        }
        else {
          id v21 = @"None\n";
        }
        id v22 = (const char *)-[__CFString UTF8String](v21, "UTF8String");
        if (v22) {
          xpc_dictionary_set_string(v20, "oStr", v22);
        }
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v20);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticShow:]",  90LL,  "### DiagnosticShow create reply failed");
      }

      goto LABEL_32;
    }

    else {
      uint64_t v15 = 10LL;
    }
LABEL_13:
    id v38 = 0LL;
    uint64_t v16 = CUDescriptionWithLevel(self->_daemon, v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    NSAppendPrintF_safe(&v38, "%@", v17);
    uint64_t v18 = (__CFString *)v38;
    goto LABEL_14;
  }

  uint64_t v30 = CBErrorF(4294960591LL, "Non-dict input params");
  uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);

  id v6 = (id)v31;
LABEL_32:

LABEL_33:
}

- (void)_xpcDiagnosticTipiChanged
{
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___CBDevice);
  uint64_t v2 = NSRandomData(6LL, 0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  -[CBDevice setBtAddressData:](v13, "setBtAddressData:", v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  for (uint64_t i = 0LL; i != 3; ++i)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    uint64_t v7 = NSRandomData(6LL, 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[CBDevice setBtAddressData:](v6, "setBtAddressData:", v8);

    if (i == 1) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = 3;
    }
    if (i == 1) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 1LL;
    }
    if (i) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 1LL;
    }
    -[CBDevice setTipiConnectionStatus:](v6, "setTipiConnectionStatus:", v11);
    -[CBDevice setTipiState:](v6, "setTipiState:", v10);
    -[NSMutableArray addObject:](v4, "addObject:", v6);
  }

  -[CBDevice setTipiDevices:](v13, "setTipiDevices:", v4);
  if (dword_1008D6630 < 31 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL))) {
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcDiagnosticTipiChanged]",  30LL,  "Diags: Tipi changed: %@",  v13);
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 postNotificationName:@"com.apple.bluetooth.TipiChanged" object:v13 userInfo:0];
}

- (void)_xpcSetLowPowerMode:(id)a3
{
  id v4 = a3;
  id v13 = 0LL;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v13);
  id v6 = v13;
  if ((v5 & 1) != 0)
  {
    int64_t int64 = xpc_dictionary_get_int64(v4, "ctrP");
    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      else {
        id v8 = off_100880B80[(int)int64];
      }
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection _xpcSetLowPowerMode:]", 30LL, "SetLowPowerMode: %s", v8);
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005CBA0;
    v10[3] = &unk_100880A20;
    int v12 = int64;
    v10[4] = self;
    id v11 = v4;
    [v9 setLowPowerModeWithReason:int64 completionHandler:v10];
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
  }
}

- (void)_xpcGetPowerState:(id)a3
{
  id v11 = 0LL;
  id v4 = a3;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  id v6 = v11;
  if ((v5 & 1) != 0)
  {
    uint64_t Reply = CUXPCDictionaryCreateReply(v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);

    if (v8)
    {
      unint64_t v9 = -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient");
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        if (v9 > 0xA) {
          uint64_t v10 = "?";
        }
        else {
          uint64_t v10 = off_100880B98[v9];
        }
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetPowerState:]",  30LL,  "Get power state: %s",  v10);
      }

      xpc_dictionary_set_int64(v8, "pwrS", v9);
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v8);
    }

    else if (dword_1008D6630 <= 90 {
           && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcGetPowerState:]",  90LL,  "### GetPowerState create reply failed");
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    id v8 = v4;
  }
}

- (void)_xpcSetPowerState:(id)a3
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1000526D0;
  id v23 = sub_1000526E0;
  id v24 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10005D1A4;
  v16[3] = &unk_10087F4C8;
  uint64_t v18 = &v19;
  void v16[4] = self;
  id v4 = a3;
  id v17 = v4;
  unsigned __int8 v5 = objc_retainBlock(v16);
  id v6 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    unint64_t int64 = xpc_dictionary_get_int64(v4, "pwrS");
    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      else {
        unint64_t v9 = off_100880B98[int64];
      }
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection _xpcSetPowerState:]", 30LL, "SetPowerState: %s", v9);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
    id v11 = (id *)(v20 + 5);
    id v14 = (id)v20[5];
    [v10 setPowerState:int64 error:&v14];
    objc_storeStrong(v11, v14);

    if (!v20[5])
    {
      uint64_t Reply = CUXPCDictionaryCreateReply(v4);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v13)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v13);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSetPowerState:]",  90LL,  "### SetPowerState create reply failed");
      }
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v19, 8);
}

- (void)_xpcReadPrefs:(id)a3
{
  uint64_t v59 = 0LL;
  double v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000LL;
  id v62 = sub_1000526D0;
  unsigned int v63 = sub_1000526E0;
  id v64 = 0LL;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_10005D8BC;
  v56[3] = &unk_10087F4C8;
  id v58 = &v59;
  v56[4] = self;
  id v40 = a3;
  id v57 = v40;
  id v38 = objc_retainBlock(v56);
  uint64_t v3 = v60;
  id obj = v60[5];
  unsigned __int8 v4 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v3 + 5, obj);
  if ((v4 & 1) != 0)
  {
    unsigned __int8 v5 = v60 + 5;
    id v53 = v60[5];
    id v54 = 0LL;
    CUXPCDecodeNSArrayOfNSString(v40, "pfKs", &v54, &v53);
    objc_storeStrong(v5, v53);
    if (v60[5])
    {
LABEL_40:

      goto LABEL_41;
    }

    id v6 = v54;
    if (!v54)
    {
      uint64_t v33 = CBErrorF(4294960591LL, "No pref keys");
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
      unint64_t v9 = (NSMutableDictionary *)v60[5];
      v60[5] = (id)v34;
LABEL_39:

      goto LABEL_40;
    }

    if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 == -1)
      {
        id v6 = v54;
      }

      uint64_t v7 = CUPrintNSObjectOneLine(v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF_safe(&dword_1008D6630, "-[CBDaemonXPCConnection _xpcReadPrefs:]", 30LL, "ReadPrefs: %@", v8);
    }

- (void)_xpcWritePref:(id)a3
{
  uint64_t v33 = 0LL;
  uint64_t v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = sub_1000526D0;
  id v37 = sub_1000526E0;
  id v38 = 0LL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  _OWORD v30[2] = sub_10005DDC0;
  v30[3] = &unk_10087F4C8;
  id v32 = &v33;
  void v30[4] = self;
  id v4 = a3;
  id v31 = v4;
  unsigned __int8 v5 = objc_retainBlock(v30);
  id v6 = v34;
  id obj = v34[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    id v8 = v34 + 5;
    id v27 = v34[5];
    id v28 = 0LL;
    CUXPCDecodeNSString(v4, "pfKy", &v28, &v27);
    objc_storeStrong(v8, v27);
    if (!v34[5])
    {
      if (v28)
      {
        xpc_object_t value = xpc_dictionary_get_value(v4, "pfVl");
        uint64_t v10 = objc_claimAutoreleasedReturnValue(value);
        id v11 = (id)v10;
        if (v10)
        {
          id v12 = (id)_CFXPCCreateCFObjectFromXPCObject(v10);
          if (v12)
          {
            if (dword_1008D6630 <= 30
              && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
            {
              LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcWritePref:]",  30LL,  "WritePref: '%@' = '%@'",  v28,  v12);
            }

            id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            unsigned int v14 = [v12 isEqual:v13];

            if (v14)
            {
              CFPrefs_RemoveValue(@"com.apple.bluetooth", v28);
              CFPrefs_RemoveValue(@"com.apple.Bluetooth", v28);
            }

            else
            {
              v39[0] = @"disableCentralSkipSniff";
              v39[1] = @"enableSpecialSniffTransitions";
              v39[2] = @"move3PPLEMSToLegacyMode";
              v39[3] = @"move3PPLEMSToLegacyModeSerial";
              v39[4] = @"BluetoothAutoSeekKeyboard";
              v39[5] = @"BluetoothAutoSeekPointingDevice";
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v39,  6LL));
              unsigned int v16 = [v15 containsObject:v28];
              id v17 = @"com.apple.bluetooth";
              if (v16) {
                id v17 = @"com.apple.Bluetooth";
              }
              uint64_t v18 = v17;

              CFPrefs_SetValue(v18, v28, v12);
            }

            uint64_t Reply = CUXPCDictionaryCreateReply(v4);
            id v20 = (id)objc_claimAutoreleasedReturnValue(Reply);
            if (v20)
            {
              -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v20);
            }

            else if (dword_1008D6630 <= 90 {
                   && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
            }
            {
              LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcWritePref:]",  90LL,  "### WritePrefs create reply failed");
            }
          }

          else
          {
            uint64_t v25 = CBErrorF(4294960591LL, "Bad pref value");
            uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
            id v20 = v34[5];
            v34[5] = (id)v26;
          }
        }

        else
        {
          uint64_t v23 = CBErrorF(4294960591LL, "No pref value");
          uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
          id v12 = v34[5];
          v34[5] = (id)v24;
        }
      }

      else
      {
        uint64_t v21 = CBErrorF(4294960591LL, "No pref key");
        uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
        id v11 = v34[5];
        v34[5] = (id)v22;
      }
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v33, 8);
}

- (void)_xpcSendRelayMessage:(id)a3
{
  uint64_t v48 = 0LL;
  __int128 v49 = (id *)&v48;
  uint64_t v50 = 0x3032000000LL;
  __int128 v51 = sub_1000526D0;
  __int128 v52 = sub_1000526E0;
  id v53 = 0LL;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10005E36C;
  v45[3] = &unk_10087F4C8;
  __int128 v47 = &v48;
  v45[4] = self;
  id v4 = a3;
  id v46 = v4;
  unsigned __int8 v5 = objc_retainBlock(v45);
  id v6 = v49;
  id obj = v49[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    id v43 = 0LL;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CBDevice);
    unint64_t v9 = v49;
    id v42 = v49[5];
    CUXPCDecodeObject(v4, "cduD", v8, &v43, &v42);
    objc_storeStrong(v9 + 5, v42);
    if (!v43)
    {
      uint64_t v28 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v49[5], "bad conduit device");
      uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
      id v30 = v49[5];
      v49[5] = (id)v29;

      goto LABEL_23;
    }

    id v41 = 0LL;
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___CBDevice);
    id v11 = v49;
    id v40 = v49[5];
    CUXPCDecodeObject(v4, "dstD", v10, &v41, &v40);
    objc_storeStrong(v11 + 5, v40);
    if (v41)
    {
      id v12 = v49 + 5;
      id v39 = v49[5];
      id v54 = 0LL;
      int v13 = CUXPCDecodeUInt64RangedEx(v4, "rlMT", 0LL, 255LL, &v54, &v39);
      if (v13 == 6) {
        unsigned __int8 v14 = v54;
      }
      else {
        unsigned __int8 v14 = 0;
      }
      objc_storeStrong(v12, v39);
      if (v13 != 5)
      {
        id v54 = 0LL;
        uint64_t v15 = v49;
        id v38 = v49[5];
        CUXPCDecodeNSData(v4, "rlMD", &v54, &v38);
        objc_storeStrong(v15 + 5, v38);
        id v16 = v54;
        if (!v54)
        {
          uint64_t v35 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v49[5], "bad message data");
          uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
          id v27 = v49[5];
          v49[5] = (id)v36;
          goto LABEL_20;
        }

        if (dword_1008D6630 <= 30)
        {
          if (dword_1008D6630 != -1)
          {
LABEL_11:
            id v17 = v43;
            id v18 = v41;
            uint64_t v19 = CUPrintNSDataHex(v16, 300LL, 0LL);
            uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
            uint64_t v21 = (void *)v20;
            uint64_t v22 = "?";
            if (v14 == 1) {
              uint64_t v22 = "AudioArbitration";
            }
            if (!v14) {
              uint64_t v22 = "Invalid";
            }
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendRelayMessage:]",  30LL,  "SendRelayMessage: conduit %@, destination %@, type %s, data <%@>",  v17,  v18,  v22,  v20);

            goto LABEL_17;
          }

          if (_LogCategory_Initialize(&dword_1008D6630, 30LL))
          {
            id v16 = v54;
            goto LABEL_11;
          }
        }

- (void)_xpcSendSmartRoutingInformation:(id)a3
{
  uint64_t v34 = 0LL;
  uint64_t v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000LL;
  id v37 = sub_1000526D0;
  id v38 = sub_1000526E0;
  id v39 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10005E7C0;
  v31[3] = &unk_10087F4C8;
  uint64_t v33 = &v34;
  v31[4] = self;
  id v4 = a3;
  id v32 = v4;
  unsigned __int8 v5 = objc_retainBlock(v31);
  id v6 = v35;
  id obj = v35[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    id v29 = 0LL;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CBDevice);
    unint64_t v9 = v35;
    id v28 = v35[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v29, &v28);
    objc_storeStrong(v9 + 5, v28);
    if (!v29)
    {
      uint64_t v20 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v35[5], "bad destination device");
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      id v22 = v35[5];
      v35[5] = (id)v21;

      goto LABEL_13;
    }

    uint64_t v10 = v35;
    id v26 = v35[5];
    id v27 = 0LL;
    CUXPCDecodeNSData(v4, "rlMD", &v27, &v26);
    objc_storeStrong(v10 + 5, v26);
    id v11 = v27;
    if (!v27)
    {
      uint64_t v23 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v35[5], "bad message data");
      uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
      id v19 = v35[5];
      v35[5] = (id)v24;
      goto LABEL_11;
    }

    if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 == -1)
      {
        id v11 = v27;
      }

      id v12 = v29;
      uint64_t v13 = CUPrintNSDataHex(v11, 300LL, 0LL);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendSmartRoutingInformation:]",  30LL,  "SendSmartRoutingInformation: destination %@, data <%@>",  v12,  v14);
    }

- (void)_xpcSendAudioAccessoryEventMessage:(id)a3
{
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  id v41 = sub_1000526D0;
  id v42 = sub_1000526E0;
  id v43 = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10005ECD0;
  v35[3] = &unk_10087F4C8;
  id v37 = &v38;
  v35[4] = self;
  id v4 = a3;
  id v36 = v4;
  unsigned __int8 v5 = objc_retainBlock(v35);
  id v6 = (id *)(v39 + 5);
  id obj = (id)v39[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    id v33 = 0LL;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CBDevice);
    unint64_t v9 = (id *)(v39 + 5);
    id v32 = (id)v39[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v33, &v32);
    objc_storeStrong(v9, v32);
    if (v33)
    {
      uint64_t v10 = (id *)(v39 + 5);
      id v31 = (id)v39[5];
      id v44 = 0LL;
      int v11 = CUXPCDecodeUInt64RangedEx(v4, "acET", 0LL, 255LL, &v44, &v31);
      if (v11 == 6) {
        unsigned __int8 v12 = v44;
      }
      else {
        unsigned __int8 v12 = 0;
      }
      objc_storeStrong(v10, v31);
      if (v11 != 5)
      {
        id v44 = 0LL;
        uint64_t v13 = (id *)(v39 + 5);
        id v30 = (id)v39[5];
        CUXPCDecodeNSData(v4, "acMd", &v44, &v30);
        objc_storeStrong(v13, v30);
        if (v44)
        {
          if (dword_1008D6630 <= 30
            && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
          {
            if (v12 > 6u) {
              unsigned __int8 v14 = "?";
            }
            else {
              unsigned __int8 v14 = off_100880BF0[(char)v12];
            }
            id v15 = v33;
            uint64_t v16 = CUPrintNSDataHex(v44, 300LL, 0LL);
            unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendAudioAccessoryEventMessage:]",  30LL,  "SendAudioAccessoryEventMessage: type: %s, destination %@, data <%@>",  v14,  v15,  v17);
          }

          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          id v19 = (id *)(v39 + 5);
          id v29 = (id)v39[5];
          unsigned __int8 v20 = [v18 sendAudioAccessoryEventMessage:v44 eventType:v12 device:v33 error:&v29];
          objc_storeStrong(v19, v29);

          if ((v20 & 1) == 0) {
            goto LABEL_20;
          }
          uint64_t Reply = CUXPCDictionaryCreateReply(v4);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v22)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v22);
          }

          else if (dword_1008D6630 <= 90 {
                 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
          }
          {
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendAudioAccessoryEventMessage:]",  90LL,  "### SendAudioAccessoryEventMessage create reply failed");
          }
        }

        else
        {
          uint64_t v27 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v39[5], "bad message data");
          uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
          id v22 = (void *)v39[5];
          v39[5] = v28;
        }

LABEL_20:
LABEL_21:

        goto LABEL_22;
      }

      uint64_t v25 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v39[5], "bad accessory event type");
      uint64_t v24 = objc_claimAutoreleasedReturnValue(v25);
    }

    else
    {
      uint64_t v23 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v39[5], "bad destination device");
      uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    }

    id v26 = (void *)v39[5];
    v39[5] = v24;

    goto LABEL_21;
  }

- (void)_xpcSendAudioAccessoryConfigMessage:(id)a3
{
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1000526D0;
  id v32 = sub_1000526E0;
  id v33 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10005F09C;
  v25[3] = &unk_10087F4C8;
  uint64_t v27 = &v28;
  v25[4] = self;
  id v4 = a3;
  id v26 = v4;
  unsigned __int8 v5 = objc_retainBlock(v25);
  id v6 = (id *)(v29 + 5);
  id obj = (id)v29[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    id v23 = 0LL;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CBDevice);
    unint64_t v9 = (id *)(v29 + 5);
    id v22 = (id)v29[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v23, &v22);
    objc_storeStrong(v9, v22);
    if (!v23)
    {
      uint64_t v17 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v29[5], "bad destination device");
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
      int v11 = (void *)v29[5];
      void v29[5] = v18;
      goto LABEL_8;
    }

    xpc_object_t value = xpc_dictionary_get_value(v4, "acMd");
    int v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      uint64_t v13 = (id *)(v29 + 5);
      id v21 = (id)v29[5];
      unsigned __int8 v14 = [v12 sendAudioAccessoryConfig:v11 device:v23 error:&v21];
      objc_storeStrong(v13, v21);

      if ((v14 & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }

      uint64_t Reply = CUXPCDictionaryCreateReply(v4);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v16)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v16);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendAudioAccessoryConfigMessage:]",  90LL,  "### SendAudioAccessoryConfigMessage create reply failed");
      }
    }

    else
    {
      uint64_t v19 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v29[5], "non-dict message");
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      uint64_t v16 = (void *)v29[5];
      void v29[5] = v20;
    }

    goto LABEL_8;
  }

- (void)_xpcSendConversationDetectMessage:(id)a3
{
  uint64_t v34 = 0LL;
  uint64_t v35 = (id *)&v34;
  uint64_t v36 = 0x3032000000LL;
  id v37 = sub_1000526D0;
  uint64_t v38 = sub_1000526E0;
  id v39 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10005F4F0;
  v31[3] = &unk_10087F4C8;
  id v33 = &v34;
  v31[4] = self;
  id v4 = a3;
  id v32 = v4;
  unsigned __int8 v5 = objc_retainBlock(v31);
  id v6 = v35;
  id obj = v35[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    id v29 = 0LL;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CBDevice);
    unint64_t v9 = v35;
    id v28 = v35[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v29, &v28);
    objc_storeStrong(v9 + 5, v28);
    if (!v29)
    {
      uint64_t v20 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v35[5], "bad destination device");
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      id v22 = v35[5];
      void v35[5] = (id)v21;

      goto LABEL_13;
    }

    uint64_t v10 = v35;
    id v26 = v35[5];
    id v27 = 0LL;
    CUXPCDecodeNSData(v4, "cdMd", &v27, &v26);
    objc_storeStrong(v10 + 5, v26);
    id v11 = v27;
    if (!v27)
    {
      uint64_t v23 = NSErrorNestedF(CBErrorDomain, 4294960591LL, v35[5], "bad message data");
      uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
      id v19 = v35[5];
      void v35[5] = (id)v24;
      goto LABEL_11;
    }

    if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 == -1)
      {
        id v11 = v27;
      }

      id v12 = v29;
      uint64_t v13 = CUPrintNSDataHex(v11, 300LL, 0LL);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcSendConversationDetectMessage:]",  30LL,  "SendConversationDetectMessage: destination %@, data <%@>",  v12,  v14);
    }

- (void)_xpcUpdateIdentities:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_1000526D0;
  id v22 = sub_1000526E0;
  id v23 = 0LL;
  id obj = 0LL;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(&v23, obj);
  if ((v5 & 1) != 0)
  {
    xpc_object_t array = xpc_dictionary_get_array(v4, "idtA");
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(array);
    if (v7)
    {
      uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_10005F890;
      applier[3] = &unk_100880A48;
      applier[4] = v8;
      applier[5] = &v18;
      xpc_array_apply(v7, applier);
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcUpdateIdentities:]",  30LL,  "UpdateIdentities: %d total",  -[NSMutableArray count](v8, "count"));
      }

      -[CBDaemonServer updateIdentities:](self->_daemon, "updateIdentities:", v8);
      uint64_t Reply = CUXPCDictionaryCreateReply(v4);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v15)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcUpdateIdentities:]",  90LL,  "### UpdateIdentities create reply failed");
      }
    }

    else
    {
      uint64_t v9 = CBErrorF(4294960591LL, "No identities");
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
      id v11 = (void *)v19[5];
      v19[5] = v10;

      if (dword_1008D6630 <= 90
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      {
        uint64_t v12 = CUPrintNSError(v19[5]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcUpdateIdentities:]",  90LL,  "### UpdateIdentities failed: %@",  v13);
      }

      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v19[5], v4);
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v19[5], v4);
  }

  _Block_object_dispose(&v18, 8);
}

- (void)_xpcCBDiscoveryActivate:(id)a3
{
  id v4 = a3;
  id v12 = 0LL;
  unsigned __int8 v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  id v6 = v12;
  if ((v5 & 1) != 0)
  {
    id v11 = v6;
    unsigned __int8 v7 = -[CBDiscovery initWithXPCObject:error:]( objc_alloc(&OBJC_CLASS___CBDiscovery),  "initWithXPCObject:error:",  v4,  &v11);
    id v8 = v11;

    if (v7)
    {
      -[CBDiscovery setAppID:](v7, "setAppID:", self->_appID);
      if (((unint64_t)-[CBDiscovery discoveryFlags](v7, "discoveryFlags") & 0x400000000000LL) != 0) {
        -[CBDaemonXPCConnection _xpcCBDiscoveryActivateWHB:discovery:]( self,  "_xpcCBDiscoveryActivateWHB:discovery:",  v4,  v7);
      }
      else {
        -[CBDaemonXPCConnection _xpcCBDiscoveryActivateLocal:discovery:]( self,  "_xpcCBDiscoveryActivateLocal:discovery:",  v4,  v7);
      }
    }

    else
    {
      if (dword_1008D6630 <= 90
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      {
        uint64_t v9 = CUPrintNSError(v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryActivate:]",  90LL,  "### CBDiscovery activate decode failed: %@",  v10);
      }

      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v4);
    }
  }

  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    id v8 = v6;
  }
}

- (void)_xpcCBDiscoveryActivateLocal:(id)a3 discovery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_activatedDiscovery, a4);
  if (dword_1008D6630 <= 30 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
  {
    uint64_t v8 = CUPrintPID(self->_pid);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateLocal:discovery:]",  30LL,  "Activate: %@, from %@",  v7,  v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
  [v10 reportCBDiscovery:v7 daemonCnx:self action:@"strt"];

  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 1LL);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10005FE98;
  v38[3] = &unk_10087EFC8;
  v38[4] = self;
  id v11 = v7;
  id v39 = v11;
  [v11 setBluetoothStateChangedHandler:v38];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10005FEF8;
  v36[3] = &unk_10087EF10;
  v36[4] = self;
  id v12 = v11;
  id v37 = v12;
  [v12 setDeviceFoundHandler:v36];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10005FF1C;
  v34[3] = &unk_10087EF10;
  void v34[4] = self;
  id v13 = v12;
  id v35 = v13;
  [v13 setDeviceLostHandler:v34];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10005FF40;
  v32[3] = &unk_10087F270;
  v32[4] = self;
  id v14 = v13;
  id v33 = v14;
  [v14 setDevicesBufferedHandler:v32];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  _OWORD v30[2] = sub_10005FF64;
  v30[3] = &unk_10087EFC8;
  void v30[4] = self;
  id v15 = v14;
  id v31 = v15;
  [v15 setSystemOverrideHandler:v30];
  uint64_t Reply = CUXPCDictionaryCreateReply(v6);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(Reply);
  if (v17)
  {
    xpc_dictionary_set_int64(v17, "pwrS", -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient"));
    uint64_t v24 = 0LL;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    id v27 = sub_1000526D0;
    id v28 = sub_1000526E0;
    id v29 = 0LL;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10005FF84;
    v20[3] = &unk_10087F8C0;
    id v21 = v15;
    id v22 = self;
    id v23 = &v24;
    [v18 enumerateKeysAndObjectsUsingBlock:v20];

    id v19 = (void *)v25[5];
    if (v19) {
      xpc_dictionary_set_value(v17, "devA", v19);
    }
    -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);

    _Block_object_dispose(&v24, 8);
  }

  else if (dword_1008D6630 <= 90 {
         && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateLocal:discovery:]",  90LL,  "### CBDiscovery activate create reply failed");
  }
}

- (void)_xpcCBDiscoveryActivateWHB:(id)a3 discovery:(id)a4
{
  id v6 = a3;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100060398;
  v31[3] = &unk_10087EFC8;
  v31[4] = self;
  id v7 = a4;
  id v32 = v7;
  [v7 setBluetoothStateChangedHandler:v31];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000603F8;
  v29[3] = &unk_10087EF10;
  v29[4] = self;
  id v8 = v7;
  id v30 = v8;
  [v8 setDeviceFoundHandler:v29];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10006041C;
  v27[3] = &unk_10087EF10;
  v27[4] = self;
  id v9 = v8;
  id v28 = v9;
  [v9 setDeviceLostHandler:v27];
  objc_storeStrong((id *)&self->_activatedDiscoveryWHB, a4);
  if (dword_1008D6630 <= 30 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
  {
    uint64_t v10 = CUPrintPID(self->_pid);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateWHB:discovery:]",  30LL,  "Activate: %@, from %@",  v9,  v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
  [v12 reportCBDiscovery:v9 daemonCnx:self action:@"strt"];

  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0LL);
  uint64_t Reply = CUXPCDictionaryCreateReply(v6);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
  if (v14)
  {
    xpc_dictionary_set_int64(v14, "pwrS", -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient"));
    uint64_t v21 = 0LL;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    uint64_t v24 = sub_1000526D0;
    id v25 = sub_1000526E0;
    id v26 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer whbDeviceMap](self->_daemon, "whbDeviceMap"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100060440;
    v17[3] = &unk_10087F8C0;
    id v18 = v9;
    id v19 = self;
    uint64_t v20 = &v21;
    [v15 enumerateKeysAndObjectsUsingBlock:v17];

    uint64_t v16 = (void *)v22[5];
    if (v16) {
      xpc_dictionary_set_value(v14, "devA", v16);
    }
    -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);

    _Block_object_dispose(&v21, 8);
  }

  else if (dword_1008D6630 <= 90 {
         && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateWHB:discovery:]",  90LL,  "### CBDiscovery activate create reply failed");
  }
}

- (void)_xpcCBDiscoveryFinish:(id)a3
{
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_1000526D0;
  id v30 = sub_1000526E0;
  id v31 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000608B4;
  v23[3] = &unk_10087F4C8;
  id v25 = &v26;
  v23[4] = self;
  id v4 = a3;
  id v24 = v4;
  unsigned __int8 v5 = objc_retainBlock(v23);
  id v6 = (id *)(v27 + 5);
  id obj = (id)v27[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    activatedDiscovery = self->_activatedDiscovery;
    if (activatedDiscovery)
    {
      id v9 = activatedDiscovery;
    }

    else
    {
      id v9 = self->_activatedDiscoveryWHB;
      if (!v9)
      {
        uint64_t v17 = CBErrorF(4294960551LL, "No discovery");
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
        id v9 = (CBDiscovery *)v27[5];
        void v27[5] = v18;
LABEL_19:

        goto LABEL_20;
      }
    }

    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      id v10 = -[CBDiscovery clientID](v9, "clientID");
      uint64_t v11 = CUPrintPID(self->_pid);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryFinish:]",  30LL,  "Discovery Finish start: CID 0x%X, from %@",  v10,  v12);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackBLEScanner](self->_daemon, "stackBLEScanner"));
    if (v13)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      _OWORD v19[2] = sub_10006097C;
      v19[3] = &unk_100880A70;
      v19[4] = v9;
      id v20 = v4;
      uint64_t v21 = self;
      [v13 finishDiscovery:v9 completionHandler:v19];
    }

    else
    {
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryFinish:]",  30LL,  "Discovery Finish completed: CID 0x%X, not scanning",  -[CBDiscovery clientID](v9, "clientID"));
      }

      uint64_t Reply = CUXPCDictionaryCreateReply(v4);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v15)
      {
        id v16 = objc_alloc_init(&OBJC_CLASS___CBDiscoverySummary);
        CUXPCEncodeObject(v15, "dsSm", v16, 0LL);
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);
      }

      else if (dword_1008D6630 <= 90 {
             && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryFinish:]",  90LL,  "### Discovery Finish create reply failed");
      }
    }

    goto LABEL_19;
  }

- (void)_xpcCBDiscoveryUpdate:(id)a3
{
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1000526D0;
  id v31 = sub_1000526E0;
  id v32 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100060D98;
  v24[3] = &unk_10087F4C8;
  uint64_t v26 = &v27;
  v24[4] = self;
  id v4 = a3;
  id v25 = v4;
  unsigned __int8 v5 = objc_retainBlock(v24);
  id v6 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___CBDiscovery);
    id v9 = (id *)(v28 + 5);
    id v22 = (id)v28[5];
    id v10 = -[CBDiscovery initWithXPCObject:error:](v8, "initWithXPCObject:error:", v4, &v22);
    objc_storeStrong(v9, v22);
    if (v10)
    {
      activatedDiscovery = self->_activatedDiscovery;
      if (activatedDiscovery)
      {
        id v12 = activatedDiscovery;
        goto LABEL_6;
      }

      id v12 = self->_activatedDiscoveryWHB;
      if (v12)
      {
LABEL_6:
        unsigned int v13 = -[CBDiscovery updateWithCBDiscovery:](v12, "updateWithCBDiscovery:", v10);
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v14 = CUPrintPID(self->_pid);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryUpdate:]",  30LL,  "Discovery Update: %@, from %@",  v12,  v15);
        }

        if (v13)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CBMetricsDaemon sharedCBMetricsDaemon]( &OBJC_CLASS___CBMetricsDaemon,  "sharedCBMetricsDaemon"));
          [v16 reportCBDiscovery:v12 daemonCnx:self action:@"updt"];

          -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0LL);
        }

        goto LABEL_12;
      }

      uint64_t v19 = CBErrorF(4294960551LL, "No discovery");
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = (void *)v28[5];
      v28[5] = v20;

      id v12 = 0LL;
    }

    else
    {
      uint64_t v17 = CBErrorF(4294960591LL, "Decode failed");
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
      id v12 = (CBDiscovery *)v28[5];
      v28[5] = v18;
    }

- (void)_xpcCBDiscoveryClearDuplicateFilterCache:(id)a3
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_1000526D0;
  uint64_t v21 = sub_1000526E0;
  id v22 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100061000;
  v14[3] = &unk_10087F4C8;
  id v16 = &v17;
  v14[4] = self;
  id v4 = a3;
  id v15 = v4;
  unsigned __int8 v5 = objc_retainBlock(v14);
  id v6 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    activatedDiscovery = self->_activatedDiscovery;
    if (activatedDiscovery)
    {
      id v9 = activatedDiscovery;
    }

    else
    {
      id v9 = self->_activatedDiscoveryWHB;
      if (!v9)
      {
        uint64_t v10 = CBErrorF(4294960551LL, "No discovery");
        uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
        id v12 = (void *)v18[5];
        v18[5] = v11;

        id v9 = 0LL;
        goto LABEL_6;
      }
    }

    -[CBDaemonServer clearDuplicateFilterCache:](self->_daemon, "clearDuplicateFilterCache:", v9);
LABEL_6:
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcCBDiscoveryGetDevices:(id)a3
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1000526D0;
  uint64_t v26 = sub_1000526E0;
  id v27 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  _OWORD v19[2] = sub_100061390;
  v19[3] = &unk_10087F4C8;
  uint64_t v21 = &v22;
  v19[4] = self;
  id v4 = a3;
  id v20 = v4;
  unsigned __int8 v5 = objc_retainBlock(v19);
  id v6 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    uunint64_t int64 = xpc_dictionary_get_uint64(v4, "dsFl");
    if (dword_1008D6630 <= 30
      && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
    {
      uint64_t v9 = CBDiscoveryFlagsToString(uint64);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = CUPrintPID(self->_pid);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryGetDevices:]",  30LL,  "CBDiscoveryGetDevices: %@, from %@",  v10,  v12);
    }

    uint64_t Reply = CUXPCDictionaryCreateReply(v4);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
    if (v14)
    {
      xpc_object_t v15 = xpc_array_create(0LL, 0LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100061458;
      v17[3] = &unk_100880A98;
      void v17[4] = v15;
      void v17[5] = uint64;
      [v16 enumerateKeysAndObjectsUsingBlock:v17];

      xpc_dictionary_set_value(v14, "devA", v15);
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);
    }

    else if (dword_1008D6630 <= 90 {
           && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBDiscoveryGetDevices:]",  90LL,  "### CBDiscoveryGetDevices create reply failed");
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v22, 8);
}

- (void)_xpcCBSpatialInteractionSessionActivate:(id)a3
{
  uint64_t v75 = 0LL;
  id v76 = (id *)&v75;
  uint64_t v77 = 0x3032000000LL;
  id v78 = sub_1000526D0;
  id v79 = sub_1000526E0;
  id v80 = 0LL;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_100061E34;
  v72[3] = &unk_10087F4C8;
  uint64_t v74 = &v75;
  v72[4] = self;
  id v6 = a3;
  id v73 = v6;
  unsigned __int8 v7 = objc_retainBlock(v72);
  id v8 = v76;
  id v71 = v76[5];
  uint64_t v55 = v7;
  unsigned __int8 v9 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v71);
  objc_storeStrong(v8 + 5, v71);
  if ((v9 & 1) != 0)
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___CBSpatialInteractionSession);
    uint64_t v11 = v76;
    id v70 = v76[5];
    id v12 = -[CBSpatialInteractionSession initWithXPCObject:error:](v10, "initWithXPCObject:error:", v6, &v70);
    objc_storeStrong(v11 + 5, v70);
    if (!v12)
    {
      uint64_t v49 = CBErrorF(4294960591LL, "Decode failed");
      uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
      id v51 = v76[5];
      void v76[5] = (id)v50;

LABEL_48:
      goto LABEL_49;
    }

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_100061EFC;
    v69[3] = &unk_10087EFC8;
    v69[4] = v12;
    v69[5] = self;
    -[CBSpatialInteractionSession setAdvertisingAddressChangedHandler:]( v12,  "setAdvertisingAddressChangedHandler:",  v69);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_10006201C;
    v68[3] = &unk_100880AC0;
    v68[4] = v12;
    v68[5] = self;
    -[CBSpatialInteractionSession setAopDataHandler:](v12, "setAopDataHandler:", v68);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_100062038;
    v67[3] = &unk_10087EFC8;
    v67[4] = v12;
    v67[5] = self;
    -[CBSpatialInteractionSession setBluetoothStateChangedHandler:](v12, "setBluetoothStateChangedHandler:", v67);
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_10006207C;
    v66[3] = &unk_10087EF10;
    v66[4] = v12;
    v66[5] = self;
    -[CBSpatialInteractionSession setDeviceFoundHandler:](v12, "setDeviceFoundHandler:", v66);
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_100062098;
    v65[3] = &unk_10087EF10;
    v65[4] = v12;
    v65[5] = self;
    -[CBSpatialInteractionSession setDeviceLostHandler:](v12, "setDeviceLostHandler:", v65);
    uint64_t v59 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIrkData](v12, "clientIrkData"));
    if (v13
      && (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIrkData](v12, "clientIrkData")),
          [v3 length] == (id)16))
    {
      id v58 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIrkData](v12, "clientIrkData"));
    }

    else
    {
      uint64_t v14 = NSRandomData(16LL, 0LL);
      id v58 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (!v13)
      {
LABEL_8:

        -[CBSpatialInteractionSession setIrkData:](v12, "setIrkData:", v58);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v58, &off_1008C28B8);
        xpc_object_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIdentifierData](v12, "clientIdentifierData"));
        if (v15
          && (id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIdentifierData](v12, "clientIdentifierData")),
              [v4 length] == (id)3))
        {
          id v57 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIdentifierData](v12, "clientIdentifierData"));
        }

        else
        {
          uint64_t v16 = NSRandomData(3LL, 0LL);
          id v57 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (!v15)
          {
LABEL_13:

            -[CBSpatialInteractionSession setIdentifierData:](v12, "setIdentifierData:", v57);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v59,  "setObject:forKeyedSubscript:",  v57,  &off_1008C28D0);
            id v17 = -[CBSpatialInteractionSession uwbTokenFlags](v12, "uwbTokenFlags");
            if ((_DWORD)v17)
            {
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v17));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v59,  "setObject:forKeyedSubscript:",  v18,  &off_1008C28E8);
            }

            unsigned int v64 = 0;
            uint64_t v19 = (void *)OPACKEncoderCreateData(v59, 8LL, &v64);
            if (v19)
            {
              -[CBSpatialInteractionSession setTokenData:](v12, "setTokenData:", v19);
              objc_storeStrong((id *)&self->_activatedSpatialInteractionSession, v12);
              if (dword_1008D6630 <= 30
                && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
              {
                uint64_t v20 = CUPrintPID(self->_pid);
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
                LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionActivate:]",  30LL,  "Spatial Activate: %@, from %@",  v12,  v21);
              }

              uint64_t v22 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
              objc_storeStrong((id *)&self->_activatedDiscovery, v22);
              -[CBDiscovery setBleScanRate:]( v22,  "setBleScanRate:",  -[CBSpatialInteractionSession scanRate](v12, "scanRate"));
              -[CBDiscovery setBleScanRateScreenOff:]( v22,  "setBleScanRateScreenOff:",  -[CBSpatialInteractionSession scanRateScreenOff](v12, "scanRateScreenOff"));
              -[CBDiscovery setBleRSSIThresholdHint:]( v22,  "setBleRSSIThresholdHint:",  -[CBSpatialInteractionSession bleRSSIThresholdHint](v12, "bleRSSIThresholdHint"));
              -[CBDiscovery setBleRSSIThresholdOrder:]( v22,  "setBleRSSIThresholdOrder:",  -[CBSpatialInteractionSession bleRSSIThresholdOrder](v12, "bleRSSIThresholdOrder"));
              -[CBDiscovery setDiscoveryFlags:](v22, "setDiscoveryFlags:", 0x40000LL);
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession filter](v12, "filter"));
              -[CBDiscovery setSpatialInteractionfilter:](v22, "setSpatialInteractionfilter:", v23);

              else {
                unint64_t v24 = (unint64_t)-[CBDiscovery discoveryFlags](v22, "discoveryFlags") & 0xFFFFFFFFFDFFFFFFLL;
              }
              -[CBDiscovery setDiscoveryFlags:](v22, "setDiscoveryFlags:", v24);
              else {
                unint64_t v25 = (unint64_t)-[CBDiscovery discoveryFlags](v22, "discoveryFlags") & 0xFFFFFFFDFFFFFFFFLL;
              }
              -[CBDiscovery setDiscoveryFlags:](v22, "setDiscoveryFlags:", v25);
              else {
                unint64_t v26 = (unint64_t)-[CBDiscovery internalFlags](v22, "internalFlags") & 0xFFFFFFEF;
              }
              -[CBDiscovery setInternalFlags:](v22, "setInternalFlags:", v26);
              unsigned __int16 v27 = (unsigned __int16)-[CBSpatialInteractionSession controlFlags](v12, "controlFlags");
              uint64_t v28 = v22;
              uint64_t v29 = -[CBDiscovery discoveryTypesInternalPtr](v28, "discoveryTypesInternalPtr");
              if ((v27 & 0x8000) != 0) {
                char v30 = v29[4] | 0x80;
              }
              else {
                char v30 = v29[4] & 0x7F;
              }
              v29[4] = v30;
              v63[0] = _NSConcreteStackBlock;
              v63[1] = 3221225472LL;
              v63[2] = sub_1000620B4;
              v63[3] = &unk_10087EF10;
              v63[4] = v28;
              v63[5] = self;
              -[CBDiscovery setDeviceFoundHandler:](v28, "setDeviceFoundHandler:", v63);
              v62[0] = _NSConcreteStackBlock;
              v62[1] = 3221225472LL;
              v62[2] = sub_1000620D4;
              v62[3] = &unk_10087EF10;
              v62[4] = v28;
              v62[5] = self;
              -[CBDiscovery setDeviceLostHandler:](v28, "setDeviceLostHandler:", v62);
              v61[0] = _NSConcreteStackBlock;
              v61[1] = 3221225472LL;
              v61[2] = sub_1000620FC;
              v61[3] = &unk_10087EFC8;
              v61[4] = v28;
              v61[5] = self;
              -[CBDiscovery setSystemOverrideHandler:](v28, "setSystemOverrideHandler:", v61);
              id v31 = (void *)objc_claimAutoreleasedReturnValue( +[CBMetricsDaemon sharedCBMetricsDaemon]( &OBJC_CLASS___CBMetricsDaemon,  "sharedCBMetricsDaemon"));
              [v31 reportCBDiscovery:v28 daemonCnx:self action:@"strt"];

              -[CBDaemonServer scheduleSpatialUpdateImmediate:](self->_daemon, "scheduleSpatialUpdateImmediate:", 1LL);
              id v54 = v6;
              uint64_t Reply = CUXPCDictionaryCreateReply(v6);
              id v33 = (void *)objc_claimAutoreleasedReturnValue(Reply);
              if (v33)
              {
                xpc_dictionary_set_int64( v33,  "pwrS",  -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient"));
                id v56 = v19;
                unsigned int v34 = -[CBDaemonServer supportsNCSecondaryAdvertisingInstance]( self->_daemon,  "supportsNCSecondaryAdvertisingInstance");
                daemon = self->_daemon;
                if (v34)
                {
                  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](daemon, "addressMonitor"));
                  uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 nonConnectableSecondaryAddressData]);
                }

                else
                {
                  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](daemon, "addressMonitor"));
                  uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 nonConnectableAddressData]);
                }

                uint64_t v38 = (void *)v37;

                -[CBSpatialInteractionSession setAdvertisingAddressData:](v12, "setAdvertisingAddressData:", v38);
                if (-[CBDaemonServer supportsNCSecondaryAdvertisingInstance]( self->_daemon,  "supportsNCSecondaryAdvertisingInstance"))
                {
                  id v39 = "aaNC2";
                }

                else
                {
                  id v39 = "aaNC";
                }

                if (v38)
                {
                  id v40 = v38;
                  id v41 = v33;
                  id v42 = (const char *)[v40 bytes];
                  id v43 = [v40 length];
                  if (!v42) {
                    id v42 = "";
                  }

                  xpc_dictionary_set_data(v41, v39, v42, (size_t)v43);
                }

                id v44 = v56;
                id v45 = v33;
                id v46 = (const char *)[v44 bytes];
                id v47 = [v44 length];
                if (!v46) {
                  id v46 = "";
                }

                xpc_dictionary_set_data(v45, "siTD", v46, (size_t)v47);
                -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v45);
                self->_spatialActivateResponded = 1;
                uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
                v60[0] = _NSConcreteStackBlock;
                v60[1] = 3221225472LL;
                v60[2] = sub_100062184;
                v60[3] = &unk_10087F3D8;
                v60[4] = self;
                [v48 enumerateKeysAndObjectsUsingBlock:v60];

                uint64_t v19 = v56;
              }

              else if (dword_1008D6630 <= 90 {
                     && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
              }
              {
                LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionActivate:]",  90LL,  "### Spatial Activate create reply failed");
              }

              id v6 = v54;
            }

            else
            {
              uint64_t v52 = CBErrorF(v64, "Encode token failed");
              uint64_t v53 = objc_claimAutoreleasedReturnValue(v52);
              uint64_t v28 = (CBDiscovery *)v76[5];
              void v76[5] = (id)v53;
            }

            unsigned __int8 v7 = v55;
            goto LABEL_48;
          }
        }

        goto LABEL_13;
      }
    }

    goto LABEL_8;
  }

- (void)_xpcCBSpatialInteractionSessionUpdate:(id)a3
{
  uint64_t v29 = 0LL;
  char v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = sub_1000526D0;
  id v33 = sub_1000526E0;
  id v34 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100062530;
  v26[3] = &unk_10087F4C8;
  uint64_t v28 = &v29;
  v26[4] = self;
  id v4 = a3;
  id v27 = v4;
  unsigned __int8 v5 = objc_retainBlock(v26);
  id v6 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___CBSpatialInteractionSession);
    unsigned __int8 v9 = (id *)(v30 + 5);
    id v24 = (id)v30[5];
    uint64_t v10 = -[CBSpatialInteractionSession initWithXPCObject:error:](v8, "initWithXPCObject:error:", v4, &v24);
    objc_storeStrong(v9, v24);
    if (v10)
    {
      uint64_t v11 = self->_activatedSpatialInteractionSession;
      id v12 = v11;
      if (v11)
      {
        unsigned int v13 = -[CBSpatialInteractionSession updateWithSession:](v11, "updateWithSession:", v10);
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          uint64_t v14 = CUPrintPID(self->_pid);
          xpc_object_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionUpdate:]",  30LL,  "Spatial Update: %@, from %@",  v12,  v15);
        }

        uint64_t v16 = self->_activatedDiscovery;
        else {
          unint64_t v17 = (unint64_t)-[CBDiscovery discoveryFlags](v16, "discoveryFlags") & 0xFFFFFFFFFDFFFFFFLL;
        }
        -[CBDiscovery setDiscoveryFlags:](v16, "setDiscoveryFlags:", v17);
        -[CBDiscovery setBleScanRate:]( self->_activatedDiscovery,  "setBleScanRate:",  -[CBSpatialInteractionSession scanRate](v12, "scanRate"));
        -[CBDiscovery setBleScanRateScreenOff:]( self->_activatedDiscovery,  "setBleScanRateScreenOff:",  -[CBSpatialInteractionSession scanRateScreenOff](v12, "scanRateScreenOff"));
        -[CBDiscovery setBleRSSIThresholdHint:]( self->_activatedDiscovery,  "setBleRSSIThresholdHint:",  -[CBSpatialInteractionSession bleRSSIThresholdHint](v12, "bleRSSIThresholdHint"));
        -[CBDiscovery setBleRSSIThresholdOrder:]( self->_activatedDiscovery,  "setBleRSSIThresholdOrder:",  -[CBSpatialInteractionSession bleRSSIThresholdOrder](v12, "bleRSSIThresholdOrder"));
        else {
          unint64_t v18 = (unint64_t)-[CBDiscovery internalFlags](v16, "internalFlags") & 0xFFFFFFEF;
        }
        -[CBDiscovery setInternalFlags:](v16, "setInternalFlags:", v18);
        if (v13)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[CBMetricsDaemon sharedCBMetricsDaemon]( &OBJC_CLASS___CBMetricsDaemon,  "sharedCBMetricsDaemon"));
          [v19 reportCBDiscovery:v16 daemonCnx:self action:@"updt"];

          -[CBDaemonServer scheduleSpatialUpdateImmediate:](self->_daemon, "scheduleSpatialUpdateImmediate:", 0LL);
        }
      }

      else
      {
        uint64_t v22 = CBErrorF(4294960551LL, "No session");
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v16 = (CBDiscovery *)v30[5];
        void v30[5] = v23;
      }
    }

    else
    {
      uint64_t v20 = CBErrorF(4294960591LL, "Decode failed");
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      id v12 = (CBSpatialInteractionSession *)v30[5];
      void v30[5] = v21;
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v29, 8);
}

- (void)_xpcCBSpatialInteractionSessionAddPeerToken:(id)a3
{
  uint64_t v59 = 0LL;
  double v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000LL;
  id v62 = sub_1000526D0;
  unsigned int v63 = sub_1000526E0;
  id v64 = 0LL;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_100062B1C;
  v56[3] = &unk_10087F4C8;
  id v58 = &v59;
  v56[4] = self;
  id v4 = a3;
  id v57 = v4;
  unsigned __int8 v5 = objc_retainBlock(v56);
  id v6 = v60;
  id obj = v60[5];
  uint64_t v48 = v5;
  unsigned __int8 v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    id v8 = v60;
    id v54 = v60[5];
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[CBDaemonXPCConnection _spatialInteractionDecodePeerTokenRequest:error:]( self,  "_spatialInteractionDecodePeerTokenRequest:error:",  v4,  &v54));
    objc_storeStrong(v8 + 5, v54);
    if (!v9)
    {
LABEL_36:

      unsigned __int8 v5 = v48;
      goto LABEL_37;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 irkData]);
    uint64_t v11 = v60 + 5;
    id v53 = v60[5];
    uint64_t v65 = 0LL;
    int v12 = CUXPCDecodeUInt64RangedEx(v4, "siPI", 0LL, 0xFFFFFFFFLL, &v65, &v53);
    if (v12 == 6) {
      uint64_t v13 = v65;
    }
    else {
      uint64_t v13 = 0LL;
    }
    objc_storeStrong(v11, v53);
    if (v12 == 5)
    {
LABEL_35:

      goto LABEL_36;
    }

    if (!(_DWORD)v13)
    {
      uint64_t v40 = CBErrorF(4294960591LL, "No peer ID");
      uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
      id v47 = v60[5];
      void v60[5] = (id)v41;

      goto LABEL_35;
    }

    [v9 setPeerID:v13];
    id v46 = self->_activatedSpatialInteractionSession;
    if (v46)
    {
      uint64_t v14 = (char *)-[NSMutableArray count](self->_spatialPeers, "count");
      id v49 = v4;
      uint64_t v45 = v13;
      if (v14)
      {
        xpc_object_t v15 = 0LL;
        id v16 = 0LL;
        unint64_t v17 = v14 - 1;
        do
        {
          unint64_t v18 = objc_autoreleasePoolPush();
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_spatialPeers,  "objectAtIndexedSubscript:",  v15));
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 irkData]);
          unsigned __int8 v21 = [v20 isEqual:v10];

          if ((v21 & 1) != 0)
          {
            id v22 = v19;

            -[NSMutableArray setObject:atIndexedSubscript:]( self->_spatialPeers,  "setObject:atIndexedSubscript:",  v9,  v15);
            id v16 = v22;
          }

          objc_autoreleasePoolPop(v18);
          if (v17 == v15++) {
            char v24 = 1;
          }
          else {
            char v24 = v21;
          }
        }

        while ((v24 & 1) == 0);
        id v4 = v49;
        if (v16)
        {
          unsigned int v25 = [v16 peerID];
          spatialDeviceMapMatched = self->_spatialDeviceMapMatched;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_100062BE4;
          v50[3] = &unk_100880AE0;
          unsigned int v51 = v25;
          int v52 = v45;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( spatialDeviceMapMatched,  "enumerateKeysAndObjectsUsingBlock:",  v50);
          id v27 = "replaced";
LABEL_23:
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v9 identifierData]);
          if (dword_1008D6630 <= 30
            && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
          {
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v9 irkData]);
            uint64_t v34 = CUPrintNSObjectMasked(v33);
            id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            uint64_t v36 = CUPrintPID(self->_pid);
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionAddPeerToken:]",  30LL,  "Spatial AddPeerToken: ID <%@>, IRK %@, PeerID 0x%X, from %@, %s",  v32,  v35,  v45,  v37,  v27);
          }

          id v4 = v49;
          uint64_t Reply = CUXPCDictionaryCreateReply(v49);
          id v39 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v39)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v39);
          }

          else if (dword_1008D6630 <= 90 {
                 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
          }
          {
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionAddPeerToken:]",  90LL,  "### Spatial AddPeerToken create reply failed");
          }

          -[CBDaemonXPCConnection _spatialInteractionReevaluateDevices](self, "_spatialInteractionReevaluateDevices");

          goto LABEL_34;
        }
      }

      id v28 = -[NSMutableArray count](self->_spatialPeers, "count");
      if ((unint64_t)v28 < 0x1E)
      {
        spatialPeers = self->_spatialPeers;
        if (!spatialPeers)
        {
          char v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          uint64_t v31 = self->_spatialPeers;
          self->_spatialPeers = v30;

          spatialPeers = self->_spatialPeers;
        }

        -[NSMutableArray addObject:](spatialPeers, "addObject:", v9);
        id v16 = 0LL;
        id v27 = "added";
        goto LABEL_23;
      }

      uint64_t v44 = CBErrorF(312901LL, "Too many peer tokens (%d)", (_DWORD)v28);
      uint64_t v43 = objc_claimAutoreleasedReturnValue(v44);
    }

    else
    {
      uint64_t v42 = CBErrorF(4294960551LL, "No session");
      uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);
    }

    id v16 = v60[5];
    void v60[5] = (id)v43;
LABEL_34:

    goto LABEL_35;
  }

- (void)_xpcCBSpatialInteractionSessionRemovePeerToken:(id)a3
{
  uint64_t v46 = 0LL;
  id v47 = (id *)&v46;
  uint64_t v48 = 0x3032000000LL;
  id v49 = sub_1000526D0;
  uint64_t v50 = sub_1000526E0;
  id v51 = 0LL;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000630F8;
  v43[3] = &unk_10087F4C8;
  uint64_t v45 = &v46;
  v43[4] = self;
  id v4 = a3;
  id v44 = v4;
  uint64_t v36 = objc_retainBlock(v43);
  unsigned __int8 v5 = v47;
  id obj = v47[5];
  unsigned __int8 v6 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v5 + 5, obj);
  if ((v6 & 1) != 0)
  {
    unsigned __int8 v7 = v47 + 5;
    id v41 = v47[5];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CBDaemonXPCConnection _spatialInteractionDecodePeerTokenRequest:error:]( self,  "_spatialInteractionDecodePeerTokenRequest:error:",  v4,  &v41));
    objc_storeStrong(v7, v41);
    if (!v8)
    {
LABEL_32:

      goto LABEL_33;
    }

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 irkData]);
    id v35 = self->_activatedSpatialInteractionSession;
    if (v35)
    {
      id v10 = -[NSMutableArray count](self->_spatialPeers, "count");
      if (v10)
      {
        uint64_t v11 = 0LL;
        while (1)
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_spatialPeers,  "objectAtIndexedSubscript:",  v11));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 irkData]);
          unsigned __int8 v14 = [v13 isEqual:v9];

          if ((v14 & 1) != 0) {
            break;
          }

          if (v10 == (id)++v11) {
            goto LABEL_8;
          }
        }

        id v17 = v12;
        -[NSMutableArray removeObjectAtIndex:](self->_spatialPeers, "removeObjectAtIndex:", v11);

        if (v17)
        {
          id v18 = [v17 peerID];
          if (dword_1008D6630 <= 30
            && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
          {
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v17 identifierData]);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 irkData]);
            uint64_t v20 = CUPrintNSObjectMasked(v19);
            unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            uint64_t v22 = CUPrintPID(self->_pid);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionRemovePeerToken:]",  30LL,  "Spatial RemovePeerToken: ID <%@>, IRK %@, PeerID 0x%X, from %@",  v33,  v21,  v18,  v23);
          }

          uint64_t Reply = CUXPCDictionaryCreateReply(v4);
          unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v25)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v25);
          }

          else if (dword_1008D6630 <= 90 {
                 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 90LL)))
          }
          {
            LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionRemovePeerToken:]",  90LL,  "### Spatial RemovePeerToken create reply failed");
          }

          id v32 = v8;
          id v34 = v4;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapMatched, "allValues"));
          id v27 = [v26 countByEnumeratingWithState:&v37 objects:v52 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v38;
            do
            {
              for (uint64_t i = 0LL; i != v27; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v38 != v28) {
                  objc_enumerationMutation(v26);
                }
                char v30 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
                if ([v30 spatialInteractionPeerID] == (_DWORD)v18) {
                  -[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:]( self,  "_spatialInteractionDeviceLost:removeUnmatched:reason:",  v30,  0LL,  "removed token");
                }
              }

              id v27 = [v26 countByEnumeratingWithState:&v37 objects:v52 count:16];
            }

            while (v27);
          }

          id v8 = v32;
          id v4 = v34;

          goto LABEL_31;
        }
      }

- (void)_spatialInteractionDeviceFound:(id)a3 checkOnly:(BOOL)a4
{
  id v154 = a3;
  id v134 = (void *)objc_claimAutoreleasedReturnValue([v154 identifier]);
  if (!v134) {
    goto LABEL_150;
  }
  id v140 = (id)objc_claimAutoreleasedReturnValue([v154 btAddressData]);
  if ([v140 length] != (id)6) {
    goto LABEL_149;
  }
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v154 spatialInteractionIdentifiers]);
  id v135 = self->_activatedSpatialInteractionSession;
  id v145 = self;
  id v139 = v6;
  BOOL v133 = a4;
  if ((-[CBSpatialInteractionSession controlFlags](v135, "controlFlags") & 0x3E0) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    if ([v7 length] == (id)3)
    {
      __int128 v172 = 0u;
      __int128 v173 = 0u;
      __int128 v170 = 0u;
      __int128 v171 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[CBDaemonServer identityArray](self->_daemon, "identityArray"));
      id v8 = [obj countByEnumeratingWithState:&v170 objects:v190 count:16];
      if (v8)
      {
        id v9 = v8;
        int v155 = 0;
        char v10 = 0;
        uint64_t v11 = *(void *)v171;
        id v150 = v7;
        do
        {
          int v12 = 0LL;
          do
          {
            if (*(void *)v171 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v170 + 1) + 8LL * (void)v12);
            unsigned __int8 v14 = objc_autoreleasePoolPush();
            if ([v13 verifyAuthTag:v7 data:v140 type:2 error:0])
            {
              objc_msgSend(v154, "setInternalFlags:", objc_msgSend(v154, "internalFlags") | 8);
              [v154 updateWithRPIdentity:v13];
              unsigned int v15 = -[CBSpatialInteractionSession matchesWithDevice:](v135, "matchesWithDevice:", v154);
              if (self->_isHomePod)
              {
                id v16 = sub_100064028();
                id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  uint64_t v28 = "no";
                  if (v15) {
                    uint64_t v28 = "yes";
                  }
                  uint64_t v176 = (uint64_t)v28;
                  __int16 v177 = 2112;
                  id v178 = v154;
                  __int16 v179 = 2112;
                  uint64_t v180 = (uint64_t)v13;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Spatial found match sys: match %s, %@, %@",  buf,  0x20u);
                }

                unsigned __int8 v7 = v150;
              }

              else if (dword_1008D6630 <= 20 {
                     && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 20LL)))
              }
              {
                uint64_t v20 = "no";
                if (v15) {
                  uint64_t v20 = "yes";
                }
                LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]",  20LL,  "Spatial found match sys: match %s, %@, %@",  v20,  v154,  v13);
              }

              int v27 = v155;
              if (v15) {
                int v27 = 1;
              }
              int v155 = v27;
              if (v15) {
                char v10 = 1;
              }
            }

            else if (self->_isHomePod)
            {
              id v18 = sub_100064028();
              uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                id v29 = v140;
                uint64_t v30 = CUPrintHex([v29 bytes], objc_msgSend(v29, "length"), 32, 0);
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                id v32 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceIRKData]);
                uint64_t v33 = CUPrintNSObjectMasked(v32);
                id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                *(_DWORD *)buf = 138413058;
                uint64_t v176 = (uint64_t)v31;
                __int16 v177 = 2112;
                id v178 = v34;
                __int16 v179 = 2112;
                uint64_t v180 = (uint64_t)v154;
                __int16 v181 = 2112;
                v182 = (const char *)v13;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Spatial found check sys: SRC <%@>, IRK %@, match no, %@, %@",  buf,  0x2Au);

                unsigned __int8 v7 = v150;
                self = v145;
              }
            }

            else if (dword_1008D6630 <= 5 {
                   && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 5LL)))
            }
            {
              id v21 = v140;
              uint64_t v22 = CUPrintHex([v21 bytes], objc_msgSend(v21, "length"), 32, 0);
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              char v24 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceIRKData]);
              uint64_t v25 = CUPrintNSObjectMasked(v24);
              unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]",  5LL,  "Spatial found check sys: SRC <%@>, IRK %@, match no, %@, %@",  v23,  v26,  v154,  v13);

              unsigned __int8 v7 = v150;
              self = v145;
            }

            objc_autoreleasePoolPop(v14);
            int v12 = (char *)v12 + 1;
          }

          while (v9 != v12);
          id v35 = [obj countByEnumeratingWithState:&v170 objects:v190 count:16];
          id v9 = v35;
        }

        while (v35);
      }

      else
      {
        LOBYTE(v155) = 0;
        char v10 = 0;
      }

      unsigned __int8 v6 = v139;
      char v36 = v155;
    }

    else
    {
      char v36 = 0;
      char v10 = 0;
    }

    int v147 = v36 & 1;
    int v132 = v10 & 1;
  }

  else
  {
    int v147 = 0;
    int v132 = 0;
  }

  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession identifierData](v135, "identifierData"));
  __int128 v166 = 0u;
  __int128 v167 = 0u;
  __int128 v168 = 0u;
  __int128 v169 = 0u;
  __int128 v38 = self->_spatialPeers;
  id v138 = v37;
  id v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v166,  v189,  16LL);
  if (!v141)
  {
    char obja = 0;
    goto LABEL_92;
  }

  char obja = 0;
  uint64_t v39 = *(void *)v167;
  uint64_t v136 = *(void *)v167;
  id v137 = v38;
  do
  {
    uint64_t v40 = 0LL;
    do
    {
      if (*(void *)v167 != v39)
      {
        uint64_t v41 = v40;
        objc_enumerationMutation(v38);
        uint64_t v40 = v41;
      }

      uint64_t v143 = v40;
      uint64_t v42 = *(void **)(*((void *)&v166 + 1) + 8 * v40);
      context = objc_autoreleasePoolPush();
      uint64_t v43 = objc_claimAutoreleasedReturnValue([v42 identifierData]);
      id v44 = (void *)v43;
      if (v43) {
        uint64_t v45 = (void *)v43;
      }
      else {
        uint64_t v45 = v37;
      }
      id v46 = v45;

      id v144 = v46;
      if ([v46 length] != (id)3) {
        goto LABEL_88;
      }
      id v47 = (void *)objc_claimAutoreleasedReturnValue([v42 irkData]);
      if ([v47 length] != (id)16) {
        goto LABEL_87;
      }
      char v188 = 0;
      uint64_t v187 = 0LL;
      uint64_t v48 = [v140 bytes];
      __int16 v49 = v48[2];
      LODWORD(v187) = *(_DWORD *)v48;
      WORD2(v187) = v49;
      uint64_t v50 = [v46 bytes];
      char v51 = v50[2];
      HIWORD(v187) = *(_WORD *)v50;
      char v188 = v51;
      id v146 = v47;
      unint64_t v186 = bswap64(SipHash([v146 bytes], &v187, 9));
      __int128 v162 = 0u;
      __int128 v163 = 0u;
      __int128 v164 = 0u;
      __int128 v165 = 0u;
      id v156 = v6;
      id v52 = [v156 countByEnumeratingWithState:&v162 objects:v185 count:16];
      if (!v52)
      {
        int v55 = v147;
        goto LABEL_86;
      }

      id v53 = v52;
      id v151 = v42;
      uint64_t v54 = *(void *)v163;
      int v55 = v147;
      do
      {
        id v56 = 0LL;
        do
        {
          id v57 = v47;
          if (*(void *)v163 != v54) {
            objc_enumerationMutation(v156);
          }
          id v58 = *(void **)(*((void *)&v162 + 1) + 8LL * (void)v56);
          uint64_t v59 = objc_autoreleasePoolPush();
          if ([v58 length] == (id)3)
          {
            double v60 = (unsigned __int16 *)[v58 bytes];
            BOOL v62 = (unsigned __int16)v186 != *v60 || BYTE2(v186) != *((unsigned __int8 *)v60 + 2);
            if (self->_isHomePod)
            {
              id v63 = sub_100064028();
              id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v72 = CUPrintHex(&v187, 9LL, 32LL, 0LL);
                uint64_t v73 = objc_claimAutoreleasedReturnValue(v72);
                id v149 = (void *)v73;
                uint64_t v74 = CUPrintNSObjectMasked(v146);
                uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                uint64_t v76 = CUPrintHex(&v186, 3LL, 32LL, 0LL);
                uint64_t v77 = objc_claimAutoreleasedReturnValue(v76);
                *(_DWORD *)buf = 138413314;
                id v78 = "no";
                if (!v62) {
                  id v78 = "yes";
                }
                uint64_t v176 = v73;
                __int16 v177 = 2112;
                id v178 = v75;
                __int16 v179 = 2112;
                uint64_t v180 = v77;
                id v79 = (void *)v77;
                __int16 v181 = 2080;
                v182 = v78;
                __int16 v183 = 2112;
                id v184 = v154;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEBUG,  "Spatial found check token: SRC <%@>, IRK %@, Hash <%@>, match %s, %@",  buf,  0x34u);

                self = v145;
              }

              goto LABEL_69;
            }

            if (dword_1008D6630 <= 10
              && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 10LL)))
            {
              uint64_t v65 = CUPrintHex(&v187, 9LL, 32LL, 0LL);
              id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
              uint64_t v66 = CUPrintNSObjectMasked(v146);
              int v148 = v55;
              uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
              uint64_t v68 = CUPrintHex(&v186, 3LL, 32LL, 0LL);
              uint64_t v69 = objc_claimAutoreleasedReturnValue(v68);
              id v70 = (void *)v69;
              id v71 = "no";
              if (!v62) {
                id v71 = "yes";
              }
              LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]",  10LL,  "Spatial found check token: SRC <%@>, IRK %@, Hash <%@>, match %s, %@",  v64,  v67,  v69,  v71,  v154);

              self = v145;
              int v55 = v148;
LABEL_69:
            }

            if (!v62)
            {
              objc_msgSend(v154, "setSpatialInteractionPeerID:", objc_msgSend(v151, "peerID"));
              int v55 = 1;
              char obja = 1;
            }
          }

          objc_autoreleasePoolPop(v59);
          id v56 = (char *)v56 + 1;
          id v47 = v57;
        }

        while (v53 != v56);
        id v80 = [v156 countByEnumeratingWithState:&v162 objects:v185 count:16];
        id v53 = v80;
      }

      while (v80);
LABEL_86:
      int v147 = v55;

      __int128 v37 = v138;
      unsigned __int8 v6 = v139;
      uint64_t v39 = v136;
      __int128 v38 = v137;
LABEL_87:

LABEL_88:
      objc_autoreleasePoolPop(context);
      uint64_t v40 = v143 + 1;
    }

    while ((id)(v143 + 1) != v141);
    id v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v166,  v189,  16LL);
  }

  while (v141);
LABEL_92:

  id v81 = v6;
  char v82 = obja;
  if (v133) {
    goto LABEL_148;
  }
  if ((v147 & 1) == 0)
  {
    uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_spatialDeviceMapMatched,  "objectForKeyedSubscript:",  v134));
    if (v102)
    {
      -[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:]( self,  "_spatialInteractionDeviceLost:removeUnmatched:reason:",  v102,  0LL,  "no match");
    }

    else
    {
      spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      if (!spatialDeviceMapUnmatched)
      {
        v115 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v116 = self->_spatialDeviceMapUnmatched;
        self->_spatialDeviceMapUnmatched = v115;

        spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( spatialDeviceMapUnmatched,  "setObject:forKeyedSubscript:",  v154,  v134);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_spatialDeviceMapMatched,  "setObject:forKeyedSubscript:",  0LL,  v134);
      if (self->_isHomePod)
      {
        id v117 = sub_100064028();
        v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
        char v82 = obja;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG)) {
          sub_100657718((uint64_t)v154, v118, v119, v120, v121, v122, v123, v124);
        }
      }

      else
      {
        char v82 = obja;
        if (dword_1008D6630 <= 30
          && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
        {
          LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]",  30LL,  "Spatial found no match device: %@",  v154);
        }
      }
    }

    goto LABEL_140;
  }

  id v83 = v154;
  __int128 v158 = 0u;
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v161 = 0u;
  id v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapMatched, "allValues"));
  id v85 = [v84 countByEnumeratingWithState:&v158 objects:v174 count:16];
  if (!v85)
  {

    __int128 v37 = v138;
    id v81 = v139;
    goto LABEL_118;
  }

  id v86 = v85;
  uint64_t v87 = *(void *)v159;
  id v157 = v83;
  while (2)
  {
    uint64_t v88 = 0LL;
    while (2)
    {
      if (*(void *)v159 != v87) {
        objc_enumerationMutation(v84);
      }
      id v89 = *(void **)(*((void *)&v158 + 1) + 8 * v88);
      id v90 = objc_autoreleasePoolPush();
      unsigned int v91 = [v89 spatialInteractionPeerID];
      if (v91 == [v83 spatialInteractionPeerID])
      {
        id v92 = (void *)objc_claimAutoreleasedReturnValue([v89 idsDeviceID]);
        id v93 = (void *)objc_claimAutoreleasedReturnValue([v83 idsDeviceID]);
        id v94 = v92;
        id v95 = v93;
        if (v94 != v95)
        {
          id v96 = v95;
          if ((v94 == 0LL) == (v95 != 0LL))
          {
          }

          else
          {
            unsigned __int8 v97 = [v94 isEqual:v95];

            self = v145;
            if ((v97 & 1) == 0) {
              goto LABEL_111;
            }
LABEL_105:
            id v98 = [v89 lastSeenTicks];
            if (v98 > [v83 lastSeenTicks])
            {
              id v99 = v89;

              id v157 = v99;
              goto LABEL_111;
            }

            id v100 = (void *)objc_claimAutoreleasedReturnValue([v89 identifier]);
            unsigned __int8 v101 = [v100 isEqual:v134];

            if ((v101 & 1) == 0)
            {
              self = v145;
              -[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:]( v145,  "_spatialInteractionDeviceLost:removeUnmatched:reason:",  v89,  1LL,  "replaced matched");
              goto LABEL_111;
            }
          }

          self = v145;
          goto LABEL_111;
        }

        self = v145;
        goto LABEL_105;
      }

- (void)_spatialInteractionDeviceLost:(id)a3 removeUnmatched:(BOOL)a4 reason:(const char *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v9)
  {
    char v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_spatialDeviceMapMatched,  "objectForKeyedSubscript:",  v9));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_spatialDeviceMapMatched,  "setObject:forKeyedSubscript:",  0LL,  v9);
    if (a4)
    {
      id v11 = -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_spatialDeviceMapUnmatched,  "setObject:forKeyedSubscript:",  0LL,  v9);
      if (!v10) {
        goto LABEL_22;
      }
    }

    else
    {
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }

      spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      if (!spatialDeviceMapUnmatched)
      {
        unsigned __int8 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unsigned int v15 = self->_spatialDeviceMapUnmatched;
        self->_spatialDeviceMapUnmatched = v14;

        spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      }

      id v11 = -[NSMutableDictionary setObject:forKeyedSubscript:]( spatialDeviceMapUnmatched,  "setObject:forKeyedSubscript:",  v10,  v9);
    }

    if (self->_isHomePod)
    {
      id v16 = sub_100064028();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10065777C((uint64_t)v8, (uint64_t)a5, v17);
      }
    }

    else if (dword_1008D6630 <= 30)
    {
      if (dword_1008D6630 != -1 || (id v11 = (id)_LogCategory_Initialize(&dword_1008D6630, 30LL), (_DWORD)v11)) {
        id v11 = (id)LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:]",  30LL,  "Spatial lost device: %@ (%s)",  v8,  a5);
      }
    }

    if (IsAppleInternalBuild(v11, v12))
    {
      id v18 = objc_autoreleasePoolPush();
      -[CBDaemonXPCConnection _updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:device:]( self,  "_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:device:",  8LL,  v8);
      objc_autoreleasePoolPop(v18);
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue( -[CBSpatialInteractionSession deviceLostHandler]( self->_activatedSpatialInteractionSession,  "deviceLostHandler"));
    uint64_t v20 = (void *)v19;
    if (v19) {
      (*(void (**)(uint64_t, id))(v19 + 16))(v19, v8);
    }

    goto LABEL_22;
  }

- (void)_spatialInteractionReevaluateDevices
{
  if (dword_1008D6630 <= 30 && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL))) {
    LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _spatialInteractionReevaluateDevices]",  30LL,  "Spatial re-evaluate devices: %d matched, %d unmatched",  -[NSMutableDictionary count](self->_spatialDeviceMapMatched, "count"),  -[NSMutableDictionary count](self->_spatialDeviceMapUnmatched, "count"));
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapMatched, "allValues"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapUnmatched, "allValues"));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v46;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
        id v11 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]( self,  "_spatialInteractionDeviceFound:checkOnly:",  v10,  1LL);
        objc_autoreleasePoolPop(v11);
      }

      id v7 = [v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }

    while (v7);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)j);
        id v18 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]( self,  "_spatialInteractionDeviceFound:checkOnly:",  v17,  1LL);
        objc_autoreleasePoolPop(v18);
      }

      id v14 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }

    while (v14);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v19 = v5;
  id v20 = [v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (k = 0LL; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)k);
        uint64_t v25 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]( self,  "_spatialInteractionDeviceFound:checkOnly:",  v24,  0LL);
        objc_autoreleasePoolPop(v25);
      }

      id v21 = [v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }

    while (v21);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v26 = v12;
  id v27 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (m = 0LL; m != v28; m = (char *)m + 1)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)m);
        id v32 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]( self,  "_spatialInteractionDeviceFound:checkOnly:",  v31,  0LL);
        objc_autoreleasePoolPop(v32);
      }

      id v28 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }

    while (v28);
  }
}

- (id)_spatialInteractionDecodePeerTokenRequest:(id)a3 error:(id *)a4
{
  id v20 = 0LL;
  if (!v20)
  {
    if (a4)
    {
      uint64_t v13 = CBErrorF(312900LL, "No token data");
      id v11 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
      goto LABEL_9;
    }

- (void)_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:(unsigned __int8)a3 device:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  unsigned int v7 = -[CBSpatialInteractionSession clientID](self->_activatedSpatialInteractionSession, "clientID");
  if (v4 && v6 && v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

    if (v10)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100064890;
      block[3] = &unk_100880B08;
      block[4] = self;
      id v13 = v10;
      char v14 = v4;
      dispatch_async(dispatchQueue, block);
    }
  }
}

- (void)_xpcAdvertisingAddressChanged
{
  id xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(xdict, "mTyp", "AdAC");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectableAddressData]);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v7 = xdict;
    uint64_t v8 = (const char *)[v6 bytes];
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = "";
    }
    xpc_dictionary_set_data(v7, "aaCN", v9, (size_t)[v6 length]);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nonConnectableAddressData]);
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    id v14 = xdict;
    uint64_t v15 = (const char *)[v13 bytes];
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = "";
    }
    xpc_dictionary_set_data(v14, "aaNC", v16, (size_t)[v13 length]);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nonConnectableSecondaryAddressData]);
  unsigned int v19 = v18;
  if (v18)
  {
    id v20 = v18;
    id v21 = xdict;
    uint64_t v22 = (const char *)[v20 bytes];
    if (v22) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = "";
    }
    xpc_dictionary_set_data(v21, "aaNC2", v23, (size_t)[v20 length]);
  }

  if (-[CBDaemonServer supportsNCSecondaryAdvertisingInstance](self->_daemon, "supportsNCSecondaryAdvertisingInstance")) {
    xpc_dictionary_set_BOOL(xdict, "aaUNC2", 1);
  }
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);
}

- (void)_xpcDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "mTyp", "DvFo");
  [v4 encodeWithXPCObject:v5];

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_xpcDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "mTyp", "DvLo");
  [v4 encodeWithXPCObject:v5];

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_xpcDevicesBuffered:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "mTyp", "DsBf");
  CUXPCEncodeNSArrayOfObjects(v5, "devA", v4);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_xpcDiscoverableStateChanged:(int)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(xdict, "mTyp", "DscC");
  xpc_dictionary_set_int64(xdict, "dsSt", a3);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);
}

- (void)_xpcInquiryStateChanged:(int)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(xdict, "mTyp", "InqC");
  xpc_dictionary_set_int64(xdict, "inqS", a3);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);
}

- (void)_xpcPowerStateChanged:(int64_t)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(xdict, "mTyp", "PwrC");
  xpc_dictionary_set_int64(xdict, "pwrS", a3);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);
}

- (void)xpcReceivedAudioAccessoryEventType:(unsigned __int8)a3 messageData:(id)a4 sourceDevice:(id)a5
{
  unsigned int v6 = a3;
  id v16 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v9, "mTyp", "AcRc");
  if (v6) {
    xpc_dictionary_set_uint64(v9, "acET", v6);
  }
  if (v16)
  {
    id v10 = v16;
    id v11 = v9;
    id v12 = v10;
    id v13 = (const char *)[v12 bytes];
    if (v13) {
      id v14 = v13;
    }
    else {
      id v14 = "";
    }
    id v15 = [v12 length];

    xpc_dictionary_set_data(v11, "acMd", v14, (size_t)v15);
  }

  CUXPCEncodeObject(v9, "srcD", v8, 0LL);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v9);
}

- (void)xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(xdict, "mTyp", "AcIC");
  xpc_dictionary_set_value(xdict, "aaID", v5);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);
}

- (void)_xpcReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6
{
  unsigned int v8 = a3;
  id v19 = a4;
  id v10 = a5;
  id v11 = a6;
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v12, "mTyp", "RlMR");
  if (v8) {
    xpc_dictionary_set_uint64(v12, "rlMT", v8);
  }
  if (v19)
  {
    id v13 = v19;
    id v14 = v12;
    id v15 = v13;
    id v16 = (const char *)[v15 bytes];
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = "";
    }
    id v18 = [v15 length];

    xpc_dictionary_set_data(v14, "rlMD", v17, (size_t)v18);
  }

  CUXPCEncodeObject(v12, "cduD", v10, 0LL);
  CUXPCEncodeObject(v12, "srcD", v11, 0LL);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v12);
}

- (void)_xpcSpatialInteractionAOPDataReceived:(id)a3
{
  id v11 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "mTyp", "SpAD");
  if (v11)
  {
    id v5 = v11;
    id v6 = v4;
    id v7 = v5;
    unsigned int v8 = (const char *)[v7 bytes];
    if (v8) {
      xpc_object_t v9 = v8;
    }
    else {
      xpc_object_t v9 = "";
    }
    id v10 = [v7 length];

    xpc_dictionary_set_data(v6, "siAD", v9, (size_t)v10);
  }

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v4);
}

- (void)_xpcSystemOverrideChanged
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(xdict, "mTyp", "SyOC");
  xpc_dictionary_set_int64( xdict,  "scRO",  (int)-[CBDiscovery bleScanRateOverride](self->_activatedDiscovery, "bleScanRateOverride"));
  xpc_dictionary_set_uint64( xdict,  "syOF",  -[CBDiscovery systemOverrideFlags](self->_activatedDiscovery, "systemOverrideFlags"));
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);
}

- (void)_xpcTipiChanged:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "mTyp", "TpiC");
  CUXPCEncodeObject(v5, "devi", v4, 0LL);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_setupWHBTimer
{
  if (!self->_activatedDiscoveryWHB)
  {
    p_whbTimer = &self->_whbTimer;
    id v4 = self->_whbTimer;
    if (!v4)
    {
      dispatch_source_t v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)p_whbTimer, v5);
      unsigned int v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472LL;
      id v10 = sub_1000655D0;
      id v11 = &unk_10087EFC8;
      id v4 = v5;
      xpc_object_t v12 = v4;
      id v13 = self;
      dispatch_source_set_event_handler((dispatch_source_t)v4, &v8);
      CUDispatchTimerSet(self->_whbTimer, 5.0, -1.0, 1.0);
      dispatch_activate((dispatch_object_t)self->_whbTimer);
      if (dword_1008D6630 <= 30
        && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _setupWHBTimer]",  30LL,  "WHBTimer successfully setup",  v8,  v9,  v10,  v11);
      }
    }

    if (!self->_whbLostDevicesMap)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      whbLostDevicesMap = self->_whbLostDevicesMap;
      self->_whbLostDevicesMap = v6;
    }
  }

- (void)_whbTimerFired
{
  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    id v18 = activatedDiscovery;
  }

  else
  {
    id v18 = self->_activatedDiscoveryWHB;
    if (!v18) {
      return;
    }
  }

  uint64_t v4 = mach_absolute_time();
  uint64_t v5 = UpTicksToSeconds(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_whbLostDevicesMap, "allKeys"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v19 + 1) + 8LL * (void)i);
        xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_whbLostDevicesMap,  "objectForKeyedSubscript:",  v11));
        id v13 = v12;
        if (v12 && (unint64_t)(v5 - (void)[v12 unsignedLongLongValue]) >= 0x2D)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceMap,  "objectForKeyedSubscript:",  v11));
          if (v14)
          {
            if (dword_1008D6630 <= 30
              && (dword_1008D6630 != -1 || _LogCategory_Initialize(&dword_1008D6630, 30LL)))
            {
              LogPrintF_safe( &dword_1008D6630,  "-[CBDaemonXPCConnection _whbTimerFired]",  30LL,  "WHB lost timer expired for device: %@. Marked as lost",  v14);
            }

            uint64_t v15 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceLostHandler](v18, "deviceLostHandler"));
            id v16 = (void *)v15;
            if (v15) {
              (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v14);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceMap,  "setObject:forKeyedSubscript:",  0LL,  v11);
          }

          -[NSMutableDictionary removeObjectForKey:](self->_whbLostDevicesMap, "removeObjectForKey:", v11);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  whbTimer = self->_whbTimer;
  if (whbTimer) {
    CUDispatchTimerSet(whbTimer, 5.0, -1.0, 1.0);
  }
}

- (void)whbStop
{
  whbTimer = self->_whbTimer;
  if (whbTimer)
  {
    uint64_t v5 = whbTimer;
    dispatch_source_cancel(v5);
    uint64_t v4 = self->_whbTimer;
    self->_whbTimer = 0LL;
  }

- (CBAdvertiser)activatedAdvertiser
{
  return self->_activatedAdvertiser;
}

- (void)setActivatedAdvertiser:(id)a3
{
}

- (CBConnection)activatedConnection
{
  return self->_activatedConnection;
}

- (void)setActivatedConnection:(id)a3
{
}

- (CBController)activatedController
{
  return self->_activatedController;
}

- (void)setActivatedController:(id)a3
{
}

- (CBDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (void)setActivatedDiscovery:(id)a3
{
}

- (CBDiscovery)activatedDiscoveryWHB
{
  return self->_activatedDiscoveryWHB;
}

- (void)setActivatedDiscoveryWHB:(id)a3
{
}

- (CBSpatialInteractionSession)activatedSpatialInteractionSession
{
  return self->_activatedSpatialInteractionSession;
}

- (void)setActivatedSpatialInteractionSession:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
}

- (CBDaemonServer)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)remoteAccepted
{
  return self->_remoteAccepted;
}

- (void)setRemoteAccepted:(BOOL)a3
{
  self->_BOOL remoteAccepted = a3;
}

- (RPCompanionLinkClient)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
}

- (NSNumber)remoteClientID
{
  return self->_remoteClientID;
}

- (void)setRemoteClientID:(id)a3
{
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (unint64_t)xpcToken
{
  return self->_xpcToken;
}

- (void)setXpcToken:(unint64_t)a3
{
  self->_unint64_t xpcToken = a3;
}

- (void).cxx_destruct
{
}

@end