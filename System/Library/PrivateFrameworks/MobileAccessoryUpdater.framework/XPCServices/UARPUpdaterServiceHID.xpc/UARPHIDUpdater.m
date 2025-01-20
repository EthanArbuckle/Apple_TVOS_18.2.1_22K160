@interface UARPHIDUpdater
+ (id)sharedInstance;
- (BOOL)_queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5;
- (BOOL)applyStagedFirmwareForAccessories:(id)a3;
- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5;
- (BOOL)registerHIDCallbacksForUARPHIDAccessory:(id)a3;
- (BOOL)registerHIDForAccessory:(id)a3;
- (BOOL)rescindStagedFirmwareForAccessories:(id)a3;
- (BOOL)sendHIDReportToAccessory:(id)a3 forUARPMessage:(id)a4 error:(id *)a5;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)unRegisterHIDCallbacksForUARPHIDAccessory:(id)a3;
- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate;
- (NSString)uarpCaptureFileName;
- (OS_dispatch_queue)uarpHIDQueue;
- (OS_os_log)log;
- (UARPHIDUpdater)init;
- (id)copyManagedPrefsValueForKey:(id)a3;
- (id)createAndSaveUARPHIDAccessoryFromService:(unsigned int)a3 identifier:(id)a4;
- (id)createUARPAccessoryFromAccessoryID:(id)a3;
- (id)createUARPAssetIDForAccessoryID:(id)a3;
- (id)getAccessoriesForIdentifier:(id)a3;
- (id)getAccessoryForIORegEntryID:(unint64_t)a3 identifier:(id)a4;
- (id)getContainerIDFromCFPrefsForAccessory:(id)a3;
- (id)getUARPHIDAccessoryForUARPAccessory:(id)a3;
- (id)getUARPHIDAccessoryForUARPAccessoryID:(id)a3;
- (id)matchingDictionaryForIdentifier:(id)a3;
- (id)matchingDictionaryForIdentifier:(id)a3 hardwareID:(UARPHIDHardwareID *)a4;
- (id)matchingDictionaryForVendorID:(id)a3 productID:(id)a4;
- (id)pendingTatsuRequests;
- (id)uuidForAccessoryID:(id)a3;
- (unsigned)getReportSizeForReportUsage:(unsigned int)a3 forAccessory:(id)a4;
- (void)_accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4;
- (void)_assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)_assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)_assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)_firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)_firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)_queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)_queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)_solicitDynamicAssetForAccessory:(id)a3 assetID:(id)a4;
- (void)_solicitDynamicAssetMTICForAccessory:(id)a3;
- (void)_solicitDynamicAssetTICSForAccessory:(id)a3;
- (void)_stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)_stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)_startUpdateForAccessories:(id)a3 assetID:(id)a4;
- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4;
- (void)allocateController;
- (void)applyStagedAssets:(id)a3;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)assetCheckForProductGroup:(id)a3 productNumber:(id)a4 assetID:(id)a5 options:(unsigned int)a6;
- (void)assetDownloadFailed:(id)a3 assetID:(id)a4;
- (void)assetNotFound:(id)a3 assetID:(id)a4;
- (void)assetOnAssetServer:(id)a3 assetID:(id)a4;
- (void)assetOnDropbox:(id)a3 assetID:(id)a4;
- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4;
- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)assetStagingPause:(id)a3;
- (void)assetStagingResume:(id)a3;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)handleHIDDisconnectForAccessory:(id)a3;
- (void)parseInputReport:(id)a3 forAccessory:(id)a4;
- (void)processUARPMessage:(id)a3 fromAccessory:(id)a4;
- (void)qHoldPowerAssertionForAccessory:(id)a3;
- (void)qPostStagingStatusNotificationForAccessory:(id)a3 status:(unint64_t)a4;
- (void)qReleasePowerAssertionForAccessory:(id)a3;
- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5;
- (void)queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5;
- (void)queryPropertiesForUARPHIDAccessory:(id)a3 completionCallback:(id)a4;
- (void)removeAccessoryID:(id)a3;
- (void)runHIDRegistrationThread:(id)a3;
- (void)scheduleHIDDeviceForAccessory:(id)a3;
- (void)setGoldRestoreDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setUarpCaptureFileName:(id)a3;
- (void)setUarpHIDQueue:(id)a3;
- (void)solicitDynamicAssetForAccessories:(id)a3 assetID:(id)a4;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)startTapToRadar:(id)a3;
- (void)startUpdateForAccessories:(id)a3 assetID:(id)a4;
- (void)stopHIDRegistrationThread;
- (void)stopPacketCapture;
- (void)stopTapToRadar;
- (void)tssResponse:(id)a3;
- (void)unScheduleHIDDeviceForAccessory:(id)a3;
- (void)unsolicitedDynamicAssetForAccessories:(id)a3 assetTag:(id)a4;
@end

@implementation UARPHIDUpdater

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000037E0;
  block[3] = &unk_100028530;
  block[4] = a1;
  if (qword_10002F940 != -1) {
    dispatch_once(&qword_10002F940, block);
  }
  return (id)qword_10002F938;
}

- (UARPHIDUpdater)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UARPHIDUpdater;
  v2 = -[UARPHIDUpdater init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uarpHIDAccessories = v2->_uarpHIDAccessories;
    v2->_uarpHIDAccessories = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessoryupdater.uarpOverHID.queue", 0LL);
    uarpHIDQueue = v2->_uarpHIDQueue;
    v2->_uarpHIDQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessoryupdater.uarpOverHID.delegate_queue", 0LL);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v7;

    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "hidUpdater");
    log = v2->_log;
    v2->_log = v9;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    uarpHIDRegistrationThreadSemaphore = v2->_uarpHIDRegistrationThreadSemaphore;
    v2->_uarpHIDRegistrationThreadSemaphore = (OS_dispatch_semaphore *)v11;

    v13 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.UARPHIDUpdater.database");
    database = v2->_database;
    v2->_database = v13;

    v2->_sessionID = 1;
    v2->_unregisterOnComplete = 1;
    v2->_powerAssertionID = 0;
    v2->_powerAssertionRefCount = 0;
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    stagingStatusNotificationTokens = v2->_stagingStatusNotificationTokens;
    v2->_stagingStatusNotificationTokens = v15;
  }

  return v2;
}

- (id)getAccessoriesForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory supportedAccessoriesByTransport:]( &OBJC_CLASS___UARPSupportedAccessory,  "supportedAccessoriesByTransport:",  1LL));
  uarpHIDQueue = self->_uarpHIDQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003A1C;
  v14[3] = &unk_100028558;
  id v15 = v6;
  id v16 = v4;
  v17 = self;
  id v8 = v5;
  id v18 = v8;
  id v9 = v4;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, v14);
  dispatch_semaphore_t v11 = v18;
  id v12 = v8;

  return v12;
}

- (id)getAccessoryForIORegEntryID:(unint64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_100003E7C;
  v23 = sub_100003E8C;
  id v24 = 0LL;
  uarpHIDQueue = self->_uarpHIDQueue;
  dispatch_semaphore_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100003E94;
  v14 = &unk_100028580;
  v17 = &v19;
  unint64_t v18 = a3;
  id v15 = self;
  id v8 = v6;
  id v16 = v8;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, &v11);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "uarpAccessoryID", v11, v12, v13, v14, v15));

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)setUarpCaptureFileName:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003F78;
  block[3] = &unk_1000285A8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
}

- (NSString)uarpCaptureFileName
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100003E7C;
  id v10 = sub_100003E8C;
  id v11 = 0LL;
  uarpHIDQueue = self->_uarpHIDQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000408C;
  v5[3] = &unk_1000285D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)allocateController
{
  if (!self->_uarpController)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___UARPController);
    uarpController = self->_uarpController;
    self->_uarpController = v3;

    -[UARPController setDelegate:](self->_uarpController, "setDelegate:", self);
    -[UARPController setChipInfoDelegate:](self->_uarpController, "setChipInfoDelegate:", self);
    if (self->_uarpCaptureFileName) {
      -[UARPController startPacketCapture:](self->_uarpController, "startPacketCapture:");
    }
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UARPHIDUpdaterPreferences sharedPrefs](&OBJC_CLASS___UARPHIDUpdaterPreferences, "sharedPrefs"));
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 powerLogStagingWindowSecondsOverride];
      if ((_DWORD)v7)
      {
        id v8 = v7;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          v10[0] = 67109120;
          v10[1] = (_DWORD)v8;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Overriding power log staging update interval to %u s",  (uint8_t *)v10,  8u);
        }

        -[UARPController setPowerLogStagingWindowPeriodSeconds:]( self->_uarpController,  "setPowerLogStagingWindowPeriodSeconds:",  v8);
      }
    }
  }

- (void)startUpdateForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        v17[0] = 0LL;
        v17[1] = v17;
        v17[2] = 0x3032000000LL;
        v17[3] = sub_100003E7C;
        v17[4] = sub_100003E8C;
        id v18 = 0LL;
        uarpHIDQueue = self->_uarpHIDQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000436C;
        block[3] = &unk_100028620;
        id v16 = v17;
        block[4] = self;
        void block[5] = v12;
        id v15 = v7;
        dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);

        _Block_object_dispose(v17, 8);
      }

      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }
}

- (void)qPostStagingStatusNotificationForAccessory:(id)a3 status:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 modelIdentifier]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v8));
  if ([v9 postStagingNotifications])
  {
    stagingStatusNotificationTokens = self->_stagingStatusNotificationTokens;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 getID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( stagingStatusNotificationTokens,  "objectForKeyedSubscript:",  v11));

    if (v12)
    {
      notify_cancel((int)[v12 intValue]);
      v13 = self->_stagingStatusNotificationTokens;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 getID]);
      -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);
    }

    uint64_t v15 = postStagingStatusForModelIdentifier(v8, a4);
    if ((_DWORD)v15 == -1)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10001C39C();
      }
    }

    else if (a4)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
      v17 = self->_stagingStatusNotificationTokens;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 getID]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);
    }

    else
    {
      notify_cancel(v15);
    }
  }
}

- (void)qHoldPowerAssertionForAccessory:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v5));

  if ([v6 updateRequiresPowerAssertion])
  {
    if (self->_powerAssertionID)
    {
      ++self->_powerAssertionRefCount;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int powerAssertionRefCount = self->_powerAssertionRefCount;
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 1024;
        int v15 = powerAssertionRefCount;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Already holding power assertion for %@ refCount=%u",  buf,  0x12u);
      }
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 hardwareID]);
      uint64_t v10 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"com.apple.UARPPowerAssertion-%s",  UARPAccessoryTransportToString([v9 transport]));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (createPowerAssertion(v11, buf))
      {
        self->_powerAssertionID = *(_DWORD *)buf;
        ++self->_powerAssertionRefCount;
      }

      else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_10001C3FC();
      }
    }
  }
}

- (void)qReleasePowerAssertionForAccessory:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v5));

  if ([v6 updateRequiresPowerAssertion])
  {
    if (self->_powerAssertionID)
    {
      if (self->_powerAssertionRefCount)
      {
        unsigned __int8 powerAssertionRefCount = self->_powerAssertionRefCount - 1;
        self->_unsigned __int8 powerAssertionRefCount = powerAssertionRefCount;
      }

      else
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10001C51C();
        }
        unsigned __int8 powerAssertionRefCount = self->_powerAssertionRefCount;
      }

      if (!powerAssertionRefCount)
      {
        char v8 = releasePowerAssertion(self->_powerAssertionID);
        self->_powerAssertionID = 0;
        if ((v8 & 1) == 0 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10001C4BC();
        }
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_10001C45C();
    }
  }
}

- (void)_startUpdateForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[UARPHIDUpdater allocateController](self, "allocateController");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
  v32 = v7;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessoryID:]( self,  "getUARPHIDAccessoryForUARPAccessoryID:",  v13));
        if (!v14)
        {
          log = self->_log;
          if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 136315394;
          v38 = "-[UARPHIDUpdater _startUpdateForAccessories:assetID:]";
          __int16 v39 = 2112;
          v40 = v13;
          v29 = log;
          v30 = "%s: Unknown UARPAccessoryID %@, dropping it";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v30, buf, 0x16u);
          goto LABEL_21;
        }

        if (!-[UARPHIDUpdater registerHIDCallbacksForUARPHIDAccessory:]( self,  "registerHIDCallbacksForUARPHIDAccessory:",  v14))
        {
          v31 = self->_log;
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 136315394;
          v38 = "-[UARPHIDUpdater _startUpdateForAccessories:assetID:]";
          __int16 v39 = 2112;
          v40 = v14;
          v29 = v31;
          v30 = "%s: Failed to register for HID Callbacks for %@, dropping it";
          goto LABEL_18;
        }

        int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessory]);

        if (!v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessoryID]);
          v17 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater createUARPAccessoryFromAccessoryID:]( self,  "createUARPAccessoryFromAccessoryID:",  v16));
          [v14 setUarpAccessory:v17];

          id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessory]);
          [v18 setDownloadOnCellularAllowed:0];

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessory]);
          [v19 setAutoDownloadAllowed:0];

          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessory]);
          [v20 setTransport:1];

          id v21 = [v13 capability];
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessory]);
          [v22 setCapability:v21];
        }

        [v14 setUpdateInProgress:1];
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
        [v14 setLastReportedStagingTime:v23];

        id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessory]);
        -[UARPHIDUpdater qHoldPowerAssertionForAccessory:](self, "qHoldPowerAssertionForAccessory:", v24);

        if (!v7) {
          id v7 = (id)objc_claimAutoreleasedReturnValue(-[UARPHIDUpdater createUARPAssetIDForAccessoryID:](self, "createUARPAssetIDForAccessoryID:", v14));
        }
        unsigned __int8 v25 = [v7 isDynamicAsset];
        uarpController = self->_uarpController;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v14 uarpAccessory]);
        if ((v25 & 1) != 0) {
          -[UARPController dynamicAssetAvailableForAccessory:assetID:error:]( uarpController,  "dynamicAssetAvailableForAccessory:assetID:error:",  v27,  v7,  0LL);
        }
        else {
          -[UARPController changeAssetLocation:assetID:](uarpController, "changeAssetLocation:assetID:", v27, v7);
        }

LABEL_21:
      }

      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v10);
  }
}

- (id)getContainerIDFromCFPrefsForAccessory:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 vendorID]);
  id v6 = [v5 unsignedIntegerValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 productID]);

  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"vid0x%04lXpid0x%04lX",  v6,  [v7 unsignedIntegerValue]));
  id v9 = (id)CFPreferencesCopyAppValue(v8, @"com.apple.UARPUpdaterServiceHID");
  if (!v9)
  {
    id v9 = -[UARPHIDUpdater copyManagedPrefsValueForKey:](self, "copyManagedPrefsValueForKey:", v8);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
    {

LABEL_8:
      id v9 = (id)CFPreferencesCopyValue( v8,  @"com.apple.UARPUpdaterServiceHID",  @"mobile",  kCFPreferencesCurrentHost);
      goto LABEL_9;
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      int v15 = "-[UARPHIDUpdater getContainerIDFromCFPrefsForAccessory:]";
      __int16 v16 = 2112;
      v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: ContainerID found in managed prefs for %@: %@",  buf,  0x20u);
    }

    if (!v9) {
      goto LABEL_8;
    }
  }

- (id)copyManagedPrefsValueForKey:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Managed Preferences/mobile/com.apple.UARPUpdaterServiceHID.plist"));
  id v6 = 0LL;
  if ([v5 checkResourceIsReachableAndReturnError:0])
  {
    id v11 = 0LL;
    id v7 = -[NSDictionary initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfURL:error:",  v5,  &v11);
    id v8 = v11;
    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v4));
      id v6 = [v9 copy];
    }

    else
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10001C57C();
      }
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)createUARPAssetIDForAccessoryID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uarpAccessoryID]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 productGroup]);
  if (!v6)
  {

    goto LABEL_8;
  }

  id v7 = (void *)v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uarpAccessoryID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 productNumber]);

  if (!v9)
  {
LABEL_8:
    uint64_t v11 = 3LL;
    goto LABEL_13;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getContainerIDFromCFPrefsForAccessory:]( self,  "getContainerIDFromCFPrefsForAccessory:",  v4));
  if (MGGetBoolAnswer(@"InternalBuild"))
  {
    if (v10 && ([v10 isEqualToString:@"UARPiCloudPublicContainer"] & 1) == 0)
    {
      if ([v10 isEqualToString:@"UARPiCloudStagingContainer"])
      {
        uint64_t v11 = 2LL;
      }

      else if ([v10 isEqualToString:@"UARPiCloudPublicContainerBeta"])
      {
        uint64_t v11 = 7LL;
      }

      else if ([v10 isEqualToString:@"UARPiCloudStagingContainerBeta"])
      {
        uint64_t v11 = 8LL;
      }

      else if ([v10 isEqualToString:@"UARPiCloudPublicContainerUAT"])
      {
        uint64_t v11 = 5LL;
      }

      else if ([v10 isEqualToString:@"UARPiCloudStagingContainerUAT"])
      {
        uint64_t v11 = 6LL;
      }

      else
      {
        log = self->_log;
        uint64_t v11 = 1LL;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          __int16 v16 = "-[UARPHIDUpdater createUARPAssetIDForAccessoryID:]";
          uint64_t v11 = 1LL;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: Unsupported containerID in defaults write, pointing to Production Container by default",  (uint8_t *)&v15,  0xCu);
        }
      }
    }

    else
    {
      uint64_t v11 = 1LL;
    }
  }

  else if ([v10 isEqualToString:@"UARPiCloudStagingContainer"])
  {
    uint64_t v11 = 2LL;
  }

  else
  {
    uint64_t v11 = 1LL;
  }

LABEL_13:
  id v12 = [[UARPAssetID alloc] initWithLocationType:v11 remoteURL:0];

  return v12;
}

- (BOOL)_queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v38 = 136315394;
    __int16 v39 = "-[UARPHIDUpdater _queryProperties:accessoryID:goldrestoreQuery:]";
    __int16 v40 = 2112;
    id v41 = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: properties %@", (uint8_t *)&v38, 0x16u);
  }

  -[UARPHIDUpdater allocateController](self, "allocateController");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessoryID:]( self,  "getUARPHIDAccessoryForUARPAccessoryID:",  v9));
  if (!v11)
  {
    id v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315394;
      __int16 v39 = "-[UARPHIDUpdater _queryProperties:accessoryID:goldrestoreQuery:]";
      __int16 v40 = 2112;
      id v41 = v9;
      __int128 v22 = "%s: Unknown UARPAccessoryID %@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v38, 0x16u);
    }

- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005748;
  block[3] = &unk_100028648;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  v17 = &v19;
  BOOL v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
  LOBYTE(uarpHIDQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)uarpHIDQueue;
}

- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5
{
  id v11 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kUARPErrorDomain,  a5,  0LL));
  switch(a4)
  {
    case 0uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:manufacturer:error:]( self,  "_queryCompleteForAccessory:manufacturer:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 1uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:modelName:error:]( self,  "_queryCompleteForAccessory:modelName:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 2uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:serialNumber:error:]( self,  "_queryCompleteForAccessory:serialNumber:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 3uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:hardwareVersion:error:]( self,  "_queryCompleteForAccessory:hardwareVersion:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 4uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:firmwareVersion:error:]( self,  "_queryCompleteForAccessory:firmwareVersion:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 5uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:stagedFirmwareVersion:error:]( self,  "_queryCompleteForAccessory:stagedFirmwareVersion:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 6uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:stats:error:]( self,  "_queryCompleteForAccessory:stats:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 0xBuLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:appleModelNumber:error:]( self,  "_queryCompleteForAccessory:appleModelNumber:error:",  v9,  0LL,  v8);
      goto LABEL_12;
    case 0xCuLL:
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:hwFusingType:error:]( self,  "_queryCompleteForAccessory:hwFusingType:error:",  v10,  0LL,  v8);

      goto LABEL_11;
    case 0xDuLL:
LABEL_11:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
      -[UARPHIDUpdater _queryCompleteForAccessory:friendlyName:error:]( self,  "_queryCompleteForAccessory:friendlyName:error:",  v9,  0LL,  v8);
LABEL_12:

      break;
    default:
      break;
  }
}

- (BOOL)applyStagedFirmwareForAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005A4C;
  block[3] = &unk_100028670;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
  LOBYTE(uarpHIDQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)uarpHIDQueue;
}

- (BOOL)rescindStagedFirmwareForAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005E24;
  block[3] = &unk_100028670;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
  LOBYTE(uarpHIDQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)uarpHIDQueue;
}

- (void)assetCheckForProductGroup:(id)a3 productNumber:(id)a4 assetID:(id)a5 options:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006224;
  block[3] = &unk_100028698;
  unsigned int v21 = a6;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)unsolicitedDynamicAssetForAccessories:(id)a3 assetTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000063D4;
  block[3] = &unk_1000286C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)_solicitDynamicAssetTICSForAccessory:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v5));

  unsigned __int8 v7 = [v6 supportsAnalytics];
  log = self->_log;
  BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Solicit TICS for HID <%@>",  (uint8_t *)&v15,  0xCu);
    }

    id v10 = (char *)uarpAssetTagStructAnalytics();
    id v11 = [[UARPAssetTag alloc] initWithChar1:*v10 char2:v10[1] char3:v10[2] char4:v10[3]];
    uint64_t v12 = uarpDynamicAssetURL();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = [[UARPAssetID alloc] initWithLocationType:10 assetTag:v11 url:v13];
    -[UARPHIDUpdater _solicitDynamicAssetForAccessory:assetID:]( self,  "_solicitDynamicAssetForAccessory:assetID:",  v4,  v14);
  }

  else if (v9)
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "HID Accessory does not support TICS <%@>",  (uint8_t *)&v15,  0xCu);
  }
}

- (void)_solicitDynamicAssetMTICForAccessory:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v5));

  unsigned __int8 v7 = [v6 supportsMappedAnalytics];
  log = self->_log;
  BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Solicit MTIC for HID <%@>",  (uint8_t *)&v15,  0xCu);
    }

    id v10 = (char *)uarpAssetTagStructMappedAnalytics();
    id v11 = [[UARPAssetTag alloc] initWithChar1:*v10 char2:v10[1] char3:v10[2] char4:v10[3]];
    uint64_t v12 = uarpDynamicAssetURL();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = [[UARPAssetID alloc] initWithLocationType:10 assetTag:v11 url:v13];
    -[UARPHIDUpdater _solicitDynamicAssetForAccessory:assetID:]( self,  "_solicitDynamicAssetForAccessory:assetID:",  v4,  v14);
  }

  else if (v9)
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "HID Accessory does not support MTIC <%@>",  (uint8_t *)&v15,  0xCu);
  }
}

- (void)_solicitDynamicAssetForAccessory:(id)a3 assetID:(id)a4
{
  id v6 = (char *)a3;
  unsigned __int8 v7 = (char *)a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    int v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Solicit Dynamic Asset HID <%@> assetID <%@>",  (uint8_t *)&v14,  0x16u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v6));
  id v10 = v9;
  if (v9)
  {
    uarpController = self->_uarpController;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
    -[UARPController solicitDynamicAsset:assetID:](uarpController, "solicitDynamicAsset:assetID:", v12, v7);
  }

  else
  {
    id v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      int v15 = "-[UARPHIDUpdater _solicitDynamicAssetForAccessory:assetID:]";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (void)_assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = log;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 availableFirmwareVersion]);
    int v13 = 136315906;
    int v14 = "-[UARPHIDUpdater _assetAvailablityUpdateForAccessoryID:assetID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: accessory = %@, available version = %@, assetID = %@",  (uint8_t *)&v13,  0x2Au);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v6));
  if (v11)
  {
    if ([v7 downloadStatus] == (id)2)
    {
      -[UARPHIDUpdater assetDownloadFailed:assetID:](self, "assetDownloadFailed:assetID:", v11, v7);
    }

    else if ([v7 updateAvailabilityStatus] == (id)1)
    {
      -[UARPHIDUpdater assetOnAssetServer:assetID:](self, "assetOnAssetServer:assetID:", v11, v7);
    }

    else if ([v7 updateAvailabilityStatus] == (id)3)
    {
      -[UARPHIDUpdater assetOnLocalStorage:assetID:](self, "assetOnLocalStorage:assetID:", v11, v7);
    }

    else if ([v7 updateAvailabilityStatus] == (id)4)
    {
      -[UARPHIDUpdater assetOnDropbox:assetID:](self, "assetOnDropbox:assetID:", v11, v7);
    }

    else if ([v7 updateAvailabilityStatus] == (id)6 {
           || [v7 updateAvailabilityStatus] == (id)7)
    }
    {
      -[UARPHIDUpdater assetNotFound:assetID:](self, "assetNotFound:assetID:", v11, v7);
    }
  }

  else
  {
    uint64_t v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      int v14 = "-[UARPHIDUpdater _assetAvailablityUpdateForAccessoryID:assetID:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)assetDownloadFailed:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modelNumber]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v9));

  [v6 setUpdateInProgress:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  -[UARPHIDUpdater qReleasePowerAssertionForAccessory:](self, "qReleasePowerAssertionForAccessory:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  -[UARPHIDUpdater qPostStagingStatusNotificationForAccessory:status:]( self,  "qPostStagingStatusNotificationForAccessory:status:",  v12,  0LL);

  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006FBC;
  block[3] = &unk_1000285A8;
  block[4] = self;
  id v14 = v6;
  id v20 = v14;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
  if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "assetAvailablityUpdateForAccessoryID:assetID:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000070C4;
    v16[3] = &unk_1000286C0;
    v16[4] = self;
    id v17 = v14;
    id v18 = v7;
    dispatch_async((dispatch_queue_t)delegateQueue, v16);
  }
}

- (void)assetOnAssetServer:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  unsigned int v9 = [v8 reachable];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
    unsigned __int8 v11 = [v10 autoDownloadAllowed];

    if ((v11 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if ([v6 options])
  {
LABEL_7:
    uarpController = self->_uarpController;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
    -[UARPController downloadAvailableFirmwareUpdate:assetID:withUserIntent:]( uarpController,  "downloadAvailableFirmwareUpdate:assetID:withUserIntent:",  v14,  v7,  1LL);

    goto LABEL_8;
  }

  if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "assetAvailablityUpdateForAccessoryID:assetID:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007250;
    block[3] = &unk_1000286C0;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }

- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  unsigned int v9 = [v8 reachable];

  if (v9)
  {
    if ([v6 needsConsentToStage])
    {
      -[UARPHIDUpdater obtainConsentToStageForAccessoryID:](self, "obtainConsentToStageForAccessoryID:", v6);
    }

    else
    {
      uarpController = self->_uarpController;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
      id v17 = v12;
      int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
      -[UARPController stageFirmwareUpdateOnAccessoryList:withUserIntent:]( uarpController,  "stageFirmwareUpdateOnAccessoryList:withUserIntent:",  v13,  1LL);
    }
  }

  else if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "assetAvailablityUpdateForAccessoryID:assetID:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007418;
    block[3] = &unk_1000286C0;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }
}

- (void)assetOnDropbox:(id)a3 assetID:(id)a4
{
  uarpController = self->_uarpController;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 uarpAccessory]);
  -[UARPController downloadAvailableFirmwareUpdate:assetID:withUserIntent:]( uarpController,  "downloadAvailableFirmwareUpdate:assetID:withUserIntent:",  v7,  v6,  1LL);
}

- (void)assetNotFound:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modelNumber]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v9));

  [v6 setUpdateInProgress:0];
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  -[UARPHIDUpdater qReleasePowerAssertionForAccessory:](self, "qReleasePowerAssertionForAccessory:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uarpAccessory]);
  -[UARPHIDUpdater qPostStagingStatusNotificationForAccessory:status:]( self,  "qPostStagingStatusNotificationForAccessory:status:",  v12,  0LL);

  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000766C;
  block[3] = &unk_1000285A8;
  block[4] = self;
  id v14 = v6;
  id v20 = v14;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
  if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "assetAvailablityUpdateForAccessoryID:assetID:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100007774;
    v16[3] = &unk_1000286C0;
    v16[4] = self;
    id v17 = v14;
    id v18 = v7;
    dispatch_async((dispatch_queue_t)delegateQueue, v16);
  }
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007868;
  block[3] = &unk_1000286C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)_firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingComplete:assetID:withStatus:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@, assetID=%@, status=%lu",  buf,  0x2Au);
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v8));
  id v12 = v11;
  if (v11)
  {
    if (a5)
    {
      [v11 setUpdateInProgress:0];
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uarpAccessory]);
      -[UARPHIDUpdater qReleasePowerAssertionForAccessory:](self, "qReleasePowerAssertionForAccessory:", v13);

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 uarpAccessory]);
      -[UARPHIDUpdater qPostStagingStatusNotificationForAccessory:status:]( self,  "qPostStagingStatusNotificationForAccessory:status:",  v14,  0LL);
    }

    id v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      id v17 = (char *)objc_claimAutoreleasedReturnValue([v12 uarpAccessory]);
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v25 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Solicit TICS/MTIC (firmware staging complete) for HID <%@>",  buf,  0xCu);
    }

    -[UARPHIDUpdater _solicitDynamicAssetTICSForAccessory:](self, "_solicitDynamicAssetTICSForAccessory:", v8);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 uarpAccessory]);
    -[UARPHIDUpdater _solicitDynamicAssetMTICForAccessory:](self, "_solicitDynamicAssetMTICForAccessory:", v18);

    if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "firmwareStagingComplete:withStatus:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100007B3C;
      block[3] = &unk_1000286E8;
      block[4] = self;
      id v22 = v12;
      unint64_t v23 = a5;
      dispatch_async((dispatch_queue_t)delegateQueue, block);
    }
  }

  else
  {
    id v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingComplete:assetID:withStatus:]";
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  buf,  0x16u);
    }
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100007C34;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)applyStagedAssets:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v33 = "-[UARPHIDUpdater applyStagedAssets:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@", buf, 0x16u);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessoryID:](self, "getUARPHIDAccessoryForUARPAccessoryID:", v4));
  id v7 = (void *)v6;
  if (v6)
  {
    unsigned __int8 v25 = (void *)v6;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory supportedAccessoriesByTransport:]( &OBJC_CLASS___UARPSupportedAccessory,  "supportedAccessoriesByTransport:",  1LL));
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
LABEL_6:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 modelIdentifier]);
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) != 0) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }

      id v17 = v13;

      if (!v17) {
        goto LABEL_17;
      }
      id v7 = v25;
      if ([v17 autoAppliesStagedFirmware])
      {
        id v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          __int16 v19 = v18;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
          *(_DWORD *)buf = 136315394;
          __int128 v33 = "-[UARPHIDUpdater applyStagedAssets:]";
          __int16 v34 = 2112;
          id v35 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s: Accessory Identifier %@ auro-applies firmware ",  buf,  0x16u);
        }

        goto LABEL_19;
      }
    }

    else
    {
LABEL_12:

      id v17 = 0LL;
LABEL_17:
      id v7 = v25;
    }

    uarpController = self->_uarpController;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 uarpAccessory]);
    __int16 v30 = v22;
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    -[UARPController applyStagedFirmwareOnAccessoryList:withUserIntent:]( uarpController,  "applyStagedFirmwareOnAccessoryList:withUserIntent:",  v23,  0LL);

LABEL_19:
  }

  else
  {
    id v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v33 = "-[UARPHIDUpdater applyStagedAssets:]";
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  buf,  0x16u);
    }
  }
}

- (void)_assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v47 = "-[UARPHIDUpdater _assetSolicitationComplete:assetID:withStatus:]";
    __int16 v48 = 2112;
    id v49 = v8;
    __int16 v50 = 2112;
    id v51 = v9;
    __int16 v52 = 2048;
    unint64_t v53 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@, assetID=%@, status=%lu",  buf,  0x2Au);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v8));
  if (v11)
  {
    uint64_t v12 = (char *)uarpAssetTagStructAnalytics();
    id v13 = [[UARPAssetTag alloc] initWithChar1:*v12 char2:v12[1] char3:v12[2] char4:v12[3]];
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 tag]);
    unsigned int v15 = [v14 isEqual:v13];

    if (!a5 && v15)
    {
      id v16 = objc_alloc(&OBJC_CLASS___UARPDynamicAssetAnalyticsEvent);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 localURL]);
      id v18 = [v16 initWithURL:v17];
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[UARPDynamicAssetMappedAnalyticsEvent tag]( &OBJC_CLASS___UARPDynamicAssetMappedAnalyticsEvent,  "tag"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 tag]);
    unsigned int v21 = [v20 isEqual:v19];

    if (!a5 && v21)
    {
      id v22 = objc_alloc(&OBJC_CLASS___UARPDynamicAssetMappedAnalyticsEvent);
      unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 localURL]);
      id v24 = [v22 initWithURL:v23];

      if (([v24 prepareAndSend] & 1) == 0)
      {
        unsigned __int8 v25 = self->_log;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10001C604(v25, v26, v27, v28, v29, v30, v31, v32);
        }
      }
    }

    if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "assetSolicitationComplete:withStatus:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100008390;
      block[3] = &unk_1000286E8;
      block[4] = self;
      id v44 = v11;
      unint64_t v45 = a5;
      dispatch_async((dispatch_queue_t)delegateQueue, block);
    }

    if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "assetSolicitationComplete:assetID:withStatus:") & 1) != 0)
    {
      __int16 v34 = self->_delegateQueue;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1000083DC;
      v39[3] = &unk_100028710;
      v39[4] = self;
      id v40 = v11;
      id v41 = v9;
      unint64_t v42 = a5;
      dispatch_async((dispatch_queue_t)v34, v39);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue([v8 pendingAssets]);
    id v36 = [v35 count];

    if (!v36 && !self->_unregisterOnComplete)
    {
      v37 = self->_log;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[UARPHIDUpdater _assetSolicitationComplete:assetID:withStatus:]";
        __int16 v48 = 2112;
        id v49 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%s: Configured to not unregister upon completion for UARPAccessory %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    int v38 = self->_log;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[UARPHIDUpdater _assetSolicitationComplete:assetID:withStatus:]";
      __int16 v48 = 2112;
      id v49 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  buf,  0x16u);
    }
  }
}

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000084D4;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)_accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v8 = @"NO";
    *(_DWORD *)buf = 136315650;
    unint64_t v16 = "-[UARPHIDUpdater _accessoryTransportNeeded:isNeeded:]";
    __int16 v17 = 2112;
    id v18 = v6;
    if (v4) {
      id v8 = @"YES";
    }
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: accessory=%@, isNeeded=%@", buf, 0x20u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v6));
  if (v9)
  {
    if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "accessoryTransportNeeded:isNeeded:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000086B4;
      block[3] = &unk_100028738;
      block[4] = self;
      id v13 = v9;
      BOOL v14 = v4;
      dispatch_async((dispatch_queue_t)delegateQueue, block);
    }
  }

  else
  {
    id v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v16 = "-[UARPHIDUpdater _accessoryTransportNeeded:isNeeded:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  buf,  0x16u);
    }
  }
}

- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4
{
  id v6 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000878C;
  block[3] = &unk_100028738;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)_queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:manufacturer:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000088B0;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:0 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000089C4;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:modelName:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100008AE8;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:1 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008BFC;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:firmwareVersion:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100008D20;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:4 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008E34;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector( self->_goldRestoreDelegate,  "queryCompleteForAccessoryID:stagedFirmwareVersion:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100008F58;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:5 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000906C;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10
    && [v10 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:stats:error:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000917C;
    v13[3] = &unk_100028558;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009290;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:hardwareVersion:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000093B4;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:3 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000094C8;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:serialNumber:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000095EC;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:2 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009700;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:appleModelNumber:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100009890;
      v17[3] = &unk_100028558;
      v17[4] = self;
      id v18 = v11;
      id v19 = v8;
      id v20 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v17);
    }

    else
    {
      if (!v9)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessoryID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 modelNumber]);
        unsigned __int8 v15 = [v8 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            sub_10001C674((uint64_t)v8, log, v11);
          }
        }
      }

      [v11 updateProperty:11 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000099A4;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:hwFusingType:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100009AC8;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:12 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009BDC;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  BOOL v11 = v10;
  if (v10)
  {
    if ([v10 goldrestoreQueryInProgress]
      && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:friendlyName:error:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100009D00;
      v13[3] = &unk_100028558;
      v13[4] = self;
      id v14 = v11;
      id v15 = v8;
      id v16 = v9;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }

    else
    {
      [v11 updateProperty:13 value:v8];
    }
  }
}

- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009E14;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009EEC;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A0CC;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A29C;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A46C;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A63C;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A80C;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A9DC;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000ABAC;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000AD7C;
  v13[3] = &unk_100028710;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000AF50;
  v13[3] = &unk_100028760;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000B12C;
  v13[3] = &unk_100028760;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000B308;
  v13[3] = &unk_100028760;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000B4E4;
  v13[3] = &unk_100028760;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
}

- (void)_queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  id v11 = v10;
  if (v10
    && [v10 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:appleModelNumber:error:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000B710;
    v13[3] = &unk_100028558;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessoryID:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000B824;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  id v11 = v10;
  if (v10
    && [v10 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:hwFusingType:error:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000B934;
    v13[3] = &unk_100028558;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessoryID:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000BA48;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  id v11 = v10;
  if (v10
    && [v10 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "queryCompleteForAccessoryID:friendlyName:error:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000BB58;
    v13[3] = &unk_100028558;
    v13[4] = self;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, v13);
  }
}

- (void)queryCompleteForAccessoryID:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uarpHIDQueue = self->_uarpHIDQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000BC6C;
  v15[3] = &unk_100028558;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v15);
}

- (void)_firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v10));
  log = self->_log;
  BOOL v14 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315906;
      unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingProgress:assetID:bytesSent:bytesTotal:]";
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2048;
      double v31 = (float)((float)((float)a5 / (float)a6) * 100.0);
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@, assetID=%@, progress=%f",  buf,  0x2Au);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 lastReportedStagingTime]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dateByAddingTimeInterval:300.0]);

    if ([v15 compare:v17] == (id)1)
    {
      [v12 setLastReportedStagingTime:v15];
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 uarpAccessory]);
      -[UARPHIDUpdater qPostStagingStatusNotificationForAccessory:status:]( self,  "qPostStagingStatusNotificationForAccessory:status:",  v18,  1LL);
    }

    if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "firmwareStagingProgress:bytesSent:bytesTotal:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10000BEF8;
      v20[3] = &unk_100028788;
      v20[4] = self;
      id v21 = v12;
      unint64_t v22 = a5;
      unint64_t v23 = a6;
      dispatch_async((dispatch_queue_t)delegateQueue, v20);
    }
  }

  else if (v14)
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v25 = "-[UARPHIDUpdater _firmwareStagingProgress:assetID:bytesSent:bytesTotal:]";
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  buf,  0x16u);
  }
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C000;
  block[3] = &unk_1000287B0;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)_assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v10));
  log = self->_log;
  BOOL v14 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315906;
      id v21 = "-[UARPHIDUpdater _assetSolicitationProgress:assetID:bytesReceived:bytesTotal:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2048;
      double v27 = (float)((float)((float)a5 / (float)a6) * 100.0);
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@, assetID=%@, progress=%f",  buf,  0x2Au);
    }

    delegateQueue = self->_delegateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000C1EC;
    v16[3] = &unk_100028788;
    v16[4] = self;
    id v17 = v12;
    unint64_t v18 = a5;
    unint64_t v19 = a6;
    dispatch_async((dispatch_queue_t)delegateQueue, v16);
  }

  else if (v14)
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[UARPHIDUpdater _assetSolicitationProgress:assetID:bytesReceived:bytesTotal:]";
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  buf,  0x16u);
  }
}

- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C2F4;
  block[3] = &unk_1000287B0;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v17 = 0LL;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  uarpHIDQueue = self->_uarpHIDQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000C3E4;
  v13[3] = &unk_100028620;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v16 = &v17;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v13);
  LOBYTE(uarpHIDQueue) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)uarpHIDQueue;
}

- (void)_stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v6));
  if (v7
    && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "stagedFirmwareApplicationComplete:withStatus:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C56C;
    block[3] = &unk_1000286E8;
    block[4] = self;
    id v14 = v7;
    unint64_t v15 = a4;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 pendingAssets]);
  id v10 = [v9 count];

  if (!v10)
  {
    [v7 setUpdateInProgress:0];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uarpAccessory]);
    -[UARPHIDUpdater qReleasePowerAssertionForAccessory:](self, "qReleasePowerAssertionForAccessory:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uarpAccessory]);
    -[UARPHIDUpdater qPostStagingStatusNotificationForAccessory:status:]( self,  "qPostStagingStatusNotificationForAccessory:status:",  v12,  0LL);
  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C644;
  block[3] = &unk_1000286E8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)_stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  a3));
  if (v6
    && (objc_opt_respondsToSelector(self->_goldRestoreDelegate, "stagedFirmwareRescindComplete:withStatus:") & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C6FC;
    block[3] = &unk_1000286E8;
    block[4] = self;
    id v9 = v6;
    unint64_t v10 = a4;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }
}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C7D4;
  block[3] = &unk_1000286E8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
}

- (id)createAndSaveUARPHIDAccessoryFromService:(unsigned int)a3 identifier:(id)a4
{
  id v8 = a4;
  CFMutableDictionaryRef properties = 0LL;
  IOHIDDeviceRef v9 = IOHIDDeviceCreate(kCFAllocatorDefault, a3);
  if (!v9)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10001C738();
    }
    goto LABEL_44;
  }

  IOHIDDeviceRef v10 = v9;
  IORegistryEntryCreateCFProperties(a3, &properties, kCFAllocatorDefault, 0);
  if (!properties)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10001C7A8();
    }
LABEL_44:
    __int16 v39 = 0LL;
    goto LABEL_61;
  }

  IOHIDDeviceRef v68 = v10;
  Value = CFDictionaryGetValue(properties, @"SerialNumber");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(Value);
  id v13 = CFDictionaryGetValue(properties, @"LocationID");
  v72 = (void *)objc_claimAutoreleasedReturnValue(v13);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v89 = "-[UARPHIDUpdater createAndSaveUARPHIDAccessoryFromService:identifier:]";
    __int16 v90 = 2112;
    id v91 = v12;
    __int16 v92 = 2112;
    id v93 = v72;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: serialNumber=%@ locationID=%@", buf, 0x20u);
  }

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  v63 = self;
  obj = self->_uarpHIDAccessories;
  id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v81,  v96,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v82;
LABEL_7:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v82 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v81 + 1) + 8 * v18);
      if (v12)
      {
        BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v81 + 1) + 8 * v18) uarpAccessoryID]);
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
        if ([v5 isEqualToString:v12])
        {

LABEL_46:
          id v40 = v63->_log;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = v40;
            unint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v19 uarpAccessoryID]);
            *(_DWORD *)buf = 136315906;
            v89 = "-[UARPHIDUpdater createAndSaveUARPHIDAccessoryFromService:identifier:]";
            __int16 v90 = 2112;
            id v91 = v42;
            __int16 v92 = 2112;
            id v93 = v12;
            __int16 v94 = 2112;
            v95 = v72;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%s: hidAccessory %@ exists for serialNumber %@, locationID = %@",  buf,  0x2Au);
          }

          __int16 v39 = v19;
          __int16 v22 = (UARPHIDAccessory *)obj;
          goto LABEL_60;
        }

        if (v72)
        {
LABEL_15:
          char v20 = (void *)objc_claimAutoreleasedReturnValue([v19 locationID]);
          unsigned int v21 = [v20 isEqualToNumber:v72];

          if (v12)
          {

            if ((v21 & 1) != 0) {
              goto LABEL_46;
            }
          }

          else if (v21)
          {
            goto LABEL_46;
          }

          goto LABEL_19;
        }
      }

      else if (v72)
      {
        goto LABEL_15;
      }

- (void)queryPropertiesForUARPHIDAccessory:(id)a3 completionCallback:(id)a4
{
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_10000D0FC;
  id v15 = &unk_1000287D8;
  id v16 = self;
  id v17 = a4;
  id v6 = v17;
  id v7 = a3;
  [v7 internalQueryStartWithCompletionCallback:&v12];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "propertiesToQuery", v12, v13, v14, v15, v16));
  IOHIDDeviceRef v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  IOHIDDeviceRef v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v9));

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uarpAccessoryID]);
  -[UARPHIDUpdater _queryProperties:accessoryID:goldrestoreQuery:]( self,  "_queryProperties:accessoryID:goldrestoreQuery:",  v10,  v11,  0LL);
}

- (id)createUARPAccessoryFromAccessoryID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[UARPHIDUpdater uuidForAccessoryID:](self, "uuidForAccessoryID:", v4));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 productGroup]);
  if (v6
    && (id v7 = (void *)v6,
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 productNumber]),
        v8,
        v7,
        v8))
  {
    IOHIDDeviceRef v9 = objc_alloc(&OBJC_CLASS___UARPAccessory);
    IOHIDDeviceRef v10 = (void *)objc_claimAutoreleasedReturnValue([v4 productGroup]);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 productNumber]);
    id v12 = -[UARPAccessory initWithProductGroup:productNumber:uuid:]( v9,  "initWithProductGroup:productNumber:uuid:",  v10,  v11,  v5);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
    IOHIDDeviceRef v10 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v13));

    id v14 = objc_alloc(&OBJC_CLASS___UARPAccessory);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hardwareID]);
    id v12 = -[UARPAccessory initWithHardwareID:uuid:](v14, "initWithHardwareID:uuid:", v11, v5);
  }

  id v15 = v12;

  -[UARPAccessory setSuppressAutomaticDynamicAssets:]( v15,  "setSuppressAutomaticDynamicAssets:",  [v4 suppressAutomaticDynamicAssets]);
  -[UARPAccessory setSuppressInfoQueries:](v15, "setSuppressInfoQueries:", [v4 suppressInfoQueries]);

  return v15;
}

- (id)uuidForAccessoryID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 productGroup]);
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 productNumber]);

      if (v8)
      {
        IOHIDDeviceRef v9 = (void *)objc_claimAutoreleasedReturnValue([v4 productGroup]);
        IOHIDDeviceRef v10 = (void *)objc_claimAutoreleasedReturnValue([v4 productNumber]);
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@-%@",  v9,  v10,  v11));

        goto LABEL_7;
      }
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);

    if (v13)
    {
      IOHIDDeviceRef v9 = (void *)objc_claimAutoreleasedReturnValue([v4 modelNumber]);
      IOHIDDeviceRef v10 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v9,  v10));
LABEL_7:

      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_database, "objectForKey:", v12));
      if (v14)
      {
        id v15 = (void *)v14;
        id v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSUUID),  v14,  0LL);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = v17;
          __int16 v24 = 2112;
          id v25 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Found UUID:%@ for accessoryID:%@ in database",  buf,  0x16u);
        }

        if (v17)
        {
          uint64_t v19 = v15;
LABEL_17:

          goto LABEL_18;
        }

        -[NSUserDefaults removeObjectForKey:](self->_database, "removeObjectForKey:", v12);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  0LL));

        -[NSUserDefaults setObject:forKey:](self->_database, "setObject:forKey:", v19, v12);
        char v20 = self->_log;
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
      }

      else
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  0LL));
        -[NSUserDefaults setObject:forKey:](self->_database, "setObject:forKey:", v19, v12);
        char v20 = self->_log;
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
      }

      *(_DWORD *)buf = 138412546;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Created new UUID:%@ for accessoryID:%@ in database",  buf,  0x16u);
      goto LABEL_17;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
LABEL_18:

  return v17;
}

- (id)getUARPHIDAccessoryForUARPAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100003E7C;
  id v16 = sub_100003E8C;
  id v17 = 0LL;
  uarpHIDAccessories = self->_uarpHIDAccessories;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000D758;
  v9[3] = &unk_100028800;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  -[NSMutableSet enumerateObjectsUsingBlock:](uarpHIDAccessories, "enumerateObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getUARPHIDAccessoryForUARPAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100003E7C;
  id v16 = sub_100003E8C;
  id v17 = 0LL;
  uarpHIDAccessories = self->_uarpHIDAccessories;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000D8CC;
  v9[3] = &unk_100028800;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  -[NSMutableSet enumerateObjectsUsingBlock:](uarpHIDAccessories, "enumerateObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)registerHIDForAccessory:(id)a3
{
  id v4 = a3;
  IOReturn v5 = IOHIDDeviceOpen((IOHIDDeviceRef)[v4 hidDeviceRef], 0);
  if (!v5)
  {
    IOHIDDeviceRegisterRemovalCallback( (IOHIDDeviceRef)[v4 hidDeviceRef],  (IOHIDCallback)sub_10000DAD0,  v4);
    id v6 = (__IOHIDDevice *)[v4 hidDeviceRef];
    id v7 = objc_claimAutoreleasedReturnValue([v4 hidBuffer]);
    id v8 = (uint8_t *)[v7 mutableBytes];
    IOHIDDeviceRef v9 = (void *)objc_claimAutoreleasedReturnValue([v4 hidBuffer]);
    IOHIDDeviceRegisterInputReportCallback( v6,  v8,  (CFIndex)[v9 length],  (IOHIDReportCallback)sub_10000DC10,  v4);

    ++self->_hidDevicesRegistered;
    uarpHIDRegistrationThread = self->_uarpHIDRegistrationThread;
    if (uarpHIDRegistrationThread)
    {
      -[UARPHIDUpdater performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "scheduleHIDDeviceForAccessory:",  uarpHIDRegistrationThread,  v4,  1LL);
    }

    else
    {
      unint64_t v11 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "runHIDRegistrationThread:",  v4);
      uint64_t v12 = self->_uarpHIDRegistrationThread;
      self->_uarpHIDRegistrationThread = v11;

      -[NSThread start](self->_uarpHIDRegistrationThread, "start");
      uarpHIDRegistrationThreadSemaphore = self->_uarpHIDRegistrationThreadSemaphore;
      dispatch_time_t v14 = dispatch_time(0LL, 2000000000LL);
      if (dispatch_semaphore_wait((dispatch_semaphore_t)uarpHIDRegistrationThreadSemaphore, v14))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          sub_10001C8A4(log, v16, v17, v18, v19, v20, v21, v22);
        }
      }
    }
  }

  return v5 == 0;
}

- (BOOL)registerHIDCallbacksForUARPHIDAccessory:(id)a3
{
  id v4 = a3;
  if (![v4 hidDeviceRef])
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10001C914();
    }
    goto LABEL_8;
  }

  if (![v4 hidDeviceScheduled])
  {
    objc_msgSend( v4,  "setHidReportSizeInput:",  -[UARPHIDUpdater getReportSizeForReportUsage:forAccessory:]( self,  "getReportSizeForReportUsage:forAccessory:",  1,  v4) >> 3);
    if ([v4 hidReportSizeInput])
    {
      objc_msgSend( v4,  "setHidReportSizeOutput:",  -[UARPHIDUpdater getReportSizeForReportUsage:forAccessory:]( self,  "getReportSizeForReportUsage:forAccessory:",  2,  v4) >> 3);
      if ([v4 hidReportSizeOutput])
      {
        IOReturn v5 = -[NSMutableData initWithLength:]( [NSMutableData alloc],  "initWithLength:",  [v4 hidReportSizeInput] + 1);
        [v4 setHidBuffer:v5];

        BOOL v6 = -[UARPHIDUpdater registerHIDForAccessory:](self, "registerHIDForAccessory:", v4);
        goto LABEL_9;
      }
    }

- (BOOL)unRegisterHIDCallbacksForUARPHIDAccessory:(id)a3
{
  id v4 = a3;
  if ([v4 hidDeviceScheduled])
  {
    if ([v4 hidDeviceScheduled])
    {
      --self->_hidDevicesRegistered;
      -[UARPHIDUpdater performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "unScheduleHIDDeviceForAccessory:",  self->_uarpHIDRegistrationThread,  v4,  1LL);
      IOHIDDeviceClose((IOHIDDeviceRef)[v4 hidDeviceRef], 0);
      CFRelease([v4 hidDeviceRef]);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315394;
        __int16 v11 = "-[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:]";
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@ now unregistered for HID Callbacks",  (uint8_t *)&v10,  0x16u);
      }
    }

    if (!self->_hidDevicesRegistered)
    {
      BOOL v6 = self->_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        __int16 v11 = "-[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s: No more accessories registered for HID Callbacks, cancelling _uarpHIDRegistrationThread",  (uint8_t *)&v10,  0xCu);
      }

      -[UARPHIDUpdater performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "stopHIDRegistrationThread",  self->_uarpHIDRegistrationThread,  0LL,  1LL);
      -[NSThread cancel](self->_uarpHIDRegistrationThread, "cancel");
      uarpHIDRegistrationThread = self->_uarpHIDRegistrationThread;
      self->_uarpHIDRegistrationThread = 0LL;
    }

    [v4 setHidReportSizeInput:0];
    [v4 setHidReportSizeOutput:0];
    [v4 setHidReportID:0];
    [v4 setExpectedHIDMessageID:1];
    [v4 setHidMessageID:0];
    [v4 setHidDeviceScheduled:0];
    -[NSMutableSet removeObject:](self->_uarpHIDAccessories, "removeObject:", v4);
  }

  else
  {
    int v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      __int16 v11 = "-[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: accessory=%@ already unRegistered for HID Callbacks",  (uint8_t *)&v10,  0x16u);
    }
  }

  return 1;
}

- (unsigned)getReportSizeForReportUsage:(unsigned int)a3 forAccessory:(id)a4
{
  id v5 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  BOOL v6 =  IOHIDDeviceCopyMatchingElements( (IOHIDDeviceRef)[v5 hidDeviceRef],  (CFDictionaryRef)&off_1000292C0,  0);
  id v7 = -[__CFArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(__IOHIDElement **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (IOHIDElementGetUsage(v11) == a3)
        {
          uint32_t ReportSize = IOHIDElementGetReportSize(v11);
          unsigned __int8 ReportID = IOHIDElementGetReportID(v11);
          objc_msgSend(v5, "setHidReportID:", ReportID, (void)v15);
          goto LABEL_11;
        }
      }

      id v8 = -[__CFArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint32_t ReportSize = 0;
LABEL_11:

  return ReportSize;
}

- (BOOL)sendHIDReportToAccessory:(id)a3 forUARPMessage:(id)a4 error:(id *)a5
{
  id v7 = (NSMutableData *)a3;
  id v8 = (NSMutableData *)a4;
  uint64_t v9 = v8;
  int v10 = 0LL;
  BOOL v11 = 0;
  __int16 v12 = 0LL;
  if (!v7 || !v8) {
    goto LABEL_13;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
    __int16 v38 = 2112;
    __int16 v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Sending uarpMsg %@ to accessory", buf, 0x16u);
  }

  dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessory:]( self,  "getUARPHIDAccessoryForUARPAccessory:",  v7));
  if (v14)
  {
    __int16 v12 = v14;
    if ([v14 hidDeviceScheduled])
    {
      unsigned __int16 v35 = (unsigned __int16)-[NSMutableData length](v9, "length");
      int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 transport]);
      unsigned int v16 = [v15 containsString:@"Bluetooth"];

      if (v16)
      {
        buf[0] = [v12 hidReportID];
        -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", buf, 1LL);
      }

      __int16 v34 = (self->_sessionID << 14) | 2;
      -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", &v34, 2LL);
      objc_msgSend(v12, "setHidMessageID:", (unsigned __int16)((unsigned __int16)objc_msgSend(v12, "hidMessageID") + 1));
      unsigned __int16 v33 = (unsigned __int16)[v12 hidMessageID];
      -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", &v33, 2LL);
      -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", &v35, 2LL);
      __int128 v17 = v9;
      -[NSMutableData appendBytes:length:]( v10,  "appendBytes:length:",  -[NSMutableData bytes](v17, "bytes"),  -[NSMutableData length](v17, "length"));
      NSUInteger v18 = -[NSMutableData length](v10, "length");
      unsigned int v19 = [v12 hidReportSizeOutput];
      uint64_t v20 = self->_log;
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v18 > v19)
      {
        if (v21)
        {
          __int16 v28 = v20;
          unsigned int v29 = -[NSMutableData length](v10, "length");
          unsigned int v30 = [v12 hidReportSizeOutput];
          *(_DWORD *)buf = 134218240;
          v37 = v29;
          __int16 v38 = 1024;
          LODWORD(v39) = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "ERROR: Size of outputReport %lu > HID Output Report Size from accessory descriptor %d",  buf,  0x12u);
        }
      }

      else
      {
        if (v21)
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
          __int16 v38 = 2112;
          __int16 v39 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s: Sending hidReport %@ to accessory",  buf,  0x16u);
        }

        uint64_t v22 = (__IOHIDDevice *)[v12 hidDeviceRef];
        CFIndex v23 = [v12 hidReportID];
        int v10 = v10;
        BOOL v11 = 1;
        IOReturn v24 = IOHIDDeviceSetReport( v22,  kIOHIDReportTypeOutput,  v23,  (const uint8_t *)-[NSMutableData bytes](v10, "bytes"),  (int)-[NSMutableData length](v10, "length"));
        if (!v24) {
          goto LABEL_13;
        }
        IOReturn v31 = v24;
        id v32 = self->_log;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v37) = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "Failed to send HID Report status = 0x%x\n",  buf,  8u);
        }
      }

      BOOL v11 = 0;
      goto LABEL_13;
    }

    double v27 = self->_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
      __int16 v38 = 2112;
      __int16 v39 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s: Unregistered UARPAccessory %@, dropping it",  buf,  0x16u);
    }

    BOOL v11 = 0;
    int v10 = 0LL;
  }

  else
  {
    __int16 v26 = self->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[UARPHIDUpdater sendHIDReportToAccessory:forUARPMessage:error:]";
      __int16 v38 = 2112;
      __int16 v39 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s: Unknown UARPAccessory %@, dropping it",  buf,  0x16u);
    }

    BOOL v11 = 0;
    int v10 = 0LL;
    __int16 v12 = 0LL;
  }

- (id)matchingDictionaryForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v4));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hardwareID]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UARPAccessoryHardwareHID);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 hardwareID]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v9 vendorID]));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v9 productID]));

    if (v10) {
      BOOL v12 = v11 == 0LL;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater matchingDictionaryForVendorID:productID:]( self,  "matchingDictionaryForVendorID:productID:",  v10,  v11));
      goto LABEL_11;
    }
  }

  else
  {
    int v10 = 0LL;
    BOOL v11 = 0LL;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10001C984();
  }
  id v13 = 0LL;
LABEL_11:

  return v13;
}

- (id)matchingDictionaryForIdentifier:(id)a3 hardwareID:(UARPHIDHardwareID *)a4
{
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hardwareID]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UARPAccessoryHardwareHID);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 hardwareID]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v10 vendorID]));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v10 productID]));

    if (v11) {
      BOOL v13 = v12 == 0LL;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater matchingDictionaryForVendorID:productID:]( self,  "matchingDictionaryForVendorID:productID:",  v11,  v12));
      goto LABEL_11;
    }
  }

  else
  {
    BOOL v11 = 0LL;
    BOOL v12 = 0LL;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_10001C984();
  }
  dispatch_time_t v14 = 0LL;
LABEL_11:

  return v14;
}

- (id)matchingDictionaryForVendorID:(id)a3 productID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 70LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 65280LL));
  CFMutableDictionaryRef v9 = IOServiceMatching("IOHIDDevice");
  -[__CFDictionary setObject:forKey:](v9, "setObject:forKey:", v6, @"VendorID");

  -[__CFDictionary setObject:forKey:](v9, "setObject:forKey:", v5, @"ProductID");
  -[__CFDictionary setObject:forKey:](v9, "setObject:forKey:", v7, @"DeviceUsage");
  -[__CFDictionary setObject:forKey:](v9, "setObject:forKey:", v8, @"DeviceUsagePage");
  -[__CFDictionary setObject:forKey:](v9, "setObject:forKey:", &__kCFBooleanTrue, @"IOMatchLaunchStream");

  return v9;
}

- (void)runHIDRegistrationThread:(id)a3
{
}

- (void)stopHIDRegistrationThread
{
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)scheduleHIDDeviceForAccessory:(id)a3
{
  id v4 = a3;
  Current = CFRunLoopGetCurrent();
  IOHIDDeviceScheduleWithRunLoop((IOHIDDeviceRef)[v4 hidDeviceRef], Current, kCFRunLoopDefaultMode);
  [v4 setHidDeviceScheduled:1];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPHIDUpdater scheduleHIDDeviceForAccessory:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@ now scheduled for HID Callbacks",  (uint8_t *)&v7,  0x16u);
  }
}

- (void)unScheduleHIDDeviceForAccessory:(id)a3
{
  id v4 = a3;
  Current = CFRunLoopGetCurrent();
  IOHIDDeviceUnscheduleFromRunLoop((IOHIDDeviceRef)[v4 hidDeviceRef], Current, kCFRunLoopDefaultMode);
  [v4 setHidDeviceScheduled:0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPHIDUpdater unScheduleHIDDeviceForAccessory:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@ now unscheduled for HID Callbacks",  (uint8_t *)&v7,  0x16u);
  }
}

- (void)handleHIDDisconnectForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 updateInProgress])
    {
      [v5 setUpdateInProgress:0];
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uarpAccessory]);
      -[UARPHIDUpdater qReleasePowerAssertionForAccessory:](self, "qReleasePowerAssertionForAccessory:", v6);

      int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uarpAccessory]);
      -[UARPHIDUpdater qPostStagingStatusNotificationForAccessory:status:]( self,  "qPostStagingStatusNotificationForAccessory:status:",  v7,  0LL);
    }

    uarpController = self->_uarpController;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 uarpAccessory]);
    -[UARPController removeAccessory:](uarpController, "removeAccessory:", v9);

    if ((objc_opt_respondsToSelector(self->_goldRestoreDelegate, "firmwareStagingComplete:withStatus:") & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      BOOL v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472LL;
      dispatch_time_t v14 = sub_10000EE8C;
      __int128 v15 = &unk_1000285A8;
      unsigned int v16 = self;
      id v17 = v5;
      dispatch_async((dispatch_queue_t)delegateQueue, &v12);
    }

    -[UARPHIDUpdater unRegisterHIDCallbacksForUARPHIDAccessory:]( self,  "unRegisterHIDCallbacksForUARPHIDAccessory:",  v5,  v12,  v13,  v14,  v15,  v16);
    -[NSMutableSet removeObject:](self->_uarpHIDAccessories, "removeObject:", v5);
    [v5 handleHIDDisconnect];
    if (!-[NSMutableSet count](self->_uarpHIDAccessories, "count"))
    {
      BOOL v11 = self->_uarpController;
      self->_uarpController = 0LL;
    }
  }
}

- (void)parseInputReport:(id)a3 forAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EF7C;
  block[3] = &unk_1000286C0;
  id v12 = v6;
  id v13 = v7;
  dispatch_time_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)processUARPMessage:(id)a3 fromAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  id v9 = 0LL;
  if (v6)
  {
    if (v7)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue([v7 uarpAccessory]);

      if (v9)
      {
        uarpController = self->_uarpController;
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uarpAccessory]);
        id v14 = 0LL;
        unsigned __int8 v12 = -[UARPController recvDataFromAccessory:data:error:]( uarpController,  "recvDataFromAccessory:data:error:",  v11,  v6,  &v14);
        id v9 = v14;

        if ((v12 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v16 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "ERROR: Received UARPController recvDataFromAccessory error: %@",  buf,  0xCu);
          }
        }
      }
    }
  }
}

- (void)stopPacketCapture
{
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F2FC;
  block[3] = &unk_100028828;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)solicitDynamicAssetForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F3B0;
  block[3] = &unk_1000286C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
}

- (void)removeAccessoryID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater getUARPHIDAccessoryForUARPAccessoryID:]( self,  "getUARPHIDAccessoryForUARPAccessoryID:",  a3));
  if (v4)
  {
    uarpController = self->_uarpController;
    id v7 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uarpAccessory]);
    -[UARPController accessoryUnreachable:](uarpController, "accessoryUnreachable:", v6);

    id v4 = v7;
  }
}

- (void)startTapToRadar:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F7C8;
  v7[3] = &unk_1000285A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v7);
}

- (void)stopTapToRadar
{
  uarpHIDQueue = self->_uarpHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F84C;
  block[3] = &unk_100028828;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, block);
}

- (id)pendingTatsuRequests
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UARPHIDUpdater pendingTatsuRequests]";
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s:", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100003E7C;
  id v17 = sub_100003E8C;
  NSUInteger v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uarpHIDQueue = self->_uarpHIDQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000FA28;
  v9[3] = &unk_100028850;
  void v9[4] = self;
  v9[5] = &buf;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, v9);
  id v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*((void *)&buf + 1) + 40LL);
    *(_DWORD *)id v10 = 136315394;
    BOOL v11 = "-[UARPHIDUpdater pendingTatsuRequests]";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: Pending Tatsu Requests %@", v10, 0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithArray:]( &OBJC_CLASS___NSArray,  "arrayWithArray:",  *(void *)(*((void *)&buf + 1) + 40LL)));
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (void)tssResponse:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    BOOL v11 = "-[UARPHIDUpdater tssResponse:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Tatsu Response, %@", buf, 0x16u);
  }

  uarpHIDQueue = self->_uarpHIDQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000FB88;
  v8[3] = &unk_1000285A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)uarpHIDQueue, v8);
}

- (void)assetStagingPause:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000FC10;
  v7[3] = &unk_1000285A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v7);
}

- (void)assetStagingResume:(id)a3
{
  id v4 = a3;
  uarpHIDQueue = self->_uarpHIDQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000FC9C;
  v7[3] = &unk_1000285A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)uarpHIDQueue, v7);
}

- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate
{
  return (GoldRestoreUARPStatusDelegate *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setGoldRestoreDelegate:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)uarpHIDQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUarpHIDQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end