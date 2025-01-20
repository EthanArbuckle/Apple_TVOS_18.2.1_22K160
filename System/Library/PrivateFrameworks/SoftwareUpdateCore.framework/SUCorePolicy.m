@interface SUCorePolicy
+ (BOOL)getAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6;
+ (BOOL)getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6;
+ (BOOL)supportsSecureCoding;
+ (id)_cleanProductVersion:(id)a3;
- (BOOL)allowSameVersion;
- (BOOL)allowsCellular;
- (BOOL)background;
- (BOOL)bridgeOSIgnoreMinimumVersionCheck;
- (BOOL)checkAvailableSpace;
- (BOOL)disableAlternateUpdate;
- (BOOL)disableSplatCombo;
- (BOOL)enableBridgeOSInstall;
- (BOOL)enableEmbeddedOSInstall;
- (BOOL)enableOSPersonalization;
- (BOOL)enablePreSUStaging;
- (BOOL)enablePreSUStagingForOptionalAssets;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isRequestedPMVSupervisedPolicy;
- (BOOL)isSplatPolicy;
- (BOOL)isSupervisedPolicy;
- (BOOL)performPreflightEncryptedCheck;
- (BOOL)performPreflightSnapshotCheck;
- (BOOL)restrictToFull;
- (BOOL)skipVolumeSealing;
- (BOOL)userInitiated;
- (NSArray)policyExtensions;
- (NSData)localAuthenticationContext;
- (NSData)ssoToken;
- (NSDictionary)defaultDescriptorValues;
- (NSDictionary)updateMetricEventFields;
- (NSNumber)localAuthenticationUserID;
- (NSNumber)proxyPortNumber;
- (NSString)alternateAssetAudienceUUID;
- (NSString)assetAudienceUUID;
- (NSString)bridgeOSDownloadDirectory;
- (NSString)deviceClass;
- (NSString)documentationAssetType;
- (NSString)downloadAuthorizationHeader;
- (NSString)hwModelStr;
- (NSString)installedSFRVersion;
- (NSString)mdmBootstrapToken;
- (NSString)personalizationServerURL;
- (NSString)personalizedManifestRootsPath;
- (NSString)prerequisiteBuildVersion;
- (NSString)prerequisiteProductVersion;
- (NSString)prerequisiteRestoreVersion;
- (NSString)productType;
- (NSString)proxyHostName;
- (NSString)releaseType;
- (NSString)softwareUpdateAssetType;
- (NSString)targetRestoreVersion;
- (NSString)targetVolumeUUID;
- (NSString)updateBrainLocationOverride;
- (NSString)updateMetricContext;
- (NSString)updateVolumePath;
- (NSString)userAgentString;
- (SUCorePolicy)initWithCoder:(id)a3;
- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 updateBrainAssetType:(id)a5 usingExtensions:(id)a6;
- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5;
- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6;
- (SUCorePolicyApply)applyPolicy;
- (SUCorePolicyDocumentationDownload)documentationDownloadPolicy;
- (SUCorePolicyDocumentationScan)documentationScanPolicy;
- (SUCorePolicyLoadBrain)loadBrainPolicy;
- (SUCorePolicyPreflightDownloadSU)downloadPreflightPolicy;
- (SUCorePolicyPreflightFDRRecovery)fdrRecoveryPreflightPolicy;
- (SUCorePolicyPreflightPersonalize)personalizePreflightPolicy;
- (SUCorePolicyPreflightPrerequisiteCheck)prerequisiteCheckPreflightPolicy;
- (SUCorePolicyPreflightWakeup)wakeupPreflightPolicy;
- (SUCorePolicyPrepare)preparePolicy;
- (SUCorePolicyResume)resumePolicy;
- (SUCorePolicyRollback)rollbackPolicy;
- (SUCorePolicySoftwareUpdateDownload)softwareUpdateDownloadPolicy;
- (SUCorePolicySoftwareUpdateScan)softwareUpdateScanPolicy;
- (SUCorePolicySuspend)suspendPolicy;
- (id)_copyGestaltValueForKey:(__CFString *)a3;
- (id)assetTypeSummary;
- (id)constructDocumentationMAAssetQueryWithDocID:(id)a3 purpose:(id)a4;
- (id)constructMADocumentationAssetDownloadOptionsWithUUID:(id)a3;
- (id)constructMADocumentationCatalogDownloadOptionsWithUUID:(id)a3 usingDescriptor:(id)a4;
- (id)constructMASoftwareUpdateAssetDownloadOptionsWithUUID:(id)a3;
- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mdmPathName;
- (id)requestedProductMarketingVersion;
- (id)setUpdateMetricEventFieldsFromDictionary:(id)a3;
- (id)stringForQoS:(int)a3;
- (id)summary;
- (int)cacheDeleteUrgency;
- (int)qualityOfService;
- (int64_t)delayPeriodDays;
- (int64_t)specifiedUsedPolicies;
- (void)encodeWithCoder:(id)a3;
- (void)selectDocumentationAsset:(id *)a3 fromAssetQuery:(id)a4;
- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7;
- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5;
- (void)setAllowSameVersion:(BOOL)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setAlternateAssetAudienceUUID:(id)a3;
- (void)setApplyPolicy:(id)a3;
- (void)setAssetAudienceUUID:(id)a3;
- (void)setBackground:(BOOL)a3;
- (void)setBridgeOSDownloadDirectory:(id)a3;
- (void)setBridgeOSIgnoreMinimumVersionCheck:(BOOL)a3;
- (void)setCacheDeleteUrgency:(int)a3;
- (void)setCheckAvailableSpace:(BOOL)a3;
- (void)setDefaultDescriptorValues:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDisableAlternateUpdate:(BOOL)a3;
- (void)setDisableSplatCombo:(BOOL)a3;
- (void)setDocumentationAssetType:(id)a3;
- (void)setDocumentationDownloadPolicy:(id)a3;
- (void)setDocumentationScanPolicy:(id)a3;
- (void)setDownloadAuthorizationHeader:(id)a3;
- (void)setDownloadPreflightPolicy:(id)a3;
- (void)setEnableBridgeOSInstall:(BOOL)a3;
- (void)setEnableEmbeddedOSInstall:(BOOL)a3;
- (void)setEnableOSPersonalization:(BOOL)a3;
- (void)setEnablePreSUStaging:(BOOL)a3;
- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3;
- (void)setFdrRecoveryPreflightPolicy:(id)a3;
- (void)setHwModelStr:(id)a3;
- (void)setInstalledSFRVersion:(id)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setLoadBrainPolicy:(id)a3;
- (void)setLocalAuthenticationContext:(id)a3;
- (void)setLocalAuthenticationUserID:(id)a3;
- (void)setMdmBootstrapToken:(id)a3;
- (void)setPerformPreflightEncryptedCheck:(BOOL)a3;
- (void)setPerformPreflightSnapshotCheck:(BOOL)a3;
- (void)setPersonalizationServerURL:(id)a3;
- (void)setPersonalizePreflightPolicy:(id)a3;
- (void)setPersonalizedManifestRootsPath:(id)a3;
- (void)setPolicyExtensions:(id)a3;
- (void)setPreparePolicy:(id)a3;
- (void)setPrerequisiteBuildVersion:(id)a3;
- (void)setPrerequisiteCheckPreflightPolicy:(id)a3;
- (void)setPrerequisiteProductVersion:(id)a3;
- (void)setPrerequisiteRestoreVersion:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProxyHostName:(id)a3;
- (void)setProxyPortNumber:(id)a3;
- (void)setQualityOfService:(int)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestrictToFull:(BOOL)a3;
- (void)setResumePolicy:(id)a3;
- (void)setRollbackPolicy:(id)a3;
- (void)setSkipVolumeSealing:(BOOL)a3;
- (void)setSoftwareUpdateAssetType:(id)a3;
- (void)setSoftwareUpdateDownloadPolicy:(id)a3;
- (void)setSoftwareUpdateScanPolicy:(id)a3;
- (void)setSpecifiedUsedPolicies:(int64_t)a3;
- (void)setSsoToken:(id)a3;
- (void)setSuspendPolicy:(id)a3;
- (void)setTargetRestoreVersion:(id)a3;
- (void)setTargetVolumeUUID:(id)a3;
- (void)setUpdateBrainLocationOverride:(id)a3;
- (void)setUpdateMetricContext:(id)a3;
- (void)setUpdateMetricEventFields:(id)a3;
- (void)setUpdateVolumePath:(id)a3;
- (void)setUserAgentString:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setWakeupPreflightPolicy:(id)a3;
- (void)updateApplyOptionsWithExtensions:(id)a3;
- (void)updateRollbackOptionsWithExtensions:(id)a3;
@end

@implementation SUCorePolicy

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  uint64_t v116 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v112.receiver = self;
  v112.super_class = (Class)&OBJC_CLASS___SUCorePolicy;
  v13 = -[SUCorePolicy init](&v112, sel_init);
  if (v13)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x189612770] sharedDevice];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 summary];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v115 = v17;
      _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "[POLICY] Using SUCoreDevice for policy: %{public}@",  buf,  0xCu);
    }

    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    *((void *)v13 + 5) = a5;
    v19 = objc_alloc_init(&OBJC_CLASS___SUCorePolicySoftwareUpdateScan);
    v20 = (void *)*((void *)v13 + 6);
    *((void *)v13 + 6) = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyDocumentationScan);
    v22 = (void *)*((void *)v13 + 7);
    *((void *)v13 + 7) = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyDocumentationDownload);
    v24 = (void *)*((void *)v13 + 8);
    *((void *)v13 + 8) = v23;

    v25 = -[SUCorePolicyLoadBrain initWithSkipPhaseSet:]( [SUCorePolicyLoadBrain alloc],  "initWithSkipPhaseSet:",  ([v13 specifiedUsedPolicies] & 1) == 0);
    v26 = (void *)*((void *)v13 + 9);
    *((void *)v13 + 9) = v25;

    v27 = -[SUCorePolicyPreflightDownloadSU initWithSkipPhaseSet:]( [SUCorePolicyPreflightDownloadSU alloc],  "initWithSkipPhaseSet:",  ([v13 specifiedUsedPolicies] & 2) == 0);
    v28 = (void *)*((void *)v13 + 10);
    *((void *)v13 + 10) = v27;

    v29 = -[SUCorePolicySoftwareUpdateDownload initWithSkipPhaseSet:]( [SUCorePolicySoftwareUpdateDownload alloc],  "initWithSkipPhaseSet:",  ([v13 specifiedUsedPolicies] & 4) == 0);
    v30 = (void *)*((void *)v13 + 11);
    *((void *)v13 + 11) = v29;

    v31 = -[SUCorePolicyPrepare initWithSkipPhaseSet:]( [SUCorePolicyPrepare alloc],  "initWithSkipPhaseSet:",  ([v13 specifiedUsedPolicies] & 8) == 0);
    v32 = (void *)*((void *)v13 + 12);
    *((void *)v13 + 12) = v31;

    v33 = -[SUCorePolicySuspend initWithSkipPhaseSet:]( [SUCorePolicySuspend alloc],  "initWithSkipPhaseSet:",  ([v13 specifiedUsedPolicies] & 0x10) == 0);
    v34 = (void *)*((void *)v13 + 13);
    *((void *)v13 + 13) = v33;

    v35 = -[SUCorePolicyResume initWithSkipPhaseSet:]( [SUCorePolicyResume alloc],  "initWithSkipPhaseSet:",  ([v13 specifiedUsedPolicies] & 0x20) == 0);
    v36 = (void *)*((void *)v13 + 14);
    *((void *)v13 + 14) = v35;

    v37 = -[SUCorePolicyApply initWithSkipPhaseSet:]( [SUCorePolicyApply alloc],  "initWithSkipPhaseSet:",  ([v13 specifiedUsedPolicies] & 0x40) == 0);
    v38 = (void *)*((void *)v13 + 15);
    *((void *)v13 + 15) = v37;

    v39 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyPreflightWakeup);
    v40 = (void *)*((void *)v13 + 17);
    *((void *)v13 + 17) = v39;

    v41 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyPreflightPrerequisiteCheck);
    v42 = (void *)*((void *)v13 + 18);
    *((void *)v13 + 18) = v41;

    v43 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyPreflightPersonalize);
    v44 = (void *)*((void *)v13 + 19);
    *((void *)v13 + 19) = v43;

    v45 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyPreflightFDRRecovery);
    v46 = (void *)*((void *)v13 + 20);
    *((void *)v13 + 20) = v45;

    v47 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyRollback);
    v48 = (void *)*((void *)v13 + 16);
    *((void *)v13 + 16) = v47;

    if (v10)
    {
      uint64_t v49 = [objc_alloc(NSString) initWithString:v10];
      v50 = (void *)*((void *)v13 + 21);
      *((void *)v13 + 21) = v49;
    }

    else
    {
      v50 = (void *)*((void *)v13 + 21);
      *((void *)v13 + 21) = 0LL;
    }

    if (v11)
    {
      uint64_t v51 = [objc_alloc(NSString) initWithString:v11];
      v52 = (void *)*((void *)v13 + 22);
      *((void *)v13 + 22) = v51;
    }

    else
    {
      v52 = (void *)*((void *)v13 + 22);
      *((void *)v13 + 22) = 0LL;
    }

    v53 = (void *)*((void *)v13 + 23);
    *((void *)v13 + 23) = 0LL;

    __int128 v110 = 0u;
    __int128 v111 = 0u;
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    id v107 = v12;
    id v54 = v12;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v108 objects:v113 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v109;
      do
      {
        uint64_t v58 = 0LL;
        do
        {
          if (*(void *)v109 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = (void *)[*(id *)(*((void *)&v108 + 1) + 8 * v58) copyWithZone:0];
          [v18 addObject:v59];

          ++v58;
        }

        while (v56 != v58);
        uint64_t v56 = [v54 countByEnumeratingWithState:&v108 objects:v113 count:16];
      }

      while (v56);
    }

    uint64_t v60 = [objc_alloc(MEMORY[0x189603F18]) initWithArray:v18];
    v61 = (void *)*((void *)v13 + 51);
    *((void *)v13 + 51) = v60;

    [MEMORY[0x189612770] sharedDevice];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v63 = [v62 buildVersion];
    v64 = (void *)*((void *)v13 + 24);
    *((void *)v13 + 24) = v63;

    [MEMORY[0x189612770] sharedDevice];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v66 = [v65 productVersion];
    v67 = (void *)*((void *)v13 + 25);
    *((void *)v13 + 25) = v66;

    [MEMORY[0x189612770] sharedDevice];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v69 = [v68 restoreVersion];
    v70 = (void *)*((void *)v13 + 26);
    *((void *)v13 + 26) = v69;

    v71 = (void *)*((void *)v13 + 27);
    *((void *)v13 + 27) = 0LL;

    [MEMORY[0x189612770] sharedDevice];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v73 = [v72 sfrBuildVersion];
    v74 = (void *)*((void *)v13 + 28);
    *((void *)v13 + 28) = v73;

    [MEMORY[0x189612770] sharedDevice];
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = [v75 deviceClass];
    v77 = (void *)*((void *)v13 + 29);
    *((void *)v13 + 29) = v76;

    [MEMORY[0x189612770] sharedDevice];
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v79 = [v78 hwModelString];
    v80 = (void *)*((void *)v13 + 30);
    *((void *)v13 + 30) = v79;

    [MEMORY[0x189612770] sharedDevice];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = [v81 productType];
    v83 = (void *)*((void *)v13 + 31);
    *((void *)v13 + 31) = v82;

    [MEMORY[0x189612770] sharedDevice];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v85 = [v84 releaseType];
    v86 = (void *)*((void *)v13 + 32);
    *((void *)v13 + 32) = v85;

    [MEMORY[0x189612770] sharedDevice];
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v13[12] = [v87 isInternal];

    *((_DWORD *)v13 + 2) = 0;
    v13[13] = 1;
    *((_DWORD *)v13 + 7) = -1;
    v88 = (void *)*((void *)v13 + 33);
    *((void *)v13 + 33) = 0LL;

    *((_WORD *)v13 + 7) = 0;
    v89 = (void *)*((void *)v13 + 34);
    *((void *)v13 + 34) = 0LL;

    v90 = (void *)*((void *)v13 + 35);
    *((void *)v13 + 35) = 0LL;

    v91 = (void *)*((void *)v13 + 36);
    *((void *)v13 + 36) = 0LL;

    v92 = (void *)*((void *)v13 + 37);
    *((void *)v13 + 37) = 0LL;

    v93 = (void *)*((void *)v13 + 38);
    *((void *)v13 + 38) = 0LL;

    v94 = (void *)*((void *)v13 + 39);
    *((void *)v13 + 39) = 0LL;

    v95 = (void *)*((void *)v13 + 40);
    *((void *)v13 + 40) = 0LL;

    v96 = (void *)*((void *)v13 + 41);
    *((void *)v13 + 41) = 0LL;

    v97 = (void *)*((void *)v13 + 42);
    *((void *)v13 + 42) = 0LL;

    v98 = (void *)*((void *)v13 + 43);
    *((void *)v13 + 43) = 0LL;

    *((_WORD *)v13 + 8) = 256;
    v99 = (void *)*((void *)v13 + 44);
    *((void *)v13 + 44) = 0LL;

    v100 = (void *)*((void *)v13 + 45);
    *((void *)v13 + 45) = 0LL;

    v101 = (void *)*((void *)v13 + 46);
    *((void *)v13 + 46) = 0LL;

    v13[20] = 0;
    v102 = (void *)*((void *)v13 + 47);
    *((void *)v13 + 47) = 0LL;

    *((_DWORD *)v13 + 8) = 0;
    *(_DWORD *)(v13 + 21) = 0;
    v13[25] = 0;
    v103 = (void *)*((void *)v13 + 48);
    *((void *)v13 + 48) = 0LL;

    v104 = (void *)*((void *)v13 + 49);
    *((void *)v13 + 49) = 0LL;

    v105 = (void *)*((void *)v13 + 50);
    *((void *)v13 + 50) = 0LL;

    *((_WORD *)v13 + 9) = 0;
    id v12 = v107;
  }

  return (SUCorePolicy *)v13;
}

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5
{
  return -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( self,  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  a3,  a4,  127LL,  a5);
}

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 updateBrainAssetType:(id)a5 usingExtensions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (objc_class *)NSString;
  id v14 = a5;
  v15 = (void *)[[v13 alloc] initWithFormat:@"this method has been deprecated (and was called with updateBrainAssetType=%@): initWithSoftwareUpdateAssetType:documentationAssetType:updateBrainAssetType:usingExtensions", v14];

  [MEMORY[0x189612778] sharedDiag];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    [v16 trackFault:@"[POLICY] INIT" forReason:v15 withResult:8123 withError:0];

    id v18 = 0LL;
  }

  else
  {
    [v16 trackAnomaly:@"[POLICY] INIT" forReason:v15 withResult:8123 withError:0];

    self =  -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:]( self,  "initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:",  v10,  v11,  v12);
    id v18 = self;
  }

  return v18;
}

- (void)setRestrictToFull:(BOOL)a3
{
  BOOL v3 = a3;
  self->_restrictToFull = a3;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setRestrictToFull:v3];
}

- (BOOL)restrictToFull
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 restrictToFull];

  return v3;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowSameVersion = a3;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setAllowSameVersion:v3];
}

- (BOOL)allowSameVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 allowSameVersion];

  return v3;
}

- (void)setBackground:(BOOL)a3
{
  BOOL v3 = a3;
  self->_background = a3;
  v5 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  [v5 setDiscretionary:v3];
  v6 = -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  [v6 setDiscretionary:v3];
  v7 = -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  [v7 setDiscretionary:v3];
  v8 = -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  [v8 setDiscretionary:v3];
  v9 = -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  [v9 setDiscretionary:v3];

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setDiscretionary:v3];
}

- (void)setAllowsCellular:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsCellular = a3;
  v5 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  [v5 setAllowsCellular:v3];
  v6 = -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  [v6 setAllowsCellular:v3];
  v7 = -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  [v7 setAllowsCellular:v3];
  v8 = -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  [v8 setAllowsCellular:v3];
  v9 = -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  [v9 setAllowsCellular:v3];

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setAllowsCellular:v3];
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicy constructSoftwareUpdateMAAssetQueryWithPurpose:]( self,  "constructSoftwareUpdateMAAssetQueryWithPurpose:",  0LL);
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v85 = self;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructSoftwareUpdateMAAssetQuery for policy: %@",  buf,  0xCu);
  }
  v7 = -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  if (!v7)
  {
    [MEMORY[0x189612778] sharedDiag];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v38,  "trackAnomaly:forReason:withResult:withError:",  @"[POLICY] CONSTRUCT_SU_QUERY",  @"softwareUpdateAssetType was unexpectedly nil, client is required to init with softwareUpdateAssetType",  8118,  0);
    goto LABEL_32;
  }

  id v8 = objc_alloc(MEMORY[0x1896110F0]);
  v9 = -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v7 = (void *)[v8 initWithType:v9 andPurpose:v4];

  uint64_t v10 = [MEMORY[0x189603FE8] null];
  [@"|" stringByAppendingFormat:@"purpose:%@|", v4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = 0x189607000uLL;
  if (([v12 restrictToFull] & 1) != 0
    || (-[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion"),
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
  }

  else
  {
    v15 = (void *)v14;
    v16 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    if (v16)
    {
      v17 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
      int v18 = [v17 restrictToIncremental];

      v19 = (void *)MEMORY[0x189603FA8];
      uint64_t v20 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
      v21 = (void *)v20;
      if (v18)
      {
        objc_msgSend(v19, "arrayWithObjects:", v20, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addKeyValueArray:@"PrerequisiteBuild" with:v22];

        v23 = (void *)MEMORY[0x189603FA8];
        v24 = -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        objc_msgSend(v23, "arrayWithObjects:", v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addKeyValueArray:@"PrerequisiteOSVersion" with:v25];

        id v26 = objc_alloc(NSString);
        uint64_t v27 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
        v28 = -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        uint64_t v29 = [v26 initWithFormat:@"prerequisite:(incr)%@:%@|", v27, v28];
      }

      else
      {
        objc_msgSend(v19, "arrayWithObjects:", v10, v20, 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addKeyValueArray:@"PrerequisiteBuild" with:v70];

        v71 = (void *)MEMORY[0x189603FA8];
        v72 = -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        objc_msgSend(v71, "arrayWithObjects:", v10, v72, 0);
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addKeyValueArray:@"PrerequisiteOSVersion" with:v73];

        id v74 = objc_alloc(NSString);
        uint64_t v27 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
        v28 = -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        uint64_t v29 = [v74 initWithFormat:@"prerequisite:%@:%@|", v27, v28];
      }

      v75 = (void *)v29;
      [v11 stringByAppendingString:v29];
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      unint64_t v13 = 0x189607000LL;
      id v11 = (void *)v27;
      goto LABEL_11;
    }
  }

  [MEMORY[0x189603FA8] arrayWithObject:v10];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addKeyValueArray:@"PrerequisiteBuild" with:v30];

  [MEMORY[0x189603FA8] arrayWithObject:v10];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addKeyValueArray:@"PrerequisiteOSVersion" with:v31];

  [v11 stringByAppendingString:@"prerequisite:(full)|"];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v33 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
  id v34 = objc_alloc(MEMORY[0x189603FA8]);
  v35 = v34;
  if (v33)
  {
    v36 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
    v37 = (void *)objc_msgSend(v35, "initWithObjects:", v10, v36, 0);
    [v7 addKeyValueArray:@"SupportedDeviceModels" with:v37];
  }

  else
  {
    v36 = (void *)objc_msgSend(v34, "initWithObjects:", v10, 0);
    [v7 addKeyValueArray:@"SupportedDeviceModels" with:v36];
  }

  id v39 = objc_alloc(*(Class *)(v13 + 2600));
  v40 = -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v41 = (void *)[v39 initWithFormat:@"hwModelStr:%@|", v40];
  [v32 stringByAppendingString:v41];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[SUCorePolicy productType](self, "productType");
  if (v43)
  {
    id v44 = objc_alloc(MEMORY[0x189603FA8]);
    v45 = -[SUCorePolicy productType](self, "productType");
    v46 = (void *)objc_msgSend(v44, "initWithObjects:", v10, v45, 0);
    [v7 addKeyValueArray:@"SupportedDevices" with:v46];
  }

  id v47 = objc_alloc(*(Class *)(v13 + 2600));
  v48 = -[SUCorePolicy productType](self, "productType");
  uint64_t v49 = (void *)[v47 initWithFormat:@"productType:%@|", v48];
  [v42 stringByAppendingString:v49];
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy releaseType](self, "releaseType");
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();

  id v78 = v4;
  if (v51)
  {
    v52 = -[SUCorePolicy releaseType](self, "releaseType");
    [v7 addKeyValuePair:@"ReleaseType" with:v52];

    id v53 = objc_alloc(*(Class *)(v13 + 2600));
    uint64_t v54 = -[SUCorePolicy releaseType](self, "releaseType");
    uint64_t v55 = (void *)[v53 initWithFormat:@"releaseType:%@|", v54];
    uint64_t v56 = [v50 stringByAppendingString:v55];

    v50 = (void *)v54;
  }

  else
  {
    uint64_t v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v10, 0);
    [v7 addKeyValueArray:@"ReleaseType" with:v57];

    uint64_t v56 = [v50 stringByAppendingString:@"releaseType:customer|"];
  }

  v77 = (void *)v10;

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v58 oslog];
  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v85 = (SUCorePolicy *)v56;
    _os_log_impl(&dword_187A54000, v59, OS_LOG_TYPE_DEFAULT, "[POLICY] querying SU metadata: %{public}@", buf, 0xCu);
  }

  uint64_t v76 = (void *)v56;

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = [v60 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v80;
    do
    {
      for (uint64_t i = 0LL; i != v62; ++i)
      {
        if (*(void *)v80 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
        [v66 oslog];
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          [v65 extensionName];
          v68 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          uint64_t v85 = v68;
          _os_log_impl( &dword_187A54000,  v67,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending query for extension %{public}@",  buf,  0xCu);
        }

        [v65 extendSoftwareUpdateMAAssetQuery:v7];
      }

      uint64_t v62 = [v60 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }

    while (v62);
  }

  v38 = v77;
  id v4 = v78;
LABEL_32:

  return v7;
}

- (id)constructDocumentationMAAssetQueryWithDocID:(id)a3 purpose:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = self;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructDocumentationMAAssetQueryWithDocID for policy: %{public}@",  buf,  0xCu);
  }

  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1896110F0]);
    -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)[v11 initWithType:v12 andPurpose:v7];

    [v10 addKeyValuePair:@"SUDocumentationID" with:v6];
    -[SUCorePolicy deviceClass](self, "deviceClass");
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addKeyValuePair:@"Device" with:v13];

    id v33 = v6;
    [@"|" stringByAppendingFormat:@"documentationID:%@|", v6];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SUCorePolicy deviceClass](self, "deviceClass");
    [v14 stringByAppendingFormat:@"deviceClass:%@|", v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    id v32 = v7;
    uint64_t v17 = [v16 stringByAppendingFormat:@"purpose:%@|", v7];

    [MEMORY[0x1896127A0] sharedLogger];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = (SUCorePolicy *)v17;
      _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "[POLICY] documentation asset query options: %{public}@",  buf,  0xCu);
    }

    v31 = (void *)v17;

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    -[SUCorePolicy policyExtensions](self, "policyExtensions");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          [MEMORY[0x1896127A0] sharedLogger];
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 oslog];
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            [v25 extensionName];
            v28 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v40 = v28;
            _os_log_impl( &dword_187A54000,  v27,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending documentation options for extension %{public}@",  buf,  0xCu);
          }

          [v25 extendDocumentationMAAssetQuery:v10];
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }

      while (v22);
    }

    id v7 = v32;
    id v6 = v33;
    uint64_t v29 = v31;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v29,  "trackAnomaly:forReason:withResult:withError:",  @"[POLICY] CONSTRUCT_DOC_QUERY",  @"documentationAssetType was unexpectedly nil, client is required to init with documentationAssetType",  8118,  0);
  }

  return v10;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  uint64_t v136 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  [MEMORY[0x1896127A0] sharedLogger];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v132 = self;
    _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[POLICY] selectSoftwareUpdatePrimaryAsset:secondaryAsset:fromAssetQuery for policy: %@",  buf,  0xCu);
  }

  if (!a3)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = @"selectSoftwareUpdatePrimaryAsset called with unexpected nil primaryAsset param";
LABEL_13:
    [v14 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v16 withResult:8102 withError:0];
    goto LABEL_93;
  }

  if (!a4)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = @"selectSoftwareUpdatePrimaryAsset called with unexpected nil secondaryAsset param";
    goto LABEL_13;
  }

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

LABEL_16:
      [MEMORY[0x189612778] sharedDiag];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = objc_alloc(NSString);
      v19 = -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
      -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = (void *)[v18 initWithFormat:@"selectSoftwareUpdatePrimaryAsset called with unexpected nil/non-nil values for prerequisiteProductVersion (%@) and prerequisiteBuildVersion (%@)", v19, v20];
      [v15 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v21 withResult:8116 withError:0];

      goto LABEL_93;
    }
  }

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11) {
    if (!v13)
    }
      goto LABEL_16;
  }

  else
  {

    if (v11) {
  }
    }

  objc_msgSend(v8, "SUCoreBorder_results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v15 count];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 oslog];
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 SU query results (before filtering)",  buf,  2u);
    }

    goto LABEL_92;
  }

  objc_super v112 = a3;
  v113 = a4;
  if (v25)
  {
    uint64_t v26 = [v15 count];
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v26;
    _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu SU query results (before filtering)",  buf,  0xCu);
  }

  id v114 = v8;

  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = -[os_log_s countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v126,  v135,  16LL);
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v127;
    do
    {
      uint64_t v30 = 0LL;
      v31 = v15;
      do
      {
        if (*(void *)v127 != v29) {
          objc_enumerationMutation(v24);
        }
        id v32 = *(void **)(*((void *)&v126 + 1) + 8 * v30);
        [v32 filterSoftwareUpdateAssetArray:v31];
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x1896127A0] sharedLogger];
        id v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 oslog];
        __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = [v15 count];
          [v32 extensionName];
          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v132 = (SUCorePolicy *)v35;
          __int16 v133 = 2114;
          v134 = v36;
          _os_log_impl( &dword_187A54000,  v34,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@",  buf,  0x16u);
        }

        if (![v15 count])
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          [v42 oslog];
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_187A54000,  v43,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 assets found, stopping filtering early",  buf,  2u);
          }

          id v8 = v114;
          goto LABEL_92;
        }

        ++v30;
        v31 = v15;
      }

      while (v28 != v30);
      uint64_t v28 = -[os_log_s countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v126,  v135,  16LL);
    }

    while (v28);
  }

  uint64_t v37 = -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  uint64_t v38 = MEMORY[0x1895F87A8];
  if (!v37
    || (id v39 = (void *)v37,
        -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        v40,
        v39,
        !v40))
  {
    id v44 = v15;
    [MEMORY[0x1896127A0] sharedLogger];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 oslog];
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v46,  OS_LOG_TYPE_DEFAULT,  "[POLICY] not filtering for productVersion or buildVersion in SUCorePolicy",  buf,  2u);
    }

    __int128 v108 = 0LL;
    goto LABEL_49;
  }

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v41 allowSameVersion])
  {

LABEL_45:
    v48 = (void *)MEMORY[0x1896079C8];
    v125[0] = v38;
    v125[1] = 3221225472LL;
    v125[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke;
    v125[3] = &unk_18A0EF9C0;
    v125[4] = self;
    uint64_t v49 = v125;
    goto LABEL_47;
  }

  BOOL v47 = -[SUCorePolicy isSplatPolicy](self, "isSplatPolicy");

  if (v47) {
    goto LABEL_45;
  }
  v48 = (void *)MEMORY[0x1896079C8];
  v124[0] = v38;
  v124[1] = 3221225472LL;
  v124[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_405;
  v124[3] = &unk_18A0EF9C0;
  v124[4] = self;
  uint64_t v49 = v124;
LABEL_47:
  [v48 predicateWithBlock:v49];
  __int128 v108 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 filteredArrayUsingPredicate:v108];
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896127A0] sharedLogger];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 oslog];
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v51 = [v44 count];
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v51;
    _os_log_impl( &dword_187A54000,  v46,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for productVersion in SUCorePolicy",  buf,  0xCu);
  }

BOOL __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 attributes];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"Build"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 attributes];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 safeStringForKey:@"OSVersion"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreDescriptor cleanProductVersion:](&OBJC_CLASS___SUCoreDescriptor, "cleanProductVersion:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) prerequisiteProductVersion];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) prerequisiteBuildVersion];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = +[SUCorePolicy getAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:prerequisiteBuildVersion:]( &OBJC_CLASS___SUCorePolicy,  "getAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:prere quisiteBuildVersion:",  v8,  v5,  v9,  v10);

  [MEMORY[0x1896127A0] sharedLogger];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) prerequisiteBuildVersion];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [*(id *)(a1 + 32) prerequisiteProductVersion];
    v16 = (void *)v15;
    int v19 = 138544386;
    uint64_t v17 = @"NO";
    uint64_t v20 = v5;
    if (v11) {
      uint64_t v17 = @"YES";
    }
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    v24 = v14;
    __int16 v25 = 2114;
    uint64_t v26 = v15;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering by product version (allow same), assetBuildVersion=%{public}@, assetOSVersion=%{public}@, prere quisiteBuildVersion=%{public}@, prerequisiteProductVersion=%{public}@ | keep=%{public}@",  (uint8_t *)&v19,  0x34u);
  }

  return v11;
}

BOOL __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_405( uint64_t a1,  void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 attributes];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"Build"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 attributes];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 safeStringForKey:@"OSVersion"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreDescriptor cleanProductVersion:](&OBJC_CLASS___SUCoreDescriptor, "cleanProductVersion:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) prerequisiteProductVersion];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) prerequisiteBuildVersion];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = +[SUCorePolicy getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:prerequisiteBuildVersion:]( &OBJC_CLASS___SUCorePolicy,  "getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:pre requisiteBuildVersion:",  v8,  v5,  v9,  v10);

  [MEMORY[0x1896127A0] sharedLogger];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) prerequisiteBuildVersion];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [*(id *)(a1 + 32) prerequisiteProductVersion];
    v16 = (void *)v15;
    int v19 = 138544386;
    uint64_t v17 = @"NO";
    uint64_t v20 = v5;
    if (v11) {
      uint64_t v17 = @"YES";
    }
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    v24 = v14;
    __int16 v25 = 2114;
    uint64_t v26 = v15;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering by product version, assetBuildVersion=%{public}@, assetOSVersion=%{public}@, prerequisiteBuildV ersion=%{public}@, prerequisiteProductVersion=%{public}@ | keep=%{public}@",  (uint8_t *)&v19,  0x34u);
  }

  return v11;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_406( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 attributes];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"OSVersion"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePolicy _cleanProductVersion:](&OBJC_CLASS___SUCorePolicy, "_cleanProductVersion:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 attributes];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 safeStringForKey:@"OSVersion"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePolicy _cleanProductVersion:](&OBJC_CLASS___SUCorePolicy, "_cleanProductVersion:", v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [v7 compare:v10 options:64];
  return v11;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"OSVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SUCorePolicy _cleanProductVersion:](&OBJC_CLASS___SUCorePolicy, "_cleanProductVersion:", v4);
  uint64_t v6 = [MEMORY[0x189612760] stringIsEqual:v5 to:*(void *)(a1 + 32)];
  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"NO";
    int v12 = 138543874;
    if ((_DWORD)v6) {
      uint64_t v10 = @"YES";
    }
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering highest product version, highestProductVersion=%{public}@, assetProductVersion=%{public}@ | keep=%{public}@",  (uint8_t *)&v12,  0x20u);
  }

  return v6;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_409( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 attributes];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"Build"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 attributes];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKeyedSubscript:@"Build"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [v6 compare:v8 options:64];
  if (!v9) {
    uint64_t v9 = [v6 compare:v8];
  }

  return v9;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2_411( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x189612760];
  [v3 attributes];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"Build"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v4 stringIsEqual:v6 to:*(void *)(a1 + 32)];

  [MEMORY[0x1896127A0] sharedLogger];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    [v3 attributes];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 objectForKeyedSubscript:@"Build"];
    uint64_t v13 = (void *)v12;
    __int16 v14 = @"NO";
    int v16 = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    if ((_DWORD)v7) {
      __int16 v14 = @"YES";
    }
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    __int16 v21 = v14;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering highest build version, highestBuildVersion=%{public}@, assetBuildVersion=%{public}@ | keep=%{public}@",  (uint8_t *)&v16,  0x20u);
  }

  return v7;
}

+ (BOOL)getAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 compare:v11 options:64] == 1)
  {
    BOOL v13 = 1;
  }

  else if ([v9 compare:v11 options:64])
  {
    BOOL v13 = 0;
  }

  else
  {
    BOOL v13 = [v10 compare:v12 options:64] != -1;
  }

  return v13;
}

+ (BOOL)getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 compare:v11 options:64] == 1)
  {
    BOOL v13 = 1;
  }

  else if ([v9 compare:v11 options:64])
  {
    BOOL v13 = 0;
  }

  else
  {
    BOOL v13 = [v10 compare:v12 options:64] == 1;
  }

  return v13;
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7
{
  uint64_t v186 = *MEMORY[0x1895F89C0];
  id v12 = a7;
  [MEMORY[0x1896127A0] sharedLogger];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v182 = self;
    _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "[POLICY] Select major/minor software update for policy: %@",  buf,  0xCu);
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
  if (!a3)
  {
    [MEMORY[0x189612778] sharedDiag];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil majorPrimaryAsset param";
LABEL_25:
    [v18 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v20 withResult:8102 withError:0];
    goto LABEL_26;
  }

  if (!a4)
  {
    [MEMORY[0x189612778] sharedDiag];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil majorSecondaryAsset param";
    goto LABEL_25;
  }

  if (!a5)
  {
    [MEMORY[0x189612778] sharedDiag];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil minorPrimaryAsset param";
    goto LABEL_25;
  }

  if (!a6)
  {
    [MEMORY[0x189612778] sharedDiag];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil minorSecondaryAsset param";
    goto LABEL_25;
  }

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

LABEL_29:
      [MEMORY[0x189612778] sharedDiag];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = objc_alloc(NSString);
      -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
      __int16 v25 = (void *)[v22 initWithFormat:@"Select major/minor software update called with unexpected nil/non-nil values for prerequisiteProductVersion (%@) and prerequisiteBuildVersion (%@)", v23, v24];
      [v19 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v25 withResult:8116 withError:0];

      goto LABEL_26;
    }
  }

  v155 = a3;
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15) {
    if (!v17)
    }
      goto LABEL_29;
  }

  else
  {

    if (v15) {
  }
    }

  id v26 = objc_alloc(MEMORY[0x1896127C0]);
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)[v26 initWithRestoreVersion:v27];

  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28 || !v19)
  {
    [MEMORY[0x189612778] sharedDiag];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:@"Select major/minor software update called with unexpected nil prerequisiteRestoreVersion property or inability to parse version string" withResult:8116 withError:0];
    goto LABEL_129;
  }

  v153 = self;
  objc_msgSend(v12, "SUCoreBorder_results");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v156 count];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 oslog];
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (v32)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v31,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 SU query results (before filtering)",  buf,  2u);
    }

    goto LABEL_128;
  }

  if (v32)
  {
    uint64_t v33 = [v156 count];
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v33;
    _os_log_impl( &dword_187A54000,  v31,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu SU query results (before filtering)",  buf,  0xCu);
  }

  v148 = a4;
  v149 = a5;
  v150 = a6;
  id v151 = v12;
  v152 = v19;

  __int128 v177 = 0u;
  __int128 v178 = 0u;
  __int128 v175 = 0u;
  __int128 v176 = 0u;
  -[SUCorePolicy policyExtensions](v153, "policyExtensions");
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = -[os_log_s countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v175,  v185,  16LL);
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v176;
    uint64_t v37 = v156;
    do
    {
      for (uint64_t i = 0LL; i != v35; ++i)
      {
        if (*(void *)v176 != v36) {
          objc_enumerationMutation(v31);
        }
        id v39 = *(void **)(*((void *)&v175 + 1) + 8 * i);
        [v39 filterSoftwareUpdateAssetArray:v37];
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 oslog];
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = [v40 count];
          [v39 extensionName];
          id v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v182 = (SUCorePolicy *)v43;
          __int16 v183 = 2114;
          v184 = v44;
          _os_log_impl( &dword_187A54000,  v42,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@",  buf,  0x16u);
        }

        if (![v40 count])
        {
          v156 = v40;
          [MEMORY[0x1896127A0] sharedLogger];
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          [v46 oslog];
          BOOL v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_187A54000,  v47,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 assets found, stopping filtering early",  buf,  2u);
          }

          goto LABEL_127;
        }

        uint64_t v37 = v40;
      }

      uint64_t v35 = -[os_log_s countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v175,  v185,  16LL);
      uint64_t v37 = v40;
    }

    while (v35);
  }

  else
  {
    uint64_t v37 = v156;
  }

  v156 = v37;

  v48 = v153;
  -[SUCorePolicy softwareUpdateScanPolicy](v153, "softwareUpdateScanPolicy");
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  int v50 = [v49 shouldScanForMinorUpdates];

  if (!v50)
  {
    id v71 = 0LL;
    id v147 = 0LL;
    uint64_t v86 = v152;
    goto LABEL_90;
  }

  uint64_t v51 = (void *)MEMORY[0x1896079C8];
  uint64_t v52 = MEMORY[0x1895F87A8];
  v172[0] = MEMORY[0x1895F87A8];
  v172[1] = 3221225472LL;
  v172[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke;
  v172[3] = &unk_18A0F16A0;
  id v173 = v152;
  v174 = v153;
  [v51 predicateWithBlock:v172];
  id v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 filteredArrayUsingPredicate:v53];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v55 oslog];
  uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v57 = [v54 count];
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v57;
    _os_log_impl( &dword_187A54000,  v56,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for minor assets in SUCorePolicy",  buf,  0xCu);
  }

  [v54 sortedArrayUsingComparator:&__block_literal_global_426];
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v58 lastObject];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v59 attributes];
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  [v60 safeStringForKey:@"RestoreVersion"];
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v62 = (void *)MEMORY[0x1896079C8];
  v170[0] = v52;
  v170[1] = 3221225472LL;
  v170[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2;
  v170[3] = &unk_18A0EF9C0;
  id v144 = v61;
  id v171 = v144;
  [v62 predicateWithBlock:v170];
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  id v146 = v58;
  [v58 filteredArrayUsingPredicate:v63];
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 oslog];
  uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v67 = [v64 count];
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v67;
    _os_log_impl( &dword_187A54000,  v66,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for highest minor assets in SUCorePolicy",  buf,  0xCu);
  }

  __int128 v168 = 0u;
  __int128 v169 = 0u;
  __int128 v166 = 0u;
  __int128 v167 = 0u;
  id v68 = v64;
  uint64_t v69 = [v68 countByEnumeratingWithState:&v166 objects:v180 count:16];
  v157 = v68;
  if (!v69)
  {

    uint64_t v86 = v152;
    uint64_t v88 = v144;
    v87 = v58;
LABEL_83:
    [MEMORY[0x1896127A0] sharedLogger];
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    [v89 oslog];
    v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v90,  OS_LOG_TYPE_DEFAULT,  "[POLICY] query to locate minor update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    v91 = v157;
    [v157 firstObject];
    id v71 = (id)objc_claimAutoreleasedReturnValue();
    id v72 = 0LL;
    goto LABEL_89;
  }

  uint64_t v70 = v69;
  v142 = v54;
  id v71 = 0LL;
  id v72 = 0LL;
  uint64_t v73 = *(void *)v167;
  do
  {
    uint64_t v74 = 0LL;
    do
    {
      if (*(void *)v167 != v73) {
        objc_enumerationMutation(v68);
      }
      v75 = *(void **)(*((void *)&v166 + 1) + 8 * v74);
      if (!v71)
      {
        [*(id *)(*((void *)&v166 + 1) + 8 * v74) attributes];
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v79 = [v78 safeStringForKey:@"PrerequisiteBuild"];
        if (v79)
        {
          id v80 = (void *)v79;
          [v75 attributes];
          id v81 = (void *)objc_claimAutoreleasedReturnValue();
          [v81 safeStringForKey:@"PrerequisiteOSVersion"];
          uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();

          id v71 = 0LL;
          id v68 = v157;

          if (v82)
          {
            id v71 = v75;
            goto LABEL_75;
          }
        }

        else
        {
        }
      }

      if (v72) {
        goto LABEL_75;
      }
      [v75 attributes];
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
      [v76 safeStringForKey:@"PrerequisiteBuild"];
      id v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (v77)
      {

LABEL_74:
        id v72 = 0LL;
        goto LABEL_75;
      }

      [v75 attributes];
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      [v83 safeStringForKey:@"PrerequisiteOSVersion"];
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84) {
        goto LABEL_74;
      }
      id v72 = v75;
LABEL_75:
      ++v74;
    }

    while (v70 != v74);
    uint64_t v85 = [v68 countByEnumeratingWithState:&v166 objects:v180 count:16];
    uint64_t v70 = v85;
  }

  while (v85);

  v48 = v153;
  uint64_t v54 = v142;
  if (v71)
  {
    uint64_t v86 = v152;
    uint64_t v88 = v144;
    v87 = v146;
    goto LABEL_88;
  }

  uint64_t v86 = v152;
  uint64_t v88 = v144;
  v87 = v146;
  if (!v72) {
    goto LABEL_83;
  }
  id v71 = v72;
  id v72 = 0LL;
LABEL_88:
  v91 = v157;
LABEL_89:
  id v147 = v72;

LABEL_90:
  v92 = -[SUCorePolicy softwareUpdateScanPolicy](v48, "softwareUpdateScanPolicy");
  int v93 = [v92 shouldScanForMajorUpdates];

  id v154 = v71;
  if (!v93)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    [v131 oslog];
    v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCorePolicy softwareUpdateScanPolicy](v48, "softwareUpdateScanPolicy");
      __int16 v133 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCorePolicySoftwareUpdateScan nameForScanUpdateType:]( SUCorePolicySoftwareUpdateScan,  "nameForScanUpdateType:",  [v133 scanUpdateType]);
      v134 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v182 = v134;
      _os_log_impl( &dword_187A54000,  v132,  OS_LOG_TYPE_DEFAULT,  "[POLICY] not scanning for major software update assets as scan update type is %{public}@",  buf,  0xCu);
    }

    id v115 = 0LL;
    id v116 = 0LL;
    v135 = v155;
    goto LABEL_126;
  }

  v94 = (void *)MEMORY[0x1896079C8];
  uint64_t v95 = MEMORY[0x1895F87A8];
  v164[0] = MEMORY[0x1895F87A8];
  v164[1] = 3221225472LL;
  v164[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_427;
  v164[3] = &unk_18A0EF9C0;
  v165 = v86;
  [v94 predicateWithBlock:v164];
  id v96 = (void *)objc_claimAutoreleasedReturnValue();
  [v156 filteredArrayUsingPredicate:v96];
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  [v98 oslog];
  v99 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v100 = [v97 count];
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v100;
    _os_log_impl( &dword_187A54000,  v99,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for major assets in SUCorePolicy",  buf,  0xCu);
  }

  v143 = v97;
  [v97 sortedArrayUsingComparator:&__block_literal_global_429];
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  [v101 lastObject];
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  [v102 attributes];
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  [v103 safeStringForKey:@"RestoreVersion"];
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = (void *)MEMORY[0x1896079C8];
  v162[0] = v95;
  v162[1] = 3221225472LL;
  v162[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2_430;
  v162[3] = &unk_18A0EF9C0;
  id v106 = v104;
  id v163 = v106;
  [v105 predicateWithBlock:v162];
  id v107 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v101;
  [v101 filteredArrayUsingPredicate:v107];
  __int128 v108 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  __int128 v109 = (void *)objc_claimAutoreleasedReturnValue();
  [v109 oslog];
  __int128 v110 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v111 = [v108 count];
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v111;
    _os_log_impl( &dword_187A54000,  v110,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu assets left after filtering for highest major assets in SUCorePolicy",  buf,  0xCu);
  }

  __int128 v160 = 0u;
  __int128 v161 = 0u;
  __int128 v158 = 0u;
  __int128 v159 = 0u;
  id v112 = v108;
  uint64_t v113 = [v112 countByEnumeratingWithState:&v158 objects:v179 count:16];
  v145 = v106;
  if (!v113)
  {

    goto LABEL_121;
  }

  uint64_t v114 = v113;
  id v115 = 0LL;
  id v116 = 0LL;
  uint64_t v117 = *(void *)v159;
  while (2)
  {
    uint64_t v118 = 0LL;
    while (2)
    {
      if (*(void *)v159 != v117) {
        objc_enumerationMutation(v112);
      }
      __int128 v119 = *(void **)(*((void *)&v158 + 1) + 8 * v118);
      if (v115)
      {
LABEL_101:
        if (!v116)
        {
          [v119 attributes];
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          [v120 safeStringForKey:@"PrerequisiteBuild"];
          id v121 = (void *)objc_claimAutoreleasedReturnValue();
          if (v121)
          {

            goto LABEL_109;
          }

          [v119 attributes];
          __int128 v128 = (void *)objc_claimAutoreleasedReturnValue();
          [v128 safeStringForKey:@"PrerequisiteOSVersion"];
          __int128 v129 = (void *)objc_claimAutoreleasedReturnValue();

          if (v129) {
LABEL_109:
          }
            id v116 = 0LL;
          else {
            id v116 = v119;
          }
        }
      }

      else
      {
        [*(id *)(*((void *)&v158 + 1) + 8 * v118) attributes];
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v123 = [v122 safeStringForKey:@"PrerequisiteBuild"];
        if (!v123)
        {

          goto LABEL_101;
        }

        v124 = (void *)v123;
        [v119 attributes];
        id v125 = v112;
        __int128 v126 = (void *)objc_claimAutoreleasedReturnValue();
        [v126 safeStringForKey:@"PrerequisiteOSVersion"];
        __int128 v127 = (void *)objc_claimAutoreleasedReturnValue();

        id v112 = v125;
        id v115 = 0LL;

        if (!v127) {
          goto LABEL_101;
        }
        id v115 = v119;
      }

      if (v114 != ++v118) {
        continue;
      }
      break;
    }

    uint64_t v130 = [v112 countByEnumeratingWithState:&v158 objects:v179 count:16];
    uint64_t v114 = v130;
    if (v130) {
      continue;
    }
    break;
  }

  if (!v115)
  {
    if (v116)
    {
      id v115 = v116;
      goto LABEL_124;
    }

BOOL __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"RestoreVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v4];
  if ([*(id *)(a1 + 32) isComparable:v5]
    && (uint64_t v6 = [*(id *)(a1 + 32) majorVersion], v6 == objc_msgSend(v5, "majorVersion")))
  {
    uint64_t v7 = [*(id *)(a1 + 32) compare:v5];
    [*(id *)(a1 + 40) softwareUpdateScanPolicy];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 allowSameVersion];

    if (v9) {
      BOOL v10 = (unint64_t)(v7 + 1) < 2;
    }
    else {
      BOOL v10 = v7 == -1;
    }
  }

  else
  {
    BOOL v10 = 0LL;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) softwareUpdateScanPolicy];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      __int16 v14 = @"NO";
    }
    [*(id *)(a1 + 32) summary];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v5 summary];
    uint64_t v17 = (void *)v16;
    int v20 = 138544130;
    if (v10) {
      __int16 v18 = @"YES";
    }
    else {
      __int16 v18 = @"NO";
    }
    __int16 v21 = v14;
    __int16 v22 = 2114;
    __int16 v23 = v15;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    __int16 v26 = 2114;
    __int16 v27 = v18;
    _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering for minor assets only: allowSame:%{public}@ currentRestoreVersion=%{public}@ assetRestoreVersio n=%{public}@ | keep=%{public}@",  (uint8_t *)&v20,  0x2Au);
  }

  return v10;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_425( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 attributes];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"RestoreVersion"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 attributes];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 safeStringForKey:@"RestoreVersion"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  int v9 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v6];
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"RestoreVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [MEMORY[0x189612760] stringIsEqual:*(void *)(a1 + 32) to:v4];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = @"NO";
    int v11 = 138543874;
    if ((_DWORD)v5) {
      int v9 = @"YES";
    }
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    __int16 v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering highest minor restore version, highestMinorRestoreVersion=%{public}@, assetRestoreVersion=%{pub lic}@ | keep=%{public}@",  (uint8_t *)&v11,  0x20u);
  }

  return v5;
}

BOOL __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_427( uint64_t a1,  void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"RestoreVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v4];
  if ([*(id *)(a1 + 32) isComparable:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 32) majorVersion];
    BOOL v7 = v6 < [v5 majorVersion];
  }

  else
  {
    BOOL v7 = 0LL;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v5 summary];
    uint64_t v12 = (void *)v11;
    __int16 v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if (v7) {
      __int16 v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    int v20 = v13;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering for major assets only, currentRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@",  (uint8_t *)&v15,  0x20u);
  }

  return v7;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_428( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 attributes];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"RestoreVersion"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 attributes];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 safeStringForKey:@"RestoreVersion"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  int v9 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v6];
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1896127C0]) initWithRestoreVersion:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2_430( uint64_t a1,  void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"RestoreVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [MEMORY[0x189612760] stringIsEqual:*(void *)(a1 + 32) to:v4];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = @"NO";
    int v11 = 138543874;
    if ((_DWORD)v5) {
      int v9 = @"YES";
    }
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    __int16 v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[POLICY] filtering highest major restore version, highestMajorRestoreVersion=%{public}@, assetRestoreVersion=%{pub lic}@ | keep=%{public}@",  (uint8_t *)&v11,  0x20u);
  }

  return v5;
}

- (void)selectDocumentationAsset:(id *)a3 fromAssetQuery:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = self;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[POLICY] selectDocumentationAsset:fromAssetQuery for policy: %@",  buf,  0xCu);
  }

  if (!a3)
  {
    [MEMORY[0x189612778] sharedDiag];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 trackError:@"[POLICY] SELECT_DOC_ASSET" forReason:@"selectDocumentationAsset called with unexpected nil docAsset param" withResult:8102 withError:0];
    goto LABEL_27;
  }

  objc_msgSend(v6, "SUCoreBorder_results");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v9 count])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 oslog];
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
LABEL_26:

      goto LABEL_27;
    }

    *(_WORD *)buf = 0;
    __int16 v27 = "[POLICY] 0 doc query results (before filtering)";
LABEL_25:
    _os_log_impl(&dword_187A54000, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_26;
  }

  uint64_t v30 = a3;
  id v31 = v6;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v29 = self;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      uint64_t v14 = 0LL;
      __int16 v15 = v9;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        [v16 filterDocumentationAssetArray:v15];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 oslog];
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v9 count];
          [v16 extensionName];
          int v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          uint64_t v37 = (SUCorePolicy *)v19;
          __int16 v38 = 2114;
          id v39 = v20;
          _os_log_impl( &dword_187A54000,  v18,  OS_LOG_TYPE_DEFAULT,  "[POLICY] %lu doc assets left after filtering from SUCorePolicyExtension %{public}@",  buf,  0x16u);
        }

        if (![v9 count])
        {
          [MEMORY[0x1896127A0] sharedLogger];
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 oslog];
          __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "[POLICY] 0 doc assets found, stopping filtering early",  buf,  2u);
          }

          id v6 = v31;
          goto LABEL_27;
        }

        ++v14;
        __int16 v15 = v9;
      }

      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if ((unint64_t)[v9 count] >= 2)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v22 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ doc query with %lu results when only 1 expected", v29, objc_msgSend(v9, "count")];
    [v21 trackAnomaly:@"[POLICY] SELECT_DOC_ASSET" forReason:v22 withResult:8116 withError:0];
  }

  id v6 = v31;
  if (![v9 count])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 oslog];
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    __int16 v27 = "[POLICY] 0 doc assets found";
    goto LABEL_25;
  }

  [v9 objectAtIndexedSubscript:0];
  id *v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  uint64_t v194 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v191 = self;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for policy: %@",  buf,  0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x189611118]);
  if (!v10)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create software update catalog download options", self];
    [v11 trackError:@"SU_CATALOG_DOWNLOAD_OPTIONS" forReason:v18 withResult:8100 withError:0];
LABEL_38:

    uint64_t v82 = @"|";
    v83 = v11;
    uint64_t v11 = 0LL;
    goto LABEL_84;
  }

  uint64_t v11 = v10;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 additionalServerParams];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x189603FC8]);
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 additionalServerParams];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = (void *)[v14 initWithDictionary:v16];
    [v11 setAdditionalServerParams:v17];
  }

  else
  {
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v11 setAdditionalServerParams:v15];
  }

  [v11 additionalServerParams];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v81 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create software update catalog download options additional server params", self];
    [v18 trackError:@"SU_CATALOG_DOWNLOAD_OPTIONS" forReason:v81 withResult:8100 withError:0];

    goto LABEL_38;
  }

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v21 = [v20 specifiedFields];

  if ((v21 & 0x100) != 0)
  {
    [v11 additionalServerParams];
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 sessionId];
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setSafeObject:v24 forKey:@"SessionId"];
  }

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v26 = [v25 specifiedFields];

  if ((v26 & 0x200) != 0)
  {
    [v11 additionalServerParams];
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 rampingScanType];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 setSafeObject:v29 forKey:@"DeviceCheck"];
  }

  [v11 setSessionId:v6];
  id v30 = objc_alloc(NSString);
  [v11 sessionId];
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [v30 initWithFormat:@"scanUUID:%@|", v31];
  [@"|" stringByAppendingString:v32];
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscretionary:", objc_msgSend(v34, "discretionary"));

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v32) = [v35 specifiedFields];

  if ((v32 & 0x1000) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableUI:", objc_msgSend(v36, "disableUI"));
  }

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  char v38 = [v37 specifiedFields];

  if ((v38 & 2) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v39, "allowsCellular"));
  }
  v40 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  char v41 = [v40 specifiedFields];

  if ((v41 & 8) != 0)
  {
    v42 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    objc_msgSend(v11, "setRequiresPowerPluggedIn:", objc_msgSend(v42, "requiresPowerPluggedIn"));
  }

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  char v44 = [v43 specifiedFields];

  if ((v44 & 0x40) != 0)
  {
    v45 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    objc_msgSend(v11, "setAllowSameVersion:", objc_msgSend(v45, "allowSameVersion"));
  }

  id v184 = v6;
  v46 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  __int16 v47 = [v46 specifiedFields];

  if ((v47 & 0x800) != 0)
  {
    v48 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    objc_msgSend(v11, "setLiveServerCatalogOnly:", objc_msgSend(v48, "liveServerCatalogOnly"));
  }

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setPrerequisiteProductVersion:v49];

  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  int v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setPrerequisiteBuildVersion:v50];

  -[SUCorePolicy releaseType](self, "releaseType");
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setPrerequisiteReleaseType:v51];

  [v11 additionalServerParams];
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  id v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 setSafeObject:v53 forKey:@"RestoreVersion"];

  [v11 additionalServerParams];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 setSafeObject:v55 forKey:@"TargetRestoreVersion"];

  [v11 additionalServerParams];
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v56 setSafeObject:v57 forKey:@"InstalledSFRVersion"];

  [v11 additionalServerParams];
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  else {
    uint64_t v60 = @"false";
  }
  [v58 setSafeObject:v60 forKey:@"AllowSameBuildVersion"];

  [v11 additionalServerParams];
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v63 = @"false";
  }
  [v61 setSafeObject:v63 forKey:@"AllowSameRestoreVersion"];

  [v11 additionalServerParams];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[SUCorePolicy productType](self, "productType");
  [v64 setSafeObject:v65 forKey:@"ProductType"];

  [v11 additionalServerParams];
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
  [v66 setSafeObject:v67 forKey:@"HWModelStr"];

  [v11 additionalServerParams];
  id v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
  [v68 setSafeObject:v69 forKey:@"DeviceName"];

  [v11 additionalServerParams];
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v71 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  [v70 setSafeObject:v71 forKey:@"BuildVersion"];

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  id v72 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v71) = [v72 specifiedFields];

  if ((v71 & 0x80) != 0)
  {
    v75 = -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    objc_msgSend(v11, "setTimeoutIntervalForResource:", (int)objc_msgSend(v75, "downloadTimeoutSecs"));
  }

  else
  {
    if (-[SUCorePolicy isInternal](self, "isInternal")) {
      uint64_t v73 = 60LL;
    }
    else {
      uint64_t v73 = 30LL;
    }
    [v11 setTimeoutIntervalForResource:v73];
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
    [v74 oslog];
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
      int v77 = [v76 downloadTimeoutSecs];
      uint64_t v78 = [v11 timeoutIntervalForResource];
      BOOL v79 = -[SUCorePolicy isInternal](self, "isInternal");
      *(_DWORD *)buf = 67109634;
      id v80 = @"YES";
      if (!v79) {
        id v80 = @"NO";
      }
      *(_DWORD *)v191 = v77;
      *(_WORD *)&v191[4] = 2048;
      *(void *)&v191[6] = v78;
      __int16 v192 = 2114;
      v193 = v80;
      _os_log_impl( &dword_187A54000,  (os_log_t)v75,  OS_LOG_TYPE_DEFAULT,  "[POLICY] downloadTimeoutSecs is %d, setting timeoutIntervalForResource to %ld (isInternal=%{public}@)",  buf,  0x1Cu);
    }
  }
  v84 = -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  if (v84)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setDownloadAuthorizationHeader:v85];
  }

  if (v7)
  {
    uint64_t v86 = (void *)[v7 copy];
    [v11 setLiveAssetAudienceUUID:v86];

    v87 = (void *)[v7 copy];
    [v11 setPurpose:v87];

    [v11 liveAssetAudienceUUID];
    uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 stringByAppendingFormat:@"assetAudience(param):%@|", v88];
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 purpose];
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    [v89 stringByAppendingFormat:@"purpose(param):%@|", v90];
LABEL_46:
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }
  v91 = -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  if (v91)
  {
    v92 = -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    int v93 = (void *)[v92 copy];
    [v11 setLiveAssetAudienceUUID:v93];
    v94 = -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    uint64_t v95 = (void *)[v94 copy];
    [v11 setPurpose:v95];

    [v11 liveAssetAudienceUUID];
    id v96 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 stringByAppendingFormat:@"assetAudience(self):%@|", v96];
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 purpose];
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    [v89 stringByAppendingFormat:@"purpose(self):%@|", v90];
    goto LABEL_46;
  }

- (id)constructMADocumentationCatalogDownloadOptionsWithUUID:(id)a3 usingDescriptor:(id)a4
{
  uint64_t v144 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)id v141 = self;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructMADocumentationCatalogDownloadOptionsWithUUID for policy: %{public}@",  buf,  0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x189611118]);
  if (!v10)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create documentation catalog download options", self];
    [v11 trackError:@"DOC_CATALOG_DOWNLOAD_OPTIONS" forReason:v18 withResult:8100 withError:0];
LABEL_40:

    v103 = @"|";
    v104 = v11;
    uint64_t v11 = 0LL;
    goto LABEL_59;
  }

  uint64_t v11 = v10;
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 additionalServerParams];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x189603FC8]);
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 additionalServerParams];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = (void *)[v14 initWithDictionary:v16];
    [v11 setAdditionalServerParams:v17];
  }

  else
  {
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v11 setAdditionalServerParams:v15];
  }

  [v11 additionalServerParams];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create documentation catalog download options additional server params", self];
    [v18 trackError:@"DOC_CATALOG_DOWNLOAD_OPTIONS" forReason:v102 withResult:8100 withError:0];

    goto LABEL_40;
  }

  [v11 setSessionId:v6];
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscretionary:", objc_msgSend(v20, "discretionary"));

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
  char v22 = [v21 specifiedFields];

  if ((v22 & 0x40) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableUI:", objc_msgSend(v23, "disableUI"));
  }

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
  char v25 = [v24 specifiedFields];

  if ((v25 & 2) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v26, "allowsCellular"));
  }

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
  char v28 = [v27 specifiedFields];

  if ((v28 & 8) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequiresPowerPluggedIn:", objc_msgSend(v29, "requiresPowerPluggedIn"));
  }

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  char v31 = [v30 specifiedFields];

  if ((v31 & 0x20) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLiveServerCatalogOnly:", objc_msgSend(v32, "liveServerCatalogOnly"));
  }

  id v134 = v6;
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setDownloadAuthorizationHeader:v34];
  }

  [v11 additionalServerParams];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy productType](self, "productType");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 setSafeObject:v36 forKey:@"ProductType"];

  [v11 additionalServerParams];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  char v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 setSafeObject:v38 forKey:@"HWModelStr"];

  [v11 additionalServerParams];
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[SUCorePolicy deviceClass](self, "deviceClass");
  [v39 setSafeObject:v40 forKey:@"DeviceName"];

  [v11 additionalServerParams];
  char v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  [v41 setSafeObject:v42 forKey:@"BuildVersion"];

  id v43 = objc_alloc(NSString);
  [v11 sessionId];
  char v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)[v43 initWithFormat:@"scanUUID:%@|", v44];
  [@"|" stringByAppendingString:v45];
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  id v47 = objc_alloc(NSString);
  else {
    v48 = @"NO";
  }
  uint64_t v49 = (void *)[v47 initWithFormat:@"discretionary:%@|", v48];
  [v46 stringByAppendingString:v49];
  int v50 = (void *)objc_claimAutoreleasedReturnValue();

  id v51 = objc_alloc(NSString);
  else {
    uint64_t v52 = @"NO";
  }
  id v53 = (void *)[v51 initWithFormat:@"allowsCellular:%@|", v52];
  [v50 stringByAppendingString:v53];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();

  id v55 = objc_alloc(NSString);
  else {
    uint64_t v56 = @"NO";
  }
  uint64_t v57 = (void *)[v55 initWithFormat:@"requiresPowerPluggedIn:%@|", v56];
  [v54 stringByAppendingString:v57];
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();

  id v59 = objc_alloc(NSString);
  else {
    uint64_t v60 = @"NO";
  }
  uint64_t v61 = (void *)[v59 initWithFormat:@"liveServerCatalogOnly:%@|", v60];
  [v58 stringByAppendingString:v61];
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();

  id v63 = objc_alloc(NSString);
  v64 = -[SUCorePolicy productType](self, "productType");
  v65 = (void *)[v63 initWithFormat:@"productType:%@|", v64];
  [v62 stringByAppendingString:v65];
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();

  id v67 = objc_alloc(NSString);
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  id v68 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v69 = (void *)[v67 initWithFormat:@"hwModelStr:%@|", v68];
  [v66 stringByAppendingString:v69];
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();

  id v71 = objc_alloc(NSString);
  -[SUCorePolicy deviceClass](self, "deviceClass");
  id v72 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v73 = (void *)[v71 initWithFormat:@"deviceClass:%@|", v72];
  [v70 stringByAppendingString:v73];
  uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();

  id v75 = objc_alloc(NSString);
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
  int v77 = (void *)[v75 initWithFormat:@"buildVersion:%@|", v76];
  [v74 stringByAppendingString:v77];
  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();

  [v11 additionalServerParams];
  BOOL v79 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 documentationID];
  id v80 = (void *)objc_claimAutoreleasedReturnValue();
  [v79 setSafeObject:v80 forKey:@"SUDocumentationID"];

  [v11 additionalServerParams];
  id v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
  [v81 setSafeObject:v82 forKey:@"DeviceName"];

  id v83 = objc_alloc(NSString);
  [v11 additionalServerParams];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  [v84 safeStringForKey:@"SUDocumentationID"];
  uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = (void *)[v83 initWithFormat:@"documentationID:%@", v85];
  [v78 stringByAppendingString:v86];
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  id v88 = objc_alloc(NSString);
  uint64_t v89 = [v11 additionalServerParams];
  [(id)v89 safeStringForKey:@"DeviceName"];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)[v88 initWithFormat:@"deviceClass:%@", v90];
  [v87 stringByAppendingString:v91];
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  int v93 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v89) = [v93 specifiedFields];

  if ((v89 & 0x10) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    id v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeoutIntervalForResource:", (int)objc_msgSend(v96, "downloadTimeoutSecs"));
  }

  else
  {
    if (-[SUCorePolicy isInternal](self, "isInternal")) {
      uint64_t v94 = 60LL;
    }
    else {
      uint64_t v94 = 30LL;
    }
    [v11 setTimeoutIntervalForResource:v94];
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
    [v95 oslog];
    id v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v96, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
      id v97 = (void *)objc_claimAutoreleasedReturnValue();
      int v98 = [v97 downloadTimeoutSecs];
      uint64_t v99 = [v11 timeoutIntervalForResource];
      BOOL v100 = -[SUCorePolicy isInternal](self, "isInternal");
      *(_DWORD *)buf = 67109634;
      id v101 = @"NO";
      if (v100) {
        id v101 = @"YES";
      }
      *(_DWORD *)id v141 = v98;
      *(_WORD *)&v141[4] = 2048;
      *(void *)&v141[6] = v99;
      __int16 v142 = 2114;
      v143 = v101;
      _os_log_impl( &dword_187A54000,  (os_log_t)v96,  OS_LOG_TYPE_DEFAULT,  "[POLICY] downloadTimeoutSecs is %d, setting timeoutIntervalForResource to %ld (isInternal=%{public}@)",  buf,  0x1Cu);
    }
  }

  id v105 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"timeout:%ld|",  objc_msgSend(v11, "timeoutIntervalForResource"));
  [v92 stringByAppendingString:v105];
  v103 = (__CFString *)objc_claimAutoreleasedReturnValue();

  [v7 assetAudienceUUID];
  id v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    [v7 assetAudienceUUID];
    id v107 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v108 = (void *)[v107 copy];
    [v11 setLiveAssetAudienceUUID:v108];

    [v7 assetAudienceUUID];
    id v109 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v110 = (void *)[v109 copy];
    [v11 setPurpose:v110];

    [v11 liveAssetAudienceUUID];
    uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:]( v103,  "stringByAppendingFormat:",  @"liveAssetAudienceUUID(param):%@",  v111);
    id v112 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 purpose];
    id v113 = (void *)objc_claimAutoreleasedReturnValue();
    [v112 stringByAppendingFormat:@"purpose(param):%@", v113];
LABEL_46:
    v103 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }

  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    id v115 = (void *)objc_claimAutoreleasedReturnValue();
    id v116 = (void *)[v115 copy];
    [v11 setLiveAssetAudienceUUID:v116];

    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    id v117 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v118 = (void *)[v117 copy];
    [v11 setPurpose:v118];

    [v11 liveAssetAudienceUUID];
    __int128 v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:]( v103,  "stringByAppendingFormat:",  @"liveAssetAudienceUUID(self):%@",  v119);
    id v112 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 purpose];
    id v113 = (void *)objc_claimAutoreleasedReturnValue();
    [v112 stringByAppendingFormat:@"purpose(self):%@", v113];
    goto LABEL_46;
  }

- (id)constructMASoftwareUpdateAssetDownloadOptionsWithUUID:(id)a3
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v73 = self;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructMASoftwareUpdateAssetDownloadOptionsWithUUID for policy: %@",  buf,  0xCu);
  }

  id v7 = objc_alloc_init(MEMORY[0x189611118]);
  if (!v7)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v49 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create software update asset download options", self];
    [v8 trackError:@"SU_ASSET_DOWNLOAD_OPTIONS" forReason:v49 withResult:8100 withError:0];
LABEL_31:

    v48 = @"|";
    id v51 = v8;
    uint64_t v8 = 0LL;
    goto LABEL_45;
  }

  uint64_t v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v8 setAdditionalServerParams:v9];

  [v8 additionalServerParams];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    int v50 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create software update asset download options additional server params", self];
    [v49 trackError:@"SU_ASSET_DOWNLOAD_OPTIONS" forReason:v50 withResult:8100 withError:0];

    goto LABEL_31;
  }

  [v8 setSessionId:v4];
  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = [v12 specifiedFields];

  if (v13 < 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableUI:", objc_msgSend(v14, "disableUI"));
  }

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  char v16 = [v15 specifiedFields];

  if ((v16 & 2) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v17, "allowsCellular"));
  }

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  char v19 = [v18 specifiedFields];

  if ((v19 & 0x10) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v20, "requiresPowerPluggedIn"));
  }

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
  char v22 = [v21 specifiedFields];

  if ((v22 & 0x40) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsExpensiveAccess:", objc_msgSend(v23, "requiresInexpensiveAccess") ^ 1);
  }

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    char v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setDownloadAuthorizationHeader:v25];
  }

  id v26 = objc_alloc(NSString);
  [v8 sessionId];
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
  char v28 = (void *)[v26 initWithFormat:@"scanUUID:%@|", v27];
  [@"|" stringByAppendingString:v28];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  id v30 = objc_alloc(NSString);
  else {
    char v31 = @"NO";
  }
  uint64_t v32 = (void *)[v30 initWithFormat:@"discretionary:%@|", v31];
  [v29 stringByAppendingString:v32];
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();

  id v34 = objc_alloc(NSString);
  else {
    __int128 v35 = @"NO";
  }
  uint64_t v36 = (void *)[v34 initWithFormat:@"allowsCellular:%@|", v35];
  [v33 stringByAppendingString:v36];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();

  id v38 = objc_alloc(NSString);
  else {
    id v39 = @"NO";
  }
  v40 = (void *)[v38 initWithFormat:@"requiresPowerPluggedIn:%@|", v39];
  [v37 stringByAppendingString:v40];
  char v41 = (void *)objc_claimAutoreleasedReturnValue();

  id v42 = objc_alloc(NSString);
  else {
    id v43 = @"NO";
  }
  char v44 = (void *)[v42 initWithFormat:@"allowsExpensiveAccess:%@|", v43];
  [v41 stringByAppendingString:v44];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  char v47 = [v46 specifiedFields];

  id v66 = v4;
  if ((v47 & 0x20) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeoutIntervalForResource:", (int)objc_msgSend(v52, "downloadTimeoutSecs"));

    uint64_t v53 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"timeout:%ld|",  objc_msgSend(v8, "timeoutIntervalForResource"));
    [v45 stringByAppendingString:v53];
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v45 = (void *)v53;
  }

  else
  {
    [v45 stringByAppendingString:@"timeout:MobileAsset|"];
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 oslog];
  id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v73 = (SUCorePolicy *)v48;
    _os_log_impl( &dword_187A54000,  v55,  OS_LOG_TYPE_DEFAULT,  "[POLICY] software update asset download options: %{public}@",  buf,  0xCu);
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  id v51 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v56 = [v51 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    v65 = v48;
    uint64_t v58 = *(void *)v68;
    do
    {
      for (uint64_t i = 0LL; i != v57; ++i)
      {
        if (*(void *)v68 != v58) {
          objc_enumerationMutation(v51);
        }
        uint64_t v60 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        [v61 oslog];
        uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          [v60 extensionName];
          id v63 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = v63;
          _os_log_impl( &dword_187A54000,  v62,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending software update asset download options for extension %{public}@",  buf,  0xCu);
        }

        [v60 extendMASoftwareUpdateAssetDownloadOptions:v8];
      }

      uint64_t v57 = [v51 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }

    while (v57);
    v48 = v65;
    id v4 = v66;
  }

- (id)constructMADocumentationAssetDownloadOptionsWithUUID:(id)a3
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = self;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[POLICY] constructMADocumentationAssetDownloadOptionsWithUUID for policy: %@",  buf,  0xCu);
  }

  id v7 = objc_alloc_init(MEMORY[0x189611118]);
  if (!v7)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v60 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create documentation asset download options", self];
    [v8 trackError:@"DOC_ASSET_DOWNLOAD_OPTIONS" forReason:v60 withResult:8100 withError:0];
LABEL_41:

    v48 = @"|";
    id v51 = v8;
    uint64_t v8 = 0LL;
    goto LABEL_42;
  }

  uint64_t v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v8 setAdditionalServerParams:v9];

  [v8 additionalServerParams];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v61 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unable to create documentation asset download options additional server params", self];
    [v60 trackError:@"DOC_ASSET_DOWNLOAD_OPTIONS" forReason:v61 withResult:8100 withError:0];

    goto LABEL_41;
  }

  [v8 setSessionId:v4];
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = [v12 specifiedFields];

  if ((v13 & 0x40) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableUI:", objc_msgSend(v14, "disableUI"));
  }

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  char v16 = [v15 specifiedFields];

  if ((v16 & 2) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v17, "allowsCellular"));
  }

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  char v19 = [v18 specifiedFields];

  if ((v19 & 8) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v20, "requiresPowerPluggedIn"));
  }

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
  char v22 = [v21 specifiedFields];

  if ((v22 & 0x20) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsExpensiveAccess:", objc_msgSend(v23, "requiresInexpensiveAccess") ^ 1);
  }

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeoutIntervalForResource:", (int)objc_msgSend(v24, "downloadTimeoutSecs"));

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  char v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setDownloadAuthorizationHeader:v26];
  }

  id v27 = objc_alloc(NSString);
  [v8 sessionId];
  char v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = (void *)[v27 initWithFormat:@"scanUUID:%@|", v28];
  [@"|" stringByAppendingString:v29];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();

  id v31 = objc_alloc(NSString);
  else {
    uint64_t v32 = @"NO";
  }
  __int128 v33 = (void *)[v31 initWithFormat:@"discretionary:%@|", v32];
  [v30 stringByAppendingString:v33];
  id v34 = (void *)objc_claimAutoreleasedReturnValue();

  id v35 = objc_alloc(NSString);
  else {
    uint64_t v36 = @"NO";
  }
  uint64_t v37 = (void *)[v35 initWithFormat:@"allowsCellular:%@|", v36];
  [v34 stringByAppendingString:v37];
  id v38 = (void *)objc_claimAutoreleasedReturnValue();

  id v39 = objc_alloc(NSString);
  else {
    v40 = @"NO";
  }
  char v41 = (void *)[v39 initWithFormat:@"requiresPowerPluggedIn:%@|", v40];
  [v38 stringByAppendingString:v41];
  id v42 = (void *)objc_claimAutoreleasedReturnValue();

  id v43 = objc_alloc(NSString);
  else {
    char v44 = @"NO";
  }
  v45 = (void *)[v43 initWithFormat:@"allowsExpensiveAccess:%@|", v44];
  [v42 stringByAppendingString:v45];
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  char v47 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"timeout:%ld|",  objc_msgSend(v8, "timeoutIntervalForResource"));
  [v46 stringByAppendingString:v47];
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 oslog];
  int v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v71 = (SUCorePolicy *)v48;
    _os_log_impl( &dword_187A54000,  v50,  OS_LOG_TYPE_DEFAULT,  "[POLICY] documentation asset download options: %{public}@",  buf,  0xCu);
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  id v51 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = [v51 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    id v63 = v48;
    id v64 = v4;
    uint64_t v54 = *(void *)v66;
    do
    {
      for (uint64_t i = 0LL; i != v53; ++i)
      {
        if (*(void *)v66 != v54) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        [v57 oslog];
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          [v56 extensionName];
          id v59 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          id v71 = v59;
          _os_log_impl( &dword_187A54000,  v58,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending documentation asset download options for extension %{public}@",  buf,  0xCu);
        }

        [v56 extendMADocumentationAssetDownloadOptions:v8];
      }

      uint64_t v53 = [v51 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }

    while (v53);
    v48 = v63;
    id v4 = v64;
  }

- (id)setUpdateMetricEventFieldsFromDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[SUCorePolicy setUpdateMetricEventFields:](self, "setUpdateMetricEventFields:", 0LL);
  if (v4)
  {
    id v19 = v4;
    uint64_t v18 = self;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          [v6 objectForKeyedSubscript:v11];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v5 setSafeObject:v12 forKey:v11];
          }

          else
          {
            char v13 = (void *)[objc_alloc(NSString) initWithFormat:@"SET_UPDATE_METRIC_EVENT_FIELDS failed due to invalid parameter (non-NSString value in dictionary for key %@)", v11];
            [MEMORY[0x189612760] sharedCore];
            id v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 buildError:8102 underlying:0 description:v13];
            id v15 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189612778] sharedDiag];
            char v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 trackAnomaly:@"SET_UPDATE_METRIC_EVENT_FIELDS" forReason:v13 withResult:8102 withError:v15];
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v8);
    }

    -[SUCorePolicy setUpdateMetricEventFields:](v18, "setUpdateMetricEventFields:", v5);
    id v4 = v19;
  }

  return 0LL;
}

- (void)updateApplyOptionsWithExtensions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v22 = self;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[POLICY] updateApplyOptionsWithExtensions for policy: %{public}@",  buf,  0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          char v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 oslog];
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            [v12 extensionName];
            id v15 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            __int128 v22 = v15;
            _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending query for extension %{public}@",  buf,  0xCu);
          }

          [v12 extendMSUApplyOptions:v4];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }
}

- (void)updateRollbackOptionsWithExtensions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v22 = self;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[POLICY] updateRollbackOptionsWithExtensions for policy: %{public}@",  buf,  0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          char v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 oslog];
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            [v12 extensionName];
            id v15 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            __int128 v22 = v15;
            _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "[POLICY] extending rollback options for extension %{public}@",  buf,  0xCu);
          }

          [v12 extendMSURollbackOptions:v4];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }
}

- (BOOL)isSplatPolicy
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = -[SUCorePolicy policyExtensions](self, "policyExtensions", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          v5 |= [v8 isSplatPolicy];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isSupervisedPolicy
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = -[SUCorePolicy policyExtensions](self, "policyExtensions", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          v5 |= [v8 isSupervisedPolicy];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isRequestedPMVSupervisedPolicy
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = -[SUCorePolicy policyExtensions](self, "policyExtensions", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          v5 |= [v8 isRequestedPMVSupervisedPolicy];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (id)requestedProductMarketingVersion
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = -[SUCorePolicy policyExtensions](self, "policyExtensions", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0LL;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v9 = [v8 requestedProductMarketingVersion];

          int v5 = (void *)v9;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  else
  {
    int v5 = 0LL;
  }

  return v5;
}

- (int64_t)delayPeriodDays
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = -[SUCorePolicy policyExtensions](self, "policyExtensions", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0LL;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          int64_t v5 = [v8 delayPeriodDays];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (id)mdmPathName
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = -[SUCorePolicy policyExtensions](self, "policyExtensions", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0LL;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v9 = [v8 mdmPathName];

          int64_t v5 = (void *)v9;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (SUCorePolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)&OBJC_CLASS___SUCorePolicy;
  int64_t v5 = -[SUCorePolicy init](&v108, sel_init);
  if (v5)
  {
    v5->_specifiedUsedPolicies = [v4 decodeInt64ForKey:@"SpecifiedPolicies"];
    v5->_restrictToFull = [v4 decodeBoolForKey:@"RestrictToFull"];
    v5->_allowSameVersion = [v4 decodeBoolForKey:@"AllowSameVersion"];
    v5->_background = [v4 decodeBoolForKey:@"Background"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateScanPolicy"];
    softwareUpdateScanPolicy = v5->_softwareUpdateScanPolicy;
    v5->_softwareUpdateScanPolicy = (SUCorePolicySoftwareUpdateScan *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationScanPolicy"];
    documentationScanPolicy = v5->_documentationScanPolicy;
    v5->_documentationScanPolicy = (SUCorePolicyDocumentationScan *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationDownloadPolicy"];
    documentationDownloadPolicy = v5->_documentationDownloadPolicy;
    v5->_documentationDownloadPolicy = (SUCorePolicyDocumentationDownload *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LoadBrainUpdatePolicy"];
    loadBrainPolicy = v5->_loadBrainPolicy;
    v5->_loadBrainPolicy = (SUCorePolicyLoadBrain *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightDownloadPolicy"];
    downloadPreflightPolicy = v5->_downloadPreflightPolicy;
    v5->_downloadPreflightPolicy = (SUCorePolicyPreflightDownloadSU *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightWakeupPolicy"];
    wakeupPreflightPolicy = v5->_wakeupPreflightPolicy;
    v5->_wakeupPreflightPolicy = (SUCorePolicyPreflightWakeup *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightPrerequisiteCheckPolicy"];
    prerequisiteCheckPreflightPolicy = v5->_prerequisiteCheckPreflightPolicy;
    v5->_prerequisiteCheckPreflightPolicy = (SUCorePolicyPreflightPrerequisiteCheck *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightPersonalizePolicy"];
    personalizePreflightPolicy = v5->_personalizePreflightPolicy;
    v5->_personalizePreflightPolicy = (SUCorePolicyPreflightPersonalize *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightFDRRecoveryPolicy"];
    fdrRecoveryPreflightPolicy = v5->_fdrRecoveryPreflightPolicy;
    v5->_fdrRecoveryPreflightPolicy = (SUCorePolicyPreflightFDRRecovery *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadSoftwareUpdatePolicy"];
    softwareUpdateDownloadPolicy = v5->_softwareUpdateDownloadPolicy;
    v5->_softwareUpdateDownloadPolicy = (SUCorePolicySoftwareUpdateDownload *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrepareUpdatePolicy"];
    preparePolicy = v5->_preparePolicy;
    v5->_preparePolicy = (SUCorePolicyPrepare *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SuspendUpdatePolicy"];
    suspendPolicy = v5->_suspendPolicy;
    v5->_suspendPolicy = (SUCorePolicySuspend *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResumeUpdatePolicy"];
    resumePolicy = v5->_resumePolicy;
    v5->_resumePolicy = (SUCorePolicyResume *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplyUpdatePolicy"];
    applyPolicy = v5->_applyPolicy;
    v5->_applyPolicy = (SUCorePolicyApply *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RollbackUpdatePolicy"];
    rollbackPolicy = v5->_rollbackPolicy;
    v5->_rollbackPolicy = (SUCorePolicyRollback *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetType"];
    softwareUpdateAssetType = v5->_softwareUpdateAssetType;
    v5->_softwareUpdateAssetType = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetType"];
    documentationAssetType = v5->_documentationAssetType;
    v5->_documentationAssetType = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetVolumeUUID"];
    targetVolumeUUID = v5->_targetVolumeUUID;
    v5->_targetVolumeUUID = (NSString *)v40;

    id v42 = (void *)MEMORY[0x189604010];
    uint64_t v43 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    char v44 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"PolicyExtensions"];
    policyExtensions = v5->_policyExtensions;
    v5->_policyExtensions = (NSArray *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteBuildVersion"];
    prerequisiteBuildVersion = v5->_prerequisiteBuildVersion;
    v5->_prerequisiteBuildVersion = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteProductVersion"];
    prerequisiteProductVersion = v5->_prerequisiteProductVersion;
    v5->_prerequisiteProductVersion = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteRestoreVersion"];
    prerequisiteRestoreVersion = v5->_prerequisiteRestoreVersion;
    v5->_prerequisiteRestoreVersion = (NSString *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetRestoreVersion"];
    targetRestoreVersion = v5->_targetRestoreVersion;
    v5->_targetRestoreVersion = (NSString *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledSFRVersion"];
    installedSFRVersion = v5->_installedSFRVersion;
    v5->_installedSFRVersion = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceClass"];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HWModelStr"];
    hwModelStr = v5->_hwModelStr;
    v5->_hwModelStr = (NSString *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseType"];
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v63;

    v5->_isInternal = [v4 decodeBoolForKey:@"IsInternal"];
    v5->_checkAvailableSpace = [v4 decodeBoolForKey:@"CheckAvailableSpace"];
    v5->_cacheDeleteUrgency = [v4 decodeIntForKey:@"CacheDeleteUrgency"];
    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserAgentString"];
    userAgentString = v5->_userAgentString;
    v5->_userAgentString = (NSString *)v65;

    v5->_performPreflightEncryptedCheck = [v4 decodeBoolForKey:@"PerformPreflightEncryptedCheck"];
    v5->_performPreflightSnapshotCheck = [v4 decodeBoolForKey:@"PerformPreflightSnapshotCheck"];
    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateVolumePath"];
    updateVolumePath = v5->_updateVolumePath;
    v5->_updateVolumePath = (NSString *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSOToken"];
    ssoToken = v5->_ssoToken;
    v5->_ssoToken = (NSData *)v69;

    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersonalizedManifestRootsPath"];
    personalizedManifestRootsPath = v5->_personalizedManifestRootsPath;
    v5->_personalizedManifestRootsPath = (NSString *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalAuthenticationContext"];
    localAuthenticationContext = v5->_localAuthenticationContext;
    v5->_localAuthenticationContext = (NSData *)v73;

    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalAuthenticationUserID"];
    localAuthenticationUserID = v5->_localAuthenticationUserID;
    v5->_localAuthenticationUserID = (NSNumber *)v75;

    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MDMBootstrapToken"];
    mdmBootstrapToken = v5->_mdmBootstrapToken;
    v5->_mdmBootstrapToken = (NSString *)v77;

    uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadAuthorizationHeader"];
    downloadAuthorizationHeader = v5->_downloadAuthorizationHeader;
    v5->_downloadAuthorizationHeader = (NSString *)v79;

    uint64_t v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateBrainLocationOverride"];
    updateBrainLocationOverride = v5->_updateBrainLocationOverride;
    v5->_updateBrainLocationOverride = (NSString *)v81;

    uint64_t v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetAudienceUUID"];
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSString *)v83;

    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlternateAssetAudienceUUID"];
    alternateAssetAudienceUUID = v5->_alternateAssetAudienceUUID;
    v5->_alternateAssetAudienceUUID = (NSString *)v85;

    v5->_disableAlternateUpdate = [v4 decodeBoolForKey:@"DisableAlternateUpdate"];
    v5->_disableSplatCombo = [v4 decodeBoolForKey:@"DisableSplombo"];
    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersonalizationServerURL"];
    personalizationServerURL = v5->_personalizationServerURL;
    v5->_personalizationServerURL = (NSString *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyHostName"];
    proxyHostName = v5->_proxyHostName;
    v5->_proxyHostName = (NSString *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyPortNumber"];
    proxyPortNumber = v5->_proxyPortNumber;
    v5->_proxyPortNumber = (NSNumber *)v91;

    v5->_bridgeOSIgnoreMinimumVersionCheck = [v4 decodeBoolForKey:@"BridgeOSIgnoreMinimumVersionCheck"];
    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BridgeOSDownloadDirectory"];
    bridgeOSDownloadDirectory = v5->_bridgeOSDownloadDirectory;
    v5->_bridgeOSDownloadDirectory = (NSString *)v93;

    v5->_enableEmbeddedOSInstall = [v4 decodeBoolForKey:@"EnableEmbeddedOSInstall"];
    v5->_enableBridgeOSInstall = [v4 decodeBoolForKey:@"EnableBridgeOSInstall"];
    v5->_enableOSPersonalization = [v4 decodeBoolForKey:@"EnableOSPersonalization"];
    v5->_userInitiated = [v4 decodeBoolForKey:@"UserInitiated"];
    v5->_skipVolumeSealing = [v4 decodeBoolForKey:@"SkipVolumeSealing"];
    v5->_qualityOfService = [v4 decodeIntForKey:@"QualityOfService"];
    id v95 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v96 = objc_opt_class();
    id v97 = (void *)objc_msgSend(v95, "initWithObjects:", v96, objc_opt_class(), 0);
    uint64_t v98 = [v4 decodeObjectOfClasses:v97 forKey:@"UpdateMetricEventFields"];
    updateMetricEventFields = v5->_updateMetricEventFields;
    v5->_updateMetricEventFields = (NSDictionary *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateMetricContext"];
    updateMetricContext = v5->_updateMetricContext;
    v5->_updateMetricContext = (NSString *)v100;

    id v102 = objc_alloc(MEMORY[0x189604010]);
    uint64_t v103 = objc_opt_class();
    v104 = (void *)objc_msgSend(v102, "initWithObjects:", v103, objc_opt_class(), 0);
    uint64_t v105 = [v4 decodeObjectOfClasses:v104 forKey:@"DefaultDescriptorValues"];
    defaultDescriptorValues = v5->_defaultDescriptorValues;
    v5->_defaultDescriptorValues = (NSDictionary *)v105;

    v5->_enablePreSUStaging = [v4 decodeBoolForKey:@"EnablePSUSAssets"];
    v5->_enablePreSUStagingForOptionalAssets = [v4 decodeBoolForKey:@"EnablePSUSForOptionalAssets"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v50 = a3;
  objc_msgSend( v50,  "encodeInt64:forKey:",  -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies"),  @"SpecifiedPolicies");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy restrictToFull](self, "restrictToFull"),  @"RestrictToFull");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy allowSameVersion](self, "allowSameVersion"),  @"AllowSameVersion");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy background](self, "background"), @"Background");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy allowsCellular](self, "allowsCellular"),  @"AllowsCellular");
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v4 forKey:@"UpdateScanPolicy"];

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v5 forKey:@"DocumentationScanPolicy"];

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v6 forKey:@"DocumentationDownloadPolicy"];

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v7 forKey:@"LoadBrainUpdatePolicy"];

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v8 forKey:@"PreflightDownloadPolicy"];

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v9 forKey:@"PreflightWakeupPolicy"];

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v10 forKey:@"PreflightPrerequisiteCheckPolicy"];

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v11 forKey:@"PreflightPersonalizePolicy"];

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v12 forKey:@"PreflightFDRRecoveryPolicy"];

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v13 forKey:@"DownloadSoftwareUpdatePolicy"];

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v14 forKey:@"PrepareUpdatePolicy"];

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v15 forKey:@"SuspendUpdatePolicy"];

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v16 forKey:@"ResumeUpdatePolicy"];

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v17 forKey:@"ApplyUpdatePolicy"];

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v18 forKey:@"RollbackUpdatePolicy"];

  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v19 forKey:@"SoftwareUpdateAssetType"];

  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v20 forKey:@"DocumentationAssetType"];

  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v21 forKey:@"TargetVolumeUUID"];

  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v22 forKey:@"PolicyExtensions"];

  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v23 forKey:@"PrerequisiteBuildVersion"];

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v24 forKey:@"PrerequisiteProductVersion"];

  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v25 forKey:@"PrerequisiteRestoreVersion"];

  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v26 forKey:@"TargetRestoreVersion"];

  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v27 forKey:@"InstalledSFRVersion"];

  -[SUCorePolicy deviceClass](self, "deviceClass");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v28 forKey:@"DeviceClass"];

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v29 forKey:@"HWModelStr"];

  -[SUCorePolicy productType](self, "productType");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v30 forKey:@"ProductType"];

  -[SUCorePolicy releaseType](self, "releaseType");
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v31 forKey:@"ReleaseType"];

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy isInternal](self, "isInternal"), @"IsInternal");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"),  @"CheckAvailableSpace");
  objc_msgSend( v50,  "encodeInt:forKey:",  -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"),  @"CacheDeleteUrgency");
  -[SUCorePolicy userAgentString](self, "userAgentString");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v32 forKey:@"UserAgentString"];

  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"),  @"PerformPreflightEncryptedCheck");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"),  @"PerformPreflightSnapshotCheck");
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v33 forKey:@"UpdateVolumePath"];

  -[SUCorePolicy ssoToken](self, "ssoToken");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v34 forKey:@"SSOToken"];

  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  id v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v35 forKey:@"PersonalizedManifestRootsPath"];

  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v36 forKey:@"LocalAuthenticationContext"];

  -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v37 forKey:@"LocalAuthenticationUserID"];

  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v38 forKey:@"MDMBootstrapToken"];

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v39 forKey:@"DownloadAuthorizationHeader"];

  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v40 forKey:@"UpdateBrainLocationOverride"];

  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  char v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v41 forKey:@"AssetAudienceUUID"];

  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v42 forKey:@"AlternateAssetAudienceUUID"];

  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"),  @"DisableAlternateUpdate");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"),  @"DisableSplombo");
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v43 forKey:@"PersonalizationServerURL"];

  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  char v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v44 forKey:@"ProxyHostName"];

  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v45 forKey:@"ProxyPortNumber"];

  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck"),  @"BridgeOSIgnoreMinimumVersionCheck");
  v46 = -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  [v50 encodeObject:v46 forKey:@"BridgeOSDownloadDirectory"];

  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"),  @"EnableEmbeddedOSInstall");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"),  @"EnableBridgeOSInstall");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"),  @"EnableOSPersonalization");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy userInitiated](self, "userInitiated"), @"UserInitiated");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"),  @"SkipVolumeSealing");
  objc_msgSend( v50,  "encodeInt:forKey:",  -[SUCorePolicy qualityOfService](self, "qualityOfService"),  @"QualityOfService");
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v47 forKey:@"UpdateMetricEventFields"];
  v48 = -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  [v50 encodeObject:v48 forKey:@"UpdateMetricContext"];

  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 encodeObject:v49 forKey:@"DefaultDescriptorValues"];

  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"),  @"EnablePSUSAssets");
  objc_msgSend( v50,  "encodeBool:forKey:",  -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"),  @"EnablePSUSForOptionalAssets");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicy *)a3;
  if (v4 == self)
  {
    char v57 = 1;
    goto LABEL_136;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v57 = 0;
    goto LABEL_136;
  }

  int64_t v5 = v4;
  int64_t v6 = -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies");
  uint64_t v234 = -[SUCorePolicy specifiedUsedPolicies](v5, "specifiedUsedPolicies");
  int64_t v235 = v6;
  if (v6 != v234
    || (-[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy"),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SUCorePolicy softwareUpdateScanPolicy](v5, "softwareUpdateScanPolicy"),
        v220 = v8,
        v219 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v8, "isEqual:")))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v232 = 0;
    memset(v233, 0, sizeof(v233));
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    goto LABEL_41;
  }

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationScanPolicy](v5, "documentationScanPolicy");
  v216 = v9;
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:"))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    memset(v233, 0, 24);
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(_DWORD *)&v233[24] = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationDownloadPolicy](v5, "documentationDownloadPolicy");
  v214 = v10;
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:"))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v232 = 0;
    memset(v233, 0, 20);
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    goto LABEL_41;
  }

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy loadBrainPolicy](v5, "loadBrainPolicy");
  v212 = v11;
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqual:"))
  {
    *(void *)&v233[8] = 0LL;
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy downloadPreflightPolicy](v5, "downloadPreflightPolicy");
  v210 = v12;
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:"))
  {
    *(void *)&v233[4] = 0LL;
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v232 = 0;
    *(_DWORD *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(_DWORD *)&v233[12] = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy wakeupPreflightPolicy](v5, "wakeupPreflightPolicy");
  v208 = v13;
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqual:"))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    goto LABEL_41;
  }

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteCheckPreflightPolicy](v5, "prerequisiteCheckPreflightPolicy");
  v206 = v14;
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqual:"))
  {
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy personalizePreflightPolicy](v5, "personalizePreflightPolicy");
  v204 = v15;
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqual:"))
  {
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy fdrRecoveryPreflightPolicy](v5, "fdrRecoveryPreflightPolicy");
  v202 = v16;
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqual:"))
  {
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateDownloadPolicy](v5, "softwareUpdateDownloadPolicy");
  v200 = v17;
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqual:"))
  {
    int v62 = 0;
    *(void *)v233 = 0LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy preparePolicy](v5, "preparePolicy");
  v198 = v18;
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqual:"))
  {
    *(void *)v233 = 0LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy suspendPolicy](v5, "suspendPolicy");
  v196 = v19;
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "isEqual:"))
  {
    int v232 = 0;
    *(void *)v233 = 0x100000000LL;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    goto LABEL_41;
  }

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v5;
  -[SUCorePolicy resumePolicy](v5, "resumePolicy");
  uint64_t v194 = v20;
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isEqual:"))
  {
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    goto LABEL_162;
  }

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy applyPolicy](v5, "applyPolicy");
  __int16 v192 = v21;
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "isEqual:"))
  {
    int v229 = 0;
    int v230 = 0;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v231 = 1;
    goto LABEL_162;
  }

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = -[SUCorePolicy rollbackPolicy](v5, "rollbackPolicy");
  v190 = v22;
  if (!objc_msgSend(v22, "isEqual:"))
  {
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    goto LABEL_162;
  }

  uint64_t v23 = (void *)MEMORY[0x189612760];
  uint64_t v24 = -[SUCorePolicy softwareUpdateAssetType](v5, "softwareUpdateAssetType");
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  __int128 v187 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v188 = (void *)v24;
  if (!objc_msgSend(v23, "stringIsEqual:to:", v24))
  {
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    memset(v227, 0, 20);
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    HIDWORD(v227[2]) = 1;
    goto LABEL_162;
  }

  uint64_t v25 = (void *)MEMORY[0x189612760];
  uint64_t v26 = -[SUCorePolicy documentationAssetType](v5, "documentationAssetType");
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  __int128 v185 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v186 = (void *)v26;
  if (!objc_msgSend(v25, "stringIsEqual:to:", v26))
  {
    v227[1] = 0LL;
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    goto LABEL_162;
  }

  id v27 = (void *)MEMORY[0x189612760];
  uint64_t v28 = -[SUCorePolicy targetVolumeUUID](v5, "targetVolumeUUID");
  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  id v183 = (void *)objc_claimAutoreleasedReturnValue();
  id v184 = (void *)v28;
  if (!objc_msgSend(v27, "stringIsEqual:to:", v28))
  {
    uint64_t v223 = 0LL;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v29 = (void *)MEMORY[0x189612760];
  uint64_t v30 = -[SUCorePolicy prerequisiteBuildVersion](v5, "prerequisiteBuildVersion");
  v181 = -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v182 = (void *)v30;
  if (!objc_msgSend(v29, "stringIsEqual:to:", v30))
  {
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    goto LABEL_162;
  }

  id v31 = (void *)MEMORY[0x189612760];
  uint64_t v32 = -[SUCorePolicy prerequisiteProductVersion](v5, "prerequisiteProductVersion");
  v179 = -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v180 = (void *)v32;
  if (!objc_msgSend(v31, "stringIsEqual:to:", v32))
  {
    *(void *)v222 = 0LL;
    memset(v221, 0, sizeof(v221));
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    goto LABEL_162;
  }

  __int128 v33 = (void *)MEMORY[0x189612760];
  uint64_t v34 = -[SUCorePolicy prerequisiteRestoreVersion](v5, "prerequisiteRestoreVersion");
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  __int128 v177 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v178 = (void *)v34;
  if (!objc_msgSend(v33, "stringIsEqual:to:", v34))
  {
    memset(v221, 0, sizeof(v221));
    *(void *)v222 = 0x100000000LL;
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    goto LABEL_162;
  }

  id v35 = (void *)MEMORY[0x189612760];
  uint64_t v36 = -[SUCorePolicy targetRestoreVersion](v5, "targetRestoreVersion");
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  uint64_t v175 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v176 = (void *)v36;
  if (!objc_msgSend(v35, "stringIsEqual:to:", v36))
  {
    memset(v221, 0, 20);
    *(void *)v222 = 0x100000000LL;
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    HIDWORD(v221[2]) = 1;
    goto LABEL_162;
  }

  uint64_t v37 = (void *)MEMORY[0x189612760];
  uint64_t v38 = -[SUCorePolicy installedSFRVersion](v5, "installedSFRVersion");
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  uint64_t v173 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v174 = (void *)v38;
  if (!objc_msgSend(v37, "stringIsEqual:to:", v38))
  {
    v221[0] = 0LL;
    v221[1] = 0LL;
    *(void *)v222 = 0x100000000LL;
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    goto LABEL_162;
  }

  id v39 = (void *)MEMORY[0x189612760];
  uint64_t v40 = -[SUCorePolicy deviceClass](v5, "deviceClass");
  -[SUCorePolicy deviceClass](self, "deviceClass");
  id v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = (void *)v40;
  if (!objc_msgSend(v39, "stringIsEqual:to:", v40))
  {
    *(void *)((char *)v221 + 4) = 0LL;
    LODWORD(v221[0]) = 0;
    *(void *)v222 = 0x100000000LL;
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    HIDWORD(v221[1]) = 1;
    goto LABEL_162;
  }

  char v41 = (void *)MEMORY[0x189612760];
  uint64_t v42 = -[SUCorePolicy hwModelStr](v5, "hwModelStr");
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  __int128 v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = (void *)v42;
  if (!objc_msgSend(v41, "stringIsEqual:to:", v42))
  {
    v221[0] = 0LL;
    *(void *)v222 = 0x100000000LL;
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v43 = (void *)MEMORY[0x189612760];
  uint64_t v44 = -[SUCorePolicy productType](v5, "productType");
  -[SUCorePolicy productType](self, "productType");
  id v167 = (void *)objc_claimAutoreleasedReturnValue();
  int v168 = (void *)v44;
  if (!objc_msgSend(v43, "stringIsEqual:to:", v44))
  {
    v221[0] = 0x100000000LL;
    *(void *)v222 = 0x100000000LL;
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v45 = (void *)MEMORY[0x189612760];
  uint64_t v46 = -[SUCorePolicy releaseType](v5, "releaseType");
  v165 = -[SUCorePolicy releaseType](self, "releaseType");
  __int128 v166 = (void *)v46;
  if (!objc_msgSend(v45, "stringIsEqual:to:", v46)
    || (BOOL v47 = -[SUCorePolicy isInternal](v217, "isInternal"), v47 != -[SUCorePolicy isInternal](self, "isInternal"))
    || (BOOL v48 = -[SUCorePolicy checkAvailableSpace](v217, "checkAvailableSpace"),
        v48 != -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"))
    || (BOOL v49 = -[SUCorePolicy restrictToFull](v217, "restrictToFull"),
        v49 != -[SUCorePolicy restrictToFull](self, "restrictToFull"))
    || (BOOL v50 = -[SUCorePolicy allowSameVersion](v217, "allowSameVersion"),
        v50 != -[SUCorePolicy allowSameVersion](self, "allowSameVersion"))
    || (BOOL v51 = -[SUCorePolicy background](v217, "background"), v51 != -[SUCorePolicy background](self, "background"))
    || (BOOL v52 = -[SUCorePolicy allowsCellular](v217, "allowsCellular"),
        v52 != -[SUCorePolicy allowsCellular](self, "allowsCellular")))
  {
    *(void *)v222 = 0x100000000LL;
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
LABEL_162:
    int64_t v5 = v217;
    goto LABEL_41;
  }

  uint64_t v75 = (void *)MEMORY[0x189612760];
  uint64_t v76 = -[SUCorePolicy userAgentString](v217, "userAgentString");
  -[SUCorePolicy userAgentString](self, "userAgentString");
  __int16 v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = (void *)v76;
  if (!objc_msgSend(v75, "stringIsEqual:to:", v76)
    || (BOOL v77 = -[SUCorePolicy performPreflightEncryptedCheck](v217, "performPreflightEncryptedCheck"),
        v77 != -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"))
    || (BOOL v78 = -[SUCorePolicy performPreflightSnapshotCheck](v217, "performPreflightSnapshotCheck"),
        v78 != -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck")))
  {
    uint64_t v223 = 0x100000000LL;
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v79 = (void *)MEMORY[0x189612760];
  uint64_t v80 = -[SUCorePolicy ssoToken](v217, "ssoToken");
  -[SUCorePolicy ssoToken](self, "ssoToken");
  id v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = (void *)v80;
  if (!objc_msgSend(v79, "dataIsEqual:to:", v80)
    || (int v81 = -[SUCorePolicy cacheDeleteUrgency](v217, "cacheDeleteUrgency"),
        v81 != -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency")))
  {
    uint64_t v226 = 0LL;
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v82 = (void *)MEMORY[0x189612760];
  uint64_t v83 = -[SUCorePolicy updateVolumePath](v217, "updateVolumePath");
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  __int128 v159 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v160 = (void *)v83;
  if (!objc_msgSend(v82, "stringIsEqual:to:", v83))
  {
    uint64_t v225 = 0LL;
    uint64_t v224 = 0LL;
    uint64_t v226 = 0x100000000LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    goto LABEL_162;
  }

  v84 = (void *)MEMORY[0x189612760];
  uint64_t v85 = -[SUCorePolicy personalizedManifestRootsPath](v217, "personalizedManifestRootsPath");
  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  __int16 v157 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v158 = (void *)v85;
  if (!objc_msgSend(v84, "stringIsEqual:to:", v85))
  {
    uint64_t v224 = 0LL;
    uint64_t v225 = 0x100000000LL;
    uint64_t v226 = 0x100000000LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v86 = (void *)MEMORY[0x189612760];
  uint64_t v87 = -[SUCorePolicy localAuthenticationContext](v217, "localAuthenticationContext");
  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  id v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = (void *)v87;
  if (!objc_msgSend(v86, "dataIsEqual:to:", v87))
  {
    uint64_t v224 = 0x100000000LL;
    uint64_t v225 = 0x100000000LL;
    uint64_t v226 = 0x100000000LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    goto LABEL_162;
  }

  id v88 = (void *)MEMORY[0x189612760];
  uint64_t v89 = -[SUCorePolicy localAuthenticationUserID](v217, "localAuthenticationUserID");
  v153 = -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  id v154 = (void *)v89;
  if (!objc_msgSend(v88, "numberIsEqual:to:", v89))
  {
    uint64_t v225 = 0x100000000LL;
    uint64_t v226 = 0x100000000LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    goto LABEL_162;
  }

  v90 = (void *)MEMORY[0x189612760];
  uint64_t v91 = -[SUCorePolicy mdmBootstrapToken](v217, "mdmBootstrapToken");
  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  id v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)v91;
  if (!objc_msgSend(v90, "stringIsEqual:to:", v91))
  {
    uint64_t v226 = 0x100000000LL;
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    goto LABEL_162;
  }

  v92 = (void *)MEMORY[0x189612760];
  uint64_t v93 = -[SUCorePolicy downloadAuthorizationHeader](v217, "downloadAuthorizationHeader");
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  id v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)v93;
  if (!objc_msgSend(v92, "stringIsEqual:to:", v93))
  {
    v227[0] = 0LL;
    v227[1] = 0x100000000LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v94 = (void *)MEMORY[0x189612760];
  uint64_t v95 = -[SUCorePolicy updateBrainLocationOverride](v217, "updateBrainLocationOverride");
  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  id v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = (void *)v95;
  if (!objc_msgSend(v94, "stringIsEqual:to:", v95))
  {
    *(void *)((char *)v227 + 4) = 0LL;
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    HIDWORD(v227[1]) = 1;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    LODWORD(v227[0]) = 1;
    goto LABEL_162;
  }

  uint64_t v96 = (void *)MEMORY[0x189612760];
  uint64_t v97 = -[SUCorePolicy assetAudienceUUID](v217, "assetAudienceUUID");
  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  id v145 = (void *)objc_claimAutoreleasedReturnValue();
  id v146 = (void *)v97;
  if (!objc_msgSend(v96, "stringIsEqual:to:", v97))
  {
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 1LL;
    v227[1] = 0x100000001LL;
    goto LABEL_162;
  }

  uint64_t v98 = (void *)MEMORY[0x189612760];
  uint64_t v99 = -[SUCorePolicy alternateAssetAudienceUUID](v217, "alternateAssetAudienceUUID");
  v143 = -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  uint64_t v144 = (void *)v99;
  if (!objc_msgSend(v98, "stringIsEqual:to:", v99)
    || (BOOL v100 = -[SUCorePolicy disableAlternateUpdate](v217, "disableAlternateUpdate"),
        v100 != -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"))
    || (BOOL v101 = -[SUCorePolicy disableSplatCombo](v217, "disableSplatCombo"),
        v101 != -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo")))
  {
    uint64_t v228 = 0LL;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    goto LABEL_162;
  }

  id v102 = (void *)MEMORY[0x189612760];
  uint64_t v103 = -[SUCorePolicy personalizationServerURL](v217, "personalizationServerURL");
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  id v141 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v142 = (void *)v103;
  if (!objc_msgSend(v102, "stringIsEqual:to:", v103))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    uint64_t v228 = 1LL;
    goto LABEL_162;
  }

  v104 = (void *)MEMORY[0x189612760];
  uint64_t v105 = -[SUCorePolicy proxyHostName](v217, "proxyHostName");
  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  id v139 = (void *)objc_claimAutoreleasedReturnValue();
  id v140 = (void *)v105;
  if (!objc_msgSend(v104, "stringIsEqual:to:", v105))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    uint64_t v228 = 0x100000001LL;
    goto LABEL_162;
  }

  id v106 = (void *)MEMORY[0x189612760];
  uint64_t v107 = -[SUCorePolicy proxyPortNumber](v217, "proxyPortNumber");
  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  __int128 v137 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v138 = (void *)v107;
  if (!objc_msgSend(v106, "numberIsEqual:to:", v107)
    || (BOOL v108 = -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](v217, "bridgeOSIgnoreMinimumVersionCheck"),
        v108 != -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck")))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001LL;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    uint64_t v228 = 0x100000001LL;
    int v230 = 1;
    goto LABEL_162;
  }

  id v109 = (void *)MEMORY[0x189612760];
  uint64_t v110 = -[SUCorePolicy bridgeOSDownloadDirectory](v217, "bridgeOSDownloadDirectory");
  -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  __int128 v135 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v136 = (void *)v110;
  if (!objc_msgSend(v109, "stringIsEqual:to:", v110)
    || (BOOL v111 = -[SUCorePolicy enableEmbeddedOSInstall](v217, "enableEmbeddedOSInstall"),
        v111 != -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"))
    || (BOOL v112 = -[SUCorePolicy enableBridgeOSInstall](v217, "enableBridgeOSInstall"),
        v112 != -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"))
    || (BOOL v113 = -[SUCorePolicy enableOSPersonalization](v217, "enableOSPersonalization"),
        v113 != -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"))
    || (BOOL v114 = -[SUCorePolicy userInitiated](v217, "userInitiated"),
        v114 != -[SUCorePolicy userInitiated](self, "userInitiated"))
    || (BOOL v115 = -[SUCorePolicy skipVolumeSealing](v217, "skipVolumeSealing"),
        v115 != -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"))
    || (int v116 = -[SUCorePolicy qualityOfService](v217, "qualityOfService"),
        v116 != -[SUCorePolicy qualityOfService](self, "qualityOfService")))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001LL;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    uint64_t v228 = 0x100000001LL;
    int v230 = 1;
    int v232 = 1;
    goto LABEL_162;
  }

  id v117 = (void *)MEMORY[0x189612760];
  uint64_t v118 = -[SUCorePolicy updateMetricEventFields](v217, "updateMetricEventFields");
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  id v133 = (void *)objc_claimAutoreleasedReturnValue();
  id v134 = (void *)v118;
  if (!objc_msgSend(v117, "dictionaryIsEqual:to:", v118))
  {
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001LL;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    uint64_t v228 = 0x100000001LL;
    int v230 = 1;
    int v232 = 1;
    int v53 = 1;
    goto LABEL_162;
  }

  __int128 v119 = (void *)MEMORY[0x189612760];
  uint64_t v120 = -[SUCorePolicy updateMetricContext](v217, "updateMetricContext");
  v131 = -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  v132 = (void *)v120;
  if (!objc_msgSend(v119, "stringIsEqual:to:", v120))
  {
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001LL;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    uint64_t v228 = 0x100000001LL;
    int v230 = 1;
    int v232 = 1;
    int v53 = 1;
    int v54 = 1;
    goto LABEL_162;
  }

  id v121 = (void *)MEMORY[0x189612760];
  uint64_t v122 = -[SUCorePolicy defaultDescriptorValues](v217, "defaultDescriptorValues");
  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  id v129 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v130 = (void *)v122;
  if (!objc_msgSend(v121, "dictionaryIsEqual:to:", v122)
    || (BOOL v123 = -[SUCorePolicy enablePreSUStaging](v217, "enablePreSUStaging"),
        v123 != -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"))
    || (BOOL v124 = -[SUCorePolicy enablePreSUStagingForOptionalAssets](v217, "enablePreSUStagingForOptionalAssets"),
        v124 != -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets")))
  {
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001LL;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001LL;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001LL;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001LL;
    v227[1] = 0x100000001LL;
    uint64_t v223 = 0x100000001LL;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001LL;
    v221[1] = 0x100000001LL;
    v221[0] = 0x100000001LL;
    *(void *)v222 = 0x100000001LL;
    uint64_t v226 = 0x100000001LL;
    uint64_t v225 = 0x100000001LL;
    uint64_t v224 = 0x100000001LL;
    v227[0] = 0x100000001LL;
    uint64_t v228 = 0x100000001LL;
    int v230 = 1;
    int v232 = 1;
    int v53 = 1;
    int v54 = 1;
    int v55 = 1;
    goto LABEL_162;
  }

  id v125 = (void *)MEMORY[0x189612760];
  uint64_t v126 = -[SUCorePolicy policyExtensions](self, "policyExtensions");
  int64_t v5 = v217;
  uint64_t v127 = -[SUCorePolicy policyExtensions](v217, "policyExtensions");
  __int128 v128 = (void *)v126;
  char v57 = [v125 arrayIsEqual:v126 to:v127];
  uint64_t v7 = (void *)v127;
  int v56 = 1;
  *(void *)&v233[20] = 0x100000001LL;
  *(_DWORD *)&v233[16] = 1;
  *(void *)&v233[8] = 0x100000001LL;
  int v58 = 1;
  int v59 = 1;
  int v60 = 1;
  int v61 = 1;
  int v62 = 1;
  *(void *)v233 = 0x100000001LL;
  int v231 = 1;
  int v229 = 1;
  v227[2] = 0x100000001LL;
  v227[1] = 0x100000001LL;
  uint64_t v223 = 0x100000001LL;
  *(_DWORD *)&v222[8] = 1;
  v221[2] = 0x100000001LL;
  v221[1] = 0x100000001LL;
  v221[0] = 0x100000001LL;
  *(void *)v222 = 0x100000001LL;
  uint64_t v226 = 0x100000001LL;
  uint64_t v225 = 0x100000001LL;
  uint64_t v224 = 0x100000001LL;
  v227[0] = 0x100000001LL;
  uint64_t v228 = 0x100000001LL;
  int v230 = 1;
  int v232 = 1;
  int v53 = 1;
  int v54 = 1;
  int v55 = 1;
LABEL_41:
  if (v56)
  {
    v218 = v4;
    int v63 = v62;
    int v64 = v61;
    char v65 = v57;
    int v66 = v60;
    int v67 = v59;
    __int128 v68 = v5;
    int v69 = v53;
    int v70 = v58;
    int v71 = v54;
    int v72 = v55;

    int v73 = v72;
    int v54 = v71;
    int v58 = v70;
    int v53 = v69;
    int64_t v5 = v68;
    int v59 = v67;
    int v60 = v66;
    char v57 = v65;
    int v61 = v64;
    int v62 = v63;
    id v4 = v218;
    if (!v73) {
      goto LABEL_43;
    }
  }

  else if (!v55)
  {
LABEL_43:
    if (v54) {
      goto LABEL_44;
    }
LABEL_48:
    if (!v53) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }

  if (!v54) {
    goto LABEL_48;
  }
LABEL_44:

  if (v53)
  {
LABEL_49:
  }

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v8 = -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies");
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (void *)[v5 initWithSoftwareUpdateAssetType:v6 documentationAssetType:v7 usingPolicies:v8 usingExtensions:v9];

  [v10 softwareUpdateScanPolicy];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 specifiedFields];

  [v10 documentationScanPolicy];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 specifiedFields];

  [v10 documentationDownloadPolicy];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 specifiedFields];

  [v10 loadBrainPolicy];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 specifiedFields];

  [v10 downloadPreflightPolicy];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 specifiedFields];

  [v10 softwareUpdateDownloadPolicy];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 specifiedFields];

  objc_msgSend(v10, "setRestrictToFull:", -[SUCorePolicy restrictToFull](self, "restrictToFull"));
  objc_msgSend(v10, "setAllowSameVersion:", -[SUCorePolicy allowSameVersion](self, "allowSameVersion"));
  objc_msgSend(v10, "setBackground:", -[SUCorePolicy background](self, "background"));
  objc_msgSend(v10, "setAllowsCellular:", -[SUCorePolicy allowsCellular](self, "allowsCellular"));
  [v10 softwareUpdateScanPolicy];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 setSpecifiedFields:v12];

  [v10 documentationScanPolicy];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 setSpecifiedFields:v14];

  [v10 documentationDownloadPolicy];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSpecifiedFields:v16];

  [v10 loadBrainPolicy];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setSpecifiedFields:v18];

  [v10 downloadPreflightPolicy];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 setSpecifiedFields:v20];

  [v10 softwareUpdateDownloadPolicy];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 setSpecifiedFields:v22];

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = (void *)[v29 copyWithZone:a3];
  [v10 setSoftwareUpdateScanPolicy:v30];

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = (void *)[v31 copyWithZone:a3];
  [v10 setDocumentationScanPolicy:v32];

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = (void *)[v33 copyWithZone:a3];
  [v10 setDocumentationDownloadPolicy:v34];

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  id v35 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = (void *)[v35 copyWithZone:a3];
  [v10 setLoadBrainPolicy:v36];

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = (void *)[v37 copyWithZone:a3];
  [v10 setDownloadPreflightPolicy:v38];

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = (void *)[v39 copyWithZone:a3];
  [v10 setWakeupPreflightPolicy:v40];

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  char v41 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)[v41 copyWithZone:a3];
  [v10 setPrerequisiteCheckPreflightPolicy:v42];

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = (void *)[v43 copyWithZone:a3];
  [v10 setPersonalizePreflightPolicy:v44];

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = (void *)[v45 copyWithZone:a3];
  [v10 setFdrRecoveryPreflightPolicy:v46];

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  BOOL v47 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v48 = (void *)[v47 copyWithZone:a3];
  [v10 setSoftwareUpdateDownloadPolicy:v48];

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  BOOL v49 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v50 = (void *)[v49 copyWithZone:a3];
  [v10 setPreparePolicy:v50];

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  BOOL v51 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v52 = (void *)[v51 copyWithZone:a3];
  [v10 setSuspendPolicy:v52];

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  int v53 = (void *)objc_claimAutoreleasedReturnValue();
  int v54 = (void *)[v53 copyWithZone:a3];
  [v10 setResumePolicy:v54];

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  int v55 = (void *)objc_claimAutoreleasedReturnValue();
  int v56 = (void *)[v55 copyWithZone:a3];
  [v10 setApplyPolicy:v56];

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  char v57 = (void *)objc_claimAutoreleasedReturnValue();
  int v58 = (void *)[v57 copyWithZone:a3];
  [v10 setRollbackPolicy:v58];

  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  int v59 = (void *)objc_claimAutoreleasedReturnValue();
  int v60 = (void *)[v59 copyWithZone:a3];
  [v10 setPrerequisiteBuildVersion:v60];

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  int v61 = (void *)objc_claimAutoreleasedReturnValue();
  int v62 = (void *)[v61 copyWithZone:a3];
  [v10 setPrerequisiteProductVersion:v62];

  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  int v63 = (void *)objc_claimAutoreleasedReturnValue();
  int v64 = (void *)[v63 copyWithZone:a3];
  [v10 setPrerequisiteRestoreVersion:v64];

  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  char v65 = (void *)objc_claimAutoreleasedReturnValue();
  int v66 = (void *)[v65 copyWithZone:a3];
  [v10 setTargetRestoreVersion:v66];

  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  int v67 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v68 = (void *)[v67 copyWithZone:a3];
  [v10 setInstalledSFRVersion:v68];

  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  int v69 = (void *)objc_claimAutoreleasedReturnValue();
  int v70 = (void *)[v69 copyWithZone:a3];
  [v10 setTargetVolumeUUID:v70];

  -[SUCorePolicy deviceClass](self, "deviceClass");
  int v71 = (void *)objc_claimAutoreleasedReturnValue();
  int v72 = (void *)[v71 copyWithZone:a3];
  [v10 setDeviceClass:v72];

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  int v73 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v74 = (void *)[v73 copyWithZone:a3];
  [v10 setHwModelStr:v74];

  -[SUCorePolicy productType](self, "productType");
  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = (void *)[v75 copyWithZone:a3];
  [v10 setProductType:v76];

  -[SUCorePolicy releaseType](self, "releaseType");
  BOOL v77 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v78 = (void *)[v77 copyWithZone:a3];
  [v10 setReleaseType:v78];

  objc_msgSend(v10, "setIsInternal:", -[SUCorePolicy isInternal](self, "isInternal"));
  objc_msgSend(v10, "setCheckAvailableSpace:", -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"));
  objc_msgSend(v10, "setCacheDeleteUrgency:", -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"));
  -[SUCorePolicy userAgentString](self, "userAgentString");
  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v80 = (void *)[v79 copyWithZone:a3];
  [v10 setUserAgentString:v80];

  objc_msgSend( v10,  "setPerformPreflightEncryptedCheck:",  -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"));
  objc_msgSend( v10,  "setPerformPreflightSnapshotCheck:",  -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"));
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  int v81 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v82 = (void *)[v81 copyWithZone:a3];
  [v10 setUpdateVolumePath:v82];

  -[SUCorePolicy ssoToken](self, "ssoToken");
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)[v83 copyWithZone:a3];
  [v10 setSsoToken:v84];

  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = (void *)[v85 copyWithZone:a3];
  [v10 setPersonalizedManifestRootsPath:v86];

  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
  id v88 = (void *)[v87 copyWithZone:a3];
  [v10 setLocalAuthenticationContext:v88];

  -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)[v89 copyWithZone:a3];
  [v10 setLocalAuthenticationUserID:v90];

  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)[v91 copyWithZone:a3];
  [v10 setMdmBootstrapToken:v92];

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v94 = (void *)[v93 copyWithZone:a3];
  [v10 setDownloadAuthorizationHeader:v94];

  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v96 = (void *)[v95 copyWithZone:a3];
  [v10 setUpdateBrainLocationOverride:v96];

  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v98 = (void *)[v97 copyWithZone:a3];
  [v10 setAssetAudienceUUID:v98];

  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v100 = (void *)[v99 copyWithZone:a3];
  [v10 setAlternateAssetAudienceUUID:v100];

  objc_msgSend( v10,  "setDisableAlternateUpdate:",  -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"));
  objc_msgSend(v10, "setDisableSplatCombo:", -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"));
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  BOOL v101 = (void *)objc_claimAutoreleasedReturnValue();
  id v102 = (void *)[v101 copyWithZone:a3];
  [v10 setPersonalizationServerURL:v102];

  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)[v103 copyWithZone:a3];
  [v10 setProxyHostName:v104];

  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
  id v106 = (void *)[v105 copyWithZone:a3];
  [v10 setProxyPortNumber:v106];

  objc_msgSend( v10,  "setBridgeOSIgnoreMinimumVersionCheck:",  -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck"));
  -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v108 = (void *)[v107 copyWithZone:a3];
  [v10 setBridgeOSDownloadDirectory:v108];

  objc_msgSend( v10,  "setEnableEmbeddedOSInstall:",  -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"));
  objc_msgSend(v10, "setEnableBridgeOSInstall:", -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"));
  objc_msgSend( v10,  "setEnableOSPersonalization:",  -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"));
  objc_msgSend(v10, "setUserInitiated:", -[SUCorePolicy userInitiated](self, "userInitiated"));
  objc_msgSend(v10, "setSkipVolumeSealing:", -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"));
  objc_msgSend(v10, "setQualityOfService:", -[SUCorePolicy qualityOfService](self, "qualityOfService"));
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  id v109 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v110 = (void *)[v109 copyWithZone:a3];
  [v10 setUpdateMetricEventFields:v110];

  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  BOOL v111 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v112 = (void *)[v111 copyWithZone:a3];
  [v10 setUpdateMetricContext:v112];

  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  BOOL v113 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v114 = (void *)[v113 copyWithZone:a3];
  [v10 setDefaultDescriptorValues:v114];

  objc_msgSend(v10, "setEnablePreSUStaging:", -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"));
  objc_msgSend( v10,  "setEnablePreSUStagingForOptionalAssets:",  -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"));
  return v10;
}

- (id)description
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v103 objects:v107 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v104;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v104 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        [v9 extensionName];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 appendFormat:@"\n\t%@:%@", v10, v9];
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v103 objects:v107 count:16];
    }

    while (v6);
  }

  id v11 = objc_alloc_init(MEMORY[0x189607940]);
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v12];

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v13];

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v14];

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v15];

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v16];

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v17];

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v18];

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v19];

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v20];

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v21];

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v22];

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v23];

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v24];

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v91 = v11;
  [v11 appendFormat:@"    %@\n", v25];

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appendFormat:@"    %@\n", v26];

  id v81 = objc_alloc(NSString);
  int64_t v80 = -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies");
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  id v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  BOOL v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  BOOL v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy productType](self, "productType");
  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = -[SUCorePolicy releaseType](self, "releaseType");
  if (-[SUCorePolicy isInternal](self, "isInternal")) {
    id v27 = @"YES";
  }
  else {
    id v27 = @"NO";
  }
  uint64_t v79 = v27;
  if (-[SUCorePolicy restrictToFull](self, "restrictToFull")) {
    uint64_t v28 = @"YES";
  }
  else {
    uint64_t v28 = @"NO";
  }
  BOOL v78 = v28;
  if (-[SUCorePolicy allowSameVersion](self, "allowSameVersion")) {
    uint64_t v29 = @"YES";
  }
  else {
    uint64_t v29 = @"NO";
  }
  BOOL v77 = v29;
  if (-[SUCorePolicy background](self, "background")) {
    uint64_t v30 = @"YES";
  }
  else {
    uint64_t v30 = @"NO";
  }
  uint64_t v76 = v30;
  if (-[SUCorePolicy allowsCellular](self, "allowsCellular")) {
    id v31 = @"YES";
  }
  else {
    id v31 = @"NO";
  }
  uint64_t v75 = v31;
  if (-[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace")) {
    uint64_t v32 = @"YES";
  }
  else {
    uint64_t v32 = @"NO";
  }
  int v73 = v32;
  +[SUCoreSpace cacheDeleteUrgencyName:]( &OBJC_CLASS___SUCoreSpace,  "cacheDeleteUrgencyName:",  -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"));
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[SUCorePolicy userAgentString](self, "userAgentString");
  if (-[SUCorePolicy userInitiated](self, "userInitiated")) {
    __int128 v33 = @"YES";
  }
  else {
    __int128 v33 = @"NO";
  }
  int v72 = v33;
  if (-[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing")) {
    uint64_t v34 = @"YES";
  }
  else {
    uint64_t v34 = @"NO";
  }
  int v71 = v34;
  -[SUCorePolicy stringForQoS:](self, "stringForQoS:", -[SUCorePolicy qualityOfService](self, "qualityOfService"));
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  id v88 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  if (-[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck")) {
    id v35 = @"YES";
  }
  else {
    id v35 = @"NO";
  }
  __int128 v68 = v35;
  if (-[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck")) {
    uint64_t v36 = @"YES";
  }
  else {
    uint64_t v36 = @"NO";
  }
  int v66 = v36;
  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy ssoToken](self, "ssoToken");
  uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74) {
    uint64_t v37 = @"present";
  }
  else {
    uint64_t v37 = @"none";
  }
  int v63 = v37;
  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  char v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  int v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  int v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70) {
    uint64_t v38 = @"present";
  }
  else {
    uint64_t v38 = @"none";
  }
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  int v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69) {
    id v39 = @"present";
  }
  else {
    id v39 = @"none";
  }
  int v61 = v39;
  -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  int v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  int v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67) {
    uint64_t v40 = @"present";
  }
  else {
    uint64_t v40 = @"none";
  }
  int v59 = v40;
  if (-[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck")) {
    char v41 = @"YES";
  }
  else {
    char v41 = @"NO";
  }
  int v58 = v41;
  -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  int v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall")) {
    uint64_t v42 = @"YES";
  }
  else {
    uint64_t v42 = @"NO";
  }
  int v55 = v42;
  if (-[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall")) {
    uint64_t v43 = @"YES";
  }
  else {
    uint64_t v43 = @"NO";
  }
  int v53 = v43;
  if (-[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization")) {
    uint64_t v44 = @"YES";
  }
  else {
    uint64_t v44 = @"NO";
  }
  BOOL v52 = v44;
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  char v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  int v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  int v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate")) {
    BOOL v47 = @"YES";
  }
  else {
    BOOL v47 = @"NO";
  }
  if (-[SUCorePolicy disableSplatCombo](self, "disableSplatCombo")) {
    BOOL v48 = @"YES";
  }
  else {
    BOOL v48 = @"NO";
  }
  if (-[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging")) {
    BOOL v49 = @"YES";
  }
  else {
    BOOL v49 = @"NO";
  }
  if (-[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets")) {
    BOOL v50 = @"YES";
  }
  else {
    BOOL v50 = @"NO";
  }
  id v82 = (id)objc_msgSend( v81,  "initWithFormat:",  CFSTR("\n[>>>\n    SubPolicies(specifiedUsedPolicies:0x%llX)\n%@    AssetTypes(softwareUpdateAssetType:%@|documentationAssetType:%@)\n    Versions(prerequisiteBuildVersion:%@|prerequisiteProductVersion:%@|prerequisiteRestoreVersion:%@|targetRestoreVersion:%@|installedSFRVersion:%@)\n    Device(deviceClass:%@|hwModelStr:%@|productType:%@|releaseType:%@|isInternal:%@)\n    Config(restrictToFull:%@|allowSameVersion:%@|background:%@|allowsCellular:%@|checkAvailableSpace:%@|cacheDeleteUrgency:%@|userAgentString:%@|userInitiated:%@|skipVolumeSealing:%@|qualityOfService:%@)\n    Target(targetVolumeUUID:%@|updateVolumePath:%@)\n    Preflight(performPreflightEncryptedCheck:%@|performPreflightSnapshotCheck:%@|updateBrainLocationOverride:%@)\n    Personalization(SSOToken:%@|personalizedManifestRootsPath:%@|personalizationServerURL:%@|proxyHostName:%@|proxyPortNumber:%@)\n    Authentication(localAuthenticationContext:%@|downloadAuthorizationHeader:%@|localAuthenticationUserID:%@|mdmBootstrapToken:%@)\n    BridgeOS(bridgeOSIgnoreMinimumVersionCheck:%@|bridgeOSDownloadDirectory:%@|enableEmbeddedOSInstall:%@|enableBridgeOSInstall:%@|enableOSPersonalization:%@)\n    Metrics(updateMetricEventFields:%@|updateMetricContext:%@\n    Defaults(defaultDescriptorValues:%@|assetAudienceUUID:%@|alternateAssetAudienceUUID:%@|disableAlternateUpdate:%@|disableSplombo:%@)\n    PSUS(enable:%@|enableForOptionalAssets:%@)\n    Extensions(%@)\n<<<]"),  v80,  v91,  v102,  v101,  v100,  v99,  v98,  v97,  v96,  v95,  v94,  v93,  v92,  v79,  v78,  v77,  v76,  v75,  v73,  v89,  v90,  v72,  v71,  v87,  v88,  v84,  v68,  v66,  v86,  v63,  v85,  v83,  v65,  v64,  v38,  v61,  v62,  v59,  v58,  v60,  v55,  v53,  v52,  v45,  v57,  v56,
              v54,
              v46,
              v47,
              v48,
              v49,
              v50,
              v3);

  return v82;
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 count];

  if (v4)
  {
    -[SUCorePolicy policyExtensions](self, "policyExtensions");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_18A0F22B0, "stringByAppendingFormat:", @"|extensions(%lu)", objc_msgSend(v5, "count"));
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies") != 127)
  {
    uint64_t v7 = -[__CFString stringByAppendingFormat:]( v6,  "stringByAppendingFormat:",  @"|SubPolCfg=%llX",  -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies"));

    uint64_t v6 = (__CFString *)v7;
  }

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 summary];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|UpdateScan=%@", v10);

    uint64_t v6 = (__CFString *)v11;
  }

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 summary];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|DocScan=%@", v14);

    uint64_t v6 = (__CFString *)v15;
  }

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 summary];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|DocDownload=%@", v18);

    uint64_t v6 = (__CFString *)v19;
  }

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 summary];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|LoadBrainUpdate=%@", v22);

    uint64_t v6 = (__CFString *)v23;
  }

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 summary];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|PreflightDownload=%@", v26);

    uint64_t v6 = (__CFString *)v27;
  }

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 summary];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|PreflightWakeup=%@", v30);

    uint64_t v6 = (__CFString *)v31;
  }

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 summary];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|PreflightPrerequisiteCheck=%@", v34);

    uint64_t v6 = (__CFString *)v35;
  }

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 summary];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|PreflightPersonalize=%@", v38);

    uint64_t v6 = (__CFString *)v39;
  }

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
    char v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 summary];
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|PreflightFDRRecovery=%@", v42);

    uint64_t v6 = (__CFString *)v43;
  }

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 summary];
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|DownloadSU=%@", v46);

    uint64_t v6 = (__CFString *)v47;
  }

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  BOOL v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[SUCorePolicy preparePolicy](self, "preparePolicy");
    BOOL v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 summary];
    BOOL v50 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|PrepareUpdate=%@", v50);

    uint64_t v6 = (__CFString *)v51;
  }

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  BOOL v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
    int v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 summary];
    int v54 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|SuspendUpdate=%@", v54);

    uint64_t v6 = (__CFString *)v55;
  }

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  int v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[SUCorePolicy resumePolicy](self, "resumePolicy");
    char v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 summary];
    int v58 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|ResumeUpdate=%@", v58);

    uint64_t v6 = (__CFString *)v59;
  }

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  int v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[SUCorePolicy applyPolicy](self, "applyPolicy");
    int v61 = (void *)objc_claimAutoreleasedReturnValue();
    [v61 summary];
    int v62 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v63 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|ApplyUpdate=%@", v62);

    uint64_t v6 = (__CFString *)v63;
  }

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  int v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
    char v65 = (void *)objc_claimAutoreleasedReturnValue();
    [v65 summary];
    int v66 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v67 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|rollbackUpdate=%@", v66);

    uint64_t v6 = (__CFString *)v67;
  }

  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  __int128 v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
    int v69 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v70 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|targetVolumeUUID=%@", v69);

    uint64_t v6 = (__CFString *)v70;
  }

  -[SUCorePolicy deviceClass](self, "deviceClass");
  int v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    -[SUCorePolicy deviceClass](self, "deviceClass");
    int v72 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v73 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|deviceClass=%@", v72);

    uint64_t v6 = (__CFString *)v73;
  }

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[SUCorePolicy hwModelStr](self, "hwModelStr");
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|hwModelStr=%@", v75);

    uint64_t v6 = (__CFString *)v76;
  }

  -[SUCorePolicy productType](self, "productType");
  BOOL v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    -[SUCorePolicy productType](self, "productType");
    BOOL v78 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v79 = -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|productType=%@", v78);

    uint64_t v6 = (__CFString *)v79;
  }

  -[SUCorePolicy releaseType](self, "releaseType");
  int64_t v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    uint64_t v81 = -[SUCorePolicy releaseType](self, "releaseType");
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"|releaseType=%@", v81);
    id v82 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v6 = (__CFString *)v81;
  }

  else
  {
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", @"|releaseType=customer");
    id v82 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!-[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"))
  {
    uint64_t v83 = [v82 stringByAppendingString:@"|!checkSpace"];

    id v82 = (void *)v83;
  }

  if (-[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency") != -1)
  {
    v84 = +[SUCoreSpace cacheDeleteUrgencyName:]( &OBJC_CLASS___SUCoreSpace,  "cacheDeleteUrgencyName:",  -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"));
    uint64_t v85 = [v82 stringByAppendingFormat:@"|deleteUrgency=%@", v84];

    id v82 = (void *)v85;
  }

  -[SUCorePolicy userAgentString](self, "userAgentString");
  uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    -[SUCorePolicy userAgentString](self, "userAgentString");
    uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v88 = [v82 stringByAppendingFormat:@"|userAgentString=%@", v87];

    id v82 = (void *)v88;
  }

  if (-[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"))
  {
    uint64_t v89 = [v82 stringByAppendingString:@"|performPreflightEncryptedCheck=YES"];

    id v82 = (void *)v89;
  }

  if (-[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"))
  {
    uint64_t v90 = [v82 stringByAppendingString:@"|performPreflightSnapshotCheck=YES"];

    id v82 = (void *)v90;
  }

  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    v92 = -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
    uint64_t v93 = [v82 stringByAppendingFormat:@"|updateVolumePath=%@", v92];

    id v82 = (void *)v93;
  }

  -[SUCorePolicy ssoToken](self, "ssoToken");
  uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94) {
    uint64_t v95 = @"|withSSO";
  }
  else {
    uint64_t v95 = @"|noSSO";
  }
  [v82 stringByAppendingString:v95];
  uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
    uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v99 = [v96 stringByAppendingFormat:@"|personalizationServerURL=%@", v98];

    uint64_t v96 = (void *)v99;
  }

  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  BOOL v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    -[SUCorePolicy proxyHostName](self, "proxyHostName");
    BOOL v101 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v102 = [v96 stringByAppendingFormat:@"|proxyHostName=%@", v101];

    uint64_t v96 = (void *)v102;
  }

  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  __int128 v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v103)
  {
    -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
    __int128 v104 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v105 = [v96 stringByAppendingFormat:@"|proxyPortNumber=%@", v104];

    uint64_t v96 = (void *)v105;
  }

  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  __int128 v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106) {
    uint64_t v107 = @"|withUpdateMetricEventFields";
  }
  else {
    uint64_t v107 = @"|noUpdateMetricEventFields";
  }
  [v96 stringByAppendingString:v107];
  uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  id v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
    uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v111 = [v108 stringByAppendingFormat:@"|updateMetricContext=%@", v110];

    uint64_t v108 = (void *)v111;
  }

  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  BOOL v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    BOOL v113 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v114 = [v108 stringByAppendingFormat:@"|assetAudienceUUID=%@", v113];

    uint64_t v108 = (void *)v114;
  }

  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  BOOL v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
    int v116 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v117 = [v108 stringByAppendingFormat:@"|alternateAssetAudienceUUID=%@", v116];

    uint64_t v108 = (void *)v117;
  }

  if (-[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"))
  {
    uint64_t v118 = [v108 stringByAppendingString:@"|disableAlternateUpdate=YES"];

    uint64_t v108 = (void *)v118;
  }

  if (-[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"))
  {
    uint64_t v119 = [v108 stringByAppendingString:@"|disableSplombo=YES"];

    uint64_t v108 = (void *)v119;
  }

  if (-[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"))
  {
    uint64_t v120 = [v108 stringByAppendingString:@"|enablePSUS=YES"];

    uint64_t v108 = (void *)v120;
  }

  if (-[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"))
  {
    uint64_t v121 = [v108 stringByAppendingString:@"|enablePSUSForOptionalAssets=YES"];

    uint64_t v108 = (void *)v121;
  }

  if (([v108 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v122 = [v108 stringByAppendingString:@"|"];

    uint64_t v108 = (void *)v122;
  }

  id v123 = v108;

  return v123;
}

- (id)assetTypeSummary
{
  id v3 = (void *)NSString;
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"|su=%@|doc=%@|", v4, v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForQoS:(int)a3
{
  else {
    return off_18A0F1700[a3 - 1];
  }
}

- (id)_copyGestaltValueForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

+ (id)_cleanProductVersion:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 4
    && objc_msgSend(v3, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_18A0F22B0);

    id v3 = (id)v4;
  }

  return v3;
}

- (BOOL)background
{
  return self->_background;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (int64_t)specifiedUsedPolicies
{
  return self->_specifiedUsedPolicies;
}

- (void)setSpecifiedUsedPolicies:(int64_t)a3
{
  self->_specifiedUsedPolicies = a3;
}

- (SUCorePolicySoftwareUpdateScan)softwareUpdateScanPolicy
{
  return self->_softwareUpdateScanPolicy;
}

- (void)setSoftwareUpdateScanPolicy:(id)a3
{
}

- (SUCorePolicyDocumentationScan)documentationScanPolicy
{
  return self->_documentationScanPolicy;
}

- (void)setDocumentationScanPolicy:(id)a3
{
}

- (SUCorePolicyDocumentationDownload)documentationDownloadPolicy
{
  return self->_documentationDownloadPolicy;
}

- (void)setDocumentationDownloadPolicy:(id)a3
{
}

- (SUCorePolicyLoadBrain)loadBrainPolicy
{
  return self->_loadBrainPolicy;
}

- (void)setLoadBrainPolicy:(id)a3
{
}

- (SUCorePolicyPreflightDownloadSU)downloadPreflightPolicy
{
  return self->_downloadPreflightPolicy;
}

- (void)setDownloadPreflightPolicy:(id)a3
{
}

- (SUCorePolicySoftwareUpdateDownload)softwareUpdateDownloadPolicy
{
  return self->_softwareUpdateDownloadPolicy;
}

- (void)setSoftwareUpdateDownloadPolicy:(id)a3
{
}

- (SUCorePolicyPrepare)preparePolicy
{
  return self->_preparePolicy;
}

- (void)setPreparePolicy:(id)a3
{
}

- (SUCorePolicySuspend)suspendPolicy
{
  return self->_suspendPolicy;
}

- (void)setSuspendPolicy:(id)a3
{
}

- (SUCorePolicyResume)resumePolicy
{
  return self->_resumePolicy;
}

- (void)setResumePolicy:(id)a3
{
}

- (SUCorePolicyApply)applyPolicy
{
  return self->_applyPolicy;
}

- (void)setApplyPolicy:(id)a3
{
}

- (SUCorePolicyRollback)rollbackPolicy
{
  return self->_rollbackPolicy;
}

- (void)setRollbackPolicy:(id)a3
{
}

- (SUCorePolicyPreflightWakeup)wakeupPreflightPolicy
{
  return self->_wakeupPreflightPolicy;
}

- (void)setWakeupPreflightPolicy:(id)a3
{
}

- (SUCorePolicyPreflightPrerequisiteCheck)prerequisiteCheckPreflightPolicy
{
  return self->_prerequisiteCheckPreflightPolicy;
}

- (void)setPrerequisiteCheckPreflightPolicy:(id)a3
{
}

- (SUCorePolicyPreflightPersonalize)personalizePreflightPolicy
{
  return self->_personalizePreflightPolicy;
}

- (void)setPersonalizePreflightPolicy:(id)a3
{
}

- (SUCorePolicyPreflightFDRRecovery)fdrRecoveryPreflightPolicy
{
  return self->_fdrRecoveryPreflightPolicy;
}

- (void)setFdrRecoveryPreflightPolicy:(id)a3
{
}

- (NSString)softwareUpdateAssetType
{
  return self->_softwareUpdateAssetType;
}

- (void)setSoftwareUpdateAssetType:(id)a3
{
}

- (NSString)documentationAssetType
{
  return self->_documentationAssetType;
}

- (void)setDocumentationAssetType:(id)a3
{
}

- (NSString)targetVolumeUUID
{
  return self->_targetVolumeUUID;
}

- (void)setTargetVolumeUUID:(id)a3
{
}

- (NSString)prerequisiteBuildVersion
{
  return self->_prerequisiteBuildVersion;
}

- (void)setPrerequisiteBuildVersion:(id)a3
{
}

- (NSString)prerequisiteProductVersion
{
  return self->_prerequisiteProductVersion;
}

- (void)setPrerequisiteProductVersion:(id)a3
{
}

- (NSString)prerequisiteRestoreVersion
{
  return self->_prerequisiteRestoreVersion;
}

- (void)setPrerequisiteRestoreVersion:(id)a3
{
}

- (NSString)targetRestoreVersion
{
  return self->_targetRestoreVersion;
}

- (void)setTargetRestoreVersion:(id)a3
{
}

- (NSString)installedSFRVersion
{
  return self->_installedSFRVersion;
}

- (void)setInstalledSFRVersion:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)hwModelStr
{
  return self->_hwModelStr;
}

- (void)setHwModelStr:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)checkAvailableSpace
{
  return self->_checkAvailableSpace;
}

- (void)setCheckAvailableSpace:(BOOL)a3
{
  self->_checkAvailableSpace = a3;
}

- (NSString)userAgentString
{
  return self->_userAgentString;
}

- (void)setUserAgentString:(id)a3
{
}

- (BOOL)performPreflightEncryptedCheck
{
  return self->_performPreflightEncryptedCheck;
}

- (void)setPerformPreflightEncryptedCheck:(BOOL)a3
{
  self->_performPreflightEncryptedCheck = a3;
}

- (BOOL)performPreflightSnapshotCheck
{
  return self->_performPreflightSnapshotCheck;
}

- (void)setPerformPreflightSnapshotCheck:(BOOL)a3
{
  self->_performPreflightSnapshotCheck = a3;
}

- (NSString)updateVolumePath
{
  return self->_updateVolumePath;
}

- (void)setUpdateVolumePath:(id)a3
{
}

- (NSData)ssoToken
{
  return self->_ssoToken;
}

- (void)setSsoToken:(id)a3
{
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (void)setCacheDeleteUrgency:(int)a3
{
  self->_cacheDeleteUrgency = a3;
}

- (NSString)personalizedManifestRootsPath
{
  return self->_personalizedManifestRootsPath;
}

- (void)setPersonalizedManifestRootsPath:(id)a3
{
}

- (NSData)localAuthenticationContext
{
  return self->_localAuthenticationContext;
}

- (void)setLocalAuthenticationContext:(id)a3
{
}

- (NSNumber)localAuthenticationUserID
{
  return self->_localAuthenticationUserID;
}

- (void)setLocalAuthenticationUserID:(id)a3
{
}

- (NSString)mdmBootstrapToken
{
  return self->_mdmBootstrapToken;
}

- (void)setMdmBootstrapToken:(id)a3
{
}

- (NSString)downloadAuthorizationHeader
{
  return self->_downloadAuthorizationHeader;
}

- (void)setDownloadAuthorizationHeader:(id)a3
{
}

- (NSString)updateBrainLocationOverride
{
  return self->_updateBrainLocationOverride;
}

- (void)setUpdateBrainLocationOverride:(id)a3
{
}

- (NSString)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
}

- (BOOL)disableAlternateUpdate
{
  return self->_disableAlternateUpdate;
}

- (void)setDisableAlternateUpdate:(BOOL)a3
{
  self->_disableAlternateUpdate = a3;
}

- (BOOL)disableSplatCombo
{
  return self->_disableSplatCombo;
}

- (void)setDisableSplatCombo:(BOOL)a3
{
  self->_disableSplatCombo = a3;
}

- (BOOL)enablePreSUStaging
{
  return self->_enablePreSUStaging;
}

- (void)setEnablePreSUStaging:(BOOL)a3
{
  self->_enablePreSUStaging = a3;
}

- (BOOL)enablePreSUStagingForOptionalAssets
{
  return self->_enablePreSUStagingForOptionalAssets;
}

- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3
{
  self->_enablePreSUStagingForOptionalAssets = a3;
}

- (NSString)personalizationServerURL
{
  return self->_personalizationServerURL;
}

- (void)setPersonalizationServerURL:(id)a3
{
}

- (NSString)proxyHostName
{
  return self->_proxyHostName;
}

- (void)setProxyHostName:(id)a3
{
}

- (NSNumber)proxyPortNumber
{
  return self->_proxyPortNumber;
}

- (void)setProxyPortNumber:(id)a3
{
}

- (BOOL)bridgeOSIgnoreMinimumVersionCheck
{
  return self->_bridgeOSIgnoreMinimumVersionCheck;
}

- (void)setBridgeOSIgnoreMinimumVersionCheck:(BOOL)a3
{
  self->_bridgeOSIgnoreMinimumVersionCheck = a3;
}

- (NSString)bridgeOSDownloadDirectory
{
  return self->_bridgeOSDownloadDirectory;
}

- (void)setBridgeOSDownloadDirectory:(id)a3
{
}

- (BOOL)enableEmbeddedOSInstall
{
  return self->_enableEmbeddedOSInstall;
}

- (void)setEnableEmbeddedOSInstall:(BOOL)a3
{
  self->_enableEmbeddedOSInstall = a3;
}

- (BOOL)enableBridgeOSInstall
{
  return self->_enableBridgeOSInstall;
}

- (void)setEnableBridgeOSInstall:(BOOL)a3
{
  self->_enableBridgeOSInstall = a3;
}

- (BOOL)enableOSPersonalization
{
  return self->_enableOSPersonalization;
}

- (void)setEnableOSPersonalization:(BOOL)a3
{
  self->_enableOSPersonalization = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)skipVolumeSealing
{
  return self->_skipVolumeSealing;
}

- (void)setSkipVolumeSealing:(BOOL)a3
{
  self->_skipVolumeSealing = a3;
}

- (int)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int)a3
{
  self->_qualityOfService = a3;
}

- (NSDictionary)updateMetricEventFields
{
  return self->_updateMetricEventFields;
}

- (void)setUpdateMetricEventFields:(id)a3
{
}

- (NSString)updateMetricContext
{
  return self->_updateMetricContext;
}

- (void)setUpdateMetricContext:(id)a3
{
}

- (NSDictionary)defaultDescriptorValues
{
  return self->_defaultDescriptorValues;
}

- (void)setDefaultDescriptorValues:(id)a3
{
}

- (NSArray)policyExtensions
{
  return self->_policyExtensions;
}

- (void)setPolicyExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end