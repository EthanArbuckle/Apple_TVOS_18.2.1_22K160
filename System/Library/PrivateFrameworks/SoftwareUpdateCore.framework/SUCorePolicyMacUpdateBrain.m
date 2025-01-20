@interface SUCorePolicyMacUpdateBrain
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)compatibilityVersion;
- (NSString)majorTargetBuildVersion;
- (NSString)minorTargetBuildVersion;
- (SUCorePolicyMacUpdateBrain)initWithAssetType:(id)a3 majorTargetBuild:(id)a4 minorTargetBuild:(id)a5 usingPolicies:(int64_t)a6 usingExtensions:(id)a7;
- (SUCorePolicyMacUpdateBrain)initWithCoder:(id)a3;
- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7;
- (void)setCompatibilityVersion:(id)a3;
- (void)setMajorTargetBuildVersion:(id)a3;
- (void)setMinorTargetBuildVersion:(id)a3;
@end

@implementation SUCorePolicyMacUpdateBrain

- (SUCorePolicyMacUpdateBrain)initWithAssetType:(id)a3 majorTargetBuild:(id)a4 minorTargetBuild:(id)a5 usingPolicies:(int64_t)a6 usingExtensions:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v15 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( &v19,  sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_,  a3,  0LL,  a6,  a7);
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x189607968] numberWithInt:20];
    compatibilityVersion = v15->_compatibilityVersion;
    v15->_compatibilityVersion = (NSNumber *)v16;

    objc_storeStrong((id *)&v15->_majorTargetBuildVersion, a4);
    objc_storeStrong((id *)&v15->_minorTargetBuildVersion, a5);
  }

  return v15;
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v53 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[SUCorePolicyMacUpdateBrain description](self, "description");
    *(_DWORD *)buf = 138543362;
    id v71 = v7;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for MacUpdateBrainPolicy: %{public}@",  buf,  0xCu);
  }

  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v8 = -[SUCorePolicy softwareUpdateScanPolicy](&v68, sel_softwareUpdateScanPolicy);
  [v8 additionalServerParams];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
  v12 = -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  if (v12)
  {
    -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 addObject:v13];
  }

  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    [v11 addObject:v15];
  }

  v52 = v11;
  [v10 setSafeObject:v11 forKey:@"TargetBuildVersionArray"];
  v67.receiver = self;
  v67.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy productType](&v67, sel_productType);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setSafeObject:v16 forKey:@"ProductType"];

  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v17 = -[SUCorePolicy hwModelStr](&v66, sel_hwModelStr);
  [v10 setSafeObject:v17 forKey:@"HWModelStr"];

  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v18 = -[SUCorePolicy deviceClass](&v65, sel_deviceClass);
  [v10 setSafeObject:v18 forKey:@"DeviceName"];

  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy prerequisiteBuildVersion](&v64, sel_prerequisiteBuildVersion);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setSafeObject:v19 forKey:@"BuildVersion"];
  v20 = -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  [v10 setSafeObject:v20 forKey:@"CompatibilityVersion"];

  id v21 = objc_alloc_init(MEMORY[0x189611118]);
  [v21 setDiscretionary:0];
  [v21 setSessionId:v53];
  [v21 setAdditionalServerParams:v10];
  v22 = -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  if (v22)
  {
    v63.receiver = self;
    v63.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
    v23 = -[SUCorePolicy downloadAuthorizationHeader](&v63, sel_downloadAuthorizationHeader);
    [v21 setDownloadAuthorizationHeader:v23];
  }

  [MEMORY[0x189607940] stringWithString:@"|"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 sessionId];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 appendFormat:@"scanUUID:%@|", v25];
  v26 = -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  [v24 appendFormat:@"CompatibilityVersion:%@|", v26];

  [v11 componentsJoinedByString:@","];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 appendFormat:@"TargetBuildVersionArray:%@|", v27];

  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v28 = -[SUCorePolicy productType](&v62, sel_productType);
  if (v28)
  {
    v29 = -[SUCorePolicy productType](self, "productType");
    [v24 appendFormat:@"ProductType:%@|", v29];
  }

  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v30 = -[SUCorePolicy hwModelStr](&v61, sel_hwModelStr);
  if (v30)
  {
    v31 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
    [v24 appendFormat:@"HWModelStr:%@|", v31];
  }

  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v32 = -[SUCorePolicy deviceClass](&v60, sel_deviceClass);
  if (v32)
  {
    v33 = -[SUCorePolicy deviceClass](self, "deviceClass");
    [v24 appendFormat:@"DeviceClass:%@|", v33];
  }

  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v34 = -[SUCorePolicy prerequisiteBuildVersion](&v59, sel_prerequisiteBuildVersion);
  if (v34)
  {
    v35 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    [v24 appendFormat:@"BuildVersion:%@|", v35];
  }

  v51 = v10;
  [MEMORY[0x1896127A0] sharedLogger];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 oslog];
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v71 = v24;
    _os_log_impl( &dword_187A54000,  v37,  OS_LOG_TYPE_DEFAULT,  "[POLICY] MacUpdateBrain catalog download options summary: %{public}@",  buf,  0xCu);
  }

  v50 = v24;

  [MEMORY[0x1896127A0] sharedLogger];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 oslog];
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v71 = v21;
    _os_log_impl( &dword_187A54000,  v39,  OS_LOG_TYPE_DEFAULT,  "[POLICY] MacUpdateBrain catalog downloadOptions: %{public}@",  buf,  0xCu);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v40 = -[SUCorePolicy policyExtensions](&v54, sel_policyExtensions);
  uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v56;
    do
    {
      for (uint64_t i = 0LL; i != v42; ++i)
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        [v46 oslog];
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          [v45 extensionName];
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          id v71 = v48;
          _os_log_impl( &dword_187A54000,  v47,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending MacUpdateBrain catalog download options for extension %{public}@",  buf,  0xCu);
        }

        [v45 extendMASoftwareUpdateCatalogDownloadOptions:v21];
      }

      uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v69 count:16];
    }

    while (v42);
  }

  return v21;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicyMacUpdateBrain constructSoftwareUpdateMAAssetQueryWithPurpose:]( self,  "constructSoftwareUpdateMAAssetQueryWithPurpose:",  0LL);
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607940] stringWithString:@"|"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE8] null];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc(MEMORY[0x1896110F0]);
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v8 = -[SUCorePolicy softwareUpdateAssetType](&v55, sel_softwareUpdateAssetType);
  v46 = v4;
  v9 = (void *)[v7 initWithType:v8 andPurpose:v4];

  id v10 = (void *)NSString;
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", @"%d", objc_msgSend(v11, "intValue"));

  [v9 addKeyValuePair:@"_CompatibilityVersion" with:v12];
  v44 = (void *)v12;
  [v5 appendFormat:@"CompatibilityVersion:%@", v12];
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy hwModelStr](&v54, sel_hwModelStr);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  id v14 = objc_alloc(MEMORY[0x189603FA8]);
  v15 = v14;
  if (v13)
  {
    v53.receiver = self;
    v53.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
    -[SUCorePolicy hwModelStr](&v53, sel_hwModelStr);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithObjects:", v6, v16, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v17];
  }

  else
  {
    uint64_t v16 = (void *)objc_msgSend(v14, "initWithObjects:", v6, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v16];
  }
  v18 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
  [v5 appendFormat:@"hwModelStr:%@|", v18];

  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy productType](&v52, sel_productType);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x189603FA8]);
    v51.receiver = self;
    v51.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
    -[SUCorePolicy productType](&v51, sel_productType);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithObjects:", v6, v21, 0);
    [v9 addKeyValueArray:@"SupportedDevices" with:v22];
  }
  v23 = -[SUCorePolicy productType](self, "productType");
  [v5 appendFormat:@"productType:%@|", v23];

  id v24 = objc_alloc_init(MEMORY[0x189603FA8]);
  v25 = -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  if (v25)
  {
    v26 = -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    [v24 addObject:v26];
  }
  v27 = -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  if (v27)
  {
    v28 = -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    [v24 addObject:v28];
  }

  [v24 addObject:v6];
  v29 = v9;
  [v9 addKeyValueArray:@"Build" with:v24];
  uint64_t v43 = v24;
  [v24 componentsJoinedByString:@","];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"Builds:%@|", v30];

  [MEMORY[0x1896127A0] sharedLogger];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 oslog];
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v58 = v5;
    _os_log_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_DEFAULT,  "[POLICY] querying MacUpdateBrain metadata: %{public}@",  buf,  0xCu);
  }

  v45 = v5;

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  v33 = -[SUCorePolicy policyExtensions](self, "policyExtensions");
  uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      for (uint64_t i = 0LL; i != v35; ++i)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v39 oslog];
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          [v38 extensionName];
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          __int128 v58 = v41;
          _os_log_impl( &dword_187A54000,  v40,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending query for extension %{public}@",  buf,  0xCu);
        }

        [v38 extendSoftwareUpdateMAAssetQuery:v29];
      }

      uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }

    while (v35);
  }

  return v29;
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  id v12 = a7;
  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v79 = self;
    _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "[POLICY] Select major/minor MacUpdateBrain for policy: %{public}@",  buf,  0xCu);
  }

  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  v15 = -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  if (a3 || !v15)
  {
    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a5 && v19)
    {
      [MEMORY[0x189612778] sharedDiag];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = @"Select major/minor MacUpdateBrain called with unexpected nil minorPrimaryAsset param";
      goto LABEL_17;
    }

    objc_msgSend(v12, "SUCoreBorder_results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v17 count];
    [MEMORY[0x1896127A0] sharedLogger];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (!v20)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 MacUpdateBrain query results (before filtering)",  buf,  2u);
      }

      goto LABEL_57;
    }

    if (v23)
    {
      uint64_t v24 = [v17 count];
      *(_DWORD *)buf = 134217984;
      v79 = (SUCorePolicyMacUpdateBrain *)v24;
      _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu MacUpdateBrain query results (before filtering)",  buf,  0xCu);
    }

    v69 = a5;
    id v71 = v12;

    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    -[SUCorePolicy policyExtensions](self, "policyExtensions");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v74,  v82,  16LL);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v75;
      while (2)
      {
        uint64_t v28 = 0LL;
        v29 = v17;
        do
        {
          if (*(void *)v75 != v27) {
            objc_enumerationMutation(v22);
          }
          v30 = *(void **)(*((void *)&v74 + 1) + 8 * v28);
          objc_msgSend(v30, "filterSoftwareUpdateAssetArray:", v29, v69);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          [MEMORY[0x1896127A0] sharedLogger];
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 oslog];
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [v17 count];
            [v30 extensionName];
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v79 = (SUCorePolicyMacUpdateBrain *)v33;
            __int16 v80 = 2114;
            v81 = v34;
            _os_log_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@",  buf,  0x16u);
          }

          if (![v17 count])
          {
            [MEMORY[0x1896127A0] sharedLogger];
            objc_super v51 = (void *)objc_claimAutoreleasedReturnValue();
            [v51 oslog];
            objc_super v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_187A54000,  v52,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 assets found, stopping filtering early",  buf,  2u);
            }

            id v12 = v71;
            goto LABEL_57;
          }

          ++v28;
          v29 = v17;
        }

        while (v26 != v28);
        uint64_t v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v74,  v82,  16LL);
        if (v26) {
          continue;
        }
        break;
      }
    }

    -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v36 = MEMORY[0x1895F87A8];
    if (v35)
    {
      v73[0] = MEMORY[0x1895F87A8];
      v73[1] = 3221225472LL;
      v73[2] = __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke;
      v73[3] = &unk_18A0EF9C0;
      v73[4] = self;
      [MEMORY[0x1896079C8] predicateWithBlock:v73];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 filteredArrayUsingPredicate:v37];
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896127A0] sharedLogger];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 oslog];
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = [v38 count];
        *(_DWORD *)buf = 134217984;
        v79 = (SUCorePolicyMacUpdateBrain *)v41;
        _os_log_impl( &dword_187A54000,  v40,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for major assets in SUCorePolicyMacUpdateBrain",  buf,  0xCu);
      }

      if ((unint64_t)[v38 count] >= 2)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 oslog];
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[SUCorePolicyMacUpdateBrain selectSoftwareUpdateMajorPrimaryAsset:majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:].cold.2( v43,  v44,  v45,  v46,  v47,  v48,  v49,  v50);
        }
      }

      objc_msgSend(v38, "firstObject", v69);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v22 = 0LL;
    }

    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion", v69);
    objc_super v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v72[0] = v36;
      v72[1] = 3221225472LL;
      v72[2] = __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_253;
      v72[3] = &unk_18A0EF9C0;
      v72[4] = self;
      [MEMORY[0x1896079C8] predicateWithBlock:v72];
      objc_super v54 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 filteredArrayUsingPredicate:v54];
      objc_super v55 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896127A0] sharedLogger];
      __int128 v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 oslog];
      __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v58 = [v55 count];
        *(_DWORD *)buf = 134217984;
        v79 = (SUCorePolicyMacUpdateBrain *)v58;
        _os_log_impl( &dword_187A54000,  v57,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for minor assets in SUCorePolicyMacUpdateBrain",  buf,  0xCu);
      }

      uint64_t v59 = v70;
      id v12 = v71;
      if ((unint64_t)[v55 count] >= 2)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        objc_super v60 = (void *)objc_claimAutoreleasedReturnValue();
        [v60 oslog];
        objc_super v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          -[SUCorePolicyMacUpdateBrain selectSoftwareUpdateMajorPrimaryAsset:majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:].cold.1( v61,  v62,  v63,  v64,  v65,  v66,  v67,  v68);
        }
      }

      [v55 firstObject];
      objc_super v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a3) {
        goto LABEL_54;
      }
    }

    else
    {
      uint64_t v59 = v70;
      id v12 = v71;
      if (!a3) {
        goto LABEL_54;
      }
    }

    *a3 = v22;
LABEL_54:
    if (v59) {
      *uint64_t v59 = v53;
    }

LABEL_57:
    goto LABEL_58;
  }

  [MEMORY[0x189612778] sharedDiag];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = @"Select major/minor MacUpdateBrain called with unexpected nil majorPrimaryAsset param";
LABEL_17:
  [v16 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v18 withResult:8102 withError:0];
LABEL_58:
}

uint64_t __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"Build"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x189612760];
  [*(id *)(a1 + 32) majorTargetBuildVersion];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 stringIsEqual:v4 to:v6];

  [MEMORY[0x1896127A0] sharedLogger];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) majorTargetBuildVersion];
    id v11 = (void *)v10;
    id v12 = @"NO";
    int v14 = 138543874;
    v15 = v4;
    __int16 v16 = 2114;
    if ((_DWORD)v7) {
      id v12 = @"YES";
    }
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    objc_super v19 = v12;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering for major assets: assetBuildVersion=%{public}@ majorTargetBuildVersion=%{public}@ | keep=%{public}@",  (uint8_t *)&v14,  0x20u);
  }

  return v7;
}

uint64_t __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_253( uint64_t a1,  void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"Build"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x189612760];
  [*(id *)(a1 + 32) minorTargetBuildVersion];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 stringIsEqual:v4 to:v6];

  [MEMORY[0x1896127A0] sharedLogger];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) minorTargetBuildVersion];
    id v11 = (void *)v10;
    id v12 = @"NO";
    int v14 = 138543874;
    v15 = v4;
    __int16 v16 = 2114;
    if ((_DWORD)v7) {
      id v12 = @"YES";
    }
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    objc_super v19 = v12;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering for minor assets: assetBuildVersion=%{public}@ minorTargetBuildVersion=%{public}@ | keep=%{public}@",  (uint8_t *)&v14,  0x20u);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyMacUpdateBrain)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v5 = -[SUCorePolicy initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CompatibilityVersion"];
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MajorTargetBuildVersion"];
    majorTargetBuildVersion = v5->_majorTargetBuildVersion;
    v5->_majorTargetBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinorTargetBuildVersion"];
    minorTargetBuildVersion = v5->_minorTargetBuildVersion;
    v5->_minorTargetBuildVersion = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  id v4 = a3;
  -[SUCorePolicy encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  v5 = -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion", v8.receiver, v8.super_class);
  [v4 encodeObject:v5 forKey:@"CompatibilityVersion"];

  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"MajorTargetBuildVersion"];

  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"MinorTargetBuildVersion"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyMacUpdateBrain *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v17.receiver = self;
      v17.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
      if (-[SUCorePolicy isEqual:](&v17, sel_isEqual_, v5))
      {
        uint64_t v6 = (void *)MEMORY[0x189612760];
        -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyMacUpdateBrain compatibilityVersion](v5, "compatibilityVersion");
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v6 numberIsEqual:v7 to:v8])
        {
          v9 = (void *)MEMORY[0x189612760];
          -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](v5, "majorTargetBuildVersion");
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v9 stringIsEqual:v10 to:v11])
          {
            id v12 = (void *)MEMORY[0x189612760];
            -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
            objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](v5, "minorTargetBuildVersion");
            int v14 = (void *)objc_claimAutoreleasedReturnValue();
            char v15 = [v12 stringIsEqual:v13 to:v14];
          }

          else
          {
            char v15 = 0;
          }
        }

        else
        {
          char v15 = 0;
        }
      }

      else
      {
        char v15 = 0;
      }
    }

    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  id v4 = -[SUCorePolicy copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCompatibilityVersion:v6];

  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v8 = (void *)[v7 copy];
  [v4 setMajorTargetBuildVersion:v8];
  v9 = -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  uint64_t v10 = (void *)[v9 copy];
  [v4 setMinorTargetBuildVersion:v10];

  return v4;
}

- (id)description
{
  v3 = (void *)NSString;
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  -[SUCorePolicy description](&v10, sel_description);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"SUCorePolicyMacUpdateBrain(compatibilityVersion:%@|majorTargetBuildVersion:%@|minorTargetBuildVersion:%@|super:%@)", v4, v5, v6, v7];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)summary
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SUCorePolicyMacUpdateBrain;
  v3 = -[SUCorePolicy summary](&v15, sel_summary);
  -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SUCorePolicyMacUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    uint64_t v6 = [v3 stringByAppendingFormat:@"|compatibilityVersion=%@", v5];

    v3 = (void *)v6;
  }

  -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCorePolicyMacUpdateBrain majorTargetBuildVersion](self, "majorTargetBuildVersion");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v3 stringByAppendingFormat:@"|majorTargetBuildVersion=%@", v8];

    v3 = (void *)v9;
  }

  -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCorePolicyMacUpdateBrain minorTargetBuildVersion](self, "minorTargetBuildVersion");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v3 stringByAppendingFormat:@"|minorTargetBuildVersion=%@", v11];

    v3 = (void *)v12;
  }

  if (([v3 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v13 = [v3 stringByAppendingString:@"|"];

    v3 = (void *)v13;
  }

  return v3;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (NSString)majorTargetBuildVersion
{
  return self->_majorTargetBuildVersion;
}

- (void)setMajorTargetBuildVersion:(id)a3
{
}

- (NSString)minorTargetBuildVersion
{
  return self->_minorTargetBuildVersion;
}

- (void)setMinorTargetBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(uint64_t)a3 majorSecondaryAsset:(uint64_t)a4 minorPrimaryAsset:(uint64_t)a5 minorSecondaryAsset:(uint64_t)a6 fromAssetQuery:(uint64_t)a7 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(uint64_t)a3 majorSecondaryAsset:(uint64_t)a4 minorPrimaryAsset:(uint64_t)a5 minorSecondaryAsset:(uint64_t)a6 fromAssetQuery:(uint64_t)a7 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

@end