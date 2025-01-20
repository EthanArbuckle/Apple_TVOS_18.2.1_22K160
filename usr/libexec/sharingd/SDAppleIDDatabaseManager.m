@interface SDAppleIDDatabaseManager
+ (id)sharedManager;
- (NSDate)lastConnectionDate;
- (NSDate)lastSuccessfulConnectionDate;
- (NSDictionary)metaInfo;
- (NSMutableDictionary)personInfoCache;
- (SDAppleIDDatabaseManager)init;
- (SFAppleIDAccount)account;
- (id)_accountForAppleID:(id)a3;
- (id)_cachedPersonInfoWithEmailOrPhone:(id)a3;
- (id)_identityForAppleID:(id)a3;
- (id)_statusInfo;
- (id)accountForAppleID:(id)a3;
- (id)cachedPersonInfoWithEmailOrPhone:(id)a3;
- (id)identityForAppleID:(id)a3;
- (id)statusInfo;
- (void)_addAppleID:(id)a3;
- (void)_addPersonInfoToCache:(id)a3;
- (void)_clearLegacyPreferencesIfNeeded;
- (void)_clearPersonInfoCache;
- (void)_postNotificationWithName:(id)a3;
- (void)_readPrefs;
- (void)_removeAppleID:(id)a3;
- (void)_setAccount:(id)a3;
- (void)_setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5;
- (void)_setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5;
- (void)_setIdentity:(id)a3 forAppleID:(id)a4;
- (void)_setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4;
- (void)_setLastConnectionDate:(id)a3;
- (void)_setLastSuccessfulConnectionDate:(id)a3;
- (void)_setMetaInfo:(id)a3;
- (void)_updateAccountInfoPrefs;
- (void)_updateMetaInfoPrefs;
- (void)_updatePersonInfoCachePrefs;
- (void)addAppleID:(id)a3;
- (void)addPersonInfoToCache:(id)a3;
- (void)clearPersonInfoCache;
- (void)removeAppleID:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5;
- (void)setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5;
- (void)setIdentity:(id)a3 forAppleID:(id)a4;
- (void)setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4;
- (void)setLastConnectionDate:(id)a3;
- (void)setLastSuccessfulConnectionDate:(id)a3;
- (void)setMetaInfo:(id)a3;
- (void)setPersonInfoCache:(id)a3;
@end

@implementation SDAppleIDDatabaseManager

- (SDAppleIDDatabaseManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAppleIDDatabaseManager;
  v2 = -[SDAppleIDDatabaseManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[SDAppleIDAccountInfoStoreFactory platformStore]( &OBJC_CLASS____TtC16DaemoniOSLibrary32SDAppleIDAccountInfoStoreFactory,  "platformStore"));
    accountInfoStore = v2->_accountInfoStore;
    v2->_accountInfoStore = (_TtP16DaemoniOSLibrary33SDAppleIDPlatformAccountInfoStore_ *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    personInfoCache = v2->_personInfoCache;
    v2->_personInfoCache = (NSMutableDictionary *)v5;

    -[SDAppleIDDatabaseManager _readPrefs](v2, "_readPrefs");
  }

  return v2;
}

+ (id)sharedManager
{
  if (qword_100656F90 != -1) {
    dispatch_once(&qword_100656F90, &stru_1005CD0A0);
  }
  return (id)qword_100656F98;
}

- (void)_readPrefs
{
  v2 = self;
  accountInfoStore = self->_accountInfoStore;
  if (dword_100642730 <= 30 && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL))) {
    LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _readPrefs]",  30LL,  "Reading Apple ID account information from %@\n",  @"com.apple.sharingd");
  }
  v4 = kCFPreferencesCurrentUser;
  uint64_t v5 = (void *)CFPreferencesCopyValue( @"AppleIDAgentMetaInfo",  @"com.apple.sharingd",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v9 = v2;
    v10 = accountInfoStore;
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate, v14);
    v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  v13,  v15,  objc_opt_class(&OBJC_CLASS___NSNumber, v16),  0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v54 = 0LL;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v18,  v5,  &v54));
    id v20 = v54;
    if (v19)
    {
      v51 = v19;
      objc_storeStrong((id *)&v9->_metaInfo, v19);
      accountInfoStore = v10;
      if (dword_100642730 <= 30
        && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
      {
        LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _readPrefs]",  30LL,  "Apple ID agent meta info retrieved from defaults: %@\n",  v9->_metaInfo);
      }
    }

    else
    {
      accountInfoStore = v10;
      if (dword_100642730 <= 60)
      {
        v2 = v9;
        if (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 60LL)) {
          LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _readPrefs]",  60LL,  "### Failed to unarchive %@ pref value with error %@\n",  @"AppleIDAgentMetaInfo",  v20);
        }
        v51 = 0LL;
LABEL_18:
        v4 = kCFPreferencesCurrentUser;
        if (!accountInfoStore) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }

      v51 = 0LL;
    }

    v2 = v9;
    goto LABEL_18;
  }

  v18 = 0LL;
  id v20 = 0LL;
  v51 = 0LL;
  if (!accountInfoStore) {
    goto LABEL_21;
  }
LABEL_19:
  if ((-[SDAppleIDPlatformAccountInfoStore storeExists](v2->_accountInfoStore, "storeExists") & 1) != 0)
  {
    v21 = 0LL;
    v22 = 0LL;
LABEL_53:
    if ((-[SDAppleIDPlatformAccountInfoStore storeExists](v2->_accountInfoStore, "storeExists") & 1) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDPlatformAccountInfoStore read](v2->_accountInfoStore, "read"));
      v41 = v40;
      if (v40)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v40 account]);

        if (v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue([v41 account]);
          -[SDAppleIDDatabaseManager _setAccount:](v2, "_setAccount:", v43);
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue([v41 personInfo]);
        id v45 = [v44 mutableCopy];

        if (v45)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v41 personInfo]);
          id v47 = [v46 mutableCopy];
          -[SDAppleIDDatabaseManager setPersonInfoCache:](v2, "setPersonInfoCache:", v47);
        }
      }

      else if (dword_100642730 <= 90 {
             && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 90LL)))
      }
      {
        LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _readPrefs]",  90LL,  "Failed reading Apple ID account info");
      }

      -[SDAppleIDDatabaseManager _clearLegacyPreferencesIfNeeded](v2, "_clearLegacyPreferencesIfNeeded");
    }

    else
    {
      if (dword_100642730 <= 50
        && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 50LL)))
      {
        LogPrintF(&dword_100642730, "-[SDAppleIDDatabaseManager _readPrefs]", 50LL, "Migrating legacy preferences");
      }

      v48 = v2->_accountInfoStore;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](v2, "account"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](v2, "personInfoCache"));
      LODWORD(v48) = -[SDAppleIDPlatformAccountInfoStore storeWithAccount:personInfo:]( v48,  "storeWithAccount:personInfo:",  v49,  v50);

      if ((_DWORD)v48) {
        -[SDAppleIDDatabaseManager _clearLegacyPreferencesIfNeeded](v2, "_clearLegacyPreferencesIfNeeded");
      }
    }

    goto LABEL_70;
  }

- (void)_clearLegacyPreferencesIfNeeded
{
  accountInfoStore = self->_accountInfoStore;
  unsigned int v3 = -[SDAppleIDPlatformAccountInfoStore storeExists](accountInfoStore, "storeExists");
  if (accountInfoStore) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    if (dword_100642730 <= 50
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 50LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _clearLegacyPreferencesIfNeeded]",  50LL,  "Clearing legacy preferences");
    }

    CFPreferencesSetValue( @"AppleIDAccount",  0LL,  @"com.apple.sharingd",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
    CFPreferencesSetValue( @"PersonInfoCache",  0LL,  @"com.apple.sharingd",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(@"com.apple.sharingd");
  }

- (id)_identityForAppleID:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account")),
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appleID]),
        unsigned int v7 = [v6 isEqualToString:v4],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);

  return v9;
}

- (id)_accountForAppleID:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account")),
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appleID]),
        unsigned int v7 = [v6 isEqualToString:v4],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)accountForAppleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](v5, "_accountForAppleID:", v4));
  id v7 = [v6 copy];

  objc_sync_exit(v5);
  return v7;
}

- (id)identityForAppleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _identityForAppleID:](v5, "_identityForAppleID:", v4));
  id v7 = [v6 copy];

  objc_sync_exit(v5);
  return v7;
}

- (id)_statusInfo
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", MKBDeviceUnlockedSinceBoot(v3));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v4 setObject:v6 forKeyedSubscript:@"DeviceUnlockedSinceBoot"];

    id v7 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v4 setObject:v8 forKeyedSubscript:@"PID"];

    [v4 setObject:self->_lastConnectionDate forKeyedSubscript:@"LastConnectAttempt"];
    [v4 setObject:self->_lastSuccessfulConnectionDate forKeyedSubscript:@"LastSuccessfulConnect"];
    [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"AccountRequiresUserAction"];
    id v9 = v4;
  }

  return v4;
}

- (id)statusInfo
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _statusInfo](v2, "_statusInfo"));
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateAccountInfoPrefs
{
  accountInfoStore = self->_accountInfoStore;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  uint64_t v5 = (void *)v4;
  if (accountInfoStore)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    -[SDAppleIDPlatformAccountInfoStore storeWithAccount:personInfo:]( accountInfoStore,  "storeWithAccount:personInfo:",  v5,  v6);

    id v7 = v5;
  }

  else
  {
    if (v4)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
      CFPropertyListRef value = (CFPropertyListRef)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));
    }

    else
    {
      CFPropertyListRef value = 0LL;
    }

    CFPreferencesSetValue( @"AppleIDAccount",  value,  @"com.apple.sharingd",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(@"com.apple.sharingd");
    if (dword_100642730 <= 30
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _updateAccountInfoPrefs]",  30LL,  "Updated Apple ID account in the local database\n");
    }

    id v7 = (void *)value;
  }
}

- (void)_updateMetaInfoPrefs
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self->_metaInfo,  1LL,  0LL));
  CFPreferencesSetValue( @"AppleIDAgentMetaInfo",  v2,  @"com.apple.sharingd",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(@"com.apple.sharingd");
  if (dword_100642730 <= 30 && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL))) {
    LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _updateMetaInfoPrefs]",  30LL,  "Updated meta info in the local database\n");
  }
}

- (void)_updatePersonInfoCachePrefs
{
  accountInfoStore = self->_accountInfoStore;
  if (accountInfoStore)
  {
    CFPropertyListRef value = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    -[SDAppleIDPlatformAccountInfoStore storeWithAccount:personInfo:]( accountInfoStore,  "storeWithAccount:personInfo:",  value,  v4);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    CFPropertyListRef value = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  0LL));

    CFPreferencesSetValue( @"PersonInfoCache",  value,  @"com.apple.sharingd",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(@"com.apple.sharingd");
    if (dword_100642730 <= 30
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _updatePersonInfoCachePrefs]",  30LL,  "Updated person info cache in the local database\n");
    }
  }
}

- (void)_setAccount:(id)a3
{
  id v23 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
  unsigned __int8 v5 = [v23 isEqual:v4];

  uint64_t v6 = v23;
  if ((v5 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v23 identity]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
    if (v7 == v9)
    {
      unsigned int v13 = 0;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v23 identity]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
      unsigned int v13 = [v10 isEqual:v12] ^ 1;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v23 validationRecord]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 validationRecord]);
    if (v14 == v16)
    {
      unsigned int v20 = 0;
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v23 validationRecord]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 validationRecord]);
      unsigned int v20 = [v17 isEqual:v19] ^ 1;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identity]);
    [v22 removeFromKeychain];

    -[SDAppleIDDatabaseManager setAccount:](self, "setAccount:", v23);
    -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
    if (v13) {
      -[SDAppleIDDatabaseManager _postNotificationWithName:]( self,  "_postNotificationWithName:",  SFAppleIDIdentityDidChangeNotification);
    }
    uint64_t v6 = v23;
    if (v20)
    {
      -[SDAppleIDDatabaseManager _postNotificationWithName:]( self,  "_postNotificationWithName:",  SFAppleIDValidationRecordDidChangeNotification);
      uint64_t v6 = v23;
    }
  }
}

- (void)_addAppleID:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v4));
    if (v5)
    {
      uint64_t v6 = (SFAppleIDAccount *)v5;
      id v7 = @"new";
    }

    else
    {
      uint64_t v6 = -[SFAppleIDAccount initWithAppleID:](objc_alloc(&OBJC_CLASS___SFAppleIDAccount), "initWithAppleID:", v8);
      id v7 = @"updated existing";
    }

    -[SDAppleIDDatabaseManager _setAccount:](self, "_setAccount:", v6);
    if (dword_100642730 <= 30
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _addAppleID:]",  30LL,  "Added account for Apple ID %{mask} (%@)\n",  v8,  v7);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }
}

- (void)addAppleID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _addAppleID:](v4, "_addAppleID:", v5);
  objc_sync_exit(v4);
}

- (void)_removeAppleID:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appleID]);
    unsigned int v6 = [v5 isEqualToString:v7];

    if (v6)
    {
      -[SDAppleIDDatabaseManager _setAccount:](self, "_setAccount:", 0LL);
      if (dword_100642730 <= 30
        && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
      {
        LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _removeAppleID:]",  30LL,  "Removed account for Apple ID %{mask} \n",  v7);
      }
    }
  }
}

- (void)removeAppleID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _removeAppleID:](v4, "_removeAppleID:", v5);
  objc_sync_exit(v4);
}

- (void)_addPersonInfoToCache:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 matchedValue]);

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 matchedValue]);
      [v5 setObject:v8 forKeyedSubscript:v6];

      -[SDAppleIDDatabaseManager _updatePersonInfoCachePrefs](self, "_updatePersonInfoCachePrefs");
      if (dword_100642730 <= 30
        && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 matchedValue]);
        LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _addPersonInfoToCache:]",  30LL,  "Added person info for %{mask} to cache\n",  v7);
      }
    }
  }
}

- (void)addPersonInfoToCache:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _addPersonInfoToCache:](v4, "_addPersonInfoToCache:", v5);
  objc_sync_exit(v4);
}

- (id)_cachedPersonInfoWithEmailOrPhone:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

    if (v6 && ([v6 isStale] & 1) == 0)
    {
      id v7 = v6;
      unsigned int v6 = v7;
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
    unsigned int v6 = 0LL;
  }

  return v7;
}

- (id)cachedPersonInfoWithEmailOrPhone:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[SDAppleIDDatabaseManager _cachedPersonInfoWithEmailOrPhone:]( v5,  "_cachedPersonInfoWithEmailOrPhone:",  v4));
  objc_sync_exit(v5);

  if (dword_100642730 <= 30 && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 matchedValue]);
    LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager cachedPersonInfoWithEmailOrPhone:]",  30LL,  "Cached person info object for %{mask} is available\n",  v7);
  }

  return v6;
}

- (void)_clearPersonInfoCache
{
  accountInfoStore = self->_accountInfoStore;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager personInfoCache](self, "personInfoCache"));
  [v4 removeAllObjects];

  if (accountInfoStore)
  {
    id v5 = self->_accountInfoStore;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager account](self, "account"));
    -[SDAppleIDPlatformAccountInfoStore deletePersonInfoCacheWithAccount:](v5, "deletePersonInfoCacheWithAccount:", v6);
  }

  else
  {
    -[SDAppleIDDatabaseManager _updatePersonInfoCachePrefs](self, "_updatePersonInfoCachePrefs");
  }

- (void)clearPersonInfoCache
{
  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDDatabaseManager _clearPersonInfoCache](obj, "_clearPersonInfoCache");
  objc_sync_exit(obj);
}

- (void)_setLastConnectionDate:(id)a3
{
}

- (void)setLastConnectionDate:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _setLastConnectionDate:](v4, "_setLastConnectionDate:", v5);
  objc_sync_exit(v4);
}

- (void)_setLastSuccessfulConnectionDate:(id)a3
{
}

- (void)setLastSuccessfulConnectionDate:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _setLastSuccessfulConnectionDate:](v4, "_setLastSuccessfulConnectionDate:", v5);
  objc_sync_exit(v4);
}

- (void)_setIdentity:(id)a3 forAppleID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (!v6)
  {
LABEL_31:
    id v9 = 0LL;
    uint64_t v14 = 0LL;
    id v8 = 0LL;
    goto LABEL_26;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v6));
  if (!v7)
  {
    if (dword_100642730 <= 90
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 90LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setIdentity:forAppleID:]",  90LL,  "### No account for %{mask}\n",  v6);
    }

    goto LABEL_31;
  }

  id v8 = v7;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 identity]);
  v10 = v19;
  if (v9 == v19)
  {
    int v11 = 0;
  }

  else
  {
    if ([v19 isEqual:v9])
    {
      int v11 = 0;
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
      [v12 removeFromKeychain];

      [v8 setIdentity:v19];
      if (dword_100642730 <= 30
        && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
      {
        unsigned int v13 = "Replaced";
        if (!v9) {
          unsigned int v13 = "Added";
        }
        LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setIdentity:forAppleID:]",  30LL,  "%s identity object for %{mask}. New identity object is %@\n",  v13,  v6,  v19);
      }

      -[SDAppleIDDatabaseManager _postNotificationWithName:]( self,  "_postNotificationWithName:",  SFAppleIDIdentityDidChangeNotification);
      int v11 = 1;
    }

    v10 = v19;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v8 altDSID]);
  if (v14 == (void *)v15)
  {

    if ((v11 & 1) == 0) {
      goto LABEL_26;
    }
  }

  else
  {
    uint64_t v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
    unsigned __int8 v18 = [v14 isEqual:v17];

    if ((v18 & 1) != 0)
    {
      if (!v11) {
        goto LABEL_26;
      }
    }

    else
    {
      [v8 setAltDSID:v14];
      if (dword_100642730 <= 30
        && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
      {
        LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setIdentity:forAppleID:]",  30LL,  "Updated AltDSDID for %{mask} to %@\n",  v6,  v14);
      }
    }
  }

  -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
LABEL_26:
}

- (void)setIdentity:(id)a3 forAppleID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 copy];
  id v8 = self;
  objc_sync_enter(v8);
  -[SDAppleIDDatabaseManager _setIdentity:forAppleID:](v8, "_setIdentity:forAppleID:", v7, v6);
  objc_sync_exit(v8);
}

- (void)_setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v11 = v6;
  if (!v6)
  {
LABEL_14:
    v10 = 0LL;
    id v8 = 0LL;
    goto LABEL_6;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v6));
  if (!v7)
  {
    if (dword_100642730 <= 90
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 90LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setIdentityLinkedToCurrentUser:forAppleID:]",  90LL,  "### No account for %{mask}\n",  v11);
    }

    goto LABEL_14;
  }

  id v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identity]);
  if (v9)
  {
    v10 = v9;
    if ([v9 linkedToCurrentUser] != v4)
    {
      [v10 setLinkedToCurrentUser:v4];
      -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
    }
  }

  else
  {
    if (dword_100642730 <= 90
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 90LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setIdentityLinkedToCurrentUser:forAppleID:]",  90LL,  "### No identity for %@\n",  0LL);
    }

    v10 = 0LL;
  }

- (void)setIdentityLinkedToCurrentUser:(BOOL)a3 forAppleID:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  -[SDAppleIDDatabaseManager _setIdentityLinkedToCurrentUser:forAppleID:]( v6,  "_setIdentityLinkedToCurrentUser:forAppleID:",  v4,  v7);
  objc_sync_exit(v6);
}

- (void)_setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
LABEL_34:
    id v11 = 0LL;
    goto LABEL_27;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v9));
  if (!v10)
  {
    if (dword_100642730 <= 90
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 90LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]",  90LL,  "### No account for %{mask}\n",  v9);
    }

    goto LABEL_34;
  }

  id v11 = v10;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v10 certificateToken]);
  unsigned int v13 = v23;
  BOOL v14 = v12 != v23;
  if (v12 == v23)
  {
LABEL_16:

    goto LABEL_19;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 certificateToken]);
  unsigned __int8 v16 = [v23 isEqual:v15];

  if ((v16 & 1) != 0)
  {
    BOOL v14 = 0;
    goto LABEL_19;
  }

  [v11 setCertificateToken:v23];
  if (dword_100642730 <= 30 && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL))) {
    LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]",  30LL,  "Set Certificate Token %@ for %{mask}\n",  v23,  v9);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 certificateToken]);
  if (v17)
  {
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v11 setCertificateTokenCreationDate:v18];
  }

  else
  {
    [v11 setCertificateTokenCreationDate:0];
  }

  if (dword_100642730 <= 30 && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 certificateTokenCreationDate]);
    LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]",  30LL,  "Set Certificate Token Creation Date %@\n",  v13);
    goto LABEL_16;
  }

  BOOL v14 = 1;
LABEL_19:
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v11 privateKeyPersistentReference]);
  if ((id)v19 == v8)
  {
  }

  else
  {
    unsigned int v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v11 privateKeyPersistentReference]);
    unsigned __int8 v22 = [v8 isEqual:v21];

    if ((v22 & 1) == 0)
    {
      [v11 setPrivateKeyPersistentReference:v8];
      if (dword_100642730 <= 30
        && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL)))
      {
        LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]",  30LL,  "Set Private Key Persistent Reference %p for %{mask}\n",  v8,  v9);
      }

      goto LABEL_26;
    }
  }

  if (v14) {
LABEL_26:
  }
    -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
LABEL_27:
}

- (void)setCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[SDAppleIDDatabaseManager _setCertificateToken:privateKeyPersistentReference:forAppleID:]( v10,  "_setCertificateToken:privateKeyPersistentReference:forAppleID:",  v11,  v8,  v9);
  objc_sync_exit(v10);
}

- (void)_setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
LABEL_28:
    id v11 = 0LL;
    goto LABEL_23;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager _accountForAppleID:](self, "_accountForAppleID:", v9));
  if (!v10)
  {
    if (dword_100642730 <= 90
      && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 90LL)))
    {
      LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:]",  90LL,  "### No account for %{mask}\n",  v9);
    }

    goto LABEL_28;
  }

  id v11 = v10;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v10 contactInfo]);
  if (v12 == v20)
  {

    goto LABEL_9;
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 contactInfo]);
  unsigned __int8 v14 = [v20 isEqual:v13];

  if ((v14 & 1) != 0)
  {
LABEL_9:
    int v15 = 0;
    goto LABEL_12;
  }

  [v11 setContactInfo:v20];
  if (dword_100642730 <= 30 && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL))) {
    LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:]",  30LL,  "Set Contact Info %@ for %{mask}\n",  v20,  v9);
  }
  int v15 = 1;
LABEL_12:
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 validationRecord]);
  if ((id)v16 == v8)
  {

LABEL_18:
    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  v17 = (void *)v16;
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 validationRecord]);
  unsigned __int8 v19 = [v8 isEqual:v18];

  if ((v19 & 1) != 0) {
    goto LABEL_18;
  }
  [v11 setValidationRecord:v8];
  if (dword_100642730 <= 30 && (dword_100642730 != -1 || _LogCategory_Initialize(&dword_100642730, 30LL))) {
    LogPrintF( &dword_100642730,  "-[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:]",  30LL,  "Set Validation Record %@ for %{mask}\n",  v8,  v9);
  }
  -[SDAppleIDDatabaseManager _postNotificationWithName:]( self,  "_postNotificationWithName:",  SFAppleIDValidationRecordDidChangeNotification);
LABEL_22:
  -[SDAppleIDDatabaseManager _updateAccountInfoPrefs](self, "_updateAccountInfoPrefs");
LABEL_23:
}

- (void)setContactInfo:(id)a3 validationRecord:(id)a4 forAppleID:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v13 copy];
  id v11 = [v8 copy];
  id v12 = self;
  objc_sync_enter(v12);
  -[SDAppleIDDatabaseManager _setContactInfo:validationRecord:forAppleID:]( v12,  "_setContactInfo:validationRecord:forAppleID:",  v10,  v11,  v9);
  objc_sync_exit(v12);
}

- (void)_setMetaInfo:(id)a3
{
  BOOL v4 = (NSDictionary *)a3;
  metaInfo = self->_metaInfo;
  if (metaInfo != v4)
  {
    id v9 = v4;
    unsigned __int8 v6 = -[NSDictionary isEqual:](metaInfo, "isEqual:", v4);
    BOOL v4 = v9;
    if ((v6 & 1) == 0)
    {
      id v7 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
      id v8 = self->_metaInfo;
      self->_metaInfo = v7;

      -[SDAppleIDDatabaseManager _updateMetaInfoPrefs](self, "_updateMetaInfoPrefs");
      BOOL v4 = v9;
    }
  }
}

- (void)setMetaInfo:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  -[SDAppleIDDatabaseManager _setMetaInfo:](v4, "_setMetaInfo:", v5);
  objc_sync_exit(v4);
}

- (NSDictionary)metaInfo
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_metaInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)_postNotificationWithName:(id)a3
{
  id v3 = a3;
  uint64_t v5 = SFMainQueue(v3, v4);
  unsigned __int8 v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099F48;
  block[3] = &unk_1005CB2F8;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, block);
}

- (NSDate)lastConnectionDate
{
  return self->_lastConnectionDate;
}

- (NSDate)lastSuccessfulConnectionDate
{
  return self->_lastSuccessfulConnectionDate;
}

- (SFAppleIDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSMutableDictionary)personInfoCache
{
  return self->_personInfoCache;
}

- (void)setPersonInfoCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end