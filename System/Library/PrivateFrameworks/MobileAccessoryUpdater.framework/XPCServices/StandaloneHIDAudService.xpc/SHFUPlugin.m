@interface SHFUPlugin
- (AUFileParser)personalizationParser;
- (BOOL)abortRegistryEntryID:(id)a3;
- (BOOL)bluetoothPoweredOn;
- (BOOL)deviceNeedsUpdate:(id)a3;
- (BOOL)hostBatteryOnACPower;
- (BOOL)hostConnectedToNetwork;
- (BOOL)reconnectDeviceToHost;
- (BTSessionImpl)btSession;
- (CBCentralManager)centralManager;
- (FudPluginDelegate)delegate;
- (NSArray)equivalentPIDs;
- (NSDictionary)hostPowerSource;
- (NSDictionary)options;
- (NSError)error;
- (NSMutableDictionary)latestFirmwareVersions;
- (NSMutableDictionary)parsers;
- (NSMutableDictionary)pluginInfo;
- (NSNumber)STFWFirst;
- (NSNumber)abortUpdate;
- (NSNumber)allowDowngrade;
- (NSNumber)batteryCheckDevice;
- (NSNumber)batteryCheckHost;
- (NSNumber)bootstrapDelay;
- (NSNumber)btReconnectDelay;
- (NSNumber)compatibilityVersion;
- (NSNumber)deviceNeedsBTReconnect;
- (NSNumber)featureReportDelay;
- (NSNumber)inactivityDelay;
- (NSNumber)inactivityDelayPreflight;
- (NSNumber)manifestCount;
- (NSNumber)minBatteryDevice;
- (NSNumber)minBatteryHost;
- (NSNumber)networkDelay;
- (NSNumber)productID;
- (NSNumber)resetEveryFWPayload;
- (NSNumber)sendSDPQueryNotification;
- (NSNumber)vendorID;
- (NSNumber)versionCheckDelay;
- (NSString)btAddress;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)errorDomain;
- (NSString)loggingIdentifier;
- (NSString)mobileAssetType;
- (NSString)targetDevice;
- (NSURL)firmwareDirectory;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_semaphore)btSessionSemaphore;
- (OS_dispatch_semaphore)matchSemaphore;
- (OS_dispatch_semaphore)personalizationSemaphore;
- (OS_dispatch_semaphore)sleepSemaphore;
- (OS_dispatch_source)batteryTimer;
- (OS_dispatch_source)delayBootstrapSource;
- (OS_dispatch_source)networkStatus;
- (OS_dispatch_source)userInactivityStatus;
- (OS_os_log)logHandle;
- (OS_os_transaction)transaction;
- (SHFUPlugin)init;
- (SHFUPlugin)initWithCoder:(id)a3;
- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7;
- (TVPSSuppressRemoteConnectivityHUDAssertion)remoteHUDAssertion;
- (__SCNetworkReachability)networkReachability;
- (id)getParsersForHWRevID:(id)a3;
- (id)getPreloadedFWVersions:(id *)a3;
- (id)sendPersonalizedFirmwareToDevice;
- (id)verifyDeviceBattery;
- (id)verifyLatestFWVersions;
- (int)batteryToken;
- (int)hostBatteryCapacity;
- (unint64_t)getTotalPrepareBytes:(id)a3;
- (unint64_t)pmNotificationHandle;
- (unsigned)powerAssertionID;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)btSessionArrived;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkNetworkReachability:(unsigned int)a3;
- (void)clearNotification;
- (void)clearOldRegistryEntryIDs;
- (void)commitFirmwareWithOptions:(id)a3;
- (void)createPowerAssertion;
- (void)dealloc;
- (void)delayBootstrap;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeNextBootstrapAction;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)logIORegistryEntry:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)registerForMatchNotification;
- (void)releasePowerAssertion;
- (void)sendFirmwareToDeviceWithOptions:(id)a3;
- (void)sendPersonalizedManifestsToDevice;
- (void)setBatteryTimer:(id)a3;
- (void)setBatteryToken:(int)a3;
- (void)setBluetoothPoweredOn:(BOOL)a3;
- (void)setBtAddress:(id)a3;
- (void)setBtSession:(BTSessionImpl *)a3;
- (void)setBtSessionSemaphore:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setDelayBootstrapSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setFirmwareDirectory:(id)a3;
- (void)setHostPowerSource:(id)a3;
- (void)setLatestFirmwareVersions:(id)a3;
- (void)setMatchSemaphore:(id)a3;
- (void)setNetworkReachability:(__SCNetworkReachability *)a3;
- (void)setNetworkStatus:(id)a3;
- (void)setParsers:(id)a3;
- (void)setPersonalizationParser:(id)a3;
- (void)setPersonalizationSemaphore:(id)a3;
- (void)setPmNotificationHandle:(unint64_t)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setRemoteHUDAssertion:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSleepSemaphore:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUserInactivityStatus:(id)a3;
- (void)setupBTSession;
- (void)storeRegistryEntryID:(id)a3;
- (void)tagForBluetoothGATTServicesDiscovery;
- (void)verifyHostBattery;
- (void)waitForBTSession;
- (void)waitForDeviceEnumerationWithProgressUpdates:(BOOL)a3;
- (void)waitForNetwork;
- (void)waitForUserInactivity:(int)a3 withOptions:(id)a4;
@end

@implementation SHFUPlugin

- (void)clearNotification
{
  io_object_t notificationIter = self->_notificationIter;
  if (notificationIter)
  {
    IOObjectRelease(notificationIter);
    self->_io_object_t notificationIter = 0;
  }

  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0LL;
  }

- (void)registerForMatchNotification
{
  v3 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_notificationPort = v3;
  if (!v3) {
    return;
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  -[SHFUPlugin setMatchSemaphore:](self, "setMatchSemaphore:", v4);

  notificationPort = self->_notificationPort;
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
  IONotificationPortSetDispatchQueue(notificationPort, v6);

  CFMutableDictionaryRef v7 = IOServiceMatching("IOHIDDevice");
  CFDictionaryRef matching = (CFDictionaryRef)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin vendorID](self, "vendorID"));
  -[__CFDictionary setObject:forKeyedSubscript:](matching, "setObject:forKeyedSubscript:", v8, @"VendorID");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
  -[__CFDictionary setObject:forKeyedSubscript:](matching, "setObject:forKeyedSubscript:", v9, @"ProductID");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
  int v11 = [v10 intValue];

  if (v11 > 612)
  {
    if (((v11 - 613) > 0x3A || ((1LL << (v11 - 101)) & 0x4A06000001F01FFLL) == 0)
      && v11 != 786)
    {
      goto LABEL_15;
    }

- (void)encodeWithCoder:(id)a3
{
}

- (SHFUPlugin)initWithCoder:(id)a3
{
  return -[SHFUPlugin initWithDeviceClass:delegate:info:options:deviceProperties:]( self,  "initWithDeviceClass:delegate:info:options:deviceProperties:",  &stru_100024A50,  0LL,  0LL,  0LL,  0LL);
}

- (SHFUPlugin)init
{
  return -[SHFUPlugin initWithDeviceClass:delegate:info:options:deviceProperties:]( self,  "initWithDeviceClass:delegate:info:options:deviceProperties:",  &stru_100024A50,  0LL,  0LL,  0LL,  0LL);
}

- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  return -[SHFUPlugin initWithDeviceClass:delegate:info:options:deviceProperties:]( self,  "initWithDeviceClass:delegate:info:options:deviceProperties:",  &stru_100024A50,  0LL,  0LL,  0LL,  0LL);
}

- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"Policy"]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"MatchingDictionary"]);
  v18 = (void *)v17;
  v19 = 0LL;
  if (v15 && v16 && v17)
  {
    v131.receiver = self;
    v131.super_class = (Class)&OBJC_CLASS___SHFUPlugin;
    v20 = -[SHFUPlugin init](&v131, "init");
    if (v20)
    {
      v128 = a5;
      dispatch_queue_t v21 = dispatch_queue_create("com.apple.StandaloneHIDFudPlugins.SHFUPlugin", 0LL);
      serialQueue = v20->_serialQueue;
      v20->_serialQueue = (OS_dispatch_queue *)v21;

      v20->_powerAssertionID = 0;
      v20->_io_object_t notificationIter = 0;
      v20->_notificationPort = 0LL;
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"MobileAssetType"]);
      mobileAssetType = v20->_mobileAssetType;
      v20->_mobileAssetType = (NSString *)v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"VendorID"]);
      vendorID = v20->_vendorID;
      v20->_vendorID = (NSNumber *)v25;

      uint64_t v27 = objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"ProductID"]);
      productID = v20->_productID;
      v20->_productID = (NSNumber *)v27;

      uint64_t v29 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"EquivalentPIDs"]);
      equivalentPIDs = v20->_equivalentPIDs;
      v20->_equivalentPIDs = (NSArray *)v29;

      uint64_t v31 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"VersionCheckDelay"]);
      versionCheckDelay = v20->_versionCheckDelay;
      v20->_versionCheckDelay = (NSNumber *)v31;

      id v130 = v12;
      v33 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", v12);
      deviceClass = v20->_deviceClass;
      v20->_deviceClass = v33;

      v35 = -[NSDictionary initWithDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithDictionary:", v14);
      options = v20->_options;
      v20->_options = v35;

      v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      pluginInfo = v20->_pluginInfo;
      v20->_pluginInfo = v37;

      id v129 = v13;
      objc_storeWeak((id *)&v20->_delegate, v13);
      v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      parsers = v20->_parsers;
      v20->_parsers = v39;

      v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      latestFirmwareVersions = v20->_latestFirmwareVersions;
      v20->_latestFirmwareVersions = v41;

      v43 = objc_alloc(&OBJC_CLASS___NSURL);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"FirmwareDirectory"]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 stringByStandardizingPath]);
      v46 = -[NSURL initFileURLWithPath:isDirectory:](v43, "initFileURLWithPath:isDirectory:", v45, 1LL);
      firmwareDirectory = v20->_firmwareDirectory;
      v20->_firmwareDirectory = v46;

      uint64_t v48 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"InactivityDelayPreflight"]);
      inactivityDelayPreflight = v20->_inactivityDelayPreflight;
      v20->_inactivityDelayPreflight = (NSNumber *)v48;

      uint64_t v50 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"AllowDowngrade"]);
      allowDowngrade = v20->_allowDowngrade;
      v20->_allowDowngrade = (NSNumber *)v50;

      uint64_t v52 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"BootstrapDelay"]);
      bootstrapDelay = v20->_bootstrapDelay;
      v20->_bootstrapDelay = (NSNumber *)v52;

      uint64_t v54 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"InactivityDelay"]);
      inactivityDelay = v20->_inactivityDelay;
      v20->_inactivityDelay = (NSNumber *)v54;

      uint64_t v56 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"NetworkDelay"]);
      networkDelay = v20->_networkDelay;
      v20->_networkDelay = (NSNumber *)v56;

      uint64_t v58 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"FeatureReportDelay"]);
      featureReportDelay = v20->_featureReportDelay;
      v20->_featureReportDelay = (NSNumber *)v58;

      uint64_t v60 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"LoggingIdentifier"]);
      loggingIdentifier = v20->_loggingIdentifier;
      v20->_loggingIdentifier = (NSString *)v60;

      uint64_t v62 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"CompatibilityVersion"]);
      compatibilityVersion = v20->_compatibilityVersion;
      v20->_compatibilityVersion = (NSNumber *)v62;

      uint64_t v64 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"BatteryCheckHost"]);
      batteryCheckHost = v20->_batteryCheckHost;
      v20->_batteryCheckHost = (NSNumber *)v64;

      uint64_t v66 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"BatteryCheckDevice"]);
      batteryCheckDevice = v20->_batteryCheckDevice;
      v20->_batteryCheckDevice = (NSNumber *)v66;

      uint64_t v68 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"MinBatteryHost"]);
      minBatteryHost = v20->_minBatteryHost;
      v20->_minBatteryHost = (NSNumber *)v68;

      uint64_t v70 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"MinBatteryDevice"]);
      minBatteryDevice = v20->_minBatteryDevice;
      v20->_minBatteryDevice = (NSNumber *)v70;

      uint64_t v72 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"STFWFirst"]);
      STFWFirst = v20->_STFWFirst;
      v20->_STFWFirst = (NSNumber *)v72;

      uint64_t v74 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"ResetEveryFWPayload"]);
      resetEveryFWPayload = v20->_resetEveryFWPayload;
      v20->_resetEveryFWPayload = (NSNumber *)v74;

      uint64_t v76 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"NeedsBluetoothReconnect"]);
      deviceNeedsBTReconnect = v20->_deviceNeedsBTReconnect;
      v20->_deviceNeedsBTReconnect = (NSNumber *)v76;

      uint64_t v78 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"SendSDPQueryNotification"]);
      sendSDPQueryNotification = v20->_sendSDPQueryNotification;
      v20->_sendSDPQueryNotification = (NSNumber *)v78;

      uint64_t v80 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"BluetoothReconnectDelay"]);
      btReconnectDelay = v20->_btReconnectDelay;
      v20->_btReconnectDelay = (NSNumber *)v80;

      btAddress = v20->_btAddress;
      v20->_btAddress = (NSString *)&stru_100024A50;

      targetDevice = v20->_targetDevice;
      v20->_targetDevice = (NSString *)&stru_100024A50;

      v20->_pmNotificationHandle = 0LL;
      uint64_t v84 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"FeatureReportDelay"]);
      v85 = v20->_featureReportDelay;
      v20->_featureReportDelay = (NSNumber *)v84;

      uint64_t v86 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"ManifestCount"]);
      manifestCount = v20->_manifestCount;
      v20->_manifestCount = (NSNumber *)v86;

      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      v89 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"FeatureReportDelay"]);

      if (v89)
      {
        [v88 doubleForKey:@"FeatureReportDelay"];
        uint64_t v90 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        v91 = v20->_featureReportDelay;
        v20->_featureReportDelay = (NSNumber *)v90;
      }

      v92 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"BootstrapDelay"]);

      if (v92)
      {
        [v88 doubleForKey:@"BootstrapDelay"];
        uint64_t v93 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        v94 = v20->_bootstrapDelay;
        v20->_bootstrapDelay = (NSNumber *)v93;
      }

      v95 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"InactivityDelay"]);

      if (v95)
      {
        uint64_t v96 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v88 integerForKey:@"InactivityDelay"]));
        v97 = v20->_inactivityDelay;
        v20->_inactivityDelay = (NSNumber *)v96;
      }

      v98 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"NetworkDelay"]);

      if (v98)
      {
        uint64_t v99 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v88 integerForKey:@"NetworkDelay"]));
        v100 = v20->_networkDelay;
        v20->_networkDelay = (NSNumber *)v99;
      }

      v101 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"MinBatteryHost"]);

      if (v101)
      {
        uint64_t v102 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v88 integerForKey:@"MinBatteryHost"]));
        v103 = v20->_minBatteryHost;
        v20->_minBatteryHost = (NSNumber *)v102;
      }

      v104 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"MinBatteryDevice"]);

      if (v104)
      {
        uint64_t v105 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v88 integerForKey:@"MinBatteryDevice"]));
        v106 = v20->_minBatteryDevice;
        v20->_minBatteryDevice = (NSNumber *)v105;
      }

      v107 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"ManifestCount"]);

      if (v107)
      {
        uint64_t v108 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v88 integerForKey:@"ManifestCount"]));
        v109 = v20->_manifestCount;
        v20->_manifestCount = (NSNumber *)v108;
      }

      abortUpdate = v20->_abortUpdate;
      v20->_abortUpdate = (NSNumber *)&__kCFBooleanFalse;

      v111 = (void *)objc_claimAutoreleasedReturnValue([v88 stringForKey:@"TargetDevice"]);
      if (v111)
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v20->_firmwareDirectory, "path"));
        unsigned int v113 = [v112 hasSuffix:v111];

        if (v113)
        {
          v114 = v111;
          v115 = (NSNumber *)v20->_targetDevice;
          v20->_targetDevice = v114;
        }

        else
        {
          v116 = v20->_targetDevice;
          v20->_targetDevice = (NSString *)@"notTargetedDevice";

          v115 = v20->_abortUpdate;
          v20->_abortUpdate = (NSNumber *)&__kCFBooleanTrue;
        }
      }

      v117 = (void *)objc_claimAutoreleasedReturnValue([v88 stringForKey:@"FirmwareDirectory"]);
      if (v117)
      {
        v118 = objc_alloc(&OBJC_CLASS___NSURL);
        v119 = (void *)objc_claimAutoreleasedReturnValue([v117 stringByStandardizingPath]);
        v120 = -[NSURL initFileURLWithPath:isDirectory:](v118, "initFileURLWithPath:isDirectory:", v119, 1LL);
        v121 = v20->_firmwareDirectory;
        v20->_firmwareDirectory = v120;
      }

      os_log_t v122 = os_log_create( "com.apple.StandaloneHIDFudPlugins",  -[NSString UTF8String](v20->_loggingIdentifier, "UTF8String"));
      logHandle = v20->_logHandle;
      v20->_logHandle = v122;

      uint64_t v124 = os_transaction_create("com.apple.StandaloneHIDFudPlugins");
      transaction = v20->_transaction;
      v20->_transaction = (OS_os_transaction *)v124;

      v126 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"DeviceClassName"]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20->_pluginInfo,  "setObject:forKeyedSubscript:",  v126,  @"DeviceClassName");

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20->_pluginInfo,  "setObject:forKeyedSubscript:",  &off_100026BF0,  @"PrepareWeight");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20->_pluginInfo,  "setObject:forKeyedSubscript:",  &off_100026C00,  @"ApplyWeight");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20->_pluginInfo,  "setObject:forKeyedSubscript:",  &off_100026C10,  @"FinishWeight");
      id *v128 = v20->_pluginInfo;

      id v13 = v129;
      id v12 = v130;
    }

    self = v20;
    v19 = self;
  }

  return v19;
}

- (NSString)errorDomain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin loggingIdentifier](self, "loggingIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.MobileAccessoryUpdater.StandaloneHIDFudPlugins",  v2));

  return (NSString *)v3;
}

- (void)dealloc
{
  if (os_log_type_enabled(self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100016A80();
  }
  io_object_t notificationIter = self->_notificationIter;
  if (notificationIter)
  {
    IOObjectRelease(notificationIter);
    self->_io_object_t notificationIter = 0;
  }

  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0LL;
  }

  networkReachability = self->_networkReachability;
  if (networkReachability)
  {
    SCNetworkReachabilitySetCallback(networkReachability, 0LL, 0LL);
    SCNetworkReachabilitySetDispatchQueue(self->_networkReachability, 0LL);
    CFRelease(self->_networkReachability);
    self->_networkReachability = 0LL;
  }

  networkStatus = self->_networkStatus;
  if (networkStatus)
  {
    dispatch_source_cancel((dispatch_source_t)networkStatus);
    CFMutableDictionaryRef v7 = self->_networkStatus;
    self->_networkStatus = 0LL;
  }

  userInactivityStatus = self->_userInactivityStatus;
  if (userInactivityStatus)
  {
    dispatch_source_cancel((dispatch_source_t)userInactivityStatus);
    v9 = self->_userInactivityStatus;
    self->_userInactivityStatus = 0LL;
  }

  if (self->_pmNotificationHandle)
  {
    IOPMUnregisterNotification();
    self->_pmNotificationHandle = 0LL;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SHFUPlugin;
  -[SHFUPlugin dealloc](&v10, "dealloc");
}

- (NSString)description
{
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin versionCheckDelay](self, "versionCheckDelay"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin inactivityDelayPreflight](self, "inactivityDelayPreflight"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin allowDowngrade](self, "allowDowngrade"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin bootstrapDelay](self, "bootstrapDelay"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin inactivityDelay](self, "inactivityDelay"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkDelay](self, "networkDelay"));
  dispatch_queue_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin featureReportDelay](self, "featureReportDelay"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin compatibilityVersion](self, "compatibilityVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckHost](self, "batteryCheckHost"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin minBatteryHost](self, "minBatteryHost"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin minBatteryDevice](self, "minBatteryDevice"));
  dispatch_semaphore_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin STFWFirst](self, "STFWFirst"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin resetEveryFWPayload](self, "resetEveryFWPayload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin deviceNeedsBTReconnect](self, "deviceNeedsBTReconnect"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin sendSDPQueryNotification](self, "sendSDPQueryNotification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin btReconnectDelay](self, "btReconnectDelay"));
  CFMutableDictionaryRef v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin abortUpdate](self, "abortUpdate"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"FW update policy: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@",  @"VersionCheckDelay",  v16,  @"InactivityDelayPreflight",  v23,  @"AllowDowngrade",  v15,  @"BootstrapDelay",  v22,  @"InactivityDelay",  v14,  @"NetworkDelay",  v13,  @"FeatureReportDelay",  v21,  @"CompatibilityVersion",  v20,  @"BatteryCheckHost",  v19,  @"BatteryCheckDevice",  v18,  @"MinBatteryHost",  v3,  @"MinBatteryDevice",  v12,  @"STFWFirst",  v4,  @"ResetEveryFWPayload",  v11,  @"NeedsBluetoothReconnect",  v5,  @"SendSDPQueryNotification",  v10,  @"BluetoothReconnectDelay",  v6,  @"TargetDevice",  v7,  @"AbortUpdate",  v8));

  return (NSString *)v17;
}

- (void)logIORegistryEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      CFMutableDictionaryRef v7 = IORegistryEntryIDMatching((uint64_t)[v4 unsignedLongLongValue]);
      io_iterator_t existing = 0;
      if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v7, &existing))
      {
        io_object_t v8 = IOIteratorNext(existing);
        if (v8)
        {
          io_registry_entry_t v9 = v8;
          do
          {
            CFMutableDictionaryRef properties = 0LL;
            Default = CFAllocatorGetDefault();
            if (!IORegistryEntryCreateCFProperties(v9, &properties, Default, 0))
            {
              CFMutableDictionaryRef v11 = properties;
              if (properties)
              {
                -[__CFDictionary removeObjectForKey:](properties, "removeObjectForKey:", @"Elements");
                id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                {
                  id v13 = [v4 unsignedLongLongValue];
                  *(_DWORD *)buf = 134218242;
                  id v17 = v13;
                  __int16 v18 = 2112;
                  CFMutableDictionaryRef v19 = v11;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "IORegistryEntry ID 0x%016llX properties: %@",  buf,  0x16u);
                }
              }
            }

            IOObjectRelease(v9);
            io_registry_entry_t v9 = IOIteratorNext(existing);
          }

          while (v9);
        }

        IOObjectRelease(existing);
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016AAC();
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (BOOL)hostBatteryOnACPower
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin hostPowerSource](self, "hostPowerSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Power Source State"]);

  LOBYTE(v2) = [v3 isEqualToString:@"AC Power"];
  return (char)v2;
}

- (int)hostBatteryCapacity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin hostPowerSource](self, "hostPowerSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Current Capacity"]);

  LODWORD(v2) = [v3 intValue];
  return (int)v2;
}

- (NSDictionary)hostPowerSource
{
  hostPowerSource = self->_hostPowerSource;
  if (!hostPowerSource)
  {
    id v4 = (const void *)IOPSCopyPowerSourcesByType(1LL, a2);
    if (v4)
    {
      v5 = v4;
      BOOL v6 = IOPSCopyPowerSourcesList(v4);
      if (v6)
      {
        CFMutableDictionaryRef v7 = v6;
        CFIndex Count = CFArrayGetCount(v6);
        if (Count >= 1)
        {
          CFIndex v9 = Count;
          for (CFIndex i = 0LL; i != v9; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
            if (ValueAtIndex)
            {
              CFDictionaryRef v12 = IOPSGetPowerSourceDescription(v5, ValueAtIndex);
              if (v12)
              {
                id v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v12));
                id v14 = self->_hostPowerSource;
                self->_hostPowerSource = v13;
              }
            }
          }
        }

        CFRelease(v7);
      }

      CFRelease(v5);
    }

    hostPowerSource = self->_hostPowerSource;
  }

  return hostPowerSource;
}

- (void)verifyHostBattery
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckHost](self, "batteryCheckHost"));
  if (([v3 BOOLValue] & 1) == 0)
  {

    goto LABEL_13;
  }

  signed int v4 = -[SHFUPlugin hostBatteryCapacity](self, "hostBatteryCapacity");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin minBatteryHost](self, "minBatteryHost"));
  signed int v6 = [v5 intValue];

  if (v4 >= v6)
  {
LABEL_13:
    -[SHFUPlugin executeNextBootstrapAction](self, "executeNextBootstrapAction");
    return;
  }

  CFMutableDictionaryRef v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = -[SHFUPlugin hostBatteryCapacity](self, "hostBatteryCapacity");
    CFIndex v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin minBatteryHost](self, "minBatteryHost"));
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v40 = v8;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = [v9 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Host battery %d%% is below minimum %d%%",  buf,  0xEu);
  }

  objc_initWeak(&location, self);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100005A04;
  v36[3] = &unk_1000245F0;
  objc_copyWeak(&v37, &location);
  v36[4] = self;
  objc_super v10 = objc_retainBlock(v36);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100005B4C;
  v34[3] = &unk_100024618;
  objc_copyWeak(&v35, &location);
  CFMutableDictionaryRef v11 = objc_retainBlock(v34);
  if (-[SHFUPlugin hostBatteryOnACPower](self, "hostBatteryOnACPower"))
  {
    CFDictionaryRef v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v40 = 3600LL;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Host battery on AC power. Wait %llu seconds for battery level to reach minimum.",  buf,  0xCu);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100005BE4;
    v30[3] = &unk_100024640;
    objc_copyWeak(&v33, &location);
    id v13 = v11;
    id v31 = v13;
    id v14 = v10;
    id v32 = v14;
    id v15 = objc_retainBlock(v30);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
    dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v16);
    -[SHFUPlugin setBatteryTimer:](self, "setBatteryTimer:", v17);

    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryTimer](self, "batteryTimer"));
    if (v18)
    {
      CFMutableDictionaryRef v19 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryTimer](self, "batteryTimer"));
      dispatch_time_t v20 = dispatch_time(0LL, 3600000000000LL);
      dispatch_source_set_timer(v19, v20, 0x34630B8A000uLL, 0x12A05F200uLL);

      dispatch_queue_t v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryTimer](self, "batteryTimer"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100005D44;
      handler[3] = &unk_100024668;
      objc_copyWeak(&v29, &location);
      v26 = v15;
      uint64_t v27 = v13;
      v28 = v14;
      dispatch_source_set_event_handler(v21, handler);

      v22 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryTimer](self, "batteryTimer"));
      dispatch_activate(v22);

      objc_destroyWeak(&v29);
    }

    uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
    uint32_t v24 = notify_register_dispatch("com.apple.system.powersources.percent", &self->_batteryToken, v23, v15);

    if (v24)
    {
      v13[2](v13);
      v14[2](v14);
    }

    else
    {
      ((void (*)(void *, void))v15[2])(v15, -[SHFUPlugin batteryToken](self, "batteryToken"));
    }

    objc_destroyWeak(&v33);
  }

  else
  {
    ((void (*)(void *))v10[2])(v10);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (id)verifyDeviceBattery
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  unsigned int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0LL;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  signed int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  id v7 = [v6 BOOLValue];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  CFIndex v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin options](self, "options"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
  CFMutableDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  id v40 = 0LL;
  CFDictionaryRef v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v5,  v7,  v8,  v10,  v11,  &v40));
  id v13 = v40;

  if (v13) {
    goto LABEL_21;
  }
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (!v15)
  {
    id v13 = v14;
    goto LABEL_20;
  }

  id v16 = v15;
  id v33 = v12;
  id v13 = 0LL;
  char v34 = 0;
  uint64_t v17 = *(void *)v37;
  id obj = v14;
  do
  {
    for (CFIndex i = 0LL; i != v16; CFIndex i = (char *)i + 1)
    {
      if (*(void *)v37 != v17) {
        objc_enumerationMutation(obj);
      }
      CFMutableDictionaryRef v19 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
      dispatch_time_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 powerSource]);

      if (!v20)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No power source for device %@",  v19));
        v30 = objc_alloc(&OBJC_CLASS___NSError);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        v44 = v26;
        uint64_t v31 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
        id v29 = -[NSError initWithDomain:code:userInfo:](v30, "initWithDomain:code:userInfo:", v28, 58LL, v31);

        id v13 = (id)v31;
        goto LABEL_12;
      }

      signed int v21 = [v19 batteryCapacity];
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin minBatteryDevice](self, "minBatteryDevice"));
      signed int v23 = [v22 intValue];

      if (v21 < v23)
      {
        id v24 = [v19 batteryCapacity];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin minBatteryDevice](self, "minBatteryDevice"));
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Low battery %d%% below minimum %d%% for device %@",  v24,  [v25 intValue],  v19));

        uint64_t v27 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        v42 = v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
        id v29 = -[NSError initWithDomain:code:userInfo:]( v27,  "initWithDomain:code:userInfo:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain",  -1LL,  v28);
LABEL_12:

        id v13 = v29;
        continue;
      }

      char v34 = 1;
    }

    id v16 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  }

  while (v16);

  CFDictionaryRef v12 = v33;
  if ((v34 & 1) != 0)
  {
LABEL_20:

    id v13 = 0LL;
  }

- (void)btSessionArrived
{
  v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin btSessionSemaphore](self, "btSessionSemaphore"));
  dispatch_semaphore_signal(v2);
}

- (void)setupBTSession
{
  signed int v6 = sub_10000626C;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
  int v4 = BTSessionAttachWithQueue("com.apple.StandaloneHIDFudPlugins", &v6, self, v3);

  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100016B0C();
    }
  }

- (void)waitForBTSession
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  -[SHFUPlugin setBtSessionSemaphore:](self, "setBtSessionSemaphore:", v3);

  -[SHFUPlugin setupBTSession](self, "setupBTSession");
  dispatch_time_t v4 = dispatch_time(0LL, 10000000000LL);
  v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin btSessionSemaphore](self, "btSessionSemaphore"));
  uint64_t v6 = dispatch_semaphore_wait(v5, v4);

  if (v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100016B6C();
    }
  }

- (BOOL)reconnectDeviceToHost
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin deviceNeedsBTReconnect](self, "deviceNeedsBTReconnect"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin btAddress](self, "btAddress"));
  BOOL v5 = [v4 length] == 0;

  if (!v5)
  {
    if (-[SHFUPlugin btSession](self, "btSession"))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin btReconnectDelay](self, "btReconnectDelay"));
      [v6 doubleValue];
      dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));

      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v18 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reconnect device at %@", buf, 0xCu);
      }

      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin btReconnectDelay](self, "btReconnectDelay"));
      [v8 doubleValue];
      dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(v9 * 1000000000.0));
      CFMutableDictionaryRef v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1000065B4;
      v14[3] = &unk_100024618;
      objc_copyWeak(&v15, &location);
      dispatch_after(v10, v11, v14);

      objc_destroyWeak(&v15);
      BOOL v12 = 1;
      goto LABEL_11;
    }

    dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
      sub_100016B98();
    }
LABEL_10:
    BOOL v12 = 0;
LABEL_11:

    goto LABEL_12;
  }

  BOOL v12 = 0;
LABEL_12:
  objc_destroyWeak(&location);
  return v12;
}

- (void)delayBootstrap
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin bootstrapDelay](self, "bootstrapDelay"));
  int v4 = [v3 intValue];

  if (v4 < 1)
  {
    -[SHFUPlugin executeNextBootstrapAction](self, "executeNextBootstrapAction");
  }

  else
  {
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);
    -[SHFUPlugin setDelayBootstrapSource:](self, "setDelayBootstrapSource:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delayBootstrapSource](self, "delayBootstrapSource"));
    if (v7)
    {
      unsigned int v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delayBootstrapSource](self, "delayBootstrapSource"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin bootstrapDelay](self, "bootstrapDelay"));
      dispatch_time_t v10 = dispatch_time(0, 1000000000 * (int)[v9 intValue]);
      CFMutableDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin bootstrapDelay](self, "bootstrapDelay"));
      dispatch_source_set_timer(v8, v10, 1000000000 * (int)[v11 intValue], 0xEE6B280uLL);

      objc_initWeak(&location, self);
      BOOL v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delayBootstrapSource](self, "delayBootstrapSource"));
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      CFMutableDictionaryRef v19 = sub_1000069A8;
      dispatch_time_t v20 = &unk_100024618;
      objc_copyWeak(&v21, &location);
      dispatch_source_set_event_handler(v12, &v17);

      id v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delayBootstrapSource](self, "delayBootstrapSource", v17, v18, v19, v20));
      dispatch_activate(v13);

      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin bootstrapDelay](self, "bootstrapDelay"));
        unsigned int v16 = [v15 intValue];
        *(_DWORD *)buf = 67109120;
        unsigned int v24 = v16;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Delay bootstrap for %d seconds",  buf,  8u);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

- (BOOL)hostConnectedToNetwork
{
  sockaddr address = (sockaddr)xmmword_1000224F0;
  dispatch_semaphore_t v3 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  if (v3)
  {
    int v4 = v3;
    SCNetworkReachabilityFlags v9 = 0;
    if (SCNetworkReachabilityGetFlags(v3, &v9)) {
      SCNetworkReachabilityFlags v5 = (v9 >> 1) & 1;
    }
    else {
      SCNetworkReachabilityFlags v5 = 0;
    }
    CFRelease(v4);
  }

  else
  {
    SCNetworkReachabilityFlags v5 = 0;
  }

  dispatch_source_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = "NOT ";
    if (v5) {
      id v7 = "";
    }
    SCNetworkReachabilityFlags v9 = 136315138;
    dispatch_time_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%sconnected to the network", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (void)checkNetworkReachability:(unsigned int)a3
{
  char v3 = a3;
  SCNetworkReachabilityFlags v5 = -[SHFUPlugin networkReachability](self, "networkReachability");
  if ((v3 & 2) != 0 && v5)
  {
    dispatch_source_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Network connection established",  (uint8_t *)buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkStatus](self, "networkStatus"));
    if (v7)
    {
      unsigned int v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkStatus](self, "networkStatus"));
      dispatch_source_cancel(v8);

      -[SHFUPlugin setNetworkStatus:](self, "setNetworkStatus:", 0LL);
    }

    SCNetworkReachabilitySetCallback(-[SHFUPlugin networkReachability](self, "networkReachability"), 0LL, 0LL);
    SCNetworkReachabilitySetDispatchQueue(-[SHFUPlugin networkReachability](self, "networkReachability"), 0LL);
    CFRelease(-[SHFUPlugin networkReachability](self, "networkReachability"));
    -[SHFUPlugin setNetworkReachability:](self, "setNetworkReachability:", 0LL);
    objc_initWeak(buf, self);
    dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
    dispatch_time_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006CF8;
    block[3] = &unk_100024618;
    objc_copyWeak(&v12, buf);
    dispatch_after(v9, v10, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }

- (void)waitForNetwork
{
  sockaddr address = (sockaddr)xmmword_1000224F0;
  -[SHFUPlugin setNetworkReachability:]( self,  "setNetworkReachability:",  SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address));
  if (-[SHFUPlugin networkReachability](self, "networkReachability"))
  {
    char v3 = -[SHFUPlugin networkReachability](self, "networkReachability");
    int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
    LODWORD(v3) = SCNetworkReachabilitySetDispatchQueue(v3, v4);

    if ((_DWORD)v3)
    {
      SCNetworkReachabilityFlags v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkDelay](self, "networkDelay"));
        LODWORD(buf.version) = 67109120;
        HIDWORD(buf.version) = [v6 intValue];
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Will wait %d seconds for a network connection",  (uint8_t *)&buf,  8u);
      }

      id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
      dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v7);
      -[SHFUPlugin setNetworkStatus:](self, "setNetworkStatus:", v8);

      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkStatus](self, "networkStatus"));
      if (v9)
      {
        dispatch_time_t v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkStatus](self, "networkStatus"));
        CFMutableDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkDelay](self, "networkDelay"));
        dispatch_time_t v12 = dispatch_time(0, 1000000000 * (int)[v11 intValue]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkDelay](self, "networkDelay"));
        dispatch_source_set_timer(v10, v12, 1000000000 * (int)[v13 intValue], 0x12A05F200uLL);

        objc_initWeak(&location, self);
        id v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkStatus](self, "networkStatus"));
        unsigned int v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472LL;
        uint64_t v18 = sub_100007020;
        CFMutableDictionaryRef v19 = &unk_100024618;
        objc_copyWeak(&v20, &location);
        dispatch_source_set_event_handler(v14, &v16);

        id v15 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin networkStatus](self, "networkStatus", v16, v17, v18, v19));
        dispatch_activate(v15);

        buf.version = 0LL;
        memset(&buf.retain, 0, 24);
        buf.info = self;
        SCNetworkReachabilitySetCallback( -[SHFUPlugin networkReachability](self, "networkReachability"),  (SCNetworkReachabilityCallBack)sub_100007180,  &buf);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
  }

- (void)executeNextBootstrapAction
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin error](self, "error"));

  if (v3)
  {
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      SCNetworkReachabilityFlags v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
      dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin error](self, "error"));
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      unsigned int v16 = v5;
      __int16 v17 = 1024;
      int v18 = 0;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "bootstrap: target device %@ successful %d error %@",  buf,  0x1Cu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
    dispatch_source_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin error](self, "error"));
    [v7 didBootstrap:0 info:v8 error:v9];

    -[SHFUPlugin setSerialQueue:](self, "setSerialQueue:", 0LL);
    -[SHFUPlugin setTransaction:](self, "setTransaction:", 0LL);
  }

  else if (-[NSMutableArray count](self->_bootstrapActions, "count"))
  {
    id v14 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_bootstrapActions,  "objectAtIndexedSubscript:",  0LL));
    -[NSMutableArray removeObjectAtIndex:](self->_bootstrapActions, "removeObjectAtIndex:", 0LL);
    v14[2]();
  }

  else
  {
    dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFMutableDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      int v18 = 1;
      __int16 v19 = 2112;
      id v20 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "bootstrap: target device %@ successful %d error %@",  buf,  0x1Cu);
    }

    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
    [v12 didBootstrap:1 info:v13 error:0];
  }

- (void)bootstrapWithOptions:(id)a3
{
  id v17 = a3;
  val = self;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100016D98();
  }

  objc_initWeak(&location, val);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100007898;
  v41[3] = &unk_100024618;
  objc_copyWeak(&v42, &location);
  uint64_t v25 = objc_retainBlock(v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100007A98;
  v39[3] = &unk_100024618;
  objc_copyWeak(&v40, &location);
  unsigned int v24 = objc_retainBlock(v39);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100007AC8;
  v37[3] = &unk_100024618;
  objc_copyWeak(&v38, &location);
  signed int v23 = objc_retainBlock(v37);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100007D40;
  v35[3] = &unk_100024618;
  objc_copyWeak(&v36, &location);
  v22 = objc_retainBlock(v35);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100007F8C;
  v33[3] = &unk_100024618;
  objc_copyWeak(&v34, &location);
  id v21 = objc_retainBlock(v33);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100007FBC;
  v31[3] = &unk_100024618;
  objc_copyWeak(&v32, &location);
  id v20 = objc_retainBlock(v31);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100008014;
  v29[3] = &unk_100024618;
  objc_copyWeak(&v30, &location);
  __int16 v19 = objc_retainBlock(v29);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000808C;
  v27[3] = &unk_100024618;
  objc_copyWeak(&v28, &location);
  int v18 = objc_retainBlock(v27);
  SCNetworkReachabilityFlags v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  dispatch_source_t v6 = objc_retainBlock(v25);
  v44[0] = v6;
  id v7 = objc_retainBlock(v24);
  v44[1] = v7;
  dispatch_source_t v8 = objc_retainBlock(v23);
  v44[2] = v8;
  dispatch_time_t v9 = objc_retainBlock(v22);
  v44[3] = v9;
  dispatch_time_t v10 = objc_retainBlock(v21);
  v44[4] = v10;
  CFMutableDictionaryRef v11 = objc_retainBlock(v20);
  v44[5] = v11;
  dispatch_time_t v12 = objc_retainBlock(v19);
  v44[6] = v12;
  id v13 = objc_retainBlock(v18);
  v44[7] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 8LL));
  id v15 = -[NSMutableArray initWithArray:](v5, "initWithArray:", v14);
  bootstrapActions = val->_bootstrapActions;
  val->_bootstrapActions = v15;

  -[SHFUPlugin executeNextBootstrapAction](val, "executeNextBootstrapAction");
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  SCNetworkReachabilityFlags v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016E24(v4);
  }

  if ([v4 state] == (id)5)
  {
    dispatch_source_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100016DF8();
    }

    -[SHFUPlugin setBluetoothPoweredOn:](self, "setBluetoothPoweredOn:", 1LL);
  }
}

- (void)tagForBluetoothGATTServicesDiscovery
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin centralManager](self, "centralManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 retrieveConnectedPeripheralsWithServices:0 allowAll:1]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&__int128 v7 = 138412546LL;
    __int128 v14 = v7;
    do
    {
      for (CFIndex i = 0LL; i != v8; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        CFMutableDictionaryRef v11 = *(__CFString **)(*((void *)&v15 + 1) + 8LL * (void)i);
        dispatch_time_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle", v14));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
          id v20 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Found Bluetooth peripheral %@",  buf,  0xCu);
        }

        if (-[__CFString hasTag:](v11, "hasTag:", @"BluetoothTVRemote"))
        {
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = v14;
            id v20 = @"BluetoothTVRemote";
            __int16 v21 = 2112;
            v22 = @"_FORCE_GATT_SERVICES_DISCOVERY_";
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Found Bluetooth peripheral with tag %@. Setting tag %@",  buf,  0x16u);
          }

          -[__CFString tag:](v11, "tag:", @"_FORCE_GATT_SERVICES_DISCOVERY_");
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v8);
  }
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
}

- (void)downloadFirmwareWithOptions:(id)a3
{
}

- (BOOL)deviceNeedsUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin latestFirmwareVersions](self, "latestFirmwareVersions"));
  unsigned int v6 = [v4 hardwareVersionSupportedBy:v5];

  if (!v6)
  {
    CFMutableDictionaryRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100016EA0();
    }
LABEL_7:

    goto LABEL_8;
  }

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin allowDowngrade](self, "allowDowngrade"));
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin latestFirmwareVersions](self, "latestFirmwareVersions"));
  if (!v8)
  {
    int v13 = [v4 firmwareVersionsOlderThan:v9];

    if ((v13 & 1) != 0) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }

  unsigned __int8 v10 = [v4 firmwareVersionsEqualTo:v9];

  if ((v10 & 1) != 0)
  {
LABEL_10:
    if (!+[SHFUDevice ignoreVersionCheck](&OBJC_CLASS___SHFUDevice, "ignoreVersionCheck"))
    {
      LOBYTE(v6) = 0;
      goto LABEL_8;
    }

    CFMutableDictionaryRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating firmware due to preference telling us to ignore the FW version check.",  v14,  2u);
    }

    goto LABEL_7;
  }

- (id)getParsersForHWRevID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin parsers](self, "parsers"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (!v6)
  {
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin parsers](self, "parsers"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_100026A38]);
  }

  return v6;
}

- (unint64_t)getTotalPrepareBytes:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (CFIndex i = 0LL; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (-[SHFUPlugin deviceNeedsUpdate:](self, "deviceNeedsUpdate:", v10)
          && [v10 hardwareVersion])
        {
          CFMutableDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v10 hardwareVersion]));
          dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin getParsersForHWRevID:](self, "getParsersForHWRevID:", v11));

          v7 += (unint64_t)[v10 getTotalFirmwareBytes:v12];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (void)createPowerAssertion
{
  IOReturn v3 = IOPMAssertionCreateWithName( @"PreventUserIdleSystemSleep",  0xFFu,  @"com.apple.StandaloneHIDFudPlugins.FirmwareUpdate",  &self->_powerAssertionID);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100016EF8();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_100016ECC();
  }
}

- (void)releasePowerAssertion
{
  if (-[SHFUPlugin powerAssertionID](self, "powerAssertionID"))
  {
    IOReturn v3 = IOPMAssertionRelease(-[SHFUPlugin powerAssertionID](self, "powerAssertionID"));
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100016F84();
      }
    }

    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      sub_100016F58();
    }

    -[SHFUPlugin setPowerAssertionID:](self, "setPowerAssertionID:", 0LL);
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  uint64_t v8 = NSStringFromSelector("systemAttentionState");
  CFMutableDictionaryRef v11 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v8);
  unsigned int v9 = objc_msgSend(v7, "isEqualToString:");

  if (v9)
  {
    id v10 = +[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState");

    if (v10 != (id)7) {
      return;
    }
    CFMutableDictionaryRef v11 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin sleepSemaphore](self, "sleepSemaphore"));
    dispatch_semaphore_signal(v11);
  }
}

- (void)waitForUserInactivity:(int)a3 withOptions:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v49 = 0LL;
  uint64_t v50 = (double *)&v49;
  uint64_t v51 = 0x2020000000LL;
  uint64_t v52 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100009140;
  v46[3] = &unk_100024690;
  uint64_t v48 = &v49;
  unsigned int v9 = v7;
  v47 = v9;
  [v8 sleepTimeoutWithCompletion:v46];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  double v10 = v50[3];
  CFMutableDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin vendorID](self, "vendorID"));
  if ([v11 unsignedIntValue] == 76)
  {
    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
    if ([v12 unsignedIntValue] == 788)
    {
      BOOL v13 = v10 > 0.0 && v50[3] <= 3600.0;
    }

    else
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *((void *)v50 + 3);
    *(_DWORD *)SCNetworkReachabilityContext buf = 134218240;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "sleep timeout %f, wait for sleep %d",  buf,  0x12u);
  }

  __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
  dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v17);
  -[SHFUPlugin setUserInactivityStatus:](self, "setUserInactivityStatus:", v18);

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin userInactivityStatus](self, "userInactivityStatus"));
  if (v19)
  {
    id v20 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin userInactivityStatus](self, "userInactivityStatus"));
    dispatch_time_t v21 = dispatch_time(0LL, 60000000000LL);
    dispatch_source_set_timer(v20, v21, 0xDF8475800uLL, 0x1DCD6500uLL);

    v22 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin userInactivityStatus](self, "userInactivityStatus"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100009154;
    handler[3] = &unk_1000246B8;
    objc_copyWeak(&v44, &location);
    BOOL v45 = v13;
    dispatch_source_set_event_handler(v22, handler);

    signed int v23 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin userInactivityStatus](self, "userInactivityStatus"));
    dispatch_activate(v23);

    objc_destroyWeak(&v44);
  }

  *(void *)SCNetworkReachabilityContext buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v55 = sub_100009204;
  uint64_t v56 = sub_10000922C;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100009234;
  v39[3] = &unk_1000246E0;
  objc_copyWeak(&v41, &location);
  int v42 = a3;
  id v24 = v6;
  id v40 = v24;
  v57 = objc_retainBlock(v39);
  if (v13)
  {
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0LL);
    -[SHFUPlugin setSleepSemaphore:](self, "setSleepSemaphore:", v25);

    v26 = NSStringFromSelector("systemAttentionState");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    +[PBSSystemStatus addObserver:forKeyPath:options:context:]( &OBJC_CLASS___PBSSystemStatus,  "addObserver:forKeyPath:options:context:",  self,  v27,  5LL,  0LL);

    id v28 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin sleepSemaphore](self, "sleepSemaphore"));
    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "User is inactive (host asleep)",  (uint8_t *)v36,  2u);
    }

    (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40LL) + 16LL))();
    id v30 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = 0LL;

    uint64_t v31 = NSStringFromSelector("systemAttentionState");
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    +[PBSSystemStatus removeObserver:forKeyPath:context:]( &OBJC_CLASS___PBSSystemStatus,  "removeObserver:forKeyPath:context:",  self,  v32,  0LL);
  }

  else
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100009450;
    v37[3] = &unk_100024708;
    objc_copyWeak(&v38, &location);
    void v37[4] = buf;
    id v33 = objc_retainBlock(v37);
    v36[0] = -1;
    id v34 = (const char *)[PBSSystemIdleStateDidChangeNotification UTF8String];
    id v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
    LODWORD(v34) = notify_register_dispatch(v34, v36, v35, v33);

    if (!(_DWORD)v34) {
      ((void (*)(void *, void))v33[2])(v33, v36[0]);
    }

    objc_destroyWeak(&v38);
  }

  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&v41);
  _Block_object_dispose(&v49, 8);
  objc_destroyWeak(&location);
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016D98();
  }

  -[SHFUPlugin createPowerAssertion](self, "createPowerAssertion");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin inactivityDelayPreflight](self, "inactivityDelayPreflight"));
  if (([v6 BOOLValue] & 1) == 0)
  {

    goto LABEL_7;
  }

  dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin inactivityDelay](self, "inactivityDelay"));
  int v8 = [v7 intValue];

  if (v8 < 1)
  {
LABEL_7:
    -[SHFUPlugin sendFirmwareToDeviceWithOptions:](self, "sendFirmwareToDeviceWithOptions:", v4);
    goto LABEL_8;
  }

  -[SHFUPlugin waitForUserInactivity:withOptions:](self, "waitForUserInactivity:withOptions:", 0LL, v4);
LABEL_8:
}

- (void)sendFirmwareToDeviceWithOptions:(id)a3
{
  id v65 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin firmwareDirectory](self, "firmwareDirectory"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
  dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin equivalentPIDs](self, "equivalentPIDs"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin STFWFirst](self, "STFWFirst"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin parsers](self, "parsers"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[AUFileParser loadParsersFromFWDirectory:logHandle:productID:equivalentPIDs:errorDomain:STFWFirst:parsers:]( &OBJC_CLASS___AUFileParser,  "loadParsersFromFWDirectory:logHandle:productID:equivalentPIDs:errorDomain:STFWFirst:parsers:",  v4,  v5,  v6,  v7,  v8,  v9,  v10));

  dispatch_time_t v12 = (void *)v11;
  if (v11)
  {
    id v13 = 0LL;
    __int128 v14 = self;
LABEL_5:
    -[SHFUPlugin setTransaction:](v14, "setTransaction:", 0LL);
    -[SHFUPlugin setSerialQueue:](v14, "setSerialQueue:", 0LL);
    id v24 = v12;
    -[SHFUPlugin setError:](v14, "setError:", v12);
    -[SHFUPlugin releasePowerAssertion](v14, "releasePowerAssertion");
    uint64_t v25 = 0LL;
    goto LABEL_6;
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  id v17 = [v16 BOOLValue];
  dispatch_source_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin options](self, "options"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
  dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  id v78 = 0LL;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v15,  v17,  v18,  v20,  v21,  &v78));
  id v23 = v78;

  dispatch_time_t v12 = v23;
  if (v23)
  {
    __int128 v14 = self;
    id v13 = v22;
    goto LABEL_5;
  }

  unint64_t v71 = -[SHFUPlugin getTotalPrepareBytes:](self, "getTotalPrepareBytes:", v22);
  *(void *)SCNetworkReachabilityContext buf = 0LL;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v13 = v22;
  id v30 = [v13 countByEnumeratingWithState:&v74 objects:v88 count:16];
  __int128 v14 = self;
  if (!v30)
  {

    dispatch_time_t v12 = 0LL;
    goto LABEL_5;
  }

  id v31 = v30;
  dispatch_time_t v12 = 0LL;
  char v67 = 0;
  uint64_t v32 = *(void *)v75;
  p_base_prots = &SHFUDevice__classData.base_prots;
  uint64_t v73 = *(void *)v75;
  id v66 = v13;
  do
  {
    id v34 = 0LL;
    id v72 = v31;
    do
    {
      if (*(void *)v75 != v32) {
        objc_enumerationMutation(v13);
      }
      id v35 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)v34);
      if (-[SHFUPlugin deviceNeedsUpdate:](v14, "deviceNeedsUpdate:", v35))
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin deviceNeedsBTReconnect](v14, "deviceNeedsBTReconnect"));
        unsigned int v37 = [v36 BOOLValue];

        if (!v37) {
          goto LABEL_41;
        }
        -[SHFUPlugin waitForBTSession](v14, "waitForBTSession");
        if (-[SHFUPlugin btSession](v14, "btSession")) {
          goto LABEL_41;
        }
        v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Bluetooth Session not found for device %@",  v35));
        uint64_t v56 = objc_alloc(&OBJC_CLASS___NSError);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](v14, "errorDomain"));
        NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
        v87 = v55;
        id v58 = v13;
        v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
        uint64_t v49 = -[NSError initWithDomain:code:userInfo:](v56, "initWithDomain:code:userInfo:", v57, 34LL, v59);

        id v13 = v58;
        id v31 = v72;

        char v67 = 0;
        if (!v49)
        {
LABEL_41:
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No hardware revision ID for device %@",  v35));
          uint64_t v51 = objc_alloc(&OBJC_CLASS___NSError);
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](v14, "errorDomain"));
          NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
          v85 = v50;
          id v53 = v13;
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));
          uint64_t v49 = -[NSError initWithDomain:code:userInfo:](v51, "initWithDomain:code:userInfo:", v52, 9LL, v54);

          id v13 = v53;
          id v31 = v72;

          if (!v49)
          {
LABEL_42:
            id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v35 hardwareVersion]));
            __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin getParsersForHWRevID:](v14, "getParsersForHWRevID:", v38));

            id v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin resetEveryFWPayload](v14, "resetEveryFWPayload"));
            unsigned int v41 = [v40 BOOLValue];

            if (v41)
            {
              uint64_t v68 = p_base_prots + 497;
              int v42 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin vendorID](v14, "vendorID"));
              NSErrorUserInfoKey v43 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](v14, "productID"));
              v69 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](v14, "batteryCheckDevice"));
              id v44 = [v69 BOOLValue];
              BOOL v45 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin featureReportDelay](v14, "featureReportDelay"));
              uint64_t v70 = v12;
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](v14, "logHandle"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](v14, "delegate"));
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](v14, "errorDomain"));
              uint64_t v49 = (NSError *)objc_claimAutoreleasedReturnValue( [v68 sendAllFirmwaresToDeviceWithVendorID:v42 productID:v43 hasPowerSource:v44 parsers:v39 totalPrepareByt es:v71 bytesSent:buf featureReportDelay:v45 logHandle:v46 pluginDelegate:v47 errorDomain:v48]);

              id v31 = v72;
              dispatch_time_t v12 = v70;

              p_base_prots = (__objc2_prot_list **)(&SHFUDevice__classData + 40);
              id v13 = v66;
            }

            else
            {
              int v42 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin featureReportDelay](v14, "featureReportDelay"));
              uint64_t v49 = (NSError *)objc_claimAutoreleasedReturnValue( [v35 sendAllFirmwaresToDevice:v39 totalPrepareBytes:v71 bytesSent:buf featureReportDelay:v42]);
            }

            if (!v49)
            {
              char v67 = 1;
LABEL_33:
              uint64_t v32 = v73;
              goto LABEL_34;
            }
          }
        }

        uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin verifyDeviceBattery](v14, "verifyDeviceBattery"));
        v61 = v60;
        if (v60)
        {
          uint64_t v62 = (NSError *)objc_claimAutoreleasedReturnValue([v60 domain]);
          if (-[NSError isEqualToString:]( v62,  "isEqualToString:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain"))
          {
            id v63 = [v61 code];

            if (v63 != (id)-1LL)
            {
              p_base_prots = (__objc2_prot_list **)(&SHFUDevice__classData + 40);
              goto LABEL_32;
            }

            uint64_t v62 = v49;
            uint64_t v49 = v61;
            p_base_prots = (__objc2_prot_list **)(&SHFUDevice__classData + 40);
          }
        }

- (void)applyFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016D98();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin resetEveryFWPayload](self, "resetEveryFWPayload"));
  unsigned int v7 = [v6 BOOLValue];

  if (!v7)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin inactivityDelayPreflight](self, "inactivityDelayPreflight"));
    if ([v13 BOOLValue])
    {
    }

    else
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin inactivityDelay](self, "inactivityDelay"));
      int v15 = [v14 intValue];

      if (v15 >= 1)
      {
        -[SHFUPlugin waitForUserInactivity:withOptions:](self, "waitForUserInactivity:withOptions:", 1LL, v4);
        goto LABEL_12;
      }
    }

    -[SHFUPlugin commitFirmwareWithOptions:](self, "commitFirmwareWithOptions:", v4);
    goto LABEL_12;
  }

  -[SHFUPlugin reconnectDeviceToHost](self, "reconnectDeviceToHost");
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  [v8 progress:100.0];

  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
    int v16 = 138412802;
    id v17 = v10;
    __int16 v18 = 1024;
    int v19 = 1;
    __int16 v20 = 2112;
    uint64_t v21 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "applyFirmware: target device %@ successful %d error %@",  (uint8_t *)&v16,  0x1Cu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
  [v11 didApply:1 info:v12 error:0];

LABEL_12:
}

- (void)commitFirmwareWithOptions:(id)a3
{
  id v39 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  id v6 = [v5 BOOLValue];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin options](self, "options"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  id v45 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v4,  v6,  v7,  v9,  v10,  &v45));
  dispatch_time_t v12 = (NSError *)v45;

  if (v12)
  {
    uint64_t v13 = 0LL;
    __int128 v14 = v11;
    goto LABEL_24;
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  int v15 = v11;
  id v16 = -[NSError countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v41,  v54,  16LL);
  uint64_t v13 = v16 != 0LL;
  __int128 v14 = v11;
  if (!v16) {
    goto LABEL_22;
  }
  id v17 = v16;
  BOOL v37 = v16 != 0LL;
  id v38 = v11;
  dispatch_time_t v12 = 0LL;
  char v18 = 0;
  uint64_t v19 = *(void *)v42;
  id obj = v15;
  do
  {
    for (CFIndex i = 0LL; i != v17; CFIndex i = (char *)i + 1)
    {
      if (*(void *)v42 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
      if (!-[SHFUPlugin deviceNeedsUpdate:](self, "deviceNeedsUpdate:", v21))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Update not needed for device %@",  v21));
        uint64_t v27 = objc_alloc(&OBJC_CLASS___NSError);
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
        NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
        id v53 = v26;
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
        uint64_t v25 = -[NSError initWithDomain:code:userInfo:](v27, "initWithDomain:code:userInfo:", v28, 17LL, v29);

        if (!v25) {
          goto LABEL_18;
        }
LABEL_17:
        id v30 = v25;

        dispatch_time_t v12 = v30;
        goto LABEL_18;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin sendSDPQueryNotification](self, "sendSDPQueryNotification"));
      unsigned int v23 = [v22 BOOLValue];

      if (v23)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
        -[SHFUPlugin sendUpdateSDPQueryNotificationForPID:]( self,  "sendUpdateSDPQueryNotificationForPID:",  [v24 intValue]);
      }

      if ([v21 GATTServicesDiscoveryNeeded]
        && -[SHFUPlugin bluetoothPoweredOn](self, "bluetoothPoweredOn"))
      {
        -[SHFUPlugin tagForBluetoothGATTServicesDiscovery](self, "tagForBluetoothGATTServicesDiscovery");
      }

      uint64_t v25 = (NSError *)objc_claimAutoreleasedReturnValue([v21 commitAllFirmwares]);
      v18 |= v25 == 0LL;
      if (v25) {
        goto LABEL_17;
      }
LABEL_18:
    }

    id v17 = -[NSError countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v54,  16LL);
  }

  while (v17);

  if ((v18 & 1) != 0)
  {
    int v15 = v12;
    __int128 v14 = v38;
    uint64_t v13 = v37;
LABEL_22:

    dispatch_time_t v12 = 0LL;
  }

  else
  {
    uint64_t v13 = 0LL;
    __int128 v14 = v38;
  }

- (void)clearOldRegistryEntryIDs
{
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  IOReturn v3 = (void *)objc_claimAutoreleasedReturnValue([v15 arrayForKey:@"RegistryEntryIDs"]);
  id v4 = [v3 mutableCopy];

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000170E8();
  }

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -172800.0));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (CFIndex i = 0LL; i != v7; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Timestamp"]);
        [v11 doubleValue];
        dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        id v14 = [v12 compare:v13];

        if (v14 != (id)1 && [v12 compare:v17] != (id)-1) {
          -[NSMutableArray addObject:](v16, "addObject:", v10);
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  [v15 setObject:v16 forKey:@"RegistryEntryIDs"];
}

- (BOOL)abortRegistryEntryID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayForKey:@"RegistryEntryIDs"]);
  id v7 = [v6 mutableCopy];

  if ([v7 count])
  {
    uint64_t v8 = 0LL;
    while (1)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v8]);
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"EntryID"]);
    }

    [v7 removeObjectAtIndex:v8];
    dispatch_time_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100017148();
    }

    BOOL v11 = 1;
  }

  else
  {
LABEL_5:
    BOOL v11 = 0;
  }

  [v5 setObject:v7 forKey:@"RegistryEntryIDs"];

  return v11;
}

- (void)storeRegistryEntryID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayForKey:@"RegistryEntryIDs"]);
  id v7 = (NSMutableArray *)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v17[0] = @"EntryID";
  v17[1] = @"Timestamp";
  v18[0] = v4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSince1970];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v18[1] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  -[NSMutableArray addObject:](v7, "addObject:", v10);

  [v5 setObject:v7 forKey:@"RegistryEntryIDs"];
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Store registry entry ID %@ at %@",  (uint8_t *)&v13,  0x16u);
  }
}

- (id)sendPersonalizedFirmwareToDevice
{
  unsigned __int8 v48 = 0;
  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  id obja = (id)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  id v3 = [obja BOOLValue];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin vendorID](self, "vendorID"));
  id v6 = [v5 intValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
  id v8 = [v7 intValue];
  uint64_t v9 = SHFU_UNKNOWN_LOCATION_ID;
  int v10 = SHFU_UNKNOWN_INTERFACE_NUMBER;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  id v47 = 0LL;
  LODWORD(v34) = v10;
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:",  v35,  v3,  v4,  v6,  v8,  v9,  v34,  v11,  &v47));
  id v13 = v47;

  if (!v13)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v36 = v12;
    id obj = v12;
    id v14 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v44;
LABEL_4:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(obj);
        }
        char v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
        if (-[SHFUPlugin deviceNeedsUpdate:](self, "deviceNeedsUpdate:", v18))
        {
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v18 hardwareVersion]));
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin getParsersForHWRevID:](self, "getParsersForHWRevID:", v19));

          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          id v21 = v20;
          id v22 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v40;
            while (2)
            {
              for (CFIndex i = 0LL; i != v23; CFIndex i = (char *)i + 1)
              {
                if (*(void *)v40 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
                if ([v26 personalizationRequired])
                {
                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 registryEntryID]);
                  -[SHFUPlugin storeRegistryEntryID:](self, "storeRegistryEntryID:", v27);

                  -[SHFUPlugin setPersonalizationParser:](self, "setPersonalizationParser:", v26);
                  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin personalizationParser](self, "personalizationParser"));
                  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin featureReportDelay](self, "featureReportDelay"));
                  id v13 = (id)objc_claimAutoreleasedReturnValue( [v18 sendUnsignedFWToDevice:v28 featureReportDelay:v29 sendPersonalizedManifests:&v48]);

                  goto LABEL_18;
                }
              }

              id v23 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          id v13 = 0LL;
LABEL_18:

          int v30 = v48;
          if (v13 || v30) {
            break;
          }
        }

        if ((id)++v17 == v15)
        {
          id v15 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_22;
        }
      }
    }

    else
    {
LABEL_22:
      id v13 = 0LL;
    }

    if (v13)
    {
      dispatch_time_t v12 = v36;
    }

    else
    {
      dispatch_time_t v12 = v36;
      if (v48)
      {
        dispatch_semaphore_t v31 = dispatch_semaphore_create(0LL);
        -[SHFUPlugin setPersonalizationSemaphore:](self, "setPersonalizationSemaphore:", v31);

        -[SHFUPlugin waitForUserInactivity:withOptions:](self, "waitForUserInactivity:withOptions:", 2LL, 0LL);
      }
    }
  }

  id v32 = v13;

  return v32;
}

- (void)sendPersonalizedManifestsToDevice
{
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  id v3 = [v27 BOOLValue];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin vendorID](self, "vendorID"));
  id v6 = [v5 intValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
  id v8 = [v7 intValue];
  uint64_t v9 = SHFU_UNKNOWN_LOCATION_ID;
  int v10 = SHFU_UNKNOWN_INTERFACE_NUMBER;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  id v32 = 0LL;
  LODWORD(v25) = v10;
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:",  v26,  v3,  v4,  v6,  v8,  v9,  v25,  v11,  &v32));
  id v13 = v32;

  if (v13)
  {
    -[SHFUPlugin setError:](self, "setError:", v13);
  }

  else
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      while (2)
      {
        for (CFIndex i = 0LL; i != v16; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          __int128 v19 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          if (-[SHFUPlugin deviceNeedsUpdate:](self, "deviceNeedsUpdate:", v19))
          {
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin personalizationParser](self, "personalizationParser"));
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin featureReportDelay](self, "featureReportDelay"));
            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin manifestCount](self, "manifestCount"));
            id v23 = (void *)objc_claimAutoreleasedReturnValue( [v19 sendPersonalizedManifestsToDevice:v20 featureReportDelay:v21 manifestCount:v22]);
            -[SHFUPlugin setError:](self, "setError:", v23);

            goto LABEL_13;
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

- (void)waitForDeviceEnumerationWithProgressUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin resetEveryFWPayload](self, "resetEveryFWPayload"));
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    -[SHFUPlugin registerForMatchNotification](self, "registerForMatchNotification");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin versionCheckDelay](self, "versionCheckDelay"));
    [v7 doubleValue];
    double v9 = v8 + 300.0;

    for (int i = 0; i != 300; ++i)
    {
      dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL);
      dispatch_time_t v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin matchSemaphore](self, "matchSemaphore"));
      uint64_t v13 = dispatch_semaphore_wait(v12, v11);

      if (!v13) {
        break;
      }
      if (v3)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
        [v14 progress:((double)i + 1.0) / v9 * 100.0];
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin versionCheckDelay](self, "versionCheckDelay"));
    unsigned __int8 v16 = [v15 isEqualToNumber:&off_100026A50];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin versionCheckDelay](self, "versionCheckDelay"));
      [v17 doubleValue];
      double v19 = v18;

      if (v19 > 0.0)
      {
        double v20 = 0.0;
        do
        {
          +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0);
          double v20 = v20 + 1.0;
          if (v3)
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
            [v21 progress:(v20 + 300.0) / v9 * 100.0];
          }

          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin versionCheckDelay](self, "versionCheckDelay"));
          [v22 doubleValue];
          double v24 = v23;
        }

        while (v20 < v24);
      }
    }
  }

- (void)finishWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016D98();
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin error](self, "error"));
  if (v6)
  {

LABEL_5:
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Previous FudPlugin method failed"));
    double v8 = objc_alloc(&OBJC_CLASS___NSError);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    id v33 = v7;
    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    dispatch_time_t v11 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v9, 55LL, v10);

    -[SHFUPlugin releasePowerAssertion](self, "releasePowerAssertion");
    -[SHFUPlugin setTransaction:](self, "setTransaction:", 0LL);
    dispatch_time_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      uint64_t v27 = v13;
      __int16 v28 = 1024;
      int v29 = 0;
      __int16 v30 = 2112;
      __int128 v31 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "finish: target device %@ successful %d error %@",  buf,  0x1Cu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
    [v14 didFinish:0 info:v15 error:v11];

    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin remoteHUDAssertion](self, "remoteHUDAssertion"));
    [v16 relinquish];

    goto LABEL_8;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));

  if (!v17) {
    goto LABEL_5;
  }
  -[SHFUPlugin waitForDeviceEnumerationWithProgressUpdates:](self, "waitForDeviceEnumerationWithProgressUpdates:", 1LL);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin sendPersonalizedFirmwareToDevice](self, "sendPersonalizedFirmwareToDevice"));
  -[SHFUPlugin setError:](self, "setError:", v18);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000B55C;
  v25[3] = &unk_100024730;
  v25[4] = self;
  id v7 = objc_retainBlock(v25);
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin error](self, "error"));
  if (v19)
  {
  }

  else
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin personalizationSemaphore](self, "personalizationSemaphore"));

    if (v20)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
      id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000B754;
      block[3] = &unk_100024758;
      void block[4] = self;
      double v24 = v7;
      dispatch_async(v22, block);

      goto LABEL_8;
    }
  }

  ((void (*)(void *))v7[2])(v7);
LABEL_8:
}

- (id)verifyLatestFWVersions
{
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  NSErrorUserInfoKey v32 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  id v3 = [v32 BOOLValue];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin vendorID](self, "vendorID"));
  id v6 = [v5 intValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
  id v8 = [v7 intValue];
  uint64_t v9 = SHFU_UNKNOWN_LOCATION_ID;
  int v10 = SHFU_UNKNOWN_INTERFACE_NUMBER;
  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  id v37 = 0LL;
  LODWORD(v29) = v10;
  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:",  v30,  v3,  v4,  v6,  v8,  v9,  v29,  v11,  &v37));
  uint64_t v13 = (NSError *)v37;

  if (!v13)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      __int128 v31 = v12;
      uint64_t v17 = *(void *)v34;
      while (2)
      {
        for (int i = 0LL; i != v16; int i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin loggingIdentifier](self, "loggingIdentifier"));
          [v19 logVersions:v20];

          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin latestFirmwareVersions](self, "latestFirmwareVersions"));
          unsigned int v22 = [v19 firmwareVersionsEqualTo:v21];

          if (!v22)
          {
            double v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ does not have latest FW versions",  v19));
            uint64_t v25 = objc_alloc(&OBJC_CLASS___NSError);
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
            NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
            __int128 v41 = v24;
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
            uint64_t v13 = -[NSError initWithDomain:code:userInfo:](v25, "initWithDomain:code:userInfo:", v26, 14LL, v27);

            goto LABEL_14;
          }

          double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
            __int128 v39 = v19;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "successfully updated %@", buf, 0xCu);
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v16) {
          continue;
        }
        break;
      }

      uint64_t v13 = 0LL;
LABEL_14:
      dispatch_time_t v12 = v31;
    }

    else
    {
      uint64_t v13 = 0LL;
    }
  }

  return v13;
}

- (id)getPreloadedFWVersions:(id *)a3
{
  id v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin firmwareDirectory](self, "firmwareDirectory"));
  NSURLResourceKey v45 = NSURLPathKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v7 options:4 error:a3]);

  if (!*a3)
  {
    if ([v8 count])
    {
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id obj = v8;
      id v9 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v9)
      {
        id v10 = v9;
        __int128 v34 = v8;
        uint64_t v36 = *(void *)v39;
        while (2)
        {
          for (int i = 0LL; i != v10; int i = (char *)i + 1)
          {
            if (*(void *)v39 != v36) {
              objc_enumerationMutation(obj);
            }
            dispatch_time_t v12 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
            uint64_t v13 = objc_alloc(&OBJC_CLASS___AUFileParser);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin productID](self, "productID"));
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin equivalentPIDs](self, "equivalentPIDs"));
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
            double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
            double v19 = -[AUFileParser initWithFilePath:productID:equivalentPIDs:logHandle:errorDomain:error:]( v13,  "initWithFilePath:productID:equivalentPIDs:logHandle:errorDomain:error:",  v14,  v15,  v16,  v17,  v18,  a3);

            if (*a3)
            {
              id v8 = v34;
              goto LABEL_16;
            }

            double v20 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getFirmwareType](v19, "getFirmwareType"));
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getFirmwareVersion](v19, "getFirmwareVersion"));
            unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[AUFileParser getHardwareRevisionID](v19, "getHardwareRevisionID"));
            double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
            double v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v37,  "objectForKeyedSubscript:",  v23));

            if (!v24)
            {
              double v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v24, v25);
            }

            v26 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v21, v26);
          }

          id v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v10) {
            continue;
          }
          break;
        }

        id v8 = v34;
      }
    }

    else
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin firmwareDirectory](self, "firmwareDirectory"));
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
      uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No firmware files found at %@",  v28));

      __int16 v30 = objc_alloc(&OBJC_CLASS___NSError);
      double v19 = (AUFileParser *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      uint64_t v44 = v29;
      id obj = (id)v29;
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
      *a3 = -[NSError initWithDomain:code:userInfo:](v30, "initWithDomain:code:userInfo:", v19, 3LL, v31);

LABEL_16:
    }

    if (!*a3)
    {
      NSErrorUserInfoKey v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_1000171A8(self);
      }
    }
  }

  return v37;
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_time_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  dispatch_time_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100017274();
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C014;
    block[3] = &unk_100024780;
    id v14 = (os_log_s *)v10;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(&_dispatch_main_q, block);

    dispatch_time_t v12 = v14;
  }

  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_100017248();
  }
}

- (void)setHostPowerSource:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (FudPluginDelegate)delegate
{
  return (FudPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)mobileAssetType
{
  return self->_mobileAssetType;
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSArray)equivalentPIDs
{
  return self->_equivalentPIDs;
}

- (NSNumber)versionCheckDelay
{
  return self->_versionCheckDelay;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSURL)firmwareDirectory
{
  return self->_firmwareDirectory;
}

- (void)setFirmwareDirectory:(id)a3
{
}

- (NSMutableDictionary)latestFirmwareVersions
{
  return self->_latestFirmwareVersions;
}

- (void)setLatestFirmwareVersions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSNumber)inactivityDelayPreflight
{
  return self->_inactivityDelayPreflight;
}

- (NSNumber)allowDowngrade
{
  return self->_allowDowngrade;
}

- (NSNumber)bootstrapDelay
{
  return self->_bootstrapDelay;
}

- (NSNumber)inactivityDelay
{
  return self->_inactivityDelay;
}

- (NSNumber)networkDelay
{
  return self->_networkDelay;
}

- (NSNumber)featureReportDelay
{
  return self->_featureReportDelay;
}

- (NSMutableDictionary)pluginInfo
{
  return self->_pluginInfo;
}

- (NSNumber)batteryCheckHost
{
  return self->_batteryCheckHost;
}

- (NSNumber)batteryCheckDevice
{
  return self->_batteryCheckDevice;
}

- (NSNumber)minBatteryHost
{
  return self->_minBatteryHost;
}

- (NSNumber)minBatteryDevice
{
  return self->_minBatteryDevice;
}

- (NSNumber)STFWFirst
{
  return self->_STFWFirst;
}

- (NSNumber)resetEveryFWPayload
{
  return self->_resetEveryFWPayload;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (NSNumber)sendSDPQueryNotification
{
  return self->_sendSDPQueryNotification;
}

- (NSNumber)deviceNeedsBTReconnect
{
  return self->_deviceNeedsBTReconnect;
}

- (NSNumber)btReconnectDelay
{
  return self->_btReconnectDelay;
}

- (NSString)targetDevice
{
  return self->_targetDevice;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSNumber)manifestCount
{
  return self->_manifestCount;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (OS_dispatch_semaphore)personalizationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setPersonalizationSemaphore:(id)a3
{
}

- (AUFileParser)personalizationParser
{
  return self->_personalizationParser;
}

- (void)setPersonalizationParser:(id)a3
{
}

- (NSMutableDictionary)parsers
{
  return self->_parsers;
}

- (void)setParsers:(id)a3
{
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
}

- (OS_dispatch_semaphore)matchSemaphore
{
  return self->_matchSemaphore;
}

- (void)setMatchSemaphore:(id)a3
{
}

- (OS_dispatch_source)networkStatus
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setNetworkStatus:(id)a3
{
}

- (__SCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (void)setNetworkReachability:(__SCNetworkReachability *)a3
{
  self->_networkReachability = a3;
}

- (OS_dispatch_source)userInactivityStatus
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 384LL, 1);
}

- (void)setUserInactivityStatus:(id)a3
{
}

- (OS_dispatch_source)delayBootstrapSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 392LL, 1);
}

- (void)setDelayBootstrapSource:(id)a3
{
}

- (unint64_t)pmNotificationHandle
{
  return self->_pmNotificationHandle;
}

- (void)setPmNotificationHandle:(unint64_t)a3
{
  self->_pmNotificationHandle = a3;
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 408LL, 1);
}

- (void)setCentralManager:(id)a3
{
}

- (OS_dispatch_semaphore)btSessionSemaphore
{
  return self->_btSessionSemaphore;
}

- (void)setBtSessionSemaphore:(id)a3
{
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (TVPSSuppressRemoteConnectivityHUDAssertion)remoteHUDAssertion
{
  return self->_remoteHUDAssertion;
}

- (void)setRemoteHUDAssertion:(id)a3
{
}

- (OS_dispatch_semaphore)sleepSemaphore
{
  return self->_sleepSemaphore;
}

- (void)setSleepSemaphore:(id)a3
{
}

- (OS_dispatch_source)batteryTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 448LL, 1);
}

- (void)setBatteryTimer:(id)a3
{
}

- (int)batteryToken
{
  return self->_batteryToken;
}

- (void)setBatteryToken:(int)a3
{
  self->_batteryToken = a3;
}

- (NSNumber)abortUpdate
{
  return self->_abortUpdate;
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (BOOL)bluetoothPoweredOn
{
  return self->_bluetoothPoweredOn;
}

- (void)setBluetoothPoweredOn:(BOOL)a3
{
  self->_bluetoothPoweredOn = a3;
}

- (void).cxx_destruct
{
}

@end