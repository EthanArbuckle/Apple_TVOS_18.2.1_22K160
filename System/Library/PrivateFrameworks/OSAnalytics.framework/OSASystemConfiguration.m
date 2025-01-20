@interface OSASystemConfiguration
+ (id)automatedDeviceGroup;
+ (id)ensureUsablePath:(id)a3 component:(id)a4 options:(id)a5;
+ (id)sharedInstance;
+ (id)uidForUser:(id)a3;
+ (int64_t)fastLane;
+ (void)ensureConformanceOfFile:(int)a3 options:(id)a4;
+ (void)fastLane;
+ (void)setAutomatedDeviceGroup:(id)a3;
- ($EE1601AF51F26AF08043821C9D6DC87A)logDomain;
- (BOOL)appleInternal;
- (BOOL)carrierInstall;
- (BOOL)isAllowed:(id)a3 forDomain:(id)a4;
- (BOOL)isComputeController;
- (BOOL)isComputeNode;
- (BOOL)isConfigEnabled:(id)a3;
- (BOOL)isProxy;
- (BOOL)isWhitelisted:(id)a3 forDomain:(id)a4;
- (BOOL)multiUserMode;
- (BOOL)optIn3rdParty;
- (BOOL)optInApple;
- (BOOL)setPrefsKey:(id)a3 value:(id)a4 forDomain:(id)a5 withSync:(BOOL)a6;
- (BOOL)usesLegacySubmission:(id)a3;
- (NSMutableDictionary)submissionMetadata;
- (NSString)automatedDeviceGroup;
- (NSString)pathAWDTasking;
- (NSString)pathCATasking;
- (NSString)pathContainerRoot;
- (NSString)pathDiagnostics;
- (NSString)pathPreferences;
- (NSString)pathRoot;
- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4;
- (id)automatedContextURL;
- (id)awdReporterKey;
- (id)buildVersion;
- (id)crashReporterKey;
- (id)createReportMetadata:(id)a3 with:(id)a4 at:(double)a5 usingOptions:(id)a6;
- (id)currentTaskingIDByRouting;
- (id)experimentGroup;
- (id)getLogBlacklist;
- (id)getPrefsKey:(id)a3 forDomain:(id)a4 withOptions:(id)a5;
- (id)getPropsForLogType:(id)a3;
- (id)getTaskingKey:(id)a3;
- (id)identifier;
- (id)internalKey;
- (id)logExt:(id)a3;
- (id)logPathForType:(id)a3 at:(double)a4 options:(id)a5;
- (id)logPrefix:(id)a3;
- (id)modelCode;
- (id)osTrain;
- (id)pairedWatchOS;
- (id)pathSubmission;
- (id)pathSubmissionDataVault;
- (id)pathSubmissionSubdirDiagnosticLogs;
- (id)pathSubmissionWithHomeDirectory:(id)a3;
- (id)productBuildString;
- (id)productName;
- (id)productNameVersionBuildString;
- (id)productReleaseString;
- (id)productVersion;
- (id)releaseType;
- (id)seedGroup;
- (id)serialNumber;
- (id)submissionParam:(id)a3;
- (id)systemId;
- (id)targetAudience;
- (id)uiCountryCode;
- (void)onceConfig;
- (void)saveToPath:(id)a3;
- (void)setAutomatedDeviceGroup:(id)a3;
- (void)setPathRoot:(id)a3;
- (void)sysVersionData;
@end

@implementation OSASystemConfiguration

+ (id)automatedDeviceGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 automatedDeviceGroup];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setAutomatedDeviceGroup:(id)a3
{
  id v3 = a3;
  +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setAutomatedDeviceGroup:v3];
}

- (BOOL)isProxy
{
  return 0;
}

- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OSASystemConfiguration;
  v5 = -[OSAProxyConfiguration assembleMetadataAt:withOptions:]( &v10,  sel_assembleMetadataAt_withOptions_,  *(void *)&a4,  a3);
  v6 = -[OSASystemConfiguration pairedWatchOS](self, "pairedWatchOS");
  [v5 setValue:v6 forKey:@"pairedWatchOS"];

  if (-[OSASystemConfiguration multiUserMode](self, "multiUserMode")) {
    uint64_t v7 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v7 = 0LL;
  }
  [v5 setValue:v7 forKey:@"multi_user_mode"];
  v8 = -[OSASystemConfiguration submissionMetadata](self, "submissionMetadata");
  [v5 addEntriesFromDictionary:v8];

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  return (id)sharedInstance__sharedInstance;
}

void __40__OSASystemConfiguration_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___OSASystemConfiguration);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
}

- (NSMutableDictionary)submissionMetadata
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__OSASystemConfiguration_submissionMetadata__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (submissionMetadata_pred != -1) {
    dispatch_once(&submissionMetadata_pred, block);
  }
  return (NSMutableDictionary *)*(id *)&self->_appleInternal;
}

void __44__OSASystemConfiguration_submissionMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 200);
  *(void *)(v3 + 200) = v2;
}

- (id)identifier
{
  return @"Primary";
}

- (BOOL)appleInternal
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__OSASystemConfiguration_appleInternal__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (appleInternal_pred != -1) {
    dispatch_once(&appleInternal_pred, block);
  }
  return *(&self->super._isComputeNode + 1);
}

uint64_t __39__OSASystemConfiguration_appleInternal__block_invoke(uint64_t a1)
{
  uint64_t result = os_variant_has_internal_diagnostics();
  *(_BYTE *)(*(void *)(a1 + 32) + 194LL) = result;
  return result;
}

- (BOOL)carrierInstall
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__OSASystemConfiguration_carrierInstall__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (carrierInstall_pred != -1) {
    dispatch_once(&carrierInstall_pred, block);
  }
  return *(&self->super._isComputeNode + 2);
}

uint64_t __40__OSASystemConfiguration_carrierInstall__block_invoke(uint64_t a1)
{
  uint64_t result = MGGetBoolAnswer();
  *(_BYTE *)(*(void *)(a1 + 32) + 195LL) = result;
  return result;
}

- (BOOL)multiUserMode
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__OSASystemConfiguration_multiUserMode__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (multiUserMode_pred != -1) {
    dispatch_once(&multiUserMode_pred, block);
  }
  return *(&self->super._isComputeNode + 3);
}

void __39__OSASystemConfiguration_multiUserMode__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) appleInternal] && !stat("/var/db/forceMultiUserMode", &v3))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v2[0]) = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Forcing Multi User Mode behavior due to the presence of /var/db/forceMultiUserMode",  (uint8_t *)v2,  2u);
    }

    goto LABEL_8;
  }

  v2[0] = 0;
  if (!host_check_multiuser_mode(0, v2) && v2[0]) {
LABEL_8:
  }
    *(_BYTE *)(*(void *)(a1 + 32) + 196LL) = 1;
}

- (id)pairedWatchOS
{
  if (pairedWatchOS_pred != -1) {
    dispatch_once(&pairedWatchOS_pred, &__block_literal_global_214);
  }
  return self->_submissionMetadata;
}

- (id)modelCode
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__OSASystemConfiguration_modelCode__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (modelCode_pred != -1) {
    dispatch_once(&modelCode_pred, block);
  }
  return self->super._modelCode;
}

void __35__OSASystemConfiguration_modelCode__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v7 = 0x100000006LL;
  memset(v6, 0, sizeof(v6));
  size_t v5 = 64LL;
  sysctl(v7, 2u, v6, &v5, 0LL, 0LL);
  uint64_t v2 = [NSString stringWithUTF8String:v6];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (void)sysVersionData
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__OSASystemConfiguration_sysVersionData__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (sysVersionData_pred != -1) {
    dispatch_once(&sysVersionData_pred, block);
  }
}

void __40__OSASystemConfiguration_sysVersionData__block_invoke(uint64_t a1)
{
  id v34 = (id)_CFCopySupplementalVersionDictionary();
  uint64_t v2 = [v34 objectForKeyedSubscript:*MEMORY[0x189604B78]];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [v34 objectForKeyedSubscript:*MEMORY[0x189604B60]];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  uint64_t v8 = [v34 objectForKeyedSubscript:*MEMORY[0x189604B68]];
  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v8;

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(const __CFString **)(v11 + 32);
  if (!v12) {
    v12 = @"???";
  }
  v13 = *(const __CFString **)(v11 + 48);
  if (!v13) {
    v13 = @"???";
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@:%@", v12, v13];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 64);
  *(void *)(v15 + 64) = v14;

  v17 = *(void **)(a1 + 32);
  v18 = (const __CFString *)v17[9];
  if (!v18) {
    v18 = @"???";
  }
  v19 = (const __CFString *)v17[4];
  if (!v19) {
    v19 = @"???";
  }
  v20 = (const __CFString *)v17[6];
  if (!v20) {
    v20 = @"???";
  }
  uint64_t v21 = [NSString stringWithFormat:@"%@ %@ (%@)", v18, v19, v20];
  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 80);
  *(void *)(v22 + 80) = v21;

  v24 = *(void **)(a1 + 32);
  if (!v24[4])
  {
    v24[4] = @"<unknown>";

    v24 = *(void **)(a1 + 32);
  }

  if (!v24[6])
  {
    v24[6] = @"<unknown>";

    v24 = *(void **)(a1 + 32);
  }

  if (!v24[9])
  {
    v24[9] = @"<unknown>";

    v24 = *(void **)(a1 + 32);
  }

  if ([v24 appleInternal])
  {
    uint64_t v25 = [NSString stringWithFormat:@"%@-internal", *(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 88);
    *(void *)(v26 + 88) = v25;

    uint64_t v28 = *(void *)(a1 + 32);
    v29 = *(void **)(v28 + 40);
    v30 = @"Internal";
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88LL), *(id *)(*(void *)(a1 + 32) + 32LL));
    uint64_t v28 = *(void *)(a1 + 32);
    v29 = *(void **)(v28 + 40);
    v30 = @"GM";
  }

  *(void *)(v28 + 40) = v30;

  uint64_t v31 = [NSString stringWithFormat:@"%@ %@", *(void *)(*(void *)(a1 + 32) + 72), *(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 56);
  *(void *)(v32 + 56) = v31;
}

- (id)productVersion
{
  return self->super._productVersion;
}

- (id)buildVersion
{
  return self->super._buildVersion;
}

- (id)productBuildString
{
  return self->super._productBuildString;
}

- (id)productName
{
  return self->super._productName;
}

- (id)productNameVersionBuildString
{
  return self->super._productNameVersionBuildString;
}

- (id)productReleaseString
{
  return self->super._productReleaseString;
}

- (id)osTrain
{
  return self->super._osTrain;
}

- (id)targetAudience
{
  return self->super._targetAudience;
}

- (id)uiCountryCode
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__OSASystemConfiguration_uiCountryCode__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (uiCountryCode_onceToken != -1) {
    dispatch_once(&uiCountryCode_onceToken, block);
  }
  if (self->super._uiCountryCode) {
    uiCountryCode = (__CFString *)self->super._uiCountryCode;
  }
  else {
    uiCountryCode = @"en";
  }
  return uiCountryCode;
}

void __39__OSASystemConfiguration_uiCountryCode__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v2;
  if (v2)
  {
    [v2 objectForKey:*MEMORY[0x189603A98]];
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = @"en";
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96LL), v3);
  id v4 = v5;
  if (v5)
  {

    id v4 = v5;
  }
}

- (id)systemId
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__OSASystemConfiguration_systemId__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (systemId_pred != -1) {
    dispatch_once(&systemId_pred, block);
  }
  return self->super._systemId;
}

void __34__OSASystemConfiguration_systemId__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) appleInternal];
  if (v2) {
    uint64_t v3 = (void *)MGCopyAnswer();
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104LL), v3);
  if (v2) {
}
  }

- (id)serialNumber
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__OSASystemConfiguration_serialNumber__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (serialNumber_pred != -1) {
    dispatch_once(&serialNumber_pred, block);
  }
  return self->super._serialNumber;
}

void __38__OSASystemConfiguration_serialNumber__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) appleInternal];
  if (v2) {
    uint64_t v3 = (__CFString *)MGCopyAnswer();
  }
  else {
    uint64_t v3 = &stru_189E21910;
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112LL), v3);
  if (v2) {
}
  }

- (id)crashReporterKey
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 crashreporterKey];
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  crashReporterKey = self->super._crashReporterKey;
  self->super._crashReporterKey = v4;

  return self->super._crashReporterKey;
}

- (id)awdReporterKey
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__OSASystemConfiguration_awdReporterKey__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (awdReporterKey_pred != -1) {
    dispatch_once(&awdReporterKey_pred, block);
  }
  return self->super._awdReporterKey;
}

void __40__OSASystemConfiguration_awdReporterKey__block_invoke(uint64_t a1)
{
  uint64_t v2 = MGCopyAnswer();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;
}

- (BOOL)setPrefsKey:(id)a3 value:(id)a4 forDomain:(id)a5 withSync:(BOOL)a6
{
  BOOL v6 = a6;
  v42[1] = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
  [v13 stringByAppendingPathComponent:@"/Library/Preferences/com.apple.OTACrashCopier.plist"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = v14;
  int v16 = open_dprotected_np((const char *)[v15 fileSystemRepresentation], 0, 0, 1);
  if (v16 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:].cold.3();
    }
LABEL_11:
    BOOL v32 = v6;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "setPrefs: delete old prefs and create placeholder",  buf,  2u);
    }

    id v19 = v15;
    unlink((const char *)[v19 fileSystemRepresentation]);
    v20 = -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
    uint64_t v41 = kPathOptionNoBackup;
    v42[0] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v20,  @"/Library/Preferences",  v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      id v23 = v19;
      uint64_t v24 = open_dprotected_np((const char *)[v23 UTF8String], 2561, 4, 0, 432);
      if ((v24 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          int v25 = *__error();
          uint64_t v26 = __error();
          v27 = strerror(*v26);
          *(_DWORD *)buf = 138413058;
          id v34 = v23;
          __int16 v35 = 1024;
          int v36 = v24;
          __int16 v37 = 1024;
          int v38 = v25;
          __int16 v39 = 2080;
          v40 = v27;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "setPrefs: not created '%@' returned %d: %d %s",  buf,  0x22u);
        }
      }

      else
      {
        +[OSASystemConfiguration ensureConformanceOfFile:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureConformanceOfFile:options:",  v24,  0LL);
        close(v24);
      }
    }

    BOOL v6 = v32;
    goto LABEL_19;
  }

  int v17 = v16;
  if (fcntl(v16, 63) == 4)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:].cold.1();
    }
    close(v17);
    goto LABEL_19;
  }

  int v18 = fcntl(v17, 64, 4LL);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:].cold.2();
  }
  close(v17);
  if (v18 == -1) {
    goto LABEL_11;
  }
LABEL_19:
  -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  _CFPreferencesSetAppValueWithContainer();

  if (v6)
  {
    v29 = -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
    BOOL v30 = _CFPreferencesAppSynchronizeWithContainer() != 0;
  }

  else
  {
    BOOL v30 = 1;
  }

  return v30;
}

- (id)getPrefsKey:(id)a3 forDomain:(id)a4 withOptions:(id)a5
{
  uint64_t v7 = (__CFString *)a3;
  uint64_t v8 = (__CFString *)a4;
  -[OSASystemConfiguration pathPreferences](self, "pathPreferences");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (-[OSASystemConfiguration pathPreferences](self, "pathPreferences"),
        id v10 = (void *)objc_claimAutoreleasedReturnValue(),
        id v11 = (void *)_CFPreferencesCopyAppValueWithContainer(),
        v10,
        !v11))
  {
    if (xpc_user_sessions_enabled())
    {
      int v24 = 0;
      if (!xpc_user_sessions_get_foreground_uid())
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.4((uint64_t)v7, &v24);
        }
        goto LABEL_15;
      }

      UserIdentifierForUID = (__CFString *)_CFPreferencesGetUserIdentifierForUID();
      if (!UserIdentifierForUID)
      {
LABEL_15:
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.2( (uint64_t)v7,  v14,  v15,  v16,  v17,  v18,  v19,  v20);
        }
        UserIdentifierForUID = 0LL;
        goto LABEL_18;
      }
    }

    else
    {
      UserIdentifierForUID = @"mobile";
    }

    CFPropertyListRef v13 = CFPreferencesCopyValue(v7, v8, UserIdentifierForUID, (CFStringRef)*MEMORY[0x189605190]);
    if (v13)
    {
      id v11 = (void *)v13;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:].cold.3();
      }
      goto LABEL_21;
    }

- (id)getTaskingKey:(id)a3
{
  return -[OSASystemConfiguration getPrefsKey:forDomain:withOptions:]( self,  "getPrefsKey:forDomain:withOptions:",  a3,  @"com.apple.da",  0LL);
}

+ (int64_t)fastLane
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 getTaskingKey:@"fastLane"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    int64_t v4 = 0LL;
    goto LABEL_8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
        +[OSASystemConfiguration fastLane].cold.1((uint64_t)v3);
      }
      goto LABEL_7;
    }
  }

  int64_t v4 = [v3 integerValue];
LABEL_8:

  return v4;
}

- (id)experimentGroup
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__OSASystemConfiguration_experimentGroup__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (experimentGroup_onceToken != -1) {
    dispatch_once(&experimentGroup_onceToken, block);
  }
  return self->super._experimentGroup;
}

void __41__OSASystemConfiguration_experimentGroup__block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v2 = v3;
  }
  else {
    uint64_t v2 = 0LL;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160LL), v2);
}

- (NSString)automatedDeviceGroup
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__OSASystemConfiguration_automatedDeviceGroup__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (automatedDeviceGroup_onceToken != -1) {
    dispatch_once(&automatedDeviceGroup_onceToken, block);
  }
  return self->super._automatedDeviceGroup;
}

void __46__OSASystemConfiguration_automatedDeviceGroup__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }

  else
  {
    [*(id *)(a1 + 32) getPrefsKey:@"AutomatedDeviceGroup" forDomain:@"com.apple.da" withOptions:0];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v6 = v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v6;
  }
  else {
    id v5 = 0LL;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168LL), v5);
}

- (void)setAutomatedDeviceGroup:(id)a3
{
  id v4 = (NSString *)a3;
  +[OSADefaults setObject:forKey:](&OBJC_CLASS___OSADefaults, "setObject:forKey:", v4, @"AutomatedDeviceGroup");
  automatedDeviceGroup = self->super._automatedDeviceGroup;
  self->super._automatedDeviceGroup = v4;
}

- (id)automatedContextURL
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__OSASystemConfiguration_automatedContextURL__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (automatedContextURL_onceToken != -1) {
    dispatch_once(&automatedContextURL_onceToken, block);
  }
  return self->super._automatedContextURL;
}

void __45__OSASystemConfiguration_automatedContextURL__block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v2 = v3;
  }
  else {
    uint64_t v2 = 0LL;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176LL), v2);
}

- (id)releaseType
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__OSASystemConfiguration_releaseType__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (releaseType_pred != -1) {
    dispatch_once(&releaseType_pred, block);
  }
  if (self->super._releaseType) {
    releaseType = (__CFString *)self->super._releaseType;
  }
  else {
    releaseType = @"User";
  }
  return releaseType;
}

void __37__OSASystemConfiguration_releaseType__block_invoke(uint64_t a1)
{
  uint64_t v2 = MGCopyAnswer();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;
}

- (id)seedGroup
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__OSASystemConfiguration_seedGroup__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (seedGroup_pred != -1) {
    dispatch_once(&seedGroup_pred, block);
  }
  return self->super._seedGroup;
}

void __35__OSASystemConfiguration_seedGroup__block_invoke(uint64_t a1)
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"SeedGroup", @".GlobalPreferences");
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;
}

- (id)currentTaskingIDByRouting
{
  return +[OSATasking getInstalledTaskIds](&OBJC_CLASS___OSATasking, "getInstalledTaskIds");
}

- (id)internalKey
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__OSASystemConfiguration_internalKey__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  return self->super._internalKey;
}

void __37__OSASystemConfiguration_internalKey__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) appleInternal])
  {
    [*(id *)(a1 + 32) serialNumber];
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPropertyListRef v2 = (void *)NSString;
    uint64_t v3 = -[__CFString length](v8, "length");
    id v4 = @"<no_sn>";
    if (v3) {
      id v4 = v8;
    }
    uint64_t v5 = [v2 stringWithFormat:@"%@%@", &stru_189E21910, v4];;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 136);
    *(void *)(v6 + 136) = v5;
  }

- (BOOL)isComputeController
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__OSASystemConfiguration_isComputeController__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (isComputeController_onceToken != -1) {
    dispatch_once(&isComputeController_onceToken, block);
  }
  return self->super._isComputeController;
}

uint64_t __45__OSASystemConfiguration_isComputeController__block_invoke(uint64_t a1)
{
  uint64_t result = MGCopyAnswer();
  *(_BYTE *)(*(void *)(a1 + 32) + 192LL) = result == *MEMORY[0x189604DE8];
  return result;
}

- (BOOL)isComputeNode
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__OSASystemConfiguration_isComputeNode__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (isComputeNode_onceToken != -1) {
    dispatch_once(&isComputeNode_onceToken, block);
  }
  return self->super._isComputeNode;
}

uint64_t __39__OSASystemConfiguration_isComputeNode__block_invoke(uint64_t a1)
{
  uint64_t result = MGCopyAnswer();
  *(_BYTE *)(*(void *)(a1 + 32) + 193LL) = result == *MEMORY[0x189604DE8];
  return result;
}

- (void)saveToPath:(id)a3
{
  id v4 = a3;
  -[OSAProxyConfiguration metadata](self, "metadata");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 stringByAppendingPathComponent:@"deviceMetadata.proxy"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 writeToFile:v5 atomically:1];
}

- (void)onceConfig
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__OSASystemConfiguration_onceConfig__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (onceConfig_pred != -1) {
    dispatch_once(&onceConfig_pred, block);
  }
}

void __36__OSASystemConfiguration_onceConfig__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896077F8] bundleForClass:objc_opt_class()];
  CFPropertyListRef v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 pathForResource:@"submissionConfig" ofType:@"plist"];

  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"/System/Library/PrivateFrameworks/OSAnalytics.framework/submissionConfig.plist";
  }
  [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"log_types"];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 216);
    *(void *)(v8 + 216) = v7;

    if ([*(id *)(a1 + 32) multiUserMode]
      && (getpid(), int v25 = "/private/var/mobile/Library/OSAnalytics/Preferences", sandbox_check()))
    {
      id v10 = 0LL;
    }

    else
    {
      +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance", v25);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 getTaskingKey:@"disabledLogs"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "componentsJoinedByString:", @", ");
            id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v12;
            CFPropertyListRef v13 = (os_log_s *)MEMORY[0x1895F8DA0];
            uint64_t v14 = "tasked blacklist: %@";
            os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
            _os_log_impl(&dword_1861AC000, v13, v15, v14, buf, 0xCu);
          }

- (id)getLogBlacklist
{
  return self->_logConfig;
}

- (id)getPropsForLogType:(id)a3
{
  id v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    -[NSString objectForKeyedSubscript:](self->_pairedWatchOS, "objectForKeyedSubscript:", v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)usesLegacySubmission:(id)a3
{
  return 0;
}

- (BOOL)isConfigEnabled:(id)a3
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"eOS"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v3 objectForKeyedSubscript:@"eOS"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v5 BOOLValue];
  }

  else
  {
    char v6 = 1;
  }

  return v6;
}

+ (id)ensureUsablePath:(id)a3 component:(id)a4 options:(id)a5
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  id v11 = v10;
  id v12 = v10;
  if (v8)
  {
    [v10 stringByAppendingPathComponent:v8];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  [v9 objectForKeyedSubscript:kPathOptionUntrusted];
  CFPropertyListRef v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    +[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance");
    os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 pathSubmission];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringByAppendingPathComponent:@"ProxiedDevice-"];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    id v12 = v12;
    if (realpath_DARWIN_EXTSN((const char *)[v12 UTF8String], (char *)v55) || *__error() == 2)
    {
      [NSString stringWithUTF8String:v55];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v12 containsString:@".."] & 1) == 0
        && v18
        && ([v18 hasPrefix:v17] & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
    }

    else
    {
      [v12 containsString:@".."];
      uint64_t v18 = 0LL;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *__error();
      uint64_t v20 = __error();
      uint64_t v21 = strerror(*v20);
      *(_DWORD *)buf = 138544386;
      id v46 = v12;
      __int16 v47 = 2114;
      v48 = v18;
      __int16 v49 = 2114;
      v50 = v17;
      __int16 v51 = 1024;
      int v52 = v19;
      __int16 v53 = 2080;
      v54 = v21;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "FAILED untrusted path validation '%{public}@' -> '%{public}@' [%{public}@]. Error: %d %s",  buf,  0x30u);
    }

    id v12 = 0LL;
    goto LABEL_14;
  }

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke(uint64_t a1, int a2)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v4 = objc_alloc_init(MEMORY[0x189607978]);
  [v4 setUsesSignificantDigits:1];
  [v4 setMaximumSignificantDigits:2];
  memset(&v41, 0, sizeof(v41));
  if (!fstat(a2, &v41) && (v41.st_mode & 0xF000) == 0x4000)
  {
    [*(id *)(a1 + 32) objectForKeyedSubscript:@"file-owner-uid"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    stat buf = v41;
    BOOL v6 = OSASetOwnership(a2, (uint64_t)&buf, v5, &unk_189E30860);

    if (!v6 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_2();
    }
    if (v41.st_gid == 250)
    {
      if ((v41.st_mode & 0x1FF) == 0x1F8) {
        goto LABEL_12;
      }
    }

    else
    {
      id v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v8 = MEMORY[0x1895F8DA0];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        gid_t st_gid = v41.st_gid;
        if (v6)
        {
          id v11 = "";
        }

        else
        {
          int v19 = __error();
          id v11 = strerror(*v19);
        }

        buf.st_dev = 138544386;
        *(void *)&buf.int st_mode = v9;
        WORD2(buf.st_ino) = 1024;
        *(_DWORD *)((char *)&buf.st_ino + 6) = st_gid;
        HIWORD(buf.st_uid) = 1024;
        buf.gid_t st_gid = 250;
        LOWORD(buf.st_rdev) = 1024;
        *(dev_t *)((char *)&buf.st_rdev + 2) = v6;
        *((_WORD *)&buf.st_rdev + 3) = 2082;
        buf.st_atimespec.tv_sec = (__darwin_time_t)v11;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "=== Attempted change gid on existing path: %{public}@ from %d to _analyticsusers (%u) with result %d %{public}s",  (uint8_t *)&buf,  0x28u);
      }

      if ((v41.st_mode & 0x1FF) == 0x1F8) {
        goto LABEL_27;
      }
    }

    int v20 = fchmod(a2, 0x1F8u);
    if (v20 == -1 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_1();
    }
    uint64_t v21 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v22 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 40);
      int st_mode = v41.st_mode;
      if (v20)
      {
        id v25 = __error();
        uint64_t v26 = strerror(*v25);
      }

      else
      {
        uint64_t v26 = "";
      }

      buf.st_dev = 138544386;
      *(void *)&buf.int st_mode = v23;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = st_mode;
      HIWORD(buf.st_uid) = 1024;
      buf.gid_t st_gid = 504;
      LOWORD(buf.st_rdev) = 1024;
      *(dev_t *)((char *)&buf.st_rdev + 2) = v20 == 0;
      *((_WORD *)&buf.st_rdev + 3) = 2082;
      buf.st_atimespec.tv_sec = (__darwin_time_t)v26;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "=== Attempted change perms on existing path: %{public}@ from 0x%X to 0x%X with result %d %{public}s",  (uint8_t *)&buf,  0x28u);
    }

LABEL_27:
    getprogname();
    OSAGetBootTime();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      uint64_t v28 = (void *)MEMORY[0x189607968];
      [MEMORY[0x189603F50] date];
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 timeIntervalSinceDate:v27];
      objc_msgSend(v28, "numberWithDouble:");
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 stringForObjectValue:v30];
      uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v31 = @"-1";
    }

    OSAGetProcessUptime();
    int v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)MEMORY[0x189607968];
      [MEMORY[0x189603F50] date];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 timeIntervalSinceDate:v32];
      objc_msgSend(v33, "numberWithDouble:");
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 stringForObjectValue:v35];
      id v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v36 = @"-1";
    }

    id v40 = *(id *)(a1 + 40);
    char v37 = v36;
    int v38 = v31;
    id v39 = v40;
    AnalyticsSendEventLazy();

    goto LABEL_12;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_3( a1,  v12,  v13,  v14,  v15,  v16,  v17,  v18);
  }
LABEL_12:
}

id __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_316(uint64_t a1)
{
  v15[14] = *MEMORY[0x1895F89C0];
  v14[0] = @"progname";
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    [NSString stringWithUTF8String:v2];
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = @"<unknown>";
  }

  v15[0] = v3;
  v15[1] = MEMORY[0x189604A80];
  v14[1] = @"create_dir";
  v14[2] = @"path";
  id v4 = *(const __CFString **)(a1 + 32);
  if (!v4) {
    id v4 = @"path sanitize failed";
  }
  v15[2] = v4;
  v14[3] = @"original_perms";
  [MEMORY[0x189607968] numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 68)];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = @"modify_perms";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 208)];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  v14[5] = @"modify_perms_success";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 209)];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v7;
  v15[6] = &unk_189E30878;
  v14[6] = @"modify_perms_value";
  v14[7] = @"original_gid";
  [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v8;
  v14[8] = @"modify_gid";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 210)];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v9;
  v14[9] = @"modify_gid_success";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 211)];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v10;
  v15[10] = &unk_189E30860;
  v14[10] = @"modify_gid_value";
  v14[11] = @"boot_time_appx";
  uint64_t v11 = *(void *)(a1 + 48);
  v15[11] = *(void *)(a1 + 40);
  v15[12] = v11;
  v14[12] = @"proc_uptime_appx";
  v14[13] = @"framework";
  v15[13] = @"OSAnalytics";
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:14];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
  return v12;
  }
}

+ (void)ensureConformanceOfFile:(int)a3 options:(id)a4
{
  id v5 = a4;
  fstat(a3, &v35);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.7();
  }
  [v5 objectForKeyedSubscript:@"file-owner-uid"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 intValue];
  if (!geteuid() && (_DWORD)v7)
  {
    uid_t st_uid = v35.st_uid;
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (st_uid == (_DWORD)v7)
    {
      if (v9) {
        +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.5(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    else
    {
      if (v9) {
        +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.6(v7, v10, v11, v12, v13, v14, v15, v16);
      }
      fchown(a3, v7, 0xFFFFFFFF);
    }
  }

  gid_t st_gid = v35.st_gid;
  BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if (st_gid == 250)
  {
    if (v18) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }

  else
  {
    if (v18) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    fchown(a3, 0xFFFFFFFF, 0xFAu);
  }

  int st_mode = v35.st_mode;
  BOOL v27 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if (st_mode == 432)
  {
    if (v27) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }

  else
  {
    if (v27) {
      +[OSASystemConfiguration ensureConformanceOfFile:options:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    fchmod(a3, 0x1B0u);
  }

- (void)setPathRoot:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__OSASystemConfiguration_setPathRoot___block_invoke;
  block[3] = &unk_189E207C8;
  block[4] = self;
  id v8 = v4;
  uint64_t v5 = setPathRoot__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&setPathRoot__onceToken, block);
  }
}

void __38__OSASystemConfiguration_setPathRoot___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) appleInternal] || (uint64_t v2 = *(void **)(a1 + 32), v2[31]))
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 248LL);
    int v8 = 138412290;
    uint64_t v9 = v3;
    id v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v5 = "unable to override default log root location because already set as %@";
    goto LABEL_5;
  }

  id v6 = (id)[v2 pathRoot];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 248LL), *(id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 248LL);
    int v8 = 138412290;
    uint64_t v9 = v7;
    id v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v5 = "overriding default log root location to %@";
LABEL_5:
    _os_log_impl(&dword_1861AC000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0xCu);
  }

- (NSString)pathRoot
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__OSASystemConfiguration_pathRoot__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (pathRoot_onceToken != -1) {
    dispatch_once(&pathRoot_onceToken, block);
  }
  return (NSString *)self->_whitelistedDomains;
}

void __34__OSASystemConfiguration_pathRoot__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) multiUserMode];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 pathContainerRoot];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 248);
    *(void *)(v5 + 248) = v4;
  }

  else
  {
    id v6 = (void *)v3[31];
    v3[31] = @"/private/var/mobile/Library";
  }
}

- (NSString)pathContainerRoot
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__OSASystemConfiguration_pathContainerRoot__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (pathContainerRoot_onceToken != -1) {
    dispatch_once(&pathContainerRoot_onceToken, block);
  }
  return self->_pathRoot;
}

void __43__OSASystemConfiguration_pathContainerRoot__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = container_system_group_path_for_identifier();
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 stringWithFileSystemRepresentation:v3 length:strlen(v3)];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 256);
    *(void *)(v6 + 256) = v5;

    free(v3);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    uint64_t v11 = 1LL;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error getting system group container: %llu",  buf,  0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 256))
  {
    *(void *)(v8 + 256) = @"/tmp";
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 256LL);
    *(_DWORD *)stat buf = 138543362;
    uint64_t v11 = v9;
    _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Using system group container: '%{public}@'",  buf,  0xCu);
  }

- (id)pathSubmission
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[OSASystemConfiguration multiUserMode](self, "multiUserMode")) {
    uint64_t v4 = @"Library/Logs/DiagnosticReports";
  }
  else {
    uint64_t v4 = @"Logs/CrashReporter";
  }
  +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v3,  v4,  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathSubmissionDataVault
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v2,  @"DiagnosticReports",  0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pathSubmissionWithHomeDirectory:(id)a3
{
  id v4 = a3;
  -[OSASystemConfiguration pathSubmission](self, "pathSubmission");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [v4 stringByStandardizingPath];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSASystemConfiguration pathSubmission](self, "pathSubmission");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringByAppendingPathComponent:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)pathSubmissionSubdirDiagnosticLogs
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v2,  @"DiagnosticLogs",  0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uidForUser:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = getpwnam((const char *)[v3 UTF8String]);
  if (v4)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v4->pw_uid];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to fetch UID from unknown user '%@'",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t v5 = 0LL;
  }

  return v5;
}

- (NSString)pathPreferences
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__OSASystemConfiguration_pathPreferences__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (pathPreferences_onceToken != -1) {
    dispatch_once(&pathPreferences_onceToken, block);
  }
  return self->_pathContainerRoot;
}

void __41__OSASystemConfiguration_pathPreferences__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) pathRoot];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v3 = @"OSAnalytics/Preferences";
  }
  uint64_t v8 = kPathOptionNoBackup;
  v9[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v2,  v3,  v4);
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v5;
}

- (NSString)pathDiagnostics
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__OSASystemConfiguration_pathDiagnostics__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (pathDiagnostics_onceToken != -1) {
    dispatch_once(&pathDiagnostics_onceToken, block);
  }
  return self->_pathPreferences;
}

void __41__OSASystemConfiguration_pathDiagnostics__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) pathRoot];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v3 = @"OSAnalytics/Diagnostics";
  }
  uint64_t v8 = kPathOptionNoBackup;
  v9[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v2,  v3,  v4);
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v5;
}

- (NSString)pathCATasking
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__OSASystemConfiguration_pathCATasking__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (pathCATasking_onceToken != -1) {
    dispatch_once(&pathCATasking_onceToken, block);
  }
  return self->_pathDiagnostics;
}

void __39__OSASystemConfiguration_pathCATasking__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) pathContainerRoot];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = kPathOptionNoBackup;
  v8[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v2,  @"/Library/CoreAnalytics",  v3);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v4;
}

- (NSString)pathAWDTasking
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__OSASystemConfiguration_pathAWDTasking__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (pathAWDTasking_onceToken != -1) {
    dispatch_once(&pathAWDTasking_onceToken, block);
  }
  return self->_pathCATasking;
}

void __40__OSASystemConfiguration_pathAWDTasking__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) pathRoot];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = kPathOptionNoBackup;
  v8[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = +[OSASystemConfiguration ensureUsablePath:component:options:]( &OBJC_CLASS___OSASystemConfiguration,  "ensureUsablePath:component:options:",  v2,  @"/Library/AWD",  v3);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v4;
}

- (id)submissionParam:(id)a3
{
  id v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[NSSet objectForKeyedSubscript:](self->_logBlacklist, "objectForKeyedSubscript:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isWhitelisted:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  if (-[OSASystemConfiguration appleInternal](self, "appleInternal"))
  {
    char v8 = 1;
  }

  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_submissionParams, "objectForKeyedSubscript:", v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v9 containsObject:v6];
  }

  return v8;
}

- (BOOL)isAllowed:(id)a3 forDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[NSDictionary objectForKeyedSubscript:](self->_submissionParams, "objectForKeyedSubscript:", v6);
  char v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = [v8 containsObject:v7];
  return (char)v6;
}

- (id)createReportMetadata:(id)a3 with:(id)a4 at:(double)a5 usingOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11) {
    uint64_t v13 = (void *)[v11 mutableCopy];
  }
  else {
    uint64_t v13 = (void *)objc_opt_new();
  }
  uint64_t v14 = v13;
  [v13 objectForKeyedSubscript:@"os_version"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[OSASystemConfiguration productNameVersionBuildString](self, "productNameVersionBuildString");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v16 forKeyedSubscript:@"os_version"];
  }

  [v14 setObject:v10 forKeyedSubscript:@"bug_type"];
  OSADateFormat(1u, a5);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setObject:v17 forKeyedSubscript:@"timestamp"];

  [v14 objectForKeyedSubscript:@"incident_id"];
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    [MEMORY[0x189607AB8] UUID];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 UUIDString];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v20 forKeyedSubscript:@"incident_id"];
  }

  return v14;
}

- (id)logPrefix:(id)a3
{
  id v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v5 objectForKeyedSubscript:@"name"];
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = @"Unknown";
  }

  return v6;
}

- (id)logExt:(id)a3
{
  v15[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[OSASystemConfiguration onceConfig](self, "onceConfig");
  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"ext"];
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"routing"];
  char v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[OSASystemConfiguration getPropsForLogType:](self, "getPropsForLogType:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 objectForKeyedSubscript:@"subrouting"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = v6;
  if (v6)
  {
LABEL_7:
    uint64_t v13 = v11;
    goto LABEL_8;
  }

  if (!v8 || !v10)
  {
    id v11 = @"ips";
    if (v8) {
      id v11 = v8;
    }
    goto LABEL_7;
  }

  v15[0] = v10;
  v15[1] = v8;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 componentsJoinedByString:@"."];
  uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v13;
}

- (id)logPathForType:(id)a3 at:(double)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v9 objectForKeyedSubscript:@"override-fileName"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v9 objectForKeyedSubscript:@"override-fileName"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    else {
      unsigned int v12 = 3;
    }
    OSADateFormat(v12, a4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v14 = 0LL;
    }
    logPathForType_at_options__collisionCount = v14;
    logPathForType_at_options__lastAbsoluteTimeSeconds = (unint64_t)a4;
    uint64_t v15 = [v9 objectForKeyedSubscript:@"override-fileExt"];
    if (!v15
      || (uint64_t v16 = (void *)v15,
          [v9 objectForKeyedSubscript:@"override-fileExt"],
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          !v17))
    {
      -[OSASystemConfiguration logExt:](self, "logExt:", v8);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v9 objectForKeyedSubscript:@"override-filePrefix"];
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      [v9 objectForKeyedSubscript:@"override-filePrefix"];
    }
    else {
      -[OSASystemConfiguration logPrefix:](self, "logPrefix:", v8);
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (![v19 length])
    {
      id v20 = v8;

      uint64_t v19 = v20;
    }

    uint64_t v21 = (void *)NSString;
    unint64_t v22 = logPathForType_at_options__collisionCount;
    if ((unint64_t)logPathForType_at_options__collisionCount < 2)
    {
      uint64_t v23 = &stru_189E21910;
    }

    else
    {
      [MEMORY[0x189607968] numberWithUnsignedLong:logPathForType_at_options__collisionCount];
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    [v21 stringWithFormat:@"%@-%@%@", v19, v13, v23];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 stringByAppendingPathExtension:v17];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 >= 2) {
  }
    }

  [v11 stringByStandardizingPath];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 pathComponents];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 objectForKeyedSubscript:@"override-filePath"];
  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    uint64_t v28 = [v9 objectForKeyedSubscript:@"override-filePath"];
LABEL_27:
    uint64_t v31 = (void *)v28;
    goto LABEL_28;
  }

  [v9 objectForKeyedSubscript:@"datavault-filePath"];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  int v30 = [v29 BOOLValue];

  if (v30)
  {
    uint64_t v28 = -[OSASystemConfiguration pathSubmissionDataVault](self, "pathSubmissionDataVault");
    goto LABEL_27;
  }

  [v9 objectForKeyedSubscript:@"file-owner"];
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSASystemConfiguration pathSubmissionForOwner:](self, "pathSubmissionForOwner:", v34);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  if ([v26 count] == 1)
  {
    [v31 stringByAppendingPathComponent:v11];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v32 = 0LL;
  }

  return v32;
}

- ($EE1601AF51F26AF08043821C9D6DC87A)logDomain
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__OSASystemConfiguration_logDomain__block_invoke;
  block[3] = &unk_189E20268;
  block[4] = self;
  if (logDomain_onceToken != -1) {
    dispatch_once(&logDomain_onceToken, block);
  }
  return ($EE1601AF51F26AF08043821C9D6DC87A)self->_pathAWDTasking;
}

void __35__OSASystemConfiguration_logDomain__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.osanalytics.daFlow", "reports");
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 296);
  *(void *)(v3 + 296) = v2;
}

- (void).cxx_destruct
{
}

- (BOOL)optInApple
{
  return checkMCFeature("MCFeatureDiagnosticsSubmissionAllowed", &optInApple_featureDiagnosticsSubmissionAllowed);
}

- (BOOL)optIn3rdParty
{
  return checkMCFeature("MCFeatureAppAnalyticsAllowed", &optIn3rdParty_featureAppAnalyticsAllowed);
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.1()
{
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.2()
{
  v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x22u);
}

- (void)setPrefsKey:value:forDomain:withSync:.cold.3()
{
  v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x1Cu);
  OUTLINED_FUNCTION_13();
}

- (void)getPrefsKey:forDomain:withOptions:.cold.1()
{
}

- (void)getPrefsKey:(uint64_t)a3 forDomain:(uint64_t)a4 withOptions:(uint64_t)a5 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getPrefsKey:forDomain:withOptions:.cold.3()
{
}

- (void)getPrefsKey:(uint64_t)a1 forDomain:(int *)a2 withOptions:.cold.4(uint64_t a1, int *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v2 = *a2;
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = v2;
  __int16 v7 = 2082;
  uint64_t v8 = xpc_strerror();
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Attempted xpc_user_sessions_get_foreground_uid() while fetching preferences for key %{public}@ but failed with error %{public}d - %{public}s",  (uint8_t *)&v3,  0x1Cu);
  OUTLINED_FUNCTION_13();
}

- (void)getPrefsKey:(void *)a1 forDomain:withOptions:.cold.5(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v2,  "found containerized defaults from %@: %@",  v3,  v4,  v5,  v6,  2u);

  OUTLINED_FUNCTION_2();
}

+ (void)fastLane
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_fault_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Unexpected tasking value type for key 'fastLane' (type: %{public}@, value: %{public}@) encountered",  (uint8_t *)&v4,  0x16u);

  OUTLINED_FUNCTION_2();
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_1()
{
  uint64_t v0 = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v1,  "failed to modify permissions of %@: %s",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_2()
{
  uint64_t v0 = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v1,  "failed to modify ownership of %@: %s",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

void __61__OSASystemConfiguration_ensureUsablePath_component_options___block_invoke_cold_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:(uint64_t)a3 options:(uint64_t)a4 .cold.6( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)ensureConformanceOfFile:options:.cold.7()
{
}

@end