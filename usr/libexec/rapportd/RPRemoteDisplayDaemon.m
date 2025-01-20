@interface RPRemoteDisplayDaemon
- (BOOL)_clientBLEDiscoveryShouldRun;
- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun;
- (BOOL)_clientBLENeedsAWDLAdvertiserShouldRun;
- (BOOL)_clientBonjourAWDLBrowserShouldRun;
- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4;
- (BOOL)_deviceSupportsLaguna:(id)a3;
- (BOOL)_discoveriCloudDevicesOnly;
- (BOOL)_needToHoldPowerAssertion;
- (BOOL)_onenessEnabled;
- (BOOL)_serverBLEDiscoveryShouldStart;
- (BOOL)_serverBLENearbyActionV2DiscoveryShouldRun;
- (BOOL)_serverBLENeedsAWDLScannerScreenOff;
- (BOOL)_serverBonjourAWDLNeeded;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (NSString)deviceConfirmedIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (RPRemoteDisplayDaemon)init;
- (RPRemoteDisplayDevice)dedicatedDevice;
- (id)_acquireRBSAssertionForEntry:(id)a3 error:(id *)a4;
- (id)_findMatchingDeviceWithIdentifier:(id)a3;
- (id)_getAliasesForAltDSIDs;
- (id)_getAltDSIDForDevice:(id)a3;
- (id)_serverBonjourAuthTagString;
- (id)_serverBonjourAuthTagStringWithData:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)_serverDirectLinkInterfaceIndex;
- (void)_activate;
- (void)_bleDiscoveryEnsureStarted:(BOOL)a3;
- (void)_bleDiscoveryEnsureStopped;
- (void)_bleDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4;
- (void)_bluetoothUseCaseFromWombatState:(unsigned int)a3 resultBlock:(id)a4;
- (void)_btAddressChanged;
- (void)_btAddressMonitorEnsureStarted;
- (void)_btAddressMonitorEnsureStopped;
- (void)_changeDiscoverySessionStateForDevice:(id)a3 startReason:(unsigned __int8)a4;
- (void)_clearConfirmationClientCache;
- (void)_clientAWDLPairingSessionWithDevice:(id)a3;
- (void)_clientBLEDiscoveryDeviceFound:(id)a3;
- (void)_clientBLEDiscoveryDeviceLost:(id)a3;
- (void)_clientBLEDiscoveryEnsureStarted;
- (void)_clientBLEDiscoveryEnsureStopped;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted;
- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped;
- (void)_clientBLENearbyActionV2AdvertiserUpdate;
- (void)_clientBLENeedsAWDLAdvertiserEnsureStarted;
- (void)_clientBLENeedsAWDLAdvertiserEnsureStopped;
- (void)_clientBonjourAWDLBrowserEnsureStarted;
- (void)_clientBonjourAWDLBrowserEnsureStopped;
- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3;
- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3;
- (void)_clientBonjourEnsureStarted;
- (void)_clientBonjourEnsureStopped;
- (void)_clientBonjourFoundUnresolvedDevice:(id)a3;
- (void)_clientBonjourLostDevice:(id)a3;
- (void)_clientBonjourLostUnresolvedDevice:(id)a3;
- (void)_clientBonjourReconfirmDevice:(id)a3 reason:(const char *)a4;
- (void)_clientBonjourReevaluateDevices;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_clientLostAllDevices;
- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3;
- (void)_connectionConfigureCommon:(id)a3;
- (void)_deliverBufferedConnectionsToServer:(id)a3;
- (void)_handleConfirmationResult:(id)a3 fromDevice:(id)a4;
- (void)_handleServerActivation:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_localDeviceUpdate;
- (void)_postNotificationForWombatActivity:(unsigned int)a3;
- (void)_powerAssertionEnsureHeld;
- (void)_powerAssertionEnsureReleased;
- (void)_processDiscoverySessionStateChangeForDevice:(id)a3 startReason:(unsigned __int8)a4;
- (void)_processPendingLostDevices;
- (void)_receivedCameraCapabilitiesMessage:(id)a3 fromDevice:(id)a4 isFirstUpdate:(BOOL)a5;
- (void)_receivedCameraExitEvent:(id)a3 from:(id)a4;
- (void)_registerForIncomingMessages;
- (void)_registerForWombatStateNotifications;
- (void)_requestCameraCapabilitiesForDevice:(id)a3;
- (void)_requestConfirmationFromDevice:(id)a3 forDedicated:(BOOL)a4;
- (void)_requestConfirmationFromDevicesMatching:(id)a3 forDedicated:(BOOL)a4;
- (void)_requestConfirmationFromPerson:(id)a3 forDedicated:(BOOL)a4;
- (void)_scheduleCameraCapabilitiesRequest:(id)a3 interval:(unint64_t)prefCameraCapabilitiesRetrySeconds;
- (void)_schedulePendingLostDeviceTimer;
- (void)_sendConfirmationCancelToAllDevices;
- (void)_sendDiscoverySessionExitWithReason:(id)a3;
- (void)_serverBLEDiscoveryEnsureStarted;
- (void)_serverBLEDiscoveryEnsureStopped;
- (void)_serverBLENearbyActionV2DiscoveryEnsureStarted;
- (void)_serverBLENearbyActionV2DiscoveryEnsureStopped;
- (void)_serverBLENeedsAWDLScannerDeviceFound:(id)a3;
- (void)_serverBLENeedsAWDLScannerDeviceLost:(id)a3;
- (void)_serverBLENeedsAWDLScannerEnsureStarted;
- (void)_serverBLENeedsAWDLScannerEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserEnsureStarted;
- (void)_serverBonjourAWDLAdvertiserEnsureStopped;
- (void)_serverBonjourAWDLAdvertiserUpdateTXT;
- (void)_serverBonjourEnsureStarted;
- (void)_serverBonjourEnsureStopped;
- (void)_serverBonjourUpdateTXT;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_serverHandleSessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5;
- (void)_serverProximityGetDeviceIdentifiers;
- (void)_serverReceivedNeedsAWDLEvent:(id)a3;
- (void)_serverRegisterForIncomingMessages;
- (void)_serverTCPEnsureStarted;
- (void)_serverTCPEnsureStopped;
- (void)_serverTCPHandleConnectionStarted:(id)a3;
- (void)_startDiscoverySessionExpirationTimer;
- (void)_startInSessionDeviceLostTimer;
- (void)_startObservingOnenessEnabledState;
- (void)_startPairingServerWithPassword:(id)a3 completion:(id)a4;
- (void)_stopObservingOnenessEnabledState;
- (void)_stopPairingServer;
- (void)_unregisterWombatStateNotifications;
- (void)_update;
- (void)_updateForXPCClientChange;
- (void)_updateXPCMatchingDiscovery;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)addNeedsAWDLPeer:(id)a3;
- (void)daemonInfoChanged:(unint64_t)a3;
- (void)invalidate;
- (void)prefsChanged;
- (void)saveDedicatedDevice:(id)a3;
- (void)setDeviceConfirmedIdentifier:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPRemoteDisplayDaemon

- (RPRemoteDisplayDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPRemoteDisplayDaemon;
  v2 = -[RPRemoteDisplayDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    *(void *)&v3->_wombatStateReadyToken = 0xFFFFFFFFLL;
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 < 21)
  {
    uint64_t v6 = *(void *)&a3;
    uint64_t v225 = 0LL;
    v226 = &v225;
    uint64_t v227 = 0x3032000000LL;
    v228 = sub_1000940FC;
    v229 = sub_10009410C;
    id v230 = 0LL;
    id obj = 0LL;
    NSAppendPrintF(&obj, "-- RPRemoteDisplayDaemon --\n");
    objc_storeStrong(&v230, obj);
    else {
      int v7 = 30;
    }
    unsigned int v160 = v7;
    v8 = self->_systemMonitor;
    v9 = v8;
    if (v8)
    {
      v10 = (id *)(v226 + 5);
      id v223 = (id)v226[5];
      unsigned int v11 = -[CUSystemMonitor firstUnlocked](v8, "firstUnlocked");
      v12 = "no";
      if (v11) {
        v12 = "yes";
      }
      NSAppendPrintF(&v223, "Self: First unlocked: %s\n", v12);
      objc_storeStrong(v10, v223);
    }

    v13 = self->_bleDiscovery;
    v14 = v13;
    if (v13)
    {
      v15 = (id *)(v226 + 5);
      id v222 = (id)v226[5];
      uint64_t v16 = CUDescriptionWithLevel(v13, v160);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      NSAppendPrintF(&v222, "%@\n", v17);
      objc_storeStrong(v15, v222);
    }

    v18 = self->_bleNearbyActionV2Advertiser;
    v19 = v18;
    if (v18)
    {
      v20 = (id *)(v226 + 5);
      id v221 = (id)v226[5];
      NSAppendPrintF(&v221, "%@\n", v18);
      objc_storeStrong(v20, v221);
    }

    v21 = self->_bleNearbyActionV2AdvertiserProcessName;
    v22 = v21;
    if (v21)
    {
      v23 = (id *)(v226 + 5);
      id v220 = (id)v226[5];
      NSAppendPrintF(&v220, "NearbyActionV2 Adv Process: %@\n", v21);
      objc_storeStrong(v23, v220);
    }

    v24 = self->_bleNearbyActionV2Discovery;
    v25 = v24;
    if (v24)
    {
      v26 = (id *)(v226 + 5);
      id v219 = (id)v226[5];
      NSAppendPrintF(&v219, "%@\n", v24);
      objc_storeStrong(v26, v219);
    }

    v27 = self->_bleNeedsAWDLAdvertiser;
    v28 = v27;
    if (v27)
    {
      v29 = (id *)(v226 + 5);
      id v218 = (id)v226[5];
      uint64_t v30 = CUDescriptionWithLevel(v27, v160);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      NSAppendPrintF(&v218, "%@\n", v31);
      objc_storeStrong(v29, v218);
    }

    v32 = self->_bleNeedsAWDLAdvertiserProcessName;
    v33 = v32;
    if (v32)
    {
      v34 = (id *)(v226 + 5);
      id v217 = (id)v226[5];
      NSAppendPrintF(&v217, "NeedsAWDL Adv Process: %@\n", v32);
      objc_storeStrong(v34, v217);
    }

    v35 = self->_bleNeedsAWDLScanner;
    v36 = v35;
    if (v35)
    {
      v37 = (id *)(v226 + 5);
      id v216 = (id)v226[5];
      uint64_t v38 = CUDescriptionWithLevel(v35, v160);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      NSAppendPrintF(&v216, "%@\n", v39);
      objc_storeStrong(v37, v216);
    }

    v40 = self->_bonjourAdvertiser;
    v41 = v40;
    if (v40)
    {
      v42 = (id *)(v226 + 5);
      id v215 = (id)v226[5];
      uint64_t v43 = CUDescriptionWithLevel(v40, v160);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      NSAppendPrintF(&v215, "%@\n", v44);
      objc_storeStrong(v42, v215);
    }

    v45 = self->_bonjourAWDLAdvertiser;
    v46 = v45;
    if (v45)
    {
      v47 = (id *)(v226 + 5);
      id v214 = (id)v226[5];
      uint64_t v48 = CUDescriptionWithLevel(v45, v160);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      NSAppendPrintF(&v214, "%@\n", v49);
      objc_storeStrong(v47, v214);
    }

    if (self->_bonjourAWDLAdvertiserForce)
    {
      v50 = (id *)(v226 + 5);
      id v213 = (id)v226[5];
      NSAppendPrintF(&v213, "Force AWDL Advertiser\n");
      objc_storeStrong(v50, v213);
    }

    v51 = self->_bonjourBrowser;
    v52 = v51;
    if (v51)
    {
      v53 = (id *)(v226 + 5);
      id v212 = (id)v226[5];
      uint64_t v54 = CUDescriptionWithLevel(v51, v6);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      NSAppendPrintF(&v212, "%@", v55);
      objc_storeStrong(v53, v212);
    }

    v56 = self->_bonjourBrowserAWDL;
    v57 = v56;
    if (v56)
    {
      v58 = (id *)(v226 + 5);
      id v211 = (id)v226[5];
      uint64_t v59 = CUDescriptionWithLevel(v56, v6);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      NSAppendPrintF(&v211, "%@", v60);
      objc_storeStrong(v58, v211);
    }

    if (self->_bonjourBrowserAWDLForce)
    {
      v61 = (id *)(v226 + 5);
      id v210 = (id)v226[5];
      NSAppendPrintF(&v210, "Force AWDL Browser\n");
      objc_storeStrong(v61, v210);
    }

    v62 = self->_bonjourBrowserAWDLProcess;
    v63 = v62;
    if (v62)
    {
      v64 = (id *)(v226 + 5);
      id v209 = (id)v226[5];
      NSAppendPrintF(&v209, "AWDL Browser Processes: %@\n", v62);
      objc_storeStrong(v64, v209);
    }

    v65 = self->_tcpServer;
    v66 = v65;
    if (v65)
    {
      v67 = (id *)(v226 + 5);
      id v208 = (id)v226[5];
      v68 = v65;
      if ((objc_opt_respondsToSelector(v68, "detailedDescription") & 1) != 0)
      {
        uint64_t v69 = objc_claimAutoreleasedReturnValue(-[CUTCPServer detailedDescription](v68, "detailedDescription"));
      }

      else if ((objc_opt_respondsToSelector(v68, "descriptionWithLevel:") & 1) != 0)
      {
        uint64_t v69 = objc_claimAutoreleasedReturnValue(-[CUTCPServer descriptionWithLevel:](v68, "descriptionWithLevel:", 20LL));
      }

      else
      {
        uint64_t v70 = NSPrintF("%@\n", v68);
        uint64_t v69 = objc_claimAutoreleasedReturnValue(v70);
      }

      v71 = (void *)v69;

      NSAppendPrintF(&v208, "%@", v71);
      objc_storeStrong(v67, v208);
    }

    v72 = self->_deviceConfirmedIdentifier;
    if (v72)
    {
      v73 = (id *)(v226 + 5);
      id v207 = (id)v226[5];
      NSAppendPrintF(&v207, "Device in session %@\n", self->_deviceConfirmedIdentifier);
      objc_storeStrong(v73, v207);
    }

    v74 = self->_deviceSessionPaired;
    if (v74)
    {
      v75 = (id *)(v226 + 5);
      id v206 = (id)v226[5];
      NSAppendPrintF(&v206, "GuestPairing %@\n", self->_deviceSessionPaired);
      objc_storeStrong(v75, v206);
    }

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
    v77 = v76;
    if (v76)
    {
      v78 = (id *)(v226 + 5);
      id v205 = (id)v226[5];
      id v79 = v76;
      if ((objc_opt_respondsToSelector(v79, "detailedDescription") & 1) != 0)
      {
        uint64_t v80 = objc_claimAutoreleasedReturnValue([v79 detailedDescription]);
      }

      else if ((objc_opt_respondsToSelector(v79, "descriptionWithLevel:") & 1) != 0)
      {
        uint64_t v80 = objc_claimAutoreleasedReturnValue([v79 descriptionWithLevel:20]);
      }

      else
      {
        uint64_t v81 = NSPrintF("%@\n", v79);
        uint64_t v80 = objc_claimAutoreleasedReturnValue(v81);
      }

      v82 = (void *)v80;

      NSAppendPrintF(&v205, "Dedicated device %@\n", v82);
      objc_storeStrong(v78, v205);
    }

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activatedServerXPCCnxMap, "allValues"));
    id v84 = [v83 count];
    if (v84)
    {
      v85 = (id *)(v226 + 5);
      id v204 = (id)v226[5];
      NSAppendPrintF(&v204, "%d Server XPC connections are active\n", (_DWORD)v84);
      objc_storeStrong(v85, v204);
    }

    __int128 v202 = 0u;
    __int128 v203 = 0u;
    __int128 v200 = 0u;
    __int128 v201 = 0u;
    id v159 = v83;
    id v86 = [v159 countByEnumeratingWithState:&v200 objects:v234 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v201;
      do
      {
        for (i = 0LL; i != v86; i = (char *)i + 1)
        {
          if (*(void *)v201 != v87) {
            objc_enumerationMutation(v159);
          }
          uint64_t v89 = *(void *)(*((void *)&v200 + 1) + 8LL * (void)i);
          v90 = (id *)(v226 + 5);
          id v199 = (id)v226[5];
          uint64_t v91 = CUDescriptionWithLevel(v89, v160);
          v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
          NSAppendPrintF(&v199, "Server: %@ \n", v92);
          objc_storeStrong(v90, v199);
        }

        id v86 = [v159 countByEnumeratingWithState:&v200 objects:v234 count:16];
      }

      while (v86);
    }

    id v93 = -[NSMutableSet count](self->_bufferedConnections, "count");
    if (v93)
    {
      v94 = (id *)(v226 + 5);
      id v198 = (id)v226[5];
      NSAppendPrintF(&v198, "%d RemoteDisplay buffered connection(s)\n", (_DWORD)v93);
      objc_storeStrong(v94, v198);
    }

    __int128 v196 = 0u;
    __int128 v197 = 0u;
    __int128 v194 = 0u;
    __int128 v195 = 0u;
    v95 = self->_bufferedConnections;
    id v96 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v95,  "countByEnumeratingWithState:objects:count:",  &v194,  v233,  16LL);
    if (v96)
    {
      uint64_t v97 = *(void *)v195;
      do
      {
        for (j = 0LL; j != v96; j = (char *)j + 1)
        {
          if (*(void *)v195 != v97) {
            objc_enumerationMutation(v95);
          }
          uint64_t v99 = *(void *)(*((void *)&v194 + 1) + 8LL * (void)j);
          v100 = (id *)(v226 + 5);
          id v193 = (id)v226[5];
          uint64_t v101 = CUDescriptionWithLevel(v99, 30LL);
          v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
          NSAppendPrintF(&v193, "    %@\n", v102);
          objc_storeStrong(v100, v193);
        }

        id v96 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v95,  "countByEnumeratingWithState:objects:count:",  &v194,  v233,  16LL);
      }

      while (v96);
    }

    id v103 = -[NSMutableDictionary count](self->_tcpServerConnections, "count");
    if (v103)
    {
      v104 = (id *)(v226 + 5);
      id v192 = (id)v226[5];
      NSAppendPrintF(&v192, "%d RemoteDisplay server connection(s)\n", (_DWORD)v103);
      objc_storeStrong(v104, v192);
    }

    tcpServerConnections = self->_tcpServerConnections;
    v190[0] = _NSConcreteStackBlock;
    v190[1] = 3221225472LL;
    v190[2] = sub_100094114;
    v190[3] = &unk_100114818;
    v190[4] = &v225;
    unsigned int v191 = v160;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpServerConnections,  "enumerateKeysAndObjectsUsingBlock:",  v190);
    unint64_t v106 = (unint64_t)-[NSMutableDictionary count](self->_discoveredDevices, "count");
    unint64_t v107 = (unint64_t)-[NSMutableDictionary count](self->_unresolvedDevices, "count");
    if (v106 | v107)
    {
      v108 = (id *)(v226 + 5);
      id v189 = (id)v226[5];
      NSAppendPrintF(&v189, "%d resolved device(s), %d unresolved\n", v106, v107);
      objc_storeStrong(v108, v189);
    }

    discoveredDevices = self->_discoveredDevices;
    v187[0] = _NSConcreteStackBlock;
    v187[1] = 3221225472LL;
    v187[2] = sub_10009417C;
    v187[3] = &unk_100114840;
    v187[4] = &v225;
    unsigned int v188 = v160;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveredDevices,  "enumerateKeysAndObjectsUsingBlock:",  v187);
    id v110 = -[NSMutableDictionary count](self->_needsAWDLDevices, "count");
    if (v110)
    {
      v111 = (id *)(v226 + 5);
      id v186 = (id)v226[5];
      NSAppendPrintF(&v186, "NeedsAWDL device (%d)\n", (_DWORD)v110);
      objc_storeStrong(v111, v186);
    }

    v184[0] = 0LL;
    v184[1] = v184;
    v184[2] = 0x2020000000LL;
    int v185 = 0;
    needsAWDLDevices = self->_needsAWDLDevices;
    v182[0] = _NSConcreteStackBlock;
    v182[1] = 3221225472LL;
    v182[2] = sub_100094200;
    v182[3] = &unk_100114868;
    unsigned int v183 = v160;
    v182[4] = &v225;
    v182[5] = v184;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( needsAWDLDevices,  "enumerateKeysAndObjectsUsingBlock:",  v182);
    if (-[NSMutableSet count](self->_xpcConnections, "count")
      || -[NSMutableDictionary count](self->_xpcMatchingDiscoveryMap, "count")
      || -[NSMutableDictionary count](self->_xpcMatchingServerMap, "count"))
    {
      v113 = (id *)(v226 + 5);
      id v181 = (id)v226[5];
      NSAppendPrintF( &v181,  "XPC Matching Discovery: %d \n",  -[NSMutableDictionary count](self->_xpcMatchingDiscoveryMap, "count"));
      objc_storeStrong(v113, v181);
      xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      v180[0] = _NSConcreteStackBlock;
      v180[1] = 3221225472LL;
      v180[2] = sub_1000942F0;
      v180[3] = &unk_100111578;
      v180[4] = &v225;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( xpcMatchingDiscoveryMap,  "enumerateKeysAndObjectsUsingBlock:",  v180);
      v115 = (id *)(v226 + 5);
      id v179 = (id)v226[5];
      NSAppendPrintF( &v179,  "XPC Matching Server: %d \n",  -[NSMutableDictionary count](self->_xpcMatchingServerMap, "count"));
      objc_storeStrong(v115, v179);
      xpcMatchingServerMap = self->_xpcMatchingServerMap;
      v178[0] = _NSConcreteStackBlock;
      v178[1] = 3221225472LL;
      v178[2] = sub_1000943D4;
      v178[3] = &unk_100111578;
      v178[4] = &v225;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( xpcMatchingServerMap,  "enumerateKeysAndObjectsUsingBlock:",  v178);
      v117 = (id *)(v226 + 5);
      id v177 = (id)v226[5];
      NSAppendPrintF(&v177, "XPC Cnx: %d\n", -[NSMutableSet count](self->_xpcConnections, "count"));
      objc_storeStrong(v117, v177);
      __int128 v175 = 0u;
      __int128 v176 = 0u;
      __int128 v173 = 0u;
      __int128 v174 = 0u;
      v156 = self->_xpcConnections;
      id v118 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v156,  "countByEnumeratingWithState:objects:count:",  &v173,  v232,  16LL);
      if (v118)
      {
        uint64_t v157 = *(void *)v174;
        do
        {
          id v158 = v118;
          for (k = 0LL; k != v158; k = (char *)k + 1)
          {
            if (*(void *)v174 != v157) {
              objc_enumerationMutation(v156);
            }
            v120 = *(void **)(*((void *)&v173 + 1) + 8LL * (void)k);
            v121 = (id *)(v226 + 5);
            id v172 = (id)v226[5];
            v122 = (void *)objc_claimAutoreleasedReturnValue([v120 xpcCnx]);
            NSAppendPrintF(&v172, "    %#{pid}", [v122 processIdentifier]);
            objc_storeStrong(v121, v172);

            v123 = (void *)objc_claimAutoreleasedReturnValue([v120 activatedDiscovery]);
            if (v123)
            {
              v124 = (id *)(v226 + 5);
              id v171 = (id)v226[5];
              v125 = (void *)objc_claimAutoreleasedReturnValue([v120 activatedDiscovery]);
              uint64_t v126 = CUDescriptionWithLevel(v125, v160);
              v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
              NSAppendPrintF(&v171, ", %@", v127);
              objc_storeStrong(v124, v171);
            }

            v128 = (void *)objc_claimAutoreleasedReturnValue([v120 activatedServer]);

            if (v128)
            {
              v129 = (id *)(v226 + 5);
              id v170 = (id)v226[5];
              v130 = (void *)objc_claimAutoreleasedReturnValue([v120 activatedServer]);
              uint64_t v131 = CUDescriptionWithLevel(v130, v160);
              v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
              NSAppendPrintF(&v170, ", %@", v132);
              objc_storeStrong(v129, v170);
            }

            v133 = (void *)objc_claimAutoreleasedReturnValue([v120 activatedSession]);

            if (v133)
            {
              v134 = (id *)(v226 + 5);
              id v169 = (id)v226[5];
              v135 = (void *)objc_claimAutoreleasedReturnValue([v120 activatedSession]);
              uint64_t v136 = CUDescriptionWithLevel(v135, v160);
              v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
              NSAppendPrintF(&v169, ", %@", v137);
              objc_storeStrong(v134, v169);
            }

            v138 = (void *)objc_claimAutoreleasedReturnValue([v120 activeNetCnx]);
            v139 = (void *)objc_claimAutoreleasedReturnValue([v120 clientNetCnx]);
            if (v138)
            {
              v140 = (id *)(v226 + 5);
              id v168 = (id)v226[5];
              uint64_t v141 = CUDescriptionWithLevel(v138, 30LL);
              v142 = (void *)objc_claimAutoreleasedReturnValue(v141);
              NSAppendPrintF(&v168, ", A %@", v142);
              objc_storeStrong(v140, v168);
            }

            if (v139 && v139 != v138)
            {
              v143 = (id *)(v226 + 5);
              id v167 = (id)v226[5];
              uint64_t v144 = CUDescriptionWithLevel(v139, 30LL);
              v145 = (void *)objc_claimAutoreleasedReturnValue(v144);
              NSAppendPrintF(&v167, ", C %@", v145);
              objc_storeStrong(v143, v167);
            }

            __int128 v165 = 0u;
            __int128 v166 = 0u;
            __int128 v163 = 0u;
            __int128 v164 = 0u;
            v146 = (void *)objc_claimAutoreleasedReturnValue([v120 serverNetCnxs]);
            id v147 = [v146 countByEnumeratingWithState:&v163 objects:v231 count:16];
            if (v147)
            {
              uint64_t v148 = *(void *)v164;
              do
              {
                for (m = 0LL; m != v147; m = (char *)m + 1)
                {
                  if (*(void *)v164 != v148) {
                    objc_enumerationMutation(v146);
                  }
                  uint64_t v150 = *(void *)(*((void *)&v163 + 1) + 8LL * (void)m);
                  v151 = (id *)(v226 + 5);
                  id v162 = (id)v226[5];
                  uint64_t v152 = CUDescriptionWithLevel(v150, 30LL);
                  v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
                  NSAppendPrintF(&v162, ", S %@", v153);
                  objc_storeStrong(v151, v162);
                }

                id v147 = [v146 countByEnumeratingWithState:&v163 objects:v231 count:16];
              }

              while (v147);
            }

            v154 = (id *)(v226 + 5);
            id v161 = (id)v226[5];
            NSAppendPrintF(&v161, "\n");
            objc_storeStrong(v154, v161);
          }

          id v118 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v156,  "countByEnumeratingWithState:objects:count:",  &v173,  v232,  16LL);
        }

        while (v118);
      }
    }

    id v5 = (id)v226[5];
    _Block_object_dispose(v184, 8);

    _Block_object_dispose(&v225, 8);
  }

  else
  {
    uint64_t v4 = NSPrintF("RPRemoteDisplayDaemon %{ptr}", a2, self);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  }

  return v5;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100094510;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_systemMonitor)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10009476C;
    v13[3] = &unk_1001110A8;
    v13[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100094774;
    v12[3] = &unk_1001110A8;
    v12[4] = self;
    -[CUSystemMonitor setNetFlagsChangedHandler:](self->_systemMonitor, "setNetFlagsChangedHandler:", v12);
    id v5 = self->_systemMonitor;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10009477C;
    v11[3] = &unk_1001110A8;
    v11[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v11);
  }

  if (!self->_xpcListener)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _activate]",  30LL,  "Activating XPC listener %@\n",  @"com.apple.RemoteDisplay");
    }

    uint64_t v6 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.RemoteDisplay");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v6;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  -[RPRemoteDisplayDaemon _registerForWombatStateNotifications](self, "_registerForWombatStateNotifications");
  id v8 = -[RPRemoteDisplayDaemon prefsChanged](self, "prefsChanged");
  if (GestaltGetDeviceClass(v8, v9) == 4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100094784;
    v10[3] = &unk_1001110A8;
    v10[4] = self;
    [(Class)off_100132C20[0]() addPermanentObserverForProperty:@"systemAttentionState" notifyInitial:1 invokeOnMainThread:0 handler:v10];
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000948E8;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon _invalidate]", 30LL, "Invalidating\n");
    }

    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0LL;

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v4 = self->_xpcConnections;
    id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)i), "xpcCnx", (void)v27));
          [v9 invalidate];
        }

        id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
      }

      while (v6);
    }

    -[NSMutableDictionary removeAllObjects](self->_xpcMatchingDiscoveryMap, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_xpcMatchingServerMap, "removeAllObjects");
    -[RPRemoteDisplayDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPRemoteDisplayDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[NSMutableSet removeAllObjects](self->_needsAWDLNewPeers, "removeAllObjects");
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    self->_needsAWDLNewPeers = 0LL;

    -[NSMutableSet removeAllObjects](self->_needsAWDLSentToPeers, "removeAllObjects");
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0LL;

    -[NSMutableSet removeAllObjects](self->_needsAWDLRequestIdentifiers, "removeAllObjects");
    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    self->_needsAWDLRequestIdentifiers = 0LL;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      v14 = needsAWDLRequestTimer;
      dispatch_source_cancel(v14);
      v15 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0LL;
    }

    -[RPRemoteDisplayDaemon _unregisterWombatStateNotifications]( self,  "_unregisterWombatStateNotifications",  (void)v27);
    -[RPRemoteDisplayDaemon _btAddressMonitorEnsureStopped](self, "_btAddressMonitorEnsureStopped");
    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0LL;

    personSelected = self->_personSelected;
    self->_personSelected = 0LL;

    discoverySessionExpirationTimer = self->_discoverySessionExpirationTimer;
    if (discoverySessionExpirationTimer)
    {
      v19 = discoverySessionExpirationTimer;
      dispatch_source_cancel(v19);
      v20 = self->_discoverySessionExpirationTimer;
      self->_discoverySessionExpirationTimer = 0LL;
    }

    inSessionDeviceLost = self->_inSessionDeviceLost;
    if (inSessionDeviceLost)
    {
      v22 = inSessionDeviceLost;
      dispatch_source_cancel(v22);
      v23 = self->_inSessionDeviceLost;
      self->_inSessionDeviceLost = 0LL;
    }

    -[RPRemoteDisplayDaemon _clearConfirmationClientCache](self, "_clearConfirmationClientCache");
    id v24 = -[RPRemoteDisplayDaemon setDeviceConfirmedIdentifier:](self, "setDeviceConfirmedIdentifier:", 0LL);
    if (GestaltGetDeviceClass(v24, v25) == 1)
    {
      -[RPRemoteDisplayDaemon _stopObservingOnenessEnabledState](self, "_stopObservingOnenessEnabledState");
      authenticationManager = self->_authenticationManager;
      self->_authenticationManager = 0LL;
    }

    -[RPRemoteDisplayDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_tcpServerConnections, "count")
    && !self->_tcpServer
    && !-[NSMutableSet count](self->_xpcConnections, "count")
    && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)daemonInfoChanged:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 0x10) != 0)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon daemonInfoChanged:]", 30LL, "Resetting on sign out\n");
    }

    -[RPRemoteDisplayDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
    -[RPRemoteDisplayDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
    -[RPRemoteDisplayDaemon _update](self, "_update");
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_11;
    }
  }

  else if ((a3 & 0x40) == 0)
  {
    goto LABEL_3;
  }

  -[RPRemoteDisplayDaemon _update](self, "_update");
  if ((v3 & 4) == 0) {
    goto LABEL_24;
  }
LABEL_11:
  if (self->_deviceAuthTagStr)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon daemonInfoChanged:]",  30LL,  "Clearing cached DeviceAuthTag to re-generate for updated SelfIdentity\n");
    }

    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0LL;
  }

  if (self->_deviceAWDLRandomID)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon daemonInfoChanged:]",  30LL,  "Clearing cached AWDL random ID to re-generate for updated SelfIdentity\n");
    }

    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0LL;
  }

  -[RPRemoteDisplayDaemon _update](self, "_update");
LABEL_24:
  if ((v3 & 9) != 0)
  {
    -[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices](self, "_clientBonjourReevaluateDevices");
    -[RPRemoteDisplayDaemon _update](self, "_update");
  }

  if ((v3 & 0x20) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    id v8 = [v7 errorFlags];

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v9 = self->_xpcConnections;
    id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "updateErrorFlags:", v8, (void)v14);
        }

        id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v11);
    }
  }

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v5 rangeOfString:@"rdAWDLa" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL bonjourAWDLAdvertiserForce = self->_bonjourAWDLAdvertiserForce;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      id v8 = "yes";
      if (bonjourAWDLAdvertiserForce) {
        uint64_t v9 = "yes";
      }
      else {
        uint64_t v9 = "no";
      }
      if (bonjourAWDLAdvertiserForce) {
        id v8 = "no";
      }
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon diagnosticCommand:params:]",  30LL,  "Diag: AWDL advertiser force: %s -> %s\n",  v9,  v8);
    }

    self->_BOOL bonjourAWDLAdvertiserForce = !bonjourAWDLAdvertiserForce;
    goto LABEL_28;
  }

  if ([v5 rangeOfString:@"rdAWDLb" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL bonjourBrowserAWDLForce = self->_bonjourBrowserAWDLForce;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      id v11 = "yes";
      if (bonjourBrowserAWDLForce) {
        uint64_t v12 = "yes";
      }
      else {
        uint64_t v12 = "no";
      }
      if (bonjourBrowserAWDLForce) {
        id v11 = "no";
      }
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon diagnosticCommand:params:]",  30LL,  "Diag: AWDL browser force: %s -> %s\n",  v12,  v11);
    }

    self->_BOOL bonjourBrowserAWDLForce = !bonjourBrowserAWDLForce;
LABEL_28:
    -[RPRemoteDisplayDaemon _update](self, "_update");
LABEL_29:
    BOOL v6 = 1;
    goto LABEL_30;
  }

  if (![v5 caseInsensitiveCompare:@"rdEval"])
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon diagnosticCommand:params:]",  30LL,  "Diag: Re-evaluate devices\n");
    }

    -[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices](self, "_clientBonjourReevaluateDevices");
    goto LABEL_29;
  }

  BOOL v6 = 0;
LABEL_30:

  return v6;
}

- (void)prefsChanged
{
  int DeviceClass = GestaltGetDeviceClass(v3, v4);
  BOOL v6 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdBLEClient", &v74) != 0;
  if (v74 && (DeviceClass == 100 || DeviceClass == 4)) {
    BOOL v6 = 1;
  }
  if (v74) {
    BOOL v7 = DeviceClass == 11;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v7 || v6;
  if (self->_prefBLEClient != v8)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      uint64_t v9 = "yes";
      if (v8) {
        id v10 = "no";
      }
      else {
        id v10 = "yes";
      }
      if (!v8) {
        uint64_t v9 = "no";
      }
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon prefsChanged]",  30LL,  "BLE client enabled: %s -> %s\n",  v10,  v9);
    }

    self->_prefBLEClient = v8;
  }

  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdBLEServer", &v74);
  BOOL v12 = Int64 != 0;
  if (v74) {
    BOOL v12 = (DeviceClass - 1) < 3 || Int64 != 0;
  }
  if (v74) {
    BOOL v14 = DeviceClass == 11;
  }
  else {
    BOOL v14 = 0;
  }
  BOOL v15 = v14 || v12;
  if (self->_prefBLEServer != v15)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      __int128 v16 = "yes";
      if (v15) {
        __int128 v17 = "no";
      }
      else {
        __int128 v17 = "yes";
      }
      if (!v15) {
        __int128 v16 = "no";
      }
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon prefsChanged]",  30LL,  "BLE server enabled: %s -> %s\n",  v17,  v16);
    }

    self->_prefBLEServer = v15;
  }

  BOOL v18 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdClientEnabled", &v74) != 0;
  if (v74 && (DeviceClass == 100 || DeviceClass == 4)) {
    BOOL v18 = 1;
  }
  if (v74) {
    BOOL v19 = DeviceClass == 11;
  }
  else {
    BOOL v19 = 0;
  }
  BOOL v20 = v19 || v18;
  if (self->_prefClientEnabled != v20)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      v21 = "yes";
      if (v20) {
        v22 = "no";
      }
      else {
        v22 = "yes";
      }
      if (!v20) {
        v21 = "no";
      }
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon prefsChanged]", 30LL, "Client enabled: %s -> %s\n", v22, v21);
    }

    self->_prefClientEnabled = v20;
  }

  uint64_t v23 = CFPrefs_GetInt64(@"com.apple.rapport", @"ignoreRemoteDisplayChecks", &v74);
  BOOL v24 = v23 != 0;
  if (self->_prefIgnoreRemoteDisplayChecks != v24)
  {
    if (dword_100132BB0 <= 30)
    {
      uint64_t v25 = v23;
      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        v26 = "yes";
        if (v25) {
          __int128 v27 = "no";
        }
        else {
          __int128 v27 = "yes";
        }
        if (!v25) {
          v26 = "no";
        }
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon prefsChanged]",  30LL,  "Ignore RemoteDisplay Checks: %s -> %s\n",  v27,  v26);
      }
    }

    self->_prefIgnoreRemoteDisplayChecks = v24;
  }

  uint64_t v28 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdNearbyActionV2", &v74);
  if (v74) {
    BOOL v29 = (DeviceClass & 0xFFFFFFFD) == 1;
  }
  else {
    BOOL v29 = 0;
  }
  BOOL v31 = v29 || v28 != 0;
  if (self->_prefNearbyActionV2 != v31)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      v32 = "yes";
      if (v31) {
        v33 = "no";
      }
      else {
        v33 = "yes";
      }
      if (!v31) {
        v32 = "no";
      }
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon prefsChanged]", 30LL, "NearbyActionV2: %s -> %s\n", v33, v32);
    }

    self->_prefNearbyActionV2 = v31;
  }

  uint64_t v34 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdNoInfra", &v74);
  BOOL v35 = v34 != 0;
  if (self->_prefNoInfra != v35)
  {
    if (dword_100132BB0 <= 30)
    {
      uint64_t v36 = v34;
      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        v37 = "yes";
        if (v36) {
          uint64_t v38 = "no";
        }
        else {
          uint64_t v38 = "yes";
        }
        if (!v36) {
          v37 = "no";
        }
        LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon prefsChanged]", 30LL, "NoInfra: %s -> %s\n", v38, v37);
      }
    }

    self->_prefNoInfra = v35;
  }

  uint64_t v39 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdNoUSB", &v74);
  BOOL v40 = v39 != 0;
  if (self->_prefNoUSB != v40)
  {
    if (dword_100132BB0 <= 30)
    {
      uint64_t v41 = v39;
      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        v42 = "yes";
        if (v41) {
          uint64_t v43 = "no";
        }
        else {
          uint64_t v43 = "yes";
        }
        if (!v41) {
          v42 = "no";
        }
        LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon prefsChanged]", 30LL, "NoUSB: %s -> %s\n", v43, v42);
      }
    }

    self->_prefNoUSB = v40;
  }

  uint64_t v44 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdPairingServer", &v74);
  BOOL v45 = v44 != 0;
  if (self->_prefAllowPairingServer != v45)
  {
    if (dword_100132BB0 <= 30)
    {
      uint64_t v46 = v44;
      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        v47 = "yes";
        if (v46) {
          uint64_t v48 = "no";
        }
        else {
          uint64_t v48 = "yes";
        }
        if (!v46) {
          v47 = "no";
        }
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon prefsChanged]",  30LL,  "Allow pairing server: %s -> %s\n",  v48,  v47);
      }
    }

    self->_prefAllowPairingServer = v45;
  }

  uint64_t v49 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdServerEnabled", 0LL);
  BOOL v50 = v49 != 0;
  if (self->_prefServerEnabled != v50)
  {
    if (dword_100132BB0 <= 30)
    {
      uint64_t v51 = v49;
      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        v52 = "yes";
        if (v51) {
          v53 = "no";
        }
        else {
          v53 = "yes";
        }
        if (!v51) {
          v52 = "no";
        }
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon prefsChanged]",  30LL,  "Server enabled: %s -> %s\n",  v53,  v52);
      }
    }

    self->_prefServerEnabled = v50;
  }

  uint64_t v54 = CFPrefs_GetInt64(@"com.apple.rapport", @"rdServerBonjourInfra", 0LL);
  BOOL v55 = v54 != 0;
  if (self->_prefServerBonjourInfra != v55)
  {
    if (dword_100132BB0 <= 30)
    {
      uint64_t v56 = v54;
      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        v57 = "yes";
        if (v56) {
          v58 = "no";
        }
        else {
          v58 = "yes";
        }
        if (!v56) {
          v57 = "no";
        }
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon prefsChanged]",  30LL,  "Server Bonjour Infra: %s -> %s\n",  v58,  v57);
      }
    }

    self->_prefServerBonjourInfra = v55;
  }

  unint64_t v59 = CFPrefs_GetInt64(@"com.apple.rapport", @"ccRetrySeconds", &v74);
  if (v59 <= 0x3E8 && v59 != 0 && v74 == 0) {
    unint64_t v62 = v59;
  }
  else {
    unint64_t v62 = 60LL;
  }
  unint64_t prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
  if (v62 != prefCameraCapabilitiesRetrySeconds)
  {
    if (dword_100132BB0 <= 30)
    {
      if (dword_100132BB0 == -1)
      {
        unint64_t prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
      }

      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon prefsChanged]",  30LL,  "Camera capabilities retry seconds: %lu -> %lu\n",  prefCameraCapabilitiesRetrySeconds,  v62);
    }

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"serviceType", TypeID, 0LL);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(TypedValue);
  if (v11) {
    BOOL v12 = (__CFString *)v11;
  }
  else {
    BOOL v12 = @"_rdlink._tcp";
  }
  CFTypeID v13 = CFDictionaryGetTypeID();
  uint64_t v14 = CFDictionaryGetTypedValue(v7, @"RBSAssertion", v13, &v46);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  __int128 v16 = (void *)v15;
  __int128 v17 = 0LL;
  if (v46)
  {
    BOOL v18 = 0LL;
    BOOL v19 = 0LL;
LABEL_10:
    CFTypeID v25 = CFStringGetTypeID();
    uint64_t v26 = CFDictionaryGetTypedValue(v7, @"type", v25, 0LL);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if ([v27 isEqual:@"discovery"])
    {
      uint64_t v41 = v16;
      v42 = v12;
      uint64_t v28 = objc_alloc_init(&OBJC_CLASS___RPXPCMatchingEntry);
      -[RPXPCMatchingEntry setEvent:](v28, "setEvent:", v7);
      id v43 = v8;
      -[RPXPCMatchingEntry setHandler:](v28, "setHandler:", v8);
      -[RPXPCMatchingEntry setToken:](v28, "setToken:", a3);
      -[RPXPCMatchingEntry setAngelJobLabel:](v28, "setAngelJobLabel:", v19);
      -[RPXPCMatchingEntry setAngelAssertionName:](v28, "setAngelAssertionName:", v18);
      xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      if (!xpcMatchingDiscoveryMap)
      {
        __int128 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        BOOL v31 = self->_xpcMatchingDiscoveryMap;
        self->_xpcMatchingDiscoveryMap = v30;

        xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( xpcMatchingDiscoveryMap,  "setObject:forKeyedSubscript:",  v28,  v32);

      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        v33 = &stru_1001152C8;
        if (v17) {
          v33 = v17;
        }
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon addXPCMatchingToken:event:handler:]",  30LL,  "Added discovery XPC matching token %llu, %@%##@\n",  a3,  v33,  v7);
      }

      -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
    }

    else
    {
      if (([v27 isEqual:@"server"] & 1) == 0
        && ![v27 isEqual:@"rdserver"])
      {
        BOOL v39 = 0;
LABEL_36:

        goto LABEL_41;
      }

      uint64_t v41 = v16;
      uint64_t v28 = objc_alloc_init(&OBJC_CLASS___RPXPCMatchingEntry);
      -[RPXPCMatchingEntry setEvent:](v28, "setEvent:", v7);
      id v43 = v8;
      -[RPXPCMatchingEntry setHandler:](v28, "setHandler:", v8);
      -[RPXPCMatchingEntry setToken:](v28, "setToken:", a3);
      v42 = v12;
      -[RPXPCMatchingEntry setServiceType:](v28, "setServiceType:", v12);
      -[RPXPCMatchingEntry setAngelJobLabel:](v28, "setAngelJobLabel:", v19);
      -[RPXPCMatchingEntry setAngelAssertionName:](v28, "setAngelAssertionName:", v18);
      xpcMatchingServerMap = self->_xpcMatchingServerMap;
      if (!xpcMatchingServerMap)
      {
        BOOL v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v36 = self->_xpcMatchingServerMap;
        self->_xpcMatchingServerMap = v35;

        xpcMatchingServerMap = self->_xpcMatchingServerMap;
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( xpcMatchingServerMap,  "setObject:forKeyedSubscript:",  v28,  v37);

      if (dword_100132BB0 > 30)
      {
        BOOL v12 = v42;
        id v8 = v43;
LABEL_35:
        __int128 v16 = v41;

        -[RPRemoteDisplayDaemon _update](self, "_update");
        BOOL v39 = 1;
        goto LABEL_36;
      }

      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        uint64_t v38 = &stru_1001152C8;
        if (v17) {
          uint64_t v38 = v17;
        }
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon addXPCMatchingToken:event:handler:]",  30LL,  "Added server XPC matching token %llu, %@%##@\n",  a3,  v38,  v7);
      }
    }

    BOOL v12 = v42;
    id v8 = v43;
    goto LABEL_35;
  }

  BOOL v18 = 0LL;
  BOOL v19 = 0LL;
  if (!v15) {
    goto LABEL_10;
  }
  CFTypeID v20 = CFStringGetTypeID();
  uint64_t v21 = CFDictionaryGetTypedValue(v16, @"AngelJobLabel", v20, 0LL);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
  CFTypeID v22 = CFStringGetTypeID();
  uint64_t v23 = CFDictionaryGetTypedValue(v16, @"AssertionName", v22, 0LL);
  uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
  BOOL v18 = (void *)v24;
  if (v19 && v24)
  {
    id v45 = 0LL;
    NSAppendPrintF(&v45, "Angel job label '%@' assertion '%@', ", v19, v24);
    __int128 v17 = (__CFString *)v45;
    goto LABEL_10;
  }

  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon addXPCMatchingToken:event:handler:]",  30LL,  "Ignoring launch angel XPC matching token that is missing fields angelJobLabel '%@' angelAssertionName '%@' token %llu\n",  v19,  v18,  a3);
  }
  BOOL v39 = 0;
LABEL_41:

  return v39;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_xpcMatchingDiscoveryMap,  "objectForKeyedSubscript:",  v4));

  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_xpcMatchingDiscoveryMap,  "setObject:forKeyedSubscript:",  0LL,  v4);
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon removeXPCMatchingToken:]",  30LL,  "Removed discovery XPC matching token %llu\n");
    }

- (void)_update
{
  BOOL v3 = self->_prefClientEnabled
    || -[NSMutableSet count](self->_activatedDiscoverySet, "count")
    || -[NSMutableSet count](self->_activatedSessionSet, "count")
    || -[NSMutableDictionary count](self->_xpcMatchingDiscoveryMap, "count") != 0LL;
  if (self->_prefServerEnabled || -[NSMutableDictionary count](self->_activatedServerXPCCnxMap, "count"))
  {
    BOOL v4 = 1;
LABEL_8:
    -[RPRemoteDisplayDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
    -[RPRemoteDisplayDaemon _btAddressMonitorEnsureStarted](self, "_btAddressMonitorEnsureStarted");
    goto LABEL_9;
  }

  id v10 = -[NSMutableDictionary count](self->_xpcMatchingServerMap, "count");
  BOOL v4 = v10 != 0LL;
  if (v10) {
    int v11 = 1;
  }
  else {
    int v11 = v3;
  }
  if (v11 == 1) {
    goto LABEL_8;
  }
  -[RPRemoteDisplayDaemon _btAddressMonitorEnsureStopped](self, "_btAddressMonitorEnsureStopped");
  BOOL v4 = 0;
LABEL_9:
  if (v3) {
    -[RPRemoteDisplayDaemon _clientEnsureStarted](self, "_clientEnsureStarted");
  }
  else {
    -[RPRemoteDisplayDaemon _clientEnsureStopped](self, "_clientEnsureStopped");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v5 identitiesOfType:13 error:0]);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identitiesOfType:12 error:0]);

  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceArray]);
    if ([v9 count] || objc_msgSend(v13, "count"))
    {

LABEL_16:
      -[RPRemoteDisplayDaemon _serverEnsureStarted](self, "_serverEnsureStarted");
      goto LABEL_24;
    }

    id v12 = [v7 count];

    if (v12) {
      goto LABEL_16;
    }
  }

  -[RPRemoteDisplayDaemon _serverEnsureStopped](self, "_serverEnsureStopped");
LABEL_24:
  if (-[RPRemoteDisplayDaemon _needToHoldPowerAssertion](self, "_needToHoldPowerAssertion")) {
    -[RPRemoteDisplayDaemon _powerAssertionEnsureHeld](self, "_powerAssertionEnsureHeld");
  }
  else {
    -[RPRemoteDisplayDaemon _powerAssertionEnsureReleased](self, "_powerAssertionEnsureReleased");
  }
}

- (void)_updateXPCMatchingDiscovery
{
  BOOL v3 = -[NSMutableDictionary count](self->_discoveredDevices, "count") != 0LL;
  xpcMatchingDiscoveryMap = self->_xpcMatchingDiscoveryMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000961D8;
  v5[3] = &unk_1001148B8;
  BOOL v6 = v3;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( xpcMatchingDiscoveryMap,  "enumerateKeysAndObjectsUsingBlock:",  v5);
}

- (void)_bluetoothUseCaseFromWombatState:(unsigned int)a3 resultBlock:(id)a4
{
  uint64_t v6 = 131078LL;
  id v7 = a4;
  id v11 = v7;
  if (a3 == 2)
  {
    uint64_t v8 = 40LL;
    uint64_t v9 = 40LL;
  }

  else if (a3 == 3)
  {
    uint64_t v6 = 131080LL;
    uint64_t v8 = 30LL;
    uint64_t v9 = 30LL;
  }

  else
  {
    BOOL v10 = !-[RPRemoteDisplayDaemon _onenessEnabled](self, "_onenessEnabled");
    id v7 = v11;
    if (v10) {
      uint64_t v6 = 0x20000LL;
    }
    else {
      uint64_t v6 = 131101LL;
    }
    uint64_t v9 = 20LL;
    uint64_t v8 = 30LL;
  }

  (*((void (**)(id, uint64_t, uint64_t, uint64_t))v7 + 2))(v7, v6, v8, v9);
}

- (void)_connectionConfigureCommon:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activatedServerXPCCnxMap, "allValues"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)i) activatedServer]);
        unsigned int v12 = [v11 passwordType];
        if (v12 > 4 || ((1 << v12) & 0x19) == 0)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 password]);
          [v4 setPassword:v14];

          objc_msgSend(v4, "setPasswordType:", objc_msgSend(v11, "passwordType"));
          unsigned __int8 v15 = [v11 internalAuthFlags];
          if ((v15 & 1) != 0)
          {
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472LL;
            v20[2] = sub_1000966F0;
            v20[3] = &unk_100111C38;
            v20[4] = v11;
            [v4 setShowPasswordHandler:v20];
          }

          if ((v15 & 2) != 0)
          {
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472LL;
            v19[2] = sub_100096750;
            v19[3] = &unk_100111C60;
            v19[4] = v11;
            [v4 setHidePasswordHandler:v19];
          }

          goto LABEL_18;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)_updateForXPCClientChange
{
  else {
    int64_t v3 = -60LL;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_activatedDiscoverySet;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(v10, "rssiThreshold", (void)v13);
        else {
          int64_t v12 = (int64_t)v11;
        }
        if (v11) {
          int64_t v3 = v12;
        }
        if ([v10 triggerEnhancedDiscovery])
        {
          [v10 setTriggerEnhancedDiscovery:0];
          char v7 = 1;
        }
      }

      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);

    self->_bleRSSIThreshold = v3;
    if ((v7 & 1) != 0) {
      -[RPRemoteDisplayDaemon _bleDiscoveryTriggerEnhancedDiscovery:useCase:]( self,  "_bleDiscoveryTriggerEnhancedDiscovery:useCase:",  @"RemoteDisplayDiscovery",  131076LL);
    }
  }

  else
  {

    self->_bleRSSIThreshold = v3;
  }

  -[RPRemoteDisplayDaemon _update](self, "_update", (void)v13);
}

- (void)_clientEnsureStarted
{
  int DeviceClass = GestaltGetDeviceClass(self, a2);
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    -[RPRemoteDisplayDaemon _clientBonjourEnsureStarted](self, "_clientBonjourEnsureStarted");
    if (-[RPRemoteDisplayDaemon _clientBLEDiscoveryShouldRun](self, "_clientBLEDiscoveryShouldRun")) {
      -[RPRemoteDisplayDaemon _clientBLEDiscoveryEnsureStarted](self, "_clientBLEDiscoveryEnsureStarted");
    }
    else {
      -[RPRemoteDisplayDaemon _clientBLEDiscoveryEnsureStopped](self, "_clientBLEDiscoveryEnsureStopped");
    }
    if (-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]( self,  "_clientBLENearbyActionV2AdvertiserShouldRun"))
    {
      -[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted]( self,  "_clientBLENearbyActionV2AdvertiserEnsureStarted");
    }

    else
    {
      -[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped]( self,  "_clientBLENearbyActionV2AdvertiserEnsureStopped");
    }

    if (-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserShouldRun](self, "_clientBLENeedsAWDLAdvertiserShouldRun")) {
      -[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStarted]( self,  "_clientBLENeedsAWDLAdvertiserEnsureStarted");
    }
    else {
      -[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStopped]( self,  "_clientBLENeedsAWDLAdvertiserEnsureStopped");
    }
    if (-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserShouldRun](self, "_clientBonjourAWDLBrowserShouldRun")) {
      -[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStarted](self, "_clientBonjourAWDLBrowserEnsureStarted");
    }
    else {
      -[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStopped](self, "_clientBonjourAWDLBrowserEnsureStopped");
    }
    if (DeviceClass == 100 || DeviceClass == 4) {
      -[RPRemoteDisplayDaemon _registerForIncomingMessages](self, "_registerForIncomingMessages");
    }
  }

  else if (dword_100132BB0 <= 30 {
         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  }
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientEnsureStarted]",  30LL,  "Deferring client start until FirstUnlock\n");
  }

- (void)_clientEnsureStopped
{
  clientIncomingMessageCLinkClient = self->_clientIncomingMessageCLinkClient;
  if (clientIncomingMessageCLinkClient)
  {
    -[RPCompanionLinkClient invalidate](clientIncomingMessageCLinkClient, "invalidate");
    id v4 = self->_clientIncomingMessageCLinkClient;
    self->_clientIncomingMessageCLinkClient = 0LL;
  }

- (void)_bleDiscoveryEnsureStarted:(BOOL)a3
{
  BOOL v3 = a3;
  bleDiscovery = self->_bleDiscovery;
  if (!bleDiscovery)
  {
    unsigned int bleDiscoveryID = self->_bleDiscoveryID;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]",  30LL,  "BLE discovery start ID %u\n",  bleDiscoveryID);
    }

    id v11 = (SFDeviceDiscovery *)objc_alloc_init((Class)off_100132C28[0]());
    int64_t v12 = self->_bleDiscovery;
    self->_bleDiscovery = v11;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleDiscovery, "setChangeFlags:", 1LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleDiscovery, "setDiscoveryFlags:", 1LL);
    if (-[RPRemoteDisplayDaemon _discoveriCloudDevicesOnly](self, "_discoveriCloudDevicesOnly")) {
      -[SFDeviceDiscovery setDiscoveryFlags:]( self->_bleDiscovery,  "setDiscoveryFlags:",  (unint64_t)-[SFDeviceDiscovery discoveryFlags](self->_bleDiscovery, "discoveryFlags") | 0x20);
    }
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_bleDiscovery, "setPurpose:", @"RDLink");
    id v13 = -[SFDeviceDiscovery setRssiChangeDetection:](self->_bleDiscovery, "setRssiChangeDetection:", 1LL);
    if (GestaltGetDeviceClass(v13, v14) == 4)
    {
      int64_t bleRSSIThreshold = -75LL;
    }

    else if (self->_bleRSSIThreshold)
    {
      int64_t bleRSSIThreshold = self->_bleRSSIThreshold;
    }

    else
    {
      int64_t bleRSSIThreshold = -60LL;
    }

    -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", bleRSSIThreshold);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100096EDC;
    v24[3] = &unk_100111828;
    v24[4] = self;
    unsigned int v25 = bleDiscoveryID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleDiscovery, "setDeviceFoundHandler:", v24);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100096F00;
    v22[3] = &unk_100111828;
    v22[4] = self;
    unsigned int v23 = bleDiscoveryID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleDiscovery, "setDeviceLostHandler:", v22);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100096F24;
    v20[3] = &unk_100111850;
    v20[4] = self;
    unsigned int v21 = bleDiscoveryID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleDiscovery, "setDeviceChangedHandler:", v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100096F48;
    v18[3] = &unk_100111878;
    v18[4] = self;
    unsigned int v19 = bleDiscoveryID;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_bleDiscovery, "setInterruptionHandler:", v18);
    if (v3) {
      goto LABEL_27;
    }
LABEL_7:
    if (bleDiscovery) {
      return;
    }
LABEL_32:
    __int128 v16 = self->_bleDiscovery;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100096FDC;
    v17[3] = &unk_1001118A0;
    v17[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v16, "activateWithCompletion:", v17);
    return;
  }

  unsigned int v6 = -[RPRemoteDisplayDaemon _discoveriCloudDevicesOnly](self, "_discoveriCloudDevicesOnly");
  char v7 = self->_bleDiscovery;
  unint64_t v8 = (unint64_t)-[SFDeviceDiscovery discoveryFlags](v7, "discoveryFlags");
  if (v6) {
    uint64_t v9 = v8 | 0x20;
  }
  else {
    uint64_t v9 = v8 & 0xFFFFFFDF;
  }
  -[SFDeviceDiscovery setDiscoveryFlags:](v7, "setDiscoveryFlags:", v9);
  if (-[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold") != (id)self->_bleRSSIThreshold)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]",  30LL,  "BLE discovery RSSI threshold changed from %ld -> %ld\n",  -[SFDeviceDiscovery rssiThreshold](self->_bleDiscovery, "rssiThreshold"),  self->_bleRSSIThreshold);
    }

    -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_bleRSSIThreshold);
    if (v3) {
      goto LABEL_27;
    }
    goto LABEL_7;
  }

  if (!v3) {
    goto LABEL_7;
  }
LABEL_27:
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]",  30LL,  "BLE discovery overrideScreenOff: %s\n",  "yes");
  }
  -[SFDeviceDiscovery setOverrideScreenOff:](self->_bleDiscovery, "setOverrideScreenOff:", 1LL);
  if (!bleDiscovery) {
    goto LABEL_32;
  }
}

- (void)_bleDiscoveryEnsureStopped
{
  if (self->_bleDiscovery)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStopped]",  30LL,  "BLE discovery stop ID %u\n",  self->_bleDiscoveryID);
    }

    -[SFDeviceDiscovery invalidate](self->_bleDiscovery, "invalidate");
    bleDiscovery = self->_bleDiscovery;
    self->_bleDiscovery = 0LL;

    ++self->_bleDiscoveryID;
  }

- (void)_bleDiscoveryTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4
{
  bleDiscovery = self->_bleDiscovery;
  if (bleDiscovery)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000971D8;
    v5[3] = &unk_1001148D8;
    unsigned int v6 = a4;
    -[SFDeviceDiscovery triggerEnhancedDiscovery:useCase:completion:]( bleDiscovery,  "triggerEnhancedDiscovery:useCase:completion:",  a3,  *(void *)&a4,  v5);
  }

- (BOOL)_discoveriCloudDevicesOnly
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = self->_activatedDiscoverySet;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = (unint64_t)objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)i),  "discoveryFlags",  (void)v10);
        if (v8) {
          v5 |= v8;
        }
      }

      id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v4);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5 == 0;
}

- (void)_clientBLEDiscoveryEnsureStarted
{
  self->_clientBLEDiscoveryStarted = 1;
}

- (void)_clientBLEDiscoveryEnsureStopped
{
  if (self->_clientBLEDiscoveryStarted) {
    -[RPRemoteDisplayDaemon _bleDiscoveryEnsureStopped](self, "_bleDiscoveryEnsureStopped");
  }
}

- (void)_clientBLEDiscoveryDeviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  uint64_t v6 = v5;
  if (v5)
  {
    if (([v5 hasPrefix:@"iPhone"] & 1) != 0
      || ([v6 hasPrefix:@"iPad"] & 1) != 0
      || ([v6 hasPrefix:@"iPod"] & 1) != 0
      || ([v6 hasPrefix:@"RealityDevice"] & 1) != 0
      || self->_prefIgnoreRemoteDisplayChecks)
    {
      char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 idsIdentifier]);
      if (!v7)
      {
        if (dword_100132BB0 <= 90
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]",  90LL,  "### Ignoring BLE device found with no IDS device ID: %@\n",  v4);
        }

        goto LABEL_105;
      }

      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceMap]);
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

      if (([v4 deviceFlags] & 8) != 0 && !v10)
      {
        if (dword_100132BB0 <= 90
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]",  90LL,  "### Ignoring BLE device found with no IDS device: %@\n",  v4);
        }

        goto LABEL_104;
      }

      uint64_t v11 = GestaltProductTypeStringToDeviceClass(v6);
      if (v10)
      {
        uint64_t v13 = v11;
        uint64_t v11 = (uint64_t)[v10 operatingSystemVersion];
        if ((_DWORD)v13)
        {
          uint64_t v11 = wInTP56r94EFs9NAAi(v13, v77, v78, v79);
          if ((v11 & 1) == 0 && !self->_prefIgnoreRemoteDisplayChecks)
          {
            if (dword_100132BB0 <= 30
              && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
            {
              LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]",  30LL,  "Ignoring BLE device with old OS: %d.%d.%d, %@\n",  v77,  v78,  v79,  v4);
            }

            goto LABEL_104;
          }
        }
      }

      else
      {
        uint64_t v77 = 0LL;
        uint64_t v78 = 0LL;
        uint64_t v79 = 0LL;
      }

      if (GestaltGetDeviceClass(v11, v12) == 4
        && !-[RPRemoteDisplayDaemon _deviceSupportsLaguna:](self, "_deviceSupportsLaguna:", v4))
      {
        if (dword_100132BB0 > 20
          || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 20LL))
        {
          goto LABEL_104;
        }

        id v61 = v4;
        id v18 = "Ignoring unsupported BLE device for Laguna: %@\n";
      }

      else
      {
        if (((unsigned __int16)[v4 deviceFlags] & 0xC008) != 0)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( self,  "_findMatchingDeviceWithIdentifier:",  v7));
          if (v14)
          {
            __int128 v15 = (void *)v14;
            if (dword_100132BB0 <= 30
              && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
            {
              uint64_t v16 = CUDescriptionWithLevel(v4, 30LL);
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]",  30LL,  "BLE device changed: %@\n",  v17);
            }

            unsigned __int16 v21 = (unsigned __int16)[v15 statusFlags];
            id v22 = [v15 updateWithSFDevice:v4];
            [v15 setIdsDeviceIdentifier:v7];
            unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v15 accountAltDSID]);

            if (!v23)
            {
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _getAltDSIDForDevice:](self, "_getAltDSIDForDevice:", v15));
              [v15 setAccountAltDSID:v24];
            }

            -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]( self,  "_requestCameraCapabilitiesForDevice:",  v15);
            if ((_DWORD)v22)
            {
              unsigned __int16 v62 = v21;
              v63 = self;
              v65 = v10;
              unint64_t v67 = v7;
              unint64_t v64 = v6;
              __int128 v75 = 0u;
              __int128 v76 = 0u;
              __int128 v73 = 0u;
              __int128 v74 = 0u;
              unsigned int v25 = self->_xpcConnections;
              id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v73,  v83,  16LL);
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v74;
                do
                {
                  for (i = 0LL; i != v27; i = (char *)i + 1)
                  {
                    if (*(void *)v74 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    __int128 v30 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
                    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v30 activatedDiscovery]);
                    unsigned int v32 = [v31 shouldReportDevice:v15];

                    if (v32)
                    {
                      v33 = (void *)objc_claimAutoreleasedReturnValue([v30 xpcCnx]);
                      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 remoteObjectProxy]);
                      [v34 remoteDisplayChangedDevice:v15 changes:v22];
                    }
                  }

                  id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v73,  v83,  16LL);
                }

                while (v27);
              }

              if ((v62 & 0x200) != 0 && ([v15 statusFlags] & 0x200) == 0) {
                -[RPRemoteDisplayDaemon _clientBonjourReconfirmDevice:reason:]( v63,  "_clientBonjourReconfirmDevice:reason:",  v15,  "WiFiP2P lost");
              }
              uint64_t v6 = v64;
              __int128 v10 = v65;
              char v7 = v67;
              if ((v22 & 1) != 0
                && -[RPRemoteDisplayDevice isEqualToDevice:]( v63->_bleNearbyActionV2Device,  "isEqualToDevice:",  v15))
              {
                -[RPRemoteDisplayDevice updateWithSFDevice:](v63->_bleNearbyActionV2Device, "updateWithSFDevice:", v4);
                -[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserUpdate]( v63,  "_clientBLENearbyActionV2AdvertiserUpdate");
              }

              if (((unsigned __int16)v22 & 0x400) != 0)
              {
                deviceConfirmedIdentifier = v63->_deviceConfirmedIdentifier;
                if (deviceConfirmedIdentifier)
                {
                  if (-[NSString isEqualToString:](deviceConfirmedIdentifier, "isEqualToString:", v67)
                    && ([v15 inDiscoverySession] & 1) == 0)
                  {
                    -[RPRemoteDisplayDaemon _startInSessionDeviceLostTimer](v63, "_startInSessionDeviceLostTimer");
                  }
                }
              }
            }
          }

          else
          {
            if (dword_100132BB0 <= 30
              && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
            {
              uint64_t v19 = CUDescriptionWithLevel(v4, 30LL);
              CFTypeID v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
              LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]",  30LL,  "BLE device found: %@\n",  v20);
            }

            id v36 = sub_100098440();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            id v38 = sub_100098440();
            BOOL v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v39, self);

            if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
            {
              uint64_t v41 = CUDescriptionWithLevel(v4, 30LL);
              v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
              *(_DWORD *)buf = 138412290;
              v82 = v42;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_EVENT,  v40,  "BLE device found",  "BLE device found: %@\n",  buf,  0xCu);
            }

            id v43 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDevice);
            -[RPRemoteDisplayDevice setIdentifier:](v43, "setIdentifier:", v7);
            -[RPRemoteDisplayDevice setIdsDevice:](v43, "setIdsDevice:", v10);
            -[RPRemoteDisplayDevice setPersistentIdentifier:](v43, "setPersistentIdentifier:", v7);
            -[RPRemoteDisplayDevice updateWithSFDevice:](v43, "updateWithSFDevice:", v4);
            -[RPRemoteDisplayDevice setIdsDeviceIdentifier:](v43, "setIdsDeviceIdentifier:", v7);
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDevice accountAltDSID](v43, "accountAltDSID"));

            if (!v44)
            {
              id v45 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _getAltDSIDForDevice:](self, "_getAltDSIDForDevice:", v43));
              -[RPRemoteDisplayDevice setAccountAltDSID:](v43, "setAccountAltDSID:", v45);
            }

            if (self->_prefIgnoreRemoteDisplayChecks)
            {
              id v46 = RPVersionToSourceVersionString(4000000LL);
              v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
              -[RPRemoteDisplayDevice setSourceVersion:](v43, "setSourceVersion:", v47);
            }

            v66 = v10;
            discoveredDevices = self->_discoveredDevices;
            if (!discoveredDevices)
            {
              uint64_t v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              BOOL v50 = self->_discoveredDevices;
              self->_discoveredDevices = v49;

              discoveredDevices = self->_discoveredDevices;
            }

            v68 = v7;
            -[NSMutableDictionary setObject:forKeyedSubscript:]( discoveredDevices,  "setObject:forKeyedSubscript:",  v43,  v7);
            -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]( self,  "_requestCameraCapabilitiesForDevice:",  v43);
            -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            uint64_t v51 = self->_xpcConnections;
            id v52 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v69,  v80,  16LL);
            if (v52)
            {
              id v53 = v52;
              uint64_t v54 = *(void *)v70;
              do
              {
                for (j = 0LL; j != v53; j = (char *)j + 1)
                {
                  if (*(void *)v70 != v54) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v56 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
                  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 activatedDiscovery]);
                  unsigned int v58 = [v57 shouldReportDevice:v43];

                  if (v58)
                  {
                    unint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v56 xpcCnx]);
                    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 remoteObjectProxy]);
                    [v60 remoteDisplayFoundDevice:v43];
                  }
                }

                id v53 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v69,  v80,  16LL);
              }

              while (v53);
            }

            __int128 v10 = v66;
            char v7 = v68;
          }

          goto LABEL_104;
        }

        if (dword_100132BB0 > 20
          || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 20LL))
        {
LABEL_104:

LABEL_105:
          goto LABEL_106;
        }

        id v61 = v4;
        id v18 = "### Ignoring BLE device that does not have expected status flags: %@\n";
      }

      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]", 20LL, v18, v61);
      goto LABEL_104;
    }

    if (dword_100132BB0 <= 20
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]",  20LL,  "Ignoring unsupported BLE device found: %@\n",  v4);
    }
  }

  else if (dword_100132BB0 <= 10 {
         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 10LL)))
  }
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceFound:]",  10LL,  "### Ignoring BLE device found with no model: %@\n",  v4);
  }

- (void)_clientBLEDiscoveryDeviceLost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 idsIdentifier]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( self,  "_findMatchingDeviceWithIdentifier:",  v5));
    char v7 = v6;
    if (v6)
    {
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

      if (v10 && v13 && ([v10 isEqual:v13] & 1) == 0)
      {
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]",  30LL,  "Ignoring BLE device lost: cachedBLEDeviceID %@ inBLEDeviceID %@ \n",  v10,  v13);
        }
      }

      else if ([v4 isBLEDeviceReplaced])
      {
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]",  30LL,  "Ignoring BLE device lost, BLE Device is being replaced: %@\n",  v4);
        }
      }

      else
      {
        unsigned __int16 v41 = (unsigned __int16)[v7 statusFlags];
        id v43 = v13;
        uint64_t v44 = v10;
        v42 = self;
        if ([v7 removeSFDevice:v4])
        {
          if (dword_100132BB0 <= 30
            && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
          {
            uint64_t v14 = CUDescriptionWithLevel(v4, 30LL);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]",  30LL,  "BLE device lost (removed): %@\n",  v15);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoveredDevices,  "setObject:forKeyedSubscript:",  0LL,  v5);
          [v7 clearCameraCapabilitiesRefetchTimer];
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v18 = self->_xpcConnections;
          id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v49,  v54,  16LL);
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v50;
            do
            {
              for (i = 0LL; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v50 != v21) {
                  objc_enumerationMutation(v18);
                }
                unsigned int v23 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 activatedDiscovery]);
                unsigned int v25 = [v24 shouldReportDevice:v7];

                if (v25)
                {
                  id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 xpcCnx]);
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 remoteObjectProxy]);
                  [v27 remoteDisplayLostDevice:v7];
                }
              }

              id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v49,  v54,  16LL);
            }

            while (v20);
          }

          uint64_t v28 = v42;
          BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](v42, "deviceConfirmedIdentifier"));
          unsigned int v30 = [v5 isEqualToString:v29];

          if (v30) {
            -[RPRemoteDisplayDaemon _startInSessionDeviceLostTimer](v42, "_startInSessionDeviceLostTimer");
          }
        }

        else
        {
          if (dword_100132BB0 <= 30
            && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
          {
            uint64_t v16 = CUDescriptionWithLevel(v4, 30LL);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]",  30LL,  "BLE device lost (changed): %@\n",  v17);
          }

          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          BOOL v31 = self->_xpcConnections;
          id v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v46;
            do
            {
              for (j = 0LL; j != v33; j = (char *)j + 1)
              {
                if (*(void *)v46 != v34) {
                  objc_enumerationMutation(v31);
                }
                id v36 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
                v37 = (void *)objc_claimAutoreleasedReturnValue([v36 activatedDiscovery]);
                unsigned int v38 = [v37 shouldReportDevice:v7];

                if (v38)
                {
                  BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v36 xpcCnx]);
                  os_signpost_id_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 remoteObjectProxy]);
                  [v40 remoteDisplayChangedDevice:v7 changes:2];
                }
              }

              id v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
            }

            while (v33);
          }

          uint64_t v28 = v42;
        }

        -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](v28, "_updateXPCMatchingDiscovery");
        uint64_t v13 = v43;
        __int128 v10 = v44;
        if ((v41 & 0x200) != 0 && ([v7 statusFlags] & 0x200) == 0) {
          -[RPRemoteDisplayDaemon _clientBonjourReconfirmDevice:reason:]( v28,  "_clientBonjourReconfirmDevice:reason:",  v7,  "BLE device lost");
        }
      }
    }
  }

  else if (dword_100132BB0 <= 10 {
         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 10LL)))
  }
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLEDiscoveryDeviceLost:]",  10LL,  "### Ignoring BLE device lost with no IDS device ID: %@\n",  v4);
  }
}

- (BOOL)_clientBLEDiscoveryShouldRun
{
  if (!self->_prefBLEClient) {
    return 0;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_localDeviceInfo, "model"));
  BOOL v4 = (int)sub_100009F04(v3) > 10;

  return v4;
}

- (void)_clientBLENeedsAWDLAdvertiserEnsureStarted
{
  if (!self->_bleNeedsAWDLAdvertiser)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStarted]",  30LL,  "BLE NeedsAWDL advertiser start\n");
    }

    id v3 = (SFService *)objc_alloc_init((Class)off_100132C30[0]());
    bleNeedsAWDLAdvertiser = self->_bleNeedsAWDLAdvertiser;
    self->_bleNeedsAWDLAdvertiser = v3;

    -[SFService setAdvertiseRate:](self->_bleNeedsAWDLAdvertiser, "setAdvertiseRate:", 60LL);
    -[SFService setDeviceActionType:](self->_bleNeedsAWDLAdvertiser, "setDeviceActionType:", 50LL);
    -[SFService setDispatchQueue:](self->_bleNeedsAWDLAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v5 = off_100132C38[0]();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[SFService setIdentifier:](self->_bleNeedsAWDLAdvertiser, "setIdentifier:", v6);

    -[SFService setLabel:](self->_bleNeedsAWDLAdvertiser, "setLabel:", @"RDLink");
    -[SFService setNeedsKeyboard:](self->_bleNeedsAWDLAdvertiser, "setNeedsKeyboard:", 1LL);
    -[SFService setPairSetupDisabled:](self->_bleNeedsAWDLAdvertiser, "setPairSetupDisabled:", 1LL);
    char v7 = self->_bleNeedsAWDLAdvertiser;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100098B94;
    v8[3] = &unk_1001118A0;
    v8[4] = self;
    -[SFService activateWithCompletion:](v7, "activateWithCompletion:", v8);
    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1LL);
  }

- (void)_clientBLENeedsAWDLAdvertiserEnsureStopped
{
  if (self->_bleNeedsAWDLAdvertiser)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStopped]",  30LL,  "BLE NeedsAWDL advertiser stop\n");
    }

    -[SFService invalidate](self->_bleNeedsAWDLAdvertiser, "invalidate");
    bleNeedsAWDLAdvertiser = self->_bleNeedsAWDLAdvertiser;
    self->_bleNeedsAWDLAdvertiser = 0LL;

    bleNeedsAWDLAdvertiserProcessName = self->_bleNeedsAWDLAdvertiserProcessName;
    self->_bleNeedsAWDLAdvertiserProcessName = 0LL;

    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0LL);
  }

- (BOOL)_clientBLENeedsAWDLAdvertiserShouldRun
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v3 = self->_xpcConnections;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientNetCnx", (void)v21));
        unsigned int v10 = [v9 state];

        if (v10 != 1)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 activatedSession]);
          unsigned int v12 = [v11 needsAWDL];

          if (v12)
          {
            if (([v8 usingNearbyActionV2] & 1) == 0)
            {
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 activatedSession]);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bonjourDevice]);

              if (!v14)
              {
                uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcCnx]);
                id v17 = sub_10000A8B0((uint64_t)[v16 processIdentifier]);
                id v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
                bleNeedsAWDLAdvertiserProcessName = self->_bleNeedsAWDLAdvertiserProcessName;
                self->_bleNeedsAWDLAdvertiserProcessName = v18;

                BOOL v15 = 1;
                goto LABEL_14;
              }
            }
          }
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (void)_clientBLENearbyActionV2AdvertiserEnsureStarted
{
  bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
  if (!bleNearbyActionV2Device) {
    return;
  }
  if (self->_bleNearbyActionV2Advertiser)
  {
    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 1LL);
    return;
  }

  if (dword_100132BB0 <= 30)
  {
    if (dword_100132BB0 == -1)
    {
      bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    }

    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStarted]",  30LL,  "BLE NearbyActionV2 advertiser start for device %@\n",  bleNearbyActionV2Device);
  }

- (void)_clientBLENearbyActionV2AdvertiserEnsureStopped
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser)
  {
    -[RPNearbyActionV2Advertiser invalidate](bleNearbyActionV2Advertiser, "invalidate");
    id v4 = self->_bleNearbyActionV2Advertiser;
    self->_bleNearbyActionV2Advertiser = 0LL;

    bleNearbyActionV2AdvertiserProcessName = self->_bleNearbyActionV2AdvertiserProcessName;
    self->_bleNearbyActionV2AdvertiserProcessName = 0LL;

    bleNearbyActionV2Device = self->_bleNearbyActionV2Device;
    self->_bleNearbyActionV2Device = 0LL;

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserEnsureStopped]",  30LL,  "BLE NearbyActionV2 advertiser stopped\n");
    }

    -[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:](self, "_clientSendNeedsAWDLOverWiFi:", 0LL);
    id v7 = sub_100098440();
    os_signpost_id_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = sub_100098440();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)unsigned int v12 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_END,  v11,  "BLE NearbyActionV2 advertisement",  "BLE NearbyActionV2 advertiser stopped\n signpost_end:end_time",  v12,  2u);
    }
  }

- (BOOL)_clientBLENearbyActionV2AdvertiserShouldRun
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  unsigned int v4 = [v3 isNearbyActionV2AdvertiserActive];

  if (v4)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]",  30LL,  "Skip using NearbyActionV2 advertiser because it is already in use\n");
    }

    return 0;
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  v37 = self;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
  if (!v6) {
    goto LABEL_26;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v43;
  p_bleNearbyActionV2Device = (id *)&self->_bleNearbyActionV2Device;
  while (2)
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v43 != v8) {
        objc_enumerationMutation(v5);
      }
      os_signpost_id_t v11 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientNetCnx]);
      unsigned int v13 = [v12 state];

      if (v13 == 1) {
        continue;
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 activatedSession]);

      if (!v14) {
        continue;
      }
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 activatedSession]);
      unsigned int v16 = [v15 needsAWDL];

      if (!v16) {
        continue;
      }
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 activatedSession]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bonjourDevice]);

      if (v18) {
        continue;
      }
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 activatedSession]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 daemonDevice]);

      uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 idsDeviceIdentifier]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 idsDeviceMap]);
      unsigned int v38 = (void *)v21;
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v21]);

      if (([v20 statusFlags] & 0x80000) == 0)
      {
        if (((unint64_t)[v20 statusFlags] & 0x3000000000) == 0)
        {
          if (dword_100132BB0 <= 30)
          {
            uint64_t v34 = v38;
            if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)) {
              LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]",  30LL,  "Skip using NearbyActionV2 as destination device is missing correct status flags: %@\n",  v20);
            }
            goto LABEL_58;
          }

          goto LABEL_47;
        }

        goto LABEL_20;
      }

      if (!v24)
      {
        if (dword_100132BB0 > 90)
        {
          __int128 v24 = 0LL;
          goto LABEL_47;
        }

        uint64_t v34 = v38;
        if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)) {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]",  90LL,  "### Failed to use NearbyActionV2 advertiser, IDS device for ID %@ not found\n",  v38);
        }
        __int128 v24 = 0LL;
        goto LABEL_58;
      }

      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 modelIdentifier]);
      uint64_t v26 = GestaltProductTypeStringToDeviceClass(v25);

      if ((v26 & 0xFFFFFFFD) != 1)
      {
        if (dword_100132BB0 > 30) {
          goto LABEL_47;
        }
        uint64_t v34 = v38;
        if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))
        {
          BOOL v35 = (void *)objc_claimAutoreleasedReturnValue([v24 modelIdentifier]);
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]",  30LL,  "Skip using NearbyActionV2 advertiser, destination device model did not match '%@'\n",  v35);
        }

        goto LABEL_58;
      }

      [v24 operatingSystemVersion];
      if ((DeviceOSVersionAtOrLater(v26, v39, v40, v41, 160000LL, 130000LL, 160000LL, 90000LL) & 1) == 0)
      {
        uint64_t v34 = v38;
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserShouldRun]",  30LL,  "Skip using NearbyActionV2 advertiser, destinationDevice (%@) OSVersion is older\n",  v38);
        }

- (void)_clientBLENearbyActionV2AdvertiserUpdate
{
  bleNearbyActionV2Advertiser = self->_bleNearbyActionV2Advertiser;
  if (bleNearbyActionV2Advertiser && self->_bleNearbyActionV2Device)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Advertiser targetData](bleNearbyActionV2Advertiser, "targetData"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDevice bleTargetData](self->_bleNearbyActionV2Device, "bleTargetData"));
    id v8 = v4;
    id v6 = v5;
    if (v8 != v6)
    {
      if ((v8 == 0LL) != (v6 != 0LL))
      {
        unsigned __int8 v7 = [v8 isEqual:v6];

        if ((v7 & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
      }

      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBLENearbyActionV2AdvertiserUpdate]",  30LL,  "BLE NearbyActionV2 advertiser updating target data <%.3@> -> <%.3@>\n",  v8,  v6);
      }

      -[RPNearbyActionV2Advertiser setTargetData:](self->_bleNearbyActionV2Advertiser, "setTargetData:", v6);
      goto LABEL_15;
    }

LABEL_15:
  }

- (void)_clientBonjourEnsureStarted
{
  if (!self->_bonjourBrowser)
  {
    if (self->_btAdvAddrData)
    {
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourEnsureStarted]",  30LL,  "Bonjour browser start\n");
      }

      id v3 = objc_alloc_init(&OBJC_CLASS___CUBonjourBrowser);
      bonjourBrowser = self->_bonjourBrowser;
      self->_bonjourBrowser = v3;

      if (self->_prefNoInfra) {
        uint64_t v5 = 0x8000000000000LL;
      }
      else {
        uint64_t v5 = 0x20000000000000LL;
      }
      -[CUBonjourBrowser setBrowseFlags:](self->_bonjourBrowser, "setBrowseFlags:", v5);
      -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowser, "setChangeFlags:", 0xFFFFFFFFLL);
      -[CUBonjourBrowser setControlFlags:](self->_bonjourBrowser, "setControlFlags:", 1LL);
      -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowser, "setDispatchQueue:", self->_dispatchQueue);
      -[CUBonjourBrowser setDomain:](self->_bonjourBrowser, "setDomain:", @"local.");
      -[CUBonjourBrowser setLabel:](self->_bonjourBrowser, "setLabel:", @"RDLink");
      -[CUBonjourBrowser setServiceType:](self->_bonjourBrowser, "setServiceType:", @"_rdlink._tcp");
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100099BF8;
      v8[3] = &unk_100111918;
      v8[4] = self;
      -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowser, "setDeviceFoundHandler:", v8);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100099C14;
      v7[3] = &unk_100111918;
      v7[4] = self;
      -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowser, "setDeviceLostHandler:", v7);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100099C78;
      v6[3] = &unk_100111940;
      v6[4] = self;
      -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowser, "setDeviceChangedHandler:", v6);
      -[CUBonjourBrowser activate](self->_bonjourBrowser, "activate");
    }

    else if (dword_100132BB0 <= 20 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourEnsureStarted]",  20LL,  "Deferring Bonjour browse without BT addr\n");
    }
  }

- (void)_clientBonjourEnsureStopped
{
  if (self->_bonjourBrowser)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourEnsureStopped]",  30LL,  "Bonjour browser stop\n");
    }

    -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0LL;

    pendingLostDevicesTimer = self->_pendingLostDevicesTimer;
    if (pendingLostDevicesTimer)
    {
      dispatch_source_cancel((dispatch_source_t)pendingLostDevicesTimer);
      uint64_t v5 = self->_pendingLostDevicesTimer;
      self->_pendingLostDevicesTimer = 0LL;
    }

    -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
  }

- (BOOL)_clientBonjourFoundDevice:(id)a3 reevaluate:(BOOL)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 txtDictionary]);
  if (self->_btAdvAddrStr)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"rpBA", TypeID, 0LL);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    os_signpost_id_t v11 = v10;
    if (!v10)
    {
      if (dword_100132BB0 > 10
        || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 10LL))
      {
        goto LABEL_42;
      }

      uint64_t v14 = CUDescriptionWithLevel(v6, 30LL);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  10LL,  "Ignoring device with no BLE address: %@\n",  v13);
LABEL_10:

      goto LABEL_42;
    }

    if ([v10 isEqual:self->_btAdvAddrStr])
    {
      if (dword_100132BB0 > 10
        || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 10LL))
      {
        goto LABEL_42;
      }

      uint64_t v12 = CUDescriptionWithLevel(v6, 30LL);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  10LL,  "Ignoring our own Bonjour device: %@\n",  v13);
      goto LABEL_10;
    }
  }

  uint64_t Int64 = CFDictionaryGetInt64(v7, @"rpRF", 0LL);
  if (!Int64)
  {
    if ((CFDictionaryGetInt64(v7, @"rpFl", 0LL) & 0x800) != 0)
    {
      if (dword_100132BB0 > 10
        || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 10LL))
      {
        goto LABEL_43;
      }

      uint64_t v34 = CUDescriptionWithLevel(v6, 30LL);
      os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue(v34);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  10LL,  "Ignoring ConnectOnly Bonjour device: %@\n",  v11);
      goto LABEL_42;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resolveIdentityForBonjourDevice:v6 typeFlags:3074]);
    id v19 = v18;
    if (!v18)
    {
      if (dword_100132BB0 <= 10
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 10LL)))
      {
        uint64_t v35 = CUDescriptionWithLevel(v6, 30LL);
        id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  10LL,  "Ignoring found unresolved device: %@\n",  v36);
      }

      -[RPRemoteDisplayDaemon _clientBonjourFoundUnresolvedDevice:](self, "_clientBonjourFoundUnresolvedDevice:", v6);
      BOOL v21 = 0;
      goto LABEL_101;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 idsDeviceID]);
    BOOL v21 = v20 != 0LL;
    if (!v20)
    {
      if (dword_100132BB0 <= 90
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      {
        uint64_t v38 = CUDescriptionWithLevel(v6, 30LL);
        unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  90LL,  "Ignoring found device with missing IDS device ID: %@\n",  v39);
      }

      -[RPRemoteDisplayDaemon _clientBonjourFoundUnresolvedDevice:](self, "_clientBonjourFoundUnresolvedDevice:", v6);
      goto LABEL_100;
    }

    if (!a4) {
      -[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices](self, "_clientBonjourReevaluateDevices");
    }
    __int128 v76 = (void *)objc_claimAutoreleasedReturnValue([v19 model]);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 idsDeviceMap]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v20]);

    __int128 v74 = v24;
    if (v24)
    {
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 modelIdentifier]);
      uint64_t v26 = v25;
      if (v25)
      {
        id v27 = v25;

        __int128 v76 = v27;
      }
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingLostDevices,  "setObject:forKeyedSubscript:",  0LL,  v20);
    __int128 v75 = v20;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( self,  "_findMatchingDeviceWithIdentifier:",  v20));
    if (v28)
    {
      BOOL v29 = v28;
      id v30 = [v28 updateWithBonjourDevice:v6];
      if (v76)
      {
        id v31 = (id)objc_claimAutoreleasedReturnValue([v29 model]);
        id v32 = v76;
        BOOL v33 = v32;
        if (v31 == v32)
        {
        }

        else
        {
          if (!v31)
          {

LABEL_61:
            [v29 setModel:v33];
            id v30 = (id)(v30 | 2);
            -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]( self,  "_requestCameraCapabilitiesForDevice:",  v29);
LABEL_62:
            if (dword_100132BB0 <= 30
              && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
            {
              uint64_t v42 = CUDescriptionWithLevel(v6, 30LL);
              __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  30LL,  "Bonjour device changed %@, %@\n",  v75,  v43);
            }

            __int128 v83 = 0u;
            __int128 v84 = 0u;
            __int128 v81 = 0u;
            __int128 v82 = 0u;
            __int128 v44 = self->_xpcConnections;
            id v45 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v81,  v86,  16LL);
            if (v45)
            {
              id v46 = v45;
              BOOL v69 = v21;
              __int128 v70 = v19;
              __int128 v71 = v17;
              __int128 v73 = v7;
              uint64_t v47 = *(void *)v82;
              do
              {
                for (i = 0LL; i != v46; i = (char *)i + 1)
                {
                  if (*(void *)v82 != v47) {
                    objc_enumerationMutation(v44);
                  }
                  __int128 v49 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
                  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 activatedDiscovery]);
                  unsigned int v51 = [v50 shouldReportDevice:v29];

                  if (v51)
                  {
                    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v49 xpcCnx]);
                    id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 remoteObjectProxy]);
                    [v53 remoteDisplayChangedDevice:v29 changes:v30];
                  }
                }

                id v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v81,  v86,  16LL);
              }

              while (v46);

LABEL_98:
              id v17 = v71;
              unsigned __int8 v7 = v73;
              id v19 = v70;
              BOOL v21 = v69;
              goto LABEL_99;
            }

LABEL_77:
LABEL_99:

            id v20 = v75;
LABEL_100:

LABEL_101:
            goto LABEL_44;
          }

          unsigned __int8 v72 = [v31 isEqual:v32];

          if ((v72 & 1) == 0) {
            goto LABEL_61;
          }
        }
      }

      -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:](self, "_requestCameraCapabilitiesForDevice:", v29);
      if (!(_DWORD)v30) {
        goto LABEL_77;
      }
      goto LABEL_62;
    }

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      uint64_t v40 = CUDescriptionWithLevel(v6, 30LL);
      unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  30LL,  "Bonjour device found: %@, %@\n",  v20,  v41);
    }

    uint64_t v54 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDevice);
    -[RPRemoteDisplayDevice setIdentifier:](v54, "setIdentifier:", v75);
    -[RPRemoteDisplayDevice setIdsDevice:](v54, "setIdsDevice:", v24);
    -[RPRemoteDisplayDevice setIdsDeviceIdentifier:](v54, "setIdsDeviceIdentifier:", v75);
    -[RPRemoteDisplayDevice setModel:](v54, "setModel:", v76);
    -[RPRemoteDisplayDevice setPersistentIdentifier:](v54, "setPersistentIdentifier:", v75);
    __int128 v71 = v17;
    if ([v19 type] == 2)
    {
      uint64_t v55 = 0x80000LL;
    }

    else if ([v19 type] == 12)
    {
      uint64_t v55 = 0x1000000000LL;
    }

    else
    {
      if ([v19 type] != 13)
      {
LABEL_86:
        BOOL v69 = v21;
        __int128 v70 = v19;
        __int128 v73 = v7;
        -[RPRemoteDisplayDevice updateWithBonjourDevice:](v54, "updateWithBonjourDevice:", v6);
        discoveredDevices = self->_discoveredDevices;
        if (!discoveredDevices)
        {
          v57 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          unsigned int v58 = self->_discoveredDevices;
          self->_discoveredDevices = v57;

          discoveredDevices = self->_discoveredDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v54, v75);
        -[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:](self, "_requestCameraCapabilitiesForDevice:", v54);
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        unint64_t v59 = self->_xpcConnections;
        id v60 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v59,  "countByEnumeratingWithState:objects:count:",  &v77,  v85,  16LL);
        if (v60)
        {
          id v61 = v60;
          uint64_t v62 = *(void *)v78;
          do
          {
            for (j = 0LL; j != v61; j = (char *)j + 1)
            {
              if (*(void *)v78 != v62) {
                objc_enumerationMutation(v59);
              }
              unint64_t v64 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)j);
              v65 = (void *)objc_claimAutoreleasedReturnValue([v64 activatedDiscovery]);
              unsigned int v66 = [v65 shouldReportDevice:v54];

              if (v66)
              {
                unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v64 xpcCnx]);
                v68 = (void *)objc_claimAutoreleasedReturnValue([v67 remoteObjectProxy]);
                [v68 remoteDisplayFoundDevice:v54];
              }
            }

            id v61 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v59,  "countByEnumeratingWithState:objects:count:",  &v77,  v85,  16LL);
          }

          while (v61);
        }

        -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
        goto LABEL_98;
      }

      uint64_t v55 = 0x2000000000LL;
    }

    -[RPRemoteDisplayDevice setStatusFlags:]( v54,  "setStatusFlags:",  (unint64_t)-[RPRemoteDisplayDevice statusFlags](v54, "statusFlags") | v55);
    goto LABEL_86;
  }

  uint64_t v16 = CUDescriptionWithLevel(v6, 30LL);
  os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
  LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]",  20LL,  "Ignoring device with unsupported requirements: %#ll{flags}, %@\n",  Int64,  &unk_10010B0C5,  v11);
LABEL_42:

LABEL_43:
  BOOL v21 = 0;
LABEL_44:

  return v21;
}

- (void)_clientBonjourLostDevice:(id)a3
{
  id v13 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resolveIdentityForBonjourDevice:v13 typeFlags:2]);
  id v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( self,  "_findMatchingDeviceWithIdentifier:",  v7));
      if (v8)
      {
        pendingLostDevices = self->_pendingLostDevices;
        if (!pendingLostDevices)
        {
          unsigned int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          os_signpost_id_t v11 = self->_pendingLostDevices;
          self->_pendingLostDevices = v10;

          pendingLostDevices = self->_pendingLostDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](pendingLostDevices, "setObject:forKeyedSubscript:", v13, v7);
        -[RPRemoteDisplayDaemon _schedulePendingLostDeviceTimer](self, "_schedulePendingLostDeviceTimer");
      }
    }

    else
    {
      if (dword_100132BB0 > 90
        || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 90LL))
      {
        goto LABEL_11;
      }

      uint64_t v12 = CUDescriptionWithLevel(v13, 30LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourLostDevice:]",  90LL,  "Ignoring lost device with missing IDS device ID: %@\n",  v8);
    }

LABEL_11:
  }
}

- (void)_schedulePendingLostDeviceTimer
{
  if (!self->_pendingLostDevicesTimer)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _schedulePendingLostDeviceTimer]",  30LL,  "Scheduling timer to process lost bonjour devices, count %d",  -[NSMutableDictionary count](self->_pendingLostDevices, "count"));
    }

    id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    pendingLostDevicesTimer = self->_pendingLostDevicesTimer;
    self->_pendingLostDevicesTimer = v3;

    uint64_t v5 = self->_pendingLostDevicesTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10009A8E0;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    CUDispatchTimerSet(self->_pendingLostDevicesTimer, 0.5, -1.0, 0.5);
    dispatch_activate((dispatch_object_t)self->_pendingLostDevicesTimer);
  }

- (void)_processPendingLostDevices
{
  v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _processPendingLostDevices]",  30LL,  "Processing lost bonjour devices, count %d",  -[NSMutableDictionary count](v2->_pendingLostDevices, "count"));
  }
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_pendingLostDevices, "allKeys"));
  id v34 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v34)
  {
    id v32 = v2;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_pendingLostDevices,  "objectForKeyedSubscript:",  v4));
        id v6 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( v2,  "_findMatchingDeviceWithIdentifier:",  v4));
        if ([v6 removeBonjourDevice:v5])
        {
          if (dword_100132BB0 <= 30
            && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
          {
            uint64_t v7 = CUDescriptionWithLevel(v5, 30LL);
            id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
            LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _processPendingLostDevices]",  30LL,  "Bonjour device lost (removed): %@, %@\n",  v4,  v8);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_discoveredDevices,  "setObject:forKeyedSubscript:",  0LL,  v4);
          [v6 clearCameraCapabilitiesRefetchTimer];
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          os_signpost_id_t v11 = v2->_xpcConnections;
          id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v40;
            do
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v40 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)j);
                id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activatedDiscovery]);
                unsigned int v18 = [v17 shouldReportDevice:v6];

                if (v18)
                {
                  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 xpcCnx]);
                  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 remoteObjectProxy]);
                  [v20 remoteDisplayLostDevice:v6];
                }
              }

              id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v39,  v48,  16LL);
            }

            while (v13);
LABEL_38:
            v2 = v32;
          }
        }

        else
        {
          if (dword_100132BB0 <= 30
            && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
          {
            uint64_t v9 = CUDescriptionWithLevel(v5, 30LL);
            unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
            LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _processPendingLostDevices]",  30LL,  "Bonjour device lost (changed): %@, %@\n",  v4,  v10);
          }

          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          os_signpost_id_t v11 = v2->_xpcConnections;
          id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v35,  v47,  16LL);
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v36;
            do
            {
              for (k = 0LL; k != v22; k = (char *)k + 1)
              {
                if (*(void *)v36 != v23) {
                  objc_enumerationMutation(v11);
                }
                unsigned int v25 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)k);
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 activatedDiscovery]);
                unsigned int v27 = [v26 shouldReportDevice:v6];

                if (v27)
                {
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 xpcCnx]);
                  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v28 remoteObjectProxy]);
                  [v29 remoteDisplayChangedDevice:v6 changes:2];
                }
              }

              id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v35,  v47,  16LL);
            }

            while (v22);
            goto LABEL_38;
          }
        }
      }

      id v34 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }

    while (v34);
  }

  -[NSMutableDictionary removeAllObjects](v2->_pendingLostDevices, "removeAllObjects");
  pendingLostDevices = v2->_pendingLostDevices;
  v2->_pendingLostDevices = 0LL;

  -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](v2, "_updateXPCMatchingDiscovery");
}

- (void)_clientBonjourFoundUnresolvedDevice:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    unresolvedDevices = self->_unresolvedDevices;
    if (!unresolvedDevices)
    {
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v8 = self->_unresolvedDevices;
      self->_unresolvedDevices = v7;

      unresolvedDevices = self->_unresolvedDevices;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](unresolvedDevices, "setObject:forKeyedSubscript:", v9, v5);
  }
}

- (void)_clientBonjourLostUnresolvedDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  uint64_t v5 = v6;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_unresolvedDevices,  "setObject:forKeyedSubscript:",  0LL,  v6);
    uint64_t v5 = v6;
  }
}

- (void)_clientBonjourReconfirmDevice:(id)a3 reason:(const char *)a4
{
  id v5 = a3;
  id v9 = v5;
  if (dword_100132BB0 <= 30)
  {
    if (dword_100132BB0 != -1 || (int v6 = _LogCategory_Initialize(&dword_100132BB0, 30LL), v5 = v9, v6))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourReconfirmDevice:reason:]",  30LL,  "Bonjour reconfirm (%s): %@\n",  a4,  v5);
      id v5 = v9;
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bonjourDevice]);
  id v8 = v7;
  if (v7) {
    [v7 reconfirm];
  }
}

- (void)_clientBonjourReevaluateDevices
{
  if (-[NSMutableDictionary count](self->_unresolvedDevices, "count")
    && dword_100132BB0 <= 30
    && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices]",  30LL,  "Re-evaluating devices\n");
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)i) bonjourDevice]);
        if (v8) {
          -[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]( self,  "_clientBonjourFoundDevice:reevaluate:",  v8,  1LL);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v5);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_unresolvedDevices, "allValues"));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)j);
        if (-[RPRemoteDisplayDaemon _clientBonjourFoundDevice:reevaluate:]( self,  "_clientBonjourFoundDevice:reevaluate:",  v14,  1LL))
        {
          if (dword_100132BB0 <= 30
            && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
          {
            LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourReevaluateDevices]",  30LL,  "Removing unresolved device after re-evaluating: %@\n",  v14);
          }

          -[RPRemoteDisplayDaemon _clientBonjourLostUnresolvedDevice:](self, "_clientBonjourLostUnresolvedDevice:", v14);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v11);
  }
}

- (void)_clientBonjourAWDLBrowserEnsureStarted
{
  if (!self->_bonjourBrowserAWDL)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStarted]",  30LL,  "Bonjour AWDL browser start\n");
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
    [v3 activateForClient:@"Sidecar"];

    id v4 = objc_alloc_init(&OBJC_CLASS___CUBonjourBrowser);
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = v4;

    -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowserAWDL, "setChangeFlags:", 0xFFFFFFFFLL);
    -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowserAWDL, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBonjourBrowser setDomain:](self->_bonjourBrowserAWDL, "setDomain:", @"local.");
    -[CUBonjourBrowser setInterfaceName:](self->_bonjourBrowserAWDL, "setInterfaceName:", @"awdl0");
    -[CUBonjourBrowser setLabel:](self->_bonjourBrowserAWDL, "setLabel:", @"RDLink");
    -[CUBonjourBrowser setServiceType:](self->_bonjourBrowserAWDL, "setServiceType:", @"_rdlink._tcp");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10009B3A4;
    v11[3] = &unk_100111918;
    v11[4] = self;
    -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowserAWDL, "setDeviceFoundHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009B3BC;
    v10[3] = &unk_100111918;
    v10[4] = self;
    -[CUBonjourBrowser setDeviceLostHandler:](self->_bonjourBrowserAWDL, "setDeviceLostHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009B3D4;
    v9[3] = &unk_100111940;
    v9[4] = self;
    -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowserAWDL, "setDeviceChangedHandler:", v9);
    -[CUBonjourBrowser activate](self->_bonjourBrowserAWDL, "activate");
    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    if (bonjourBrowserAWDLProcess)
    {
      uint64_t v7 = bonjourBrowserAWDLProcess;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetrics](&OBJC_CLASS___RPMetrics, "sharedMetrics"));
      [v8 logAWDLBrowseClient:v7];
    }
  }

- (void)_clientBonjourAWDLBrowserEnsureStopped
{
  if (self->_bonjourBrowserAWDL)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserEnsureStopped]",  30LL,  "Bonjour AWDL browser stop\n");
    }

    -[CUBonjourBrowser invalidate](self->_bonjourBrowserAWDL, "invalidate");
    bonjourBrowserAWDL = self->_bonjourBrowserAWDL;
    self->_bonjourBrowserAWDL = 0LL;

    bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
    self->_bonjourBrowserAWDLProcess = 0LL;

    if (!self->_bonjourAWDLAdvertiser)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
      [v5 invalidateForClient:@"Sidecar"];
    }

    -[NSMutableDictionary removeAllObjects](self->_bonjourAWDLDevices, "removeAllObjects");
    bonjourAWDLDevices = self->_bonjourAWDLDevices;
    self->_bonjourAWDLDevices = 0LL;
  }

- (BOOL)_clientBonjourAWDLBrowserShouldRun
{
  if (self->_bonjourBrowserAWDLForce) {
    return 1;
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_activatedSessionSet;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "needsAWDL", (void)v15))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 xpcCnx]);
          id v11 = sub_10000A8B0((uint64_t)[v10 processIdentifier]);
          uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
          bonjourBrowserAWDLProcess = self->_bonjourBrowserAWDLProcess;
          self->_bonjourBrowserAWDLProcess = v12;

          BOOL v2 = 1;
          goto LABEL_13;
        }
      }

      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v2 = 0;
LABEL_13:

  return v2;
}

- (void)_clientBonjourAWDLBrowserFoundDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 txtDictionary]);
  uint64_t Int64 = CFDictionaryGetInt64(v5, @"rpRF", 0LL);
  if (Int64)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      uint64_t v7 = CUDescriptionWithLevel(v4, 30LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Ignoring AWDL device with unsupported requirements: %#ll{flags}, %@\n",  Int64,  &unk_10010B0C5,  v8);
LABEL_9:

      goto LABEL_71;
    }

    goto LABEL_71;
  }

  uint64_t v9 = CFDictionaryGetInt64(v5, @"rpFl", 0LL);
  if ((v9 & 0x800) != 0)
  {
    if ((v9 & 0x80000) != 0)
    {
      -[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:](self, "_clientAWDLPairingSessionWithDevice:", v4);
      goto LABEL_71;
    }

    id v60 = self;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resolveIdentityForBonjourDevice:v4 typeFlags:3074]);
    id v13 = v12;
    if (v12)
    {
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceID]);
      if (v62)
      {
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          uint64_t v14 = CUDescriptionWithLevel(v4, 30LL);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v60->_bonjourAWDLDevices,  "objectForKeyedSubscript:",  v62));
          __int128 v17 = "(update)";
          if (!v16) {
            __int128 v17 = "(new)";
          }
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Found AWDL device: %@, %@ %s\n",  v62,  v15,  v17);
        }

        v57 = v13;
        unsigned int v58 = v11;
        unint64_t v59 = v5;
        __int128 v22 = v60;
        bonjourAWDLDevices = v60->_bonjourAWDLDevices;
        if (!bonjourAWDLDevices)
        {
          __int128 v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          unsigned int v25 = v60->_bonjourAWDLDevices;
          v60->_bonjourAWDLDevices = v24;

          bonjourAWDLDevices = v60->_bonjourAWDLDevices;
        }

        uint64_t v26 = v62;
        -[NSMutableDictionary setObject:forKeyedSubscript:](bonjourAWDLDevices, "setObject:forKeyedSubscript:", v4, v62);
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        unsigned int v27 = v60->_xpcConnections;
        id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v65,  v73,  16LL);
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v66;
          id v61 = v27;
          do
          {
            id v31 = 0LL;
            do
            {
              if (*(void *)v66 != v30) {
                objc_enumerationMutation(v27);
              }
              id v32 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v31);
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 clientNetCnx]);
              unsigned __int8 v34 = [v33 present];

              if ((v34 & 1) == 0)
              {
                uint64_t v35 = v30;
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v32 activatedSession]);
                __int128 v37 = v36;
                __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 daemonDevice]);
                __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
                v63 = v38;
                if ([v39 isEqual:v26])
                {

LABEL_43:
                  [v37 setBonjourDevice:v4];
                  if (dword_100132BB0 <= 30
                    && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
                  {
                    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v37 serviceType]);
                    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "Start connection to found AWDL device (%@) for service type %@ \n",  v63,  v44);
                  }

                  id v49 = sub_100098440();
                  __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                  id v51 = sub_100098440();
                  __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
                  os_signpost_id_t v53 = os_signpost_id_make_with_pointer(v52, v22);

                  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
                  {
                    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v37 serviceType]);
                    *(_DWORD *)buf = 138412546;
                    __int128 v70 = v63;
                    __int16 v71 = 2112;
                    unsigned __int8 v72 = v54;
                    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v50,  OS_SIGNPOST_EVENT,  v53,  "Found AWDL device",  "Start connection to found AWDL device (%@) for service type %@ \n",  buf,  0x16u);
                  }

                  id v64 = 0LL;
                  __int128 v45 = v63;
                  unsigned __int8 v55 = [v32 netConnectionStartWithDevice:v63 session:v37 error:&v64];
                  id v46 = v64;
                  if ((v55 & 1) != 0)
                  {
                    unsigned int v27 = v61;
                    uint64_t v26 = v62;
                    goto LABEL_60;
                  }

                  unsigned int v27 = v61;
                  if (dword_100132BB0 <= 90)
                  {
                    uint64_t v26 = v62;
                    if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)) {
                      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]",  90LL,  "### Start connection on found AWDL device failed: %@, %{error}\n",  v63,  v46);
                    }
LABEL_60:

LABEL_61:
LABEL_62:

                    uint64_t v30 = v35;
                    goto LABEL_63;
                  }
                }

                else
                {
                  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v38 bleDevice]);
                  id v41 = v4;
                  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v40 rapportIdentifier]);
                  unsigned __int8 v43 = [v42 isEqual:v26];

                  id v4 = v41;
                  __int128 v22 = v60;

                  if ((v43 & 1) != 0) {
                    goto LABEL_43;
                  }
                  unsigned int v27 = v61;
                  uint64_t v26 = v62;
                  __int128 v45 = v63;
                  if (dword_100132BB0 > 30
                    || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 30LL))
                  {
                    goto LABEL_61;
                  }

                  id v46 = (id)objc_claimAutoreleasedReturnValue([v63 identifier]);
                  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v63 bleDevice]);
                  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 rapportIdentifier]);
                  LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserFoundDevice:]",  30LL,  "AWDL device idsDeviceID %@ did not match identifier %@ rapportIdentifier %@\n",  v62,  v46,  v48);

                  __int128 v45 = v63;
                }

                uint64_t v26 = v62;
                goto LABEL_60;
              }

- (void)_clientAWDLPairingSessionWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 txtDictionary]);
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v5, @"rpPI", TypeID, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t v9 = v8;
  if (v8 && (unint64_t)[v8 length] > 0xF)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v10 = self->_xpcConnections;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v34;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          __int128 v15 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientNetCnx]);
          unsigned __int8 v17 = [v16 present];

          if ((v17 & 1) == 0)
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 activatedSession]);
            __int128 v19 = v18;
            if (v18)
            {
              if ([v18 needsAWDL])
              {
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairingInfo]);

                if (v20)
                {
                  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 pairingInfo]);
                  id v32 = 0LL;
                  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v21,  16LL,  &v32));
                  id v23 = v32;

                  if (v23
                    && dword_100132BB0 <= 30
                    && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
                  {
                    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]",  30LL,  "JSON error: %@\n",  v23);
                  }

                  CFTypeID v24 = CFStringGetTypeID();
                  uint64_t v25 = CFDictionaryGetTypedValue(v22, @"_pi", v24, 0LL);
                  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
                  if (dword_100132BB0 <= 30
                    && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
                  {
                    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]",  30LL,  "AWDL pairing device: awdlPairingID %@ sessionPairingID %@\n",  v9,  v26);
                  }

                  if (v26 && ([v26 isEqualToString:v9] & 1) != 0)
                  {
                    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v19 daemonDevice]);
                    [v19 setBonjourDevice:v4];
                    if (dword_100132BB0 <= 30
                      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
                    {
                      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceType]);
                      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]",  30LL,  "Start connection to found AWDL device (%@) for service type %@ \n",  v4,  v27);
                    }

                    id v31 = 0LL;
                    unsigned __int8 v28 = [v15 netConnectionStartWithDevice:v30 session:v19 error:&v31];
                    id v29 = v31;
                    if ((v28 & 1) == 0
                      && dword_100132BB0 <= 90
                      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
                    {
                      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]",  90LL,  "### Start connection on found AWDL device failed: %@, %{error}\n",  v30,  v29);
                    }
                  }

                  else if (dword_100132BB0 <= 90 {
                         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
                  }
                  {
                    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientAWDLPairingSessionWithDevice:]",  90LL,  "Ignoring device found over AWDL, pairing ID (%@) did not match session pairing ID (%@)\n",  v9,  v26);
                  }

                  goto LABEL_48;
                }
              }
            }
          }
        }

        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
        if (v12) {
          continue;
        }
        break;
      }
    }

- (void)_clientBonjourAWDLBrowserLostDevice:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resolveIdentityForBonjourDevice:v13 typeFlags:2]);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
    if (v7)
    {
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        uint64_t v8 = CUDescriptionWithLevel(v13, 30LL);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserLostDevice:]",  30LL,  "Lost AWDL device: %@, %@\n",  v7,  v9);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_bonjourAWDLDevices,  "setObject:forKeyedSubscript:",  0LL,  v7);
    }

    else if (dword_100132BB0 <= 90 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    }
    {
      uint64_t v11 = CUDescriptionWithLevel(v13, 30LL);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserLostDevice:]",  90LL,  "Ignoring lost AWDL device with missing IDS device ID: %@\n",  v12);
    }

    goto LABEL_14;
  }

  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  {
    uint64_t v10 = CUDescriptionWithLevel(v13, 30LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _clientBonjourAWDLBrowserLostDevice:]",  30LL,  "Ignoring lost unresolved AWDL device: %@\n",  v7);
LABEL_14:
  }
}

- (void)_clientLostAllDevices
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues"));
  id v2 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        [v5 clearCameraCapabilitiesRefetchTimer];
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v6 = self->_xpcConnections;
        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v21;
          do
          {
            for (j = 0LL; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)j);
              id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activatedDiscovery]);
              unsigned int v13 = [v12 shouldReportDevice:v5];

              if (v13)
              {
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 xpcCnx]);
                __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteObjectProxy]);
                [v15 remoteDisplayLostDevice:v5];
              }
            }

            id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
          }

          while (v8);
        }
      }

      id v3 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v3);
  }

  -[NSMutableDictionary removeAllObjects](self->_discoveredDevices, "removeAllObjects");
  discoveredDevices = self->_discoveredDevices;
  self->_discoveredDevices = 0LL;

  -[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery](self, "_updateXPCMatchingDiscovery");
}

- (void)_clientSendNeedsAWDLOverWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 49LL;
  if (a3) {
    uint64_t v5 = 47LL;
  }
  id v6 = (&self->super.isa)[v5];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v6;
  id v7 = -[objc_class countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
        -[RPCompanionLinkClient setDispatchQueue:](v12, "setDispatchQueue:", self->_dispatchQueue);
        unsigned int v13 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
        -[RPCompanionLinkDevice setIdentifier:](v13, "setIdentifier:", v11);
        -[RPCompanionLinkClient setDestinationDevice:](v12, "setDestinationDevice:", v13);
        -[RPCompanionLinkClient setControlFlags:]( v12,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v12, "controlFlags") | 0x400000);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
        [v14 setObject:v15 forKeyedSubscript:@"_i"];

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
        [v14 setObject:v16 forKeyedSubscript:@"_ena"];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10009C888;
        v21[3] = &unk_100114900;
        v21[4] = v11;
        v21[5] = v12;
        BOOL v24 = v3;
        id v22 = v14;
        __int128 v23 = self;
        BOOL v25 = v3;
        id v17 = v14;
        -[RPCompanionLinkClient activateWithCompletion:](v12, "activateWithCompletion:", v21);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[objc_class countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    }

    while (v8);
  }

  if (!v3)
  {
    needsAWDLSentToPeers = self->_needsAWDLSentToPeers;
    self->_needsAWDLSentToPeers = 0LL;
  }

  needsAWDLNewPeers = self->_needsAWDLNewPeers;
  self->_needsAWDLNewPeers = 0LL;
}

- (void)_serverEnsureStarted
{
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
  {
    if (self->_prefServerBonjourInfra)
    {
      unsigned int v3 = -[RPRemoteDisplayDaemon _serverBonjourAWDLNeeded](self, "_serverBonjourAWDLNeeded");
      -[RPRemoteDisplayDaemon _serverTCPEnsureStarted](self, "_serverTCPEnsureStarted");
LABEL_4:
      -[RPRemoteDisplayDaemon _serverBonjourEnsureStarted](self, "_serverBonjourEnsureStarted");
LABEL_15:
      if (-[RPRemoteDisplayDaemon _serverBLEDiscoveryShouldStart](self, "_serverBLEDiscoveryShouldStart")) {
        -[RPRemoteDisplayDaemon _serverBLEDiscoveryEnsureStarted](self, "_serverBLEDiscoveryEnsureStarted");
      }
      else {
        -[RPRemoteDisplayDaemon _serverBLEDiscoveryEnsureStopped](self, "_serverBLEDiscoveryEnsureStopped");
      }
      if (self->_prefBLEServer
        && -[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryShouldRun]( self,  "_serverBLENearbyActionV2DiscoveryShouldRun"))
      {
        -[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryEnsureStarted]( self,  "_serverBLENearbyActionV2DiscoveryEnsureStarted");
      }

      else
      {
        -[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryEnsureStopped]( self,  "_serverBLENearbyActionV2DiscoveryEnsureStopped");
      }

      if (self->_prefBLEServer || self->_awdlPairingID) {
        -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStarted]( self,  "_serverBLENeedsAWDLScannerEnsureStarted");
      }
      else {
        -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStopped]( self,  "_serverBLENeedsAWDLScannerEnsureStopped");
      }
      if (v3) {
        -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted]( self,  "_serverBonjourAWDLAdvertiserEnsureStarted");
      }
      else {
        -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStopped]( self,  "_serverBonjourAWDLAdvertiserEnsureStopped");
      }
      if (!self->_serverIncomingMessageCLinkClient) {
        -[RPRemoteDisplayDaemon _serverRegisterForIncomingMessages](self, "_serverRegisterForIncomingMessages");
      }
      return;
    }

    unsigned __int8 v4 = -[CUSystemMonitor netFlags](self->_systemMonitor, "netFlags");
    unsigned int v5 = -[RPRemoteDisplayDaemon _serverBonjourAWDLNeeded](self, "_serverBonjourAWDLNeeded");
    unsigned int v3 = v5;
    if ((v4 & 1) != 0 || (v5 & 1) != 0)
    {
      -[RPRemoteDisplayDaemon _serverTCPEnsureStarted](self, "_serverTCPEnsureStarted");
      if ((v4 & 1) != 0) {
        goto LABEL_4;
      }
    }

    else
    {
      -[RPRemoteDisplayDaemon _serverTCPEnsureStopped](self, "_serverTCPEnsureStopped");
    }

    -[RPRemoteDisplayDaemon _serverBonjourEnsureStopped](self, "_serverBonjourEnsureStopped");
    goto LABEL_15;
  }

  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverEnsureStarted]",  30LL,  "Deferring server start until FirstUnlock\n");
  }
}

- (void)_serverEnsureStopped
{
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    -[RPCompanionLinkClient invalidate](clinkClient, "invalidate");
    unsigned __int8 v4 = self->_clinkClient;
    self->_clinkClient = 0LL;
  }

  serverIncomingMessageCLinkClient = self->_serverIncomingMessageCLinkClient;
  if (serverIncomingMessageCLinkClient)
  {
    -[RPCompanionLinkClient invalidate](serverIncomingMessageCLinkClient, "invalidate");
    id v6 = self->_serverIncomingMessageCLinkClient;
    self->_serverIncomingMessageCLinkClient = 0LL;

    needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
    if (needsAWDLRequestTimer)
    {
      uint64_t v9 = needsAWDLRequestTimer;
      dispatch_source_cancel(v9);
      id v8 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0LL;
    }
  }

- (void)_serverBLEDiscoveryEnsureStarted
{
  if (!self->_bleDiscovery)
  {
    -[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:](self, "_bleDiscoveryEnsureStarted:", 1LL);
    self->_serverBLEDiscoveryStarted = 1;
    -[RPRemoteDisplayDaemon _bleDiscoveryTriggerEnhancedDiscovery:useCase:]( self,  "_bleDiscoveryTriggerEnhancedDiscovery:useCase:",  @"StartWombatStream",  131087LL);
  }

- (void)_serverBLEDiscoveryEnsureStopped
{
  if (self->_serverBLEDiscoveryStarted) {
    -[RPRemoteDisplayDaemon _bleDiscoveryEnsureStopped](self, "_bleDiscoveryEnsureStopped");
  }
}

- (BOOL)_serverBLEDiscoveryShouldStart
{
  uint64_t DeviceClass = GestaltGetDeviceClass(self, a2);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)_serverBLENeedsAWDLScannerEnsureStarted
{
  if (self->_bleNeedsAWDLScanner)
  {
    BOOL v3 = -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerScreenOff](self, "_serverBLENeedsAWDLScannerScreenOff");
  }

  else
  {
    unsigned int bleNeedsAWDLScannerID = self->_bleNeedsAWDLScannerID;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStarted]",  30LL,  "BLE NeedsAWDL scanner start ID %u\n",  bleNeedsAWDLScannerID);
    }

    unsigned int v5 = (SFDeviceDiscovery *)objc_alloc_init((Class)off_100132C28[0]());
    bleNeedsAWDLScanner = self->_bleNeedsAWDLScanner;
    self->_bleNeedsAWDLScanner = v5;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleNeedsAWDLScanner, "setChangeFlags:", 1LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleNeedsAWDLScanner, "setDiscoveryFlags:", 131136LL);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleNeedsAWDLScanner, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setOverrideScreenOff:]( self->_bleNeedsAWDLScanner,  "setOverrideScreenOff:",  -[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerScreenOff](self, "_serverBLENeedsAWDLScannerScreenOff"));
    id v7 = -[SFDeviceDiscovery setPurpose:](self->_bleNeedsAWDLScanner, "setPurpose:", @"RDLink");
    else {
      uint64_t v9 = -60LL;
    }
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleNeedsAWDLScanner, "setRssiThreshold:", v9);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10009CFE8;
    v16[3] = &unk_100111828;
    v16[4] = self;
    unsigned int v17 = bleNeedsAWDLScannerID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleNeedsAWDLScanner, "setDeviceFoundHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10009D00C;
    v14[3] = &unk_100111828;
    v14[4] = self;
    unsigned int v15 = bleNeedsAWDLScannerID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleNeedsAWDLScanner, "setDeviceLostHandler:", v14);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10009D030;
    v12[3] = &unk_100111850;
    v12[4] = self;
    unsigned int v13 = bleNeedsAWDLScannerID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleNeedsAWDLScanner, "setDeviceChangedHandler:", v12);
    uint64_t v10 = self->_bleNeedsAWDLScanner;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10009D054;
    v11[3] = &unk_1001118A0;
    v11[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v10, "activateWithCompletion:", v11);
  }

- (void)_serverBLENeedsAWDLScannerEnsureStopped
{
  if (self->_bleNeedsAWDLScanner)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStopped]",  30LL,  "BLE NeedsAWDL scanner stop ID %u\n",  self->_bleNeedsAWDLScannerID);
    }

    -[SFDeviceDiscovery invalidate](self->_bleNeedsAWDLScanner, "invalidate");
    bleNeedsAWDLScanner = self->_bleNeedsAWDLScanner;
    self->_bleNeedsAWDLScanner = 0LL;

    ++self->_bleNeedsAWDLScannerID;
    -[NSMutableDictionary removeAllObjects](self->_needsAWDLDevices, "removeAllObjects");
    needsAWDLDevices = self->_needsAWDLDevices;
    self->_needsAWDLDevices = 0LL;
  }

- (BOOL)_serverBLENeedsAWDLScannerScreenOff
{
  return (GestaltGetDeviceClass(self, a2) & 0xFFFFFFFD) == 1;
}

- (void)_serverBLENeedsAWDLScannerDeviceFound:(id)a3
{
  id v10 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v10 idsIdentifier]);
  if (v4
    || (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]),
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]),
        v5,
        v4))
  {
    if (((unsigned __int16)[v10 deviceFlags] & 0xC008) != 0)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_needsAWDLDevices,  "objectForKeyedSubscript:",  v4));
      if ([v10 deviceActionType] == 50)
      {
        needsAWDLDevices = self->_needsAWDLDevices;
        if (!needsAWDLDevices)
        {
          uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v9 = self->_needsAWDLDevices;
          self->_needsAWDLDevices = v8;

          needsAWDLDevices = self->_needsAWDLDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](needsAWDLDevices, "setObject:forKeyedSubscript:", v10, v4);
        if (v6)
        {
          if (dword_100132BB0 <= 30
            && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
          {
            LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]",  30LL,  "NeedsAWDL device changed: %@\n",  v10);
          }
        }

        else if (dword_100132BB0 <= 30 {
               && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        }
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]",  30LL,  "NeedsAWDL device found: %@\n",  v10);
        }
      }

      else if (v6)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_needsAWDLDevices,  "setObject:forKeyedSubscript:",  0LL,  v4);
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]",  30LL,  "NeedsAWDL device removed: %@\n",  v6);
        }
      }

      -[RPRemoteDisplayDaemon _update](self, "_update");
    }

    else if (dword_100132BB0 <= 20 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]",  20LL,  "### Ignoring NeedsAWDL device that does not have expected status flags: %@\n",  v10);
    }
  }

  else
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceFound:]",  30LL,  "Ignoring NeedsAWDL device found, empty identifier: %@\n",  v10);
    }

    uint64_t v4 = 0LL;
  }
}

- (void)_serverBLENeedsAWDLScannerDeviceLost:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 idsIdentifier]);
  if (v4
    || (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]),
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]),
        v5,
        v4))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_needsAWDLDevices,  "objectForKeyedSubscript:",  v4));
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_needsAWDLDevices,  "setObject:forKeyedSubscript:",  0LL,  v4);
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceLost:]",  30LL,  "NeedsAWDL device removed: %@\n",  v6);
      }

      -[RPRemoteDisplayDaemon _update](self, "_update");
    }
  }

  else if (dword_100132BB0 <= 30 {
         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  }
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerDeviceLost:]",  30LL,  "Ignoring NeedsAWDL lost, empty identifier: %@\n",  v7);
  }
}

- (BOOL)_serverBLENearbyActionV2DiscoveryShouldRun
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
  id v4 = [v3 idsIsSignedIn];
  BOOL v6 = (_DWORD)v4
    && self->_prefNearbyActionV2
    && ((GestaltGetDeviceClass(v4, v5) & 0xFFFFFFFD) == 1 || [v3 idsHasMac]);

  return v6;
}

- (void)_serverBLENearbyActionV2DiscoveryEnsureStarted
{
  if (!self->_bleNearbyActionV2Discovery)
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___RPNearbyActionV2Discovery);
    bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = v3;

    -[RPNearbyActionV2Discovery setDiscoveryFlags:](self->_bleNearbyActionV2Discovery, "setDiscoveryFlags:", 33554688LL);
    -[RPNearbyActionV2Discovery setDispatchQueue:]( self->_bleNearbyActionV2Discovery,  "setDispatchQueue:",  self->_dispatchQueue);
    uint64_t wombatState = self->_wombatState;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009D7A4;
    v9[3] = &unk_100114928;
    v9[4] = self;
    -[RPRemoteDisplayDaemon _bluetoothUseCaseFromWombatState:resultBlock:]( self,  "_bluetoothUseCaseFromWombatState:resultBlock:",  wombatState,  v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10009D824;
    v8[3] = &unk_1001110A8;
    v8[4] = self;
    -[RPNearbyActionV2Discovery setUpdateHandler:](self->_bleNearbyActionV2Discovery, "setUpdateHandler:", v8);
    BOOL v6 = self->_bleNearbyActionV2Discovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009D850;
    v7[3] = &unk_1001118A0;
    v7[4] = self;
    -[RPNearbyActionV2Discovery activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }

- (void)_serverBLENearbyActionV2DiscoveryEnsureStopped
{
  bleNearbyActionV2Discovery = self->_bleNearbyActionV2Discovery;
  if (bleNearbyActionV2Discovery)
  {
    -[RPNearbyActionV2Discovery invalidate](bleNearbyActionV2Discovery, "invalidate");
    id v4 = self->_bleNearbyActionV2Discovery;
    self->_bleNearbyActionV2Discovery = 0LL;

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryEnsureStopped]",  30LL,  "BLE NearbyActionV2 discovery stopped\n");
    }
  }

- (void)_serverBonjourEnsureStarted
{
  if (self->_bonjourAdvertiser)
  {
    -[RPRemoteDisplayDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
    return;
  }

  if (!self->_btAdvAddrData)
  {
    uint64_t v5 = "Deferring Bonjour advertise without BT addr\n";
LABEL_14:
    LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon _serverBonjourEnsureStarted]", 20LL, v5);
    return;
  }

  id v3 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
  if ((int)v3 <= 0)
  {
    uint64_t v5 = "Deferring Bonjour advertise without TCP listening port\n";
    goto LABEL_14;
  }

  id v4 = v3;
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourEnsureStarted]",  30LL,  "Bonjour advertiser start\n");
  }
  BOOL v6 = objc_alloc_init(&OBJC_CLASS___CUBonjourAdvertiser);
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = v6;

  -[CUBonjourAdvertiser setDispatchQueue:](self->_bonjourAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
  -[CUBonjourAdvertiser setDomain:](self->_bonjourAdvertiser, "setDomain:", @"local.");
  -[CUBonjourAdvertiser setLabel:](self->_bonjourAdvertiser, "setLabel:", @"RDLink");
  -[CUBonjourAdvertiser setPort:](self->_bonjourAdvertiser, "setPort:", v4);
  -[CUBonjourAdvertiser setServiceType:](self->_bonjourAdvertiser, "setServiceType:", @"_rdlink._tcp");
  if (!sub_100009D20()) {
    -[CUBonjourAdvertiser setInterfaceIndex:]( self->_bonjourAdvertiser,  "setInterfaceIndex:",  -[RPRemoteDisplayDaemon _serverDirectLinkInterfaceIndex](self, "_serverDirectLinkInterfaceIndex"));
  }
  -[RPRemoteDisplayDaemon _serverBonjourUpdateTXT](self, "_serverBonjourUpdateTXT");
  -[CUBonjourAdvertiser activate](self->_bonjourAdvertiser, "activate");
}

- (void)_serverBonjourEnsureStopped
{
  if (self->_bonjourAdvertiser)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourEnsureStopped]",  30LL,  "Bonjour advertiser stop\n");
    }

    -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = 0LL;
  }

- (id)_serverBonjourAuthTagString
{
  if (!self->_deviceAuthTagStr)
  {
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _serverBonjourAuthTagStringWithData:]( self,  "_serverBonjourAuthTagStringWithData:",  self->_btAdvAddrData));
    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = v3;

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourAuthTagString]",  30LL,  "AuthTagDevice updated: <%@>\n",  self->_deviceAuthTagStr);
    }
  }

  return self->_deviceAuthTagStr;
}

- (id)_serverBonjourAuthTagStringWithData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identityOfSelfAndReturnError:0]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authTagForData:v4 type:1 error:0]);
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
        uint64_t v10 = NSPrintF("%.3H", [v9 bytes], objc_msgSend(v9, "length"), objc_msgSend(v9, "length"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      }

      else
      {
        uint64_t v11 = 0LL;
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (void)_serverBonjourUpdateTXT
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[RPRemoteDisplayDaemon _localDeviceUpdate](self, "_localDeviceUpdate");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _serverBonjourAuthTagString](self, "_serverBonjourAuthTagString"));
  if (v3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v3, @"rpAD");
  }

  btAdvAddrStr = self->_btAdvAddrStr;
  if (btAdvAddrStr) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", btAdvAddrStr, @"rpBA");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"630.42.2",  @"rpVr");
  -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAdvertiser, "setTxtDictionary:", v5);
}

- (void)_serverBonjourAWDLAdvertiserEnsureStarted
{
  if (self->_bonjourAWDLAdvertiser)
  {
    -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
  }

  else
  {
    id v3 = self->_btAdvAddrData;
    if (v3)
    {
      id v4 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
      if ((int)v4 <= 0)
      {
        if (dword_100132BB0 <= 20
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted]",  20LL,  "Deferring Bonjour AWDL advertise without TCP listening port\n");
        }
      }

      else
      {
        id v5 = v4;
        BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
        [v6 activateForClient:@"Sidecar"];

        id v7 = objc_alloc_init(&OBJC_CLASS___CUBonjourAdvertiser);
        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
        self->_bonjourAWDLAdvertiser = v7;

        -[CUBonjourAdvertiser setAdvertiseFlags:](self->_bonjourAWDLAdvertiser, "setAdvertiseFlags:", 2048LL);
        -[CUBonjourAdvertiser setDispatchQueue:]( self->_bonjourAWDLAdvertiser,  "setDispatchQueue:",  self->_dispatchQueue);
        -[CUBonjourAdvertiser setDomain:](self->_bonjourAWDLAdvertiser, "setDomain:", @"local.");
        -[CUBonjourAdvertiser setInterfaceName:](self->_bonjourAWDLAdvertiser, "setInterfaceName:", @"awdl0");
        -[CUBonjourAdvertiser setLabel:](self->_bonjourAWDLAdvertiser, "setLabel:", @"RDLink");
        uint64_t v9 = NSPrintF("RDLink-%@", v3);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        -[CUBonjourAdvertiser setName:](self->_bonjourAWDLAdvertiser, "setName:", v10);

        -[CUBonjourAdvertiser setPort:](self->_bonjourAWDLAdvertiser, "setPort:", v5);
        -[CUBonjourAdvertiser setServiceType:](self->_bonjourAWDLAdvertiser, "setServiceType:", @"_rdlink._tcp");
        -[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserUpdateTXT](self, "_serverBonjourAWDLAdvertiserUpdateTXT");
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          uint64_t v11 = CUDescriptionWithLevel(self->_bonjourAWDLAdvertiser, 30LL);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted]",  30LL,  "Bonjour AWDL advertiser start: %@\n",  v12);
        }

        id v13 = sub_100098440();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        id v15 = sub_100098440();
        __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);

        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          uint64_t v18 = CUDescriptionWithLevel(self->_bonjourAWDLAdvertiser, 30LL);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          *(_DWORD *)buf = 138412290;
          __int128 v21 = v19;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  v17,  "Bonjour AWDL advertiser start",  "Bonjour AWDL advertiser start: %@\n",  buf,  0xCu);
        }

        -[CUBonjourAdvertiser activate](self->_bonjourAWDLAdvertiser, "activate");
      }
    }

    else if (dword_100132BB0 <= 20 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStarted]",  20LL,  "Deferring Bonjour AWDL advertise without BT addr\n");
    }
  }

- (void)_serverBonjourAWDLAdvertiserEnsureStopped
{
  bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
  if (bonjourAWDLAdvertiser)
  {
    if (dword_100132BB0 <= 30)
    {
      if (dword_100132BB0 != -1
        || (int v6 = _LogCategory_Initialize(&dword_100132BB0, 30LL),
            bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser,
            v6))
      {
        uint64_t v4 = CUDescriptionWithLevel(bonjourAWDLAdvertiser, 30LL);
        id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserEnsureStopped]",  30LL,  "Bonjour AWDL advertiser stop: %@\n",  v5);

        bonjourAWDLAdvertiser = self->_bonjourAWDLAdvertiser;
      }
    }

    -[CUBonjourAdvertiser invalidate](bonjourAWDLAdvertiser, "invalidate");
    id v7 = self->_bonjourAWDLAdvertiser;
    self->_bonjourAWDLAdvertiser = 0LL;

    if (!self->_bonjourBrowserAWDL)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPWiFiP2PTransaction sharedInstance](&OBJC_CLASS___RPWiFiP2PTransaction, "sharedInstance"));
      [v8 invalidateForClient:@"Sidecar"];
    }

    deviceAWDLRandomID = self->_deviceAWDLRandomID;
    self->_deviceAWDLRandomID = 0LL;
  }

- (void)_serverBonjourAWDLAdvertiserUpdateTXT
{
  if (self->_deviceAWDLRandomID
    || (uint64_t v3 = NSRandomData(6LL, 0LL),
        uint64_t v4 = (NSData *)objc_claimAutoreleasedReturnValue(v3),
        deviceAWDLRandomID = self->_deviceAWDLRandomID,
        self->_deviceAWDLRandomID = v4,
        deviceAWDLRandomID,
        (id)-[NSData length](self->_deviceAWDLRandomID, "length") == (id)6))
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v6 = self->_deviceAWDLRandomID;
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = NSPrintF("%.6a", COERCE_DOUBLE( (id) -[NSData bytes](v6, "bytes")));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (v9) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v9, @"rpBA");
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _serverBonjourAuthTagStringWithData:]( self,  "_serverBonjourAuthTagStringWithData:",  self->_deviceAWDLRandomID));
      if (v10) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v10, @"rpAD");
      }
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverBonjourAWDLAdvertiserUpdateTXT]",  30LL,  "Using Bluetooth Identifier %@ and AuthTag %@ for AWDL Bonjour advertisement\n",  v9,  v10);
      }

      awdlPairingID = self->_awdlPairingID;
      if (awdlPairingID)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  awdlPairingID,  @"rpPI");
        uint64_t v12 = 526336LL;
      }

      else
      {
        uint64_t v12 = 2048LL;
      }

      uint64_t v13 = NSPrintF("0x%llX", v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, @"rpFl");

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"630.42.2",  @"rpVr");
      -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAWDLAdvertiser, "setTxtDictionary:", v15);
    }
  }

- (BOOL)_serverBonjourAWDLNeeded
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  if (-[NSMutableDictionary count](self->_needsAWDLDevices, "count"))
  {
    BOOL v3 = 1;
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
    BOOL v3 = [v4 count] || self->_bonjourAWDLAdvertiserForce || self->_awdlPairingID != 0;
  }

  BOOL v12 = v3;
  if (*((_BYTE *)v10 + 24) || -[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count"))
  {
    BOOL v5 = 1;
  }

  else
  {
    tcpServerConnections = self->_tcpServerConnections;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10009E570;
    v8[3] = &unk_100114950;
    v8[4] = &v9;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpServerConnections,  "enumerateKeysAndObjectsUsingBlock:",  v8);
    BOOL v5 = *((_BYTE *)v10 + 24) != 0;
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)_serverTCPEnsureStarted
{
  if (!self->_tcpServer)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon _serverTCPEnsureStarted]", 30LL, "TCP server start\n");
    }

    BOOL v3 = objc_alloc_init(&OBJC_CLASS___CUTCPServer);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v3;

    -[CUTCPServer setDispatchQueue:](self->_tcpServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUTCPServer setFlags:](self->_tcpServer, "setFlags:", 9LL);
    -[CUTCPServer setLabel:](self->_tcpServer, "setLabel:", @"RDLink");
    -[CUTCPServer setMaxConnectionCount:](self->_tcpServer, "setMaxConnectionCount:", 8LL);
    if (self->_awdlPairingID)
    {
      memset(v15, 0, sizeof(v15));
      uint64_t v14 = 0LL;
      unsigned int v5 = if_nametoindex("awdl0");
      -[CUTCPServer setMaxConnectionCount:](self->_tcpServer, "setMaxConnectionCount:", 1LL);
      int v6 = self->_tcpServer;
      __int16 v13 = 7708;
      unsigned int v16 = v5;
      -[CUTCPServer setInterfaceAddress:](v6, "setInterfaceAddress:", &v13);
    }

    -[CUTCPServer setConnectionPrepareHandler:](self->_tcpServer, "setConnectionPrepareHandler:", &stru_100114970);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10009E7E0;
    v12[3] = &unk_100111B30;
    v12[4] = self;
    -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10009E7F8;
    v11[3] = &unk_100114998;
    v11[4] = self;
    -[CUTCPServer setConnectionEndedHandler:](self->_tcpServer, "setConnectionEndedHandler:", v11);
    id v7 = self->_tcpServer;
    id v10 = 0LL;
    -[CUTCPServer activateDirectAndReturnError:](v7, "activateDirectAndReturnError:", &v10);
    id v8 = v10;
    if (v8)
    {
      if (dword_100132BB0 <= 90
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverTCPEnsureStarted]",  90LL,  "### TCP server failed: %{error}\n",  v8);
      }

      -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
      uint64_t v9 = self->_tcpServer;
      self->_tcpServer = 0LL;
    }
  }

- (void)_serverTCPEnsureStopped
{
  if (self->_tcpServer)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon _serverTCPEnsureStopped]", 30LL, "TCP server stop\n");
    }

    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    BOOL v3 = self->_bufferedConnections;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "invalidate", (void)v9);
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v5);
    }

    -[NSMutableSet removeAllObjects](self->_bufferedConnections, "removeAllObjects");
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_tcpServerConnections,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1001149D8);
    -[NSMutableDictionary removeAllObjects](self->_tcpServerConnections, "removeAllObjects");
    -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
    tcpServer = self->_tcpServer;
    self->_tcpServer = 0LL;
  }

- (void)_serverTCPHandleConnectionStarted:(id)a3
{
  uint64_t sessionIDLast = self->_sessionIDLast;
  self->_uint64_t sessionIDLast = sessionIDLast + 1;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", sessionIDLast));
  id v7 = objc_alloc_init(&OBJC_CLASS___RPConnection);
  -[RPConnection setControlFlags:](v7, "setControlFlags:", 0x400000000240LL);
  -[RPConnection setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v7, "setIdentityDaemon:", v8);

  -[RPConnection setKeepAliveSeconds:](v7, "setKeepAliveSeconds:", 10LL);
  __int128 v9 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v10 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v10;
  __int128 v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"%@Cnx-%u", @"RDLink", v10);
  -[RPConnection setLabel:](v7, "setLabel:", v11);

  -[RPConnection setLocalDeviceInfo:](v7, "setLocalDeviceInfo:", self->_localDeviceInfo);
  -[RPConnection setTcpConnection:](v7, "setTcpConnection:", v5);

  -[RPRemoteDisplayDaemon _connectionConfigureCommon:](self, "_connectionConfigureCommon:", v7);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10009EDC4;
  v22[3] = &unk_100111708;
  v22[4] = self;
  void v22[5] = v6;
  v22[6] = v7;
  -[RPConnection setInvalidationHandler:](v7, "setInvalidationHandler:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10009EE1C;
  v21[3] = &unk_100111990;
  v21[4] = v7;
  v21[5] = v6;
  -[RPConnection setReceivedEventHandler:](v7, "setReceivedEventHandler:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10009EF0C;
  v20[3] = &unk_1001119B8;
  v20[4] = v7;
  void v20[5] = v6;
  -[RPConnection setReceivedRequestHandler:](v7, "setReceivedRequestHandler:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10009F010;
  v19[3] = &unk_100114A00;
  v19[4] = self;
  void v19[5] = v6;
  v19[6] = v7;
  -[RPConnection setSessionStartHandler:](v7, "setSessionStartHandler:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10009F040;
  v18[3] = &unk_1001119E0;
  v18[4] = v7;
  void v18[5] = self;
  -[RPConnection setStateChangedHandler:](v7, "setStateChangedHandler:", v18);
  bufferedConnections = self->_bufferedConnections;
  if (!bufferedConnections)
  {
    __int16 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v14 = self->_bufferedConnections;
    self->_bufferedConnections = v13;

    bufferedConnections = self->_bufferedConnections;
  }

  -[NSMutableSet addObject:](bufferedConnections, "addObject:", v7);
  tcpServerConnections = self->_tcpServerConnections;
  if (!tcpServerConnections)
  {
    unsigned int v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    os_signpost_id_t v17 = self->_tcpServerConnections;
    self->_tcpServerConnections = v16;

    tcpServerConnections = self->_tcpServerConnections;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](tcpServerConnections, "setObject:forKeyedSubscript:", v7, v6);
  -[RPConnection activate](v7, "activate");
}

- (void)_serverHandleSessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v51 = a3;
  id v7 = a4;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_10009F82C;
  v64[3] = &unk_100114A28;
  id v52 = a5;
  id v67 = v52;
  id v65 = 0LL;
  id v8 = v7;
  id v66 = v8;
  os_signpost_id_t v53 = objc_retainBlock(v64);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceType]);
  LODWORD(a5) = v9 == 0LL;

  if ((_DWORD)a5)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]",  30LL,  "Using service type %@ on incoming connection for backwards compatibility\n",  @"_rdlink._tcp");
    }

    [v8 setServiceType:@"_rdlink._tcp"];
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceType]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_xpcMatchingServerMap, "allValues"));
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (!v13)
  {
LABEL_20:

LABEL_24:
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activatedServerXPCCnxMap,  "objectForKeyedSubscript:",  v10));
    BOOL v27 = v26 == 0LL;

    if (!v27)
    {
      id v24 = 0LL;
      char v25 = 1;
      goto LABEL_26;
    }

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]",  30LL,  "Rejecting incoming connection when server not active for service type '%@'\n",  v10);
    }

    id v48 = RPErrorF( 4294960551LL,  (uint64_t)"Rejecting incoming connection when server not active\n",  v28,  v29,  v30,  v31,  v32,  v33,  v50);
    id v42 = (id)objc_claimAutoreleasedReturnValue(v48);
    goto LABEL_58;
  }

  uint64_t v14 = *(void *)v61;
LABEL_9:
  uint64_t v15 = 0LL;
  while (1)
  {
    if (*(void *)v61 != v14) {
      objc_enumerationMutation(v12);
    }
    unsigned int v16 = *(void **)(*((void *)&v60 + 1) + 8 * v15);
    os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceType]);
    BOOL v18 = v17 == 0LL;

    if (v18) {
      goto LABEL_18;
    }
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceType]);
    id v20 = v10;
    id v21 = v19;
    if (v20 == v21) {
      break;
    }
    id v22 = v21;
    if ((v10 == 0LL) != (v21 != 0LL))
    {
      unsigned __int8 v23 = [v20 isEqual:v21];

      if ((v23 & 1) != 0) {
        goto LABEL_22;
      }
    }

    else
    {
    }

- (void)_serverProximityGetDeviceIdentifiers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  needsAWDLDevices = self->_needsAWDLDevices;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009FA58;
  v10[3] = &unk_100114A78;
  id v5 = v3;
  id v11 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](needsAWDLDevices, "enumerateKeysAndObjectsUsingBlock:", v10);
  tcpServerConnections = self->_tcpServerConnections;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009FAC0;
  v8[3] = &unk_100114AA0;
  id v9 = v5;
  id v7 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpServerConnections,  "enumerateKeysAndObjectsUsingBlock:",  v8);
}

- (unsigned)_serverDirectLinkInterfaceIndex
{
  unsigned int v7 = 0;
  if (!CreateUsableInterfaceList(0LL, 0LL, &v8))
  {
    BOOL v3 = v8;
    if (!v8) {
      goto LABEL_16;
    }
    while (1)
    {
      uint64_t v6 = 0LL;
      SocketGetInterfaceInfo(0xFFFFFFFFLL, v3[1], 0LL, &v7, 0LL, 0LL, 0LL, &v6, 0LL, v5);
      int v4 = v6;
      if ((v6 & 0x20000000) != 0) {
        break;
      }
      unsigned int v7 = 0;
      BOOL v3 = (void *)*v3;
      if (!v3) {
        goto LABEL_16;
      }
    }

    if (dword_100132BB0 > 30) {
      goto LABEL_16;
    }
    if (dword_100132BB0 == -1)
    {
      int v4 = v6;
    }

    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverDirectLinkInterfaceIndex]",  30LL,  "DirectLink interface %s found with flags 0x%x\n",  (const char *)v3[1],  v4);
LABEL_16:
    ReleaseUsableInterfaceList(v8);
    return v7;
  }

  if (dword_100132BB0 > 30) {
    return 0;
  }
  if (dword_100132BB0 != -1 || (unsigned int result = _LogCategory_Initialize(&dword_100132BB0, 30LL)) != 0)
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverDirectLinkInterfaceIndex]",  30LL,  "### Failed to get Interface list to find DirectLink interface\n");
    return 0;
  }

  return result;
}

- (void)_serverRegisterForIncomingMessages
{
  if (!self->_serverIncomingMessageCLinkClient)
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
    serverIncomingMessageCLinkClient = self->_serverIncomingMessageCLinkClient;
    self->_serverIncomingMessageCLinkClient = v3;
    id v5 = v3;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10009FD08;
    v6[3] = &unk_100112230;
    v6[4] = v5;
    void v6[5] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serverReceivedNeedsAWDLEvent:(id)a3
{
  id v4 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"_i", TypeID, 0LL);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v7)
  {
    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"_ena", 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    unsigned int v10 = [v9 BOOLValue];

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      id v11 = "disable";
      if (v10) {
        id v11 = "enable";
      }
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverReceivedNeedsAWDLEvent:]",  30LL,  "Received NeedsAWDL %s event from peer %@\n",  v11,  v7);
    }

    needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
    if (v10)
    {
      if (!needsAWDLRequestIdentifiers)
      {
        id v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        uint64_t v14 = self->_needsAWDLRequestIdentifiers;
        self->_needsAWDLRequestIdentifiers = v13;

        needsAWDLRequestIdentifiers = self->_needsAWDLRequestIdentifiers;
      }

      -[NSMutableSet addObject:](needsAWDLRequestIdentifiers, "addObject:", v7);
      if (self->_needsAWDLRequestTimer) {
        goto LABEL_20;
      }
      uint64_t v15 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      needsAWDLRequestTimer = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = v15;
      os_signpost_id_t v17 = v15;

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000A00A8;
      handler[3] = &unk_1001110A8;
      handler[4] = self;
      dispatch_source_set_event_handler(v17, handler);
      CUDispatchTimerSet(v17, 15.0, -1.0, 1.0);
      dispatch_activate(v17);
    }

    else
    {
      -[NSMutableSet removeObject:](needsAWDLRequestIdentifiers, "removeObject:", v7);
      if (-[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count")) {
        goto LABEL_20;
      }
      BOOL v18 = self->_needsAWDLRequestIdentifiers;
      self->_needsAWDLRequestIdentifiers = 0LL;

      __int128 v19 = self->_needsAWDLRequestTimer;
      if (!v19) {
        goto LABEL_20;
      }
      os_signpost_id_t v17 = v19;
      dispatch_source_cancel(v17);
      id v20 = self->_needsAWDLRequestTimer;
      self->_needsAWDLRequestTimer = 0LL;
    }

LABEL_20:
    -[RPRemoteDisplayDaemon _update](self, "_update");
    goto LABEL_21;
  }

  if (dword_100132BB0 <= 90 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _serverReceivedNeedsAWDLEvent:]",  90LL,  "Ignoring received NeedsAWDL event as it does not have peer identifier\n");
  }
LABEL_21:
}

- (void)_btAddressMonitorEnsureStarted
{
  if (!self->_btAdvAddrMonitor)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _btAddressMonitorEnsureStarted]",  30LL,  "Bluetooth address monitor start\n");
    }

    BOOL v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_btAdvAddrMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000A027C;
    v7[3] = &unk_1001110A8;
    v7[4] = self;
    -[CUSystemMonitor setRotatingIdentifierChangedHandler:]( self->_btAdvAddrMonitor,  "setRotatingIdentifierChangedHandler:",  v7);
    id v5 = self->_btAdvAddrMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000A0284;
    v6[3] = &unk_1001110A8;
    v6[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_btAddressMonitorEnsureStopped
{
  if (self->_btAdvAddrMonitor)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _btAddressMonitorEnsureStopped]",  30LL,  "Bluetooth address monitor stop\n");
    }

    -[CUSystemMonitor invalidate](self->_btAdvAddrMonitor, "invalidate");
    btAdvAddrMonitor = self->_btAdvAddrMonitor;
    self->_btAdvAddrMonitor = 0LL;
  }

- (void)_btAddressChanged
{
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor rotatingIdentifierData](self->_btAdvAddrMonitor, "rotatingIdentifierData"));
  if ([obj length] == (id)6
    && (-[NSData isEqual:](self->_btAdvAddrData, "isEqual:", obj) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_btAdvAddrData, obj);
    uint64_t v3 = NSPrintF("%.6a", COERCE_DOUBLE([obj bytes]));
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue(v3);
    btAdvAddrStr = self->_btAdvAddrStr;
    self->_btAdvAddrStr = v4;

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _btAddressChanged]",  30LL,  "Bluetooth address changed: %@\n",  self->_btAdvAddrStr);
    }

    deviceAuthTagStr = self->_deviceAuthTagStr;
    self->_deviceAuthTagStr = 0LL;

    -[RPRemoteDisplayDaemon _update](self, "_update");
  }
}

- (BOOL)_deviceSupportsLaguna:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  uint64_t v5 = GestaltProductTypeStringToDeviceClass(v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceMap]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 idsIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (v9)
  {
    [v9 operatingSystemVersion];
  }

  else
  {
    uint64_t v14 = 0LL;
    unsigned int v15 = 0;
    unsigned int v16 = 0;
  }

  if ((v5 & 0xFFFFFFFD) == 1
    && (v14 < 1 || DeviceOSVersionAtOrLater(v5, v14, v15, v16, 170000LL, 140000LL, 170000LL, 100000LL)))
  {
    if ((_DWORD)v5 == 3)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
      if ((int)sub_100009DD8(v10) > 7)
      {
        BOOL v12 = 1;
      }

      else
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
        BOOL v12 = (int)sub_100009E80(v11) > 12;
      }
    }

    else
    {
      BOOL v12 = 1;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_findMatchingDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues", 0LL));
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

- (RPRemoteDisplayDevice)dedicatedDevice
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
  [v2 setAccessGroup:@"com.apple.rapport"];
  [v2 setSyncType:1];
  [v2 setType:@"RPIdentity-PairedDevice"];
  [v2 setIdentifier:@"RPRemoteDisplayDevice-Dedicated"];
  id v3 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
  id v11 = 0LL;
  id v4 = [v3 copyItemMatchingItem:v2 flags:0 error:&v11];
  id v5 = v11;
  id v6 = v5;
  if (!v4)
  {
    if ([v5 code] != (id)-25300
      && dword_100132BB0 <= 90
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon dedicatedDevice]",  90LL,  "### DedicatedDevice find failed: %{error}\n",  v6);
    }

    goto LABEL_16;
  }

  uint64_t v7 = objc_alloc(&OBJC_CLASS___RPRemoteDisplayDevice);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
  id v9 = -[RPRemoteDisplayDevice initWithKeychainDictionaryRepresentation:]( v7,  "initWithKeychainDictionaryRepresentation:",  v8);

  if (!v9)
  {
    if (dword_100132BB0 <= 90
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon dedicatedDevice]",  90LL,  "### DedicatedDevice deserialization failed\n");
    }

- (void)saveDedicatedDevice:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("Sharing", "DedicatedLaguna"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
    id v6 = v5;
    if (v5 == v4 || ([v5 isEqualToDevice:v4] & 1) != 0)
    {
LABEL_40:

      goto LABEL_41;
    }

    id v7 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
    id v8 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v8 setAccessGroup:@"com.apple.rapport"];
    uint64_t v29 = v7;
    uint64_t v30 = v6;
    if (v4)
    {
      [v8 setAccessibleType:7];
      [v8 setInvisible:1];
      [v8 setSyncType:1];
      [v8 setType:@"RPIdentity-PairedDevice"];
      [v8 setIdentifier:@"RPRemoteDisplayDevice-Dedicated"];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 keychainDictionaryRepresentation]);
      [v8 setMetadata:v9];

      id v36 = 0LL;
      [v7 addOrUpdateOrReAddItem:v8 logCategory:&dword_100132BB0 logLabel:@"DedicatedDevice" error:&v36];
      id v10 = v36;
      if (v10)
      {
        if (dword_100132BB0 > 90
          || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 90LL))
        {
          goto LABEL_22;
        }

        id v27 = v8;
        id v28 = v10;
        id v11 = "### DedicatedDevice save failed: %@, %{error}\n";
        goto LABEL_13;
      }

      if (dword_100132BB0 > 30
        || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        goto LABEL_22;
      }

      id v11 = "DedicatedDevice saved\n";
    }

    else
    {
      [v8 setSyncType:1];
      [v8 setType:@"RPIdentity-PairedDevice"];
      [v8 setIdentifier:@"RPRemoteDisplayDevice-Dedicated"];
      id v35 = 0LL;
      [v7 removeItemMatchingItem:v8 error:&v35];
      id v10 = v35;
      if (v10)
      {
        if (dword_100132BB0 > 90
          || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 90LL))
        {
          goto LABEL_22;
        }

        id v27 = v8;
        id v28 = v10;
        id v11 = "### DedicatedDevice remove failed: %@, %{error}\n";
LABEL_13:
        uint64_t v12 = 90LL;
LABEL_21:
        LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon saveDedicatedDevice:]", v12, v11, v27, v28);
LABEL_22:

        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon saveDedicatedDevice:]",  30LL,  "Notifying update for dedicatedDevice: %@ \n",  v4);
        }

        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v13 = self->_xpcConnections;
        id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              BOOL v18 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activatedDiscovery]);

              if (v19)
              {
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 xpcCnx]);
                id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 valueForEntitlement:@"com.apple.RemoteDisplay.Dedicated"]);

                if (v21)
                {
                  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber, v22, v23);
                  if ((objc_opt_isKindOfClass(v21, v24) & 1) != 0)
                  {
                    if ([v21 BOOLValue])
                    {
                      char v25 = (void *)objc_claimAutoreleasedReturnValue([v18 xpcCnx]);
                      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 remoteObjectProxy]);
                      [v26 remoteDisplayDedicatedDeviceChanged:v4];
                    }
                  }
                }
              }
            }

            id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
          }

          while (v15);
        }

        id v6 = v30;
        goto LABEL_40;
      }

      if (dword_100132BB0 > 30
        || dword_100132BB0 == -1 && !_LogCategory_Initialize(&dword_100132BB0, 30LL))
      {
        goto LABEL_22;
      }

      id v11 = "DedicatedDevice removed\n";
    }

    uint64_t v12 = 30LL;
    goto LABEL_21;
  }

- (id)_getAliasesForAltDSIDs
{
  uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v2 = [(Class)off_100132C40[0]() sharedInstance];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v21 userProfilesSnapshot]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfiles]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * (void)v8)]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 iCloudAltDSID]);

        if (v10)
        {
          id v11 = -[objc_class sharedInstance](off_100132C48(), "sharedInstance");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 iCloudAltDSID]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 authKitAccountWithAltDSID:v13]);

          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 aliasesForAccount:v14]);
          uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          if ([v15 count]) {
            -[NSMutableSet addObjectsFromArray:](v16, "addObjectsFromArray:", v15);
          }
          os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);

          if (v17)
          {
            BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);
            -[NSMutableSet addObject:](v16, "addObject:", v18);
          }

          if (-[NSMutableSet count](v16, "count"))
          {
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 iCloudAltDSID]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v16, v19);
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v6);
  }

  return v22;
}

- (id)_getAltDSIDForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountID]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon _getAliasesForAltDSIDs](self, "_getAliasesForAltDSIDs"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
          unsigned __int8 v14 = [v13 containsObject:v5];

          if ((v14 & 1) != 0)
          {
            id v15 = v12;

            goto LABEL_17;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  if (dword_100132BB0 < 91 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _getAltDSIDForDevice:]",  90LL,  "Failed to find AltDSID for: %@\n",  v4);
  }
  id v15 = 0LL;
LABEL_17:

  return v15;
}

- (void)_localDeviceUpdate
{
  unsigned int v3 = -[RPCompanionLinkDevice changed](self->_localDeviceInfo, "changed");
  localDeviceInfo = self->_localDeviceInfo;
  if (!localDeviceInfo)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
    id v6 = self->_localDeviceInfo;
    self->_localDeviceInfo = v5;

    -[RPCompanionLinkDevice setDaemon:](self->_localDeviceInfo, "setDaemon:", 1LL);
    -[RPCompanionLinkDevice setFlags:]( self->_localDeviceInfo,  "setFlags:",  -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") | 0x48);
    localDeviceInfo = self->_localDeviceInfo;
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](localDeviceInfo, "identifier"));
  if (!v19)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIDSelf]);
    -[RPCompanionLinkDevice setIdentifier:](self->_localDeviceInfo, "setIdentifier:", v8);

    unsigned int v3 = 1;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice model](self->_localDeviceInfo, "model"));

  if (!v9)
  {
    uint64_t v10 = (void *)GestaltCopyAnswer(@"ProductType", 0LL, 0LL);
    -[RPCompanionLinkDevice setModel:](self->_localDeviceInfo, "setModel:", v10);

    unsigned int v3 = 1;
  }

  btAdvAddrStr = self->_btAdvAddrStr;
  if (!btAdvAddrStr) {
    goto LABEL_13;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice publicIdentifier](self->_localDeviceInfo, "publicIdentifier"));
  __int128 v13 = btAdvAddrStr;
  unsigned __int8 v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_13;
  }

  id v15 = v14;
  if (v14)
  {
    unsigned __int8 v16 = -[NSString isEqual:](v13, "isEqual:", v14);

    if ((v16 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_13:
    if (!v3) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }

LABEL_16:
  -[RPCompanionLinkDevice setPublicIdentifier:](self->_localDeviceInfo, "setPublicIdentifier:", self->_btAdvAddrStr);
LABEL_17:
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  {
    uint64_t v17 = CUDescriptionWithLevel(self->_localDeviceInfo, 50LL);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _localDeviceUpdate]",  30LL,  "Local device changed: %@\n",  v18,  v19);
  }

- (void)_startPairingServerWithPassword:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000940FC;
  id v41 = sub_10009410C;
  id v42 = 0LL;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000A1668;
  v32[3] = &unk_100114AC8;
  id v33 = 0LL;
  __int128 v34 = self;
  id v36 = &v37;
  id v8 = v7;
  id v35 = v8;
  id v9 = objc_retainBlock(v32);
  if (GestaltGetDeviceClass(v9, v10) == 4 || self->_prefAllowPairingServer)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _startPairingServerWithPassword:completion:]",  30LL,  "Starting pairing server over AWDL: \n");
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    __int128 v20 = (NSString *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
    awdlPairingID = self->_awdlPairingID;
    self->_awdlPairingID = v20;

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sessionPairingIdentifier]);

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v24,  self->_awdlPairingID,  v6,  0LL));

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"_pubID",  @"_pi",  @"_pinC",  0LL));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v25,  v26));
    id v31 = 0LL;
    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v27,  4LL,  &v31));
    id v18 = v31;
    uint64_t v29 = (void *)v38[5];
    v38[5] = v28;

    -[RPRemoteDisplayDaemon _update](self, "_update");
  }

  else
  {
    id v17 = RPErrorF(4294960561LL, (uint64_t)"Platform does not support pairing\n", v11, v12, v13, v14, v15, v16, v30);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v17);
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v37, 8);
}

- (void)_stopPairingServer
{
  awdlPairingID = self->_awdlPairingID;
  self->_awdlPairingID = 0LL;

  -[RPRemoteDisplayDaemon _update](self, "_update");
}

- (id)_acquireRBSAssertionForEntry:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 angelJobLabel]);
  if (v6
    && (id v7 = (void *)v6,
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 angelAssertionName]),
        v8,
        v7,
        v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 angelJobLabel]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity identityForAngelJobLabel:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForAngelJobLabel:",  v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithProcessIdentity:](&OBJC_CLASS___RBSTarget, "targetWithProcessIdentity:", v10));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 angelAssertionName]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.rapportd",  v12));

    id v14 = objc_alloc(&OBJC_CLASS___RBSAssertion);
    uint64_t v30 = v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    id v16 = [v14 initWithExplanation:@"Rapport remote display" target:v11 attributes:v15];

    id v29 = 0LL;
    unsigned __int8 v17 = [v16 acquireWithError:&v29];
    id v24 = v29;
    if ((v17 & 1) != 0)
    {
      id v25 = v16;
    }

    else
    {
      if (dword_100132BB0 <= 90
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 angelJobLabel]);
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _acquireRBSAssertionForEntry:error:]",  90LL,  "### Failed to acquire runningboard assertion for launch angel '%@' error (%@) \n");
      }

      id v26 = RPErrorF( 4294960582LL,  (uint64_t)"Failed to acquire runningboard assertion for launch angel",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)v28);
      id v25 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v26);
    }
  }

  else
  {
    id v25 = 0LL;
  }

  return v25;
}

- (void)_scheduleCameraCapabilitiesRequest:(id)a3 interval:(unint64_t)prefCameraCapabilitiesRetrySeconds
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cameraCapabilitiesRefetchTimer]);

  if (!v7)
  {
    if (!prefCameraCapabilitiesRetrySeconds) {
      unint64_t prefCameraCapabilitiesRetrySeconds = self->_prefCameraCapabilitiesRetrySeconds;
    }
    dispatch_source_t v8 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    [v6 setCameraCapabilitiesRefetchTimer:v8];

    id v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 cameraCapabilitiesRefetchTimer]);
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = sub_1000A1B28;
    id v16 = &unk_100111968;
    id v10 = v6;
    id v17 = v10;
    uint64_t v18 = self;
    dispatch_source_set_event_handler(v9, &v13);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cameraCapabilitiesRefetchTimer", v13, v14, v15, v16));
    CUDispatchTimerSet(v11, (double)prefCameraCapabilitiesRetrySeconds, -1.0, 0.5);

    uint64_t v12 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([v10 cameraCapabilitiesRefetchTimer]);
    dispatch_activate(v12);
  }
}

- (void)_receivedCameraCapabilitiesMessage:(id)a3 fromDevice:(id)a4 isFirstUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v8, @"_cCap", TypeID, v36);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t v30 = v8;
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]",  30LL,  "Received camera capabilities update from device %@\n",  v14);
LABEL_8:
    }
  }

  else
  {
    if (dword_100132BB0 <= 50
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 50LL)))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]",  50LL,  "Received empty or nil camera capabilities update from device %@\n",  v14);
      uint64_t v13 = &__NSDictionary0__struct;
      goto LABEL_8;
    }

    uint64_t v13 = &__NSDictionary0__struct;
  }

  id v31 = v13;
  [v9 setCameraCapabilities:v13];
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v15 = self;
  id v16 = self->_xpcConnections;
  id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 activatedDiscovery]);
        unsigned int v23 = [v22 shouldReportDevice:v9];

        if (v23)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 xpcCnx]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 remoteObjectProxy]);
          [v25 remoteDisplayChangedDevice:v9 changes:2];
        }
      }

      id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
    }

    while (v18);
  }

  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  {
    if (v5) {
      id v26 = "yes";
    }
    else {
      id v26 = "no";
    }
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]",  30LL,  "inIsFirstUpdate: %s inDevice.identifier:%@ _devicePairedIdentifier:%@\n",  v26,  v27,  v15->_deviceSessionPaired);
  }

  if (v5 && ((unint64_t)[v9 statusFlags] & 0x2000000000) != 0)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:]",  30LL,  "Discovery session state change after first update of camera capabilities for device: %@\n",  v15->_deviceSessionPaired);
    }

    deviceSessionPaired = v15->_deviceSessionPaired;
    v15->_deviceSessionPaired = 0LL;

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:]( v15,  "_changeDiscoverySessionStateForDevice:startReason:",  v29,  1LL);
  }
}

- (void)_receivedCameraExitEvent:(id)a3 from:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"_cExitReson", TypeID, v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if ([v10 length])
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]",  30LL,  "Received exit reason '%@' from device %@\n",  v10,  v6);
    }

    if ([v10 isEqualToString:@"User disconnect"])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDeviceIdentifier]);
      unsigned int v13 = [v6 isEqualToString:v12];

      if (v13)
      {
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]",  30LL,  "Received '%@' exit reason for dedicated device %@ -> clear dedicated device\n",  v10,  v6);
        }

        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self, "saveDedicatedDevice:", 0LL);
      }
    }

    if ([v6 isEqualToString:self->_deviceConfirmedIdentifier])
    {
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]",  30LL,  "Exit active session for device %@\n",  v6);
      }

      -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:]( self,  "_changeDiscoverySessionStateForDevice:startReason:",  0LL,  0LL);
    }

    else if (dword_100132BB0 <= 90 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]",  90LL,  "Received exit session event from non-active device %@\n",  v6);
    }
  }

  else if (dword_100132BB0 <= 50 {
         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 50LL)))
  }
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _receivedCameraExitEvent:from:]",  50LL,  "Received empty or nil exit reason from device %@\n",  v6);
  }
}

- (void)_registerForIncomingMessages
{
  if (!self->_clientIncomingMessageCLinkClient)
  {
    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    clientIncomingMessageCLinkClient = self->_clientIncomingMessageCLinkClient;
    self->_clientIncomingMessageCLinkClient = v3;
    BOOL v5 = v3;

    -[RPCompanionLinkClient setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000A2238;
    v6[3] = &unk_100112230;
    v6[4] = v5;
    void v6[5] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_requestCameraCapabilitiesForDevice:(id)a3
{
  id v4 = a3;
  int DeviceClass = GestaltGetDeviceClass(v4, v5);
  int v7 = DeviceClass;
  if (DeviceClass == 100 || DeviceClass == 4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 cameraCapabilities]);
    if (!v8 && ![v4 cameraCapabilityRequestIsActive])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 cameraCapabilitiesRefetchTimer]);

      if (v9) {
        goto LABEL_6;
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
      if (v8)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceMap]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v8]);

        if (v12 || ((unint64_t)[v4 statusFlags] & 0x3000000000) != 0)
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 modelIdentifier]);
          uint64_t v14 = v13;
          if (v13) {
            id v15 = v13;
          }
          else {
            id v15 = (id)objc_claimAutoreleasedReturnValue([v4 model]);
          }
          id v16 = v15;

          if (v12)
          {
            [v12 operatingSystemVersion];
          }

          else
          {
            uint64_t v27 = 0LL;
            uint64_t v28 = 0LL;
            uint64_t v29 = 0LL;
          }

          uint64_t v17 = GestaltProductTypeStringToDeviceClass(v16);
          if ((v17 | 2) == 3)
          {
            BOOL v18 = v7 == 100 && (_DWORD)v17 == 1;
            BOOL v19 = !v18;
            if ((v7 == 4 || !v19)
              && (v27 < 1
               || DeviceOSVersionAtOrLater( v17,  v27,  v28,  v29,  160000LL,  130000LL,  160000LL,  90000LL)))
            {
              if (dword_100132BB0 <= 30
                && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
              {
                LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]",  30LL,  "Requesting camera capabilities from device %@\n",  v4);
              }

              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
              [v4 setCameraCapabilityRequestIsActive:1];
              uint64_t v21 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
              uint64_t v22 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
              -[RPCompanionLinkDevice setIdentifier:](v22, "setIdentifier:", v20);
              -[RPCompanionLinkClient setDispatchQueue:](v21, "setDispatchQueue:", self->_dispatchQueue);
              -[RPCompanionLinkClient setDestinationDevice:](v21, "setDestinationDevice:", v22);
              -[RPCompanionLinkClient setControlFlags:](v21, "setControlFlags:", 6LL);
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472LL;
              v23[2] = sub_1000A2B14;
              v23[3] = &unk_100114B68;
              v23[4] = v21;
              id v24 = v4;
              id v25 = self;
              id v26 = v20;
              -[RPCompanionLinkClient activateWithCompletion:](v21, "activateWithCompletion:", v23);
            }
          }
        }

        else if (dword_100132BB0 <= 90 {
               && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
        }
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]",  90LL,  "### Failed to get camera capabilities, there is no IDS device and status flags do not match: %@\n",  v4);
        }
      }

      else if (dword_100132BB0 <= 90 {
             && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      }
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]",  90LL,  "### Failed to get camera capabilities, there is no IDS device identifier %@\n",  v4);
      }
    }
  }

- (void)_postNotificationForWombatActivity:(unsigned int)a3
{
  if (dword_100132C50 == -1) {
    notify_register_check("com.apple.rapport.wombat-activity", &dword_100132C50);
  }
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  {
    if (a3 > 5) {
      id v4 = "?";
    }
    else {
      id v4 = (&off_100114DE8)[a3];
    }
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _postNotificationForWombatActivity:]",  30LL,  "Posting notification for wombat activity change: %s (0x%x)\n",  v4,  a3);
  }

  notify_set_state(dword_100132C50, a3);
  notify_post("com.apple.rapport.wombat-activity");
}

- (void)_registerForWombatStateNotifications
{
  if (self->_wombatStateReadyToken == -1)
  {
    if (dword_100132BB0 <= 20
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _registerForWombatStateNotifications]",  20LL,  "Registering for wombat state notification\n");
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000A3244;
    handler[3] = &unk_1001115C8;
    handler[4] = self;
    notify_register_dispatch("com.apple.sharing.wombat-state", &self->_wombatStateReadyToken, dispatchQueue, handler);
    int wombatStateReadyToken = self->_wombatStateReadyToken;
    uint64_t state64 = 0LL;
    notify_get_state(wombatStateReadyToken, &state64);
    uint64_t wombatState = state64;
    self->_uint64_t wombatState = state64;
    if (dword_100132BB0 <= 30)
    {
      if (dword_100132BB0 != -1
        || (int v7 = _LogCategory_Initialize(&dword_100132BB0, 30LL), wombatState = self->_wombatState, v7))
      {
        else {
          id v6 = (&off_100114E18)[(int)wombatState];
        }
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _registerForWombatStateNotifications]",  30LL,  "SFWombatState initialized to: %s (0x%x)\n",  v6,  wombatState);
        uint64_t wombatState = self->_wombatState;
      }
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000A33D8;
    v8[3] = &unk_100114928;
    void v8[4] = self;
    -[RPRemoteDisplayDaemon _bluetoothUseCaseFromWombatState:resultBlock:]( self,  "_bluetoothUseCaseFromWombatState:resultBlock:",  wombatState,  v8);
  }

  -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](self, "_postNotificationForWombatActivity:", 5LL);
}

- (void)_unregisterWombatStateNotifications
{
  if (self->_wombatStateReadyToken != -1)
  {
    if (dword_100132BB0 <= 20
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _unregisterWombatStateNotifications]",  20LL,  "Unregistering wombat state notifications\n");
    }

    notify_cancel(self->_wombatStateReadyToken);
    self->_int wombatStateReadyToken = -1;
  }

- (BOOL)_onenessEnabled
{
  if (GestaltGetDeviceClass(self, a2) == 1)
  {
    authenticationManager = self->_authenticationManager;
    if (!authenticationManager)
    {
      id v4 = (SFAuthenticationManager *)[objc_alloc(off_100132C58()) initWithQueue:self->_dispatchQueue];
      uint64_t v5 = self->_authenticationManager;
      self->_authenticationManager = v4;

      -[RPRemoteDisplayDaemon _startObservingOnenessEnabledState](self, "_startObservingOnenessEnabledState");
      authenticationManager = self->_authenticationManager;
    }

    unsigned int v6 = -[SFAuthenticationManager isEnabledForType:](authenticationManager, "isEnabledForType:", 5LL);
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      int v7 = "no";
      if (v6) {
        int v7 = "yes";
      }
      LogPrintF(&dword_100132BB0, "-[RPRemoteDisplayDaemon _onenessEnabled]", 30LL, "Oneness is enabled: %s\n", v7);
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_startObservingOnenessEnabledState
{
  if (self->_authenticationManager)
  {
    if (dword_100132BB0 <= 20
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _startObservingOnenessEnabledState]",  20LL,  "Starting authentication state change observations\n");
    }

    authenticationManager = self->_authenticationManager;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000A3688;
    v4[3] = &unk_1001110A8;
    v4[4] = self;
    -[SFAuthenticationManager startObservingForAuthenticationStateChanges:queue:]( authenticationManager,  "startObservingForAuthenticationStateChanges:queue:",  v4,  self->_dispatchQueue);
  }

- (void)_stopObservingOnenessEnabledState
{
  if (self->_authenticationManager)
  {
    if (dword_100132BB0 <= 20
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _stopObservingOnenessEnabledState]",  20LL,  "Stopping authentication state change observations\n");
    }

    -[SFAuthenticationManager stopObservingForAuthenticationStateChanges]( self->_authenticationManager,  "stopObservingForAuthenticationStateChanges");
    uint64_t wombatState = self->_wombatState;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000A3880;
    v4[3] = &unk_100114928;
    v4[4] = self;
    -[RPRemoteDisplayDaemon _bluetoothUseCaseFromWombatState:resultBlock:]( self,  "_bluetoothUseCaseFromWombatState:resultBlock:",  wombatState,  v4);
  }

- (BOOL)_needToHoldPowerAssertion
{
  uint64_t DeviceClass = GestaltGetDeviceClass(self, a2);
  if ((_DWORD)DeviceClass == 1 || GestaltGetDeviceClass(DeviceClass, v4) == 3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyActionV2Discovery actionV2Devices](self->_bleNearbyActionV2Discovery, "actionV2Devices"));
    id v6 = [v5 count];

    if (v6 || -[NSMutableSet count](self->_needsAWDLRequestIdentifiers, "count"))
    {
      LOBYTE(v7) = 1;
    }

    else
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_tcpServerConnections, "allValues", 0LL));
      id v7 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        int v9 = 0;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v8);
            }
          }

          id v7 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }

        while (v7);
        LOBYTE(v7) = v9 != 0;
      }
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (void)_powerAssertionEnsureHeld
{
  if (!self->_powerAssertion)
  {
    v4[0] = @"AssertType";
    v4[1] = @"AssertLevel";
    v5[0] = @"PreventUserIdleSystemSleep";
    v5[1] = &off_10011B090;
    v4[2] = @"AssertName";
    v4[3] = @"TimeoutSeconds";
    v5[2] = @"com.apple.rapport.RPRemoteDisplayDaemon.Wombat";
    v5[3] = &off_10011B0A8;
    v4[4] = @"TimeoutAction";
    _BYTE v5[4] = @"TimeoutActionTurnOff";
    p_powerAssertion = &self->_powerAssertion;
    unsigned int v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  5LL));
    if (IOPMAssertionCreateWithProperties(v3, p_powerAssertion) || !*p_powerAssertion)
    {
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _powerAssertionEnsureHeld]",  30LL,  "Failed to acquire power assertion");
      }

      unsigned int *p_powerAssertion = 0;
    }

    else if (dword_100132BB0 <= 30 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _powerAssertionEnsureHeld]",  30LL,  "Acquired power assertion");
    }
  }

- (void)_powerAssertionEnsureReleased
{
  IOPMAssertionID powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    IOPMAssertionRelease(powerAssertion);
    self->_IOPMAssertionID powerAssertion = 0;
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _powerAssertionEnsureReleased]",  30LL,  "Released power assertion");
    }
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = -[RPRemoteDisplayXPCConnection initWithDaemon:xpcCnx:]( objc_alloc(&OBJC_CLASS___RPRemoteDisplayXPCConnection),  "initWithDaemon:xpcCnx:",  self,  v5);
  -[RPRemoteDisplayXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  ++self->_xpcLastID;
  -[RPRemoteDisplayXPCConnection setXpcID:](v6, "setXpcID:");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    int v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  [v5 _setQueue:self->_dispatchQueue];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPRemoteDisplayXPCDaemonInterface));
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000A3E50;
  v14[3] = &unk_100111968;
  _BYTE v14[4] = self;
  uint64_t v11 = v6;
  __int128 v15 = v11;
  [v5 setInvalidationHandler:v14];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPRemoteDisplayXPCClientInterface));
  [v5 setRemoteObjectInterface:v12];

  [v5 resume];
  if (dword_100132BB0 <= 20 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started from %#{pid}\n",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_handleServerActivation:(id)a3
{
  id v10 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v10 activatedServer]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 serviceType]);

  activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
  if (!activatedServerXPCCnxMap)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v8 = self->_activatedServerXPCCnxMap;
    self->_activatedServerXPCCnxMap = v7;

    activatedServerXPCCnxMap = self->_activatedServerXPCCnxMap;
  }

  if (v5) {
    int v9 = (__CFString *)v5;
  }
  else {
    int v9 = @"_rdlink._tcp";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](activatedServerXPCCnxMap, "setObject:forKeyedSubscript:", v10, v9);
}

- (void)_deliverBufferedConnectionsToServer:(id)a3
{
  id v21 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v21 activatedServer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);

  id v6 = -[NSMutableSet copy](self->_bufferedConnections, "copy");
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v8) {
    goto LABEL_22;
  }
  uint64_t v9 = *(void *)v28;
  while (2)
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      id v12 = (id)objc_claimAutoreleasedReturnValue([v11 serviceType]);
      id v13 = v5;
      __int128 v14 = v13;
      if (v12 == v13)
      {

LABEL_15:
        uint64_t v23 = 0LL;
        id v24 = &v23;
        uint64_t v25 = 0x2020000000LL;
        int v26 = 0;
        tcpServerConnections = self->_tcpServerConnections;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000A41C0;
        v22[3] = &unk_100114B90;
        v22[4] = v11;
        void v22[5] = &v23;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpServerConnections,  "enumerateKeysAndObjectsUsingBlock:",  v22);
        uint64_t v17 = v24;
        uint64_t v18 = *((unsigned int *)v24 + 6);
        if (!(_DWORD)v18)
        {
LABEL_21:
          _Block_object_dispose(&v23, 8);
          goto LABEL_22;
        }

        if (dword_100132BB0 <= 30)
        {
          if (dword_100132BB0 == -1)
          {
            int v19 = _LogCategory_Initialize(&dword_100132BB0, 30LL);
            uint64_t v17 = v24;
            if (!v19) {
              goto LABEL_20;
            }
            uint64_t v18 = *((unsigned int *)v24 + 6);
          }

          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _deliverBufferedConnectionsToServer:]",  30LL,  "Starting buffered connection %@ with session ID %u\n",  v11,  v18);
          uint64_t v17 = v24;
        }

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 activatedServer]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 serviceType]);

  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"_rdlink._tcp";
  }
  [v7 connectionInvalidated];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_activatedServerXPCCnxMap,  "setObject:forKeyedSubscript:",  0LL,  v6);
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
  -[RPRemoteDisplayDaemon _updateForXPCClientChange](self, "_updateForXPCClientChange");
}

- (void)addNeedsAWDLPeer:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v4 || (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceIdentifier])) != 0)
  {
    needsAWDLNewPeers = self->_needsAWDLNewPeers;
    if (!needsAWDLNewPeers)
    {
      id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      id v7 = self->_needsAWDLNewPeers;
      self->_needsAWDLNewPeers = v6;

      needsAWDLNewPeers = self->_needsAWDLNewPeers;
    }

    -[NSMutableSet addObject:](needsAWDLNewPeers, "addObject:", v4);
  }

  else if (dword_100132BB0 <= 30 {
         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  }
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon addNeedsAWDLPeer:]",  30LL,  "Failed to send NeedsAWDL event over WiFi, no identifier: %@\n",  v8);
  }
}

- (void)_requestConfirmationFromPerson:(id)a3 forDedicated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = v8;

  objc_storeStrong((id *)&self->_personSelected, a3);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000A4440;
  v11[3] = &unk_100114BB8;
  id v12 = v7;
  id v10 = v7;
  -[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]( self,  "_requestConfirmationFromDevicesMatching:forDedicated:",  v11,  v4);
}

- (void)_requestConfirmationFromDevice:(id)a3 forDedicated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = v7;

  personSelected = self->_personSelected;
  self->_personSelected = 0LL;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000A4618;
  v11[3] = &unk_100114BB8;
  id v12 = v6;
  id v10 = v6;
  -[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]( self,  "_requestConfirmationFromDevicesMatching:forDedicated:",  v11,  v4);
}

- (void)_requestConfirmationFromDevicesMatching:(id)a3 forDedicated:(BOOL)a4
{
  id v6 = a3;
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]",  30LL,  "Discovery session state change as new confirmation flow has started\n");
  }
  -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:]( self,  "_changeDiscoverySessionStateForDevice:startReason:",  0LL,  0LL);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A4710;
  block[3] = &unk_100114C58;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleConfirmationResult:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]",  30LL,  "Response dictionary: %@\n",  v6);
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"info", TypeID, 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  CFTypeID v11 = CFDictionaryGetTypeID();
  uint64_t v12 = CFDictionaryGetTypedValue(v10, @"usi", v11, 0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t NSNumber = NSDictionaryGetNSNumber(v13, @"DDUIMessageResponseResultKey", 0LL);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self, "dedicatedDevice"));
  uint64_t v17 = v16;
  if (!v15)
  {
    if (dword_100132BB0 <= 90
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]",  90LL,  "### Skip continuity camera confirmation, empty result\n");
    }

    goto LABEL_53;
  }

  if (!self->_personSelected)
  {
    if (v16)
    {
      uint64_t v20 = v16;
      id v21 = (id)objc_claimAutoreleasedReturnValue([v16 idsDeviceIdentifier]);
      id v22 = v7;
      uint64_t v23 = v22;
      if (v21 == v22)
      {

        uint64_t v17 = v20;
        goto LABEL_7;
      }

      if ((v22 != 0LL) != (v21 == 0LL))
      {
        unsigned __int8 v43 = [v21 isEqual:v22];

        uint64_t v17 = v20;
        if ((v43 & 1) != 0) {
          goto LABEL_7;
        }
      }

      else
      {

        uint64_t v17 = v20;
      }
    }

    if (dword_100132BB0 <= 90
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _handleConfirmationResult:fromDevice:]",  90LL,  "### Skip continuity camera confirmation, no person or dedicated device selected\n");
    }

    goto LABEL_53;
  }

- (void)_sendConfirmationCancelToAllDevices
{
  personConfirmationClientMap = self->_personConfirmationClientMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000A532C;
  v6[3] = &unk_100114CA8;
  v6[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( personConfirmationClientMap,  "enumerateKeysAndObjectsUsingBlock:",  v6);
  -[NSMutableDictionary removeAllObjects](self->_personConfirmationClientMap, "removeAllObjects");
  BOOL v4 = self->_personConfirmationClientMap;
  self->_personConfirmationClientMap = 0LL;

  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = 0LL;
}

- (void)_clearConfirmationClientCache
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_personConfirmationClientMap, "allValues"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) invalidate];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_personConfirmationClientMap, "removeAllObjects");
  personConfirmationClientMap = self->_personConfirmationClientMap;
  self->_personConfirmationClientMap = 0LL;

  personConfirmationSessionID = self->_personConfirmationSessionID;
  self->_personConfirmationSessionID = 0LL;
}

- (void)_sendDiscoverySessionExitWithReason:(id)a3
{
  id v4 = a3;
  if (self->_deviceConfirmedIdentifier)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( self,  "_findMatchingDeviceWithIdentifier:"));
    uint64_t v6 = v5;
    if (v5 && [v5 inDiscoverySession])
    {
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _sendDiscoverySessionExitWithReason:]",  30LL,  "Sending exit session with reason '%@' to device %@\n",  v4,  v6);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceIdentifier]);
      id v8 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
      -[RPCompanionLinkDevice setIdentifier:](v9, "setIdentifier:", v7);
      -[RPCompanionLinkClient setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
      -[RPCompanionLinkClient setDestinationDevice:](v8, "setDestinationDevice:", v9);
      -[RPCompanionLinkClient setControlFlags:](v8, "setControlFlags:", 2097162LL);
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_localDeviceInfo, "identifier"));
      [v10 setObject:v11 forKeyedSubscript:@"_i"];

      [v10 setObject:v4 forKeyedSubscript:@"_cExitReson"];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000A5884;
      v13[3] = &unk_100114B68;
      v13[4] = v8;
      void v13[5] = v7;
      id v14 = v10;
      unsigned int v15 = self;
      id v12 = v10;
      -[RPCompanionLinkClient activateWithCompletion:](v8, "activateWithCompletion:", v13);
    }
  }
}

- (void)setDeviceConfirmedIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon setDeviceConfirmedIdentifier:]",  30LL,  "Device confirmed changed %@ -> %@\n",  self->_deviceConfirmedIdentifier,  v4);
  }
  deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
  self->_deviceConfirmedIdentifier = v4;
}

- (void)_changeDiscoverySessionStateForDevice:(id)a3 startReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = v10;
  if (v10
    && self->_deviceConfirmedIdentifier
    && (v7 = objc_msgSend(v10, "isEqualToString:"), id v6 = v10, !v7))
  {
    -[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:]( self,  "_processDiscoverySessionStateChangeForDevice:startReason:",  0LL,  0LL);
    id v8 = self;
    id v9 = v10;
  }

  else
  {
    id v8 = self;
    id v9 = v6;
  }

  -[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:]( v8,  "_processDiscoverySessionStateChangeForDevice:startReason:",  v9,  v4);
}

- (void)_processDiscoverySessionStateChangeForDevice:(id)a3 startReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  deviceConfirmedIdentifier = self->_deviceConfirmedIdentifier;
  BOOL v8 = v6 != 0LL;
  if (v8 != (deviceConfirmedIdentifier != 0LL))
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      id v9 = "OutOfSession";
      if (deviceConfirmedIdentifier) {
        id v10 = "InSession";
      }
      else {
        id v10 = "OutOfSession";
      }
      if (v6) {
        id v9 = "InSession";
      }
      else {
        __int128 v11 = (&off_100114E78)[(char)v4];
      }
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _processDiscoverySessionStateChangeForDevice:startReason:]",  30LL,  "Discovery session state %s -> %s, peer %@, startReason %s \n",  v10,  v9,  v6,  v11);
    }

    id v31 = self->_deviceConfirmedIdentifier;
    uint64_t v32 = v31;
    -[RPRemoteDisplayDaemon setDeviceConfirmedIdentifier:](self, "setDeviceConfirmedIdentifier:", v6);
    if (v6)
    {
      id v12 = v6;
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( self,  "_findMatchingDeviceWithIdentifier:",  v6));
    }

    else
    {
      id v12 = 0LL;
      __int128 v34 = 0LL;
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = self;
    __int128 v13 = self->_xpcConnections;
    id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          unint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activatedDiscovery]);

          if (v19)
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 xpcCnx]);
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 remoteObjectProxy]);
            [v21 remoteDisplayDeviceSelected:v34];

            id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 xpcCnx]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 remoteObjectProxy]);
            [v23 remoteDisplayNotifyDiscoverySessionState:v8 forDevice:v12 startReason:v4];
          }
        }

        id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
      }

      while (v15);
    }

    id v6 = v12;
    if (v12)
    {
      -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](v33, "_postNotificationForWombatActivity:", 4LL);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
      [v24 postDaemonInfoChanges:0x8000];

      -[RPRemoteDisplayDaemon _startDiscoverySessionExpirationTimer](v33, "_startDiscoverySessionExpirationTimer");
      uint64_t v25 = v32;
    }

    else
    {
      uint64_t v25 = v32;
      if (v31)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
        [v26 removeSessionPairedIdentityWithIdentifier:v32];
      }

      -[RPRemoteDisplayDaemon _postNotificationForWombatActivity:](v33, "_postNotificationForWombatActivity:", 5LL);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
      [v27 postDaemonInfoChanges:0x10000];

      discoverySessionExpirationTimer = v33->_discoverySessionExpirationTimer;
      if (discoverySessionExpirationTimer)
      {
        __int128 v29 = discoverySessionExpirationTimer;
        dispatch_source_cancel(v29);
        id v30 = v33->_discoverySessionExpirationTimer;
        v33->_discoverySessionExpirationTimer = 0LL;
      }
    }
  }
}

- (void)_startDiscoverySessionExpirationTimer
{
  discoverySessionExpirationTimer = self->_discoverySessionExpirationTimer;
  if (discoverySessionExpirationTimer)
  {
    uint64_t v4 = discoverySessionExpirationTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_discoverySessionExpirationTimer;
    self->_discoverySessionExpirationTimer = 0LL;
  }

  id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  unsigned int v7 = self->_discoverySessionExpirationTimer;
  self->_discoverySessionExpirationTimer = v6;

  BOOL v8 = self->_discoverySessionExpirationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000A5F98;
  handler[3] = &unk_1001110A8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  CUDispatchTimerSet( self->_discoverySessionExpirationTimer,  (double)self->_prefDiscoverySessionExpirationSeconds,  -1.0,  1.0);
  dispatch_activate((dispatch_object_t)self->_discoverySessionExpirationTimer);
}

- (void)_startInSessionDeviceLostTimer
{
  if (self->_deviceConfirmedIdentifier)
  {
    inSessionDeviceLost = self->_inSessionDeviceLost;
    if (inSessionDeviceLost)
    {
      uint64_t v4 = inSessionDeviceLost;
      dispatch_source_cancel(v4);
      id v5 = self->_inSessionDeviceLost;
      self->_inSessionDeviceLost = 0LL;
    }

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayDaemon _startInSessionDeviceLostTimer]",  30LL,  "Starting device lost timer for device %@\n",  self->_deviceConfirmedIdentifier);
    }

    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    unsigned int v7 = self->_inSessionDeviceLost;
    self->_inSessionDeviceLost = v6;

    BOOL v8 = self->_inSessionDeviceLost;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000A6164;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
    CUDispatchTimerSet(self->_inSessionDeviceLost, (double)self->_prefInSessionDeviceLostSeconds, -1.0, 1.0);
    dispatch_activate((dispatch_object_t)self->_inSessionDeviceLost);
  }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)deviceConfirmedIdentifier
{
  return self->_deviceConfirmedIdentifier;
}

- (void).cxx_destruct
{
}

@end