@interface APUIConnectivityManager
+ (BOOL)isCaptivePortalMitigationSupported;
+ (BOOL)nwPathHasWiFiConnectivity:(id)a3;
+ (BOOL)shouldUpdateNetworkProfile;
+ (id)sharedInstance;
- (APUIConnectivityManager)init;
- (NSString)currentNetworkSSID;
- (int64_t)connectivityState;
- (void)_associateWithNetworkWithPassPhrase:(id)a3 captivePortalAuthToken:(id)a4 scanResults:(id)a5 completion:(id)a6;
- (void)_initWifiInterface;
- (void)_monitorWiFiIPAddressConfigurationWithCompletion:(id)a3;
- (void)_startMonitoringWiFiEvents;
- (void)_startWiFiNetworkScanWithScanParameters:(id)a3 passPhrase:(id)a4 captivePortalAuthToken:(id)a5 completion:(id)a6;
- (void)_stopMonitoringWiFiEvents;
- (void)dealloc;
- (void)enableCaptiveWebsheet:(unsigned __int8)a3;
- (void)handleUSBInterfaceChangedWithEventInfo:(id)a3;
- (void)handleWiFiInterfaceChangedWithEventInfo:(id)a3;
- (void)joinWiFiNetworkWithSSID:(id)a3 isNetworkHidden:(BOOL)a4 passPhrase:(id)a5 captivePortalAuthToken:(id)a6 completion:(id)a7;
- (void)startMonitoringWiFiInterfaceChange;
- (void)stopMonitoringWiFiInterfaceChange;
- (void)tagAirPlayNetwork;
@end

@implementation APUIConnectivityManager

- (int64_t)connectivityState
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t connectivityState = v2->_connectivityState;
  objc_sync_exit(v2);

  return connectivityState;
}

- (void)_initWifiInterface
{
  v3 = -[CWFInterface initWithServiceType:](objc_alloc(&OBJC_CLASS___CWFInterface), "initWithServiceType:", 2LL);
  cwInterface = self->_cwInterface;
  self->_cwInterface = v3;

  -[CWFInterface activate](self->_cwInterface, "activate");
  -[CWFInterface setInvalidationHandler:](self->_cwInterface, "setInvalidationHandler:", &stru_1000106C8);
}

- (void)_startMonitoringWiFiEvents
{
  if (dword_100016060 <= 50
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
  {
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _startMonitoringWiFiEvents]",  33554482LL,  "[%{ptr}] Start monitoring WiFi events notification.",  self);
  }

  cwInterface = self->_cwInterface;
  id v10 = 0LL;
  -[CWFInterface startMonitoringEventType:error:](cwInterface, "startMonitoringEventType:error:", 19LL, &v10);
  id v4 = v10;
  if (v4
    && dword_100016060 <= 90
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554522LL)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _startMonitoringWiFiEvents]",  33554522LL,  "Start IPv4 address notification failed with error: %@",  v5);
  }

  v6 = self->_cwInterface;
  id v9 = 0LL;
  -[CWFInterface startMonitoringEventType:error:](v6, "startMonitoringEventType:error:", 20LL, &v9);
  id v7 = v9;
  if (v7
    && dword_100016060 <= 90
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554522LL)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _startMonitoringWiFiEvents]",  33554522LL,  "Start monitoring IPv6 address notification failed with error: %@",  v8);
  }
}

- (void)_stopMonitoringWiFiEvents
{
  if (dword_100016060 <= 50
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
  {
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _stopMonitoringWiFiEvents]",  33554482LL,  "[%{ptr}] Stop monitoring WiFi events notification.",  self);
  }

  -[CWFInterface stopMonitoringEventType:](self->_cwInterface, "stopMonitoringEventType:", 19LL);
  -[CWFInterface stopMonitoringEventType:](self->_cwInterface, "stopMonitoringEventType:", 20LL);
}

- (void)_monitorWiFiIPAddressConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  monitorQueue = self->_monitorQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007980;
  v7[3] = &unk_100010718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)monitorQueue, v7);
}

- (void)joinWiFiNetworkWithSSID:(id)a3 isNetworkHidden:(BOOL)a4 passPhrase:(id)a5 captivePortalAuthToken:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v17 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
  [v15 setSSID:v17];
  [v15 setIncludeHiddenNetworks:v10];
  [v15 setMaximumCacheAge:0];
  [v15 setNumberOfScans:1];
  id v16 = [v15 setMergeScanResults:1];
  if (v13)
  {
    if (IsAppleInternalBuild(v16)
      && dword_100016060 <= 50
      && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
    {
      LogPrintF( &dword_100016060,  "-[APUIConnectivityManager joinWiFiNetworkWithSSID:isNetworkHidden:passPhrase:captivePortalAuthToken:completion:]",  33554482LL,  "[%{ptr}] Starts captive portal authentication with token %@.",  self,  v13);
    }
  }

  -[APUIConnectivityManager _startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:]( self,  "_startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:",  v15,  v12,  v13,  v14);
}

- (void)enableCaptiveWebsheet:(unsigned __int8)a3
{
  int v3 = a3;
  int v5 = CNEnableWebSheetLaunch(a3, a2);
  if (dword_100016060 <= 50)
  {
    int v6 = v5;
    if (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL))
    {
      id v7 = @"Enable";
      if (!v3) {
        id v7 = @"Disable";
      }
      id v8 = @"success";
      if (!v6) {
        id v8 = @"failure";
      }
      LogPrintF( &dword_100016060,  "-[APUIConnectivityManager enableCaptiveWebsheet:]",  33554482LL,  "[%{ptr}] %@ captive websheet launch status: %@",  self,  v7,  v8);
    }
  }

- (void)tagAirPlayNetwork
{
  if ([(id)objc_opt_class(self) shouldUpdateNetworkProfile])
  {
    int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](self->_cwInterface, "currentKnownNetworkProfile"));
    if ((objc_opt_respondsToSelector(v3, "setPublicAirPlayNetwork:") & 1) != 0)
    {
      [v3 performSelector:"setPublicAirPlayNetwork:" withObject:&__kCFBooleanTrue];
      cwInterface = self->_cwInterface;
      int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", &off_100010E50));
      id v7 = 0LL;
      -[CWFInterface updateKnownNetworkProfile:properties:error:]( cwInterface,  "updateKnownNetworkProfile:properties:error:",  v3,  v5,  &v7);
      id v6 = v7;

      if (v6)
      {
        if (dword_100016060 <= 90
          && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554522LL)))
        {
          LogPrintF( &dword_100016060,  "-[APUIConnectivityManager tagAirPlayNetwork]",  33554522LL,  "[%{ptr}] Update network profile with error: %@.",  self,  v6);
        }
      }

      else if (dword_100016060 <= 50 {
             && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
      }
      {
        LogPrintF( &dword_100016060,  "-[APUIConnectivityManager tagAirPlayNetwork]",  33554482LL,  "[%{ptr}] Updated network profile",  self);
      }
    }
  }

- (void)_startWiFiNetworkScanWithScanParameters:(id)a3 passPhrase:(id)a4 captivePortalAuthToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100016060 <= 50
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
  {
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:]",  33554482LL,  "[%{ptr}] Starts WiFi scan.",  self);
  }

  cwInterface = self->_cwInterface;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100008588;
  v18[3] = &unk_100010740;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  -[CWFInterface performScanWithParameters:reply:](cwInterface, "performScanWithParameters:reply:", v10, v18);
}

- (void)_associateWithNetworkWithPassPhrase:(id)a3 captivePortalAuthToken:(id)a4 scanResults:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___CWFAssocParameters);
  [v12 setScanResult:v10];

  [v12 setPassword:v11];
  [v12 setRememberUponSuccessfulAssociation:1];
  if (dword_100016060 <= 50
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
  {
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]",  33554482LL,  "[%{ptr}] Starts WiFi association.",  self);
  }

  cwInterface = self->_cwInterface;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000088F8;
  v15[3] = &unk_100010768;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  -[CWFInterface associateWithParameters:reply:](cwInterface, "associateWithParameters:reply:", v12, v15);
}

- (void)handleUSBInterfaceChangedWithEventInfo:(id)a3
{
  id v17 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  int v5 = v17;
  int64_t connectivityState = v4->_connectivityState;
  if (!v4->_activeUSBInterfaces)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activeUSBInterfaces = v4->_activeUSBInterfaces;
    v4->_activeUSBInterfaces = v7;

    int v5 = v17;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kAPConnectivityHelperEventInfoKey_IsAddEvent]);
  unsigned int v10 = [v9 BOOLValue];

  id v11 = v4->_activeUSBInterfaces;
  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:kAPConnectivityHelperEventInfoKey_NetworkInterfaceName]);
    -[NSMutableSet addObject:](v11, "addObject:", v12);

    uint64_t v13 = v4->_connectivityState | 2;
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:kAPConnectivityHelperEventInfoKey_NetworkInterfaceName]);
    -[NSMutableSet removeObject:](v11, "removeObject:", v14);

    id v15 = -[NSMutableSet count](v4->_activeUSBInterfaces, "count");
    uint64_t v13 = v4->_connectivityState;
    if (v15) {
      goto LABEL_8;
    }
    v13 &= ~2uLL;
  }

  v4->_int64_t connectivityState = v13;
LABEL_8:
  objc_sync_exit(v4);

  if (v13 != connectivityState)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 postNotificationName:@"kAPUIConnectivityManagerNotification_ConnectivityStateChanged" object:v4];
  }
}

- (void)handleWiFiInterfaceChangedWithEventInfo:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  int64_t connectivityState = v4->_connectivityState;
  uint64_t v6 = kAPConnectivityHelperEventInfoKey_WiFiNetworkSSID;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:kAPConnectivityHelperEventInfoKey_WiFiNetworkSSID]);

  int64_t v8 = v4->_connectivityState;
  if (v7)
  {
    v4->_int64_t connectivityState = v8 | 1;
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v6]);
    currentNetworkSSID = v4->_currentNetworkSSID;
    v4->_currentNetworkSSID = (NSString *)v9;
  }

  else
  {
    unint64_t v11 = v8 & 0xFFFFFFFFFFFFFFFELL;
    currentNetworkSSID = v4->_currentNetworkSSID;
    v4->_int64_t connectivityState = v11;
    v4->_currentNetworkSSID = 0LL;
  }

  int64_t v12 = v4->_connectivityState;
  if (v12 != connectivityState)
  {
    if (dword_100016060 <= 50)
    {
      if (dword_100016060 == -1)
      {
        int64_t v12 = v4->_connectivityState;
      }

      LogPrintF( &dword_100016060,  "-[APUIConnectivityManager handleWiFiInterfaceChangedWithEventInfo:]",  33554482LL,  "[%{ptr}] previous state: %d, currentState: %d.",  v4,  connectivityState,  v12);
    }

- (void)startMonitoringWiFiInterfaceChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isListeningForWiFiInterfaceChange)
  {
    uint64_t v3 = APConnectivityHelperRegisterForEvent(obj->_connectivityHelper, obj, 3LL);
    if ((_DWORD)v3)
    {
      APSLogErrorAt(v3, "-[APUIConnectivityManager startMonitoringWiFiInterfaceChange]", 398LL, 0LL);
      v2 = obj;
    }

    else
    {
      v2 = obj;
      obj->_isListeningForWiFiInterfaceChange = 1;
    }
  }

  objc_sync_exit(v2);
}

- (void)stopMonitoringWiFiInterfaceChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isListeningForWiFiInterfaceChange)
  {
    uint64_t v3 = APConnectivityHelperDeregisterForEvent(obj->_connectivityHelper, obj, 3LL);
    if ((_DWORD)v3)
    {
      APSLogErrorAt(v3, "-[APUIConnectivityManager stopMonitoringWiFiInterfaceChange]", 415LL, 0LL);
      v2 = obj;
    }

    else
    {
      v2 = obj;
      obj->_isListeningForWiFiInterfaceChange = 0;
    }
  }

  objc_sync_exit(v2);
}

- (APUIConnectivityManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___APUIConnectivityManager;
  v2 = -[APUIConnectivityManager init](&v13, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    if (dword_100016060 <= 50)
    {
      if (dword_100016060 != -1
        || (v2 = (APUIConnectivityManager *)_LogCategory_Initialize(&dword_100016060, 33554482LL), (_DWORD)v2))
      {
        v2 = (APUIConnectivityManager *)LogPrintF( &dword_100016060,  "-[APUIConnectivityManager init]",  33554482LL,  "[%{ptr}] created.",  v3);
      }
    }

    SharedHelper = (OpaqueAPConnectivityHelper *)APConnectivityHelperGetSharedHelper(v2);
    v3->_connectivityHelper = SharedHelper;
    if (SharedHelper && (CFRetain(SharedHelper), (connectivityHelper = v3->_connectivityHelper) != 0LL))
    {
      uint64_t v6 = APConnectivityHelperRegisterEventHandler(connectivityHelper, v3, sub_100009164);
      if (!(_DWORD)v6)
      {
        -[APUIConnectivityManager _initWifiInterface](v3, "_initWifiInterface");
        dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
        int64_t v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
        dispatch_queue_t v9 = dispatch_queue_create("AirPlaySenderUIApp.networkObserverQueue", v8);
        monitorQueue = v3->_monitorQueue;
        v3->_monitorQueue = (OS_dispatch_queue *)v9;

LABEL_12:
        return v3;
      }

      uint64_t v11 = 474LL;
    }

    else
    {
      uint64_t v6 = 0LL;
      uint64_t v11 = 471LL;
    }

    APSLogErrorAt(v6, "-[APUIConnectivityManager init]", v11, 0LL);
    int64_t v8 = (dispatch_queue_attr_s *)v3;
    uint64_t v3 = 0LL;
    goto LABEL_12;
  }

  return v3;
}

- (void)dealloc
{
  connectivityHelper = self->_connectivityHelper;
  if (connectivityHelper)
  {
    CFRelease(connectivityHelper);
    self->_connectivityHelper = 0LL;
  }

  -[APUIConnectivityManager _stopMonitoringWiFiEvents](self, "_stopMonitoringWiFiEvents");
  -[CWFInterface invalidate](self->_cwInterface, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APUIConnectivityManager;
  -[APUIConnectivityManager dealloc](&v4, "dealloc");
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000924C;
  block[3] = &unk_100010660;
  block[4] = a1;
  if (qword_1000161B0 != -1) {
    dispatch_once(&qword_1000161B0, block);
  }
  return (id)qword_1000161B8;
}

+ (BOOL)nwPathHasWiFiConnectivity:(id)a3
{
  uint64_t v3 = (nw_path *)a3;
  objc_super v4 = v3;
  BOOL v5 = v3 && nw_path_uses_interface_type(v3, nw_interface_type_wifi) && ((nw_path_get_status(v4) - 1) & 0xFFFFFFFD) == 0;

  return v5;
}

+ (BOOL)isCaptivePortalMitigationSupported
{
  return APSSettingsIsFeatureEnabled(@"SetupAssistantCaptivePortalMitigation") != 0;
}

+ (BOOL)shouldUpdateNetworkProfile
{
  unsigned __int8 v8 = 0;
  int BooleanIfPresent = APSSettingsGetBooleanIfPresent(@"disableBlueAtlasNetworkTagging", &v8);
  int v3 = v8;
  if (dword_100016060 <= 50)
  {
    int v4 = BooleanIfPresent;
    if (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL))
    {
      BOOL v5 = "no";
      if (v3) {
        uint64_t v6 = "no";
      }
      else {
        uint64_t v6 = "yes";
      }
      if (v4) {
        BOOL v5 = "yes";
      }
      LogPrintF( &dword_100016060,  "+[APUIConnectivityManager shouldUpdateNetworkProfile]",  33554482LL,  "Update network profile: %s from prefs: %s",  v6,  v5);
    }
  }

  return v3 == 0;
}

- (NSString)currentNetworkSSID
{
  return self->_currentNetworkSSID;
}

- (void).cxx_destruct
{
}

@end