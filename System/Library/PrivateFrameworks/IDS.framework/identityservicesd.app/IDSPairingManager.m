@interface IDSPairingManager
+ (BOOL)_isEncryptionKeyRegenerationSupportedByCapabilityFlags:(unint64_t)a3;
+ (BOOL)_isIPsecSupportedByCapabilityFlags:(unint64_t)a3;
+ (BOOL)_isTinkerPairedInCapabilityFlags:(unint64_t)a3;
+ (IDSPairingManager)sharedInstance;
+ (void)devicePairingProtocolVersion:(unsigned int *)a3 minCompatibilityVersion:(unsigned int *)a4 maxCompatibilityVersion:(unsigned int *)a5;
- (BOOL)_hasAllEncryptionKeys;
- (BOOL)_isPairedToDevice:(id)a3;
- (BOOL)_markSecuredEncryptionKeysAsRegenerated:(BOOL)a3;
- (BOOL)_purgeSecuredEncryptionKeysForAllPairedDevices;
- (BOOL)activePairedDeviceHasPairingType:(int64_t)a3;
- (BOOL)addLocalPairedDevice:(id)a3 BTOutOfBandKey:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5 pairingType:(int64_t)a6 bluetoothMACAddress:(id)a7;
- (BOOL)isCurrentDevicePairedOrPairing;
- (BOOL)isCurrentDeviceTinkerConfiguredWatch;
- (BOOL)isMissingAnyPublicKeyForPairedDeviceWithCBUUID:(id)a3;
- (BOOL)isPaired;
- (BOOL)isTraditionalDevicePairedOrPairing;
- (BOOL)pairedDeviceSupportsSendLaterMessages;
- (BOOL)removeLocalPairedDevice:(id)a3;
- (BOOL)setPairedDeviceInfo:(id)a3;
- (BOOL)shouldQuickSwitchAfterIPSecConnected;
- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice;
- (BOOL)shouldUseIPsecLinkForDefaultPairedDeviceAndLogQuery:(BOOL)a3;
- (BOOL)updateLocalPairedDevice:(id)a3 pairingType:(int64_t)a4;
- (BOOL)updatePairedDeviceBuildVersion:(id)a3 productVersion:(id)a4 productName:(id)a5 pairingProtocolVersion:(unsigned int)a6 minCompatibilityVersion:(unsigned int)a7 maxCompatibilityVersion:(unsigned int)a8 serviceMinCompatibilityVersion:(unsigned __int16)a9 capabilityFlags:(unint64_t)a10 deviceUniqueID:(id)a11;
- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4;
- (BOOL)updatePairedDeviceiCloudURIs:(id)a3 pushToken:(id)a4;
- (IDSPairedDeviceRepository)pairedDeviceRepository;
- (IDSPairingManager)init;
- (IDSPairingManager)initWithNRDeviceManager:(id)a3 pairedDeviceRepository:(id)a4;
- (NRDeviceManager)nrDeviceManager;
- (NSData)pairedDevicePublicClassAKey;
- (NSData)pairedDevicePublicClassCKey;
- (NSData)pairedDevicePublicKey;
- (NSData)pairedDevicePushToken;
- (NSDictionary)localDevice;
- (NSDictionary)pairedDevice;
- (NSDictionary)pairedDevicePrivateData;
- (NSMutableArray)registeredPairedDeviceDidConnectBlockPairs;
- (NSSet)allPairedDevices;
- (NSSet)allPairedUniqueIDs;
- (NSSet)allTraditionallyPairedUniqueIDs;
- (NSString)description;
- (NSString)pairedDeviceProductVersion;
- (NSString)pairedDeviceUniqueID;
- (id)_activePairedDeviceCBUUID;
- (id)_cbuuidsWithIsPairingValue:(BOOL)a3;
- (id)_createRegistrationProperties:(BOOL)a3 maxCompatibilityVersion:(id)a4 BTOutOfBandKey:(id)a5 supportsIPsecWithSPPLink:(BOOL)a6 bluetoothMACAddress:(id)a7;
- (id)_identityDataErrorPairForDataProtectionClass:(unsigned int)a3;
- (id)_localDevicePrivateData;
- (id)_nrDeviceIdentifierWithCBUUID:(id)a3;
- (id)allPairedDevicesWithType:(int64_t)a3;
- (id)cbuuidsOfPairedDevices;
- (id)cbuuidsOfPairingDevices;
- (id)localDeviceRecord;
- (id)pairedDeviceBuildVersion;
- (id)pairedDeviceForUniqueID:(id)a3;
- (id)pairedDeviceHandlesWithPairingType:(int64_t)a3;
- (id)pairedDeviceProductName;
- (id)pairedDeviceRecords;
- (id)pairedDeviceiCloudURIs;
- (id)uniqueIDToCbuuidsOfPairingDevicesDictionary;
- (int64_t)_migrateSecuredEncryptionKeys;
- (int64_t)activatePairedDeviceWithCBUUID:(id)a3;
- (int64_t)pairedDevicePairingType;
- (unint64_t)_hasRegeneratedSecuredEncryptionKeys;
- (unsigned)pairedDeviceMaxCompatibilityVersion;
- (unsigned)pairedDeviceMinCompatibilityVersion;
- (unsigned)pairedDevicePairingProtocolVersion;
- (unsigned)pairedDeviceServiceMinCompatibilityVersion;
- (void)_callPairedDeviceDidConnectBlocksForUniqueID:(id)a3 withError:(id)a4;
- (void)_clearPairedDeviceDidConnectBlocksForUniqueID:(id)a3;
- (void)_loadPairedDevicePropertiesIfNeeded;
- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 properties:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5;
- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 wasInitiallySetupUsingIDSPairing:(BOOL)a4 maxCompatibilityVersion:(id)a5 BTOutOfBandKey:(id)a6 supportsIPsecWithSPPLink:(BOOL)a7 bluetoothMACAddress:(id)a8;
- (void)_notifyDelegatesDevicePairedToDevice:(id)a3;
- (void)_notifyDelegatesDeviceUnpairedFromDevice:(id)a3;
- (void)_notifyDelegatesWithBlock:(id)a3;
- (void)_regenerateSecuredEncryptionKeys;
- (void)_requestPairedDeviceInfo;
- (void)_requestPairedDeviceInfoAfterDelay:(double)a3;
- (void)_suspendOTRSessionsWithProtectionClass:(unsigned int)a3;
- (void)_updateActiveStateForAllPairedDevices;
- (void)_updateActiveStateForAllPairedDevices:(BOOL)a3;
- (void)_updatePairedState:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)deactivatePairedDevices;
- (void)dealloc;
- (void)deliveryController:(id)a3 foundNearbyIPsecCapableDeviceWithUniqueID:(id)a4;
- (void)disconnectActivePairedDevice;
- (void)ensureCommunicationWithActivePairedDeviceIsPossible;
- (void)gatherLocalDeviceInfoWithCompletionBlock:(id)a3;
- (void)refreshPairedDeviceEncryptionKeys;
- (void)registerPairedDeviceWithUniqueID:(id)a3 didConnectBlock:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setBTOutOfBandKey:(id)a3 forCBUUID:(id)a4;
- (void)setShouldQuickSwitchAfterIPSecConnected:(BOOL)a3;
- (void)updateNetworkRelayStateForAllPairedDevices;
@end

@implementation IDSPairingManager

+ (IDSPairingManager)sharedInstance
{
  if (qword_1009BEC20 != -1) {
    dispatch_once(&qword_1009BEC20, &stru_1008FC0D0);
  }
  return (IDSPairingManager *)(id)qword_1009BEC28;
}

- (void)_notifyDelegatesWithBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[IDSPairingManager _notifyDelegatesWithBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = -[NSHashTable copy](self->_delegateMap, "copy");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)_notifyDelegatesDevicePairedToDevice:(id)a3
{
  v4 = (char *)a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[IDSPairingManager _notifyDelegatesDevicePairedToDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notifying all IDS accounts device paired to: %@",  buf,  0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017434C;
  v8[3] = &unk_1008FC0F8;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
  id v7 = v9;
  -[IDSPairingManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v8);
}

- (void)_notifyDelegatesDeviceUnpairedFromDevice:(id)a3
{
  v4 = (char *)a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[IDSPairingManager _notifyDelegatesDeviceUnpairedFromDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notifying all IDS accounts device unpaired from: %@",  buf,  0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017450C;
  v8[3] = &unk_1008FC0F8;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
  id v7 = v9;
  -[IDSPairingManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v8);
}

- (void)_requestPairedDeviceInfoAfterDelay:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001745A8;
  v3[3] = &unk_1008F6010;
  v3[4] = self;
  im_dispatch_after_primary_queue(v3, a3);
}

- (void)_requestPairedDeviceInfo
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[IDSPairingManager _requestPairedDeviceInfo]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _activePairedDeviceCBUUID](self, "_activePairedDeviceCBUUID"));
  BOOL v5 = [v4 length] == 0;

  if (v5)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSPairingManager _requestPairedDeviceInfo]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Cannot send paired device info request because we don't have the device's Bluetooth identifier.",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_7;
  }

  if (-[IDSCountdown isCountingDown](self->_pairedDeviceInfoRequestCountdown, "isCountingDown"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSPairingManager _requestPairedDeviceInfo]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Ignoring paired device info request because another request is already in flight.",  (uint8_t *)&buf,  0xCu);
    }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSPairingManager;
  -[IDSPairingManager dealloc](&v4, "dealloc");
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSPairingManager;
  v3 = -[IDSPairingManager description](&v7, "description");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ -- %@",  v4,  self->_pairedDeviceRepository));

  return (NSString *)v5;
}

- (IDSPairingManager)initWithNRDeviceManager:(id)a3 pairedDeviceRepository:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___IDSPairingManager;
  id v9 = -[IDSPairingManager init](&v25, "init");
  uint64_t v10 = v9;
  if (v9)
  {
    cbuuidToBTOutOfBandKeyDictionary = v9->_cbuuidToBTOutOfBandKeyDictionary;
    v9->_cbuuidToBTOutOfBandKeyDictionary = 0LL;

    __int128 v12 = -[IDSCountdown initWithTimeInterval:](objc_alloc(&OBJC_CLASS___IDSCountdown), "initWithTimeInterval:", 15.0);
    pairedDeviceInfoRequestCountdown = v10->_pairedDeviceInfoRequestCountdown;
    v10->_pairedDeviceInfoRequestCountdown = v12;

    registeredPairedDeviceDidConnectBlockPairs = v10->_registeredPairedDeviceDidConnectBlockPairs;
    v10->_registeredPairedDeviceDidConnectBlockPairs = 0LL;

    objc_storeStrong((id *)&v10->_pairedDeviceRepository, a4);
    objc_storeStrong((id *)&v10->_nrDeviceManager, a3);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v15 setActive:1];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v16 setWatchesDataProtectionLockState:1];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v17 _addEarlyListener:v10];

    -[IDSPairingManager _loadPairedDevicePropertiesIfNeeded](v10, "_loadPairedDevicePropertiesIfNeeded");
    id v18 = [IDSPairingStateChangedNotification UTF8String];
    v20 = (const char *)IMUserScopedNotification(v18, v19);
    notify_register_check(v20, &v10->_pairingStateToken);
    -[IDSPairingManager _updatePairedState:](v10, "_updatePairedState:", -[IDSPairingManager isPaired](v10, "isPaired"));
    uint64_t v21 = IMGetDomainValueForKey(@"com.apple.ids", @"PipePeripheralUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (!v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceUUIDString](v10, "pairedDeviceUUIDString"));
      if (v23) {
        IMSetDomainValueForKey(@"com.apple.ids", @"PipePeripheralUUID", v23);
      }
    }

    -[IDSPairingManager _updateActiveStateForAllPairedDevices](v10, "_updateActiveStateForAllPairedDevices");
    -[IDSPairingManager updateNetworkRelayStateForAllPairedDevices](v10, "updateNetworkRelayStateForAllPairedDevices");
  }

  return v10;
}

- (IDSPairingManager)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IDSPairedDeviceKeychainPersister);
  id v4 = +[NRDeviceManager copySharedDeviceManager](&OBJC_CLASS___NRDeviceManager, "copySharedDeviceManager");
  BOOL v5 = -[IDSPairedDeviceRepository initWithPersister:]( objc_alloc(&OBJC_CLASS___IDSPairedDeviceRepository),  "initWithPersister:",  v3);
  id v6 = -[IDSPairingManager initWithNRDeviceManager:pairedDeviceRepository:]( self,  "initWithNRDeviceManager:pairedDeviceRepository:",  v4,  v5);

  return v6;
}

- (void)setBTOutOfBandKey:(id)a3 forCBUUID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    cbuuidToBTOutOfBandKeyDictionary = self->_cbuuidToBTOutOfBandKeyDictionary;
    id v8 = v12;
    if (v12)
    {
      if (!cbuuidToBTOutOfBandKeyDictionary)
      {
        id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v10 = self->_cbuuidToBTOutOfBandKeyDictionary;
        self->_cbuuidToBTOutOfBandKeyDictionary = v9;

        id v8 = v12;
        cbuuidToBTOutOfBandKeyDictionary = self->_cbuuidToBTOutOfBandKeyDictionary;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( cbuuidToBTOutOfBandKeyDictionary,  "setObject:forKeyedSubscript:",  v8,  v6);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( cbuuidToBTOutOfBandKeyDictionary,  "setObject:forKeyedSubscript:",  0LL,  v6);
      if (!-[NSMutableDictionary count](self->_cbuuidToBTOutOfBandKeyDictionary, "count"))
      {
        uint64_t v11 = self->_cbuuidToBTOutOfBandKeyDictionary;
        self->_cbuuidToBTOutOfBandKeyDictionary = 0LL;
      }
    }
  }
}

- (void)_loadPairedDevicePropertiesIfNeeded
{
  if (!self->_hasLoadedPairedDevices)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    self->_hasLoadedPairedDevices = [v3 loadPairedDevicesFromStorage];

    if (self->_hasLoadedPairedDevices)
    {
      -[IDSPairingManager _migrateSecuredEncryptionKeys](self, "_migrateSecuredEncryptionKeys");
      -[IDSPairingManager _requestPairedDeviceInfoAfterDelay:](self, "_requestPairedDeviceInfoAfterDelay:", 10.0);
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevice](self, "pairedDevice"));
      BOOL v5 = v4;
      if (v4)
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472LL;
        v6[2] = sub_100174DC4;
        v6[3] = &unk_1008FC0F8;
        id v7 = v4;
        -[IDSPairingManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v6);
      }
    }
  }

- (int64_t)_migrateSecuredEncryptionKeys
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  unsigned int v3 = [v2 isUsingSecureStorageForClassA];
  unsigned __int8 v4 = [v2 isUsingSecureStorageForClassC];
  unsigned __int8 v5 = v4;
  if (!v3 || (v4 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    unsigned int v8 = [v7 isUnderDataProtectionLock];

    if (v8)
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog migration](&OBJC_CLASS___IMRGLog, "migration"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migration is prohibited.", buf, 2u);
      }

      int64_t v6 = 1LL;
      goto LABEL_24;
    }

    if ((v3 & 1) == 0)
    {
      unsigned int v10 = [v2 migrateToSecureStorageForClassA];
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog migration](&OBJC_CLASS___IMRGLog, "migration"));
      id v9 = v11;
      if (!v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_10069E35C();
        }
LABEL_23:
        int64_t v6 = 2LL;
LABEL_24:

        goto LABEL_25;
      }

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrated key to class A.", v16, 2u);
      }
    }

    if ((v5 & 1) != 0)
    {
      int64_t v6 = 3LL;
      goto LABEL_25;
    }

    unsigned int v12 = [v2 migrateToSecureStorageForClassC];
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog migration](&OBJC_CLASS___IMRGLog, "migration"));
    id v9 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrated key to class C.", v15, 2u);
      }

      int64_t v6 = 3LL;
      goto LABEL_24;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10069E330();
    }
    goto LABEL_23;
  }

  int64_t v6 = 0LL;
LABEL_25:

  return v6;
}

- (unint64_t)_hasRegeneratedSecuredEncryptionKeys
{
  if (self->_isPendingResetOfKeyRegenerationFlag)
  {
    if (-[IDSPairingManager _markSecuredEncryptionKeysAsRegenerated:]( self,  "_markSecuredEncryptionKeysAsRegenerated:",  0LL))
    {
      self->_isPendingResetOfKeyRegenerationFlag = 0;
      unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        __int128 v15 = "-[IDSPairingManager _hasRegeneratedSecuredEncryptionKeys]";
        unsigned __int8 v4 = "%s Set the pending-reset flag back to NO.";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
      }
    }

    else
    {
      unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        __int128 v15 = "-[IDSPairingManager _hasRegeneratedSecuredEncryptionKeys]";
        unsigned __int8 v4 = "%s Could not set the pending-reset flag back to NO.";
        goto LABEL_12;
      }
    }

    unint64_t v8 = 2LL;
    goto LABEL_22;
  }

  int v13 = 0;
  id v12 = 0LL;
  char v5 = IMGetKeychainData(&v12, IDSKeychainServiceName, @"has-regenerated-secured-encryption-keys", 0LL, &v13);
  int64_t v6 = (os_log_s *)v12;
  unsigned int v3 = v6;
  if ((v5 & 1) != 0 || v13 == -25300)
  {
    id v9 = -[os_log_s length](v6, "length");
    if (v9) {
      unint64_t v8 = 1LL;
    }
    else {
      unint64_t v8 = 2LL;
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = @"YES";
      if (!v9) {
        unsigned int v10 = @"NO";
      }
      *(_DWORD *)__int128 buf = 138412290;
      __int128 v15 = (const char *)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Able to determine the has-regenerated-secured-encryption-key status. Has regenerated? %@",  buf,  0xCu);
    }
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v15) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to determine the has-regenerated-secured-encryption-key status. keychainError: %d",  buf,  8u);
    }

    unint64_t v8 = 0LL;
  }

LABEL_22:
  return v8;
}

- (BOOL)_markSecuredEncryptionKeysAsRegenerated:(BOOL)a3
{
  if (a3)
  {
    unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"regenerated" dataUsingEncoding:4]);
    *(_DWORD *)id v9 = 0;
    int v4 = ((uint64_t (*)(os_log_s *, void, const __CFString *, void, void, uint64_t, uint64_t, uint8_t *))IMSetKeychainDataWithProtection)( v3,  IDSKeychainServiceName,  @"has-regenerated-secured-encryption-keys",  0LL,  0LL,  1LL,  1LL,  v9);
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v6 = @"NO";
      *(_DWORD *)__int128 buf = 138412802;
      if (v4) {
        int64_t v6 = @"YES";
      }
      uint64_t v11 = @"YES";
      __int16 v12 = 2112;
      int v13 = v6;
      __int16 v14 = 1024;
      int v15 = *(_DWORD *)v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Updated the has-regenerated-secured-encryption-keys flag to: %@  success? %@  keychainError: %d",  buf,  0x1Cu);
    }
  }

  else
  {
    *(_DWORD *)__int128 buf = 0;
    int v4 = IMRemoveKeychainData(IDSKeychainServiceName, @"has-regenerated-secured-encryption-keys", buf);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
    unsigned int v3 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Removed the has-regenerated-secured-encryption-keys flag from the keychain.",  v9,  2u);
      }
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      sub_10069E388((int *)buf, v3);
    }
  }

  return v4;
}

+ (BOOL)_isEncryptionKeyRegenerationSupportedByCapabilityFlags:(unint64_t)a3
{
  return (a3 >> 5) & 1;
}

+ (BOOL)_isIPsecSupportedByCapabilityFlags:(unint64_t)a3
{
  return (a3 >> 8) & 1;
}

+ (BOOL)_isTinkerPairedInCapabilityFlags:(unint64_t)a3
{
  return (a3 >> 10) & 1;
}

- (void)_regenerateSecuredEncryptionKeys
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Suspending OTR sessions for protection classes A and C...",  buf,  2u);
  }

  -[IDSPairingManager _suspendOTRSessionsWithProtectionClass:](self, "_suspendOTRSessionsWithProtectionClass:", 1LL);
  -[IDSPairingManager _suspendOTRSessionsWithProtectionClass:](self, "_suspendOTRSessionsWithProtectionClass:", 0LL);
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Regenerating encryption keys for protection classes A and C...",  v6,  2u);
  }

  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  [v5 regeneratePairingIdentitiesIncludingClassD:0];
}

- (void)_suspendOTRSessionsWithProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  int64_t v6 = sub_100265648(0LL, v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v38[0] = v29;
  id v7 = sub_100265648(100LL, v3);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v38[1] = v8;
  id v9 = sub_100265648(200LL, v3);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v38[2] = v10;
  uint64_t v11 = sub_100265648(300LL, v3);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v38[3] = v12;
  int v13 = sub_100265688(100LL, v3, (uint64_t)@"UTunDelivery_Default_Sync");
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v38[4] = v14;
  int v15 = sub_100265688(200LL, v3, (uint64_t)@"UTunDelivery_Default_Default");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v38[5] = v16;
  v17 = sub_100265688(300LL, v3, (uint64_t)@"UTunDelivery_Default_Urgent");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v38[6] = v18;
  uint64_t v19 = sub_100265688(300LL, v3, (uint64_t)@"UTunDelivery_Default_UrgentCloud");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v38[7] = v20;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 8LL));

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v32;
    uint64_t v30 = 138412290LL;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration", v30));
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = v30;
          uint64_t v36 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Suspending OTR session with token: %@",  buf,  0xCu);
        }

        [v5 removeSessionKeyForToken:v27];
        [v4 suspendSessionNegotiation:v27 askedByPairedDevice:0];
      }

      id v24 = [v22 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v24);
  }
}

- (BOOL)_purgeSecuredEncryptionKeysForAllPairedDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = [v2 purgeSecuredEncryptionKeysForAllPairedDevices];

  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = @"NO";
    if (v3) {
      char v5 = @"YES";
    }
    int v7 = 138412290;
    unint64_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Purged encryption keys for all paired devices. Success: %@",  (uint8_t *)&v7,  0xCu);
  }

  return v3;
}

- (NSDictionary)localDevice
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[IDSPairingManager localDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v16, 0xCu);
  }

  int v4 = objc_autoreleasePoolPush();
  char v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDevicePropertyIdentifier, v8);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionClassAKey]);
  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDevicePropertyEncryptionClassAKey, v9);
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionClassCKey]);
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDevicePropertyEncryptionClassCKey, v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionClassDKey]);
  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDevicePropertyEncryptionKey, v11);
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _localDevicePrivateData](self, "_localDevicePrivateData"));
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDevicePropertyPrivateDeviceData, v12);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceName]);
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDevicePropertyName, v13);
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 model]);
  if (v14) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDevicePropertyHardwareVersion, v14);
  }

  objc_autoreleasePoolPop(v4);
  return (NSDictionary *)v5;
}

- (id)_localDevicePrivateData
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v4 = [v3 supportsSMS];
  id v5 = [v3 supportsMMS];
  id v6 = [v3 supportsApplePay];
  id v7 = [v3 supportsHandoff];
  id v8 = [v3 supportsTethering];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  if ([v9 supportsIdentification])
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    BOOL v11 = [v10 deviceType] == (id)2;
  }

  else
  {
    BOOL v11 = 0LL;
  }

  uint64_t v12 = _IDSPrivateDeviceDataVersionNumber();
  int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v14,  IDSPrivateDeviceDataVersion);

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v16,  IDSPrivateDeviceDataSupportsApplePay);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v18,  IDSPrivateDeviceDataSupportsHandoff);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v20,  IDSPrivateDeviceDataSupportsTethering);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v22,  IDSPrivateDeviceDataSupportsSMSRelay);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v24,  IDSPrivateDeviceDataSupportsMMSRelay);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v26,  IDSPrivateDeviceDataSupportsPhoneCalls);

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 productBuildVersion]);
  if (v28) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataProductBuildVersion, v28);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v27 productName]);
  if (v29) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataProductName, v29);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v27 productVersion]);
  if (v30) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataProductVersion, v30);
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceColor]);
  if (v31) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataColor, v31);
  }

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v3 enclosureColor]);
  if (v32) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataEnclosureColor, v32);
  }

  return v2;
}

- (void)gatherLocalDeviceInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315138;
    __int128 v31 = "-[IDSPairingManager gatherLocalDeviceInfoWithCompletionBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v30, 0xCu);
  }

  if (v4)
  {
    id v6 = (void (**)(id, void *))[v4 copy];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager localDevice](self, "localDevice"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:IDSDevicePropertyEncryptionKey]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:IDSDevicePropertyEncryptionClassAKey]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:IDSDevicePropertyEncryptionClassCKey]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevicePublicKey](self, "pairedDevicePublicKey"));
    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevicePublicClassAKey](self, "pairedDevicePublicClassAKey"));
      if (v12)
      {
        int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevicePublicClassCKey](self, "pairedDevicePublicClassCKey"));
        BOOL v14 = v13 == 0LL;
      }

      else
      {
        BOOL v14 = 1;
      }
    }

    else
    {
      BOOL v14 = 1;
    }

    if ([v8 length] && objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
    {
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pairing](&OBJC_CLASS___IMRGLog, "pairing"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "We have all the encryption keys, sending device info back",  (uint8_t *)&v30,  2u);
      }

      v6[2](v6, v7);
      id block = self->_block;
      if (block)
      {
        self->_id block = 0LL;
      }

      if (v14)
      {
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v30) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "We're missing their keys but we sent our keys, requesting...",  (uint8_t *)&v30,  2u);
        }

        -[IDSPairingManager _requestPairedDeviceInfoAfterDelay:](self, "_requestPairedDeviceInfoAfterDelay:", 0.0);
      }

      goto LABEL_43;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    unsigned int v19 = [v18 isUnderDataProtectionLock];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    unsigned int v21 = [v20 isUnderFirstDataProtectionLock];

    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pairing](&OBJC_CLASS___IMRGLog, "pairing"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = @"NO";
      int v30 = 134219010;
      __int128 v31 = (const char *)v9;
      if (v19) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      __int16 v32 = 2048;
      __int128 v33 = v10;
      if (v21) {
        id v23 = @"YES";
      }
      __int16 v34 = 2048;
      v35 = v8;
      __int16 v36 = 2112;
      v37 = v24;
      __int16 v38 = 2112;
      v39 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "We're missing some keys (A: %p) (C: %p) (D: %p) (locked: %@) (firstLocked: %@)",  (uint8_t *)&v30,  0x34u);
    }

    if ([v9 length])
    {
      if ([v10 length])
      {
        if ([v8 length]) {
          goto LABEL_43;
        }
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          sub_10069E3FC();
        }

        v6[2](v6, v7);
        id v26 = self->_block;
        if (!v26) {
          goto LABEL_43;
        }
        self->_id block = 0LL;
        goto LABEL_42;
      }

      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pairing](&OBJC_CLASS___IMRGLog, "pairing"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        v28 = "Missing class C key, waiting for keychain save...";
        goto LABEL_39;
      }
    }

    else
    {
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pairing](&OBJC_CLASS___IMRGLog, "pairing"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        v28 = "Missing class A key, waiting for keychain save...";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v30, 2u);
      }
    }

    if (!v6)
    {
LABEL_43:

      goto LABEL_44;
    }

    v29 = objc_retainBlock(v6);
    id v26 = self->_block;
    self->_id block = v29;
LABEL_42:

    goto LABEL_43;
  }

- (id)_activePairedDeviceCBUUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cbuuid]);

  return v4;
}

- (NSString)pairedDeviceUniqueID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueID]);

  return (NSString *)v4;
}

- (id)pairedDeviceBuildVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 buildVersion]);

  return v4;
}

- (NSString)pairedDeviceProductVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);

  return (NSString *)v4;
}

- (id)pairedDeviceProductName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productName]);

  return v4;
}

- (unsigned)pairedDevicePairingProtocolVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned int v4 = [v3 pairingProtocolVersion];

  return v4;
}

- (unsigned)pairedDeviceMinCompatibilityVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned int v4 = [v3 minCompatibilityVersion];

  return v4;
}

- (unsigned)pairedDeviceMaxCompatibilityVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned int v4 = [v3 maxCompatibilityVersion];

  return v4;
}

- (unsigned)pairedDeviceServiceMinCompatibilityVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned __int16 v4 = (unsigned __int16)[v3 serviceMinCompatibilityVersion];

  return v4;
}

- (BOOL)activePairedDeviceHasPairingType:(int64_t)a3
{
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activePairedDevice]);
  LOBYTE(a3) = [v5 pairingType] == (id)a3;

  return a3;
}

- (BOOL)isCurrentDeviceTinkerConfiguredWatch
{
  return 0;
}

- (NSSet)allPairedDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allPairedDevices]);

  return (NSSet *)v3;
}

- (id)allPairedDevicesWithType:(int64_t)a3
{
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allPairedDevicesWithType:a3]);

  return v5;
}

- (id)pairedDeviceHandlesWithPairingType:(int64_t)a3
{
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allPairedDevicesWithType:a3]);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iCloudURIs", (void)v17));
        id v14 = [v13 count];

        if (v14)
        {
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 iCloudURIs]);
          -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v15);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v6;
}

- (NSDictionary)pairedDevice
{
  if (-[IDSPairingManager isPaired](self, "isPaired"))
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePairedDevice]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSDictionary *)v5;
}

- (NSData)pairedDevicePublicKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 publicClassDKey]);

  return (NSData *)v4;
}

- (NSData)pairedDevicePublicClassAKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 publicClassAKey]);

  return (NSData *)v4;
}

- (NSData)pairedDevicePublicClassCKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 publicClassCKey]);

  return (NSData *)v4;
}

- (NSData)pairedDevicePushToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pushToken]);

  return (NSData *)v4;
}

- (id)pairedDeviceiCloudURIs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudURIs]);

  return v4;
}

- (int64_t)pairedDevicePairingType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  id v4 = [v3 pairingType];

  return (int64_t)v4;
}

- (NSDictionary)pairedDevicePrivateData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privateData]);

  return (NSDictionary *)v4;
}

- (BOOL)isPaired
{
  v2 = self;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePairedDevice]);
  LOBYTE(v2) = -[IDSPairingManager _isPairedToDevice:](v2, "_isPairedToDevice:", v4);

  return (char)v2;
}

- (BOOL)_isPairedToDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cbuuid]);
  id v5 = [v4 length];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 publicClassDKey]);
  id v7 = [v6 length];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueID]);
  id v9 = [v8 length];

  if (v5) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  return !v10 && v7 != 0LL;
}

- (NSSet)allPairedUniqueIDs
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allPairedDevices]);

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (-[IDSPairingManager _isPairedToDevice:](self, "_isPairedToDevice:", v10))
        {
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
          -[NSMutableSet addObject:](v3, "addObject:", v11);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return (NSSet *)v3;
}

- (NSSet)allTraditionallyPairedUniqueIDs
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allPairedDevicesWithType:0]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (-[IDSPairingManager _isPairedToDevice:](self, "_isPairedToDevice:", v11))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
          -[NSMutableSet addObject:](v4, "addObject:", v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  objc_autoreleasePoolPop(v3);
  return (NSSet *)v4;
}

- (id)pairedDeviceForUniqueID:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allPairedDevices]);

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (-[IDSPairingManager _isPairedToDevice:](self, "_isPairedToDevice:", v11))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
          unsigned __int8 v13 = [v12 isEqualToIgnoringCase:v4];

          if ((v13 & 1) != 0)
          {
            id v14 = v11;
            goto LABEL_12;
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = 0LL;
LABEL_12:

  return v14;
}

- (BOOL)_hasAllEncryptionKeys
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePairedDevice]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 publicClassAKey]);
  id v5 = [v4 length];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 publicClassCKey]);
  id v7 = [v6 length];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 publicClassDKey]);
  id v9 = [v8 length];

  if (v5) {
    BOOL v10 = v7 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v12 = !v10 && v9 != 0LL;

  return v12;
}

- (void)_updatePairedState:(BOOL)a3
{
  BOOL v3 = a3;
  notify_set_state(self->_pairingStateToken, a3);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[IDSPairingManager _updatePairedState:]";
    __int16 v10 = 2048;
    BOOL v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Updating notify token state to: isPaired %llu",  (uint8_t *)&v8,  0x16u);
  }

  id v5 = [IDSPairingStateChangedNotification UTF8String];
  id v7 = (const char *)IMUserScopedNotification(v5, v6);
  notify_post(v7);
}

- (void)_updateActiveStateForAllPairedDevices
{
}

- (void)_updateActiveStateForAllPairedDevices:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Update notifier state for paired devices",  buf,  2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allPairedDevices]);

  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 count]));
    *(_DWORD *)__int128 buf = 138412290;
    __int128 v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "All devices count: %@", buf, 0xCu);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v28;
    *(void *)&__int128 v12 = 138412290LL;
    __int128 v24 = v12;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        __int128 v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v15);
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog deviceState](&OBJC_CLASS___IMRGLog, "deviceState", v24));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = v24;
          __int128 v33 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Checking %@", buf, 0xCu);
        }

        uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 uniqueID]);
        __int128 v20 = (void *)v18;
        if (v3)
        {
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePropertiesStateNotifier sharedInstance]( &OBJC_CLASS___IDSDevicePropertiesStateNotifier,  "sharedInstance"));
          [v21 updateStateForDeviceWithUniqueID:v20];
        }

        else
        {
          uint64_t v22 = im_primary_queue(v18, v19);
          id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10017747C;
          block[3] = &unk_1008F6010;
          id v26 = v20;
          dispatch_async(v23, block);

          unsigned int v21 = v26;
        }

        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v13);
  }
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  delegateMap = self->_delegateMap;
  id v8 = v4;
  if (!delegateMap)
  {
    uint64_t v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    id v7 = self->_delegateMap;
    self->_delegateMap = v6;

    id v4 = v8;
    delegateMap = self->_delegateMap;
  }

  if (!-[NSHashTable containsObject:](delegateMap, "containsObject:", v4)) {
    -[NSHashTable addObject:](self->_delegateMap, "addObject:", v8);
  }
}

- (void)removeDelegate:(id)a3
{
  if (!-[NSHashTable count](self->_delegateMap, "count"))
  {
    delegateMap = self->_delegateMap;
    self->_delegateMap = 0LL;
  }

- (BOOL)addLocalPairedDevice:(id)a3 BTOutOfBandKey:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5 pairingType:(int64_t)a6 bluetoothMACAddress:(id)a7
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v11 length])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    unsigned __int8 v15 = [v14 containsPairedDeviceWithCBUUID:v11];

    if ((v15 & 1) != 0)
    {
      int v16 = 0;
LABEL_20:
      BOOL v43 = -[IDSPairingManager isPaired](self, "isPaired");
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = @"YES";
        *(_DWORD *)__int128 buf = 136315906;
        v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
        if (v16) {
          v46 = @"YES";
        }
        else {
          v46 = @"NO";
        }
        if (!v43) {
          v45 = @"NO";
        }
        __int16 v55 = 2112;
        id v56 = v11;
        __int16 v57 = 2112;
        v58 = v46;
        __int16 v59 = 2112;
        v60 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s Added locally paired device with CBUUID %@ to repository? %@. Device is now paired? %@ ",  buf,  0x2Au);
      }

      if (v16)
      {
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
        if (v43)
        {
          if (v48)
          {
            *(_DWORD *)__int128 buf = 136315138;
            v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
            _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%s notifying delegate that we are properly paired with a local device",  buf,  0xCu);
          }

          v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
          v50 = (void *)objc_claimAutoreleasedReturnValue([v49 pairedDeviceWithCBUUID:v11]);

          -[IDSPairingManager _notifyDelegatesDevicePairedToDevice:](self, "_notifyDelegatesDevicePairedToDevice:", v50);
        }

        else
        {
          if (v48)
          {
            *(_DWORD *)__int128 buf = 136315138;
            v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
            _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%s We are missing the local device information to properly pair, requesting it now.",  buf,  0xCu);
          }

          -[IDSPairingManager _requestPairedDeviceInfoAfterDelay:](self, "_requestPairedDeviceInfoAfterDelay:", 10.0);
        }

        -[IDSPairingManager _updatePairedState:](self, "_updatePairedState:", v43);
      }

      BOOL v18 = v16 != 0;
      goto LABEL_37;
    }

    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Marking the encryption keys as regenerated to avoid regenerating newly created keys.",  buf,  2u);
    }

    -[IDSPairingManager _markSecuredEncryptionKeysAsRegenerated:](self, "_markSecuredEncryptionKeysAsRegenerated:", 1LL);
    -[IDSPairingManager setBTOutOfBandKey:forCBUUID:](self, "setBTOutOfBandKey:forCBUUID:", v12, v11);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    unsigned int v21 = [v20 addPairedDeviceWithCBUUID:v11 pairingType:a6];

    if (v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
      id v23 = [v22 activatePairedDeviceWithCBUUID:v11];

      if (!v23)
      {
        int v16 = 1;
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }

      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_10069E494(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }

    else
    {
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_10069E504(v24, v32, v33, v34, v35, v36, v37, v38);
      }
    }

    int v16 = 0;
    if (!v8)
    {
LABEL_19:
      -[IDSPairingManager _updateActiveStateForAllPairedDevices](self, "_updateActiveStateForAllPairedDevices");
      goto LABEL_20;
    }

- (BOOL)removeLocalPairedDevice:(id)a3
{
  id v4 = (char *)a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    unsigned int v21 = "-[IDSPairingManager removeLocalPairedDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v20, 0xCu);
  }

  if ([v4 length])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedDeviceWithCBUUID:v4]);

    BOOL v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
    -[IDSPairingManager _clearPairedDeviceDidConnectBlocksForUniqueID:]( self,  "_clearPairedDeviceDidConnectBlocksForUniqueID:",  v8);
    id v9 = (char *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _nrDeviceIdentifierWithCBUUID:](self, "_nrDeviceIdentifierWithCBUUID:", v8));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138478083;
      unsigned int v21 = v9;
      __int16 v22 = 2113;
      id v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Will unregister device from nrDeviceManager {nrIdentifier: %{private}@, cbuuidUUID: %{private}@, }",  (uint8_t *)&v20,  0x16u);
    }

    if (v9)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager nrDeviceManager](self, "nrDeviceManager"));
      [v11 unregisterDevice:v9];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    unsigned int v13 = [v12 removePairedDeviceWithCBUUID:v4];

    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v15 = @"NO";
      if (v13) {
        unsigned __int8 v15 = @"YES";
      }
      int v20 = 138412546;
      unsigned int v21 = v4;
      __int16 v22 = 2112;
      id v23 = (void *)v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removed locally paired device with CBUUID: %@? %@",  (uint8_t *)&v20,  0x16u);
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    unsigned int v17 = [v16 isEmpty];

    if (v17)
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      [v18 regeneratePairingIdentitiesIncludingClassD:1];
    }

    if (v13)
    {
      -[IDSPairingManager _notifyDelegatesDeviceUnpairedFromDevice:]( self,  "_notifyDelegatesDeviceUnpairedFromDevice:",  v7);
      -[IDSPairingManager _updateActiveStateForAllPairedDevices](self, "_updateActiveStateForAllPairedDevices");
      -[IDSPairingManager _updatePairedState:](self, "_updatePairedState:", 0LL);
    }
  }

  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)disconnectActivePairedDevice
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[IDSPairingManager disconnectActivePairedDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[IDSPairingManager deactivatePairedDevices](self, "deactivatePairedDevices");
  -[IDSPairingManager _updateActiveStateForAllPairedDevices](self, "_updateActiveStateForAllPairedDevices");
  -[IDSPairingManager _updatePairedState:](self, "_updatePairedState:", 0LL);
}

- (int64_t)activatePairedDeviceWithCBUUID:(id)a3
{
  int v4 = (char *)a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v24 = "-[IDSPairingManager activatePairedDeviceWithCBUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    __int128 v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Activating a paired device with CBUUID: %@",  buf,  0xCu);
  }

  id v7 = (char *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _activePairedDeviceCBUUID](self, "_activePairedDeviceCBUUID"));
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    __int128 v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Switching active paired device from %@ to %@",  buf,  0x16u);
  }

  if ([v4 isEqualToIgnoringCase:v7])
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10069E574();
    }
    unint64_t v10 = 1LL;
  }

  else
  {
    id v9 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);
    id v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
    id v12 = (char *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _nrDeviceIdentifierWithCBUUID:](self, "_nrDeviceIdentifierWithCBUUID:", v9));
    unsigned int v13 = (char *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _nrDeviceIdentifierWithCBUUID:](self, "_nrDeviceIdentifierWithCBUUID:", v11));
    if (v12)
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138478083;
        __int128 v24 = (const char *)v9;
        __int16 v25 = 2113;
        uint64_t v26 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Disabling NetworkRelay device {activeUUID: %{private}@, activeDeviceIdentifier: %{private}@}",  buf,  0x16u);
      }

      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager nrDeviceManager](self, "nrDeviceManager"));
      [v15 disableDevice:v12];
    }

    if (v13)
    {
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138478083;
        __int128 v24 = (const char *)v11;
        __int16 v25 = 2113;
        uint64_t v26 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Enabling NetworkRelay device {newUUID: %{private}@, newDeviceIdentifier: %{private}@}",  buf,  0x16u);
      }

      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager nrDeviceManager](self, "nrDeviceManager"));
      [v17 enableDevice:v13];
    }

    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    unint64_t v10 = (unint64_t)[v18 activatePairedDeviceWithCBUUID:v4];

    -[IDSPairingManager _updateActiveStateForAllPairedDevices](self, "_updateActiveStateForAllPairedDevices");
  }

  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 > 4) {
      int v20 = @"<unknown>";
    }
    else {
      int v20 = *(&off_1008FC168 + v10);
    }
    unsigned int v21 = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%d)",  v20,  v10));
    *(_DWORD *)__int128 buf = 138412546;
    __int128 v24 = v4;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Result of activating a paired device with CBUUID %@ is %@",  buf,  0x16u);
  }

  return v10;
}

- (void)deactivatePairedDevices
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v22 = "-[IDSPairingManager deactivatePairedDevices]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[IDSPairingManager setShouldQuickSwitchAfterIPSecConnected:](self, "setShouldQuickSwitchAfterIPSecConnected:", 0LL);
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Disabling NetworkRelay for all paired devices.",  buf,  2u);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager cbuuidsOfPairedDevices](self, "cbuuidsOfPairedDevices"));
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&__int128 v7 = 138477827LL;
    __int128 v16 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(const char **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager _nrDeviceIdentifierWithCBUUID:]( self,  "_nrDeviceIdentifierWithCBUUID:",  v11,  v16));
        unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
        uint64_t v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138478083;
            __int16 v22 = v11;
            __int16 v23 = 2113;
            __int128 v24 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Disabling NetworkRelay device {pairedDeviceUUID: %{private}@, nrIdentifier: %{private}@}",  buf,  0x16u);
          }

          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager nrDeviceManager](self, "nrDeviceManager"));
          -[os_log_s disableDevice:](v14, "disableDevice:", v12);
        }

        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = v16;
          __int16 v22 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to create IDSNRDeviceIdentifier from pairedDeviceUUID - failed to deactivate device {pairedDeviceUUID: %{private}@}",  buf,  0xCu);
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v8);
  }

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  [v15 deactivatePairedDevices];

  -[IDSPairingManager _updateActiveStateForAllPairedDevices](self, "_updateActiveStateForAllPairedDevices");
}

- (void)updateNetworkRelayStateForAllPairedDevices
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allPairedDevices]);

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    __int16 v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Update registration status with NetworkRelay for active device and disable non-active devices: %@",  buf,  0xCu);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ([v11 supportIPsec])
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cbuuidUUID]);
          unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager _nrDeviceIdentifierWithCBUUID:]( self,  "_nrDeviceIdentifierWithCBUUID:",  v12));

          if (v13)
          {
            if ([v11 isActive])
            {
              if (-[IDSPairingManager _isPairedToDevice:](self, "_isPairedToDevice:", v11))
              {
                uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 cbuuidUUID]);
                unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v11 maxCompatibilityVersion]));
                -[IDSPairingManager _networkRelayRegisterDeviceWithCBUUID:wasInitiallySetupUsingIDSPairing:maxCompatibilityVersion:BTOutOfBandKey:supportsIPsecWithSPPLink:bluetoothMACAddress:]( self,  "_networkRelayRegisterDeviceWithCBUUID:wasInitiallySetupUsingIDSPairing:maxCompatibilityVersion:BTOutOf BandKey:supportsIPsecWithSPPLink:bluetoothMACAddress:",  v14,  1LL,  v15,  0LL,  0LL,  0LL);
              }

              else
              {
                uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                  sub_10069E5F0(&v18, v19, v14);
                }
              }
            }

            else
            {
              __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 cbuuidUUID]);
                *(_DWORD *)__int128 buf = 138478083;
                __int16 v25 = v17;
                __int16 v26 = 2113;
                uint64_t v27 = v13;
                _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Disabling NetworkRelay device {cbuuidUUID: %{private}@, nrIdentifier: %{private}@}",  buf,  0x16u);
              }

              uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager nrDeviceManager](self, "nrDeviceManager"));
              -[os_log_s disableDevice:](v14, "disableDevice:", v13);
            }
          }

          else
          {
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_10069E5A0((uint64_t)v28, (uint64_t)v11);
            }
          }
        }

        else
        {
          unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_10069E624((uint64_t)v29, (uint64_t)v11);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }

    while (v8);
  }
}

- (void)ensureCommunicationWithActivePairedDeviceIsPossible
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    unint64_t v10 = "-[IDSPairingManager ensureCommunicationWithActivePairedDeviceIsPossible]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _activePairedDeviceCBUUID](self, "_activePairedDeviceCBUUID"));
  if ([v4 length])
  {
    unsigned int v5 = -[IDSPairingManager isMissingAnyPublicKeyForPairedDeviceWithCBUUID:]( self,  "isMissingAnyPublicKeyForPairedDeviceWithCBUUID:",  v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        LOWORD(v9) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requesting information about the new active paired device.",  (uint8_t *)&v9,  2u);
      }

      -[IDSPairingManager _requestPairedDeviceInfoAfterDelay:](self, "_requestPairedDeviceInfoAfterDelay:", 0.0);
    }

    else
    {
      if (v7)
      {
        LOWORD(v9) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requesting information about the new active paired device was unnecessary. Communication is possible.",  (uint8_t *)&v9,  2u);
      }
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cannot ensure communication is possible because there is no active paired device.",  (uint8_t *)&v9,  2u);
    }
  }
}

- (BOOL)isCurrentDevicePairedOrPairing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allPairedDevices]);
  id v4 = [v3 count];

  return v4 != 0LL;
}

- (BOOL)isTraditionalDevicePairedOrPairing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allPairedDevicesWithType:0]);
  id v4 = [v3 count];

  return v4 != 0LL;
}

- (id)cbuuidsOfPairingDevices
{
  return -[IDSPairingManager _cbuuidsWithIsPairingValue:](self, "_cbuuidsWithIsPairingValue:", 1LL);
}

- (id)cbuuidsOfPairedDevices
{
  return -[IDSPairingManager _cbuuidsWithIsPairingValue:](self, "_cbuuidsWithIsPairingValue:", 0LL);
}

- (id)uniqueIDToCbuuidsOfPairingDevicesDictionary
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pairedDevicesWithIsPairingValue:0]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cbuuid", (void)v19));
        if (v12)
        {
          unsigned int v13 = (void *)v12;
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);

          if (v14)
          {
            unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 cbuuid]);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
            -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v15, v16);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  id v17 = -[NSMutableDictionary copy](v3, "copy");
  return v17;
}

- (id)_identityDataErrorPairForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fullMessageProtectionIdentityForDataProtectionClass:v3]);

  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataRepresentationWithError:&v12]);
  id v7 = v12;
  id v8 = objc_alloc(&OBJC_CLASS___IDSLocalPairingIdentityDataErrorPair);
  if (v6) {
    id v9 = [v8 initWithIdentityData:v6];
  }
  else {
    id v9 = [v8 initWithError:v7];
  }
  unint64_t v10 = v9;

  return v10;
}

- (id)localDeviceRecord
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager _identityDataErrorPairForDataProtectionClass:]( self,  "_identityDataErrorPairForDataProtectionClass:",  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager _identityDataErrorPairForDataProtectionClass:]( self,  "_identityDataErrorPairForDataProtectionClass:",  0LL));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager _identityDataErrorPairForDataProtectionClass:]( self,  "_identityDataErrorPairForDataProtectionClass:",  2LL));
  id v6 = [[IDSLocalPairingLocalDeviceRecord alloc] initWithWithFullIdentityDataClassA:v3 classC:v4 classD:v5];

  return v6;
}

- (id)pairedDeviceRecords
{
  __int16 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pairedDevicesWithIsPairingValue:0]);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v9);
        id v11 = objc_alloc(&OBJC_CLASS___NSUUID);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 cbuuid]);
        unsigned int v13 = -[NSUUID initWithUUIDString:](v11, "initWithUUIDString:", v12);

        if (v13)
        {
          id v14 = objc_alloc(&OBJC_CLASS___IDSLocalPairingIdentityDataErrorPair);
          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 publicClassAKey]);
          __int128 v16 = (os_log_s *)[v14 initWithIdentityData:v15];

          id v17 = objc_alloc(&OBJC_CLASS___IDSLocalPairingIdentityDataErrorPair);
          uint8_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 publicClassCKey]);
          id v19 = [v17 initWithIdentityData:v18];

          id v20 = objc_alloc(&OBJC_CLASS___IDSLocalPairingIdentityDataErrorPair);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v10 publicClassDKey]);
          id v22 = [v20 initWithIdentityData:v21];

          id v23 = [[IDSLocalPairingPairedDeviceRecord alloc] initWithCBUUID:v13 publicIdentityDataClassA:v16 classC:v19 classD:v22];
          -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v23, v13);
        }

        else
        {
          __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138477827;
            uint64_t v31 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Missing cbuuid for paired device -- skipping {pairedDevice: %{private}@}",  buf,  0xCu);
          }
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }

    while (v7);
  }

  return v25;
}

- (id)_cbuuidsWithIsPairingValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pairedDevicesWithIsPairingValue:v3]);

  id v6 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cbuuidUUID", (void)v16));

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 cbuuidUUID]);
          -[NSMutableSet addObject:](v6, "addObject:", v14);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  return v6;
}

- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice
{
  return -[IDSPairingManager shouldUseIPsecLinkForDefaultPairedDeviceAndLogQuery:]( self,  "shouldUseIPsecLinkForDefaultPairedDeviceAndLogQuery:",  0LL);
}

- (BOOL)shouldUseIPsecLinkForDefaultPairedDeviceAndLogQuery:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v6 = [v5 shouldUseIPsecLinkForDefaultPairedDevice];

  if (v3)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activePairedDevice]);
      int v12 = 138412546;
      unsigned int v13 = v8;
      __int16 v14 = 2112;
      unsigned __int8 v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Queried shouldUseIPsecLinkForDefaultPairedDevice {shouldUseIPsec: %@, activePairedDevice: %@}",  (uint8_t *)&v12,  0x16u);
    }
  }

  return v6;
}

- (void)registerPairedDeviceWithUniqueID:(id)a3 didConnectBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___IMPair);
  id v9 = objc_retainBlock(v6);

  uint64_t v10 = -[IMPair initWithFirst:second:](v8, "initWithFirst:second:", v7, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    __int128 v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Registering didConnectToPairedDevice block {pair: %@}",  (uint8_t *)&v15,  0xCu);
  }

  if (!self->_registeredPairedDeviceDidConnectBlockPairs)
  {
    int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    registeredPairedDeviceDidConnectBlockPairs = self->_registeredPairedDeviceDidConnectBlockPairs;
    self->_registeredPairedDeviceDidConnectBlockPairs = v12;
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs"));
  [v14 addObject:v10];
}

- (void)_callPairedDeviceDidConnectBlocksForUniqueID:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs"));
    *(_DWORD *)__int128 buf = 138412802;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Calling didConnectToPairedDeviceBlocks {cbuuid: %@, error: %@, pairs: %@}",  buf,  0x20u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs"));
  if (v10)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs",  0LL));
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          __int128 v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 first]);
          unsigned int v18 = [v17 isEqual:v6];

          if (v18)
          {
            __int128 v19 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v16 second]);
            ((void (**)(void, id))v19)[2](v19, v7);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v13);
    }
  }

  -[IDSPairingManager _clearPairedDeviceDidConnectBlocksForUniqueID:]( self,  "_clearPairedDeviceDidConnectBlocksForUniqueID:",  v6);
}

- (void)_clearPairedDeviceDidConnectBlocksForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs"));
    *(_DWORD *)__int128 buf = 138412546;
    id v25 = v4;
    __int16 v26 = 2112;
    __int16 v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Clearing didConnectToPairedDeviceBlocks {cbuuid: %@, pairs: %@}",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs"));
  if (v7)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs",  0LL));
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 first]);
          unsigned int v16 = [v15 isEqual:v4];

          if (v16) {
            -[NSMutableArray addObject:](v8, "addObject:", v14);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v11);
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPairingManager registeredPairedDeviceDidConnectBlockPairs]( self,  "registeredPairedDeviceDidConnectBlockPairs"));
    [v17 removeObjectsInArray:v8];

    if (!-[NSMutableArray count](self->_registeredPairedDeviceDidConnectBlockPairs, "count"))
    {
      registeredPairedDeviceDidConnectBlockPairs = self->_registeredPairedDeviceDidConnectBlockPairs;
      self->_registeredPairedDeviceDidConnectBlockPairs = 0LL;
    }
  }
}

- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  LOBYTE(v4) = [v7 updatePairedDeviceWithCBUUID:v6 supportIPsec:v4];

  return v4;
}

- (BOOL)updateLocalPairedDevice:(id)a3 pairingType:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = -[IDSPairingManager pairedDevicePairingType](self, "pairedDevicePairingType");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v9 = [v8 updatePairedDeviceWithCBUUID:v6 pairingType:a4];

  if (v9 && v7 != a4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100179998;
    v12[3] = &unk_1008FC0F8;
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevice](self, "pairedDevice"));
    id v10 = v13;
    -[IDSPairingManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v12);
  }

  return v9;
}

- (BOOL)setPairedDeviceInfo:(id)a3
{
  uint64_t v4 = (char *)a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v39 = "-[IDSPairingManager setPairedDeviceInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received paired device info: %@", buf, 0xCu);
  }

  if (![v4 count])
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10069E674();
    }
    goto LABEL_31;
  }

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceUUIDString](self, "pairedDeviceUUIDString"));
  id v8 = [v7 length];

  if (!v8)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10069E6E0(v10, v28, v29, v30, v31, v32, v33, v34);
    }
LABEL_31:
    LOBYTE(v13) = 0;
    goto LABEL_32;
  }

  unsigned __int8 v9 = -[IDSPairingManager isPaired](self, "isPaired");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _activePairedDeviceCBUUID](self, "_activePairedDeviceCBUUID"));
  unsigned int v11 = -[IDSPairingManager isMissingAnyPublicKeyForPairedDeviceWithCBUUID:]( self,  "isMissingAnyPublicKeyForPairedDeviceWithCBUUID:",  v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v13 = [v12 updatePairedDeviceWithCBUUID:v10 deviceInfoPayload:v4];

  -[IDSPairingManager _updateActiveStateForAllPairedDevices:](self, "_updateActiveStateForAllPairedDevices:", 1LL);
  unsigned int v14 = -[IDSPairingManager isMissingAnyPublicKeyForPairedDeviceWithCBUUID:]( self,  "isMissingAnyPublicKeyForPairedDeviceWithCBUUID:",  v10);
  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pairedDeviceWithCBUUID:v10]);

  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v18 = @"NO";
    if (v13) {
      unsigned int v18 = @"YES";
    }
    *(_DWORD *)__int128 buf = 138412546;
    v39 = (const char *)v18;
    __int16 v40 = 2112;
    v41 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updated paired device? %@ updated state: %@",  buf,  0x16u);
  }

  if (v13)
  {
    uint64_t v37 = v16;
    unsigned int v19 = -[IDSPairingManager isPaired](self, "isPaired");
    char v36 = v19 ^ 1 | v9;
    if ((v36 & 1) == 0) {
      -[IDSPairingManager _updatePairedState:](self, "_updatePairedState:", 1LL);
    }
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
    unsigned int v21 = [v20 hasAllEncryptionKeys];

    if ((v19 & v11) == 1 && v14 != 1 && v21)
    {
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "We were missing keys from the remote device, resuming OTR session negotiation",  buf,  2u);
      }

      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
      [v23 resumeSessionNegotiation];
    }

    unsigned int v16 = v37;
    if (-[IDSPairingManager pairedDeviceServiceMinCompatibilityVersion]( self,  "pairedDeviceServiceMinCompatibilityVersion") >= 3)
    {
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "This device supports cloud delivery, updating flag to enable it when possbile",  buf,  2u);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      [v25 setPendingCloudFlagOnDefaultPeer];
    }

    if ((v36 & 1) == 0)
    {
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 pairedDeviceWithCBUUID:v10]);

      -[IDSPairingManager _notifyDelegatesDevicePairedToDevice:](self, "_notifyDelegatesDevicePairedToDevice:", v27);
    }
  }

LABEL_32:
  return v13;
}

- (BOOL)isMissingAnyPublicKeyForPairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pairedDeviceWithCBUUID:v4]);

  LOBYTE(v5) = [v6 hasAllPublicKeys] ^ 1;
  return (char)v5;
}

- (id)_createRegistrationProperties:(BOOL)a3 maxCompatibilityVersion:(id)a4 BTOutOfBandKey:(id)a5 supportsIPsecWithSPPLink:(BOOL)a6 bluetoothMACAddress:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = objc_alloc_init(&OBJC_CLASS___NRDevicePairingProperties);
  if (v11) {
    objc_msgSend(v14, "setPairingProtocolVersion:", objc_msgSend(v11, "unsignedIntegerValue"));
  }
  [v14 setWasInitiallySetupUsingIDSPairing:v10];
  if (v10) {
    id v15 = 0LL;
  }
  else {
    id v15 = v12;
  }
  [v14 setOutOfBandKey:v15];
  [v14 setBluetoothMACAddress:v13];

  [v14 setPairWithSPPLink:v8];
  return v14;
}

- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 wasInitiallySetupUsingIDSPairing:(BOOL)a4 maxCompatibilityVersion:(id)a5 BTOutOfBandKey:(id)a6 supportsIPsecWithSPPLink:(BOOL)a7 bluetoothMACAddress:(id)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue( -[IDSPairingManager _createRegistrationProperties:maxCompatibilityVersion:BTOutOfBandKey:supportsIPsecWithSPPLink:bluetoothMACAddress:]( self,  "_createRegistrationProperties:maxCompatibilityVersion:BTOutOfBandKey:supportsIPsecWithSPPLink:bluetoothMACAddress:",  v12,  a5,  a6,  v9,  a8));
  -[IDSPairingManager _networkRelayRegisterDeviceWithCBUUID:properties:shouldPairDirectlyOverIPsec:]( self,  "_networkRelayRegisterDeviceWithCBUUID:properties:shouldPairDirectlyOverIPsec:",  v14,  v15,  0LL);
}

- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 properties:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _nrDeviceIdentifierWithCBUUID:](self, "_nrDeviceIdentifierWithCBUUID:", v8));
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  BOOL v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138478339;
      uint64_t v29 = v10;
      __int16 v30 = 2113;
      id v31 = v9;
      __int16 v32 = 2113;
      id v33 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Calling -[NRDeviceManager registerDevice:properties:queue:completionBlock:] {nrDeviceIdentifier: %{private}@, pr operties: %{private}@, cbuuid: %{private}@}",  buf,  0x20u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager nrDeviceManager](self, "nrDeviceManager"));
    uint64_t v15 = im_primary_queue(v13, v14);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10017A1B4;
    v23[3] = &unk_1008FC120;
    __int128 v24 = (os_log_s *)v8;
    BOOL v27 = a5;
    id v25 = v10;
    __int16 v26 = self;
    [v13 registerDevice:v25 properties:v9 queue:v16 completionBlock:v23];

    BOOL v12 = v24;
  }

  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    sub_10069E750((uint64_t)v8, v12, v17, v18, v19, v20, v21, v22);
  }
}

- (BOOL)updatePairedDeviceBuildVersion:(id)a3 productVersion:(id)a4 productName:(id)a5 pairingProtocolVersion:(unsigned int)a6 minCompatibilityVersion:(unsigned int)a7 maxCompatibilityVersion:(unsigned int)a8 serviceMinCompatibilityVersion:(unsigned __int16)a9 capabilityFlags:(unint64_t)a10 deviceUniqueID:(id)a11
{
  LODWORD(v85) = a7;
  HIDWORD(v85) = a8;
  uint64_t v14 = (__CFString *)a3;
  uint64_t v15 = (__CFString *)a4;
  unsigned int v16 = (const __CFString *)a5;
  id v87 = a11;
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)v92 = "-[IDSPairingManager updatePairedDeviceBuildVersion:productVersion:productName:pairingProtocolVersio"
                     "n:minCompatibilityVersion:maxCompatibilityVersion:serviceMinCompatibilityVersion:capabilityFlags:deviceUniqueID:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pairingProtocolDebug](&OBJC_CLASS___IMRGLog, "pairingProtocolDebug"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)v92 = "-[IDSPairingManager updatePairedDeviceBuildVersion:productVersion:productName:pairingProtocolVersio"
                     "n:minCompatibilityVersion:maxCompatibilityVersion:serviceMinCompatibilityVersion:capabilityFlags:deviceUniqueID:]";
    *(_WORD *)&v92[8] = 1024;
    LODWORD(v93) = a6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s setting version %u", buf, 0x12u);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activePairedDevice]);
  unsigned int v81 = [v20 supportIPsec];

  unsigned int v22 = objc_msgSend((id)objc_opt_class(self, v21), "_isIPsecSupportedByCapabilityFlags:", a10);
  unsigned int v82 = objc_msgSend((id)objc_opt_class(self, v23), "_isTinkerPairedInCapabilityFlags:", a10);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _activePairedDeviceCBUUID](self, "_activePairedDeviceCBUUID"));
  v86 = (__CFString *)v16;
  if (v24)
  {
    uint64_t v78 = objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceUniqueID](self, "pairedDeviceUniqueID"));
    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceBuildVersion](self, "pairedDeviceBuildVersion"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceProductVersion](self, "pairedDeviceProductVersion"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceProductName](self, "pairedDeviceProductName"));
    unsigned int v74 = -[IDSPairingManager pairedDevicePairingProtocolVersion](self, "pairedDevicePairingProtocolVersion");
    HIDWORD(v73) = -[IDSPairingManager pairedDeviceMinCompatibilityVersion](self, "pairedDeviceMinCompatibilityVersion");
    LODWORD(v73) = -[IDSPairingManager pairedDeviceMaxCompatibilityVersion](self, "pairedDeviceMaxCompatibilityVersion");
    unsigned int v75 = -[IDSPairingManager pairedDeviceServiceMinCompatibilityVersion]( self,  "pairedDeviceServiceMinCompatibilityVersion");
    unsigned int v77 = -[IDSPairingManager activePairedDeviceHasPairingType:](self, "activePairedDeviceHasPairingType:", 1LL);
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)v92 = v25;
      *(_WORD *)&v92[8] = 2112;
      v93 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "buildVersion                   %@ vs %@",  buf,  0x16u);
    }

    BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)v92 = v84;
      *(_WORD *)&v92[8] = 2112;
      v93 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "productVersion                 %@ vs %@",  buf,  0x16u);
    }

    v79 = (void *)v25;

    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)v92 = v83;
      *(_WORD *)&v92[8] = 2112;
      v93 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "productName                    %@ vs %@",  buf,  0x16u);
    }

    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109376;
      *(_DWORD *)v92 = v74;
      *(_WORD *)&v92[4] = 1024;
      *(_DWORD *)&v92[6] = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "pairingProtocolVersion         %d vs %d",  buf,  0xEu);
    }

    __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109376;
      *(_DWORD *)v92 = HIDWORD(v73);
      *(_WORD *)&v92[4] = 1024;
      *(_DWORD *)&v92[6] = v85;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "minCompatibilityVersion        %d vs %d",  buf,  0xEu);
    }

    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109376;
      *(_DWORD *)v92 = v73;
      *(_WORD *)&v92[4] = 1024;
      *(_DWORD *)&v92[6] = HIDWORD(v85);
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "maxCompatibilityVersion        %d vs %d",  buf,  0xEu);
    }

    __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109376;
      *(_DWORD *)v92 = v75;
      *(_WORD *)&v92[4] = 1024;
      *(_DWORD *)&v92[6] = a9;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "serviceMinCompatibilityVersion %d vs %d",  buf,  0xEu);
    }

    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = @"NO";
      if (v81) {
        uint64_t v35 = @"YES";
      }
      else {
        uint64_t v35 = @"NO";
      }
      if (v22) {
        uint64_t v34 = @"YES";
      }
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)v92 = v35;
      *(_WORD *)&v92[8] = 2112;
      v93 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "supportIPsec                  %@ vs %@",  buf,  0x16u);
    }

    char v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    uint64_t v37 = v87;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = @"NO";
      if (v77) {
        v39 = @"YES";
      }
      else {
        v39 = @"NO";
      }
      if (v82) {
        uint64_t v38 = @"YES";
      }
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)v92 = v39;
      *(_WORD *)&v92[8] = 2112;
      v93 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "isTinkerPaired                       %@ vs %@",  buf,  0x16u);
    }

    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    LOWORD(v72) = a9;
    unsigned int v41 = objc_msgSend( v40,  "updatePairedDeviceWithCBUUID:deviceUniqueID:buildVersion:productVersion:productName:pairingPro tocolVersion:minCompatibilityVersion:maxCompatibilityVersion:serviceMinCompatibilityVersion:",  v24,  v87,  v14,  v15,  v16,  a6,  v85,  v72);

    v42 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v24);
    BOOL v43 = v42;
    v80 = v15;
    if (!v41)
    {
      id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
      __int16 v55 = (void *)v78;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
        sub_10069E828();
      }
      goto LABEL_91;
    }

    v76 = v42;
    BOOL v44 = -[IDSPairingManager isPaired](self, "isPaired");
    if (((v77 | v82 ^ 1) & 1) == 0)
    {
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Device wants Tinker pairing - updating repository",  buf,  2u);
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
      [v46 updatePairedDeviceWithCBUUID:v24 pairingType:1];
    }

    unsigned int v47 = -[IDSPairingManager _isIPSecLinkEnabled](self, "_isIPSecLinkEnabled");
    BOOL v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    if ((v47 & v22) == 1)
    {
      if (v49)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Device supports IPsec - Registering",  buf,  2u);
      }

      if ((v81 & 1) == 0) {
        -[IDSPairingManager setShouldQuickSwitchAfterIPSecConnected:]( self,  "setShouldQuickSwitchAfterIPSecConnected:",  1LL);
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
      [v50 updatePairedDeviceWithCBUUID:v24 supportIPsec:1];

      v51 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      [v51 addConnectivityDelegate:self];

      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      [v52 startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:v76];

      cbuuidToBTOutOfBandKeyDictionary = self->_cbuuidToBTOutOfBandKeyDictionary;
      uint64_t v37 = v87;
      if (cbuuidToBTOutOfBandKeyDictionary) {
        v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( cbuuidToBTOutOfBandKeyDictionary,  "objectForKeyedSubscript:",  v24));
      }
      else {
        v54 = 0LL;
      }
      __int16 v55 = (void *)v78;
      if (v54) {
        int v60 = 1;
      }
      else {
        int v60 = v44;
      }
      if (v60 == 1)
      {
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  HIDWORD(v85)));
        -[IDSPairingManager _networkRelayRegisterDeviceWithCBUUID:wasInitiallySetupUsingIDSPairing:maxCompatibilityVersion:BTOutOfBandKey:supportsIPsecWithSPPLink:bluetoothMACAddress:]( self,  "_networkRelayRegisterDeviceWithCBUUID:wasInitiallySetupUsingIDSPairing:maxCompatibilityVersion:BTOutOfBandKey: supportsIPsecWithSPPLink:bluetoothMACAddress:",  v76,  v44,  v61,  v54,  0LL,  0LL);
      }

      else
      {
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10069E854();
        }
      }

      BOOL v43 = v76;
      if (!v44) {
        goto LABEL_92;
      }
    }

    else
    {
      if (v49)
      {
        __int16 v57 = @"NO";
        if (v47) {
          v58 = @"YES";
        }
        else {
          v58 = @"NO";
        }
        if (v22) {
          __int16 v57 = @"YES";
        }
        *(_DWORD *)__int128 buf = 138543618;
        *(void *)v92 = v58;
        *(_WORD *)&v92[8] = 2114;
        v93 = v57;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Some device does not support IPsec - EnablingOTRForDefaultPairedDevice {localDeviceSupportIPsec: %{public}@, r emoteDeviceSupportIPsec: %{public}@}",  buf,  0x16u);
      }

      __int16 v59 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      [v59 enableOTRForDefaultPairedDevice];

      BOOL v43 = v76;
      -[IDSPairingManager _callPairedDeviceDidConnectBlocksForUniqueID:withError:]( self,  "_callPairedDeviceDidConnectBlocksForUniqueID:withError:",  v76,  0LL);
      uint64_t v37 = v87;
      __int16 v55 = (void *)v78;
      if (!v44) {
        goto LABEL_92;
      }
    }

    unsigned int v62 = [v55 isEqualToIgnoringCase:v37];
    unsigned int v63 = [v79 isEqualToIgnoringCase:v14];
    unsigned int v64 = [v84 isEqualToIgnoringCase:v80];
    unsigned __int8 v65 = [v83 isEqualToIgnoringCase:v86];
    if (v63 && v64 && (v65 & 1) != 0)
    {
      id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevice](self, "pairedDevice"));
      if (v62)
      {
        __int16 v55 = (void *)v78;
        if (v82 == v77)
        {
          if (v74 == a6 && v73 == __PAIR64__(v85, HIDWORD(v85))) {
            goto LABEL_85;
          }
          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)v92 = v56;
            _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "Notifying all IDS accounts protocol information is different: %@",  buf,  0xCu);
          }

          v89[0] = _NSConcreteStackBlock;
          v89[1] = 3221225472LL;
          v89[2] = sub_10017B054;
          v89[3] = &unk_1008FC0F8;
          id v56 = v56;
          v89[4] = v56;
          v67 = v89;
LABEL_84:
          -[IDSPairingManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v67);

LABEL_85:
          BOOL v43 = v76;
          if (a9 >= 3u && v75 != a9)
          {
            v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "This device now supports cloud delivery, updating flag to enable it when possbile",  buf,  2u);
            }

            v70 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
            [v70 setPendingCloudFlagOnDefaultPeer];

            BOOL v43 = v76;
          }

          -[IDSPairingManager _requestPairedDeviceInfoAfterDelay:](self, "_requestPairedDeviceInfoAfterDelay:", 0.0);
LABEL_91:

LABEL_92:
          uint64_t v15 = v80;
          goto LABEL_93;
        }

- (BOOL)updatePairedDeviceiCloudURIs:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[IDSPairingManager activePairedDeviceHasPairingType:](self, "activePairedDeviceHasPairingType:", 1LL))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevicePushToken](self, "pairedDevicePushToken"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceiCloudURIs](self, "pairedDeviceiCloudURIs"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager _activePairedDeviceCBUUID](self, "_activePairedDeviceCBUUID"));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceRepository](self, "pairedDeviceRepository"));
    unsigned int v13 = [v12 updatePairedDeviceWithCBUUID:v11 iCloudURIs:v6 pushToken:v7];

    if ([v8 isEqualToData:v7])
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
      unsigned __int8 v15 = [v10 isEqualToSet:v14];

      if (!v13) {
        goto LABEL_11;
      }
    }

    else
    {
      unsigned __int8 v15 = 0;
      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
    }

    if ((v15 & 1) == 0)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10017B27C;
      v18[3] = &unk_1008FC0F8;
      id v19 = (id)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDevice](self, "pairedDevice"));
      id v16 = v19;
      -[IDSPairingManager _notifyDelegatesWithBlock:](self, "_notifyDelegatesWithBlock:", v18);
    }

    goto LABEL_11;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_10069E8DC();
  }
  LOBYTE(v13) = 0;
LABEL_12:

  return v13;
}

- (void)refreshPairedDeviceEncryptionKeys
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Refreshing Paired Device Encryption Keys",  buf,  2u);
  }

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Suspending OTR sessions for protection classes A and C...",  v10,  2u);
  }

  -[IDSPairingManager _suspendOTRSessionsWithProtectionClass:](self, "_suspendOTRSessionsWithProtectionClass:", 1LL);
  -[IDSPairingManager _suspendOTRSessionsWithProtectionClass:](self, "_suspendOTRSessionsWithProtectionClass:", 0LL);
  unsigned int v5 = -[IDSPairingManager _purgeSecuredEncryptionKeysForAllPairedDevices]( self,  "_purgeSecuredEncryptionKeysForAllPairedDevices");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Purged all paired device encryption keys. Requesting paired device info...",  v9,  2u);
    }

    -[IDSPairingManager _requestPairedDeviceInfoAfterDelay:](self, "_requestPairedDeviceInfoAfterDelay:", 0.0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog regeneration](&OBJC_CLASS___IMRGLog, "regeneration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Requested paired device info. Refresh Complete!",  v8,  2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    sub_10069E940();
  }
}

+ (void)devicePairingProtocolVersion:(unsigned int *)a3 minCompatibilityVersion:(unsigned int *)a4 maxCompatibilityVersion:(unsigned int *)a5
{
  *a3 = 0;
  *a4 = -1;
  *a5 = -1;
  id v8 = (void *)qword_1009BEC30;
  if (qword_1009BEC30
    || (id v8 = (void *)IMWeakLinkClass(@"NRPairedDeviceRegistry", @"NanoRegistry"),
        (qword_1009BEC30 = (uint64_t)v8) != 0))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sharedInstance]);
    *a3 = [v9 pairingCompatibilityVersion];
    *a4 = [v9 minPairingCompatibilityVersion];
    *a5 = [v9 maxPairingCompatibilityVersion];
  }

  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pairingProtocolDebug](&OBJC_CLASS___IMRGLog, "pairingProtocolDebug"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = *a3;
    unsigned int v12 = *a4;
    unsigned int v13 = *a5;
    int v14 = 136315906;
    unsigned __int8 v15 = "+[IDSPairingManager devicePairingProtocolVersion:minCompatibilityVersion:maxCompatibilityVersion:]";
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = v12;
    __int16 v20 = 1024;
    unsigned int v21 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s reading version: %u, min/max: %u/%u",  (uint8_t *)&v14,  0x1Eu);
  }
}

- (BOOL)pairedDeviceSupportsSendLaterMessages
{
  return 0;
}

- (void)deliveryController:(id)a3 foundNearbyIPsecCapableDeviceWithUniqueID:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PairingManager found nearbyIPsec device",  buf,  2u);
  }

  if ([v5 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID])
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceUUIDString](self, "pairedDeviceUUIDString"));
      *(_DWORD *)__int128 buf = 138478083;
      id v23 = v5;
      __int16 v24 = 2113;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Replacing uniqueID with pairedDeviceUniqueID {uniqueID: %{private}@, pairedDeviceUUIDString: %{private}@}",  buf,  0x16u);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceUUIDString](self, "pairedDeviceUUIDString"));
    id v5 = (id)v9;
  }

  BOOL v10 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceUUIDString](self, "pairedDeviceUUIDString"));
  unsigned int v12 = [v11 isEqualToString:v5];

  if (v12)
  {
    if (-[IDSPairingManager shouldQuickSwitchAfterIPSecConnected](self, "shouldQuickSwitchAfterIPSecConnected"))
    {
      -[IDSPairingManager setShouldQuickSwitchAfterIPSecConnected:]( self,  "setShouldQuickSwitchAfterIPSecConnected:",  0LL);
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SupportIPSec status updated.  Should now QuickSwitch to using IPSec.",  buf,  2u);
      }

      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSQuickSwitchHelper sharedInstance](&OBJC_CLASS___IDSQuickSwitchHelper, "sharedInstance"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10017B90C;
      v18[3] = &unk_1008FC148;
      id v19 = v5;
      __int16 v20 = self;
      unsigned int v21 = v10;
      [v14 initiateQuickSwitchToDeviceWithCBUUID:v19 force:1 completionBlock:v18];
    }

    else
    {
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "ActivePairedDevice alread marked with supportIPsec -- Done",  buf,  2u);
      }

      -[IDSPairingManager _callPairedDeviceDidConnectBlocksForUniqueID:withError:]( self,  "_callPairedDeviceDidConnectBlocksForUniqueID:withError:",  v10,  0LL);
    }
  }

  else
  {
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPairingManager pairedDeviceUniqueID](self, "pairedDeviceUniqueID"));
      *(_DWORD *)__int128 buf = 138478083;
      id v23 = v16;
      __int16 v24 = 2113;
      id v25 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Device found IPsec nearby but is not active paired device -- Ignoring {pairedDeviceUniqueID: %{private}@, unique ID: %{private}@}",  buf,  0x16u);
    }
  }
}

- (id)_nrDeviceIdentifierWithCBUUID:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10069E96C();
    }
    id v4 = 0LL;
    goto LABEL_8;
  }

  id v4 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]( &OBJC_CLASS___NRDeviceIdentifier,  "newDeviceIdentifierWithBluetoothUUID:",  v3);
  if (!v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10069E99C((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_8:
  }

  return v4;
}

- (NRDeviceManager)nrDeviceManager
{
  return self->_nrDeviceManager;
}

- (IDSPairedDeviceRepository)pairedDeviceRepository
{
  return self->_pairedDeviceRepository;
}

- (NSMutableArray)registeredPairedDeviceDidConnectBlockPairs
{
  return self->_registeredPairedDeviceDidConnectBlockPairs;
}

- (BOOL)shouldQuickSwitchAfterIPSecConnected
{
  return self->_shouldQuickSwitchAfterIPSecConnected;
}

- (void)setShouldQuickSwitchAfterIPSecConnected:(BOOL)a3
{
  self->_shouldQuickSwitchAfterIPSecConnected = a3;
}

- (void).cxx_destruct
{
}

@end