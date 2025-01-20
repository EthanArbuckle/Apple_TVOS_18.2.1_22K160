@interface SUCorePolicyExtensionSplatUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)allowSameRestoreVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSplatPolicy;
- (NSString)installedBaseOSBuildVersion;
- (NSString)installedBaseOSProductVersion;
- (NSString)installedBaseOSReleaseType;
- (NSString)installedBaseOSRestoreVersion;
- (NSString)installedSplatBuildVersion;
- (NSString)installedSplatProductVersion;
- (NSString)installedSplatProductVersionExtra;
- (NSString)installedSplatReleaseType;
- (NSString)installedSplatRestoreVersion;
- (NSString)requestedSplatRestoreVersion;
- (SUCorePolicyExtensionSplatUpdate)init;
- (SUCorePolicyExtensionSplatUpdate)initWithCoder:(id)a3;
- (id)_stringRemovingParenthesis:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3;
- (void)setAllowSameRestoreVersion:(BOOL)a3;
- (void)setInstalledBaseOSBuildVersion:(id)a3;
- (void)setInstalledBaseOSProductVersion:(id)a3;
- (void)setInstalledBaseOSReleaseType:(id)a3;
- (void)setInstalledBaseOSRestoreVersion:(id)a3;
- (void)setInstalledSplatBuildVersion:(id)a3;
- (void)setInstalledSplatProductVersion:(id)a3;
- (void)setInstalledSplatProductVersionExtra:(id)a3;
- (void)setInstalledSplatReleaseType:(id)a3;
- (void)setInstalledSplatRestoreVersion:(id)a3;
- (void)setRequestedSplatRestoreVersion:(id)a3;
@end

@implementation SUCorePolicyExtensionSplatUpdate

- (SUCorePolicyExtensionSplatUpdate)init
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionSplatUpdate;
  v2 = -[SUCorePolicyExtension init](&v37, sel_init);
  if (v2)
  {
    [MEMORY[0x189612770] sharedDevice];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 splatCryptex1RestoreVersion];
    installedSplatRestoreVersion = v2->_installedSplatRestoreVersion;
    v2->_installedSplatRestoreVersion = (NSString *)v4;

    [MEMORY[0x189612770] sharedDevice];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 splatCryptex1ProductVersion];
    installedSplatProductVersion = v2->_installedSplatProductVersion;
    v2->_installedSplatProductVersion = (NSString *)v7;

    [MEMORY[0x189612770] sharedDevice];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 splatCryptex1ProductVersionExtra];
    installedSplatProductVersionExtra = v2->_installedSplatProductVersionExtra;
    v2->_installedSplatProductVersionExtra = (NSString *)v10;

    [MEMORY[0x189612770] sharedDevice];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 splatCryptex1BuildVersion];
    installedSplatBuildVersion = v2->_installedSplatBuildVersion;
    v2->_installedSplatBuildVersion = (NSString *)v13;

    [MEMORY[0x189612770] sharedDevice];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 splatCryptex1ReleaseType];
    installedSplatReleaseType = v2->_installedSplatReleaseType;
    v2->_installedSplatReleaseType = (NSString *)v16;

    [MEMORY[0x189612770] sharedDevice];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 releaseType];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v2->_installedSplatReleaseType;

      if (v20)
      {
LABEL_6:
        [MEMORY[0x189612770] sharedDevice];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [v23 restoreVersion];
        installedBaseOSRestoreVersion = v2->_installedBaseOSRestoreVersion;
        v2->_installedBaseOSRestoreVersion = (NSString *)v24;

        [MEMORY[0x189612770] sharedDevice];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = [v26 productVersion];
        installedBaseOSProductVersion = v2->_installedBaseOSProductVersion;
        v2->_installedBaseOSProductVersion = (NSString *)v27;

        [MEMORY[0x189612770] sharedDevice];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v29 buildVersion];
        installedBaseOSBuildVersion = v2->_installedBaseOSBuildVersion;
        v2->_installedBaseOSBuildVersion = (NSString *)v30;

        [MEMORY[0x189612770] sharedDevice];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = [v32 releaseType];
        installedBaseOSReleaseType = v2->_installedBaseOSReleaseType;
        v2->_installedBaseOSReleaseType = (NSString *)v33;

        requestedSplatRestoreVersion = v2->_requestedSplatRestoreVersion;
        v2->_requestedSplatRestoreVersion = 0LL;

        v2->_allowSameRestoreVersion = 0;
        return v2;
      }

      [MEMORY[0x189612770] sharedDevice];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v18 releaseType];
      v22 = v2->_installedSplatReleaseType;
      v2->_installedSplatReleaseType = (NSString *)v21;
    }

    goto LABEL_6;
  }

  return v2;
}

- (id)_stringRemovingParenthesis:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", @"("), &stru_18A0F22B0;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", @""), &stru_18A0F22B0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v85 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v86 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v100 objects:v117 count:16];
  id v87 = v5;
  v90 = self;
  if (!v6) {
    goto LABEL_46;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v101;
  uint64_t v91 = *(void *)v101;
  do
  {
    uint64_t v9 = 0LL;
    uint64_t v92 = v7;
    do
    {
      if (*(void *)v101 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v100 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v10 attributes];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 safeStringForKey:@"ReleaseType"];
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        uint64_t v13 = (void *)MEMORY[0x189612760];
        [MEMORY[0x189612770] sharedDevice];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 releaseType];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = [v13 stringIsEqual:v12 to:v15];

        if ((v13 & 1) != 0)
        {
          [v10 attributes];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 safeObjectForKey:@"Revoked" ofClass:objc_opt_class()];
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          int v18 = [v17 BOOLValue];
          [v10 attributes];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = [v19 safeStringForKey:@"RestoreVersion"];

          id v21 = objc_alloc(MEMORY[0x1896127C0]);
          v22 = -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
          v23 = (void *)[v21 initWithRestoreVersion:v22];

          uint64_t v24 = (SUCorePolicyExtensionSplatUpdate *)v20;
          v25 = (__CFString *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v20];
          v93 = v23;
          if ([v23 isComparable:v25])
          {
            uint64_t v26 = [v23 compare:v25];
            uint64_t v27 = v26;
            if (!v18)
            {
              v88 = v24;
              v39 = -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra]( v90,  "installedSplatProductVersionExtra");
              uint64_t v40 = -[SUCorePolicyExtensionSplatUpdate _stringRemovingParenthesis:](v90, "_stringRemovingParenthesis:", v39);
              v41 = (void *)v40;
              v42 = &stru_18A0F22B0;
              if (v40) {
                v42 = (__CFString *)v40;
              }
              v29 = v42;

              [v10 attributes];
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              [v43 safeStringForKey:@"ProductVersionExtra"];
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v45 = -[SUCorePolicyExtensionSplatUpdate _stringRemovingParenthesis:](v90, "_stringRemovingParenthesis:", v44);

              v89 = (void *)v45;
              if (v45) {
                uint64_t v46 = -[__CFString compare:options:](v29, "compare:options:", v45, 1LL);
              }
              else {
                uint64_t v46 = 0LL;
              }
              uint64_t v24 = v88;
              if (v27 == -1
                || !v27
                && (-[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](v90, "allowSameRestoreVersion")
                 || v46 == -1))
              {
                [v86 addObject:v10];
                int v48 = 1;
              }

              else
              {
                int v48 = 0;
              }

              [MEMORY[0x1896127A0] sharedLogger];
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              [v49 oslog];
              v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              self = v90;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v51 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](v90, "allowSameRestoreVersion");
                *(_DWORD *)buf = 138544642;
                v52 = @"YES";
                if (v51) {
                  v53 = @"YES";
                }
                else {
                  v53 = @"NO";
                }
                v106 = v88;
                if (!v48) {
                  v52 = @"NO";
                }
                __int16 v107 = 2114;
                v108 = (const char *)v12;
                __int16 v109 = 2114;
                v110 = v29;
                __int16 v111 = 2114;
                v112 = v89;
                __int16 v113 = 2114;
                v114 = v53;
                __int16 v115 = 2114;
                v116 = v52;
                _os_log_impl( &dword_187A54000,  v50,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering update asset by restore version, restoreVersion=%{public}@, releaseType=%{public}@ installedProductVersionExtra=%{public}@ targetProductVersionExtra=%{public}@ allowSameRestoreVersion=% {public}@ | keep=%{public}@",  buf,  0x3Eu);
              }

              id v5 = v87;
              goto LABEL_42;
            }

            self = v90;
            if (v26)
            {
              [MEMORY[0x1896127A0] sharedLogger];
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              [v28 oslog];
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v106 = v24;
                __int16 v107 = 2114;
                v108 = (const char *)v12;
                __int16 v109 = 2114;
                v110 = @"NO";
                uint64_t v30 = (os_log_s *)v29;
                v31 = "[POLICY] filtering revoked asset by restore version, restoreVersion=%{public}@, releaseType=%{publ"
                      "ic}@ | keep=%{public}@";
                goto LABEL_19;
              }

uint64_t __67__SUCorePolicyExtensionSplatUpdate_filterSoftwareUpdateAssetArray___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x189612760];
  [v3 attributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"ProductVersionExtra"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v4 stringIsEqual:v6 to:*(void *)(a1 + 32)];

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    [v3 attributes];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 safeStringForKey:@"ProductVersionExtra"];
    uint64_t v13 = (void *)v12;
    v14 = @"NO";
    int v16 = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    if ((_DWORD)v7) {
      v14 = @"YES";
    }
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    id v21 = v14;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering update asset for productVersionExtra=%{public}@, assetProductVersionExtra=%{public}@ | keep=%{public}@",  (uint8_t *)&v16,  0x20u);
  }

  return v7;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [MEMORY[0x189612770] sharedDevice];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 hasSplat];

    if (v6)
    {
      -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setPrerequisiteReleaseType:v7];

      [v4 prerequisiteReleaseType];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [@"|" stringByAppendingFormat:@"releaseType:%@|", v8];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend( v4,  "setAllowSameVersion:",  -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"));
      int v10 = [v4 allowSameVersion];
      v11 = @"NO";
      if (v10) {
        v11 = @"YES";
      }
      [v9 stringByAppendingFormat:@"allowSameVersion:%@|", v11];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 additionalServerParams];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
      [v13 setSafeObject:v14 forKey:@"Build"];

      [v4 additionalServerParams];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 safeStringForKey:@"Build"];
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 stringByAppendingFormat:@"%@:%@|", @"Build", v16];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 additionalServerParams];
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setSafeObject:v19 forKey:@"ProductVersionExtra"];

      [v4 additionalServerParams];
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 safeStringForKey:@"ProductVersionExtra"];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 stringByAppendingFormat:@"%@:%@|", @"ProductVersionExtra", v21];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 additionalServerParams];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 setSafeObject:v24 forKey:@"InstalledSplatRestoreVersion"];

      [v4 additionalServerParams];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 safeStringForKey:@"InstalledSplatRestoreVersion"];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 stringByAppendingFormat:@"%@:%@|", @"InstalledSplatRestoreVersion", v26];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 additionalServerParams];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
      [v28 setSafeObject:v29 forKey:@"RequestedRestoreVersion"];

      [v4 additionalServerParams];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 safeStringForKey:@"RequestedRestoreVersion"];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 stringByAppendingFormat:@"%@:%@|", @"RequestedRestoreVersion", v31];
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 additionalServerParams];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion")) {
        v34 = @"true";
      }
      else {
        v34 = @"false";
      }
      [v33 setSafeObject:v34 forKey:@"AllowSameRestoreVersion"];

      [v4 additionalServerParams];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 safeStringForKey:@"AllowSameRestoreVersion"];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 stringByAppendingFormat:@"%@:%@|", @"AllowSameRestoreVersion", v36];
      objc_super v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ without hasSplat = YES, yet calling extendMASoftwareUpdateCatalogDownloadOptions (no extended download options will be added)", self];
      [v35 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v36 withResult:8102 withError:0];
      objc_super v37 = @"|";
    }

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 oslog];
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = self;
      __int16 v43 = 2114;
      v44 = v37;
      _os_log_impl( &dword_187A54000,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}@ downloading software update catalog with extended download options: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 oslog];
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v39,  OS_LOG_TYPE_DEFAULT,  "Options class is not MAMsuDownloadOptions, so unable to set splat options.",  buf,  2u);
    }

    objc_super v37 = @"|";
  }
}

- (BOOL)isSplatPolicy
{
  return 1;
}

- (SUCorePolicyExtensionSplatUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionSplatUpdate;
  id v5 = -[SUCorePolicyExtension init](&v27, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatRestoreVersion"];
    installedSplatRestoreVersion = v5->_installedSplatRestoreVersion;
    v5->_installedSplatRestoreVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatBuildVersion"];
    installedSplatBuildVersion = v5->_installedSplatBuildVersion;
    v5->_installedSplatBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatProductVersion"];
    installedSplatProductVersion = v5->_installedSplatProductVersion;
    v5->_installedSplatProductVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatProductVersionExtra"];
    installedSplatProductVersionExtra = v5->_installedSplatProductVersionExtra;
    v5->_installedSplatProductVersionExtra = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatReleaseType"];
    installedSplatReleaseType = v5->_installedSplatReleaseType;
    v5->_installedSplatReleaseType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSRestoreVersion"];
    installedBaseOSRestoreVersion = v5->_installedBaseOSRestoreVersion;
    v5->_installedBaseOSRestoreVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSBuildVersion"];
    installedBaseOSBuildVersion = v5->_installedBaseOSBuildVersion;
    v5->_installedBaseOSBuildVersion = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSProductVersion"];
    installedBaseOSProductVersion = v5->_installedBaseOSProductVersion;
    v5->_installedBaseOSProductVersion = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSReleaseType"];
    installedBaseOSReleaseType = v5->_installedBaseOSReleaseType;
    v5->_installedBaseOSReleaseType = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedSplatRestoreVersion"];
    requestedSplatRestoreVersion = v5->_requestedSplatRestoreVersion;
    v5->_requestedSplatRestoreVersion = (NSString *)v24;

    v5->_allowSameRestoreVersion = [v4 decodeBoolForKey:@"allowSameRestoreVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v4 forKey:@"installedSplatRestoreVersion"];

  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v5 forKey:@"installedSplatBuildVersion"];

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v6 forKey:@"installedSplatProductVersion"];

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v7 forKey:@"installedSplatProductVersionExtra"];

  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v8 forKey:@"installedSplatReleaseType"];

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v9 forKey:@"installedBaseOSRestoreVersion"];

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v10 forKey:@"installedBaseOSBuildVersion"];
  v11 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  [v14 encodeObject:v11 forKey:@"installedBaseOSProductVersion"];

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v12 forKey:@"installedBaseOSReleaseType"];

  -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 encodeObject:v13 forKey:@"requestedSplatRestoreVersion"];

  objc_msgSend( v14,  "encodeBool:forKey:",  -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"),  @"allowSameRestoreVersion");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionSplatUpdate *)a3;
  if (v4 == self)
  {
    LOBYTE(v32) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x189612760];
      -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](v5, "installedSplatRestoreVersion");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 stringIsEqual:v7 to:v8])
      {
        uint64_t v9 = (void *)MEMORY[0x189612760];
        -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](v5, "installedSplatBuildVersion");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
        if ([v9 stringIsEqual:v10 to:v11])
        {
          uint64_t v12 = (void *)MEMORY[0x189612760];
          -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](v5, "installedSplatProductVersion");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v51 = -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
          v52 = v13;
          if (objc_msgSend(v12, "stringIsEqual:to:", v13))
          {
            id v14 = (void *)MEMORY[0x189612760];
            uint64_t v15 = -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra]( v5,  "installedSplatProductVersionExtra");
            v50 = -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra]( self,  "installedSplatProductVersionExtra");
            if (objc_msgSend(v14, "stringIsEqual:to:", v15))
            {
              v47 = (void *)v15;
              uint64_t v16 = (void *)MEMORY[0x189612760];
              uint64_t v17 = -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](v5, "installedSplatReleaseType");
              -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
              int v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = (void *)v17;
              if (objc_msgSend(v16, "stringIsEqual:to:", v17))
              {
                uint64_t v18 = (void *)MEMORY[0x189612760];
                uint64_t v19 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](v5, "installedBaseOSRestoreVersion");
                -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v46 = (void *)v19;
                if (objc_msgSend(v18, "stringIsEqual:to:", v19))
                {
                  __int16 v43 = (void *)MEMORY[0x189612760];
                  uint64_t v20 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](v5, "installedBaseOSBuildVersion");
                  uint64_t v21 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
                  uint64_t v22 = v43;
                  v42 = (void *)v21;
                  v44 = (void *)v20;
                  if (objc_msgSend(v22, "stringIsEqual:to:", v20))
                  {
                    uint64_t v40 = (void *)MEMORY[0x189612760];
                    uint64_t v23 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion]( v5,  "installedBaseOSProductVersion");
                    uint64_t v24 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion]( self,  "installedBaseOSProductVersion");
                    v25 = v40;
                    v39 = (void *)v24;
                    v41 = (void *)v23;
                    if (objc_msgSend(v25, "stringIsEqual:to:", v23))
                    {
                      uint64_t v26 = (void *)MEMORY[0x189612760];
                      uint64_t v27 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](v5, "installedBaseOSReleaseType");
                      -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
                      objc_super v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = (void *)v27;
                      if (objc_msgSend(v26, "stringIsEqual:to:", v27))
                      {
                        v28 = v47;
                        v29 = (void *)MEMORY[0x189612760];
                        uint64_t v30 = -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion]( v5,  "requestedSplatRestoreVersion");
                        v35 = -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion]( self,  "requestedSplatRestoreVersion");
                        v36 = (void *)v30;
                        if (objc_msgSend(v29, "stringIsEqual:to:", v30))
                        {
                          BOOL v31 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion]( v5,  "allowSameRestoreVersion");
                          int v32 = v31 ^ -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion]( self,  "allowSameRestoreVersion") ^ 1;
                        }

                        else
                        {
                          LOBYTE(v32) = 0;
                        }

                        uint64_t v33 = (void *)v51;
                        uint64_t v13 = v52;
                      }

                      else
                      {
                        v28 = v47;
                        LOBYTE(v32) = 0;
                        uint64_t v33 = (void *)v51;
                        uint64_t v13 = v52;
                      }
                    }

                    else
                    {
                      v28 = v47;
                      LOBYTE(v32) = 0;
                      uint64_t v33 = (void *)v51;
                      uint64_t v13 = v52;
                    }
                  }

                  else
                  {
                    v28 = v47;
                    LOBYTE(v32) = 0;
                    uint64_t v33 = (void *)v51;
                    uint64_t v13 = v52;
                  }
                }

                else
                {
                  v28 = v47;
                  LOBYTE(v32) = 0;
                  uint64_t v33 = (void *)v51;
                  uint64_t v13 = v52;
                }
              }

              else
              {
                v28 = v47;
                LOBYTE(v32) = 0;
                uint64_t v33 = (void *)v51;
                uint64_t v13 = v52;
              }
            }

            else
            {
              v28 = (void *)v15;
              LOBYTE(v32) = 0;
              uint64_t v33 = (void *)v51;
              uint64_t v13 = v52;
            }
          }

          else
          {
            LOBYTE(v32) = 0;
            uint64_t v33 = (void *)v51;
          }
        }

        else
        {
          LOBYTE(v32) = 0;
        }
      }

      else
      {
        LOBYTE(v32) = 0;
      }
    }

    else
    {
      LOBYTE(v32) = 0;
    }
  }

  return v32;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionSplatUpdate";
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc(NSString);
    -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)[v4 initWithFormat:@"|installedSplatRestoreVersion=%@", v5];
    [&stru_18A0F22B0 stringByAppendingString:v6];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = &stru_18A0F22B0;
  }

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = objc_alloc(NSString);
    -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)[v9 initWithFormat:@"|installedSplatProductVersion=%@", v10];
    uint64_t v12 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v11);

    uint64_t v7 = (__CFString *)v12;
  }

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v14 = objc_alloc(NSString);
    -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = (void *)[v14 initWithFormat:@"|installedSplatProductVersionExtra=%@", v15];
    uint64_t v17 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v16);

    uint64_t v7 = (__CFString *)v17;
  }

  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    id v19 = objc_alloc(NSString);
    -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = (void *)[v19 initWithFormat:@"|installedSplatReleaseType=%@", v20];
    uint64_t v22 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v21);

    uint64_t v7 = (__CFString *)v22;
  }

  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    id v24 = objc_alloc(NSString);
    v25 = -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
    uint64_t v26 = (void *)[v24 initWithFormat:@"|installedSplatBuildVersion=%@", v25];
    uint64_t v27 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v26);

    uint64_t v7 = (__CFString *)v27;
  }
  v28 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  if (v28)
  {
    id v29 = objc_alloc(NSString);
    -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v31 = (void *)[v29 initWithFormat:@"|installedBaseOSRestoreVersion=%@", v30];
    uint64_t v32 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v31);

    uint64_t v7 = (__CFString *)v32;
  }

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    id v34 = objc_alloc(NSString);
    v35 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
    v36 = (void *)[v34 initWithFormat:@"|installedBaseOSProductVersion=%@", v35];
    uint64_t v37 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v36);

    uint64_t v7 = (__CFString *)v37;
  }
  v38 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  if (v38)
  {
    id v39 = objc_alloc(NSString);
    -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)[v39 initWithFormat:@"|installedBaseOSReleaseType=%@", v40];
    uint64_t v42 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v41);

    uint64_t v7 = (__CFString *)v42;
  }

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    id v44 = objc_alloc(NSString);
    -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v46 = (void *)[v44 initWithFormat:@"|installedBaseOSBuildVersion=%@", v45];
    uint64_t v47 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v46);

    uint64_t v7 = (__CFString *)v47;
  }

  -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  int v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    id v49 = objc_alloc(NSString);
    v50 = -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
    uint64_t v51 = (void *)[v49 initWithFormat:@"|requestedSplatRestoreVersion=%@", v50];
    uint64_t v52 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v51);

    uint64_t v7 = (__CFString *)v52;
  }

  id v53 = objc_alloc(NSString);
  BOOL v54 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion");
  v55 = @"NO";
  if (v54) {
    v55 = @"YES";
  }
  v56 = (void *)[v53 initWithFormat:@"|allowSameRestoreVersion=%@", v55];
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v56);
  id v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v57 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v58 = [v57 stringByAppendingString:@"|"];

    id v57 = (void *)v58;
  }

  return v57;
}

- (id)description
{
  id v17 = objc_alloc(NSString);
  -[SUCorePolicyExtensionSplatUpdate extensionName](self, "extensionName");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  BOOL v12 = -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion");
  uint64_t v13 = @"NO";
  if (v12) {
    uint64_t v13 = @"YES";
  }
  uint64_t v18 = (void *)[v17 initWithFormat:@"%@(installedSplatRestoreVersion:%@|installedSplatBuildVersion:%@|installedSplatProductVersion:%@|installedSplatProductVersionExtra:%@|installedSplatReleaseType:%@|installedBaseOSRestoreVersion:%@|installedBaseOSBuildVersion:%@|installedBaseOSProductVersion:%@|installedBaseOSReleaseType:%@|requestedSplatRestoreVersion:%@|allowSameRestoreVersion:%@)", v16, v3, v4, v5, v15, v6, v7, v8, v9, v10, v11, v13];

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyExtensionSplatUpdate);
  -[SUCorePolicyExtensionSplatUpdate installedSplatRestoreVersion](self, "installedSplatRestoreVersion");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatRestoreVersion:](v4, "setInstalledSplatRestoreVersion:", v5);

  -[SUCorePolicyExtensionSplatUpdate installedSplatBuildVersion](self, "installedSplatBuildVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatBuildVersion:](v4, "setInstalledSplatBuildVersion:", v6);

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersion](self, "installedSplatProductVersion");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatProductVersion:](v4, "setInstalledSplatProductVersion:", v7);

  -[SUCorePolicyExtensionSplatUpdate installedSplatProductVersionExtra](self, "installedSplatProductVersionExtra");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatProductVersionExtra:]( v4,  "setInstalledSplatProductVersionExtra:",  v8);

  -[SUCorePolicyExtensionSplatUpdate installedSplatReleaseType](self, "installedSplatReleaseType");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledSplatReleaseType:](v4, "setInstalledSplatReleaseType:", v9);

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSRestoreVersion](self, "installedBaseOSRestoreVersion");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSRestoreVersion:](v4, "setInstalledBaseOSRestoreVersion:", v10);
  v11 = -[SUCorePolicyExtensionSplatUpdate installedBaseOSBuildVersion](self, "installedBaseOSBuildVersion");
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSBuildVersion:](v4, "setInstalledBaseOSBuildVersion:", v11);

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSProductVersion](self, "installedBaseOSProductVersion");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSProductVersion:](v4, "setInstalledBaseOSProductVersion:", v12);

  -[SUCorePolicyExtensionSplatUpdate installedBaseOSReleaseType](self, "installedBaseOSReleaseType");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSReleaseType:](v4, "setInstalledBaseOSReleaseType:", v13);

  -[SUCorePolicyExtensionSplatUpdate requestedSplatRestoreVersion](self, "requestedSplatRestoreVersion");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionSplatUpdate setRequestedSplatRestoreVersion:](v4, "setRequestedSplatRestoreVersion:", v14);

  -[SUCorePolicyExtensionSplatUpdate setAllowSameRestoreVersion:]( v4,  "setAllowSameRestoreVersion:",  -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"));
  return v4;
}

- (NSString)installedSplatRestoreVersion
{
  return self->_installedSplatRestoreVersion;
}

- (void)setInstalledSplatRestoreVersion:(id)a3
{
}

- (NSString)installedSplatBuildVersion
{
  return self->_installedSplatBuildVersion;
}

- (void)setInstalledSplatBuildVersion:(id)a3
{
}

- (NSString)installedSplatProductVersion
{
  return self->_installedSplatProductVersion;
}

- (void)setInstalledSplatProductVersion:(id)a3
{
}

- (NSString)installedSplatProductVersionExtra
{
  return self->_installedSplatProductVersionExtra;
}

- (void)setInstalledSplatProductVersionExtra:(id)a3
{
}

- (NSString)installedSplatReleaseType
{
  return self->_installedSplatReleaseType;
}

- (void)setInstalledSplatReleaseType:(id)a3
{
}

- (NSString)installedBaseOSRestoreVersion
{
  return self->_installedBaseOSRestoreVersion;
}

- (void)setInstalledBaseOSRestoreVersion:(id)a3
{
}

- (NSString)installedBaseOSBuildVersion
{
  return self->_installedBaseOSBuildVersion;
}

- (void)setInstalledBaseOSBuildVersion:(id)a3
{
}

- (NSString)installedBaseOSProductVersion
{
  return self->_installedBaseOSProductVersion;
}

- (void)setInstalledBaseOSProductVersion:(id)a3
{
}

- (NSString)installedBaseOSReleaseType
{
  return self->_installedBaseOSReleaseType;
}

- (void)setInstalledBaseOSReleaseType:(id)a3
{
}

- (NSString)requestedSplatRestoreVersion
{
  return self->_requestedSplatRestoreVersion;
}

- (void)setRequestedSplatRestoreVersion:(id)a3
{
}

- (BOOL)allowSameRestoreVersion
{
  return self->_allowSameRestoreVersion;
}

- (void)setAllowSameRestoreVersion:(BOOL)a3
{
  self->_allowSameRestoreVersion = a3;
}

- (void).cxx_destruct
{
}

@end