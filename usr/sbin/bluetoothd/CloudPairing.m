@interface CloudPairing
+ (id)sharedInstance;
- (BOOL)_generateKeys;
- (BOOL)accessibilityHeadTrackingEnabled;
- (BOOL)generateKeys;
- (BOOL)getAccountStatus;
- (BOOL)handleXPCUnpairCommand:(id)a3;
- (BOOL)iCloudSignedIn;
- (BOOL)isRunningInRecovery;
- (BOOL)multipleAdvInitialized;
- (BOOL)supportsVirtualAddress;
- (BTCloudServicesClient)cloudClient;
- (CloudPairing)init;
- (NSArray)associatedDevices;
- (NSArray)cloudLocalUUIDs;
- (NSArray)cloudidsIdentifiers;
- (NSArray)requestedKeyTypes;
- (NSMutableArray)cloudDevices;
- (NSMutableArray)cloudUploadedKeys;
- (NSMutableDictionary)idsMultiUsersDictionary;
- (NSString)currentIDSUser;
- (NSString)currentUserRandomAddress;
- (NSString)localDeviceName;
- (NSString)publicAddress;
- (OS_dispatch_queue)serialQueue;
- (OS_xpc_object)serverConnection;
- (id)_generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6;
- (id)_getPairedDeviceForIDSIdentifier:(id)a3;
- (id)createBluetoothAddressForIDSLocalDevice:(id)a3;
- (id)deviceName;
- (id)generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6;
- (id)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5;
- (id)getIRKForRandomStaticAddress:(id)a3;
- (id)getPairedDeviceForIDSIdentifier:(id)a3;
- (id)readUserPreference:(id)a3;
- (unint64_t)keyLength;
- (void)_handleConnectionEvent:(id)a3;
- (void)_handleMsg:(id)a3;
- (void)cloudpairdMsg:(id)a3 args:(id)a4;
- (void)cloudpairdReplyMsg:(id)a3 args:(id)a4;
- (void)fetchManateeStatus;
- (void)fetchSoundProfile;
- (void)launchCloudPair;
- (void)multipleAdvInstancesInitialized:(BOOL)a3;
- (void)printDebug;
- (void)registerWithCloudPairedDevices:(id)a3 identifiers:(id)a4;
- (void)removeuserPreference:(id)a3 sync:(BOOL)a4;
- (void)resetDataForIDSLocalDevice:(id)a3;
- (void)resetServerConnection;
- (void)sendCloudKitPush;
- (void)sendCloudpairingRetry:(id)a3;
- (void)setAccessibilityHeadTrackingEnabled:(BOOL)a3;
- (void)setAssociatedDevices:(id)a3;
- (void)setCloudDevices:(id)a3;
- (void)setCloudUploadedKeys:(id)a3;
- (void)setCurrentIDSUser:(id)a3;
- (void)setCurrentUserRandomAddress:(id)a3;
- (void)setICloudSignedIn:(BOOL)a3;
- (void)setIdsMultiUsersDictionary:(id)a3;
- (void)setLocalDeviceName:(id)a3;
- (void)setMultipleAdvInitialized:(BOOL)a3;
- (void)setPublicAddress:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setSupportsVirtualAddress:(BOOL)a3;
- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5;
- (void)startUpServices;
- (void)updateCurrentIDSUserInfo:(id)a3;
- (void)updateRandomAddressContinuityAdvInstance:(id)a3;
@end

@implementation CloudPairing

+ (id)sharedInstance
{
  if (qword_1008F1060 != -1) {
    dispatch_once(&qword_1008F1060, &stru_10089A230);
  }
  return (id)qword_1008F1058;
}

- (BTCloudServicesClient)cloudClient
{
  if (qword_1008F1070 != -1) {
    dispatch_once(&qword_1008F1070, &stru_10089A250);
  }
  return (BTCloudServicesClient *)(id)qword_1008F1068;
}

- (CloudPairing)init
{
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___CloudPairing;
  v2 = -[CloudPairing init](&v49, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_31:
    v37 = v3;
    goto LABEL_32;
  }

  v4 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CloudPairing init", buf, 2u);
  }

  if ((MGGetBoolAnswer(@"bluetooth-le") & 1) != 0)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    cloudLocalUUIDs = v2->_cloudLocalUUIDs;
    v2->_cloudLocalUUIDs = (NSArray *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    cloudidsIdentifiers = v2->_cloudidsIdentifiers;
    v2->_cloudidsIdentifiers = (NSArray *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, -1);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.bluetoothd.cloudpairing.serial", v12);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v13;

    v15 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"EncryptionKeys",  @"IdentityKeys",  0LL);
    requestedKeyTypes = v2->_requestedKeyTypes;
    v2->_requestedKeyTypes = v15;

    v2->_keyLength = 16LL;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[CloudPairing deviceName](v2, "deviceName"));
    localDeviceName = v2->_localDeviceName;
    v2->_localDeviceName = (NSString *)v17;

    if (!v2->_localDeviceName)
    {
      v2->_localDeviceName = (NSString *)@"iOS Device";

      v19 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100683388((uint64_t)-[NSString UTF8String](v2->_localDeviceName, "UTF8String"), (uint64_t)v52, v19);
      }
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    cloudDevices = v2->_cloudDevices;
    v2->_cloudDevices = (NSMutableArray *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    cloudUploadedKeys = v2->_cloudUploadedKeys;
    v2->_cloudUploadedKeys = (NSMutableArray *)v22;

    __int16 v48 = 0;
    int v47 = 0;
    uint64_t v24 = sub_1002E6B38();
    if (!(*(unsigned int (**)(uint64_t, int *))(*(void *)v24 + 32LL))(v24, &v47))
    {
      v25 = objc_alloc(&OBJC_CLASS___NSString);
      sub_1003FE1B4((unsigned __int8 *)&v47, buf);
      v26 = v51 >= 0 ? buf : *(uint8_t **)buf;
      v27 = -[NSString initWithUTF8String:](v25, "initWithUTF8String:", v26);
      publicAddress = v3->_publicAddress;
      v3->_publicAddress = v27;

      if (v51 < 0) {
        operator delete(*(void **)buf);
      }
    }

    if (v3->_publicAddress)
    {
      *(_WORD *)&v3->_keysGenerated = 0;
      -[CloudPairing setServerConnection:](v3, "setServerConnection:", 0LL);
      v3->_needsCloudKitPush = 0;
      v3->_updatingCloudKit = 0;
      v3->_supportsVirtualAddress = 0;
      idsMultiUsersDictionary = v3->_idsMultiUsersDictionary;
      v3->_idsMultiUsersDictionary = 0LL;

      currentIDSUser = v3->_currentIDSUser;
      v3->_currentIDSUser = 0LL;

      currentUserRandomAddress = v3->_currentUserRandomAddress;
      v3->_currentUserRandomAddress = 0LL;

      v3->_multipleAdvInitialized = 0;
      id v32 = -[CloudPairing cloudClient](v3, "cloudClient");
      char v46 = 0;
      uint64_t v33 = sub_1002E8D54();
      (*(void (**)(uint64_t, char *))(*(void *)v33 + 104LL))(v33, &v46);
      if (v46)
      {
        v34 = (os_log_s *)(id)qword_1008F7588;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = MKBDeviceUnlockedSinceBoot();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Already first unlocked: %d", buf, 8u);
        }

        -[CloudPairing startUpServices](v3, "startUpServices");
      }

      else
      {
        int out_token = -1;
        *(void *)buf = 0LL;
        objc_initWeak((id *)buf, v3);
        v38 = (dispatch_queue_s *)*(id *)(sub_100404EB8() + 8);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_1004794A0;
        handler[3] = &unk_10089A2B8;
        objc_copyWeak(&v44, (id *)buf);
        uint32_t v39 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v38, handler);

        v40 = (os_log_s *)qword_1008F7588;
        if (v39)
        {
          if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
            sub_100683328();
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Successfully registered for MKB first unlock notification",  v42,  2u);
        }

        objc_destroyWeak(&v44);
        objc_destroyWeak((id *)buf);
      }

      goto LABEL_31;
    }

    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_FAULT)) {
      sub_1006832F0();
    }
  }

  else
  {
    v36 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "CloudPairing not supported on this platform (LE)",  buf,  2u);
    }
  }

  v37 = 0LL;
LABEL_32:

  return v37;
}

- (void)startUpServices
{
  uint64_t v3 = sub_1002E9258();
  (*(void (**)(uint64_t))(*(void *)v3 + 200LL))(v3);
  if (_os_feature_enabled_impl("BluetoothFeatures", "CustomHRTFSupport") && sub_100487F48())
  {
    self->_cloudSoundProfileChangedNotifyToken = -1;
    v4 = (const char *)[BTCloudSoundProfileChangedNotification UTF8String];
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100479714;
    handler[3] = &unk_10087EA70;
    void handler[4] = self;
    uint32_t v6 = notify_register_dispatch(v4, &self->_cloudSoundProfileChangedNotifyToken, serialQueue, handler);
    uint64_t v7 = (os_log_s *)qword_1008F7588;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v11 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "BTAudioCloudSyncMonitor: Failed registration for CloudSoundProfileChangedNotification with error : %u",  buf,  8u);
      }
    }

    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "BTAudioCloudSyncMonitor: Successfully registered for CloudSoundProfileChangedNotification",  buf,  2u);
      }

      -[CloudPairing fetchSoundProfile](self, "fetchSoundProfile");
    }
  }

- (void)multipleAdvInstancesInitialized:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008F7588;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = -[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    v11[0] = 67109634;
    v11[1] = v3;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MUC - multiple adv instances initialized? %d, stored %d, RSA %@",  (uint8_t *)v11,  0x18u);
  }

  if (-[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized") != v3)
  {
    -[CloudPairing setMultipleAdvInitialized:](self, "setMultipleAdvInitialized:", v3);
    if (-[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized"))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
      BOOL v9 = v8 == 0LL;

      if (!v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
        -[CloudPairing updateRandomAddressContinuityAdvInstance:]( self,  "updateRandomAddressContinuityAdvInstance:",  v10);
      }
    }
  }

- (id)deviceName
{
  return (id)MGCopyAnswer(@"UserAssignedDeviceName", 0LL);
}

- (BOOL)isRunningInRecovery
{
  return 0;
}

- (BOOL)generateKeys
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  uint64_t v3 = sub_100404FE8();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1004799D4;
  v5[3] = &unk_10088FE88;
  v5[4] = self;
  v5[5] = &v6;
  sub_100405550(v3, v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)_generateKeys
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_10089A478);
  }
  uint64_t v3 = sub_100619AA8(qword_1008D5F18);
  if ((v3 & 1) == 0)
  {
    if (qword_1008D5F20 != -1) {
      dispatch_once(&qword_1008D5F20, &stru_10089A478);
    }
    uint64_t v3 = sub_100619F1C(qword_1008D5F18);
  }

  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_10089A478);
  }
  *(_OWORD *)self->_encryptionRootKey = *(_OWORD *)(qword_1008D5F18 + 168);
  *(_OWORD *)self->_identityResolvingKey = *(_OWORD *)(qword_1008D5F18 + 184);
  uint64_t v5 = (_OWORD *)(qword_1008D5F18 + 312);
  __int128 v6 = *(_OWORD *)(qword_1008D5F18 + 328);
  *(_OWORD *)self->_cloudPrivateKey = *(_OWORD *)(qword_1008D5F18 + 312);
  *(_OWORD *)&self->_cloudPrivateKey[16] = v6;
  __int128 v7 = v5[4];
  __int128 v8 = v5[5];
  __int128 v9 = v5[3];
  *(_OWORD *)&self->_cloudPrivateKey[32] = v5[2];
  *(_OWORD *)&self->_cloudPrivateKey[80] = v8;
  *(_OWORD *)&self->_cloudPrivateKey[64] = v7;
  *(_OWORD *)&self->_cloudPrivateKey[48] = v9;
  __int128 v10 = *(_OWORD *)(qword_1008D5F18 + 264);
  __int128 v11 = *(_OWORD *)(qword_1008D5F18 + 280);
  __int128 v12 = *(_OWORD *)(qword_1008D5F18 + 296);
  *(_OWORD *)self->_cloudPublicKey = *(_OWORD *)(qword_1008D5F18 + 248);
  *(_OWORD *)&self->_cloudPublicKey[48] = v12;
  *(_OWORD *)&self->_cloudPublicKey[32] = v11;
  *(_OWORD *)&self->_cloudPublicKey[16] = v10;
  *(_OWORD *)self->_cloudNonce = *(_OWORD *)(qword_1008D5F18 + 408);
  if (IsAppleInternalBuild(v3, v4))
  {
    unsigned int v13 = (os_log_s *)(id)qword_1008F7588;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  self->_cloudPrivateKey,  96LL));
      int v21 = 138412290;
      uint64_t v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "_cloudPrivateKey: [ %@ ]",  (uint8_t *)&v21,  0xCu);
    }

    v15 = (os_log_s *)(id)qword_1008F7588;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  self->_cloudPublicKey,  64LL));
      int v21 = 138412290;
      uint64_t v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "_cloudPublicKey: [ %@ ]",  (uint8_t *)&v21,  0xCu);
    }

    uint64_t v17 = (os_log_s *)(id)qword_1008F7588;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  self->_cloudNonce,  16LL));
      int v21 = 138412290;
      uint64_t v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_cloudNonce: [ %@ ]", (uint8_t *)&v21, 0xCu);
    }
  }

  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_10089A478);
  }
  int v19 = sub_1001115A4((__int128 *)(qword_1008D5F18 + 136), 3, 0, self->_diversifierHidingKey);
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_FAULT)) {
      sub_1006833C4();
    }
  }

  else
  {
    self->_keysGenerated = 1;
  }

  return v19 == 0;
}

- (void)_handleConnectionEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (v4 != &_xpc_error_connection_invalid)
    {
      *(void *)buf = 0LL;
      objc_initWeak((id *)buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100479FF4;
      handler[3] = &unk_10089A2E0;
      objc_copyWeak(&v16, (id *)buf);
      xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
      __int128 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serialQueue](self, "serialQueue"));
      xpc_connection_set_target_queue((xpc_connection_t)v4, v8);

      xpc_connection_resume((xpc_connection_t)v4);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }

    __int128 v11 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
      sub_100683430(v11, v12, v13);
    }
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    BOOL v10 = v14 == 0LL;

    goto LABEL_14;
  }

  __int128 v6 = (os_log_s *)qword_1008F7588;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cloudpairing Unexpected XPC server event: %@",  buf,  0xCu);
    }

    goto LABEL_16;
  }

  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloudpairing XPC server error: %@", buf, 0xCu);
  }

  if (v4 == &_xpc_error_connection_invalid)
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    BOOL v10 = v9 == 0LL;

LABEL_14:
    if (!v10) {
      -[CloudPairing setServerConnection:](self, "setServerConnection:", 0LL);
    }
  }

- (void)_handleMsg:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v4, "kMsgId");
    __int128 v6 = (os_log_s *)(id)qword_1008F7588;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v544[0].__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)string;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cloudpairing got msg: %s",  (uint8_t *)v544,  0xCu);
    }

    xpc_object_t value = xpc_dictionary_get_value(v4, "kMsgArgs");
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    __int128 v9 = v8;
    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
        sub_1006834A4();
      }
      goto LABEL_111;
    }

    if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
    {
      BOOL v10 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        xpc_type_t type = xpc_get_type(v9);
        name = xpc_type_get_name(type);
        sub_1006836CC((uint64_t)name, (uint64_t)v544, v10);
      }

      goto LABEL_111;
    }

    if (!strcmp(string, "manateeUdpateStatus"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kUploadStatus"]);
      BOOL v19 = v18 == 0LL;

      if (!v19)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kUploadStatus"]);
        unsigned int v21 = [v20 BOOLValue];

        if (v21) {
          -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", @"deleteOldContainer", 0LL);
        }
      }

      goto LABEL_110;
    }

    if (!strcmp(string, "SignInStatusChanged"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kSignInStatus"]);
      BOOL v23 = v22 == 0LL;

      if (!v23)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kSignInStatus"]);
        id v25 = [v24 BOOLValue];

        v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kSignInAppleID"]);
        -[CloudPairing setICloudSignedIn:](self, "setICloudSignedIn:", v25);
        uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v26, v27) & 1) == 0)
        {

          v26 = &stru_1008A57D8;
        }

        uint64_t v28 = sub_1002E9258();
        v29 = v26;
        sub_10002418C(v532, (char *)-[__CFString UTF8String](v29, "UTF8String"));
        (*(void (**)(uint64_t, id, void **))(*(void *)v28 + 80LL))(v28, v25, v532);
        if (v533 < 0) {
          operator delete(v532[0]);
        }
      }

      goto LABEL_110;
    }

    if (!strcmp(string, "MasterKeysAvailable"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kMasterKeyBlob"]);
      BOOL v31 = v30 == 0LL;

      if (!v31)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kMasterKeyBlob"]);
        id v33 = [v32 length];
        id v34 = v32;
        id v35 = [v34 bytes];
        uint64_t v36 = sub_1002E9258();
        (*(void (**)(uint64_t, id, id))(*(void *)v36 + 88LL))(v36, v35, v33);
      }

      goto LABEL_110;
    }

    if (!strcmp(string, "MasterKeysNotAvailable"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kMasterKeyBlob"]);
      BOOL v38 = v37 == 0LL;

      if (!v38)
      {
        uint64_t v39 = sub_1002E9258();
        (*(void (**)(uint64_t))(*(void *)v39 + 96LL))(v39);
      }

      goto LABEL_110;
    }

    if (!strcmp(string, "DeviceInfoAvailable"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kDeviceInfoBlob"]);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"loginID"]);
      v550.__r_.__value_.__s.__data_[0] = 0;
      memset(v544, 0, 24);
      if (qword_1008D60C0 != -1) {
        dispatch_once(&qword_1008D60C0, &stru_10089A498);
      }
      sub_1003F6234((uint64_t)off_1008D60B8, &v550, (uint64_t)v544);
      if ([v41 length])
      {
        id v42 = v41;
        if (std::string::compare(v544, (const std::string::value_type *)[v42 UTF8String]))
        {
          v43 = (os_log_s *)qword_1008F7600;
          if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v551[0]) = 138412546;
            *(void **)((char *)v551 + 4) = v42;
            WORD2(v551[1]) = 2112;
            *(void **)((char *)&v551[1] + 6) = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Cloud: Dropping other user's legacy magic info message: %@ - %@",  (uint8_t *)v551,  0x16u);
          }

          goto LABEL_111;
        }
      }

      if (v40)
      {
        id v49 = [v40 length];
        char v51 = (char *)&v452 - ((__chkstk_darwin(v49, v50) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        bzero(v51, (size_t)v49);
        memmove(v51, [v40 bytes], (size_t)v49);
        uint64_t v52 = sub_1002E9258();
        (*(void (**)(uint64_t, char *, id))(*(void *)v52 + 104LL))(v52, v51, v49);
      }

      goto LABEL_110;
    }

    if (!strcmp(string, "DeviceInfoUploadStatus"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kUploadStatus"]);
      BOOL v45 = v44 == 0LL;

      if (!v45)
      {
        char v46 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kUploadStatus"]);
        id v47 = [v46 BOOLValue];

        uint64_t v48 = sub_1002E9258();
        (*(void (**)(uint64_t, id))(*(void *)v48 + 112LL))(v48, v47);
      }

      goto LABEL_110;
    }

    if (!strcmp(string, "ManateeBlobUpdate"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      v53 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kDeviceInfoBlob"]);
      BOOL v54 = v53 == 0LL;

      if (!v54)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kDeviceInfoBlob"]);
        id v56 = [v55 length];
        v58 = (char *)&v452 - ((__chkstk_darwin(v56, v57) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        bzero(v58, (size_t)v56);
        id v59 = v55;
        memmove(v58, [v59 bytes], (size_t)v56);
        uint64_t v60 = sub_1002E9258();
        (*(void (**)(uint64_t, char *, id))(*(void *)v60 + 160LL))(v60, v58, v56);
      }

      goto LABEL_110;
    }

    if (!strcmp(string, "oldContainerDeleted"))
    {
      id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kDeleteSuccess"]);
      BOOL v62 = v61 == 0LL;

      if (v62) {
        goto LABEL_110;
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kDeleteSuccess"]);
      unsigned int v64 = [v63 BOOLValue];

      uint64_t v65 = qword_1008F7588;
      if (!os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_110;
      }
      LODWORD(v544[0].__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(v544[0].__r_.__value_.__r.__words[0]) = v64;
      v66 = "Status for old container deletion %d";
      v67 = (os_log_s *)v65;
      os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
      uint32_t v69 = 8;
    }

    else
    {
      if (!strcmp(string, "forceManateeUpgrade"))
      {
        id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
        v70 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO))
        {
          LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_INFO,  "Process forceManateeUpgrade: %@",  (uint8_t *)v544,  0xCu);
        }

        v71 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kEncryptionSupport"]);
        BOOL v72 = v71 == 0LL;

        if (!v72)
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kEncryptionSupport"]);
          unsigned int v74 = [v73 BOOLValue];

          if (v74)
          {
            uint64_t v75 = sub_1002E9258();
            (*(void (**)(uint64_t, uint64_t))(*(void *)v75 + 136LL))(v75, 1LL);
          }
        }

        goto LABEL_110;
      }

      if (!strcmp(string, "GenerateCloudPairingKeys"))
      {
        v76 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO))
        {
          LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_INFO,  "Process GenerateCloudPairingKeys",  (uint8_t *)v544,  2u);
        }

        id v17 = (id)_CFXPCCreateCFObjectFromXPCObject(v9);
        *(void *)&__int128 v480 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCloudPairingKeyTypes"]);
        v77 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCloudPairingKeyLength"]);
        id v78 = [v77 unsignedIntegerValue];

        v79 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"kLocalRandomAddress"]);
        v80 = (void *)objc_claimAutoreleasedReturnValue( -[CloudPairing generateKeyDictForTypes:keyLength:forAddress:]( self,  "generateKeyDictForTypes:keyLength:forAddress:",  (void)v480,  v78,  v79));
        v81 = (os_log_s *)(id)qword_1008F7588;
        BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_INFO);
        if (v82)
        {
          int v84 = IsAppleInternalBuild(v82, v83);
          v85 = v80;
          if (!v84) {
            v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v80 count]));
          }
          LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v85;
          _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_INFO,  "Replying GenerateCloudPairingKeys: %@",  (uint8_t *)v544,  0xCu);
          if (!v84) {
        }
          }

        -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v80);
        goto LABEL_110;
      }

      if (!strcmp(string, "CloudPairingComplete"))
      {
        id v17 = (id)_CFXPCCreateCFObjectFromXPCObject(v9);
        uint64_t v86 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCloudPairingCompleteResponse"]);
        uint64_t v87 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCloudPairingLocalKeys"]);
        *(void *)&__int128 v479 = v87;
        *(void *)&__int128 v480 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCloudDeviceUniqueID"]);
        v88 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCloudPairingProtocolID"]);
        v89 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
          _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "MUC - Args for CloudPairingComplete: %@",  (uint8_t *)v544,  0xCu);
        }

        v90 = (void *)objc_claimAutoreleasedReturnValue( -[CloudPairing generateCloudPairingIDWithResponse:localKeys:from:forProtocolID:]( self,  "generateCloudPairingIDWithResponse:localKeys:from:forProtocolID:",  v86,  v87,  (void)v480,  v88));
        v91 = (os_log_s *)qword_1008F7588;
        v92 = (void *)v86;
        if (v90)
        {
          if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v90;
            _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "Got pairingID: %@",  (uint8_t *)v544,  0xCu);
          }

          v560 = @"kCloudPairingID";
          v93 = (void *)objc_claimAutoreleasedReturnValue([v90 UUIDString]);
          v561 = v93;
          v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v561,  &v560,  1LL));
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v94);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
            sub_1006834D0();
          }
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, &__NSDictionary0__struct);
        }

        goto LABEL_110;
      }

      if (!strcmp(string, "UnpairCloudDevice"))
      {
        v95 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO))
        {
          LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "Process UnpairCloudDevice",  (uint8_t *)v544,  2u);
        }

        v96 = (void *)_CFXPCCreateCFObjectFromXPCObject(v9);
        v544[0].__r_.__value_.__r.__words[0] = 0LL;
        v544[0].__r_.__value_.__l.__size_ = (std::string::size_type)v544;
        v544[0].__r_.__value_.__l.__cap_ = 0x2020000000LL;
        v544[1].__r_.__value_.__s.__data_[0] = 0;
        uint64_t v97 = sub_100404FE8();
        v529[0] = _NSConcreteStackBlock;
        v529[1] = 3221225472LL;
        v529[2] = sub_100480468;
        v529[3] = &unk_10089A308;
        v531 = v544;
        v529[4] = self;
        id v17 = v96;
        id v530 = v17;
        sub_100405550(v97, v529);
        v558 = @"kSuccess";
        v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(v544[0].__r_.__value_.__l.__size_ + 24)));
        v559 = v98;
        v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v559,  &v558,  1LL));
        -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v99);

        v100 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO))
        {
          LOWORD(v551[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_INFO,  "Replying UnpairCloudDevice",  (uint8_t *)v551,  2u);
        }

        _Block_object_dispose(v544, 8);
        goto LABEL_110;
      }

      if (!strcmp(string, "FetchPublicAddress"))
      {
        v101 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO))
        {
          LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_INFO,  "Process FetchPublicAddress",  (uint8_t *)v544,  2u);
        }

        v102 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
        BOOL v103 = v102 == 0LL;

        if (v103)
        {
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, &__NSDictionary0__struct);
        }

        else
        {
          v556 = @"kPublicAddress";
          v104 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
          v557 = v104;
          v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v557,  &v556,  1LL));
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v105);
        }

        id v17 = (id)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
        {
          v119 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
          LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v119;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_INFO,  "Replying FetchPublicAddress: %@",  (uint8_t *)v544,  0xCu);
        }

        goto LABEL_110;
      }

      if (strcmp(string, "RemoveCloudPairedDevice"))
      {
        if (!strcmp(string, "RemoveStaleLEPairedDevice"))
        {
          id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
          v113 = (os_log_s *)qword_1008F7588;
          if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
            _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_DEFAULT,  "MUC - Process RemoveCloudPairedDevice: %@",  (uint8_t *)v544,  0xCu);
          }

          v114 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCloudDeviceID"]);
          if (v114 && (uint64_t v115 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v114, v115) & 1) != 0))
          {
            v116 = (os_log_s *)qword_1008F7588;
            if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
              *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v114;
              _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "MUC - Removing Stale CloudPairedDevice: %@",  (uint8_t *)v544,  0xCu);
            }

            v117 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v114);
            if (v117)
            {
              uint64_t v118 = sub_100404FE8();
              v525[0] = _NSConcreteStackBlock;
              v525[1] = 3221225472LL;
              v525[2] = sub_100480540;
              v525[3] = &unk_10087EA48;
              v526 = v117;
              sub_100405384(v118, v525);
            }

            else if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR))
            {
              sub_100683560();
            }
          }

          else if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR))
          {
            sub_1006834FC();
          }

          goto LABEL_110;
        }

        if (!strcmp(string, "checkIn"))
        {
          v134 = (os_log_s *)qword_1008F7588;
          if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO))
          {
            LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
            _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_INFO, "Process checkIn", (uint8_t *)v544, 2u);
          }

          id v17 = (id)_CFXPCCreateCFObjectFromXPCObject(v9);
          v135 = (os_log_s *)qword_1008F7588;
          if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO))
          {
            LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
            _os_log_impl( (void *)&_mh_execute_header,  v135,  OS_LOG_TYPE_INFO,  "Process checkIn: %@",  (uint8_t *)v544,  0xCu);
          }

          v136 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kCheckInVersion"]);
          v137 = v136;
          if (v136)
          {
            if (([v136 isEqualToNumber:&off_1008C2B70] & 1) == 0)
            {
              v138 = (os_log_s *)qword_1008F7588;
              if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_FAULT)) {
                sub_1006835C4((uint64_t)v137, v138);
              }
            }

            v139 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kIDSLocalDeviceUniqueID"]);
            uint64_t v140 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v139, v140) & 1) != 0) {
              *(void *)&__int128 v480 = objc_claimAutoreleasedReturnValue([v17 objectForKey:@"kIDSLocalDeviceUniqueID"]);
            }
            else {
              *(void *)&__int128 v480 = 0LL;
            }

            *(void *)&__int128 v479 = objc_claimAutoreleasedReturnValue( -[CloudPairing getPairedDeviceForIDSIdentifier:]( self,  "getPairedDeviceForIDSIdentifier:",  (void)v480));
            v141 = (os_log_s *)qword_1008F7588;
            if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412546;
              *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = v479;
              WORD2(v544[0].__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&v544[0].__r_.__value_.__r.__words[1] + 6) = v480;
              _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_DEFAULT,  "MUC - sending BTUUID-IDS device mapping %@ for local IDS %@",  (uint8_t *)v544,  0x16u);
            }

            v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            v143 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
            BOOL v144 = v143 == 0LL;

            if (!v144)
            {
              v145 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
              [v142 setObject:v145 forKey:@"kPublicAddress"];
            }

            v146 = (os_log_s *)(id)qword_1008F7588;
            if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
            {
              v147 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
              LODWORD(v544[0].__r_.__value_.__l.__data_) = 138412290;
              *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v147;
              _os_log_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_INFO,  "Check in replying with Public Address: %@",  (uint8_t *)v544,  0xCu);
            }

            [v142 setObject:(void)v479 forKey:@"kCachedLEDevices"];
            [v142 setObject:&off_1008C2B70 forKey:@"kCheckInVersion"];
            -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v142);
          }

          goto LABEL_110;
        }

        if (!strcmp(string, "AllDevicesRemovedWithRecords") || !strcmp(string, "DevicesRemovedWithRecords"))
        {
          id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
          v121 = (os_log_s *)qword_1008F7600;
          if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "Devices majestic info removed",  (uint8_t *)v544,  2u);
          }

          if (sub_1002E9258() && v17)
          {
            *(void *)&__int128 v480 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"devices"]);
            uint64_t v122 = objc_opt_class(&OBJC_CLASS___NSData);
            if ((objc_opt_isKindOfClass(v480, v122) & 1) != 0)
            {
              v555[0] = objc_opt_class(&OBJC_CLASS___NSArray);
              v555[1] = objc_opt_class(&OBJC_CLASS___NSString);
              v555[2] = objc_opt_class(&OBJC_CLASS___BTCloudDevice);
              v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v555,  3LL));
              v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v123));
              *(void *)&__int128 v479 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v124,  (void)v480,  0LL));

              if ((void)v479)
              {
                uint64_t v125 = objc_opt_class(&OBJC_CLASS___NSArray);
                if ((objc_opt_isKindOfClass(v479, v125) & 1) != 0)
                {
                  __int128 v524 = 0u;
                  __int128 v523 = 0u;
                  __int128 v521 = 0u;
                  __int128 v522 = 0u;
                  id v126 = (id)v479;
                  id v127 = [v126 countByEnumeratingWithState:&v521 objects:v554 count:16];
                  if (v127)
                  {
                    uint64_t v128 = *(void *)v522;
                    do
                    {
                      for (i = 0LL; i != v127; i = (char *)i + 1)
                      {
                        if (*(void *)v522 != v128) {
                          objc_enumerationMutation(v126);
                        }
                        v130 = *(void **)(*((void *)&v521 + 1) + 8LL * (void)i);
                        uint64_t v131 = objc_opt_class(&OBJC_CLASS___BTCloudDevice);
                        if ((objc_opt_isKindOfClass(v130, v131) & 1) != 0)
                        {
                          uint64_t v132 = sub_1002E9258();
                          id v133 = objc_claimAutoreleasedReturnValue([v130 bluetoothAddress]);
                          sub_10002418C(v519, (char *)[v133 UTF8String]);
                          (*(void (**)(uint64_t, void **))(*(void *)v132 + 184LL))(v132, v519);
                          if (v520 < 0) {
                            operator delete(v519[0]);
                          }
                        }
                      }

                      id v127 = [v126 countByEnumeratingWithState:&v521 objects:v554 count:16];
                    }

                    while (v127);
                  }
                }
              }
            }
          }

          goto LABEL_110;
        }

        if (strcmp(string, "DevicesUpdatedWithRecords"))
        {
          if (!strcmp(string, "AllDeviceSupportInformationRecordsRemoved")
            || !strcmp(string, "DeviceSupportInformationRecordsRemoved"))
          {
            id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
            v148 = (os_log_s *)qword_1008F7600;
            if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v148,  OS_LOG_TYPE_DEFAULT,  "Devices support info removed",  (uint8_t *)v544,  2u);
            }

            if (sub_1002E9258() && v17)
            {
              *(void *)&__int128 v479 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"records"]);
              uint64_t v149 = objc_opt_class(&OBJC_CLASS___NSData);
              if ((objc_opt_isKindOfClass(v479, v149) & 1) != 0)
              {
                v549[0] = objc_opt_class(&OBJC_CLASS___NSArray);
                v549[1] = objc_opt_class(&OBJC_CLASS___NSString);
                v549[2] = objc_opt_class(&OBJC_CLASS___BTCloudDeviceSupportInformation);
                v150 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v549,  3LL));
                v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v150));
                *(void *)&__int128 v478 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v151,  (void)v479,  0LL));

                if ((void)v478)
                {
                  uint64_t v152 = objc_opt_class(&OBJC_CLASS___NSArray);
                  if ((objc_opt_isKindOfClass(v478, v152) & 1) != 0)
                  {
                    __int128 v509 = 0u;
                    __int128 v510 = 0u;
                    __int128 v507 = 0u;
                    __int128 v508 = 0u;
                    id v153 = (id)v478;
                    id v154 = [v153 countByEnumeratingWithState:&v507 objects:v548 count:16];
                    if (v154)
                    {
                      uint64_t v156 = *(void *)v508;
                      *(void *)&__int128 v155 = 138412290LL;
                      __int128 v480 = v155;
                      do
                      {
                        for (j = 0LL; j != v154; j = (char *)j + 1)
                        {
                          if (*(void *)v508 != v156) {
                            objc_enumerationMutation(v153);
                          }
                          std::string::size_type v158 = *(void *)(*((void *)&v507 + 1) + 8LL * (void)j);
                          uint64_t v159 = objc_opt_class(&OBJC_CLASS___BTCloudDeviceSupportInformation);
                          if ((objc_opt_isKindOfClass(v158, v159) & 1) != 0)
                          {
                            v160 = (os_log_s *)qword_1008F7600;
                            if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
                            {
                              LODWORD(v544[0].__r_.__value_.__l.__data_) = v480;
                              *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = v158;
                              _os_log_impl( (void *)&_mh_execute_header,  v160,  OS_LOG_TYPE_DEFAULT,  "Device Support Info to be removed: %@",  (uint8_t *)v544,  0xCu);
                            }
                          }
                        }

                        id v154 = [v153 countByEnumeratingWithState:&v507 objects:v548 count:16];
                      }

                      while (v154);
                    }
                  }
                }
              }
            }

            goto LABEL_110;
          }

          if (strcmp(string, "DeviceSupportInformationRecordsUpdated"))
          {
            if (strcmp(string, "MagicPairingRecordsRemoved"))
            {
              if (strcmp(string, "MagicPairingRecordsUpdated"))
              {
                if (!strcmp(string, "ManateeIdentityLost"))
                {
                  v450 = (os_log_s *)qword_1008F7600;
                  if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v450,  OS_LOG_TYPE_DEFAULT,  "ManateeIdentityLost in cloudkit. Push local data again to resync.",  (uint8_t *)v544,  2u);
                  }

                  if (sub_1002E9258())
                  {
                    uint64_t v451 = sub_1002E9258();
                    (*(void (**)(uint64_t))(*(void *)v451 + 192LL))(v451);
                  }
                }

                else if (!strcmp(string, "OnlineStatusChanged"))
                {
                  BOOL v13 = xpc_dictionary_get_BOOL(v9, "kOnlineStatus");
                  if (sub_1002E9258())
                  {
                    __int16 v14 = (os_log_s *)qword_1008F7600;
                    if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
                    {
                      v15 = "no";
                      if (v13) {
                        v15 = "yes";
                      }
                      LODWORD(v544[0].__r_.__value_.__l.__data_) = 136315138;
                      *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
                      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Network changed to %s. Push local data if any to cloud.",  (uint8_t *)v544,  0xCu);
                    }

                    uint64_t v16 = sub_1002E9258();
                    (*(void (**)(uint64_t, BOOL))(*(void *)v16 + 72LL))(v16, v13);
                  }
                }

                goto LABEL_111;
              }

              id v17 = (id)_CFXPCCreateCFObjectFromXPCMessage(v9);
              v262 = (os_log_s *)(id)qword_1008F7600;
              if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
              {
                id v263 = objc_claimAutoreleasedReturnValue([v17 debugDescription]);
                id v264 = [v263 UTF8String];
                LODWORD(v544[0].__r_.__value_.__l.__data_) = 136446210;
                *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v264;
                _os_log_impl( (void *)&_mh_execute_header,  v262,  OS_LOG_TYPE_DEFAULT,  "Devices magic info updated from cloudkit = %{public}s",  (uint8_t *)v544,  0xCu);
              }

              if (qword_1008D60C0 != -1) {
                dispatch_once(&qword_1008D60C0, &stru_10089A498);
              }
              if (sub_1003ECFD0() && sub_1002E9258())
              {
                unsigned int v265 = -[CloudPairing iCloudSignedIn](self, "iCloudSignedIn");
                unsigned int v266 = v17 ? v265 : 0;
                if (v266 == 1)
                {
                  id v468 = (id)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"records"]);
                  uint64_t v267 = objc_opt_class(&OBJC_CLASS___NSData);
                  if ((objc_opt_isKindOfClass(v468, v267) & 1) != 0)
                  {
                    v541[0] = objc_opt_class(&OBJC_CLASS___NSArray);
                    v541[1] = objc_opt_class(&OBJC_CLASS___NSString);
                    v541[2] = objc_opt_class(&OBJC_CLASS___BTMagicPairingSettings);
                    v268 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v541,  3LL));
                    v269 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v268));
                    id v463 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v269,  v468,  0LL));

                    if (v463)
                    {
                      uint64_t v270 = objc_opt_class(&OBJC_CLASS___NSArray);
                      if ((objc_opt_isKindOfClass(v463, v270) & 1) != 0)
                      {
                        __int128 v494 = 0u;
                        __int128 v495 = 0u;
                        __int128 v492 = 0u;
                        __int128 v493 = 0u;
                        *(void *)&__int128 v475 = v463;
                        v477 = (std::string *)[(id)v475 countByEnumeratingWithState:&v492 objects:v540 count:16];
                        if (!v477) {
                          goto LABEL_734;
                        }
                        *(void *)&__int128 v473 = v489;
                        *(void *)&__int128 v476 = *(void *)v493;
                        *(void *)&__int128 v271 = 138412290LL;
                        __int128 v474 = v271;
                        *(void *)&__int128 v271 = 67110146LL;
                        __int128 v472 = v271;
                        *(void *)&__int128 v271 = 67109890LL;
                        __int128 v470 = v271;
                        *(void *)&__int128 v271 = 136315138LL;
                        __int128 v467 = v271;
                        *(void *)&__int128 v271 = 136446210LL;
                        __int128 v461 = v271;
                        *(void *)&__int128 v271 = 68158466LL;
                        __int128 v454 = v271;
                        *(void *)&__int128 v271 = 68158722LL;
                        __int128 v453 = v271;
                        *(void *)&__int128 v271 = 67109120LL;
                        __int128 v458 = v271;
                        *(void *)&__int128 v271 = 136446722LL;
                        __int128 v457 = v271;
                        *(void *)&__int128 v271 = 136446466LL;
                        __int128 v455 = v271;
                        *(void *)&__int128 v271 = 67109376LL;
                        __int128 v452 = v271;
                        *(void *)&__int128 v271 = 136315394LL;
                        __int128 v469 = v271;
                        *(void *)&__int128 v271 = 136315650LL;
                        __int128 v465 = v271;
                        *(void *)&__int128 v271 = 136446467LL;
                        __int128 v471 = v271;
                        while (1)
                        {
                          *(void *)&__int128 v479 = 0LL;
                          do
                          {
                            if (*(void *)v493 != (void)v476) {
                              objc_enumerationMutation((id)v475);
                            }
                            *(void *)&__int128 v480 = *(void *)(*((void *)&v492 + 1) + 8 * v479);
                            uint64_t v272 = objc_opt_class(&OBJC_CLASS___BTMagicPairingSettings);
                            if ((objc_opt_isKindOfClass(v480, v272) & 1) != 0)
                            {
                              v273 = (os_log_s *)(id)qword_1008F7600;
                              if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
                              {
                                LODWORD(v544[0].__r_.__value_.__l.__data_) = v474;
                                *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = v480;
                                _os_log_impl( (void *)&_mh_execute_header,  v273,  OS_LOG_TYPE_DEFAULT,  "Cloud: Device magic pairing records to be updated: %@",  (uint8_t *)v544,  0xCu);
                              }

                              __int16 v491 = 0;
                              unsigned int v490 = 0;
                              memset(v551, 0, sizeof(v551));
                              id v274 = objc_claimAutoreleasedReturnValue([(id) v480 bluetoothAddress]);
                              sub_10002418C(v551, (char *)[v274 UTF8String]);

                              if (SHIBYTE(v551[2]) >= 0) {
                                v275 = (unsigned __int8 *)v551;
                              }
                              else {
                                v275 = (unsigned __int8 *)v551[0];
                              }
                              if (sub_1003FE1A4((uint64_t)&v490, v275))
                              {
                                if ((_BYTE)v490)
                                {
LABEL_416:
                                  if (qword_1008D5F50 != -1) {
                                    dispatch_once(&qword_1008D5F50, &stru_10089A4B8);
                                  }
                                  *(void *)&__int128 v478 = sub_1003FFEB0(off_1008D5F48, (uint64_t)&v490, 1);
                                  int v487 = 1;
                                  unsigned int v486 = 0;
                                  uint64_t v485 = 0LL;
                                  sub_1003D55EC(v478, &v485, &v486, (_DWORD *)&v485 + 1, &v487);
                                  v276 = (os_log_s *)(id)qword_1008F7600;
                                  if (os_log_type_enabled(v276, OS_LOG_TYPE_DEFAULT))
                                  {
                                    unsigned int v277 = v486;
                                    int v278 = HIDWORD(v485);
                                    int v279 = v485;
                                    int v280 = v487;
                                    sub_1003CF00C(v478, &v550);
                                    v281 = &v550;
                                    if ((v550.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                                      v281 = (std::string *)v550.__r_.__value_.__r.__words[0];
                                    }
                                    v544[0].__r_.__value_.__r.__words[0] = __PAIR64__(v277, v472);
                                    LOWORD(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                    *(_DWORD *)((char *)&v544[0].__r_.__value_.__r.__words[1] + 2) = v278;
                                    HIWORD(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                    LODWORD(v544[0].__r_.__value_.__r.__words[2]) = v279;
                                    WORD2(v544[0].__r_.__value_.__r.__words[2]) = 1024;
                                    *(_DWORD *)((char *)&v544[0].__r_.__value_.__r.__words[2] + 6) = v280;
                                    *(_WORD *)&v544[1].__r_.__value_.__s.__data_[2] = 2082;
                                    *(std::string::size_type *)((char *)v544[1].__r_.__value_.__r.__words + 4) = (std::string::size_type)v281;
                                    _os_log_impl( (void *)&_mh_execute_header,  v276,  OS_LOG_TYPE_DEFAULT,  "[MP] Local Device ID; vid: %x, pid: %x, vidSrc: %d, version: %d for device: %{public}s",
                                      (uint8_t *)v544,
                                      0x24u);
                                  }

                                  v282 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 vendorID]);
                                  int v283 = [v282 integerValue];

                                  v284 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 productID]);
                                  id v285 = [v284 integerValue];

                                  if (v283 && (_DWORD)v285)
                                  {
                                    else {
                                      int v286 = v485;
                                    }
                                    v287 = (os_log_s *)(id)qword_1008F7600;
                                    if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
                                    {
                                      sub_1003CF00C(v478, &v550);
                                      v288 = &v550;
                                      if ((v550.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                                        v288 = (std::string *)v550.__r_.__value_.__r.__words[0];
                                      }
                                      v544[0].__r_.__value_.__r.__words[0] = __PAIR64__(v283, v470);
                                      LOWORD(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                      *(_DWORD *)((char *)&v544[0].__r_.__value_.__r.__words[1] + 2) = (_DWORD)v285;
                                      HIWORD(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                      LODWORD(v544[0].__r_.__value_.__r.__words[2]) = v286;
                                      WORD2(v544[0].__r_.__value_.__r.__words[2]) = 2082;
                                      *(std::string::size_type *)((char *)&v544[0].__r_.__value_.__r.__words[2] + 6) = (std::string::size_type)v288;
                                      _os_log_impl( (void *)&_mh_execute_header,  v287,  OS_LOG_TYPE_DEFAULT,  "[MP] Updating Device ID from cloud; vid: %x, cloud pid: %x, vidSrc: %x for device: %{public}s",
                                        (uint8_t *)v544,
                                        0x1Eu);
                                    }

                                    sub_1003D6538(v478, v286, v283, (int)v285, v487);
                                    sub_1003D70B0(v478);
                                  }

                                  v289 = (void *)objc_claimAutoreleasedReturnValue( +[CBProductInfo productInfoWithProductID:]( &OBJC_CLASS___CBProductInfo,  "productInfoWithProductID:",  v285,  (void)v452,  *((void *)&v452 + 1)));
                                  v290 = (void *)objc_claimAutoreleasedReturnValue([v289 productName]);

                                  if (v290
                                    && ([v290 isEqualToString:@"Unknown"] & 1) == 0
                                    && [v290 length])
                                  {
                                    sub_1003D0100(v478, (uint64_t)v544);
                                    std::string::size_type size = v544[0].__r_.__value_.__s.__size_;
                                    unsigned __int8 v292 = v544[0].__r_.__value_.__s.__size_;
                                    if ((v544[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
                                      std::string::size_type size = v544[0].__r_.__value_.__l.__size_;
                                    }
                                    if (size)
                                    {
                                      sub_1003D0100(v478, (uint64_t)&v550);
                                      BOOL v293 = std::string::compare( &v550, (const std::string::value_type *)[v290 UTF8String]) != 0;
                                      unsigned __int8 v292 = v544[0].__r_.__value_.__s.__size_;
                                    }

                                    else
                                    {
                                      BOOL v293 = 1;
                                    }

                                    if ((v292 & 0x80) != 0) {
                                      operator delete(v544[0].__r_.__value_.__l.__data_);
                                    }
                                    if (v293)
                                    {
                                      sub_10002418C(v544, (char *)[v290 utf8ValueSafe]);
                                      *(void *)&__int128 v539 = 0LL;
                                      *(_OWORD *)&v550.__r_.__value_.__l.__data_ = 0uLL;
                                      sub_1000B0400((uint64_t)&v539);
                                      v550.__r_.__value_.__r.__words[0] = (int)v539;
                                      v550.__r_.__value_.__l.__size_ = SWORD2(v539);
                                      sub_1003D0F60((std::string *)v478, v544, &v550);
                                      v296 = (os_log_s *)(id)qword_1008F7600;
                                      if (os_log_type_enabled(v296, OS_LOG_TYPE_DEFAULT))
                                      {
                                        sub_1003CF00C(v478, v544);
                                        v297 = v544;
                                        if ((v544[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
                                          v297 = (std::string *)v544[0].__r_.__value_.__r.__words[0];
                                        }
                                        LODWORD(v550.__r_.__value_.__l.__data_) = v461;
                                        *(std::string::size_type *)((char *)v550.__r_.__value_.__r.__words + 4) = (std::string::size_type)v297;
                                        _os_log_impl( (void *)&_mh_execute_header,  v296,  OS_LOG_TYPE_DEFAULT,  "Cloud: Magic Settings updated productname %{public}s",  (uint8_t *)&v550,  0xCu);
                                      }
                                    }
                                  }

                                  v298 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 name]);
                                  BOOL v299 = [v298 length] == 0;

                                  if (!v299)
                                  {
                                    v300 = (os_log_s *)(id)qword_1008F7600;
                                    if (os_log_type_enabled(v300, OS_LOG_TYPE_DEFAULT))
                                    {
                                      sub_1003CF00C(v478, v544);
                                      v301 = (v544[0].__r_.__value_.__s.__size_ & 0x80u) == 0
                                           ? v544
                                           : (std::string *)v544[0].__r_.__value_.__r.__words[0];
                                      id v302 = objc_claimAutoreleasedReturnValue([(id) v480 name]);
                                      id v303 = [v302 UTF8String];
                                      LODWORD(v550.__r_.__value_.__l.__data_) = v471;
                                      *(std::string::size_type *)((char *)v550.__r_.__value_.__r.__words + 4) = (std::string::size_type)v301;
                                      WORD2(v550.__r_.__value_.__r.__words[1]) = 2081;
                                      *(std::string::size_type *)((char *)&v550.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v303;
                                      _os_log_impl( (void *)&_mh_execute_header,  v300,  OS_LOG_TYPE_DEFAULT,  "Cloud: Magic Settings updating %{public}s username to -> %{private}s",  (uint8_t *)&v550,  0x16u);
                                    }

                                    v304 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 name]);
                                    sub_10002418C(v544, (char *)[v304 utf8ValueSafe]);
                                    sub_1003D17B0(v478, v544, 0);

                                    uint64_t v305 = sub_1002E9258();
                                    id v306 = objc_claimAutoreleasedReturnValue([(id) v480 bluetoothAddress]);
                                    sub_10002418C(v483, (char *)[v306 UTF8String]);
                                    v307 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 name]);
                                    sub_10002418C(v481, (char *)[v307 utf8ValueSafe]);
                                    (*(void (**)(uint64_t, void **, void **))(*(void *)v305 + 176LL))( v305,  v483,  v481);
                                    if (v482 < 0) {
                                      operator delete(v481[0]);
                                    }

                                    if (v484 < 0) {
                                      operator delete(v483[0]);
                                    }
                                  }

                                  sub_1003D0100(v478, (uint64_t)v544);
                                  if ((char)v544[0].__r_.__value_.__s.__size_ < 0)
                                  {
                                    std::string::size_type v308 = v544[0].__r_.__value_.__l.__size_;
                                    operator delete(v544[0].__r_.__value_.__l.__data_);
                                    if (!v308) {
                                      goto LABEL_479;
                                    }
                                  }

                                  else if (!v544[0].__r_.__value_.__s.__size_)
                                  {
LABEL_479:
                                    v309 = (os_log_s *)(id)qword_1008F7600;
                                    if (os_log_type_enabled(v309, OS_LOG_TYPE_DEFAULT))
                                    {
                                      sub_1003CF00C(v478, v544);
                                      v310 = v544;
                                      if ((v544[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
                                        v310 = (std::string *)v544[0].__r_.__value_.__r.__words[0];
                                      }
                                      LODWORD(v550.__r_.__value_.__l.__data_) = v467;
                                      *(std::string::size_type *)((char *)v550.__r_.__value_.__r.__words + 4) = (std::string::size_type)v310;
                                      _os_log_impl( (void *)&_mh_execute_header,  v309,  OS_LOG_TYPE_DEFAULT,  "Cloud: Magic Settings No Name for device: %s",  (uint8_t *)&v550,  0xCu);
                                    }

                                    v311 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing cloudClient](self, "cloudClient"));
                                    v312 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 bluetoothAddress]);
                                    [v311 deviceRecord:v312 completion:&stru_10089A328];
                                  }

                                  v313 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 deviceIDFeatureBitsV1]);
                                  BOOL v314 = [v313 length] == 0;

                                  if (!v314)
                                  {
                                    LODWORD(v550.__r_.__value_.__l.__data_) = 0;
                                    id v315 = objc_claimAutoreleasedReturnValue([(id) v480 deviceIDFeatureBitsV1]);
                                    sub_10002418C(v544, (char *)[v315 UTF8String]);
                                    int v316 = std::stoul(v544, 0LL, 0);

                                    BOOL v317 = sub_1003D6ED8(v478, &v550);
                                    if (LODWORD(v550.__r_.__value_.__l.__data_) != v316 || !v317)
                                    {
                                      v319 = (os_log_s *)(id)qword_1008F7600;
                                      if (os_log_type_enabled(v319, OS_LOG_TYPE_DEFAULT))
                                      {
                                        v320 = v551;
                                        if (SHIBYTE(v551[2]) < 0) {
                                          v320 = (void **)v551[0];
                                        }
                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v469;
                                        *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v320;
                                        WORD2(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                        *(_DWORD *)((char *)&v544[0].__r_.__value_.__r.__words[1] + 6) = v316;
                                        _os_log_impl( (void *)&_mh_execute_header,  v319,  OS_LOG_TYPE_DEFAULT,  "Cloud: Received iCloud update for DID supported feature bits version 1, addres s: %s, supported feature bits 0x%x",  (uint8_t *)v544,  0x12u);
                                      }

                                      sub_1003D6758(v478, v316, 1);
                                    }
                                  }

                                  v321 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 deviceIDFeatureBitsV2]);
                                  BOOL v322 = [v321 length] == 0;

                                  if (!v322)
                                  {
                                    v550.__r_.__value_.__r.__words[0] = 0LL;
                                    id v323 = objc_claimAutoreleasedReturnValue([(id) v480 deviceIDFeatureBitsV2]);
                                    sub_10002418C(v544, (char *)[v323 UTF8String]);
                                    unint64_t v324 = std::stoull(v544, 0LL, 0);

                                    if ((!sub_1003D6F90(v478, &v550)
                                       || v550.__r_.__value_.__r.__words[0] != (HIDWORD(v324) | (v324 << 32)))
                                      && (_DWORD)v324 != -1)
                                    {
                                      v325 = (os_log_s *)(id)qword_1008F7600;
                                      if (os_log_type_enabled(v325, OS_LOG_TYPE_DEFAULT))
                                      {
                                        v326 = v551;
                                        if (SHIBYTE(v551[2]) < 0) {
                                          v326 = (void **)v551[0];
                                        }
                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v465;
                                        *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v326;
                                        WORD2(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                        *(_DWORD *)((char *)&v544[0].__r_.__value_.__r.__words[1] + 6) = HIDWORD(v324);
                                        WORD1(v544[0].__r_.__value_.__r.__words[2]) = 1024;
                                        HIDWORD(v544[0].__r_.__value_.__r.__words[2]) = v324;
                                        _os_log_impl( (void *)&_mh_execute_header,  v325,  OS_LOG_TYPE_DEFAULT,  "Cloud: Apply Received iCloud update for DID extended supported feature bits ve rsion 2, address: %s, extended supported feature bits I1: 0x%x, I2: 0x%x",  (uint8_t *)v544,  0x18u);
                                      }

                                      HIDWORD(v550.__r_.__value_.__r.__words[0]) |= v324;
                                      sub_1003D6A34(v478, v550.__r_.__value_.__r.__words[0], 1);
                                    }
                                  }

                                  v327 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 accessoryKey]);
                                  if ([v327 length] == (id)16)
                                  {
                                    v328 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 accessoryHint]);
                                    if ([v328 length] == (id)16)
                                    {
                                      v329 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 encryptionKey]);
                                      if ([v329 length] == (id)16)
                                      {
                                        v330 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 irk]);
                                        if ([v330 length] == (id)16)
                                        {
                                          id v466 = (id)objc_claimAutoreleasedReturnValue([(id)v480 ratchet]);
                                          if ([v466 length])
                                          {
                                            id v464 = (id)objc_claimAutoreleasedReturnValue([(id)v480 settingsMask]);
                                            if ([v464 length])
                                            {
                                              id v462 = (id)objc_claimAutoreleasedReturnValue([(id)v480 supportedServices]);
                                              if ([v462 length])
                                              {
                                                id v460 = (id)objc_claimAutoreleasedReturnValue([(id)v480 buttonModes]);
                                                if ([v460 length])
                                                {
                                                  id v459 = (id)objc_claimAutoreleasedReturnValue([(id)v480 color]);
                                                  if ([v459 length])
                                                  {
                                                    v331 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 listeningServices]);
                                                    BOOL v456 = [v331 length] == 0;

                                                    if (!v456)
                                                    {
                                                      __int128 v539 = 0uLL;
                                                      __int128 v538 = 0uLL;
                                                      id v332 = objc_claimAutoreleasedReturnValue( [(id) v480 accessoryKey]);
                                                      __int128 v539 = *(_OWORD *)[v332 bytes];

                                                      id v333 = objc_claimAutoreleasedReturnValue( [(id) v480 accessoryHint]);
                                                      __int128 v538 = *(_OWORD *)[v333 bytes];

                                                      v334 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 masterKey]);
                                                      if ([v334 length] == (id)16)
                                                      {
                                                        v335 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 masterHint]);
                                                        BOOL v336 = [v335 length] == (id)16;

                                                        if (v336)
                                                        {
                                                          *(_OWORD *)&v550.__r_.__value_.__l.__data_ = 0uLL;
                                                          __n128 v537 = 0uLL;
                                                          v337 = (os_log_s *)(id)qword_1008F7600;
                                                          if (os_log_type_enabled(v337, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            v338 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 masterKey]);
                                                            LODWORD(v544[0].__r_.__value_.__l.__data_) = v474;
                                                            *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words
                                                                                      + 4) = (std::string::size_type)v338;
                                                            _os_log_impl( (void *)&_mh_execute_header,  v337,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved Master Key: %@",  (uint8_t *)v544,  0xCu);
                                                          }

                                                          v339 = (os_log_s *)(id)qword_1008F7600;
                                                          if (os_log_type_enabled(v339, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            v340 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 masterHint]);
                                                            LODWORD(v544[0].__r_.__value_.__l.__data_) = v474;
                                                            *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words
                                                                                      + 4) = (std::string::size_type)v340;
                                                            _os_log_impl( (void *)&_mh_execute_header,  v339,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved Master Hint: %@",  (uint8_t *)v544,  0xCu);
                                                          }

                                                          id v341 = objc_claimAutoreleasedReturnValue( [(id) v480 masterKey]);
                                                          *(_OWORD *)&v550.__r_.__value_.__l.__data_ = *(_OWORD *)[v341 bytes];

                                                          id v342 = objc_claimAutoreleasedReturnValue( [(id) v480 masterHint]);
                                                          __n128 v537 = *(__n128 *)[v342 bytes];

                                                          __int128 v536 = 0uLL;
                                                          if (!sub_1001C43F0( (uint64_t)&v537,  (uint64_t)&v538,  (uint64_t)&v536,  0x10uLL)
                                                            && (_DWORD)v536 == *(_DWORD *)(v478 + 128)
                                                            && WORD2(v536) == *(unsigned __int16 *)(v478 + 132))
                                                          {
                                                            v344 = (os_log_s *)(id)qword_1008F7600;
                                                            if (os_log_type_enabled(v344, OS_LOG_TYPE_INFO))
                                                            {
                                                              sub_1003CF00C(v478, v544);
                                                              v345 = v544;
                                                              if ((v544[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
                                                                v345 = (std::string *)v544[0].__r_.__value_.__r.__words[0];
                                                              }
                                                              int v534 = v461;
                                                              v535 = v345;
                                                              _os_log_impl( (void *)&_mh_execute_header,  v344,  OS_LOG_TYPE_INFO,  "Valid Main Account Keys from cloud magic device %{public}s",  (uint8_t *)&v534,  0xCu);
                                                            }

                                                            if (qword_1008D60C0 != -1) {
                                                              dispatch_once(&qword_1008D60C0, &stru_10089A498);
                                                            }
                                                            (*(void (**)(void *, std::string *, __n128 *))(*(void *)off_1008D60B8 + 56LL))( off_1008D60B8,  &v550,  &v537);
                                                          }
                                                        }
                                                      }

                                                      else
                                                      {
                                                      }

                                                      v346 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v346, OS_LOG_TYPE_DEBUG))
                                                      {
                                                        v544[0].__r_.__value_.__r.__words[0] = v454 | 0x1000000000LL;
                                                        LOWORD(v544[0].__r_.__value_.__r.__words[1]) = 2096;
                                                        *(std::string::size_type *)((char *)&v544[0].__r_.__value_.__r.__words[1]
                                                                                  + 2) = (std::string::size_type)&v539;
                                                        WORD1(v544[0].__r_.__value_.__r.__words[2]) = 1040;
                                                        HIDWORD(v544[0].__r_.__value_.__r.__words[2]) = 16;
                                                        LOWORD(v544[1].__r_.__value_.__l.__data_) = 2096;
                                                        *(std::string::size_type *)((char *)v544[1].__r_.__value_.__r.__words
                                                                                  + 2) = (std::string::size_type)&v538;
                                                        _os_log_debug_impl( (void *)&_mh_execute_header,  v346,  OS_LOG_TYPE_DEBUG,  "Cloud keys AccKeyPtr %.16P, HintPtr %.16P",  (uint8_t *)v544,  0x22u);
                                                      }

                                                      __n128 v537 = 0uLL;
                                                      __int128 v536 = 0uLL;
                                                      id v347 = objc_claimAutoreleasedReturnValue( [(id) v480 ratchet]);
                                                      int v348 = atol((const char *)[v347 UTF8String]);

                                                      id v349 = objc_claimAutoreleasedReturnValue([(id) v480 irk]);
                                                      __n128 v537 = *(__n128 *)[v349 bytes];

                                                      id v350 = objc_claimAutoreleasedReturnValue( [(id) v480 encryptionKey]);
                                                      __int128 v536 = *(_OWORD *)[v350 bytes];

                                                      for (int k = 0; k != 31; ++k)
                                                      {
                                                        v352 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 supportedServices]);
                                                        BOOL v353 = ((unint64_t)[v352 integerValue] & (1 << k)) == 0;

                                                        if (!v353)
                                                        {
                                                          v354 = (os_log_s *)(id)qword_1008F7600;
                                                          if (os_log_type_enabled(v354, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            v355 = v551;
                                                            if (SHIBYTE(v551[2]) < 0) {
                                                              v355 = (void **)v551[0];
                                                            }
                                                            LODWORD(v544[0].__r_.__value_.__l.__data_) = v469;
                                                            *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words
                                                                                      + 4) = (std::string::size_type)v355;
                                                            WORD2(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                                            *(_DWORD *)((char *)&v544[0].__r_.__value_.__r.__words[1] + 6) = 1 << k;
                                                            _os_log_impl( (void *)&_mh_execute_header,  v354,  OS_LOG_TYPE_DEFAULT,  "Cloud: Magic Paired Device with address: %s, ServiceID: %d",  (uint8_t *)v544,  0x12u);
                                                          }

                                                          v550.__r_.__value_.__r.__words[0] = 0LL;
                                                          *(_OWORD *)&v544[0].__r_.__value_.__l.__data_ = 0uLL;
                                                          sub_1000B0400((uint64_t)&v550);
                                                          v544[0].__r_.__value_.__r.__words[0] = SLODWORD(v550.__r_.__value_.__l.__data_);
                                                          v544[0].__r_.__value_.__l.__size_ = SWORD2(v550.__r_.__value_.__r.__words[0]);
                                                          sub_1003D1FC4(v478, 1 << k, 4, v544, 0);
                                                        }
                                                      }

                                                      v356 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v356, OS_LOG_TYPE_DEBUG))
                                                      {
                                                        v544[0].__r_.__value_.__r.__words[0] = v453 | 0x1000000000LL;
                                                        LOWORD(v544[0].__r_.__value_.__r.__words[1]) = 2096;
                                                        *(std::string::size_type *)((char *)&v544[0].__r_.__value_.__r.__words[1]
                                                                                  + 2) = (std::string::size_type)&v537;
                                                        WORD1(v544[0].__r_.__value_.__r.__words[2]) = 1040;
                                                        HIDWORD(v544[0].__r_.__value_.__r.__words[2]) = 16;
                                                        LOWORD(v544[1].__r_.__value_.__l.__data_) = 2096;
                                                        *(std::string::size_type *)((char *)v544[1].__r_.__value_.__r.__words
                                                                                  + 2) = (std::string::size_type)&v536;
                                                        WORD1(v544[1].__r_.__value_.__r.__words[1]) = 1024;
                                                        HIDWORD(v544[1].__r_.__value_.__r.__words[1]) = v348;
                                                        _os_log_debug_impl( (void *)&_mh_execute_header,  v356,  OS_LOG_TYPE_DEBUG,  "Cloud IRK %.16P, EncKey %.16P, Ratchet: %d",  (uint8_t *)v544,  0x28u);
                                                      }

                                                      if (qword_1008D60C0 != -1) {
                                                        dispatch_once(&qword_1008D60C0, &stru_10089A498);
                                                      }
                                                      v357 = (char *)sub_1003EE4A0((uint64_t)off_1008D60B8, v478);
                                                      v358 = (os_log_s *)(id)qword_1008F7600;
                                                      BOOL v359 = os_log_type_enabled(v358, OS_LOG_TYPE_DEFAULT);
                                                      if (v357)
                                                      {
                                                        if (v359)
                                                        {
                                                          v360 = v551;
                                                          if (SHIBYTE(v551[2]) < 0) {
                                                            v360 = (void **)v551[0];
                                                          }
                                                          LODWORD(v544[0].__r_.__value_.__l.__data_) = v467;
                                                          *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words
                                                                                    + 4) = (std::string::size_type)v360;
                                                          _os_log_impl( (void *)&_mh_execute_header,  v358,  OS_LOG_TYPE_DEFAULT,  "Cloud: Update new Magic Paired Device with address: %s",  (uint8_t *)v544,  0xCu);
                                                        }

                                                        *(_OWORD *)(v357 + 40) = v539;
                                                        *(_OWORD *)(v357 + 56) = v538;
                                                        if (v348) {
                                                          *((_DWORD *)v357 + 18) = v348;
                                                        }
                                                        sub_1003F19DC(v357, &v537);
                                                        *(_OWORD *)(v357 + 24) = v536;
                                                      }

                                                      else
                                                      {
                                                        if (v359)
                                                        {
                                                          v361 = v551;
                                                          if (SHIBYTE(v551[2]) < 0) {
                                                            v361 = (void **)v551[0];
                                                          }
                                                          LODWORD(v544[0].__r_.__value_.__l.__data_) = v467;
                                                          *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words
                                                                                    + 4) = (std::string::size_type)v361;
                                                          _os_log_impl( (void *)&_mh_execute_header,  v358,  OS_LOG_TYPE_DEFAULT,  "Cloud: Create new Magic Paired Device with address: %s",  (uint8_t *)v544,  0xCu);
                                                        }

                                                        v357 = (char *)operator new(0x78uLL);
                                                        sub_1003F5508( (uint64_t)v357,  v478,  &v537,  &v536,  &v539,  &v538,  v348);
                                                      }

                                                      if (qword_1008D60C0 != -1) {
                                                        dispatch_once(&qword_1008D60C0, &stru_10089A498);
                                                      }
                                                      sub_1003F2724((uint64_t)off_1008D60B8, (uint64_t)v357);
                                                      v362 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 settingsMask]);
                                                      unsigned int v363 = [v362 intValue];

                                                      v364 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v364, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v458;
                                                        HIDWORD(v544[0].__r_.__value_.__r.__words[0]) = v363;
                                                        _os_log_impl( (void *)&_mh_execute_header,  v364,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved settings mask from cloud: %d",  (uint8_t *)v544,  8u);
                                                      }

                                                      v365 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 color]);
                                                      LODWORD(v460) = [v365 intValue];

                                                      v366 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v366, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v458;
                                                        HIDWORD(v544[0].__r_.__value_.__r.__words[0]) = v460;
                                                        _os_log_impl( (void *)&_mh_execute_header,  v366,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved color from cloud: %d",  (uint8_t *)v544,  8u);
                                                      }

                                                      v367 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 listeningServices]);
                                                      id v466 = [v367 integerValue];

                                                      v368 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v368, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v458;
                                                        LODWORD(v459) = (unsigned __int16)v466;
                                                        HIDWORD(v544[0].__r_.__value_.__r.__words[0]) = (unsigned __int16)v466;
                                                        _os_log_impl( (void *)&_mh_execute_header,  v368,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved listening services from cloud: %d",  (uint8_t *)v544,  8u);
                                                      }

                                                      else
                                                      {
                                                        LODWORD(v459) = (unsigned __int16)v466;
                                                      }

                                                      LODWORD(v462) = (v466 >> 7) & 7;
                                                      v369 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v369, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v544[0].__r_.__value_.__r.__words[0] = __PAIR64__( v462,  v458);
                                                        _os_log_impl( (void *)&_mh_execute_header,  v369,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved listening services V1 from cloud: %d",  (uint8_t *)v544,  8u);
                                                      }

                                                      v370 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 listeningServicesV2]);
                                                      id v464 = [v370 integerValue];

                                                      v371 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v371, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v544[0].__r_.__value_.__r.__words[0] = __PAIR64__( v464,  v458);
                                                        _os_log_impl( (void *)&_mh_execute_header,  v371,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved listening services V2 from cloud: %d",  (uint8_t *)v544,  8u);
                                                      }

                                                      if ((v466 & 2) != 0
                                                        && !sub_1003D8484(v478))
                                                      {
                                                        v372 = (os_log_s *)(id)qword_1008F7600;
                                                        if (os_log_type_enabled(v372, OS_LOG_TYPE_DEFAULT))
                                                        {
                                                          v544[0].__r_.__value_.__r.__words[0] = v458 | 0x100000000LL;
                                                          _os_log_impl( (void *)&_mh_execute_header,  v372,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved GAPA from cloud: %d",  (uint8_t *)v544,  8u);
                                                        }

                                                        sub_1003D84C8(v478, 1, 1);
                                                      }

                                                      v373 = (void *)objc_claimAutoreleasedReturnValue([(id)v480 buttonModes]);
                                                      unsigned __int8 v374 = [v373 intValue];

                                                      v375 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v375, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v458;
                                                        HIDWORD(v544[0].__r_.__value_.__r.__words[0]) = v374;
                                                        _os_log_impl( (void *)&_mh_execute_header,  v375,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved button Modes from cloud: %d",  (uint8_t *)v544,  8u);
                                                      }

                                                      int v376 = v374 & 0xF | (v374 >> 4 << 8);
                                                      v377 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v377, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v458;
                                                        v544[0].__r_.__value_.__s.__data_[4] = v374 & 0xF;
                                                        v544[0].__r_.__value_.__s.__data_[5] = v374 >> 4;
                                                        _os_log_impl( (void *)&_mh_execute_header,  v377,  OS_LOG_TYPE_DEFAULT,  "Cloud: Retrieved double tap from cloud: %d",  (uint8_t *)v544,  8u);
                                                      }

                                                      if (qword_1008D60E0 != -1) {
                                                        dispatch_once(&qword_1008D60E0, &stru_10089A4D8);
                                                      }
                                                      int v378 = sub_10021EA3C( (uint64_t)off_1008D60D8,  v478,  v374 & 0xF | ((v374 >> 4) << 8),  (v363 >> 4) & 1);
                                                      int v379 = v374 >> 4;
                                                      if (v376 == v378) {
                                                        unsigned int v380 = v374 & 0xF;
                                                      }
                                                      else {
                                                        unsigned int v380 = v378;
                                                      }
                                                      if (v376 == v378) {
                                                        unsigned int v381 = v379;
                                                      }
                                                      else {
                                                        unsigned int v381 = BYTE1(v378);
                                                      }
                                                      if (sub_1003D635C(v478) != v378)
                                                      {
                                                        v382 = (os_log_s *)(id)qword_1008F7600;
                                                        if (os_log_type_enabled(v382, OS_LOG_TYPE_DEFAULT))
                                                        {
                                                          LOWORD(v544[0].__r_.__value_.__l.__data_) = 0;
                                                          _os_log_impl( (void *)&_mh_execute_header,  v382,  OS_LOG_TYPE_DEFAULT,  "Cloud: Updating double tap settings from cloud",  (uint8_t *)v544,  2u);
                                                        }

                                                        if ((v363 & 8) != 0)
                                                        {
                                                          if (qword_1008D60E0 != -1) {
                                                            dispatch_once(&qword_1008D60E0, &stru_10089A4D8);
                                                          }
                                                          sub_100220C0C((uint64_t)off_1008D60D8, v478, v381, v380, 4);
                                                        }
                                                      }

                                                      if ((v363 & 3) == 2) {
                                                        uint64_t v383 = 2LL;
                                                      }
                                                      else {
                                                        uint64_t v383 = (v363 & 3) == 1;
                                                      }
                                                      if (sub_1003DF900(v478) != (_DWORD)v383)
                                                      {
                                                        if (qword_1008D60E0 != -1) {
                                                          dispatch_once(&qword_1008D60E0, &stru_10089A4D8);
                                                        }
                                                        sub_1002209A8((uint64_t)off_1008D60D8, v478, v383, 4u);
                                                      }

                                                      if ((_BYTE)v460)
                                                      {
                                                        sub_1003E1694(v478, v460);
                                                        v384 = (os_log_s *)(id)qword_1008F7600;
                                                        if (os_log_type_enabled(v384, OS_LOG_TYPE_DEFAULT))
                                                        {
                                                          sub_1003CF00C(v478, v544);
                                                          int v385 = (char)v544[0].__r_.__value_.__s.__size_;
                                                          std::string::size_type v386 = v544[0].__r_.__value_.__r.__words[0];
                                                          int v387 = sub_1003E16E4(v478);
                                                          LODWORD(v550.__r_.__value_.__l.__data_) = v455;
                                                          v388 = v544;
                                                          if (v385 < 0) {
                                                            v388 = (std::string *)v386;
                                                          }
                                                          *(std::string::size_type *)((char *)v550.__r_.__value_.__r.__words
                                                                                    + 4) = (std::string::size_type)v388;
                                                          WORD2(v550.__r_.__value_.__r.__words[1]) = 1024;
                                                          *(_DWORD *)((char *)&v550.__r_.__value_.__r.__words[1] + 6) = v387;
                                                          _os_log_impl( (void *)&_mh_execute_header,  v384,  OS_LOG_TYPE_DEFAULT,  "Cloud: Color info updated for device %{public}s ,color code %d",  (uint8_t *)&v550,  0x12u);
                                                        }
                                                      }

                                                      unsigned int v389 = v363 & 4;
                                                      v390 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v390, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        sub_1003CF00C(v478, &v550);
                                                        int v391 = (char)v550.__r_.__value_.__s.__size_;
                                                        std::string::size_type v392 = v550.__r_.__value_.__r.__words[0];
                                                        int v393 = sub_1003DF944(v478);
                                                        v394 = &v550;
                                                        if (v391 < 0) {
                                                          v394 = (std::string *)v392;
                                                        }
                                                        if (v389) {
                                                          v395 = "Enabled";
                                                        }
                                                        else {
                                                          v395 = "Disabled";
                                                        }
                                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v457;
                                                        *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v394;
                                                        WORD2(v544[0].__r_.__value_.__r.__words[1]) = 2080;
                                                        if (v393) {
                                                          v396 = "Enabled";
                                                        }
                                                        else {
                                                          v396 = "Disabled";
                                                        }
                                                        *(std::string::size_type *)((char *)&v544[0].__r_.__value_.__r.__words[1]
                                                                                  + 6) = (std::string::size_type)v395;
                                                        HIWORD(v544[0].__r_.__value_.__r.__words[2]) = 2080;
                                                        v544[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v396;
                                                        _os_log_impl( (void *)&_mh_execute_header,  v390,  OS_LOG_TYPE_DEFAULT,  "Cloud: In Ear Detection state update from cloud for device %{p ublic}s is %s, local state %s",  (uint8_t *)v544,  0x20u);
                                                      }

                                                      if (sub_1003DF944(v478) != v389 >> 2)
                                                      {
                                                        if (qword_1008D60E0 != -1) {
                                                          dispatch_once(&qword_1008D60E0, &stru_10089A4D8);
                                                        }
                                                        sub_100220DDC((uint64_t)off_1008D60D8, v478, v389 != 0, 4u);
                                                      }

                                                      v397 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v397, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        sub_1003CF00C(v478, v544);
                                                        v398 = v544;
                                                        if ((v544[0].__r_.__value_.__s.__size_ & 0x80u) != 0) {
                                                          v398 = (std::string *)v544[0].__r_.__value_.__r.__words[0];
                                                        }
                                                        LODWORD(v550.__r_.__value_.__l.__data_) = v455;
                                                        *(std::string::size_type *)((char *)v550.__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v398;
                                                        WORD2(v550.__r_.__value_.__r.__words[1]) = 1024;
                                                        *(_DWORD *)((char *)&v550.__r_.__value_.__r.__words[1] + 6) = (_DWORD)v459;
                                                        _os_log_impl( (void *)&_mh_execute_header,  v397,  OS_LOG_TYPE_DEFAULT,  "Cloud: Update listening mode services for device %{public}s with service - %d",  (uint8_t *)&v550,  0x12u);
                                                      }

                                                      unsigned int v399 = (v466 >> 10) & 7;
                                                      uint64_t v400 = v399 | ((unsigned __int16)v466 >> 13 << 8);
                                                      v401 = (os_log_s *)(id)qword_1008F7600;
                                                      if (os_log_type_enabled(v401, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        sub_1003CF00C(v478, &v550);
                                                        int v402 = (char)v550.__r_.__value_.__s.__size_;
                                                        std::string::size_type v403 = v550.__r_.__value_.__r.__words[0];
                                                        int v404 = sub_1003DFBD0(v478);
                                                        LODWORD(v544[0].__r_.__value_.__l.__data_) = v457;
                                                        v405 = &v550;
                                                        if (v402 < 0) {
                                                          v405 = (std::string *)v403;
                                                        }
                                                        *(std::string::size_type *)((char *)v544[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v405;
                                                        WORD2(v544[0].__r_.__value_.__r.__words[1]) = 1024;
                                                        *(_DWORD *)((char *)&v544[0].__r_.__value_.__r.__words[1] + 6) = v404;
                                                        WORD1(v544[0].__r_.__value_.__r.__words[2]) = 1024;
                                                        HIDWORD(v544[0].__r_.__value_.__r.__words[2]) = v399 | ((unsigned __int16)v466 >> 13 << 8);
                                                        _os_log_impl( (void *)&_mh_execute_header,  v401,  OS_LOG_TYPE_DEFAULT,  "Cloud: Click Hold mode info update for device %{public}s, curr ent value: %d, cloud value %d",  (uint8_t *)v544,  0x18u);
                                                      }

                                                      if ((unsigned __int16)v466 >> 13
                                                        && v399
                                                        && sub_1003DFBD0(v478) != (_DWORD)v400
                                                        && (sub_1003D2B2C(v478, 38) & 1) == 0)
                                                      {
                                                        if (qword_1008D60E0 != -1) {
                                                          dispatch_once(&qword_1008D60E0, &stru_10089A4D8);
                                                        }
                                                        sub_100215778((uint64_t)off_1008D60D8, v478, 22LL, v400, 4u);
                                                        v406 = (os_log_s *)(id)qword_1008F7600;
                                                        if (os_log_type_enabled(v406, OS_LOG_TYPE_DEFAULT))
                                                        {
                                                          sub_1003CF00C(v478, v544);
                                                          int v445 = (char)v544[0].__r_.__value_.__s.__size_;
                                                          std::string::size_type v446 = v544[0].__r_.__value_.__r.__words[0];
                                                          int v447 = sub_1003DFBD0(v478);
                                                          LODWORD(v550.__r_.__value_.__l.__data_) = v455;
                                                          v448 = v544;
                                                          if (v445 < 0) {
                                                            v448 = (std::string *)v446;
                                                          }
                                                          *(std::string::size_type *)((char *)v550.__r_.__value_.__r.__words
                                                                                    + 4) = (std::string::size_type)v448;
                                                          WORD2(v550.__r_.__value_.__r.__words[1]) = 1024;
                                                          *(_DWORD *)((char *)&v550.__r_.__value_.__r.__words[1] + 6) = v447;
                                                          _os_log_impl( (void *)&_mh_execute_header,  v406,  OS_LOG_TYPE_DEFAULT,  "Cloud: Click Hold mode info updated for device %{public}s, new mode %d",  (uint8_t *)&v550,  0x12u);
                                                        }

- (void)fetchSoundProfile
{
  if (_os_feature_enabled_impl("BluetoothFeatures", "CustomHRTFSupport") && (sub_100487F48() & 1) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[CloudPairing cloudClient](self, "cloudClient"));
    [v4 fetchSoundProfileRecordWithCompletion:&stru_10089A368];
  }

  else
  {
    uint64_t v3 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "BTAudioCloudSyncMonitor: Spatial Profile Not supported hardware ",  buf,  2u);
    }
  }

- (void)resetServerConnection
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

  if (v3)
  {
    id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    xpc_connection_cancel(v4);

    -[CloudPairing setServerConnection:](self, "setServerConnection:", 0LL);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  __int128 v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v6, 0LL);
  -[CloudPairing setServerConnection:](self, "setServerConnection:", mach_service);

  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
  __int128 v9 = (os_log_s *)qword_1008F7588;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Connected to cloudpaird", buf, 2u);
    }

    __int128 v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    xpc_connection_set_event_handler(v11, &stru_10089A3A8);

    uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    xpc_connection_resume(v12);

    if (-[NSMutableDictionary count](self->_idsMultiUsersDictionary, "count"))
    {
      BOOL v13 = (os_log_s *)qword_1008F7588;
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "MUC - Connected to cloudpaird - send getIDSLocalDeviceInfo",  v14,  2u);
      }

      -[CloudPairing cloudpairdMsg:args:]( self,  "cloudpairdMsg:args:",  @"getIDSLocalDeviceInfo",  &__NSDictionary0__struct);
    }
  }

  else if (v10)
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to connect to cloudpaird", v16, 2u);
  }

- (void)cloudpairdReplyMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CloudPairing isRunningInRecovery](self, "isRunningInRecovery"))
  {
    __int128 v8 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CP: Not Available in this layer", v13, 2u);
    }
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (v7)
    {
      BOOL v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
      xpc_dictionary_set_value(reply, "kMsgArgs", v10);
    }

    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v6);
    uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v12, reply);
  }
}

- (void)cloudpairdMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CloudPairing isRunningInRecovery](self, "isRunningInRecovery"))
  {
    __int128 v8 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CP: Not Available in this layer",  (uint8_t *)&v15,  2u);
    }
  }

  else
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

    if (!v9) {
      -[CloudPairing resetServerConnection](self, "resetServerConnection");
    }
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

    __int128 v11 = (os_log_s *)qword_1008F7588;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412803;
        id v16 = v6;
        __int16 v17 = 2160;
        uint64_t v18 = 1752392040LL;
        __int16 v19 = 2113;
        id v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CloudPairing: Send message: %@ - %{private, mask.hash}@",  (uint8_t *)&v15,  0x20u);
      }

      xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v12, "kMsgId", (const char *)[v6 UTF8String]);
      if (v7)
      {
        BOOL v13 = (void *)_CFXPCCreateXPCMessageWithCFObject(v7);
        xpc_dictionary_set_value(v12, "kMsgArgs", v13);
      }

      __int16 v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
      xpc_connection_send_message(v14, v12);
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR))
    {
      sub_100683768();
    }
  }
}

- (void)registerWithCloudPairedDevices:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v8 = (os_log_s *)(id)qword_1008F7588;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", @", "));
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = [v9 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Locally paired iCloud identifiers: [ %s ]",  buf,  0xCu);
  }

  BOOL v10 = (os_log_s *)(id)qword_1008F7588;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
    id v12 = [v11 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Locally paired iCloud BTUUIDs: [ %s ]",  buf,  0xCu);
  }

  BOOL v13 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v6));
  cloudLocalUUIDs = self->_cloudLocalUUIDs;
  self->_cloudLocalUUIDs = v13;

  int v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7));
  cloudidsIdentifiers = self->_cloudidsIdentifiers;
  self->_cloudidsIdentifiers = v15;

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  __int16 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1004823EC;
  block[3] = &unk_100887098;
  objc_copyWeak(&v19, (id *)buf);
  dispatch_async(v17, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)printDebug
{
  id v4 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "statedump: ------------------ IDS Multi Users -------------------",  (uint8_t *)&v15,  2u);
  }

  uint64_t v5 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_supportsVirtualAddress) {
      id v6 = "YES";
    }
    else {
      id v6 = "NO";
    }
    int v15 = 136315138;
    id v16 = (void *)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "statedump: Virtual address supported: %s",  (uint8_t *)&v15,  0xCu);
  }

  id v7 = (os_log_s *)(id)qword_1008F7588;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentIDSUser](self, "currentIDSUser"));
    if (v8)
    {
      id v2 = objc_claimAutoreleasedReturnValue(-[CloudPairing currentIDSUser](self, "currentIDSUser"));
      id v9 = (const char *)[v2 UTF8String];
    }

    else
    {
      id v9 = "none";
    }

    int v15 = 136315138;
    id v16 = (void *)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "statedump: Current IDS user: %s",  (uint8_t *)&v15,  0xCu);
    if (v8) {
  }
    }

  BOOL v10 = (os_log_s *)(id)qword_1008F7588;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    if (v11)
    {
      id v2 = objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
      id v12 = (const char *)[v2 UTF8String];
    }

    else
    {
      id v12 = "none";
    }

    int v15 = 136315138;
    id v16 = (void *)v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "statedump: Current user's RSA: %s",  (uint8_t *)&v15,  0xCu);
    if (v11) {
  }
    }

  BOOL v13 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    publicAddress = self->_publicAddress;
    int v15 = 138412290;
    id v16 = publicAddress;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "statedump: IDS Multi users dictionary for local address: %@",  (uint8_t *)&v15,  0xCu);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_idsMultiUsersDictionary,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10089A3E8);
  -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", @"printDebug", &__NSDictionary0__struct);
}

- (void)sendCloudKitPush
{
  uint64_t v3 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sendCloudKitPush", v4, 2u);
  }

  -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", @"sendCloudKitPush", 0LL);
}

- (BOOL)getAccountStatus
{
  uint64_t v3 = (os_log_s *)(id)qword_1008F7588;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = -[CloudPairing iCloudSignedIn](self, "iCloudSignedIn");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "getAccountStatus : iCloud Account: %i",  (uint8_t *)v5,  8u);
  }

  return -[CloudPairing iCloudSignedIn](self, "iCloudSignedIn");
}

- (void)fetchManateeStatus
{
}

- (BOOL)handleXPCUnpairCommand:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"PublicAddress"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Public %@", v4));
  unint64_t v6 = sub_1005C02B0(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"RandomAddress"]);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Random %@", v7));
  unint64_t v9 = sub_1005C02B0(v8);

  BOOL v10 = (v6 | v9) != 0;
  if (v6 | v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"kCloudDeviceUniqueID"]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"kCloudPairingID"]);
    BOOL v13 = (void *)v12;
    if (v11 && v12)
    {
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_10089A518);
      }
      if (!sub_1005CC0B8((uint64_t)off_1008D5F28, v13))
      {
        __int16 v14 = (os_log_s *)(id)qword_1008F7588;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_100683898((uint64_t)[v11 UTF8String], (uint64_t)v13, (uint64_t)buf);
        }
      }

      if (qword_1008D5F20 != -1) {
        dispatch_once(&qword_1008D5F20, &stru_10089A478);
      }
      if (!sub_10061C0F8(qword_1008D5F18, v13))
      {
        int v15 = (os_log_s *)(id)qword_1008F7588;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_100683860((uint64_t)[v11 UTF8String], (uint64_t)v13, (uint64_t)v45);
        }
      }

      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_10089A518);
      }
      sub_1005CF060((uint64_t)off_1008D5F28, v13, (uint64_t)__p);
      if (v44 >= 0) {
        id v16 = __p;
      }
      else {
        id v16 = (void **)__p[0];
      }
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
      unsigned __int8 v18 = [v11 isEqualToString:v17];

      if (v44 < 0)
      {
        operator delete(__p[0]);
        if ((v18 & 1) != 0) {
          goto LABEL_30;
        }
      }

      else if ((v18 & 1) != 0)
      {
        goto LABEL_30;
      }

      BOOL v23 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        sub_100683828((uint64_t)[v11 UTF8String], (uint64_t)v13, (uint64_t)__p);
      }
    }

- (id)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_keysGenerated)
  {
    uint64_t v10 = -[CloudPairing generateKeys](self, "generateKeys");
    id v11 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
      sub_100683A1C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v8 containsObject:@"EncryptionKeys"])
  {
    int __buf = 0;
    __int16 v28 = 0;
    v31[1] = 0LL;
    uint64_t v32 = 0LL;
    v30[1] = 0LL;
    v31[0] = 0LL;
    v30[0] = 0LL;
    arc4random_buf((char *)&__buf + 2, 2uLL);
    arc4random_buf(&v32, 8uLL);
    if (sub_100110EC0((__int128 *)self->_diversifierHidingKey, &v32, &v28))
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
        sub_1006839BC();
      }
LABEL_28:
      id v26 = 0LL;
      goto LABEL_29;
    }

    LOWORD(__buf) = HIWORD(__buf) ^ v28;
    if (sub_1001115A4((__int128 *)self->_encryptionRootKey, SHIWORD(__buf), 0, v31))
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
        sub_10068395C();
      }
      goto LABEL_28;
    }

    if (a4 != 16) {
      bzero((char *)v31 + a4, 16 - a4);
    }
    if (sub_1001115A4((__int128 *)self->_encryptionRootKey, SHIWORD(__buf), 1, v30))
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
        sub_1006838FC();
      }
      goto LABEL_28;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v31, 16LL));
    [v18 setObject:v19 forKeyedSubscript:@"LTK"];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    [v18 setObject:v20 forKeyedSubscript:@"LTKLength"];

    [v18 setObject:&off_1008C2B88 forKeyedSubscript:@"LTKType"];
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &__buf, 2LL));
    [v18 setObject:v21 forKeyedSubscript:@"EDIV"];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v32, 8LL));
    [v18 setObject:v22 forKeyedSubscript:@"RAND"];
  }

  if ([v8 containsObject:@"PublicKeys"])
  {
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  self->_cloudPublicKey,  64LL));
    [v18 setObject:v23 forKeyedSubscript:@"CloudPublicKey"];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  self->_cloudNonce,  16LL));
    [v18 setObject:v24 forKeyedSubscript:@"CloudNonce"];
  }

  if ([v8 containsObject:@"IdentityKeys"])
  {
    if (v9)
    {
      char v25 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing getIRKForRandomStaticAddress:](self, "getIRKForRandomStaticAddress:", v9));
      if (!v25)
      {
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
          sub_1006838D0();
        }
        goto LABEL_28;
      }

      [v18 setObject:v25 forKeyedSubscript:@"IRK"];
    }

    else
    {
      char v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  self->_identityResolvingKey,  16LL));
      [v18 setObject:v25 forKeyedSubscript:@"IRK"];
    }
  }

  id v26 = v18;
LABEL_29:

  return v26;
}

- (void)launchCloudPair
{
}

- (id)generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0LL;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1004838C8;
  BOOL v31 = sub_1004838D8;
  id v32 = 0LL;
  uint64_t v14 = sub_100404FE8();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1004838E0;
  v21[3] = &unk_10089A410;
  id v26 = &v27;
  v21[4] = self;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  sub_100405550(v14, v21);
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

- (id)_generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v10 = a3;
  id v137 = a4;
  id v136 = a5;
  id v138 = a6;
  if (self->_keysGenerated || -[CloudPairing _generateKeys](self, "_generateKeys"))
  {
    id v11 = (os_log_s *)(id)qword_1008F7588;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Keys available or generated", buf, 2u);
    }

    id v134 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"DeviceName"]);
    v139 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RequestedKeyType"]);
    uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RequestedKeys"]);
    v135 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"IDSLocalRandomAddress"]);
    id v12 = operator new(0x28uLL);
    v12[2] = 1;
    *(void *)id v12 = &off_10089A468;
    *((void *)v12 + 4) = 0LL;
    *((void *)v12 + 3) = 0LL;
    *((void *)v12 + 2) = v12 + 6;
    v160 = &off_10089A548;
    v161 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PublicAddress"]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Public %@", v13));
    unint64_t v15 = sub_1005C02B0(v14);

    if ([v139 containsObject:@"EncryptionKeys"])
    {
      id v16 = objc_claimAutoreleasedReturnValue([v140 objectForKeyedSubscript:@"LTK"]);
      sub_10056AB04(buf, [v16 bytes], 0x10uLL);
      sub_10032B1F8((uint64_t)v161, 0, (uint64_t)buf);
      *(void *)buf = &off_10087FAA8;
      if (*(void *)&buf[8]) {
        sub_1002CD254(*(unsigned int **)&buf[8]);
      }

      LOBYTE(v169[0]) = 0;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v140 objectForKeyedSubscript:@"LTKLength"]);
      unsigned __int8 v18 = [v17 unsignedCharValue];

      LOBYTE(v169[0]) = v18;
      sub_10056AB04(buf, v169, 1uLL);
      sub_10032B1F8((uint64_t)v161, 1, (uint64_t)buf);
      *(void *)buf = &off_10087FAA8;
      if (*(void *)&buf[8]) {
        sub_1002CD254(*(unsigned int **)&buf[8]);
      }
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v140 objectForKeyedSubscript:@"LTKType"]);
      unsigned __int8 v20 = [v19 unsignedCharValue];

      LOBYTE(v163) = v20;
      sub_10056AB04(buf, &v163, 1uLL);
      sub_10032B1F8((uint64_t)v161, 2, (uint64_t)buf);
      *(void *)buf = &off_10087FAA8;
      if (*(void *)&buf[8]) {
        sub_1002CD254(*(unsigned int **)&buf[8]);
      }
      id v21 = objc_claimAutoreleasedReturnValue([v140 objectForKeyedSubscript:@"EDIV"]);
      sub_10056AB04(buf, [v21 bytes], 2uLL);
      sub_10032B1F8((uint64_t)v161, 3, (uint64_t)buf);
      *(void *)buf = &off_10087FAA8;
      if (*(void *)&buf[8]) {
        sub_1002CD254(*(unsigned int **)&buf[8]);
      }

      id v22 = objc_claimAutoreleasedReturnValue([v140 objectForKeyedSubscript:@"RAND"]);
      sub_10056AB04(buf, [v22 bytes], 8uLL);
      sub_10032B1F8((uint64_t)v161, 4, (uint64_t)buf);
      *(void *)buf = &off_10087FAA8;
      if (*(void *)&buf[8]) {
        sub_1002CD254(*(unsigned int **)&buf[8]);
      }

      if (v137)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v137 objectForKeyedSubscript:@"LTKLength"]);
        LOBYTE(v169[0]) = [v23 unsignedCharValue];

        sub_10056AB04(buf, v169, 1uLL);
        sub_10032B1F8((uint64_t)v161, 6, (uint64_t)buf);
        *(void *)buf = &off_10087FAA8;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v137 objectForKeyedSubscript:@"LTKType"]);
        LOBYTE(v163) = [v24 unsignedCharValue];

        sub_10056AB04(buf, &v163, 1uLL);
        sub_10032B1F8((uint64_t)v161, 7, (uint64_t)buf);
        *(void *)buf = &off_10087FAA8;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }
        id v25 = objc_claimAutoreleasedReturnValue([v137 objectForKeyedSubscript:@"EDIV"]);
        sub_10056AB04(buf, [v25 bytes], 2uLL);
        sub_10032B1F8((uint64_t)v161, 8, (uint64_t)buf);
        *(void *)buf = &off_10087FAA8;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }

        id v26 = objc_claimAutoreleasedReturnValue([v137 objectForKeyedSubscript:@"RAND"]);
        sub_10056AB04(buf, [v26 bytes], 8uLL);
        sub_10032B1F8((uint64_t)v161, 9, (uint64_t)buf);
        *(void *)buf = &off_10087FAA8;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }
      }

      else
      {
        LOBYTE(v169[0]) = -[CloudPairing keyLength](self, "keyLength");
        sub_10056AB04(buf, v169, 1uLL);
        sub_10032B1F8((uint64_t)v161, 6, (uint64_t)buf);
        *(void *)buf = &off_10087FAA8;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }
        LOBYTE(v163) = 1;
        sub_10056AB04(buf, &v163, 1uLL);
        sub_10032B1F8((uint64_t)v161, 7, (uint64_t)buf);
        *(void *)buf = &off_10087FAA8;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }
      }
    }

    if (![v139 containsObject:@"PublicKeys"])
    {
      int v132 = 0;
      unint64_t v133 = 0LL;
      goto LABEL_92;
    }

    uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PublicAddress"]);
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Public %@", v28));
    unint64_t v30 = sub_1005C02B0(v29);

    memset(v159, 0, 7);
    memset(v158, 0, 7);
    if (v135 && [v138 isEqualToString:@"Version 3"])
    {
      id v31 = v135;

      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Random %@",  v31));
      unint64_t v33 = sub_1005C02B0(v32);

      uint64_t v34 = sub_1001BCDB0(v33);
      v159[0] = v34;
      BYTE2(v159[1]) = BYTE6(v34);
      LOWORD(v159[1]) = WORD2(v34);
      uint64_t v35 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "MUC: Use local host's random static address: %@",  buf,  0xCu);
      }

      int v132 = 1;
      v130 = v31;
    }

    else
    {
      uint64_t v36 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "MUC: Use local host's public address: %@",  buf,  0xCu);
      }

      uint64_t v38 = sub_1001BCDB0(v30);
      int v132 = 0;
      v159[0] = v38;
      BYTE2(v159[1]) = BYTE6(v38);
      LOWORD(v159[1]) = WORD2(v38);
    }

    if ((([v138 isEqualToString:@"Version 3"] & 1) != 0
       || [v138 isEqualToString:@"CloudKit_v2"])
      && (char v39 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RandomAddress"]),
          BOOL v40 = v39 == 0LL,
          v39,
          !v40))
    {
      uint64_t v41 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"RandomAddress"]);

      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Random %@",  v41));
      unint64_t v133 = sub_1005C02B0(v42);

      uint64_t v43 = sub_1001BCDB0(v133);
      uint64_t v131 = (void *)v41;
    }

    else
    {
      uint64_t v43 = sub_1001BCDB0(v15);
      unint64_t v133 = 0LL;
    }

    v158[0] = v43;
    BYTE2(v158[1]) = BYTE6(v43);
    LOWORD(v158[1]) = WORD2(v43);
    __int128 v172 = 0uLL;
    __int128 v171 = 0uLL;
    __int128 v170 = 0uLL;
    memset(v169, 0, sizeof(v169));
    __int128 v167 = 0u;
    __int128 v168 = 0u;
    memset(buf, 0, sizeof(buf));
    __int16 v157 = 0;
    uint64_t v165 = 0LL;
    char v44 = (void *)objc_claimAutoreleasedReturnValue([v140 objectForKeyedSubscript:@"CloudPublicKey"]);
    BOOL v45 = (void *)objc_claimAutoreleasedReturnValue([v140 objectForKeyedSubscript:@"CloudNonce"]);
    uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v44, v46) & 1) != 0
      && (uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v45, v47) & 1) != 0)
      && (objc_opt_respondsToSelector(v44, "bytes") & 1) != 0
      && (uint64_t v48 = objc_opt_respondsToSelector(v45, "bytes"), (v48 & 1) != 0))
    {
      if (IsAppleInternalBuild(v48, v49))
      {
        uint64_t v50 = (os_log_s *)(id)qword_1008F7588;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v163) = 138412290;
          *(void *)((char *)&v163 + 4) = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "valid pa: [ %@ ]",  (uint8_t *)&v163,  0xCu);
        }

        char v51 = (os_log_s *)(id)qword_1008F7588;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v163) = 138412290;
          *(void *)((char *)&v163 + 4) = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "valid pb: [ %@ ]",  (uint8_t *)&v163,  0xCu);
        }
      }

      uint64_t v52 = (__int128 *)[v44 bytes];
      __int128 v53 = *v52;
      __int128 v54 = v52[1];
      __int128 v55 = v52[3];
      __int128 v167 = v52[2];
      __int128 v168 = v55;
      *(_OWORD *)buf = v53;
      *(_OWORD *)&uint8_t buf[16] = v54;
      if ([v131 compare:v130 options:1] == (id)1)
      {
        id v56 = (__int128 *)[v45 bytes];
        __int128 v58 = *v56;
        __int128 v171 = *(_OWORD *)self->_cloudNonce;
        __int128 v172 = v58;
      }

      else
      {
        __int128 v172 = *(_OWORD *)self->_cloudNonce;
        id v56 = (__int128 *)[v45 bytes];
        __int128 v171 = *v56;
      }
    }

    else
    {
      id v59 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v163) = 138412290;
        *(void *)((char *)&v163 + 4) = v44;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "pa: [ %@ ]", (uint8_t *)&v163, 0xCu);
      }

      uint64_t v60 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v163) = 138412290;
        *(void *)((char *)&v163 + 4) = v45;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "pb: [ %@ ]", (uint8_t *)&v163, 0xCu);
      }
    }

    if (IsAppleInternalBuild(v56, v57))
    {
      v61 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        id v62 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v172,  16LL));
        LODWORD(v163) = 138412290;
        *(void *)((char *)&v163 + 4) = v62;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "na: [ %@ ]", (uint8_t *)&v163, 0xCu);
      }

      v63 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        id v64 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v171,  16LL));
        LODWORD(v163) = 138412290;
        *(void *)((char *)&v163 + 4) = v64;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "nb: [ %@ ]", (uint8_t *)&v163, 0xCu);
      }
    }

    uint64_t v65 = sub_100112260(buf, 64LL, self->_cloudPrivateKey, 0x60u, v169);
    if ((_DWORD)v65)
    {
      v67 = (os_log_s *)(id)qword_1008F7588;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_100683A84();
      }
    }

    else
    {
      if (IsAppleInternalBuild(v65, v66))
      {
        os_log_type_t v68 = (os_log_s *)(id)qword_1008F7588;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          id v69 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v169,  32LL));
          LODWORD(v163) = 138412290;
          *(void *)((char *)&v163 + 4) = v69;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "dhKey: [ %@ ]", (uint8_t *)&v163, 0xCu);
        }
      }

      __int128 v163 = 0u;
      __int128 v164 = 0u;
      id v70 = [v131 compare:v130 options:1];
      if (v70 == (id)1) {
        v71 = v158;
      }
      else {
        v71 = v159;
      }
      if (v70 == (id)1) {
        BOOL v72 = v159;
      }
      else {
        BOOL v72 = v158;
      }
      uint64_t v73 = sub_10011182C(v169, &v172, &v171, 1651797093, (uint64_t)v71, (uint64_t)v72, (char *)&v163, 32);
      if (!(_DWORD)v73)
      {
        __int128 v170 = v164;
        if (IsAppleInternalBuild(v73, v74))
        {
          v114 = (os_log_s *)(id)qword_1008F7588;
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            id v115 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v170,  16LL));
            LODWORD(v162) = 138412290;
            *(void *)((char *)&v162 + 4) = v115;
            _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_DEFAULT,  "remoteLTK: [ %@ ]",  (uint8_t *)&v162,  0xCu);
          }
        }

        v116 = v161;
        sub_10056AB04(&v162, &v157, 2uLL);
        sub_10032B1F8((uint64_t)v116, 8, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        v117 = v161;
        sub_10056AB04(&v162, &v165, 8uLL);
        sub_10032B1F8((uint64_t)v117, 9, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        uint64_t v119 = *((void *)&v162 + 1);
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        if (IsAppleInternalBuild(v119, v118))
        {
          uint64_t v120 = (os_log_s *)(id)qword_1008F7588;
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            id v121 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v157,  2LL));
            LODWORD(v162) = 138412290;
            *(void *)((char *)&v162 + 4) = v121;
            _os_log_impl( (void *)&_mh_execute_header,  v120,  OS_LOG_TYPE_DEFAULT,  "LE_KEY_LOCAL_EDIV: [ %@ ]",  (uint8_t *)&v162,  0xCu);
          }

          uint64_t v122 = (os_log_s *)(id)qword_1008F7588;
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            id v123 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v165,  8LL));
            LODWORD(v162) = 138412290;
            *(void *)((char *)&v162 + 4) = v123;
            _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "LE_KEY_LOCAL_RAND: [ %@ ]",  (uint8_t *)&v162,  0xCu);
          }
        }

        v124 = v161;
        sub_10056AB04(&v162, &v170, 0x10uLL);
        sub_10032B1F8((uint64_t)v124, 0, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        uint64_t v125 = v161;
        sub_10056AB04(&v162, &v170, 0x10uLL);
        sub_10032B1F8((uint64_t)v125, 5, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        unsigned __int8 v156 = -[CloudPairing keyLength](self, "keyLength");
        id v126 = v161;
        sub_10056AB04(&v162, &v156, 1uLL);
        sub_10032B1F8((uint64_t)v126, 1, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        id v127 = v161;
        sub_10056AB04(&v162, &v156, 1uLL);
        sub_10032B1F8((uint64_t)v127, 6, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        char v155 = 3;
        uint64_t v128 = v161;
        sub_10056AB04(&v162, &v155, 1uLL);
        sub_10032B1F8((uint64_t)v128, 2, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        v129 = v161;
        sub_10056AB04(&v162, &v155, 1uLL);
        sub_10032B1F8((uint64_t)v129, 7, (uint64_t)&v162);
        *(void *)&__int128 v162 = &off_10087FAA8;
        if (*((void *)&v162 + 1)) {
          sub_1002CD254(*((unsigned int **)&v162 + 1));
        }
        int v76 = 0;
LABEL_90:

        if (v76)
        {
          id v27 = 0LL;
LABEL_156:
          v160 = &off_10089A548;
          if (v161) {
            sub_1002CD254(v161);
          }

          goto LABEL_159;
        }

- (id)readUserPreference:(id)a3
{
  return (id)(id)CFPreferencesCopyValue( (CFStringRef)a3,  @"com.apple.CoreBluetooth.cloud",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
}

- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  CFPreferencesSetValue( v7,  v8,  @"com.apple.CoreBluetooth.cloud",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  if (a5
    && !CFPreferencesSynchronize( @"com.apple.CoreBluetooth.cloud",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost))
  {
    id v9 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[setSystemPreference] syncs returns false\n",  v10,  2u);
    }
  }
}

- (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  uint64_t v5 = (__CFString *)a3;
  CFPreferencesSetValue( v5,  0LL,  @"com.apple.CoreBluetooth.cloud",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  if (a4
    && !CFPreferencesSynchronize( @"com.apple.CoreBluetooth.cloud",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost))
  {
    unint64_t v6 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[setSystemPreference] syncs returns false\n",  v7,  2u);
    }
  }
}

- (id)createBluetoothAddressForIDSLocalDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = idsMultiUsersDictionary;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MUC - create RSA for local IDS device: %@, current users: %@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  char v44 = sub_1004838C8;
  BOOL v45 = sub_1004838D8;
  id v46 = 0LL;
  if (!self->_supportsVirtualAddress)
  {
    id v9 = 0LL;
    goto LABEL_7;
  }

  id v7 = self->_idsMultiUsersDictionary;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100485E10;
  v32[3] = &unk_10089A438;
  id v8 = v4;
  id v33 = v8;
  uint64_t v34 = buf;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v32);
  if (*(void *)(*(void *)&buf[8] + 40LL))
  {
LABEL_5:

    id v9 = *(void **)(*(void *)&buf[8] + 40LL);
LABEL_7:
    id v10 = v9;
    goto LABEL_8;
  }

  __int16 v31 = 0;
  int __buf = 0;
  arc4random_buf(&__buf, 6uLL);
  uint64_t v12 = __buf | 0xC0LL;
  LOBYTE(__buf) = __buf | 0xC0;
  id v13 = sub_1005BF848((v12 << 40) | ((unint64_t)BYTE1(__buf) << 32) | ((unint64_t)BYTE2(__buf) << 24) | ((unint64_t)HIBYTE(__buf) << 16) | ((unint64_t)v31 << 8) | HIBYTE(v31));
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  unint64_t v15 = *(void **)(*(void *)&buf[8] + 40LL);
  *(void *)(*(void *)&buf[8] + 40LL) = v14;

  id v16 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *(NSMutableDictionary **)(*(void *)&buf[8] + 40LL);
    *(_DWORD *)uint64_t v35 = 138412290;
    uint64_t v36 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MUC - RSA generated: %@", v35, 0xCu);
  }

  __int128 v42 = 0uLL;
  arc4random_buf(&v42, 0x10uLL);
  v41[0] = 0LL;
  v41[1] = 0LL;
  if (!sub_1001115A4(&v42, 1, 0, v41))
  {
    if (!self->_idsMultiUsersDictionary)
    {
      unsigned __int8 v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
      id v19 = self->_idsMultiUsersDictionary;
      self->_idsMultiUsersDictionary = v18;
    }

    unsigned __int8 v20 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      publicAddress = self->_publicAddress;
      *(_DWORD *)uint64_t v35 = 138412290;
      uint64_t v36 = (NSMutableDictionary *)publicAddress;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "MUC - local public address %@", v35, 0xCu);
    }

    v39[0] = @"IDSLocalID";
    v39[1] = @"IRK";
    v40[0] = v8;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v41, 16LL));
    v40[1] = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  2LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_idsMultiUsersDictionary,  "setObject:forKeyedSubscript:",  v23,  *(void *)(*(void *)&buf[8] + 40LL));

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  self->_idsMultiUsersDictionary,  self->_publicAddress));
    -[CloudPairing removeuserPreference:sync:](self, "removeuserPreference:sync:", @"IDSMultiUsers", 1LL);
    -[CloudPairing setuserPreference:value:sync:]( self,  "setuserPreference:value:sync:",  @"IDSMultiUsers",  v24,  1LL);
    id v25 = (os_log_s *)(id)qword_1008F7588;
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      int v28 = IsAppleInternalBuild(v26, v27);
      uint64_t v29 = v28
          ? self->_idsMultiUsersDictionary
          : (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](self->_idsMultiUsersDictionary, "count")));
      *(_DWORD *)uint64_t v35 = 138412546;
      uint64_t v36 = v29;
      __int16 v37 = 2112;
      uint64_t v38 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "MUC - MUC dictionary = %@, dictToStore %@",  v35,  0x16u);
      if (!v28) {
    }
      }

    goto LABEL_5;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR)) {
    sub_100683ADC();
  }

  id v10 = 0LL;
LABEL_8:
  _Block_object_dispose(buf, 8);

  return v10;
}

- (void)resetDataForIDSLocalDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = idsMultiUsersDictionary;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MUC - Reset data for local IDS device: %@, current users: %@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  id v13 = sub_1004838C8;
  uint64_t v14 = sub_1004838D8;
  id v15 = 0LL;
  if (self->_supportsVirtualAddress)
  {
    id v7 = self->_idsMultiUsersDictionary;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100486154;
    v9[3] = &unk_10089A438;
    id v10 = v4;
    id v11 = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v9);
    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      if (qword_1008D6288 != -1) {
        dispatch_once(&qword_1008D6288, &stru_10089A558);
      }
      *((_BYTE *)off_1008D6280 + 17000) = 0;
      char v8 = 0;
      sub_100242CA4(&v8);
      sub_1001D3284(0LL);
      sub_100242CD8(&v8);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (id)getIRKForRandomStaticAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0LL;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    id v15 = sub_1004838C8;
    id v16 = sub_1004838D8;
    id v17 = 0LL;
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1004863A8;
    v9[3] = &unk_10089A438;
    id v10 = v4;
    id v11 = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( idsMultiUsersDictionary,  "enumerateKeysAndObjectsUsingBlock:",  v9);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)updateRandomAddressContinuityAdvInstance:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing getIRKForRandomStaticAddress:](self, "getIRKForRandomStaticAddress:", v4));
      if (v5)
      {
        char v9 = 0;
        sub_100242CA4(&v9);
        sub_1001D3284((__int128 *)[v5 bytes]);
        int v6 = sub_1001BDAC0();
        id v7 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v11 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MUC - updated RSA adv instance with status: %d",  buf,  8u);
        }

        if (v6)
        {
          if (qword_1008D6288 != -1) {
            dispatch_once(&qword_1008D6288, &stru_10089A558);
          }
          char v8 = 0;
        }

        else
        {
          if (qword_1008D6288 != -1) {
            dispatch_once(&qword_1008D6288, &stru_10089A558);
          }
          char v8 = 1;
        }

        *((_BYTE *)off_1008D6280 + 17000) = v8;
        sub_100242CD8(&v9);
      }

      else if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR))
      {
        sub_100683B68();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR))
    {
      sub_100683BCC();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_ERROR))
  {
    sub_100683B3C();
  }
}

- (void)updateCurrentIDSUserInfo:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008F7588;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v20 = v6;
    __int16 v21 = 2112;
    unint64_t v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MUC - update current -> new RSA (%@ - %@)",  buf,  0x16u);
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
  BOOL v8 = (v4 | v7) == 0;

  if (!v8)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    unsigned __int8 v10 = [v9 isEqualToString:v4];

    if ((v10 & 1) != 0)
    {
      int v11 = (os_log_s *)qword_1008F7588;
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MUC - same user - don't update", buf, 2u);
      }
    }

    else
    {
      -[CloudPairing setCurrentUserRandomAddress:](self, "setCurrentUserRandomAddress:", v4);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
      BOOL v13 = v12 == 0LL;

      if (v13)
      {
        unsigned __int8 v18 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MUC - user has signed out", buf, 2u);
        }

        if (qword_1008D5F20 != -1) {
          dispatch_once(&qword_1008D5F20, &stru_10089A478);
        }
        nullsub_63(qword_1008D5F18, 0LL);
        if (qword_1008D6288 != -1) {
          dispatch_once(&qword_1008D6288, &stru_10089A558);
        }
        *((_BYTE *)off_1008D6280 + 17000) = 0;
        buf[0] = 0;
        sub_100242CA4(buf);
        sub_1001D3284(0LL);
        sub_100242CD8(buf);
      }

      else
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Random %@",  v14));
        unint64_t v16 = sub_1005C02B0(v15);

        if (qword_1008D5F20 != -1) {
          dispatch_once(&qword_1008D5F20, &stru_10089A478);
        }
        nullsub_63(qword_1008D5F18, v16);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
        -[CloudPairing updateRandomAddressContinuityAdvInstance:]( self,  "updateRandomAddressContinuityAdvInstance:",  v17);
      }
    }
  }
}

- (id)getPairedDeviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1004838C8;
  unint64_t v16 = sub_1004838D8;
  id v17 = 0LL;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  uint64_t v5 = sub_100404FE8();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100486BD4;
  v9[3] = &unk_10089A308;
  int v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_100405550(v5, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_getPairedDeviceForIDSIdentifier:(id)a3
{
  id v32 = a3;
  id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_10089A478);
  }
  id v3 = sub_100626468(qword_1008D5F18);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v4));

  uint64_t v5 = (os_log_s *)qword_1008F7588;
  if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
  {
    cloudLocalUUIDs = self->_cloudLocalUUIDs;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = cloudLocalUUIDs;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MUC - Paired devices: %@, cloud local paired %@",  buf,  0x16u);
  }

  if (v32 && self->_supportsVirtualAddress)
  {
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    uint64_t v49 = sub_1004838C8;
    uint64_t v50 = sub_1004838D8;
    id v51 = 0LL;
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10048735C;
    v42[3] = &unk_10089A438;
    id v43 = v32;
    char v44 = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( idsMultiUsersDictionary,  "enumerateKeysAndObjectsUsingBlock:",  v42);
    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Random %@",  *(void *)(*(void *)&buf[8] + 40LL)));
      char v9 = (const void *)sub_1005C02B0(v8);

      id v10 = sub_1002978A8(v9);
      int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));
      [v31 unionSet:v13];

      uint64_t v14 = (os_log_s *)qword_1008F7588;
      if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v46 = 138412290;
        uint64_t v47 = v31;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MUC - All paired devices: %@", v46, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v31;
  id v15 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v39;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v18 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v17);
        id v19 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "MUC - Checking %@", buf, 0xCu);
        }

        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_10089A518);
        }
        sub_1005CF060((uint64_t)off_1008D5F28, v18, (uint64_t)buf);
        if ((buf[23] & 0x80000000) != 0)
        {
          uint64_t v27 = *(void *)&buf[8];
          operator delete(*(void **)buf);
          if (v27)
          {
LABEL_23:
            if (qword_1008D5F30 != -1) {
              dispatch_once(&qword_1008D5F30, &stru_10089A518);
            }
            sub_1005CF060((uint64_t)off_1008D5F28, v18, (uint64_t)buf);
            if (buf[23] >= 0) {
              unsigned __int8 v20 = buf;
            }
            else {
              unsigned __int8 v20 = *(_BYTE **)buf;
            }
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
            if ((buf[23] & 0x80000000) != 0) {
              operator delete(*(void **)buf);
            }
            unint64_t v22 = (os_log_s *)qword_1008F7588;
            if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "MUC - Cloud identifier %@",  buf,  0xCu);
            }

            if (self->_supportsVirtualAddress)
            {
              if (qword_1008D5F30 != -1) {
                dispatch_once(&qword_1008D5F30, &stru_10089A518);
              }
              id v23 = off_1008D5F28;
              sub_10002418C(__p, "PairingAttemptedUsingRSA");
              int v24 = sub_1005CE5A8((uint64_t)v23, v18, (uint64_t)__p);
              int v25 = v24;
              if ((v37 & 0x80000000) == 0)
              {
                if (v24) {
                  goto LABEL_37;
                }
LABEL_43:
                uint64_t v29 = (os_log_s *)qword_1008F7588;
                if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v18;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v21;
                  _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "MUC - Upgrade keys for BTUUID %@ iCloud %@ using RSA",  buf,  0x16u);
                }

- (void)sendCloudpairingRetry:(id)a3
{
  id v4 = a3;
  if (-[CloudPairing isRunningInRecovery](self, "isRunningInRecovery"))
  {
    uint64_t v5 = (os_log_s *)qword_1008F7588;
    if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CP: Not Available to retry",  (uint8_t *)&v13,  2u);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

    if (!v6) {
      -[CloudPairing resetServerConnection](self, "resetServerConnection");
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    if (v7)
    {
      id v8 = [v4 count];

      if (v8)
      {
        char v9 = (os_log_s *)qword_1008F7588;
        if (os_log_type_enabled((os_log_t)qword_1008F7588, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138477827;
          id v14 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Send Cloud Pairing Retry for %{private}@",  (uint8_t *)&v13,  0xCu);
        }

        xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_string(v10, "kMsgId", "cloudpairingRetry");
        int v11 = (void *)_CFXPCCreateXPCObjectFromCFObject(v4);
        xpc_dictionary_set_value(v10, "kMsgArgs", v11);
        uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
        xpc_connection_send_message(v12, v10);
      }
    }
  }
}

- (NSArray)associatedDevices
{
  return self->_associatedDevices;
}

- (void)setAssociatedDevices:(id)a3
{
}

- (NSMutableArray)cloudDevices
{
  return self->_cloudDevices;
}

- (void)setCloudDevices:(id)a3
{
}

- (NSMutableArray)cloudUploadedKeys
{
  return self->_cloudUploadedKeys;
}

- (void)setCloudUploadedKeys:(id)a3
{
}

- (NSString)publicAddress
{
  return self->_publicAddress;
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

- (unint64_t)keyLength
{
  return self->_keyLength;
}

- (NSArray)cloudLocalUUIDs
{
  return self->_cloudLocalUUIDs;
}

- (NSArray)cloudidsIdentifiers
{
  return self->_cloudidsIdentifiers;
}

- (OS_xpc_object)serverConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setServerConnection:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setSerialQueue:(id)a3
{
}

- (BOOL)iCloudSignedIn
{
  return self->_iCloudSignedIn;
}

- (void)setICloudSignedIn:(BOOL)a3
{
  self->_iCloudSignedIn = a3;
}

- (BOOL)accessibilityHeadTrackingEnabled
{
  return self->_accessibilityHeadTrackingEnabled;
}

- (void)setAccessibilityHeadTrackingEnabled:(BOOL)a3
{
  self->_accessibilityHeadTrackingEnabled = a3;
}

- (BOOL)supportsVirtualAddress
{
  return self->_supportsVirtualAddress;
}

- (void)setSupportsVirtualAddress:(BOOL)a3
{
  self->_supportsVirtualAddress = a3;
}

- (NSMutableDictionary)idsMultiUsersDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setIdsMultiUsersDictionary:(id)a3
{
}

- (NSString)currentIDSUser
{
  return (NSString *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setCurrentIDSUser:(id)a3
{
}

- (NSString)currentUserRandomAddress
{
  return (NSString *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setCurrentUserRandomAddress:(id)a3
{
}

- (BOOL)multipleAdvInitialized
{
  return self->_multipleAdvInitialized;
}

- (void)setMultipleAdvInitialized:(BOOL)a3
{
  self->_multipleAdvInitialized = a3;
}

- (void).cxx_destruct
{
}

@end