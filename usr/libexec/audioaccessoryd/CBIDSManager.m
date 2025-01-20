@interface CBIDSManager
+ (id)sharedInstance;
- (BOOL)allDevicesStarSky;
- (BOOL)isLegacyDevice:(id)a3;
- (BOOL)isReady;
- (BOOL)processingIDSPush;
- (BOOL)shouldUpgradeToManatee;
- (BOOL)supportsVirtualAddress;
- (BOOL)validateKeys:(id)a3 requestedTypes:(id)a4 from:(id)a5;
- (BOOL)validateMessage:(id)a3 from:(id)a4;
- (BTStateWatcher)buddyStateWatcher;
- (BTStateWatcher)firstUnlockStateWatcher;
- (CBIDSManager)init;
- (IDSAccount)account;
- (IDSService)service;
- (NSArray)associatedDevices;
- (NSArray)requestedKeyTypes;
- (NSMutableArray)cloudDevices;
- (NSMutableDictionary)CPAddressMapping;
- (NSMutableDictionary)messageIdentifiersWaitingForAck;
- (NSMutableSet)unpairedIDSCloudIdentifiers;
- (NSString)cloudIdentifier;
- (NSString)localDeviceName;
- (NSString)localDeviceRandomAddress;
- (NSString)publicAddress;
- (OS_dispatch_queue)cloudPairingQueue;
- (id)_fetchArrayOfCloudDevicesForPeripheral:(id)a3;
- (id)_fetchCloudPairingIdentifierForPeripheral:(id)a3;
- (id)_statedumpAndRecordDailyMetric;
- (id)deviceForIDSDevice:(id)a3 createNew:(BOOL)a4;
- (id)filteredDevicesForIDSDevices:(id)a3;
- (id)publicAddressForIDSDevice:(id)a3;
- (id)statedumpAndRecordDailyMetric;
- (int64_t)totalCloudDeviceCount;
- (unint64_t)keyLength;
- (unint64_t)roleWithDevice:(id)a3;
- (void)_sendRePairRequest:(id)a3 forBundleID:(id)a4;
- (void)checkFirstUnlockForIDS;
- (void)cloudPairingCompletedWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6;
- (void)connectionUpdatedForBluetoothIdentifier:(id)a3 connected:(BOOL)a4;
- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 withCompletion:(id)a4;
- (void)fetchIDSDevicesWithCompletion:(id)a3;
- (void)fetchPublicAddressWithCompletion:(id)a3;
- (void)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5 withCompletion:(id)a6;
- (void)handleCloudPairingMessage:(id)a3 from:(id)a4;
- (void)handleInitiatorPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5;
- (void)handleKeyDistribution:(id)a3 from:(id)a4;
- (void)handlePairingFailure:(id)a3 from:(id)a4;
- (void)handlePairingRequest:(id)a3 from:(id)a4;
- (void)handlePairingResponse:(id)a3 from:(id)a4;
- (void)handleRepairRequest:(id)a3 from:(id)a4;
- (void)handleResponderPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5;
- (void)handleSecurityRequest:(id)a3 from:(id)a4;
- (void)handleUnpairCommand:(id)a3 from:(id)a4;
- (void)initializeIDS;
- (void)initiatePairing:(id)a3;
- (void)initiatePairingAgainIfNoAckReceived:(id)a3 attempt:(unint64_t)a4;
- (void)retryIDSSetup;
- (void)sendCloudPairingResponseMessage:(id)a3 toDevice:(id)a4 version:(id)a5;
- (void)sendErrorMessageToDevice:(id)a3 reason:(id)a4;
- (void)sendInitialPairingIDSMessage:(id)a3 forDevice:(id)a4 withRole:(unint64_t)a5;
- (void)sendRePairCloudPairingMessage:(id)a3 toDevice:(id)a4 bundleID:(id)a5;
- (void)sendRePairRequest:(id)a3 forBundleID:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setAccount:(id)a3;
- (void)setAssociatedDevices:(id)a3;
- (void)setBuddyStateWatcher:(id)a3;
- (void)setCPAddressMapping:(id)a3;
- (void)setCloudDevices:(id)a3;
- (void)setCloudIdentifier:(id)a3;
- (void)setCloudPairingQueue:(id)a3;
- (void)setFirstUnlockStateWatcher:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLocalDeviceName:(id)a3;
- (void)setLocalDeviceRandomAddress:(id)a3;
- (void)setMessageIdentifiersWaitingForAck:(id)a3;
- (void)setProcessingIDSPush:(BOOL)a3;
- (void)setPublicAddress:(id)a3;
- (void)setRequestedKeyTypes:(id)a3;
- (void)setService:(id)a3;
- (void)setSupportsVirtualAddress:(BOOL)a3;
- (void)setTotalCloudDeviceCount:(int64_t)a3;
- (void)setUnpairedIDSCloudIdentifiers:(id)a3;
- (void)storePublicAddressMapping:(id)a3 message:(id)a4;
- (void)updateActiveAccount:(id)a3;
- (void)updateCloudPairings:(id)a3 newDevices:(id)a4;
- (void)validateCloudPairing:(id)a3;
- (void)xpcUpdateCloudPairings:(id)a3;
@end

@implementation CBIDSManager

+ (id)sharedInstance
{
  if (qword_100237228 != -1) {
    dispatch_once(&qword_100237228, &stru_100207C90);
  }
  return (id)qword_100237220;
}

- (CBIDSManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CBIDSManager;
  v2 = -[CBIDSManager init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.bluetooth.cloudpairing", v4);
    -[CBIDSManager setCloudPairingQueue:](v2, "setCloudPairingQueue:", v5);

    LODWORD(v5) = +[BTSystemConfiguration isBuddyComplete](&OBJC_CLASS___BTSystemConfiguration, "isBuddyComplete");
    os_log_t v6 = sub_100060178("CloudPairing");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v5)
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "IDS BYSetupAssistantNeedsToRun : false ",  (uint8_t *)buf,  2u);
      }

      -[CBIDSManager checkFirstUnlockForIDS](v2, "checkFirstUnlockForIDS");
    }

    else
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "IDS BYSetupAssistantNeedsToRun : true ",  (uint8_t *)buf,  2u);
      }

      objc_initWeak(buf, v2);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100050310;
      v11[3] = &unk_100207CB8;
      objc_copyWeak(&v12, buf);
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[BTStateWatcher monitorBuddyStateWithAction:]( &OBJC_CLASS___BTStateWatcher,  "monitorBuddyStateWithAction:",  v11));
      -[CBIDSManager setBuddyStateWatcher:](v2, "setBuddyStateWatcher:", v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
  }

  return v2;
}

- (void)checkFirstUnlockForIDS
{
  os_log_t v3 = sub_100060178("CloudPairing");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = +[BTSystemConfiguration isFirstUnlocked](&OBJC_CLASS___BTSystemConfiguration, "isFirstUnlocked");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "First Unlock Check: %i", (uint8_t *)&buf, 8u);
  }

  if (+[BTSystemConfiguration isFirstUnlocked](&OBJC_CLASS___BTSystemConfiguration, "isFirstUnlocked"))
  {
    dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000505B4;
    block[3] = &unk_100206058;
    block[4] = self;
    dispatch_async(v5, block);
  }

  else
  {
    objc_initWeak(&buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000505BC;
    v7[3] = &unk_100207CE0;
    v7[4] = self;
    objc_copyWeak(&v8, &buf);
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[BTStateWatcher monitorFirstUnlockWithAction:]( &OBJC_CLASS___BTStateWatcher,  "monitorFirstUnlockWithAction:",  v7));
    -[CBIDSManager setFirstUnlockStateWatcher:](self, "setFirstUnlockStateWatcher:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&buf);
  }

- (void)initializeIDS
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));

  if (v3)
  {
    os_log_t v4 = sub_100060178("CloudPairing");
    dispatch_queue_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Already initialized IDS", buf, 2u);
    }
  }

  else
  {
    -[CBIDSManager setLocalDeviceRandomAddress:](self, "setLocalDeviceRandomAddress:", 0LL);
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[CBIDSManager setUnpairedIDSCloudIdentifiers:](self, "setUnpairedIDSCloudIdentifiers:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBPreferencesManager deviceName](&OBJC_CLASS___CBPreferencesManager, "deviceName"));
    -[CBIDSManager setLocalDeviceName:](self, "setLocalDeviceName:", v7);

    id v8 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"EncryptionKeys",  @"IdentityKeys",  0LL);
    -[CBIDSManager setRequestedKeyTypes:](self, "setRequestedKeyTypes:", v8);

    v9 = (void *)IDSCopyLocalDeviceUniqueID();
    -[CBIDSManager setCloudIdentifier:](self, "setCloudIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[CBIDSManager setMessageIdentifiersWaitingForAck:](self, "setMessageIdentifiersWaitingForAck:", v10);

    os_log_t v11 = sub_100060178("CloudPairing");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
      *(_DWORD *)id buf = 138412802;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = &off_100219110;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "initializeIDS (%@) checkIn version: %@, local name: %@",  buf,  0x20u);
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
    if (v15
      && (v16 = (void *)v15,
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName")),
          v17,
          v16,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      v24[0] = @"kCheckInVersion";
      v24[1] = @"kIDSLocalDeviceUniqueID";
      v25[0] = &off_100219110;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
      v25[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100050A54;
      v23[3] = &unk_100207D08;
      v23[4] = self;
      [v18 sendCloudKitMsg:@"checkIn" args:v20 withReply:v23];
    }

    else
    {
      os_log_t v21 = sub_100060178("CloudPairing");
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10018DCB4();
      }

      -[CBIDSManager retryIDSSetup](self, "retryIDSSetup");
    }
  }

- (void)retryIDSSetup
{
  dispatch_time_t v3 = dispatch_time(0LL, 30000000000LL);
  os_log_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000511E0;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)validateCloudPairing:(id)a3
{
  id v4 = a3;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v5));

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  v57 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  id v6 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v62;
    uint64_t v55 = *(void *)v62;
    id v51 = v4;
    do
    {
      v9 = 0LL;
      id v54 = v7;
      do
      {
        if (*(void *)v62 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v9);
        os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nsuuid]);

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 nsuuid]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
          id v16 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:v15]);

          if ([v16 length]
            && (v17 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]),
                v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]),
                unsigned int v19 = [v16 isEqualToString:v18],
                v18,
                v17,
                v19))
          {
            os_log_t v20 = sub_100060178("CloudPairing");
            os_log_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
              v23 = (void *)objc_claimAutoreleasedReturnValue([v22 nsuuid]);
              *(_DWORD *)id buf = 138412546;
              v69 = v23;
              __int16 v70 = 2112;
              id v71 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ is already cloud paired with IDS Device: %@",  buf,  0x16u);
            }

            [v52 addObject:v16];
          }

          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v24 nsuuid]);
            v26 = (void *)objc_claimAutoreleasedReturnValue( -[CBIDSManager _fetchArrayOfCloudDevicesForPeripheral:]( v57,  "_fetchArrayOfCloudDevicesForPeripheral:",  v25));

            if ([v16 length] && (unint64_t)objc_msgSend(v26, "count") >= 2)
            {
              v58[0] = _NSConcreteStackBlock;
              v58[1] = 3221225472LL;
              v58[2] = sub_1000518D8;
              v58[3] = &unk_100207D30;
              v58[4] = v10;
              id v16 = v16;
              id v59 = v16;
              id v60 = v53;
              [v26 enumerateObjectsUsingBlock:v58];
            }

            else
            {
              __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
              v31 = (void *)objc_claimAutoreleasedReturnValue([v30 nsuuid]);
              v32 = (void *)objc_claimAutoreleasedReturnValue( -[CBIDSManager _fetchCloudPairingIdentifierForPeripheral:]( v57,  "_fetchCloudPairingIdentifierForPeripheral:",  v31));

              if (v32)
              {
                os_log_t v33 = sub_100060178("CloudPairing");
                v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 nsuuid]);
                  v37 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
                  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 uniqueID]);
                  *(_DWORD *)id buf = 138412546;
                  v69 = v36;
                  __int16 v70 = 2112;
                  id v71 = v38;
                  _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Removing stale LE Cloud Paired Device %@ is already cloud paired with IDS Device: %@",  buf,  0x16u);
                }

                v39 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
                v66 = @"kCloudDeviceID";
                v40 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
                v41 = (void *)objc_claimAutoreleasedReturnValue([v40 nsuuid]);
                v42 = (void *)objc_claimAutoreleasedReturnValue([v41 UUIDString]);
                v67 = v42;
                v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
                [v39 sendCloudKitMsg:@"RemoveStaleLEPairedDevice" args:v43];

                v44 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
                [v44 setNSUUID:0];

                [v53 removeObject:v10];
                v45 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
                v46 = (void *)objc_claimAutoreleasedReturnValue([v45 uniqueID]);
                v65 = v46;
                v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v65,  1LL));
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
                v49 = (void *)objc_claimAutoreleasedReturnValue([v48 bundleIdentifier]);
                -[CBIDSManager sendRePairRequest:forBundleID:](v57, "sendRePairRequest:forBundleID:", v47, v49);

                id v4 = v51;
                uint64_t v8 = v55;
              }

              id v7 = v54;
            }
          }
        }

        else
        {
          os_log_t v27 = sub_100060178("CloudPairing");
          id v16 = (id)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDevice]);
            v29 = (void *)objc_claimAutoreleasedReturnValue([v28 uniqueID]);
            *(_DWORD *)id buf = 138412290;
            v69 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "%@ is not cloud paired with IDS Device",  buf,  0xCu);

            uint64_t v8 = v55;
          }
        }

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
    }

    while (v7);
  }

  id v50 = -[CBIDSManager _statedumpAndRecordDailyMetric](v57, "_statedumpAndRecordDailyMetric");
  -[CBIDSManager updateCloudPairings:newDevices:](v57, "updateCloudPairings:newDevices:", v52, v53);
}

- (void)fetchPublicAddressWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));

  os_log_t v6 = sub_100060178("CloudPairing");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
      *(_DWORD *)id buf = 138412290;
      objc_super v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "have public address: %@", buf, 0xCu);
    }

    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    if (v8)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetch public address", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100051C20;
    v11[3] = &unk_100207D58;
    void v11[4] = self;
    id v12 = v4;
    [v10 sendCloudKitMsg:@"FetchPublicAddress" args:&__NSDictionary0__struct withReply:v11];
  }
}

- (void)xpcUpdateCloudPairings:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100051F28;
  v7[3] = &unk_100206358;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)connectionUpdatedForBluetoothIdentifier:(id)a3 connected:(BOOL)a4
{
  BOOL v19 = a4;
  id v5 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        os_log_t v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDevice]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 nsuuid]);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
        unsigned int v15 = [v14 isEqualToString:v5];

        if (v15)
        {
          os_log_t v16 = sub_100060178("CloudPairing");
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = "no";
            if (v19) {
              v18 = "yes";
            }
            *(_DWORD *)id buf = 138412546;
            v25 = v11;
            __int16 v26 = 2080;
            os_log_t v27 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Connection updated for device: %@, connected: %s",  buf,  0x16u);
          }

          [v11 setIsConnected:v19];
          goto LABEL_15;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)updateCloudPairings:(id)a3 newDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100060178("CloudPairing");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    *(void *)v151 = v6;
    *(_WORD *)&v151[8] = 2112;
    *(void *)v152 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "MUC - updateCloudPairings, ids: %@, devices: %@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
  if (v10)
  {
    __int128 v144 = 0u;
    __int128 v145 = 0u;
    __int128 v142 = 0u;
    __int128 v143 = 0u;
    id v116 = v7;
    id obj = v7;
    id v119 = v6;
    v129 = self;
    id v125 = [obj countByEnumeratingWithState:&v142 objects:v153 count:16];
    if (!v125) {
      goto LABEL_38;
    }
    uint64_t v124 = *(void *)v143;
    while (1)
    {
      for (i = 0LL; i != v125; i = (char *)i + 1)
      {
        if (*(void *)v143 != v124) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v142 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
        id v15 = [v6 indexOfObject:v14];

        os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
        v141[0] = _NSConcreteStackBlock;
        v141[1] = 3221225472LL;
        v141[2] = sub_100053164;
        v141[3] = &unk_100207D80;
        v141[4] = v12;
        v141[5] = self;
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 keysOfEntriesPassingTest:v141]);

        if ([v17 count]) {
          BOOL v18 = (unint64_t)[v17 count] < 3;
        }
        else {
          BOOL v18 = 0;
        }
        BOOL v126 = v18;
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_20:
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
          unsigned int v27 = [v26 canSend];

          if (v27)
          {
            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
            v29 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 uniqueID]);
            [v28 addObject:v30];

            os_log_t v31 = sub_100060178("CloudPairing");
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v33 = v15 == (id)0x7FFFFFFFFFFFFFFFLL;
              if ([v17 count]) {
                v34 = "again ";
              }
              else {
                v34 = "";
              }
              v35 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
              v36 = (void *)objc_claimAutoreleasedReturnValue([v35 nsuuid]);
              id v37 = objc_claimAutoreleasedReturnValue([v12 description]);
              id v38 = [v37 UTF8String];
              *(_DWORD *)id buf = 136315907;
              *(void *)v151 = v34;
              *(_WORD *)&v151[8] = 1024;
              *(_DWORD *)v152 = v33;
              *(_WORD *)&v152[4] = 2112;
              *(void *)&v152[6] = v36;
              *(_WORD *)&v152[14] = 2081;
              *(void *)&v152[16] = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Initiating pairing %swith unpaired IDS device [New: %i] (BT UUID: %@) %{private}s",  buf,  0x26u);
            }

            self = v129;
            if (v126) {
              -[CBIDSManager initiatePairingAgainIfNoAckReceived:attempt:]( v129,  "initiatePairingAgainIfNoAckReceived:attempt:",  v12,  [v17 count]);
            }
            else {
              -[CBIDSManager initiatePairing:](v129, "initiatePairing:", v12);
            }
          }

          else
          {
            os_log_t v39 = sub_100060178("CloudPairing");
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v41 nsuuid]);
              id v43 = objc_claimAutoreleasedReturnValue([v12 description]);
              id v44 = [v43 UTF8String];
              *(_DWORD *)id buf = 138412547;
              *(void *)v151 = v42;
              *(_WORD *)&v151[8] = 2081;
              *(void *)v152 = v44;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "IDS not ready cannot initiate pairing with IDS device (BT UUID: %@) %{private}s",  buf,  0x16u);

              self = v129;
            }
          }

          goto LABEL_36;
        }

        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 nsuuid]);
        if (v20)
        {
          v123 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
          v122 = (void *)objc_claimAutoreleasedReturnValue([v123 uniqueID]);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddressForIDSDevice:](self, "publicAddressForIDSDevice:"));
          if (v21)
          {
            LOBYTE(v22) = 0;
            goto LABEL_19;
          }

          id v121 = 0LL;
        }

        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueID]);
        unsigned int v22 = [v23 containsObject:v25] ^ 1 | v18;

        if (v20)
        {
          id v6 = v119;
          self = v129;
          __int128 v21 = v121;
LABEL_19:
          id v121 = v21;

          if ((v22 & 1) != 0) {
            goto LABEL_20;
          }
          goto LABEL_33;
        }

        id v6 = v119;
        self = v129;
        if (v22) {
          goto LABEL_20;
        }
LABEL_33:
        os_log_t v45 = sub_100060178("CloudPairing");
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          id v127 = (id)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
          v118 = (void *)objc_claimAutoreleasedReturnValue([v127 uniqueID]);
          BOOL v47 = [v6 indexOfObject:v118] != (id)0x7FFFFFFFFFFFFFFFLL;
          v117 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
          v48 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
          v49 = (void *)objc_claimAutoreleasedReturnValue([v48 uniqueID]);
          unsigned int v50 = [v117 containsObject:v49];
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDevice]);
          v52 = (void *)objc_claimAutoreleasedReturnValue([v51 nsuuid]);
          id v53 = objc_claimAutoreleasedReturnValue([v12 description]);
          id v54 = [v53 UTF8String];
          *(_DWORD *)id buf = 67109891;
          *(_DWORD *)v151 = v47;
          *(_WORD *)&v151[4] = 1024;
          *(_DWORD *)&v151[6] = v50;
          *(_WORD *)v152 = 2112;
          *(void *)&v152[2] = v52;
          *(_WORD *)&v152[10] = 2081;
          *(void *)&v152[12] = v54;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "Device paired or deffered pairing for IDS device [Old: %i - Cached: %i] (BT UUID: %@) %{private}s",  buf,  0x22u);

          id v6 = v119;
          self = v129;
        }

LABEL_36:
      }

      id v125 = [obj countByEnumeratingWithState:&v142 objects:v153 count:16];
      if (!v125)
      {
LABEL_38:

        if ([v6 count])
        {
          unint64_t v55 = 0LL;
          do
          {
            v138[0] = _NSConcreteStackBlock;
            v138[1] = 3221225472LL;
            v138[2] = sub_10005327C;
            v138[3] = &unk_100207DA8;
            id v56 = v6;
            id v139 = v56;
            unint64_t v140 = v55;
            if ([obj indexOfObjectPassingTest:v138] == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              __int128 v136 = 0u;
              __int128 v137 = 0u;
              __int128 v134 = 0u;
              __int128 v135 = 0u;
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](v129, "associatedDevices"));
              id v58 = [v57 countByEnumeratingWithState:&v134 objects:v149 count:16];
              id v59 = &IDSSendMessageOptionQueueOneIdentifierKey_ptr;
              if (v58)
              {
                id v60 = v58;
                uint64_t v61 = *(void *)v135;
                while (2)
                {
                  for (j = 0LL; j != v60; j = (char *)j + 1)
                  {
                    if (*(void *)v135 != v61) {
                      objc_enumerationMutation(v57);
                    }
                    __int128 v63 = *(void **)(*((void *)&v134 + 1) + 8LL * (void)j);
                    uint64_t v64 = objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                    if (v64)
                    {
                      v65 = (void *)v64;
                      v66 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                      uint64_t v67 = objc_opt_class(v59[139]);
                      if ((objc_opt_isKindOfClass(v66, v67) & 1) != 0
                        && ([v63 isConnected] & 1) != 0)
                      {
                        v68 = (void *)objc_claimAutoreleasedReturnValue([v63 idsDevice]);
                        id v69 = [v68 deviceType];

                        BOOL v70 = v69 == (id)5;
                        id v59 = &IDSSendMessageOptionQueueOneIdentifierKey_ptr;
                        if (v70)
                        {
                          os_log_t v103 = sub_100060178("CloudPairing");
                          v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
                          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                          {
                            v106 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                            *(_DWORD *)id buf = 138412290;
                            *(void *)v151 = v106;
                            _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "Skip telling btd to remove ATV that maybe in setup: %@",  buf,  0xCu);
                          }

                          id v6 = v119;
                          goto LABEL_78;
                        }
                      }

                      else
                      {
                      }
                    }
                  }

                  id v60 = [v57 countByEnumeratingWithState:&v134 objects:v149 count:16];
                  if (v60) {
                    continue;
                  }
                  break;
                }
              }

              os_log_t v71 = sub_100060178("CloudPairing");
              v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                v73 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                *(_DWORD *)id buf = 138412290;
                *(void *)v151 = v73;
                _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "Unpairing IDS device %@ as it is no longer signed into our iCloud account",  buf,  0xCu);
              }

              __int128 v132 = 0u;
              __int128 v133 = 0u;
              __int128 v130 = 0u;
              __int128 v131 = 0u;
              id v128 = (id)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](v129, "associatedDevices"));
              id v74 = [v128 countByEnumeratingWithState:&v130 objects:v148 count:16];
              if (v74)
              {
                id v75 = v74;
                uint64_t v76 = *(void *)v131;
                do
                {
                  for (k = 0LL; k != v75; k = (char *)k + 1)
                  {
                    if (*(void *)v131 != v76) {
                      objc_enumerationMutation(v128);
                    }
                    v78 = *(void **)(*((void *)&v130 + 1) + 8LL * (void)k);
                    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 idsDevice]);
                    v80 = (void *)objc_claimAutoreleasedReturnValue([v79 uniqueID]);
                    v81 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                    unsigned int v82 = [v80 isEqualToIgnoringCase:v81];

                    if (v82)
                    {
                      [v78 setState:0];
                      v83 = (void *)objc_claimAutoreleasedReturnValue([v78 idsDevice]);
                      v84 = (void *)objc_claimAutoreleasedReturnValue([v83 uniqueID]);
                      v85 = (void *)objc_claimAutoreleasedReturnValue( -[CBIDSManager publicAddressForIDSDevice:]( v129,  "publicAddressForIDSDevice:",  v84));

                      if (v85)
                      {
                        os_log_t v86 = sub_100060178("CloudPairing");
                        v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
                        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                        {
                          v88 = (void *)objc_claimAutoreleasedReturnValue([v78 idsDevice]);
                          v89 = (void *)objc_claimAutoreleasedReturnValue([v88 uniqueID]);
                          *(_DWORD *)id buf = 138412546;
                          *(void *)v151 = v85;
                          *(_WORD *)&v151[8] = 2112;
                          *(void *)v152 = v89;
                          _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "Removing address %@ for IDS device %@ as it is no longer signed into our iCloud account",  buf,  0x16u);
                        }

                        v90 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](v129, "CPAddressMapping"));
                        v91 = (void *)objc_claimAutoreleasedReturnValue([v78 idsDevice]);
                        v92 = (void *)objc_claimAutoreleasedReturnValue([v91 uniqueID]);
                        [v90 removeObjectForKey:v92];

                        v93 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](v129, "CPAddressMapping"));
                        +[CBPreferencesManager setuserPreference:value:sync:]( &OBJC_CLASS___CBPreferencesManager,  "setuserPreference:value:sync:",  @"AddressMapping",  v93,  1LL);
                      }
                    }
                  }

                  id v75 = [v128 countByEnumeratingWithState:&v130 objects:v148 count:16];
                }

                while (v75);
              }

              uint64_t v94 = objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
              id v6 = v119;
              if (v94)
              {
                v95 = (void *)v94;
                v96 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                uint64_t v97 = objc_opt_class(&OBJC_CLASS___NSString);
                char isKindOfClass = objc_opt_isKindOfClass(v96, v97);

                if ((isKindOfClass & 1) != 0)
                {
                  os_log_t v99 = sub_100060178("CloudPairing");
                  v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                  {
                    v101 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                    *(_DWORD *)id buf = 138412290;
                    *(void *)v151 = v101;
                    _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "Tell btd to remove this device: %@",  buf,  0xCu);
                  }

                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
                  v146 = @"kCloudDeviceUniqueID";
                  v104 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:v55]);
                  v147 = v104;
                  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v147,  &v146,  1LL));
                  [v57 sendCloudKitMsg:@"RemoveCloudPairedDevice" args:v102];

LABEL_78:
                }
              }
            }

            ++v55;
          }

          while (v55 < (unint64_t)[v56 count]);
        }

        id v107 = [v6 count];
        id v7 = v116;
        if (v107 != [obj count])
        {
          uint64_t v108 = objc_claimAutoreleasedReturnValue(-[CBIDSManager account](v129, "account"));
          if (v108)
          {
            v109 = (void *)v108;
            v110 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](v129, "account"));
            unsigned int v111 = [v110 isActive];

            if (v111)
            {
              v112 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CBIDSManager _statedumpAndRecordDailyMetric]( v129,  "_statedumpAndRecordDailyMetric"));
              if (IsAppleInternalBuild(v112))
              {
                os_log_t v113 = sub_100060178("CloudPairing");
                v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)id buf = 138412290;
                  *(void *)v151 = v112;
                  _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                }
              }

              goto LABEL_89;
            }
          }
        }

        goto LABEL_90;
      }
    }
  }

  os_log_t v115 = sub_100060178("CloudPairing");
  v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
    sub_10018DEB8();
  }
LABEL_89:

LABEL_90:
}

- (void)updateActiveAccount:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100060178("CloudPairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_claimAutoreleasedReturnValue([v4 description]);
    *(_DWORD *)id buf = 136315394;
    id v51 = [v7 UTF8String];
    __int16 v52 = 2048;
    id v53 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "MUC - updateActiveAccount - %s, count %lu",  buf,  0x16u);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v9)
  {
    id v10 = v9;
    os_log_t v11 = 0LL;
    uint64_t v12 = *(void *)v42;
    v40 = &v46;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_super v14 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        if (objc_msgSend(v14, "isActive", v40))
        {
          if ([v14 canSend])
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 loginID]);

            if (v15)
            {
              os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));

              if (v14 == v16)
              {
                os_log_t v21 = sub_100060178("CloudPairing");
                unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
                  id v24 = objc_claimAutoreleasedReturnValue([v23 loginID]);
                  id v25 = [v24 UTF8String];
                  *(_DWORD *)id buf = 136380675;
                  id v51 = v25;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Local device is still associated with iCloud account \"%{private}s\"",  buf,  0xCu);
                }

                __int16 v26 = (os_log_s *)v8;
                goto LABEL_32;
              }

              v17 = v11;
              os_log_t v11 = v14;
            }

            else
            {
              os_log_t v20 = sub_100060178("CloudPairing");
              v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                sub_10018DEE4((uint64_t)v45, (uint64_t)v14);
              }
            }
          }

          else
          {
            os_log_t v19 = sub_100060178("CloudPairing");
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10018DF44((uint64_t)v47, (uint64_t)v14);
            }
          }
        }

        else
        {
          os_log_t v18 = sub_100060178("CloudPairing");
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10018DFA4((uint64_t)v48, (uint64_t)v14);
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
    os_log_t v11 = 0LL;
  }

  -[CBIDSManager setAccount:](self, "setAccount:", v11);
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));

  os_log_t v28 = sub_100060178("CloudPairing");
  __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  BOOL v29 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v27)
  {
    if (v29)
    {
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
      id v31 = objc_claimAutoreleasedReturnValue([v30 loginID]);
      id v32 = [v31 UTF8String];
      id v33 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
      id v34 = [v33 UTF8String];
      *(_DWORD *)id buf = 136380931;
      id v51 = v32;
      __int16 v52 = 2080;
      id v53 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "MUC - Local device is now associated with iCloud account %{private}s and identifier %s",  buf,  0x16u);
    }
  }

  else
  {
    if (v29)
    {
      id v35 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
      id v36 = [v35 UTF8String];
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
      *(_DWORD *)id buf = 136315394;
      id v51 = v36;
      __int16 v52 = 2112;
      id v53 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "MUC - Local device %s is not associated with any iCloud accounts with RSA %@",  buf,  0x16u);
    }

    -[CBIDSManager setTotalCloudDeviceCount:](self, "setTotalCloudDeviceCount:", 0LL);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
    [v38 removeAllObjects];

    os_log_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    [v39 removeAllObjects];

    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    -[os_log_s postNotificationName:object:userInfo:]( v26,  "postNotificationName:object:userInfo:",  @"BTTotalIDSDeviceCountChanged",  0LL,  &off_100218DC8);
  }

- (unint64_t)keyLength
{
  return 16LL;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 iCloudAccount]);
  id v8 = [v7 registrationStatus];

  os_log_t v9 = sub_100060178("CloudPairing");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_claimAutoreleasedReturnValue([v6 description]);
    id v12 = [v11 UTF8String];
    id v13 = [v6 count];
    uint64_t v14 = _IDSStringFromIDSRegistrationStatus(v8);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = 136315906;
    id v17 = v12;
    __int16 v18 = 2048;
    id v19 = v13;
    __int16 v20 = 1024;
    int v21 = (int)v8;
    __int16 v22 = 2112;
    __int128 v23 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "MUC - Active service accounts changed - %s, accounts %lu, R: %d, %@",  (uint8_t *)&v16,  0x26u);
  }

  -[CBIDSManager updateActiveAccount:](self, "updateActiveAccount:", v6);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudAccount]);
  id v9 = [v8 registrationStatus];

  os_log_t v10 = sub_100060178("CloudPairing");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = _IDSStringFromIDSRegistrationStatus(v9);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)id buf = 134218498;
    v49 = (void *)(int)v9;
    __int16 v50 = 2112;
    id v51 = v13;
    __int16 v52 = 2112;
    id v53 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MUC - devicesChanged, R: %ld, %@ - %@",  buf,  0x20u);
  }

  if (-[CBIDSManager totalCloudDeviceCount](self, "totalCloudDeviceCount") >= 1
    && ![v7 count]
    && ((int)v9 > 1 || (_DWORD)v9 == -1))
  {
    os_log_t v39 = sub_100060178("CloudPairing");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10018E004(self, (uint64_t)v9, v24);
    }
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));

    if (v14
      || (id v15 = (void *)IDSCopyLocalDeviceUniqueID(),
          -[CBIDSManager setCloudIdentifier:](self, "setCloudIdentifier:", v15),
          v15,
          int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier")),
          v16,
          v16))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
      if (!v17)
      {
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 accounts]);
        id v19 = [v18 count];

        if (!v19)
        {
LABEL_15:
          id v40 = v6;
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
          [v23 beginTransaction:@"IDSdevicesChanged"];

          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager filteredDevicesForIDSDevices:](self, "filteredDevicesForIDSDevices:", v7));
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
          id v27 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v42;
            do
            {
              __int16 v30 = 0LL;
              do
              {
                if (*(void *)v42 != v29) {
                  objc_enumerationMutation(v26);
                }
                id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 uniqueID]);
                [v25 addObject:v32];

                __int16 v30 = (char *)v30 + 1;
              }

              while (v28 != v30);
              id v28 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
            }

            while (v28);
          }

          -[CBIDSManager updateCloudPairings:newDevices:](self, "updateCloudPairings:newDevices:", v25, v24);
          -[CBIDSManager setAssociatedDevices:](self, "setAssociatedDevices:", v24);
          id v33 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
          [v33 endTransaction:@"IDSdevicesChanged"];

          -[CBIDSManager setTotalCloudDeviceCount:]( self,  "setTotalCloudDeviceCount:",  (char *)[v7 count] + 1);
          id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          if (v7) {
            id v35 = v7;
          }
          else {
            id v35 = &__NSArray0__struct;
          }
          v45[0] = @"IDSDevices";
          v45[1] = @"TotalIDSDevices";
          v46[0] = v35;
          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CBIDSManager totalCloudDeviceCount](self, "totalCloudDeviceCount")));
          v46[1] = v36;
          id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
          [v34 postNotificationName:@"BTTotalIDSDeviceCountChanged" object:0 userInfo:v37];

          id v6 = v40;
          goto LABEL_26;
        }

        os_log_t v20 = sub_100060178("CloudPairing");
        int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 accounts]);
          *(_DWORD *)id buf = 138412290;
          v49 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No account but got devicesChanged, update account status - %@",  buf,  0xCu);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 accounts]);
        -[CBIDSManager service:activeAccountsChanged:](self, "service:activeAccountsChanged:", v6, v17);
      }

      goto LABEL_15;
    }

    os_log_t v38 = sub_100060178("CloudPairing");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10018E0CC();
    }
  }

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  os_log_t v12 = sub_100060178("CloudPairing");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (v8)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = [v10 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Message %s sent successfully",  (uint8_t *)&v19,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10018E0F8();
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v10]);

    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s idsDevice](v14, "idsDevice"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v16, 0LL));

    [v17 setState:0];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    [v18 removeObjectForKey:v10];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v10 beginTransaction:@"IDSincomingMessage"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceForFromID:v9]);

  if (v12)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v12, 0LL));
    os_log_t v14 = sub_100060178("CloudPairing");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138478083;
        id v24 = v13;
        __int16 v25 = 2113;
        id v26 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received message from IDS device %{private}@: %{private}@",  (uint8_t *)&v23,  0x16u);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"MessageType"]);
      unsigned int v18 = [@"CloudPairing" isEqualToString:v17];

      if (v18)
      {
        -[CBIDSManager handleCloudPairingMessage:from:](self, "handleCloudPairingMessage:from:", v8, v13);
      }

      else
      {
        os_log_t v21 = sub_100060178("CloudPairing");
        __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10018E210(v8);
        }
      }

      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      -[os_log_s endTransaction:](v16, "endTransaction:", @"IDSincomingMessage");
    }

    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sub_10018E190(v8);
    }

    goto LABEL_15;
  }

  os_log_t v19 = sub_100060178("CloudPairing");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = (os_log_s *)[v9 UTF8String];
    int v16 = (os_log_s *) objc_claimAutoreleasedReturnValue([v8 description]);
    int v23 = 136315394;
    id v24 = v20;
    __int16 v25 = 2080;
    id v26 = -[os_log_s UTF8String](v16, "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve IDS device from destination %s - ignoring message %s",  (uint8_t *)&v23,  0x16u);
LABEL_15:
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceForFromID:v10]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
  os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v9]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 idsDevice]);
  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v15, 0LL));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 idsDevice]);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
  os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-RePairingRequest-%@",  v9,  v18));

  if ([v16 state] == (id)2)
  {
    [v16 setState:3];
    os_log_t v20 = sub_100060178("CloudPairing");
    os_log_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v9 UTF8String];
      id v23 = objc_claimAutoreleasedReturnValue([v12 uniqueID]);
      *(_DWORD *)id buf = 136315394;
      id v34 = v22;
      __int16 v35 = 2080;
      id v36 = [v23 UTF8String];
      id v24 = "Pairing Request Message %s has been delivered to: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
    }
  }

  else if ([v16 state] == (id)4)
  {
    [v16 setState:5];
    os_log_t v25 = sub_100060178("CloudPairing");
    os_log_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v9 UTF8String];
      id v23 = objc_claimAutoreleasedReturnValue([v12 uniqueID]);
      *(_DWORD *)id buf = 136315394;
      id v34 = v26;
      __int16 v35 = 2080;
      id v36 = [v23 UTF8String];
      id v24 = "Pairing Response Message %s has been delivered to: %s";
      goto LABEL_12;
    }
  }

  else
  {
    os_log_t v27 = sub_100060178("CloudPairing");
    os_log_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    BOOL v28 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v28)
      {
        id v29 = [v9 UTF8String];
        id v23 = objc_claimAutoreleasedReturnValue([v12 uniqueID]);
        *(_DWORD *)id buf = 136315394;
        id v34 = v29;
        __int16 v35 = 2080;
        id v36 = [v23 UTF8String];
        id v24 = "RePairing Message %s has been delivered to: %s";
        goto LABEL_12;
      }
    }

    else if (v28)
    {
      id v30 = [v9 UTF8String];
      id v23 = objc_claimAutoreleasedReturnValue([v12 uniqueID]);
      *(_DWORD *)id buf = 136315394;
      id v34 = v30;
      __int16 v35 = 2080;
      id v36 = [v23 UTF8String];
      id v24 = "Message %s has been delivered to: %s";
      goto LABEL_12;
    }
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
  [v31 removeObjectForKey:v9];

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
  [v32 removeObjectForKey:v19];
}

- (id)filteredDevicesForIDSDevices:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  os_log_t v6 = sub_100060178("CloudPairing");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 loginID]);
    id v10 = [v9 UTF8String];
    id v11 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
    *(_DWORD *)id buf = 136380931;
    id v30 = v10;
    __int16 v31 = 2080;
    *(void *)id v32 = [v11 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Local device is associated with iCloud account %{private}s and identifier %s",  buf,  0x16u);
  }

  os_log_t v12 = objc_autoreleasePoolPush();
  id v13 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  unsigned int v14 = [v13 isEqualToString:@"iPhone"];
  unsigned int v15 = [v13 isEqualToString:@"Watch"];
  os_log_t v16 = sub_100060178("CloudPairing");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412802;
    id v30 = v13;
    __int16 v31 = 1024;
    *(_DWORD *)id v32 = v14;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Local device is %@ isLocalDevicePhone=%d isLocalDeviceWatch=%d",  buf,  0x18u);
  }

  objc_autoreleasePoolPop(v12);
  os_log_t v18 = sub_100060178("CloudPairing");
  os_log_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    *(_DWORD *)id buf = 138412290;
    id v30 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "PublicAddressForIDSDevice: current mapping :%@",  buf,  0xCu);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  void v25[2] = sub_1000548D8;
  v25[3] = &unk_100207DD0;
  v25[4] = self;
  char v27 = v15;
  char v28 = v14;
  id v21 = v5;
  id v26 = v21;
  [v4 enumerateObjectsUsingBlock:v25];
  id v22 = v26;
  id v23 = v21;

  return v23;
}

- (id)deviceForIDSDevice:(id)a3 createNew:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));

  if (!v7) {
    goto LABEL_3;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100055348;
  v21[3] = &unk_100207DF8;
  id v22 = v6;
  id v9 = [v8 indexOfObjectPassingTest:v21];

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    os_log_t v16 = sub_100060178("CloudPairing");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_log_t v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "CloudPaired Device found, returning it",  v20,  2u);
    }

    os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:v9]);
  }

  else
  {
LABEL_3:
    os_log_t v10 = sub_100060178("CloudPairing");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_log_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CloudPaired Device not found", v20, 2u);
    }

    os_log_t v12 = sub_100060178("CloudPairing");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v14)
      {
        *(_WORD *)os_log_t v20 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "New CloudPaired Device created and returned",  v20,  2u);
      }

      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[CloudDevice deviceWithIDSDevice:](&OBJC_CLASS___CloudDevice, "deviceWithIDSDevice:", v6));
    }

    else
    {
      if (v14)
      {
        *(_WORD *)os_log_t v20 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "New CloudPaired Device will not be created",  v20,  2u);
      }

      unsigned int v15 = 0LL;
    }
  }

  return v15;
}

- (void)handleCloudPairingMessage:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Version 3"]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Version 3"]);
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MessageType"]);
    if ([@"InitiatorPairingKeys" isEqualToString:v10])
    {
      id v11 = @"Version 3";
LABEL_7:
      -[CBIDSManager handleInitiatorPairingKeys:from:forProtocolID:]( self,  "handleInitiatorPairingKeys:from:forProtocolID:",  v9,  v7,  v11);
LABEL_16:

      goto LABEL_17;
    }

    id v13 = @"Version 3";
    goto LABEL_15;
  }

  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Version 2"]);

  if (v12)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Version 2"]);
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MessageType"]);
    if ([@"InitiatorPairingKeys" isEqualToString:v10])
    {
      id v11 = @"Version 2";
      goto LABEL_7;
    }

    id v13 = @"Version 2";
LABEL_15:
    -[CBIDSManager handleResponderPairingKeys:from:forProtocolID:]( self,  "handleResponderPairingKeys:from:forProtocolID:",  v9,  v7,  v13);
    goto LABEL_16;
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Version 1"]);

  if (v14)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Version 1"]);
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MessageType"]);
    if ([@"SecurityRequest" isEqualToString:v10])
    {
      -[CBIDSManager handleSecurityRequest:from:](self, "handleSecurityRequest:from:", v9, v7);
    }

    else if ([@"RepairRequest" isEqualToString:v10])
    {
      -[CBIDSManager handleRepairRequest:from:](self, "handleRepairRequest:from:", v9, v7);
    }

    else if ([@"PairingRequest" isEqualToString:v10])
    {
      -[CBIDSManager handlePairingRequest:from:](self, "handlePairingRequest:from:", v9, v7);
    }

    else if ([@"PairingResponse" isEqualToString:v10])
    {
      -[CBIDSManager handlePairingResponse:from:](self, "handlePairingResponse:from:", v9, v7);
    }

    else if ([@"KeyDistribution" isEqualToString:v10])
    {
      -[CBIDSManager handleKeyDistribution:from:](self, "handleKeyDistribution:from:", v9, v7);
    }

    else if ([@"PairingFailure" isEqualToString:v10])
    {
      -[CBIDSManager handlePairingFailure:from:](self, "handlePairingFailure:from:", v9, v7);
    }

    else if ([@"UnpairCommand" isEqualToString:v10])
    {
      -[CBIDSManager handleUnpairCommand:from:](self, "handleUnpairCommand:from:", v9, v7);
    }

    else if ([@"CloudKitFetch" isEqualToString:v10])
    {
      dispatch_time_t v17 = dispatch_time(0LL, 2000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000557D4;
      block[3] = &unk_100206058;
      block[4] = self;
      dispatch_after(v17, &_dispatch_main_q, block);
    }

    else
    {
      unsigned int v18 = [@"ManateeKeysUpdated" isEqualToString:v10];
      os_log_t v19 = sub_100060178("CloudPairing");
      os_log_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IDS: Manatee keys updated", v22, 2u);
        }
      }

      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        sub_10018E30C();
      }
    }

    goto LABEL_16;
  }

  os_log_t v15 = sub_100060178("CloudPairing");
  os_log_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10018E290(v7);
  }

LABEL_17:
}

- (void)handleInitiatorPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5
{
  id v72 = a3;
  id v8 = a4;
  id v71 = a5;
  v73 = v8;
  LOBYTE(a5) = (id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v8) == (id)2;
  os_log_t v9 = sub_100060178("CloudPairing");
  os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if ((a5 & 1) != 0)
  {
    os_log_t v12 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_claimAutoreleasedReturnValue([v73 description]);
      LODWORD(buf) = 136380675;
      *(void *)((char *)&buf + 4) = [v13 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MUC - Received 'InitiatorPairingKeys' message from IDS device %{private}s",  (uint8_t *)&buf,  0xCu);

      os_log_t v12 = v11;
    }

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v73 idsDevice]);
    BOOL v70 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);

    os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( NSMutableString,  "stringWithCapacity:",  [v70 length]));
    id v16 = [v70 length];
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_100056434;
    v90[3] = &unk_100207E20;
    id v17 = v15;
    id v91 = v17;
    objc_msgSend(v70, "enumerateSubstringsInRange:options:usingBlock:", 0, v16, 258, v90);
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    id v19 = [v18 countByEnumeratingWithState:&v86 objects:v100 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v87;
      double v21 = 0.0;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v87 != v20) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v17]);

          if (v24)
          {
            os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v17]);
            [v25 floatValue];
            float v27 = v26;

            double v21 = v27;
          }
        }

        id v19 = [v18 countByEnumeratingWithState:&v86 objects:v100 count:16];
      }

      while (v19);

      if (v21 == 0.0)
      {
LABEL_22:
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        __int16 v35 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  mach_absolute_time());
        v68 = (void *)objc_claimAutoreleasedReturnValue(v35);
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v73 idsDevice]);
        id v69 = (void *)objc_claimAutoreleasedReturnValue([v36 uniqueID]);

        id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( NSMutableString,  "stringWithCapacity:",  [v69 length]));
        id v38 = [v69 length];
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472LL;
        v84[2] = sub_100056440;
        v84[3] = &unk_100207E20;
        id v39 = v37;
        id v85 = v39;
        objc_msgSend(v69, "enumerateSubstringsInRange:options:usingBlock:", 0, v38, 258, v84);
        [v18 setObject:v68 forKey:v39];
        id v40 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v40));

        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        id v42 = v41;
        id v43 = [v42 countByEnumeratingWithState:&v80 objects:v99 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v81;
          do
          {
            for (j = 0LL; j != v43; j = (char *)j + 1)
            {
              if (*(void *)v81 != v44) {
                objc_enumerationMutation(v42);
              }
              int v46 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)j);
              BOOL v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v39]);

              if (v47)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
                [v48 removeObject:v46];
              }
            }

            id v43 = [v42 countByEnumeratingWithState:&v80 objects:v99 count:16];
          }

          while (v43);
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
        [v49 addObject:v18];

        __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
        +[CBPreferencesManager setuserPreference:value:sync:]( &OBJC_CLASS___CBPreferencesManager,  "setuserPreference:value:sync:",  @"CloudDevice",  v50,  1LL);

        uint64_t v67 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"PublicKeys",  @"IdentityKeys",  0LL);
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v95 = 0x3032000000LL;
        v96 = sub_10005644C;
        uint64_t v97 = sub_10005645C;
        v93[0] = @"ResponderPairingKeys";
        v92[0] = @"MessageType";
        v92[1] = @"DeviceName";
        id v51 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
        v93[1] = v51;
        v92[2] = @"PublicAddress";
        __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
        v93[2] = v52;
        v92[3] = @"TimeStamp";
        v92[4] = @"EncryptionType";
        v93[3] = v68;
        v93[4] = @"ECDH";
        v92[5] = @"RequestedKeyLength";
        id v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CBIDSManager keyLength](self, "keyLength")));
        v93[5] = v53;
        v92[6] = @"RequestedKeyType";
        v93[6] = v67;
        id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v93,  v92,  7LL));
        id v98 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v54));

        id v55 = [v72 mutableCopy];
        id v56 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));

        if (v56)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
          [v55 setObject:v57 forKey:@"IDSLocalRandomAddress"];
        }

        if ([v71 isEqualToString:@"Version 3"])
        {
          id v58 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));

          if (!v58)
          {
            unint64_t v66 = -[CBIDSManager keyLength](self, "keyLength");
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472LL;
            v75[2] = sub_1000565E8;
            v75[3] = &unk_100207E70;
            v78[1] = &buf;
            v75[4] = self;
            id v76 = v73;
            id v77 = v72;
            v78[0] = v71;
            -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:]( self,  "generateKeyDictForTypes:keyLength:forAddress:withCompletion:",  v67,  v66,  0LL,  v75);
            __int128 v63 = &v76;
            uint64_t v64 = &v77;
            v65 = (id *)v78;
            goto LABEL_38;
          }

          unint64_t v59 = -[CBIDSManager keyLength](self, "keyLength");
          id v60 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472LL;
          v79[2] = sub_100056464;
          v79[3] = &unk_100207E48;
          uint64_t v61 = (id *)v79;
          v79[9] = &buf;
          v79[4] = self;
          v79[5] = v73;
          v79[6] = v72;
          v79[7] = v55;
          v79[8] = v71;
          -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:]( self,  "generateKeyDictForTypes:keyLength:forAddress:withCompletion:",  v67,  v59,  v60,  v79);
        }

        else
        {
          unint64_t v62 = -[CBIDSManager keyLength](self, "keyLength");
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472LL;
          v74[2] = sub_10005673C;
          v74[3] = &unk_100207E48;
          uint64_t v61 = (id *)v74;
          v74[9] = &buf;
          v74[4] = self;
          v74[5] = v73;
          v74[6] = v72;
          v74[7] = v55;
          v74[8] = v71;
          -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:]( self,  "generateKeyDictForTypes:keyLength:forAddress:withCompletion:",  v67,  v62,  0LL,  v74);
        }

        __int128 v63 = v61 + 5;
        uint64_t v64 = v61 + 6;
        v65 = v61 + 7;

LABEL_38:
        _Block_object_dispose(&buf, 8);

LABEL_39:
        id v33 = (os_log_s *)v70;
        goto LABEL_40;
      }

      BOOL v28 = (double)-[CBIDSManager timeStamp](self, "timeStamp") - v21 < 0.0;
      os_log_t v29 = sub_100060178("CloudPairing");
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v29);
      BOOL v30 = os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v30)
        {
          id v31 = objc_claimAutoreleasedReturnValue([v73 description]);
          id v32 = [v31 UTF8String];
          LODWORD(buf) = 136380675;
          *(void *)((char *)&buf + 4) = v32;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "Received 'InitiatorPairingKeys' local Timestamp saved is newer than received message: %{private}s",  (uint8_t *)&buf,  0xCu);
        }

        goto LABEL_39;
      }

      if (v30)
      {
        unint64_t v34 = -[CBIDSManager timeStamp](self, "timeStamp");
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = (double)v34 - v21;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "Received 'InitiatorPairingKeys' Time to receive message: %f",  (uint8_t *)&buf,  0xCu);
      }
    }

    goto LABEL_22;
  }

  id v33 = v10;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_10018E398(v73, self);
    id v33 = v11;
  }

- (void)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  os_log_t v13 = sub_100060178("CloudPairing");
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "MUC - generateKeyDictForTypes: %@ for local address: %@",  buf,  0x16u);
  }

  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v10,  @"kCloudPairingKeyTypes",  v15,  @"kCloudPairingKeyLength",  0LL));

  if (v11) {
    [v16 setObject:v11 forKeyedSubscript:@"kLocalRandomAddress"];
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100056A68;
  v19[3] = &unk_100207E98;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 sendCloudKitMsg:@"GenerateCloudPairingKeys" args:v16 withReply:v19];
}

- (void)cloudPairingCompletedWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v9 = a5;
  if (a4) {
    id v10 = a4;
  }
  else {
    id v10 = &__NSDictionary0__struct;
  }
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 uniqueID]);
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (void *)v15;
  }
  else {
    id v17 = &__NSDictionary0__struct;
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v13,  @"kCloudPairingCompleteResponse",  v10,  @"kCloudPairingLocalKeys",  v17,  @"kCloudDeviceUniqueID",  v11,  @"kCloudPairingProtocolID",  0LL));

  os_log_t v19 = sub_100060178("CloudPairing");
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138477827;
    float v27 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Sending args for cloudPairingCompletedWithResponse: %{private}@",  buf,  0xCu);
  }

  double v21 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  void v24[2] = sub_100056E48;
  v24[3] = &unk_100207EC0;
  v24[4] = self;
  id v25 = v9;
  id v22 = v9;
  [v21 sendCloudKitMsg:@"CloudPairingComplete" args:v18 withReply:v24];
}

- (unint64_t)roleWithDevice:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));

  if (!v5)
  {
    os_log_t v12 = sub_100060178("CloudPairing");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10018E59C(v4);
    }
    goto LABEL_11;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDevice]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);

  if (!v7)
  {
    os_log_t v14 = sub_100060178("CloudPairing");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10018E618(v4);
    }
LABEL_11:

    unint64_t v11 = 0LL;
    goto LABEL_12;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDevice]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
  if ([v8 compare:v10] == (id)1) {
    unint64_t v11 = 1LL;
  }
  else {
    unint64_t v11 = 2LL;
  }

LABEL_12:
  return v11;
}

- (void)handleResponderPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v9);
  os_log_t v12 = sub_100060178("CloudPairing");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  os_log_t v14 = v13;
  if (v11 == 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_claimAutoreleasedReturnValue([v9 description]);
      int v19 = 136380675;
      id v20 = [v15 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Received 'ResponderPairingKeys' message from IDS device %{private}s",  (uint8_t *)&v19,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    -[CBIDSManager storePublicAddressMapping:message:](self, "storePublicAddressMapping:message:", v16, v8);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
    if (!v17)
    {
      -[CBIDSManager cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:]( self,  "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:",  v8,  0LL,  v9,  v10);
      goto LABEL_9;
    }

    os_log_t v14 = (os_log_s *)[v8 mutableCopy];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
    -[os_log_s setObject:forKey:](v14, "setObject:forKey:", v18, @"IDSLocalRandomAddress");

    -[CBIDSManager cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:]( self,  "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:",  v14,  0LL,  v9,  v10);
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_10018E694();
  }

LABEL_9:
}

- (void)handleSecurityRequest:(id)a3 from:(id)a4
{
  id v5 = a4;
  if ((id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v5) == (id)1)
  {
    if ([v5 state] && objc_msgSend(v5, "state") != (id)6)
    {
      os_log_t v13 = sub_100060178("CloudPairing");
      os_log_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_claimAutoreleasedReturnValue([v5 description]);
        id v16 = [v15 UTF8String];
        id v17 = objc_claimAutoreleasedReturnValue([v5 stateString]);
        int v18 = 136380931;
        id v19 = v16;
        __int16 v20 = 2080;
        id v21 = [v17 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Dropping 'security request' message from IDS device %{private}s as our state is '%s'",  (uint8_t *)&v18,  0x16u);
      }
    }

    else
    {
      os_log_t v6 = sub_100060178("CloudPairing");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
        id v9 = [v8 UTF8String];
        id v10 = objc_claimAutoreleasedReturnValue([v5 stateString]);
        int v18 = 136380931;
        id v19 = v9;
        __int16 v20 = 2080;
        id v21 = [v10 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received 'security request' message from IDS device %{private}s with current state is '%s'",  (uint8_t *)&v18,  0x16u);
      }

      -[CBIDSManager initiatePairing:](self, "initiatePairing:", v5);
    }
  }

  else
  {
    os_log_t v11 = sub_100060178("CloudPairing");
    os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018E72C();
    }
  }
}

- (void)handleRepairRequest:(id)a3 from:(id)a4
{
  id v5 = a4;
  os_log_t v6 = sub_100060178("CloudPairing");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
    int v9 = 136380675;
    id v10 = [v8 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received 'Repair request' message from IDS device %{private}s",  (uint8_t *)&v9,  0xCu);
  }

  -[CBIDSManager initiatePairing:](self, "initiatePairing:", v5);
}

- (void)handlePairingRequest:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CBIDSManager validateMessage:from:](self, "validateMessage:from:", v6, v7))
  {
    if ((id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v7) == (id)2)
    {
      if ([v7 state] && objc_msgSend(v7, "state") != (id)1)
      {
        os_log_t v16 = sub_100060178("CloudPairing");
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = objc_claimAutoreleasedReturnValue([v7 description]);
          id v19 = [v18 UTF8String];
          id v20 = objc_claimAutoreleasedReturnValue([v7 stateString]);
          *(_DWORD *)__int128 buf = 136380931;
          id v25 = v19;
          __int16 v26 = 2080;
          id v27 = [v20 UTF8String];
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Dropping 'pairing request' message from IDS device %{private}s as our state is '%s'",  buf,  0x16u);
        }
      }

      else
      {
        os_log_t v8 = sub_100060178("CloudPairing");
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = objc_claimAutoreleasedReturnValue([v7 description]);
          *(_DWORD *)__int128 buf = 136380675;
          id v25 = [v10 UTF8String];
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received 'pairing request' message from IDS device %{private}s",  buf,  0xCu);
        }

        os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyType"]);
        os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyLength"]);
        id v13 = [v12 unsignedIntegerValue];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100057CE0;
        v21[3] = &unk_100207EE8;
        void v21[4] = self;
        id v22 = v6;
        id v23 = v7;
        -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:]( self,  "generateKeyDictForTypes:keyLength:forAddress:withCompletion:",  v11,  v13,  0LL,  v21);
      }
    }

    else
    {
      os_log_t v14 = sub_100060178("CloudPairing");
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10018E7C4();
      }
    }
  }
}

- (void)handlePairingResponse:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CBIDSManager validateMessage:from:](self, "validateMessage:from:", v6, v7))
  {
    if ((id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v7) == (id)1)
    {
      if ([v7 state] == (id)2 && objc_msgSend(v7, "state") == (id)3)
      {
        os_log_t v8 = sub_100060178("CloudPairing");
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = objc_claimAutoreleasedReturnValue([v7 description]);
          *(_DWORD *)__int128 buf = 136380675;
          id v26 = [v10 UTF8String];
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received 'pairing response' message from IDS device %{private}s",  buf,  0xCu);
        }

        os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeys"]);
        os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyType"]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyLength"]);
        id v14 = [v13 unsignedIntegerValue];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10005816C;
        v21[3] = &unk_100207F10;
        void v21[4] = self;
        id v22 = v6;
        id v23 = v11;
        id v24 = v7;
        id v15 = v11;
        -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:]( self,  "generateKeyDictForTypes:keyLength:forAddress:withCompletion:",  v12,  v14,  0LL,  v21);
      }

      else
      {
        os_log_t v17 = sub_100060178("CloudPairing");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = objc_claimAutoreleasedReturnValue([v7 description]);
          id v19 = [v18 UTF8String];
          id v20 = objc_claimAutoreleasedReturnValue([v7 stateString]);
          *(_DWORD *)__int128 buf = 136380931;
          id v26 = v19;
          __int16 v27 = 2080;
          id v28 = [v20 UTF8String];
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Dropping 'pairing response' message from IDS device %{private}s as our state is '%s'",  buf,  0x16u);
        }
      }
    }

    else
    {
      os_log_t v16 = sub_100060178("CloudPairing");
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10018E85C();
      }
    }
  }
}

- (void)handleKeyDistribution:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CBIDSManager validateMessage:from:](self, "validateMessage:from:", v6, v7))
  {
    if ([v7 state] != (id)4 || objc_msgSend(v7, "state") != (id)5)
    {
      os_log_t v21 = sub_100060178("CloudPairing");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = objc_claimAutoreleasedReturnValue([v7 description]);
        id v23 = [v22 UTF8String];
        id v24 = objc_claimAutoreleasedReturnValue([v7 stateString]);
        *(_DWORD *)__int128 buf = 136380931;
        id v30 = v23;
        __int16 v31 = 2080;
        id v32 = [v24 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Dropping 'key distribution' message from IDS device %{private}s as our state is '%s'",  buf,  0x16u);
      }

      goto LABEL_14;
    }

    os_log_t v8 = sub_100060178("CloudPairing");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_claimAutoreleasedReturnValue([v7 description]);
      *(_DWORD *)__int128 buf = 136380675;
      id v30 = [v10 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received 'key distribution' message from IDS device %{private}s",  buf,  0xCu);
    }

    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"LocalKeys"]);
    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"LTKLength"]);
    id v13 = [v12 unsignedIntegerValue];
    unint64_t v14 = -[CBIDSManager keyLength](self, "keyLength");

    if (v13 == (id)v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeys"]);
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"LTKLength"]);
      id v17 = [v16 unsignedIntegerValue];
      unint64_t v18 = -[CBIDSManager keyLength](self, "keyLength");

      if (v17 == (id)v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"LocalKeys"]);
        -[CBIDSManager cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:]( self,  "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:",  v6,  v19,  v7,  @"Version 1");

        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
        -[CBIDSManager storePublicAddressMapping:message:](self, "storePublicAddressMapping:message:", v20, v6);
LABEL_14:

        goto LABEL_15;
      }

      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeys"]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"LTKLength"]);
      __int16 v27 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid requested key length (%@)",  v26);
    }

    else
    {
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"LocalKeys"]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"LTKLength"]);
      __int16 v27 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid local key length (%@)",  v26);
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v20, v28);

    goto LABEL_14;
  }

- (void)handlePairingFailure:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_log_t v7 = sub_100060178("CloudPairing");
  os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10018E8F4();
  }
}

- (void)initiatePairingAgainIfNoAckReceived:(id)a3 attempt:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v6);
  if (v7)
  {
    unint64_t v8 = v7;
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDevice]);
    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v11]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDevice]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
    [v13 setObject:v6 forKey:v15];

    if (v12)
    {
      os_log_t v25 = sub_100060178("CloudPairing");
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v26 = a4 - 1;
        if (v8 == 1) {
          __int16 v27 = "pairing";
        }
        else {
          __int16 v27 = "security";
        }
        id v28 = objc_claimAutoreleasedReturnValue([v6 description]);
        *(_DWORD *)__int128 buf = 134218499;
        unint64_t v36 = v26;
        __int16 v37 = 2080;
        unint64_t v38 = (unint64_t)v27;
        __int16 v39 = 2081;
        id v40 = (const char *)[v28 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "MUC - Dropping delay sending again attempt (%lu) '%s request' message to IDS device %{private}s",  buf,  0x20u);
      }
    }

    else
    {
      double v16 = (double)arc4random_uniform(0xB4u) + 60.0;
      os_log_t v17 = sub_100060178("CloudPairing");
      unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (v8 == 1) {
          id v19 = "pairing";
        }
        else {
          id v19 = "security";
        }
        id v20 = objc_claimAutoreleasedReturnValue([v6 description]);
        *(_DWORD *)__int128 buf = 134218755;
        unint64_t v36 = (unint64_t)v16;
        __int16 v37 = 2048;
        unint64_t v38 = a4;
        __int16 v39 = 2080;
        id v40 = v19;
        __int16 v41 = 2081;
        id v42 = [v20 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "MUC - Delaying (%lu) seconds to send (%lu) attempt '%s request' message to IDS device %{private}s",  buf,  0x2Au);
      }

      dispatch_time_t v21 = dispatch_time(0LL, (uint64_t)(v16 * (double)a4 * 1000000000.0));
      id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100058ADC;
      block[3] = &unk_100207F60;
      double v32 = v16;
      unint64_t v33 = a4;
      unint64_t v34 = v8;
      id v30 = (os_log_s *)v6;
      __int16 v31 = self;
      dispatch_after(v21, v22, block);

      id v23 = v30;
    }
  }

  else
  {
    os_log_t v24 = sub_100060178("CloudPairing");
    os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018E998(v6);
    }
  }
}

- (void)initiatePairing:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v4);
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", mach_absolute_time());
    uint64_t v48 = objc_claimAutoreleasedReturnValue(v7);
    os_log_t v8 = sub_100060178("CloudPairing");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 == 1) {
        id v10 = "pairing";
      }
      else {
        id v10 = "security";
      }
      id v11 = objc_claimAutoreleasedReturnValue([v4 description]);
      *(_DWORD *)__int128 buf = 136315395;
      id v69 = v10;
      __int16 v70 = 2081;
      id v71 = [v11 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "MUC - Sending '%s request' message to IDS device %{private}s",  buf,  0x16u);
    }

    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    os_log_t v12 = @"SecurityRequest";
    if (v6 == 1) {
      os_log_t v12 = @"PairingRequest";
    }
    v67[0] = v12;
    v66[0] = @"MessageType";
    v66[1] = @"DeviceName";
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
    v67[1] = v13;
    v66[2] = @"PublicAddress";
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
    v67[2] = v14;
    v67[3] = @"Basic";
    v66[3] = @"EncryptionType";
    v66[4] = @"RequestedKeyType";
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager requestedKeyTypes](self, "requestedKeyTypes"));
    v67[4] = v15;
    v66[5] = @"RequestedKeyLength";
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CBIDSManager keyLength](self, "keyLength")));
    v67[5] = v16;
    BOOL v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  6LL));

    [v50 setObject:v47 forKey:@"Version 1"];
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDevice]);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);

    [v49 setObject:v48 forKey:v18];
    id v19 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    dispatch_time_t v21 = -[NSMutableArray initWithArray:](v19, "initWithArray:", v20);

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v22 = v21;
    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v59,  v65,  16LL);
    if (v23)
    {
      uint64_t v24 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v60 != v24) {
            objc_enumerationMutation(v22);
          }
          unint64_t v26 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v18]);

          if (v27)
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
            [v28 removeObject:v26];
          }
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v59,  v65,  16LL);
      }

      while (v23);
    }

    os_log_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    [v29 addObject:v49];

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    +[CBPreferencesManager setuserPreference:value:sync:]( &OBJC_CLASS___CBPreferencesManager,  "setuserPreference:value:sync:",  @"CloudDevice",  v30,  1LL);

    if (v6 == 1)
    {
      os_log_t v31 = sub_100060178("CloudPairing");
      double v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "CloudPairingRoleInitator starting",  buf,  2u);
      }

      unint64_t v33 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"PublicKeys",  @"IdentityKeys",  0LL);
      v64[0] = @"InitiatorPairingKeys";
      v63[0] = @"MessageType";
      v63[1] = @"DeviceName";
      unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
      v64[1] = v34;
      v63[2] = @"PublicAddress";
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
      v64[2] = v35;
      v63[3] = @"TimeStamp";
      v63[4] = @"EncryptionType";
      v64[3] = v48;
      v64[4] = @"ECDH";
      v64[5] = v33;
      v63[5] = @"RequestedKeyType";
      v63[6] = @"RequestedKeyLength";
      unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CBIDSManager keyLength](self, "keyLength")));
      v64[6] = v36;
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  7LL));

      objc_initWeak((id *)buf, self);
      unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));

      unint64_t v39 = -[CBIDSManager keyLength](self, "keyLength");
      BOOL v40 = v38 != 0LL;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100059620;
      v51[3] = &unk_100207FB0;
      objc_copyWeak(v57, (id *)buf);
      id v41 = v37;
      id v52 = v41;
      id v42 = v50;
      BOOL v58 = v40;
      id v53 = v42;
      id v54 = self;
      id v55 = v4;
      v57[1] = (id)1;
      id v43 = v33;
      id v56 = v43;
      -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:]( self,  "generateKeyDictForTypes:keyLength:forAddress:withCompletion:",  v43,  v39,  0LL,  v51);

      objc_destroyWeak(v57);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      [v50 setObject:@"CloudPairing" forKey:@"MessageType"];
      -[CBIDSManager sendInitialPairingIDSMessage:forDevice:withRole:]( self,  "sendInitialPairingIDSMessage:forDevice:withRole:",  v50,  v4,  v6);
    }

    int v46 = (void *)v48;
  }

  else
  {
    os_log_t v44 = sub_100060178("CloudPairing");
    os_log_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    int v46 = v45;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      sub_10018EA14(v4);
      int v46 = v45;
    }
  }
}

- (void)sendInitialPairingIDSMessage:(id)a3 forDevice:(id)a4 withRole:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_autoreleasePoolPush();
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
  os_log_t v12 = (void *)IDSCopyForDevice();

  os_log_t v13 = sub_100060178("CloudPairing");
  unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v12)
  {
    unint64_t v31 = a5;
    double v32 = v10;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 141558787;
      uint64_t v39 = 1752392040LL;
      __int16 v40 = 2113;
      id v41 = v9;
      __int16 v42 = 2160;
      uint64_t v43 = 1752392040LL;
      __int16 v44 = 2113;
      id v45 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting to send message to %{private, mask.hash}@ : %{private, mask.hash}@",  buf,  0x2Au);
    }

    double v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"MessageType"]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v17 uniqueID]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Initial-%@-%@",  v16,  v18));

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
    dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v12));
    v36[0] = IDSSendMessageOptionTimeoutKey;
    v36[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
    v37[0] = &off_100219140;
    v37[1] = &__kCFBooleanTrue;
    v36[2] = IDSSendMessageOptionQueueOneIdentifierKey;
    v37[2] = v19;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
    id v34 = 0LL;
    id v35 = 0LL;
    LOBYTE(v17) = [v20 sendMessage:v8 fromAccount:0 toDestinations:v21 priority:300 options:v22 identifier:&v35 error:&v34];
    id v15 = (os_log_s *)v35;
    id v33 = v34;

    os_log_t v23 = sub_100060178("CloudPairing");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_log_t v25 = v24;
    if ((v17 & 1) != 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = -[os_log_s UTF8String](v15, "UTF8String");
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v39 = (uint64_t)v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully sent message %s", buf, 0xCu);
      }

      if (v31 == 1) {
        uint64_t v27 = 2LL;
      }
      else {
        uint64_t v27 = 1LL;
      }
      [v9 setState:v27];
      os_log_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
      -[os_log_s setObject:forKey:](v25, "setObject:forKey:", v9, v15);
    }

    else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      sub_10018EB68(v33);
    }

    id v10 = v32;

    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    os_log_t v29 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 uniqueID]);
    [v28 removeObjectForKey:v30];
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_10018EA94(v9, v8, v15);
  }

  objc_autoreleasePoolPop(v10);
}

- (void)sendRePairRequest:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059F3C;
  block[3] = &unk_100206490;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_sendRePairRequest:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v46 = a4;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v7 = v6;
  id v42 = [v7 countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v42)
  {
    uint64_t v8 = *(void *)v59;
    __int16 v44 = v7;
    uint64_t v41 = *(void *)v59;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v43 = v9;
        uint64_t v10 = *(void *)(*((void *)&v58 + 1) + 8 * v9);
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 devices]);

        id obj = v12;
        id v13 = [v12 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v55;
          while (2)
          {
            double v16 = 0LL;
            id v45 = v14;
            do
            {
              if (*(void *)v55 != v15) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v16);
              os_log_t v18 = sub_100060178("CloudPairing");
              id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 nsuuid]);
                *(_DWORD *)__int128 buf = 138412546;
                unint64_t v65 = (unint64_t)v20;
                __int16 v66 = 2112;
                uint64_t v67 = v10;
                _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "cloudpaird: sendRePairRequest: BTUUID: %@ peerUUID %@",  buf,  0x16u);
              }

              dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
              unsigned int v22 = [v21 isEqualToString:v10];

              if (v22)
              {
                os_log_t v23 = sub_100060178("CloudPairing");
                uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
                  *(_DWORD *)__int128 buf = 138412290;
                  unint64_t v65 = (unint64_t)v25;
                  _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "cloudpaird: sendRePairRequest: IDS to repair is a valid device %@",  buf,  0xCu);
                }

                id v26 = (void *)objc_claimAutoreleasedReturnValue( -[CBIDSManager deviceForIDSDevice:createNew:]( self,  "deviceForIDSDevice:createNew:",  v17,  0LL));
                uint64_t v27 = v26;
                if (v26)
                {
                  [v26 setState:0];
                }

                else
                {
                  os_log_t v28 = sub_100060178("CloudPairing");
                  os_log_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                    sub_10018EBE4(&v52, v53, v29);
                  }
                }

                id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RePairingRequest-%@",  v10));
                unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
                v51[0] = _NSConcreteStackBlock;
                v51[1] = 3221225472LL;
                v51[2] = sub_10005A504;
                v51[3] = &unk_100207FD8;
                void v51[4] = v30;
                double v32 = (void *)objc_claimAutoreleasedReturnValue([v31 keysOfEntriesPassingTest:v51]);

                id v33 = [v32 count];
                if (v33)
                {
                  double v34 = (double)arc4random_uniform(0xB4u) + 60.0;
                  os_log_t v35 = sub_100060178("CloudPairing");
                  unint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)__int128 buf = 134218242;
                    unint64_t v65 = (unint64_t)v34;
                    __int16 v66 = 2112;
                    uint64_t v67 = v10;
                    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Deferring (%lu) seconds sendRePairRequest: %@ as we already sent one",  buf,  0x16u);
                  }

                  dispatch_time_t v37 = dispatch_time(0LL, (uint64_t)(v34 * 1000000000.0));
                  unint64_t v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472LL;
                  block[2] = sub_10005A510;
                  block[3] = &unk_100208000;
                  void block[4] = self;
                  void block[5] = v30;
                  block[6] = v10;
                  id v49 = v27;
                  id v50 = v46;
                  dispatch_after(v37, v38, block);
                }

                else
                {
                  v62[0] = @"MessageType";
                  v62[1] = @"DeviceName";
                  v63[0] = @"RepairRequest";
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
                  v63[1] = v39;
                  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v63,  v62,  2LL));
                  -[CBIDSManager sendRePairCloudPairingMessage:toDevice:bundleID:]( self,  "sendRePairCloudPairingMessage:toDevice:bundleID:",  v40,  v27,  v46);
                }

                id v14 = v45;
                if (v33)
                {

                  id v7 = v44;
                  goto LABEL_33;
                }
              }

              double v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v14 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v43 + 1;
        id v7 = v44;
        uint64_t v8 = v41;
      }

      while ((id)(v43 + 1) != v42);
      id v42 = [v44 countByEnumeratingWithState:&v58 objects:v69 count:16];
    }

    while (v42);
  }

- (void)sendRePairCloudPairingMessage:(id)a3 toDevice:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accounts]);
  id v13 = [v12 count];

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    uint64_t v15 = (os_log_s *)IDSCopyIDForDevice();

    if (!v15)
    {
      os_log_t v39 = sub_100060178("CloudPairing");
      os_log_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10018EC4C();
      }
      goto LABEL_17;
    }

    id v42 = v10;
    double v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", @"CloudPairing", @"MessageType");
    id v41 = v8;
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v8, @"Version 1");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 2592000.0));
    os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v17,  IDSSendMessageOptionTimeoutKey,  0LL));

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueID]);
    dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RePairingRequest-%@",  v20));

    [v18 setObject:v21 forKey:IDSSendMessageOptionQueueOneIdentifierKey];
    [v18 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionWantsClientAcknowledgementKey];
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
    os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v15));
    id v43 = 0LL;
    id v44 = 0LL;
    unsigned __int8 v24 = [v22 sendMessage:v16 fromAccount:0 toDestinations:v23 priority:300 options:v18 identifier:&v44 error:&v43];
    os_log_t v25 = (os_log_s *)v44;
    id v40 = v43;

    if ((v24 & 1) != 0)
    {
      id v8 = v41;
      if (!v25)
      {
LABEL_16:

        uint64_t v10 = (__CFString *)v42;
LABEL_17:

        goto LABEL_18;
      }

      os_log_t v26 = sub_100060178("CloudPairing");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v28 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
        os_log_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
        *(_DWORD *)__int128 buf = 138413058;
        uint64_t v48 = v16;
        __int16 v49 = 2112;
        id v50 = v29;
        __int16 v51 = 2112;
        uint8_t v52 = v15;
        __int16 v53 = 2112;
        __int128 v54 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "cloudpaird: sendRePairCloudPairingMessage: Sending message :%@ to device %@ of account :%@ with GUID :%@",  buf,  0x2Au);

        id v8 = v41;
      }

      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v25,  v21));
      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
      [v31 setObject:v9 forKey:v30];

      v45[0] = @"MessageType";
      double v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:"));
      v45[1] = @"BundleID";
      v46[0] = v32;
      id v33 = @"Unknown";
      if (v42) {
        id v33 = v42;
      }
      v46[1] = v33;
      double v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
      CUMetricsLog(@"com.apple.Bluetooth.CloudPairingMessage", v34);
    }

    else
    {
      os_log_t v36 = sub_100060178("CloudPairing");
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        dispatch_time_t v37 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
        unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 name]);
        *(_DWORD *)__int128 buf = 138413058;
        uint64_t v48 = v16;
        __int16 v49 = 2112;
        id v50 = v38;
        __int16 v51 = 2112;
        uint8_t v52 = v15;
        __int16 v53 = 2112;
        __int128 v54 = (os_log_s *)v40;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "cloudpaird: sendRePairCloudPairingMessage: Sending message failed  :%@ to device %@ of account :%@ with error %@",  buf,  0x2Au);
      }

      id v8 = v41;
    }

    goto LABEL_16;
  }

  os_log_t v35 = sub_100060178("CloudPairing");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10018EC20();
  }
LABEL_18:
}

- (void)sendCloudPairingResponseMessage:(id)a3 toDevice:(id)a4 version:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_autoreleasePoolPush();
  id v11 = (void *)IDSCopyForDevice(v8);
  os_log_t v12 = sub_100060178("CloudPairing");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (v11)
  {
    id v45 = v10;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_claimAutoreleasedReturnValue([v8 cpDescription]);
      id v16 = [v15 UTF8String];
      id v17 = objc_claimAutoreleasedReturnValue([v7 description]);
      *(_DWORD *)__int128 buf = 136380931;
      id v59 = v16;
      __int16 v60 = 2080;
      id v61 = [v17 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Sending message to IDS device %{private}s: %s",  buf,  0x16u);
    }

    id v46 = v9;
    if ([v9 isEqualToString:@"Version 1"])
    {
      v56[0] = @"MessageType";
      v56[1] = @"Version 1";
      v57[0] = @"CloudPairing";
      v57[1] = v7;
      os_log_t v18 = v57;
      id v19 = v56;
    }

    else if ([v9 isEqualToString:@"Version 2"])
    {
      v54[0] = @"MessageType";
      v54[1] = @"Version 2";
      v55[0] = @"CloudPairing";
      v55[1] = v7;
      os_log_t v18 = v55;
      id v19 = v54;
    }

    else
    {
      if (![v9 isEqualToString:@"Version 3"])
      {
        uint64_t v20 = 0LL;
LABEL_13:
        dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"MessageType"]);
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
        uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v21, v22));

        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
        os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v11));
        v50[0] = IDSSendMessageOptionTimeoutKey;
        v50[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
        v51[0] = &off_100219140;
        v51[1] = &__kCFBooleanTrue;
        v50[2] = IDSSendMessageOptionQueueOneIdentifierKey;
        id v43 = (void *)v23;
        v51[2] = v23;
        os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  3LL));
        id v48 = 0LL;
        id v49 = 0LL;
        id v44 = (void *)v20;
        unsigned __int8 v27 = [v24 sendMessage:v20 fromAccount:0 toDestinations:v25 priority:300 options:v26 identifier:&v49 error:&v48];
        id v14 = (os_log_s *)v49;
        id v28 = v48;

        os_log_t v29 = sub_100060178("CloudPairing");
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        unint64_t v31 = v30;
        if ((v27 & 1) == 0)
        {
          os_log_t v35 = v28;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10018EB68(v28);
          }
          goto LABEL_24;
        }

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = -[os_log_s UTF8String](v14, "UTF8String");
          *(_DWORD *)__int128 buf = 136315138;
          id v59 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully sent message %s", buf, 0xCu);
        }

        unint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CBIDSManager deviceForIDSDevice:createNew:]( self,  "deviceForIDSDevice:createNew:",  v8,  0LL));
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"MessageType"]);
        if (([@"ResponderPairingKeys" isEqualToString:v33] & 1) == 0)
        {
          double v34 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"MessageType"]);
          if (![@"PairingResponse" isEqualToString:v34])
          {
            os_log_t v35 = v28;
            id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"MessageType"]);
            unsigned __int8 v42 = [@"KeyDistribution" isEqualToString:v41];

            if ((v42 & 1) == 0)
            {
LABEL_24:
              uint64_t v10 = v45;
              id v9 = v46;

              goto LABEL_25;
            }

- (void)sendErrorMessageToDevice:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100060178("CloudPairing");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_claimAutoreleasedReturnValue([v6 cpDescription]);
    *(_DWORD *)__int128 buf = 136380931;
    id v15 = [v10 UTF8String];
    __int16 v16 = 2080;
    id v17 = [v7 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Rejecting pairing attempt from IDS device %{private}s - %s",  buf,  0x16u);
  }

  v12[0] = @"MessageType";
  v12[1] = @"FailureReason";
  v13[0] = @"PairingFailure";
  v13[1] = v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  -[CBIDSManager sendCloudPairingResponseMessage:toDevice:version:]( self,  "sendCloudPairingResponseMessage:toDevice:version:",  v11,  v6,  @"Version 1");
}

- (void)handleUnpairCommand:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100060178("CloudPairing");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unpair Cloud Device: %@", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DeviceName"]);
  if (![v10 length])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
    -[CBIDSManager sendErrorMessageToDevice:reason:]( self,  "sendErrorMessageToDevice:reason:",  v19,  @"No friendly name specified");
LABEL_9:

    goto LABEL_13;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PublicAddress"]);
  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Public %@", v11));
  unint64_t v13 = sub_10004FF40(v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RandomAddress"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Random %@", v14));
  unint64_t v16 = sub_10004FF40(v15);

  if (!(v13 | v16))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PublicAddress"]);
    os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RandomAddress"]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid public address \"%@\" and Invalid random address \"%@\"",  v17,  v18));

    os_log_t v20 = sub_100060178("CloudPairing");
    dispatch_time_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10018ED10();
    }

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v22, v19);

    goto LABEL_9;
  }

  os_log_t v23 = sub_100060178("CloudPairing");
  unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = objc_claimAutoreleasedReturnValue([v7 description]);
    id v26 = [v25 UTF8String];
    *(_DWORD *)__int128 buf = 136380675;
    id v32 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received 'unpair command' message from IDS device %{private}s",  buf,  0xCu);
  }

  unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10005B604;
  v28[3] = &unk_100207EE8;
  v28[4] = self;
  id v29 = v7;
  id v30 = v10;
  [v27 sendCloudKitMsg:@"UnpairCloudDevice" args:v6 withReply:v28];

LABEL_13:
}

- (BOOL)validateMessage:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"MessageType"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DeviceName"]);
  if (![v9 length])
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
    -[CBIDSManager sendErrorMessageToDevice:reason:]( self,  "sendErrorMessageToDevice:reason:",  v16,  @"No friendly name specified");
LABEL_18:

    LOBYTE(v25) = 0;
    goto LABEL_19;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PublicAddress"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Public %@", v10));
  unint64_t v12 = sub_10004FF40(v11);

  if (!v12)
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PublicAddress"]);
    os_log_t v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid public address (%@)",  v17);
LABEL_17:
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v16, v26);

    goto LABEL_18;
  }

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"EncryptionType"]);
  unsigned __int8 v14 = [v13 isEqualToString:@"Basic"];

  if ((v14 & 1) == 0)
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"EncryptionType"]);
    os_log_t v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid encryption type (%@)",  v17);
    goto LABEL_17;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyType"]);
  if ([v15 containsObject:@"EncryptionKeys"])
  {
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyType"]);
    unsigned __int8 v20 = [v19 containsObject:@"IdentityKeys"];

    if ((v20 & 1) == 0)
    {
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyType"]);
      os_log_t v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid requested keys (%@)",  v17);
      goto LABEL_17;
    }
  }

  dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyLength"]);
  id v22 = [v21 integerValue];
  unint64_t v23 = -[CBIDSManager keyLength](self, "keyLength");

  if (v22 != (id)v23)
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDevice]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RequestedKeyLength"]);
    os_log_t v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid requested key length (%@)",  v17);
    goto LABEL_17;
  }

  if (([@"PairingResponse" isEqualToString:v8] & 1) == 0
    && ![@"KeyDistribution" isEqualToString:v8]
    || (unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager requestedKeyTypes](self, "requestedKeyTypes")),
        BOOL v25 = -[CBIDSManager validateKeys:requestedTypes:from:](self, "validateKeys:requestedTypes:from:", v6, v24, v7),
        v24,
        v25))
  {
    LOBYTE(v25) = 1;
  }

- (BOOL)validateKeys:(id)a3 requestedTypes:(id)a4 from:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"RequestedKeys"]);
  id v11 = @"LTK";
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTK"]);
  if (!v12) {
    goto LABEL_22;
  }
  unint64_t v13 = (void *)v12;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTK"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }

  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTK"]);
  id v17 = [v16 length];

  if (v17 != (id)16)
  {
LABEL_22:
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    id v45 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
    __int16 v51 = v11;
    uint8_t v52 = v45;
    id v46 = @"%@ not specified or invalid (%@)";
LABEL_23:
    BOOL v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v46, v51, v52));
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v44, v47);

    BOOL v43 = 0;
    goto LABEL_24;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKType"]);
  if (!v18
    || (id v19 = (void *)v18,
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKType"]),
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber),
        char isKindOfClass = objc_opt_isKindOfClass(v20, v21),
        v20,
        v19,
        (isKindOfClass & 1) == 0))
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    uint64_t v49 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKType"]);
    id v45 = (__CFString *)v49;
    id v50 = @"LTK type";
LABEL_27:
    __int16 v51 = v50;
    uint8_t v52 = (void *)v49;
    id v46 = @"%@ not specified or invalid (%@)";
    goto LABEL_23;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKLength"]);
  if (!v23
    || (unsigned __int8 v24 = (void *)v23,
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKLength"]),
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber),
        char v27 = objc_opt_isKindOfClass(v25, v26),
        v25,
        v24,
        (v27 & 1) == 0))
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    uint64_t v49 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKLength"]);
    id v45 = (__CFString *)v49;
    id v50 = @"LTK length";
    goto LABEL_27;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKLength"]);
  id v29 = [v28 unsignedIntegerValue];
  unint64_t v30 = -[CBIDSManager keyLength](self, "keyLength");

  if (v29 != (id)v30)
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDevice]);
    id v45 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"LTKLength"]);
    __int16 v51 = v45;
    id v46 = @"Invalid LTK key length (%@)";
    goto LABEL_23;
  }

  id v11 = @"EDIV";
  uint64_t v31 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"EDIV"]);
  if (!v31) {
    goto LABEL_22;
  }
  unint64_t v13 = (void *)v31;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"EDIV"]);
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v14, v32) & 1) == 0) {
    goto LABEL_21;
  }
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"EDIV"]);
  id v34 = [v33 length];

  if (v34 != (id)2) {
    goto LABEL_22;
  }
  id v11 = @"RAND";
  uint64_t v35 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RAND"]);
  if (!v35) {
    goto LABEL_22;
  }
  unint64_t v13 = (void *)v35;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RAND"]);
  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v14, v36) & 1) == 0) {
    goto LABEL_21;
  }
  dispatch_time_t v37 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RAND"]);
  id v38 = [v37 length];

  if (v38 != (id)8) {
    goto LABEL_22;
  }
LABEL_16:
  if ([v8 containsObject:@"IdentityKeys"])
  {
    id v11 = @"IRK";
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"IRK"]);
    if (v39)
    {
      unint64_t v13 = (void *)v39;
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"IRK"]);
      uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v14, v40) & 1) != 0)
      {
        id v41 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"IRK"]);
        id v42 = [v41 length];

        if (v42 == (id)16) {
          goto LABEL_20;
        }
        goto LABEL_22;
      }

      goto LABEL_21;
    }

    goto LABEL_22;
  }

- (id)statedumpAndRecordDailyMetric
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10005644C;
  id v11 = sub_10005645C;
  uint64_t v12 = &stru_100212678;
  dispatch_time_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005C180;
  v6[3] = &unk_100206B38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_statedumpAndRecordDailyMetric
{
  uint64_t v114 = 0LL;
  os_log_t v115 = &v114;
  uint64_t v116 = 0x3032000000LL;
  v117 = sub_10005644C;
  v118 = sub_10005645C;
  id v119 = 0LL;
  id obj = 0LL;
  NSAppendPrintF_safe(&obj, "\n");
  objc_storeStrong(&v119, obj);
  id v4 = (id *)(v115 + 5);
  id v112 = (id)v115[5];
  NSAppendPrintF_safe(&v112, "---------- Cloud Pairing Manager ----------\n\n");
  objc_storeStrong(v4, v112);
  id v76 = (id)objc_claimAutoreleasedReturnValue(+[CBPreferencesManager deviceName](&OBJC_CLASS___CBPreferencesManager, "deviceName"));
  if (IsAppleInternalBuild(v76))
  {
    unint64_t v5 = (id *)(v115 + 5);
    id v111 = (id)v115[5];
    if (v76) {
      id v6 = (const char *)[v76 UTF8String];
    }
    else {
      id v6 = "none";
    }
    NSAppendPrintF_safe(&v111, "%s\n", v6);
    objc_storeStrong(v5, v111);
  }

  uint64_t v7 = (id *)(v115 + 5);
  id v110 = (id)v115[5];
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    if (IsAppleInternalBuild(v8))
    {
      id v2 = (id)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
      id v3 = objc_claimAutoreleasedReturnValue([v2 loginID]);
      id v10 = (const char *)[v3 UTF8String];
      int v11 = 1;
    }

    else
    {
      int v11 = 0;
      id v10 = "<redacted>";
    }
  }

  else
  {
    int v11 = 0;
    id v10 = "none";
  }

  NSAppendPrintF_safe(&v110, "iCloud: %s\n", v10);
  objc_storeStrong(v7, v110);
  if (v11)
  {
  }

  uint64_t v12 = (id *)(v115 + 5);
  id v109 = (id)v115[5];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
  if (v13)
  {
    id v2 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
    unsigned __int8 v14 = (const char *)[v2 UTF8String];
  }

  else
  {
    unsigned __int8 v14 = "none";
  }

  NSAppendPrintF_safe(&v109, "IDS: %s\n", v14);
  objc_storeStrong(v12, v109);
  if (v13) {

  }
  uint64_t v15 = (id *)(v115 + 5);
  id v108 = (id)v115[5];
  unsigned int v16 = -[CBIDSManager supportsVirtualAddress](self, "supportsVirtualAddress");
  id v17 = "NO";
  if (v16) {
    id v17 = "YES";
  }
  NSAppendPrintF_safe(&v108, "Virtual address supported: %s\n", v17);
  objc_storeStrong(v15, v108);
  uint64_t v18 = (id *)(v115 + 5);
  id v107 = (id)v115[5];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
  if (v19)
  {
    id v2 = objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
    unsigned __int8 v20 = (const char *)[v2 UTF8String];
  }

  else
  {
    unsigned __int8 v20 = "none";
  }

  NSAppendPrintF_safe(&v107, "Random static address: %s\n\n", v20);
  objc_storeStrong(v18, v107);
  if (v19) {

  }
  __int128 v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  id v77 = (id)objc_claimAutoreleasedReturnValue([v21 sortedArrayUsingComparator:&stru_100208040]);

  id v80 = [v77 countByEnumeratingWithState:&v103 objects:v122 count:16];
  if (v80)
  {
    uint64_t v78 = *(void *)v104;
    do
    {
      for (i = 0LL; i != v80; i = (char *)i + 1)
      {
        if (*(void *)v104 != v78) {
          objc_enumerationMutation(v77);
        }
        id v22 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)i);
        unint64_t v23 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v22);
        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 idsDevice]);
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v24 productName]);
        id v85 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:v25]);

        if (!v85) {
          id v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        }
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceTypeToString]);
        uint64_t v27 = objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:v26]);

        if (v27) {
          id v28 = (_UNKNOWN **)v27;
        }
        else {
          id v28 = &off_100219128;
        }
        __int128 v81 = v28;
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v28 intValue] + 1));
        unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceTypeToString]);
        [v85 setObject:v29 forKeyedSubscript:v30];

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v24 productName]);
        [v83 setObject:v85 forKeyedSubscript:v31];

        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v24 productName]);
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:v32]);

        if (!v33) {
          id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        }
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceTypeToString]);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v34]);

        id v102 = v35;
        NSAppendPrintF_safe(&v102, "-");
        id v36 = v102;

        id v101 = v36;
        id v37 = objc_claimAutoreleasedReturnValue([v24 name]);
        NSAppendPrintF_safe(&v101, "  %s,", (const char *)[v37 UTF8String]);
        id v38 = v101;

        id v100 = v38;
        id v39 = objc_claimAutoreleasedReturnValue([v24 uniqueID]);
        NSAppendPrintF_safe(&v100, " IDS: %s", (const char *)[v39 UTF8String]);
        id v40 = v100;

        id v99 = v40;
        id v41 = (void *)objc_claimAutoreleasedReturnValue([v24 nsuuid]);
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 UUIDString]);
        NSAppendPrintF_safe(&v99, ", BT: %@", v42);
        id v43 = v99;

        id v98 = v43;
        unsigned int v44 = [v22 isConnected];
        id v45 = "no";
        if (v44) {
          id v45 = "yes";
        }
        NSAppendPrintF_safe(&v98, ", Cn: %s", v45);
        id v46 = v98;

        id v97 = v46;
        BOOL v47 = "Unknown";
        if (v23 == 2) {
          BOOL v47 = "Responder";
        }
        if (v23 == 1) {
          BOOL v47 = "Initiator";
        }
        NSAppendPrintF_safe(&v97, ", %s", v47);
        id v48 = v97;

        id v96 = v48;
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v22 stateString]);
        id v50 = objc_claimAutoreleasedReturnValue([v49 capitalizedString]);
        NSAppendPrintF_safe(&v96, ", %s", (const char *)[v50 UTF8String]);
        id v51 = v96;

        id v95 = v51;
        id v52 = objc_claimAutoreleasedReturnValue([v24 deviceTypeToString]);
        __int16 v53 = (const char *)[v52 UTF8String];
        id v54 = objc_claimAutoreleasedReturnValue([v24 productName]);
        __int128 v55 = (const char *)[v54 UTF8String];
        id v56 = objc_claimAutoreleasedReturnValue([v24 productVersion]);
        __int128 v57 = (const char *)[v56 UTF8String];
        id v58 = objc_claimAutoreleasedReturnValue([v24 productBuildVersion]);
        NSAppendPrintF_safe(&v95, ", %s-%s-%s-%s\n", v53, v55, v57, (const char *)[v58 UTF8String]);
        id v59 = v95;

        __int16 v60 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceTypeToString]);
        [v33 setObject:v59 forKeyedSubscript:v60];

        id v61 = (void *)objc_claimAutoreleasedReturnValue([v24 productName]);
        [v82 setObject:v33 forKeyedSubscript:v61];
      }

      id v80 = [v77 countByEnumeratingWithState:&v103 objects:v122 count:16];
    }

    while (v80);
  }

  __int128 v62 = (id *)(v115 + 5);
  id v94 = (id)v115[5];
  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  NSAppendPrintF_safe(&v94, "IDS Devices    : %lu\n", [v63 count]);
  objc_storeStrong(v62, v94);

  uint64_t v64 = (id *)(v115 + 5);
  id v93 = (id)v115[5];
  unint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  __int16 v66 = (void *)objc_claimAutoreleasedReturnValue([v65 cuFilteredArrayUsingBlock:&stru_100208080]);
  NSAppendPrintF_safe(&v93, "Paired Devices : %lu\n\n", [v66 count]);
  objc_storeStrong(v64, v93);

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472LL;
  v90[2] = sub_10005CE3C;
  v90[3] = &unk_1002080D0;
  id v67 = v82;
  id v91 = v67;
  v92 = &v114;
  [v83 enumerateKeysAndObjectsUsingBlock:v90];
  v68 = (id *)(v115 + 5);
  id v89 = (id)v115[5];
  NSAppendPrintF_safe(&v89, "\nIDS Public Address Mapping:\n");
  objc_storeStrong(v68, v89);
  id v69 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_10005D100;
  v88[3] = &unk_1002080F8;
  v88[4] = &v114;
  [v69 enumerateKeysAndObjectsUsingBlock:v88];

  if (IsAppleInternalBuild(v70))
  {
    id v71 = (id *)(v115 + 5);
    id v87 = (id)v115[5];
    NSAppendPrintF_safe(&v87, "\nPending Client Ack Message Identifier from IDS Device:\n");
    objc_storeStrong(v71, v87);
    id v72 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472LL;
    v86[2] = sub_10005D150;
    v86[3] = &unk_100208120;
    v86[4] = &v114;
    [v72 enumerateKeysAndObjectsUsingBlock:v86];
  }

  v120 = @"Stats";
  id v121 = v83;
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v121,  &v120,  1LL));
  CUMetricsLog(@"com.apple.Bluetooth.CloudPairing", v73);

  id v74 = (id)v115[5];
  _Block_object_dispose(&v114, 8);

  return v74;
}

- (BOOL)shouldUpgradeToManatee
{
  os_log_t v3 = sub_100060178("MagicPairing");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Manatee available, Check for allDevicesJazzKon",  buf,  2u);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);

  id v7 = [v6 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v7)
  {
    id v9 = v7;
    char v10 = 0;
    uint64_t v11 = *(void *)v52;
    *(void *)&__int128 v8 = 134218496LL;
    __int128 v41 = v8;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v6);
        }
        unint64_t v13 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        if (objc_msgSend(v13, "isHSATrusted", v41))
        {
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 productName]);
          unsigned int v15 = [v14 isEqualToString:@"Apple TVOS"];

          if (v15)
          {
            os_log_t v36 = sub_100060178("MagicPairing");
            uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              id v37 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has AppleTV";
              goto LABEL_50;
            }

            goto LABEL_51;
          }

          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 productName]);
          unsigned int v17 = [v16 isEqualToString:@"iPhone OS"];

          if (v17)
          {
            os_log_t v18 = sub_100060178("MagicPairing");
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              if (v13)
              {
                [v13 operatingSystemVersion];
                unsigned __int8 v20 = v50;
                [v13 operatingSystemVersion];
                uint64_t v21 = v49;
                [v13 operatingSystemVersion];
                uint64_t v22 = v48;
              }

              else
              {
                uint64_t v22 = 0LL;
                uint64_t v21 = 0LL;
                unsigned __int8 v20 = 0LL;
                id v50 = 0LL;
                uint64_t v49 = 0LL;
                uint64_t v48 = 0LL;
              }

              *(_DWORD *)__int128 buf = v41;
              id v56 = v20;
              __int16 v57 = 2048;
              id v58 = v21;
              __int16 v59 = 2048;
              uint64_t v60 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "allDevicesJazzKon: checkManateeZoneUpgrade: account has iOS, majorVersion %ld, minorVersion %ld, patchVersion %ld",  buf,  0x20u);
            }

            if (!v13 || ([v13 operatingSystemVersion], v47 <= 12))
            {
              os_log_t v38 = sub_100060178("MagicPairing");
              uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                id v37 = "allDevicesJazzKon: iOS checkManateeZoneUpgrade: account not eligible";
                goto LABEL_50;
              }

              goto LABEL_51;
            }
          }

          else
          {
            unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 modelIdentifier]);
            unsigned int v24 = [v23 containsString:@"Mac"];

            if (v24)
            {
              os_log_t v25 = sub_100060178("MagicPairing");
              uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                if (v13)
                {
                  [v13 operatingSystemVersion];
                  uint64_t v27 = v46;
                  [v13 operatingSystemVersion];
                  id v28 = v45;
                  [v13 operatingSystemVersion];
                  uint64_t v29 = v44;
                }

                else
                {
                  uint64_t v29 = 0LL;
                  id v28 = 0LL;
                  uint64_t v27 = 0LL;
                  id v46 = 0LL;
                  id v45 = 0LL;
                  uint64_t v44 = 0LL;
                }

                *(_DWORD *)__int128 buf = v41;
                id v56 = v27;
                __int16 v57 = 2048;
                id v58 = v28;
                __int16 v59 = 2048;
                uint64_t v60 = v29;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "allDevicesJazzKon: checkManateeZoneUpgrade: account has macOS, majorVersion %ld, minorVersion %ld, patchVersion %ld",  buf,  0x20u);
              }

              if (!v13
                || ([v13 operatingSystemVersion], v43 < 11)
                && ([v13 operatingSystemVersion], v42 <= 14))
              {
                os_log_t v39 = sub_100060178("MagicPairing");
                uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)__int128 buf = 0;
                  id v37 = "allDevicesJazzKon: macOS checkManateeZoneUpgrade: account not eligible";
LABEL_50:
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
                }

- (BOOL)isLegacyDevice:(id)a3
{
  id v4 = a3;
  if (v4 && !-[CBIDSManager allDevicesStarSky](self, "allDevicesStarSky"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 devices]);

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if ([v13 isHSATrusted])
          {
            unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
            unsigned int v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 modelIdentifier]);
              if ([v16 containsString:@"Mac"])
              {
                unsigned int v17 = &v22;
                if (!v13) {
                  goto LABEL_24;
                }
                [v13 operatingSystemVersion];
                uint64_t v18 = v22;

                if (v18 < 12) {
                  goto LABEL_25;
                }
              }

              else
              {
              }

              unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 productName]);
              if ([v16 isEqualToString:@"iPhone OS"])
              {
                unsigned int v17 = &v21;
                if (!v13)
                {
LABEL_24:
                  uint64_t *v17 = 0LL;
                  v17[1] = 0LL;
                  v17[2] = 0LL;

LABEL_25:
                  BOOL v5 = 1;
                  goto LABEL_26;
                }

                [v13 operatingSystemVersion];
                uint64_t v19 = v21;

                if (v19 < 14) {
                  goto LABEL_25;
                }
              }

              else
              {
              }
            }
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v5 = 0;
LABEL_26:
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)allDevicesStarSky
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 devices]);

  os_log_t v4 = sub_100060178("MagicPairing");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    id v49 = [v3 count];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Check for allDevicesStarSky, count: %lu",  buf,  0xCu);
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v45;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v45 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 modelIdentifier]);
      if ([v12 hasPrefix:@"AppleTV"])
      {
        if (!v11)
        {

LABEL_32:
          os_log_t v23 = sub_100060178("CloudPairing");
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          *(_WORD *)__int128 buf = 0;
          uint64_t v22 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has AppleTV";
LABEL_34:
          __int128 v24 = v21;
          uint32_t v25 = 2;
          goto LABEL_48;
        }

        [v11 operatingSystemVersion];

        if (v43 <= 14) {
          goto LABEL_32;
        }
      }

      else
      {
      }

      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 modelIdentifier]);
      if ([v13 hasPrefix:@"iPhone"])
      {
        if (!v11)
        {

LABEL_36:
          os_log_t v26 = sub_100060178("CloudPairing");
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            if (v11)
            {
              [v11 operatingSystemVersion];
              uint64_t v27 = v41;
              [v11 operatingSystemVersion];
              uint64_t v28 = v40;
              [v11 operatingSystemVersion];
              uint64_t v29 = v39;
            }

            else
            {
              uint64_t v29 = 0LL;
              uint64_t v28 = 0LL;
              uint64_t v27 = 0LL;
            }

            *(_DWORD *)__int128 buf = 134218496;
            id v49 = v27;
            __int16 v50 = 2048;
            uint64_t v51 = v28;
            __int16 v52 = 2048;
            uint64_t v53 = v29;
            uint64_t v22 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has iOS, majorVersion %ld, minorVersion %ld, patchVersion %ld";
            goto LABEL_47;
          }

          goto LABEL_49;
        }

        [v11 operatingSystemVersion];

        if (v42 <= 14) {
          goto LABEL_36;
        }
      }

      else
      {
      }

      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 modelIdentifier]);
      if ([v14 containsString:@"Mac"])
      {
        if (!v11)
        {

LABEL_40:
          os_log_t v30 = sub_100060178("CloudPairing");
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            if (v11)
            {
              [v11 operatingSystemVersion];
              uint64_t v31 = v37;
              [v11 operatingSystemVersion];
              uint64_t v32 = v36;
              [v11 operatingSystemVersion];
              uint64_t v33 = v35;
            }

            else
            {
              uint64_t v33 = 0LL;
              uint64_t v32 = 0LL;
              uint64_t v31 = 0LL;
            }

            *(_DWORD *)__int128 buf = 134218496;
            id v49 = v31;
            __int16 v50 = 2048;
            uint64_t v51 = v32;
            __int16 v52 = 2048;
            uint64_t v53 = v33;
            uint64_t v22 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has macOS, majorVersion %ld, minorVersion %ld, patchVersion %ld";
LABEL_47:
            __int128 v24 = v21;
            uint32_t v25 = 32;
LABEL_48:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v22, buf, v25);
          }

- (void)storePublicAddressMapping:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKey:@"PublicAddress"]);
  if (!v7)
  {
    os_log_t v18 = sub_100060178("CloudPairing");
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v22) = 0;
    BOOL v19 = "cloudpaird: storePublicAddressMapping: Ignoring unpair becasue the address passed in is nil";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 2u);
    goto LABEL_16;
  }

  if (!v6)
  {
    os_log_t v20 = sub_100060178("CloudPairing");
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v22) = 0;
    BOOL v19 = "cloudpaird: storePublicAddressMapping: Ignoring request becasue the device is nil";
    goto LABEL_15;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);

  if (!v8)
  {
    os_log_t v21 = sub_100060178("CloudPairing");
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v22) = 0;
    BOOL v19 = "cloudpaird: storePublicAddressMapping: Device uniqueID is nil so throw this request out";
    goto LABEL_15;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  if (v11)
  {
    [v12 removeObjectForKey:v13];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  }

  [v12 setObject:v7 forKey:v13];

  os_log_t v14 = sub_100060178("CloudPairing");
  os_log_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    int v22 = 138412290;
    os_log_t v23 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "cloudpaird: storePublicAddressMapping: current mapping :%@",  (uint8_t *)&v22,  0xCu);
  }

  +[CBPreferencesManager removeuserPreference:sync:]( &OBJC_CLASS___CBPreferencesManager,  "removeuserPreference:sync:",  @"AddressMapping",  1LL);
  unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  +[CBPreferencesManager setuserPreference:value:sync:]( &OBJC_CLASS___CBPreferencesManager,  "setuserPreference:value:sync:",  @"AddressMapping",  v17,  1LL);
LABEL_16:
}

- (id)publicAddressForIDSDevice:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100060178("CloudPairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10018EE80();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  id v8 = [v7 count];

  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CBPreferencesManager readUserPreference:]( &OBJC_CLASS___CBPreferencesManager,  "readUserPreference:",  @"AddressMapping"));

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CBPreferencesManager readUserPreference:]( &OBJC_CLASS___CBPreferencesManager,  "readUserPreference:",  @"AddressMapping"));
      id v11 = [v10 mutableCopy];
      -[CBIDSManager setCPAddressMapping:](self, "setCPAddressMapping:", v11);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v4]);

  if (v13)
  {
    os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v4]);
  }

  else
  {
    os_log_t v15 = 0LL;
  }

  return v15;
}

- (id)_fetchArrayOfCloudDevicesForPeripheral:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  os_log_t v7 = sub_100060178("CloudPairing");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v33 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Find cloud pairing identifier for peripheral: %@",  buf,  0xCu);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v29;
    *(void *)&__int128 v11 = 138412546LL;
    __int128 v27 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v9);
        }
        os_log_t v15 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "idsDevice", v27));
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 nsuuid]);
        unsigned int v18 = [v17 isEqual:v4];

        if (v18)
        {
          os_log_t v19 = sub_100060178("CloudPairing");
          os_log_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 idsDevice]);
            int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
            *(_DWORD *)__int128 buf = v27;
            id v33 = v4;
            __int16 v34 = 2112;
            uint64_t v35 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Found cloud pairing identifier for peripheral: %@ as %@",  buf,  0x16u);
          }

          [v6 addObject:v15];
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v12);
  }

  os_log_t v23 = sub_100060178("CloudPairing");
  __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v33 = v4;
    __int16 v34 = 2112;
    uint64_t v35 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Cloud Devices for peripheral: %@ - %@",  buf,  0x16u);
  }

  id v25 = [v6 copy];
  return v25;
}

- (id)_fetchCloudPairingIdentifierForPeripheral:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  dispatch_assert_queue_V2(v5);

  os_log_t v6 = sub_100060178("CloudPairing");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v30 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Find cloud pairing identifier for peripheral: %@",  buf,  0xCu);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDevice]);
        os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 nsuuid]);
        unsigned int v16 = [v15 isEqual:v4];

        if (v16)
        {
          os_log_t v19 = sub_100060178("CloudPairing");
          os_log_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDevice]);
            int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
            *(_DWORD *)__int128 buf = 138412546;
            id v30 = v4;
            __int16 v31 = 2112;
            uint64_t v32 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Found cloud pairing identifier for peripheral: %@ as %@",  buf,  0x16u);
          }

          os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDevice]);
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);

          goto LABEL_17;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  os_log_t v17 = sub_100060178("CloudPairing");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v30 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "No cloud pairing identifier FOUND for peripheral: %@",  buf,  0xCu);
  }

  unsigned int v18 = 0LL;
LABEL_17:

  return v18;
}

- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100060178("CloudPairing");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Find cloud pairing identifier for peripheral: %@",  buf,  0xCu);
  }

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E9BC;
  block[3] = &unk_100206220;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)fetchIDSDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005EAA0;
  v7[3] = &unk_100205FB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (int64_t)totalCloudDeviceCount
{
  return self->_totalCloudDeviceCount;
}

- (void)setTotalCloudDeviceCount:(int64_t)a3
{
  self->_totalCloudDeviceCount = a3;
}

- (NSMutableDictionary)CPAddressMapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCPAddressMapping:(id)a3
{
}

- (BTStateWatcher)buddyStateWatcher
{
  return self->_buddyStateWatcher;
}

- (void)setBuddyStateWatcher:(id)a3
{
}

- (BTStateWatcher)firstUnlockStateWatcher
{
  return self->_firstUnlockStateWatcher;
}

- (void)setFirstUnlockStateWatcher:(id)a3
{
}

- (IDSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (void)setCloudIdentifier:(id)a3
{
}

- (NSString)publicAddress
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setPublicAddress:(id)a3
{
}

- (NSString)localDeviceName
{
  return self->_localDeviceName;
}

- (void)setLocalDeviceName:(id)a3
{
}

- (NSArray)requestedKeyTypes
{
  return self->_requestedKeyTypes;
}

- (void)setRequestedKeyTypes:(id)a3
{
}

- (NSMutableArray)cloudDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCloudDevices:(id)a3
{
}

- (NSArray)associatedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setAssociatedDevices:(id)a3
{
}

- (NSMutableSet)unpairedIDSCloudIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setUnpairedIDSCloudIdentifiers:(id)a3
{
}

- (BOOL)processingIDSPush
{
  return self->_processingIDSPush;
}

- (void)setProcessingIDSPush:(BOOL)a3
{
  self->_processingIDSPush = a3;
}

- (OS_dispatch_queue)cloudPairingQueue
{
  return self->_cloudPairingQueue;
}

- (void)setCloudPairingQueue:(id)a3
{
}

- (NSString)localDeviceRandomAddress
{
  return self->_localDeviceRandomAddress;
}

- (void)setLocalDeviceRandomAddress:(id)a3
{
}

- (BOOL)supportsVirtualAddress
{
  return self->_supportsVirtualAddress;
}

- (void)setSupportsVirtualAddress:(BOOL)a3
{
  self->_supportsVirtualAddress = a3;
}

- (NSMutableDictionary)messageIdentifiersWaitingForAck
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setMessageIdentifiersWaitingForAck:(id)a3
{
}

- (void).cxx_destruct
{
}

@end