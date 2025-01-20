@interface AADeviceManagerDaemon
+ (id)sharedAADeviceManagerDaemon;
- (AADeviceManagerDaemon)init;
- (BOOL)_accessoryDevicePerformActionsOnChange:(id)a3;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (id)_getCurrentAudioOwner;
- (id)availableDevices;
- (id)descriptionWithLevel:(int)a3;
- (void)_aaControllerEnsureStarted;
- (void)_aaControllerEnsureStopped;
- (void)_aaDeviceRecordsMultiUserEnvChangedUseDefaultsForAddresses:(id)a3;
- (void)_aaDeviceRecordsRemovedWithRecords:(id)a3;
- (void)_aaDeviceRecordsUpdatedWithRecords:(id)a3;
- (void)_accessoryDeviceFound:(id)a3 withChange:(BOOL)a4;
- (void)_accessoryDeviceInfoChanged:(id)a3;
- (void)_accessoryDeviceRemoveOffListeningModeIfNeeded:(id)a3;
- (void)_accessoryDeviceUpdateCloudRecord:(id)a3 config:(id)a4;
- (void)_activate;
- (void)_cbControllerEnsureStarted;
- (void)_cbControllerEnsureStopped;
- (void)_cbDiscoveryEnsureStarted;
- (void)_cbDiscoveryEnsureStopped;
- (void)_cloudSyncEnsureStarted;
- (void)_cloudSyncEnsureStopped;
- (void)_coreBluetoothDeviceFound:(id)a3;
- (void)_coreBluetoothDeviceLost:(id)a3;
- (void)_handleAssistantLanguageChanged:(id)a3;
- (void)_invalidate;
- (void)_languageChangeMonitoringEnsureStarted;
- (void)_languageChangeMonitoringEnsureStopped;
- (void)_loadDeviceRecordForDevice:(id)a3;
- (void)_saveDeviceRecordForDevice:(id)a3;
- (void)_sendCloudConfigsToDevice:(id)a3;
- (void)_sendConfigOverAAController:(id)a3 device:(id)a4 completion:(id)a5;
- (void)_sendConfigOverCBController:(id)a3 device:(id)a4 completion:(id)a5;
- (void)_sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_sendSiriMultitoneConfigToDevice:(id)a3;
- (void)aaDeviceRecordsMultiUserEnvChangedUseDefaultsForAddresses:(id)a3;
- (void)aaDeviceRecordsRemovedWithRecords:(id)a3;
- (void)aaDeviceRecordsUpdatedWithRecords:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)smartRoutingStateUpdated:(unsigned int)a3 ForDeviceIdentifier:(id)a4;
@end

@implementation AADeviceManagerDaemon

+ (id)sharedAADeviceManagerDaemon
{
  if (qword_1002371F8 != -1) {
    dispatch_once(&qword_1002371F8, &stru_1002065D0);
  }
  return (id)qword_1002371F0;
}

- (AADeviceManagerDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AADeviceManagerDaemon;
  v2 = -[AADeviceManagerDaemon init](&v9, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("AADeviceManagerDaemon", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_prefsChangedNotifyToken = -1;
    v7 = v2;
  }

  return v2;
}

- (NSString)description
{
  return (NSString *)-[AADeviceManagerDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v19 = 0LL;
  v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10000D140;
  v23 = sub_10000D150;
  id v24 = 0LL;
  id obj = 0LL;
  NSAppendPrintF_safe(&obj, "-- AADeviceManagerDaemon --\n", *(void *)&a3);
  objc_storeStrong(&v24, obj);
  v4 = self->_cloudSyncDeviceManager;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    v6 = v20;
    id v17 = v20[5];
    NSAppendPrintF(&v17, "CloudSync DeviceManager: %@\n", v4);
    objc_storeStrong(v6 + 5, v17);
  }

  v7 = v20;
  id v16 = v20[5];
  NSAppendPrintF( &v16,  "Connected Accessories: %d, %@\n",  -[NSMutableDictionary count](self->_devicesMap, "count"),  self->_bluetoothDeviceDiscovery);
  objc_storeStrong(v7 + 5, v16);
  devicesMap = self->_devicesMap;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000D158;
  v15[3] = &unk_1002065F8;
  v15[4] = &v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v15);
  objc_super v9 = v20;
  id v14 = v20[5];
  NSAppendPrintF(&v14, "\n");
  objc_storeStrong(v9 + 5, v14);
  v10 = v20;
  id v13 = v20[5];
  NSAppendPrintF(&v13, "\n");
  objc_storeStrong(v10 + 5, v13);
  id v11 = v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D1FC;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D25C;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  self->_activateCalled = 0;
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (dword_100234260 <= 30
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    {
      LogPrintF(&dword_100234260, "-[AADeviceManagerDaemon _activate]", 30LL, "Activate");
    }

    if (self->_prefsChangedNotifyToken == -1)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10000D40C;
      handler[3] = &unk_100206308;
      handler[4] = self;
      notify_register_dispatch( "com.apple.AudioAccessory.prefsChanged",  &self->_prefsChangedNotifyToken,  dispatchQueue,  handler);
    }

    -[AADeviceManagerDaemon _prefsChanged](self, "_prefsChanged");
    -[AADeviceManagerDaemon _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
    -[AADeviceManagerDaemon _cbDiscoveryEnsureStarted](self, "_cbDiscoveryEnsureStarted");
    -[AADeviceManagerDaemon _cbControllerEnsureStarted](self, "_cbControllerEnsureStarted");
    -[AADeviceManagerDaemon _cloudSyncEnsureStarted](self, "_cloudSyncEnsureStarted");
    -[AADeviceManagerDaemon _languageChangeMonitoringEnsureStarted](self, "_languageChangeMonitoringEnsureStarted");
  }

- (void)_aaControllerEnsureStarted
{
  p_aaController = &self->_aaController;
  v4 = self->_aaController;
  if (!v4)
  {
    dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___AAController);
    -[AAController setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_aaController, v5);
    -[AAController setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_100206618);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000D628;
    v9[3] = &unk_100206180;
    v9[4] = self;
    -[AAController setDeviceInfoChangeHandler:](v5, "setDeviceInfoChangeHandler:", v9);
    if (dword_100234260 <= 30
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _aaControllerEnsureStarted]",  30LL,  "Activating AAController: %@",  v5);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000D634;
    v6[3] = &unk_100206380;
    v4 = v5;
    v7 = v4;
    v8 = self;
    -[AAController activateWithCompletion:](v4, "activateWithCompletion:", v6);
  }
}

- (void)_aaControllerEnsureStopped
{
  aaController = self->_aaController;
  if (aaController)
  {
    -[AAController invalidate](aaController, "invalidate");
    v4 = self->_aaController;
    self->_aaController = 0LL;
  }

- (void)_sendConfigOverAAController:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 needsUpdateToAAController])
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___AudioAccessoryDeviceConfig);
    -[AudioAccessoryDeviceConfig setAutoANCStrength:](v11, "setAutoANCStrength:", [v8 autoANCStrength]);
    -[AudioAccessoryDeviceConfig setEnableSiriMultitone:]( v11,  "setEnableSiriMultitone:",  [v8 enableSiriMultitone]);
    if (_os_feature_enabled_impl("ConnectedAudio", "HearingAid"))
    {
      -[AudioAccessoryDeviceConfig setEnableHearingAidGainSwipe:]( v11,  "setEnableHearingAidGainSwipe:",  [v8 enableHearingAidGainSwipe]);
      -[AudioAccessoryDeviceConfig setHearingAidToggle:]( v11,  "setHearingAidToggle:",  [v8 hearingAidToggle]);
      -[AudioAccessoryDeviceConfig setHearingAidEnrolled:]( v11,  "setHearingAidEnrolled:",  [v8 hearingAidEnrolled]);
      -[AudioAccessoryDeviceConfig setEnableHearingAssist:]( v11,  "setEnableHearingAssist:",  [v8 enableHearingAssist]);
      -[AudioAccessoryDeviceConfig setAllowOffListeningMode:]( v11,  "setAllowOffListeningMode:",  [v8 listeningModeOffAllowed]);
    }

    -[AudioAccessoryDeviceConfig setEnableHeartRateMonitor:]( v11,  "setEnableHeartRateMonitor:",  [v8 enableHeartRateMonitor]);
    -[AADeviceManagerDaemon _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
    aaController = self->_aaController;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAccessoryDeviceConfig xpcObjectRepresentation](v11, "xpcObjectRepresentation"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000D9C8;
    v16[3] = &unk_1002063F0;
    id v17 = v9;
    v18 = v11;
    id v19 = v10;
    v15 = v11;
    -[AAController sendDeviceConfig:destinationIdentifier:completionHandler:]( aaController,  "sendDeviceConfig:destinationIdentifier:completionHandler:",  v13,  v14,  v16);
  }

  else
  {
    if (dword_100234260 <= 10
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 10LL)))
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _sendConfigOverAAController:device:completion:]",  10LL,  "No changes in AudioAccessoryDeviceConfig");
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0LL);
    }
  }
}

- (void)_accessoryDeviceFound:(id)a3 withChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v9 bluetoothAddress]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    if (v7)
    {
      if (v4)
      {
        if (dword_100234260 <= 30
          && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
        {
          LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceFound:withChange:]",  30LL,  "AADevice changed: %@",  v9);
        }

        -[AADeviceManagerDaemon _loadDeviceRecordForDevice:](self, "_loadDeviceRecordForDevice:", v9);
        if (-[AADeviceManagerDaemon _accessoryDevicePerformActionsOnChange:]( self,  "_accessoryDevicePerformActionsOnChange:",  v9))
        {
          -[AADeviceManagerDaemon _sendCloudConfigsToDevice:](self, "_sendCloudConfigsToDevice:", v9);
        }
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AAServicesDaemon sharedAAServicesDaemon]( &OBJC_CLASS___AAServicesDaemon,  "sharedAAServicesDaemon"));
      [v8 reportDeviceFound:v9];
    }

    else if (dword_100234260 <= 90 {
           && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
    }
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceFound:withChange:]",  90LL,  "## identifier not found while updating device config");
    }
  }

  else if (dword_100234260 <= 90 {
         && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
  }
  {
    LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceFound:withChange:]",  90LL,  "## bluetooth address not found while updating device config");
  }
}

- (void)_accessoryDeviceInfoChanged:(id)a3
{
  id v4 = a3;
  id v13 = 0LL;
  dispatch_queue_t v5 = -[AudioAccessoryDeviceInfo initWithXPCObject:error:]( objc_alloc(&OBJC_CLASS___AudioAccessoryDeviceInfo),  "initWithXPCObject:error:",  v4,  &v13);

  id v6 = v13;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAccessoryDeviceInfo identifier](v5, "identifier"));
    if (v7)
    {
      id v8 = (AudioAccessoryDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_devicesMap,  "objectForKeyedSubscript:",  v7));
      if (!v8)
      {
        if (dword_100234260 <= 30
          && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
        {
          LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceInfoChanged:]",  30LL,  "AADevice found from AADeviceInfo dictionary, identifier: %@",  v7);
        }

        id v8 = -[AudioAccessoryDevice initWithIdentifier:]( objc_alloc(&OBJC_CLASS___AudioAccessoryDevice),  "initWithIdentifier:",  v7);
        devicesMap = self->_devicesMap;
        if (!devicesMap)
        {
          id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v11 = self->_devicesMap;
          self->_devicesMap = v10;

          devicesMap = self->_devicesMap;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](devicesMap, "setObject:forKeyedSubscript:", v8, v7);
      }

      -[AADeviceManagerDaemon _accessoryDeviceFound:withChange:]( self,  "_accessoryDeviceFound:withChange:",  v8,  -[AudioAccessoryDevice updateWithAADeviceInfo:](v8, "updateWithAADeviceInfo:", v5));
    }

    else if (dword_100234260 <= 90 {
           && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
    }
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceInfoChanged:]",  90LL,  "## identifier not found in deviceInfo");
    }

    goto LABEL_12;
  }

  if (dword_100234260 <= 90 && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
  {
    uint64_t v12 = CUPrintNSError(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
    LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceInfoChanged:]",  90LL,  "## Failed to receive accessory device info: %@",  v7);
LABEL_12:
  }
}

- (BOOL)_accessoryDevicePerformActionsOnChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 setDefaultConfigurationsIfNeeded];
  if (v5
    && dword_100234260 <= 30
    && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
  {
    LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDevicePerformActionsOnChange:]",  30LL,  "AADevice defaults applied: %@",  v4);
  }

  -[AADeviceManagerDaemon _sendSiriMultitoneConfigToDevice:](self, "_sendSiriMultitoneConfigToDevice:", v4);
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AllowListeningModeOff")
    && _os_feature_enabled_impl("ConnectedAudio", "HearingProtection"))
  {
    -[AADeviceManagerDaemon _accessoryDeviceRemoveOffListeningModeIfNeeded:]( self,  "_accessoryDeviceRemoveOffListeningModeIfNeeded:",  v4);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
  [v6 getSmartRoutingStateForDeviceAddress:v7];

  return v5;
}

- (void)_accessoryDeviceUpdateCloudRecord:(id)a3 config:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (_os_feature_enabled_impl("ConnectedAudio", "HearingAid"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audiogramEnrolledTimestamp]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 audiogramEnrolledTimestamp]);
      [v10 setAudiogramEnrolledTimestamp:v8];
    }
  }

  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AllowListeningModeOff")
    && _os_feature_enabled_impl("ConnectedAudio", "HearingProtection")
    && [v6 listeningModeOffAllowed])
  {
    objc_msgSend(v10, "setListeningModeOffAllowed:", objc_msgSend(v6, "listeningModeOffAllowed"));
    -[AADeviceManagerDaemon _accessoryDeviceRemoveOffListeningModeIfNeeded:]( self,  "_accessoryDeviceRemoveOffListeningModeIfNeeded:",  v10);
  }

  if (dword_100234260 <= 30 && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL))) {
    LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceUpdateCloudRecord:config:]",  30LL,  "AADevice config applied locally: %@",  v10);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AAServicesDaemon sharedAAServicesDaemon](&OBJC_CLASS___AAServicesDaemon, "sharedAAServicesDaemon"));
  [v9 reportDeviceFound:v10];
}

- (id)availableDevices
{
  return -[NSMutableDictionary copy](self->_devicesMap, "copy");
}

- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E288;
  v15[3] = &unk_1002061F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)_sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesMap, "objectForKeyedSubscript:", v11));
    if (v12)
    {
      if ([v8 needsUpdateToDeviceCloudRecord]) {
        -[AADeviceManagerDaemon _accessoryDeviceUpdateCloudRecord:config:]( self,  "_accessoryDeviceUpdateCloudRecord:config:",  v12,  v8);
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10000E4F4;
      v20[3] = &unk_100206640;
      id v23 = v10;
      v20[4] = self;
      id v21 = v8;
      v22 = v12;
      -[AADeviceManagerDaemon _sendConfigOverCBController:device:completion:]( self,  "_sendConfigOverCBController:device:completion:",  v21,  v12,  v20);

      id v13 = 0LL;
    }

    else
    {
      uint64_t v17 = NSErrorF(NSOSStatusErrorDomain, 4294960591LL, "AADevice not found");
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (dword_100234260 <= 90
        && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
      {
        uint64_t v18 = CUPrintNSError(v13);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _sendDeviceConfig:identifier:completion:]",  90LL,  "## Unable to send config to device with identifier: %@, error: %@",  v11,  v19);
      }

      if (v10) {
        (*((void (**)(id, void *))v10 + 2))(v10, v13);
      }
    }
  }

  else
  {
    uint64_t v14 = NSErrorF(NSOSStatusErrorDomain, 4294960591LL, "AADevice identifier not found");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100234260 <= 90
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
    {
      uint64_t v15 = CUPrintNSError(v13);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _sendDeviceConfig:identifier:completion:]",  90LL,  "## Unable to send config to device with identifier: %@, error: %@",  0LL,  v16);
    }

    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)_cbControllerEnsureStarted
{
  p_bluetoothController = &self->_bluetoothController;
  id v4 = self->_bluetoothController;
  if (!v4)
  {
    unsigned int v5 = objc_alloc_init(&OBJC_CLASS___CBController);
    -[CBController setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_bluetoothController, v5);
    -[CBController setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_100206660);
    if (dword_100234260 <= 30
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _cbControllerEnsureStarted]",  30LL,  "Activating CBController: %@",  v5);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000E6C4;
    v6[3] = &unk_100206380;
    id v4 = v5;
    v7 = v4;
    id v8 = self;
    -[CBController activateWithCompletion:](v4, "activateWithCompletion:", v6);
  }
}

- (void)_cbControllerEnsureStopped
{
  bluetoothController = self->_bluetoothController;
  if (bluetoothController)
  {
    -[CBController invalidate](bluetoothController, "invalidate");
    id v4 = self->_bluetoothController;
    self->_bluetoothController = 0LL;
  }

- (void)_cbDiscoveryEnsureStarted
{
  p_bluetoothDeviceDiscovery = &self->_bluetoothDeviceDiscovery;
  id v4 = self->_bluetoothDeviceDiscovery;
  if (!v4)
  {
    unsigned int v5 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_bluetoothDeviceDiscovery, v5);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000E9B4;
    v19[3] = &unk_100206330;
    id v6 = v5;
    v20 = v6;
    id v21 = self;
    -[CBDiscovery setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v19);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000E9D0;
    v16[3] = &unk_100206330;
    v7 = v6;
    uint64_t v17 = v7;
    uint64_t v18 = self;
    -[CBDiscovery setDeviceLostHandler:](v7, "setDeviceLostHandler:", v16);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000E9EC;
    v13[3] = &unk_100206358;
    id v8 = v7;
    uint64_t v14 = v8;
    uint64_t v15 = self;
    -[CBDiscovery setInterruptionHandler:](v8, "setInterruptionHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000EA80;
    v12[3] = &unk_100206058;
    v12[4] = self;
    -[CBDiscovery setInvalidationHandler:](v8, "setInvalidationHandler:", v12);
    -[CBDiscovery setDiscoveryFlags:]( v8,  "setDiscoveryFlags:",  (unint64_t)-[CBDiscovery discoveryFlags](v8, "discoveryFlags") | 0x80000200000LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000EB00;
    v9[3] = &unk_100206380;
    id v4 = v8;
    id v10 = v4;
    id v11 = self;
    -[CBDiscovery activateWithCompletion:](v4, "activateWithCompletion:", v9);
  }
}

- (void)_cbDiscoveryEnsureStopped
{
  bluetoothDeviceDiscovery = self->_bluetoothDeviceDiscovery;
  if (bluetoothDeviceDiscovery)
  {
    -[CBDiscovery invalidate](bluetoothDeviceDiscovery, "invalidate");
    id v4 = self->_bluetoothDeviceDiscovery;
    self->_bluetoothDeviceDiscovery = 0LL;
  }

- (void)_coreBluetoothDeviceFound:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  if (v4)
  {
    if ([v13 vendorID] == 76)
    {
      unsigned int v5 = [v13 productID] - 8194;
      if (v5 <= 0x24 && ((1LL << v5) & 0x1C7BB7FF9BLL) != 0)
      {
        id v6 = (AudioAccessoryDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_devicesMap,  "objectForKeyedSubscript:",  v4));
        if (v6)
        {
          v7 = v6;
          id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAccessoryDevice coreBluetoothDevice](v6, "coreBluetoothDevice"));

          id v9 = -[AudioAccessoryDevice updateWithCBDevice:](v7, "updateWithCBDevice:", v13);
          if (!v8
            && dword_100234260 <= 30
            && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
          {
            LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _coreBluetoothDeviceFound:]",  30LL,  "AADevice updated from CBDiscovery: %@",  v7);
          }
        }

        else
        {
          v7 = -[AudioAccessoryDevice initWithIdentifier:]( objc_alloc(&OBJC_CLASS___AudioAccessoryDevice),  "initWithIdentifier:",  v4);
          devicesMap = self->_devicesMap;
          if (!devicesMap)
          {
            id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            id v12 = self->_devicesMap;
            self->_devicesMap = v11;

            devicesMap = self->_devicesMap;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](devicesMap, "setObject:forKeyedSubscript:", v7, v4);
          id v9 = -[AudioAccessoryDevice updateWithCBDevice:](v7, "updateWithCBDevice:", v13);
          if (dword_100234260 <= 30
            && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
          {
            LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _coreBluetoothDeviceFound:]",  30LL,  "AADevice found from CBDiscovery: %@",  v7);
          }
        }

        -[AADeviceManagerDaemon _accessoryDeviceFound:withChange:](self, "_accessoryDeviceFound:withChange:", v7, v9);
      }
    }
  }

  else if (dword_100234260 <= 90 {
         && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
  }
  {
    LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _coreBluetoothDeviceFound:]",  90LL,  "CBDevice identifier not found, %@",  v13);
  }
}

- (void)_coreBluetoothDeviceLost:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesMap, "objectForKeyedSubscript:", v4));
    if (v5)
    {
      if (dword_100234260 <= 30
        && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
      {
        LogPrintF(&dword_100234260, "-[AADeviceManagerDaemon _coreBluetoothDeviceLost:]", 30LL, "AADevice lost: %@", v5);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devicesMap, "setObject:forKeyedSubscript:", 0LL, v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AAServicesDaemon sharedAAServicesDaemon]( &OBJC_CLASS___AAServicesDaemon,  "sharedAAServicesDaemon"));
      [v6 reportDeviceLost:v5];
    }
  }

  else if (dword_100234260 <= 90 {
         && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
  }
  {
    LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _coreBluetoothDeviceLost:]",  90LL,  "CBDevice identifier not found, %@",  v7);
  }
}

- (id)_getCurrentAudioOwner
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10000D140;
  id v10 = sub_10000D150;
  id v11 = 0LL;
  devicesMap = self->_devicesMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F0D0;
  v5[3] = &unk_1002065F8;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_sendConfigOverCBController:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (CBDevice *)objc_claimAutoreleasedReturnValue([v8 coreBluetoothDevice]);
  if (!v11)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___CBDevice);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    -[CBDevice setIdentifier:](v11, "setIdentifier:", v12);
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  objc_msgSend(v13, "setAclPriority:", objc_msgSend(v10, "aclPriority"));
  objc_msgSend(v13, "setAdaptiveVolumeConfig:", objc_msgSend(v10, "adaptiveVolumeConfig"));
  objc_msgSend(v13, "setAllowsAutoRoute:", objc_msgSend(v10, "allowsAutoRoute"));
  objc_msgSend(v13, "setAudioRouteHidden:", objc_msgSend(v10, "audioRouteHidden"));
  objc_msgSend(v13, "setClickHoldModeLeft:", objc_msgSend(v10, "clickHoldModeLeft"));
  objc_msgSend(v13, "setClickHoldModeRight:", objc_msgSend(v10, "clickHoldModeRight"));
  objc_msgSend(v13, "setConversationDetectConfig:", objc_msgSend(v10, "conversationDetectConfig"));
  objc_msgSend(v13, "setCrownRotationDirection:", objc_msgSend(v10, "crownRotationDirection"));
  objc_msgSend(v13, "setDoubleTapActionLeft:", objc_msgSend(v10, "doubleTapActionLeft"));
  objc_msgSend(v13, "setDoubleTapActionRight:", objc_msgSend(v10, "doubleTapActionRight"));
  objc_msgSend(v13, "setEndCallConfig:", objc_msgSend(v10, "endCallConfig"));
  objc_msgSend(v13, "setListeningMode:", objc_msgSend(v10, "listeningMode"));
  objc_msgSend(v13, "setListeningModeConfigs:", objc_msgSend(v10, "listeningModeConfigs"));
  objc_msgSend(v13, "setMicrophoneMode:", objc_msgSend(v10, "microphoneMode"));
  objc_msgSend(v13, "setMuteControlConfig:", objc_msgSend(v10, "muteControlConfig"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  [v13 setName:v14];

  objc_msgSend(v13, "setPlacementMode:", objc_msgSend(v10, "placementMode"));
  objc_msgSend(v13, "setRelinquishAudioRoute:", objc_msgSend(v10, "relinquishAudioRoute"));
  objc_msgSend(v13, "setSelectiveSpeechListeningConfig:", objc_msgSend(v10, "selectiveSpeechListeningConfig"));
  objc_msgSend(v13, "setSmartRoutingMode:", objc_msgSend(v10, "smartRoutingMode"));
  objc_msgSend(v13, "setSpatialAudioAllowed:", objc_msgSend(v10, "spatialAudioAllowed"));
  id v15 = [v10 spatialAudioMode];

  [v13 setSpatialAudioMode:v15];
  bluetoothController = self->_bluetoothController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000F434;
  v18[3] = &unk_100205FE0;
  v18[4] = v13;
  id v19 = v9;
  id v17 = v9;
  -[CBController modifyDevice:settings:completion:]( bluetoothController,  "modifyDevice:settings:completion:",  v11,  v13,  v18);
}

- (void)aaDeviceRecordsMultiUserEnvChangedUseDefaultsForAddresses:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F55C;
  v7[3] = &unk_100206358;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_aaDeviceRecordsMultiUserEnvChangedUseDefaultsForAddresses:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync"))
  {
    devicesMap = self->_devicesMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000F600;
    v6[3] = &unk_100206688;
    id v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

- (void)aaDeviceRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F8B0;
  v7[3] = &unk_100206358;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_aaDeviceRecordsRemovedWithRecords:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync"))
  {
    devicesMap = self->_devicesMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000F9C8;
    v6[3] = &unk_100206688;
    id v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

- (void)aaDeviceRecordsUpdatedWithRecords:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FC6C;
  block[3] = &unk_100206358;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

- (void)_aaDeviceRecordsUpdatedWithRecords:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync"))
  {
    devicesMap = self->_devicesMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000FD10;
    v6[3] = &unk_100206688;
    id v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

- (void)_cloudSyncEnsureStarted
{
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync")
    && !self->_cloudSyncDeviceManager)
  {
    if (dword_100234260 <= 30
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _cloudSyncEnsureStarted]",  30LL,  "starting cloud sync Device Manager");
    }

    id v3 = (_TtC15audioaccessoryd13DeviceManager *)objc_claimAutoreleasedReturnValue( +[DeviceManager singleton]( &OBJC_CLASS____TtC15audioaccessoryd13DeviceManager,  "singleton"));
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    self->_cloudSyncDeviceManager = v3;

    -[DeviceManager setAaDeviceDelegate:](self->_cloudSyncDeviceManager, "setAaDeviceDelegate:", self);
  }

- (void)_cloudSyncEnsureStopped
{
  if (self->_cloudSyncDeviceManager)
  {
    if (dword_100234260 <= 30
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _cloudSyncEnsureStopped]",  30LL,  "stopping cloud sync Device Manager");
    }

    -[DeviceManager setAaDeviceDelegate:](self->_cloudSyncDeviceManager, "setAaDeviceDelegate:", 0LL);
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    self->_cloudSyncDeviceManager = 0LL;
  }

- (void)_loadDeviceRecordForDevice:(id)a3
{
  id v10 = a3;
  int v4 = _os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync");
  id v5 = v10;
  if (v4)
  {
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 bluetoothAddress]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[DeviceManager fetchAADeviceRecordSyncWithAddress:]( cloudSyncDeviceManager,  "fetchAADeviceRecordSyncWithAddress:",  v7));

    if (v8)
    {
    }

    else if (dword_100234260 <= 30 {
           && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    }
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 bluetoothAddress]);
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _loadDeviceRecordForDevice:]",  30LL,  "AADeviceRecord not found for address %@",  v9);
    }

    id v5 = v10;
  }
}

- (void)_saveDeviceRecordForDevice:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AADeviceRecordCloudSync"))
  {
    id v10 = 0LL;
    id v5 = -[AADeviceRecord initWithDevice:error:]( objc_alloc(&OBJC_CLASS____TtC15audioaccessoryd14AADeviceRecord),  "initWithDevice:error:",  v4,  &v10);
    id v6 = v10;
    if (v5)
    {
      cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100010300;
      v8[3] = &unk_100206380;
      v8[4] = self;
      id v9 = v5;
      -[DeviceManager updateAADeviceRecordWithRecord:completion:]( cloudSyncDeviceManager,  "updateAADeviceRecordWithRecord:completion:",  v9,  v8);
    }

    else if (dword_100234260 <= 90 {
           && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 90LL)))
    }
    {
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _saveDeviceRecordForDevice:]",  90LL,  "unable to save AADeviceRecord, record init failed with error: %@",  v6);
    }
  }
}

- (void)_sendCloudConfigsToDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AADeviceConfig);
  objc_msgSend(v5, "setListeningModeOffAllowed:", objc_msgSend(v4, "listeningModeOffAllowed"));
  -[AADeviceManagerDaemon _sendConfigOverAAController:device:completion:]( self,  "_sendConfigOverAAController:device:completion:",  v5,  v4,  0LL);
}

- (void)_accessoryDeviceRemoveOffListeningModeIfNeeded:(id)a3
{
  id v9 = a3;
  if ([v9 listeningModeOffAllowed] == 2)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___AADeviceConfig);
    if ([v9 listeningMode] == 1)
    {
      [v4 setListeningMode:3];
      unsigned int v5 = [v9 listeningModeConfigs];
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
    }

    else
    {
      unsigned int v5 = [v9 listeningModeConfigs];
      if ((v5 & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
    }

    if ((v5 & 0xA) != 0) {
      int v6 = 4;
    }
    else {
      int v6 = 6;
    }
    [v4 setListeningModeConfigs:v6 | v5 & 0xFFFFFFFA];
LABEL_10:
    if (dword_100234260 <= 30
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      LogPrintF( &dword_100234260,  "-[AADeviceManagerDaemon _accessoryDeviceRemoveOffListeningModeIfNeeded:]",  30LL,  "Overriding listening mode for device identifier %@, config <%@>",  v7,  v4);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    -[AADeviceManagerDaemon _sendDeviceConfig:identifier:completion:]( self,  "_sendDeviceConfig:identifier:completion:",  v4,  v8,  0LL);

    goto LABEL_15;
  }

- (void)smartRoutingStateUpdated:(unsigned int)a3 ForDeviceIdentifier:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001065C;
  block[3] = &unk_1002066B0;
  block[4] = self;
  id v10 = v6;
  unsigned int v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAssistantLanguageChanged:(id)a3
{
  devicesMap = self->_devicesMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010838;
  v4[3] = &unk_100206688;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)_languageChangeMonitoringEnsureStarted
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleAssistantLanguageChanged:" name:AFLanguageCodeDidChangeNotification object:0];
}

- (void)_languageChangeMonitoringEnsureStopped
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AFLanguageCodeDidChangeNotification object:0];
}

- (void)_sendSiriMultitoneConfigToDevice:(id)a3
{
  id v4 = a3;
  if ([v4 siriMultitoneCapability] == 2
    && MGGetBoolAnswer(@"DeviceSupportsGenerativeModelSystems"))
  {
    else {
      int v5 = 2;
    }
    if ([v4 siriMultitoneEnabled] != v5)
    {
      uint64_t v6 = (char)v5;
      [v4 setSiriMultitoneEnabled:v6];
      id v7 = objc_alloc_init(&OBJC_CLASS___AADeviceConfig);
      [v7 setEnableSiriMultitone:v6];
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000109F4;
      v9[3] = &unk_100206380;
      id v10 = v4;
      id v11 = v7;
      -[AADeviceManagerDaemon _sendDeviceConfig:identifier:completion:]( self,  "_sendDeviceConfig:identifier:completion:",  v7,  v8,  v9);
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end