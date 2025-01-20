@interface SUCorePolicyMacRecoveryOSUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)installedRecoveryOSBuildVersion;
- (NSString)installedRecoveryOSProductVersion;
- (NSString)installedRecoveryOSReleaseType;
- (NSString)installedRecoveryOSRestoreVersion;
- (NSString)installedSFRRestoreVersion;
- (SUCorePolicyMacRecoveryOSUpdate)initWithAssetType:(id)a3 targetRestoreVersion:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6;
- (SUCorePolicyMacRecoveryOSUpdate)initWithCoder:(id)a3;
- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5;
- (void)setInstalledRecoveryOSBuildVersion:(id)a3;
- (void)setInstalledRecoveryOSProductVersion:(id)a3;
- (void)setInstalledRecoveryOSReleaseType:(id)a3;
- (void)setInstalledRecoveryOSRestoreVersion:(id)a3;
- (void)setInstalledSFRRestoreVersion:(id)a3;
@end

@implementation SUCorePolicyMacRecoveryOSUpdate

- (SUCorePolicyMacRecoveryOSUpdate)initWithAssetType:(id)a3 targetRestoreVersion:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v11 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( &v30,  sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_,  a3,  0LL,  a5,  a6);
  v12 = v11;
  if (v11)
  {
    v29.receiver = v11;
    v29.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
    -[SUCorePolicy setTargetRestoreVersion:](&v29, sel_setTargetRestoreVersion_, v10);
    -[SUCorePolicy setDisableSplatCombo:](v12, "setDisableSplatCombo:", 1LL);
    [MEMORY[0x189612770] sharedDevice];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 sfrRestoreVersion];
    installedSFRRestoreVersion = v12->_installedSFRRestoreVersion;
    v12->_installedSFRRestoreVersion = (NSString *)v14;

    [MEMORY[0x189612770] sharedDevice];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 recoveryOSBuildVersion];
    installedRecoveryOSBuildVersion = v12->_installedRecoveryOSBuildVersion;
    v12->_installedRecoveryOSBuildVersion = (NSString *)v17;

    [MEMORY[0x189612770] sharedDevice];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 recoveryOSProductVersion];
    installedRecoveryOSProductVersion = v12->_installedRecoveryOSProductVersion;
    v12->_installedRecoveryOSProductVersion = (NSString *)v20;

    [MEMORY[0x189612770] sharedDevice];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 recoveryOSRestoreVersion];
    installedRecoveryOSRestoreVersion = v12->_installedRecoveryOSRestoreVersion;
    v12->_installedRecoveryOSRestoreVersion = (NSString *)v23;

    [MEMORY[0x189612770] sharedDevice];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 recoveryOSReleaseType];
    installedRecoveryOSReleaseType = v12->_installedRecoveryOSReleaseType;
    v12->_installedRecoveryOSReleaseType = (NSString *)v26;
  }

  return v12;
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[SUCorePolicyMacRecoveryOSUpdate description](self, "description");
    *(_DWORD *)buf = 138543362;
    id v88 = v8;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for SUCorePolicyMacRecoveryOSUpdate: %{public}@",  buf,  0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x189611118]);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v9 setAdditionalServerParams:v10];

  v85.receiver = self;
  v85.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v11 = -[SUCorePolicy softwareUpdateScanPolicy](&v85, sel_softwareUpdateScanPolicy);
  objc_msgSend(v9, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  v84.receiver = self;
  v84.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v12 = -[SUCorePolicy softwareUpdateScanPolicy](&v84, sel_softwareUpdateScanPolicy);
  objc_msgSend(v9, "setRequiresPowerPluggedIn:", objc_msgSend(v12, "requiresPowerPluggedIn"));

  v83.receiver = self;
  v83.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v13 = -[SUCorePolicy softwareUpdateScanPolicy](&v83, sel_softwareUpdateScanPolicy);
  objc_msgSend(v9, "setLiveServerCatalogOnly:", objc_msgSend(v13, "liveServerCatalogOnly"));

  v67 = v5;
  [v9 setSessionId:v5];
  [v9 additionalServerParams];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  [v14 setSafeObject:v15 forKey:@"TargetRestoreVersion"];

  [v9 additionalServerParams];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setSafeObject:v17 forKey:@"InstalledSFRVersion"];

  [v9 additionalServerParams];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  [v18 setSafeObject:v19 forKey:@"InstalledSFRRestoreVersion"];

  [v9 additionalServerParams];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  [v20 setSafeObject:v21 forKey:@"InstalledRecoveryOSRestoreVersion"];

  [v9 additionalServerParams];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 setSafeObject:v23 forKey:@"InstalledRecoveryOSVersion"];

  [v9 additionalServerParams];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  [v24 setSafeObject:v25 forKey:@"ReleaseType"];

  [v9 additionalServerParams];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  v82.receiver = self;
  v82.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v27 = -[SUCorePolicy productType](&v82, sel_productType);
  [v26 setSafeObject:v27 forKey:@"ProductType"];

  [v9 additionalServerParams];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v81.receiver = self;
  v81.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy hwModelStr](&v81, sel_hwModelStr);
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 setSafeObject:v29 forKey:@"HWModelStr"];

  [v9 additionalServerParams];
  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue();
  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v31 = -[SUCorePolicy deviceClass](&v80, sel_deviceClass);
  [v30 setSafeObject:v31 forKey:@"DeviceName"];

  [v9 additionalServerParams];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x189607968];
  v79.receiver = self;
  v79.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v34 = -[SUCorePolicy softwareUpdateScanPolicy](&v79, sel_softwareUpdateScanPolicy);
  objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "allowSameVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 setSafeObject:v35 forKey:@"AllowSameBuildVersion"];

  [v9 additionalServerParams];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x189607968];
  v78.receiver = self;
  v78.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v38 = -[SUCorePolicy softwareUpdateScanPolicy](&v78, sel_softwareUpdateScanPolicy);
  objc_msgSend(v37, "numberWithBool:", objc_msgSend(v38, "allowSameVersion"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 setSafeObject:v39 forKey:@"AllowSameRestoreVersion"];

  v77.receiver = self;
  v77.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v40 = -[SUCorePolicy prerequisiteBuildVersion](&v77, sel_prerequisiteBuildVersion);
  [v9 setPrerequisiteProductVersion:v40];

  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v41 = -[SUCorePolicy prerequisiteProductVersion](&v76, sel_prerequisiteProductVersion);
  [v9 setPrerequisiteBuildVersion:v41];
  v42 = -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  if (v42)
  {
    v75.receiver = self;
    v75.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
    v43 = -[SUCorePolicy downloadAuthorizationHeader](&v75, sel_downloadAuthorizationHeader);
    [v9 setDownloadAuthorizationHeader:v43];
  }

  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v44 = -[SUCorePolicy softwareUpdateScanPolicy](&v74, sel_softwareUpdateScanPolicy);
  [v44 additionalServerParams];
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    [v9 additionalServerParams];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v73.receiver = self;
    v73.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
    v47 = -[SUCorePolicy softwareUpdateScanPolicy](&v73, sel_softwareUpdateScanPolicy);
    [v47 additionalServerParams];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 addEntriesFromDictionary:v48];
  }

  [MEMORY[0x189607940] stringWithString:@"|"];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 sessionId];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 appendFormat:@"scanUUID:%@|", v50];

  [v9 additionalServerParams];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 appendFormat:@"additionalServerParams:%@|", v51];

  [MEMORY[0x1896127A0] sharedLogger];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 oslog];
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v88 = v49;
    _os_log_impl( &dword_187A54000,  v53,  OS_LOG_TYPE_DEFAULT,  "[POLICY] MacRecoveryOSUpdate catalog download options summary: %{public}@",  buf,  0xCu);
  }

  v66 = v49;

  [MEMORY[0x1896127A0] sharedLogger];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 oslog];
  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v88 = v9;
    _os_log_impl( &dword_187A54000,  v55,  OS_LOG_TYPE_DEFAULT,  "[POLICY] MacRecoveryOSUpdate catalog downloadOptions: %{public}@",  buf,  0xCu);
  }

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v56 = -[SUCorePolicy policyExtensions](&v68, sel_policyExtensions);
  uint64_t v57 = [v56 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v70;
    do
    {
      for (uint64_t i = 0LL; i != v58; ++i)
      {
        if (*(void *)v70 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 oslog];
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          [v61 extensionName];
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          id v88 = v64;
          _os_log_impl( &dword_187A54000,  v63,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending MacRecoveryOSUpdate catalog download options for extension %{public}@",  buf,  0xCu);
        }

        [v61 extendMASoftwareUpdateCatalogDownloadOptions:v9];
      }

      uint64_t v58 = [v56 countByEnumeratingWithState:&v69 objects:v86 count:16];
    }

    while (v58);
  }

  return v9;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicyMacRecoveryOSUpdate constructSoftwareUpdateMAAssetQueryWithPurpose:]( self,  "constructSoftwareUpdateMAAssetQueryWithPurpose:",  0LL);
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607940] stringWithString:@"|"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE8] null];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc(MEMORY[0x1896110F0]);
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v8 = -[SUCorePolicy softwareUpdateAssetType](&v40, sel_softwareUpdateAssetType);
  v35 = v4;
  id v9 = (void *)[v7 initWithType:v8 andPurpose:v4];

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = objc_alloc(MEMORY[0x189603FA8]);
  v12 = v11;
  if (v10)
  {
    v13 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
    uint64_t v14 = (void *)objc_msgSend(v12, "initWithObjects:", v6, v13, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v14];
  }

  else
  {
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v6, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v13];
  }
  v15 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
  [v5 appendFormat:@"hwModelStr:%@|", v15];
  v16 = -[SUCorePolicy productType](self, "productType");
  id v17 = objc_alloc(MEMORY[0x189603FA8]);
  v18 = v17;
  if (v16)
  {
    v19 = -[SUCorePolicy productType](self, "productType");
    uint64_t v20 = (void *)objc_msgSend(v18, "initWithObjects:", v6, v19, 0);
    [v9 addKeyValueArray:@"SupportedDevices" with:v20];
  }

  else
  {
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v6, 0);
    [v9 addKeyValueArray:@"SupportedDevices" with:v19];
  }
  v21 = -[SUCorePolicy productType](self, "productType");
  [v5 appendFormat:@"productType:%@|", v21];

  [MEMORY[0x1896127A0] sharedLogger];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 oslog];
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v5;
    _os_log_impl( &dword_187A54000,  v23,  OS_LOG_TYPE_DEFAULT,  "[POLICY] querying MacRecoveryOSUpdate metadata: %{public}@",  buf,  0xCu);
  }

  v34 = v5;

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  v24 = -[SUCorePolicy policyExtensions](self, "policyExtensions");
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t i = 0LL; i != v26; ++i)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_super v29 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        objc_super v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 oslog];
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          [v29 extensionName];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v32;
          _os_log_impl( &dword_187A54000,  v31,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending MacRecoveryOSUpdate query for extension %{public}@",  buf,  0xCu);
        }

        [v29 extendSoftwareUpdateMAAssetQuery:v9];
      }

      uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v26);
  }

  return v9;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = v8;
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (!a3)
  {
    [MEMORY[0x189612778] sharedDiag];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:@"Select MacRecoveryOSUpdate called with unexpected nil primaryAsset param" withResult:8102 withError:0];
    goto LABEL_57;
  }

  objc_msgSend(v8, "SUCoreBorder_results");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 count];
  [MEMORY[0x1896127A0] sharedLogger];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  os_log_t log = v13;
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 MacRecoveryOSUpdate query results (before filtering)",  buf,  2u);
    }

    goto LABEL_56;
  }

  if (v14)
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v77 = [v10 count];
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu MacRecoveryOSUpdate query results (before filtering)",  buf,  0xCu);
  }

  v60 = a3;
  v61 = a4;
  v62 = v9;

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v71,  v80,  16LL);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v72;
    do
    {
      uint64_t v18 = 0LL;
      v19 = v10;
      do
      {
        if (*(void *)v72 != v17) {
          objc_enumerationMutation(log);
        }
        uint64_t v20 = *(void **)(*((void *)&v71 + 1) + 8 * v18);
        [v20 filterSoftwareUpdateAssetArray:v19];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x1896127A0] sharedLogger];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 oslog];
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [v10 count];
          [v20 extensionName];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          uint64_t v77 = v23;
          __int16 v78 = 2114;
          objc_super v79 = v24;
          _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu MacRecoveryOSUpdate assets left after filtering from SUCorePolicyExtension %{public}@",  buf,  0x16u);
        }

        if (![v10 count])
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          [v48 oslog];
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_187A54000,  v49,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 MacRecoveryOSUpdate assets found, stopping filtering early",  buf,  2u);
          }

          id v9 = v62;
          goto LABEL_56;
        }

        ++v18;
        v19 = v10;
      }

      while (v16 != v18);
      uint64_t v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v71,  v80,  16LL);
    }

    while (v16);
  }

  [v10 sortedArrayUsingComparator:&__block_literal_global_3];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 lastObject];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 attributes];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 safeStringForKey:@"RestoreVersion"];
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_super v29 = (void *)MEMORY[0x1896079C8];
  v69[0] = MEMORY[0x1895F87A8];
  v69[1] = 3221225472LL;
  v69[2] = __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2;
  v69[3] = &unk_18A0EF9C0;
  id v59 = v28;
  id v70 = v59;
  [v29 predicateWithBlock:v69];
  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_t log = (os_log_t)v25;
  [v25 filteredArrayUsingPredicate:v30];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 oslog];
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [v31 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v77 = v34;
    _os_log_impl( &dword_187A54000,  v33,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for highest MacRecoveryOSUpdate assets in SUCorePolicyMacRecoveryOSUpdate",  buf,  0xCu);
  }

  v63 = v10;

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v35 = v31;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (!v36)
  {
    __int128 v38 = 0LL;
    __int128 v39 = 0LL;
    goto LABEL_44;
  }

  uint64_t v37 = v36;
  __int128 v38 = 0LL;
  __int128 v39 = 0LL;
  uint64_t v40 = *(void *)v66;
  do
  {
    for (uint64_t i = 0LL; i != v37; ++i)
    {
      if (*(void *)v66 != v40) {
        objc_enumerationMutation(v35);
      }
      v42 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      if (v38
        || ([*(id *)(*((void *)&v65 + 1) + 8 * i) attributes],
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            [v45 safeStringForKey:@"PrerequisiteBuild"],
            v46 = (void *)objc_claimAutoreleasedReturnValue(),
            v46,
            v45,
            !v46))
      {
        if (v39) {
          continue;
        }
        [v42 attributes];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 safeStringForKey:@"PrerequisiteBuild"];
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          __int128 v39 = 0LL;
          continue;
        }

        __int128 v39 = v42;
      }

      else
      {
        __int128 v38 = v42;
      }

      id v47 = v42;
    }

    uint64_t v37 = [v35 countByEnumeratingWithState:&v65 objects:v75 count:16];
  }

  while (v37);
LABEL_44:
  v50 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  int v51 = [v50 restrictToFull];

  if (v51)
  {
    id v52 = v39;
    id v53 = 0LL;
    id v9 = v62;
    id v10 = v63;
    v54 = v61;
    goto LABEL_53;
  }
  v55 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  int v56 = [v55 restrictToIncremental];

  id v9 = v62;
  id v10 = v63;
  v54 = v61;
  if (v56)
  {
    id v57 = v38;
    goto LABEL_51;
  }

  if (v38 || !v39)
  {
    id v52 = v38;
    id v53 = v39;
  }

  else
  {
    id v57 = v39;
LABEL_51:
    id v52 = v57;
    id v53 = 0LL;
  }

uint64_t __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 attributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"RestoreVersion"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 attributes];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 safeStringForKey:@"RestoreVersion"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v6];
  id v10 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

uint64_t __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"RestoreVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [MEMORY[0x189612760] stringIsEqual:*(void *)(a1 + 32) to:v4];
  [MEMORY[0x1896127A0] sharedLogger];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = @"NO";
    int v11 = 138543874;
    if ((_DWORD)v5) {
      id v9 = @"YES";
    }
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    BOOL v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering highest MacRecoveryOSUpdate restore version, highestRestoreVersion=%{public}@, assetRestoreVers ion=%{public}@ | keep=%{public}@",  (uint8_t *)&v11,  0x20u);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyMacRecoveryOSUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  uint64_t v5 = -[SUCorePolicy initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledSFRRestoreVersion"];
    installedSFRRestoreVersion = v5->_installedSFRRestoreVersion;
    v5->_installedSFRRestoreVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSBuildVersion"];
    installedRecoveryOSBuildVersion = v5->_installedRecoveryOSBuildVersion;
    v5->_installedRecoveryOSBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSProductVersion"];
    installedRecoveryOSProductVersion = v5->_installedRecoveryOSProductVersion;
    v5->_installedRecoveryOSProductVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSRestoreVersion"];
    installedRecoveryOSRestoreVersion = v5->_installedRecoveryOSRestoreVersion;
    v5->_installedRecoveryOSRestoreVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSReleaseType"];
    installedRecoveryOSReleaseType = v5->_installedRecoveryOSReleaseType;
    v5->_installedRecoveryOSReleaseType = (NSString *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  id v4 = a3;
  -[SUCorePolicy encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion]( self,  "installedSFRRestoreVersion",  v10.receiver,  v10.super_class);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"InstalledSFRRestoreVersion"];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"InstalledRecoveryOSBuildVersion"];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"InstalledRecoveryOSProductVersion"];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"InstalledRecoveryOSRestoreVersion"];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"InstalledRecoveryOSReleaseType"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyMacRecoveryOSUpdate *)a3;
  if (v4 == self)
  {
    char v21 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v5 = v4;
      v27.receiver = self;
      v27.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
      if (-[SUCorePolicy isEqual:](&v27, sel_isEqual_, v5))
      {
        uint64_t v6 = (void *)MEMORY[0x189612760];
        -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](v5, "installedSFRRestoreVersion");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v6 stringIsEqual:v7 to:v8])
        {
          id v9 = (void *)MEMORY[0x189612760];
          -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
          objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](v5, "installedRecoveryOSBuildVersion");
          int v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v9 stringIsEqual:v10 to:v11])
          {
            uint64_t v12 = (void *)MEMORY[0x189612760];
            -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion]( self,  "installedRecoveryOSProductVersion");
            __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion]( v5,  "installedRecoveryOSProductVersion");
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "stringIsEqual:to:", v13))
            {
              uint64_t v25 = v13;
              uint64_t v14 = (void *)MEMORY[0x189612760];
              uint64_t v15 = -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion]( self,  "installedRecoveryOSRestoreVersion");
              uint64_t v16 = -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion]( v5,  "installedRecoveryOSRestoreVersion");
              v24 = (void *)v15;
              uint64_t v17 = v15;
              uint64_t v18 = (void *)v16;
              if ([v14 stringIsEqual:v17 to:v16])
              {
                uint64_t v23 = (void *)MEMORY[0x189612760];
                v19 = -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType]( self,  "installedRecoveryOSReleaseType");
                -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](v5, "installedRecoveryOSReleaseType");
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
                char v21 = [v23 stringIsEqual:v19 to:v20];
              }

              else
              {
                char v21 = 0;
              }

              __int16 v13 = v25;
            }

            else
            {
              char v21 = 0;
            }
          }

          else
          {
            char v21 = 0;
          }
        }

        else
        {
          char v21 = 0;
        }
      }

      else
      {
        char v21 = 0;
      }
    }

    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  id v5 = -[SUCorePolicy copyWithZone:](&v17, sel_copyWithZone_);
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setInstalledSFRRestoreVersion:v7];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v8 copyWithZone:a3];
  [v5 setInstalledRecoveryOSBuildVersion:v9];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = (void *)[v10 copyWithZone:a3];
  [v5 setInstalledRecoveryOSProductVersion:v11];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v13 = (void *)[v12 copyWithZone:a3];
  [v5 setInstalledRecoveryOSRestoreVersion:v13];

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [v5 setInstalledRecoveryOSReleaseType:v15];

  return v5;
}

- (id)description
{
  v3 = (void *)NSString;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  -[SUCorePolicy description](&v12, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"SUCorePolicyMacRecoveryOSUpdate(super:%@|installedSFRRestoreVersion:%@|installedRecoveryOSBuildVersion:%@|installedRecoveryOSProductVersion:%@|installedRecoveryOSRestoreVersion:%@|installedRecoveryOSReleaseType:%@)", v4, v5, v6, v7, v8, v9];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)summary
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacRecoveryOSUpdate;
  v3 = -[SUCorePolicy summary](&v21, sel_summary);
  -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedSFRRestoreVersion](self, "installedSFRRestoreVersion");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v3 stringByAppendingFormat:@"installedSFRRestoreVersion:%@|", v5];

    v3 = (void *)v6;
  }

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSBuildVersion](self, "installedRecoveryOSBuildVersion");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v3 stringByAppendingFormat:@"installedRecoveryOSBuildVersion:%@|", v8];

    v3 = (void *)v9;
  }

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSProductVersion](self, "installedRecoveryOSProductVersion");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v3 stringByAppendingFormat:@"installedRecoveryOSProductVersion:%@|", v11];

    v3 = (void *)v12;
  }

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSRestoreVersion](self, "installedRecoveryOSRestoreVersion");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v3 stringByAppendingFormat:@"installedRecoveryOSRestoreVersion:%@|", v14];

    v3 = (void *)v15;
  }

  -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SUCorePolicyMacRecoveryOSUpdate installedRecoveryOSReleaseType](self, "installedRecoveryOSReleaseType");
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v3 stringByAppendingFormat:@"installedRecoveryOSReleaseType:%@|", v17];

    v3 = (void *)v18;
  }

  if (([v3 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v19 = [v3 stringByAppendingString:@"|"];

    v3 = (void *)v19;
  }

  return v3;
}

- (NSString)installedSFRRestoreVersion
{
  return self->_installedSFRRestoreVersion;
}

- (void)setInstalledSFRRestoreVersion:(id)a3
{
}

- (NSString)installedRecoveryOSBuildVersion
{
  return self->_installedRecoveryOSBuildVersion;
}

- (void)setInstalledRecoveryOSBuildVersion:(id)a3
{
}

- (NSString)installedRecoveryOSProductVersion
{
  return self->_installedRecoveryOSProductVersion;
}

- (void)setInstalledRecoveryOSProductVersion:(id)a3
{
}

- (NSString)installedRecoveryOSRestoreVersion
{
  return self->_installedRecoveryOSRestoreVersion;
}

- (void)setInstalledRecoveryOSRestoreVersion:(id)a3
{
}

- (NSString)installedRecoveryOSReleaseType
{
  return self->_installedRecoveryOSReleaseType;
}

- (void)setInstalledRecoveryOSReleaseType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end