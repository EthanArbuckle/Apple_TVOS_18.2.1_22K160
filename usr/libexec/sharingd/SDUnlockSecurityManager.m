@interface SDUnlockSecurityManager
- (BOOL)checkForEscrowData;
- (BOOL)checkForLegacyEscrowData;
- (BOOL)confirmUnlockWithAuthSession:(int64_t)a3;
- (BOOL)ltkFileExists;
- (BOOL)ltksExist;
- (BOOL)setupWithAuthSession:(int64_t)a3 passcode:(id)a4;
- (BOOL)storeEscrowData:(id)a3;
- (NSData)localLongTermKey;
- (NSData)remoteLongTermKey;
- (NSString)deviceName;
- (NSString)keyDeviceID;
- (NSString)keybagUUID;
- (NSString)pairingID;
- (NSString)pairingStorePath;
- (SDUnlockSecurityManager)initWithPairingID:(id)a3 pairingStorePath:(id)a4 deviceName:(id)a5;
- (id)allKeychainItems;
- (id)baseDictionary;
- (id)escrowData;
- (id)escrowSecretWithAuthSession:(int64_t)a3;
- (id)generateLocalLongTermKey:(int64_t)a3;
- (id)legacyEscrowData;
- (id)legacyLocalLongTermKey;
- (id)legacyRemoteLongTermKey;
- (id)longTermKeyStorageFilePath;
- (id)signRemoteKey:(id)a3 withLocalKey:(id)a4 localKeyClass:(int64_t)a5 remoteKeyClass:(int64_t)a6;
- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4;
- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5;
- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5 errorCode:(int64_t *)a6;
- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4;
- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4 errorCode:(int *)a5;
- (int64_t)escrowCreationSessionAsOriginator:(BOOL)a3 errorCode:(int *)a4;
- (int64_t)stashBagSessionAsOriginator:(BOOL)a3 escrowSecret:(id)a4 manifest:(id)a5;
- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5;
- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5 errorCode:(int *)a6;
- (unsigned)lockState;
- (void)checkForBackupExclusion:(id)a3;
- (void)clearStateForSession:(int64_t)a3;
- (void)deleteEscrowData;
- (void)deleteLegacyEscrowData;
- (void)deleteLongTermKeys;
- (void)deletePersistedLongTermKeys;
- (void)loadLongTermKeys;
- (void)migrateEscrowDataIfNeeded;
- (void)migrateOldKeysIfNeeded;
- (void)resetEscrowRecord;
- (void)saveLongTermKeys;
- (void)setDeviceName:(id)a3;
- (void)setKeyDeviceID:(id)a3;
- (void)setKeybagUUID:(id)a3;
- (void)setLocalLongTermKey:(id)a3;
- (void)setPairingID:(id)a3;
- (void)setPairingStorePath:(id)a3;
- (void)setRemoteLongTermKey:(id)a3;
- (void)updateLocalLongTermKey:(id)a3 remoteLongTermKey:(id)a4;
- (void)validateKeybagUUID;
@end

@implementation SDUnlockSecurityManager

- (SDUnlockSecurityManager)initWithPairingID:(id)a3 pairingStorePath:(id)a4 deviceName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SDUnlockSecurityManager;
  v11 = -[SDUnlockSecurityManager init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    pairingID = v11->_pairingID;
    v11->_pairingID = v12;

    v14 = (NSString *)[v9 copy];
    pairingStorePath = v11->_pairingStorePath;
    v11->_pairingStorePath = v14;

    v16 = (NSString *)[v10 copy];
    deviceName = v11->_deviceName;
    v11->_deviceName = v16;

    -[SDUnlockSecurityManager migrateOldKeysIfNeeded](v11, "migrateOldKeysIfNeeded");
  }

  return v11;
}

- (unsigned)lockState
{
  unsigned int v3 = 0;
  aks_get_lock_state(0LL, &v3);
  return v3;
}

- (BOOL)ltksExist
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));

    if (v5)
    {
      uint64_t v8 = paired_unlock_log(v6, v7);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "LTKs exists", v11, 2u);
      }

      LOBYTE(v3) = 1;
    }

    else
    {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (id)generateLocalLongTermKey:(int64_t)a3
{
  uint64_t v15 = 0LL;
  v16 = 0LL;
  if (a3 == 1) {
    uint64_t v3 = 9LL;
  }
  else {
    uint64_t v3 = 11LL;
  }
  uint64_t v4 = aks_create_signing_key(0LL, v3, &v16, &v15);
  if ((_DWORD)v4 == -536870212 || v15 == 0)
  {
    uint64_t v7 = paired_unlock_log(v4, v5);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000F8850();
    }
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v16));
    uint64_t v10 = paired_unlock_log(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Generated local key", v14, 2u);
    }
  }

  if (v16) {
    free(v16);
  }
  return v8;
}

- (id)signRemoteKey:(id)a3 withLocalKey:(id)a4 localKeyClass:(int64_t)a5 remoteKeyClass:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v12 = v10;
  uint64_t v29 = 0LL;
  v30 = 0LL;
  if (!v10)
  {
    uint64_t v25 = paired_unlock_log(0LL, v11);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000F88B4();
    }
    goto LABEL_16;
  }

  if (a5 == 1) {
    uint64_t v13 = 9LL;
  }
  else {
    uint64_t v13 = 11LL;
  }
  if (a6 == 1) {
    uint64_t v14 = 9LL;
  }
  else {
    uint64_t v14 = 11LL;
  }
  id v15 = v10;
  id v16 = [v15 bytes];
  id v17 = [v15 length];
  id v18 = v9;
  uint64_t v19 = aks_sign_signing_key( 0,  v13,  v16,  v17,  v14,  [v18 bytes],  objc_msgSend(v18, "length"),  &v30,  &v29);
  if ((_DWORD)v19 == -536870212 || !v29)
  {
    uint64_t v26 = paired_unlock_log(v19, v20);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000F88E0();
    }
LABEL_16:
    v21 = 0LL;
    goto LABEL_17;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v30));
  uint64_t v23 = paired_unlock_log(v21, v22);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "signed remote key and received data", buf, 2u);
  }

- (void)updateLocalLongTermKey:(id)a3 remoteLongTermKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v10 = v8;
  p_localLongTermKey = &self->_localLongTermKey;
  if (*(_OWORD *)&self->_localLongTermKey != 0LL)
  {
    uint64_t v12 = paired_unlock_log(v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      localLongTermKey = self->_localLongTermKey;
      remoteLongTermKey = self->_remoteLongTermKey;
      int v17 = 138412546;
      id v18 = localLongTermKey;
      __int16 v19 = 2112;
      uint64_t v20 = remoteLongTermKey;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Overriding existing long term keys (local %@, remote %@)",  (uint8_t *)&v17,  0x16u);
    }
  }

  id v16 = self;
  objc_sync_enter(v16);
  objc_storeStrong((id *)p_localLongTermKey, a3);
  objc_storeStrong((id *)&v16->_remoteLongTermKey, a4);
  -[SDUnlockSecurityManager saveLongTermKeys](v16, "saveLongTermKeys");
  objc_sync_exit(v16);
}

- (void)deleteLongTermKeys
{
  v2 = self;
  objc_sync_enter(v2);
  localLongTermKey = v2->_localLongTermKey;
  v2->_localLongTermKey = 0LL;

  remoteLongTermKey = v2->_remoteLongTermKey;
  v2->_remoteLongTermKey = 0LL;

  id v5 = -[SDUnlockSecurityManager deletePersistedLongTermKeys](v2, "deletePersistedLongTermKeys");
  uint64_t v7 = paired_unlock_log(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](v2, "pairingID"));
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted LTKs for %@", (uint8_t *)&v10, 0xCu);
  }

  objc_sync_exit(v2);
}

- (NSData)localLongTermKey
{
  v2 = self;
  objc_sync_enter(v2);
  localLongTermKey = v2->_localLongTermKey;
  if (!localLongTermKey)
  {
    -[SDUnlockSecurityManager loadLongTermKeys](v2, "loadLongTermKeys");
    localLongTermKey = v2->_localLongTermKey;
  }

  uint64_t v4 = localLongTermKey;
  objc_sync_exit(v2);

  return v4;
}

- (NSData)remoteLongTermKey
{
  v2 = self;
  objc_sync_enter(v2);
  remoteLongTermKey = v2->_remoteLongTermKey;
  if (!remoteLongTermKey)
  {
    -[SDUnlockSecurityManager loadLongTermKeys](v2, "loadLongTermKeys");
    remoteLongTermKey = v2->_remoteLongTermKey;
  }

  uint64_t v4 = remoteLongTermKey;
  objc_sync_exit(v2);

  return v4;
}

- (void)validateKeybagUUID
{
  if (self->_keybagUUID)
  {
    uint64_t v3 = sub_100011CF8();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    unsigned int v6 = [v5 isEqualToString:self->_keybagUUID];

    uint64_t v9 = paired_unlock_log(v7, v8);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "KeybagUUIDs match", v12, 2u);
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      sub_1000F8944();
    }
  }

  else
  {
    -[SDUnlockSecurityManager saveLongTermKeys](self, "saveLongTermKeys");
  }

- (void)checkForBackupExclusion:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"SDUnlockBackupExclusion"]);
  id v5 = v4;
  if (self->_localLongTermKey)
  {
    if (self->_remoteLongTermKey)
    {
      id v6 = [v4 BOOLValue];
      if ((v6 & 1) == 0)
      {
        uint64_t v8 = paired_unlock_log(v6, v7);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v10 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Resaving LTKs with backup exclusion",  v10,  2u);
        }

        -[SDUnlockSecurityManager saveLongTermKeys](self, "saveLongTermKeys");
      }
    }
  }
}

- (void)saveLongTermKeys
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
  id v5 = (void *)v3;
  if (!self->_localLongTermKey || (self->_remoteLongTermKey ? (BOOL v6 = v3 == 0) : (BOOL v6 = 1), v6))
  {
    uint64_t v7 = paired_unlock_log(v3, v4);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = @"YES";
      remoteLongTermKey = self->_remoteLongTermKey;
      if (self->_localLongTermKey) {
        uint64_t v11 = @"YES";
      }
      else {
        uint64_t v11 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      if (!remoteLongTermKey) {
        uint64_t v9 = @"NO";
      }
      v38 = (void *)v11;
      __int16 v39 = 2112;
      v40 = v9;
      __int16 v41 = 2112;
      v42 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Save missing info (local %@, remote %@, pairing store path %@)",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  self->_localLongTermKey,  @"SDUnlockLocalLTK");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  self->_remoteLongTermKey,  @"SDUnlockRemoteLTK");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  @"SDUnlockPairingID");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"SDUnlockBackupExclusion");
    uint64_t v14 = sub_100011CF8();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (v15)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v17,  @"SDUnlockKeybagUUID");
    }

    id v36 = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v12,  200LL,  0LL,  &v36));
    __int16 v19 = (os_log_s *)v36;
    uint64_t v8 = v19;
    if (v18)
    {

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
      id v35 = 0LL;
      unsigned int v22 = [v18 writeToURL:v21 options:268435457 error:&v35];
      id v23 = v35;
      uint64_t v25 = paired_unlock_log(v23, v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      v27 = v26;
      if (v22)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v12;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Saved LTKs %@", buf, 0xCu);
        }

        id v34 = v23;
        unsigned int v28 = [v21 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v34];
        uint64_t v8 = (os_log_s *)v34;

        uint64_t v31 = paired_unlock_log(v29, v30);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        BOOL v32 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (v28)
        {
          if (v32) {
            sub_1000F89DC();
          }
        }

        else if (v32)
        {
          sub_1000F8A08();
        }
      }

      else
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000F8A68();
        }
        uint64_t v8 = (os_log_s *)v23;
      }
    }

    else
    {
      uint64_t v33 = paired_unlock_log(v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        sub_1000F897C();
      }
    }
  }
}

- (void)loadLongTermKeys
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
  if (v3)
  {
    id v29 = 0LL;
    uint64_t v4 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  v3,  0LL,  &v29);
    id v5 = v29;
    uint64_t v7 = v5;
    if (v4)
    {
      id v28 = 0LL;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  &v28));
      id v9 = v28;

      if (v8)
      {
        uint64_t v12 = (NSData *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"SDUnlockLocalLTK"]);
        localLongTermKey = self->_localLongTermKey;
        self->_localLongTermKey = v12;

        uint64_t v14 = (NSData *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"SDUnlockRemoteLTK"]);
        remoteLongTermKey = self->_remoteLongTermKey;
        self->_remoteLongTermKey = v14;

        id v16 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"SDUnlockKeybagUUID"]);
        keybagUUID = self->_keybagUUID;
        self->_keybagUUID = v16;

        uint64_t v20 = paired_unlock_log(v18, v19);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v22 = self->_localLongTermKey;
          id v23 = self->_remoteLongTermKey;
          uint64_t v24 = self->_keybagUUID;
          *(_DWORD *)buf = 138412802;
          uint64_t v31 = v22;
          __int16 v32 = 2112;
          uint64_t v33 = v23;
          __int16 v34 = 2112;
          id v35 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Loaded LTKs\n local %@\nremote %@\nkeybag UUID %@)",  buf,  0x20u);
        }

        -[SDUnlockSecurityManager checkForBackupExclusion:](self, "checkForBackupExclusion:", v8);
        -[SDUnlockSecurityManager validateKeybagUUID](self, "validateKeybagUUID");
      }

      else
      {
        uint64_t v26 = paired_unlock_log(v10, v11);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1000F8B28();
        }
      }
    }

    else
    {
      uint64_t v25 = paired_unlock_log(v5, v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F8AC8();
      }
      id v9 = v7;
    }
  }
}

- (void)deletePersistedLongTermKeys
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v21 = 0LL;
    unsigned __int8 v6 = [v5 removeItemAtPath:v4 error:&v21];
    id v7 = v21;

    if ((v6 & 1) != 0)
    {
      uint64_t v10 = paired_unlock_log(v8, v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        uint64_t v12 = "Deleted LTKs";
        uint64_t v13 = (uint8_t *)&v19;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }

    else
    {
      id v15 = [v7 code];
      if (v15 != (id)-1100LL)
      {
        id v15 = [v7 code];
        if (v15 != (id)260)
        {
          id v15 = [v7 code];
          if (v15 != (id)4)
          {
            uint64_t v18 = paired_unlock_log(v15, v16);
            uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              sub_1000F8C18();
            }
            goto LABEL_13;
          }
        }
      }

      uint64_t v17 = paired_unlock_log(v15, v16);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "LTKs already deleted";
        uint64_t v13 = buf;
        goto LABEL_12;
      }
    }

- (id)longTermKeyStorageFilePath
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingStorePath](self, "pairingStorePath"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"com.apple.sharing"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v14 = 0LL;
  unsigned int v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v7 = v14;

  if (v6)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"ltk.plist"]);
  }

  else
  {
    uint64_t v11 = paired_unlock_log(v8, v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000F8C78(self);
    }

    uint64_t v10 = 0LL;
  }

  return v10;
}

- (BOOL)ltkFileExists
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager longTermKeyStorageFilePath](self, "longTermKeyStorageFilePath"));
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
      id v11 = 0LL;
      LOBYTE(v3) = [v5 checkResourceIsReachableAndReturnError:&v11];
      id v6 = v11;
      id v7 = v6;
      if ((v3 & 1) == 0)
      {
        uint64_t v8 = auto_unlock_log(v6);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000F8D04();
        }
      }
    }

    else
    {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (id)legacyRemoteLongTermKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"UnlockSecurityRemoteLongTermKey"]);

  return v3;
}

- (id)legacyLocalLongTermKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"UnlockSecurityLocalLongTermKey"]);

  return v3;
}

- (void)migrateOldKeysIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager legacyLocalLongTermKey](self, "legacyLocalLongTermKey"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager legacyRemoteLongTermKey](self, "legacyRemoteLongTermKey"));
  id v6 = (void *)v4;
  if (v3 && v4)
  {
    uint64_t v7 = paired_unlock_log(v4, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Migrating old keys to %@",  (uint8_t *)&v13,  0xCu);
    }

    -[SDUnlockSecurityManager updateLocalLongTermKey:remoteLongTermKey:]( self,  "updateLocalLongTermKey:remoteLongTermKey:",  v3,  v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v10 removeObjectForKey:@"UnlockSecurityLocalLongTermKey"];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v11 removeObjectForKey:@"UnlockSecurityRemoteLongTermKey"];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v12 synchronize];
  }
}

- (int64_t)escrowCreationSessionAsOriginator:(BOOL)a3 errorCode:(int *)a4
{
  if (a3) {
    uint64_t v4 = 132LL;
  }
  else {
    uint64_t v4 = 4LL;
  }
  return -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:]( self,  "authSessionWithFlags:secret:errorCode:",  v4,  0LL,  a4);
}

- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5
{
  return -[SDUnlockSecurityManager unlockSessionAsOriginator:usingEscrow:escrowSecret:errorCode:]( self,  "unlockSessionAsOriginator:usingEscrow:escrowSecret:errorCode:",  a3,  a4,  a5,  0LL);
}

- (int64_t)unlockSessionAsOriginator:(BOOL)a3 usingEscrow:(BOOL)a4 escrowSecret:(id)a5 errorCode:(int *)a6
{
  if (a3) {
    int v6 = 128;
  }
  else {
    int v6 = 0;
  }
  if (a4) {
    int v7 = 5;
  }
  else {
    int v7 = 2;
  }
  return -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:]( self,  "authSessionWithFlags:secret:errorCode:",  v7 | v6,  a5,  a6);
}

- (int64_t)stashBagSessionAsOriginator:(BOOL)a3 escrowSecret:(id)a4 manifest:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8 == 0LL && v6) {
    unsigned int v10 = 134;
  }
  else {
    unsigned int v10 = 137;
  }
  if (v6) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 9LL;
  }
  if (v8)
  {
    uint64_t v23 = 0LL;
    id v12 = a4;
    id v13 = [v12 bytes];
    id v14 = [v12 length];

    id v15 = v9;
    uint64_t v16 = aks_create_escrow_blob(&v23, v13, v14, [v15 bytes], objc_msgSend(v15, "length"));
    uint64_t v22 = v16;
    if (v16 && v23)
    {
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v16,  v23,  0LL,  v22));
      int64_t v19 = -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:]( self,  "authSessionWithFlags:secret:errorCode:",  v11,  v18,  0LL);
      aks_free_escrow_blob(&v22, v23);
    }

    else
    {
      uint64_t v20 = paired_unlock_log(v16, v17);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000F8D64();
      }
      int64_t v19 = 101LL;
    }
  }

  else
  {
    uint64_t v18 = (os_log_s *)a4;
    int64_t v19 = -[SDUnlockSecurityManager authSessionWithFlags:secret:](self, "authSessionWithFlags:secret:", v11, v18);
  }

  return v19;
}

- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4
{
  return -[SDUnlockSecurityManager authSessionWithFlags:secret:errorCode:]( self,  "authSessionWithFlags:secret:errorCode:",  *(void *)&a3,  a4,  0LL);
}

- (int64_t)authSessionWithFlags:(unsigned int)a3 secret:(id)a4 errorCode:(int *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  int v60 = 0;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  if (v9)
  {
    uint64_t v11 = (void *)v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));

    if (v12)
    {
      v55 = a5;
      id v59 = v8;
      uint64_t v13 = paired_unlock_log(v9, v10);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v62 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Creating auth session with flags = %d",  buf,  8u);
      }

      id v57 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
      id v56 = [v57 bytes];
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
      uint64_t v16 = [v15 length];
      id v17 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
      id v18 = [v17 bytes];
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
      uint64_t v20 = [v19 length];
      id v53 = v59;
      unsigned int v54 = v6;
      int v21 = aks_remote_session( 0,  v6,  v56,  v16,  v18,  v20,  [v53 bytes],  objc_msgSend(v53, "length"),  &v60);

      uint64_t v24 = paired_unlock_log(v22, v23);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v62 = v60;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Auth session -- create (session id: %d)",  buf,  8u);
      }

      if (v21 == -536870211)
      {
        uint64_t v28 = paired_unlock_log(v26, v27);
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Received no memory error when creating session, clearing and retrying",  buf,  2u);
        }

        sub_100011FB8(v30);
        int v60 = 0;
        id v31 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
        id v58 = [v31 bytes];
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
        uint64_t v33 = [v32 length];
        id v34 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
        id v35 = [v34 bytes];
        id v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
        uint64_t v37 = [v36 length];
        id v38 = v53;
        int v21 = aks_remote_session( 0,  v54,  v58,  v33,  v35,  v37,  [v38 bytes],  objc_msgSend(v38, "length"),  &v60);
      }

      if (v21 <= -536870161)
      {
        id v8 = v59;
        __int16 v39 = v55;
        if (v21 != -536870207)
        {
          if (v21 != -536870184)
          {
LABEL_29:
            uint64_t v48 = paired_unlock_log(v26, v27);
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
              *(_DWORD *)buf = 67109890;
              int v62 = v21;
              __int16 v63 = 1024;
              unsigned int v64 = v54;
              __int16 v65 = 2112;
              v66 = v51;
              __int16 v67 = 2112;
              v68 = v52;
              _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Failed to setup session: (status = %x, flags = %d,\n localKey = %@,\n remoteKey = %@)",  buf,  0x22u);
            }

            goto LABEL_32;
          }

- (BOOL)setupWithAuthSession:(int64_t)a3 passcode:(id)a4
{
  id v5 = a4;
  id v6 = [v5 UTF8String];
  id v7 = [v5 length];

  uint64_t v8 = aks_remote_peer_setup(a3, v6, v7, 0LL, 0LL);
  int v9 = v8;
  uint64_t v11 = paired_unlock_log(v8, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "setupWithAuthSession status = %d",  (uint8_t *)v18,  8u);
  }

  if (v9 == -536870212)
  {
    uint64_t v15 = paired_unlock_log(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000F8E60();
    }
  }

  return v9 != -536870212;
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4
{
  return -[SDUnlockSecurityManager stepWithAuthSession:data:authStep:]( self,  "stepWithAuthSession:data:authStep:",  a3,  a4,  0LL);
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5
{
  return -[SDUnlockSecurityManager stepWithAuthSession:data:authStep:errorCode:]( self,  "stepWithAuthSession:data:authStep:errorCode:",  a3,  a4,  a5,  0LL);
}

- (id)stepWithAuthSession:(int64_t)a3 data:(id)a4 authStep:(BOOL)a5 errorCode:(int64_t *)a6
{
  id v9 = a4;
  uint64_t v11 = v9;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  if (!a3)
  {
    uint64_t v18 = paired_unlock_log(v9, v10);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000F8E8C();
    }
    goto LABEL_11;
  }

  id v12 = v9;
  uint64_t v13 = aks_remote_session_step(a3, [v12 bytes], objc_msgSend(v12, "length"), &v22, &v21);
  uint64_t v15 = v13;
  if ((_DWORD)v13 || !a5 && !v21)
  {
    if (a6) {
      *a6 = (int)v13;
    }
    uint64_t v16 = paired_unlock_log(v13, v14);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000F8EB8((uint64_t)&v21, v15, v17);
    }
LABEL_11:

    int64_t v19 = 0LL;
    goto LABEL_12;
  }

  int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v22, v21, v21));
LABEL_12:
  if (v22) {
    free(v22);
  }

  return v19;
}

- (id)escrowSecretWithAuthSession:(int64_t)a3
{
  uint64_t v16 = 0LL;
  id v17 = 0LL;
  uint64_t v3 = aks_remote_peer_confirm(a3, &v17, &v16);
  if ((_DWORD)v3 == -536870212 || v16 == 0)
  {
    uint64_t v6 = paired_unlock_log(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F8F2C((uint64_t)&v16, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v17));
  }

  if (v17) {
    free(v17);
  }
  return v14;
}

- (BOOL)confirmUnlockWithAuthSession:(int64_t)a3
{
  return aks_remote_peer_confirm(a3, 0LL, 0LL) == 0;
}

- (void)clearStateForSession:(int64_t)a3
{
  uint64_t v4 = paired_unlock_log(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 67109120;
    int v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reseting session id %d", (uint8_t *)&v21, 8u);
  }

  if ((a3 & 0x8000000000000000LL) == 0)
  {
    uint64_t v8 = paired_unlock_log(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67109120;
      int v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Auth session -- reset (session id: %d)",  (uint8_t *)&v21,  8u);
    }

    uint64_t v10 = aks_reset_session(a3);
    if ((_DWORD)v10 == -536870212)
    {
      uint64_t v12 = paired_unlock_log(v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000F8F94(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

- (void)resetEscrowRecord
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  if (!v3
    || (id v5 = (void *)v3,
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey")),
        v6,
        v5,
        !v6))
  {
    uint64_t v20 = paired_unlock_log(v3, v4);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000F9004();
    }
    goto LABEL_10;
  }

  uint64_t v7 = paired_unlock_log(v3, v4);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting Escrow Record", buf, 2u);
  }

  id v9 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  id v10 = [v9 bytes];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager localLongTermKey](self, "localLongTermKey"));
  id v12 = [v11 length];
  id v13 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
  id v14 = [v13 bytes];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager remoteLongTermKey](self, "remoteLongTermKey"));
  LODWORD(v10) = aks_remote_session(0, 3, v10, v12, v14, [v15 length], 0, 0, 0);

  if ((_DWORD)v10 == -536870212)
  {
    uint64_t v18 = paired_unlock_log(v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000F9030();
    }
LABEL_10:
  }

- (BOOL)storeEscrowData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if ([v5 deviceKeyBagUnlocked])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager deviceName](self, "deviceName"));
      [v8 setObject:v9 forKeyedSubscript:kSecAttrLabel];

      id v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  kSecAttrAccessibleWhenUnlockedThisDeviceOnly,  kSecAttrAccessible);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v4, kSecValueData);
      uint64_t v11 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v8);
      -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v10);
      uint64_t v12 = SecItemAdd((CFDictionaryRef)v11, 0LL);
      if ((_DWORD)v12)
      {
        uint64_t v14 = SecItemUpdate((CFDictionaryRef)v8, (CFDictionaryRef)v10);
        if ((_DWORD)v14)
        {
          uint64_t v16 = SecItemDelete((CFDictionaryRef)v8);
          uint64_t v17 = SecItemAdd((CFDictionaryRef)v11, 0LL);
          if (!(_DWORD)v17)
          {
            BOOL v22 = 1;
            goto LABEL_18;
          }

          uint64_t v19 = v17;
          uint64_t v20 = paired_unlock_log(v17, v18);
          int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1000F905C(v19, v16, v21);
          }
          BOOL v22 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }

        uint64_t v26 = paired_unlock_log(v14, v15);
        int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v24 = "Updated escrow data";
          uint64_t v25 = buf;
          goto LABEL_15;
        }
      }

      else
      {
        uint64_t v23 = paired_unlock_log(v12, v13);
        int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = 0;
          uint64_t v24 = "Added escrow data";
          uint64_t v25 = (uint8_t *)&v28;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
        }
      }

      BOOL v22 = 1;
      goto LABEL_17;
    }
  }

  else
  {
  }

  BOOL v22 = 0;
LABEL_19:

  return v22;
}

- (id)escrowData
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    CFTypeRef result = 0LL;
    id v4 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    uint64_t v6 = -[NSMutableDictionary initWithDictionary:](v4, "initWithDictionary:", v5);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecReturnData);
    if (SecItemCopyMatching((CFDictionaryRef)v6, &result)) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = (void *)result;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)checkForEscrowData
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    uint64_t v8 = -[NSMutableDictionary initWithDictionary:](v6, "initWithDictionary:", v7);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecReturnPersistentRef);
    uint64_t v9 = SecItemCopyMatching((CFDictionaryRef)v8, 0LL);
    BOOL v11 = (_DWORD)v9 == -25308 || v9 == 0;
    if ((_DWORD)v9 != -25308 && (_DWORD)v9 != -25300 && (_DWORD)v9 != 0)
    {
      int v14 = v9;
      uint64_t v15 = paired_unlock_log(v9, v10);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 67109120;
        LODWORD(v27) = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received unexpected SecItem error = %d",  (uint8_t *)&v26,  8u);
      }
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  uint64_t v17 = paired_unlock_log(v4, v5);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
    int v26 = 138412546;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    id v29 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Escrow data exist:%@, pairing id:%@",  (uint8_t *)&v26,  0x16u);
  }

  if (v11) {
    goto LABEL_27;
  }
  BOOL v21 = -[SDUnlockSecurityManager checkForLegacyEscrowData](self, "checkForLegacyEscrowData");
  if (v21)
  {
    uint64_t v23 = paired_unlock_log(v21, v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Escrow data hasn't been migrated",  (uint8_t *)&v26,  2u);
    }

LABEL_27:
    LOBYTE(v21) = 1;
  }

  return v21;
}

- (void)deleteEscrowData
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    uint64_t v4 = SecItemDelete((CFDictionaryRef)-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    if ((_DWORD)v4 != -25300)
    {
      uint64_t v6 = v4;
      if ((_DWORD)v4)
      {
        uint64_t v7 = paired_unlock_log(v4, v5);
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000F90CC(v6, v8, v9, v10, v11, v12, v13, v14);
        }
      }
    }
  }

- (id)allKeychainItems
{
  CFTypeRef result = 0LL;
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));

  if (v3)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager baseDictionary](self, "baseDictionary"));
    uint64_t v6 = -[NSMutableDictionary initWithDictionary:](v4, "initWithDictionary:", v5);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecReturnAttributes);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  kSecMatchLimitAll,  kSecMatchLimit);
    OSStatus v7 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
    if (v7 == -25308)
    {
      uint64_t v3 = @"Items Exist | Device Locked";
    }

    else if (v7)
    {
      uint64_t v3 = 0LL;
    }

    else
    {
      uint64_t v8 = (void *)result;
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)result description]);
    }
  }

  return v3;
}

- (id)baseDictionary
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  kSecClassGenericPassword,  kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  @"com.apple.sharingd.unlock",  kSecAttrAccount);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  @"com.apple.sharingd",  kSecAttrAccessGroup);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager pairingID](self, "pairingID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, kSecAttrService);

  id v5 = -[NSMutableDictionary copy](v3, "copy");
  return v5;
}

- (id)legacyEscrowData
{
  v4[0] = kSecClass;
  v4[1] = kSecAttrLabel;
  v5[0] = kSecClassGenericPassword;
  v5[1] = @"com.apple.Sharing.lock-escrow";
  v4[2] = kSecAttrAccessGroup;
  v4[3] = kSecReturnData;
  uint64_t v3 = 0LL;
  v5[2] = @"com.apple.sharingd";
  v5[3] = &__kCFBooleanTrue;
  v4[4] = kSecAttrService;
  v5[4] = @"UnlockServiceName";
  if (SecItemCopyMatching( (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  5LL),  (CFTypeRef *)&v3))
  {
    return 0LL;
  }

  else
  {
    return v3;
  }

- (BOOL)checkForLegacyEscrowData
{
  v14[0] = kSecClass;
  v14[1] = kSecAttrLabel;
  v15[0] = kSecClassGenericPassword;
  v15[1] = @"com.apple.Sharing.lock-escrow";
  v14[2] = kSecAttrService;
  v14[3] = kSecAttrAccessGroup;
  v15[2] = @"UnlockServiceName";
  v15[3] = @"com.apple.sharingd";
  v14[4] = kSecReturnPersistentRef;
  v15[4] = &__kCFBooleanTrue;
  uint64_t v2 = SecItemCopyMatching( (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL),  0LL);
  BOOL v4 = (_DWORD)v2 == -25308 || v2 == 0;
  if ((_DWORD)v2 != -25308)
  {
    int v5 = v2;
    if ((_DWORD)v2 != -25300)
    {
      if ((_DWORD)v2)
      {
        uint64_t v6 = paired_unlock_log(v2, v3);
        OSStatus v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          LODWORD(v13) = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received unexpected SecItem error = %d",  (uint8_t *)&v12,  8u);
        }
      }
    }
  }

  uint64_t v8 = paired_unlock_log(v2, v3);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"NO";
    if (v4) {
      uint64_t v10 = @"YES";
    }
    int v12 = 138412290;
    uint64_t v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Legacy escrow data exist:%@",  (uint8_t *)&v12,  0xCu);
  }

  return v4;
}

- (void)migrateEscrowDataIfNeeded
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDUnlockSecurityManager legacyEscrowData](self, "legacyEscrowData"));
  int v5 = (void *)v3;
  if (v3)
  {
    uint64_t v6 = paired_unlock_log(v3, v4);
    OSStatus v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migrating escrow data", v12, 2u);
    }

    BOOL v8 = -[SDUnlockSecurityManager storeEscrowData:](self, "storeEscrowData:", v5);
    if (v8)
    {
      -[SDUnlockSecurityManager deleteLegacyEscrowData](self, "deleteLegacyEscrowData");
    }

    else
    {
      uint64_t v10 = paired_unlock_log(v8, v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000F9130();
      }
    }
  }
}

- (void)deleteLegacyEscrowData
{
  v13[0] = kSecClass;
  v13[1] = kSecAttrLabel;
  v14[0] = kSecClassGenericPassword;
  v14[1] = @"com.apple.Sharing.lock-escrow";
  v13[2] = kSecAttrService;
  v14[2] = @"UnlockServiceName";
  uint64_t v2 = SecItemDelete((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));
  if ((_DWORD)v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = paired_unlock_log(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000F915C(v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }

- (void)setLocalLongTermKey:(id)a3
{
}

- (void)setRemoteLongTermKey:(id)a3
{
}

- (NSString)keybagUUID
{
  return self->_keybagUUID;
}

- (void)setKeybagUUID:(id)a3
{
}

- (NSString)keyDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setKeyDeviceID:(id)a3
{
}

- (NSString)pairingID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPairingID:(id)a3
{
}

- (NSString)pairingStorePath
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPairingStorePath:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end