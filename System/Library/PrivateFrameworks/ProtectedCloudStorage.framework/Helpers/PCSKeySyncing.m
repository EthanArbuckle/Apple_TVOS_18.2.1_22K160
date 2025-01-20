@interface PCSKeySyncing
+ (id)defaultSyncingManager;
- (BOOL)companionCircleMember;
- (BOOL)iCDPStatus;
- (BOOL)saveClient:(id)a3;
- (BOOL)setCompanionCircleMember:(BOOL)a3;
- (BOOL)setiCDPStatus:(BOOL)a3;
- (BOOL)storePCSKeyData:(id)a3 current:(BOOL)a4;
- (BOOL)updateSyncDevice:(id)a3 version:(id)a4;
- (BOOL)updateSyncedKeysToDevice:(id)a3 type:(int)a4 keys:(id)a5;
- (NSMutableArray)notifyHooks;
- (NSUserDefaults)settings;
- (PCSAccountsModel)accounts;
- (PCSKeySyncing)init;
- (UserRegistryDB)database;
- (_PCSIdentitySetData)copyIdentitySet;
- (id)allClients;
- (id)copyAllPCSKeys:(id *)a3;
- (id)copySHA256Hash:(id)a3;
- (id)dsid;
- (id)getClientWithIdentifier:(id)a3;
- (id)outStandingPCSKeys:(id)a3;
- (id)pcsKeyData:(id)a3;
- (id)syncDevices;
- (id)userRegistry;
- (void)addUpdateNotify:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setNotifyHooks:(id)a3;
- (void)setSettings:(id)a3;
- (void)signalComplete:(id)a3;
- (void)syncKeysWithDatabase;
- (void)updateClient:(id)a3;
- (void)updateProtocolVersionIfNeeded:(id)a3;
@end

@implementation PCSKeySyncing

+ (id)defaultSyncingManager
{
  if (qword_10002BDA0 != -1) {
    dispatch_once(&qword_10002BDA0, &stru_100024F78);
  }
  return (id)qword_10002BD98;
}

- (PCSKeySyncing)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PCSKeySyncing;
  v2 = -[PCSKeySyncing init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
    -[PCSKeySyncing setSettings:](v2, "setSettings:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel defaultAccountsModel](&OBJC_CLASS___PCSAccountsModel, "defaultAccountsModel"));
    -[PCSKeySyncing setAccounts:](v2, "setAccounts:", v4);
  }

  return v2;
}

- (id)userRegistry
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing dsid](self, "dsid"));
  if (v2) {
    v3 = -[UserRegistryDB initWithDSID:](objc_alloc(&OBJC_CLASS___UserRegistryDB), "initWithDSID:", v2);
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (id)dsid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing accounts](self, "accounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dsid]);

  return v3;
}

- (void)addUpdateNotify:(id)a3
{
  id v4 = a3;
  notifyHooks = self->_notifyHooks;
  id v9 = v4;
  if (!notifyHooks)
  {
    objc_super v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v7 = self->_notifyHooks;
    self->_notifyHooks = v6;

    id v4 = v9;
    notifyHooks = self->_notifyHooks;
  }

  id v8 = objc_retainBlock(v4);
  -[NSMutableArray addObject:](notifyHooks, "addObject:", v8);
}

- (void)signalComplete:(id)a3
{
  id v4 = a3;
  notifyHooks = self->_notifyHooks;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000EE28;
  v7[3] = &unk_100024FA0;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](notifyHooks, "enumerateObjectsUsingBlock:", v7);
}

- (_PCSIdentitySetData)copyIdentitySet
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing accounts](self, "accounts"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dsid]);

  if (v4)
  {
    uint64_t v10 = kPCSSetupDSID;
    v11 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    id v6 = (_PCSIdentitySetData *)PCSIdentitySetCreate(v5, 0LL, 0LL);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing accounts](self, "accounts"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastError]);
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to fetch dsid from accounts: %@",  buf,  0xCu);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (id)pcsKeyData:(id)a3
{
  id v4 = a3;
  v5 = -[PCSKeySyncing copyIdentitySet](self, "copyIdentitySet");
  CFTypeRef cf = 0LL;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "Failed to get identity set for pcsKey extraction";
      uint32_t v10 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
    }

- (BOOL)storePCSKeyData:(id)a3 current:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v17 = 0LL;
  v7 = -[PCSKeySyncing copyIdentitySet](self, "copyIdentitySet");
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = PCSIdentityCreateWithExportedPrivateKey(v6, &v17);
    if (v9)
    {
      uint32_t v10 = (_PCSIdentitySetData *)v9;
      uint64_t PublicKey = PCSIdentityGetPublicKey();
      uint64_t v12 = PCSIdentitySetCopyIdentity(v8, PublicKey);
      if (v12)
      {
        v13 = (const void *)v12;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Already have a local copy of: %@",  buf,  0xCu);
        }

        CFRelease(v13);
        goto LABEL_11;
      }

      if ((PCSIdentitySetAddIdentityWithError(v8, v10, &v17) & 1) != 0)
      {
LABEL_11:
        if (v4) {
          PCSIdentitySetSetCurrentIdentity(v8, v10);
        }
        CFRelease(v10);
        char v15 = 1;
        goto LABEL_18;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v10;
        __int16 v20 = 2112;
        v21 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to store identity %@: %@",  buf,  0x16u);
      }

      CFRelease(v10);
      CFRelease(v8);
    }

    else
    {
      CFRelease(v8);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to parse key data: %@",  buf,  0xCu);
      }
    }

    char v15 = 0;
    BOOL v14 = 0;
    id v8 = v17;
    if (v17)
    {
LABEL_18:
      CFRelease(v8);
      BOOL v14 = v15;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)iCDPStatus
{
  CFTypeRef cf = 0LL;
  v2 = -[PCSKeySyncing copyIdentitySet](self, "copyIdentitySet");
  if (!v2) {
    return 0;
  }
  v3 = v2;
  char IsICDP = PCSIdentitySetIsICDP(v2, &cf);
  if ((IsICDP & 1) == 0 && cf)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v8 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get iCDP: %@",  buf,  0xCu);
    }

    CFRelease(cf);
  }

  CFRelease(v3);
  return IsICDP;
}

- (BOOL)setiCDPStatus:(BOOL)a3
{
  BOOL v3 = a3;
  CFTypeRef v8 = 0LL;
  BOOL v4 = -[PCSKeySyncing copyIdentitySet](self, "copyIdentitySet");
  if (!v4) {
    return 0;
  }
  v5 = v4;
  char v6 = PCSIdentitySetEnableICDP(v4, v3, &v8);
  if ((v6 & 1) != 0) {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint32_t v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set iCDP: %@",  buf,  0xCu);
  }

  CFRelease(v5);
  v5 = v8;
  if (!v8) {
    return 0;
  }
LABEL_6:
  CFRelease(v5);
  return v6;
}

- (BOOL)companionCircleMember
{
  return 0;
}

- (BOOL)setCompanionCircleMember:(BOOL)a3
{
  return 0;
}

- (id)copyAllPCSKeys:(id *)a3
{
  id v9 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000179FC();
  }
  v5 = -[PCSKeySyncing copyIdentitySet](self, "copyIdentitySet");
  if (!v5) {
    return 0LL;
  }
  char v6 = v5;
  v7 = (void *)PCSIdentitySetCreateExternalForm(0LL, v5, 0LL, 0LL, &v9);
  CFRelease(v6);
  if (a3 && v9)
  {
    *a3 = v9;
  }

  else if (v9)
  {
    CFRelease(v9);
  }

  return v7;
}

- (void)syncKeysWithDatabase
{
  BOOL v3 = -[PCSKeySyncing copyIdentitySet](self, "copyIdentitySet");
  if (v3)
  {
    BOOL v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing userRegistry](self, "userRegistry"));
    char v6 = v5;
    if (v5)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10000F6B8;
      v7[3] = &unk_100024CE0;
      id v8 = v5;
      id v9 = v4;
      PCSServiceItemsGetEachName(v7);
      CFRelease(v4);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get database",  buf,  2u);
      }

      CFRelease(v4);
    }
  }

- (BOOL)updateSyncDevice:(id)a3 version:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing userRegistry](self, "userRegistry"));
  unsigned int v9 = [v8 beginExclusiveTransaction];
  if (v9)
  {
    uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
    [v8 updateSyncDevice:v6 seen:v11 version:v7];

    [v8 endTransaction:1];
  }

  return v9;
}

- (BOOL)updateSyncedKeysToDevice:(id)a3 type:(int)a4 keys:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing userRegistry](self, "userRegistry"));
  unsigned int v11 = [v10 beginExclusiveTransaction];
  if (v11)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        CFTypeRef v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend( v10,  "syncedKeyToDevice:type:device:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)v16),  v6,  v8,  (void)v18);
          CFTypeRef v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v14);
    }

    [v10 endTransaction:1];
  }

  return v11;
}

- (id)syncDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing userRegistry](self, "userRegistry"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 syncDevices]);

  return v3;
}

- (id)outStandingPCSKeys:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing userRegistry](self, "userRegistry"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 missingKeysFromDevice:v4 type:1]);

  return v6;
}

- (id)copySHA256Hash:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 32LL));
  uint64_t v5 = ccsha256_di();
  id v6 = [v3 length];
  id v7 = v3;
  id v8 = [v7 bytes];

  id v9 = v4;
  ccdigest(v5, v6, v8, [v9 mutableBytes]);
  return v9;
}

- (id)getClientWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing settings](self, "settings"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"clients"]);

  id v7 = objc_alloc(&OBJC_CLASS___PCSKeyClient);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing accounts](self, "accounts"));
  uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dsid]);
  unsigned int v11 = -[PCSKeyClient initWithName:values:dsid:](v7, "initWithName:values:dsid:", v4, v8, v10);

  return v11;
}

- (void)updateClient:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing settings](self, "settings"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"clients"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing accounts](self, "accounts"));
    uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dsid]);
    [v13 updateWithValues:v7 dsid:v10];

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 buildVersion]);
    -[PCSKeySyncing updateSyncDevice:version:](self, "updateSyncDevice:version:", v11, v12);
  }
}

- (BOOL)saveClient:(id)a3
{
  id v4 = a3;
  [v4 setIsNewWatch:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing accounts](self, "accounts"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dsid]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 getValues:v7]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing settings](self, "settings"));
    uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionaryForKey:@"clients"]);

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    [v11 setObject:v8 forKey:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing settings](self, "settings"));
    [v13 setObject:v11 forKey:@"clients"];
  }

  return v5 != 0LL;
}

- (void)updateProtocolVersionIfNeeded:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 protocolVersion] <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "updating protocol for client %@",  (uint8_t *)&v5,  0xCu);
    }

    [v4 setProtocolVersion:1];
    -[PCSKeySyncing saveClient:](self, "saveClient:", v4);
  }
}

- (id)allClients
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing settings](self, "settings"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryForKey:@"clients"]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100010290;
  v9[3] = &unk_100024FC8;
  v9[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (NSUserDefaults)settings
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (PCSAccountsModel)accounts
{
  return (PCSAccountsModel *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccounts:(id)a3
{
}

- (UserRegistryDB)database
{
  return (UserRegistryDB *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDatabase:(id)a3
{
}

- (NSMutableArray)notifyHooks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setNotifyHooks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end