@interface CBDaemonServer
- (BOOL)_bleAdvertiserShouldRun;
- (BOOL)_bleAdvertiserUpdateSpatialInteraction;
- (BOOL)_bleAdvertiserUpdateWithAuthTagNC;
- (BOOL)_firstUnlockedOrAllowedBefore;
- (BOOL)_identitiesShouldRun;
- (BOOL)_stackAccessoryMonitorShouldRun;
- (BOOL)_stackBLEScannerShouldRun;
- (BOOL)_stackClassicScannerShouldRun;
- (BOOL)_stackDeviceMonitorShouldRun;
- (BOOL)_supportsProxControl;
- (BOOL)_verifyNearbyInfoV2IntegrityTag:(id)a3 rapportIdentity:(id)a4;
- (BOOL)_whbDiscoveryShouldRun;
- (BOOL)prefAppleAudioDeviceLimitedLoggingEnabled;
- (BOOL)prefEnforceApprovedExtensions;
- (BOOL)prefEnforceApprovedList;
- (BOOL)prefExtensionsEnabled;
- (BOOL)prefRemoteClientEnabled;
- (BOOL)prefRemoteServerEnabled;
- (BOOL)prefSystemReferenceTimeDisabled;
- (BOOL)prefWiProxAdvertising;
- (BOOL)supportsNCSecondaryAdvertisingInstance;
- (BOOL)xpcEventAllowedInfo:(id)a3;
- (CBAccessoryDaemon)accessoryDaemon;
- (CBAdvertiserDaemon)testAdvertiser;
- (CBController)testAssertion;
- (CBDaemonServer)initWithCBStackAdaptor:(id)a3;
- (CBDiscovery)testDiscovery;
- (CBExtensionsDaemon)extensionsDaemon;
- (CBStackAdaptor)stackAdaptor;
- (CBStackAddressMonitor)addressMonitor;
- (CBStackBLEScanner)stackBLEScanner;
- (CBStackController)stackController;
- (CBUserController)userController;
- (CBWHBDiscoveryDaemon)whbDiscoveryDaemon;
- (NSArray)identityArray;
- (NSData)prefFilterNearbyActionExtraData;
- (NSMutableDictionary)deviceMap;
- (NSMutableDictionary)identifyDevices;
- (NSMutableDictionary)whbDeviceMap;
- (NSMutableSet)xpcConnections;
- (OS_xpc_object)xpcListenerEndpoint;
- (char)prefCBExtensionRSSIOverride;
- (char)wifiCriticalOverride;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)getAudioAccessoryDeviceArray;
- (id)localWhbDeviceForStableId:(id)a3;
- (void)_accessoryDaemonEnsureStarted;
- (void)_accessoryDaemonEnsureStopped;
- (void)_activate;
- (void)_activateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)_activateCBController:(id)a3 completion:(id)a4;
- (void)_activateCBDiscovery:(id)a3 completion:(id)a4;
- (void)_activateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)_aopMessageReceived:(id)a3;
- (void)_bleAddressMonitorEnsureStarted;
- (void)_bleAddressMonitorEnsureStopped;
- (void)_bleAdvertiserAddressChanged:(BOOL)a3;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_identitiesEnsureStarted;
- (void)_identitiesEnsureStopped;
- (void)_identitiesGet;
- (void)_identitiesReevaluateDevices;
- (void)_identitiesResolveNearbyDevice:(id)a3;
- (void)_invalidate;
- (void)_invalidateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)_invalidateCBController:(id)a3 completion:(id)a4;
- (void)_invalidateCBDiscovery:(id)a3 completion:(id)a4;
- (void)_invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)_invalidateUserController;
- (void)_notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5;
- (void)_performUserControllerActionWithCompletion:(id)a3;
- (void)_prefsChanged;
- (void)_remoteEnsureStarted;
- (void)_remoteEnsureStopped;
- (void)_remoteInvalidateInactiveXPC;
- (void)_remoteReceivedEvent:(id)a3 options:(id)a4;
- (void)_remoteReceivedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_reportDeviceFound:(id)a3;
- (void)_reportDeviceLost:(id)a3;
- (void)_reportDeviceLostIfNeeded:(unint64_t)a3;
- (void)_reportDevicesBuffered:(id)a3;
- (void)_stackAccessoryMonitorEnsureStarted;
- (void)_stackAccessoryMonitorEnsureStopped;
- (void)_stackBLEScannerDeviceFound:(id)a3;
- (void)_stackBLEScannerDeviceLost:(id)a3;
- (void)_stackBLEScannerDevicesBuffered:(id)a3;
- (void)_stackBLEScannerEnsureStarted;
- (void)_stackBLEScannerEnsureStopped;
- (void)_stackBLEScannerUpdateProxControlIfNeeded:(id)a3;
- (void)_stackClassicScannerDeviceFound:(id)a3;
- (void)_stackClassicScannerDeviceLost:(id)a3;
- (void)_stackClassicScannerEnsureStarted;
- (void)_stackClassicScannerEnsureStopped;
- (void)_stackControllerEnsureStarted;
- (void)_stackControllerEnsureStopped;
- (void)_stackDeviceMonitorDeviceFound:(id)a3;
- (void)_stackDeviceMonitorDeviceLost:(id)a3;
- (void)_stackDeviceMonitorEnsureStarted;
- (void)_stackDeviceMonitorEnsureStopped;
- (void)_tipiChanged:(id)a3;
- (void)_update;
- (void)_updateMemoryPressure;
- (void)_updateSelfAuthTag;
- (void)_updateUserControllerCloudDevices;
- (void)_userControllerCloudUpdateWithDevices:(id)a3;
- (void)_userControllerUploadLocalControllerInfo;
- (void)_whbDiscoveryDeviceFound:(id)a3;
- (void)_whbDiscoveryDeviceLost:(id)a3;
- (void)_whbDiscoveryEnsureStarted;
- (void)_whbDiscoveryEnsureStopped;
- (void)_xpcConnectionAccept:(id)a3;
- (void)_xpcListenerEvent:(id)a3;
- (void)_xpcPublisherConnectionsAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5;
- (void)_xpcPublisherConnectionsAddToken:(unint64_t)a3 info:(id)a4;
- (void)_xpcPublisherConnectionsRemoveToken:(unint64_t)a3 reason:(const char *)a4;
- (void)_xpcPublisherDiscoveryAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5;
- (void)_xpcPublisherDiscoveryAddToken:(unint64_t)a3 info:(id)a4;
- (void)_xpcPublisherDiscoveryRemoveToken:(unint64_t)a3 reason:(const char *)a4;
- (void)activate;
- (void)activateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)activateCBController:(id)a3 completion:(id)a4;
- (void)activateCBDiscovery:(id)a3 completion:(id)a4;
- (void)activateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)addLostDeviceToLostCBSpatialDevicesIfNeeded:(id)a3;
- (void)aopMessageReceived:(id)a3;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)coexChangeNotification:(id)a3;
- (void)descriptionInternalDebug;
- (void)invalidate;
- (void)invalidateCBAdvertiser:(id)a3 completion:(id)a4;
- (void)invalidateCBController:(id)a3 completion:(id)a4;
- (void)invalidateCBDiscovery:(id)a3 completion:(id)a4;
- (void)invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4;
- (void)notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5;
- (void)optimalWhbDeviceForStableIdentifier:(id)a3 completion:(id)a4;
- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6;
- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4;
- (void)remoteDeregisterConnection:(id)a3;
- (void)remoteRegisterConnection:(id)a3 clientID:(id)a4;
- (void)scheduleAdvertiserUpdateImmediate:(BOOL)a3;
- (void)scheduleControlUpdateImmediate:(BOOL)a3;
- (void)scheduleDiscoveryUpdateImmediate:(BOOL)a3;
- (void)scheduleSpatialUpdateImmediate:(BOOL)a3;
- (void)scheduleUpdateImmediate:(BOOL)a3;
- (void)sendCoexUpdate:(id)a3;
- (void)setAccessoryDaemon:(id)a3;
- (void)setAddressMonitor:(id)a3;
- (void)setDeviceMap:(id)a3;
- (void)setExtensionsDaemon:(id)a3;
- (void)setIdentifyDevices:(id)a3;
- (void)setIdentityArray:(id)a3;
- (void)setPrefEnforceApprovedExtensions:(BOOL)a3;
- (void)setPrefEnforceApprovedList:(BOOL)a3;
- (void)setPrefExtensionsEnabled:(BOOL)a3;
- (void)setStackController:(id)a3;
- (void)setSystemFlags:(unsigned int)a3 mask:(unsigned int)a4;
- (void)setTestAdvertiser:(id)a3;
- (void)setTestAssertion:(id)a3;
- (void)setTestDiscovery:(id)a3;
- (void)setUserController:(id)a3;
- (void)setWifiCriticalOverride:(char)a3;
- (void)setXpcConnections:(id)a3;
- (void)updateIdentities:(id)a3;
- (void)xpcConnectionInvalidated:(id)a3;
@end

@implementation CBDaemonServer

- (CBDaemonServer)initWithCBStackAdaptor:(id)a3
{
  id v5 = a3;
  if (objc_opt_class(&OBJC_CLASS___CUSystemMonitor)
    && (v13.receiver = self,
        v13.super_class = (Class)&OBJC_CLASS___CBDaemonServer,
        v6 = -[CBDaemonServer init](&v13, "init"),
        (self = v6) != 0LL))
  {
    v6->_deviceSetupStateToken = -1;
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (OS_dispatch_queue *)dispatch_queue_create("CBDaemon", v8);
    dispatchQueue = self->_dispatchQueue;
    self->_dispatchQueue = v9;

    self->_identitiesNotifyToken = -1;
    self->_odeonNotifyToken = -1;
    self->_prefsChangedNotifyToken = -1;
    self->_screenDimmedChangeNotifyToken = -1;
    self->_screenUndimmedChangeNotifyToken = -1;
    objc_storeStrong((id *)&self->_stackAdaptor, a3);
    self->_systemFlagsNotifyToken = -1;
    self->_coexNotificationSetup = 0;
    *(void *)&self->_userCloudDataChangedNotifyToken = -1LL;
    objc_storeStrong((id *)&gCBDaemonServer, self);
    self = self;
    v11 = self;
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (void)descriptionInternalDebug
{
  if (IsAppleInternalBuild(self, a2))
  {
    id v3 = sub_10000D178();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "---------------- CBDaemonServer ----------------",  v6,  2u);
    }

    id v5 = [self descriptionWithLevel:5LL];
    [v5 enumerateLinesUsingBlock:&stru_10087F008];
  }

- (id)description
{
  return -[CBDaemonServer descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  BOOL v4 = a3 < 0xBu;
  else {
    int v5 = 30;
  }
  else {
    unsigned int v6 = 20;
  }
  unsigned int v171 = a3;
  uint64_t v239 = 0LL;
  v240 = &v239;
  uint64_t v241 = 0x3032000000LL;
  v242 = sub_10000E650;
  v243 = sub_10000E660;
  int v165 = v5;
  else {
    uint64_t v7 = 5LL;
  }
  id v244 = 0LL;
  id obj = 0LL;
  uint64_t v8 = mach_continuous_time();
  uint64_t v9 = UpTicksToSeconds(v8 - self->_startTicksFull);
  uint64_t v10 = CUPrintDuration64(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = mach_absolute_time();
  uint64_t v13 = UpTicksToSeconds(v12 - self->_startTicksAwake);
  uint64_t v14 = CUPrintDuration64(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = -[NSMutableDictionary count](self->_identityMapSameAccount, "count");
  NSUInteger v17 = -[NSArray count](self->_identityArray, "count");
  id v18 = -[NSMutableDictionary count](self->_identifyDevices, "count");
  v19 = "yes";
  if (self->_odeonActive) {
    v20 = "yes";
  }
  else {
    v20 = "no";
  }
  if (!self->_wifiCritical) {
    v19 = "no";
  }
  unsigned int deviceSetupState = self->_deviceSetupState;
  if (deviceSetupState > 9)
  {
    if (deviceSetupState == 10)
    {
      v22 = "NotStarted";
      goto LABEL_27;
    }

    if (deviceSetupState == 20)
    {
      v22 = "Complete";
      goto LABEL_27;
    }
  }

  else
  {
    if (!self->_deviceSetupState)
    {
      v22 = "Unknown";
      goto LABEL_27;
    }

    if (deviceSetupState == 1)
    {
      v22 = "FrameworkUnavailable";
      goto LABEL_27;
    }
  }

  v22 = "?";
LABEL_27:
  NSAppendPrintF_safe( &obj,  "Up %@ (awake %@), Identities SA %d / Other %d / Devices %d, Odeon %s, WiFi critical %s, Device Setup %s",  v11,  v15,  v16,  v17,  v18,  v20,  v19,  v22);
  objc_storeStrong(&v244, obj);

  v23 = self->_selfAuthTag;
  v24 = v23;
  if (v23)
  {
    v25 = (id *)(v240 + 5);
    id v237 = (id)v240[5];
    uint64_t v26 = CUPrintNSDataHex(v23, 10LL, 1LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    NSAppendPrintF_safe(&v237, ", AuthTag <%@>", v27);
    objc_storeStrong(v25, v237);
  }

  v28 = self->_selfAuthTagNonConnectable;
  v29 = v28;
  if (v28)
  {
    v30 = (id *)(v240 + 5);
    id v236 = (id)v240[5];
    uint64_t v31 = CUPrintNSDataHex(v28, 10LL, 1LL);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    NSAppendPrintF_safe(&v236, ", AuthTagNonConnectable <%@>", v32);
    objc_storeStrong(v30, v236);
  }

  if (IsAppleInternalBuild(v33, v34))
  {
    uint64_t v35 = ((CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970) / 7200.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  -(kCFAbsoluteTimeIntervalSince1970 - (double)v35 * 7200.0)));
    v37 = [NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:v36];

    v38 = (id *)(v240 + 5);
    id v235 = (id)v240[5];
    NSAppendPrintF_safe( &v235,  ", CBIntervalNumber <%u, %f, %@>",  v35,  -(kCFAbsoluteTimeIntervalSince1970 - (double)v35 * 7200.0),  v37);
    objc_storeStrong(v38, v235);
  }

  v39 = (id *)(v240 + 5);
  id v234 = (id)v240[5];
  NSAppendPrintF_safe(&v234, "\n\n");
  objc_storeStrong(v39, v234);
  uint64_t assertionFlags = self->_assertionFlags;
  if ((_DWORD)assertionFlags)
  {
    v41 = (id *)(v240 + 5);
    id v233 = (id)v240[5];
    uint64_t v42 = CUPrintFlags32(assertionFlags, &unk_1006BA410);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    NSAppendPrintF_safe(&v233, "Assertions: %@\n", v43);
    objc_storeStrong(v41, v233);
  }

  v44 = self->_bleAdvertiser;
  v45 = v44;
  if (v44)
  {
    if (v171 >= 0xB) {
      uint64_t v46 = 50LL;
    }
    else {
      uint64_t v46 = 30LL;
    }
    v47 = (id *)(v240 + 5);
    id v232 = (id)v240[5];
    uint64_t v48 = CUDescriptionWithLevel(v44, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    NSAppendPrintF_safe(&v232, "%@\n", v49);
    objc_storeStrong(v47, v232);
  }

  v168 = self->_accessoryDaemon;
  if (v168) {
    BOOL v50 = v171 < 0xB;
  }
  else {
    BOOL v50 = 1;
  }
  if (!v50)
  {
    v51 = (id *)(v240 + 5);
    id v231 = (id)v240[5];
    NSAppendPrintF_safe(&v231, "%@\n", v168);
    objc_storeStrong(v51, v231);
  }

  v169 = self->_extensionsDaemon;
  if (v171 >= 0xB && v169)
  {
    v52 = (id *)(v240 + 5);
    id v230 = (id)v240[5];
    NSAppendPrintF_safe(&v230, "%@\n", v169);
    objc_storeStrong(v52, v230);
  }

  uint64_t v53 = [+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon") autorelease];
  v54 = (void *)v53;
  if (v53)
  {
    v55 = (id *)(v240 + 5);
    id v229 = (id)v240[5];
    NSAppendPrintF_safe(&v229, "%@\n", v53);
    objc_storeStrong(v55, v229);
  }

  v56 = self->_addressMonitor;
  v57 = v56;
  if (v56)
  {
    v58 = (id *)(v240 + 5);
    id v228 = (id)v240[5];
    uint64_t v59 = CUDescriptionWithLevel(v56, v7);
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    NSAppendPrintF_safe(&v228, "%@\n", v60);
    objc_storeStrong(v58, v228);
  }

  v167 = self->_stackBLEScanner;
  if (v167) {
    BOOL v61 = v171 < 0xB;
  }
  else {
    BOOL v61 = 1;
  }
  if (!v61)
  {
    v62 = (id *)(v240 + 5);
    id v227 = (id)v240[5];
    NSAppendPrintF_safe(&v227, "%@\n", v167);
    objc_storeStrong(v62, v227);
  }

  v170 = self->_stackClassicScanner;
  if (v171 >= 0xB && v170)
  {
    v63 = (id *)(v240 + 5);
    id v226 = (id)v240[5];
    NSAppendPrintF_safe(&v226, "%@\n", v170);
    objc_storeStrong(v63, v226);
  }

  v64 = self->_stackController;
  v65 = v64;
  if (v64)
  {
    v66 = (id *)(v240 + 5);
    id v225 = (id)v240[5];
    uint64_t v67 = CUDescriptionWithLevel(v64, v7);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    NSAppendPrintF_safe(&v225, "%@\n", v68);
    objc_storeStrong(v66, v225);
  }

  v166 = self->_stackDeviceMonitor;
  if (v166) {
    BOOL v69 = v171 < 0xB;
  }
  else {
    BOOL v69 = 1;
  }
  if (!v69)
  {
    v70 = (id *)(v240 + 5);
    id v224 = (id)v240[5];
    NSAppendPrintF_safe(&v224, "%@\n", v166);
    objc_storeStrong(v70, v224);
  }

  v71 = self->_remoteClient;
  v72 = v71;
  if (v71)
  {
    v73 = (id *)(v240 + 5);
    id v223 = (id)v240[5];
    v74 = [v71 localDevice];
    v75 = [v74 idsDeviceIdentifier];
    v76 = -[RPCompanionLinkClient activeDevices];
    NSAppendPrintF_safe(&v223, "%sRemoteClient: IDS %@, controllers %d", ", v75, [v76 count]);
    objc_storeStrong(v73, v223);
  }

  v77 = self->_remoteServer;
  if (v77)
  {
    v78 = v77;
    v79 = (id *)(v240 + 5);
    id v222 = (id)v240[5];
    v80 = ", ";
    if (!v72) {
      v80 = "";
    }
    NSAppendPrintF_safe(&v222, "%sRemoteServer: Yes", v80);
    objc_storeStrong(v79, v222);

    goto LABEL_74;
  }

  if (v72)
  {
LABEL_74:
    v81 = (id *)(v240 + 5);
    id v221 = (id)v240[5];
    NSAppendPrintF_safe(&v221, "\n");
    objc_storeStrong(v81, v221);
  }

  if (v168 && v171 <= 0xA)
  {
    v82 = (id *)(v240 + 5);
    id v220 = (id)v240[5];
    NSAppendPrintF_safe(&v220, "\n");
    objc_storeStrong(v82, v220);
    v83 = (id *)(v240 + 5);
    id v219 = (id)v240[5];
    uint64_t v84 = CUDescriptionWithLevel(v168, v7);
    v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
    NSAppendPrintF_safe(&v219, "%@", v85);
    objc_storeStrong(v83, v219);
  }

  if (v169) {
    BOOL v86 = v171 > 0xA;
  }
  else {
    BOOL v86 = 1;
  }
  if (!v86)
  {
    v87 = (id *)(v240 + 5);
    id v218 = (id)v240[5];
    NSAppendPrintF_safe(&v218, "\n");
    objc_storeStrong(v87, v218);
    v88 = (id *)(v240 + 5);
    id v217 = (id)v240[5];
    uint64_t v89 = CUDescriptionWithLevel(v169, v7);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    NSAppendPrintF_safe(&v217, "%@", v90);
    objc_storeStrong(v88, v217);
  }

  if (v167) {
    BOOL v91 = v171 > 0xA;
  }
  else {
    BOOL v91 = 1;
  }
  if (v91)
  {
    if (v170) {
      BOOL v92 = v171 > 0xA;
    }
    else {
      BOOL v92 = 1;
    }
    if (v92)
    {
      if (v166) {
        BOOL v93 = v171 > 0xA;
      }
      else {
        BOOL v93 = 1;
      }
      if (v93)
      {
        v94 = self->_whbDiscoveryDaemon;
        if (!v94)
        {
          BOOL v4 = 0;
          goto LABEL_112;
        }

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E7D4;
  block[3] = &unk_10087EEC8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  self->_startTicksAwake = mach_absolute_time();
  self->_startTicksFull = mach_continuous_time();
  LogSetAppID(@"com.apple.bluetooth");
  LogControl("?.*:level=chatty,.*:flags=public");
  -[CBDaemonServer _stackControllerEnsureStarted](self, "_stackControllerEnsureStarted");
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service( "com.apple.bluetooth.xpc",  (dispatch_queue_t)self->_dispatchQueue,  1uLL);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;

    int v5 = self->_xpcListener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000EF38;
    handler[3] = &unk_10087F080;
    handler[4] = self;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(self->_xpcListener);
  }

  if (!self->_xpcPublisherConnections)
  {
    uint64_t v6 = xpc_event_publisher_create("com.apple.bluetooth.connections", self->_dispatchQueue);
    uint64_t v7 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue(v6);
    xpcPublisherConnections = self->_xpcPublisherConnections;
    self->_xpcPublisherConnections = v7;

    uint64_t v9 = self->_xpcPublisherConnections;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10000EF44;
    v47[3] = &unk_10087F0A8;
    v47[4] = self;
    xpc_event_publisher_set_handler(v9, v47);
    xpc_event_publisher_set_error_handler(self->_xpcPublisherConnections, &stru_10087F0E8);
    xpc_event_publisher_activate(self->_xpcPublisherConnections);
  }

  if (!self->_xpcPublisherDiscovery)
  {
    uint64_t v10 = xpc_event_publisher_create("com.apple.bluetooth.discovery", self->_dispatchQueue);
    v11 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue(v10);
    xpcPublisherDiscovery = self->_xpcPublisherDiscovery;
    self->_xpcPublisherDiscovery = v11;

    uint64_t v13 = self->_xpcPublisherDiscovery;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10000EFEC;
    v46[3] = &unk_10087F0A8;
    v46[4] = self;
    xpc_event_publisher_set_handler(v13, v46);
    xpc_event_publisher_set_error_handler(self->_xpcPublisherDiscovery, &stru_10087F108);
    xpc_event_publisher_activate(self->_xpcPublisherDiscovery);
  }

  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10000F094;
    v45[3] = &unk_10087F130;
    v45[4] = self;
    notify_register_dispatch("com.apple.bluetooth.prefsChanged", &self->_prefsChangedNotifyToken, dispatchQueue, v45);
  }

  unint64_t v15 = self->_memoryPressureSource;
  id v16 = (dispatch_source_s *)v15;
  if (!v15)
  {
    dispatch_source_t v17 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_memorypressure,  0LL,  7uLL,  (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_memoryPressureSource, v17);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10000F104;
    v42[3] = &unk_10087EFC8;
    id v16 = v17;
    v43 = v16;
    v44 = self;
    dispatch_source_set_event_handler(v16, v42);
    dispatch_activate(v16);
  }

  if (!self->_systemMonitor)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v18;
    v20 = v18;

    -[CUSystemMonitor setDispatchQueue:](v20, "setDispatchQueue:", self->_dispatchQueue);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10000F1EC;
    v41[3] = &unk_10087EEC8;
    v41[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](v20, "setFirstUnlockHandler:", v41);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10000F1F4;
    v40[3] = &unk_10087EEC8;
    v40[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](v20, "setScreenOnChangedHandler:", v40);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10000F200;
    v39[3] = &unk_10087EEC8;
    v39[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](v20, "setWifiStateChangedHandler:", v39);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10000F20C;
    v38[3] = &unk_10087EFC8;
    v38[4] = self;
    v38[5] = v20;
    -[CUSystemMonitor activateWithCompletion:](v20, "activateWithCompletion:", v38);
  }

  if (self->_odeonNotifyToken == -1)
  {
    v21 = (dispatch_queue_s *)self->_dispatchQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10000F23C;
    v37[3] = &unk_10087F130;
    v37[4] = self;
    unint64_t v15 = notify_register_dispatch("com.apple.airplay.isPlayingAmbientAudioChanged", &self->_odeonNotifyToken, v21, v37);
  }

  if (self->_systemFlagsNotifyToken == -1) {
    unint64_t v15 = notify_register_check("com.apple.bluetooth.systemFlags", &self->_systemFlagsNotifyToken);
  }
  if (!self->_tipiObserving)
  {
    v22 = [NSNotificationCenter defaultCenter];
    [v22 addObserver:self selector:"_tipiChanged:" name:@"com.apple.bluetooth.TipiChanged" object:0];
    self->_tipiObserving = 1;
  }

  if (self->_userCloudDataChangedNotifyToken == -1)
  {
    v23 = (dispatch_queue_s *)self->_dispatchQueue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10000F324;
    v36[3] = &unk_10087F130;
    v36[4] = self;
    unint64_t v15 = notify_register_dispatch( "com.apple.bluetoothuser.cloudChanged",  &self->_userCloudDataChangedNotifyToken,  v23,  v36);
  }

  if (self->_userDaemonStartedNotifyToken == -1)
  {
    v24 = (dispatch_queue_s *)self->_dispatchQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10000F32C;
    v35[3] = &unk_10087F130;
    v35[4] = self;
    unint64_t v15 = notify_register_dispatch( "com.apple.bluetoothuser.daemonStarted",  &self->_userDaemonStartedNotifyToken,  v24,  v35);
  }

  if (!self->_stateHandler)
  {
    v25 = self->_dispatchQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10000F334;
    v34[3] = &unk_10087F158;
    v34[4] = self;
    unint64_t v15 = os_state_add_handler(v25, v34);
    self->_stateHandler = v15;
  }

  if (&_BYSetupAssistantNeedsToRun)
  {
    if (self->_deviceSetupState == 1)
    {
      id v26 = 0LL;
    }

    else
    {
      else {
        unsigned __int8 v27 = 20;
      }
      self->_unsigned int deviceSetupState = v27;
      id v28 = BYSetupAssistantFinishedDarwinNotification;
      id v26 = v28;
      if (self->_deviceSetupState == 10 && self->_deviceSetupStateToken == -1)
      {
        id v26 = v28;
        v29 = (const char *)[v26 UTF8String];
        v30 = (dispatch_queue_s *)self->_dispatchQueue;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_10000F36C;
        v33[3] = &unk_10087F130;
        v33[4] = self;
        notify_register_dispatch(v29, &self->_deviceSetupStateToken, v30, v33);
      }
    }
  }

  else
  {
    id v26 = 0LL;
    self->_unsigned int deviceSetupState = 1;
  }

  if (dword_1008D5FD8 <= 30 && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
  {
    unsigned int deviceSetupState = self->_deviceSetupState;
    if (deviceSetupState > 9)
    {
      if (deviceSetupState == 10)
      {
        v32 = "NotStarted";
        goto LABEL_49;
      }

      if (deviceSetupState == 20)
      {
        v32 = "Complete";
        goto LABEL_49;
      }
    }

    else
    {
      if (!self->_deviceSetupState)
      {
        v32 = "Unknown";
        goto LABEL_49;
      }

      if (deviceSetupState == 1)
      {
        v32 = "FrameworkUnavailable";
LABEL_49:
        LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _activate]", 30LL, "Device setup %s", v32);
        goto LABEL_50;
      }
    }

    v32 = "?";
    goto LABEL_49;
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F4B0;
  block[3] = &unk_10087EEC8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  id v3 = self->_xpcConnections;
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0LL;

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  int v5 = v3;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)i) invalidate:v31];
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
    }

    while (v7);
  }

  -[NSMutableSet removeAllObjects](v5, "removeAllObjects");
  -[CBDaemonServer _remoteEnsureStopped](self, "_remoteEnsureStopped");
  -[CBDaemonServer _whbDiscoveryEnsureStopped](self, "_whbDiscoveryEnsureStopped");
  -[CBDaemonServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  -[CBDaemonServer _identitiesEnsureStopped](self, "_identitiesEnsureStopped");
  -[CBDaemonServer _stackBLEScannerEnsureStopped](self, "_stackBLEScannerEnsureStopped");
  -[CBDaemonServer _stackClassicScannerEnsureStopped](self, "_stackClassicScannerEnsureStopped");
  -[CBDaemonServer _stackControllerEnsureStopped](self, "_stackControllerEnsureStopped");
  -[CBDaemonServer _stackDeviceMonitorEnsureStopped](self, "_stackDeviceMonitorEnsureStopped");
  -[CBDaemonServer _accessoryDaemonEnsureStopped](self, "_accessoryDaemonEnsureStopped");
  -[CBDaemonServer _invalidateUserController](self, "_invalidateUserController");
  lostDevicesForCBSpatialWipeTimer = self->_lostDevicesForCBSpatialWipeTimer;
  if (lostDevicesForCBSpatialWipeTimer)
  {
    v11 = lostDevicesForCBSpatialWipeTimer;
    dispatch_source_cancel(v11);
    uint64_t v12 = self->_lostDevicesForCBSpatialWipeTimer;
    self->_lostDevicesForCBSpatialWipeTimer = 0LL;
  }

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    uint64_t v14 = memoryPressureSource;
    dispatch_source_cancel(v14);
    unint64_t v15 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0LL;
  }

  int deviceSetupStateToken = self->_deviceSetupStateToken;
  if (deviceSetupStateToken != -1)
  {
    notify_cancel(deviceSetupStateToken);
    self->_int deviceSetupStateToken = -1;
  }

  int prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_int prefsChangedNotifyToken = -1;
  }

  int odeonNotifyToken = self->_odeonNotifyToken;
  if (odeonNotifyToken != -1)
  {
    notify_cancel(odeonNotifyToken);
    self->_int odeonNotifyToken = -1;
  }

  int screenDimmedChangeNotifyToken = self->_screenDimmedChangeNotifyToken;
  if (screenDimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenDimmedChangeNotifyToken);
    self->_int screenDimmedChangeNotifyToken = -1;
  }

  int screenUndimmedChangeNotifyToken = self->_screenUndimmedChangeNotifyToken;
  if (screenUndimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenUndimmedChangeNotifyToken);
    self->_int screenUndimmedChangeNotifyToken = -1;
  }

  int systemFlagsNotifyToken = self->_systemFlagsNotifyToken;
  if (systemFlagsNotifyToken != -1)
  {
    notify_cancel(systemFlagsNotifyToken);
    self->_int systemFlagsNotifyToken = -1;
  }

  int userCloudDataChangedNotifyToken = self->_userCloudDataChangedNotifyToken;
  if (userCloudDataChangedNotifyToken != -1)
  {
    notify_cancel(userCloudDataChangedNotifyToken);
    self->_int userCloudDataChangedNotifyToken = -1;
  }

  int userDaemonStartedNotifyToken = self->_userDaemonStartedNotifyToken;
  if (userDaemonStartedNotifyToken != -1)
  {
    notify_cancel(userDaemonStartedNotifyToken);
    self->_int userDaemonStartedNotifyToken = -1;
  }

  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0LL;
  }

  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate", (void)v31);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0LL;

  if (self->_tipiObserving || self->_lowPowerModeObserving)
  {
    v25 = [NSNotificationCenter defaultCenter];
    [v25 removeObserver:self];

    if (self->_tipiObserving) {
      self->_tipiObserving = 0;
    }
    if (self->_lowPowerModeObserving) {
      self->_lowPowerModeObserving = 0;
    }
  }

  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    unsigned __int8 v27 = xpcListener;
    xpc_connection_cancel(v27);
    id v28 = self->_xpcListener;
    self->_xpcListener = 0LL;
  }

  xpcPublisherConnections = self->_xpcPublisherConnections;
  self->_xpcPublisherConnections = 0LL;

  xpcPublisherDiscovery = self->_xpcPublisherDiscovery;
  self->_xpcPublisherDiscovery = 0LL;
}

- (BOOL)_firstUnlockedOrAllowedBefore
{
  if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0
    || (os_variant_is_recovery("com.apple.bluetooth") & 1) != 0)
  {
    return 1;
  }

  else
  {
    return MGGetBoolAnswer(@"3kmXfug8VcxLI5yEmsqQKw");
  }

- (void)_prefsChanged
{
  int v106 = 0;
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"accessoryDaemonEnabled", &v106);
  if (v106) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = Int64 == 0;
  }
  BOOL v5 = !v4;
  if (self->_prefAccessoryDaemonEnabled != v5)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      id v6 = "yes";
      if (v5) {
        id v7 = "no";
      }
      else {
        id v7 = "yes";
      }
      if (!v5) {
        id v6 = "no";
      }
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _prefsChanged]",  30LL,  "AccessoryDaemonEnabled: %s -> %s",  v7,  v6);
    }

    self->_prefAccessoryDaemonEnabled = v5;
  }

  uint64_t v8 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"APLogCloudCollectionEnabled", &v106);
  BOOL v9 = v8 != 0;
  if (self->_prefAppleAudioDeviceLimitedLoggingEnabled != v9)
  {
    if (dword_1008D5FD8 <= 30)
    {
      uint64_t v10 = v8;
      if (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL))
      {
        v11 = "yes";
        if (v10) {
          uint64_t v12 = "no";
        }
        else {
          uint64_t v12 = "yes";
        }
        if (!v10) {
          v11 = "no";
        }
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _prefsChanged]",  30LL,  "AppleAudioDeviceLimitedLoggingEnabled: %s -> %s",  v12,  v11);
      }
    }

    self->_prefAppleAudioDeviceLimitedLoggingEnabled = v9;
  }

  uint64_t v13 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"authTagIntegrityCheckEnabled", &v106);
  if (v106) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13 == 0;
  }
  BOOL v15 = !v14;
  if (self->_prefAuthTagIntegrityCheckEnabled != v15)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      id v16 = "yes";
      if (v15) {
        dispatch_source_t v17 = "no";
      }
      else {
        dispatch_source_t v17 = "yes";
      }
      if (!v15) {
        id v16 = "no";
      }
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _prefsChanged]",  30LL,  "AuthTagIntegrityCheckEnabled: %s -> %s",  v17,  v16);
    }

    self->_prefAuthTagIntegrityCheckEnabled = v15;
  }

  uint64_t v18 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"bleAdvertising", &v106);
  if (v106) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v18 == 0;
  }
  BOOL v20 = !v19;
  if (self->_prefBLEAdvertising != v20)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
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
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _prefsChanged]", 30LL, "BLEAdvertising: %s -> %s", v22, v21);
    }

    self->_prefBLEAdvertising = v20;
  }

  uint64_t v23 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"bleScanning", &v106);
  if (v106) {
    BOOL v24 = 0;
  }
  else {
    BOOL v24 = v23 == 0;
  }
  BOOL v25 = !v24;
  if (self->_prefBLEScanning != v25)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      id v26 = "yes";
      if (v25) {
        unsigned __int8 v27 = "no";
      }
      else {
        unsigned __int8 v27 = "yes";
      }
      if (!v25) {
        id v26 = "no";
      }
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _prefsChanged]", 30LL, "BLEScanning: %s -> %s", v27, v26);
    }

    self->_prefBLEScanning = v25;
  }

  char v28 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"CBExtensionRSSIOverride", &v106);
  if (v106) {
    char v29 = 0;
  }
  else {
    char v29 = v28;
  }
  int prefCBExtensionRSSIOverride = self->_prefCBExtensionRSSIOverride;
  if (prefCBExtensionRSSIOverride != v29)
  {
    if (dword_1008D5FD8 <= 30)
    {
      if (dword_1008D5FD8 == -1)
      {
        LOBYTE(prefCBExtensionRSSIOverride) = self->_prefCBExtensionRSSIOverride;
      }

      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _prefsChanged]",  30LL,  "CBExtensionRSSIOverride: %d -> %d",  (char)prefCBExtensionRSSIOverride,  v29);
    }

- (void)_reportDeviceFound:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11 = objc_autoreleasePoolPush();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activatedDiscovery", (void)v14));
        uint64_t v13 = v12;

        objc_autoreleasePoolPop(v11);
        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }

  [v4 changedTypesRemoveAll];
}

- (void)_reportDeviceLost:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v9);
        v11 = objc_autoreleasePoolPush();
        [v10 reportDeviceLost:v4, v12];
        objc_autoreleasePoolPop(v11);
        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  [v4 changedTypesRemoveAll];
}

- (void)_reportDevicesBuffered:(id)a3
{
  id v4 = a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  BOOL v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v9);
        v11 = objc_autoreleasePoolPush();
        __int128 v12 = (void *)[v10 activatedDiscovery];
        __int128 v13 = v12;

        objc_autoreleasePoolPop(v11);
        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    }

    while (v7);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v18), "changedTypesRemoveAll", (void)v19);
        uint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v16);
  }
}

- (void)scheduleAdvertiserUpdateImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  bleAdvertiserArray = self->_bleAdvertiserArray;
  self->_bleAdvertiserArray = 0LL;

  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", v3);
}

- (void)scheduleControlUpdateImmediate:(BOOL)a3
{
  self->_assertionFlagsValid = 0;
  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", a3);
}

- (void)scheduleDiscoveryUpdateImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  bleDiscoveryArray = self->_bleDiscoveryArray;
  self->_bleDiscoveryArray = 0LL;

  self->_deviceMonitorFlagsValid = 0;
  whbDiscoveryArray = self->_whbDiscoveryArray;
  self->_whbDiscoveryArray = 0LL;

  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", v3);
}

- (void)scheduleSpatialUpdateImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  bleAdvertiserArray = self->_bleAdvertiserArray;
  self->_bleAdvertiserArray = 0LL;

  self->_bleAdvertiserSpatialValid = 0;
  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", v3);
}

- (void)scheduleUpdateImmediate:(BOOL)a3
{
  if (a3)
  {
    -[CBDaemonServer _update](self, "_update");
  }

  else
  {
    void block[5] = v3;
    block[6] = v4;
    if (!self->_updatePending)
    {
      self->_updatePending = 1;
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100010C20;
      block[3] = &unk_10087EEC8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }

- (void)setSystemFlags:(unsigned int)a3 mask:(unsigned int)a4
{
  unsigned int systemFlags = self->_systemFlags;
  uint64_t v8 = systemFlags & ~a4 | a4 & a3;
  if ((_DWORD)v8 != systemFlags)
  {
    self->_unsigned int systemFlags = v8;
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      uint64_t v9 = CUPrintFlags32(v8, &unk_1006BA454);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = CUPrintFlags32(v8 ^ systemFlags, &unk_1006BA454);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer setSystemFlags:mask:]",  30LL,  "SystemFlags changed: %@ (^ %@)",  v10,  v12);
    }

    notify_set_state(self->_systemFlagsNotifyToken, v8);
    notify_post("com.apple.bluetooth.systemFlags");
  }

- (void)_tipiChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010DC8;
  v7[3] = &unk_10087EFC8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_update
{
  self->_updatePending = 0;
  if (!self->_assertionFlagsValid)
  {
    unsigned int assertionFlags = self->_assertionFlags;
    self->_unsigned int assertionFlags = 0;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v4 = self->_xpcConnections;
    id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)i) activatedController]);
          uint64_t v10 = v9;
          if (v9) {
            self->_assertionFlags |= [v9 assertionFlags];
          }
        }

        id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      }

      while (v6);
    }

    self->_assertionFlagsValid = 1;
    uint64_t v11 = self->_assertionFlags;
    if ((_DWORD)v11 != assertionFlags && dword_1008D5FD8 <= 30)
    {
      if (dword_1008D5FD8 != -1)
      {
LABEL_14:
        uint64_t v12 = CUPrintFlags32(v11, &unk_1006BA410);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        uint64_t v14 = CUPrintFlags32(self->_assertionFlags ^ assertionFlags, &unk_1006BA410);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _update]",  30LL,  "AssertionFlags changed: %@ (^ %@)",  v13,  v15,  (void)v25);

        goto LABEL_16;
      }

      if (_LogCategory_Initialize(&dword_1008D5FD8, 30LL))
      {
        uint64_t v11 = self->_assertionFlags;
        goto LABEL_14;
      }
    }
  }

- (void)_updateMemoryPressure
{
  v2 = self->_xpcPublisherDiscovery;
  if (v2)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v3 = self->_xpcConnections;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v27;
      unsigned int v24 = v2;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          uint64_t v9 = objc_autoreleasePoolPush();
          uint64_t v10 = (void *)[v8 xpcCnx];

          if (!v10)
          {
            id v11 = [v8 xpcToken];
            if (v11)
            {
              id v12 = v11;
              __int128 v13 = (void *)[v8 activatedDiscovery];
              uint64_t v14 = v13;
              if (v13)
              {
                if ([v13 keepAlive])
                {
                  id v15 = [v8 deviceMap];
                  if ([v15 count])
                  {
                    unsigned int memoryPressureFlags = self->_memoryPressureFlags;
                    BOOL v17 = (memoryPressureFlags & ~[v14 memoryPressureFlags]) == 0;
                  }

                  else
                  {
                    BOOL v17 = 0LL;
                  }
                }

                else
                {
                  BOOL v17 = 0LL;
                }

                uint64_t v18 = xpc_event_publisher_set_subscriber_keepalive(v2, v12, v17);
                if (dword_1008D5FD8 <= 30)
                {
                  uint64_t v19 = v18;
                  if (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL))
                  {
                    if (v17) {
                      unsigned int v20 = "yes";
                    }
                    else {
                      unsigned int v20 = "no";
                    }
                    uint64_t v21 = CUPrintErrorCode(v19);
                    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                    unsigned int v23 = v20;
                    v2 = v24;
                    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _updateMemoryPressure]",  30LL,  "XPC subscriber keepalive: token %llu, keepAlive %s, %@",  v12,  v23,  v22);
                  }
                }
              }
            }
          }

          objc_autoreleasePoolPop(v9);
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      }

      while (v5);
    }
  }
}

- (void)_updateSelfAuthTag
{
  uint64_t v3 = self->_identitySelf;
  if (v3)
  {
    id v4 = [self->_addressMonitor connectableAddressData];
    if (!v4)
    {
      if (dword_1008D5FD8 <= 30
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
      {
        LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _updateSelfAuthTag]", 30LL, "SelfAuthTag: no address");
      }

      int v15 = 0;
LABEL_33:
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[CBStackAddressMonitor nonConnectableAddressData]( self->_addressMonitor,  "nonConnectableAddressData"));
      if (!v21)
      {
        if (dword_1008D5FD8 <= 30
          && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
        {
          LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _updateSelfAuthTag]", 30LL, "SelfAuthTagNC: no address");
        }

- (void)_updateUserControllerCloudDevices
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100011B70;
  v2[3] = &unk_10087F1A8;
  v2[4] = self;
  -[CBDaemonServer _performUserControllerActionWithCompletion:](self, "_performUserControllerActionWithCompletion:", v2);
}

- (OS_xpc_object)xpcListenerEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_xpcListenerEndpoint;
  if (v3)
  {
    id v4 = v3;
  }

  else
  {
    id v5 = v2->_xpcListener;
    id v6 = v5;
    if (v5)
    {
      xpc_endpoint_t v7 = xpc_endpoint_create(v5);
      objc_storeStrong((id *)&v2->_xpcListenerEndpoint, v7);
      id v4 = v7;
    }

    else
    {
      id v4 = 0LL;
    }
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)_bleAddressMonitorEnsureStarted
{
  if (!self->_addressMonitor)
  {
    p_addressMonitor = &self->_addressMonitor;
    id v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor addressMonitorClass](self->_stackAdaptor, "addressMonitorClass")));
    objc_storeStrong((id *)p_addressMonitor, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100011E88;
    v8[3] = &unk_10087EFC8;
    id v5 = v4;
    id v9 = v5;
    uint64_t v10 = self;
    [v5 setAddressChangedHandler:v8];
    [v5 activate];
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      uint64_t v6 = CUDescriptionWithLevel(v5, 134217778LL);
      xpc_endpoint_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _bleAddressMonitorEnsureStarted]",  30LL,  "BLE advertiser address monitor started: %@",  v7);
    }

    -[CBDaemonServer _bleAdvertiserAddressChanged:](self, "_bleAdvertiserAddressChanged:", 1LL);
    -[CBDaemonServer _updateSelfAuthTag](self, "_updateSelfAuthTag");
  }

- (void)_bleAddressMonitorEnsureStopped
{
  addressMonitor = self->_addressMonitor;
  self->_addressMonitor = 0LL;
}

- (void)_bleAdvertiserEnsureStarted
{
  p_bleAdvertiser = &self->_bleAdvertiser;
  id v4 = self->_bleAdvertiser;
  BOOL v5 = v4 == 0LL;
  if (!v4)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _bleAdvertiserEnsureStarted]", 30LL, "BLE advertiser start");
    }

    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___CBAdvertiserDaemon);
    objc_storeStrong((id *)p_bleAdvertiser, v6);
    -[CBAdvertiserDaemon setDaemonServer:](v6, "setDaemonServer:", self);
    -[CBAdvertiserDaemon setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAdvertiserDaemon setStackAdaptor:](v6, "setStackAdaptor:", self->_stackAdaptor);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000121DC;
    v23[3] = &unk_10087EFC8;
    id v4 = v6;
    unsigned int v24 = v4;
    __int128 v25 = self;
    -[CBAdvertiserDaemon setStateChangedHandler:](v4, "setStateChangedHandler:", v23);
  }

  xpc_endpoint_t v7 = self->_selfAuthTag;
  id v8 = [CBAdvertiserDaemon selfAuthTag];
  id v9 = v7;
  uint64_t v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_14;
  }

  unsigned __int8 v11 = v10;
  if ((v9 == 0LL) == (v10 != 0LL))
  {

    goto LABEL_13;
  }

  unsigned __int8 v12 = -[NSData isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) == 0)
  {
LABEL_13:
    -[CBAdvertiserDaemon setSelfAuthTag:](v4, "setSelfAuthTag:", v9);
    BOOL v5 = 1;
  }

- (void)_bleAdvertiserEnsureStopped
{
  if (self->_bleAdvertiser)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _bleAdvertiserEnsureStopped]", 30LL, "BLE advertiser stop");
    }

    bleAdvertiserArray = self->_bleAdvertiserArray;
    self->_bleAdvertiserArray = 0LL;

    -[CBAdvertiserDaemon invalidate](self->_bleAdvertiser, "invalidate");
    bleAdvertiser = self->_bleAdvertiser;
    self->_bleAdvertiser = 0LL;

    self->_bleAdvertiserSpatialValid = 0;
    bleAdvertiserSpatialLingerTimer = self->_bleAdvertiserSpatialLingerTimer;
    if (bleAdvertiserSpatialLingerTimer)
    {
      uint64_t v6 = bleAdvertiserSpatialLingerTimer;
      dispatch_source_cancel(v6);
      xpc_endpoint_t v7 = self->_bleAdvertiserSpatialLingerTimer;
      self->_bleAdvertiserSpatialLingerTimer = 0LL;
    }

    bleAdvertiserSpatialRestartTimer = self->_bleAdvertiserSpatialRestartTimer;
    if (bleAdvertiserSpatialRestartTimer)
    {
      uint64_t v10 = bleAdvertiserSpatialRestartTimer;
      dispatch_source_cancel(v10);
      id v9 = self->_bleAdvertiserSpatialRestartTimer;
      self->_bleAdvertiserSpatialRestartTimer = 0LL;
    }
  }

- (BOOL)_bleAdvertiserShouldRun
{
  if (!self->_prefBLEAdvertising
    || !-[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore")
    || !-[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    return 0;
  }

  uint64_t v3 = self->_bleAdvertiserArray;
  if (-[NSMutableArray count](v3, "count")) {
    goto LABEL_30;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = self->_xpcConnections;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v5)
  {
    id v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        unsigned __int8 v11 = (void *)[v10 activatedAdvertiser];
        if (v11)
        {
          if (!v3) {
            uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v3, "addObject:", v11);
        }

        if (v7)
        {
          BOOL v7 = 1;
        }

        else
        {
          unsigned __int8 v12 = (void *)[v10 activatedSpatialInteractionSession];
          __int128 v13 = v12;
          if (v12) {
            BOOL v7 = ([v12 controlFlags] & 8) == 0;
          }
          else {
            BOOL v7 = 0;
          }
        }
      }

      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v6);
  }

  else
  {
    BOOL v7 = 0;
  }

  objc_storeStrong((id *)&self->_bleAdvertiserArray, v3);
  -[CBAdvertiserDaemon setAdvertiserArray:](self->_bleAdvertiser, "setAdvertiserArray:", 0LL);
  if (v7
    || -[CBAdvertiserDaemon needsToRun](self->_bleAdvertiser, "needsToRun")
    || self->_bleAdvertiserSpatialLingerTimer
    || (unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[CBAdvertiserDaemon spatialInteractionIdentifiers]( self->_bleAdvertiser,  "spatialInteractionIdentifiers")),  v17 = [v16 count],  v16,  v17))
  {
LABEL_30:
    BOOL v14 = 1;
  }

  else
  {
    BOOL v14 = -[NSMutableArray count](v3, "count") != 0LL;
  }

  return v14;
}

- (void)_bleAdvertiserAddressChanged:(BOOL)a3
{
  if (!a3)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      uint64_t v4 = CUDescriptionWithLevel(self->_addressMonitor, 134217778LL);
      id v5 = v4;
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _bleAdvertiserAddressChanged:]",  30LL,  "BLE advertiser address changed: %@",  v5);
    }

    self->_bleAdvertiserSpatialValid = 0;
    -[CBAdvertiserDaemon advertisingAddressChanged](self->_bleAdvertiser, "advertisingAddressChanged");
    -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 0LL);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = self->_xpcConnections;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        unsigned __int8 v12 = (void *)[v11 activatedSpatialInteractionSession];
        __int128 v13 = [v12 advertisingAddressChangedHandler];

        if (v13) {
          v13[2](v13);
        }

        BOOL v14 = [v11 activatedAdvertiser];
        unsigned int v15 = (void (**)(void))objc_claimAutoreleasedReturnValue([v14 advertisingAddressChangedHandler]);

        if (v15) {
          v15[2](v15);
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }
}

- (BOOL)_bleAdvertiserUpdateSpatialInteraction
{
  if (!self->_bleAdvertiserSpatialValid)
  {
    uint64_t v4 = self->_bleAdvertiser;
    if (!v4)
    {
      BOOL v2 = 0;
      goto LABEL_126;
    }

    id v5 = -[CBStackAddressMonitor nonConnectableAddressData]( self->_addressMonitor,  "nonConnectableAddressData");
    id v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = [self->_addressMonitor fakeNonConnectableAddressData];
    }
    id v8 = v7;

    if (-[CBDaemonServer supportsNCSecondaryAdvertisingInstance](self, "supportsNCSecondaryAdvertisingInstance"))
    {
      uint64_t v9 = [self->_addressMonitor nonConnectableSecondaryAddressData];

      id v8 = (void *)v9;
    }

    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    uint64_t v10 = self->_xpcConnections;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v95,  v102,  16LL);
    uint64_t v84 = self;
    v85 = v8;
    uint64_t v88 = v10;
    if (v11)
    {
      id v12 = v11;
      BOOL v83 = v4;
      BOOL v89 = 0LL;
      uint64_t v90 = 0LL;
      uint64_t v91 = 0LL;
      BOOL v92 = 0LL;
      BOOL v86 = 0LL;
      v87 = 0LL;
      uint64_t v13 = *(void *)v96;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v96 != v13) {
            objc_enumerationMutation(v10);
          }
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v95 + 1) + 8 * (void)i) activatedSpatialInteractionSession]);
          __int128 v16 = v15;
          if (v15)
          {
            unsigned int v17 = [v15 controlFlags];
            if ((v17 & 8) == 0)
            {
              unsigned int v18 = v17;
              if ([v8 length] == (id)6)
              {
                __int128 v19 = (void *)[v16 identifierData];
                if ([v19 length] == (id)3)
                {
                  __int128 v20 = (void *)[v16 irkData];
                  if ([v20 length] == (id)16)
                  {
                    int v21 = [v16 advertiseRate];
                    else {
                      int v22 = v21;
                    }
                    LODWORD(v91) = v22;
                    if ((v18 & 0x400) == 0)
                    {
                      char v101 = 0;
                      uint64_t v100 = 0LL;
                      id v23 = [v8 bytes];
                      __int16 v24 = v23[2];
                      LODWORD(v100) = *(_DWORD *)v23;
                      WORD2(v100) = v24;
                      id v25 = v19;
                      __int128 v26 = [v25 bytes];
                      char v27 = v26[2];
                      HIWORD(v100) = *(_WORD *)v26;
                      char v101 = v27;
                      unint64_t v99 = bswap64(SipHash([v20 bytes], &v100, 9));
                      unsigned __int8 v28 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  &v99,  3LL);
                      uint64_t v29 = v89;
                      if (!v89) {
                        uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                      }
                      BOOL v89 = v29;
                      -[NSMutableArray addObject:](v29, "addObject:", v25);
                      v30 = v92;
                      if (!v92) {
                        v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                      }
                      BOOL v92 = v30;
                      -[NSMutableArray addObject:](v30, "addObject:", v28);
                    }

                    uint64_t v31 = (void *)[v16 uwbConfigData];
                    id v32 = [v31 length];
                    if ((v18 & 2) != 0 && v32)
                    {
                      id v33 = v31;

                      BOOL v86 = v33;
                    }

                    uint64_t v34 = (void *)[v16 presenceConfigData];
                    id v35 = [v34 length];
                    if ((v18 & 0x4000) != 0 && v35)
                    {
                      id v36 = v34;

                      v87 = v36;
                      id v8 = v85;
                    }

                    LOBYTE(v90) = ((v18 & 0x3E0) != 0) | v90;
                    int v37 = HIDWORD(v90) | 0x20;
                    if ((v18 & 0x4000) == 0) {
                      int v37 = HIDWORD(v90);
                    }
                    int v38 = (v18 >> 7) & 0x10 | v37;
                    if ((v18 & 2) != 0) {
                      v38 |= 8u;
                    }
                    HIDWORD(v90) = v38;
                    HIDWORD(v91) |= [v16 enableEPAForLEAdvertisement];
                    id v39 = -[NSMutableArray count](v92, "count");

                    if ((unint64_t)v39 > 2)
                    {

                      goto LABEL_48;
                    }

                    uint64_t v10 = v88;
                  }
                }
              }
            }
          }
        }

        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v95,  v102,  16LL);
        if (v12) {
          continue;
        }
        break;
      }

LABEL_48:
      uint64_t v4 = v83;
      BOOL v43 = v86;
      BOOL v42 = v87;
      int v41 = HIDWORD(v90);
      uint64_t v40 = v91;
      if ((v90 & 1) == 0 || !v84->_identitySelf || [v8 length] != (id)6)
      {
LABEL_61:
        unsigned int v46 = -[NSMutableArray count](v92, "count") & 3 | v41;
        if (v43) {
          LOBYTE(v46) = v46 | 0x40;
        }
        if (v42) {
          unsigned __int8 v47 = v46 | 0x80;
        }
        else {
          unsigned __int8 v47 = v46;
        }
        unsigned int v48 = -[CBAdvertiserDaemon spatialInteractionAdvertiseRate](v4, "spatialInteractionAdvertiseRate");
        BOOL v2 = (_DWORD)v40 != v48;
        if ((_DWORD)v40 != v48) {
          -[CBAdvertiserDaemon setSpatialInteractionAdvertiseRate:](v4, "setSpatialInteractionAdvertiseRate:", v40);
        }
        uint64_t v49 = v47;
        if (v47 != -[CBAdvertiserDaemon spatialInteractionFlags](v4, "spatialInteractionFlags"))
        {
          -[CBAdvertiserDaemon setSpatialInteractionFlags:](v4, "setSpatialInteractionFlags:", v47);
          BOOL v2 = 1;
        }

        if (-[CBAdvertiserDaemon spatialInteractionConfigFlags](v4, "spatialInteractionConfigFlags") != (v42 != 0LL))
        {
          -[CBAdvertiserDaemon setSpatialInteractionConfigFlags:](v4, "setSpatialInteractionConfigFlags:", v42 != 0LL);
          BOOL v2 = 1;
        }

        BOOL v50 = [v4 spatialInteractionIdentifiers];
        v51 = v92;
        v52 = v50;
        uint64_t v53 = v52;
        if (v51 == v52)
        {

          goto LABEL_79;
        }

        if ((v51 == 0LL) != (v52 != 0LL))
        {
          unsigned __int8 v54 = -[NSMutableArray isEqual:](v51, "isEqual:", v52);

          if ((v54 & 1) != 0)
          {
LABEL_79:
            v55 = -[CBAdvertiserDaemon spatialInteractionUWBConfigData];
            id v56 = v43;
            id v57 = v55;
            BOOL v93 = v53;
            if (v56 == v57)
            {

              goto LABEL_86;
            }

            v58 = v57;
            if ((v43 == 0LL) != (v57 != 0LL))
            {
              unsigned __int8 v59 = [v56 isEqual:v57];

              if ((v59 & 1) != 0)
              {
LABEL_86:
                v60 = [v4 spatialInteractionPresenceConfigData];
                id v61 = v42;
                id v62 = v60;
                if (v61 == v62)
                {

                  goto LABEL_93;
                }

                v63 = v62;
                if ((v42 == 0LL) != (v62 != 0LL))
                {
                  unsigned __int8 v64 = [v61 isEqual:v62];

                  if ((v64 & 1) != 0)
                  {
LABEL_93:
                    if ((BYTE4(v91) & 1) != -[CBAdvertiserDaemon advertiserEnableEPA](v4, "advertiserEnableEPA"))
                    {
                      -[CBAdvertiserDaemon setAdvertiserEnableEPA:](v4, "setAdvertiserEnableEPA:");
                      BOOL v2 = 1;
                    }

                    BOOL v65 = v93;
                    if (-[NSMutableArray count](v51, "count"))
                    {
                      if (dword_1008D5FD8 <= 30
                        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
                      {
                        uint64_t v66 = CUPrintNSDataAddress(v85);
                        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
                        uint64_t v68 = CUPrintFlags32(v49, &unk_1006BA469);
                        BOOL v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
                        uint64_t v70 = CUPrintNSObjectOneLine(v89);
                        v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
                        uint64_t v72 = CUPrintNSObjectOneLine(v51);
                        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
                        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _bleAdvertiserUpdateSpatialInteraction]",  30LL,  "BLE advertiser: spatial update: Addr %@, Flags %@, IDs %@, Hashes %@",  v67,  v69,  v71,  v73);

                        BOOL v65 = v93;
                      }

                      bleAdvertiserSpatialLingerTimer = v84->_bleAdvertiserSpatialLingerTimer;
                      if (bleAdvertiserSpatialLingerTimer)
                      {
                        if (dword_1008D5FD8 >= 31)
                        {
                          v76 = bleAdvertiserSpatialLingerTimer;
                          id v8 = v85;
                        }

                        else
                        {
                          if (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)) {
                            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _bleAdvertiserUpdateSpatialInteraction]",  30LL,  "BLE advertiser: spatial linger cancel");
                          }
                          v76 = v84->_bleAdvertiserSpatialLingerTimer;
                          id v8 = v85;
                          if (!v76) {
                            goto LABEL_125;
                          }
                        }

                        dispatch_source_cancel(v76);
                        uint64_t v77 = v84->_bleAdvertiserSpatialLingerTimer;
                        v84->_bleAdvertiserSpatialLingerTimer = 0LL;
                      }

                      else
                      {
                        id v8 = v85;
                      }

- (BOOL)_bleAdvertiserUpdateWithAuthTagNC
{
  BOOL v2 = self;
  uint64_t v3 = self->_bleAdvertiser;
  if (!v3)
  {
    BOOL v6 = 0;
    goto LABEL_99;
  }

  unsigned __int8 v93 = 0;
  uint64_t v4 = (void *)[v2->_addressMonitor nonConnectableAddressData];
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  id obj = [CBAdvertiserDaemon advertiserArray];
  id v5 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
  BOOL v6 = v5 != 0LL;
  if (!v5)
  {
    uint64_t v74 = 0LL;
    v75 = 0LL;
    uint64_t v72 = 0LL;
    goto LABEL_96;
  }

  id v7 = v5;
  BOOL v66 = v5 != 0LL;
  uint64_t v67 = v3;
  int v8 = 0;
  uint64_t v72 = 0LL;
  uint64_t v74 = 0LL;
  unsigned int v78 = 0;
  unsigned int v9 = 0;
  v75 = 0LL;
  v76 = v2;
  char v68 = 0;
  uint64_t v10 = *(void *)v90;
  v71 = v4;
  do
  {
    id v11 = 0LL;
    do
    {
      if (*(void *)v90 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)v11);
      uint64_t v13 = objc_autoreleasePoolPush();
      unsigned __int8 v14 = [v12 nearbyInfoV2DecryptedFlags];
      v93 |= v14;
      v8 |= [v12 nearbyInfoV2Flags] & 4;
      unsigned int v15 = [v12 airplaySourceFlags];
      if (v8) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = v15 == 0;
      }
      if (v16 && v93 == 0) {
        goto LABEL_46;
      }
      if (!v2->_identitySelf) {
        goto LABEL_44;
      }
      char v18 = v15;
      if ([v4 length] != (id)6) {
        goto LABEL_44;
      }
      if (v8) {
        BOOL v19 = 0;
      }
      else {
        BOOL v19 = v93 == 0;
      }
      unsigned int v77 = v9;
      if (!v19)
      {
        __int128 v20 = (void *)[v12 nearbyInfoV2AuthTagData];

        BOOL v69 = [v12 nearbyInfoV2RapportIRKData];
        int v21 = (void *)objc_claimAutoreleasedReturnValue( -[RPIdentity authTagForData:type:error:]( v2->_identitySelf,  "authTagForData:type:error:",  v4,  2LL,  0LL));
        int v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](v2->_identitySelf, "deviceIRKData"));
        id v23 = v20;
        id v24 = v21;
        id v25 = v23;
        __int128 v26 = v24;
        uint64_t v74 = v25;
        if (v25 == v24)
        {

          goto LABEL_27;
        }

        if ((v25 == 0LL) != (v24 != 0LL))
        {
          unsigned __int8 v73 = [v25 isEqual:v24];

          if ((v73 & 1) != 0)
          {
LABEL_27:
            id v27 = v69;
            id v28 = v22;
            uint64_t v29 = v28;
            uint64_t v72 = v27;
            if (v27 == v28)
            {
            }

            else
            {
              if ((v27 == 0LL) != (v28 != 0LL))
              {
                unsigned __int8 v70 = [v27 isEqual:v28];

                if ((v70 & 1) != 0) {
                  goto LABEL_34;
                }
              }

              else
              {
              }

              [v12 setNearbyInfoV2RapportIRKData:v29];
              char v68 = 1;
            }

- (void)clearDuplicateFilterCache:(id)a3
{
  stackBLEScanner = self->_stackBLEScanner;
  if (stackBLEScanner) {
    -[CBStackBLEScanner clearDuplicateFilterCache:](stackBLEScanner, "clearDuplicateFilterCache:", a3);
  }
}

- (id)getAudioAccessoryDeviceArray
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[CBStackAccessoryMonitor getAudioAccessoryDeviceArray]( v2->_stackAccessoryMonitor,  "getAudioAccessoryDeviceArray"));
  objc_sync_exit(v2);

  return v3;
}

- (void)_stackAccessoryMonitorEnsureStarted
{
  uint64_t v3 = self->_stackAccessoryMonitor;
  if (!v3)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackAccessoryMonitorEnsureStarted]",  30LL,  "Stack accessory monitor start");
    }

    id v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor accessoryMonitorClass](self->_stackAdaptor, "accessoryMonitorClass")));
    objc_storeStrong((id *)&self->_stackAccessoryMonitor, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100014008;
    v12[3] = &unk_10087F220;
    id v5 = v4;
    id v13 = v5;
    unsigned __int8 v14 = self;
    [v5 setAudioAccessoryEventHandler:v12];
    BOOL v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    int v8 = sub_100014164;
    unsigned int v9 = &unk_10087F248;
    uint64_t v3 = (CBStackAccessoryMonitor *)v5;
    uint64_t v10 = v3;
    id v11 = self;
    -[CBStackAccessoryMonitor setAudioAccessoryInfoChangedHandler:](v3, "setAudioAccessoryInfoChangedHandler:", &v6);

    -[CBStackAccessoryMonitor activate](v3, "activate", v6, v7, v8, v9);
  }
}

- (void)_stackAccessoryMonitorEnsureStopped
{
  if (self->_stackAccessoryMonitor)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackAccessoryMonitorEnsureStopped]",  30LL,  "Stack accessory monitor stop");
    }

    -[CBStackAccessoryMonitor invalidate](self->_stackAccessoryMonitor, "invalidate");
    stackAccessoryMonitor = self->_stackAccessoryMonitor;
    self->_stackAccessoryMonitor = 0LL;
  }

- (BOOL)_stackAccessoryMonitorShouldRun
{
  unsigned int v3 = -[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore");
  if (v3) {
    LOBYTE(v3) = -[CBStackController poweredOn](self->_stackController, "poweredOn");
  }
  return v3;
}

- (void)_stackBLEScannerEnsureStarted
{
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  unsigned __int8 v37 = self;
  id obj = self->_xpcConnections;
  id v2 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v55,  v60,  16LL);
  if (v2)
  {
    id v3 = v2;
    id v4 = 0LL;
    uint64_t v5 = *(void *)v56;
    uint64_t v39 = *(void *)v56;
    do
    {
      BOOL v6 = 0LL;
      id v40 = v3;
      do
      {
        if (*(void *)v56 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v6);
        int v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activatedDiscovery", v37));
        unsigned int v9 = v8;
        if (v8)
        {
          id v10 = [v8 disabledPending];
          if ((_DWORD)v10 != [v9 disabledActive])
          {
            if (!v4) {
              id v4 = [v37->_deviceMap allValues];
            }
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            id v4 = v4;
            id v11 = [v4 countByEnumeratingWithState:&v51 objects:v59 count:16];
            if (v11)
            {
              id v12 = v11;
              uint64_t v13 = *(void *)v52;
              do
              {
                for (i = 0LL; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v52 != v13) {
                    objc_enumerationMutation(v4);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
                  BOOL v16 = objc_autoreleasePoolPush();
                  if ((_DWORD)v10) {
                    [v7 reportDeviceLost:v15];
                  }
                  else {
                    [v7 reportDeviceFound:v15];
                  }
                  objc_autoreleasePoolPop(v16);
                }

                id v12 = [v4 countByEnumeratingWithState:&v51 objects:v59 count:16];
              }

              while (v12);
            }

            [v9 setDisabledActive:v10];
            uint64_t v5 = v39;
            id v3 = v40;
          }
        }

        BOOL v6 = (char *)v6 + 1;
      }

      while (v6 != v3);
      id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v55,  v60,  16LL);
    }

    while (v3);
  }

  else
  {
    id v4 = 0LL;
  }

  unsigned int v17 = v37;
  char v18 = v37->_stackBLEScanner;
  if (!v18)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackBLEScannerEnsureStarted]",  30LL,  "Stack BLE scanner start",  v37);
    }

    id v19 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor bleScannerClass](v17->_stackAdaptor, "bleScannerClass", v37)));
    objc_storeStrong((id *)&v17->_stackBLEScanner, v19);
    [v19 setDispatchQueue:v17->_dispatchQueue];
    [v19 setIdentifier:@"CBDaemon"];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10001489C;
    v48[3] = &unk_10087EF10;
    id v20 = v19;
    id v49 = v20;
    BOOL v50 = v37;
    [v20 setDeviceFoundHandler:v48];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000148B8;
    v45[3] = &unk_10087EF10;
    unsigned int v17 = v37;
    id v21 = v20;
    id v46 = v21;
    uint64_t v47 = v37;
    [v21 setDeviceLostHandler:v45];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000148D4;
    v42[3] = &unk_10087F270;
    char v18 = (CBStackBLEScanner *)v21;
    BOOL v43 = v18;
    char v44 = v37;
    -[CBStackBLEScanner setDevicesBufferedHandler:](v18, "setDevicesBufferedHandler:", v42);
  }

  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScanner discoveryArray](v18, "discoveryArray", v37));
  if (v22)
  {

LABEL_33:
    int v23 = 0;
    goto LABEL_36;
  }

  if (!-[NSMutableArray count](v17->_bleDiscoveryArray, "count")) {
    goto LABEL_33;
  }
  -[CBStackBLEScanner setDiscoveryArray:](v18, "setDiscoveryArray:", v17->_bleDiscoveryArray);
  int v23 = 1;
LABEL_36:
  id v24 = -[CUSystemMonitor screenOn](v17->_systemMonitor, "screenOn");
  if ((_DWORD)v24 != -[CBStackBLEScanner screenOn](v18, "screenOn"))
  {
    -[CBStackBLEScanner setScreenOn:](v18, "setScreenOn:", v24);
    int v23 = 1;
  }

  id v25 = v17->_selfAuthTag;
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScanner selfAuthTag](v18, "selfAuthTag"));
  id v27 = v25;
  id v28 = v26;
  if (v27 == v28)
  {

    goto LABEL_45;
  }

  uint64_t v29 = v28;
  if ((v27 == 0LL) == (v28 != 0LL))
  {

    goto LABEL_44;
  }

  unsigned __int8 v30 = -[NSData isEqual:](v27, "isEqual:", v28);

  if ((v30 & 1) == 0)
  {
LABEL_44:
    -[CBStackBLEScanner setSelfAuthTag:](v18, "setSelfAuthTag:", v27);
    int v23 = 1;
  }

- (void)_reportDeviceLostIfNeeded:(unint64_t)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = (void *)[self->_deviceMap allValues];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        stackController = self->_stackController;
        id v15 = 0LL;
        unsigned __int8 v12 = -[CBStackController isDeviceConnected:error:]( stackController,  "isDeviceConnected:error:",  v10,  &v15);
        id v13 = v15;
        if ((v12 & 1) == 0 && (unint64_t)[v10 lastSeenTicks] < a3)
        {
          if (dword_1008D5FD8 <= 20
            && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
          {
            uint64_t v14 = UpTicksToSeconds(a3 - (void)[v10 lastSeenTicks]);
            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _reportDeviceLostIfNeeded:]",  20LL,  "Device :%@ is lost. It was discovered :%llu seconds before scan stopped",  v10,  v14);
          }

          -[CBDaemonServer _stackBLEScannerDeviceLost:](self, "_stackBLEScannerDeviceLost:", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }
}

- (void)_stackBLEScannerEnsureStopped
{
  if (self->_stackBLEScanner)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackBLEScannerEnsureStopped]",  30LL,  "Stack BLE scanner stop");
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v3 = self->_xpcConnections;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v27 + 1) + 8 * (void)i) activatedDiscovery]);
          unsigned int v9 = v8;
          if (v8)
          {
            [v8 setDisabledActive:0];
            [v9 setDisabledPending:0];
          }
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
      }

      while (v5);
    }

    bleDiscoveryArray = self->_bleDiscoveryArray;
    self->_bleDiscoveryArray = 0LL;

    -[CBStackBLEScanner invalidate](self->_stackBLEScanner, "invalidate");
    stackBLEScanner = self->_stackBLEScanner;
    self->_stackBLEScanner = 0LL;

    if ((self->_assertionFlags & 1) != 0)
    {
      uint64_t v19 = mach_absolute_time();
      if (dword_1008D5FD8 <= 20
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
      {
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackBLEScannerEnsureStopped]",  20LL,  "Scan stopped due to suppression. Delayed lost notification");
      }

      dispatch_time_t v20 = dispatch_time(0LL, 10000000000LL);
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100014D88;
      block[3] = &unk_10087F298;
      block[4] = self;
      void block[5] = v19;
      dispatch_after(v20, dispatchQueue, block);
    }

    else
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deviceMap, "allValues", 0LL));
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (j = 0LL; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)j);
            __int128 v18 = objc_autoreleasePoolPush();
            -[CBDaemonServer _stackBLEScannerDeviceLost:](self, "_stackBLEScannerDeviceLost:", v17);
            objc_autoreleasePoolPop(v18);
          }

          id v14 = [v12 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }

        while (v14);
      }
    }
  }

- (BOOL)_stackBLEScannerShouldRun
{
  if (!self->_prefBLEScanning
    || (self->_assertionFlags & 1) != 0
    || !-[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore")
    || !-[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    return 0;
  }

  id v3 = self->_bleDiscoveryArray;
  if (v3)
  {
    id v4 = v3;
    goto LABEL_78;
  }

  uint64_t DeviceClass = GestaltGetDeviceClass(0LL);
  BOOL v8 = (_DWORD)DeviceClass == 7 || GestaltGetDeviceClass(DeviceClass) == 13;
  BOOL v31 = v8;
  unsigned int v32 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn", &self->_bleDiscoveryArray);
  *(_WORD *)&self->_stackBLEScannerNeedsAdvertisingAddress = 0;
  self->_unint64_t stackBLEProxControlFlags = 0LL;
  *(_WORD *)&self->_stackBLEProxControlNeedsDeviceClose = 0;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  unsigned int v9 = self->_xpcConnections;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
  if (!v10)
  {
    id v4 = 0LL;
    goto LABEL_77;
  }

  id v11 = v10;
  id v4 = 0LL;
  uint64_t v12 = *(void *)v34;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v34 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
      uint64_t v15 = (void *)[v14 activatedDiscovery];
      __int128 v16 = v15;
      if (v15)
      {
        unint64_t v17 = (unint64_t)[v15 discoveryFlags];
        unsigned int v18 = [v16 needsBLEScan];
        if (!v18) {
          goto LABEL_31;
        }
        if (!self->_prefDiscoveryProxy && [v14 xpcToken]
          || ([v16 internalFlags] & 0x10) != 0
          || (v32 | (v17 >> 25) & 1) != 1
          || [v16 denyLowPowerModeScans] && self->_lowPowerModeEnabled
          || [v16 denyScreenLockedScans]
          && (self->_screenLocked
           || !-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked"))
          || (v17 & 0x200000000000LL) != 0 && !-[CBDaemonServer _supportsProxControl](self, "_supportsProxControl"))
        {
          BOOL v19 = 1LL;
          goto LABEL_34;
        }

        else {
LABEL_31:
        }
          BOOL v19 = 0LL;
LABEL_34:
        uint64_t v20 = v17 & 0x200000000000LL;
        self->_stackBLEProxControlAnyDeviceClose = (v20 | self->_stackBLEProxControlAnyDeviceClose) != 0;
        [v16 setDisabledPending:v19];
        if (!v19 && ((v18 ^ 1) & 1) == 0)
        {
          if (v20)
          {
            self->_stackBLENeedsIdentify = 1;
            if (v31)
            {
              self->_unint64_t stackBLEProxControlFlags = 64LL;
              unint64_t stackBLEProxControlFlags = 64LL;
            }

            else
            {
              self->_unint64_t stackBLEProxControlFlags = 0x80000LL;
              self->_stackBLEProxControlNeedsDeviceClose = 1;
              [v16 setUseCase:786432];
              unint64_t stackBLEProxControlFlags = self->_stackBLEProxControlFlags;
            }
          }

          else
          {
            unint64_t stackBLEProxControlFlags = 0LL;
          }

          [v16 setExtraDiscoveryFlags:stackBLEProxControlFlags];
          unsigned int v22 = [v16 bleScanRateOverride];
          if (self->_wifiCritical && v23 >= 31)
          {
            else {
              uint64_t v24 = 30LL;
            }
            int v25 = 1;
          }

          else
          {
            BOOL v26 = v23 > 30;
            BOOL odeonActive = self->_odeonActive;
            if (odeonActive && v26) {
              int v25 = 2;
            }
            else {
              int v25 = 0;
            }
            if (odeonActive && v26) {
              uint64_t v24 = 30LL;
            }
            else {
              uint64_t v24 = v22;
            }
            if (!self->_odeonActive && !self->_wifiCritical)
            {
              int v25 = 0;
              else {
                uint64_t v24 = v22;
              }
            }
          }

          if ((_DWORD)v24 != v22)
          {
            [v16 setBleScanRateOverride:v24];
            [v16 setSystemOverrideFlags:((unint64_t)[v16 systemOverrideFlags]) & 0xFFFFFFFC];
            if ((_DWORD)v24) {
              [v16 setSystemOverrideFlags:[v16 systemOverrideFlags] | v25];
            }
            uint64_t v28 = [v16 systemOverrideHandler];
            __int128 v29 = (void *)v28;
            if (v28) {
              (*(void (**)(uint64_t))(v28 + 16))(v28);
            }
          }

          if (!v4) {
            id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v4, "addObject:", v16);
        }
      }
    }

    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
  }

  while (v11);
LABEL_77:

  objc_storeStrong(location, v4);
  -[CBStackBLEScanner setDiscoveryArray:](self->_stackBLEScanner, "setDiscoveryArray:", 0LL);
LABEL_78:
  BOOL v5 = -[NSMutableArray count](v4, "count") != 0LL;

  return v5;
}

- (void)_stackBLEScannerDeviceFound:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  if (v5)
  {
    uint64_t v6 = (CBDevice *)[self->_deviceMap objectForKeyedSubscript:v5];
    if (!v6)
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unsigned int v9 = self->_deviceMap;
        self->_deviceMap = v8;

        deviceMap = self->_deviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v6, v5);
    }

    -[CBDevice setInternalFlags:]( v6,  "setInternalFlags:",  -[CBDevice internalFlags](v6, "internalFlags") | 2);
    -[CBDevice updateWithCBDevice:](v6, "updateWithCBDevice:", v4);
    -[CBDevice updateWithReceivedAuthTag:forType:](v6, "updateWithReceivedAuthTag:forType:", self->_selfAuthTag, 21LL);
    if (-[CBDevice changedTypesNeedsIdentify](v6, "changedTypesNeedsIdentify")
      && self->_stackBLENeedsIdentify)
    {
      -[CBDaemonServer _identitiesResolveNearbyDevice:](self, "_identitiesResolveNearbyDevice:", v6);
    }

    -[CBDaemonServer _stackBLEScannerUpdateProxControlIfNeeded:](self, "_stackBLEScannerUpdateProxControlIfNeeded:", v6);
    if ((-[CBDevice attributeInternalFlags](v6, "attributeInternalFlags") & 1) != 0)
    {
      stackController = self->_stackController;
      uint64_t v11 = 0LL;
      -[CBStackController modifyDevice:error:](stackController, "modifyDevice:error:", v4, &v11);
    }

    -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v6);
  }
}

- (void)_stackBLEScannerDeviceLost:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    unsigned int v9 = v4;
    BOOL v5 = [self->_deviceMap objectForKeyedSubscript:v4];
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_identifyDevices,  "setObject:forKeyedSubscript:",  0LL,  v9);
      if (([v5 removeInternalFlags:2] & 0x8000000) != 0)
      {
        id v6 = -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceMap,  "setObject:forKeyedSubscript:",  0LL,  v9);
        if (IsAppleInternalBuild(v6, v7))
        {
          BOOL v8 = [v5 spatialInteractionDeviceTimestampArrayDictionary];

          if (v8) {
            -[CBDaemonServer addLostDeviceToLostCBSpatialDevicesIfNeeded:]( self,  "addLostDeviceToLostCBSpatialDevicesIfNeeded:",  v5);
          }
        }

        -[CBDaemonServer _reportDeviceLost:](self, "_reportDeviceLost:", v5);
      }

      else
      {
        -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v5);
      }
    }

    id v4 = v9;
  }
}

- (void)_stackBLEScannerDevicesBuffered:(id)a3
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = a3;
  id v26 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v26)
  {
    __int128 v27 = 0LL;
    uint64_t v25 = *(void *)v31;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        BOOL v5 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v4);
        id v6 = objc_autoreleasePoolPush();
        uint64_t v7 = [v5 identifier];
        if (!v7)
        {
          objc_autoreleasePoolPop(v6);
          goto LABEL_33;
        }

        BOOL v8 = (void *)v7;
        unsigned int v9 = objc_alloc_init(&OBJC_CLASS___CBDevice);
        -[CBDevice setIdentifier:](v9, "setIdentifier:", v8);
        -[CBDevice setInternalFlags:](v9, "setInternalFlags:", 2048LL);
        id v10 = self->_deviceMap;
        uint64_t v11 = (void *)[v10 objectForKeyedSubscript:v8];
        if (v11) {
          -[CBDevice updateWithCBDevice:](v9, "updateWithCBDevice:", v11);
        }

        unint64_t v12 = (unint64_t)-[CBDevice updateWithCBDevice:](v9, "updateWithCBDevice:", v5);
        -[CBDevice setChangeFlags:]( v9,  "setChangeFlags:",  (unint64_t)-[CBDevice changeFlags](v9, "changeFlags") | v12);
        -[CBDevice setLastSeenTicks:](v9, "setLastSeenTicks:", mach_absolute_time());
        unint64_t v13 = (unint64_t)-[CBDevice discoveryFlags](v9, "discoveryFlags");
        id v14 = self->_stackBLEScanner;
        uint64_t v15 = v14;
        if (v14)
        {
          unint64_t v16 = (unint64_t)-[CBStackBLEScanner aggregateDiscoveryFlags](v14, "aggregateDiscoveryFlags");
          char v29 = 0;
          int v28 = 0;
          id v17 = -[CBStackBLEScanner aggregateDiscoveryTypes](v15, "aggregateDiscoveryTypes");
          int v28 = (int)v17;
          char v29 = BYTE4(v17);
        }

        else
        {
          unint64_t v16 = 0LL;
          char v29 = 0;
          int v28 = 0;
        }

        if ((v16 & (v13 | v12)) != 0
          || (-[CBDevice discoveryTypesContainTypes:](v9, "discoveryTypesContainTypes:", &v28) & 1) != 0
          || (-[CBDevice changedTypesContainTypes:](v9, "changedTypesContainTypes:", &v28) & 1) != 0)
        {
          if (-[CBDevice changedTypesNeedsIdentify](v9, "changedTypesNeedsIdentify")
            && self->_stackBLENeedsIdentify)
          {
            -[CBDaemonServer _identitiesResolveNearbyDevice:](self, "_identitiesResolveNearbyDevice:", v9);
          }

          unsigned int v18 = v27;
          if (!v27) {
            unsigned int v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          __int128 v27 = v18;
          -[NSMutableArray addObject:](v18, "addObject:", v9);
        }

        else if (dword_1008D5FD8 <= 30 {
               && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
        }
        {
          uint64_t v19 = CUPrintFlags64(v16, "");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          uint64_t v21 = CBDiscoveryTypesToString(&v28);
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackBLEScannerDevicesBuffered:]",  30LL,  "Device buffered mismatch: %@, DsFl %@, DsTy %@",  v9,  v20,  v22);
        }

        objc_autoreleasePoolPop(v6);
        id v4 = (char *)v4 + 1;
      }

      while (v26 != v4);
      id v23 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      id v26 = v23;
    }

    while (v23);

    if (!v27) {
      goto LABEL_35;
    }
    -[CBDaemonServer _reportDevicesBuffered:](self, "_reportDevicesBuffered:");
  }

  else
  {
    __int128 v27 = 0LL;
LABEL_33:
  }

LABEL_35:
}

- (void)_stackBLEScannerUpdateProxControlIfNeeded:(id)a3
{
  id v8 = a3;
  unint64_t v4 = (unint64_t)[v8 discoveryFlags];
  if ((self->_stackBLEProxControlFlags & v4) != 0
    && (!self->_stackBLEProxControlNeedsDeviceClose || ([v8 nearbyActionFlags] & 0x10) != 0))
  {
    unint64_t v5 = v4 | 0x200000000000LL;
  }

  else
  {
    unint64_t v5 = v4 & 0xFFFFDFFFFFFFFFFFLL;
  }

  id v6 = v8;
  unint64_t v7 = v5 ^ v4;
  if (v7)
  {
    [v8 setChangeFlags:v8.changeFlags | v7];
    [v8 setDiscoveryFlags:v5];
    id v6 = v8;
  }
}

- (void)_stackClassicScannerEnsureStarted
{
  id v3 = self->_stackClassicScanner;
  if (!v3)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackClassicScannerEnsureStarted]",  30LL,  "Stack classic scanner start");
    }

    id v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor classicScannerClass](self->_stackAdaptor, "classicScannerClass")));
    objc_storeStrong((id *)&self->_stackClassicScanner, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100015930;
    v12[3] = &unk_10087EF10;
    id v5 = v4;
    id v13 = v5;
    id v14 = self;
    [v5 setDeviceFoundHandler:v12];
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    id v8 = sub_10001594C;
    unsigned int v9 = &unk_10087EF10;
    id v3 = (CBStackBLEScanner *)v5;
    id v10 = v3;
    uint64_t v11 = self;
    -[CBStackBLEScanner setDeviceLostHandler:](v3, "setDeviceLostHandler:", &v6);

    -[CBStackBLEScanner activate](v3, "activate", v6, v7, v8, v9);
  }
}

- (void)_stackClassicScannerEnsureStopped
{
  if (self->_stackClassicScanner)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackClassicScannerEnsureStopped]",  30LL,  "Stack classic scanner stop");
    }

    -[CBStackBLEScanner invalidate](self->_stackClassicScanner, "invalidate");
    stackClassicScanner = self->_stackClassicScanner;
    self->_stackClassicScanner = 0LL;

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v4 = [self->_deviceMap allValues];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          id v10 = objc_autoreleasePoolPush();
          -[CBDaemonServer _stackClassicScannerDeviceLost:](self, "_stackClassicScannerDeviceLost:", v9);
          objc_autoreleasePoolPop(v10);
        }

        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }
  }

- (BOOL)_stackClassicScannerShouldRun
{
  if (-[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore")
    && -[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v3 = self->_xpcConnections;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v4)
    {
      uint64_t v5 = *(void *)v11;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)i),  "activatedDiscovery",  (void)v10));
          unint64_t v8 = (unint64_t)[v7 discoveryFlags];

          if ((v8 & 0x4000000000000LL) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }

        id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        if (v4) {
          continue;
        }
        break;
      }
    }

- (void)_stackClassicScannerDeviceFound:(id)a3
{
  id v9 = a3;
  id v4 = [v9 identifier];
  if (v4)
  {
    uint64_t v5 = (CBDevice *)[self->_deviceMap objectForKeyedSubscript:v4];
    if (!v5)
    {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unint64_t v8 = self->_deviceMap;
        self->_deviceMap = v7;

        deviceMap = self->_deviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v4);
    }

    -[CBDevice setInternalFlags:]( v5,  "setInternalFlags:",  -[CBDevice internalFlags](v5, "internalFlags") | 0x80);
    -[CBDevice updateWithCBDevice:](v5, "updateWithCBDevice:", v9);
    -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v5);
  }
}

- (void)_stackClassicScannerDeviceLost:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v5 = (void *)[self->_deviceMap objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      if (([v5 removeInternalFlags:128] & 0x8000000) != 0)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v7);
        -[CBDaemonServer _reportDeviceLost:](self, "_reportDeviceLost:", v6);
      }

      else
      {
        -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v6);
      }
    }

    id v4 = v7;
  }
}

- (void)_stackControllerEnsureStarted
{
  if (!self->_stackController)
  {
    p_stackController = &self->_stackController;
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackControllerEnsureStarted]",  30LL,  "Stack controller start");
    }

    id v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor controllerClass](self->_stackAdaptor, "controllerClass")));
    objc_storeStrong((id *)p_stackController, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100015F64;
    v25[3] = &unk_10087EFC8;
    id v5 = v4;
    id v26 = v5;
    __int128 v27 = self;
    [v5 setControllerDataChangedHandler:v25];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100015F7C;
    v22[3] = &unk_10087EFC8;
    id v6 = v5;
    id v23 = v6;
    uint64_t v24 = self;
    [v6 setDiscoverableStateChangedHandler:v22];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000160B8;
    v19[3] = &unk_10087EFC8;
    id v7 = v6;
    id v20 = v7;
    uint64_t v21 = self;
    [v7 setInquiryStateChangedHandler:v19];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000161F4;
    v16[3] = &unk_10087EFC8;
    id v8 = v7;
    id v17 = v8;
    unsigned int v18 = self;
    [v8 setPowerChangedHandler:v16];
    __int128 v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    __int128 v12 = sub_1000163A4;
    __int128 v13 = &unk_10087F2C0;
    id v14 = v8;
    uint64_t v15 = self;
    id v9 = v8;
    [v9 setRelayMessageHandler:&v10];
    objc_msgSend(v9, "activate", v10, v11, v12, v13);
  }

- (void)_stackControllerEnsureStopped
{
  if (self->_stackController)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _stackControllerEnsureStopped]", 30LL, "Stack controller stop");
    }

    -[CBStackController invalidate](self->_stackController, "invalidate");
    stackController = self->_stackController;
    self->_stackController = 0LL;
  }

- (void)_stackDeviceMonitorEnsureStarted
{
  id v3 = self->_stackDeviceMonitor;
  if (!v3)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackDeviceMonitorEnsureStarted]",  30LL,  "Stack device monitor start");
    }

    id v4 = objc_alloc_init((Class)objc_opt_class(-[CBStackAdaptor deviceMonitorClass](self->_stackAdaptor, "deviceMonitorClass")));
    objc_storeStrong((id *)&self->_stackDeviceMonitor, v4);
    [v4 setDispatchQueue:self->_dispatchQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001671C;
    v13[3] = &unk_10087EF10;
    id v5 = v4;
    id v14 = v5;
    uint64_t v15 = self;
    [v5 setDeviceFoundHandler:v13];
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    id v9 = sub_100016738;
    __int128 v10 = &unk_10087EF10;
    id v3 = (CBStackDeviceMonitor *)v5;
    uint64_t v11 = v3;
    __int128 v12 = self;
    -[CBStackDeviceMonitor setDeviceLostHandler:](v3, "setDeviceLostHandler:", &v7);
  }

  id deviceMonitorFlags = (id)self->_deviceMonitorFlags;
  if (deviceMonitorFlags != -[CBStackDeviceMonitor discoveryFlags](v3, "discoveryFlags", v7, v8, v9, v10))
  {
    -[CBStackDeviceMonitor setDiscoveryFlags:](v3, "setDiscoveryFlags:", self->_deviceMonitorFlags);
    -[CBStackDeviceMonitor activate](v3, "activate");
  }
}

- (void)_stackDeviceMonitorEnsureStopped
{
  if (self->_stackDeviceMonitor)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _stackDeviceMonitorEnsureStopped]",  30LL,  "Stack device monitor stop");
    }

    self->_deviceMonitorFlagsValid = 0;
    -[CBStackDeviceMonitor invalidate](self->_stackDeviceMonitor, "invalidate");
    stackDeviceMonitor = self->_stackDeviceMonitor;
    self->_stackDeviceMonitor = 0LL;

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v4 = -[self->_deviceMap allValues];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          __int128 v10 = objc_autoreleasePoolPush();
          -[CBDaemonServer _stackDeviceMonitorDeviceLost:](self, "_stackDeviceMonitorDeviceLost:", v9);
          objc_autoreleasePoolPop(v10);
        }

        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }
  }

- (BOOL)_stackDeviceMonitorShouldRun
{
  unsigned int v3 = -[CBDaemonServer _firstUnlockedOrAllowedBefore](self, "_firstUnlockedOrAllowedBefore");
  if (v3)
  {
    unsigned int v3 = -[CBStackController poweredOn](self->_stackController, "poweredOn");
    if (v3)
    {
      if (self->_deviceMonitorFlagsValid)
      {
        BOOL v4 = self->_deviceMonitorFlags == 0;
      }

      else
      {
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        id v5 = self->_xpcConnections;
        id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v6)
        {
          id v7 = v6;
          unint64_t v8 = 0LL;
          uint64_t v9 = *(void *)v16;
          do
          {
            for (i = 0LL; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v16 != v9) {
                objc_enumerationMutation(v5);
              }
              __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)i),  "activatedDiscovery",  (void)v15));
              unint64_t v12 = (unint64_t)[v11 discoveryFlags];

              if ((v12 & 0xA00000) != 0) {
                unint64_t v13 = v12;
              }
              else {
                unint64_t v13 = 0LL;
              }
              v8 |= v13;
            }

            id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
          }

          while (v7);
        }

        else
        {
          unint64_t v8 = 0LL;
        }

        self->_id deviceMonitorFlags = v8;
        self->_deviceMonitorFlagsValid = 1;
        BOOL v4 = v8 == 0;
      }

      LOBYTE(v3) = !v4;
    }
  }

  return v3;
}

- (void)_stackDeviceMonitorDeviceFound:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 identifier];
  if (v4)
  {
    id v5 = [self->_deviceMap objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unint64_t v8 = self->_deviceMap;
        self->_deviceMap = v7;

        deviceMap = self->_deviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v4);
    }

    -[CBDevice setInternalFlags:]( v5,  "setInternalFlags:",  -[CBDevice internalFlags](v5, "internalFlags") | 4);
    -[CBDevice updateWithCBDevice:](v5, "updateWithCBDevice:", v9);
    -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v5);
  }
}

- (void)_stackDeviceMonitorDeviceLost:(id)a3
{
  BOOL v4 = [a3 identifier];
  if (v4)
  {
    id v7 = v4;
    id v5 = [self->_deviceMap objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      if (([v5 removeInternalFlags:4] & 0x8000000) != 0)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v7);
        -[CBDaemonServer _reportDeviceLost:](self, "_reportDeviceLost:", v6);
      }

      else
      {
        -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v6);
      }
    }

    BOOL v4 = v7;
  }
}

- (void)_accessoryDaemonEnsureStarted
{
  if (!self->_accessoryDaemon)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _accessoryDaemonEnsureStarted]", 30LL, "AccessoryDaemon start");
    }

    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___CBAccessoryDaemon);
    accessoryDaemon = self->_accessoryDaemon;
    self->_accessoryDaemon = v3;

    -[CBAccessoryDaemon setDispatchQueue:](self->_accessoryDaemon, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAccessoryDaemon setDaemonServer:](self->_accessoryDaemon, "setDaemonServer:", self);
    -[CBAccessoryDaemon activate](self->_accessoryDaemon, "activate");
  }

- (void)_accessoryDaemonEnsureStopped
{
  if (self->_accessoryDaemon)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _accessoryDaemonEnsureStopped]", 30LL, "AccessoryDaemon stop");
    }

    -[CBAccessoryDaemon invalidate](self->_accessoryDaemon, "invalidate");
    accessoryDaemon = self->_accessoryDaemon;
    self->_accessoryDaemon = 0LL;
  }

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  id v10 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016D90;
  block[3] = &unk_10087F310;
  block[4] = self;
  id v14 = v10;
  BOOL v16 = a4;
  BOOL v17 = a5;
  unsigned int v15 = a6;
  id v12 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100016F48;
  v5[3] = &unk_10087F360;
  v5[4] = self;
  BOOL v7 = a3;
  unsigned int v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)_identitiesEnsureStarted
{
  p_identitiesNotifyToken = &self->_identitiesNotifyToken;
  if (self->_identitiesNotifyToken == -1)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _identitiesEnsureStarted]", 30LL, "Identities start");
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100017140;
    handler[3] = &unk_10087F130;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.identitiesChanged", p_identitiesNotifyToken, dispatchQueue, handler);
    -[CBDaemonServer _identitiesGet](self, "_identitiesGet");
  }

- (void)_identitiesEnsureStopped
{
  int identitiesNotifyToken = self->_identitiesNotifyToken;
  if (identitiesNotifyToken != -1)
  {
    if (dword_1008D5FD8 > 30) {
      goto LABEL_7;
    }
    int identitiesNotifyToken = self->_identitiesNotifyToken;
    if (identitiesNotifyToken != -1)
    {
LABEL_7:
      notify_cancel(identitiesNotifyToken);
      self->_int identitiesNotifyToken = -1;
    }
  }

  identityArray = self->_identityArray;
  self->_identityArray = 0LL;

  identifyDevices = self->_identifyDevices;
  self->_identifyDevices = 0LL;
}

- (BOOL)_identitiesShouldRun
{
  if (!-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked")
    || !-[CBStackController poweredOn](self->_stackController, "poweredOn"))
  {
    return 0;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  unsigned int v3 = self->_xpcConnections;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activatedDiscovery", (void)v15));
        id v10 = [v8 activatedSpatialInteractionSession];
        if (([v10 controlFlags] & 0x3E0) != 0
          || (__int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 activatedAdvertiser]),
              unsigned int v12 = [v11 needsIdentify],
              v11,
              v12))
        {

LABEL_16:
          BOOL v13 = 1;
          goto LABEL_18;
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      BOOL v13 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

- (void)_identitiesGet
{
  if (objc_opt_class(&OBJC_CLASS___RPClient))
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _identitiesGet]", 30LL, "Identities get start");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___RPClient);
    [v3 setDispatchQueue:self->_dispatchQueue];
    [v3 setTargetUserSession:1];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100017524;
    v4[3] = &unk_10087F388;
    v4[4] = v3;
    v4[5] = self;
    [v3 getIdentitiesWithFlags:19883 completion:v4];
  }

  else if (dword_1008D5FD8 <= 90 {
         && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 90LL)))
  }
  {
    LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _identitiesGet]", 90LL, "### Identities not supported");
  }

- (void)_identitiesResolveNearbyDevice:(id)a3
{
  id v3 = a3;
  __int128 v36 = (void *)[v3 identifier];
  if (v36)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifyDevices,  "objectForKeyedSubscript:",  v36);
    if (v4)
    {
      id v5 = [v3 nearbyInfoV2EncryptedData];
      if (v5 || [v3 nearbyInfoV2EncryptedFlags])
      {
      }

      else
      {
        unsigned __int16 v34 = (unsigned __int16)[v3 internalFlags];

        if ((v34 & 0x800) == 0) {
          goto LABEL_84;
        }
      }
    }

    uint64_t v6 = (char *)-[NSMutableDictionary count](self->_identifyDevices, "count");
    if ((unint64_t)v6 >= 0x15E)
    {
      BOOL v7 = v6 - 300;
      do
      {
        uint64_t v47 = 0LL;
        unsigned int v48 = &v47;
        uint64_t v49 = 0x3032000000LL;
        BOOL v50 = sub_10000E650;
        __int128 v51 = sub_10000E660;
        id v52 = 0LL;
        unint64_t v8 = objc_autoreleasePoolPush();
        deviceMap = self->_deviceMap;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_100018138;
        v46[3] = &unk_10087F3B0;
        v46[4] = self;
        void v46[5] = &v47;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v46);
        objc_autoreleasePoolPop(v8);
        id v10 = [v48[5] identifier];
        if (v10) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_identifyDevices,  "setObject:forKeyedSubscript:",  0LL,  v10);
        }

        if (dword_1008D5FD8 < 31
          && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
        {
          LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _identitiesResolveNearbyDevice:]",  30LL,  "Identities removed excess device: %@",  v48[5]);
        }

        _Block_object_dispose(&v47, 8);

        --v7;
      }

      while (v7);
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identityMapSameAccount,  "objectForKeyedSubscript:",  v36));
    if (v11)
    {
      [v3 updateWithCBDeviceIdentity:v11];
      objc_msgSend(v3, "setInternalFlags:", objc_msgSend(v3, "internalFlags") | 8);
      if (dword_1008D5FD8 <= 20
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
      {
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _identitiesResolveNearbyDevice:]",  20LL,  "Identities resolve match: same account, %@, %@",  v3,  v11);
      }

      uint64_t v39 = 1LL;
    }

    else
    {
      uint64_t v39 = 0LL;
    }

    *(void *)&__int128 v41 = [v3 nearbyAuthTag];
    *((void *)&v41 + 1) = [v3 nearbyInfoV2AuthTagData];
    if (*((void *)&v41 + 1))
    {
      BOOL v40 = 0;
      BOOL v35 = (void)v41 == 0LL;
    }

    else
    {
      *((void *)&v41 + 1) = [v3 airplaySourceAuthTagData];
      BOOL v35 = (void)v41 == 0LL;
      BOOL v40 = *((void *)&v41 + 1) == 0LL;
      if (v41 == 0)
      {
LABEL_83:

        goto LABEL_84;
      }
    }

    unsigned int v12 = (void *)[v3 btAddressData];
    if (v12)
    {
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      id obj = self->_identityArray;
      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v53,  16LL);
      if (v13)
      {
        uint64_t v14 = *(void *)v43;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v43 != v14) {
              objc_enumerationMutation(obj);
            }
            __int128 v16 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
            __int128 v17 = objc_autoreleasePoolPush();
            unsigned int v18 = [v16 type];
            if (v18 <= 9 && ((1 << v18) & 0x354) != 0)
            {
              if (v40)
              {
                unsigned __int8 v20 = [v16 verifyAuthTag:(void)v41 data:v12 type:2 error:0];
                id v21 = (id)v41;
                if ((v20 & 1) == 0) {
                  goto LABEL_51;
                }
                goto LABEL_46;
              }

              if ([v16 verifyAuthTag:*((void *)&v41 + 1) data:v12 type:2 error:0])
              {
                id v22 = *((id *)&v41 + 1);
                goto LABEL_42;
              }

              id v23 = [v16 btAddress];
              BOOL v24 = v23 == 0LL;

              if (v24)
              {
                id v28 = *((id *)&v41 + 1);
              }

              else
              {
                uint64_t v25 = (void *)[v16 btAddress];
                id v26 = [v25 subdataWithRange:NSMakeRange(1, 6)];

                __int128 v27 = (void *)[v3 btAddressData];
                LODWORD(v25) = [v26 isEqualToData:v27];

                id v28 = *((id *)&v41 + 1);
                if ((_DWORD)v25)
                {
LABEL_42:
                  char v29 = (void *)[v3 nearbyInfoV2AuthIntegrityTagData];
                  if (!v29)
                  {

                    id v21 = (id)*((void *)&v41 + 1);
                    goto LABEL_46;
                  }

                  unsigned __int8 v30 = -[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]( self,  "_verifyNearbyInfoV2IntegrityTag:rapportIdentity:",  v3,  v16);

                  id v21 = (id)*((void *)&v41 + 1);
                  if ((v30 & 1) != 0)
                  {
LABEL_46:
                    [v3 updateWithRPIdentity:v16];
                    [v3 setInternalFlags:[v3 internalFlags] | 8];
                    if (dword_1008D5FD8 <= 20
                      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
                    {
                      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _identitiesResolveNearbyDevice:]",  20LL,  "Identities resolve match: Addr %@, AT %@, %@, %@",  v12,  v21,  v3,  v16);
                    }

                    uint64_t v39 = (v39 + 1);
                  }

                  else
                  {
LABEL_51:
                    if (dword_1008D5FD8 <= 5
                      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 5LL)))
                    {
                      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _identitiesResolveNearbyDevice:]",  5LL,  "Identities resolve mismatch: Addr %@, AT %@, %@, %@",  v12,  v21,  v3,  v16);
                    }
                  }

                  goto LABEL_59;
                }
              }

              id v21 = v28;
              goto LABEL_51;
            }

- (void)_identitiesReevaluateDevices
{
  if (dword_1008D5FD8 <= 30 && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL))) {
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _identitiesReevaluateDevices]",  30LL,  "Identities re-evaluate: Identities SA %d / Other %d / Devices %d",  -[NSMutableDictionary count](self->_identityMapSameAccount, "count"),  -[NSArray count](self->_identityArray, "count"),  -[NSMutableDictionary count](self->_deviceMap, "count"));
  }
  -[NSMutableDictionary removeAllObjects](self->_identifyDevices, "removeAllObjects");
  deviceMap = self->_deviceMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000182F4;
  v4[3] = &unk_10087F3D8;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 0LL);
}

- (void)updateIdentities:(id)a3
{
  id v4 = a3;
  __int128 v16 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned int v12 = objc_autoreleasePoolPush();
        id v13 = [v11 bluetoothIdentifier];
        uint64_t v14 = (void *)[v13 UUIDString];

        if (v14)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v14);
        }

        else if (dword_1008D5FD8 <= 30 {
               && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
        }
        {
          LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer updateIdentities:]",  30LL,  "UpdateIdentities: ignoring identity without BTID: %@",  v11);
        }

        objc_autoreleasePoolPop(v12);
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  if (dword_1008D5FD8 <= 30 && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL))) {
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer updateIdentities:]",  30,  "UpdateIdentities: %d mapped, %d total",  -[NSMutableDictionary count](v5, "count"),  [v6 count]);
  }
  identityMapSameAccount = v16->_identityMapSameAccount;
  v16->_identityMapSameAccount = v5;

  -[CBDaemonServer _identitiesReevaluateDevices](v16, "_identitiesReevaluateDevices");
}

- (BOOL)_verifyNearbyInfoV2IntegrityTag:(id)a3 rapportIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v64 = 0LL;
  BOOL v65 = &v64;
  uint64_t v66 = 0x2020000000LL;
  char v67 = 0;
  uint64_t v58 = 0LL;
  unsigned __int8 v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000LL;
  id v61 = sub_10000E650;
  id v62 = sub_10000E660;
  id v63 = 0LL;
  uint64_t v52 = 0LL;
  __int128 v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  __int128 v55 = sub_10000E650;
  __int128 v56 = sub_10000E660;
  id v57 = 0LL;
  id v57 = [v6 nearbyInfoV2AuthIntegrityTagData];
  id v8 = [v6 nearbyInfoV2AuthTagData];
  uint64_t v48 = 0LL;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  char v51 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100018D04;
  v47[3] = &unk_10087F400;
  v47[4] = &v58;
  void v47[5] = &v64;
  v47[6] = &v52;
  v47[7] = &v48;
  BOOL v40 = objc_retainBlock(v47);
  uint64_t v9 = v59;
  id obj = v59[5];
  [v6 decryptApplePayloadWithIdentity:v7 forType:22 error:&obj];
  objc_storeStrong(v9 + 5, obj);
  if (v59[5])
  {
    if (self->_prefAuthTagIntegrityCheckEnabled) {
      goto LABEL_54;
    }
    goto LABEL_58;
  }

  unsigned __int8 v45 = [v6 nearbyInfoV2DecryptedFlags];
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v43 = 0xBFF0000000000000LL;
  unint64_t v44 = 0xBFF0000000000000LL;
  unsigned int v42 = -1;
  if (!self->_prefSystemReferenceTimeDisabled && TMGetReferenceTime(&v44, &v43, &v42) && v42)
  {
    double v13 = *(double *)&v44;
    if (dword_1008D5FD8 > 20)
    {
      double v12 = *(double *)&v44;
    }

    else
    {
      double v12 = *(double *)&v44;
      if (dword_1008D5FD8 != -1 || (v38 = _LogCategory_Initialize(&dword_1008D5FD8, 20LL), double v12 = *(double *)&v44, v38))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v12));
        id v15 = [v14 description];
        id v16 = [v15 UTF8String];
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]",  20LL,  "IntegrityTag System reference time %f, (%s). delta: %f ±%f reliability %d for auth tag: %@",  *(void *)&v12,  v16,  v13 - Current,  v43,  v42,  v8);

        double v12 = *(double *)&v44;
      }
    }
  }

  else if (dword_1008D5FD8 <= 20 {
         && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
  }
  {
    if (self->_prefSystemReferenceTimeDisabled) {
      __int128 v11 = "disabled";
    }
    else {
      __int128 v11 = "not available";
    }
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]",  20LL,  "IntegrityTag System reference time '%s' using current absolute time %f for auth tag: %@",  v11,  *(void *)&Current,  v8);
    double v12 = Current;
  }

  else
  {
    double v12 = Current;
  }

  uint64_t v17 = 0LL;
  do
  {
    __int128 v18 = objc_autoreleasePoolPush();
    int v19 = byte_1006BA914[v17];
    uint64_t v20 = ((kCFAbsoluteTimeIntervalSince1970 + v12 + (double)(7200 * v19)) / 7200.0);
    *((_BYTE *)v49 + 24) = v19;
    double v41 = (double)v20 * 7200.0 - kCFAbsoluteTimeIntervalSince1970;
    id v21 = [NSMutableData data];
    id v22 = [NSData dataWithBytes:bleAdv22IauthTag length:16];
    [v21 appendData:v22];

    id v23 = [NSData dataWithBytes:&v41 length:8LL];
    [v21 appendData:v23];

    BOOL v24 = [NSData dataWithBytes:&v45 length:1LL];
    [v21 appendData:v24];

    [v21 appendData:v8];
    if (dword_1008D5FD8 <= 20
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
    {
      uint64_t v25 = *((char *)v49 + 24) + 1LL;
      id v26 = "?";
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]",  20LL,  "IntegrityTag parameters: AT %@, IT %@, %s, CBIN %u, RefT: %f, F2: %u, %@, %@",  v8,  v53[5],  v26,  v20,  *(void *)&v41,  v45,  v6,  v7);
    }

    unsigned int v27 = [v7 verifyAuthTag:v53[5] data:v21 type:2 error:0];
    *((_BYTE *)v65 + 24) = v27;
    if (v27 && dword_1008D5FD8 <= 30)
    {
      if (dword_1008D5FD8 == -1)
      {
        int v28 = *((unsigned __int8 *)v65 + 24);
      }

      else
      {
        int v28 = 1;
      }

      BOOL v29 = v28 == 0;
      unsigned __int8 v30 = "yes";
      if (v29) {
        unsigned __int8 v30 = "no";
      }
      uint64_t v31 = *((char *)v49 + 24) + 1LL;
      __int128 v32 = "?";
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _verifyNearbyInfoV2IntegrityTag:rapportIdentity:]",  30LL,  "IntegrityTag resolved: AT %@, IT valid %s, %s, CBIN %u, %@, %@",  v8,  v30,  v32,  v20,  v6,  v7);
    }

- (void)_remoteEnsureStarted
{
  p_remoteClient = &self->_remoteClient;
  id v4 = self->_remoteClient;
  id v5 = v4;
  if (!v4)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _remoteEnsureStarted]", 30LL, "Remote client start");
    }

    id v5 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    objc_storeStrong((id *)p_remoteClient, v5);
    -[RPCompanionLinkClient setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100019328;
    v21[3] = &unk_10087F428;
    v21[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v21);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000193BC;
    v20[3] = &unk_10087F428;
    v20[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](v5, "setDeviceLostHandler:", v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100019458;
    v19[3] = &unk_10087F450;
    void v19[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](v5, "setDeviceChangedHandler:", v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000194EC;
    v18[3] = &unk_10087F478;
    v18[4] = self;
    -[RPCompanionLinkClient registerEventID:options:handler:]( v5,  "registerEventID:options:handler:",  @"com.apple.bluetooth.event",  0LL,  v18);
  }

  if (!self->_prefRemoteServerEnabled)
  {
    if (self->_remoteRequestRegistered)
    {
      if (dword_1008D5FD8 <= 30
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
      {
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _remoteEnsureStarted]",  30LL,  "Remote server deregister request");
      }

      -[RPCompanionLinkClient deregisterRequestID:](v5, "deregisterRequestID:", @"com.apple.bluetooth.request");
      self->_remoteRequestRegistered = 0;
    }

- (void)_remoteEnsureStopped
{
  if (self->_remoteClient)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _remoteEnsureStopped]", 30LL, "Remote client stop");
    }

    -[RPCompanionLinkClient invalidate](self->_remoteClient, "invalidate");
    remoteClient = self->_remoteClient;
    self->_remoteClient = 0LL;

    self->_remoteRequestRegistered = 0;
  }

  if (self->_remoteServer)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _remoteEnsureStopped]", 30LL, "Remote server stop");
    }

    -[RPServer invalidate](self->_remoteServer, "invalidate");
    remoteServer = self->_remoteServer;
    self->_remoteServer = 0LL;
  }

  if (self->_coexNotificationSetup)
  {
    id v5 = [NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"com.apple.bluetooth.leconnection" object:0];

    self->_coexNotificationSetup = 0;
  }

- (void)coexChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100019890;
  v7[3] = &unk_10087EFC8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)sendCoexUpdate:(id)a3
{
  id v4 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)[v10 remoteDevice];
        double v12 = [v11 identifier];

        if (v12)
        {
          double v13 = [v10 activatedDiscovery];

          if (v13)
          {
            if (dword_1008D5FD8 <= 30
              && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
            {
              uint64_t v14 = CUPrintNSObjectOneLine(v4);
              id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
              LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer sendCoexUpdate:]",  30LL,  "WHB update send coexUpdate: %@ to remoteDevice: %@",  v15,  v12,  (void)v21);
            }

            -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( self->_remoteClient,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.bluetooth.whbU",  v4,  v12,  0LL,  0LL);
          }
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
    }

    while (v7);
  }

  id v16 = [v4 objectForKeyedSubscript:@"NUMBER_OF_LE_CONNECTIONS"];
  id v17 = [v16 unsignedLongValue];
  v25[0] = @"CBWHBMetricsKeyEventType";
  v25[1] = @"CBWHBMetricsKeySubEventType";
  v26[0] = @"CoexUpdateEvent";
  v26[1] = @"SentCoexUpdate";
  v25[2] = @"CBWHBMetricsKeyNumLEConnections";
  __int128 v18 = (void *)[&OBJC_CLASS___NSNumber numberWithUnsignedLongLong:v17];
  v26[2] = v18;
  int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));

  uint64_t v20 = (void *)[CBMetricsDaemon sharedCBMetricsDaemon];
  [v20 reportWhbMetric:v19];
}

- (void)_remoteReceivedEvent:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t NSNumber = NSDictionaryGetNSNumber(v6, @"cid", 0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  uint64_t v10 = RPOptionSenderIDSDeviceID;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, v10, TypeID, 0LL);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t v29 = 0LL;
  unsigned __int8 v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  __int128 v32 = sub_10000E650;
  char v33 = sub_10000E660;
  id v34 = 0LL;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100019F80;
  v28[3] = &unk_10087F4C8;
  v28[5] = v9;
  v28[6] = &v29;
  v28[4] = v13;
  uint64_t v14 = objc_retainBlock(v28);
  if (!v9)
  {
    uint64_t v20 = CBErrorF(4294960591LL, "No client ID");
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
LABEL_14:
    __int128 v18 = (void *)v30[5];
    v30[5] = v21;
    goto LABEL_11;
  }

  if (!v13)
  {
    uint64_t v22 = CBErrorF(4294960591LL, "No sender ID");
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v22);
    goto LABEL_14;
  }

  if (dword_1008D5FD8 <= 20 && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
  {
    id v15 = [v9 unsignedIntValue];
    uint64_t v16 = CUPrintNSObjectOneLine(v6);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _remoteReceivedEvent:options:]",  20LL,  "Remote event received: Sender %@, CID 0x%X, %@",  v13,  v15,  v17);
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoteConnectionMap,  "objectForKeyedSubscript:",  v9));
  if (v18)
  {
    int v19 = (void *)_CFXPCCreateXPCObjectFromCFObject(v6);
    if (v19)
    {
      [v18 xpcReceivedEvent:v19];
    }

    else
    {
      uint64_t v25 = CBErrorF(4294960579LL, "Convert CF to XPC failed");
      uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
      unsigned int v27 = (void *)v30[5];
      v30[5] = v26;
    }
  }

  else
  {
    uint64_t v23 = CBErrorF(4294960591LL, "Connection not found");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    int v19 = (void *)v30[5];
    v30[5] = v24;
  }

LABEL_11:
  ((void (*)(void *))v14[2])(v14);

  _Block_object_dispose(&v29, 8);
}

- (void)_remoteReceivedRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t NSNumber = NSDictionaryGetNSNumber(v8, @"cid", 0LL);
  double v12 = [NSNumber doubleValue];
  uint64_t v13 = RPOptionSenderIDSDeviceID;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v9, v13, TypeID, 0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t v43 = 0LL;
  unint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  id v46 = sub_10000E650;
  uint64_t v47 = sub_10000E660;
  id v48 = 0LL;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10001A438;
  v40[3] = &unk_10087F4F0;
  unsigned int v42 = &v43;
  v40[4] = v16;
  void v40[5] = v12;
  id v17 = v10;
  id v41 = v17;
  __int128 v18 = objc_retainBlock(v40);
  if (!v12)
  {
    uint64_t v34 = CBErrorF(4294960591LL, "No client ID");
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
LABEL_19:
    uint64_t v22 = (CBDaemonXPCConnection *)v44[5];
    v44[5] = v35;
    goto LABEL_16;
  }

  if (!v16)
  {
    uint64_t v36 = CBErrorF(4294960591LL, "No sender ID");
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v36);
    goto LABEL_19;
  }

  if (dword_1008D5FD8 <= 20 && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
  {
    id v19 = [v12 unsignedIntValue];
    uint64_t v20 = CUPrintNSObjectOneLine(v8);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _remoteReceivedRequest:options:responseHandler:]",  20LL,  "Remote request received: Sender %@, CID 0x%X, Request %@",  v16,  v19,  v21);
  }

  uint64_t v22 = (CBDaemonXPCConnection *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoteConnectionMap,  "objectForKeyedSubscript:",  v12));
  if (!v22)
  {
    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
    uint64_t v23 = NSPrintF_safe("Remote-%@-0x%X", v16, [v12 unsignedIntValue]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[CBDaemonXPCConnection setAppID:](v22, "setAppID:", v24);

    -[CBDaemonXPCConnection setDaemon:](v22, "setDaemon:", self);
    -[CBDaemonXPCConnection setDispatchQueue:](v22, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDaemonXPCConnection setEntitled:](v22, "setEntitled:", 1LL);
    -[CBDaemonXPCConnection setRemoteAccepted:](v22, "setRemoteAccepted:", 1LL);
    -[CBDaemonXPCConnection setRemoteClient:](v22, "setRemoteClient:", self->_remoteClient);
    -[CBDaemonXPCConnection setRemoteClientID:](v22, "setRemoteClientID:", v12);
    uint64_t v25 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    -[CBDevice setIdentifier:](v25, "setIdentifier:", v16);
    -[CBDaemonXPCConnection setRemoteDevice:](v22, "setRemoteDevice:", v25);
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      unsigned int v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      int v28 = self->_xpcConnections;
      self->_xpcConnections = v27;

      xpcConnections = self->_xpcConnections;
    }

    -[NSMutableSet addObject:](xpcConnections, "addObject:", v22);
    remoteConnectionMap = self->_remoteConnectionMap;
    if (!remoteConnectionMap)
    {
      unsigned __int8 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v31 = self->_remoteConnectionMap;
      self->_remoteConnectionMap = v30;

      remoteConnectionMap = self->_remoteConnectionMap;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](remoteConnectionMap, "setObject:forKeyedSubscript:", v22, v12);
    -[CBDaemonXPCConnection activate](v22, "activate");
  }

  __int128 v32 = (void *)_CFXPCCreateXPCObjectFromCFObject(v8);
  if (v32)
  {
    id v33 = objc_retainBlock(v17);
    CUXPCObjectSetResponseHandler(v32, v33);

    -[CBDaemonXPCConnection xpcReceivedRequest:](v22, "xpcReceivedRequest:", v32);
  }

  else
  {
    uint64_t v37 = CBErrorF(4294960579LL, "Convert CF to XPC failed");
    uint64_t v38 = [v37 autorelease];
    uint64_t v39 = (void *)v44[5];
    v44[5] = v38;
  }

LABEL_16:
  ((void (*)(void *))v18[2])(v18);

  _Block_object_dispose(&v43, 8);
}

- (void)remoteRegisterConnection:(id)a3 clientID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  remoteConnectionMap = self->_remoteConnectionMap;
  if (!remoteConnectionMap)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v9 = self->_remoteConnectionMap;
    self->_remoteConnectionMap = v8;

    remoteConnectionMap = self->_remoteConnectionMap;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](remoteConnectionMap, "setObject:forKeyedSubscript:", v10, v6);
  if (dword_1008D5FD8 <= 30 && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL))) {
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer remoteRegisterConnection:clientID:]",  30LL,  "Remote connection registered: CID %@, %@",  v6,  v10);
  }
}

- (void)remoteDeregisterConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = -[NSMutableDictionary allKeys](self->_remoteConnectionMap, "allKeys");
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v11 = [self->_remoteConnectionMap objectForKeyedSubscript:v10];
        if (v11 == v4)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteConnectionMap,  "setObject:forKeyedSubscript:",  0LL,  v10);
          if (dword_1008D5FD8 <= 30
            && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer remoteDeregisterConnection:]",  30LL,  "Remote connection deregistered: CID %@, %@",  v10,  v4);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

- (void)_remoteInvalidateInactiveXPC
{
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = self->_xpcConnections;
  id v2 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v42,  16LL);
  if (v2)
  {
    id v3 = v2;
    uint64_t v24 = 0LL;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v6 = [v5 remoteDevice];
        id v7 = [v6 identifier];

        if (v7)
        {
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          uint64_t v8 = (void *)[self->_remoteClient activeDevices];
          id v9 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v33;
            while (2)
            {
              for (j = 0LL; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v33 != v11) {
                  objc_enumerationMutation(v8);
                }
                unsigned __int8 v14 = [v13 isEqual:v7];

                if ((v14 & 1) != 0)
                {

                  goto LABEL_19;
                }
              }

              id v10 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          __int128 v15 = v24;
          if (!v24) {
            __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          uint64_t v24 = v15;
          -[NSMutableArray addObject:](v15, "addObject:", v5);
        }

- (void)_whbDiscoveryEnsureStarted
{
  id v3 = self->_whbDiscoveryDaemon;
  id v4 = v3;
  if (!v3)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _whbDiscoveryEnsureStarted]", 30LL, "WHB discovery start");
    }

    id v5 = objc_alloc_init(&OBJC_CLASS___CBWHBDiscoveryDaemon);
    objc_storeStrong((id *)&self->_whbDiscoveryDaemon, v5);
    -[CBWHBDiscoveryDaemon setDaemonServer:](v5, "setDaemonServer:", self);
    -[CBWHBDiscoveryDaemon setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CBWHBDiscoveryDaemon setRemoteClient:](v5, "setRemoteClient:", self->_remoteClient);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10001AC40;
    v14[3] = &unk_10087EF10;
    id v6 = v5;
    __int128 v15 = v6;
    uint64_t v16 = self;
    -[CBWHBDiscoveryDaemon setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v14);
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    id v10 = sub_10001AC5C;
    uint64_t v11 = &unk_10087EF10;
    id v4 = v6;
    __int128 v12 = v4;
    __int128 v13 = self;
    -[CBWHBDiscoveryDaemon setDeviceLostHandler:](v4, "setDeviceLostHandler:", &v8);
  }

  id v7 = [v4 discoveryArray:v8, v9, v10, v11];
  if (v7)
  {
  }

  else if (-[NSMutableArray count](self->_whbDiscoveryArray, "count"))
  {
    -[CBWHBDiscoveryDaemon setDiscoveryArray:](v4, "setDiscoveryArray:", self->_whbDiscoveryArray);
LABEL_13:
    -[CBWHBDiscoveryDaemon activate](v4, "activate");
    goto LABEL_14;
  }

  if (!v3) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_whbDiscoveryEnsureStopped
{
  if (self->_whbDiscoveryDaemon)
  {
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _whbDiscoveryEnsureStopped]", 30LL, "WHB discovery stop");
    }

    whbDiscoveryArray = self->_whbDiscoveryArray;
    self->_whbDiscoveryArray = 0LL;

    -[CBWHBDiscoveryDaemon invalidate](self->_whbDiscoveryDaemon, "invalidate");
    whbDiscoveryDaemon = self->_whbDiscoveryDaemon;
    self->_whbDiscoveryDaemon = 0LL;

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v5 = -[NSMutableDictionary allValues](self->_whbDeviceMap, "allValues");
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          -[CBDaemonServer _whbDiscoveryDeviceLost:]( self,  "_whbDiscoveryDeviceLost:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i));
        }

        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v7);
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v10 = self->_xpcConnections;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)j), "whbStop", (void)v15);
        }

        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
      }

      while (v12);
    }
  }

- (BOOL)_whbDiscoveryShouldRun
{
  if (!self->_prefRemoteClientEnabled
    || !-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked"))
  {
    return 0;
  }

  if (self->_prefWHBDiscoveryAlways) {
    return 1;
  }
  id v5 = self->_whbDiscoveryArray;
  if (v5)
  {
    id v6 = v5;
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = self->_xpcConnections;
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v8)
    {
      id v9 = v8;
      id v6 = 0LL;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "activatedDiscoveryWHB",  (void)v13));
          if (v12)
          {
            if (!v6) {
              id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            -[NSMutableArray addObject:](v6, "addObject:", v12);
          }
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v9);
    }

    else
    {
      id v6 = 0LL;
    }

    objc_storeStrong((id *)&self->_whbDiscoveryArray, v6);
    -[CBWHBDiscoveryDaemon setDiscoveryArray:](self->_whbDiscoveryDaemon, "setDiscoveryArray:", 0LL);
  }

  BOOL v3 = -[NSMutableArray count](v6, "count", (void)v13) != 0LL;

  return v3;
}

- (void)_whbDiscoveryDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [self->_whbDeviceMap objectForKeyedSubscript:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      whbDeviceMap = self->_whbDeviceMap;
      if (!whbDeviceMap)
      {
        id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v9 = self->_whbDeviceMap;
        self->_whbDeviceMap = v8;

        whbDeviceMap = self->_whbDeviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](whbDeviceMap, "setObject:forKeyedSubscript:", v6, v5);
    }

    -[CBDevice setInternalFlags:]( v6,  "setInternalFlags:",  -[CBDevice internalFlags](v6, "internalFlags") | 2);
    -[CBDevice updateWithCBDevice:](v6, "updateWithCBDevice:", v4);
    uint64_t v10 = (void *)[v4 remoteHostID];
    -[CBDevice setRemoteHostID:](v6, "setRemoteHostID:", v10);

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v11 = self->_xpcConnections;
    id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          __int128 v16 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activatedDiscoveryWHB", (void)v19));
          __int128 v18 = v17;
        }

        id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      }

      while (v13);
    }

    [v4 setChangeFlags:0];
  }
}

- (void)_whbDiscoveryDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = -[self->_whbDeviceMap objectForKeyedSubscript:v5];
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_whbDeviceMap, "setObject:forKeyedSubscript:", 0LL, v5);
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v7 = self->_xpcConnections;
      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
            id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activatedDiscoveryWHB", (void)v14));
            if (v13) {
              [v12 reportDeviceLost:v6];
            }
          }

          id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        }

        while (v9);
      }

      [v4 setChangeFlags:0];
    }
  }
}

- (void)_userControllerCloudUpdateWithDevices:(id)a3
{
  id v4 = a3;
  if (dword_1008D5FD8 <= 50)
  {
    if (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 50LL)) {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]",  50,  "User controller fetched %lu devices",  [v4 count]);
    }
    if (dword_1008D5FD8 <= 35
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 35LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]",  35LL,  "User controller fetched: %@",  v4);
    }
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
LABEL_11:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
      uint64_t v10 = objc_autoreleasePoolPush();
      uint64_t v11 = [v9 identifier];
      if (!v11)
      {
        objc_autoreleasePoolPop(v10);
        uint64_t v23 = obj;
        goto LABEL_35;
      }

      id v12 = (void *)v11;
      id v13 = [self->_deviceMap objectForKeyedSubscript:v11];
      if (!v13)
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___CBDevice);
        deviceMap = self->_deviceMap;
        if (!deviceMap)
        {
          __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int128 v16 = self->_deviceMap;
          self->_deviceMap = v15;

          deviceMap = self->_deviceMap;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v13, v12);
      }

      -[CBDevice setInternalFlags:]( v13,  "setInternalFlags:",  -[CBDevice internalFlags](v13, "internalFlags") | 0x400);
      -[CBDevice updateWithCBDevice:](v13, "updateWithCBDevice:", v9);
      stackController = self->_stackController;
      id v28 = 0LL;
      unsigned int v18 = -[CBStackController modifyDevice:error:](stackController, "modifyDevice:error:", v13, &v28);
      id v19 = v28;
      if (v18)
      {
        if (dword_1008D5FD8 > 40
          || dword_1008D5FD8 == -1 && !_LogCategory_Initialize(&dword_1008D5FD8, 40LL))
        {
          goto LABEL_30;
        }

        __int128 v20 = (void *)[v9 identifier];
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]",  40LL,  "User controller: device %@ updated",  v20);
      }

      else
      {
        if (dword_1008D5FD8 > 90
          || dword_1008D5FD8 == -1 && !_LogCategory_Initialize(&dword_1008D5FD8, 90LL))
        {
          goto LABEL_30;
        }

        __int128 v20 = (void *)[v9 identifier];
        uint64_t v21 = CUPrintNSError(v19);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _userControllerCloudUpdateWithDevices:]",  90LL,  "User controller: device %@ update failed with error %@",  v20,  v22);
      }

LABEL_30:
      -[CBDaemonServer _reportDeviceFound:](self, "_reportDeviceFound:", v13);

      objc_autoreleasePoolPop(v10);
      if (v6 == (id)++v8)
      {
        id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v6) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  uint64_t v23 = (void *)[self->_identitySelf idsDeviceID];
  if (v23)
  {
    uint64_t v24 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    -[CBDevice setIdentifier:](v24, "setIdentifier:", v23);
    -[CBDevice setIdsDeviceID:](v24, "setIdsDeviceID:", v23);
    userController = self->_userController;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10001B780;
    v27[3] = &unk_10087F518;
    v27[4] = v23;
    v27[5] = self;
    -[CBUserController getControllerInfoForDevice:completion:]( userController,  "getControllerInfoForDevice:completion:",  v24,  v27);
  }

- (void)_userControllerUploadLocalControllerInfo
{
  BOOL v3 = [self->_stackController controllerInfo];
  if ([v3 fastLEConnectionInfoVersion]
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fastLEConnectionInfoData]),
        v4,
        v4))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10001BA44;
    v5[3] = &unk_10087EF38;
    v5[4] = self;
    void v5[5] = v3;
    -[CBDaemonServer _performUserControllerActionWithCompletion:]( self,  "_performUserControllerActionWithCompletion:",  v5);
  }

  else if (dword_1008D5FD8 <= 35 {
         && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 35LL)))
  }
  {
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _userControllerUploadLocalControllerInfo]",  35LL,  "Fast LE controller info not available");
  }
}

- (void)activateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BC4C;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      id v14 = [v13 activatedAdvertiser];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    __int128 v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBAdvertiser:completion:]",  30LL,  "Direct update: %@",  v6);
    }

    -[CBDaemonXPCConnection setActivatedAdvertiser:](v15, "setActivatedAdvertiser:", v6);
  }

  else
  {
LABEL_9:

LABEL_14:
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBAdvertiser:completion:]",  30LL,  "Direct activate: %@",  v6);
    }

    __int128 v15 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedAdvertiser:](v15, "setActivatedAdvertiser:", v6);
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      __int128 v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      unsigned int v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }

    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
  }

  -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self, "scheduleAdvertiserUpdateImmediate:", 0LL);
  v7[2](v7, 0LL);
}

- (void)invalidateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BF6C;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v14 = [v13 activatedAdvertiser];

        if (v14 == v6)
        {
          if (dword_1008D5FD8 <= 30
            && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _invalidateCBAdvertiser:completion:]",  30LL,  "Direct invalidate: %@",  v6);
          }

          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);

          goto LABEL_15;
        }
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)activateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C1E0;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      id v14 = [v13 activatedController];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    __int128 v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBController:completion:]",  30LL,  "Direct update: %@",  v6);
    }

    -[CBDaemonXPCConnection setActivatedController:](v15, "setActivatedController:", v6);
  }

  else
  {
LABEL_9:

LABEL_14:
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBController:completion:]",  30LL,  "Direct activate: %@",  v6);
    }

    __int128 v15 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedController:](v15, "setActivatedController:", v6);
    -[CBDaemonXPCConnection setAppID:](v15, "setAppID:", @"CBDaemon");
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      __int128 v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }

    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
  }

  -[CBDaemonServer scheduleControlUpdateImmediate:](self, "scheduleControlUpdateImmediate:", 0LL);
  v7[2](v7, 0LL);
}

- (void)invalidateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C510;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v14 = [v13 activatedController];

        if (v14 == v6)
        {
          if (dword_1008D5FD8 <= 30
            && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _invalidateCBController:completion:]",  30LL,  "Direct invalidate: %@",  v6);
          }

          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);

          goto LABEL_15;
        }
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)activateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C784;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
      id v14 = [v13 activatedDiscovery];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    __int128 v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBDiscovery:completion:]",  30LL,  "Direct update: %@",  v6);
    }

    -[CBDaemonXPCConnection setActivatedDiscovery:](v15, "setActivatedDiscovery:", v6);
  }

  else
  {
LABEL_9:

LABEL_14:
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBDiscovery:completion:]",  30LL,  "Direct activate: %@",  v6);
    }

    __int128 v15 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedDiscovery:](v15, "setActivatedDiscovery:", v6);
    uint64_t v16 = [v6 appID];
    __int128 v17 = (void *)v16;
    if (v16) {
      __int128 v18 = (const __CFString *)v16;
    }
    else {
      __int128 v18 = @"CBDaemon";
    }
    -[CBDaemonXPCConnection setAppID:](v15, "setAppID:", v18);

    -[CBDaemonXPCConnection setDispatchQueue:](v15, "setDispatchQueue:", self->_dispatchQueue);
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v21 = self->_xpcConnections;
      self->_xpcConnections = v20;

      xpcConnections = self->_xpcConnections;
    }

    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
    __int128 v22 = [CBMetricsDaemon sharedCBMetricsDaemon];
    [v22 reportCBDiscovery:v6 daemonCnx:v15 action:@"strt"];
  }

  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0LL);
  v7[2](v7, 0LL);
}

- (void)invalidateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001CB08;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v14 = [v13 activatedDiscovery];

        if (v14 == v6)
        {
          if (dword_1008D5FD8 <= 30
            && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _invalidateCBDiscovery:completion:]",  30LL,  "Direct invalidate: %@",  v6);
          }

          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[CBMetricsDaemon sharedCBMetricsDaemon]( &OBJC_CLASS___CBMetricsDaemon,  "sharedCBMetricsDaemon"));
          [v15 reportCBDiscovery:v6 daemonCnx:v13 action:@"stop"];

          -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0LL);
          goto LABEL_15;
        }
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)activateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001CDA8;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      id v14 = [v13 activatedSpatialInteractionSession];

      if (v14 == v6) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    __int128 v15 = v13;

    if (!v15) {
      goto LABEL_14;
    }
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBSpatialInteractionSession:completion:]",  30LL,  "Direct update: %@",  v6);
    }

    -[CBDaemonXPCConnection setActivatedSpatialInteractionSession:](v15, "setActivatedSpatialInteractionSession:", v6);
  }

  else
  {
LABEL_9:

LABEL_14:
    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _activateCBSpatialInteractionSession:completion:]",  30LL,  "Direct activate: %@",  v6);
    }

    __int128 v15 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
    -[CBDaemonXPCConnection setActivatedSpatialInteractionSession:](v15, "setActivatedSpatialInteractionSession:", v6);
    -[CBDaemonXPCConnection setAppID:](v15, "setAppID:", @"CBDaemon");
    xpcConnections = self->_xpcConnections;
    if (!xpcConnections)
    {
      __int128 v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v18 = self->_xpcConnections;
      self->_xpcConnections = v17;

      xpcConnections = self->_xpcConnections;
    }

    -[NSMutableSet addObject:](xpcConnections, "addObject:", v15);
    -[CBDaemonXPCConnection activate](v15, "activate");
  }

  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0LL);
  v7[2](v7, 0LL);
}

- (void)invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D0D8;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCBSpatialInteractionSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v14 = [v13 activatedSpatialInteractionSession];

        if (v14 == v6)
        {
          if (dword_1008D5FD8 <= 30
            && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
          {
            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _invalidateCBSpatialInteractionSession:completion:]",  30LL,  "Direct invalidate: %@",  v6);
          }

          -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v13);
          -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0LL);

          goto LABEL_15;
        }
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)aopMessageReceived:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001D320;
  v7[3] = &unk_10087EFC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_aopMessageReceived:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)[v10 activatedSpatialInteractionSession];
        id v12 = [v11 aopDataHandler];

        if (v12)
        {
          if (dword_1008D5FD8 <= 20
            && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
          {
            uint64_t v14 = CUPrintNSDataHex(v4, 100LL, 1LL);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _aopMessageReceived:]",  20LL,  "AOPMessageReceived: %@, <%@>",  v11,  v15,  (void)v16);
          }

          [v10 aopMessageReceived:v4];

          goto LABEL_17;
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (dword_1008D5FD8 <= 90 && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 90LL)))
  {
    uint64_t v13 = CUPrintNSDataHex(v4, 100LL, 1LL);
    id v5 = [v13 mutableCopy];
    LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _aopMessageReceived:]",  90LL,  "### AOPMessageReceived with no session: <%@>",  v5);
LABEL_17:
  }
}

- (void)notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001D614;
  v15[3] = &unk_10087F5A8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)_notifyConnectedDeviceUUID:(id)a3 name:(id)a4 servicesUUIDs:(id)a5
{
  id v44 = a3;
  id v40 = a4;
  id v46 = a5;
  __int128 v39 = self->_xpcPublisherConnections;
  if (!v39) {
    goto LABEL_47;
  }
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v8 = self->_xpcConnections;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v58,  v64,  16LL);
  if (!v9)
  {

LABEL_43:
    if (dword_1008D5FD8 <= 20
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 20LL)))
    {
      uint64_t v37 = CUPrintNSObjectOneLine(v46);
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _notifyConnectedDeviceUUID:name:servicesUUIDs:]",  20LL,  "XPC subscriber connected: no matches, %@",  v38);
    }

    goto LABEL_47;
  }

  id v10 = v9;
  int v45 = 0;
  uint64_t v11 = *(void *)v59;
  uint64_t v41 = *(void *)v59;
  unsigned int v42 = v8;
  do
  {
    id v12 = 0LL;
    id v43 = v10;
    do
    {
      if (*(void *)v59 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v12);
      id v14 = [v13 xpcToken];
      if (v14)
      {
        id v15 = v14;
        id v16 = [v13 activatedConnection];
        id v17 = v16;
        if (v16)
        {
          id v18 = [v16 serviceUUIDs];
          if (v18)
          {
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v54 = 0u;
            __int128 v55 = 0u;
            xpc_object_t v19 = v46;
            id v48 = [v19 countByEnumeratingWithState:&v54 objects:v63 count:16];
            if (v48)
            {
              uint64_t v20 = *(void *)v55;
              uint64_t v49 = v19;
              uint64_t v47 = *(void *)v55;
              while (2)
              {
                for (i = 0LL; i != v48; i = (char *)i + 1)
                {
                  if (*(void *)v55 != v20) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)i);
                  __int128 v50 = 0u;
                  __int128 v51 = 0u;
                  __int128 v52 = 0u;
                  __int128 v53 = 0u;
                  id v23 = v18;
                  id v24 = [v23 countByEnumeratingWithState:&v50 objects:v62 count:16];
                  if (v24)
                  {
                    id v25 = v24;
                    uint64_t v26 = *(void *)v51;
LABEL_17:
                    uint64_t v27 = 0LL;
                    while (1)
                    {
                      if (*(void *)v51 != v26) {
                        objc_enumerationMutation(v23);
                      }
                      if (v25 == (id)++v27)
                      {
                        id v25 = [v23 countByEnumeratingWithState:&v50 objects:v62 count:16];
                        if (v25) {
                          goto LABEL_17;
                        }
                        goto LABEL_23;
                      }
                    }

                    xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
                    id v28 = [v44 UUIDString];
                    __int128 v29 = (const char *)[v28 UTF8String];

                    if (!v29) {
                      goto LABEL_32;
                    }
                    xpc_dictionary_set_string(v19, "deviceID", v29);
                    __int128 v30 = (const char *)[v40 UTF8String];
                    id v8 = v42;
                    id v10 = v43;
                    uint64_t v11 = v41;
                    if (v30) {
                      xpc_dictionary_set_string(v19, "name", v30);
                    }
                    uint64_t v31 = xpc_event_publisher_fire(v39, v15, v19);
                    if (dword_1008D5FD8 <= 30)
                    {
                      uint64_t v32 = v31;
                      if (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL))
                      {
                        uint64_t v33 = CUPrintNSObjectOneLine(v49);
                        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                        uint64_t v35 = CUPrintErrorCode(v32);
                        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
                        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _notifyConnectedDeviceUUID:name:servicesUUIDs:]",  30LL,  "XPC subscriber connected: token %llu, device %@, services %@, %@",  v15,  v44,  v34,  v36);
                      }
                    }

                    ++v45;
                    goto LABEL_35;
                  }

- (id)localWhbDeviceForStableId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10000E650;
  id v16 = sub_10000E660;
  id v17 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DB64;
  block[3] = &unk_10087F4C8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)optimalWhbDeviceForStableIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DC48;
  block[3] = &unk_10087F580;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_performUserControllerActionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = self->_systemMonitor;
  if ((-[CUSystemMonitor firstUnlocked](v5, "firstUnlocked") & 1) != 0)
  {
    id v6 = self->_userController;
    if (v6)
    {
      id v7 = v6;
      v4[2](v4, 0LL);
    }

    else
    {
      id v7 = (CBUserController *)objc_alloc_init((Class)objc_opt_class( -[CBStackAdaptor userControllerClass]( self->_stackAdaptor,  "userControllerClass")));
      -[CBUserController setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10001DE14;
      v12[3] = &unk_10087EEC8;
      void v12[4] = self;
      -[CBUserController setInvalidationHandler:](v7, "setInvalidationHandler:", v12);
      objc_storeStrong((id *)&self->_userController, v7);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10001DE24;
      v10[3] = &unk_10087F5D0;
      v10[4] = self;
      uint64_t v11 = v4;
      -[CBUserController activateWithCompletion:](v7, "activateWithCompletion:", v10);
    }
  }

  else
  {
    uint64_t v8 = CBErrorF(4294960520LL, "Device not first unlocked for user controller");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    ((void (**)(id, void *))v4)[2](v4, v9);
  }
}

- (void)_invalidateUserController
{
  if (!self->_userController)
  {
    id v3 = 0LL;
    [0 invalidate];
    userController = self->_userController;
    self->_userController = 0LL;

    if (dword_1008D5FD8 <= 30
      && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
    {
      LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _invalidateUserController]",  30LL,  "Stack user controller stopped");
    }
  }

- (void)_xpcListenerEvent:(id)a3
{
  id v9 = a3;
  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_connection)
  {
    -[CBDaemonServer _xpcConnectionAccept:](self, "_xpcConnectionAccept:", v9);
    goto LABEL_7;
  }

  id v4 = v9;
  if (v9 == &_xpc_error_connection_invalid)
  {
    if (dword_1008D5FD8 <= 30)
    {
      if (dword_1008D5FD8 != -1 || (v8 = _LogCategory_Initialize(&dword_1008D5FD8, 30LL), id v4 = v9, v8))
      {
        LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _xpcListenerEvent:]", 30LL, "XPC listener invalidated");
        goto LABEL_7;
      }
    }
  }

  else if (dword_1008D5FD8 <= 90)
  {
    if (dword_1008D5FD8 != -1 || (int v7 = _LogCategory_Initialize(&dword_1008D5FD8, 90LL), v4 = v9, v7))
    {
      uint64_t v5 = CUPrintXPC(v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF_safe(&dword_1008D5FD8, "-[CBDaemonServer _xpcListenerEvent:]", 90LL, "### XPC listener error: %@", v6);

LABEL_7:
      id v4 = v9;
    }
  }
}

- (void)_xpcConnectionAccept:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
  -[CBDaemonXPCConnection setDaemon:](v5, "setDaemon:", self);
  -[CBDaemonXPCConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[CBDaemonXPCConnection setPid:](v5, "setPid:", xpc_connection_get_pid(v4));
  -[CBDaemonXPCConnection setXpcCnx:](v5, "setXpcCnx:", v4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001E19C;
  handler[3] = &unk_10087F080;
  handler[4] = v5;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(v4);

  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    int v8 = self->_xpcConnections;
    self->_xpcConnections = v7;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v5);
  -[CBDaemonXPCConnection activate](v5, "activate");
}

- (void)xpcConnectionInvalidated:(id)a3
{
  xpcConnections = self->_xpcConnections;
  id v5 = a3;
  -[NSMutableSet removeObject:](xpcConnections, "removeObject:", v5);
  -[CBDaemonServer remoteDeregisterConnection:](self, "remoteDeregisterConnection:", v5);

  -[CBDaemonServer scheduleUpdateImmediate:](self, "scheduleUpdateImmediate:", 0LL);
}

- (void)_xpcPublisherConnectionsAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = v8;
  switch((_DWORD)v6)
  {
    case 2:
      if (dword_1008D5FD8 <= 30)
      {
        id v14 = v8;
        if (dword_1008D5FD8 != -1 || (v12 = _LogCategory_Initialize(&dword_1008D5FD8, 30LL), id v9 = v14, v12))
        {
          LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherConnectionsAction:token:info:]",  30LL,  "XPC publisher initial barrier: connections");
          goto LABEL_12;
        }
      }

      break;
    case 1:
      id v14 = v8;
      -[CBDaemonServer _xpcPublisherConnectionsRemoveToken:reason:]( self,  "_xpcPublisherConnectionsRemoveToken:reason:",  a4,  "removed");
      goto LABEL_12;
    case 0:
      id v14 = v8;
      -[CBDaemonServer _xpcPublisherConnectionsAddToken:info:](self, "_xpcPublisherConnectionsAddToken:info:", a4);
LABEL_12:
      id v9 = v14;
      break;
    default:
      if (dword_1008D5FD8 <= 30)
      {
        id v14 = v8;
        if (dword_1008D5FD8 != -1 || (int v13 = _LogCategory_Initialize(&dword_1008D5FD8, 30LL), v9 = v14, v13))
        {
          uint64_t v10 = CUPrintXPC(v9);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherConnectionsAction:token:info:]",  30LL,  "Unknown XPC publisher action: connections, %d, %@",  v6,  v11);

          goto LABEL_12;
        }
      }

      break;
  }
}

- (void)_xpcPublisherConnectionsAddToken:(unint64_t)a3 info:(id)a4
{
  id v6 = a4;
  if (-[CBDaemonServer xpcEventAllowedInfo:](self, "xpcEventAllowedInfo:", v6))
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v7 = self->_xpcConnections;
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
LABEL_4:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        if ([v12 xpcToken] == (id)a3)
        {
          int v13 = (void *)[v12 xpcCnx];

          if (!v13) {
            break;
          }
        }

        if (v9 == (id)++v11)
        {
          id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }

      id v14 = v12;

      if (!v14) {
        goto LABEL_17;
      }
      id v15 = [v14 activatedConnection];
      -[CBConnection updateWithXPCSubscriberInfo:](v15, "updateWithXPCSubscriberInfo:", v6);
      if (dword_1008D5FD8 <= 30
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
      {
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherConnectionsAddToken:info:]",  30LL,  "XPC subscriber update: connections, %llu, %@",  a3,  v14,  (void)v19);
      }
    }

    else
    {
LABEL_11:

LABEL_17:
      id v14 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
      -[CBDaemonXPCConnection setAppID:](v14, "setAppID:", @"XPCProxy");
      -[CBDaemonXPCConnection setXpcToken:](v14, "setXpcToken:", a3);
      id v15 = objc_alloc_init(&OBJC_CLASS___CBConnection);
      -[CBDaemonXPCConnection setActivatedConnection:](v14, "setActivatedConnection:", v15);
      -[CBConnection updateWithXPCSubscriberInfo:](v15, "updateWithXPCSubscriberInfo:", v6);
      if (dword_1008D5FD8 <= 30
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
      {
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherConnectionsAddToken:info:]",  30LL,  "XPC subscriber add: connections, token %llu, %@",  a3,  v14,  (void)v19);
      }

      xpcConnections = self->_xpcConnections;
      if (!xpcConnections)
      {
        id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        id v18 = self->_xpcConnections;
        self->_xpcConnections = v17;

        xpcConnections = self->_xpcConnections;
      }

      -[NSMutableSet addObject:](xpcConnections, "addObject:", v14);
      -[CBDaemonXPCConnection activate](v14, "activate");
    }
  }

  else
  {
    -[CBDaemonServer _xpcPublisherConnectionsRemoveToken:reason:]( self,  "_xpcPublisherConnectionsRemoveToken:reason:",  a3,  "not allowed");
  }
}

- (void)_xpcPublisherConnectionsRemoveToken:(unint64_t)a3 reason:(const char *)a4
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  int v7 = self->_xpcConnections;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v11 xpcToken] == (id)a3)
        {
          int v12 = (void *)[v11 xpcCnx];

          if (!v12)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)xpcEventAllowedInfo:(id)a3
{
  id v3 = a3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    LOBYTE(v9) = 1;
    goto LABEL_12;
  }

  xpc_object_t array = xpc_dictionary_get_array(v3, "limitToDeviceClasses");
  uint64_t v5 = [array autorelease];
  xpc_object_t v6 = xpc_dictionary_get_array(v3, "denyProductList");
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  if (!(v5 | v7))
  {
    LOBYTE(v9) = 1;
    goto LABEL_11;
  }

  uint64_t v14 = 0LL;
  __int128 v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  if (v5)
  {
    id v8 = (id) MGCopyAnswer(@"DeviceClass", 0LL);
    id v9 = [v8 UTF8String];

    if (!v9) {
      goto LABEL_10;
    }
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_10001E970;
    applier[3] = &unk_10087F5F8;
    applier[4] = &v14;
    applier[5] = v9;
    xpc_array_apply((xpc_object_t)v5, applier);
  }

  if (!v7)
  {
LABEL_9:
    LOBYTE(v9) = *((_BYTE *)v15 + 24) != 0;
    goto LABEL_10;
  }

  id v10 = (id) MGCopyAnswer(@"ProductType", 0LL);
  id v9 = [v10 UTF8String];

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001E9C4;
    v12[3] = &unk_10087F5F8;
    void v12[4] = &v14;
    void v12[5] = v9;
    xpc_array_apply((xpc_object_t)v7, v12);
    goto LABEL_9;
  }

- (void)_xpcPublisherDiscoveryAction:(unsigned int)a3 token:(unint64_t)a4 info:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = v8;
  switch((_DWORD)v6)
  {
    case 2:
      if (dword_1008D5FD8 <= 30)
      {
        id v14 = v8;
        if (dword_1008D5FD8 != -1 || (v12 = _LogCategory_Initialize(&dword_1008D5FD8, 30LL), id v9 = v14, v12))
        {
          LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherDiscoveryAction:token:info:]",  30LL,  "XPC publisher initial barrier: discovery");
          goto LABEL_12;
        }
      }

      break;
    case 1:
      id v14 = v8;
      -[CBDaemonServer _xpcPublisherDiscoveryRemoveToken:reason:]( self,  "_xpcPublisherDiscoveryRemoveToken:reason:",  a4,  "removed");
      goto LABEL_12;
    case 0:
      id v14 = v8;
      -[CBDaemonServer _xpcPublisherDiscoveryAddToken:info:](self, "_xpcPublisherDiscoveryAddToken:info:", a4);
LABEL_12:
      id v9 = v14;
      break;
    default:
      if (dword_1008D5FD8 <= 30)
      {
        id v14 = v8;
        if (dword_1008D5FD8 != -1 || (int v13 = _LogCategory_Initialize(&dword_1008D5FD8, 30LL), v9 = v14, v13))
        {
          uint64_t v10 = CUPrintXPC(v9);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherDiscoveryAction:token:info:]",  30LL,  "Unknown XPC publisher action: discovery, %d, %@",  v6,  v11);

          goto LABEL_12;
        }
      }

      break;
  }
}

- (void)_xpcPublisherDiscoveryAddToken:(unint64_t)a3 info:(id)a4
{
  id v6 = a4;
  if (-[CBDaemonServer xpcEventAllowedInfo:](self, "xpcEventAllowedInfo:", v6))
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v7 = self->_xpcConnections;
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
LABEL_4:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
        if ([v12 xpcToken] == (id)a3)
        {
          int v13 = (void *)[v12 xpcCnx];

          if (!v13) {
            break;
          }
        }

        if (v9 == (id)++v11)
        {
          id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }

      id v14 = v12;

      if (!v14) {
        goto LABEL_17;
      }
      __int128 v15 = (CBDiscovery *)objc_claimAutoreleasedReturnValue(-[CBDaemonXPCConnection activatedDiscovery](v14, "activatedDiscovery"));
      id v16 = -[CBDiscovery updateWithXPCSubscriberInfo:](v15, "updateWithXPCSubscriberInfo:", v6);
      if (dword_1008D5FD8 <= 30
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
      {
        uint64_t v17 = CUPrintFlags64(v16, "");
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherDiscoveryAddToken:info:]",  30LL,  "XPC subscriber update: discovery, %llu, %@, %@",  a3,  v14,  v18);
      }

      if (v16)
      {
        id v23 = [CBMetricsDaemon sharedCBMetricsDaemon];
        id v24 = v23;
        id v25 = @"updt";
        goto LABEL_27;
      }
    }

    else
    {
LABEL_11:

LABEL_17:
      id v14 = objc_alloc_init(&OBJC_CLASS___CBDaemonXPCConnection);
      -[CBDaemonXPCConnection setAppID:](v14, "setAppID:", @"XPCProxy");
      -[CBDaemonXPCConnection setXpcToken:](v14, "setXpcToken:", a3);
      __int128 v15 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
      __int128 v19 = (void *)[v14 appID];
      -[CBDiscovery setAppID:](v15, "setAppID:", v19);

      -[CBDaemonXPCConnection setActivatedDiscovery:](v14, "setActivatedDiscovery:", v15);
      -[CBDiscovery updateWithXPCSubscriberInfo:](v15, "updateWithXPCSubscriberInfo:", v6);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10001EF28;
      v27[3] = &unk_10087F620;
      v27[4] = v15;
      v27[5] = v14;
      void v27[6] = self;
      v27[7] = a3;
      -[CBDiscovery setDeviceFoundHandler:](v15, "setDeviceFoundHandler:", v27);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10001F140;
      void v26[3] = &unk_10087F620;
      v26[4] = v15;
      v26[5] = v14;
      v26[6] = self;
      v26[7] = a3;
      -[CBDiscovery setDeviceLostHandler:](v15, "setDeviceLostHandler:", v26);
      if (dword_1008D5FD8 <= 30
        && (dword_1008D5FD8 != -1 || _LogCategory_Initialize(&dword_1008D5FD8, 30LL)))
      {
        LogPrintF_safe( &dword_1008D5FD8,  "-[CBDaemonServer _xpcPublisherDiscoveryAddToken:info:]",  30LL,  "XPC subscriber add: discovery, token %llu, %@",  a3,  v14);
      }

      xpcConnections = self->_xpcConnections;
      if (!xpcConnections)
      {
        __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v22 = self->_xpcConnections;
        self->_xpcConnections = v21;

        xpcConnections = self->_xpcConnections;
      }

      -[NSMutableSet addObject:](xpcConnections, "addObject:", v14);
      -[CBDaemonXPCConnection activate](v14, "activate");
      id v23 = [CBMetricsDaemon sharedCBMetricsDaemon];
      id v24 = v23;
      id v25 = @"strt";
LABEL_27:
      [v23 reportCBDiscovery:v15 daemonCnx:v14 action:v25];
    }

    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self, "scheduleDiscoveryUpdateImmediate:", 0LL);
  }

  else
  {
    -[CBDaemonServer _xpcPublisherDiscoveryRemoveToken:reason:]( self,  "_xpcPublisherDiscoveryRemoveToken:reason:",  a3,  "not allowed");
  }
}

- (void)_xpcPublisherDiscoveryRemoveToken:(unint64_t)a3 reason:(const char *)a4
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = self->_xpcConnections;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v11 xpcToken] == (id)a3)
        {
          int v12 = (void *)[v11 xpcCnx];

          if (!v12)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)_supportsProxControl
{
  if (qword_1008D9E18 != -1) {
    dispatch_once(&qword_1008D9E18, &stru_10087F640);
  }
  return byte_1008D9E20;
}

- (BOOL)supportsNCSecondaryAdvertisingInstance
{
  if (qword_1008D9E28 != -1) {
    dispatch_once(&qword_1008D9E28, &stru_10087F660);
  }
  return self->_prefNCSecondaryAdvInstance & byte_1008D9E21;
}

- (void)addLostDeviceToLostCBSpatialDevicesIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001F69C;
  v7[3] = &unk_10087EFC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (CBAccessoryDaemon)accessoryDaemon
{
  return self->_accessoryDaemon;
}

- (void)setAccessoryDaemon:(id)a3
{
}

- (CBStackAddressMonitor)addressMonitor
{
  return self->_addressMonitor;
}

- (void)setAddressMonitor:(id)a3
{
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
}

- (CBExtensionsDaemon)extensionsDaemon
{
  return self->_extensionsDaemon;
}

- (void)setExtensionsDaemon:(id)a3
{
}

- (NSArray)identityArray
{
  return self->_identityArray;
}

- (void)setIdentityArray:(id)a3
{
}

- (BOOL)prefAppleAudioDeviceLimitedLoggingEnabled
{
  return self->_prefAppleAudioDeviceLimitedLoggingEnabled;
}

- (char)prefCBExtensionRSSIOverride
{
  return self->_prefCBExtensionRSSIOverride;
}

- (BOOL)prefEnforceApprovedExtensions
{
  return self->_prefEnforceApprovedExtensions;
}

- (void)setPrefEnforceApprovedExtensions:(BOOL)a3
{
  self->_prefEnforceApprovedExtensions = a3;
}

- (BOOL)prefEnforceApprovedList
{
  return self->_prefEnforceApprovedList;
}

- (void)setPrefEnforceApprovedList:(BOOL)a3
{
  self->_prefEnforceApprovedList = a3;
}

- (NSData)prefFilterNearbyActionExtraData
{
  return self->_prefFilterNearbyActionExtraData;
}

- (BOOL)prefRemoteClientEnabled
{
  return self->_prefRemoteClientEnabled;
}

- (BOOL)prefRemoteServerEnabled
{
  return self->_prefRemoteServerEnabled;
}

- (BOOL)prefSystemReferenceTimeDisabled
{
  return self->_prefSystemReferenceTimeDisabled;
}

- (BOOL)prefWiProxAdvertising
{
  return self->_prefWiProxAdvertising;
}

- (CBStackAdaptor)stackAdaptor
{
  return self->_stackAdaptor;
}

- (CBStackBLEScanner)stackBLEScanner
{
  return self->_stackBLEScanner;
}

- (CBStackController)stackController
{
  return self->_stackController;
}

- (void)setStackController:(id)a3
{
}

- (CBAdvertiserDaemon)testAdvertiser
{
  return self->_testAdvertiser;
}

- (void)setTestAdvertiser:(id)a3
{
}

- (CBController)testAssertion
{
  return self->_testAssertion;
}

- (void)setTestAssertion:(id)a3
{
}

- (CBDiscovery)testDiscovery
{
  return self->_testDiscovery;
}

- (void)setTestDiscovery:(id)a3
{
}

- (CBUserController)userController
{
  return self->_userController;
}

- (void)setUserController:(id)a3
{
}

- (NSMutableDictionary)whbDeviceMap
{
  return self->_whbDeviceMap;
}

- (CBWHBDiscoveryDaemon)whbDiscoveryDaemon
{
  return self->_whbDiscoveryDaemon;
}

- (char)wifiCriticalOverride
{
  return self->_wifiCriticalOverride;
}

- (void)setWifiCriticalOverride:(char)a3
{
  self->_wifiCriticalOverride = a3;
}

- (NSMutableSet)xpcConnections
{
  return self->_xpcConnections;
}

- (void)setXpcConnections:(id)a3
{
}

- (NSMutableDictionary)identifyDevices
{
  return self->_identifyDevices;
}

- (void)setIdentifyDevices:(id)a3
{
}

- (BOOL)prefExtensionsEnabled
{
  return self->_prefExtensionsEnabled;
}

- (void)setPrefExtensionsEnabled:(BOOL)a3
{
  self->_prefExtensionsEnabled = a3;
}

- (void).cxx_destruct
{
}

@end