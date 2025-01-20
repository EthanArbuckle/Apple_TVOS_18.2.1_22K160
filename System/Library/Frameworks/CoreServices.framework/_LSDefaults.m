@interface _LSDefaults
+ (id)sharedInstance;
- (BOOL)abortIfMayNotMapDatabase;
- (BOOL)allowsAlternateIcons;
- (BOOL)allowsUnentitledExtensionPointDeclaration;
- (BOOL)alwaysUseDebugOpenWithMenus;
- (BOOL)hasPersistentPreferences;
- (BOOL)hasServer;
- (BOOL)isAppleInternal;
- (BOOL)isInEducationMode;
- (BOOL)isInSyncBubble;
- (BOOL)isInXCTestRigInsecure;
- (BOOL)isLightweightSystemServer;
- (BOOL)isRegionChina;
- (BOOL)isServer;
- (BOOL)isUsingEphemeralStorage;
- (BOOL)issueSandboxExceptionsIfMayNotMapDatabase;
- (BOOL)markLocalizationsStoredInDatabase;
- (BOOL)nsExtensionUsesLSSettingsStore;
- (NSArray)preferredLocalizations;
- (NSData)HMACSecret;
- (NSURL)databaseContainerDirectoryURL;
- (NSURL)databaseStoreFileURL;
- (NSURL)dbRecoveryFileURL;
- (NSURL)dbSentinelFileURL;
- (NSURL)dbSyncInterruptedFileURL;
- (NSURL)defaultAppQueryStateURL;
- (NSURL)identifiersFileURL;
- (NSURL)installJournalDirectoryURL;
- (NSURL)preSydroFSecurePreferencesFileURL;
- (NSURL)preferencesFileURL;
- (NSURL)progressProportionsStateURL;
- (NSURL)queriedSchemesMapFileURL;
- (NSURL)securePreferencesFileURL;
- (NSURL)settingsStoreFileURL;
- (NSURL)systemContainerURL;
- (NSURL)systemContentDatabaseStoreFileURL;
- (NSURL)systemGroupContainerURL;
- (NSURL)unremappableDatabaseStoreFileURL;
- (NSURL)userContainerURL;
- (_LSDefaults)init;
- (double)databaseSaveInterval;
- (double)databaseSaveLatency;
- (id)classesWithNameForXCTests:(const char *)a3;
- (id)darwinNotificationNameForBaseName:(id)a3 optionalSessionKey:(LSSessionKey *)a4;
- (id)databaseStoreFileURLWithUID:(unsigned int)a3;
- (id)databaseUpdateNotificationNameForSessionKey:(LSSessionKey)a3;
- (id)debugDescription;
- (id)preferencesFileChangeNotificationName;
- (id)preferencesUpdateNotificationName;
- (id)serviceNameForConnectionType:(unsigned __int16)a3;
- (id)serviceNameForConnectionType:(unsigned __int16)a3 lightweightSystemService:(BOOL)a4;
- (id)settingsUpdateNotificationNameForUserID:(unsigned int)a3;
- (id)simulatorRootURL;
- (id)simulatorRuntimeBuildVersion;
- (id)simulatorRuntimeVersion;
- (id)systemContainerBaseURL;
- (id)systemContentDatabaseStoreFileURLWithUID:(unsigned int)a3;
- (int64_t)concurrentInstallOperations;
- (unsigned)currentSchemaVersion;
- (unsigned)databaseStoreFileMode;
- (unsigned)proxyUIDForCurrentEffectiveUID;
- (unsigned)proxyUIDForUID:(unsigned int)a3;
- (void)setHasServer:(BOOL)a3;
- (void)setLightweightSystemServer:(BOOL)a3;
- (void)setServer:(BOOL)a3;
@end

@implementation _LSDefaults

- (BOOL)isInXCTestRigInsecure
{
  return self->_inXCTestRigInsecure;
}

- (BOOL)isServer
{
  return self->_isServer;
}

- (unsigned)proxyUIDForCurrentEffectiveUID
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45___LSDefaults_proxyUIDForCurrentEffectiveUID__block_invoke;
  block[3] = &unk_189D72BF0;
  block[4] = self;
  if (proxyUIDForCurrentEffectiveUID_once != -1) {
    dispatch_once(&proxyUIDForCurrentEffectiveUID_once, block);
  }
  if (proxyUIDForCurrentEffectiveUID_hasEUID == 1) {
    uint64_t v3 = proxyUIDForCurrentEffectiveUID_euid;
  }
  else {
    uint64_t v3 = _CFGetEUID();
  }
  return -[_LSDefaults proxyUIDForUID:](self, "proxyUIDForUID:", v3);
}

- (unsigned)proxyUIDForUID:(unsigned int)a3
{
  if (a3 - 401 >= 0xFFFFFE6D) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)hasServer
{
  return self->_hasServer && !self->_isServer;
}

- (BOOL)markLocalizationsStoredInDatabase
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48___LSDefaults_markLocalizationsStoredInDatabase__block_invoke;
  block[3] = &unk_189D72BF0;
  block[4] = self;
  if (markLocalizationsStoredInDatabase_once != -1) {
    dispatch_once(&markLocalizationsStoredInDatabase_once, block);
  }
  return markLocalizationsStoredInDatabase_result;
}

- (NSArray)preferredLocalizations
{
  if (preferredLocalizations_once != -1) {
    dispatch_once(&preferredLocalizations_once, &__block_literal_global_157);
  }
  if (!-[_LSDefaults isInXCTestRigInsecure](self, "isInXCTestRigInsecure")
    || (+[_LSStringLocalizer preferredLocalizationsForXCTests]( &OBJC_CLASS____LSStringLocalizer,  "preferredLocalizationsForXCTests"),  (id v3 = (id)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    if (preferredLocalizations_useUserLangList)
    {
      if (-[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"))
      {
        [MEMORY[0x189603F90] preferredLanguages];
        id v3 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v3 = (id)CFPreferencesCopyValue( @"AppleLanguages",  (CFStringRef)*MEMORY[0x189605170],  @"mobile",  (CFStringRef)*MEMORY[0x189605178]);
      }
    }

    else
    {
      if (preferredLocalizations_once_169 != -1) {
        dispatch_once(&preferredLocalizations_once_169, &__block_literal_global_170);
      }
      id v3 = (id)preferredLocalizations_bundleLocalizations;
    }
  }

  return (NSArray *)v3;
}

- (BOOL)isInEducationMode
{
  return self->_inEducationMode;
}

+ (id)sharedInstance
{
  if (__LSDefaultsGetSharedInstance_onceToken != -1) {
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_22);
  }
  return (id)__LSDefaultsGetSharedInstance_sharedInstance;
}

- (_LSDefaults)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____LSDefaults;
  v2 = -[_LSDefaults init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1895F8AF8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices.defaults", v3);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v4;

    systemContainerURL = v2->_systemContainerURL;
    v2->_systemContainerURL = 0LL;

    userContainerURL = v2->_userContainerURL;
    v2->_userContainerURL = 0LL;

    systemGroupContainerURL = v2->_systemGroupContainerURL;
    v2->_systemGroupContainerURL = 0LL;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    darwinNotificationNames = v2->_darwinNotificationNames;
    v2->_darwinNotificationNames = v9;

    v2->_darwinNotificationNamesUID = _CFGetEUID();
    v2->_darwinNotificationNamesLock._os_unfair_lock_opaque = 0;
    v11 = getenv("RUNNING_IN_SYNC_BUBBLE");
    if (v11 && atoi(v11) == 1) {
      _LSDefaultsInSyncBubble_inSyncBubble = 1;
    }
    v2->_inSyncBubble = _LSDefaultsInSyncBubble_inSyncBubble;
    if (_LSDefaultsInXCTestRigInsecure_once != -1) {
      dispatch_once(&_LSDefaultsInXCTestRigInsecure_once, &__block_literal_global_372);
    }
    v2->_inXCTestRigInsecure = _LSDefaultsInXCTestRigInsecure_inXCTestRigInsecure;
    if (_LSDefaultsIsAppleInternal_once != -1) {
      dispatch_once(&_LSDefaultsIsAppleInternal_once, &__block_literal_global_374);
    }
    v2->_appleInternal = _LSDefaultsIsAppleInternal_appleInternal;
    if (_LSDefaultsHasServer_onceToken != -1) {
      dispatch_once(&_LSDefaultsHasServer_onceToken, &__block_literal_global_375);
    }
    v2->_hasServer = (_LSDefaultsHasServer_hasServer & 1) == 0;
    BOOL v12 = _CFGetEUID() - 100 <= 0xFFFFFF99 && getenv("LS_NO_PERSISTENT_PREFS") == 0LL;
    v2->_hasPersistentPreferences = v12;
    v2->_inEducationMode = 0;
    v2->_usingEphemeralStorage = os_variant_uses_ephemeral_storage();
  }

  return v2;
}

- (unsigned)currentSchemaVersion
{
  return 6022;
}

- (id)systemContainerBaseURL
{
  return _LSLazyLoadObjectOnQueue((uint64_t)&self->_baseSystemContainerURL, self->_ivarQueue, &__block_literal_global_28);
}

- (NSURL)systemContainerURL
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __33___LSDefaults_systemContainerURL__block_invoke;
  v4[3] = &unk_189D75A60;
  v4[4] = self;
  _LSLazyLoadObjectOnQueue((uint64_t)&self->_systemContainerURL, ivarQueue, v4);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)userContainerURL
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __31___LSDefaults_userContainerURL__block_invoke;
  v4[3] = &unk_189D75A60;
  v4[4] = self;
  _LSLazyLoadObjectOnQueue((uint64_t)&self->_userContainerURL, ivarQueue, v4);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)systemGroupContainerURL
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __38___LSDefaults_systemGroupContainerURL__block_invoke;
  v4[3] = &unk_189D75A60;
  v4[4] = self;
  _LSLazyLoadObjectOnQueue((uint64_t)&self->_systemGroupContainerURL, ivarQueue, v4);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)databaseStoreFileMode
{
  return 432;
}

- (NSURL)databaseContainerDirectoryURL
{
  return (NSURL *)-[_LSDefaults databaseContainerURLWithUID:]( self,  "databaseContainerURLWithUID:",  -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"));
}

- (NSURL)databaseStoreFileURL
{
  return (NSURL *)-[_LSDefaults databaseStoreFileURLWithUID:]( self,  "databaseStoreFileURLWithUID:",  -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"));
}

- (NSURL)systemContentDatabaseStoreFileURL
{
  return (NSURL *)-[_LSDefaults systemContentDatabaseStoreFileURLWithUID:]( self,  "systemContentDatabaseStoreFileURLWithUID:",  -[_LSDefaults proxyUIDForCurrentEffectiveUID](self, "proxyUIDForCurrentEffectiveUID"));
}

- (NSURL)unremappableDatabaseStoreFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathExtension:@"unremappable"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)databaseStoreFileURLWithUID:(unsigned int)a3
{
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = getenv("LS_NAME_PREFIX");
    if (v5) {
      v6 = v5;
    }
    else {
      v6 = "com.apple.LaunchServices";
    }
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s-%03llu-v2.csstore",  v6,  -[_LSDefaults currentSchemaVersion](self, "currentSchemaVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      [v4 URLByAppendingPathComponent:v7 isDirectory:0];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)systemContentDatabaseStoreFileURLWithUID:(unsigned int)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 lastPathComponent];
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [@"SystemDataOnly-" stringByAppendingString:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByDeletingLastPathComponent];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLByAppendingPathComponent:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)preferencesFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.plist" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)preSydroFSecurePreferencesFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.launchservices.securepreferences.plist" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)securePreferencesFileURL
{
  if (-[_LSDefaults isInEducationMode](self, "isInEducationMode")) {
    -[_LSDefaults userContainerURL](self, "userContainerURL");
  }
  else {
    -[_LSDefaults systemContainerBaseURL](self, "systemContainerBaseURL");
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"com.apple.launchservices.securepreferences.plist" isDirectory:0];
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSURL)settingsStoreFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.SettingsStore.sql" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)queriedSchemesMapFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.lsdschemes.plist" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)identifiersFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.lsdidentifiers.plist" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dbSentinelFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.dirty" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)installJournalDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.InstallJournal" isDirectory:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dbRecoveryFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.error" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dbSyncInterruptedFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.syncInterrupted"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)progressProportionsStateURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"ProgressProporitions.plist" isDirectory:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)defaultAppQueryStateURL
{
  if (-[_LSDefaults isInEducationMode](self, "isInEducationMode")) {
    -[_LSDefaults userContainerURL](self, "userContainerURL");
  }
  else {
    -[_LSDefaults systemContainerBaseURL](self, "systemContainerBaseURL");
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathComponent:@"DefaultAppQueryState.plist" isDirectory:0];
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)simulatorRootURL
{
  if (simulatorRootURL_once != -1) {
    dispatch_once(&simulatorRootURL_once, &__block_literal_global_54);
  }
  return (id)simulatorRootURL_result;
}

- (id)simulatorRuntimeVersion
{
  if (simulatorRuntimeVersion_once != -1) {
    dispatch_once(&simulatorRuntimeVersion_once, &__block_literal_global_56_0);
  }
  return (id)simulatorRuntimeVersion_result;
}

- (id)simulatorRuntimeBuildVersion
{
  if (simulatorRuntimeBuildVersion_once != -1) {
    dispatch_once(&simulatorRuntimeBuildVersion_once, &__block_literal_global_58);
  }
  return (id)simulatorRuntimeBuildVersion_result;
}

- (id)classesWithNameForXCTests:(const char *)a3
{
  if (__LSDefaultsGetSharedInstance_onceToken != -1) {
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_22);
  }
  if ([(id)__LSDefaultsGetSharedInstance_sharedInstance isInXCTestRigInsecure])
  {
    [MEMORY[0x189603FE0] set];
    dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __41___LSDefaults_classesWithNameForXCTests___block_invoke;
    v7[3] = &unk_189D75AE8;
    id v8 = v4;
    v9 = a3;
    id v5 = v4;
    objc_enumerateClasses(0LL, a3, 0LL, 0LL, v7);
  }

  return 0LL;
}

- (void)setHasServer:(BOOL)a3
{
  self->_hasServer = a3;
}

- (BOOL)allowsAlternateIcons
{
  return !self->_inEducationMode;
}

- (BOOL)abortIfMayNotMapDatabase
{
  BOOL v2 = -[_LSDefaults isAppleInternal](self, "isAppleInternal");
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue( @"LSAbortIfMayNotMapDatabase",  (CFStringRef)*MEMORY[0x189605188],  0LL) != 0;
  }
  return v2;
}

- (BOOL)issueSandboxExceptionsIfMayNotMapDatabase
{
  return !-[_LSDefaults isAppleInternal](self, "isAppleInternal")
      || CFPreferencesGetAppBooleanValue( @"LSDisableDatabaseSandboxExceptions",  (CFStringRef)*MEMORY[0x189605188],  0LL) == 0;
}

- (id)serviceNameForConnectionType:(unsigned __int16)a3
{
  return -[_LSDefaults serviceNameForConnectionType:lightweightSystemService:]( self,  "serviceNameForConnectionType:lightweightSystemService:",  a3,  0LL);
}

- (id)serviceNameForConnectionType:(unsigned __int16)a3 lightweightSystemService:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  v6 = getenv("LSD_SERVICE_BASE");
  switch(v5)
  {
    case 0:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.mapdb";
        v13 = @"com.apple.lsd.system.mapdb";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".mapdb";
      goto LABEL_78;
    case 1:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.modifydb";
        v13 = @"com.apple.lsd.system.modifydb";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".modifydb";
      goto LABEL_78;
    case 2:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.openurl";
        v13 = @"com.apple.lsd.system.openurl";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".openurl";
      goto LABEL_78;
    case 3:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.open";
        v13 = @"com.apple.lsd.system.open";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".open";
      goto LABEL_78;
    case 4:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.plugin";
        v13 = @"com.apple.lsd.system.plugin";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".plugin";
      goto LABEL_78;
    case 5:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.xpc";
        v13 = @"com.apple.lsd.system.xpc";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".xpc";
      goto LABEL_78;
    case 6:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.installation";
        v13 = @"com.apple.lsd.system.installation";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".installation";
      goto LABEL_78;
    case 7:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.advertisingidentifiers";
        v13 = @"com.apple.lsd.system.advertisingidentifiers";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".advertisingidentifiers";
      goto LABEL_78;
    case 8:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.trustedsignatures";
        v13 = @"com.apple.lsd.system.trustedsignatures";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".trustedsignatures";
      goto LABEL_78;
    case 9:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.diagnostics";
        v13 = @"com.apple.lsd.system.diagnostics";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".diagnostics";
      goto LABEL_78;
    case 10:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.icons";
        v13 = @"com.apple.lsd.system.icons";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".icons";
      goto LABEL_78;
    case 11:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.dissemination";
        v13 = @"com.apple.lsd.system.dissemination";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".dissemination";
      goto LABEL_78;
    case 12:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.encryption";
        v13 = @"com.apple.lsd.system.encryption";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".encryption";
      goto LABEL_78;
    case 13:
      if (!v6 || !*v6)
      {
        BOOL v12 = @"com.apple.lsd.rebuild";
        v13 = @"com.apple.lsd.system.rebuild";
        goto LABEL_94;
      }

      v7 = (void *)NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".rebuild";
      goto LABEL_78;
    case 14:
      if (v6 && *v6)
      {
        v7 = (void *)NSString;
        id v8 = "";
        if (v4) {
          id v8 = ".system";
        }
        v9 = ".appprotection";
LABEL_78:
        objc_msgSend(v7, "stringWithFormat:", @"%s%s.%s", v6, v8, v9);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        BOOL v12 = @"com.apple.lsd.appprotection";
        v13 = @"com.apple.lsd.system.appprotection";
LABEL_94:
        if (v4) {
          BOOL v12 = (__CFString *)v13;
        }
        v11 = v12;
      }

      return v11;
    default:
      return 0LL;
  }

- (id)darwinNotificationNameForBaseName:(id)a3 optionalSessionKey:(LSSessionKey *)a4
{
  return a3;
}

- (id)databaseUpdateNotificationNameForSessionKey:(LSSessionKey)a3
{
  LSSessionKey v4 = a3;
  -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:]( self,  "darwinNotificationNameForBaseName:optionalSessionKey:",  @"com.apple.LaunchServices.database",  &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)settingsUpdateNotificationNameForUserID:(unsigned int)a3
{
  uint64_t v4 = a3;
  -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:]( self,  "darwinNotificationNameForBaseName:optionalSessionKey:",  @"com.apple.LaunchServices.settings",  &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)preferencesUpdateNotificationName
{
  return -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:]( self,  "darwinNotificationNameForBaseName:optionalSessionKey:",  @"com.apple.LaunchServices.prefs",  0LL);
}

- (id)preferencesFileChangeNotificationName
{
  return -[_LSDefaults darwinNotificationNameForBaseName:optionalSessionKey:]( self,  "darwinNotificationNameForBaseName:optionalSessionKey:",  @"com.apple.LaunchServices.prefsFile",  0LL);
}

- (BOOL)allowsUnentitledExtensionPointDeclaration
{
  return _os_feature_enabled_impl();
}

- (BOOL)nsExtensionUsesLSSettingsStore
{
  return _os_feature_enabled_impl();
}

- (double)databaseSaveInterval
{
  return 1.0;
}

- (double)databaseSaveLatency
{
  return 0.5;
}

- (int64_t)concurrentInstallOperations
{
  return 1LL;
}

- (BOOL)alwaysUseDebugOpenWithMenus
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42___LSDefaults_alwaysUseDebugOpenWithMenus__block_invoke;
  block[3] = &unk_189D72BF0;
  block[4] = self;
  if (alwaysUseDebugOpenWithMenus_once != -1) {
    dispatch_once(&alwaysUseDebugOpenWithMenus_once, block);
  }
  return alwaysUseDebugOpenWithMenus_result;
}

- (BOOL)isRegionChina
{
  if (isRegionChina_once != -1) {
    dispatch_once(&isRegionChina_once, &__block_literal_global_176);
  }
  return isRegionChina_result;
}

- (NSData)HMACSecret
{
  return (NSData *)_LSLazyLoadObjectOnQueue( (uint64_t)&self->_hmacSecret,  self->_ivarQueue,  &__block_literal_global_184_1);
}

- (id)debugDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (int i = 0; i != 15; ++i)
  {
    -[_LSDefaults serviceNameForConnectionType:](self, "serviceNameForConnectionType:", (unsigned __int16)i);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v5];
  }

  v29 = (void *)NSString;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS____LSDefaults;
  v28 = -[_LSDefaults debugDescription](&v30, sel_debugDescription);
  v27 = -[_LSDefaults databaseStoreFileURL](self, "databaseStoreFileURL");
  v26 = -[_LSDefaults queriedSchemesMapFileURL](self, "queriedSchemesMapFileURL");
  v25 = -[_LSDefaults identifiersFileURL](self, "identifiersFileURL");
  v24 = -[_LSDefaults preferencesFileURL](self, "preferencesFileURL");
  v6 = -[_LSDefaults securePreferencesFileURL](self, "securePreferencesFileURL");
  v7 = @"NO";
  if (-[_LSDefaults isServer](self, "isServer")) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  v23 = v8;
  if (-[_LSDefaults hasServer](self, "hasServer")) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v22 = v9;
  if (-[_LSDefaults isInEducationMode](self, "isInEducationMode")) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v21 = v10;
  if (-[_LSDefaults hasPersistentPreferences](self, "hasPersistentPreferences")) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if (-[_LSDefaults allowsAlternateIcons](self, "allowsAlternateIcons")) {
    BOOL v12 = @"YES";
  }
  else {
    BOOL v12 = @"NO";
  }
  if (-[_LSDefaults abortIfMayNotMapDatabase](self, "abortIfMayNotMapDatabase")) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (-[_LSDefaults isInSyncBubble](self, "isInSyncBubble")) {
    objc_super v14 = @"YES";
  }
  else {
    objc_super v14 = @"NO";
  }
  if (-[_LSDefaults isInXCTestRigInsecure](self, "isInXCTestRigInsecure")) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  if (-[_LSDefaults isAppleInternal](self, "isAppleInternal")) {
    v7 = @"YES";
  }
  -[_LSDefaults databaseSaveInterval](self, "databaseSaveInterval");
  uint64_t v17 = v16;
  -[_LSDefaults databaseSaveLatency](self, "databaseSaveLatency");
  [v29 stringWithFormat:@"%@Paths:\n\tdatabaseStoreFileURL: %@\n\tqueriedSchemesMapFileURL: %@\n\tidentifiersFileURL: %@\n\tpreferencesFileURL: %@\n\tsecurePreferencesFileURL: %@\nEnvironment:\n\tisServer: %@\n\thasServer: %@\n\tinEducationMode: %@\n\thasPersistentPreferences: %@\n\tallowsAlternateIcons: %@\n\tabortIfMayNotMapDatabase: %@\n\tinSyncBubble: %@\n\tinXCTestRigInsecure: %@\n\tappleInternal: %@\nTimeing:\n\tdatabaseSaveInterval: %lf\n\tdatabaseSaveLatency: %lf\nService names: %@", v28, v27, v26, v25, v24, v6, v23, v22, v21, v11, v12, v13, v14, v15, v7, v17, v18, v3];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)isInSyncBubble
{
  return self->_inSyncBubble;
}

- (BOOL)isAppleInternal
{
  return self->_appleInternal;
}

- (void)setServer:(BOOL)a3
{
  self->_isServer = a3;
}

- (BOOL)isLightweightSystemServer
{
  return self->_isLightweightSystemServer;
}

- (void)setLightweightSystemServer:(BOOL)a3
{
  self->_isLightweightSystemServer = a3;
}

- (BOOL)isUsingEphemeralStorage
{
  return self->_usingEphemeralStorage;
}

- (BOOL)hasPersistentPreferences
{
  return self->_hasPersistentPreferences;
}

- (void).cxx_destruct
{
}

@end